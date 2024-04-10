; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121468 () Bool)

(assert start!121468)

(declare-fun b!1411363 () Bool)

(declare-fun e!798684 () Bool)

(declare-fun e!798686 () Bool)

(assert (=> b!1411363 (= e!798684 e!798686)))

(declare-fun res!948590 () Bool)

(assert (=> b!1411363 (=> res!948590 e!798686)))

(declare-datatypes ((SeekEntryResult!10884 0))(
  ( (MissingZero!10884 (index!45913 (_ BitVec 32))) (Found!10884 (index!45914 (_ BitVec 32))) (Intermediate!10884 (undefined!11696 Bool) (index!45915 (_ BitVec 32)) (x!127503 (_ BitVec 32))) (Undefined!10884) (MissingVacant!10884 (index!45916 (_ BitVec 32))) )
))
(declare-fun lt!621666 () SeekEntryResult!10884)

(declare-fun lt!621669 () SeekEntryResult!10884)

(assert (=> b!1411363 (= res!948590 (or (= lt!621666 lt!621669) (not (is-Intermediate!10884 lt!621669))))))

(declare-datatypes ((array!96469 0))(
  ( (array!96470 (arr!46573 (Array (_ BitVec 32) (_ BitVec 64))) (size!47123 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96469)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96469 (_ BitVec 32)) SeekEntryResult!10884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411363 (= lt!621669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46573 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46573 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96470 (store (arr!46573 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47123 a!2901)) mask!2840))))

(declare-fun b!1411364 () Bool)

(declare-fun res!948594 () Bool)

(declare-fun e!798685 () Bool)

(assert (=> b!1411364 (=> (not res!948594) (not e!798685))))

