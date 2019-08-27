# frozen_string_literal: true

class Api::PeopleController < ApplicationController
  # before_action :set_people
  def index
    @people = Person.all
   end

  def show
    @people = Person.find(params[:id])
   end

  def new; end
    end
