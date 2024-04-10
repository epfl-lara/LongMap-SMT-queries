; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131362 () Bool)

(assert start!131362)

(declare-fun b!1540144 () Bool)

(declare-fun res!1056836 () Bool)

(declare-fun e!856605 () Bool)

(assert (=> b!1540144 (=> (not res!1056836) (not e!856605))))

(declare-datatypes ((array!102310 0))(
  ( (array!102311 (arr!49365 (Array (_ BitVec 32) (_ BitVec 64))) (size!49915 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102310)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540144 (= res!1056836 (not (= (select (arr!49365 a!2792) index!463) (select (arr!49365 a!2792) j!64))))))

(declare-fun b!1540145 () Bool)

(declare-fun res!1056841 () Bool)

(declare-fun e!856603 () Bool)

(assert (=> b!1540145 (=> (not res!1056841) (not e!856603))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102310 (_ BitVec 32)) Bool)

(assert (=> b!1540145 (= res!1056841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540146 () Bool)

(declare-fun res!1056834 () Bool)

(assert (=> b!1540146 (=> (not res!1056834) (not e!856603))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540146 (= res!1056834 (and (= (size!49915 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49915 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49915 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540147 () Bool)

(declare-fun e!856602 () Bool)

(assert (=> b!1540147 (= e!856605 e!856602)))

(declare-fun res!1056842 () Bool)

(assert (=> b!1540147 (=> (not res!1056842) (not e!856602))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665239 () (_ BitVec 32))

(assert (=> b!1540147 (= res!1056842 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665239 #b00000000000000000000000000000000) (bvslt lt!665239 (size!49915 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540147 (= lt!665239 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1056838 () Bool)

(assert (=> start!131362 (=> (not res!1056838) (not e!856603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131362 (= res!1056838 (validMask!0 mask!2480))))

(assert (=> start!131362 e!856603))

(assert (=> start!131362 true))

(declare-fun array_inv!38393 (array!102310) Bool)

(assert (=> start!131362 (array_inv!38393 a!2792)))

(declare-fun b!1540148 () Bool)

(assert (=> b!1540148 (= e!856603 e!856605)))

(declare-fun res!1056835 () Bool)

(assert (=> b!1540148 (=> (not res!1056835) (not e!856605))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13491 0))(
  ( (MissingZero!13491 (index!56359 (_ BitVec 32))) (Found!13491 (index!56360 (_ BitVec 32))) (Intermediate!13491 (undefined!14303 Bool) (index!56361 (_ BitVec 32)) (x!138098 (_ BitVec 32))) (Undefined!13491) (MissingVacant!13491 (index!56362 (_ BitVec 32))) )
))
(declare-fun lt!665242 () SeekEntryResult!13491)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102310 (_ BitVec 32)) SeekEntryResult!13491)

(assert (=> b!1540148 (= res!1056835 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49365 a!2792) j!64) a!2792 mask!2480) lt!665242))))

(assert (=> b!1540148 (= lt!665242 (Found!13491 j!64))))

(declare-fun b!1540149 () Bool)

(declare-fun res!1056837 () Bool)

(assert (=> b!1540149 (=> (not res!1056837) (not e!856603))))

(assert (=> b!1540149 (= res!1056837 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49915 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49915 a!2792)) (= (select (arr!49365 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540150 () Bool)

(declare-fun e!856604 () Bool)

(assert (=> b!1540150 (= e!856602 e!856604)))

(declare-fun res!1056839 () Bool)

(assert (=> b!1540150 (=> (not res!1056839) (not e!856604))))

(declare-fun lt!665240 () SeekEntryResult!13491)

(assert (=> b!1540150 (= res!1056839 (= lt!665240 lt!665242))))

(assert (=> b!1540150 (= lt!665240 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665239 vacantIndex!5 (select (arr!49365 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540151 () Bool)

(declare-fun res!1056843 () Bool)

(assert (=> b!1540151 (=> (not res!1056843) (not e!856603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540151 (= res!1056843 (validKeyInArray!0 (select (arr!49365 a!2792) i!951)))))

(declare-fun b!1540152 () Bool)

(declare-fun res!1056840 () Bool)

(assert (=> b!1540152 (=> (not res!1056840) (not e!856603))))

(declare-datatypes ((List!35839 0))(
  ( (Nil!35836) (Cons!35835 (h!37280 (_ BitVec 64)) (t!50533 List!35839)) )
))
(declare-fun arrayNoDuplicates!0 (array!102310 (_ BitVec 32) List!35839) Bool)

(assert (=> b!1540152 (= res!1056840 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35836))))

(declare-fun b!1540153 () Bool)

(declare-fun res!1056844 () Bool)

(assert (=> b!1540153 (=> (not res!1056844) (not e!856603))))

(assert (=> b!1540153 (= res!1056844 (validKeyInArray!0 (select (arr!49365 a!2792) j!64)))))

(declare-fun b!1540154 () Bool)

(assert (=> b!1540154 (= e!856604 (not true))))

(assert (=> b!1540154 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665239 vacantIndex!5 (select (store (arr!49365 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102311 (store (arr!49365 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49915 a!2792)) mask!2480) lt!665240)))

(declare-datatypes ((Unit!51422 0))(
  ( (Unit!51423) )
))
(declare-fun lt!665241 () Unit!51422)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51422)

(assert (=> b!1540154 (= lt!665241 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665239 vacantIndex!5 mask!2480))))

(assert (= (and start!131362 res!1056838) b!1540146))

(assert (= (and b!1540146 res!1056834) b!1540151))

(assert (= (and b!1540151 res!1056843) b!1540153))

(assert (= (and b!1540153 res!1056844) b!1540145))

(assert (= (and b!1540145 res!1056841) b!1540152))

(assert (= (and b!1540152 res!1056840) b!1540149))

(assert (= (and b!1540149 res!1056837) b!1540148))

(assert (= (and b!1540148 res!1056835) b!1540144))

(assert (= (and b!1540144 res!1056836) b!1540147))

(assert (= (and b!1540147 res!1056842) b!1540150))

(assert (= (and b!1540150 res!1056839) b!1540154))

(declare-fun m!1422247 () Bool)

(assert (=> b!1540148 m!1422247))

(assert (=> b!1540148 m!1422247))

(declare-fun m!1422249 () Bool)

(assert (=> b!1540148 m!1422249))

(declare-fun m!1422251 () Bool)

(assert (=> b!1540147 m!1422251))

(assert (=> b!1540153 m!1422247))

(assert (=> b!1540153 m!1422247))

(declare-fun m!1422253 () Bool)

(assert (=> b!1540153 m!1422253))

(declare-fun m!1422255 () Bool)

(assert (=> b!1540145 m!1422255))

(declare-fun m!1422257 () Bool)

(assert (=> b!1540151 m!1422257))

(assert (=> b!1540151 m!1422257))

(declare-fun m!1422259 () Bool)

(assert (=> b!1540151 m!1422259))

(assert (=> b!1540150 m!1422247))

(assert (=> b!1540150 m!1422247))

(declare-fun m!1422261 () Bool)

(assert (=> b!1540150 m!1422261))

(declare-fun m!1422263 () Bool)

(assert (=> b!1540144 m!1422263))

(assert (=> b!1540144 m!1422247))

(declare-fun m!1422265 () Bool)

(assert (=> b!1540154 m!1422265))

(declare-fun m!1422267 () Bool)

(assert (=> b!1540154 m!1422267))

(assert (=> b!1540154 m!1422267))

(declare-fun m!1422269 () Bool)

(assert (=> b!1540154 m!1422269))

(declare-fun m!1422271 () Bool)

(assert (=> b!1540154 m!1422271))

(declare-fun m!1422273 () Bool)

(assert (=> b!1540152 m!1422273))

(declare-fun m!1422275 () Bool)

(assert (=> b!1540149 m!1422275))

(declare-fun m!1422277 () Bool)

(assert (=> start!131362 m!1422277))

(declare-fun m!1422279 () Bool)

(assert (=> start!131362 m!1422279))

(check-sat (not b!1540150) (not b!1540154) (not b!1540152) (not b!1540151) (not start!131362) (not b!1540147) (not b!1540153) (not b!1540145) (not b!1540148))
(check-sat)
