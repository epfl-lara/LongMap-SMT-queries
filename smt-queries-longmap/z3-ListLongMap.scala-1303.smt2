; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26376 () Bool)

(assert start!26376)

(declare-fun b!273542 () Bool)

(declare-fun res!137513 () Bool)

(declare-fun e!175305 () Bool)

(assert (=> b!273542 (=> (not res!137513) (not e!175305))))

(declare-datatypes ((array!13472 0))(
  ( (array!13473 (arr!6385 (Array (_ BitVec 32) (_ BitVec 64))) (size!6737 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13472)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273542 (= res!137513 (and (= (size!6737 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6737 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6737 a!3325))))))

(declare-fun b!273543 () Bool)

(declare-fun res!137509 () Bool)

(assert (=> b!273543 (=> (not res!137509) (not e!175305))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273543 (= res!137509 (validKeyInArray!0 k0!2581))))

(declare-fun b!273544 () Bool)

(declare-fun res!137506 () Bool)

(declare-fun e!175306 () Bool)

(assert (=> b!273544 (=> (not res!137506) (not e!175306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13472 (_ BitVec 32)) Bool)

(assert (=> b!273544 (= res!137506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273546 () Bool)

(declare-fun res!137514 () Bool)

(assert (=> b!273546 (=> (not res!137514) (not e!175305))))

(declare-fun arrayContainsKey!0 (array!13472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273546 (= res!137514 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273547 () Bool)

(assert (=> b!273547 (= e!175305 e!175306)))

(declare-fun res!137511 () Bool)

(assert (=> b!273547 (=> (not res!137511) (not e!175306))))

(declare-datatypes ((SeekEntryResult!1508 0))(
  ( (MissingZero!1508 (index!8202 (_ BitVec 32))) (Found!1508 (index!8203 (_ BitVec 32))) (Intermediate!1508 (undefined!2320 Bool) (index!8204 (_ BitVec 32)) (x!26617 (_ BitVec 32))) (Undefined!1508) (MissingVacant!1508 (index!8205 (_ BitVec 32))) )
))
(declare-fun lt!136473 () SeekEntryResult!1508)

(assert (=> b!273547 (= res!137511 (or (= lt!136473 (MissingZero!1508 i!1267)) (= lt!136473 (MissingVacant!1508 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13472 (_ BitVec 32)) SeekEntryResult!1508)

(assert (=> b!273547 (= lt!136473 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273548 () Bool)

(declare-fun e!175304 () Bool)

(assert (=> b!273548 (= e!175306 e!175304)))

(declare-fun res!137507 () Bool)

(assert (=> b!273548 (=> (not res!137507) (not e!175304))))

(assert (=> b!273548 (= res!137507 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136472 () array!13472)

(assert (=> b!273548 (= lt!136472 (array!13473 (store (arr!6385 a!3325) i!1267 k0!2581) (size!6737 a!3325)))))

(declare-fun b!273549 () Bool)

(assert (=> b!273549 (= e!175304 (not true))))

(assert (=> b!273549 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8555 0))(
  ( (Unit!8556) )
))
(declare-fun lt!136476 () Unit!8555)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8555)

(assert (=> b!273549 (= lt!136476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273549 (= (seekEntryOrOpen!0 (select (arr!6385 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6385 a!3325) i!1267 k0!2581) startIndex!26) lt!136472 mask!3868))))

(declare-fun lt!136475 () Unit!8555)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13472 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8555)

(assert (=> b!273549 (= lt!136475 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4106 0))(
  ( (Nil!4103) (Cons!4102 (h!4769 (_ BitVec 64)) (t!9180 List!4106)) )
))
(declare-fun arrayNoDuplicates!0 (array!13472 (_ BitVec 32) List!4106) Bool)

(assert (=> b!273549 (arrayNoDuplicates!0 lt!136472 #b00000000000000000000000000000000 Nil!4103)))

(declare-fun lt!136474 () Unit!8555)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13472 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4106) Unit!8555)

(assert (=> b!273549 (= lt!136474 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4103))))

(declare-fun b!273550 () Bool)

(declare-fun res!137510 () Bool)

(assert (=> b!273550 (=> (not res!137510) (not e!175305))))

(assert (=> b!273550 (= res!137510 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4103))))

(declare-fun b!273545 () Bool)

(declare-fun res!137508 () Bool)

(assert (=> b!273545 (=> (not res!137508) (not e!175304))))

(assert (=> b!273545 (= res!137508 (validKeyInArray!0 (select (arr!6385 a!3325) startIndex!26)))))

(declare-fun res!137512 () Bool)

(assert (=> start!26376 (=> (not res!137512) (not e!175305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26376 (= res!137512 (validMask!0 mask!3868))))

(assert (=> start!26376 e!175305))

(declare-fun array_inv!4335 (array!13472) Bool)

(assert (=> start!26376 (array_inv!4335 a!3325)))

(assert (=> start!26376 true))

(assert (= (and start!26376 res!137512) b!273542))

(assert (= (and b!273542 res!137513) b!273543))

(assert (= (and b!273543 res!137509) b!273550))

(assert (= (and b!273550 res!137510) b!273546))

(assert (= (and b!273546 res!137514) b!273547))

(assert (= (and b!273547 res!137511) b!273544))

(assert (= (and b!273544 res!137506) b!273548))

(assert (= (and b!273548 res!137507) b!273545))

(assert (= (and b!273545 res!137508) b!273549))

(declare-fun m!288911 () Bool)

(assert (=> start!26376 m!288911))

(declare-fun m!288913 () Bool)

(assert (=> start!26376 m!288913))

(declare-fun m!288915 () Bool)

(assert (=> b!273547 m!288915))

(declare-fun m!288917 () Bool)

(assert (=> b!273550 m!288917))

(declare-fun m!288919 () Bool)

(assert (=> b!273549 m!288919))

(declare-fun m!288921 () Bool)

(assert (=> b!273549 m!288921))

(declare-fun m!288923 () Bool)

(assert (=> b!273549 m!288923))

(declare-fun m!288925 () Bool)

(assert (=> b!273549 m!288925))

(assert (=> b!273549 m!288923))

(declare-fun m!288927 () Bool)

(assert (=> b!273549 m!288927))

(declare-fun m!288929 () Bool)

(assert (=> b!273549 m!288929))

(declare-fun m!288931 () Bool)

(assert (=> b!273549 m!288931))

(declare-fun m!288933 () Bool)

(assert (=> b!273549 m!288933))

(declare-fun m!288935 () Bool)

(assert (=> b!273549 m!288935))

(assert (=> b!273549 m!288931))

(declare-fun m!288937 () Bool)

(assert (=> b!273549 m!288937))

(declare-fun m!288939 () Bool)

(assert (=> b!273546 m!288939))

(assert (=> b!273548 m!288927))

(declare-fun m!288941 () Bool)

(assert (=> b!273544 m!288941))

(assert (=> b!273545 m!288931))

(assert (=> b!273545 m!288931))

(declare-fun m!288943 () Bool)

(assert (=> b!273545 m!288943))

(declare-fun m!288945 () Bool)

(assert (=> b!273543 m!288945))

(check-sat (not b!273544) (not b!273549) (not start!26376) (not b!273543) (not b!273547) (not b!273550) (not b!273546) (not b!273545))
(check-sat)
