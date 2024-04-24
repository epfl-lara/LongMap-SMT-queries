; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120278 () Bool)

(assert start!120278)

(declare-fun b!1399315 () Bool)

(declare-fun e!792278 () Bool)

(declare-fun e!792279 () Bool)

(assert (=> b!1399315 (= e!792278 (not e!792279))))

(declare-fun res!937545 () Bool)

(assert (=> b!1399315 (=> res!937545 e!792279)))

(declare-datatypes ((SeekEntryResult!10436 0))(
  ( (MissingZero!10436 (index!44115 (_ BitVec 32))) (Found!10436 (index!44116 (_ BitVec 32))) (Intermediate!10436 (undefined!11248 Bool) (index!44117 (_ BitVec 32)) (x!125917 (_ BitVec 32))) (Undefined!10436) (MissingVacant!10436 (index!44118 (_ BitVec 32))) )
))
(declare-fun lt!615155 () SeekEntryResult!10436)

(get-info :version)

(assert (=> b!1399315 (= res!937545 (or (not ((_ is Intermediate!10436) lt!615155)) (undefined!11248 lt!615155)))))

(declare-fun e!792281 () Bool)

(assert (=> b!1399315 e!792281))

(declare-fun res!937546 () Bool)

(assert (=> b!1399315 (=> (not res!937546) (not e!792281))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95729 0))(
  ( (array!95730 (arr!46216 (Array (_ BitVec 32) (_ BitVec 64))) (size!46767 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95729)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95729 (_ BitVec 32)) Bool)

(assert (=> b!1399315 (= res!937546 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46903 0))(
  ( (Unit!46904) )
))
(declare-fun lt!615158 () Unit!46903)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46903)

