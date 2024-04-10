; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118376 () Bool)

(assert start!118376)

(declare-fun b!1384614 () Bool)

(declare-fun res!926022 () Bool)

(declare-fun e!784586 () Bool)

(assert (=> b!1384614 (=> (not res!926022) (not e!784586))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94679 0))(
  ( (array!94680 (arr!45717 (Array (_ BitVec 32) (_ BitVec 64))) (size!46267 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94679)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384614 (= res!926022 (and (= (size!46267 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46267 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46267 a!2938))))))

(declare-fun b!1384616 () Bool)

(declare-fun e!784585 () Bool)

(assert (=> b!1384616 (= e!784585 (not true))))

(declare-fun lt!608974 () array!94679)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94679 (_ BitVec 32)) Bool)

(assert (=> b!1384616 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608974 mask!2987)))

(declare-datatypes ((Unit!46188 0))(
  ( (Unit!46189) )
))
(declare-fun lt!608976 () Unit!46188)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46188)

(assert (=> b!1384616 (= lt!608976 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384617 () Bool)

(declare-fun e!784583 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384617 (= e!784583 (validKeyInArray!0 (select (arr!45717 a!2938) startIndex!16)))))

(declare-fun b!1384618 () Bool)

(declare-fun e!784582 () Unit!46188)

(declare-fun lt!608975 () Unit!46188)

(assert (=> b!1384618 (= e!784582 lt!608975)))

(declare-fun lt!608972 () Unit!46188)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46188)

(assert (=> b!1384618 (= lt!608972 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10110 0))(
  ( (MissingZero!10110 (index!42811 (_ BitVec 32))) (Found!10110 (index!42812 (_ BitVec 32))) (Intermediate!10110 (undefined!10922 Bool) (index!42813 (_ BitVec 32)) (x!124311 (_ BitVec 32))) (Undefined!10110) (MissingVacant!10110 (index!42814 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94679 (_ BitVec 32)) SeekEntryResult!10110)

(assert (=> b!1384618 (= (seekEntryOrOpen!0 (select (arr!45717 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45717 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608974 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46188)

(assert (=> b!1384618 (= lt!608975 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384618 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384619 () Bool)

(declare-fun res!926016 () Bool)

(assert (=> b!1384619 (=> (not res!926016) (not e!784586))))

(declare-datatypes ((List!32245 0))(
  ( (Nil!32242) (Cons!32241 (h!33450 (_ BitVec 64)) (t!46939 List!32245)) )
))
(declare-fun arrayNoDuplicates!0 (array!94679 (_ BitVec 32) List!32245) Bool)

(assert (=> b!1384619 (= res!926016 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32242))))

(declare-fun b!1384620 () Bool)

(assert (=> b!1384620 (= e!784586 e!784585)))

(declare-fun res!926021 () Bool)

(assert (=> b!1384620 (=> (not res!926021) (not e!784585))))

(assert (=> b!1384620 (= res!926021 (and (bvslt startIndex!16 (bvsub (size!46267 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!608973 () Unit!46188)

(assert (=> b!1384620 (= lt!608973 e!784582)))

(declare-fun c!128739 () Bool)

(assert (=> b!1384620 (= c!128739 e!784583)))

(declare-fun res!926020 () Bool)

(assert (=> b!1384620 (=> (not res!926020) (not e!784583))))

(assert (=> b!1384620 (= res!926020 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384620 (= lt!608974 (array!94680 (store (arr!45717 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46267 a!2938)))))

(declare-fun b!1384621 () Bool)

(declare-fun res!926023 () Bool)

(assert (=> b!1384621 (=> (not res!926023) (not e!784586))))

(assert (=> b!1384621 (= res!926023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384622 () Bool)

(declare-fun Unit!46190 () Unit!46188)

(assert (=> b!1384622 (= e!784582 Unit!46190)))

(declare-fun b!1384623 () Bool)

(declare-fun res!926019 () Bool)

(assert (=> b!1384623 (=> (not res!926019) (not e!784586))))

(assert (=> b!1384623 (= res!926019 (validKeyInArray!0 (select (arr!45717 a!2938) i!1065)))))

(declare-fun b!1384615 () Bool)

(declare-fun res!926018 () Bool)

(assert (=> b!1384615 (=> (not res!926018) (not e!784586))))

(assert (=> b!1384615 (= res!926018 (and (not (= (select (arr!45717 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45717 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!926017 () Bool)

(assert (=> start!118376 (=> (not res!926017) (not e!784586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118376 (= res!926017 (validMask!0 mask!2987))))

(assert (=> start!118376 e!784586))

(assert (=> start!118376 true))

(declare-fun array_inv!34745 (array!94679) Bool)

(assert (=> start!118376 (array_inv!34745 a!2938)))

(assert (= (and start!118376 res!926017) b!1384614))

(assert (= (and b!1384614 res!926022) b!1384623))

(assert (= (and b!1384623 res!926019) b!1384619))

(assert (= (and b!1384619 res!926016) b!1384621))

(assert (= (and b!1384621 res!926023) b!1384615))

(assert (= (and b!1384615 res!926018) b!1384620))

(assert (= (and b!1384620 res!926020) b!1384617))

(assert (= (and b!1384620 c!128739) b!1384618))

(assert (= (and b!1384620 (not c!128739)) b!1384622))

(assert (= (and b!1384620 res!926021) b!1384616))

(declare-fun m!1269877 () Bool)

(assert (=> b!1384617 m!1269877))

(assert (=> b!1384617 m!1269877))

(declare-fun m!1269879 () Bool)

(assert (=> b!1384617 m!1269879))

(declare-fun m!1269881 () Bool)

(assert (=> b!1384616 m!1269881))

(declare-fun m!1269883 () Bool)

(assert (=> b!1384616 m!1269883))

(declare-fun m!1269885 () Bool)

(assert (=> start!118376 m!1269885))

(declare-fun m!1269887 () Bool)

(assert (=> start!118376 m!1269887))

(declare-fun m!1269889 () Bool)

(assert (=> b!1384623 m!1269889))

(assert (=> b!1384623 m!1269889))

(declare-fun m!1269891 () Bool)

(assert (=> b!1384623 m!1269891))

(assert (=> b!1384615 m!1269889))

(declare-fun m!1269893 () Bool)

(assert (=> b!1384621 m!1269893))

(declare-fun m!1269895 () Bool)

(assert (=> b!1384618 m!1269895))

(declare-fun m!1269897 () Bool)

(assert (=> b!1384618 m!1269897))

(declare-fun m!1269899 () Bool)

(assert (=> b!1384618 m!1269899))

(declare-fun m!1269901 () Bool)

(assert (=> b!1384618 m!1269901))

(assert (=> b!1384618 m!1269897))

(declare-fun m!1269903 () Bool)

(assert (=> b!1384618 m!1269903))

(assert (=> b!1384618 m!1269877))

(declare-fun m!1269905 () Bool)

(assert (=> b!1384618 m!1269905))

(assert (=> b!1384618 m!1269877))

(declare-fun m!1269907 () Bool)

(assert (=> b!1384618 m!1269907))

(assert (=> b!1384620 m!1269899))

(declare-fun m!1269909 () Bool)

(assert (=> b!1384619 m!1269909))

(check-sat (not start!118376) (not b!1384617) (not b!1384623) (not b!1384616) (not b!1384618) (not b!1384621) (not b!1384619))
(check-sat)
