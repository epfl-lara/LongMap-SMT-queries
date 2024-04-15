; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26216 () Bool)

(assert start!26216)

(declare-fun b!270953 () Bool)

(declare-fun res!135001 () Bool)

(declare-fun e!174377 () Bool)

(assert (=> b!270953 (=> (not res!135001) (not e!174377))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270953 (= res!135001 (validKeyInArray!0 k0!2581))))

(declare-fun b!270954 () Bool)

(declare-fun res!135000 () Bool)

(declare-fun e!174376 () Bool)

(assert (=> b!270954 (=> (not res!135000) (not e!174376))))

(declare-datatypes ((array!13302 0))(
  ( (array!13303 (arr!6300 (Array (_ BitVec 32) (_ BitVec 64))) (size!6653 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13302)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13302 (_ BitVec 32)) Bool)

(assert (=> b!270954 (= res!135000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270955 () Bool)

(declare-fun res!134997 () Bool)

(assert (=> b!270955 (=> (not res!134997) (not e!174376))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270955 (= res!134997 (validKeyInArray!0 (select (arr!6300 a!3325) startIndex!26)))))

(declare-fun b!270956 () Bool)

(declare-fun res!134995 () Bool)

(assert (=> b!270956 (=> (not res!134995) (not e!174376))))

(assert (=> b!270956 (= res!134995 (and (bvslt (size!6653 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6653 a!3325))))))

(declare-fun b!270957 () Bool)

(declare-fun res!134998 () Bool)

(assert (=> b!270957 (=> (not res!134998) (not e!174376))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270957 (= res!134998 (not (= startIndex!26 i!1267)))))

(declare-fun b!270958 () Bool)

(declare-fun res!134996 () Bool)

(assert (=> b!270958 (=> (not res!134996) (not e!174377))))

(declare-datatypes ((List!4081 0))(
  ( (Nil!4078) (Cons!4077 (h!4744 (_ BitVec 64)) (t!9154 List!4081)) )
))
(declare-fun arrayNoDuplicates!0 (array!13302 (_ BitVec 32) List!4081) Bool)

(assert (=> b!270958 (= res!134996 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4078))))

(declare-fun b!270959 () Bool)

(declare-fun res!135003 () Bool)

(assert (=> b!270959 (=> (not res!135003) (not e!174376))))

(declare-fun noDuplicate!133 (List!4081) Bool)

(assert (=> b!270959 (= res!135003 (noDuplicate!133 Nil!4078))))

(declare-fun b!270960 () Bool)

(declare-fun res!134999 () Bool)

(assert (=> b!270960 (=> (not res!134999) (not e!174376))))

(declare-fun contains!1919 (List!4081 (_ BitVec 64)) Bool)

(assert (=> b!270960 (= res!134999 (not (contains!1919 Nil!4078 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!135007 () Bool)

(assert (=> start!26216 (=> (not res!135007) (not e!174377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26216 (= res!135007 (validMask!0 mask!3868))))

(assert (=> start!26216 e!174377))

(declare-fun array_inv!4272 (array!13302) Bool)

(assert (=> start!26216 (array_inv!4272 a!3325)))

(assert (=> start!26216 true))

(declare-fun b!270961 () Bool)

(assert (=> b!270961 (= e!174377 e!174376)))

(declare-fun res!135004 () Bool)

(assert (=> b!270961 (=> (not res!135004) (not e!174376))))

(declare-datatypes ((SeekEntryResult!1457 0))(
  ( (MissingZero!1457 (index!7998 (_ BitVec 32))) (Found!1457 (index!7999 (_ BitVec 32))) (Intermediate!1457 (undefined!2269 Bool) (index!8000 (_ BitVec 32)) (x!26349 (_ BitVec 32))) (Undefined!1457) (MissingVacant!1457 (index!8001 (_ BitVec 32))) )
))
(declare-fun lt!135569 () SeekEntryResult!1457)

(assert (=> b!270961 (= res!135004 (or (= lt!135569 (MissingZero!1457 i!1267)) (= lt!135569 (MissingVacant!1457 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13302 (_ BitVec 32)) SeekEntryResult!1457)

(assert (=> b!270961 (= lt!135569 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270962 () Bool)

(declare-fun res!135006 () Bool)

(assert (=> b!270962 (=> (not res!135006) (not e!174377))))

(declare-fun arrayContainsKey!0 (array!13302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270962 (= res!135006 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270963 () Bool)

(assert (=> b!270963 (= e!174376 false)))

(declare-fun lt!135570 () Bool)

(assert (=> b!270963 (= lt!135570 (contains!1919 Nil!4078 k0!2581))))

(declare-fun b!270964 () Bool)

(declare-fun res!135005 () Bool)

(assert (=> b!270964 (=> (not res!135005) (not e!174377))))

(assert (=> b!270964 (= res!135005 (and (= (size!6653 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6653 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6653 a!3325))))))

(declare-fun b!270965 () Bool)

(declare-fun res!135002 () Bool)

(assert (=> b!270965 (=> (not res!135002) (not e!174376))))

(assert (=> b!270965 (= res!135002 (not (contains!1919 Nil!4078 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!26216 res!135007) b!270964))

(assert (= (and b!270964 res!135005) b!270953))

(assert (= (and b!270953 res!135001) b!270958))

(assert (= (and b!270958 res!134996) b!270962))

(assert (= (and b!270962 res!135006) b!270961))

(assert (= (and b!270961 res!135004) b!270954))

(assert (= (and b!270954 res!135000) b!270957))

(assert (= (and b!270957 res!134998) b!270955))

(assert (= (and b!270955 res!134997) b!270956))

(assert (= (and b!270956 res!134995) b!270959))

(assert (= (and b!270959 res!135003) b!270965))

(assert (= (and b!270965 res!135002) b!270960))

(assert (= (and b!270960 res!134999) b!270963))

(declare-fun m!285905 () Bool)

(assert (=> start!26216 m!285905))

(declare-fun m!285907 () Bool)

(assert (=> start!26216 m!285907))

(declare-fun m!285909 () Bool)

(assert (=> b!270963 m!285909))

(declare-fun m!285911 () Bool)

(assert (=> b!270958 m!285911))

(declare-fun m!285913 () Bool)

(assert (=> b!270960 m!285913))

(declare-fun m!285915 () Bool)

(assert (=> b!270965 m!285915))

(declare-fun m!285917 () Bool)

(assert (=> b!270954 m!285917))

(declare-fun m!285919 () Bool)

(assert (=> b!270961 m!285919))

(declare-fun m!285921 () Bool)

(assert (=> b!270953 m!285921))

(declare-fun m!285923 () Bool)

(assert (=> b!270962 m!285923))

(declare-fun m!285925 () Bool)

(assert (=> b!270959 m!285925))

(declare-fun m!285927 () Bool)

(assert (=> b!270955 m!285927))

(assert (=> b!270955 m!285927))

(declare-fun m!285929 () Bool)

(assert (=> b!270955 m!285929))

(check-sat (not b!270955) (not b!270965) (not b!270958) (not b!270962) (not b!270963) (not b!270960) (not b!270959) (not b!270953) (not start!26216) (not b!270954) (not b!270961))
(check-sat)
