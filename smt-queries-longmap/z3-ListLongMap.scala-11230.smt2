; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131014 () Bool)

(assert start!131014)

(declare-fun b!1537165 () Bool)

(declare-fun e!855514 () Bool)

(declare-fun e!855517 () Bool)

(assert (=> b!1537165 (= e!855514 e!855517)))

(declare-fun res!1054253 () Bool)

(assert (=> b!1537165 (=> (not res!1054253) (not e!855517))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102112 0))(
  ( (array!102113 (arr!49272 (Array (_ BitVec 32) (_ BitVec 64))) (size!49822 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102112)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13404 0))(
  ( (MissingZero!13404 (index!56011 (_ BitVec 32))) (Found!13404 (index!56012 (_ BitVec 32))) (Intermediate!13404 (undefined!14216 Bool) (index!56013 (_ BitVec 32)) (x!137742 (_ BitVec 32))) (Undefined!13404) (MissingVacant!13404 (index!56014 (_ BitVec 32))) )
))
(declare-fun lt!664617 () SeekEntryResult!13404)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102112 (_ BitVec 32)) SeekEntryResult!13404)

(assert (=> b!1537165 (= res!1054253 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49272 a!2792) j!64) a!2792 mask!2480) lt!664617))))

(assert (=> b!1537165 (= lt!664617 (Found!13404 j!64))))

(declare-fun b!1537166 () Bool)

(declare-fun res!1054255 () Bool)

(assert (=> b!1537166 (=> (not res!1054255) (not e!855514))))

(declare-datatypes ((List!35746 0))(
  ( (Nil!35743) (Cons!35742 (h!37187 (_ BitVec 64)) (t!50440 List!35746)) )
))
(declare-fun arrayNoDuplicates!0 (array!102112 (_ BitVec 32) List!35746) Bool)

(assert (=> b!1537166 (= res!1054255 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35743))))

(declare-fun b!1537167 () Bool)

(declare-fun e!855515 () Bool)

(assert (=> b!1537167 (= e!855515 (not true))))

(declare-fun lt!664615 () (_ BitVec 32))

(declare-fun lt!664616 () SeekEntryResult!13404)

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537167 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664615 vacantIndex!5 (select (store (arr!49272 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102113 (store (arr!49272 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49822 a!2792)) mask!2480) lt!664616)))

(declare-datatypes ((Unit!51380 0))(
  ( (Unit!51381) )
))
(declare-fun lt!664618 () Unit!51380)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51380)

(assert (=> b!1537167 (= lt!664618 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664615 vacantIndex!5 mask!2480))))

(declare-fun b!1537168 () Bool)

(declare-fun e!855516 () Bool)

(assert (=> b!1537168 (= e!855517 e!855516)))

(declare-fun res!1054256 () Bool)

(assert (=> b!1537168 (=> (not res!1054256) (not e!855516))))

