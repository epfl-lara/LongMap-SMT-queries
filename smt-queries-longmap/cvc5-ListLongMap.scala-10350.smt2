; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121650 () Bool)

(assert start!121650)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96588 0))(
  ( (array!96589 (arr!46631 (Array (_ BitVec 32) (_ BitVec 64))) (size!47181 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96588)

(declare-fun e!799861 () Bool)

(declare-datatypes ((SeekEntryResult!10942 0))(
  ( (MissingZero!10942 (index!46148 (_ BitVec 32))) (Found!10942 (index!46149 (_ BitVec 32))) (Intermediate!10942 (undefined!11754 Bool) (index!46150 (_ BitVec 32)) (x!127733 (_ BitVec 32))) (Undefined!10942) (MissingVacant!10942 (index!46151 (_ BitVec 32))) )
))
(declare-fun lt!622986 () SeekEntryResult!10942)

(declare-fun lt!622983 () (_ BitVec 64))

(declare-fun lt!622989 () array!96588)

(declare-fun b!1413366 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96588 (_ BitVec 32)) SeekEntryResult!10942)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96588 (_ BitVec 32)) SeekEntryResult!10942)

(assert (=> b!1413366 (= e!799861 (= (seekEntryOrOpen!0 lt!622983 lt!622989 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127733 lt!622986) (index!46150 lt!622986) (index!46150 lt!622986) (select (arr!46631 a!2901) j!112) lt!622989 mask!2840)))))

(declare-fun b!1413367 () Bool)

(declare-fun res!950362 () Bool)

(declare-fun e!799859 () Bool)

(assert (=> b!1413367 (=> (not res!950362) (not e!799859))))

(declare-datatypes ((List!33150 0))(
  ( (Nil!33147) (Cons!33146 (h!34421 (_ BitVec 64)) (t!47844 List!33150)) )
))
(declare-fun arrayNoDuplicates!0 (array!96588 (_ BitVec 32) List!33150) Bool)

(assert (=> b!1413367 (= res!950362 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33147))))

(declare-fun e!799857 () Bool)

(declare-fun b!1413368 () Bool)

(assert (=> b!1413368 (= e!799857 (= (seekEntryOrOpen!0 (select (arr!46631 a!2901) j!112) a!2901 mask!2840) (Found!10942 j!112)))))

(declare-fun b!1413370 () Bool)

(declare-fun res!950365 () Bool)

