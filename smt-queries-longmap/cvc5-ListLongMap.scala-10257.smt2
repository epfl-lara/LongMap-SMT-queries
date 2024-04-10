; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120594 () Bool)

(assert start!120594)

(declare-fun b!1404133 () Bool)

(declare-fun res!942647 () Bool)

(declare-fun e!794938 () Bool)

(assert (=> b!1404133 (=> (not res!942647) (not e!794938))))

(declare-datatypes ((array!96003 0))(
  ( (array!96004 (arr!46352 (Array (_ BitVec 32) (_ BitVec 64))) (size!46902 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96003)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404133 (= res!942647 (validKeyInArray!0 (select (arr!46352 a!2901) i!1037)))))

(declare-fun b!1404134 () Bool)

(declare-fun res!942646 () Bool)

(assert (=> b!1404134 (=> (not res!942646) (not e!794938))))

(declare-datatypes ((List!32871 0))(
  ( (Nil!32868) (Cons!32867 (h!34115 (_ BitVec 64)) (t!47565 List!32871)) )
))
(declare-fun arrayNoDuplicates!0 (array!96003 (_ BitVec 32) List!32871) Bool)

(assert (=> b!1404134 (= res!942646 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32868))))

(declare-fun b!1404135 () Bool)

(declare-fun res!942648 () Bool)

(assert (=> b!1404135 (=> (not res!942648) (not e!794938))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404135 (= res!942648 (validKeyInArray!0 (select (arr!46352 a!2901) j!112)))))

(declare-fun res!942645 () Bool)

(assert (=> start!120594 (=> (not res!942645) (not e!794938))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120594 (= res!942645 (validMask!0 mask!2840))))

(assert (=> start!120594 e!794938))

(assert (=> start!120594 true))

(declare-fun array_inv!35380 (array!96003) Bool)

(assert (=> start!120594 (array_inv!35380 a!2901)))

(declare-fun b!1404136 () Bool)

(assert (=> b!1404136 (= e!794938 false)))

(declare-datatypes ((SeekEntryResult!10663 0))(
  ( (MissingZero!10663 (index!45029 (_ BitVec 32))) (Found!10663 (index!45030 (_ BitVec 32))) (Intermediate!10663 (undefined!11475 Bool) (index!45031 (_ BitVec 32)) (x!126650 (_ BitVec 32))) (Undefined!10663) (MissingVacant!10663 (index!45032 (_ BitVec 32))) )
))
(declare-fun lt!618594 () SeekEntryResult!10663)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96003 (_ BitVec 32)) SeekEntryResult!10663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404136 (= lt!618594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46352 a!2901) j!112) mask!2840) (select (arr!46352 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404137 () Bool)

(declare-fun res!942644 () Bool)

(assert (=> b!1404137 (=> (not res!942644) (not e!794938))))

(assert (=> b!1404137 (= res!942644 (and (= (size!46902 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46902 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46902 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404138 () Bool)

(declare-fun res!942649 () Bool)

(assert (=> b!1404138 (=> (not res!942649) (not e!794938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96003 (_ BitVec 32)) Bool)

(assert (=> b!1404138 (= res!942649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120594 res!942645) b!1404137))

(assert (= (and b!1404137 res!942644) b!1404133))

(assert (= (and b!1404133 res!942647) b!1404135))

(assert (= (and b!1404135 res!942648) b!1404138))

(assert (= (and b!1404138 res!942649) b!1404134))

(assert (= (and b!1404134 res!942646) b!1404136))

(declare-fun m!1292937 () Bool)

(assert (=> start!120594 m!1292937))

(declare-fun m!1292939 () Bool)

(assert (=> start!120594 m!1292939))

(declare-fun m!1292941 () Bool)

(assert (=> b!1404134 m!1292941))

(declare-fun m!1292943 () Bool)

(assert (=> b!1404135 m!1292943))

(assert (=> b!1404135 m!1292943))

(declare-fun m!1292945 () Bool)

(assert (=> b!1404135 m!1292945))

(declare-fun m!1292947 () Bool)

(assert (=> b!1404133 m!1292947))

(assert (=> b!1404133 m!1292947))

(declare-fun m!1292949 () Bool)

(assert (=> b!1404133 m!1292949))

(declare-fun m!1292951 () Bool)

(assert (=> b!1404138 m!1292951))

(assert (=> b!1404136 m!1292943))

(assert (=> b!1404136 m!1292943))

(declare-fun m!1292953 () Bool)

(assert (=> b!1404136 m!1292953))

(assert (=> b!1404136 m!1292953))

(assert (=> b!1404136 m!1292943))

(declare-fun m!1292955 () Bool)

(assert (=> b!1404136 m!1292955))

(push 1)

(assert (not b!1404135))

(assert (not b!1404136))

(assert (not start!120594))

(assert (not b!1404133))

(assert (not b!1404134))

(assert (not b!1404138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

