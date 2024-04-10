; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130888 () Bool)

(assert start!130888)

(declare-fun b!1535154 () Bool)

(declare-fun e!854712 () Bool)

(declare-fun e!854713 () Bool)

(assert (=> b!1535154 (= e!854712 e!854713)))

(declare-fun res!1052240 () Bool)

(assert (=> b!1535154 (=> (not res!1052240) (not e!854713))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101986 0))(
  ( (array!101987 (arr!49209 (Array (_ BitVec 32) (_ BitVec 64))) (size!49759 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101986)

(declare-fun lt!664002 () (_ BitVec 32))

(assert (=> b!1535154 (= res!1052240 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664002 #b00000000000000000000000000000000) (bvslt lt!664002 (size!49759 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535154 (= lt!664002 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535155 () Bool)

(declare-fun res!1052246 () Bool)

(assert (=> b!1535155 (=> (not res!1052246) (not e!854712))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535155 (= res!1052246 (validKeyInArray!0 (select (arr!49209 a!2792) i!951)))))

(declare-fun b!1535156 () Bool)

(declare-fun res!1052241 () Bool)

(assert (=> b!1535156 (=> (not res!1052241) (not e!854712))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13341 0))(
  ( (MissingZero!13341 (index!55759 (_ BitVec 32))) (Found!13341 (index!55760 (_ BitVec 32))) (Intermediate!13341 (undefined!14153 Bool) (index!55761 (_ BitVec 32)) (x!137511 (_ BitVec 32))) (Undefined!13341) (MissingVacant!13341 (index!55762 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101986 (_ BitVec 32)) SeekEntryResult!13341)

(assert (=> b!1535156 (= res!1052241 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49209 a!2792) j!64) a!2792 mask!2480) (Found!13341 j!64)))))

(declare-fun b!1535157 () Bool)

(declare-fun res!1052243 () Bool)

(assert (=> b!1535157 (=> (not res!1052243) (not e!854712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101986 (_ BitVec 32)) Bool)

(assert (=> b!1535157 (= res!1052243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535158 () Bool)

(declare-fun res!1052244 () Bool)

(assert (=> b!1535158 (=> (not res!1052244) (not e!854712))))

(declare-datatypes ((List!35683 0))(
  ( (Nil!35680) (Cons!35679 (h!37124 (_ BitVec 64)) (t!50377 List!35683)) )
))
(declare-fun arrayNoDuplicates!0 (array!101986 (_ BitVec 32) List!35683) Bool)

(assert (=> b!1535158 (= res!1052244 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35680))))

(declare-fun res!1052245 () Bool)

(assert (=> start!130888 (=> (not res!1052245) (not e!854712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130888 (= res!1052245 (validMask!0 mask!2480))))

(assert (=> start!130888 e!854712))

(assert (=> start!130888 true))

(declare-fun array_inv!38237 (array!101986) Bool)

(assert (=> start!130888 (array_inv!38237 a!2792)))

(declare-fun b!1535153 () Bool)

(declare-fun res!1052242 () Bool)

(assert (=> b!1535153 (=> (not res!1052242) (not e!854712))))

(assert (=> b!1535153 (= res!1052242 (not (= (select (arr!49209 a!2792) index!463) (select (arr!49209 a!2792) j!64))))))

(declare-fun b!1535159 () Bool)

(declare-fun res!1052248 () Bool)

(assert (=> b!1535159 (=> (not res!1052248) (not e!854712))))

(assert (=> b!1535159 (= res!1052248 (validKeyInArray!0 (select (arr!49209 a!2792) j!64)))))

(declare-fun b!1535160 () Bool)

(assert (=> b!1535160 (= e!854713 false)))

(declare-fun lt!664003 () SeekEntryResult!13341)

(assert (=> b!1535160 (= lt!664003 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664002 vacantIndex!5 (select (arr!49209 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535161 () Bool)

(declare-fun res!1052247 () Bool)

(assert (=> b!1535161 (=> (not res!1052247) (not e!854712))))

(assert (=> b!1535161 (= res!1052247 (and (= (size!49759 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49759 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49759 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535162 () Bool)

(declare-fun res!1052239 () Bool)

(assert (=> b!1535162 (=> (not res!1052239) (not e!854712))))

(assert (=> b!1535162 (= res!1052239 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49759 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49759 a!2792)) (= (select (arr!49209 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130888 res!1052245) b!1535161))

(assert (= (and b!1535161 res!1052247) b!1535155))

(assert (= (and b!1535155 res!1052246) b!1535159))

(assert (= (and b!1535159 res!1052248) b!1535157))

(assert (= (and b!1535157 res!1052243) b!1535158))

(assert (= (and b!1535158 res!1052244) b!1535162))

(assert (= (and b!1535162 res!1052239) b!1535156))

(assert (= (and b!1535156 res!1052241) b!1535153))

(assert (= (and b!1535153 res!1052242) b!1535154))

(assert (= (and b!1535154 res!1052240) b!1535160))

(declare-fun m!1417709 () Bool)

(assert (=> b!1535157 m!1417709))

(declare-fun m!1417711 () Bool)

(assert (=> b!1535158 m!1417711))

(declare-fun m!1417713 () Bool)

(assert (=> b!1535156 m!1417713))

(assert (=> b!1535156 m!1417713))

(declare-fun m!1417715 () Bool)

(assert (=> b!1535156 m!1417715))

(declare-fun m!1417717 () Bool)

(assert (=> start!130888 m!1417717))

(declare-fun m!1417719 () Bool)

(assert (=> start!130888 m!1417719))

(assert (=> b!1535160 m!1417713))

(assert (=> b!1535160 m!1417713))

(declare-fun m!1417721 () Bool)

(assert (=> b!1535160 m!1417721))

(declare-fun m!1417723 () Bool)

(assert (=> b!1535155 m!1417723))

(assert (=> b!1535155 m!1417723))

(declare-fun m!1417725 () Bool)

(assert (=> b!1535155 m!1417725))

(declare-fun m!1417727 () Bool)

(assert (=> b!1535153 m!1417727))

(assert (=> b!1535153 m!1417713))

(declare-fun m!1417729 () Bool)

(assert (=> b!1535162 m!1417729))

(assert (=> b!1535159 m!1417713))

(assert (=> b!1535159 m!1417713))

(declare-fun m!1417731 () Bool)

(assert (=> b!1535159 m!1417731))

(declare-fun m!1417733 () Bool)

(assert (=> b!1535154 m!1417733))

(check-sat (not b!1535160) (not b!1535155) (not b!1535154) (not b!1535156) (not b!1535157) (not start!130888) (not b!1535159) (not b!1535158))
(check-sat)
