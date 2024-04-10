; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130990 () Bool)

(assert start!130990)

(declare-fun b!1536769 () Bool)

(declare-fun e!855334 () Bool)

(declare-fun e!855335 () Bool)

(assert (=> b!1536769 (= e!855334 e!855335)))

(declare-fun res!1053860 () Bool)

(assert (=> b!1536769 (=> (not res!1053860) (not e!855335))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13392 0))(
  ( (MissingZero!13392 (index!55963 (_ BitVec 32))) (Found!13392 (index!55964 (_ BitVec 32))) (Intermediate!13392 (undefined!14204 Bool) (index!55965 (_ BitVec 32)) (x!137698 (_ BitVec 32))) (Undefined!13392) (MissingVacant!13392 (index!55966 (_ BitVec 32))) )
))
(declare-fun lt!664472 () SeekEntryResult!13392)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((array!102088 0))(
  ( (array!102089 (arr!49260 (Array (_ BitVec 32) (_ BitVec 64))) (size!49810 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102088)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102088 (_ BitVec 32)) SeekEntryResult!13392)

(assert (=> b!1536769 (= res!1053860 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49260 a!2792) j!64) a!2792 mask!2480) lt!664472))))

(assert (=> b!1536769 (= lt!664472 (Found!13392 j!64))))

(declare-fun b!1536770 () Bool)

(declare-fun res!1053865 () Bool)

(assert (=> b!1536770 (=> (not res!1053865) (not e!855334))))

(declare-datatypes ((List!35734 0))(
  ( (Nil!35731) (Cons!35730 (h!37175 (_ BitVec 64)) (t!50428 List!35734)) )
))
(declare-fun arrayNoDuplicates!0 (array!102088 (_ BitVec 32) List!35734) Bool)

(assert (=> b!1536770 (= res!1053865 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35731))))

(declare-fun b!1536771 () Bool)

(declare-fun res!1053861 () Bool)

(assert (=> b!1536771 (=> (not res!1053861) (not e!855335))))

(assert (=> b!1536771 (= res!1053861 (not (= (select (arr!49260 a!2792) index!463) (select (arr!49260 a!2792) j!64))))))

(declare-fun b!1536772 () Bool)

(declare-fun res!1053864 () Bool)

