; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130828 () Bool)

(assert start!130828)

(declare-fun b!1534306 () Bool)

(declare-fun res!1051396 () Bool)

(declare-fun e!854463 () Bool)

(assert (=> b!1534306 (=> (not res!1051396) (not e!854463))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101926 0))(
  ( (array!101927 (arr!49179 (Array (_ BitVec 32) (_ BitVec 64))) (size!49729 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101926)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13311 0))(
  ( (MissingZero!13311 (index!55639 (_ BitVec 32))) (Found!13311 (index!55640 (_ BitVec 32))) (Intermediate!13311 (undefined!14123 Bool) (index!55641 (_ BitVec 32)) (x!137401 (_ BitVec 32))) (Undefined!13311) (MissingVacant!13311 (index!55642 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101926 (_ BitVec 32)) SeekEntryResult!13311)

(assert (=> b!1534306 (= res!1051396 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49179 a!2792) j!64) a!2792 mask!2480) (Found!13311 j!64)))))

(declare-fun b!1534307 () Bool)

(declare-fun res!1051394 () Bool)

(assert (=> b!1534307 (=> (not res!1051394) (not e!854463))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534307 (= res!1051394 (and (= (size!49729 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49729 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49729 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534308 () Bool)

(declare-fun res!1051397 () Bool)

(assert (=> b!1534308 (=> (not res!1051397) (not e!854463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101926 (_ BitVec 32)) Bool)

(assert (=> b!1534308 (= res!1051397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1051398 () Bool)

(assert (=> start!130828 (=> (not res!1051398) (not e!854463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130828 (= res!1051398 (validMask!0 mask!2480))))

(assert (=> start!130828 e!854463))

(assert (=> start!130828 true))

(declare-fun array_inv!38207 (array!101926) Bool)

(assert (=> start!130828 (array_inv!38207 a!2792)))

(declare-fun b!1534309 () Bool)

(declare-fun res!1051392 () Bool)

(assert (=> b!1534309 (=> (not res!1051392) (not e!854463))))

(assert (=> b!1534309 (= res!1051392 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49729 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49729 a!2792)) (= (select (arr!49179 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534310 () Bool)

(assert (=> b!1534310 (= e!854463 (and (not (= (select (arr!49179 a!2792) index!463) (select (arr!49179 a!2792) j!64))) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1534311 () Bool)

(declare-fun res!1051393 () Bool)

(assert (=> b!1534311 (=> (not res!1051393) (not e!854463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534311 (= res!1051393 (validKeyInArray!0 (select (arr!49179 a!2792) j!64)))))

(declare-fun b!1534312 () Bool)

(declare-fun res!1051395 () Bool)

(assert (=> b!1534312 (=> (not res!1051395) (not e!854463))))

(assert (=> b!1534312 (= res!1051395 (validKeyInArray!0 (select (arr!49179 a!2792) i!951)))))

(declare-fun b!1534313 () Bool)

(declare-fun res!1051399 () Bool)

(assert (=> b!1534313 (=> (not res!1051399) (not e!854463))))

(declare-datatypes ((List!35653 0))(
  ( (Nil!35650) (Cons!35649 (h!37094 (_ BitVec 64)) (t!50347 List!35653)) )
))
(declare-fun arrayNoDuplicates!0 (array!101926 (_ BitVec 32) List!35653) Bool)

(assert (=> b!1534313 (= res!1051399 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35650))))

(assert (= (and start!130828 res!1051398) b!1534307))

(assert (= (and b!1534307 res!1051394) b!1534312))

(assert (= (and b!1534312 res!1051395) b!1534311))

(assert (= (and b!1534311 res!1051393) b!1534308))

(assert (= (and b!1534308 res!1051397) b!1534313))

(assert (= (and b!1534313 res!1051399) b!1534309))

(assert (= (and b!1534309 res!1051392) b!1534306))

(assert (= (and b!1534306 res!1051396) b!1534310))

(declare-fun m!1416967 () Bool)

(assert (=> b!1534308 m!1416967))

(declare-fun m!1416969 () Bool)

(assert (=> b!1534306 m!1416969))

(assert (=> b!1534306 m!1416969))

(declare-fun m!1416971 () Bool)

(assert (=> b!1534306 m!1416971))

(declare-fun m!1416973 () Bool)

(assert (=> b!1534313 m!1416973))

(declare-fun m!1416975 () Bool)

(assert (=> b!1534309 m!1416975))

(declare-fun m!1416977 () Bool)

(assert (=> b!1534312 m!1416977))

(assert (=> b!1534312 m!1416977))

(declare-fun m!1416979 () Bool)

(assert (=> b!1534312 m!1416979))

(declare-fun m!1416981 () Bool)

(assert (=> b!1534310 m!1416981))

(assert (=> b!1534310 m!1416969))

(declare-fun m!1416983 () Bool)

(assert (=> start!130828 m!1416983))

(declare-fun m!1416985 () Bool)

(assert (=> start!130828 m!1416985))

(assert (=> b!1534311 m!1416969))

(assert (=> b!1534311 m!1416969))

(declare-fun m!1416987 () Bool)

(assert (=> b!1534311 m!1416987))

(check-sat (not b!1534312) (not b!1534311) (not b!1534313) (not b!1534306) (not start!130828) (not b!1534308))
(check-sat)
