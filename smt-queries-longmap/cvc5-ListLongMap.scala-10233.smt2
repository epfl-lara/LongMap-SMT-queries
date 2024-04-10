; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120450 () Bool)

(assert start!120450)

(declare-fun b!1402413 () Bool)

(declare-fun res!940932 () Bool)

(declare-fun e!794128 () Bool)

(assert (=> b!1402413 (=> res!940932 e!794128)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617703 () (_ BitVec 32))

(declare-fun lt!617702 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10597 0))(
  ( (MissingZero!10597 (index!44765 (_ BitVec 32))) (Found!10597 (index!44766 (_ BitVec 32))) (Intermediate!10597 (undefined!11409 Bool) (index!44767 (_ BitVec 32)) (x!126392 (_ BitVec 32))) (Undefined!10597) (MissingVacant!10597 (index!44768 (_ BitVec 32))) )
))
(declare-fun lt!617695 () SeekEntryResult!10597)

(declare-datatypes ((array!95859 0))(
  ( (array!95860 (arr!46280 (Array (_ BitVec 32) (_ BitVec 64))) (size!46830 (_ BitVec 32))) )
))
(declare-fun lt!617697 () array!95859)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95859 (_ BitVec 32)) SeekEntryResult!10597)

(assert (=> b!1402413 (= res!940932 (not (= lt!617695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617703 lt!617702 lt!617697 mask!2840))))))

(declare-fun b!1402414 () Bool)

(declare-fun res!940927 () Bool)

(declare-fun e!794127 () Bool)

(assert (=> b!1402414 (=> (not res!940927) (not e!794127))))

