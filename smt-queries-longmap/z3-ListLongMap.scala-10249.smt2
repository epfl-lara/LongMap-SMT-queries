; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120548 () Bool)

(assert start!120548)

(declare-fun b!1403679 () Bool)

(declare-fun res!942192 () Bool)

(declare-fun e!794752 () Bool)

(assert (=> b!1403679 (=> (not res!942192) (not e!794752))))

(declare-datatypes ((array!95957 0))(
  ( (array!95958 (arr!46329 (Array (_ BitVec 32) (_ BitVec 64))) (size!46879 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95957)

(declare-datatypes ((List!32848 0))(
  ( (Nil!32845) (Cons!32844 (h!34092 (_ BitVec 64)) (t!47542 List!32848)) )
))
(declare-fun arrayNoDuplicates!0 (array!95957 (_ BitVec 32) List!32848) Bool)

(assert (=> b!1403679 (= res!942192 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32845))))

(declare-fun b!1403680 () Bool)

(declare-fun res!942194 () Bool)

(assert (=> b!1403680 (=> (not res!942194) (not e!794752))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403680 (= res!942194 (validKeyInArray!0 (select (arr!46329 a!2901) i!1037)))))

(declare-fun b!1403681 () Bool)

(declare-fun res!942193 () Bool)

(assert (=> b!1403681 (=> (not res!942193) (not e!794752))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95957 (_ BitVec 32)) Bool)

(assert (=> b!1403681 (= res!942193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403682 () Bool)

(assert (=> b!1403682 (= e!794752 (not true))))

(declare-fun e!794751 () Bool)

(assert (=> b!1403682 e!794751))

(declare-fun res!942195 () Bool)

(assert (=> b!1403682 (=> (not res!942195) (not e!794751))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403682 (= res!942195 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47296 0))(
  ( (Unit!47297) )
))
(declare-fun lt!618477 () Unit!47296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47296)

(assert (=> b!1403682 (= lt!618477 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10646 0))(
  ( (MissingZero!10646 (index!44961 (_ BitVec 32))) (Found!10646 (index!44962 (_ BitVec 32))) (Intermediate!10646 (undefined!11458 Bool) (index!44963 (_ BitVec 32)) (x!126569 (_ BitVec 32))) (Undefined!10646) (MissingVacant!10646 (index!44964 (_ BitVec 32))) )
))
(declare-fun lt!618476 () SeekEntryResult!10646)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95957 (_ BitVec 32)) SeekEntryResult!10646)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403682 (= lt!618476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46329 a!2901) j!112) mask!2840) (select (arr!46329 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403683 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95957 (_ BitVec 32)) SeekEntryResult!10646)

(assert (=> b!1403683 (= e!794751 (= (seekEntryOrOpen!0 (select (arr!46329 a!2901) j!112) a!2901 mask!2840) (Found!10646 j!112)))))

(declare-fun b!1403685 () Bool)

(declare-fun res!942191 () Bool)

(assert (=> b!1403685 (=> (not res!942191) (not e!794752))))

(assert (=> b!1403685 (= res!942191 (and (= (size!46879 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46879 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46879 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942196 () Bool)

(assert (=> start!120548 (=> (not res!942196) (not e!794752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120548 (= res!942196 (validMask!0 mask!2840))))

(assert (=> start!120548 e!794752))

(assert (=> start!120548 true))

(declare-fun array_inv!35357 (array!95957) Bool)

(assert (=> start!120548 (array_inv!35357 a!2901)))

(declare-fun b!1403684 () Bool)

(declare-fun res!942190 () Bool)

(assert (=> b!1403684 (=> (not res!942190) (not e!794752))))

(assert (=> b!1403684 (= res!942190 (validKeyInArray!0 (select (arr!46329 a!2901) j!112)))))

(assert (= (and start!120548 res!942196) b!1403685))

(assert (= (and b!1403685 res!942191) b!1403680))

(assert (= (and b!1403680 res!942194) b!1403684))

(assert (= (and b!1403684 res!942190) b!1403681))

(assert (= (and b!1403681 res!942193) b!1403679))

(assert (= (and b!1403679 res!942192) b!1403682))

(assert (= (and b!1403682 res!942195) b!1403683))

(declare-fun m!1292393 () Bool)

(assert (=> b!1403681 m!1292393))

(declare-fun m!1292395 () Bool)

(assert (=> b!1403679 m!1292395))

(declare-fun m!1292397 () Bool)

(assert (=> b!1403683 m!1292397))

(assert (=> b!1403683 m!1292397))

(declare-fun m!1292399 () Bool)

(assert (=> b!1403683 m!1292399))

(assert (=> b!1403684 m!1292397))

(assert (=> b!1403684 m!1292397))

(declare-fun m!1292401 () Bool)

(assert (=> b!1403684 m!1292401))

(declare-fun m!1292403 () Bool)

(assert (=> b!1403680 m!1292403))

(assert (=> b!1403680 m!1292403))

(declare-fun m!1292405 () Bool)

(assert (=> b!1403680 m!1292405))

(declare-fun m!1292407 () Bool)

(assert (=> start!120548 m!1292407))

(declare-fun m!1292409 () Bool)

(assert (=> start!120548 m!1292409))

(assert (=> b!1403682 m!1292397))

(declare-fun m!1292411 () Bool)

(assert (=> b!1403682 m!1292411))

(assert (=> b!1403682 m!1292397))

(declare-fun m!1292413 () Bool)

(assert (=> b!1403682 m!1292413))

(assert (=> b!1403682 m!1292411))

(assert (=> b!1403682 m!1292397))

(declare-fun m!1292415 () Bool)

(assert (=> b!1403682 m!1292415))

(declare-fun m!1292417 () Bool)

(assert (=> b!1403682 m!1292417))

(check-sat (not b!1403682) (not start!120548) (not b!1403679) (not b!1403683) (not b!1403681) (not b!1403680) (not b!1403684))
(check-sat)
