; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131170 () Bool)

(assert start!131170)

(declare-fun b!1536155 () Bool)

(declare-fun res!1051761 () Bool)

(declare-fun e!855763 () Bool)

(assert (=> b!1536155 (=> (not res!1051761) (not e!855763))))

(declare-datatypes ((array!102005 0))(
  ( (array!102006 (arr!49212 (Array (_ BitVec 32) (_ BitVec 64))) (size!49763 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102005)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536155 (= res!1051761 (validKeyInArray!0 (select (arr!49212 a!2792) i!951)))))

(declare-fun b!1536156 () Bool)

(declare-fun res!1051758 () Bool)

(assert (=> b!1536156 (=> (not res!1051758) (not e!855763))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1536156 (= res!1051758 (validKeyInArray!0 (select (arr!49212 a!2792) j!64)))))

(declare-fun b!1536157 () Bool)

(declare-fun res!1051757 () Bool)

(assert (=> b!1536157 (=> (not res!1051757) (not e!855763))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102005 (_ BitVec 32)) Bool)

(assert (=> b!1536157 (= res!1051757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536158 () Bool)

(declare-fun res!1051755 () Bool)

(assert (=> b!1536158 (=> (not res!1051755) (not e!855763))))

(assert (=> b!1536158 (= res!1051755 (and (= (size!49763 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49763 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49763 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536159 () Bool)

(declare-fun res!1051756 () Bool)

(assert (=> b!1536159 (=> (not res!1051756) (not e!855763))))

(declare-datatypes ((List!35673 0))(
  ( (Nil!35670) (Cons!35669 (h!37132 (_ BitVec 64)) (t!50359 List!35673)) )
))
(declare-fun arrayNoDuplicates!0 (array!102005 (_ BitVec 32) List!35673) Bool)

(assert (=> b!1536159 (= res!1051756 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35670))))

(declare-fun res!1051759 () Bool)

(assert (=> start!131170 (=> (not res!1051759) (not e!855763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131170 (= res!1051759 (validMask!0 mask!2480))))

(assert (=> start!131170 e!855763))

(assert (=> start!131170 true))

(declare-fun array_inv!38493 (array!102005) Bool)

(assert (=> start!131170 (array_inv!38493 a!2792)))

(declare-fun b!1536160 () Bool)

(declare-fun res!1051760 () Bool)

(assert (=> b!1536160 (=> (not res!1051760) (not e!855763))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536160 (= res!1051760 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49763 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49763 a!2792)) (= (select (arr!49212 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536161 () Bool)

(assert (=> b!1536161 (= e!855763 false)))

(declare-datatypes ((SeekEntryResult!13239 0))(
  ( (MissingZero!13239 (index!55351 (_ BitVec 32))) (Found!13239 (index!55352 (_ BitVec 32))) (Intermediate!13239 (undefined!14051 Bool) (index!55353 (_ BitVec 32)) (x!137320 (_ BitVec 32))) (Undefined!13239) (MissingVacant!13239 (index!55354 (_ BitVec 32))) )
))
(declare-fun lt!664695 () SeekEntryResult!13239)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102005 (_ BitVec 32)) SeekEntryResult!13239)

(assert (=> b!1536161 (= lt!664695 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49212 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131170 res!1051759) b!1536158))

(assert (= (and b!1536158 res!1051755) b!1536155))

(assert (= (and b!1536155 res!1051761) b!1536156))

(assert (= (and b!1536156 res!1051758) b!1536157))

(assert (= (and b!1536157 res!1051757) b!1536159))

(assert (= (and b!1536159 res!1051756) b!1536160))

(assert (= (and b!1536160 res!1051760) b!1536161))

(declare-fun m!1418711 () Bool)

(assert (=> b!1536160 m!1418711))

(declare-fun m!1418713 () Bool)

(assert (=> b!1536159 m!1418713))

(declare-fun m!1418715 () Bool)

(assert (=> b!1536161 m!1418715))

(assert (=> b!1536161 m!1418715))

(declare-fun m!1418717 () Bool)

(assert (=> b!1536161 m!1418717))

(declare-fun m!1418719 () Bool)

(assert (=> start!131170 m!1418719))

(declare-fun m!1418721 () Bool)

(assert (=> start!131170 m!1418721))

(assert (=> b!1536156 m!1418715))

(assert (=> b!1536156 m!1418715))

(declare-fun m!1418723 () Bool)

(assert (=> b!1536156 m!1418723))

(declare-fun m!1418725 () Bool)

(assert (=> b!1536157 m!1418725))

(declare-fun m!1418727 () Bool)

(assert (=> b!1536155 m!1418727))

(assert (=> b!1536155 m!1418727))

(declare-fun m!1418729 () Bool)

(assert (=> b!1536155 m!1418729))

(push 1)

(assert (not b!1536161))

(assert (not start!131170))

(assert (not b!1536156))

(assert (not b!1536159))

(assert (not b!1536155))

(assert (not b!1536157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

