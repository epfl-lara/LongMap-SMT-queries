; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25784 () Bool)

(assert start!25784)

(declare-fun b!267324 () Bool)

(declare-fun e!172814 () Bool)

(assert (=> b!267324 (= e!172814 (not true))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12958 0))(
  ( (array!12959 (arr!6133 (Array (_ BitVec 32) (_ BitVec 64))) (size!6485 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12958)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12958 (_ BitVec 32)) Bool)

(assert (=> b!267324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12959 (store (arr!6133 a!3436) i!1355 k0!2698) (size!6485 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8279 0))(
  ( (Unit!8280) )
))
(declare-fun lt!134736 () Unit!8279)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12958 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8279)

(assert (=> b!267324 (= lt!134736 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!267325 () Bool)

(declare-fun res!131600 () Bool)

(declare-fun e!172812 () Bool)

(assert (=> b!267325 (=> (not res!131600) (not e!172812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267325 (= res!131600 (validKeyInArray!0 k0!2698))))

(declare-fun b!267326 () Bool)

(declare-fun res!131596 () Bool)

(assert (=> b!267326 (=> (not res!131596) (not e!172814))))

(assert (=> b!267326 (= res!131596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267327 () Bool)

(assert (=> b!267327 (= e!172812 e!172814)))

(declare-fun res!131598 () Bool)

(assert (=> b!267327 (=> (not res!131598) (not e!172814))))

(declare-datatypes ((SeekEntryResult!1289 0))(
  ( (MissingZero!1289 (index!7326 (_ BitVec 32))) (Found!1289 (index!7327 (_ BitVec 32))) (Intermediate!1289 (undefined!2101 Bool) (index!7328 (_ BitVec 32)) (x!25726 (_ BitVec 32))) (Undefined!1289) (MissingVacant!1289 (index!7329 (_ BitVec 32))) )
))
(declare-fun lt!134735 () SeekEntryResult!1289)

(assert (=> b!267327 (= res!131598 (or (= lt!134735 (MissingZero!1289 i!1355)) (= lt!134735 (MissingVacant!1289 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12958 (_ BitVec 32)) SeekEntryResult!1289)

(assert (=> b!267327 (= lt!134735 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267328 () Bool)

(declare-fun res!131599 () Bool)

(assert (=> b!267328 (=> (not res!131599) (not e!172814))))

(declare-datatypes ((List!3860 0))(
  ( (Nil!3857) (Cons!3856 (h!4523 (_ BitVec 64)) (t!8934 List!3860)) )
))
(declare-fun arrayNoDuplicates!0 (array!12958 (_ BitVec 32) List!3860) Bool)

(assert (=> b!267328 (= res!131599 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3857))))

(declare-fun b!267329 () Bool)

(declare-fun res!131594 () Bool)

(assert (=> b!267329 (=> (not res!131594) (not e!172812))))

(assert (=> b!267329 (= res!131594 (and (= (size!6485 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6485 a!3436))))))

(declare-fun b!267330 () Bool)

(declare-fun res!131597 () Bool)

(assert (=> b!267330 (=> (not res!131597) (not e!172812))))

(declare-fun arrayContainsKey!0 (array!12958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267330 (= res!131597 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267331 () Bool)

(declare-fun res!131601 () Bool)

(assert (=> b!267331 (=> (not res!131601) (not e!172814))))

(assert (=> b!267331 (= res!131601 (bvslt #b00000000000000000000000000000000 (size!6485 a!3436)))))

(declare-fun res!131595 () Bool)

(assert (=> start!25784 (=> (not res!131595) (not e!172812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25784 (= res!131595 (validMask!0 mask!4002))))

(assert (=> start!25784 e!172812))

(assert (=> start!25784 true))

(declare-fun array_inv!4083 (array!12958) Bool)

(assert (=> start!25784 (array_inv!4083 a!3436)))

(assert (= (and start!25784 res!131595) b!267329))

(assert (= (and b!267329 res!131594) b!267325))

(assert (= (and b!267325 res!131600) b!267330))

(assert (= (and b!267330 res!131597) b!267327))

(assert (= (and b!267327 res!131598) b!267326))

(assert (= (and b!267326 res!131596) b!267328))

(assert (= (and b!267328 res!131599) b!267331))

(assert (= (and b!267331 res!131601) b!267324))

(declare-fun m!283889 () Bool)

(assert (=> b!267328 m!283889))

(declare-fun m!283891 () Bool)

(assert (=> b!267327 m!283891))

(declare-fun m!283893 () Bool)

(assert (=> b!267330 m!283893))

(declare-fun m!283895 () Bool)

(assert (=> start!25784 m!283895))

(declare-fun m!283897 () Bool)

(assert (=> start!25784 m!283897))

(declare-fun m!283899 () Bool)

(assert (=> b!267324 m!283899))

(declare-fun m!283901 () Bool)

(assert (=> b!267324 m!283901))

(declare-fun m!283903 () Bool)

(assert (=> b!267324 m!283903))

(declare-fun m!283905 () Bool)

(assert (=> b!267325 m!283905))

(declare-fun m!283907 () Bool)

(assert (=> b!267326 m!283907))

(check-sat (not b!267325) (not b!267330) (not start!25784) (not b!267324) (not b!267326) (not b!267328) (not b!267327))
(check-sat)