(assert (=> b!1399315 (= lt!615158 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615156 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95729 (_ BitVec 32)) SeekEntryResult!10436)

(assert (=> b!1399315 (= lt!615155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615156 (select (arr!46216 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399315 (= lt!615156 (toIndex!0 (select (arr!46216 a!2901) j!112) mask!2840))))

(declare-fun b!1399316 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95729 (_ BitVec 32)) SeekEntryResult!10436)

(assert (=> b!1399316 (= e!792281 (= (seekEntryOrOpen!0 (select (arr!46216 a!2901) j!112) a!2901 mask!2840) (Found!10436 j!112)))))

(declare-fun b!1399317 () Bool)

(declare-fun res!937547 () Bool)

(assert (=> b!1399317 (=> (not res!937547) (not e!792278))))

(declare-datatypes ((List!32722 0))(
  ( (Nil!32719) (Cons!32718 (h!33968 (_ BitVec 64)) (t!47408 List!32722)) )
))
(declare-fun arrayNoDuplicates!0 (array!95729 (_ BitVec 32) List!32722) Bool)

(assert (=> b!1399317 (= res!937547 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32719))))

(declare-fun b!1399318 () Bool)

(declare-fun res!937549 () Bool)

(assert (=> b!1399318 (=> (not res!937549) (not e!792278))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399318 (= res!937549 (validKeyInArray!0 (select (arr!46216 a!2901) i!1037)))))

(declare-fun b!1399319 () Bool)

(declare-fun res!937548 () Bool)

(assert (=> b!1399319 (=> (not res!937548) (not e!792278))))

(assert (=> b!1399319 (= res!937548 (and (= (size!46767 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46767 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46767 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399320 () Bool)

(declare-fun res!937544 () Bool)

(assert (=> b!1399320 (=> (not res!937544) (not e!792278))))

(assert (=> b!1399320 (= res!937544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399321 () Bool)

(declare-fun e!792277 () Bool)

(assert (=> b!1399321 (= e!792279 e!792277)))

(declare-fun res!937551 () Bool)

(assert (=> b!1399321 (=> res!937551 e!792277)))

(declare-fun lt!615157 () SeekEntryResult!10436)

(assert (=> b!1399321 (= res!937551 (or (= lt!615155 lt!615157) (not ((_ is Intermediate!10436) lt!615157))))))

(declare-fun lt!615154 () (_ BitVec 64))

(assert (=> b!1399321 (= lt!615157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615154 mask!2840) lt!615154 (array!95730 (store (arr!46216 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46767 a!2901)) mask!2840))))

(assert (=> b!1399321 (= lt!615154 (select (store (arr!46216 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun res!937550 () Bool)

(assert (=> start!120278 (=> (not res!937550) (not e!792278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120278 (= res!937550 (validMask!0 mask!2840))))

(assert (=> start!120278 e!792278))

(assert (=> start!120278 true))

(declare-fun array_inv!35497 (array!95729) Bool)

(assert (=> start!120278 (array_inv!35497 a!2901)))

(declare-fun b!1399322 () Bool)

(assert (=> b!1399322 (= e!792277 true)))

(assert (=> b!1399322 (and (not (undefined!11248 lt!615157)) (= (index!44117 lt!615157) i!1037) (bvslt (x!125917 lt!615157) (x!125917 lt!615155)) (= (select (store (arr!46216 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44117 lt!615157)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615153 () Unit!46903)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46903)

(assert (=> b!1399322 (= lt!615153 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615156 (x!125917 lt!615155) (index!44117 lt!615155) (x!125917 lt!615157) (index!44117 lt!615157) (undefined!11248 lt!615157) mask!2840))))

(declare-fun b!1399323 () Bool)

(declare-fun res!937552 () Bool)

(assert (=> b!1399323 (=> (not res!937552) (not e!792278))))

(assert (=> b!1399323 (= res!937552 (validKeyInArray!0 (select (arr!46216 a!2901) j!112)))))

(assert (= (and start!120278 res!937550) b!1399319))

(assert (= (and b!1399319 res!937548) b!1399318))

(assert (= (and b!1399318 res!937549) b!1399323))

(assert (= (and b!1399323 res!937552) b!1399320))

(assert (= (and b!1399320 res!937544) b!1399317))

(assert (= (and b!1399317 res!937547) b!1399315))

(assert (= (and b!1399315 res!937546) b!1399316))

(assert (= (and b!1399315 (not res!937545)) b!1399321))

(assert (= (and b!1399321 (not res!937551)) b!1399322))

(declare-fun m!1286575 () Bool)

(assert (=> b!1399317 m!1286575))

(declare-fun m!1286577 () Bool)

(assert (=> b!1399316 m!1286577))

(assert (=> b!1399316 m!1286577))

(declare-fun m!1286579 () Bool)

(assert (=> b!1399316 m!1286579))

(declare-fun m!1286581 () Bool)

(assert (=> b!1399321 m!1286581))

(declare-fun m!1286583 () Bool)

(assert (=> b!1399321 m!1286583))

(assert (=> b!1399321 m!1286581))

(declare-fun m!1286585 () Bool)

(assert (=> b!1399321 m!1286585))

(declare-fun m!1286587 () Bool)

(assert (=> b!1399321 m!1286587))

(declare-fun m!1286589 () Bool)

(assert (=> start!120278 m!1286589))

(declare-fun m!1286591 () Bool)

(assert (=> start!120278 m!1286591))

(assert (=> b!1399322 m!1286583))

(declare-fun m!1286593 () Bool)

(assert (=> b!1399322 m!1286593))

(declare-fun m!1286595 () Bool)

(assert (=> b!1399322 m!1286595))

(assert (=> b!1399315 m!1286577))

(declare-fun m!1286597 () Bool)

(assert (=> b!1399315 m!1286597))

(assert (=> b!1399315 m!1286577))

(declare-fun m!1286599 () Bool)

(assert (=> b!1399315 m!1286599))

(declare-fun m!1286601 () Bool)

(assert (=> b!1399315 m!1286601))

(assert (=> b!1399315 m!1286577))

(declare-fun m!1286603 () Bool)

(assert (=> b!1399315 m!1286603))

(assert (=> b!1399323 m!1286577))

(assert (=> b!1399323 m!1286577))

(declare-fun m!1286605 () Bool)

(assert (=> b!1399323 m!1286605))

(declare-fun m!1286607 () Bool)

(assert (=> b!1399320 m!1286607))

(declare-fun m!1286609 () Bool)

(assert (=> b!1399318 m!1286609))

(assert (=> b!1399318 m!1286609))

(declare-fun m!1286611 () Bool)

(assert (=> b!1399318 m!1286611))

(check-sat (not b!1399321) (not start!120278) (not b!1399317) (not b!1399322) (not b!1399323) (not b!1399318) (not b!1399315) (not b!1399320) (not b!1399316))
(check-sat)
