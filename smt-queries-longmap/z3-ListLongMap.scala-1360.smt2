; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26718 () Bool)

(assert start!26718)

(declare-fun b!277495 () Bool)

(declare-datatypes ((Unit!8726 0))(
  ( (Unit!8727) )
))
(declare-fun e!177080 () Unit!8726)

(declare-fun lt!138000 () Unit!8726)

(assert (=> b!277495 (= e!177080 lt!138000)))

(declare-datatypes ((array!13814 0))(
  ( (array!13815 (arr!6556 (Array (_ BitVec 32) (_ BitVec 64))) (size!6908 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13814)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13814 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8726)

(assert (=> b!277495 (= lt!138000 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13814 (_ BitVec 32)) Bool)

(assert (=> b!277495 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13815 (store (arr!6556 a!3325) i!1267 k0!2581) (size!6908 a!3325)) mask!3868)))

(declare-fun b!277496 () Bool)

(declare-fun res!141372 () Bool)

(declare-fun e!177079 () Bool)

(assert (=> b!277496 (=> (not res!141372) (not e!177079))))

(assert (=> b!277496 (= res!141372 (and (= (size!6908 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6908 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6908 a!3325))))))

(declare-fun b!277497 () Bool)

(declare-fun res!141368 () Bool)

(declare-fun e!177077 () Bool)

(assert (=> b!277497 (=> (not res!141368) (not e!177077))))

(assert (=> b!277497 (= res!141368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277498 () Bool)

(assert (=> b!277498 (= e!177077 false)))

(declare-fun lt!137998 () Unit!8726)

(assert (=> b!277498 (= lt!137998 e!177080)))

(declare-fun c!45616 () Bool)

(assert (=> b!277498 (= c!45616 (bvslt startIndex!26 (bvsub (size!6908 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277499 () Bool)

(declare-fun res!141370 () Bool)

(assert (=> b!277499 (=> (not res!141370) (not e!177079))))

(declare-datatypes ((List!4277 0))(
  ( (Nil!4274) (Cons!4273 (h!4940 (_ BitVec 64)) (t!9351 List!4277)) )
))
(declare-fun arrayNoDuplicates!0 (array!13814 (_ BitVec 32) List!4277) Bool)

(assert (=> b!277499 (= res!141370 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4274))))

(declare-fun b!277500 () Bool)

(assert (=> b!277500 (= e!177079 e!177077)))

(declare-fun res!141365 () Bool)

(assert (=> b!277500 (=> (not res!141365) (not e!177077))))

(declare-datatypes ((SeekEntryResult!1679 0))(
  ( (MissingZero!1679 (index!8886 (_ BitVec 32))) (Found!1679 (index!8887 (_ BitVec 32))) (Intermediate!1679 (undefined!2491 Bool) (index!8888 (_ BitVec 32)) (x!27244 (_ BitVec 32))) (Undefined!1679) (MissingVacant!1679 (index!8889 (_ BitVec 32))) )
))
(declare-fun lt!137999 () SeekEntryResult!1679)

(assert (=> b!277500 (= res!141365 (or (= lt!137999 (MissingZero!1679 i!1267)) (= lt!137999 (MissingVacant!1679 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13814 (_ BitVec 32)) SeekEntryResult!1679)

(assert (=> b!277500 (= lt!137999 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277501 () Bool)

(declare-fun res!141366 () Bool)

(assert (=> b!277501 (=> (not res!141366) (not e!177079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277501 (= res!141366 (validKeyInArray!0 k0!2581))))

(declare-fun res!141367 () Bool)

(assert (=> start!26718 (=> (not res!141367) (not e!177079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26718 (= res!141367 (validMask!0 mask!3868))))

(assert (=> start!26718 e!177079))

(declare-fun array_inv!4506 (array!13814) Bool)

(assert (=> start!26718 (array_inv!4506 a!3325)))

(assert (=> start!26718 true))

(declare-fun b!277502 () Bool)

(declare-fun Unit!8728 () Unit!8726)

(assert (=> b!277502 (= e!177080 Unit!8728)))

(declare-fun b!277503 () Bool)

(declare-fun res!141371 () Bool)

(assert (=> b!277503 (=> (not res!141371) (not e!177077))))

(assert (=> b!277503 (= res!141371 (= startIndex!26 i!1267))))

(declare-fun b!277504 () Bool)

(declare-fun res!141369 () Bool)

(assert (=> b!277504 (=> (not res!141369) (not e!177079))))

(declare-fun arrayContainsKey!0 (array!13814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277504 (= res!141369 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26718 res!141367) b!277496))

(assert (= (and b!277496 res!141372) b!277501))

(assert (= (and b!277501 res!141366) b!277499))

(assert (= (and b!277499 res!141370) b!277504))

(assert (= (and b!277504 res!141369) b!277500))

(assert (= (and b!277500 res!141365) b!277497))

(assert (= (and b!277497 res!141368) b!277503))

(assert (= (and b!277503 res!141371) b!277498))

(assert (= (and b!277498 c!45616) b!277495))

(assert (= (and b!277498 (not c!45616)) b!277502))

(declare-fun m!292697 () Bool)

(assert (=> b!277500 m!292697))

(declare-fun m!292699 () Bool)

(assert (=> b!277497 m!292699))

(declare-fun m!292701 () Bool)

(assert (=> b!277504 m!292701))

(declare-fun m!292703 () Bool)

(assert (=> b!277495 m!292703))

(declare-fun m!292705 () Bool)

(assert (=> b!277495 m!292705))

(declare-fun m!292707 () Bool)

(assert (=> b!277495 m!292707))

(declare-fun m!292709 () Bool)

(assert (=> b!277501 m!292709))

(declare-fun m!292711 () Bool)

(assert (=> b!277499 m!292711))

(declare-fun m!292713 () Bool)

(assert (=> start!26718 m!292713))

(declare-fun m!292715 () Bool)

(assert (=> start!26718 m!292715))

(check-sat (not b!277497) (not b!277501) (not b!277500) (not b!277499) (not start!26718) (not b!277504) (not b!277495))
(check-sat)
