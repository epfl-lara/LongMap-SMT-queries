; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129576 () Bool)

(assert start!129576)

(declare-fun b!1521124 () Bool)

(declare-fun res!1040351 () Bool)

(declare-fun e!848448 () Bool)

(assert (=> b!1521124 (=> (not res!1040351) (not e!848448))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101251 0))(
  ( (array!101252 (arr!48858 (Array (_ BitVec 32) (_ BitVec 64))) (size!49408 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101251)

(assert (=> b!1521124 (= res!1040351 (and (= (size!49408 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49408 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49408 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521125 () Bool)

(declare-fun res!1040347 () Bool)

(assert (=> b!1521125 (=> (not res!1040347) (not e!848448))))

(declare-datatypes ((List!35341 0))(
  ( (Nil!35338) (Cons!35337 (h!36758 (_ BitVec 64)) (t!50035 List!35341)) )
))
(declare-fun arrayNoDuplicates!0 (array!101251 (_ BitVec 32) List!35341) Bool)

(assert (=> b!1521125 (= res!1040347 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35338))))

(declare-fun b!1521126 () Bool)

(declare-fun res!1040352 () Bool)

(assert (=> b!1521126 (=> (not res!1040352) (not e!848448))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13023 0))(
  ( (MissingZero!13023 (index!54487 (_ BitVec 32))) (Found!13023 (index!54488 (_ BitVec 32))) (Intermediate!13023 (undefined!13835 Bool) (index!54489 (_ BitVec 32)) (x!136187 (_ BitVec 32))) (Undefined!13023) (MissingVacant!13023 (index!54490 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101251 (_ BitVec 32)) SeekEntryResult!13023)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521126 (= res!1040352 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48858 a!2804) j!70) mask!2512) (select (arr!48858 a!2804) j!70) a!2804 mask!2512) (Intermediate!13023 false resIndex!21 resX!21)))))

(declare-fun b!1521127 () Bool)

(assert (=> b!1521127 (= e!848448 false)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!659311 () SeekEntryResult!13023)

(assert (=> b!1521127 (= lt!659311 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48858 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521128 () Bool)

(declare-fun res!1040346 () Bool)

(assert (=> b!1521128 (=> (not res!1040346) (not e!848448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521128 (= res!1040346 (validKeyInArray!0 (select (arr!48858 a!2804) i!961)))))

(declare-fun b!1521129 () Bool)

(declare-fun res!1040350 () Bool)

(assert (=> b!1521129 (=> (not res!1040350) (not e!848448))))

(assert (=> b!1521129 (= res!1040350 (validKeyInArray!0 (select (arr!48858 a!2804) j!70)))))

(declare-fun b!1521130 () Bool)

(declare-fun res!1040348 () Bool)

(assert (=> b!1521130 (=> (not res!1040348) (not e!848448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101251 (_ BitVec 32)) Bool)

(assert (=> b!1521130 (= res!1040348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521131 () Bool)

(declare-fun res!1040349 () Bool)

(assert (=> b!1521131 (=> (not res!1040349) (not e!848448))))

(assert (=> b!1521131 (= res!1040349 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49408 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49408 a!2804))))))

(declare-fun res!1040353 () Bool)

(assert (=> start!129576 (=> (not res!1040353) (not e!848448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129576 (= res!1040353 (validMask!0 mask!2512))))

(assert (=> start!129576 e!848448))

(assert (=> start!129576 true))

(declare-fun array_inv!37886 (array!101251) Bool)

(assert (=> start!129576 (array_inv!37886 a!2804)))

(assert (= (and start!129576 res!1040353) b!1521124))

(assert (= (and b!1521124 res!1040351) b!1521128))

(assert (= (and b!1521128 res!1040346) b!1521129))

(assert (= (and b!1521129 res!1040350) b!1521130))

(assert (= (and b!1521130 res!1040348) b!1521125))

(assert (= (and b!1521125 res!1040347) b!1521131))

(assert (= (and b!1521131 res!1040349) b!1521126))

(assert (= (and b!1521126 res!1040352) b!1521127))

(declare-fun m!1404243 () Bool)

(assert (=> b!1521127 m!1404243))

(assert (=> b!1521127 m!1404243))

(declare-fun m!1404245 () Bool)

(assert (=> b!1521127 m!1404245))

(declare-fun m!1404247 () Bool)

(assert (=> b!1521130 m!1404247))

(declare-fun m!1404249 () Bool)

(assert (=> b!1521128 m!1404249))

(assert (=> b!1521128 m!1404249))

(declare-fun m!1404251 () Bool)

(assert (=> b!1521128 m!1404251))

(declare-fun m!1404253 () Bool)

(assert (=> start!129576 m!1404253))

(declare-fun m!1404255 () Bool)

(assert (=> start!129576 m!1404255))

(assert (=> b!1521126 m!1404243))

(assert (=> b!1521126 m!1404243))

(declare-fun m!1404257 () Bool)

(assert (=> b!1521126 m!1404257))

(assert (=> b!1521126 m!1404257))

(assert (=> b!1521126 m!1404243))

(declare-fun m!1404259 () Bool)

(assert (=> b!1521126 m!1404259))

(declare-fun m!1404261 () Bool)

(assert (=> b!1521125 m!1404261))

(assert (=> b!1521129 m!1404243))

(assert (=> b!1521129 m!1404243))

(declare-fun m!1404263 () Bool)

(assert (=> b!1521129 m!1404263))

(check-sat (not start!129576) (not b!1521127) (not b!1521130) (not b!1521128) (not b!1521129) (not b!1521125) (not b!1521126))
