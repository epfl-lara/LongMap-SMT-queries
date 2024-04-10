; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27870 () Bool)

(assert start!27870)

(declare-fun b!286611 () Bool)

(declare-fun res!148695 () Bool)

(declare-fun e!181590 () Bool)

(assert (=> b!286611 (=> (not res!148695) (not e!181590))))

(declare-datatypes ((array!14358 0))(
  ( (array!14359 (arr!6812 (Array (_ BitVec 32) (_ BitVec 64))) (size!7164 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14358)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286611 (= res!148695 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286612 () Bool)

(declare-fun res!148691 () Bool)

(assert (=> b!286612 (=> (not res!148691) (not e!181590))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286612 (= res!148691 (and (= (size!7164 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7164 a!3312))))))

(declare-fun b!286613 () Bool)

(declare-fun e!181591 () Bool)

(assert (=> b!286613 (= e!181590 e!181591)))

(declare-fun res!148692 () Bool)

(assert (=> b!286613 (=> (not res!148692) (not e!181591))))

(declare-datatypes ((SeekEntryResult!1961 0))(
  ( (MissingZero!1961 (index!10014 (_ BitVec 32))) (Found!1961 (index!10015 (_ BitVec 32))) (Intermediate!1961 (undefined!2773 Bool) (index!10016 (_ BitVec 32)) (x!28233 (_ BitVec 32))) (Undefined!1961) (MissingVacant!1961 (index!10017 (_ BitVec 32))) )
))
(declare-fun lt!141163 () SeekEntryResult!1961)

(assert (=> b!286613 (= res!148692 (or (= lt!141163 (MissingZero!1961 i!1256)) (= lt!141163 (MissingVacant!1961 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14358 (_ BitVec 32)) SeekEntryResult!1961)

(assert (=> b!286613 (= lt!141163 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286614 () Bool)

(declare-fun res!148693 () Bool)

(assert (=> b!286614 (=> (not res!148693) (not e!181590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286614 (= res!148693 (validKeyInArray!0 k!2524))))

(declare-fun b!286615 () Bool)

(assert (=> b!286615 (= e!181591 false)))

(declare-fun lt!141162 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286615 (= lt!141162 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!148690 () Bool)

(assert (=> start!27870 (=> (not res!148690) (not e!181590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27870 (= res!148690 (validMask!0 mask!3809))))

(assert (=> start!27870 e!181590))

(assert (=> start!27870 true))

(declare-fun array_inv!4775 (array!14358) Bool)

(assert (=> start!27870 (array_inv!4775 a!3312)))

(declare-fun b!286616 () Bool)

(declare-fun res!148694 () Bool)

(assert (=> b!286616 (=> (not res!148694) (not e!181591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14358 (_ BitVec 32)) Bool)

(assert (=> b!286616 (= res!148694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!27870 res!148690) b!286612))

(assert (= (and b!286612 res!148691) b!286614))

(assert (= (and b!286614 res!148693) b!286611))

(assert (= (and b!286611 res!148695) b!286613))

(assert (= (and b!286613 res!148692) b!286616))

(assert (= (and b!286616 res!148694) b!286615))

(declare-fun m!301245 () Bool)

(assert (=> b!286616 m!301245))

(declare-fun m!301247 () Bool)

(assert (=> b!286611 m!301247))

(declare-fun m!301249 () Bool)

(assert (=> b!286613 m!301249))

(declare-fun m!301251 () Bool)

(assert (=> start!27870 m!301251))

(declare-fun m!301253 () Bool)

(assert (=> start!27870 m!301253))

(declare-fun m!301255 () Bool)

(assert (=> b!286614 m!301255))

(declare-fun m!301257 () Bool)

(assert (=> b!286615 m!301257))

(push 1)

