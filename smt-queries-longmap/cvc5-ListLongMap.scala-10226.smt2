; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120408 () Bool)

(assert start!120408)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95817 0))(
  ( (array!95818 (arr!46259 (Array (_ BitVec 32) (_ BitVec 64))) (size!46809 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95817)

(declare-datatypes ((SeekEntryResult!10576 0))(
  ( (MissingZero!10576 (index!44681 (_ BitVec 32))) (Found!10576 (index!44682 (_ BitVec 32))) (Intermediate!10576 (undefined!11388 Bool) (index!44683 (_ BitVec 32)) (x!126315 (_ BitVec 32))) (Undefined!10576) (MissingVacant!10576 (index!44684 (_ BitVec 32))) )
))
(declare-fun lt!617151 () SeekEntryResult!10576)

(declare-fun lt!617152 () array!95817)

(declare-fun b!1401740 () Bool)

(declare-fun e!793730 () Bool)

(declare-fun lt!617153 () (_ BitVec 64))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95817 (_ BitVec 32)) SeekEntryResult!10576)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95817 (_ BitVec 32)) SeekEntryResult!10576)

(assert (=> b!1401740 (= e!793730 (= (seekEntryOrOpen!0 lt!617153 lt!617152 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126315 lt!617151) (index!44683 lt!617151) (index!44683 lt!617151) (select (arr!46259 a!2901) j!112) lt!617152 mask!2840)))))

(declare-fun res!940261 () Bool)

(declare-fun e!793726 () Bool)

