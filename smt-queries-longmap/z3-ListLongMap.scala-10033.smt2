; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118304 () Bool)

(assert start!118304)

(declare-fun b!1383654 () Bool)

(declare-fun res!925250 () Bool)

(declare-fun e!784163 () Bool)

(assert (=> b!1383654 (=> (not res!925250) (not e!784163))))

(declare-datatypes ((array!94607 0))(
  ( (array!94608 (arr!45681 (Array (_ BitVec 32) (_ BitVec 64))) (size!46231 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94607)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383654 (= res!925250 (validKeyInArray!0 (select (arr!45681 a!2938) i!1065)))))

(declare-fun b!1383655 () Bool)

(declare-fun res!925246 () Bool)

(assert (=> b!1383655 (=> (not res!925246) (not e!784163))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94607 (_ BitVec 32)) Bool)

(assert (=> b!1383655 (= res!925246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!925248 () Bool)

(assert (=> start!118304 (=> (not res!925248) (not e!784163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118304 (= res!925248 (validMask!0 mask!2987))))

(assert (=> start!118304 e!784163))

(assert (=> start!118304 true))

(declare-fun array_inv!34709 (array!94607) Bool)

(assert (=> start!118304 (array_inv!34709 a!2938)))

(declare-fun b!1383656 () Bool)

(declare-fun res!925251 () Bool)

(assert (=> b!1383656 (=> (not res!925251) (not e!784163))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383656 (= res!925251 (validKeyInArray!0 (select (arr!45681 a!2938) startIndex!16)))))

(declare-fun b!1383657 () Bool)

(declare-fun res!925252 () Bool)

(assert (=> b!1383657 (=> (not res!925252) (not e!784163))))

(assert (=> b!1383657 (= res!925252 (and (not (= (select (arr!45681 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45681 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1383658 () Bool)

(assert (=> b!1383658 (= e!784163 (not true))))

(declare-datatypes ((SeekEntryResult!10074 0))(
  ( (MissingZero!10074 (index!42667 (_ BitVec 32))) (Found!10074 (index!42668 (_ BitVec 32))) (Intermediate!10074 (undefined!10886 Bool) (index!42669 (_ BitVec 32)) (x!124179 (_ BitVec 32))) (Undefined!10074) (MissingVacant!10074 (index!42670 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94607 (_ BitVec 32)) SeekEntryResult!10074)

(assert (=> b!1383658 (= (seekEntryOrOpen!0 (select (arr!45681 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45681 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94608 (store (arr!45681 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46231 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46085 0))(
  ( (Unit!46086) )
))
(declare-fun lt!608646 () Unit!46085)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46085)

(assert (=> b!1383658 (= lt!608646 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383659 () Bool)

(declare-fun res!925249 () Bool)

(assert (=> b!1383659 (=> (not res!925249) (not e!784163))))

(assert (=> b!1383659 (= res!925249 (and (= (size!46231 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46231 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46231 a!2938))))))

(declare-fun b!1383660 () Bool)

(declare-fun res!925247 () Bool)

(assert (=> b!1383660 (=> (not res!925247) (not e!784163))))

(declare-datatypes ((List!32209 0))(
  ( (Nil!32206) (Cons!32205 (h!33414 (_ BitVec 64)) (t!46903 List!32209)) )
))
(declare-fun arrayNoDuplicates!0 (array!94607 (_ BitVec 32) List!32209) Bool)

(assert (=> b!1383660 (= res!925247 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32206))))

(assert (= (and start!118304 res!925248) b!1383659))

(assert (= (and b!1383659 res!925249) b!1383654))

(assert (= (and b!1383654 res!925250) b!1383660))

(assert (= (and b!1383660 res!925247) b!1383655))

(assert (= (and b!1383655 res!925246) b!1383657))

(assert (= (and b!1383657 res!925252) b!1383656))

(assert (= (and b!1383656 res!925251) b!1383658))

(declare-fun m!1268801 () Bool)

(assert (=> b!1383657 m!1268801))

(declare-fun m!1268803 () Bool)

(assert (=> b!1383655 m!1268803))

(declare-fun m!1268805 () Bool)

(assert (=> b!1383656 m!1268805))

(assert (=> b!1383656 m!1268805))

(declare-fun m!1268807 () Bool)

(assert (=> b!1383656 m!1268807))

(declare-fun m!1268809 () Bool)

(assert (=> start!118304 m!1268809))

(declare-fun m!1268811 () Bool)

(assert (=> start!118304 m!1268811))

(declare-fun m!1268813 () Bool)

(assert (=> b!1383658 m!1268813))

(assert (=> b!1383658 m!1268813))

(declare-fun m!1268815 () Bool)

(assert (=> b!1383658 m!1268815))

(declare-fun m!1268817 () Bool)

(assert (=> b!1383658 m!1268817))

(declare-fun m!1268819 () Bool)

(assert (=> b!1383658 m!1268819))

(assert (=> b!1383658 m!1268805))

(assert (=> b!1383658 m!1268805))

(declare-fun m!1268821 () Bool)

(assert (=> b!1383658 m!1268821))

(assert (=> b!1383654 m!1268801))

(assert (=> b!1383654 m!1268801))

(declare-fun m!1268823 () Bool)

(assert (=> b!1383654 m!1268823))

(declare-fun m!1268825 () Bool)

(assert (=> b!1383660 m!1268825))

(check-sat (not start!118304) (not b!1383660) (not b!1383654) (not b!1383655) (not b!1383656) (not b!1383658))
