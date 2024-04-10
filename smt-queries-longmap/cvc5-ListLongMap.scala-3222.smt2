; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45078 () Bool)

(assert start!45078)

(declare-fun b!494816 () Bool)

(declare-fun e!290334 () Bool)

(assert (=> b!494816 (= e!290334 true)))

(declare-datatypes ((SeekEntryResult!3863 0))(
  ( (MissingZero!3863 (index!17631 (_ BitVec 32))) (Found!3863 (index!17632 (_ BitVec 32))) (Intermediate!3863 (undefined!4675 Bool) (index!17633 (_ BitVec 32)) (x!46701 (_ BitVec 32))) (Undefined!3863) (MissingVacant!3863 (index!17634 (_ BitVec 32))) )
))
(declare-fun lt!223999 () SeekEntryResult!3863)

(assert (=> b!494816 (= lt!223999 Undefined!3863)))

(declare-fun b!494817 () Bool)

(declare-fun res!297395 () Bool)

(assert (=> b!494817 (=> res!297395 e!290334)))

(declare-fun lt!224002 () SeekEntryResult!3863)

(assert (=> b!494817 (= res!297395 (or (not (is-Intermediate!3863 lt!224002)) (not (undefined!4675 lt!224002))))))

(declare-fun b!494818 () Bool)

(declare-fun res!297394 () Bool)

(declare-fun e!290336 () Bool)

(assert (=> b!494818 (=> (not res!297394) (not e!290336))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494818 (= res!297394 (validKeyInArray!0 k!2280))))

(declare-fun b!494819 () Bool)

(declare-fun res!297392 () Bool)

(declare-fun e!290337 () Bool)

(assert (=> b!494819 (=> (not res!297392) (not e!290337))))

