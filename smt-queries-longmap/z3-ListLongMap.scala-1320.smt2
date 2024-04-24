; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26478 () Bool)

(assert start!26478)

(declare-fun b!274949 () Bool)

(declare-fun res!138913 () Bool)

(declare-fun e!175951 () Bool)

(assert (=> b!274949 (=> (not res!138913) (not e!175951))))

(declare-datatypes ((array!13574 0))(
  ( (array!13575 (arr!6436 (Array (_ BitVec 32) (_ BitVec 64))) (size!6788 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13574)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274949 (= res!138913 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274950 () Bool)

(declare-fun e!175952 () Bool)

(assert (=> b!274950 (= e!175952 false)))

(declare-fun lt!137267 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13574 (_ BitVec 32)) Bool)

(assert (=> b!274950 (= lt!137267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274951 () Bool)

(assert (=> b!274951 (= e!175951 e!175952)))

(declare-fun res!138916 () Bool)

(assert (=> b!274951 (=> (not res!138916) (not e!175952))))

(declare-datatypes ((SeekEntryResult!1559 0))(
  ( (MissingZero!1559 (index!8406 (_ BitVec 32))) (Found!1559 (index!8407 (_ BitVec 32))) (Intermediate!1559 (undefined!2371 Bool) (index!8408 (_ BitVec 32)) (x!26804 (_ BitVec 32))) (Undefined!1559) (MissingVacant!1559 (index!8409 (_ BitVec 32))) )
))
(declare-fun lt!137268 () SeekEntryResult!1559)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274951 (= res!138916 (or (= lt!137268 (MissingZero!1559 i!1267)) (= lt!137268 (MissingVacant!1559 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13574 (_ BitVec 32)) SeekEntryResult!1559)

(assert (=> b!274951 (= lt!137268 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274952 () Bool)

(declare-fun res!138918 () Bool)

(assert (=> b!274952 (=> (not res!138918) (not e!175951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274952 (= res!138918 (validKeyInArray!0 k0!2581))))

(declare-fun b!274953 () Bool)

(declare-fun res!138917 () Bool)

(assert (=> b!274953 (=> (not res!138917) (not e!175951))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274953 (= res!138917 (and (= (size!6788 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6788 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6788 a!3325))))))

(declare-fun b!274954 () Bool)

(declare-fun res!138915 () Bool)

(assert (=> b!274954 (=> (not res!138915) (not e!175951))))

(declare-datatypes ((List!4157 0))(
  ( (Nil!4154) (Cons!4153 (h!4820 (_ BitVec 64)) (t!9231 List!4157)) )
))
(declare-fun arrayNoDuplicates!0 (array!13574 (_ BitVec 32) List!4157) Bool)

(assert (=> b!274954 (= res!138915 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4154))))

(declare-fun res!138914 () Bool)

(assert (=> start!26478 (=> (not res!138914) (not e!175951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26478 (= res!138914 (validMask!0 mask!3868))))

(assert (=> start!26478 e!175951))

(declare-fun array_inv!4386 (array!13574) Bool)

(assert (=> start!26478 (array_inv!4386 a!3325)))

(assert (=> start!26478 true))

(assert (= (and start!26478 res!138914) b!274953))

(assert (= (and b!274953 res!138917) b!274952))

(assert (= (and b!274952 res!138918) b!274954))

(assert (= (and b!274954 res!138915) b!274949))

(assert (= (and b!274949 res!138913) b!274951))

(assert (= (and b!274951 res!138916) b!274950))

(declare-fun m!290795 () Bool)

(assert (=> b!274952 m!290795))

(declare-fun m!290797 () Bool)

(assert (=> b!274951 m!290797))

(declare-fun m!290799 () Bool)

(assert (=> b!274949 m!290799))

(declare-fun m!290801 () Bool)

(assert (=> start!26478 m!290801))

(declare-fun m!290803 () Bool)

(assert (=> start!26478 m!290803))

(declare-fun m!290805 () Bool)

(assert (=> b!274954 m!290805))

(declare-fun m!290807 () Bool)

(assert (=> b!274950 m!290807))

(check-sat (not b!274950) (not b!274952) (not start!26478) (not b!274951) (not b!274949) (not b!274954))
(check-sat)
