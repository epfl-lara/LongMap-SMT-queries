; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45744 () Bool)

(assert start!45744)

(declare-fun b!505900 () Bool)

(declare-fun e!296126 () Bool)

(declare-fun e!296128 () Bool)

(assert (=> b!505900 (= e!296126 (not e!296128))))

(declare-fun res!306912 () Bool)

(assert (=> b!505900 (=> res!306912 e!296128)))

(declare-datatypes ((SeekEntryResult!4097 0))(
  ( (MissingZero!4097 (index!18576 (_ BitVec 32))) (Found!4097 (index!18577 (_ BitVec 32))) (Intermediate!4097 (undefined!4909 Bool) (index!18578 (_ BitVec 32)) (x!47586 (_ BitVec 32))) (Undefined!4097) (MissingVacant!4097 (index!18579 (_ BitVec 32))) )
))
(declare-fun lt!230711 () SeekEntryResult!4097)

(declare-fun lt!230714 () SeekEntryResult!4097)

(assert (=> b!505900 (= res!306912 (or (= lt!230711 lt!230714) (undefined!4909 lt!230711) (not (is-Intermediate!4097 lt!230711))))))

(declare-fun lt!230715 () (_ BitVec 64))

(declare-datatypes ((array!32500 0))(
  ( (array!32501 (arr!15630 (Array (_ BitVec 32) (_ BitVec 64))) (size!15994 (_ BitVec 32))) )
))
(declare-fun lt!230719 () array!32500)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!230712 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32500 (_ BitVec 32)) SeekEntryResult!4097)

(assert (=> b!505900 (= lt!230714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230712 lt!230715 lt!230719 mask!3524))))

(declare-fun lt!230717 () (_ BitVec 32))

