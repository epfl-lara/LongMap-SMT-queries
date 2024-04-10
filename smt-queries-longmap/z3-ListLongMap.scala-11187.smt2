; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130756 () Bool)

(assert start!130756)

(declare-fun b!1533487 () Bool)

(declare-fun res!1050578 () Bool)

(declare-fun e!854248 () Bool)

(assert (=> b!1533487 (=> (not res!1050578) (not e!854248))))

(declare-datatypes ((array!101854 0))(
  ( (array!101855 (arr!49143 (Array (_ BitVec 32) (_ BitVec 64))) (size!49693 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101854)

(declare-datatypes ((List!35617 0))(
  ( (Nil!35614) (Cons!35613 (h!37058 (_ BitVec 64)) (t!50311 List!35617)) )
))
(declare-fun arrayNoDuplicates!0 (array!101854 (_ BitVec 32) List!35617) Bool)

(assert (=> b!1533487 (= res!1050578 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35614))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun b!1533488 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1533488 (= e!854248 (and (= (select (arr!49143 a!2792) index!463) (select (arr!49143 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1533489 () Bool)

(declare-fun res!1050573 () Bool)

(assert (=> b!1533489 (=> (not res!1050573) (not e!854248))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533489 (= res!1050573 (validKeyInArray!0 (select (arr!49143 a!2792) i!951)))))

(declare-fun b!1533490 () Bool)

(declare-fun res!1050576 () Bool)

(assert (=> b!1533490 (=> (not res!1050576) (not e!854248))))

(assert (=> b!1533490 (= res!1050576 (and (= (size!49693 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49693 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49693 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533491 () Bool)

(declare-fun res!1050575 () Bool)

(assert (=> b!1533491 (=> (not res!1050575) (not e!854248))))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1533491 (= res!1050575 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49693 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49693 a!2792)) (= (select (arr!49143 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1050579 () Bool)

(assert (=> start!130756 (=> (not res!1050579) (not e!854248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130756 (= res!1050579 (validMask!0 mask!2480))))

(assert (=> start!130756 e!854248))

(assert (=> start!130756 true))

(declare-fun array_inv!38171 (array!101854) Bool)

(assert (=> start!130756 (array_inv!38171 a!2792)))

(declare-fun b!1533492 () Bool)

(declare-fun res!1050580 () Bool)

(assert (=> b!1533492 (=> (not res!1050580) (not e!854248))))

(declare-datatypes ((SeekEntryResult!13275 0))(
  ( (MissingZero!13275 (index!55495 (_ BitVec 32))) (Found!13275 (index!55496 (_ BitVec 32))) (Intermediate!13275 (undefined!14087 Bool) (index!55497 (_ BitVec 32)) (x!137269 (_ BitVec 32))) (Undefined!13275) (MissingVacant!13275 (index!55498 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101854 (_ BitVec 32)) SeekEntryResult!13275)

(assert (=> b!1533492 (= res!1050580 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49143 a!2792) j!64) a!2792 mask!2480) (Found!13275 j!64)))))

(declare-fun b!1533493 () Bool)

(declare-fun res!1050577 () Bool)

(assert (=> b!1533493 (=> (not res!1050577) (not e!854248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101854 (_ BitVec 32)) Bool)

(assert (=> b!1533493 (= res!1050577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533494 () Bool)

(declare-fun res!1050574 () Bool)

(assert (=> b!1533494 (=> (not res!1050574) (not e!854248))))

(assert (=> b!1533494 (= res!1050574 (validKeyInArray!0 (select (arr!49143 a!2792) j!64)))))

(assert (= (and start!130756 res!1050579) b!1533490))

(assert (= (and b!1533490 res!1050576) b!1533489))

(assert (= (and b!1533489 res!1050573) b!1533494))

(assert (= (and b!1533494 res!1050574) b!1533493))

(assert (= (and b!1533493 res!1050577) b!1533487))

(assert (= (and b!1533487 res!1050578) b!1533491))

(assert (= (and b!1533491 res!1050575) b!1533492))

(assert (= (and b!1533492 res!1050580) b!1533488))

(declare-fun m!1416175 () Bool)

(assert (=> b!1533487 m!1416175))

(declare-fun m!1416177 () Bool)

(assert (=> b!1533492 m!1416177))

(assert (=> b!1533492 m!1416177))

(declare-fun m!1416179 () Bool)

(assert (=> b!1533492 m!1416179))

(declare-fun m!1416181 () Bool)

(assert (=> b!1533489 m!1416181))

(assert (=> b!1533489 m!1416181))

(declare-fun m!1416183 () Bool)

(assert (=> b!1533489 m!1416183))

(declare-fun m!1416185 () Bool)

(assert (=> b!1533488 m!1416185))

(assert (=> b!1533488 m!1416177))

(declare-fun m!1416187 () Bool)

(assert (=> b!1533493 m!1416187))

(declare-fun m!1416189 () Bool)

(assert (=> b!1533491 m!1416189))

(declare-fun m!1416191 () Bool)

(assert (=> start!130756 m!1416191))

(declare-fun m!1416193 () Bool)

(assert (=> start!130756 m!1416193))

(assert (=> b!1533494 m!1416177))

(assert (=> b!1533494 m!1416177))

(declare-fun m!1416195 () Bool)

(assert (=> b!1533494 m!1416195))

(check-sat (not b!1533493) (not b!1533489) (not start!130756) (not b!1533494) (not b!1533492) (not b!1533487))
(check-sat)
