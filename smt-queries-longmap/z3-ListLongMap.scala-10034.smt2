; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118310 () Bool)

(assert start!118310)

(declare-fun b!1383717 () Bool)

(declare-fun res!925312 () Bool)

(declare-fun e!784180 () Bool)

(assert (=> b!1383717 (=> (not res!925312) (not e!784180))))

(declare-datatypes ((array!94613 0))(
  ( (array!94614 (arr!45684 (Array (_ BitVec 32) (_ BitVec 64))) (size!46234 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94613)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383717 (= res!925312 (validKeyInArray!0 (select (arr!45684 a!2938) startIndex!16)))))

(declare-fun b!1383718 () Bool)

(declare-fun res!925313 () Bool)

(assert (=> b!1383718 (=> (not res!925313) (not e!784180))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383718 (= res!925313 (validKeyInArray!0 (select (arr!45684 a!2938) i!1065)))))

(declare-fun b!1383719 () Bool)

(declare-fun res!925314 () Bool)

(assert (=> b!1383719 (=> (not res!925314) (not e!784180))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94613 (_ BitVec 32)) Bool)

(assert (=> b!1383719 (= res!925314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383721 () Bool)

(assert (=> b!1383721 (= e!784180 (not true))))

(declare-datatypes ((SeekEntryResult!10077 0))(
  ( (MissingZero!10077 (index!42679 (_ BitVec 32))) (Found!10077 (index!42680 (_ BitVec 32))) (Intermediate!10077 (undefined!10889 Bool) (index!42681 (_ BitVec 32)) (x!124190 (_ BitVec 32))) (Undefined!10077) (MissingVacant!10077 (index!42682 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94613 (_ BitVec 32)) SeekEntryResult!10077)

(assert (=> b!1383721 (= (seekEntryOrOpen!0 (select (arr!45684 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45684 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94614 (store (arr!45684 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46234 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46091 0))(
  ( (Unit!46092) )
))
(declare-fun lt!608655 () Unit!46091)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46091)

(assert (=> b!1383721 (= lt!608655 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383722 () Bool)

(declare-fun res!925310 () Bool)

(assert (=> b!1383722 (=> (not res!925310) (not e!784180))))

(assert (=> b!1383722 (= res!925310 (and (= (size!46234 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46234 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46234 a!2938))))))

(declare-fun b!1383723 () Bool)

(declare-fun res!925309 () Bool)

(assert (=> b!1383723 (=> (not res!925309) (not e!784180))))

(assert (=> b!1383723 (= res!925309 (and (not (= (select (arr!45684 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45684 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383720 () Bool)

(declare-fun res!925311 () Bool)

(assert (=> b!1383720 (=> (not res!925311) (not e!784180))))

(declare-datatypes ((List!32212 0))(
  ( (Nil!32209) (Cons!32208 (h!33417 (_ BitVec 64)) (t!46906 List!32212)) )
))
(declare-fun arrayNoDuplicates!0 (array!94613 (_ BitVec 32) List!32212) Bool)

(assert (=> b!1383720 (= res!925311 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32209))))

(declare-fun res!925315 () Bool)

(assert (=> start!118310 (=> (not res!925315) (not e!784180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118310 (= res!925315 (validMask!0 mask!2987))))

(assert (=> start!118310 e!784180))

(assert (=> start!118310 true))

(declare-fun array_inv!34712 (array!94613) Bool)

(assert (=> start!118310 (array_inv!34712 a!2938)))

(assert (= (and start!118310 res!925315) b!1383722))

(assert (= (and b!1383722 res!925310) b!1383718))

(assert (= (and b!1383718 res!925313) b!1383720))

(assert (= (and b!1383720 res!925311) b!1383719))

(assert (= (and b!1383719 res!925314) b!1383723))

(assert (= (and b!1383723 res!925309) b!1383717))

(assert (= (and b!1383717 res!925312) b!1383721))

(declare-fun m!1268879 () Bool)

(assert (=> b!1383719 m!1268879))

(declare-fun m!1268881 () Bool)

(assert (=> start!118310 m!1268881))

(declare-fun m!1268883 () Bool)

(assert (=> start!118310 m!1268883))

(declare-fun m!1268885 () Bool)

(assert (=> b!1383718 m!1268885))

(assert (=> b!1383718 m!1268885))

(declare-fun m!1268887 () Bool)

(assert (=> b!1383718 m!1268887))

(declare-fun m!1268889 () Bool)

(assert (=> b!1383721 m!1268889))

(assert (=> b!1383721 m!1268889))

(declare-fun m!1268891 () Bool)

(assert (=> b!1383721 m!1268891))

(declare-fun m!1268893 () Bool)

(assert (=> b!1383721 m!1268893))

(declare-fun m!1268895 () Bool)

(assert (=> b!1383721 m!1268895))

(declare-fun m!1268897 () Bool)

(assert (=> b!1383721 m!1268897))

(assert (=> b!1383721 m!1268897))

(declare-fun m!1268899 () Bool)

(assert (=> b!1383721 m!1268899))

(assert (=> b!1383717 m!1268897))

(assert (=> b!1383717 m!1268897))

(declare-fun m!1268901 () Bool)

(assert (=> b!1383717 m!1268901))

(assert (=> b!1383723 m!1268885))

(declare-fun m!1268903 () Bool)

(assert (=> b!1383720 m!1268903))

(check-sat (not b!1383719) (not b!1383721) (not b!1383718) (not b!1383720) (not start!118310) (not b!1383717))
