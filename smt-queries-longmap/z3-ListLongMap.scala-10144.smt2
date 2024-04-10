; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119630 () Bool)

(assert start!119630)

(declare-fun b!1393499 () Bool)

(declare-fun res!932908 () Bool)

(declare-fun e!789048 () Bool)

(assert (=> b!1393499 (=> (not res!932908) (not e!789048))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95312 0))(
  ( (array!95313 (arr!46014 (Array (_ BitVec 32) (_ BitVec 64))) (size!46564 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95312)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393499 (= res!932908 (and (= (size!46564 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46564 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46564 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!932913 () Bool)

(assert (=> start!119630 (=> (not res!932913) (not e!789048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119630 (= res!932913 (validMask!0 mask!2840))))

(assert (=> start!119630 e!789048))

(assert (=> start!119630 true))

(declare-fun array_inv!35042 (array!95312) Bool)

(assert (=> start!119630 (array_inv!35042 a!2901)))

(declare-fun b!1393500 () Bool)

(declare-fun res!932911 () Bool)

(assert (=> b!1393500 (=> (not res!932911) (not e!789048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393500 (= res!932911 (validKeyInArray!0 (select (arr!46014 a!2901) j!112)))))

(declare-fun b!1393501 () Bool)

(declare-fun res!932907 () Bool)

(assert (=> b!1393501 (=> (not res!932907) (not e!789048))))

(declare-datatypes ((List!32533 0))(
  ( (Nil!32530) (Cons!32529 (h!33762 (_ BitVec 64)) (t!47227 List!32533)) )
))
(declare-fun arrayNoDuplicates!0 (array!95312 (_ BitVec 32) List!32533) Bool)

(assert (=> b!1393501 (= res!932907 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32530))))

(declare-fun b!1393502 () Bool)

(declare-fun e!789047 () Bool)

(assert (=> b!1393502 (= e!789047 true)))

(declare-datatypes ((SeekEntryResult!10331 0))(
  ( (MissingZero!10331 (index!43695 (_ BitVec 32))) (Found!10331 (index!43696 (_ BitVec 32))) (Intermediate!10331 (undefined!11143 Bool) (index!43697 (_ BitVec 32)) (x!125375 (_ BitVec 32))) (Undefined!10331) (MissingVacant!10331 (index!43698 (_ BitVec 32))) )
))
(declare-fun lt!612014 () SeekEntryResult!10331)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95312 (_ BitVec 32)) SeekEntryResult!10331)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393502 (= lt!612014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46014 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46014 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95313 (store (arr!46014 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46564 a!2901)) mask!2840))))

(declare-fun b!1393503 () Bool)

(declare-fun e!789050 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95312 (_ BitVec 32)) SeekEntryResult!10331)

(assert (=> b!1393503 (= e!789050 (= (seekEntryOrOpen!0 (select (arr!46014 a!2901) j!112) a!2901 mask!2840) (Found!10331 j!112)))))

(declare-fun b!1393504 () Bool)

(declare-fun res!932912 () Bool)

(assert (=> b!1393504 (=> (not res!932912) (not e!789048))))

(assert (=> b!1393504 (= res!932912 (validKeyInArray!0 (select (arr!46014 a!2901) i!1037)))))

(declare-fun b!1393505 () Bool)

(declare-fun res!932910 () Bool)

(assert (=> b!1393505 (=> (not res!932910) (not e!789048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95312 (_ BitVec 32)) Bool)

(assert (=> b!1393505 (= res!932910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393506 () Bool)

(assert (=> b!1393506 (= e!789048 (not e!789047))))

(declare-fun res!932909 () Bool)

(assert (=> b!1393506 (=> res!932909 e!789047)))

(declare-fun lt!612013 () SeekEntryResult!10331)

(get-info :version)

(assert (=> b!1393506 (= res!932909 (or (not ((_ is Intermediate!10331) lt!612013)) (undefined!11143 lt!612013)))))

(assert (=> b!1393506 e!789050))

(declare-fun res!932914 () Bool)

(assert (=> b!1393506 (=> (not res!932914) (not e!789050))))

(assert (=> b!1393506 (= res!932914 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46666 0))(
  ( (Unit!46667) )
))
(declare-fun lt!612015 () Unit!46666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46666)

(assert (=> b!1393506 (= lt!612015 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393506 (= lt!612013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46014 a!2901) j!112) mask!2840) (select (arr!46014 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119630 res!932913) b!1393499))

(assert (= (and b!1393499 res!932908) b!1393504))

(assert (= (and b!1393504 res!932912) b!1393500))

(assert (= (and b!1393500 res!932911) b!1393505))

(assert (= (and b!1393505 res!932910) b!1393501))

(assert (= (and b!1393501 res!932907) b!1393506))

(assert (= (and b!1393506 res!932914) b!1393503))

(assert (= (and b!1393506 (not res!932909)) b!1393502))

(declare-fun m!1279435 () Bool)

(assert (=> b!1393503 m!1279435))

(assert (=> b!1393503 m!1279435))

(declare-fun m!1279437 () Bool)

(assert (=> b!1393503 m!1279437))

(declare-fun m!1279439 () Bool)

(assert (=> start!119630 m!1279439))

(declare-fun m!1279441 () Bool)

(assert (=> start!119630 m!1279441))

(declare-fun m!1279443 () Bool)

(assert (=> b!1393505 m!1279443))

(assert (=> b!1393500 m!1279435))

(assert (=> b!1393500 m!1279435))

(declare-fun m!1279445 () Bool)

(assert (=> b!1393500 m!1279445))

(declare-fun m!1279447 () Bool)

(assert (=> b!1393502 m!1279447))

(declare-fun m!1279449 () Bool)

(assert (=> b!1393502 m!1279449))

(assert (=> b!1393502 m!1279449))

(declare-fun m!1279451 () Bool)

(assert (=> b!1393502 m!1279451))

(assert (=> b!1393502 m!1279451))

(assert (=> b!1393502 m!1279449))

(declare-fun m!1279453 () Bool)

(assert (=> b!1393502 m!1279453))

(declare-fun m!1279455 () Bool)

(assert (=> b!1393504 m!1279455))

(assert (=> b!1393504 m!1279455))

(declare-fun m!1279457 () Bool)

(assert (=> b!1393504 m!1279457))

(assert (=> b!1393506 m!1279435))

(declare-fun m!1279459 () Bool)

(assert (=> b!1393506 m!1279459))

(assert (=> b!1393506 m!1279435))

(declare-fun m!1279461 () Bool)

(assert (=> b!1393506 m!1279461))

(assert (=> b!1393506 m!1279459))

(assert (=> b!1393506 m!1279435))

(declare-fun m!1279463 () Bool)

(assert (=> b!1393506 m!1279463))

(declare-fun m!1279465 () Bool)

(assert (=> b!1393506 m!1279465))

(declare-fun m!1279467 () Bool)

(assert (=> b!1393501 m!1279467))

(check-sat (not b!1393506) (not b!1393500) (not b!1393502) (not b!1393501) (not start!119630) (not b!1393504) (not b!1393505) (not b!1393503))
(check-sat)
