; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120340 () Bool)

(assert start!120340)

(declare-fun e!793011 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95749 0))(
  ( (array!95750 (arr!46225 (Array (_ BitVec 32) (_ BitVec 64))) (size!46775 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95749)

(declare-fun lt!616334 () array!95749)

(declare-fun lt!616341 () (_ BitVec 64))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1400618 () Bool)

(declare-datatypes ((SeekEntryResult!10542 0))(
  ( (MissingZero!10542 (index!44545 (_ BitVec 32))) (Found!10542 (index!44546 (_ BitVec 32))) (Intermediate!10542 (undefined!11354 Bool) (index!44547 (_ BitVec 32)) (x!126185 (_ BitVec 32))) (Undefined!10542) (MissingVacant!10542 (index!44548 (_ BitVec 32))) )
))
(declare-fun lt!616338 () SeekEntryResult!10542)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95749 (_ BitVec 32)) SeekEntryResult!10542)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95749 (_ BitVec 32)) SeekEntryResult!10542)

(assert (=> b!1400618 (= e!793011 (= (seekEntryOrOpen!0 lt!616341 lt!616334 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126185 lt!616338) (index!44547 lt!616338) (index!44547 lt!616338) (select (arr!46225 a!2901) j!112) lt!616334 mask!2840)))))

(declare-fun b!1400619 () Bool)

(declare-fun e!793014 () Bool)

(declare-fun e!793016 () Bool)

(assert (=> b!1400619 (= e!793014 (not e!793016))))

(declare-fun res!939132 () Bool)

(assert (=> b!1400619 (=> res!939132 e!793016)))

(declare-fun lt!616336 () SeekEntryResult!10542)

(assert (=> b!1400619 (= res!939132 (or (not (is-Intermediate!10542 lt!616336)) (undefined!11354 lt!616336)))))

(declare-fun e!793015 () Bool)

(assert (=> b!1400619 e!793015))

(declare-fun res!939133 () Bool)

