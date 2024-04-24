; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131298 () Bool)

(assert start!131298)

(declare-fun b!1537469 () Bool)

(declare-fun e!856184 () Bool)

(declare-fun e!856185 () Bool)

(assert (=> b!1537469 (= e!856184 e!856185)))

(declare-fun res!1052987 () Bool)

(assert (=> b!1537469 (=> (not res!1052987) (not e!856185))))

(declare-fun lt!664889 () (_ BitVec 32))

(declare-datatypes ((array!102100 0))(
  ( (array!102101 (arr!49258 (Array (_ BitVec 32) (_ BitVec 64))) (size!49809 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102100)

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1537469 (= res!1052987 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664889 #b00000000000000000000000000000000) (bvslt lt!664889 (size!49809 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537469 (= lt!664889 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537470 () Bool)

(declare-fun res!1052979 () Bool)

(assert (=> b!1537470 (=> (not res!1052979) (not e!856184))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1537470 (= res!1052979 (not (= (select (arr!49258 a!2792) index!463) (select (arr!49258 a!2792) j!64))))))

(declare-fun b!1537471 () Bool)

(declare-fun res!1052981 () Bool)

(assert (=> b!1537471 (=> (not res!1052981) (not e!856184))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537471 (= res!1052981 (and (= (size!49809 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49809 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49809 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1052980 () Bool)

(assert (=> start!131298 (=> (not res!1052980) (not e!856184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131298 (= res!1052980 (validMask!0 mask!2480))))

(assert (=> start!131298 e!856184))

(assert (=> start!131298 true))

(declare-fun array_inv!38539 (array!102100) Bool)

(assert (=> start!131298 (array_inv!38539 a!2792)))

(declare-fun b!1537472 () Bool)

(declare-fun res!1052986 () Bool)

(assert (=> b!1537472 (=> (not res!1052986) (not e!856184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102100 (_ BitVec 32)) Bool)

(assert (=> b!1537472 (= res!1052986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537473 () Bool)

(declare-fun res!1052983 () Bool)

(assert (=> b!1537473 (=> (not res!1052983) (not e!856184))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13285 0))(
  ( (MissingZero!13285 (index!55535 (_ BitVec 32))) (Found!13285 (index!55536 (_ BitVec 32))) (Intermediate!13285 (undefined!14097 Bool) (index!55537 (_ BitVec 32)) (x!137497 (_ BitVec 32))) (Undefined!13285) (MissingVacant!13285 (index!55538 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102100 (_ BitVec 32)) SeekEntryResult!13285)

(assert (=> b!1537473 (= res!1052983 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49258 a!2792) j!64) a!2792 mask!2480) (Found!13285 j!64)))))

(declare-fun b!1537474 () Bool)

(declare-fun res!1052982 () Bool)

(assert (=> b!1537474 (=> (not res!1052982) (not e!856184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537474 (= res!1052982 (validKeyInArray!0 (select (arr!49258 a!2792) i!951)))))

(declare-fun b!1537475 () Bool)

(assert (=> b!1537475 (= e!856185 false)))

(declare-fun lt!664890 () SeekEntryResult!13285)

(assert (=> b!1537475 (= lt!664890 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664889 vacantIndex!5 (select (arr!49258 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537476 () Bool)

(declare-fun res!1052988 () Bool)

(assert (=> b!1537476 (=> (not res!1052988) (not e!856184))))

(assert (=> b!1537476 (= res!1052988 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49809 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49809 a!2792)) (= (select (arr!49258 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537477 () Bool)

(declare-fun res!1052984 () Bool)

(assert (=> b!1537477 (=> (not res!1052984) (not e!856184))))

(assert (=> b!1537477 (= res!1052984 (validKeyInArray!0 (select (arr!49258 a!2792) j!64)))))

(declare-fun b!1537478 () Bool)

(declare-fun res!1052985 () Bool)

(assert (=> b!1537478 (=> (not res!1052985) (not e!856184))))

(declare-datatypes ((List!35719 0))(
  ( (Nil!35716) (Cons!35715 (h!37178 (_ BitVec 64)) (t!50405 List!35719)) )
))
(declare-fun arrayNoDuplicates!0 (array!102100 (_ BitVec 32) List!35719) Bool)

(assert (=> b!1537478 (= res!1052985 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35716))))

(assert (= (and start!131298 res!1052980) b!1537471))

(assert (= (and b!1537471 res!1052981) b!1537474))

(assert (= (and b!1537474 res!1052982) b!1537477))

(assert (= (and b!1537477 res!1052984) b!1537472))

(assert (= (and b!1537472 res!1052986) b!1537478))

(assert (= (and b!1537478 res!1052985) b!1537476))

(assert (= (and b!1537476 res!1052988) b!1537473))

(assert (= (and b!1537473 res!1052983) b!1537470))

(assert (= (and b!1537470 res!1052979) b!1537469))

(assert (= (and b!1537469 res!1052987) b!1537475))

(declare-fun m!1419841 () Bool)

(assert (=> b!1537470 m!1419841))

(declare-fun m!1419843 () Bool)

(assert (=> b!1537470 m!1419843))

(declare-fun m!1419845 () Bool)

(assert (=> start!131298 m!1419845))

(declare-fun m!1419847 () Bool)

(assert (=> start!131298 m!1419847))

(assert (=> b!1537477 m!1419843))

(assert (=> b!1537477 m!1419843))

(declare-fun m!1419849 () Bool)

(assert (=> b!1537477 m!1419849))

(declare-fun m!1419851 () Bool)

(assert (=> b!1537472 m!1419851))

(declare-fun m!1419853 () Bool)

(assert (=> b!1537476 m!1419853))

(declare-fun m!1419855 () Bool)

(assert (=> b!1537478 m!1419855))

(declare-fun m!1419857 () Bool)

(assert (=> b!1537469 m!1419857))

(assert (=> b!1537473 m!1419843))

(assert (=> b!1537473 m!1419843))

(declare-fun m!1419859 () Bool)

(assert (=> b!1537473 m!1419859))

(declare-fun m!1419861 () Bool)

(assert (=> b!1537474 m!1419861))

(assert (=> b!1537474 m!1419861))

(declare-fun m!1419863 () Bool)

(assert (=> b!1537474 m!1419863))

(assert (=> b!1537475 m!1419843))

(assert (=> b!1537475 m!1419843))

(declare-fun m!1419865 () Bool)

(assert (=> b!1537475 m!1419865))

(check-sat (not b!1537473) (not b!1537478) (not b!1537474) (not b!1537469) (not start!131298) (not b!1537475) (not b!1537477) (not b!1537472))
(check-sat)
