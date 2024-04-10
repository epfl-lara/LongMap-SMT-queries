; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118318 () Bool)

(assert start!118318)

(declare-fun b!1383817 () Bool)

(declare-fun res!925394 () Bool)

(declare-fun e!784222 () Bool)

(assert (=> b!1383817 (=> (not res!925394) (not e!784222))))

(declare-datatypes ((array!94621 0))(
  ( (array!94622 (arr!45688 (Array (_ BitVec 32) (_ BitVec 64))) (size!46238 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94621)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383817 (= res!925394 (and (not (= (select (arr!45688 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45688 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383818 () Bool)

(declare-datatypes ((Unit!46101 0))(
  ( (Unit!46102) )
))
(declare-fun e!784221 () Unit!46101)

(declare-fun lt!608684 () Unit!46101)

(assert (=> b!1383818 (= e!784221 lt!608684)))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lt!608683 () Unit!46101)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46101)

(assert (=> b!1383818 (= lt!608683 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10081 0))(
  ( (MissingZero!10081 (index!42695 (_ BitVec 32))) (Found!10081 (index!42696 (_ BitVec 32))) (Intermediate!10081 (undefined!10893 Bool) (index!42697 (_ BitVec 32)) (x!124202 (_ BitVec 32))) (Undefined!10081) (MissingVacant!10081 (index!42698 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94621 (_ BitVec 32)) SeekEntryResult!10081)

(assert (=> b!1383818 (= (seekEntryOrOpen!0 (select (arr!45688 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45688 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94622 (store (arr!45688 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46238 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46101)

(assert (=> b!1383818 (= lt!608684 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94621 (_ BitVec 32)) Bool)

(assert (=> b!1383818 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1383819 () Bool)

(assert (=> b!1383819 (= e!784222 false)))

(declare-fun lt!608685 () Unit!46101)

(assert (=> b!1383819 (= lt!608685 e!784221)))

(declare-fun c!128652 () Bool)

(declare-fun e!784220 () Bool)

(assert (=> b!1383819 (= c!128652 e!784220)))

(declare-fun res!925393 () Bool)

(assert (=> b!1383819 (=> (not res!925393) (not e!784220))))

(assert (=> b!1383819 (= res!925393 (not (= startIndex!16 i!1065)))))

(declare-fun b!1383820 () Bool)

(declare-fun res!925395 () Bool)

(assert (=> b!1383820 (=> (not res!925395) (not e!784222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383820 (= res!925395 (validKeyInArray!0 (select (arr!45688 a!2938) i!1065)))))

(declare-fun b!1383821 () Bool)

(declare-fun res!925399 () Bool)

(assert (=> b!1383821 (=> (not res!925399) (not e!784222))))

(assert (=> b!1383821 (= res!925399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!925397 () Bool)

(assert (=> start!118318 (=> (not res!925397) (not e!784222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118318 (= res!925397 (validMask!0 mask!2987))))

(assert (=> start!118318 e!784222))

(assert (=> start!118318 true))

(declare-fun array_inv!34716 (array!94621) Bool)

(assert (=> start!118318 (array_inv!34716 a!2938)))

(declare-fun b!1383822 () Bool)

(declare-fun Unit!46103 () Unit!46101)

(assert (=> b!1383822 (= e!784221 Unit!46103)))

(declare-fun b!1383823 () Bool)

(declare-fun res!925396 () Bool)

(assert (=> b!1383823 (=> (not res!925396) (not e!784222))))

(assert (=> b!1383823 (= res!925396 (and (= (size!46238 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46238 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46238 a!2938))))))

(declare-fun b!1383824 () Bool)

(declare-fun res!925398 () Bool)

(assert (=> b!1383824 (=> (not res!925398) (not e!784222))))

(declare-datatypes ((List!32216 0))(
  ( (Nil!32213) (Cons!32212 (h!33421 (_ BitVec 64)) (t!46910 List!32216)) )
))
(declare-fun arrayNoDuplicates!0 (array!94621 (_ BitVec 32) List!32216) Bool)

(assert (=> b!1383824 (= res!925398 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32213))))

(declare-fun b!1383825 () Bool)

(assert (=> b!1383825 (= e!784220 (validKeyInArray!0 (select (arr!45688 a!2938) startIndex!16)))))

(assert (= (and start!118318 res!925397) b!1383823))

(assert (= (and b!1383823 res!925396) b!1383820))

(assert (= (and b!1383820 res!925395) b!1383824))

(assert (= (and b!1383824 res!925398) b!1383821))

(assert (= (and b!1383821 res!925399) b!1383817))

(assert (= (and b!1383817 res!925394) b!1383819))

(assert (= (and b!1383819 res!925393) b!1383825))

(assert (= (and b!1383819 c!128652) b!1383818))

(assert (= (and b!1383819 (not c!128652)) b!1383822))

(declare-fun m!1268991 () Bool)

(assert (=> b!1383825 m!1268991))

(assert (=> b!1383825 m!1268991))

(declare-fun m!1268993 () Bool)

(assert (=> b!1383825 m!1268993))

(declare-fun m!1268995 () Bool)

(assert (=> b!1383817 m!1268995))

(declare-fun m!1268997 () Bool)

(assert (=> b!1383821 m!1268997))

(declare-fun m!1268999 () Bool)

(assert (=> b!1383818 m!1268999))

(declare-fun m!1269001 () Bool)

(assert (=> b!1383818 m!1269001))

(assert (=> b!1383818 m!1269001))

(declare-fun m!1269003 () Bool)

(assert (=> b!1383818 m!1269003))

(declare-fun m!1269005 () Bool)

(assert (=> b!1383818 m!1269005))

(declare-fun m!1269007 () Bool)

(assert (=> b!1383818 m!1269007))

(assert (=> b!1383818 m!1268991))

(declare-fun m!1269009 () Bool)

(assert (=> b!1383818 m!1269009))

(assert (=> b!1383818 m!1268991))

(declare-fun m!1269011 () Bool)

(assert (=> b!1383818 m!1269011))

(declare-fun m!1269013 () Bool)

(assert (=> start!118318 m!1269013))

(declare-fun m!1269015 () Bool)

(assert (=> start!118318 m!1269015))

(declare-fun m!1269017 () Bool)

(assert (=> b!1383824 m!1269017))

(assert (=> b!1383820 m!1268995))

(assert (=> b!1383820 m!1268995))

(declare-fun m!1269019 () Bool)

(assert (=> b!1383820 m!1269019))

(push 1)

(assert (not b!1383824))

(assert (not b!1383825))

(assert (not b!1383818))

(assert (not start!118318))

(assert (not b!1383821))

(assert (not b!1383820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

