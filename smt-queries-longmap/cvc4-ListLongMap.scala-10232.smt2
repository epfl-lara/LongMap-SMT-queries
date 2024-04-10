; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120448 () Bool)

(assert start!120448)

(declare-fun b!1402383 () Bool)

(declare-fun e!794111 () Bool)

(declare-fun e!794113 () Bool)

(assert (=> b!1402383 (= e!794111 (not e!794113))))

(declare-fun res!940900 () Bool)

(assert (=> b!1402383 (=> res!940900 e!794113)))

(declare-datatypes ((SeekEntryResult!10596 0))(
  ( (MissingZero!10596 (index!44761 (_ BitVec 32))) (Found!10596 (index!44762 (_ BitVec 32))) (Intermediate!10596 (undefined!11408 Bool) (index!44763 (_ BitVec 32)) (x!126383 (_ BitVec 32))) (Undefined!10596) (MissingVacant!10596 (index!44764 (_ BitVec 32))) )
))
(declare-fun lt!617672 () SeekEntryResult!10596)

(assert (=> b!1402383 (= res!940900 (or (not (is-Intermediate!10596 lt!617672)) (undefined!11408 lt!617672)))))

(declare-fun lt!617668 () SeekEntryResult!10596)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402383 (= lt!617668 (Found!10596 j!112))))

