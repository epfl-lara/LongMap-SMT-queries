; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121304 () Bool)

(assert start!121304)

(declare-fun b!1409362 () Bool)

(declare-fun e!797733 () Bool)

(declare-fun e!797732 () Bool)

(assert (=> b!1409362 (= e!797733 e!797732)))

(declare-fun res!946400 () Bool)

(assert (=> b!1409362 (=> res!946400 e!797732)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96380 0))(
  ( (array!96381 (arr!46531 (Array (_ BitVec 32) (_ BitVec 64))) (size!47082 (_ BitVec 32))) )
))
(declare-fun lt!620611 () array!96380)

(declare-datatypes ((SeekEntryResult!10745 0))(
  ( (MissingZero!10745 (index!45357 (_ BitVec 32))) (Found!10745 (index!45358 (_ BitVec 32))) (Intermediate!10745 (undefined!11557 Bool) (index!45359 (_ BitVec 32)) (x!127117 (_ BitVec 32))) (Undefined!10745) (MissingVacant!10745 (index!45360 (_ BitVec 32))) )
))
(declare-fun lt!620610 () SeekEntryResult!10745)

(declare-fun lt!620612 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96380 (_ BitVec 32)) SeekEntryResult!10745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409362 (= res!946400 (not (= lt!620610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620612 mask!2840) lt!620612 lt!620611 mask!2840))))))

