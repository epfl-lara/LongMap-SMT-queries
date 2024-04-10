; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118382 () Bool)

(assert start!118382)

(declare-fun b!1384704 () Bool)

(declare-fun res!926095 () Bool)

(declare-fun e!784627 () Bool)

(assert (=> b!1384704 (=> (not res!926095) (not e!784627))))

(declare-datatypes ((array!94685 0))(
  ( (array!94686 (arr!45720 (Array (_ BitVec 32) (_ BitVec 64))) (size!46270 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94685)

(declare-datatypes ((List!32248 0))(
  ( (Nil!32245) (Cons!32244 (h!33453 (_ BitVec 64)) (t!46942 List!32248)) )
))
(declare-fun arrayNoDuplicates!0 (array!94685 (_ BitVec 32) List!32248) Bool)

(assert (=> b!1384704 (= res!926095 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32245))))

(declare-fun b!1384705 () Bool)

(declare-fun res!926090 () Bool)

(assert (=> b!1384705 (=> (not res!926090) (not e!784627))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384705 (= res!926090 (and (not (= (select (arr!45720 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45720 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384706 () Bool)

(declare-fun e!784630 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384706 (= e!784630 (validKeyInArray!0 (select (arr!45720 a!2938) startIndex!16)))))

(declare-fun b!1384707 () Bool)

(declare-fun res!926089 () Bool)

(assert (=> b!1384707 (=> (not res!926089) (not e!784627))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94685 (_ BitVec 32)) Bool)

(assert (=> b!1384707 (= res!926089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384708 () Bool)

(declare-fun res!926092 () Bool)

(assert (=> b!1384708 (=> (not res!926092) (not e!784627))))

(assert (=> b!1384708 (= res!926092 (validKeyInArray!0 (select (arr!45720 a!2938) i!1065)))))

(declare-fun b!1384709 () Bool)

(declare-fun res!926094 () Bool)

(assert (=> b!1384709 (=> (not res!926094) (not e!784627))))

(assert (=> b!1384709 (= res!926094 (and (= (size!46270 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46270 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46270 a!2938))))))

(declare-fun res!926093 () Bool)

(assert (=> start!118382 (=> (not res!926093) (not e!784627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118382 (= res!926093 (validMask!0 mask!2987))))

(assert (=> start!118382 e!784627))

(assert (=> start!118382 true))

(declare-fun array_inv!34748 (array!94685) Bool)

(assert (=> start!118382 (array_inv!34748 a!2938)))

(declare-fun b!1384710 () Bool)

(declare-datatypes ((Unit!46197 0))(
  ( (Unit!46198) )
))
(declare-fun e!784629 () Unit!46197)

(declare-fun Unit!46199 () Unit!46197)

(assert (=> b!1384710 (= e!784629 Unit!46199)))

(declare-fun b!1384711 () Bool)

(declare-fun e!784628 () Bool)

(assert (=> b!1384711 (= e!784627 e!784628)))

(declare-fun res!926091 () Bool)

(assert (=> b!1384711 (=> (not res!926091) (not e!784628))))

(assert (=> b!1384711 (= res!926091 (and (bvslt startIndex!16 (bvsub (size!46270 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609018 () Unit!46197)

(assert (=> b!1384711 (= lt!609018 e!784629)))

(declare-fun c!128748 () Bool)

(assert (=> b!1384711 (= c!128748 e!784630)))

(declare-fun res!926088 () Bool)

(assert (=> b!1384711 (=> (not res!926088) (not e!784630))))

(assert (=> b!1384711 (= res!926088 (not (= startIndex!16 i!1065)))))

(declare-fun lt!609020 () array!94685)

(assert (=> b!1384711 (= lt!609020 (array!94686 (store (arr!45720 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46270 a!2938)))))

(declare-fun b!1384712 () Bool)

(assert (=> b!1384712 (= e!784628 (not true))))

(assert (=> b!1384712 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609020 mask!2987)))

(declare-fun lt!609017 () Unit!46197)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46197)

(assert (=> b!1384712 (= lt!609017 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384713 () Bool)

(declare-fun lt!609021 () Unit!46197)

(assert (=> b!1384713 (= e!784629 lt!609021)))

(declare-fun lt!609019 () Unit!46197)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46197)

(assert (=> b!1384713 (= lt!609019 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10113 0))(
  ( (MissingZero!10113 (index!42823 (_ BitVec 32))) (Found!10113 (index!42824 (_ BitVec 32))) (Intermediate!10113 (undefined!10925 Bool) (index!42825 (_ BitVec 32)) (x!124322 (_ BitVec 32))) (Undefined!10113) (MissingVacant!10113 (index!42826 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94685 (_ BitVec 32)) SeekEntryResult!10113)

(assert (=> b!1384713 (= (seekEntryOrOpen!0 (select (arr!45720 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45720 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609020 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46197)

(assert (=> b!1384713 (= lt!609021 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384713 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118382 res!926093) b!1384709))

(assert (= (and b!1384709 res!926094) b!1384708))

(assert (= (and b!1384708 res!926092) b!1384704))

(assert (= (and b!1384704 res!926095) b!1384707))

(assert (= (and b!1384707 res!926089) b!1384705))

(assert (= (and b!1384705 res!926090) b!1384711))

(assert (= (and b!1384711 res!926088) b!1384706))

(assert (= (and b!1384711 c!128748) b!1384713))

(assert (= (and b!1384711 (not c!128748)) b!1384710))

(assert (= (and b!1384711 res!926091) b!1384712))

(declare-fun m!1269979 () Bool)

(assert (=> b!1384712 m!1269979))

(declare-fun m!1269981 () Bool)

(assert (=> b!1384712 m!1269981))

(declare-fun m!1269983 () Bool)

(assert (=> b!1384707 m!1269983))

(declare-fun m!1269985 () Bool)

(assert (=> b!1384706 m!1269985))

(assert (=> b!1384706 m!1269985))

(declare-fun m!1269987 () Bool)

(assert (=> b!1384706 m!1269987))

(declare-fun m!1269989 () Bool)

(assert (=> start!118382 m!1269989))

(declare-fun m!1269991 () Bool)

(assert (=> start!118382 m!1269991))

(declare-fun m!1269993 () Bool)

(assert (=> b!1384705 m!1269993))

(assert (=> b!1384708 m!1269993))

(assert (=> b!1384708 m!1269993))

(declare-fun m!1269995 () Bool)

(assert (=> b!1384708 m!1269995))

(declare-fun m!1269997 () Bool)

(assert (=> b!1384713 m!1269997))

(declare-fun m!1269999 () Bool)

(assert (=> b!1384713 m!1269999))

(assert (=> b!1384713 m!1269999))

(declare-fun m!1270001 () Bool)

(assert (=> b!1384713 m!1270001))

(declare-fun m!1270003 () Bool)

(assert (=> b!1384713 m!1270003))

(declare-fun m!1270005 () Bool)

(assert (=> b!1384713 m!1270005))

(assert (=> b!1384713 m!1269985))

(declare-fun m!1270007 () Bool)

(assert (=> b!1384713 m!1270007))

(assert (=> b!1384713 m!1269985))

(declare-fun m!1270009 () Bool)

(assert (=> b!1384713 m!1270009))

(declare-fun m!1270011 () Bool)

(assert (=> b!1384704 m!1270011))

(assert (=> b!1384711 m!1270003))

(check-sat (not b!1384708) (not b!1384706) (not b!1384707) (not start!118382) (not b!1384704) (not b!1384712) (not b!1384713))
(check-sat)
