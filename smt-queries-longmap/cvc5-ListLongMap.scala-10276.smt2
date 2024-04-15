; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120816 () Bool)

(assert start!120816)

(declare-fun b!1405703 () Bool)

(declare-fun e!795674 () Bool)

(declare-fun e!795675 () Bool)

(assert (=> b!1405703 (= e!795674 (not e!795675))))

(declare-fun res!943973 () Bool)

(assert (=> b!1405703 (=> res!943973 e!795675)))

(declare-datatypes ((SeekEntryResult!10723 0))(
  ( (MissingZero!10723 (index!45269 (_ BitVec 32))) (Found!10723 (index!45270 (_ BitVec 32))) (Intermediate!10723 (undefined!11535 Bool) (index!45271 (_ BitVec 32)) (x!126871 (_ BitVec 32))) (Undefined!10723) (MissingVacant!10723 (index!45272 (_ BitVec 32))) )
))
(declare-fun lt!618950 () SeekEntryResult!10723)

(assert (=> b!1405703 (= res!943973 (or (not (is-Intermediate!10723 lt!618950)) (undefined!11535 lt!618950)))))

(declare-fun e!795676 () Bool)

(assert (=> b!1405703 e!795676))

(declare-fun res!943971 () Bool)

(assert (=> b!1405703 (=> (not res!943971) (not e!795676))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96076 0))(
  ( (array!96077 (arr!46386 (Array (_ BitVec 32) (_ BitVec 64))) (size!46938 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96076)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96076 (_ BitVec 32)) Bool)

(assert (=> b!1405703 (= res!943971 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47263 0))(
  ( (Unit!47264) )
))
(declare-fun lt!618949 () Unit!47263)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47263)

(assert (=> b!1405703 (= lt!618949 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96076 (_ BitVec 32)) SeekEntryResult!10723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405703 (= lt!618950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46386 a!2901) j!112) mask!2840) (select (arr!46386 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405704 () Bool)

(declare-fun res!943976 () Bool)

(assert (=> b!1405704 (=> (not res!943976) (not e!795674))))

(assert (=> b!1405704 (= res!943976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405705 () Bool)

(declare-fun res!943972 () Bool)

(assert (=> b!1405705 (=> (not res!943972) (not e!795674))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405705 (= res!943972 (validKeyInArray!0 (select (arr!46386 a!2901) i!1037)))))

(declare-fun b!1405706 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96076 (_ BitVec 32)) SeekEntryResult!10723)

(assert (=> b!1405706 (= e!795676 (= (seekEntryOrOpen!0 (select (arr!46386 a!2901) j!112) a!2901 mask!2840) (Found!10723 j!112)))))

(declare-fun res!943974 () Bool)

(assert (=> start!120816 (=> (not res!943974) (not e!795674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120816 (= res!943974 (validMask!0 mask!2840))))

(assert (=> start!120816 e!795674))

(assert (=> start!120816 true))

(declare-fun array_inv!35619 (array!96076) Bool)

(assert (=> start!120816 (array_inv!35619 a!2901)))

(declare-fun b!1405707 () Bool)

(declare-fun res!943975 () Bool)

(assert (=> b!1405707 (=> (not res!943975) (not e!795674))))

(assert (=> b!1405707 (= res!943975 (validKeyInArray!0 (select (arr!46386 a!2901) j!112)))))

(declare-fun b!1405708 () Bool)

(assert (=> b!1405708 (= e!795675 true)))

(declare-fun lt!618948 () (_ BitVec 32))

(assert (=> b!1405708 (= lt!618948 (toIndex!0 (select (store (arr!46386 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1405709 () Bool)

(declare-fun res!943977 () Bool)

(assert (=> b!1405709 (=> (not res!943977) (not e!795674))))

(declare-datatypes ((List!32983 0))(
  ( (Nil!32980) (Cons!32979 (h!34233 (_ BitVec 64)) (t!47669 List!32983)) )
))
(declare-fun arrayNoDuplicates!0 (array!96076 (_ BitVec 32) List!32983) Bool)

(assert (=> b!1405709 (= res!943977 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32980))))

(declare-fun b!1405710 () Bool)

(declare-fun res!943978 () Bool)

(assert (=> b!1405710 (=> (not res!943978) (not e!795674))))

(assert (=> b!1405710 (= res!943978 (and (= (size!46938 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46938 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46938 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120816 res!943974) b!1405710))

(assert (= (and b!1405710 res!943978) b!1405705))

(assert (= (and b!1405705 res!943972) b!1405707))

(assert (= (and b!1405707 res!943975) b!1405704))

(assert (= (and b!1405704 res!943976) b!1405709))

(assert (= (and b!1405709 res!943977) b!1405703))

(assert (= (and b!1405703 res!943971) b!1405706))

(assert (= (and b!1405703 (not res!943973)) b!1405708))

(declare-fun m!1294121 () Bool)

(assert (=> b!1405703 m!1294121))

(declare-fun m!1294123 () Bool)

(assert (=> b!1405703 m!1294123))

(assert (=> b!1405703 m!1294121))

(declare-fun m!1294125 () Bool)

(assert (=> b!1405703 m!1294125))

(assert (=> b!1405703 m!1294123))

(assert (=> b!1405703 m!1294121))

(declare-fun m!1294127 () Bool)

(assert (=> b!1405703 m!1294127))

(declare-fun m!1294129 () Bool)

(assert (=> b!1405703 m!1294129))

(declare-fun m!1294131 () Bool)

(assert (=> b!1405704 m!1294131))

(assert (=> b!1405707 m!1294121))

(assert (=> b!1405707 m!1294121))

(declare-fun m!1294133 () Bool)

(assert (=> b!1405707 m!1294133))

(declare-fun m!1294135 () Bool)

(assert (=> b!1405708 m!1294135))

(declare-fun m!1294137 () Bool)

(assert (=> b!1405708 m!1294137))

(assert (=> b!1405708 m!1294137))

(declare-fun m!1294139 () Bool)

(assert (=> b!1405708 m!1294139))

(declare-fun m!1294141 () Bool)

(assert (=> b!1405709 m!1294141))

(assert (=> b!1405706 m!1294121))

(assert (=> b!1405706 m!1294121))

(declare-fun m!1294143 () Bool)

(assert (=> b!1405706 m!1294143))

(declare-fun m!1294145 () Bool)

(assert (=> b!1405705 m!1294145))

(assert (=> b!1405705 m!1294145))

(declare-fun m!1294147 () Bool)

(assert (=> b!1405705 m!1294147))

(declare-fun m!1294149 () Bool)

(assert (=> start!120816 m!1294149))

(declare-fun m!1294151 () Bool)

(assert (=> start!120816 m!1294151))

(push 1)

(assert (not b!1405705))

(assert (not b!1405708))

(assert (not start!120816))

(assert (not b!1405704))

(assert (not b!1405706))

(assert (not b!1405707))

(assert (not b!1405703))

(assert (not b!1405709))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

