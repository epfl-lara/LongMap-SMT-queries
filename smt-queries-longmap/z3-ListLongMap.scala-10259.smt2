; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120794 () Bool)

(assert start!120794)

(declare-fun b!1405382 () Bool)

(declare-fun res!943210 () Bool)

(declare-fun e!795713 () Bool)

(assert (=> b!1405382 (=> (not res!943210) (not e!795713))))

(declare-datatypes ((array!96125 0))(
  ( (array!96126 (arr!46411 (Array (_ BitVec 32) (_ BitVec 64))) (size!46962 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96125)

(declare-datatypes ((List!32917 0))(
  ( (Nil!32914) (Cons!32913 (h!34169 (_ BitVec 64)) (t!47603 List!32917)) )
))
(declare-fun arrayNoDuplicates!0 (array!96125 (_ BitVec 32) List!32917) Bool)

(assert (=> b!1405382 (= res!943210 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32914))))

(declare-fun b!1405383 () Bool)

(declare-fun res!943213 () Bool)

(assert (=> b!1405383 (=> (not res!943213) (not e!795713))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96125 (_ BitVec 32)) Bool)

(assert (=> b!1405383 (= res!943213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405384 () Bool)

(declare-fun res!943211 () Bool)

(assert (=> b!1405384 (=> (not res!943211) (not e!795713))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405384 (= res!943211 (validKeyInArray!0 (select (arr!46411 a!2901) i!1037)))))

(declare-fun b!1405381 () Bool)

(declare-fun res!943208 () Bool)

(assert (=> b!1405381 (=> (not res!943208) (not e!795713))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405381 (= res!943208 (and (= (size!46962 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46962 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46962 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!943209 () Bool)

(assert (=> start!120794 (=> (not res!943209) (not e!795713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120794 (= res!943209 (validMask!0 mask!2840))))

(assert (=> start!120794 e!795713))

(assert (=> start!120794 true))

(declare-fun array_inv!35692 (array!96125) Bool)

(assert (=> start!120794 (array_inv!35692 a!2901)))

(declare-fun b!1405385 () Bool)

(declare-fun res!943212 () Bool)

(assert (=> b!1405385 (=> (not res!943212) (not e!795713))))

(assert (=> b!1405385 (= res!943212 (validKeyInArray!0 (select (arr!46411 a!2901) j!112)))))

(declare-fun b!1405386 () Bool)

(assert (=> b!1405386 (= e!795713 (bvsgt #b00000000000000000000000000000000 (size!46962 a!2901)))))

(declare-datatypes ((SeekEntryResult!10625 0))(
  ( (MissingZero!10625 (index!44877 (_ BitVec 32))) (Found!10625 (index!44878 (_ BitVec 32))) (Intermediate!10625 (undefined!11437 Bool) (index!44879 (_ BitVec 32)) (x!126647 (_ BitVec 32))) (Undefined!10625) (MissingVacant!10625 (index!44880 (_ BitVec 32))) )
))
(declare-fun lt!619010 () SeekEntryResult!10625)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96125 (_ BitVec 32)) SeekEntryResult!10625)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405386 (= lt!619010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46411 a!2901) j!112) mask!2840) (select (arr!46411 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120794 res!943209) b!1405381))

(assert (= (and b!1405381 res!943208) b!1405384))

(assert (= (and b!1405384 res!943211) b!1405385))

(assert (= (and b!1405385 res!943212) b!1405383))

(assert (= (and b!1405383 res!943213) b!1405382))

(assert (= (and b!1405382 res!943210) b!1405386))

(declare-fun m!1294429 () Bool)

(assert (=> b!1405385 m!1294429))

(assert (=> b!1405385 m!1294429))

(declare-fun m!1294431 () Bool)

(assert (=> b!1405385 m!1294431))

(declare-fun m!1294433 () Bool)

(assert (=> start!120794 m!1294433))

(declare-fun m!1294435 () Bool)

(assert (=> start!120794 m!1294435))

(declare-fun m!1294437 () Bool)

(assert (=> b!1405382 m!1294437))

(assert (=> b!1405386 m!1294429))

(assert (=> b!1405386 m!1294429))

(declare-fun m!1294439 () Bool)

(assert (=> b!1405386 m!1294439))

(assert (=> b!1405386 m!1294439))

(assert (=> b!1405386 m!1294429))

(declare-fun m!1294441 () Bool)

(assert (=> b!1405386 m!1294441))

(declare-fun m!1294443 () Bool)

(assert (=> b!1405383 m!1294443))

(declare-fun m!1294445 () Bool)

(assert (=> b!1405384 m!1294445))

(assert (=> b!1405384 m!1294445))

(declare-fun m!1294447 () Bool)

(assert (=> b!1405384 m!1294447))

(check-sat (not b!1405382) (not b!1405384) (not b!1405385) (not b!1405383) (not b!1405386) (not start!120794))
(check-sat)
