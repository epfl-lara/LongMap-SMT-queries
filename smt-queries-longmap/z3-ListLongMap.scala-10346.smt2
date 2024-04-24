; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121814 () Bool)

(assert start!121814)

(declare-datatypes ((SeekEntryResult!10886 0))(
  ( (MissingZero!10886 (index!45924 (_ BitVec 32))) (Found!10886 (index!45925 (_ BitVec 32))) (Intermediate!10886 (undefined!11698 Bool) (index!45926 (_ BitVec 32)) (x!127664 (_ BitVec 32))) (Undefined!10886) (MissingVacant!10886 (index!45927 (_ BitVec 32))) )
))
(declare-fun lt!623134 () SeekEntryResult!10886)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96674 0))(
  ( (array!96675 (arr!46672 (Array (_ BitVec 32) (_ BitVec 64))) (size!47223 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96674)

(declare-fun e!800381 () Bool)

(declare-fun lt!623129 () array!96674)

(declare-fun lt!623133 () (_ BitVec 64))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1414146 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96674 (_ BitVec 32)) SeekEntryResult!10886)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96674 (_ BitVec 32)) SeekEntryResult!10886)

(assert (=> b!1414146 (= e!800381 (= (seekEntryOrOpen!0 lt!623133 lt!623129 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127664 lt!623134) (index!45926 lt!623134) (index!45926 lt!623134) (select (arr!46672 a!2901) j!112) lt!623129 mask!2840)))))

(declare-fun b!1414147 () Bool)

(declare-fun e!800382 () Bool)

(declare-fun e!800380 () Bool)

(assert (=> b!1414147 (= e!800382 e!800380)))

(declare-fun res!950454 () Bool)

(assert (=> b!1414147 (=> res!950454 e!800380)))

(declare-fun lt!623130 () SeekEntryResult!10886)

(get-info :version)