(declare-fun a!2901 () array!96380)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409362 (= lt!620612 (select (store (arr!46531 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1409362 (= lt!620611 (array!96381 (store (arr!46531 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47082 a!2901)))))

(declare-fun b!1409363 () Bool)

(declare-fun res!946408 () Bool)

(declare-fun e!797735 () Bool)

(assert (=> b!1409363 (=> (not res!946408) (not e!797735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409363 (= res!946408 (validKeyInArray!0 (select (arr!46531 a!2901) i!1037)))))

(declare-fun b!1409364 () Bool)

(declare-fun res!946406 () Bool)

(assert (=> b!1409364 (=> res!946406 e!797732)))

(declare-fun lt!620607 () (_ BitVec 32))

(assert (=> b!1409364 (= res!946406 (or (bvslt (x!127117 lt!620610) #b00000000000000000000000000000000) (bvsgt (x!127117 lt!620610) #b01111111111111111111111111111110) (bvslt lt!620607 #b00000000000000000000000000000000) (bvsge lt!620607 (size!47082 a!2901)) (bvslt (index!45359 lt!620610) #b00000000000000000000000000000000) (bvsge (index!45359 lt!620610) (size!47082 a!2901)) (not (= lt!620610 (Intermediate!10745 false (index!45359 lt!620610) (x!127117 lt!620610))))))))

(declare-fun b!1409365 () Bool)

(declare-fun res!946401 () Bool)

(assert (=> b!1409365 (=> (not res!946401) (not e!797735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96380 (_ BitVec 32)) Bool)

(assert (=> b!1409365 (= res!946401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409366 () Bool)

(declare-fun res!946404 () Bool)

(assert (=> b!1409366 (=> (not res!946404) (not e!797735))))

(declare-datatypes ((List!33037 0))(
  ( (Nil!33034) (Cons!33033 (h!34304 (_ BitVec 64)) (t!47723 List!33037)) )
))
(declare-fun arrayNoDuplicates!0 (array!96380 (_ BitVec 32) List!33037) Bool)

(assert (=> b!1409366 (= res!946404 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33034))))

(declare-fun res!946407 () Bool)

(assert (=> start!121304 (=> (not res!946407) (not e!797735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121304 (= res!946407 (validMask!0 mask!2840))))

(assert (=> start!121304 e!797735))

(assert (=> start!121304 true))

(declare-fun array_inv!35812 (array!96380) Bool)

(assert (=> start!121304 (array_inv!35812 a!2901)))

(declare-fun b!1409367 () Bool)

(assert (=> b!1409367 (= e!797732 true)))

(declare-fun lt!620608 () SeekEntryResult!10745)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96380 (_ BitVec 32)) SeekEntryResult!10745)

(assert (=> b!1409367 (= lt!620608 (seekEntryOrOpen!0 lt!620612 lt!620611 mask!2840))))

(declare-datatypes ((Unit!47491 0))(
  ( (Unit!47492) )
))
(declare-fun lt!620606 () Unit!47491)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47491)

(assert (=> b!1409367 (= lt!620606 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620607 (x!127117 lt!620610) (index!45359 lt!620610) mask!2840))))

(declare-fun b!1409368 () Bool)

(assert (=> b!1409368 (= e!797735 (not e!797733))))

(declare-fun res!946402 () Bool)

(assert (=> b!1409368 (=> res!946402 e!797733)))

(get-info :version)

(assert (=> b!1409368 (= res!946402 (or (not ((_ is Intermediate!10745) lt!620610)) (undefined!11557 lt!620610)))))

(assert (=> b!1409368 (= lt!620608 (Found!10745 j!112))))

(assert (=> b!1409368 (= lt!620608 (seekEntryOrOpen!0 (select (arr!46531 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1409368 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620609 () Unit!47491)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47491)

(assert (=> b!1409368 (= lt!620609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409368 (= lt!620610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620607 (select (arr!46531 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1409368 (= lt!620607 (toIndex!0 (select (arr!46531 a!2901) j!112) mask!2840))))

(declare-fun b!1409369 () Bool)

(declare-fun res!946405 () Bool)

(assert (=> b!1409369 (=> (not res!946405) (not e!797735))))

(assert (=> b!1409369 (= res!946405 (validKeyInArray!0 (select (arr!46531 a!2901) j!112)))))

(declare-fun b!1409370 () Bool)

(declare-fun res!946403 () Bool)

(assert (=> b!1409370 (=> (not res!946403) (not e!797735))))

(assert (=> b!1409370 (= res!946403 (and (= (size!47082 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47082 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47082 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121304 res!946407) b!1409370))

(assert (= (and b!1409370 res!946403) b!1409363))

(assert (= (and b!1409363 res!946408) b!1409369))

(assert (= (and b!1409369 res!946405) b!1409365))

(assert (= (and b!1409365 res!946401) b!1409366))

(assert (= (and b!1409366 res!946404) b!1409368))

(assert (= (and b!1409368 (not res!946402)) b!1409362))

(assert (= (and b!1409362 (not res!946400)) b!1409364))

(assert (= (and b!1409364 (not res!946406)) b!1409367))

(declare-fun m!1298803 () Bool)

(assert (=> b!1409363 m!1298803))

(assert (=> b!1409363 m!1298803))

(declare-fun m!1298805 () Bool)

(assert (=> b!1409363 m!1298805))

(declare-fun m!1298807 () Bool)

(assert (=> b!1409365 m!1298807))

(declare-fun m!1298809 () Bool)

(assert (=> b!1409367 m!1298809))

(declare-fun m!1298811 () Bool)

(assert (=> b!1409367 m!1298811))

(declare-fun m!1298813 () Bool)

(assert (=> start!121304 m!1298813))

(declare-fun m!1298815 () Bool)

(assert (=> start!121304 m!1298815))

(declare-fun m!1298817 () Bool)

(assert (=> b!1409362 m!1298817))

(assert (=> b!1409362 m!1298817))

(declare-fun m!1298819 () Bool)

(assert (=> b!1409362 m!1298819))

(declare-fun m!1298821 () Bool)

(assert (=> b!1409362 m!1298821))

(declare-fun m!1298823 () Bool)

(assert (=> b!1409362 m!1298823))

(declare-fun m!1298825 () Bool)

(assert (=> b!1409369 m!1298825))

(assert (=> b!1409369 m!1298825))

(declare-fun m!1298827 () Bool)

(assert (=> b!1409369 m!1298827))

(declare-fun m!1298829 () Bool)

(assert (=> b!1409366 m!1298829))

(assert (=> b!1409368 m!1298825))

(declare-fun m!1298831 () Bool)

(assert (=> b!1409368 m!1298831))

(assert (=> b!1409368 m!1298825))

(assert (=> b!1409368 m!1298825))

(declare-fun m!1298833 () Bool)

(assert (=> b!1409368 m!1298833))

(declare-fun m!1298835 () Bool)

(assert (=> b!1409368 m!1298835))

(assert (=> b!1409368 m!1298825))

(declare-fun m!1298837 () Bool)

(assert (=> b!1409368 m!1298837))

(declare-fun m!1298839 () Bool)

(assert (=> b!1409368 m!1298839))

(check-sat (not b!1409369) (not b!1409365) (not b!1409368) (not b!1409366) (not b!1409362) (not start!121304) (not b!1409363) (not b!1409367))
(check-sat)