(declare-fun a!3235 () array!32500)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!505900 (= lt!230711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230717 (select (arr!15630 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505900 (= lt!230712 (toIndex!0 lt!230715 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505900 (= lt!230715 (select (store (arr!15630 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505900 (= lt!230717 (toIndex!0 (select (arr!15630 a!3235) j!176) mask!3524))))

(assert (=> b!505900 (= lt!230719 (array!32501 (store (arr!15630 a!3235) i!1204 k!2280) (size!15994 a!3235)))))

(declare-fun lt!230713 () SeekEntryResult!4097)

(assert (=> b!505900 (= lt!230713 (Found!4097 j!176))))

(declare-fun e!296130 () Bool)

(assert (=> b!505900 e!296130))

(declare-fun res!306916 () Bool)

(assert (=> b!505900 (=> (not res!306916) (not e!296130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32500 (_ BitVec 32)) Bool)

(assert (=> b!505900 (= res!306916 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15464 0))(
  ( (Unit!15465) )
))
(declare-fun lt!230710 () Unit!15464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15464)

(assert (=> b!505900 (= lt!230710 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505901 () Bool)

(declare-fun e!296132 () Bool)

(assert (=> b!505901 (= e!296132 e!296126)))

(declare-fun res!306913 () Bool)

(assert (=> b!505901 (=> (not res!306913) (not e!296126))))

(declare-fun lt!230720 () SeekEntryResult!4097)

(assert (=> b!505901 (= res!306913 (or (= lt!230720 (MissingZero!4097 i!1204)) (= lt!230720 (MissingVacant!4097 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32500 (_ BitVec 32)) SeekEntryResult!4097)

(assert (=> b!505901 (= lt!230720 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505902 () Bool)

(declare-fun res!306917 () Bool)

(declare-fun e!296125 () Bool)

(assert (=> b!505902 (=> res!306917 e!296125)))

(assert (=> b!505902 (= res!306917 (not (= lt!230714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230717 lt!230715 lt!230719 mask!3524))))))

(declare-fun b!505903 () Bool)

(assert (=> b!505903 (= e!296128 e!296125)))

(declare-fun res!306911 () Bool)

(assert (=> b!505903 (=> res!306911 e!296125)))

(assert (=> b!505903 (= res!306911 (or (bvsgt (x!47586 lt!230711) #b01111111111111111111111111111110) (bvslt lt!230717 #b00000000000000000000000000000000) (bvsge lt!230717 (size!15994 a!3235)) (bvslt (index!18578 lt!230711) #b00000000000000000000000000000000) (bvsge (index!18578 lt!230711) (size!15994 a!3235)) (not (= lt!230711 (Intermediate!4097 false (index!18578 lt!230711) (x!47586 lt!230711))))))))

(assert (=> b!505903 (= (index!18578 lt!230711) i!1204)))

(declare-fun lt!230721 () Unit!15464)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32500 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15464)

(assert (=> b!505903 (= lt!230721 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230717 #b00000000000000000000000000000000 (index!18578 lt!230711) (x!47586 lt!230711) mask!3524))))

(assert (=> b!505903 (and (or (= (select (arr!15630 a!3235) (index!18578 lt!230711)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15630 a!3235) (index!18578 lt!230711)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15630 a!3235) (index!18578 lt!230711)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15630 a!3235) (index!18578 lt!230711)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230716 () Unit!15464)

(declare-fun e!296131 () Unit!15464)

(assert (=> b!505903 (= lt!230716 e!296131)))

(declare-fun c!59774 () Bool)

(assert (=> b!505903 (= c!59774 (= (select (arr!15630 a!3235) (index!18578 lt!230711)) (select (arr!15630 a!3235) j!176)))))

(assert (=> b!505903 (and (bvslt (x!47586 lt!230711) #b01111111111111111111111111111110) (or (= (select (arr!15630 a!3235) (index!18578 lt!230711)) (select (arr!15630 a!3235) j!176)) (= (select (arr!15630 a!3235) (index!18578 lt!230711)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15630 a!3235) (index!18578 lt!230711)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505904 () Bool)

(declare-fun res!306915 () Bool)

(assert (=> b!505904 (=> (not res!306915) (not e!296132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505904 (= res!306915 (validKeyInArray!0 (select (arr!15630 a!3235) j!176)))))

(declare-fun b!505905 () Bool)

(declare-fun res!306921 () Bool)

(assert (=> b!505905 (=> (not res!306921) (not e!296132))))

(declare-fun arrayContainsKey!0 (array!32500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505905 (= res!306921 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505906 () Bool)

(declare-fun res!306914 () Bool)

(assert (=> b!505906 (=> (not res!306914) (not e!296126))))

(assert (=> b!505906 (= res!306914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505907 () Bool)

(declare-fun e!296127 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32500 (_ BitVec 32)) SeekEntryResult!4097)

(assert (=> b!505907 (= e!296127 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230717 (index!18578 lt!230711) (select (arr!15630 a!3235) j!176) a!3235 mask!3524) lt!230713)))))

(declare-fun b!505909 () Bool)

(declare-fun Unit!15466 () Unit!15464)

(assert (=> b!505909 (= e!296131 Unit!15466)))

(declare-fun lt!230718 () Unit!15464)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32500 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15464)

(assert (=> b!505909 (= lt!230718 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230717 #b00000000000000000000000000000000 (index!18578 lt!230711) (x!47586 lt!230711) mask!3524))))

(declare-fun res!306918 () Bool)

(assert (=> b!505909 (= res!306918 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230717 lt!230715 lt!230719 mask!3524) (Intermediate!4097 false (index!18578 lt!230711) (x!47586 lt!230711))))))

(declare-fun e!296129 () Bool)

(assert (=> b!505909 (=> (not res!306918) (not e!296129))))

(assert (=> b!505909 e!296129))

(declare-fun b!505910 () Bool)

(declare-fun res!306919 () Bool)

(assert (=> b!505910 (=> (not res!306919) (not e!296126))))

(declare-datatypes ((List!9788 0))(
  ( (Nil!9785) (Cons!9784 (h!10661 (_ BitVec 64)) (t!16016 List!9788)) )
))
(declare-fun arrayNoDuplicates!0 (array!32500 (_ BitVec 32) List!9788) Bool)

(assert (=> b!505910 (= res!306919 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9785))))

(declare-fun b!505911 () Bool)

(declare-fun res!306922 () Bool)

(assert (=> b!505911 (=> (not res!306922) (not e!296132))))

(assert (=> b!505911 (= res!306922 (validKeyInArray!0 k!2280))))

(declare-fun b!505912 () Bool)

(declare-fun res!306923 () Bool)

(assert (=> b!505912 (=> res!306923 e!296125)))

(assert (=> b!505912 (= res!306923 e!296127)))

(declare-fun res!306920 () Bool)

(assert (=> b!505912 (=> (not res!306920) (not e!296127))))

(assert (=> b!505912 (= res!306920 (bvsgt #b00000000000000000000000000000000 (x!47586 lt!230711)))))

(declare-fun b!505913 () Bool)

(assert (=> b!505913 (= e!296130 (= (seekEntryOrOpen!0 (select (arr!15630 a!3235) j!176) a!3235 mask!3524) (Found!4097 j!176)))))

(declare-fun b!505914 () Bool)

(assert (=> b!505914 (= e!296125 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!505914 (= (seekEntryOrOpen!0 lt!230715 lt!230719 mask!3524) lt!230713)))

(declare-fun lt!230722 () Unit!15464)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32500 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15464)

(assert (=> b!505914 (= lt!230722 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230717 #b00000000000000000000000000000000 (index!18578 lt!230711) (x!47586 lt!230711) mask!3524))))

(declare-fun b!505915 () Bool)

(assert (=> b!505915 (= e!296129 false)))

(declare-fun b!505916 () Bool)

(declare-fun Unit!15467 () Unit!15464)

(assert (=> b!505916 (= e!296131 Unit!15467)))

(declare-fun res!306910 () Bool)

(assert (=> start!45744 (=> (not res!306910) (not e!296132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45744 (= res!306910 (validMask!0 mask!3524))))

(assert (=> start!45744 e!296132))

(assert (=> start!45744 true))

(declare-fun array_inv!11426 (array!32500) Bool)

(assert (=> start!45744 (array_inv!11426 a!3235)))

(declare-fun b!505908 () Bool)

(declare-fun res!306909 () Bool)

(assert (=> b!505908 (=> (not res!306909) (not e!296132))))

(assert (=> b!505908 (= res!306909 (and (= (size!15994 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15994 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15994 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45744 res!306910) b!505908))

(assert (= (and b!505908 res!306909) b!505904))

(assert (= (and b!505904 res!306915) b!505911))

(assert (= (and b!505911 res!306922) b!505905))

(assert (= (and b!505905 res!306921) b!505901))

(assert (= (and b!505901 res!306913) b!505906))

(assert (= (and b!505906 res!306914) b!505910))

(assert (= (and b!505910 res!306919) b!505900))

(assert (= (and b!505900 res!306916) b!505913))

(assert (= (and b!505900 (not res!306912)) b!505903))

(assert (= (and b!505903 c!59774) b!505909))

(assert (= (and b!505903 (not c!59774)) b!505916))

(assert (= (and b!505909 res!306918) b!505915))

(assert (= (and b!505903 (not res!306911)) b!505912))

(assert (= (and b!505912 res!306920) b!505907))

(assert (= (and b!505912 (not res!306923)) b!505902))

(assert (= (and b!505902 (not res!306917)) b!505914))

(declare-fun m!486555 () Bool)

(assert (=> start!45744 m!486555))

(declare-fun m!486557 () Bool)

(assert (=> start!45744 m!486557))

(declare-fun m!486559 () Bool)

(assert (=> b!505904 m!486559))

(assert (=> b!505904 m!486559))

(declare-fun m!486561 () Bool)

(assert (=> b!505904 m!486561))

(assert (=> b!505913 m!486559))

(assert (=> b!505913 m!486559))

(declare-fun m!486563 () Bool)

(assert (=> b!505913 m!486563))

(assert (=> b!505907 m!486559))

(assert (=> b!505907 m!486559))

(declare-fun m!486565 () Bool)

(assert (=> b!505907 m!486565))

(declare-fun m!486567 () Bool)

(assert (=> b!505905 m!486567))

(declare-fun m!486569 () Bool)

(assert (=> b!505900 m!486569))

(declare-fun m!486571 () Bool)

(assert (=> b!505900 m!486571))

(declare-fun m!486573 () Bool)

(assert (=> b!505900 m!486573))

(declare-fun m!486575 () Bool)

(assert (=> b!505900 m!486575))

(assert (=> b!505900 m!486559))

(declare-fun m!486577 () Bool)

(assert (=> b!505900 m!486577))

(assert (=> b!505900 m!486559))

(declare-fun m!486579 () Bool)

(assert (=> b!505900 m!486579))

(declare-fun m!486581 () Bool)

(assert (=> b!505900 m!486581))

(assert (=> b!505900 m!486559))

(declare-fun m!486583 () Bool)

(assert (=> b!505900 m!486583))

(declare-fun m!486585 () Bool)

(assert (=> b!505902 m!486585))

(declare-fun m!486587 () Bool)

(assert (=> b!505903 m!486587))

(declare-fun m!486589 () Bool)

(assert (=> b!505903 m!486589))

(assert (=> b!505903 m!486559))

(declare-fun m!486591 () Bool)

(assert (=> b!505911 m!486591))

(declare-fun m!486593 () Bool)

(assert (=> b!505901 m!486593))

(declare-fun m!486595 () Bool)

(assert (=> b!505910 m!486595))

(declare-fun m!486597 () Bool)

(assert (=> b!505909 m!486597))

(assert (=> b!505909 m!486585))

(declare-fun m!486599 () Bool)

(assert (=> b!505906 m!486599))

(declare-fun m!486601 () Bool)

(assert (=> b!505914 m!486601))

(declare-fun m!486603 () Bool)

(assert (=> b!505914 m!486603))

(push 1)