(assert (=> b!1411364 (= res!948594 (and (= (size!47123 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47123 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47123 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411365 () Bool)

(declare-fun res!948592 () Bool)

(assert (=> b!1411365 (=> (not res!948592) (not e!798685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96469 (_ BitVec 32)) Bool)

(assert (=> b!1411365 (= res!948592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411366 () Bool)

(assert (=> b!1411366 (= e!798685 (not e!798684))))

(declare-fun res!948597 () Bool)

(assert (=> b!1411366 (=> res!948597 e!798684)))

(assert (=> b!1411366 (= res!948597 (or (not (is-Intermediate!10884 lt!621666)) (undefined!11696 lt!621666)))))

(declare-fun e!798682 () Bool)

(assert (=> b!1411366 e!798682))

(declare-fun res!948591 () Bool)

(assert (=> b!1411366 (=> (not res!948591) (not e!798682))))

(assert (=> b!1411366 (= res!948591 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47742 0))(
  ( (Unit!47743) )
))
(declare-fun lt!621667 () Unit!47742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47742)

(assert (=> b!1411366 (= lt!621667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621668 () (_ BitVec 32))

(assert (=> b!1411366 (= lt!621666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621668 (select (arr!46573 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411366 (= lt!621668 (toIndex!0 (select (arr!46573 a!2901) j!112) mask!2840))))

(declare-fun b!1411367 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96469 (_ BitVec 32)) SeekEntryResult!10884)

(assert (=> b!1411367 (= e!798682 (= (seekEntryOrOpen!0 (select (arr!46573 a!2901) j!112) a!2901 mask!2840) (Found!10884 j!112)))))

(declare-fun b!1411368 () Bool)

(assert (=> b!1411368 (= e!798686 (and (bvsge (index!45915 lt!621669) #b00000000000000000000000000000000) (bvslt (index!45915 lt!621669) (size!47123 a!2901))))))

(assert (=> b!1411368 (and (not (undefined!11696 lt!621669)) (= (index!45915 lt!621669) i!1037) (bvslt (x!127503 lt!621669) (x!127503 lt!621666)))))

(declare-fun lt!621665 () Unit!47742)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47742)

(assert (=> b!1411368 (= lt!621665 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621668 (x!127503 lt!621666) (index!45915 lt!621666) (x!127503 lt!621669) (index!45915 lt!621669) (undefined!11696 lt!621669) mask!2840))))

(declare-fun b!1411369 () Bool)

(declare-fun res!948598 () Bool)

(assert (=> b!1411369 (=> (not res!948598) (not e!798685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411369 (= res!948598 (validKeyInArray!0 (select (arr!46573 a!2901) j!112)))))

(declare-fun b!1411370 () Bool)

(declare-fun res!948596 () Bool)

(assert (=> b!1411370 (=> (not res!948596) (not e!798685))))

(assert (=> b!1411370 (= res!948596 (validKeyInArray!0 (select (arr!46573 a!2901) i!1037)))))

(declare-fun res!948593 () Bool)

(assert (=> start!121468 (=> (not res!948593) (not e!798685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121468 (= res!948593 (validMask!0 mask!2840))))

(assert (=> start!121468 e!798685))

(assert (=> start!121468 true))

(declare-fun array_inv!35601 (array!96469) Bool)

(assert (=> start!121468 (array_inv!35601 a!2901)))

(declare-fun b!1411371 () Bool)

(declare-fun res!948595 () Bool)

(assert (=> b!1411371 (=> (not res!948595) (not e!798685))))

(declare-datatypes ((List!33092 0))(
  ( (Nil!33089) (Cons!33088 (h!34360 (_ BitVec 64)) (t!47786 List!33092)) )
))
(declare-fun arrayNoDuplicates!0 (array!96469 (_ BitVec 32) List!33092) Bool)

(assert (=> b!1411371 (= res!948595 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33089))))

(assert (= (and start!121468 res!948593) b!1411364))

(assert (= (and b!1411364 res!948594) b!1411370))

(assert (= (and b!1411370 res!948596) b!1411369))

(assert (= (and b!1411369 res!948598) b!1411365))

(assert (= (and b!1411365 res!948592) b!1411371))

(assert (= (and b!1411371 res!948595) b!1411366))

(assert (= (and b!1411366 res!948591) b!1411367))

(assert (= (and b!1411366 (not res!948597)) b!1411363))

(assert (= (and b!1411363 (not res!948590)) b!1411368))

(declare-fun m!1301181 () Bool)

(assert (=> b!1411370 m!1301181))

(assert (=> b!1411370 m!1301181))

(declare-fun m!1301183 () Bool)

(assert (=> b!1411370 m!1301183))

(declare-fun m!1301185 () Bool)

(assert (=> start!121468 m!1301185))

(declare-fun m!1301187 () Bool)

(assert (=> start!121468 m!1301187))

(declare-fun m!1301189 () Bool)

(assert (=> b!1411369 m!1301189))

(assert (=> b!1411369 m!1301189))

(declare-fun m!1301191 () Bool)

(assert (=> b!1411369 m!1301191))

(assert (=> b!1411366 m!1301189))

(declare-fun m!1301193 () Bool)

(assert (=> b!1411366 m!1301193))

(assert (=> b!1411366 m!1301189))

(assert (=> b!1411366 m!1301189))

(declare-fun m!1301195 () Bool)

(assert (=> b!1411366 m!1301195))

(declare-fun m!1301197 () Bool)

(assert (=> b!1411366 m!1301197))

(declare-fun m!1301199 () Bool)

(assert (=> b!1411366 m!1301199))

(declare-fun m!1301201 () Bool)

(assert (=> b!1411363 m!1301201))

(declare-fun m!1301203 () Bool)

(assert (=> b!1411363 m!1301203))

(assert (=> b!1411363 m!1301203))

(declare-fun m!1301205 () Bool)

(assert (=> b!1411363 m!1301205))

(assert (=> b!1411363 m!1301205))

(assert (=> b!1411363 m!1301203))

(declare-fun m!1301207 () Bool)

(assert (=> b!1411363 m!1301207))

(declare-fun m!1301209 () Bool)

(assert (=> b!1411368 m!1301209))

(assert (=> b!1411367 m!1301189))

(assert (=> b!1411367 m!1301189))

(declare-fun m!1301211 () Bool)

(assert (=> b!1411367 m!1301211))

(declare-fun m!1301213 () Bool)

(assert (=> b!1411371 m!1301213))

(declare-fun m!1301215 () Bool)

(assert (=> b!1411365 m!1301215))

(push 1)

(assert (not b!1411366))

(assert (not b!1411365))

(assert (not start!121468))

(assert (not b!1411371))

(assert (not b!1411369))

(assert (not b!1411367))

(assert (not b!1411363))

(assert (not b!1411370))

(assert (not b!1411368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

