; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120366 () Bool)

(assert start!120366)

(declare-fun b!1401047 () Bool)

(declare-fun res!939558 () Bool)

(declare-fun e!793284 () Bool)

(assert (=> b!1401047 (=> (not res!939558) (not e!793284))))

(declare-datatypes ((array!95775 0))(
  ( (array!95776 (arr!46238 (Array (_ BitVec 32) (_ BitVec 64))) (size!46788 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95775)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95775 (_ BitVec 32)) Bool)

(assert (=> b!1401047 (= res!939558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401048 () Bool)

(declare-fun res!939562 () Bool)

(assert (=> b!1401048 (=> (not res!939562) (not e!793284))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401048 (= res!939562 (and (= (size!46788 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46788 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46788 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401049 () Bool)

(declare-fun e!793288 () Bool)

(declare-fun e!793283 () Bool)

(assert (=> b!1401049 (= e!793288 e!793283)))

(declare-fun res!939568 () Bool)

(assert (=> b!1401049 (=> res!939568 e!793283)))

(declare-datatypes ((SeekEntryResult!10555 0))(
  ( (MissingZero!10555 (index!44597 (_ BitVec 32))) (Found!10555 (index!44598 (_ BitVec 32))) (Intermediate!10555 (undefined!11367 Bool) (index!44599 (_ BitVec 32)) (x!126238 (_ BitVec 32))) (Undefined!10555) (MissingVacant!10555 (index!44600 (_ BitVec 32))) )
))
(declare-fun lt!616653 () SeekEntryResult!10555)

(declare-fun lt!616652 () SeekEntryResult!10555)

(assert (=> b!1401049 (= res!939568 (or (= lt!616653 lt!616652) (not (is-Intermediate!10555 lt!616652))))))

(declare-fun lt!616647 () (_ BitVec 64))

(declare-fun lt!616651 () array!95775)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95775 (_ BitVec 32)) SeekEntryResult!10555)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401049 (= lt!616652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616647 mask!2840) lt!616647 lt!616651 mask!2840))))

(assert (=> b!1401049 (= lt!616647 (select (store (arr!46238 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401049 (= lt!616651 (array!95776 (store (arr!46238 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46788 a!2901)))))

(declare-fun b!1401050 () Bool)

(declare-fun res!939564 () Bool)

(assert (=> b!1401050 (=> (not res!939564) (not e!793284))))

(declare-datatypes ((List!32757 0))(
  ( (Nil!32754) (Cons!32753 (h!34001 (_ BitVec 64)) (t!47451 List!32757)) )
))
(declare-fun arrayNoDuplicates!0 (array!95775 (_ BitVec 32) List!32757) Bool)

(assert (=> b!1401050 (= res!939564 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32754))))

(declare-fun b!1401051 () Bool)

(assert (=> b!1401051 (= e!793284 (not e!793288))))

(declare-fun res!939561 () Bool)

(assert (=> b!1401051 (=> res!939561 e!793288)))

(assert (=> b!1401051 (= res!939561 (or (not (is-Intermediate!10555 lt!616653)) (undefined!11367 lt!616653)))))

(declare-fun e!793285 () Bool)

(assert (=> b!1401051 e!793285))

(declare-fun res!939566 () Bool)

(assert (=> b!1401051 (=> (not res!939566) (not e!793285))))

(assert (=> b!1401051 (= res!939566 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47114 0))(
  ( (Unit!47115) )
))
(declare-fun lt!616646 () Unit!47114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47114)

(assert (=> b!1401051 (= lt!616646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616650 () (_ BitVec 32))

(assert (=> b!1401051 (= lt!616653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616650 (select (arr!46238 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401051 (= lt!616650 (toIndex!0 (select (arr!46238 a!2901) j!112) mask!2840))))

(declare-fun b!1401052 () Bool)

(declare-fun res!939567 () Bool)

(assert (=> b!1401052 (=> (not res!939567) (not e!793284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401052 (= res!939567 (validKeyInArray!0 (select (arr!46238 a!2901) i!1037)))))

(declare-fun b!1401053 () Bool)

(declare-fun e!793286 () Bool)

(assert (=> b!1401053 (= e!793283 e!793286)))

(declare-fun res!939565 () Bool)

(assert (=> b!1401053 (=> res!939565 e!793286)))

(assert (=> b!1401053 (= res!939565 (or (bvslt (x!126238 lt!616653) #b00000000000000000000000000000000) (bvsgt (x!126238 lt!616653) #b01111111111111111111111111111110) (bvslt (x!126238 lt!616652) #b00000000000000000000000000000000) (bvsgt (x!126238 lt!616652) #b01111111111111111111111111111110) (bvslt lt!616650 #b00000000000000000000000000000000) (bvsge lt!616650 (size!46788 a!2901)) (bvslt (index!44599 lt!616653) #b00000000000000000000000000000000) (bvsge (index!44599 lt!616653) (size!46788 a!2901)) (bvslt (index!44599 lt!616652) #b00000000000000000000000000000000) (bvsge (index!44599 lt!616652) (size!46788 a!2901)) (not (= lt!616653 (Intermediate!10555 false (index!44599 lt!616653) (x!126238 lt!616653)))) (not (= lt!616652 (Intermediate!10555 false (index!44599 lt!616652) (x!126238 lt!616652))))))))

(declare-fun e!793287 () Bool)

(assert (=> b!1401053 e!793287))

(declare-fun res!939559 () Bool)

(assert (=> b!1401053 (=> (not res!939559) (not e!793287))))

(assert (=> b!1401053 (= res!939559 (and (not (undefined!11367 lt!616652)) (= (index!44599 lt!616652) i!1037) (bvslt (x!126238 lt!616652) (x!126238 lt!616653)) (= (select (store (arr!46238 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44599 lt!616652)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616649 () Unit!47114)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47114)

(assert (=> b!1401053 (= lt!616649 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616650 (x!126238 lt!616653) (index!44599 lt!616653) (x!126238 lt!616652) (index!44599 lt!616652) (undefined!11367 lt!616652) mask!2840))))

(declare-fun res!939563 () Bool)

(assert (=> start!120366 (=> (not res!939563) (not e!793284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120366 (= res!939563 (validMask!0 mask!2840))))

(assert (=> start!120366 e!793284))

(assert (=> start!120366 true))

(declare-fun array_inv!35266 (array!95775) Bool)

(assert (=> start!120366 (array_inv!35266 a!2901)))

(declare-fun b!1401054 () Bool)

(declare-fun res!939560 () Bool)

(assert (=> b!1401054 (=> (not res!939560) (not e!793284))))

(assert (=> b!1401054 (= res!939560 (validKeyInArray!0 (select (arr!46238 a!2901) j!112)))))

(declare-fun b!1401055 () Bool)

(assert (=> b!1401055 (= e!793286 true)))

(declare-fun lt!616648 () SeekEntryResult!10555)

(assert (=> b!1401055 (= lt!616648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616650 lt!616647 lt!616651 mask!2840))))

(declare-fun b!1401056 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95775 (_ BitVec 32)) SeekEntryResult!10555)

(assert (=> b!1401056 (= e!793285 (= (seekEntryOrOpen!0 (select (arr!46238 a!2901) j!112) a!2901 mask!2840) (Found!10555 j!112)))))

(declare-fun b!1401057 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95775 (_ BitVec 32)) SeekEntryResult!10555)

(assert (=> b!1401057 (= e!793287 (= (seekEntryOrOpen!0 lt!616647 lt!616651 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126238 lt!616652) (index!44599 lt!616652) (index!44599 lt!616652) (select (arr!46238 a!2901) j!112) lt!616651 mask!2840)))))

(assert (= (and start!120366 res!939563) b!1401048))

(assert (= (and b!1401048 res!939562) b!1401052))

(assert (= (and b!1401052 res!939567) b!1401054))

(assert (= (and b!1401054 res!939560) b!1401047))

(assert (= (and b!1401047 res!939558) b!1401050))

(assert (= (and b!1401050 res!939564) b!1401051))

(assert (= (and b!1401051 res!939566) b!1401056))

(assert (= (and b!1401051 (not res!939561)) b!1401049))

(assert (= (and b!1401049 (not res!939568)) b!1401053))

(assert (= (and b!1401053 res!939559) b!1401057))

(assert (= (and b!1401053 (not res!939565)) b!1401055))

(declare-fun m!1288701 () Bool)

(assert (=> b!1401051 m!1288701))

(declare-fun m!1288703 () Bool)

(assert (=> b!1401051 m!1288703))

(assert (=> b!1401051 m!1288701))

(assert (=> b!1401051 m!1288701))

(declare-fun m!1288705 () Bool)

(assert (=> b!1401051 m!1288705))

(declare-fun m!1288707 () Bool)

(assert (=> b!1401051 m!1288707))

(declare-fun m!1288709 () Bool)

(assert (=> b!1401051 m!1288709))

(declare-fun m!1288711 () Bool)

(assert (=> b!1401047 m!1288711))

(declare-fun m!1288713 () Bool)

(assert (=> b!1401050 m!1288713))

(declare-fun m!1288715 () Bool)

(assert (=> start!120366 m!1288715))

(declare-fun m!1288717 () Bool)

(assert (=> start!120366 m!1288717))

(declare-fun m!1288719 () Bool)

(assert (=> b!1401052 m!1288719))

(assert (=> b!1401052 m!1288719))

(declare-fun m!1288721 () Bool)

(assert (=> b!1401052 m!1288721))

(declare-fun m!1288723 () Bool)

(assert (=> b!1401055 m!1288723))

(declare-fun m!1288725 () Bool)

(assert (=> b!1401057 m!1288725))

(assert (=> b!1401057 m!1288701))

(assert (=> b!1401057 m!1288701))

(declare-fun m!1288727 () Bool)

(assert (=> b!1401057 m!1288727))

(declare-fun m!1288729 () Bool)

(assert (=> b!1401049 m!1288729))

(assert (=> b!1401049 m!1288729))

(declare-fun m!1288731 () Bool)

(assert (=> b!1401049 m!1288731))

(declare-fun m!1288733 () Bool)

(assert (=> b!1401049 m!1288733))

(declare-fun m!1288735 () Bool)

(assert (=> b!1401049 m!1288735))

(assert (=> b!1401056 m!1288701))

(assert (=> b!1401056 m!1288701))

(declare-fun m!1288737 () Bool)

(assert (=> b!1401056 m!1288737))

(assert (=> b!1401053 m!1288733))

(declare-fun m!1288739 () Bool)

(assert (=> b!1401053 m!1288739))

(declare-fun m!1288741 () Bool)

(assert (=> b!1401053 m!1288741))

(assert (=> b!1401054 m!1288701))

(assert (=> b!1401054 m!1288701))

(declare-fun m!1288743 () Bool)

(assert (=> b!1401054 m!1288743))

(push 1)