(assert (=> b!1400619 (=> (not res!939133) (not e!793015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95749 (_ BitVec 32)) Bool)

(assert (=> b!1400619 (= res!939133 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47088 0))(
  ( (Unit!47089) )
))
(declare-fun lt!616337 () Unit!47088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47088)

(assert (=> b!1400619 (= lt!616337 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616335 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95749 (_ BitVec 32)) SeekEntryResult!10542)

(assert (=> b!1400619 (= lt!616336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616335 (select (arr!46225 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400619 (= lt!616335 (toIndex!0 (select (arr!46225 a!2901) j!112) mask!2840))))

(declare-fun b!1400620 () Bool)

(declare-fun res!939139 () Bool)

(assert (=> b!1400620 (=> (not res!939139) (not e!793014))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400620 (= res!939139 (validKeyInArray!0 (select (arr!46225 a!2901) i!1037)))))

(declare-fun b!1400621 () Bool)

(declare-fun e!793013 () Bool)

(assert (=> b!1400621 (= e!793013 true)))

(declare-fun lt!616339 () SeekEntryResult!10542)

(assert (=> b!1400621 (= lt!616339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616335 lt!616341 lt!616334 mask!2840))))

(declare-fun b!1400622 () Bool)

(declare-fun e!793012 () Bool)

(assert (=> b!1400622 (= e!793012 e!793013)))

(declare-fun res!939137 () Bool)

(assert (=> b!1400622 (=> res!939137 e!793013)))

(assert (=> b!1400622 (= res!939137 (or (bvslt (x!126185 lt!616336) #b00000000000000000000000000000000) (bvsgt (x!126185 lt!616336) #b01111111111111111111111111111110) (bvslt (x!126185 lt!616338) #b00000000000000000000000000000000) (bvsgt (x!126185 lt!616338) #b01111111111111111111111111111110) (bvslt lt!616335 #b00000000000000000000000000000000) (bvsge lt!616335 (size!46775 a!2901)) (bvslt (index!44547 lt!616336) #b00000000000000000000000000000000) (bvsge (index!44547 lt!616336) (size!46775 a!2901)) (bvslt (index!44547 lt!616338) #b00000000000000000000000000000000) (bvsge (index!44547 lt!616338) (size!46775 a!2901)) (not (= lt!616336 (Intermediate!10542 false (index!44547 lt!616336) (x!126185 lt!616336)))) (not (= lt!616338 (Intermediate!10542 false (index!44547 lt!616338) (x!126185 lt!616338))))))))

(assert (=> b!1400622 e!793011))

(declare-fun res!939130 () Bool)

(assert (=> b!1400622 (=> (not res!939130) (not e!793011))))

(assert (=> b!1400622 (= res!939130 (and (not (undefined!11354 lt!616338)) (= (index!44547 lt!616338) i!1037) (bvslt (x!126185 lt!616338) (x!126185 lt!616336)) (= (select (store (arr!46225 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44547 lt!616338)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616340 () Unit!47088)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47088)

(assert (=> b!1400622 (= lt!616340 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616335 (x!126185 lt!616336) (index!44547 lt!616336) (x!126185 lt!616338) (index!44547 lt!616338) (undefined!11354 lt!616338) mask!2840))))

(declare-fun b!1400623 () Bool)

(declare-fun res!939134 () Bool)

(assert (=> b!1400623 (=> (not res!939134) (not e!793014))))

(assert (=> b!1400623 (= res!939134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400624 () Bool)

(declare-fun res!939131 () Bool)

(assert (=> b!1400624 (=> (not res!939131) (not e!793014))))

(assert (=> b!1400624 (= res!939131 (and (= (size!46775 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46775 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46775 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400625 () Bool)

(assert (=> b!1400625 (= e!793015 (= (seekEntryOrOpen!0 (select (arr!46225 a!2901) j!112) a!2901 mask!2840) (Found!10542 j!112)))))

(declare-fun b!1400626 () Bool)

(declare-fun res!939129 () Bool)

(assert (=> b!1400626 (=> (not res!939129) (not e!793014))))

(declare-datatypes ((List!32744 0))(
  ( (Nil!32741) (Cons!32740 (h!33988 (_ BitVec 64)) (t!47438 List!32744)) )
))
(declare-fun arrayNoDuplicates!0 (array!95749 (_ BitVec 32) List!32744) Bool)

(assert (=> b!1400626 (= res!939129 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32741))))

(declare-fun b!1400628 () Bool)

(declare-fun res!939138 () Bool)

(assert (=> b!1400628 (=> (not res!939138) (not e!793014))))

(assert (=> b!1400628 (= res!939138 (validKeyInArray!0 (select (arr!46225 a!2901) j!112)))))

(declare-fun b!1400627 () Bool)

(assert (=> b!1400627 (= e!793016 e!793012)))

(declare-fun res!939136 () Bool)

(assert (=> b!1400627 (=> res!939136 e!793012)))

(assert (=> b!1400627 (= res!939136 (or (= lt!616336 lt!616338) (not (is-Intermediate!10542 lt!616338))))))

(assert (=> b!1400627 (= lt!616338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616341 mask!2840) lt!616341 lt!616334 mask!2840))))

(assert (=> b!1400627 (= lt!616341 (select (store (arr!46225 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400627 (= lt!616334 (array!95750 (store (arr!46225 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46775 a!2901)))))

(declare-fun res!939135 () Bool)

(assert (=> start!120340 (=> (not res!939135) (not e!793014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120340 (= res!939135 (validMask!0 mask!2840))))

(assert (=> start!120340 e!793014))

(assert (=> start!120340 true))

(declare-fun array_inv!35253 (array!95749) Bool)

(assert (=> start!120340 (array_inv!35253 a!2901)))

(assert (= (and start!120340 res!939135) b!1400624))

(assert (= (and b!1400624 res!939131) b!1400620))

(assert (= (and b!1400620 res!939139) b!1400628))

(assert (= (and b!1400628 res!939138) b!1400623))

(assert (= (and b!1400623 res!939134) b!1400626))

(assert (= (and b!1400626 res!939129) b!1400619))

(assert (= (and b!1400619 res!939133) b!1400625))

(assert (= (and b!1400619 (not res!939132)) b!1400627))

(assert (= (and b!1400627 (not res!939136)) b!1400622))

(assert (= (and b!1400622 res!939130) b!1400618))

(assert (= (and b!1400622 (not res!939137)) b!1400621))

(declare-fun m!1288129 () Bool)

(assert (=> b!1400620 m!1288129))

(assert (=> b!1400620 m!1288129))

(declare-fun m!1288131 () Bool)

(assert (=> b!1400620 m!1288131))

(declare-fun m!1288133 () Bool)

(assert (=> b!1400618 m!1288133))

(declare-fun m!1288135 () Bool)

(assert (=> b!1400618 m!1288135))

(assert (=> b!1400618 m!1288135))

(declare-fun m!1288137 () Bool)

(assert (=> b!1400618 m!1288137))

(declare-fun m!1288139 () Bool)

(assert (=> b!1400627 m!1288139))

(assert (=> b!1400627 m!1288139))

(declare-fun m!1288141 () Bool)

(assert (=> b!1400627 m!1288141))

(declare-fun m!1288143 () Bool)

(assert (=> b!1400627 m!1288143))

(declare-fun m!1288145 () Bool)

(assert (=> b!1400627 m!1288145))

(declare-fun m!1288147 () Bool)

(assert (=> b!1400623 m!1288147))

(assert (=> b!1400619 m!1288135))

(declare-fun m!1288149 () Bool)

(assert (=> b!1400619 m!1288149))

(assert (=> b!1400619 m!1288135))

(declare-fun m!1288151 () Bool)

(assert (=> b!1400619 m!1288151))

(assert (=> b!1400619 m!1288135))

(declare-fun m!1288153 () Bool)

(assert (=> b!1400619 m!1288153))

(declare-fun m!1288155 () Bool)

(assert (=> b!1400619 m!1288155))

(declare-fun m!1288157 () Bool)

(assert (=> b!1400626 m!1288157))

(declare-fun m!1288159 () Bool)

(assert (=> start!120340 m!1288159))

(declare-fun m!1288161 () Bool)

(assert (=> start!120340 m!1288161))

(assert (=> b!1400622 m!1288143))

(declare-fun m!1288163 () Bool)

(assert (=> b!1400622 m!1288163))

(declare-fun m!1288165 () Bool)

(assert (=> b!1400622 m!1288165))

(declare-fun m!1288167 () Bool)

(assert (=> b!1400621 m!1288167))

(assert (=> b!1400625 m!1288135))

(assert (=> b!1400625 m!1288135))

(declare-fun m!1288169 () Bool)

(assert (=> b!1400625 m!1288169))

(assert (=> b!1400628 m!1288135))

(assert (=> b!1400628 m!1288135))

(declare-fun m!1288171 () Bool)

(assert (=> b!1400628 m!1288171))

(push 1)

