; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25776 () Bool)

(assert start!25776)

(declare-fun b!267229 () Bool)

(declare-fun e!172772 () Bool)

(declare-fun e!172770 () Bool)

(assert (=> b!267229 (= e!172772 e!172770)))

(declare-fun res!131528 () Bool)

(assert (=> b!267229 (=> (not res!131528) (not e!172770))))

(declare-datatypes ((SeekEntryResult!1323 0))(
  ( (MissingZero!1323 (index!7462 (_ BitVec 32))) (Found!1323 (index!7463 (_ BitVec 32))) (Intermediate!1323 (undefined!2135 Bool) (index!7464 (_ BitVec 32)) (x!25752 (_ BitVec 32))) (Undefined!1323) (MissingVacant!1323 (index!7465 (_ BitVec 32))) )
))
(declare-fun lt!134664 () SeekEntryResult!1323)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267229 (= res!131528 (or (= lt!134664 (MissingZero!1323 i!1355)) (= lt!134664 (MissingVacant!1323 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12955 0))(
  ( (array!12956 (arr!6132 (Array (_ BitVec 32) (_ BitVec 64))) (size!6484 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12955)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12955 (_ BitVec 32)) SeekEntryResult!1323)

(assert (=> b!267229 (= lt!134664 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267230 () Bool)

(declare-fun res!131526 () Bool)

(assert (=> b!267230 (=> (not res!131526) (not e!172770))))

(assert (=> b!267230 (= res!131526 (bvslt #b00000000000000000000000000000000 (size!6484 a!3436)))))

(declare-fun res!131531 () Bool)

(assert (=> start!25776 (=> (not res!131531) (not e!172772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25776 (= res!131531 (validMask!0 mask!4002))))

(assert (=> start!25776 e!172772))

(assert (=> start!25776 true))

(declare-fun array_inv!4095 (array!12955) Bool)

(assert (=> start!25776 (array_inv!4095 a!3436)))

(declare-fun b!267231 () Bool)

(declare-fun res!131527 () Bool)

(assert (=> b!267231 (=> (not res!131527) (not e!172772))))

(declare-fun arrayContainsKey!0 (array!12955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267231 (= res!131527 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267232 () Bool)

(declare-fun res!131529 () Bool)

(assert (=> b!267232 (=> (not res!131529) (not e!172770))))

(declare-datatypes ((List!3946 0))(
  ( (Nil!3943) (Cons!3942 (h!4609 (_ BitVec 64)) (t!9028 List!3946)) )
))
(declare-fun arrayNoDuplicates!0 (array!12955 (_ BitVec 32) List!3946) Bool)

(assert (=> b!267232 (= res!131529 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3943))))

(declare-fun b!267233 () Bool)

(declare-fun res!131525 () Bool)

(assert (=> b!267233 (=> (not res!131525) (not e!172772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267233 (= res!131525 (validKeyInArray!0 k0!2698))))

(declare-fun b!267234 () Bool)

(assert (=> b!267234 (= e!172770 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12955 (_ BitVec 32)) Bool)

(assert (=> b!267234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12956 (store (arr!6132 a!3436) i!1355 k0!2698) (size!6484 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8295 0))(
  ( (Unit!8296) )
))
(declare-fun lt!134665 () Unit!8295)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12955 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8295)

(assert (=> b!267234 (= lt!134665 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!267235 () Bool)

(declare-fun res!131530 () Bool)

(assert (=> b!267235 (=> (not res!131530) (not e!172772))))

(assert (=> b!267235 (= res!131530 (and (= (size!6484 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6484 a!3436))))))

(declare-fun b!267236 () Bool)

(declare-fun res!131532 () Bool)

(assert (=> b!267236 (=> (not res!131532) (not e!172770))))

(assert (=> b!267236 (= res!131532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25776 res!131531) b!267235))

(assert (= (and b!267235 res!131530) b!267233))

(assert (= (and b!267233 res!131525) b!267231))

(assert (= (and b!267231 res!131527) b!267229))

(assert (= (and b!267229 res!131528) b!267236))

(assert (= (and b!267236 res!131532) b!267232))

(assert (= (and b!267232 res!131529) b!267230))

(assert (= (and b!267230 res!131526) b!267234))

(declare-fun m!283643 () Bool)

(assert (=> b!267233 m!283643))

(declare-fun m!283645 () Bool)

(assert (=> b!267236 m!283645))

(declare-fun m!283647 () Bool)

(assert (=> b!267229 m!283647))

(declare-fun m!283649 () Bool)

(assert (=> b!267234 m!283649))

(declare-fun m!283651 () Bool)

(assert (=> b!267234 m!283651))

(declare-fun m!283653 () Bool)

(assert (=> b!267234 m!283653))

(declare-fun m!283655 () Bool)

(assert (=> b!267231 m!283655))

(declare-fun m!283657 () Bool)

(assert (=> b!267232 m!283657))

(declare-fun m!283659 () Bool)

(assert (=> start!25776 m!283659))

(declare-fun m!283661 () Bool)

(assert (=> start!25776 m!283661))

(check-sat (not b!267236) (not b!267229) (not b!267232) (not b!267233) (not b!267231) (not start!25776) (not b!267234))
(check-sat)
