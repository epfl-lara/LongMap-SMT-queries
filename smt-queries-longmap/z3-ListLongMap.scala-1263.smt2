; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26138 () Bool)

(assert start!26138)

(declare-fun b!269819 () Bool)

(declare-fun e!174003 () Bool)

(declare-fun e!174001 () Bool)

(assert (=> b!269819 (= e!174003 e!174001)))

(declare-fun res!133948 () Bool)

(assert (=> b!269819 (=> (not res!133948) (not e!174001))))

(declare-datatypes ((SeekEntryResult!1425 0))(
  ( (MissingZero!1425 (index!7870 (_ BitVec 32))) (Found!1425 (index!7871 (_ BitVec 32))) (Intermediate!1425 (undefined!2237 Bool) (index!7872 (_ BitVec 32)) (x!26214 (_ BitVec 32))) (Undefined!1425) (MissingVacant!1425 (index!7873 (_ BitVec 32))) )
))
(declare-fun lt!135325 () SeekEntryResult!1425)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269819 (= res!133948 (or (= lt!135325 (MissingZero!1425 i!1267)) (= lt!135325 (MissingVacant!1425 i!1267))))))

(declare-datatypes ((array!13235 0))(
  ( (array!13236 (arr!6267 (Array (_ BitVec 32) (_ BitVec 64))) (size!6619 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13235)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13235 (_ BitVec 32)) SeekEntryResult!1425)

(assert (=> b!269819 (= lt!135325 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269820 () Bool)

(declare-fun res!133950 () Bool)

(assert (=> b!269820 (=> (not res!133950) (not e!174003))))

(declare-fun arrayContainsKey!0 (array!13235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269820 (= res!133950 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269821 () Bool)

(declare-fun res!133947 () Bool)

(assert (=> b!269821 (=> (not res!133947) (not e!174003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269821 (= res!133947 (validKeyInArray!0 k0!2581))))

(declare-fun res!133945 () Bool)

(assert (=> start!26138 (=> (not res!133945) (not e!174003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26138 (= res!133945 (validMask!0 mask!3868))))

(assert (=> start!26138 e!174003))

(declare-fun array_inv!4230 (array!13235) Bool)

(assert (=> start!26138 (array_inv!4230 a!3325)))

(assert (=> start!26138 true))

(declare-fun b!269822 () Bool)

(declare-fun e!174005 () Bool)

(assert (=> b!269822 (= e!174001 e!174005)))

(declare-fun res!133946 () Bool)

(assert (=> b!269822 (=> (not res!133946) (not e!174005))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269822 (= res!133946 (= startIndex!26 i!1267))))

(declare-fun lt!135323 () array!13235)

(assert (=> b!269822 (= lt!135323 (array!13236 (store (arr!6267 a!3325) i!1267 k0!2581) (size!6619 a!3325)))))

(declare-fun b!269823 () Bool)

(declare-datatypes ((Unit!8380 0))(
  ( (Unit!8381) )
))
(declare-fun e!174004 () Unit!8380)

(declare-fun lt!135322 () Unit!8380)

(assert (=> b!269823 (= e!174004 lt!135322)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13235 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8380)

(assert (=> b!269823 (= lt!135322 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13235 (_ BitVec 32)) Bool)

(assert (=> b!269823 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135323 mask!3868)))

(declare-fun b!269824 () Bool)

(assert (=> b!269824 (= e!174005 (not true))))

(assert (=> b!269824 (= (seekEntryOrOpen!0 k0!2581 lt!135323 mask!3868) (Found!1425 i!1267))))

(declare-fun lt!135321 () Unit!8380)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13235 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8380)

(assert (=> b!269824 (= lt!135321 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135324 () Unit!8380)

(assert (=> b!269824 (= lt!135324 e!174004)))

(declare-fun c!45489 () Bool)

(assert (=> b!269824 (= c!45489 (bvslt startIndex!26 (bvsub (size!6619 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269825 () Bool)

(declare-fun res!133943 () Bool)

(assert (=> b!269825 (=> (not res!133943) (not e!174001))))

(assert (=> b!269825 (= res!133943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269826 () Bool)

(declare-fun res!133944 () Bool)

(assert (=> b!269826 (=> (not res!133944) (not e!174003))))

(declare-datatypes ((List!4075 0))(
  ( (Nil!4072) (Cons!4071 (h!4738 (_ BitVec 64)) (t!9157 List!4075)) )
))
(declare-fun arrayNoDuplicates!0 (array!13235 (_ BitVec 32) List!4075) Bool)

(assert (=> b!269826 (= res!133944 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4072))))

(declare-fun b!269827 () Bool)

(declare-fun res!133949 () Bool)

(assert (=> b!269827 (=> (not res!133949) (not e!174003))))

(assert (=> b!269827 (= res!133949 (and (= (size!6619 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6619 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6619 a!3325))))))

(declare-fun b!269828 () Bool)

(declare-fun Unit!8382 () Unit!8380)

(assert (=> b!269828 (= e!174004 Unit!8382)))

(assert (= (and start!26138 res!133945) b!269827))

(assert (= (and b!269827 res!133949) b!269821))

(assert (= (and b!269821 res!133947) b!269826))

(assert (= (and b!269826 res!133944) b!269820))

(assert (= (and b!269820 res!133950) b!269819))

(assert (= (and b!269819 res!133948) b!269825))

(assert (= (and b!269825 res!133943) b!269822))

(assert (= (and b!269822 res!133946) b!269824))

(assert (= (and b!269824 c!45489) b!269823))

(assert (= (and b!269824 (not c!45489)) b!269828))

(declare-fun m!285555 () Bool)

(assert (=> b!269823 m!285555))

(declare-fun m!285557 () Bool)

(assert (=> b!269823 m!285557))

(declare-fun m!285559 () Bool)

(assert (=> b!269824 m!285559))

(declare-fun m!285561 () Bool)

(assert (=> b!269824 m!285561))

(declare-fun m!285563 () Bool)

(assert (=> b!269821 m!285563))

(declare-fun m!285565 () Bool)

(assert (=> b!269820 m!285565))

(declare-fun m!285567 () Bool)

(assert (=> start!26138 m!285567))

(declare-fun m!285569 () Bool)

(assert (=> start!26138 m!285569))

(declare-fun m!285571 () Bool)

(assert (=> b!269826 m!285571))

(declare-fun m!285573 () Bool)

(assert (=> b!269819 m!285573))

(declare-fun m!285575 () Bool)

(assert (=> b!269825 m!285575))

(declare-fun m!285577 () Bool)

(assert (=> b!269822 m!285577))

(check-sat (not start!26138) (not b!269823) (not b!269820) (not b!269819) (not b!269826) (not b!269824) (not b!269821) (not b!269825))
(check-sat)
