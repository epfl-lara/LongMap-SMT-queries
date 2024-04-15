; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26426 () Bool)

(assert start!26426)

(declare-fun b!273996 () Bool)

(declare-fun res!138038 () Bool)

(declare-fun e!175468 () Bool)

(assert (=> b!273996 (=> (not res!138038) (not e!175468))))

(declare-datatypes ((array!13512 0))(
  ( (array!13513 (arr!6405 (Array (_ BitVec 32) (_ BitVec 64))) (size!6758 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13512)

(declare-datatypes ((List!4186 0))(
  ( (Nil!4183) (Cons!4182 (h!4849 (_ BitVec 64)) (t!9259 List!4186)) )
))
(declare-fun arrayNoDuplicates!0 (array!13512 (_ BitVec 32) List!4186) Bool)

(assert (=> b!273996 (= res!138038 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4183))))

(declare-fun b!273997 () Bool)

(declare-fun res!138044 () Bool)

(assert (=> b!273997 (=> (not res!138044) (not e!175468))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273997 (= res!138044 (and (= (size!6758 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6758 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6758 a!3325))))))

(declare-fun b!273998 () Bool)

(declare-fun e!175469 () Bool)

(assert (=> b!273998 (= e!175468 e!175469)))

(declare-fun res!138041 () Bool)

(assert (=> b!273998 (=> (not res!138041) (not e!175469))))

(declare-datatypes ((SeekEntryResult!1562 0))(
  ( (MissingZero!1562 (index!8418 (_ BitVec 32))) (Found!1562 (index!8419 (_ BitVec 32))) (Intermediate!1562 (undefined!2374 Bool) (index!8420 (_ BitVec 32)) (x!26734 (_ BitVec 32))) (Undefined!1562) (MissingVacant!1562 (index!8421 (_ BitVec 32))) )
))
(declare-fun lt!136594 () SeekEntryResult!1562)

(assert (=> b!273998 (= res!138041 (or (= lt!136594 (MissingZero!1562 i!1267)) (= lt!136594 (MissingVacant!1562 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13512 (_ BitVec 32)) SeekEntryResult!1562)

(assert (=> b!273998 (= lt!136594 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273999 () Bool)

(declare-fun e!175467 () Bool)

(assert (=> b!273999 (= e!175467 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13512 (_ BitVec 32)) Bool)

(assert (=> b!273999 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8577 0))(
  ( (Unit!8578) )
))
(declare-fun lt!136595 () Unit!8577)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8577)

(assert (=> b!273999 (= lt!136595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136593 () array!13512)

(assert (=> b!273999 (= (seekEntryOrOpen!0 (select (arr!6405 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6405 a!3325) i!1267 k0!2581) startIndex!26) lt!136593 mask!3868))))

(declare-fun lt!136596 () Unit!8577)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13512 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8577)

(assert (=> b!273999 (= lt!136596 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273999 (arrayNoDuplicates!0 lt!136593 #b00000000000000000000000000000000 Nil!4183)))

(declare-fun lt!136592 () Unit!8577)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13512 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4186) Unit!8577)

(assert (=> b!273999 (= lt!136592 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4183))))

(declare-fun b!274000 () Bool)

(declare-fun res!138039 () Bool)

(assert (=> b!274000 (=> (not res!138039) (not e!175468))))

(declare-fun arrayContainsKey!0 (array!13512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274000 (= res!138039 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274001 () Bool)

(declare-fun res!138040 () Bool)

(assert (=> b!274001 (=> (not res!138040) (not e!175467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274001 (= res!138040 (validKeyInArray!0 (select (arr!6405 a!3325) startIndex!26)))))

(declare-fun res!138042 () Bool)

(assert (=> start!26426 (=> (not res!138042) (not e!175468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26426 (= res!138042 (validMask!0 mask!3868))))

(assert (=> start!26426 e!175468))

(declare-fun array_inv!4377 (array!13512) Bool)

(assert (=> start!26426 (array_inv!4377 a!3325)))

(assert (=> start!26426 true))

(declare-fun b!274002 () Bool)

(declare-fun res!138043 () Bool)

(assert (=> b!274002 (=> (not res!138043) (not e!175468))))

(assert (=> b!274002 (= res!138043 (validKeyInArray!0 k0!2581))))

(declare-fun b!274003 () Bool)

(declare-fun res!138046 () Bool)

(assert (=> b!274003 (=> (not res!138046) (not e!175469))))

(assert (=> b!274003 (= res!138046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274004 () Bool)

(assert (=> b!274004 (= e!175469 e!175467)))

(declare-fun res!138045 () Bool)

(assert (=> b!274004 (=> (not res!138045) (not e!175467))))

(assert (=> b!274004 (= res!138045 (not (= startIndex!26 i!1267)))))

(assert (=> b!274004 (= lt!136593 (array!13513 (store (arr!6405 a!3325) i!1267 k0!2581) (size!6758 a!3325)))))

(assert (= (and start!26426 res!138042) b!273997))

(assert (= (and b!273997 res!138044) b!274002))

(assert (= (and b!274002 res!138043) b!273996))

(assert (= (and b!273996 res!138038) b!274000))

(assert (= (and b!274000 res!138039) b!273998))

(assert (= (and b!273998 res!138041) b!274003))

(assert (= (and b!274003 res!138046) b!274004))

(assert (= (and b!274004 res!138045) b!274001))

(assert (= (and b!274001 res!138040) b!273999))

(declare-fun m!288977 () Bool)

(assert (=> b!274002 m!288977))

(declare-fun m!288979 () Bool)

(assert (=> b!273999 m!288979))

(declare-fun m!288981 () Bool)

(assert (=> b!273999 m!288981))

(declare-fun m!288983 () Bool)

(assert (=> b!273999 m!288983))

(declare-fun m!288985 () Bool)

(assert (=> b!273999 m!288985))

(declare-fun m!288987 () Bool)

(assert (=> b!273999 m!288987))

(declare-fun m!288989 () Bool)

(assert (=> b!273999 m!288989))

(assert (=> b!273999 m!288985))

(declare-fun m!288991 () Bool)

(assert (=> b!273999 m!288991))

(declare-fun m!288993 () Bool)

(assert (=> b!273999 m!288993))

(declare-fun m!288995 () Bool)

(assert (=> b!273999 m!288995))

(assert (=> b!273999 m!288979))

(declare-fun m!288997 () Bool)

(assert (=> b!273999 m!288997))

(declare-fun m!288999 () Bool)

(assert (=> b!273996 m!288999))

(assert (=> b!274001 m!288985))

(assert (=> b!274001 m!288985))

(declare-fun m!289001 () Bool)

(assert (=> b!274001 m!289001))

(assert (=> b!274004 m!288981))

(declare-fun m!289003 () Bool)

(assert (=> start!26426 m!289003))

(declare-fun m!289005 () Bool)

(assert (=> start!26426 m!289005))

(declare-fun m!289007 () Bool)

(assert (=> b!273998 m!289007))

(declare-fun m!289009 () Bool)

(assert (=> b!274000 m!289009))

(declare-fun m!289011 () Bool)

(assert (=> b!274003 m!289011))

(check-sat (not b!273996) (not b!273998) (not start!26426) (not b!274003) (not b!273999) (not b!274002) (not b!274001) (not b!274000))
(check-sat)