(declare-datatypes ((array!32023 0))(
  ( (array!32024 (arr!15396 (Array (_ BitVec 32) (_ BitVec 64))) (size!15760 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32023)

(declare-datatypes ((List!9554 0))(
  ( (Nil!9551) (Cons!9550 (h!10418 (_ BitVec 64)) (t!15782 List!9554)) )
))
(declare-fun arrayNoDuplicates!0 (array!32023 (_ BitVec 32) List!9554) Bool)

(assert (=> b!494819 (= res!297392 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9551))))

(declare-fun b!494820 () Bool)

(assert (=> b!494820 (= e!290336 e!290337)))

(declare-fun res!297391 () Bool)

(assert (=> b!494820 (=> (not res!297391) (not e!290337))))

(declare-fun lt!224000 () SeekEntryResult!3863)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494820 (= res!297391 (or (= lt!224000 (MissingZero!3863 i!1204)) (= lt!224000 (MissingVacant!3863 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32023 (_ BitVec 32)) SeekEntryResult!3863)

(assert (=> b!494820 (= lt!224000 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!297393 () Bool)

(assert (=> start!45078 (=> (not res!297393) (not e!290336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45078 (= res!297393 (validMask!0 mask!3524))))

(assert (=> start!45078 e!290336))

(assert (=> start!45078 true))

(declare-fun array_inv!11192 (array!32023) Bool)

(assert (=> start!45078 (array_inv!11192 a!3235)))

(declare-fun b!494821 () Bool)

(declare-fun res!297387 () Bool)

(assert (=> b!494821 (=> (not res!297387) (not e!290336))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494821 (= res!297387 (validKeyInArray!0 (select (arr!15396 a!3235) j!176)))))

(declare-fun b!494822 () Bool)

(assert (=> b!494822 (= e!290337 (not e!290334))))

(declare-fun res!297390 () Bool)

(assert (=> b!494822 (=> res!297390 e!290334)))

(declare-fun lt!223997 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32023 (_ BitVec 32)) SeekEntryResult!3863)

(assert (=> b!494822 (= res!297390 (= lt!224002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223997 (select (store (arr!15396 a!3235) i!1204 k!2280) j!176) (array!32024 (store (arr!15396 a!3235) i!1204 k!2280) (size!15760 a!3235)) mask!3524)))))

(declare-fun lt!223998 () (_ BitVec 32))

(assert (=> b!494822 (= lt!224002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223998 (select (arr!15396 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494822 (= lt!223997 (toIndex!0 (select (store (arr!15396 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494822 (= lt!223998 (toIndex!0 (select (arr!15396 a!3235) j!176) mask!3524))))

(assert (=> b!494822 (= lt!223999 (Found!3863 j!176))))

(assert (=> b!494822 (= lt!223999 (seekEntryOrOpen!0 (select (arr!15396 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32023 (_ BitVec 32)) Bool)

(assert (=> b!494822 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14672 0))(
  ( (Unit!14673) )
))
(declare-fun lt!224001 () Unit!14672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32023 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14672)

(assert (=> b!494822 (= lt!224001 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494823 () Bool)

(declare-fun res!297388 () Bool)

(assert (=> b!494823 (=> (not res!297388) (not e!290336))))

(declare-fun arrayContainsKey!0 (array!32023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494823 (= res!297388 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494824 () Bool)

(declare-fun res!297386 () Bool)

(assert (=> b!494824 (=> (not res!297386) (not e!290336))))

(assert (=> b!494824 (= res!297386 (and (= (size!15760 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15760 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15760 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494825 () Bool)

(declare-fun res!297389 () Bool)

(assert (=> b!494825 (=> (not res!297389) (not e!290337))))

(assert (=> b!494825 (= res!297389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45078 res!297393) b!494824))

(assert (= (and b!494824 res!297386) b!494821))

(assert (= (and b!494821 res!297387) b!494818))

(assert (= (and b!494818 res!297394) b!494823))

(assert (= (and b!494823 res!297388) b!494820))

(assert (= (and b!494820 res!297391) b!494825))

(assert (= (and b!494825 res!297389) b!494819))

(assert (= (and b!494819 res!297392) b!494822))

(assert (= (and b!494822 (not res!297390)) b!494817))

(assert (= (and b!494817 (not res!297395)) b!494816))

(declare-fun m!475935 () Bool)

(assert (=> b!494823 m!475935))

(declare-fun m!475937 () Bool)

(assert (=> b!494818 m!475937))

(declare-fun m!475939 () Bool)

(assert (=> start!45078 m!475939))

(declare-fun m!475941 () Bool)

(assert (=> start!45078 m!475941))

(declare-fun m!475943 () Bool)

(assert (=> b!494825 m!475943))

(declare-fun m!475945 () Bool)

(assert (=> b!494822 m!475945))

(declare-fun m!475947 () Bool)

(assert (=> b!494822 m!475947))

(declare-fun m!475949 () Bool)

(assert (=> b!494822 m!475949))

(assert (=> b!494822 m!475949))

(declare-fun m!475951 () Bool)

(assert (=> b!494822 m!475951))

(declare-fun m!475953 () Bool)

(assert (=> b!494822 m!475953))

(declare-fun m!475955 () Bool)

(assert (=> b!494822 m!475955))

(assert (=> b!494822 m!475953))

(assert (=> b!494822 m!475953))

(declare-fun m!475957 () Bool)

(assert (=> b!494822 m!475957))

(declare-fun m!475959 () Bool)

(assert (=> b!494822 m!475959))

(assert (=> b!494822 m!475953))

(declare-fun m!475961 () Bool)

(assert (=> b!494822 m!475961))

(assert (=> b!494822 m!475949))

(declare-fun m!475963 () Bool)

(assert (=> b!494822 m!475963))

(assert (=> b!494821 m!475953))

(assert (=> b!494821 m!475953))

(declare-fun m!475965 () Bool)

(assert (=> b!494821 m!475965))

(declare-fun m!475967 () Bool)

(assert (=> b!494819 m!475967))

(declare-fun m!475969 () Bool)

(assert (=> b!494820 m!475969))

(push 1)

