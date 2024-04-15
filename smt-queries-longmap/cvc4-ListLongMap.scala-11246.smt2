; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131096 () Bool)

(assert start!131096)

(declare-fun b!1538156 () Bool)

(declare-fun res!1055319 () Bool)

(declare-fun e!855804 () Bool)

(assert (=> b!1538156 (=> (not res!1055319) (not e!855804))))

(declare-datatypes ((array!102159 0))(
  ( (array!102160 (arr!49295 (Array (_ BitVec 32) (_ BitVec 64))) (size!49847 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102159)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538156 (= res!1055319 (validKeyInArray!0 (select (arr!49295 a!2792) j!64)))))

(declare-fun b!1538157 () Bool)

(declare-fun res!1055324 () Bool)

(assert (=> b!1538157 (=> (not res!1055324) (not e!855804))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538157 (= res!1055324 (not (= (select (arr!49295 a!2792) index!463) (select (arr!49295 a!2792) j!64))))))

(declare-fun b!1538158 () Bool)

(declare-fun res!1055326 () Bool)

(assert (=> b!1538158 (=> (not res!1055326) (not e!855804))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538158 (= res!1055326 (validKeyInArray!0 (select (arr!49295 a!2792) i!951)))))

(declare-fun b!1538159 () Bool)

(assert (=> b!1538159 (= e!855804 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!664617 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538159 (= lt!664617 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538160 () Bool)

(declare-fun res!1055318 () Bool)

(assert (=> b!1538160 (=> (not res!1055318) (not e!855804))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538160 (= res!1055318 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49847 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49847 a!2792)) (= (select (arr!49295 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1055323 () Bool)

(assert (=> start!131096 (=> (not res!1055323) (not e!855804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131096 (= res!1055323 (validMask!0 mask!2480))))

(assert (=> start!131096 e!855804))

(assert (=> start!131096 true))

(declare-fun array_inv!38528 (array!102159) Bool)

(assert (=> start!131096 (array_inv!38528 a!2792)))

(declare-fun b!1538161 () Bool)

(declare-fun res!1055322 () Bool)

(assert (=> b!1538161 (=> (not res!1055322) (not e!855804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102159 (_ BitVec 32)) Bool)

(assert (=> b!1538161 (= res!1055322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538162 () Bool)

(declare-fun res!1055321 () Bool)

(assert (=> b!1538162 (=> (not res!1055321) (not e!855804))))

(declare-datatypes ((SeekEntryResult!13446 0))(
  ( (MissingZero!13446 (index!56179 (_ BitVec 32))) (Found!13446 (index!56180 (_ BitVec 32))) (Intermediate!13446 (undefined!14258 Bool) (index!56181 (_ BitVec 32)) (x!137910 (_ BitVec 32))) (Undefined!13446) (MissingVacant!13446 (index!56182 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102159 (_ BitVec 32)) SeekEntryResult!13446)

(assert (=> b!1538162 (= res!1055321 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49295 a!2792) j!64) a!2792 mask!2480) (Found!13446 j!64)))))

(declare-fun b!1538163 () Bool)

(declare-fun res!1055325 () Bool)

(assert (=> b!1538163 (=> (not res!1055325) (not e!855804))))

(declare-datatypes ((List!35847 0))(
  ( (Nil!35844) (Cons!35843 (h!37289 (_ BitVec 64)) (t!50533 List!35847)) )
))
(declare-fun arrayNoDuplicates!0 (array!102159 (_ BitVec 32) List!35847) Bool)

(assert (=> b!1538163 (= res!1055325 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35844))))

(declare-fun b!1538164 () Bool)

(declare-fun res!1055320 () Bool)

(assert (=> b!1538164 (=> (not res!1055320) (not e!855804))))

(assert (=> b!1538164 (= res!1055320 (and (= (size!49847 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49847 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49847 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131096 res!1055323) b!1538164))

(assert (= (and b!1538164 res!1055320) b!1538158))

(assert (= (and b!1538158 res!1055326) b!1538156))

(assert (= (and b!1538156 res!1055319) b!1538161))

(assert (= (and b!1538161 res!1055322) b!1538163))

(assert (= (and b!1538163 res!1055325) b!1538160))

(assert (= (and b!1538160 res!1055318) b!1538162))

(assert (= (and b!1538162 res!1055321) b!1538157))

(assert (= (and b!1538157 res!1055324) b!1538159))

(declare-fun m!1420007 () Bool)

(assert (=> start!131096 m!1420007))

(declare-fun m!1420009 () Bool)

(assert (=> start!131096 m!1420009))

(declare-fun m!1420011 () Bool)

(assert (=> b!1538162 m!1420011))

(assert (=> b!1538162 m!1420011))

(declare-fun m!1420013 () Bool)

(assert (=> b!1538162 m!1420013))

(declare-fun m!1420015 () Bool)

(assert (=> b!1538160 m!1420015))

(declare-fun m!1420017 () Bool)

(assert (=> b!1538158 m!1420017))

(assert (=> b!1538158 m!1420017))

(declare-fun m!1420019 () Bool)

(assert (=> b!1538158 m!1420019))

(assert (=> b!1538156 m!1420011))

(assert (=> b!1538156 m!1420011))

(declare-fun m!1420021 () Bool)

(assert (=> b!1538156 m!1420021))

(declare-fun m!1420023 () Bool)

(assert (=> b!1538157 m!1420023))

(assert (=> b!1538157 m!1420011))

(declare-fun m!1420025 () Bool)

(assert (=> b!1538159 m!1420025))

(declare-fun m!1420027 () Bool)

(assert (=> b!1538163 m!1420027))

(declare-fun m!1420029 () Bool)

(assert (=> b!1538161 m!1420029))

(push 1)

(assert (not b!1538162))

(assert (not b!1538163))

(assert (not b!1538161))

(assert (not start!131096))

(assert (not b!1538158))

(assert (not b!1538156))

(assert (not b!1538159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