(assert (=> start!120408 (=> (not res!940261) (not e!793726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120408 (= res!940261 (validMask!0 mask!2840))))

(assert (=> start!120408 e!793726))

(assert (=> start!120408 true))

(declare-fun array_inv!35287 (array!95817) Bool)

(assert (=> start!120408 (array_inv!35287 a!2901)))

(declare-fun b!1401741 () Bool)

(declare-fun res!940253 () Bool)

(assert (=> b!1401741 (=> (not res!940253) (not e!793726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401741 (= res!940253 (validKeyInArray!0 (select (arr!46259 a!2901) j!112)))))

(declare-fun b!1401742 () Bool)

(declare-fun e!793728 () Bool)

(declare-fun e!793724 () Bool)

(assert (=> b!1401742 (= e!793728 e!793724)))

(declare-fun res!940257 () Bool)

(assert (=> b!1401742 (=> res!940257 e!793724)))

(declare-fun lt!617150 () SeekEntryResult!10576)

(assert (=> b!1401742 (= res!940257 (or (= lt!617150 lt!617151) (not (is-Intermediate!10576 lt!617151))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95817 (_ BitVec 32)) SeekEntryResult!10576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401742 (= lt!617151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617153 mask!2840) lt!617153 lt!617152 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401742 (= lt!617153 (select (store (arr!46259 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401742 (= lt!617152 (array!95818 (store (arr!46259 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46809 a!2901)))))

(declare-fun b!1401743 () Bool)

(assert (=> b!1401743 (= e!793726 (not e!793728))))

(declare-fun res!940260 () Bool)

(assert (=> b!1401743 (=> res!940260 e!793728)))

(assert (=> b!1401743 (= res!940260 (or (not (is-Intermediate!10576 lt!617150)) (undefined!11388 lt!617150)))))

(declare-fun e!793727 () Bool)

(assert (=> b!1401743 e!793727))

(declare-fun res!940252 () Bool)

(assert (=> b!1401743 (=> (not res!940252) (not e!793727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95817 (_ BitVec 32)) Bool)

(assert (=> b!1401743 (= res!940252 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47156 0))(
  ( (Unit!47157) )
))
(declare-fun lt!617156 () Unit!47156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47156)

(assert (=> b!1401743 (= lt!617156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617155 () (_ BitVec 32))

(assert (=> b!1401743 (= lt!617150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617155 (select (arr!46259 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401743 (= lt!617155 (toIndex!0 (select (arr!46259 a!2901) j!112) mask!2840))))

(declare-fun b!1401744 () Bool)

(declare-fun e!793729 () Bool)

(assert (=> b!1401744 (= e!793724 e!793729)))

(declare-fun res!940259 () Bool)

(assert (=> b!1401744 (=> res!940259 e!793729)))

(assert (=> b!1401744 (= res!940259 (or (bvslt (x!126315 lt!617150) #b00000000000000000000000000000000) (bvsgt (x!126315 lt!617150) #b01111111111111111111111111111110) (bvslt (x!126315 lt!617151) #b00000000000000000000000000000000) (bvsgt (x!126315 lt!617151) #b01111111111111111111111111111110) (bvslt lt!617155 #b00000000000000000000000000000000) (bvsge lt!617155 (size!46809 a!2901)) (bvslt (index!44683 lt!617150) #b00000000000000000000000000000000) (bvsge (index!44683 lt!617150) (size!46809 a!2901)) (bvslt (index!44683 lt!617151) #b00000000000000000000000000000000) (bvsge (index!44683 lt!617151) (size!46809 a!2901)) (not (= lt!617150 (Intermediate!10576 false (index!44683 lt!617150) (x!126315 lt!617150)))) (not (= lt!617151 (Intermediate!10576 false (index!44683 lt!617151) (x!126315 lt!617151))))))))

(assert (=> b!1401744 e!793730))

(declare-fun res!940254 () Bool)

(assert (=> b!1401744 (=> (not res!940254) (not e!793730))))

(assert (=> b!1401744 (= res!940254 (and (not (undefined!11388 lt!617151)) (= (index!44683 lt!617151) i!1037) (bvslt (x!126315 lt!617151) (x!126315 lt!617150)) (= (select (store (arr!46259 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44683 lt!617151)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617157 () Unit!47156)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47156)

(assert (=> b!1401744 (= lt!617157 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617155 (x!126315 lt!617150) (index!44683 lt!617150) (x!126315 lt!617151) (index!44683 lt!617151) (undefined!11388 lt!617151) mask!2840))))

(declare-fun b!1401745 () Bool)

(declare-fun res!940256 () Bool)

(assert (=> b!1401745 (=> (not res!940256) (not e!793726))))

(assert (=> b!1401745 (= res!940256 (and (= (size!46809 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46809 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46809 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401746 () Bool)

(declare-fun res!940255 () Bool)

(assert (=> b!1401746 (=> (not res!940255) (not e!793726))))

(declare-datatypes ((List!32778 0))(
  ( (Nil!32775) (Cons!32774 (h!34022 (_ BitVec 64)) (t!47472 List!32778)) )
))
(declare-fun arrayNoDuplicates!0 (array!95817 (_ BitVec 32) List!32778) Bool)

(assert (=> b!1401746 (= res!940255 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32775))))

(declare-fun b!1401747 () Bool)

(assert (=> b!1401747 (= e!793729 true)))

(declare-fun lt!617154 () SeekEntryResult!10576)

(assert (=> b!1401747 (= lt!617154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617155 lt!617153 lt!617152 mask!2840))))

(declare-fun b!1401748 () Bool)

(assert (=> b!1401748 (= e!793727 (= (seekEntryOrOpen!0 (select (arr!46259 a!2901) j!112) a!2901 mask!2840) (Found!10576 j!112)))))

(declare-fun b!1401749 () Bool)

(declare-fun res!940251 () Bool)

(assert (=> b!1401749 (=> (not res!940251) (not e!793726))))

(assert (=> b!1401749 (= res!940251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401750 () Bool)

(declare-fun res!940258 () Bool)

(assert (=> b!1401750 (=> (not res!940258) (not e!793726))))

(assert (=> b!1401750 (= res!940258 (validKeyInArray!0 (select (arr!46259 a!2901) i!1037)))))

(assert (= (and start!120408 res!940261) b!1401745))

(assert (= (and b!1401745 res!940256) b!1401750))

(assert (= (and b!1401750 res!940258) b!1401741))

(assert (= (and b!1401741 res!940253) b!1401749))

(assert (= (and b!1401749 res!940251) b!1401746))

(assert (= (and b!1401746 res!940255) b!1401743))

(assert (= (and b!1401743 res!940252) b!1401748))

(assert (= (and b!1401743 (not res!940260)) b!1401742))

(assert (= (and b!1401742 (not res!940257)) b!1401744))

(assert (= (and b!1401744 res!940254) b!1401740))

(assert (= (and b!1401744 (not res!940259)) b!1401747))

(declare-fun m!1289625 () Bool)

(assert (=> b!1401748 m!1289625))

(assert (=> b!1401748 m!1289625))

(declare-fun m!1289627 () Bool)

(assert (=> b!1401748 m!1289627))

(declare-fun m!1289629 () Bool)

(assert (=> b!1401749 m!1289629))

(assert (=> b!1401741 m!1289625))

(assert (=> b!1401741 m!1289625))

(declare-fun m!1289631 () Bool)

(assert (=> b!1401741 m!1289631))

(declare-fun m!1289633 () Bool)

(assert (=> b!1401744 m!1289633))

(declare-fun m!1289635 () Bool)

(assert (=> b!1401744 m!1289635))

(declare-fun m!1289637 () Bool)

(assert (=> b!1401744 m!1289637))

(declare-fun m!1289639 () Bool)

(assert (=> b!1401750 m!1289639))

(assert (=> b!1401750 m!1289639))

(declare-fun m!1289641 () Bool)

(assert (=> b!1401750 m!1289641))

(declare-fun m!1289643 () Bool)

(assert (=> b!1401742 m!1289643))

(assert (=> b!1401742 m!1289643))

(declare-fun m!1289645 () Bool)

(assert (=> b!1401742 m!1289645))

(assert (=> b!1401742 m!1289633))

(declare-fun m!1289647 () Bool)

(assert (=> b!1401742 m!1289647))

(declare-fun m!1289649 () Bool)

(assert (=> start!120408 m!1289649))

(declare-fun m!1289651 () Bool)

(assert (=> start!120408 m!1289651))

(declare-fun m!1289653 () Bool)

(assert (=> b!1401747 m!1289653))

(declare-fun m!1289655 () Bool)

(assert (=> b!1401746 m!1289655))

(declare-fun m!1289657 () Bool)

(assert (=> b!1401740 m!1289657))

(assert (=> b!1401740 m!1289625))

(assert (=> b!1401740 m!1289625))

(declare-fun m!1289659 () Bool)

(assert (=> b!1401740 m!1289659))

(assert (=> b!1401743 m!1289625))

(declare-fun m!1289661 () Bool)

(assert (=> b!1401743 m!1289661))

(assert (=> b!1401743 m!1289625))

(assert (=> b!1401743 m!1289625))

(declare-fun m!1289663 () Bool)

(assert (=> b!1401743 m!1289663))

(declare-fun m!1289665 () Bool)

(assert (=> b!1401743 m!1289665))

(declare-fun m!1289667 () Bool)

(assert (=> b!1401743 m!1289667))

(push 1)

