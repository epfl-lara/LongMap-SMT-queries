; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130952 () Bool)

(assert start!130952)

(declare-fun b!1536133 () Bool)

(declare-fun e!855039 () Bool)

(declare-fun e!855043 () Bool)

(assert (=> b!1536133 (= e!855039 e!855043)))

(declare-fun res!1053222 () Bool)

(assert (=> b!1536133 (=> (not res!1053222) (not e!855043))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102050 0))(
  ( (array!102051 (arr!49241 (Array (_ BitVec 32) (_ BitVec 64))) (size!49791 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102050)

(declare-fun lt!664234 () (_ BitVec 32))

(assert (=> b!1536133 (= res!1053222 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664234 #b00000000000000000000000000000000) (bvslt lt!664234 (size!49791 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536133 (= lt!664234 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536134 () Bool)

(declare-fun e!855040 () Bool)

(assert (=> b!1536134 (= e!855040 (not true))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13373 0))(
  ( (MissingZero!13373 (index!55887 (_ BitVec 32))) (Found!13373 (index!55888 (_ BitVec 32))) (Intermediate!13373 (undefined!14185 Bool) (index!55889 (_ BitVec 32)) (x!137631 (_ BitVec 32))) (Undefined!13373) (MissingVacant!13373 (index!55890 (_ BitVec 32))) )
))
(declare-fun lt!664236 () SeekEntryResult!13373)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102050 (_ BitVec 32)) SeekEntryResult!13373)

(assert (=> b!1536134 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664234 vacantIndex!5 (select (store (arr!49241 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102051 (store (arr!49241 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49791 a!2792)) mask!2480) lt!664236)))

(declare-datatypes ((Unit!51318 0))(
  ( (Unit!51319) )
))
(declare-fun lt!664235 () Unit!51318)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51318)

(assert (=> b!1536134 (= lt!664235 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664234 vacantIndex!5 mask!2480))))

(declare-fun b!1536135 () Bool)

(declare-fun res!1053219 () Bool)

(declare-fun e!855042 () Bool)

(assert (=> b!1536135 (=> (not res!1053219) (not e!855042))))

(assert (=> b!1536135 (= res!1053219 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49791 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49791 a!2792)) (= (select (arr!49241 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536136 () Bool)

(assert (=> b!1536136 (= e!855042 e!855039)))

(declare-fun res!1053220 () Bool)

(assert (=> b!1536136 (=> (not res!1053220) (not e!855039))))

(declare-fun lt!664237 () SeekEntryResult!13373)

(assert (=> b!1536136 (= res!1053220 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49241 a!2792) j!64) a!2792 mask!2480) lt!664237))))

(assert (=> b!1536136 (= lt!664237 (Found!13373 j!64))))

(declare-fun b!1536137 () Bool)

(declare-fun res!1053228 () Bool)

(assert (=> b!1536137 (=> (not res!1053228) (not e!855042))))

(declare-datatypes ((List!35715 0))(
  ( (Nil!35712) (Cons!35711 (h!37156 (_ BitVec 64)) (t!50409 List!35715)) )
))
(declare-fun arrayNoDuplicates!0 (array!102050 (_ BitVec 32) List!35715) Bool)

(assert (=> b!1536137 (= res!1053228 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35712))))

(declare-fun res!1053226 () Bool)