(assert (=> b!1536772 (=> (not res!1053864) (not e!855334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536772 (= res!1053864 (validKeyInArray!0 (select (arr!49260 a!2792) j!64)))))

(declare-fun res!1053855 () Bool)

(assert (=> start!130990 (=> (not res!1053855) (not e!855334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130990 (= res!1053855 (validMask!0 mask!2480))))

(assert (=> start!130990 e!855334))

(assert (=> start!130990 true))

(declare-fun array_inv!38288 (array!102088) Bool)

(assert (=> start!130990 (array_inv!38288 a!2792)))

(declare-fun b!1536773 () Bool)

(declare-fun res!1053857 () Bool)

(assert (=> b!1536773 (=> (not res!1053857) (not e!855334))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536773 (= res!1053857 (validKeyInArray!0 (select (arr!49260 a!2792) i!951)))))

(declare-fun b!1536774 () Bool)

(declare-fun res!1053862 () Bool)

(assert (=> b!1536774 (=> (not res!1053862) (not e!855334))))

(assert (=> b!1536774 (= res!1053862 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49810 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49810 a!2792)) (= (select (arr!49260 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536775 () Bool)

(declare-fun e!855337 () Bool)

(declare-fun e!855336 () Bool)

(assert (=> b!1536775 (= e!855337 e!855336)))

(declare-fun res!1053859 () Bool)

(assert (=> b!1536775 (=> (not res!1053859) (not e!855336))))

(declare-fun lt!664474 () SeekEntryResult!13392)

(assert (=> b!1536775 (= res!1053859 (= lt!664474 lt!664472))))

(declare-fun lt!664473 () (_ BitVec 32))

(assert (=> b!1536775 (= lt!664474 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664473 vacantIndex!5 (select (arr!49260 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536776 () Bool)

(assert (=> b!1536776 (= e!855335 e!855337)))

(declare-fun res!1053863 () Bool)

(assert (=> b!1536776 (=> (not res!1053863) (not e!855337))))

(assert (=> b!1536776 (= res!1053863 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664473 #b00000000000000000000000000000000) (bvslt lt!664473 (size!49810 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536776 (= lt!664473 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536777 () Bool)

(declare-fun res!1053856 () Bool)

(assert (=> b!1536777 (=> (not res!1053856) (not e!855334))))

(assert (=> b!1536777 (= res!1053856 (and (= (size!49810 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49810 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49810 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536778 () Bool)

(assert (=> b!1536778 (= e!855336 (not true))))

(assert (=> b!1536778 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664473 vacantIndex!5 (select (store (arr!49260 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102089 (store (arr!49260 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49810 a!2792)) mask!2480) lt!664474)))

(declare-datatypes ((Unit!51356 0))(
  ( (Unit!51357) )
))
(declare-fun lt!664471 () Unit!51356)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51356)

(assert (=> b!1536778 (= lt!664471 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664473 vacantIndex!5 mask!2480))))

(declare-fun b!1536779 () Bool)

(declare-fun res!1053858 () Bool)

(assert (=> b!1536779 (=> (not res!1053858) (not e!855334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102088 (_ BitVec 32)) Bool)

(assert (=> b!1536779 (= res!1053858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130990 res!1053855) b!1536777))

(assert (= (and b!1536777 res!1053856) b!1536773))

(assert (= (and b!1536773 res!1053857) b!1536772))

(assert (= (and b!1536772 res!1053864) b!1536779))

(assert (= (and b!1536779 res!1053858) b!1536770))

(assert (= (and b!1536770 res!1053865) b!1536774))

(assert (= (and b!1536774 res!1053862) b!1536769))

(assert (= (and b!1536769 res!1053860) b!1536771))

(assert (= (and b!1536771 res!1053861) b!1536776))

(assert (= (and b!1536776 res!1053863) b!1536775))

(assert (= (and b!1536775 res!1053859) b!1536778))

(declare-fun m!1419253 () Bool)

(assert (=> b!1536769 m!1419253))

(assert (=> b!1536769 m!1419253))

(declare-fun m!1419255 () Bool)

(assert (=> b!1536769 m!1419255))

(declare-fun m!1419257 () Bool)

(assert (=> b!1536779 m!1419257))

(declare-fun m!1419259 () Bool)

(assert (=> b!1536773 m!1419259))

(assert (=> b!1536773 m!1419259))

(declare-fun m!1419261 () Bool)

(assert (=> b!1536773 m!1419261))

(declare-fun m!1419263 () Bool)

(assert (=> b!1536776 m!1419263))

(assert (=> b!1536775 m!1419253))

(assert (=> b!1536775 m!1419253))

(declare-fun m!1419265 () Bool)

(assert (=> b!1536775 m!1419265))

(declare-fun m!1419267 () Bool)

(assert (=> b!1536778 m!1419267))

(declare-fun m!1419269 () Bool)

(assert (=> b!1536778 m!1419269))

(assert (=> b!1536778 m!1419269))

(declare-fun m!1419271 () Bool)

(assert (=> b!1536778 m!1419271))

(declare-fun m!1419273 () Bool)

(assert (=> b!1536778 m!1419273))

(declare-fun m!1419275 () Bool)

(assert (=> b!1536770 m!1419275))

(declare-fun m!1419277 () Bool)

(assert (=> b!1536774 m!1419277))

(assert (=> b!1536772 m!1419253))

(assert (=> b!1536772 m!1419253))

(declare-fun m!1419279 () Bool)

(assert (=> b!1536772 m!1419279))

(declare-fun m!1419281 () Bool)

(assert (=> b!1536771 m!1419281))

(assert (=> b!1536771 m!1419253))

(declare-fun m!1419283 () Bool)

(assert (=> start!130990 m!1419283))

(declare-fun m!1419285 () Bool)

(assert (=> start!130990 m!1419285))

(check-sat (not b!1536769) (not b!1536773) (not b!1536770) (not start!130990) (not b!1536776) (not b!1536778) (not b!1536779) (not b!1536775) (not b!1536772))
(check-sat)
