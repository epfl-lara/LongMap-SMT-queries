; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121086 () Bool)

(assert start!121086)

(declare-fun res!945559 () Bool)

(declare-fun e!796816 () Bool)

(assert (=> start!121086 (=> (not res!945559) (not e!796816))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121086 (= res!945559 (validMask!0 mask!2840))))

(assert (=> start!121086 e!796816))

(assert (=> start!121086 true))

(declare-datatypes ((array!96240 0))(
  ( (array!96241 (arr!46463 (Array (_ BitVec 32) (_ BitVec 64))) (size!47013 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96240)

(declare-fun array_inv!35491 (array!96240) Bool)

(assert (=> start!121086 (array_inv!35491 a!2901)))

(declare-fun b!1407833 () Bool)

(declare-fun e!796817 () Bool)

(assert (=> b!1407833 (= e!796817 true)))

(declare-datatypes ((SeekEntryResult!10774 0))(
  ( (MissingZero!10774 (index!45473 (_ BitVec 32))) (Found!10774 (index!45474 (_ BitVec 32))) (Intermediate!10774 (undefined!11586 Bool) (index!45475 (_ BitVec 32)) (x!127087 (_ BitVec 32))) (Undefined!10774) (MissingVacant!10774 (index!45476 (_ BitVec 32))) )
))
(declare-fun lt!619958 () SeekEntryResult!10774)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96240 (_ BitVec 32)) SeekEntryResult!10774)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407833 (= lt!619958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46463 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46463 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96241 (store (arr!46463 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47013 a!2901)) mask!2840))))

(declare-fun b!1407834 () Bool)

(declare-fun res!945562 () Bool)

(assert (=> b!1407834 (=> (not res!945562) (not e!796816))))

(assert (=> b!1407834 (= res!945562 (and (= (size!47013 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47013 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47013 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407835 () Bool)

(declare-fun e!796815 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96240 (_ BitVec 32)) SeekEntryResult!10774)

(assert (=> b!1407835 (= e!796815 (= (seekEntryOrOpen!0 (select (arr!46463 a!2901) j!112) a!2901 mask!2840) (Found!10774 j!112)))))

(declare-fun b!1407836 () Bool)

(declare-fun res!945556 () Bool)

(assert (=> b!1407836 (=> (not res!945556) (not e!796816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96240 (_ BitVec 32)) Bool)

(assert (=> b!1407836 (= res!945556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407837 () Bool)

(assert (=> b!1407837 (= e!796816 (not e!796817))))

(declare-fun res!945555 () Bool)

(assert (=> b!1407837 (=> res!945555 e!796817)))

(declare-fun lt!619957 () SeekEntryResult!10774)

(assert (=> b!1407837 (= res!945555 (or (not (is-Intermediate!10774 lt!619957)) (undefined!11586 lt!619957)))))

(assert (=> b!1407837 e!796815))

(declare-fun res!945560 () Bool)

(assert (=> b!1407837 (=> (not res!945560) (not e!796815))))

(assert (=> b!1407837 (= res!945560 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47522 0))(
  ( (Unit!47523) )
))
(declare-fun lt!619959 () Unit!47522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47522)

(assert (=> b!1407837 (= lt!619959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407837 (= lt!619957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46463 a!2901) j!112) mask!2840) (select (arr!46463 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407838 () Bool)

(declare-fun res!945557 () Bool)

(assert (=> b!1407838 (=> (not res!945557) (not e!796816))))

(declare-datatypes ((List!32982 0))(
  ( (Nil!32979) (Cons!32978 (h!34241 (_ BitVec 64)) (t!47676 List!32982)) )
))
(declare-fun arrayNoDuplicates!0 (array!96240 (_ BitVec 32) List!32982) Bool)

(assert (=> b!1407838 (= res!945557 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32979))))

(declare-fun b!1407839 () Bool)

(declare-fun res!945558 () Bool)

(assert (=> b!1407839 (=> (not res!945558) (not e!796816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407839 (= res!945558 (validKeyInArray!0 (select (arr!46463 a!2901) i!1037)))))

(declare-fun b!1407840 () Bool)

(declare-fun res!945561 () Bool)

(assert (=> b!1407840 (=> (not res!945561) (not e!796816))))

(assert (=> b!1407840 (= res!945561 (validKeyInArray!0 (select (arr!46463 a!2901) j!112)))))

(assert (= (and start!121086 res!945559) b!1407834))

(assert (= (and b!1407834 res!945562) b!1407839))

(assert (= (and b!1407839 res!945558) b!1407840))

(assert (= (and b!1407840 res!945561) b!1407836))

(assert (= (and b!1407836 res!945556) b!1407838))

(assert (= (and b!1407838 res!945557) b!1407837))

(assert (= (and b!1407837 res!945560) b!1407835))

(assert (= (and b!1407837 (not res!945555)) b!1407833))

(declare-fun m!1296885 () Bool)

(assert (=> b!1407836 m!1296885))

(declare-fun m!1296887 () Bool)

(assert (=> b!1407835 m!1296887))

(assert (=> b!1407835 m!1296887))

(declare-fun m!1296889 () Bool)

(assert (=> b!1407835 m!1296889))

(assert (=> b!1407840 m!1296887))

(assert (=> b!1407840 m!1296887))

(declare-fun m!1296891 () Bool)

(assert (=> b!1407840 m!1296891))

(assert (=> b!1407837 m!1296887))

(declare-fun m!1296893 () Bool)

(assert (=> b!1407837 m!1296893))

(assert (=> b!1407837 m!1296887))

(declare-fun m!1296895 () Bool)

(assert (=> b!1407837 m!1296895))

(assert (=> b!1407837 m!1296893))

(assert (=> b!1407837 m!1296887))

(declare-fun m!1296897 () Bool)

(assert (=> b!1407837 m!1296897))

(declare-fun m!1296899 () Bool)

(assert (=> b!1407837 m!1296899))

(declare-fun m!1296901 () Bool)

(assert (=> b!1407839 m!1296901))

(assert (=> b!1407839 m!1296901))

(declare-fun m!1296903 () Bool)

(assert (=> b!1407839 m!1296903))

(declare-fun m!1296905 () Bool)

(assert (=> start!121086 m!1296905))

(declare-fun m!1296907 () Bool)

(assert (=> start!121086 m!1296907))

(declare-fun m!1296909 () Bool)

(assert (=> b!1407838 m!1296909))

(declare-fun m!1296911 () Bool)

(assert (=> b!1407833 m!1296911))

(declare-fun m!1296913 () Bool)

(assert (=> b!1407833 m!1296913))

(assert (=> b!1407833 m!1296913))

(declare-fun m!1296915 () Bool)

(assert (=> b!1407833 m!1296915))

(assert (=> b!1407833 m!1296915))

(assert (=> b!1407833 m!1296913))

(declare-fun m!1296917 () Bool)

(assert (=> b!1407833 m!1296917))

(push 1)

(assert (not start!121086))

(assert (not b!1407833))

(assert (not b!1407835))

(assert (not b!1407837))

(assert (not b!1407840))

(assert (not b!1407836))

(assert (not b!1407839))

(assert (not b!1407838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

