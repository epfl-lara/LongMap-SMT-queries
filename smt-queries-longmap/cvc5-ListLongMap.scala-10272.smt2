; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120792 () Bool)

(assert start!120792)

(declare-fun b!1405434 () Bool)

(declare-fun res!943708 () Bool)

(declare-fun e!795550 () Bool)

(assert (=> b!1405434 (=> (not res!943708) (not e!795550))))

(declare-datatypes ((array!96052 0))(
  ( (array!96053 (arr!46374 (Array (_ BitVec 32) (_ BitVec 64))) (size!46926 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96052)

(declare-datatypes ((List!32971 0))(
  ( (Nil!32968) (Cons!32967 (h!34221 (_ BitVec 64)) (t!47657 List!32971)) )
))
(declare-fun arrayNoDuplicates!0 (array!96052 (_ BitVec 32) List!32971) Bool)

(assert (=> b!1405434 (= res!943708 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32968))))

(declare-fun res!943705 () Bool)

(assert (=> start!120792 (=> (not res!943705) (not e!795550))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120792 (= res!943705 (validMask!0 mask!2840))))

(assert (=> start!120792 e!795550))

(assert (=> start!120792 true))

(declare-fun array_inv!35607 (array!96052) Bool)

(assert (=> start!120792 (array_inv!35607 a!2901)))

(declare-fun b!1405435 () Bool)

(declare-fun res!943704 () Bool)

(assert (=> b!1405435 (=> (not res!943704) (not e!795550))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405435 (= res!943704 (validKeyInArray!0 (select (arr!46374 a!2901) i!1037)))))

(declare-fun b!1405436 () Bool)

(declare-fun res!943707 () Bool)

(assert (=> b!1405436 (=> (not res!943707) (not e!795550))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405436 (= res!943707 (validKeyInArray!0 (select (arr!46374 a!2901) j!112)))))

(declare-fun b!1405437 () Bool)

(assert (=> b!1405437 (= e!795550 (not true))))

(declare-fun e!795551 () Bool)

(assert (=> b!1405437 e!795551))

(declare-fun res!943702 () Bool)

(assert (=> b!1405437 (=> (not res!943702) (not e!795551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96052 (_ BitVec 32)) Bool)

(assert (=> b!1405437 (= res!943702 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47239 0))(
  ( (Unit!47240) )
))
(declare-fun lt!618860 () Unit!47239)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47239)

(assert (=> b!1405437 (= lt!618860 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10711 0))(
  ( (MissingZero!10711 (index!45221 (_ BitVec 32))) (Found!10711 (index!45222 (_ BitVec 32))) (Intermediate!10711 (undefined!11523 Bool) (index!45223 (_ BitVec 32)) (x!126827 (_ BitVec 32))) (Undefined!10711) (MissingVacant!10711 (index!45224 (_ BitVec 32))) )
))
(declare-fun lt!618859 () SeekEntryResult!10711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96052 (_ BitVec 32)) SeekEntryResult!10711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405437 (= lt!618859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46374 a!2901) j!112) mask!2840) (select (arr!46374 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405438 () Bool)

(declare-fun res!943706 () Bool)

(assert (=> b!1405438 (=> (not res!943706) (not e!795550))))

(assert (=> b!1405438 (= res!943706 (and (= (size!46926 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46926 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46926 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405439 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96052 (_ BitVec 32)) SeekEntryResult!10711)

(assert (=> b!1405439 (= e!795551 (= (seekEntryOrOpen!0 (select (arr!46374 a!2901) j!112) a!2901 mask!2840) (Found!10711 j!112)))))

(declare-fun b!1405440 () Bool)

(declare-fun res!943703 () Bool)

(assert (=> b!1405440 (=> (not res!943703) (not e!795550))))

(assert (=> b!1405440 (= res!943703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120792 res!943705) b!1405438))

(assert (= (and b!1405438 res!943706) b!1405435))

(assert (= (and b!1405435 res!943704) b!1405436))

(assert (= (and b!1405436 res!943707) b!1405440))

(assert (= (and b!1405440 res!943703) b!1405434))

(assert (= (and b!1405434 res!943708) b!1405437))

(assert (= (and b!1405437 res!943702) b!1405439))

(declare-fun m!1293779 () Bool)

(assert (=> b!1405436 m!1293779))

(assert (=> b!1405436 m!1293779))

(declare-fun m!1293781 () Bool)

(assert (=> b!1405436 m!1293781))

(declare-fun m!1293783 () Bool)

(assert (=> b!1405434 m!1293783))

(assert (=> b!1405437 m!1293779))

(declare-fun m!1293785 () Bool)

(assert (=> b!1405437 m!1293785))

(assert (=> b!1405437 m!1293779))

(declare-fun m!1293787 () Bool)

(assert (=> b!1405437 m!1293787))

(assert (=> b!1405437 m!1293785))

(assert (=> b!1405437 m!1293779))

(declare-fun m!1293789 () Bool)

(assert (=> b!1405437 m!1293789))

(declare-fun m!1293791 () Bool)

(assert (=> b!1405437 m!1293791))

(declare-fun m!1293793 () Bool)

(assert (=> b!1405435 m!1293793))

(assert (=> b!1405435 m!1293793))

(declare-fun m!1293795 () Bool)

(assert (=> b!1405435 m!1293795))

(declare-fun m!1293797 () Bool)

(assert (=> b!1405440 m!1293797))

(declare-fun m!1293799 () Bool)

(assert (=> start!120792 m!1293799))

(declare-fun m!1293801 () Bool)

(assert (=> start!120792 m!1293801))

(assert (=> b!1405439 m!1293779))

(assert (=> b!1405439 m!1293779))

(declare-fun m!1293803 () Bool)

(assert (=> b!1405439 m!1293803))

(push 1)

(assert (not b!1405435))

(assert (not b!1405436))

(assert (not b!1405439))

(assert (not b!1405437))

(assert (not b!1405440))

(assert (not start!120792))

(assert (not b!1405434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