(declare-datatypes ((array!95857 0))(
  ( (array!95858 (arr!46279 (Array (_ BitVec 32) (_ BitVec 64))) (size!46829 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95857)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95857 (_ BitVec 32)) SeekEntryResult!10596)

(assert (=> b!1402383 (= lt!617668 (seekEntryOrOpen!0 (select (arr!46279 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95857 (_ BitVec 32)) Bool)

(assert (=> b!1402383 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47196 0))(
  ( (Unit!47197) )
))
(declare-fun lt!617667 () Unit!47196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47196)

(assert (=> b!1402383 (= lt!617667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617673 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95857 (_ BitVec 32)) SeekEntryResult!10596)

(assert (=> b!1402383 (= lt!617672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617673 (select (arr!46279 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402383 (= lt!617673 (toIndex!0 (select (arr!46279 a!2901) j!112) mask!2840))))

(declare-fun b!1402384 () Bool)

(declare-fun res!940895 () Bool)

(declare-fun e!794110 () Bool)

(assert (=> b!1402384 (=> res!940895 e!794110)))

(declare-fun lt!617664 () SeekEntryResult!10596)

(declare-fun lt!617670 () array!95857)

(declare-fun lt!617665 () (_ BitVec 64))

(assert (=> b!1402384 (= res!940895 (not (= lt!617664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617673 lt!617665 lt!617670 mask!2840))))))

(declare-fun b!1402385 () Bool)

(declare-fun res!940896 () Bool)

(assert (=> b!1402385 (=> (not res!940896) (not e!794111))))

(declare-datatypes ((List!32798 0))(
  ( (Nil!32795) (Cons!32794 (h!34042 (_ BitVec 64)) (t!47492 List!32798)) )
))
(declare-fun arrayNoDuplicates!0 (array!95857 (_ BitVec 32) List!32798) Bool)

(assert (=> b!1402385 (= res!940896 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32795))))

(declare-fun b!1402386 () Bool)

(declare-fun e!794114 () Bool)

(assert (=> b!1402386 (= e!794113 e!794114)))

(declare-fun res!940902 () Bool)

(assert (=> b!1402386 (=> res!940902 e!794114)))

(assert (=> b!1402386 (= res!940902 (or (= lt!617672 lt!617664) (not (is-Intermediate!10596 lt!617664))))))

(assert (=> b!1402386 (= lt!617664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617665 mask!2840) lt!617665 lt!617670 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402386 (= lt!617665 (select (store (arr!46279 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402386 (= lt!617670 (array!95858 (store (arr!46279 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46829 a!2901)))))

(declare-fun b!1402387 () Bool)

(declare-fun res!940894 () Bool)

(assert (=> b!1402387 (=> (not res!940894) (not e!794111))))

(assert (=> b!1402387 (= res!940894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402388 () Bool)

(declare-fun res!940897 () Bool)

(assert (=> b!1402388 (=> (not res!940897) (not e!794111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402388 (= res!940897 (validKeyInArray!0 (select (arr!46279 a!2901) i!1037)))))

(declare-fun b!1402389 () Bool)

(assert (=> b!1402389 (= e!794114 e!794110)))

(declare-fun res!940901 () Bool)

(assert (=> b!1402389 (=> res!940901 e!794110)))

(assert (=> b!1402389 (= res!940901 (or (bvslt (x!126383 lt!617672) #b00000000000000000000000000000000) (bvsgt (x!126383 lt!617672) #b01111111111111111111111111111110) (bvslt (x!126383 lt!617664) #b00000000000000000000000000000000) (bvsgt (x!126383 lt!617664) #b01111111111111111111111111111110) (bvslt lt!617673 #b00000000000000000000000000000000) (bvsge lt!617673 (size!46829 a!2901)) (bvslt (index!44763 lt!617672) #b00000000000000000000000000000000) (bvsge (index!44763 lt!617672) (size!46829 a!2901)) (bvslt (index!44763 lt!617664) #b00000000000000000000000000000000) (bvsge (index!44763 lt!617664) (size!46829 a!2901)) (not (= lt!617672 (Intermediate!10596 false (index!44763 lt!617672) (x!126383 lt!617672)))) (not (= lt!617664 (Intermediate!10596 false (index!44763 lt!617664) (x!126383 lt!617664))))))))

(declare-fun lt!617669 () SeekEntryResult!10596)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95857 (_ BitVec 32)) SeekEntryResult!10596)

(assert (=> b!1402389 (= lt!617669 (seekKeyOrZeroReturnVacant!0 (x!126383 lt!617664) (index!44763 lt!617664) (index!44763 lt!617664) (select (arr!46279 a!2901) j!112) lt!617670 mask!2840))))

(assert (=> b!1402389 (= lt!617669 (seekEntryOrOpen!0 lt!617665 lt!617670 mask!2840))))

(assert (=> b!1402389 (and (not (undefined!11408 lt!617664)) (= (index!44763 lt!617664) i!1037) (bvslt (x!126383 lt!617664) (x!126383 lt!617672)) (= (select (store (arr!46279 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44763 lt!617664)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617671 () Unit!47196)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47196)

(assert (=> b!1402389 (= lt!617671 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617673 (x!126383 lt!617672) (index!44763 lt!617672) (x!126383 lt!617664) (index!44763 lt!617664) (undefined!11408 lt!617664) mask!2840))))

(declare-fun res!940903 () Bool)

(assert (=> start!120448 (=> (not res!940903) (not e!794111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120448 (= res!940903 (validMask!0 mask!2840))))

(assert (=> start!120448 e!794111))

(assert (=> start!120448 true))

(declare-fun array_inv!35307 (array!95857) Bool)

(assert (=> start!120448 (array_inv!35307 a!2901)))

(declare-fun b!1402390 () Bool)

(assert (=> b!1402390 (= e!794110 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1402390 (= lt!617668 lt!617669)))

(declare-fun lt!617666 () Unit!47196)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47196)

(assert (=> b!1402390 (= lt!617666 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617673 (x!126383 lt!617672) (index!44763 lt!617672) (x!126383 lt!617664) (index!44763 lt!617664) mask!2840))))

(declare-fun b!1402391 () Bool)

(declare-fun res!940899 () Bool)

(assert (=> b!1402391 (=> (not res!940899) (not e!794111))))

(assert (=> b!1402391 (= res!940899 (validKeyInArray!0 (select (arr!46279 a!2901) j!112)))))

(declare-fun b!1402392 () Bool)

(declare-fun res!940898 () Bool)

(assert (=> b!1402392 (=> (not res!940898) (not e!794111))))

(assert (=> b!1402392 (= res!940898 (and (= (size!46829 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46829 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46829 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120448 res!940903) b!1402392))

(assert (= (and b!1402392 res!940898) b!1402388))

(assert (= (and b!1402388 res!940897) b!1402391))

(assert (= (and b!1402391 res!940899) b!1402387))

(assert (= (and b!1402387 res!940894) b!1402385))

(assert (= (and b!1402385 res!940896) b!1402383))

(assert (= (and b!1402383 (not res!940900)) b!1402386))

(assert (= (and b!1402386 (not res!940902)) b!1402389))

(assert (= (and b!1402389 (not res!940901)) b!1402384))

(assert (= (and b!1402384 (not res!940895)) b!1402390))

(declare-fun m!1290515 () Bool)

(assert (=> b!1402386 m!1290515))

(assert (=> b!1402386 m!1290515))

(declare-fun m!1290517 () Bool)

(assert (=> b!1402386 m!1290517))

(declare-fun m!1290519 () Bool)

(assert (=> b!1402386 m!1290519))

(declare-fun m!1290521 () Bool)

(assert (=> b!1402386 m!1290521))

(declare-fun m!1290523 () Bool)

(assert (=> b!1402389 m!1290523))

(assert (=> b!1402389 m!1290523))

(declare-fun m!1290525 () Bool)

(assert (=> b!1402389 m!1290525))

(declare-fun m!1290527 () Bool)

(assert (=> b!1402389 m!1290527))

(declare-fun m!1290529 () Bool)

(assert (=> b!1402389 m!1290529))

(declare-fun m!1290531 () Bool)

(assert (=> b!1402389 m!1290531))

(assert (=> b!1402389 m!1290519))

(declare-fun m!1290533 () Bool)

(assert (=> b!1402385 m!1290533))

(assert (=> b!1402383 m!1290523))

(declare-fun m!1290535 () Bool)

(assert (=> b!1402383 m!1290535))

(assert (=> b!1402383 m!1290523))

(declare-fun m!1290537 () Bool)

(assert (=> b!1402383 m!1290537))

(assert (=> b!1402383 m!1290523))

(declare-fun m!1290539 () Bool)

(assert (=> b!1402383 m!1290539))

(assert (=> b!1402383 m!1290523))

(declare-fun m!1290541 () Bool)

(assert (=> b!1402383 m!1290541))

(declare-fun m!1290543 () Bool)

(assert (=> b!1402383 m!1290543))

(declare-fun m!1290545 () Bool)

(assert (=> start!120448 m!1290545))

(declare-fun m!1290547 () Bool)

(assert (=> start!120448 m!1290547))

(assert (=> b!1402391 m!1290523))

(assert (=> b!1402391 m!1290523))

(declare-fun m!1290549 () Bool)

(assert (=> b!1402391 m!1290549))

(declare-fun m!1290551 () Bool)

(assert (=> b!1402384 m!1290551))

(declare-fun m!1290553 () Bool)

(assert (=> b!1402390 m!1290553))

(declare-fun m!1290555 () Bool)

(assert (=> b!1402387 m!1290555))

(declare-fun m!1290557 () Bool)

(assert (=> b!1402388 m!1290557))

(assert (=> b!1402388 m!1290557))

(declare-fun m!1290559 () Bool)

(assert (=> b!1402388 m!1290559))

(push 1)

