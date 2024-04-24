; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85904 () Bool)

(assert start!85904)

(declare-fun b!995688 () Bool)

(declare-fun res!665629 () Bool)

(declare-fun e!561950 () Bool)

(assert (=> b!995688 (=> (not res!665629) (not e!561950))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995688 (= res!665629 (validKeyInArray!0 k!2224))))

(declare-fun b!995689 () Bool)

(declare-fun res!665631 () Bool)

(assert (=> b!995689 (=> (not res!665631) (not e!561950))))

(declare-datatypes ((array!62980 0))(
  ( (array!62981 (arr!30324 (Array (_ BitVec 32) (_ BitVec 64))) (size!30827 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62980)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!995689 (= res!665631 (validKeyInArray!0 (select (arr!30324 a!3219) j!170)))))

(declare-fun res!665633 () Bool)

(assert (=> start!85904 (=> (not res!665633) (not e!561950))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85904 (= res!665633 (validMask!0 mask!3464))))

(assert (=> start!85904 e!561950))

(declare-fun array_inv!23460 (array!62980) Bool)

(assert (=> start!85904 (array_inv!23460 a!3219)))

(assert (=> start!85904 true))

(declare-fun b!995690 () Bool)

(declare-fun res!665630 () Bool)

(assert (=> b!995690 (=> (not res!665630) (not e!561950))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995690 (= res!665630 (and (= (size!30827 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30827 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30827 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995691 () Bool)

(declare-fun res!665632 () Bool)

(assert (=> b!995691 (=> (not res!665632) (not e!561950))))

(declare-fun arrayContainsKey!0 (array!62980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995691 (= res!665632 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995692 () Bool)

(assert (=> b!995692 (= e!561950 false)))

(declare-datatypes ((SeekEntryResult!9192 0))(
  ( (MissingZero!9192 (index!39139 (_ BitVec 32))) (Found!9192 (index!39140 (_ BitVec 32))) (Intermediate!9192 (undefined!10004 Bool) (index!39141 (_ BitVec 32)) (x!86735 (_ BitVec 32))) (Undefined!9192) (MissingVacant!9192 (index!39142 (_ BitVec 32))) )
))
(declare-fun lt!441125 () SeekEntryResult!9192)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62980 (_ BitVec 32)) SeekEntryResult!9192)

(assert (=> b!995692 (= lt!441125 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!85904 res!665633) b!995690))

(assert (= (and b!995690 res!665630) b!995689))

(assert (= (and b!995689 res!665631) b!995688))

(assert (= (and b!995688 res!665629) b!995691))

(assert (= (and b!995691 res!665632) b!995692))

(declare-fun m!923643 () Bool)

(assert (=> b!995689 m!923643))

(assert (=> b!995689 m!923643))

(declare-fun m!923645 () Bool)

(assert (=> b!995689 m!923645))

(declare-fun m!923647 () Bool)

(assert (=> start!85904 m!923647))

(declare-fun m!923649 () Bool)

(assert (=> start!85904 m!923649))

(declare-fun m!923651 () Bool)

(assert (=> b!995692 m!923651))

(declare-fun m!923653 () Bool)

(assert (=> b!995688 m!923653))

(declare-fun m!923655 () Bool)

(assert (=> b!995691 m!923655))

(push 1)

(assert (not b!995688))

(assert (not start!85904))

(assert (not b!995689))

(assert (not b!995692))

(assert (not b!995691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