(assert (=> b!1413370 (=> (not res!950365) (not e!799859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96588 (_ BitVec 32)) Bool)

(assert (=> b!1413370 (= res!950365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413371 () Bool)

(declare-fun res!950356 () Bool)

(assert (=> b!1413371 (=> (not res!950356) (not e!799859))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413371 (= res!950356 (and (= (size!47181 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47181 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47181 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413372 () Bool)

(declare-fun e!799862 () Bool)

(assert (=> b!1413372 (= e!799862 true)))

(assert (=> b!1413372 e!799861))

(declare-fun res!950364 () Bool)

(assert (=> b!1413372 (=> (not res!950364) (not e!799861))))

(declare-fun lt!622988 () SeekEntryResult!10942)

(assert (=> b!1413372 (= res!950364 (and (not (undefined!11754 lt!622986)) (= (index!46150 lt!622986) i!1037) (bvslt (x!127733 lt!622986) (x!127733 lt!622988)) (= (select (store (arr!46631 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46150 lt!622986)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622985 () (_ BitVec 32))

(declare-datatypes ((Unit!47858 0))(
  ( (Unit!47859) )
))
(declare-fun lt!622987 () Unit!47858)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47858)

(assert (=> b!1413372 (= lt!622987 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622985 (x!127733 lt!622988) (index!46150 lt!622988) (x!127733 lt!622986) (index!46150 lt!622986) (undefined!11754 lt!622986) mask!2840))))

(declare-fun b!1413373 () Bool)

(declare-fun res!950360 () Bool)

(assert (=> b!1413373 (=> (not res!950360) (not e!799859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413373 (= res!950360 (validKeyInArray!0 (select (arr!46631 a!2901) i!1037)))))

(declare-fun res!950358 () Bool)

(assert (=> start!121650 (=> (not res!950358) (not e!799859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121650 (= res!950358 (validMask!0 mask!2840))))

(assert (=> start!121650 e!799859))

(assert (=> start!121650 true))

(declare-fun array_inv!35659 (array!96588) Bool)

(assert (=> start!121650 (array_inv!35659 a!2901)))

(declare-fun b!1413369 () Bool)

(declare-fun res!950357 () Bool)

(assert (=> b!1413369 (=> (not res!950357) (not e!799859))))

(assert (=> b!1413369 (= res!950357 (validKeyInArray!0 (select (arr!46631 a!2901) j!112)))))

(declare-fun b!1413374 () Bool)

(declare-fun e!799858 () Bool)

(assert (=> b!1413374 (= e!799859 (not e!799858))))

(declare-fun res!950361 () Bool)

(assert (=> b!1413374 (=> res!950361 e!799858)))

(assert (=> b!1413374 (= res!950361 (or (not (is-Intermediate!10942 lt!622988)) (undefined!11754 lt!622988)))))

(assert (=> b!1413374 e!799857))

(declare-fun res!950359 () Bool)

(assert (=> b!1413374 (=> (not res!950359) (not e!799857))))

(assert (=> b!1413374 (= res!950359 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622984 () Unit!47858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47858)

(assert (=> b!1413374 (= lt!622984 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96588 (_ BitVec 32)) SeekEntryResult!10942)

(assert (=> b!1413374 (= lt!622988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622985 (select (arr!46631 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413374 (= lt!622985 (toIndex!0 (select (arr!46631 a!2901) j!112) mask!2840))))

(declare-fun b!1413375 () Bool)

(assert (=> b!1413375 (= e!799858 e!799862)))

(declare-fun res!950363 () Bool)

(assert (=> b!1413375 (=> res!950363 e!799862)))

(assert (=> b!1413375 (= res!950363 (or (= lt!622988 lt!622986) (not (is-Intermediate!10942 lt!622986))))))

(assert (=> b!1413375 (= lt!622986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622983 mask!2840) lt!622983 lt!622989 mask!2840))))

(assert (=> b!1413375 (= lt!622983 (select (store (arr!46631 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413375 (= lt!622989 (array!96589 (store (arr!46631 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47181 a!2901)))))

(assert (= (and start!121650 res!950358) b!1413371))

(assert (= (and b!1413371 res!950356) b!1413373))

(assert (= (and b!1413373 res!950360) b!1413369))

(assert (= (and b!1413369 res!950357) b!1413370))

(assert (= (and b!1413370 res!950365) b!1413367))

(assert (= (and b!1413367 res!950362) b!1413374))

(assert (= (and b!1413374 res!950359) b!1413368))

(assert (= (and b!1413374 (not res!950361)) b!1413375))

(assert (= (and b!1413375 (not res!950363)) b!1413372))

(assert (= (and b!1413372 res!950364) b!1413366))

(declare-fun m!1303761 () Bool)

(assert (=> b!1413366 m!1303761))

(declare-fun m!1303763 () Bool)

(assert (=> b!1413366 m!1303763))

(assert (=> b!1413366 m!1303763))

(declare-fun m!1303765 () Bool)

(assert (=> b!1413366 m!1303765))

(declare-fun m!1303767 () Bool)

(assert (=> b!1413375 m!1303767))

(assert (=> b!1413375 m!1303767))

(declare-fun m!1303769 () Bool)

(assert (=> b!1413375 m!1303769))

(declare-fun m!1303771 () Bool)

(assert (=> b!1413375 m!1303771))

(declare-fun m!1303773 () Bool)

(assert (=> b!1413375 m!1303773))

(assert (=> b!1413374 m!1303763))

(declare-fun m!1303775 () Bool)

(assert (=> b!1413374 m!1303775))

(assert (=> b!1413374 m!1303763))

(assert (=> b!1413374 m!1303763))

(declare-fun m!1303777 () Bool)

(assert (=> b!1413374 m!1303777))

(declare-fun m!1303779 () Bool)

(assert (=> b!1413374 m!1303779))

(declare-fun m!1303781 () Bool)

(assert (=> b!1413374 m!1303781))

(assert (=> b!1413369 m!1303763))

(assert (=> b!1413369 m!1303763))

(declare-fun m!1303783 () Bool)

(assert (=> b!1413369 m!1303783))

(assert (=> b!1413372 m!1303771))

(declare-fun m!1303785 () Bool)

(assert (=> b!1413372 m!1303785))

(declare-fun m!1303787 () Bool)

(assert (=> b!1413372 m!1303787))

(declare-fun m!1303789 () Bool)

(assert (=> b!1413373 m!1303789))

(assert (=> b!1413373 m!1303789))

(declare-fun m!1303791 () Bool)

(assert (=> b!1413373 m!1303791))

(declare-fun m!1303793 () Bool)

(assert (=> start!121650 m!1303793))

(declare-fun m!1303795 () Bool)

(assert (=> start!121650 m!1303795))

(assert (=> b!1413368 m!1303763))

(assert (=> b!1413368 m!1303763))

(declare-fun m!1303797 () Bool)

(assert (=> b!1413368 m!1303797))

(declare-fun m!1303799 () Bool)

(assert (=> b!1413370 m!1303799))

(declare-fun m!1303801 () Bool)

(assert (=> b!1413367 m!1303801))

(push 1)

