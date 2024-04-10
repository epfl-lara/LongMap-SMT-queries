; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27276 () Bool)

(assert start!27276)

(declare-fun b!282552 () Bool)

(declare-fun res!145624 () Bool)

(declare-fun e!179363 () Bool)

(assert (=> b!282552 (=> (not res!145624) (not e!179363))))

(declare-datatypes ((array!14094 0))(
  ( (array!14095 (arr!6689 (Array (_ BitVec 32) (_ BitVec 64))) (size!7041 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14094)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14094 (_ BitVec 32)) Bool)

(assert (=> b!282552 (= res!145624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282553 () Bool)

(declare-fun e!179364 () Bool)

(assert (=> b!282553 (= e!179364 e!179363)))

(declare-fun res!145628 () Bool)

(assert (=> b!282553 (=> (not res!145628) (not e!179363))))

(declare-datatypes ((SeekEntryResult!1847 0))(
  ( (MissingZero!1847 (index!9558 (_ BitVec 32))) (Found!1847 (index!9559 (_ BitVec 32))) (Intermediate!1847 (undefined!2659 Bool) (index!9560 (_ BitVec 32)) (x!27773 (_ BitVec 32))) (Undefined!1847) (MissingVacant!1847 (index!9561 (_ BitVec 32))) )
))
(declare-fun lt!139608 () SeekEntryResult!1847)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282553 (= res!145628 (or (= lt!139608 (MissingZero!1847 i!1267)) (= lt!139608 (MissingVacant!1847 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14094 (_ BitVec 32)) SeekEntryResult!1847)

(assert (=> b!282553 (= lt!139608 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282554 () Bool)

(declare-fun res!145629 () Bool)

(assert (=> b!282554 (=> (not res!145629) (not e!179364))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282554 (= res!145629 (and (= (size!7041 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7041 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7041 a!3325))))))

(declare-fun b!282555 () Bool)

(declare-fun e!179366 () Bool)

(assert (=> b!282555 (= e!179366 (not true))))

(assert (=> b!282555 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8978 0))(
  ( (Unit!8979) )
))
(declare-fun lt!139610 () Unit!8978)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8978)

(assert (=> b!282555 (= lt!139610 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139609 () array!14094)

(assert (=> b!282555 (= (seekEntryOrOpen!0 (select (arr!6689 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6689 a!3325) i!1267 k!2581) startIndex!26) lt!139609 mask!3868))))

(declare-fun lt!139612 () Unit!8978)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14094 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8978)

(assert (=> b!282555 (= lt!139612 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4497 0))(
  ( (Nil!4494) (Cons!4493 (h!5163 (_ BitVec 64)) (t!9579 List!4497)) )
))
(declare-fun arrayNoDuplicates!0 (array!14094 (_ BitVec 32) List!4497) Bool)

(assert (=> b!282555 (arrayNoDuplicates!0 lt!139609 #b00000000000000000000000000000000 Nil!4494)))

(declare-fun lt!139611 () Unit!8978)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14094 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4497) Unit!8978)

(assert (=> b!282555 (= lt!139611 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4494))))

(declare-fun res!145622 () Bool)

(assert (=> start!27276 (=> (not res!145622) (not e!179364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27276 (= res!145622 (validMask!0 mask!3868))))

(assert (=> start!27276 e!179364))

(declare-fun array_inv!4652 (array!14094) Bool)

(assert (=> start!27276 (array_inv!4652 a!3325)))

(assert (=> start!27276 true))

(declare-fun b!282556 () Bool)

(declare-fun res!145621 () Bool)

(assert (=> b!282556 (=> (not res!145621) (not e!179364))))

(assert (=> b!282556 (= res!145621 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4494))))

(declare-fun b!282557 () Bool)

(declare-fun res!145623 () Bool)

(assert (=> b!282557 (=> (not res!145623) (not e!179364))))

(declare-fun arrayContainsKey!0 (array!14094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282557 (= res!145623 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282558 () Bool)

(declare-fun res!145625 () Bool)

(assert (=> b!282558 (=> (not res!145625) (not e!179366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282558 (= res!145625 (validKeyInArray!0 (select (arr!6689 a!3325) startIndex!26)))))

(declare-fun b!282559 () Bool)

(declare-fun res!145627 () Bool)

(assert (=> b!282559 (=> (not res!145627) (not e!179364))))

(assert (=> b!282559 (= res!145627 (validKeyInArray!0 k!2581))))

(declare-fun b!282560 () Bool)

(assert (=> b!282560 (= e!179363 e!179366)))

(declare-fun res!145626 () Bool)

(assert (=> b!282560 (=> (not res!145626) (not e!179366))))

(assert (=> b!282560 (= res!145626 (not (= startIndex!26 i!1267)))))

(assert (=> b!282560 (= lt!139609 (array!14095 (store (arr!6689 a!3325) i!1267 k!2581) (size!7041 a!3325)))))

(assert (= (and start!27276 res!145622) b!282554))

(assert (= (and b!282554 res!145629) b!282559))

(assert (= (and b!282559 res!145627) b!282556))

(assert (= (and b!282556 res!145621) b!282557))

(assert (= (and b!282557 res!145623) b!282553))

(assert (= (and b!282553 res!145628) b!282552))

(assert (= (and b!282552 res!145624) b!282560))

(assert (= (and b!282560 res!145626) b!282558))

(assert (= (and b!282558 res!145625) b!282555))

(declare-fun m!297159 () Bool)

(assert (=> b!282557 m!297159))

(declare-fun m!297161 () Bool)

(assert (=> b!282559 m!297161))

(declare-fun m!297163 () Bool)

(assert (=> start!27276 m!297163))

(declare-fun m!297165 () Bool)

(assert (=> start!27276 m!297165))

(declare-fun m!297167 () Bool)

(assert (=> b!282558 m!297167))

(assert (=> b!282558 m!297167))

(declare-fun m!297169 () Bool)

(assert (=> b!282558 m!297169))

(declare-fun m!297171 () Bool)

(assert (=> b!282555 m!297171))

(declare-fun m!297173 () Bool)

(assert (=> b!282555 m!297173))

(declare-fun m!297175 () Bool)

(assert (=> b!282555 m!297175))

(assert (=> b!282555 m!297173))

(declare-fun m!297177 () Bool)

(assert (=> b!282555 m!297177))

(assert (=> b!282555 m!297167))

(declare-fun m!297179 () Bool)

(assert (=> b!282555 m!297179))

(declare-fun m!297181 () Bool)

(assert (=> b!282555 m!297181))

(assert (=> b!282555 m!297167))

(declare-fun m!297183 () Bool)

(assert (=> b!282555 m!297183))

(declare-fun m!297185 () Bool)

(assert (=> b!282555 m!297185))

(declare-fun m!297187 () Bool)

(assert (=> b!282555 m!297187))

(declare-fun m!297189 () Bool)

(assert (=> b!282553 m!297189))

(declare-fun m!297191 () Bool)

(assert (=> b!282556 m!297191))

(assert (=> b!282560 m!297177))

(declare-fun m!297193 () Bool)

(assert (=> b!282552 m!297193))

(push 1)

