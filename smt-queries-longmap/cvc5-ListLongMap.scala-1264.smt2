; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26142 () Bool)

(assert start!26142)

(declare-fun b!269879 () Bool)

(declare-fun res!133998 () Bool)

(declare-fun e!174033 () Bool)

(assert (=> b!269879 (=> (not res!133998) (not e!174033))))

(declare-datatypes ((array!13239 0))(
  ( (array!13240 (arr!6269 (Array (_ BitVec 32) (_ BitVec 64))) (size!6621 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13239)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13239 (_ BitVec 32)) Bool)

(assert (=> b!269879 (= res!133998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269880 () Bool)

(declare-fun res!133993 () Bool)

(declare-fun e!174031 () Bool)

(assert (=> b!269880 (=> (not res!133993) (not e!174031))))

(declare-datatypes ((List!4077 0))(
  ( (Nil!4074) (Cons!4073 (h!4740 (_ BitVec 64)) (t!9159 List!4077)) )
))
(declare-fun arrayNoDuplicates!0 (array!13239 (_ BitVec 32) List!4077) Bool)

(assert (=> b!269880 (= res!133993 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4074))))

(declare-fun b!269881 () Bool)

(declare-fun res!133995 () Bool)

(assert (=> b!269881 (=> (not res!133995) (not e!174031))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269881 (= res!133995 (and (= (size!6621 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6621 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6621 a!3325))))))

(declare-fun b!269883 () Bool)

(declare-fun res!133996 () Bool)

(assert (=> b!269883 (=> (not res!133996) (not e!174031))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269883 (= res!133996 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269884 () Bool)

(declare-fun e!174032 () Bool)

(assert (=> b!269884 (= e!174033 e!174032)))

(declare-fun res!133994 () Bool)

(assert (=> b!269884 (=> (not res!133994) (not e!174032))))

(assert (=> b!269884 (= res!133994 (= startIndex!26 i!1267))))

(declare-fun lt!135354 () array!13239)

(assert (=> b!269884 (= lt!135354 (array!13240 (store (arr!6269 a!3325) i!1267 k!2581) (size!6621 a!3325)))))

(declare-fun b!269885 () Bool)

(declare-fun res!133992 () Bool)

(assert (=> b!269885 (=> (not res!133992) (not e!174031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269885 (= res!133992 (validKeyInArray!0 k!2581))))

(declare-fun b!269886 () Bool)

(declare-datatypes ((Unit!8386 0))(
  ( (Unit!8387) )
))
(declare-fun e!174035 () Unit!8386)

(declare-fun Unit!8388 () Unit!8386)

(assert (=> b!269886 (= e!174035 Unit!8388)))

(declare-fun b!269887 () Bool)

(assert (=> b!269887 (= e!174032 (not (bvsge mask!3868 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!1427 0))(
  ( (MissingZero!1427 (index!7878 (_ BitVec 32))) (Found!1427 (index!7879 (_ BitVec 32))) (Intermediate!1427 (undefined!2239 Bool) (index!7880 (_ BitVec 32)) (x!26224 (_ BitVec 32))) (Undefined!1427) (MissingVacant!1427 (index!7881 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13239 (_ BitVec 32)) SeekEntryResult!1427)

(assert (=> b!269887 (= (seekEntryOrOpen!0 k!2581 lt!135354 mask!3868) (Found!1427 i!1267))))

(declare-fun lt!135351 () Unit!8386)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13239 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8386)

(assert (=> b!269887 (= lt!135351 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135355 () Unit!8386)

(assert (=> b!269887 (= lt!135355 e!174035)))

(declare-fun c!45495 () Bool)

(assert (=> b!269887 (= c!45495 (bvslt startIndex!26 (bvsub (size!6621 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269888 () Bool)

(assert (=> b!269888 (= e!174031 e!174033)))

(declare-fun res!133991 () Bool)

(assert (=> b!269888 (=> (not res!133991) (not e!174033))))

(declare-fun lt!135352 () SeekEntryResult!1427)

(assert (=> b!269888 (= res!133991 (or (= lt!135352 (MissingZero!1427 i!1267)) (= lt!135352 (MissingVacant!1427 i!1267))))))

(assert (=> b!269888 (= lt!135352 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!133997 () Bool)

(assert (=> start!26142 (=> (not res!133997) (not e!174031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26142 (= res!133997 (validMask!0 mask!3868))))

(assert (=> start!26142 e!174031))

(declare-fun array_inv!4232 (array!13239) Bool)

(assert (=> start!26142 (array_inv!4232 a!3325)))

(assert (=> start!26142 true))

(declare-fun b!269882 () Bool)

(declare-fun lt!135353 () Unit!8386)

(assert (=> b!269882 (= e!174035 lt!135353)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13239 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8386)

(assert (=> b!269882 (= lt!135353 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135354 mask!3868)))

(assert (= (and start!26142 res!133997) b!269881))

(assert (= (and b!269881 res!133995) b!269885))

(assert (= (and b!269885 res!133992) b!269880))

(assert (= (and b!269880 res!133993) b!269883))

(assert (= (and b!269883 res!133996) b!269888))

(assert (= (and b!269888 res!133991) b!269879))

(assert (= (and b!269879 res!133998) b!269884))

(assert (= (and b!269884 res!133994) b!269887))

(assert (= (and b!269887 c!45495) b!269882))

(assert (= (and b!269887 (not c!45495)) b!269886))

(declare-fun m!285603 () Bool)

(assert (=> b!269879 m!285603))

(declare-fun m!285605 () Bool)

(assert (=> b!269888 m!285605))

(declare-fun m!285607 () Bool)

(assert (=> b!269884 m!285607))

(declare-fun m!285609 () Bool)

(assert (=> b!269885 m!285609))

(declare-fun m!285611 () Bool)

(assert (=> b!269882 m!285611))

(declare-fun m!285613 () Bool)

(assert (=> b!269882 m!285613))

(declare-fun m!285615 () Bool)

(assert (=> b!269880 m!285615))

(declare-fun m!285617 () Bool)

(assert (=> b!269883 m!285617))

(declare-fun m!285619 () Bool)

(assert (=> start!26142 m!285619))

(declare-fun m!285621 () Bool)

(assert (=> start!26142 m!285621))

(declare-fun m!285623 () Bool)

(assert (=> b!269887 m!285623))

(declare-fun m!285625 () Bool)

(assert (=> b!269887 m!285625))

(push 1)