(assert (=> b!1414147 (= res!950454 (or (= lt!623130 lt!623134) (not ((_ is Intermediate!10886) lt!623134))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96674 (_ BitVec 32)) SeekEntryResult!10886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414147 (= lt!623134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623133 mask!2840) lt!623133 lt!623129 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1414147 (= lt!623133 (select (store (arr!46672 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414147 (= lt!623129 (array!96675 (store (arr!46672 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47223 a!2901)))))

(declare-fun b!1414148 () Bool)

(declare-fun res!950456 () Bool)

(declare-fun e!800384 () Bool)

(assert (=> b!1414148 (=> (not res!950456) (not e!800384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414148 (= res!950456 (validKeyInArray!0 (select (arr!46672 a!2901) i!1037)))))

(declare-fun res!950461 () Bool)

(assert (=> start!121814 (=> (not res!950461) (not e!800384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121814 (= res!950461 (validMask!0 mask!2840))))

(assert (=> start!121814 e!800384))

(assert (=> start!121814 true))

(declare-fun array_inv!35953 (array!96674) Bool)

(assert (=> start!121814 (array_inv!35953 a!2901)))

(declare-fun b!1414149 () Bool)

(declare-fun res!950457 () Bool)

(assert (=> b!1414149 (=> (not res!950457) (not e!800384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96674 (_ BitVec 32)) Bool)

(assert (=> b!1414149 (= res!950457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414150 () Bool)

(declare-fun res!950459 () Bool)

(assert (=> b!1414150 (=> (not res!950459) (not e!800384))))

(declare-datatypes ((List!33178 0))(
  ( (Nil!33175) (Cons!33174 (h!34457 (_ BitVec 64)) (t!47864 List!33178)) )
))
(declare-fun arrayNoDuplicates!0 (array!96674 (_ BitVec 32) List!33178) Bool)

(assert (=> b!1414150 (= res!950459 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33175))))

(declare-fun b!1414151 () Bool)

(assert (=> b!1414151 (= e!800384 (not e!800382))))

(declare-fun res!950453 () Bool)

(assert (=> b!1414151 (=> res!950453 e!800382)))

(assert (=> b!1414151 (= res!950453 (or (not ((_ is Intermediate!10886) lt!623130)) (undefined!11698 lt!623130)))))

(declare-fun e!800379 () Bool)

(assert (=> b!1414151 e!800379))

(declare-fun res!950455 () Bool)

(assert (=> b!1414151 (=> (not res!950455) (not e!800379))))

(assert (=> b!1414151 (= res!950455 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47773 0))(
  ( (Unit!47774) )
))
(declare-fun lt!623132 () Unit!47773)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47773)

(assert (=> b!1414151 (= lt!623132 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623131 () (_ BitVec 32))

(assert (=> b!1414151 (= lt!623130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623131 (select (arr!46672 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414151 (= lt!623131 (toIndex!0 (select (arr!46672 a!2901) j!112) mask!2840))))

(declare-fun b!1414152 () Bool)

(assert (=> b!1414152 (= e!800380 true)))

(assert (=> b!1414152 e!800381))

(declare-fun res!950452 () Bool)

(assert (=> b!1414152 (=> (not res!950452) (not e!800381))))

(assert (=> b!1414152 (= res!950452 (and (not (undefined!11698 lt!623134)) (= (index!45926 lt!623134) i!1037) (bvslt (x!127664 lt!623134) (x!127664 lt!623130)) (= (select (store (arr!46672 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45926 lt!623134)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623135 () Unit!47773)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47773)

(assert (=> b!1414152 (= lt!623135 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623131 (x!127664 lt!623130) (index!45926 lt!623130) (x!127664 lt!623134) (index!45926 lt!623134) (undefined!11698 lt!623134) mask!2840))))

(declare-fun b!1414153 () Bool)

(declare-fun res!950460 () Bool)

(assert (=> b!1414153 (=> (not res!950460) (not e!800384))))

(assert (=> b!1414153 (= res!950460 (and (= (size!47223 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47223 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47223 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1414154 () Bool)

(declare-fun res!950458 () Bool)

(assert (=> b!1414154 (=> (not res!950458) (not e!800384))))

(assert (=> b!1414154 (= res!950458 (validKeyInArray!0 (select (arr!46672 a!2901) j!112)))))

(declare-fun b!1414155 () Bool)

(assert (=> b!1414155 (= e!800379 (= (seekEntryOrOpen!0 (select (arr!46672 a!2901) j!112) a!2901 mask!2840) (Found!10886 j!112)))))

(assert (= (and start!121814 res!950461) b!1414153))

(assert (= (and b!1414153 res!950460) b!1414148))

(assert (= (and b!1414148 res!950456) b!1414154))

(assert (= (and b!1414154 res!950458) b!1414149))

(assert (= (and b!1414149 res!950457) b!1414150))

(assert (= (and b!1414150 res!950459) b!1414151))

(assert (= (and b!1414151 res!950455) b!1414155))

(assert (= (and b!1414151 (not res!950453)) b!1414147))

(assert (= (and b!1414147 (not res!950454)) b!1414152))

(assert (= (and b!1414152 res!950452) b!1414146))

(declare-fun m!1304629 () Bool)

(assert (=> start!121814 m!1304629))

(declare-fun m!1304631 () Bool)

(assert (=> start!121814 m!1304631))

(declare-fun m!1304633 () Bool)

(assert (=> b!1414148 m!1304633))

(assert (=> b!1414148 m!1304633))

(declare-fun m!1304635 () Bool)

(assert (=> b!1414148 m!1304635))

(declare-fun m!1304637 () Bool)

(assert (=> b!1414146 m!1304637))

(declare-fun m!1304639 () Bool)

(assert (=> b!1414146 m!1304639))

(assert (=> b!1414146 m!1304639))

(declare-fun m!1304641 () Bool)

(assert (=> b!1414146 m!1304641))

(assert (=> b!1414154 m!1304639))

(assert (=> b!1414154 m!1304639))

(declare-fun m!1304643 () Bool)

(assert (=> b!1414154 m!1304643))

(declare-fun m!1304645 () Bool)

(assert (=> b!1414149 m!1304645))

(declare-fun m!1304647 () Bool)

(assert (=> b!1414147 m!1304647))

(assert (=> b!1414147 m!1304647))

(declare-fun m!1304649 () Bool)

(assert (=> b!1414147 m!1304649))

(declare-fun m!1304651 () Bool)

(assert (=> b!1414147 m!1304651))

(declare-fun m!1304653 () Bool)

(assert (=> b!1414147 m!1304653))

(assert (=> b!1414151 m!1304639))

(declare-fun m!1304655 () Bool)

(assert (=> b!1414151 m!1304655))

(assert (=> b!1414151 m!1304639))

(declare-fun m!1304657 () Bool)

(assert (=> b!1414151 m!1304657))

(assert (=> b!1414151 m!1304639))

(declare-fun m!1304659 () Bool)

(assert (=> b!1414151 m!1304659))

(declare-fun m!1304661 () Bool)

(assert (=> b!1414151 m!1304661))

(assert (=> b!1414152 m!1304651))

(declare-fun m!1304663 () Bool)

(assert (=> b!1414152 m!1304663))

(declare-fun m!1304665 () Bool)

(assert (=> b!1414152 m!1304665))

(declare-fun m!1304667 () Bool)

(assert (=> b!1414150 m!1304667))

(assert (=> b!1414155 m!1304639))

(assert (=> b!1414155 m!1304639))

(declare-fun m!1304669 () Bool)

(assert (=> b!1414155 m!1304669))

(check-sat (not start!121814) (not b!1414155) (not b!1414152) (not b!1414146) (not b!1414147) (not b!1414150) (not b!1414151) (not b!1414148) (not b!1414149) (not b!1414154))
(check-sat)
