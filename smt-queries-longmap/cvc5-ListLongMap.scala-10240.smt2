; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120684 () Bool)

(assert start!120684)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96015 0))(
  ( (array!96016 (arr!46356 (Array (_ BitVec 32) (_ BitVec 64))) (size!46907 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96015)

(declare-fun e!795200 () Bool)

(declare-fun b!1404218 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10576 0))(
  ( (MissingZero!10576 (index!44681 (_ BitVec 32))) (Found!10576 (index!44682 (_ BitVec 32))) (Intermediate!10576 (undefined!11388 Bool) (index!44683 (_ BitVec 32)) (x!126446 (_ BitVec 32))) (Undefined!10576) (MissingVacant!10576 (index!44684 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96015 (_ BitVec 32)) SeekEntryResult!10576)

(assert (=> b!1404218 (= e!795200 (= (seekEntryOrOpen!0 (select (arr!46356 a!2901) j!112) a!2901 mask!2840) (Found!10576 j!112)))))

(declare-fun b!1404219 () Bool)

(declare-fun res!942045 () Bool)

(declare-fun e!795203 () Bool)

(assert (=> b!1404219 (=> (not res!942045) (not e!795203))))

(declare-datatypes ((List!32862 0))(
  ( (Nil!32859) (Cons!32858 (h!34114 (_ BitVec 64)) (t!47548 List!32862)) )
))
(declare-fun arrayNoDuplicates!0 (array!96015 (_ BitVec 32) List!32862) Bool)

(assert (=> b!1404219 (= res!942045 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32859))))

(declare-fun b!1404220 () Bool)

(declare-fun e!795202 () Bool)

(assert (=> b!1404220 (= e!795202 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!618663 () SeekEntryResult!10576)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96015 (_ BitVec 32)) SeekEntryResult!10576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404220 (= lt!618663 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46356 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46356 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96016 (store (arr!46356 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46907 a!2901)) mask!2840))))

(declare-fun b!1404221 () Bool)

(declare-fun res!942047 () Bool)

(assert (=> b!1404221 (=> (not res!942047) (not e!795203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96015 (_ BitVec 32)) Bool)

(assert (=> b!1404221 (= res!942047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404222 () Bool)

(declare-fun res!942049 () Bool)

(assert (=> b!1404222 (=> (not res!942049) (not e!795203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404222 (= res!942049 (validKeyInArray!0 (select (arr!46356 a!2901) j!112)))))

(declare-fun b!1404223 () Bool)

(assert (=> b!1404223 (= e!795203 (not e!795202))))

(declare-fun res!942048 () Bool)

(assert (=> b!1404223 (=> res!942048 e!795202)))

(declare-fun lt!618664 () SeekEntryResult!10576)

(assert (=> b!1404223 (= res!942048 (or (not (is-Intermediate!10576 lt!618664)) (undefined!11388 lt!618664)))))

(assert (=> b!1404223 e!795200))

(declare-fun res!942050 () Bool)

(assert (=> b!1404223 (=> (not res!942050) (not e!795200))))

(assert (=> b!1404223 (= res!942050 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47183 0))(
  ( (Unit!47184) )
))
(declare-fun lt!618665 () Unit!47183)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96015 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47183)

(assert (=> b!1404223 (= lt!618665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1404223 (= lt!618664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46356 a!2901) j!112) mask!2840) (select (arr!46356 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942051 () Bool)

(assert (=> start!120684 (=> (not res!942051) (not e!795203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120684 (= res!942051 (validMask!0 mask!2840))))

(assert (=> start!120684 e!795203))

(assert (=> start!120684 true))

(declare-fun array_inv!35637 (array!96015) Bool)

(assert (=> start!120684 (array_inv!35637 a!2901)))

(declare-fun b!1404224 () Bool)

(declare-fun res!942046 () Bool)

(assert (=> b!1404224 (=> (not res!942046) (not e!795203))))

(assert (=> b!1404224 (= res!942046 (and (= (size!46907 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46907 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46907 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404225 () Bool)

(declare-fun res!942052 () Bool)

(assert (=> b!1404225 (=> (not res!942052) (not e!795203))))

(assert (=> b!1404225 (= res!942052 (validKeyInArray!0 (select (arr!46356 a!2901) i!1037)))))

(assert (= (and start!120684 res!942051) b!1404224))

(assert (= (and b!1404224 res!942046) b!1404225))

(assert (= (and b!1404225 res!942052) b!1404222))

(assert (= (and b!1404222 res!942049) b!1404221))

(assert (= (and b!1404221 res!942047) b!1404219))

(assert (= (and b!1404219 res!942045) b!1404223))

(assert (= (and b!1404223 res!942050) b!1404218))

(assert (= (and b!1404223 (not res!942048)) b!1404220))

(declare-fun m!1292937 () Bool)

(assert (=> b!1404221 m!1292937))

(declare-fun m!1292939 () Bool)

(assert (=> start!120684 m!1292939))

(declare-fun m!1292941 () Bool)

(assert (=> start!120684 m!1292941))

(declare-fun m!1292943 () Bool)

(assert (=> b!1404225 m!1292943))

(assert (=> b!1404225 m!1292943))

(declare-fun m!1292945 () Bool)

(assert (=> b!1404225 m!1292945))

(declare-fun m!1292947 () Bool)

(assert (=> b!1404223 m!1292947))

(declare-fun m!1292949 () Bool)

(assert (=> b!1404223 m!1292949))

(assert (=> b!1404223 m!1292947))

(declare-fun m!1292951 () Bool)

(assert (=> b!1404223 m!1292951))

(assert (=> b!1404223 m!1292949))

(assert (=> b!1404223 m!1292947))

(declare-fun m!1292953 () Bool)

(assert (=> b!1404223 m!1292953))

(declare-fun m!1292955 () Bool)

(assert (=> b!1404223 m!1292955))

(assert (=> b!1404222 m!1292947))

(assert (=> b!1404222 m!1292947))

(declare-fun m!1292957 () Bool)

(assert (=> b!1404222 m!1292957))

(declare-fun m!1292959 () Bool)

(assert (=> b!1404220 m!1292959))

(declare-fun m!1292961 () Bool)

(assert (=> b!1404220 m!1292961))

(assert (=> b!1404220 m!1292961))

(declare-fun m!1292963 () Bool)

(assert (=> b!1404220 m!1292963))

(assert (=> b!1404220 m!1292963))

(assert (=> b!1404220 m!1292961))

(declare-fun m!1292965 () Bool)

(assert (=> b!1404220 m!1292965))

(assert (=> b!1404218 m!1292947))

(assert (=> b!1404218 m!1292947))

(declare-fun m!1292967 () Bool)

(assert (=> b!1404218 m!1292967))

(declare-fun m!1292969 () Bool)

(assert (=> b!1404219 m!1292969))

(push 1)

(assert (not b!1404222))

(assert (not b!1404220))

(assert (not b!1404223))

(assert (not b!1404225))

(assert (not b!1404219))

(assert (not start!120684))

(assert (not b!1404218))

(assert (not b!1404221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

