; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118388 () Bool)

(assert start!118388)

(declare-fun b!1384794 () Bool)

(declare-fun res!926163 () Bool)

(declare-fun e!784676 () Bool)

(assert (=> b!1384794 (=> (not res!926163) (not e!784676))))

(declare-datatypes ((array!94691 0))(
  ( (array!94692 (arr!45723 (Array (_ BitVec 32) (_ BitVec 64))) (size!46273 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94691)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94691 (_ BitVec 32)) Bool)

(assert (=> b!1384794 (= res!926163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384795 () Bool)

(declare-fun e!784674 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384795 (= e!784674 (validKeyInArray!0 (select (arr!45723 a!2938) startIndex!16)))))

(declare-fun b!1384796 () Bool)

(declare-fun res!926161 () Bool)

(assert (=> b!1384796 (=> (not res!926161) (not e!784676))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384796 (= res!926161 (and (= (size!46273 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46273 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46273 a!2938))))))

(declare-fun b!1384797 () Bool)

(declare-fun res!926165 () Bool)

(assert (=> b!1384797 (=> (not res!926165) (not e!784676))))

(assert (=> b!1384797 (= res!926165 (and (not (= (select (arr!45723 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45723 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!926166 () Bool)

(assert (=> start!118388 (=> (not res!926166) (not e!784676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118388 (= res!926166 (validMask!0 mask!2987))))

(assert (=> start!118388 e!784676))

(assert (=> start!118388 true))

(declare-fun array_inv!34751 (array!94691) Bool)

(assert (=> start!118388 (array_inv!34751 a!2938)))

(declare-fun b!1384798 () Bool)

(declare-fun res!926167 () Bool)

(assert (=> b!1384798 (=> (not res!926167) (not e!784676))))

(declare-datatypes ((List!32251 0))(
  ( (Nil!32248) (Cons!32247 (h!33456 (_ BitVec 64)) (t!46945 List!32251)) )
))
(declare-fun arrayNoDuplicates!0 (array!94691 (_ BitVec 32) List!32251) Bool)

(assert (=> b!1384798 (= res!926167 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32248))))

(declare-fun b!1384799 () Bool)

(declare-fun res!926162 () Bool)

(assert (=> b!1384799 (=> (not res!926162) (not e!784676))))

(assert (=> b!1384799 (= res!926162 (validKeyInArray!0 (select (arr!45723 a!2938) i!1065)))))

(declare-fun b!1384800 () Bool)

(declare-fun e!784672 () Bool)

(assert (=> b!1384800 (= e!784672 (not (bvsle startIndex!16 (size!46273 a!2938))))))

(declare-fun lt!609064 () array!94691)

(assert (=> b!1384800 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609064 mask!2987)))

(declare-datatypes ((Unit!46206 0))(
  ( (Unit!46207) )
))
(declare-fun lt!609063 () Unit!46206)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46206)

(assert (=> b!1384800 (= lt!609063 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384801 () Bool)

(declare-fun e!784675 () Unit!46206)

(declare-fun lt!609062 () Unit!46206)

(assert (=> b!1384801 (= e!784675 lt!609062)))

(declare-fun lt!609066 () Unit!46206)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46206)

(assert (=> b!1384801 (= lt!609066 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10116 0))(
  ( (MissingZero!10116 (index!42835 (_ BitVec 32))) (Found!10116 (index!42836 (_ BitVec 32))) (Intermediate!10116 (undefined!10928 Bool) (index!42837 (_ BitVec 32)) (x!124333 (_ BitVec 32))) (Undefined!10116) (MissingVacant!10116 (index!42838 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94691 (_ BitVec 32)) SeekEntryResult!10116)

(assert (=> b!1384801 (= (seekEntryOrOpen!0 (select (arr!45723 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45723 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609064 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46206)

(assert (=> b!1384801 (= lt!609062 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384801 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384802 () Bool)

(declare-fun Unit!46208 () Unit!46206)

(assert (=> b!1384802 (= e!784675 Unit!46208)))

(declare-fun b!1384803 () Bool)

(assert (=> b!1384803 (= e!784676 e!784672)))

(declare-fun res!926164 () Bool)

(assert (=> b!1384803 (=> (not res!926164) (not e!784672))))

(assert (=> b!1384803 (= res!926164 (and (bvslt startIndex!16 (bvsub (size!46273 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609065 () Unit!46206)

(assert (=> b!1384803 (= lt!609065 e!784675)))

(declare-fun c!128757 () Bool)

(assert (=> b!1384803 (= c!128757 e!784674)))

(declare-fun res!926160 () Bool)

(assert (=> b!1384803 (=> (not res!926160) (not e!784674))))

(assert (=> b!1384803 (= res!926160 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384803 (= lt!609064 (array!94692 (store (arr!45723 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46273 a!2938)))))

(assert (= (and start!118388 res!926166) b!1384796))

(assert (= (and b!1384796 res!926161) b!1384799))

(assert (= (and b!1384799 res!926162) b!1384798))

(assert (= (and b!1384798 res!926167) b!1384794))

(assert (= (and b!1384794 res!926163) b!1384797))

(assert (= (and b!1384797 res!926165) b!1384803))

(assert (= (and b!1384803 res!926160) b!1384795))

(assert (= (and b!1384803 c!128757) b!1384801))

(assert (= (and b!1384803 (not c!128757)) b!1384802))

(assert (= (and b!1384803 res!926164) b!1384800))

(declare-fun m!1270081 () Bool)

(assert (=> b!1384795 m!1270081))

(assert (=> b!1384795 m!1270081))

(declare-fun m!1270083 () Bool)

(assert (=> b!1384795 m!1270083))

(declare-fun m!1270085 () Bool)

(assert (=> b!1384794 m!1270085))

(declare-fun m!1270087 () Bool)

(assert (=> start!118388 m!1270087))

(declare-fun m!1270089 () Bool)

(assert (=> start!118388 m!1270089))

(declare-fun m!1270091 () Bool)

(assert (=> b!1384798 m!1270091))

(declare-fun m!1270093 () Bool)

(assert (=> b!1384803 m!1270093))

(declare-fun m!1270095 () Bool)

(assert (=> b!1384800 m!1270095))

(declare-fun m!1270097 () Bool)

(assert (=> b!1384800 m!1270097))

(declare-fun m!1270099 () Bool)

(assert (=> b!1384799 m!1270099))

(assert (=> b!1384799 m!1270099))

(declare-fun m!1270101 () Bool)

(assert (=> b!1384799 m!1270101))

(declare-fun m!1270103 () Bool)

(assert (=> b!1384801 m!1270103))

(declare-fun m!1270105 () Bool)

(assert (=> b!1384801 m!1270105))

(assert (=> b!1384801 m!1270093))

(assert (=> b!1384801 m!1270081))

(declare-fun m!1270107 () Bool)

(assert (=> b!1384801 m!1270107))

(declare-fun m!1270109 () Bool)

(assert (=> b!1384801 m!1270109))

(assert (=> b!1384801 m!1270105))

(declare-fun m!1270111 () Bool)

(assert (=> b!1384801 m!1270111))

(assert (=> b!1384801 m!1270081))

(declare-fun m!1270113 () Bool)

(assert (=> b!1384801 m!1270113))

(assert (=> b!1384797 m!1270099))

(check-sat (not b!1384795) (not b!1384798) (not b!1384794) (not start!118388) (not b!1384801) (not b!1384799) (not b!1384800))
(check-sat)
