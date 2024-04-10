; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27282 () Bool)

(assert start!27282)

(declare-fun b!282633 () Bool)

(declare-fun e!179399 () Bool)

(assert (=> b!282633 (= e!179399 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14100 0))(
  ( (array!14101 (arr!6692 (Array (_ BitVec 32) (_ BitVec 64))) (size!7044 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14100)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14100 (_ BitVec 32)) Bool)

(assert (=> b!282633 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8984 0))(
  ( (Unit!8985) )
))
(declare-fun lt!139653 () Unit!8984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8984)

(assert (=> b!282633 (= lt!139653 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!139657 () array!14100)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1850 0))(
  ( (MissingZero!1850 (index!9570 (_ BitVec 32))) (Found!1850 (index!9571 (_ BitVec 32))) (Intermediate!1850 (undefined!2662 Bool) (index!9572 (_ BitVec 32)) (x!27784 (_ BitVec 32))) (Undefined!1850) (MissingVacant!1850 (index!9573 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14100 (_ BitVec 32)) SeekEntryResult!1850)

(assert (=> b!282633 (= (seekEntryOrOpen!0 (select (arr!6692 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6692 a!3325) i!1267 k!2581) startIndex!26) lt!139657 mask!3868))))

(declare-fun lt!139655 () Unit!8984)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14100 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8984)

(assert (=> b!282633 (= lt!139655 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4500 0))(
  ( (Nil!4497) (Cons!4496 (h!5166 (_ BitVec 64)) (t!9582 List!4500)) )
))
(declare-fun arrayNoDuplicates!0 (array!14100 (_ BitVec 32) List!4500) Bool)

(assert (=> b!282633 (arrayNoDuplicates!0 lt!139657 #b00000000000000000000000000000000 Nil!4497)))

(declare-fun lt!139656 () Unit!8984)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14100 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4500) Unit!8984)

(assert (=> b!282633 (= lt!139656 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4497))))

(declare-fun b!282634 () Bool)

(declare-fun res!145707 () Bool)

(declare-fun e!179400 () Bool)

(assert (=> b!282634 (=> (not res!145707) (not e!179400))))

(assert (=> b!282634 (= res!145707 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4497))))

(declare-fun b!282635 () Bool)

(declare-fun res!145706 () Bool)

(assert (=> b!282635 (=> (not res!145706) (not e!179400))))

(declare-fun arrayContainsKey!0 (array!14100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282635 (= res!145706 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282636 () Bool)

(declare-fun res!145705 () Bool)

(declare-fun e!179401 () Bool)

(assert (=> b!282636 (=> (not res!145705) (not e!179401))))

(assert (=> b!282636 (= res!145705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282637 () Bool)

(declare-fun res!145703 () Bool)

(assert (=> b!282637 (=> (not res!145703) (not e!179400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282637 (= res!145703 (validKeyInArray!0 k!2581))))

(declare-fun b!282638 () Bool)

(declare-fun res!145704 () Bool)

(assert (=> b!282638 (=> (not res!145704) (not e!179399))))

(assert (=> b!282638 (= res!145704 (validKeyInArray!0 (select (arr!6692 a!3325) startIndex!26)))))

(declare-fun b!282639 () Bool)

(declare-fun res!145702 () Bool)

(assert (=> b!282639 (=> (not res!145702) (not e!179400))))

(assert (=> b!282639 (= res!145702 (and (= (size!7044 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7044 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7044 a!3325))))))

(declare-fun res!145710 () Bool)

(assert (=> start!27282 (=> (not res!145710) (not e!179400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27282 (= res!145710 (validMask!0 mask!3868))))

(assert (=> start!27282 e!179400))

(declare-fun array_inv!4655 (array!14100) Bool)

(assert (=> start!27282 (array_inv!4655 a!3325)))

(assert (=> start!27282 true))

(declare-fun b!282640 () Bool)

(assert (=> b!282640 (= e!179401 e!179399)))

(declare-fun res!145709 () Bool)

(assert (=> b!282640 (=> (not res!145709) (not e!179399))))

(assert (=> b!282640 (= res!145709 (not (= startIndex!26 i!1267)))))

(assert (=> b!282640 (= lt!139657 (array!14101 (store (arr!6692 a!3325) i!1267 k!2581) (size!7044 a!3325)))))

(declare-fun b!282641 () Bool)

(assert (=> b!282641 (= e!179400 e!179401)))

(declare-fun res!145708 () Bool)

(assert (=> b!282641 (=> (not res!145708) (not e!179401))))

(declare-fun lt!139654 () SeekEntryResult!1850)

(assert (=> b!282641 (= res!145708 (or (= lt!139654 (MissingZero!1850 i!1267)) (= lt!139654 (MissingVacant!1850 i!1267))))))

(assert (=> b!282641 (= lt!139654 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27282 res!145710) b!282639))

(assert (= (and b!282639 res!145702) b!282637))

(assert (= (and b!282637 res!145703) b!282634))

(assert (= (and b!282634 res!145707) b!282635))

(assert (= (and b!282635 res!145706) b!282641))

(assert (= (and b!282641 res!145708) b!282636))

(assert (= (and b!282636 res!145705) b!282640))

(assert (= (and b!282640 res!145709) b!282638))

(assert (= (and b!282638 res!145704) b!282633))

(declare-fun m!297267 () Bool)

(assert (=> b!282637 m!297267))

(declare-fun m!297269 () Bool)

(assert (=> b!282633 m!297269))

(declare-fun m!297271 () Bool)

(assert (=> b!282633 m!297271))

(declare-fun m!297273 () Bool)

(assert (=> b!282633 m!297273))

(declare-fun m!297275 () Bool)

(assert (=> b!282633 m!297275))

(assert (=> b!282633 m!297273))

(declare-fun m!297277 () Bool)

(assert (=> b!282633 m!297277))

(declare-fun m!297279 () Bool)

(assert (=> b!282633 m!297279))

(declare-fun m!297281 () Bool)

(assert (=> b!282633 m!297281))

(declare-fun m!297283 () Bool)

(assert (=> b!282633 m!297283))

(declare-fun m!297285 () Bool)

(assert (=> b!282633 m!297285))

(assert (=> b!282633 m!297281))

(declare-fun m!297287 () Bool)

(assert (=> b!282633 m!297287))

(assert (=> b!282640 m!297277))

(declare-fun m!297289 () Bool)

(assert (=> start!27282 m!297289))

(declare-fun m!297291 () Bool)

(assert (=> start!27282 m!297291))

(declare-fun m!297293 () Bool)

(assert (=> b!282634 m!297293))

(declare-fun m!297295 () Bool)

(assert (=> b!282636 m!297295))

(assert (=> b!282638 m!297281))

(assert (=> b!282638 m!297281))

(declare-fun m!297297 () Bool)

(assert (=> b!282638 m!297297))

(declare-fun m!297299 () Bool)

(assert (=> b!282641 m!297299))

(declare-fun m!297301 () Bool)

(assert (=> b!282635 m!297301))

(push 1)

