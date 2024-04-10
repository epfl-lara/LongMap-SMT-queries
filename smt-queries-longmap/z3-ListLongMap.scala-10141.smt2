; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119612 () Bool)

(assert start!119612)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!788942 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1393283 () Bool)

(declare-datatypes ((array!95294 0))(
  ( (array!95295 (arr!46005 (Array (_ BitVec 32) (_ BitVec 64))) (size!46555 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95294)

(declare-datatypes ((SeekEntryResult!10322 0))(
  ( (MissingZero!10322 (index!43659 (_ BitVec 32))) (Found!10322 (index!43660 (_ BitVec 32))) (Intermediate!10322 (undefined!11134 Bool) (index!43661 (_ BitVec 32)) (x!125342 (_ BitVec 32))) (Undefined!10322) (MissingVacant!10322 (index!43662 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95294 (_ BitVec 32)) SeekEntryResult!10322)

(assert (=> b!1393283 (= e!788942 (= (seekEntryOrOpen!0 (select (arr!46005 a!2901) j!112) a!2901 mask!2840) (Found!10322 j!112)))))

(declare-fun b!1393284 () Bool)

(declare-fun res!932698 () Bool)

(declare-fun e!788940 () Bool)

(assert (=> b!1393284 (=> (not res!932698) (not e!788940))))

(declare-datatypes ((List!32524 0))(
  ( (Nil!32521) (Cons!32520 (h!33753 (_ BitVec 64)) (t!47218 List!32524)) )
))
(declare-fun arrayNoDuplicates!0 (array!95294 (_ BitVec 32) List!32524) Bool)

(assert (=> b!1393284 (= res!932698 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32521))))

(declare-fun b!1393285 () Bool)

(declare-fun res!932692 () Bool)

(assert (=> b!1393285 (=> (not res!932692) (not e!788940))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393285 (= res!932692 (and (= (size!46555 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46555 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46555 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393286 () Bool)

(declare-fun res!932693 () Bool)

(assert (=> b!1393286 (=> (not res!932693) (not e!788940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393286 (= res!932693 (validKeyInArray!0 (select (arr!46005 a!2901) i!1037)))))

(declare-fun b!1393287 () Bool)

(declare-fun e!788939 () Bool)

(assert (=> b!1393287 (= e!788939 true)))

(declare-fun lt!611933 () SeekEntryResult!10322)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95294 (_ BitVec 32)) SeekEntryResult!10322)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393287 (= lt!611933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46005 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46005 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95295 (store (arr!46005 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46555 a!2901)) mask!2840))))

(declare-fun res!932691 () Bool)

(assert (=> start!119612 (=> (not res!932691) (not e!788940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119612 (= res!932691 (validMask!0 mask!2840))))

(assert (=> start!119612 e!788940))

(assert (=> start!119612 true))

(declare-fun array_inv!35033 (array!95294) Bool)

(assert (=> start!119612 (array_inv!35033 a!2901)))

(declare-fun b!1393288 () Bool)

(declare-fun res!932694 () Bool)

(assert (=> b!1393288 (=> (not res!932694) (not e!788940))))

(assert (=> b!1393288 (= res!932694 (validKeyInArray!0 (select (arr!46005 a!2901) j!112)))))

(declare-fun b!1393289 () Bool)

(assert (=> b!1393289 (= e!788940 (not e!788939))))

(declare-fun res!932696 () Bool)

(assert (=> b!1393289 (=> res!932696 e!788939)))

(declare-fun lt!611934 () SeekEntryResult!10322)

(get-info :version)

(assert (=> b!1393289 (= res!932696 (or (not ((_ is Intermediate!10322) lt!611934)) (undefined!11134 lt!611934)))))

(assert (=> b!1393289 e!788942))

(declare-fun res!932697 () Bool)

(assert (=> b!1393289 (=> (not res!932697) (not e!788942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95294 (_ BitVec 32)) Bool)

(assert (=> b!1393289 (= res!932697 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46648 0))(
  ( (Unit!46649) )
))
(declare-fun lt!611932 () Unit!46648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46648)

(assert (=> b!1393289 (= lt!611932 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393289 (= lt!611934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46005 a!2901) j!112) mask!2840) (select (arr!46005 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393290 () Bool)

(declare-fun res!932695 () Bool)

(assert (=> b!1393290 (=> (not res!932695) (not e!788940))))

(assert (=> b!1393290 (= res!932695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119612 res!932691) b!1393285))

(assert (= (and b!1393285 res!932692) b!1393286))

(assert (= (and b!1393286 res!932693) b!1393288))

(assert (= (and b!1393288 res!932694) b!1393290))

(assert (= (and b!1393290 res!932695) b!1393284))

(assert (= (and b!1393284 res!932698) b!1393289))

(assert (= (and b!1393289 res!932697) b!1393283))

(assert (= (and b!1393289 (not res!932696)) b!1393287))

(declare-fun m!1279129 () Bool)

(assert (=> b!1393288 m!1279129))

(assert (=> b!1393288 m!1279129))

(declare-fun m!1279131 () Bool)

(assert (=> b!1393288 m!1279131))

(assert (=> b!1393289 m!1279129))

(declare-fun m!1279133 () Bool)

(assert (=> b!1393289 m!1279133))

(assert (=> b!1393289 m!1279129))

(declare-fun m!1279135 () Bool)

(assert (=> b!1393289 m!1279135))

(assert (=> b!1393289 m!1279133))

(assert (=> b!1393289 m!1279129))

(declare-fun m!1279137 () Bool)

(assert (=> b!1393289 m!1279137))

(declare-fun m!1279139 () Bool)

(assert (=> b!1393289 m!1279139))

(assert (=> b!1393283 m!1279129))

(assert (=> b!1393283 m!1279129))

(declare-fun m!1279141 () Bool)

(assert (=> b!1393283 m!1279141))

(declare-fun m!1279143 () Bool)

(assert (=> b!1393290 m!1279143))

(declare-fun m!1279145 () Bool)

(assert (=> b!1393284 m!1279145))

(declare-fun m!1279147 () Bool)

(assert (=> b!1393287 m!1279147))

(declare-fun m!1279149 () Bool)

(assert (=> b!1393287 m!1279149))

(assert (=> b!1393287 m!1279149))

(declare-fun m!1279151 () Bool)

(assert (=> b!1393287 m!1279151))

(assert (=> b!1393287 m!1279151))

(assert (=> b!1393287 m!1279149))

(declare-fun m!1279153 () Bool)

(assert (=> b!1393287 m!1279153))

(declare-fun m!1279155 () Bool)

(assert (=> start!119612 m!1279155))

(declare-fun m!1279157 () Bool)

(assert (=> start!119612 m!1279157))

(declare-fun m!1279159 () Bool)

(assert (=> b!1393286 m!1279159))

(assert (=> b!1393286 m!1279159))

(declare-fun m!1279161 () Bool)

(assert (=> b!1393286 m!1279161))

(check-sat (not b!1393287) (not b!1393283) (not b!1393290) (not b!1393289) (not start!119612) (not b!1393288) (not b!1393284) (not b!1393286))
