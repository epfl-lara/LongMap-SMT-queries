; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119644 () Bool)

(assert start!119644)

(declare-fun b!1393667 () Bool)

(declare-fun e!789133 () Bool)

(declare-fun e!789131 () Bool)

(assert (=> b!1393667 (= e!789133 (not e!789131))))

(declare-fun res!933081 () Bool)

(assert (=> b!1393667 (=> res!933081 e!789131)))

(declare-datatypes ((SeekEntryResult!10338 0))(
  ( (MissingZero!10338 (index!43723 (_ BitVec 32))) (Found!10338 (index!43724 (_ BitVec 32))) (Intermediate!10338 (undefined!11150 Bool) (index!43725 (_ BitVec 32)) (x!125398 (_ BitVec 32))) (Undefined!10338) (MissingVacant!10338 (index!43726 (_ BitVec 32))) )
))
(declare-fun lt!612076 () SeekEntryResult!10338)

(assert (=> b!1393667 (= res!933081 (or (not (is-Intermediate!10338 lt!612076)) (undefined!11150 lt!612076)))))

(declare-fun e!789134 () Bool)

(assert (=> b!1393667 e!789134))

(declare-fun res!933077 () Bool)

(assert (=> b!1393667 (=> (not res!933077) (not e!789134))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95326 0))(
  ( (array!95327 (arr!46021 (Array (_ BitVec 32) (_ BitVec 64))) (size!46571 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95326)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95326 (_ BitVec 32)) Bool)

(assert (=> b!1393667 (= res!933077 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46680 0))(
  ( (Unit!46681) )
))
(declare-fun lt!612078 () Unit!46680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46680)

(assert (=> b!1393667 (= lt!612078 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95326 (_ BitVec 32)) SeekEntryResult!10338)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393667 (= lt!612076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46021 a!2901) j!112) mask!2840) (select (arr!46021 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393668 () Bool)

(declare-fun res!933076 () Bool)

(assert (=> b!1393668 (=> (not res!933076) (not e!789133))))

(declare-datatypes ((List!32540 0))(
  ( (Nil!32537) (Cons!32536 (h!33769 (_ BitVec 64)) (t!47234 List!32540)) )
))
(declare-fun arrayNoDuplicates!0 (array!95326 (_ BitVec 32) List!32540) Bool)

(assert (=> b!1393668 (= res!933076 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32537))))

(declare-fun b!1393669 () Bool)

(declare-fun res!933075 () Bool)

(assert (=> b!1393669 (=> (not res!933075) (not e!789133))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393669 (= res!933075 (and (= (size!46571 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46571 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46571 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393670 () Bool)

(declare-fun res!933082 () Bool)

(assert (=> b!1393670 (=> (not res!933082) (not e!789133))))

(assert (=> b!1393670 (= res!933082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!933078 () Bool)

(assert (=> start!119644 (=> (not res!933078) (not e!789133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119644 (= res!933078 (validMask!0 mask!2840))))

(assert (=> start!119644 e!789133))

(assert (=> start!119644 true))

(declare-fun array_inv!35049 (array!95326) Bool)

(assert (=> start!119644 (array_inv!35049 a!2901)))

(declare-fun b!1393671 () Bool)

(declare-fun res!933079 () Bool)

(assert (=> b!1393671 (=> (not res!933079) (not e!789133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393671 (= res!933079 (validKeyInArray!0 (select (arr!46021 a!2901) j!112)))))

(declare-fun b!1393672 () Bool)

(assert (=> b!1393672 (= e!789131 true)))

(declare-fun lt!612077 () SeekEntryResult!10338)

(assert (=> b!1393672 (= lt!612077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46021 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46021 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95327 (store (arr!46021 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46571 a!2901)) mask!2840))))

(declare-fun b!1393673 () Bool)

(declare-fun res!933080 () Bool)

(assert (=> b!1393673 (=> (not res!933080) (not e!789133))))

(assert (=> b!1393673 (= res!933080 (validKeyInArray!0 (select (arr!46021 a!2901) i!1037)))))

(declare-fun b!1393674 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95326 (_ BitVec 32)) SeekEntryResult!10338)

(assert (=> b!1393674 (= e!789134 (= (seekEntryOrOpen!0 (select (arr!46021 a!2901) j!112) a!2901 mask!2840) (Found!10338 j!112)))))

(assert (= (and start!119644 res!933078) b!1393669))

(assert (= (and b!1393669 res!933075) b!1393673))

(assert (= (and b!1393673 res!933080) b!1393671))

(assert (= (and b!1393671 res!933079) b!1393670))

(assert (= (and b!1393670 res!933082) b!1393668))

(assert (= (and b!1393668 res!933076) b!1393667))

(assert (= (and b!1393667 res!933077) b!1393674))

(assert (= (and b!1393667 (not res!933081)) b!1393672))

(declare-fun m!1279673 () Bool)

(assert (=> b!1393671 m!1279673))

(assert (=> b!1393671 m!1279673))

(declare-fun m!1279675 () Bool)

(assert (=> b!1393671 m!1279675))

(declare-fun m!1279677 () Bool)

(assert (=> b!1393672 m!1279677))

(declare-fun m!1279679 () Bool)

(assert (=> b!1393672 m!1279679))

(assert (=> b!1393672 m!1279679))

(declare-fun m!1279681 () Bool)

(assert (=> b!1393672 m!1279681))

(assert (=> b!1393672 m!1279681))

(assert (=> b!1393672 m!1279679))

(declare-fun m!1279683 () Bool)

(assert (=> b!1393672 m!1279683))

(declare-fun m!1279685 () Bool)

(assert (=> start!119644 m!1279685))

(declare-fun m!1279687 () Bool)

(assert (=> start!119644 m!1279687))

(declare-fun m!1279689 () Bool)

(assert (=> b!1393668 m!1279689))

(declare-fun m!1279691 () Bool)

(assert (=> b!1393673 m!1279691))

(assert (=> b!1393673 m!1279691))

(declare-fun m!1279693 () Bool)

(assert (=> b!1393673 m!1279693))

(assert (=> b!1393674 m!1279673))

(assert (=> b!1393674 m!1279673))

(declare-fun m!1279695 () Bool)

(assert (=> b!1393674 m!1279695))

(assert (=> b!1393667 m!1279673))

(declare-fun m!1279697 () Bool)

(assert (=> b!1393667 m!1279697))

(assert (=> b!1393667 m!1279673))

(declare-fun m!1279699 () Bool)

(assert (=> b!1393667 m!1279699))

(assert (=> b!1393667 m!1279697))

(assert (=> b!1393667 m!1279673))

(declare-fun m!1279701 () Bool)

(assert (=> b!1393667 m!1279701))

(declare-fun m!1279703 () Bool)

(assert (=> b!1393667 m!1279703))

(declare-fun m!1279705 () Bool)

(assert (=> b!1393670 m!1279705))

(push 1)

(assert (not b!1393667))

(assert (not b!1393671))

(assert (not b!1393670))

(assert (not start!119644))

(assert (not b!1393673))

(assert (not b!1393672))

(assert (not b!1393674))

(assert (not b!1393668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