(declare-fun a!2901 () array!95859)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402414 (= res!940927 (and (= (size!46830 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46830 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46830 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402415 () Bool)

(declare-fun res!940933 () Bool)

(assert (=> b!1402415 (=> (not res!940933) (not e!794127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402415 (= res!940933 (validKeyInArray!0 (select (arr!46280 a!2901) j!112)))))

(declare-fun b!1402416 () Bool)

(declare-fun e!794125 () Bool)

(assert (=> b!1402416 (= e!794125 e!794128)))

(declare-fun res!940925 () Bool)

(assert (=> b!1402416 (=> res!940925 e!794128)))

(declare-fun lt!617696 () SeekEntryResult!10597)

(assert (=> b!1402416 (= res!940925 (or (bvslt (x!126392 lt!617696) #b00000000000000000000000000000000) (bvsgt (x!126392 lt!617696) #b01111111111111111111111111111110) (bvslt (x!126392 lt!617695) #b00000000000000000000000000000000) (bvsgt (x!126392 lt!617695) #b01111111111111111111111111111110) (bvslt lt!617703 #b00000000000000000000000000000000) (bvsge lt!617703 (size!46830 a!2901)) (bvslt (index!44767 lt!617696) #b00000000000000000000000000000000) (bvsge (index!44767 lt!617696) (size!46830 a!2901)) (bvslt (index!44767 lt!617695) #b00000000000000000000000000000000) (bvsge (index!44767 lt!617695) (size!46830 a!2901)) (not (= lt!617696 (Intermediate!10597 false (index!44767 lt!617696) (x!126392 lt!617696)))) (not (= lt!617695 (Intermediate!10597 false (index!44767 lt!617695) (x!126392 lt!617695))))))))

(declare-fun lt!617699 () SeekEntryResult!10597)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95859 (_ BitVec 32)) SeekEntryResult!10597)

(assert (=> b!1402416 (= lt!617699 (seekKeyOrZeroReturnVacant!0 (x!126392 lt!617695) (index!44767 lt!617695) (index!44767 lt!617695) (select (arr!46280 a!2901) j!112) lt!617697 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95859 (_ BitVec 32)) SeekEntryResult!10597)

(assert (=> b!1402416 (= lt!617699 (seekEntryOrOpen!0 lt!617702 lt!617697 mask!2840))))

(assert (=> b!1402416 (and (not (undefined!11409 lt!617695)) (= (index!44767 lt!617695) i!1037) (bvslt (x!126392 lt!617695) (x!126392 lt!617696)) (= (select (store (arr!46280 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44767 lt!617695)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47198 0))(
  ( (Unit!47199) )
))
(declare-fun lt!617698 () Unit!47198)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47198)

(assert (=> b!1402416 (= lt!617698 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617703 (x!126392 lt!617696) (index!44767 lt!617696) (x!126392 lt!617695) (index!44767 lt!617695) (undefined!11409 lt!617695) mask!2840))))

(declare-fun b!1402417 () Bool)

(declare-fun e!794129 () Bool)

(assert (=> b!1402417 (= e!794127 (not e!794129))))

(declare-fun res!940929 () Bool)

(assert (=> b!1402417 (=> res!940929 e!794129)))

(assert (=> b!1402417 (= res!940929 (or (not (is-Intermediate!10597 lt!617696)) (undefined!11409 lt!617696)))))

(declare-fun lt!617694 () SeekEntryResult!10597)

(assert (=> b!1402417 (= lt!617694 (Found!10597 j!112))))

(assert (=> b!1402417 (= lt!617694 (seekEntryOrOpen!0 (select (arr!46280 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95859 (_ BitVec 32)) Bool)

(assert (=> b!1402417 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617701 () Unit!47198)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47198)

(assert (=> b!1402417 (= lt!617701 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402417 (= lt!617696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617703 (select (arr!46280 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402417 (= lt!617703 (toIndex!0 (select (arr!46280 a!2901) j!112) mask!2840))))

(declare-fun b!1402418 () Bool)

(declare-fun res!940926 () Bool)

(assert (=> b!1402418 (=> (not res!940926) (not e!794127))))

(assert (=> b!1402418 (= res!940926 (validKeyInArray!0 (select (arr!46280 a!2901) i!1037)))))

(declare-fun b!1402419 () Bool)

(assert (=> b!1402419 (= e!794128 true)))

(assert (=> b!1402419 (= lt!617694 lt!617699)))

(declare-fun lt!617700 () Unit!47198)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47198)

(assert (=> b!1402419 (= lt!617700 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617703 (x!126392 lt!617696) (index!44767 lt!617696) (x!126392 lt!617695) (index!44767 lt!617695) mask!2840))))

(declare-fun b!1402420 () Bool)

(assert (=> b!1402420 (= e!794129 e!794125)))

(declare-fun res!940924 () Bool)

(assert (=> b!1402420 (=> res!940924 e!794125)))

(assert (=> b!1402420 (= res!940924 (or (= lt!617696 lt!617695) (not (is-Intermediate!10597 lt!617695))))))

(assert (=> b!1402420 (= lt!617695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617702 mask!2840) lt!617702 lt!617697 mask!2840))))

(assert (=> b!1402420 (= lt!617702 (select (store (arr!46280 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402420 (= lt!617697 (array!95860 (store (arr!46280 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46830 a!2901)))))

(declare-fun res!940930 () Bool)

(assert (=> start!120450 (=> (not res!940930) (not e!794127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120450 (= res!940930 (validMask!0 mask!2840))))

(assert (=> start!120450 e!794127))

(assert (=> start!120450 true))

(declare-fun array_inv!35308 (array!95859) Bool)

(assert (=> start!120450 (array_inv!35308 a!2901)))

(declare-fun b!1402421 () Bool)

(declare-fun res!940928 () Bool)

(assert (=> b!1402421 (=> (not res!940928) (not e!794127))))

(assert (=> b!1402421 (= res!940928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402422 () Bool)

(declare-fun res!940931 () Bool)

(assert (=> b!1402422 (=> (not res!940931) (not e!794127))))

(declare-datatypes ((List!32799 0))(
  ( (Nil!32796) (Cons!32795 (h!34043 (_ BitVec 64)) (t!47493 List!32799)) )
))
(declare-fun arrayNoDuplicates!0 (array!95859 (_ BitVec 32) List!32799) Bool)

(assert (=> b!1402422 (= res!940931 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32796))))

(assert (= (and start!120450 res!940930) b!1402414))

(assert (= (and b!1402414 res!940927) b!1402418))

(assert (= (and b!1402418 res!940926) b!1402415))

(assert (= (and b!1402415 res!940933) b!1402421))

(assert (= (and b!1402421 res!940928) b!1402422))

(assert (= (and b!1402422 res!940931) b!1402417))

(assert (= (and b!1402417 (not res!940929)) b!1402420))

(assert (= (and b!1402420 (not res!940924)) b!1402416))

(assert (= (and b!1402416 (not res!940925)) b!1402413))

(assert (= (and b!1402413 (not res!940932)) b!1402419))

(declare-fun m!1290561 () Bool)

(assert (=> b!1402418 m!1290561))

(assert (=> b!1402418 m!1290561))

(declare-fun m!1290563 () Bool)

(assert (=> b!1402418 m!1290563))

(declare-fun m!1290565 () Bool)

(assert (=> b!1402413 m!1290565))

(declare-fun m!1290567 () Bool)

(assert (=> b!1402422 m!1290567))

(declare-fun m!1290569 () Bool)

(assert (=> b!1402417 m!1290569))

(declare-fun m!1290571 () Bool)

(assert (=> b!1402417 m!1290571))

(assert (=> b!1402417 m!1290569))

(declare-fun m!1290573 () Bool)

(assert (=> b!1402417 m!1290573))

(assert (=> b!1402417 m!1290569))

(declare-fun m!1290575 () Bool)

(assert (=> b!1402417 m!1290575))

(assert (=> b!1402417 m!1290569))

(declare-fun m!1290577 () Bool)

(assert (=> b!1402417 m!1290577))

(declare-fun m!1290579 () Bool)

(assert (=> b!1402417 m!1290579))

(assert (=> b!1402415 m!1290569))

(assert (=> b!1402415 m!1290569))

(declare-fun m!1290581 () Bool)

(assert (=> b!1402415 m!1290581))

(declare-fun m!1290583 () Bool)

(assert (=> b!1402420 m!1290583))

(assert (=> b!1402420 m!1290583))

(declare-fun m!1290585 () Bool)

(assert (=> b!1402420 m!1290585))

(declare-fun m!1290587 () Bool)

(assert (=> b!1402420 m!1290587))

(declare-fun m!1290589 () Bool)

(assert (=> b!1402420 m!1290589))

(declare-fun m!1290591 () Bool)

(assert (=> b!1402416 m!1290591))

(declare-fun m!1290593 () Bool)

(assert (=> b!1402416 m!1290593))

(assert (=> b!1402416 m!1290569))

(declare-fun m!1290595 () Bool)

(assert (=> b!1402416 m!1290595))

(assert (=> b!1402416 m!1290587))

(declare-fun m!1290597 () Bool)

(assert (=> b!1402416 m!1290597))

(assert (=> b!1402416 m!1290569))

(declare-fun m!1290599 () Bool)

(assert (=> b!1402419 m!1290599))

(declare-fun m!1290601 () Bool)

(assert (=> start!120450 m!1290601))

(declare-fun m!1290603 () Bool)

(assert (=> start!120450 m!1290603))

(declare-fun m!1290605 () Bool)

(assert (=> b!1402421 m!1290605))

(push 1)

