; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120530 () Bool)

(assert start!120530)

(declare-fun b!1403486 () Bool)

(declare-fun e!794667 () Bool)

(assert (=> b!1403486 (= e!794667 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95939 0))(
  ( (array!95940 (arr!46320 (Array (_ BitVec 32) (_ BitVec 64))) (size!46870 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95939)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10637 0))(
  ( (MissingZero!10637 (index!44925 (_ BitVec 32))) (Found!10637 (index!44926 (_ BitVec 32))) (Intermediate!10637 (undefined!11449 Bool) (index!44927 (_ BitVec 32)) (x!126536 (_ BitVec 32))) (Undefined!10637) (MissingVacant!10637 (index!44928 (_ BitVec 32))) )
))
(declare-fun lt!618419 () SeekEntryResult!10637)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95939 (_ BitVec 32)) SeekEntryResult!10637)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403486 (= lt!618419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46320 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46320 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95940 (store (arr!46320 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46870 a!2901)) mask!2840))))

(declare-fun b!1403487 () Bool)

(declare-fun res!941998 () Bool)

(declare-fun e!794669 () Bool)

(assert (=> b!1403487 (=> (not res!941998) (not e!794669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403487 (= res!941998 (validKeyInArray!0 (select (arr!46320 a!2901) i!1037)))))

(declare-fun b!1403488 () Bool)

(declare-fun res!942004 () Bool)

(assert (=> b!1403488 (=> (not res!942004) (not e!794669))))

(assert (=> b!1403488 (= res!942004 (and (= (size!46870 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46870 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46870 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403489 () Bool)

(assert (=> b!1403489 (= e!794669 (not e!794667))))

(declare-fun res!941997 () Bool)

(assert (=> b!1403489 (=> res!941997 e!794667)))

(declare-fun lt!618420 () SeekEntryResult!10637)

(get-info :version)

(assert (=> b!1403489 (= res!941997 (or (not ((_ is Intermediate!10637) lt!618420)) (undefined!11449 lt!618420)))))

(declare-fun e!794666 () Bool)

(assert (=> b!1403489 e!794666))

(declare-fun res!942003 () Bool)

(assert (=> b!1403489 (=> (not res!942003) (not e!794666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95939 (_ BitVec 32)) Bool)

(assert (=> b!1403489 (= res!942003 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47278 0))(
  ( (Unit!47279) )
))
(declare-fun lt!618418 () Unit!47278)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47278)

(assert (=> b!1403489 (= lt!618418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403489 (= lt!618420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46320 a!2901) j!112) mask!2840) (select (arr!46320 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403490 () Bool)

(declare-fun res!942001 () Bool)

(assert (=> b!1403490 (=> (not res!942001) (not e!794669))))

(assert (=> b!1403490 (= res!942001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403491 () Bool)

(declare-fun res!942000 () Bool)

(assert (=> b!1403491 (=> (not res!942000) (not e!794669))))

(assert (=> b!1403491 (= res!942000 (validKeyInArray!0 (select (arr!46320 a!2901) j!112)))))

(declare-fun b!1403492 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95939 (_ BitVec 32)) SeekEntryResult!10637)

(assert (=> b!1403492 (= e!794666 (= (seekEntryOrOpen!0 (select (arr!46320 a!2901) j!112) a!2901 mask!2840) (Found!10637 j!112)))))

(declare-fun res!941999 () Bool)

(assert (=> start!120530 (=> (not res!941999) (not e!794669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120530 (= res!941999 (validMask!0 mask!2840))))

(assert (=> start!120530 e!794669))

(assert (=> start!120530 true))

(declare-fun array_inv!35348 (array!95939) Bool)

(assert (=> start!120530 (array_inv!35348 a!2901)))

(declare-fun b!1403493 () Bool)

(declare-fun res!942002 () Bool)

(assert (=> b!1403493 (=> (not res!942002) (not e!794669))))

(declare-datatypes ((List!32839 0))(
  ( (Nil!32836) (Cons!32835 (h!34083 (_ BitVec 64)) (t!47533 List!32839)) )
))
(declare-fun arrayNoDuplicates!0 (array!95939 (_ BitVec 32) List!32839) Bool)

(assert (=> b!1403493 (= res!942002 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32836))))

(assert (= (and start!120530 res!941999) b!1403488))

(assert (= (and b!1403488 res!942004) b!1403487))

(assert (= (and b!1403487 res!941998) b!1403491))

(assert (= (and b!1403491 res!942000) b!1403490))

(assert (= (and b!1403490 res!942001) b!1403493))

(assert (= (and b!1403493 res!942002) b!1403489))

(assert (= (and b!1403489 res!942003) b!1403492))

(assert (= (and b!1403489 (not res!941997)) b!1403486))

(declare-fun m!1292143 () Bool)

(assert (=> b!1403486 m!1292143))

(declare-fun m!1292145 () Bool)

(assert (=> b!1403486 m!1292145))

(assert (=> b!1403486 m!1292145))

(declare-fun m!1292147 () Bool)

(assert (=> b!1403486 m!1292147))

(assert (=> b!1403486 m!1292147))

(assert (=> b!1403486 m!1292145))

(declare-fun m!1292149 () Bool)

(assert (=> b!1403486 m!1292149))

(declare-fun m!1292151 () Bool)

(assert (=> b!1403492 m!1292151))

(assert (=> b!1403492 m!1292151))

(declare-fun m!1292153 () Bool)

(assert (=> b!1403492 m!1292153))

(assert (=> b!1403491 m!1292151))

(assert (=> b!1403491 m!1292151))

(declare-fun m!1292155 () Bool)

(assert (=> b!1403491 m!1292155))

(assert (=> b!1403489 m!1292151))

(declare-fun m!1292157 () Bool)

(assert (=> b!1403489 m!1292157))

(assert (=> b!1403489 m!1292151))

(declare-fun m!1292159 () Bool)

(assert (=> b!1403489 m!1292159))

(assert (=> b!1403489 m!1292157))

(assert (=> b!1403489 m!1292151))

(declare-fun m!1292161 () Bool)

(assert (=> b!1403489 m!1292161))

(declare-fun m!1292163 () Bool)

(assert (=> b!1403489 m!1292163))

(declare-fun m!1292165 () Bool)

(assert (=> b!1403490 m!1292165))

(declare-fun m!1292167 () Bool)

(assert (=> b!1403493 m!1292167))

(declare-fun m!1292169 () Bool)

(assert (=> start!120530 m!1292169))

(declare-fun m!1292171 () Bool)

(assert (=> start!120530 m!1292171))

(declare-fun m!1292173 () Bool)

(assert (=> b!1403487 m!1292173))

(assert (=> b!1403487 m!1292173))

(declare-fun m!1292175 () Bool)

(assert (=> b!1403487 m!1292175))

(check-sat (not b!1403492) (not b!1403486) (not start!120530) (not b!1403489) (not b!1403491) (not b!1403493) (not b!1403487) (not b!1403490))