(assert (=> start!130952 (=> (not res!1053226) (not e!855042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130952 (= res!1053226 (validMask!0 mask!2480))))

(assert (=> start!130952 e!855042))

(assert (=> start!130952 true))

(declare-fun array_inv!38269 (array!102050) Bool)

(assert (=> start!130952 (array_inv!38269 a!2792)))

(declare-fun b!1536138 () Bool)

(declare-fun res!1053223 () Bool)

(assert (=> b!1536138 (=> (not res!1053223) (not e!855042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536138 (= res!1053223 (validKeyInArray!0 (select (arr!49241 a!2792) i!951)))))

(declare-fun b!1536139 () Bool)

(assert (=> b!1536139 (= e!855043 e!855040)))

(declare-fun res!1053229 () Bool)

(assert (=> b!1536139 (=> (not res!1053229) (not e!855040))))

(assert (=> b!1536139 (= res!1053229 (= lt!664236 lt!664237))))

(assert (=> b!1536139 (= lt!664236 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664234 vacantIndex!5 (select (arr!49241 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536140 () Bool)

(declare-fun res!1053224 () Bool)

(assert (=> b!1536140 (=> (not res!1053224) (not e!855042))))

(assert (=> b!1536140 (= res!1053224 (validKeyInArray!0 (select (arr!49241 a!2792) j!64)))))

(declare-fun b!1536141 () Bool)

(declare-fun res!1053227 () Bool)

(assert (=> b!1536141 (=> (not res!1053227) (not e!855039))))

(assert (=> b!1536141 (= res!1053227 (not (= (select (arr!49241 a!2792) index!463) (select (arr!49241 a!2792) j!64))))))

(declare-fun b!1536142 () Bool)

(declare-fun res!1053225 () Bool)

(assert (=> b!1536142 (=> (not res!1053225) (not e!855042))))

(assert (=> b!1536142 (= res!1053225 (and (= (size!49791 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49791 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49791 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536143 () Bool)

(declare-fun res!1053221 () Bool)

(assert (=> b!1536143 (=> (not res!1053221) (not e!855042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102050 (_ BitVec 32)) Bool)

(assert (=> b!1536143 (= res!1053221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130952 res!1053226) b!1536142))

(assert (= (and b!1536142 res!1053225) b!1536138))

(assert (= (and b!1536138 res!1053223) b!1536140))

(assert (= (and b!1536140 res!1053224) b!1536143))

(assert (= (and b!1536143 res!1053221) b!1536137))

(assert (= (and b!1536137 res!1053228) b!1536135))

(assert (= (and b!1536135 res!1053219) b!1536136))

(assert (= (and b!1536136 res!1053220) b!1536141))

(assert (= (and b!1536141 res!1053227) b!1536133))

(assert (= (and b!1536133 res!1053222) b!1536139))

(assert (= (and b!1536139 res!1053229) b!1536134))

(declare-fun m!1418589 () Bool)

(assert (=> b!1536135 m!1418589))

(declare-fun m!1418591 () Bool)

(assert (=> b!1536137 m!1418591))

(declare-fun m!1418593 () Bool)

(assert (=> b!1536133 m!1418593))

(declare-fun m!1418595 () Bool)

(assert (=> b!1536140 m!1418595))

(assert (=> b!1536140 m!1418595))

(declare-fun m!1418597 () Bool)

(assert (=> b!1536140 m!1418597))

(declare-fun m!1418599 () Bool)

(assert (=> b!1536138 m!1418599))

(assert (=> b!1536138 m!1418599))

(declare-fun m!1418601 () Bool)

(assert (=> b!1536138 m!1418601))

(assert (=> b!1536136 m!1418595))

(assert (=> b!1536136 m!1418595))

(declare-fun m!1418603 () Bool)

(assert (=> b!1536136 m!1418603))

(assert (=> b!1536139 m!1418595))

(assert (=> b!1536139 m!1418595))

(declare-fun m!1418605 () Bool)

(assert (=> b!1536139 m!1418605))

(declare-fun m!1418607 () Bool)

(assert (=> start!130952 m!1418607))

(declare-fun m!1418609 () Bool)

(assert (=> start!130952 m!1418609))

(declare-fun m!1418611 () Bool)

(assert (=> b!1536143 m!1418611))

(declare-fun m!1418613 () Bool)

(assert (=> b!1536134 m!1418613))

(declare-fun m!1418615 () Bool)

(assert (=> b!1536134 m!1418615))

(assert (=> b!1536134 m!1418615))

(declare-fun m!1418617 () Bool)

(assert (=> b!1536134 m!1418617))

(declare-fun m!1418619 () Bool)

(assert (=> b!1536134 m!1418619))

(declare-fun m!1418621 () Bool)

(assert (=> b!1536141 m!1418621))

(assert (=> b!1536141 m!1418595))

(push 1)

