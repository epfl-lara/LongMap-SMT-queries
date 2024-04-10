; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131010 () Bool)

(assert start!131010)

(declare-fun b!1537100 () Bool)

(declare-fun res!1054195 () Bool)

(declare-fun e!855487 () Bool)

(assert (=> b!1537100 (=> (not res!1054195) (not e!855487))))

(declare-datatypes ((array!102108 0))(
  ( (array!102109 (arr!49270 (Array (_ BitVec 32) (_ BitVec 64))) (size!49820 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102108)

(declare-datatypes ((List!35744 0))(
  ( (Nil!35741) (Cons!35740 (h!37185 (_ BitVec 64)) (t!50438 List!35744)) )
))
(declare-fun arrayNoDuplicates!0 (array!102108 (_ BitVec 32) List!35744) Bool)

(assert (=> b!1537100 (= res!1054195 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35741))))

(declare-fun b!1537101 () Bool)

(declare-fun res!1054187 () Bool)

(assert (=> b!1537101 (=> (not res!1054187) (not e!855487))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537101 (= res!1054187 (and (= (size!49820 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49820 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49820 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537102 () Bool)

(declare-fun res!1054188 () Bool)

(assert (=> b!1537102 (=> (not res!1054188) (not e!855487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537102 (= res!1054188 (validKeyInArray!0 (select (arr!49270 a!2792) j!64)))))

(declare-fun b!1537103 () Bool)

(declare-fun e!855484 () Bool)

(declare-fun e!855485 () Bool)

(assert (=> b!1537103 (= e!855484 e!855485)))

(declare-fun res!1054194 () Bool)

(assert (=> b!1537103 (=> (not res!1054194) (not e!855485))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664591 () (_ BitVec 32))

(assert (=> b!1537103 (= res!1054194 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664591 #b00000000000000000000000000000000) (bvslt lt!664591 (size!49820 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537103 (= lt!664591 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537104 () Bool)

(declare-fun res!1054191 () Bool)

(assert (=> b!1537104 (=> (not res!1054191) (not e!855487))))

(assert (=> b!1537104 (= res!1054191 (validKeyInArray!0 (select (arr!49270 a!2792) i!951)))))

(declare-fun res!1054185 () Bool)

(assert (=> start!131010 (=> (not res!1054185) (not e!855487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131010 (= res!1054185 (validMask!0 mask!2480))))

(assert (=> start!131010 e!855487))

(assert (=> start!131010 true))

(declare-fun array_inv!38298 (array!102108) Bool)

(assert (=> start!131010 (array_inv!38298 a!2792)))

(declare-fun b!1537099 () Bool)

(declare-fun e!855483 () Bool)

(assert (=> b!1537099 (= e!855483 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-datatypes ((SeekEntryResult!13402 0))(
  ( (MissingZero!13402 (index!56003 (_ BitVec 32))) (Found!13402 (index!56004 (_ BitVec 32))) (Intermediate!13402 (undefined!14214 Bool) (index!56005 (_ BitVec 32)) (x!137732 (_ BitVec 32))) (Undefined!13402) (MissingVacant!13402 (index!56006 (_ BitVec 32))) )
))
(declare-fun lt!664594 () SeekEntryResult!13402)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102108 (_ BitVec 32)) SeekEntryResult!13402)

(assert (=> b!1537099 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664591 vacantIndex!5 (select (store (arr!49270 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102109 (store (arr!49270 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49820 a!2792)) mask!2480) lt!664594)))

(declare-datatypes ((Unit!51376 0))(
  ( (Unit!51377) )
))
(declare-fun lt!664592 () Unit!51376)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51376)

(assert (=> b!1537099 (= lt!664592 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664591 vacantIndex!5 mask!2480))))

(declare-fun b!1537105 () Bool)

(declare-fun res!1054193 () Bool)

(assert (=> b!1537105 (=> (not res!1054193) (not e!855487))))

(assert (=> b!1537105 (= res!1054193 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49820 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49820 a!2792)) (= (select (arr!49270 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537106 () Bool)

(declare-fun res!1054189 () Bool)

(assert (=> b!1537106 (=> (not res!1054189) (not e!855484))))

(assert (=> b!1537106 (= res!1054189 (not (= (select (arr!49270 a!2792) index!463) (select (arr!49270 a!2792) j!64))))))

(declare-fun b!1537107 () Bool)

(declare-fun res!1054192 () Bool)

(assert (=> b!1537107 (=> (not res!1054192) (not e!855487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102108 (_ BitVec 32)) Bool)

(assert (=> b!1537107 (= res!1054192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537108 () Bool)

(assert (=> b!1537108 (= e!855487 e!855484)))

(declare-fun res!1054190 () Bool)

(assert (=> b!1537108 (=> (not res!1054190) (not e!855484))))

(declare-fun lt!664593 () SeekEntryResult!13402)

(assert (=> b!1537108 (= res!1054190 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49270 a!2792) j!64) a!2792 mask!2480) lt!664593))))

(assert (=> b!1537108 (= lt!664593 (Found!13402 j!64))))

(declare-fun b!1537109 () Bool)

(assert (=> b!1537109 (= e!855485 e!855483)))

(declare-fun res!1054186 () Bool)

(assert (=> b!1537109 (=> (not res!1054186) (not e!855483))))

(assert (=> b!1537109 (= res!1054186 (= lt!664594 lt!664593))))

(assert (=> b!1537109 (= lt!664594 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664591 vacantIndex!5 (select (arr!49270 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131010 res!1054185) b!1537101))

(assert (= (and b!1537101 res!1054187) b!1537104))

(assert (= (and b!1537104 res!1054191) b!1537102))

(assert (= (and b!1537102 res!1054188) b!1537107))

(assert (= (and b!1537107 res!1054192) b!1537100))

(assert (= (and b!1537100 res!1054195) b!1537105))

(assert (= (and b!1537105 res!1054193) b!1537108))

(assert (= (and b!1537108 res!1054190) b!1537106))

(assert (= (and b!1537106 res!1054189) b!1537103))

(assert (= (and b!1537103 res!1054194) b!1537109))

(assert (= (and b!1537109 res!1054186) b!1537099))

(declare-fun m!1419593 () Bool)

(assert (=> b!1537109 m!1419593))

(assert (=> b!1537109 m!1419593))

(declare-fun m!1419595 () Bool)

(assert (=> b!1537109 m!1419595))

(declare-fun m!1419597 () Bool)

(assert (=> start!131010 m!1419597))

(declare-fun m!1419599 () Bool)

(assert (=> start!131010 m!1419599))

(assert (=> b!1537108 m!1419593))

(assert (=> b!1537108 m!1419593))

(declare-fun m!1419601 () Bool)

(assert (=> b!1537108 m!1419601))

(declare-fun m!1419603 () Bool)

(assert (=> b!1537104 m!1419603))

(assert (=> b!1537104 m!1419603))

(declare-fun m!1419605 () Bool)

(assert (=> b!1537104 m!1419605))

(declare-fun m!1419607 () Bool)

(assert (=> b!1537107 m!1419607))

(declare-fun m!1419609 () Bool)

(assert (=> b!1537106 m!1419609))

(assert (=> b!1537106 m!1419593))

(declare-fun m!1419611 () Bool)

(assert (=> b!1537099 m!1419611))

(declare-fun m!1419613 () Bool)

(assert (=> b!1537099 m!1419613))

(assert (=> b!1537099 m!1419613))

(declare-fun m!1419615 () Bool)

(assert (=> b!1537099 m!1419615))

(declare-fun m!1419617 () Bool)

(assert (=> b!1537099 m!1419617))

(declare-fun m!1419619 () Bool)

(assert (=> b!1537100 m!1419619))

(declare-fun m!1419621 () Bool)

(assert (=> b!1537103 m!1419621))

(declare-fun m!1419623 () Bool)

(assert (=> b!1537105 m!1419623))

(assert (=> b!1537102 m!1419593))

(assert (=> b!1537102 m!1419593))

(declare-fun m!1419625 () Bool)

(assert (=> b!1537102 m!1419625))

(push 1)

(assert (not start!131010))

(assert (not b!1537099))

(assert (not b!1537100))

(assert (not b!1537104))

(assert (not b!1537108))

(assert (not b!1537102))

(assert (not b!1537107))

(assert (not b!1537103))

(assert (not b!1537109))

(check-sat)

(pop 1)

(push 1)

(check-sat)

