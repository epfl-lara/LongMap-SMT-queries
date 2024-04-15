; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44292 () Bool)

(assert start!44292)

(declare-fun b!486945 () Bool)

(declare-fun res!290474 () Bool)

(declare-fun e!286520 () Bool)

(assert (=> b!486945 (=> (not res!290474) (not e!286520))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31553 0))(
  ( (array!31554 (arr!15170 (Array (_ BitVec 32) (_ BitVec 64))) (size!15535 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31553)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486945 (= res!290474 (and (= (size!15535 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15535 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15535 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486946 () Bool)

(declare-fun e!286521 () Bool)

(assert (=> b!486946 (= e!286521 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31553 (_ BitVec 32)) Bool)

(assert (=> b!486946 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14200 0))(
  ( (Unit!14201) )
))
(declare-fun lt!219735 () Unit!14200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14200)

(assert (=> b!486946 (= lt!219735 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!486947 () Bool)

(declare-fun res!290477 () Bool)

(assert (=> b!486947 (=> (not res!290477) (not e!286521))))

(declare-datatypes ((List!9367 0))(
  ( (Nil!9364) (Cons!9363 (h!10219 (_ BitVec 64)) (t!15586 List!9367)) )
))
(declare-fun arrayNoDuplicates!0 (array!31553 (_ BitVec 32) List!9367) Bool)

(assert (=> b!486947 (= res!290477 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9364))))

(declare-fun b!486949 () Bool)

(declare-fun res!290480 () Bool)

(assert (=> b!486949 (=> (not res!290480) (not e!286520))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486949 (= res!290480 (validKeyInArray!0 k0!2280))))

(declare-fun b!486950 () Bool)

(declare-fun res!290478 () Bool)

(assert (=> b!486950 (=> (not res!290478) (not e!286521))))

(assert (=> b!486950 (= res!290478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486951 () Bool)

(assert (=> b!486951 (= e!286520 e!286521)))

(declare-fun res!290479 () Bool)

(assert (=> b!486951 (=> (not res!290479) (not e!286521))))

(declare-datatypes ((SeekEntryResult!3634 0))(
  ( (MissingZero!3634 (index!16715 (_ BitVec 32))) (Found!3634 (index!16716 (_ BitVec 32))) (Intermediate!3634 (undefined!4446 Bool) (index!16717 (_ BitVec 32)) (x!45849 (_ BitVec 32))) (Undefined!3634) (MissingVacant!3634 (index!16718 (_ BitVec 32))) )
))
(declare-fun lt!219736 () SeekEntryResult!3634)

(assert (=> b!486951 (= res!290479 (or (= lt!219736 (MissingZero!3634 i!1204)) (= lt!219736 (MissingVacant!3634 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31553 (_ BitVec 32)) SeekEntryResult!3634)

(assert (=> b!486951 (= lt!219736 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486952 () Bool)

(declare-fun res!290476 () Bool)

(assert (=> b!486952 (=> (not res!290476) (not e!286520))))

(assert (=> b!486952 (= res!290476 (validKeyInArray!0 (select (arr!15170 a!3235) j!176)))))

(declare-fun b!486948 () Bool)

(declare-fun res!290475 () Bool)

(assert (=> b!486948 (=> (not res!290475) (not e!286520))))

(declare-fun arrayContainsKey!0 (array!31553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486948 (= res!290475 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290473 () Bool)

(assert (=> start!44292 (=> (not res!290473) (not e!286520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44292 (= res!290473 (validMask!0 mask!3524))))

(assert (=> start!44292 e!286520))

(assert (=> start!44292 true))

(declare-fun array_inv!11053 (array!31553) Bool)

(assert (=> start!44292 (array_inv!11053 a!3235)))

(assert (= (and start!44292 res!290473) b!486945))

(assert (= (and b!486945 res!290474) b!486952))

(assert (= (and b!486952 res!290476) b!486949))

(assert (= (and b!486949 res!290480) b!486948))

(assert (= (and b!486948 res!290475) b!486951))

(assert (= (and b!486951 res!290479) b!486950))

(assert (= (and b!486950 res!290478) b!486947))

(assert (= (and b!486947 res!290477) b!486946))

(declare-fun m!466303 () Bool)

(assert (=> start!44292 m!466303))

(declare-fun m!466305 () Bool)

(assert (=> start!44292 m!466305))

(declare-fun m!466307 () Bool)

(assert (=> b!486946 m!466307))

(declare-fun m!466309 () Bool)

(assert (=> b!486946 m!466309))

(declare-fun m!466311 () Bool)

(assert (=> b!486949 m!466311))

(declare-fun m!466313 () Bool)

(assert (=> b!486950 m!466313))

(declare-fun m!466315 () Bool)

(assert (=> b!486951 m!466315))

(declare-fun m!466317 () Bool)

(assert (=> b!486952 m!466317))

(assert (=> b!486952 m!466317))

(declare-fun m!466319 () Bool)

(assert (=> b!486952 m!466319))

(declare-fun m!466321 () Bool)

(assert (=> b!486948 m!466321))

(declare-fun m!466323 () Bool)

(assert (=> b!486947 m!466323))

(check-sat (not b!486947) (not b!486951) (not b!486949) (not b!486946) (not b!486952) (not b!486948) (not start!44292) (not b!486950))
(check-sat)
