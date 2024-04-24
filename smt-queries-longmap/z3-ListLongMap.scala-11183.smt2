; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131112 () Bool)

(assert start!131112)

(declare-fun b!1535485 () Bool)

(declare-fun res!1051086 () Bool)

(declare-fun e!855588 () Bool)

(assert (=> b!1535485 (=> (not res!1051086) (not e!855588))))

(declare-datatypes ((array!101947 0))(
  ( (array!101948 (arr!49183 (Array (_ BitVec 32) (_ BitVec 64))) (size!49734 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101947)

(declare-datatypes ((List!35644 0))(
  ( (Nil!35641) (Cons!35640 (h!37103 (_ BitVec 64)) (t!50330 List!35644)) )
))
(declare-fun arrayNoDuplicates!0 (array!101947 (_ BitVec 32) List!35644) Bool)

(assert (=> b!1535485 (= res!1051086 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35641))))

(declare-fun res!1051092 () Bool)

(assert (=> start!131112 (=> (not res!1051092) (not e!855588))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131112 (= res!1051092 (validMask!0 mask!2480))))

(assert (=> start!131112 e!855588))

(assert (=> start!131112 true))

(declare-fun array_inv!38464 (array!101947) Bool)

(assert (=> start!131112 (array_inv!38464 a!2792)))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun b!1535486 () Bool)

(assert (=> b!1535486 (= e!855588 (and (= (select (arr!49183 a!2792) index!463) (select (arr!49183 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1535487 () Bool)

(declare-fun res!1051087 () Bool)

(assert (=> b!1535487 (=> (not res!1051087) (not e!855588))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535487 (= res!1051087 (and (= (size!49734 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49734 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49734 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535488 () Bool)

(declare-fun res!1051088 () Bool)

(assert (=> b!1535488 (=> (not res!1051088) (not e!855588))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1535488 (= res!1051088 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49734 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49734 a!2792)) (= (select (arr!49183 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535489 () Bool)

(declare-fun res!1051091 () Bool)

(assert (=> b!1535489 (=> (not res!1051091) (not e!855588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101947 (_ BitVec 32)) Bool)

(assert (=> b!1535489 (= res!1051091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535490 () Bool)

(declare-fun res!1051089 () Bool)

(assert (=> b!1535490 (=> (not res!1051089) (not e!855588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535490 (= res!1051089 (validKeyInArray!0 (select (arr!49183 a!2792) j!64)))))

(declare-fun b!1535491 () Bool)

(declare-fun res!1051090 () Bool)

(assert (=> b!1535491 (=> (not res!1051090) (not e!855588))))

(assert (=> b!1535491 (= res!1051090 (validKeyInArray!0 (select (arr!49183 a!2792) i!951)))))

(declare-fun b!1535492 () Bool)

(declare-fun res!1051085 () Bool)

(assert (=> b!1535492 (=> (not res!1051085) (not e!855588))))

(declare-datatypes ((SeekEntryResult!13210 0))(
  ( (MissingZero!13210 (index!55235 (_ BitVec 32))) (Found!13210 (index!55236 (_ BitVec 32))) (Intermediate!13210 (undefined!14022 Bool) (index!55237 (_ BitVec 32)) (x!137219 (_ BitVec 32))) (Undefined!13210) (MissingVacant!13210 (index!55238 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101947 (_ BitVec 32)) SeekEntryResult!13210)

(assert (=> b!1535492 (= res!1051085 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49183 a!2792) j!64) a!2792 mask!2480) (Found!13210 j!64)))))

(assert (= (and start!131112 res!1051092) b!1535487))

(assert (= (and b!1535487 res!1051087) b!1535491))

(assert (= (and b!1535491 res!1051090) b!1535490))

(assert (= (and b!1535490 res!1051089) b!1535489))

(assert (= (and b!1535489 res!1051091) b!1535485))

(assert (= (and b!1535485 res!1051086) b!1535488))

(assert (= (and b!1535488 res!1051088) b!1535492))

(assert (= (and b!1535492 res!1051085) b!1535486))

(declare-fun m!1418059 () Bool)

(assert (=> b!1535491 m!1418059))

(assert (=> b!1535491 m!1418059))

(declare-fun m!1418061 () Bool)

(assert (=> b!1535491 m!1418061))

(declare-fun m!1418063 () Bool)

(assert (=> b!1535490 m!1418063))

(assert (=> b!1535490 m!1418063))

(declare-fun m!1418065 () Bool)

(assert (=> b!1535490 m!1418065))

(declare-fun m!1418067 () Bool)

(assert (=> b!1535489 m!1418067))

(declare-fun m!1418069 () Bool)

(assert (=> b!1535485 m!1418069))

(declare-fun m!1418071 () Bool)

(assert (=> start!131112 m!1418071))

(declare-fun m!1418073 () Bool)

(assert (=> start!131112 m!1418073))

(declare-fun m!1418075 () Bool)

(assert (=> b!1535488 m!1418075))

(assert (=> b!1535492 m!1418063))

(assert (=> b!1535492 m!1418063))

(declare-fun m!1418077 () Bool)

(assert (=> b!1535492 m!1418077))

(declare-fun m!1418079 () Bool)

(assert (=> b!1535486 m!1418079))

(assert (=> b!1535486 m!1418063))

(check-sat (not b!1535490) (not b!1535485) (not b!1535492) (not start!131112) (not b!1535491) (not b!1535489))
(check-sat)
