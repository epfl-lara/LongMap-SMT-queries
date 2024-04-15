; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120894 () Bool)

(assert start!120894)

(declare-fun b!1406639 () Bool)

(declare-fun res!944909 () Bool)

(declare-fun e!796142 () Bool)

(assert (=> b!1406639 (=> (not res!944909) (not e!796142))))

(declare-datatypes ((array!96154 0))(
  ( (array!96155 (arr!46425 (Array (_ BitVec 32) (_ BitVec 64))) (size!46977 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96154)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96154 (_ BitVec 32)) Bool)

(assert (=> b!1406639 (= res!944909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406640 () Bool)

(declare-fun res!944908 () Bool)

(assert (=> b!1406640 (=> (not res!944908) (not e!796142))))

(declare-datatypes ((List!33022 0))(
  ( (Nil!33019) (Cons!33018 (h!34272 (_ BitVec 64)) (t!47708 List!33022)) )
))
(declare-fun arrayNoDuplicates!0 (array!96154 (_ BitVec 32) List!33022) Bool)

(assert (=> b!1406640 (= res!944908 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33019))))

(declare-fun b!1406641 () Bool)

(declare-fun res!944913 () Bool)

(assert (=> b!1406641 (=> (not res!944913) (not e!796142))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406641 (= res!944913 (validKeyInArray!0 (select (arr!46425 a!2901) i!1037)))))

(declare-fun res!944914 () Bool)

(assert (=> start!120894 (=> (not res!944914) (not e!796142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120894 (= res!944914 (validMask!0 mask!2840))))

(assert (=> start!120894 e!796142))

(assert (=> start!120894 true))

(declare-fun array_inv!35658 (array!96154) Bool)

(assert (=> start!120894 (array_inv!35658 a!2901)))

(declare-fun b!1406642 () Bool)

(declare-fun e!796145 () Bool)

(assert (=> b!1406642 (= e!796145 true)))

(declare-datatypes ((SeekEntryResult!10762 0))(
  ( (MissingZero!10762 (index!45425 (_ BitVec 32))) (Found!10762 (index!45426 (_ BitVec 32))) (Intermediate!10762 (undefined!11574 Bool) (index!45427 (_ BitVec 32)) (x!127014 (_ BitVec 32))) (Undefined!10762) (MissingVacant!10762 (index!45428 (_ BitVec 32))) )
))
(declare-fun lt!619300 () SeekEntryResult!10762)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96154 (_ BitVec 32)) SeekEntryResult!10762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406642 (= lt!619300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46425 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46425 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96155 (store (arr!46425 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46977 a!2901)) mask!2840))))

(declare-fun e!796143 () Bool)

(declare-fun b!1406643 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96154 (_ BitVec 32)) SeekEntryResult!10762)

(assert (=> b!1406643 (= e!796143 (= (seekEntryOrOpen!0 (select (arr!46425 a!2901) j!112) a!2901 mask!2840) (Found!10762 j!112)))))

(declare-fun b!1406644 () Bool)

(declare-fun res!944910 () Bool)

(assert (=> b!1406644 (=> (not res!944910) (not e!796142))))

(assert (=> b!1406644 (= res!944910 (and (= (size!46977 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46977 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46977 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406645 () Bool)

(declare-fun res!944911 () Bool)

(assert (=> b!1406645 (=> (not res!944911) (not e!796142))))

(assert (=> b!1406645 (= res!944911 (validKeyInArray!0 (select (arr!46425 a!2901) j!112)))))

(declare-fun b!1406646 () Bool)

(assert (=> b!1406646 (= e!796142 (not e!796145))))

(declare-fun res!944907 () Bool)

(assert (=> b!1406646 (=> res!944907 e!796145)))

(declare-fun lt!619301 () SeekEntryResult!10762)

(assert (=> b!1406646 (= res!944907 (or (not (is-Intermediate!10762 lt!619301)) (undefined!11574 lt!619301)))))

(assert (=> b!1406646 e!796143))

(declare-fun res!944912 () Bool)

(assert (=> b!1406646 (=> (not res!944912) (not e!796143))))

(assert (=> b!1406646 (= res!944912 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47341 0))(
  ( (Unit!47342) )
))
(declare-fun lt!619299 () Unit!47341)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47341)

(assert (=> b!1406646 (= lt!619299 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406646 (= lt!619301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46425 a!2901) j!112) mask!2840) (select (arr!46425 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120894 res!944914) b!1406644))

(assert (= (and b!1406644 res!944910) b!1406641))

(assert (= (and b!1406641 res!944913) b!1406645))

(assert (= (and b!1406645 res!944911) b!1406639))

(assert (= (and b!1406639 res!944909) b!1406640))

(assert (= (and b!1406640 res!944908) b!1406646))

(assert (= (and b!1406646 res!944912) b!1406643))

(assert (= (and b!1406646 (not res!944907)) b!1406642))

(declare-fun m!1295445 () Bool)

(assert (=> start!120894 m!1295445))

(declare-fun m!1295447 () Bool)

(assert (=> start!120894 m!1295447))

(declare-fun m!1295449 () Bool)

(assert (=> b!1406642 m!1295449))

(declare-fun m!1295451 () Bool)

(assert (=> b!1406642 m!1295451))

(assert (=> b!1406642 m!1295451))

(declare-fun m!1295453 () Bool)

(assert (=> b!1406642 m!1295453))

(assert (=> b!1406642 m!1295453))

(assert (=> b!1406642 m!1295451))

(declare-fun m!1295455 () Bool)

(assert (=> b!1406642 m!1295455))

(declare-fun m!1295457 () Bool)

(assert (=> b!1406641 m!1295457))

(assert (=> b!1406641 m!1295457))

(declare-fun m!1295459 () Bool)

(assert (=> b!1406641 m!1295459))

(declare-fun m!1295461 () Bool)

(assert (=> b!1406643 m!1295461))

(assert (=> b!1406643 m!1295461))

(declare-fun m!1295463 () Bool)

(assert (=> b!1406643 m!1295463))

(assert (=> b!1406645 m!1295461))

(assert (=> b!1406645 m!1295461))

(declare-fun m!1295465 () Bool)

(assert (=> b!1406645 m!1295465))

(declare-fun m!1295467 () Bool)

(assert (=> b!1406639 m!1295467))

(assert (=> b!1406646 m!1295461))

(declare-fun m!1295469 () Bool)

(assert (=> b!1406646 m!1295469))

(assert (=> b!1406646 m!1295461))

(declare-fun m!1295471 () Bool)

(assert (=> b!1406646 m!1295471))

(assert (=> b!1406646 m!1295469))

(assert (=> b!1406646 m!1295461))

(declare-fun m!1295473 () Bool)

(assert (=> b!1406646 m!1295473))

(declare-fun m!1295475 () Bool)

(assert (=> b!1406646 m!1295475))

(declare-fun m!1295477 () Bool)

(assert (=> b!1406640 m!1295477))

(push 1)

(assert (not b!1406639))

(assert (not start!120894))

(assert (not b!1406645))

(assert (not b!1406641))

(assert (not b!1406643))

(assert (not b!1406640))

(assert (not b!1406646))

(assert (not b!1406642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