(assert (=> b!1537168 (= res!1054256 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664615 #b00000000000000000000000000000000) (bvslt lt!664615 (size!49822 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537168 (= lt!664615 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537169 () Bool)

(declare-fun res!1054257 () Bool)

(assert (=> b!1537169 (=> (not res!1054257) (not e!855514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102112 (_ BitVec 32)) Bool)

(assert (=> b!1537169 (= res!1054257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1054254 () Bool)

(assert (=> start!131014 (=> (not res!1054254) (not e!855514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131014 (= res!1054254 (validMask!0 mask!2480))))

(assert (=> start!131014 e!855514))

(assert (=> start!131014 true))

(declare-fun array_inv!38300 (array!102112) Bool)

(assert (=> start!131014 (array_inv!38300 a!2792)))

(declare-fun b!1537170 () Bool)

(declare-fun res!1054251 () Bool)

(assert (=> b!1537170 (=> (not res!1054251) (not e!855514))))

(assert (=> b!1537170 (= res!1054251 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49822 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49822 a!2792)) (= (select (arr!49272 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537171 () Bool)

(declare-fun res!1054260 () Bool)

(assert (=> b!1537171 (=> (not res!1054260) (not e!855514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537171 (= res!1054260 (validKeyInArray!0 (select (arr!49272 a!2792) j!64)))))

(declare-fun b!1537172 () Bool)

(declare-fun res!1054258 () Bool)

(assert (=> b!1537172 (=> (not res!1054258) (not e!855514))))

(assert (=> b!1537172 (= res!1054258 (and (= (size!49822 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49822 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49822 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537173 () Bool)

(declare-fun res!1054259 () Bool)

(assert (=> b!1537173 (=> (not res!1054259) (not e!855517))))

(assert (=> b!1537173 (= res!1054259 (not (= (select (arr!49272 a!2792) index!463) (select (arr!49272 a!2792) j!64))))))

(declare-fun b!1537174 () Bool)

(assert (=> b!1537174 (= e!855516 e!855515)))

(declare-fun res!1054252 () Bool)

(assert (=> b!1537174 (=> (not res!1054252) (not e!855515))))

(assert (=> b!1537174 (= res!1054252 (= lt!664616 lt!664617))))

(assert (=> b!1537174 (= lt!664616 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664615 vacantIndex!5 (select (arr!49272 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537175 () Bool)

(declare-fun res!1054261 () Bool)

(assert (=> b!1537175 (=> (not res!1054261) (not e!855514))))

(assert (=> b!1537175 (= res!1054261 (validKeyInArray!0 (select (arr!49272 a!2792) i!951)))))

(assert (= (and start!131014 res!1054254) b!1537172))

(assert (= (and b!1537172 res!1054258) b!1537175))

(assert (= (and b!1537175 res!1054261) b!1537171))

(assert (= (and b!1537171 res!1054260) b!1537169))

(assert (= (and b!1537169 res!1054257) b!1537166))

(assert (= (and b!1537166 res!1054255) b!1537170))

(assert (= (and b!1537170 res!1054251) b!1537165))

(assert (= (and b!1537165 res!1054253) b!1537173))

(assert (= (and b!1537173 res!1054259) b!1537168))

(assert (= (and b!1537168 res!1054256) b!1537174))

(assert (= (and b!1537174 res!1054252) b!1537167))

(declare-fun m!1419661 () Bool)

(assert (=> b!1537169 m!1419661))

(declare-fun m!1419663 () Bool)

(assert (=> b!1537167 m!1419663))

(declare-fun m!1419665 () Bool)

(assert (=> b!1537167 m!1419665))

(assert (=> b!1537167 m!1419665))

(declare-fun m!1419667 () Bool)

(assert (=> b!1537167 m!1419667))

(declare-fun m!1419669 () Bool)

(assert (=> b!1537167 m!1419669))

(declare-fun m!1419671 () Bool)

(assert (=> b!1537166 m!1419671))

(declare-fun m!1419673 () Bool)

(assert (=> b!1537165 m!1419673))

(assert (=> b!1537165 m!1419673))

(declare-fun m!1419675 () Bool)

(assert (=> b!1537165 m!1419675))

(declare-fun m!1419677 () Bool)

(assert (=> b!1537168 m!1419677))

(declare-fun m!1419679 () Bool)

(assert (=> b!1537175 m!1419679))

(assert (=> b!1537175 m!1419679))

(declare-fun m!1419681 () Bool)

(assert (=> b!1537175 m!1419681))

(declare-fun m!1419683 () Bool)

(assert (=> b!1537173 m!1419683))

(assert (=> b!1537173 m!1419673))

(declare-fun m!1419685 () Bool)

(assert (=> b!1537170 m!1419685))

(assert (=> b!1537174 m!1419673))

(assert (=> b!1537174 m!1419673))

(declare-fun m!1419687 () Bool)

(assert (=> b!1537174 m!1419687))

(assert (=> b!1537171 m!1419673))

(assert (=> b!1537171 m!1419673))

(declare-fun m!1419689 () Bool)

(assert (=> b!1537171 m!1419689))

(declare-fun m!1419691 () Bool)

(assert (=> start!131014 m!1419691))

(declare-fun m!1419693 () Bool)

(assert (=> start!131014 m!1419693))

(check-sat (not b!1537174) (not b!1537166) (not b!1537167) (not start!131014) (not b!1537171) (not b!1537175) (not b!1537168) (not b!1537169) (not b!1537165))
(check-sat)
