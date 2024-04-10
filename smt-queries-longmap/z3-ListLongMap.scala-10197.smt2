; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120110 () Bool)

(assert start!120110)

(declare-fun b!1398454 () Bool)

(declare-fun res!937373 () Bool)

(declare-fun e!791700 () Bool)

(assert (=> b!1398454 (=> (not res!937373) (not e!791700))))

(declare-datatypes ((array!95639 0))(
  ( (array!95640 (arr!46173 (Array (_ BitVec 32) (_ BitVec 64))) (size!46723 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95639)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398454 (= res!937373 (validKeyInArray!0 (select (arr!46173 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1398455 () Bool)

(declare-fun e!791702 () Bool)

(declare-datatypes ((SeekEntryResult!10490 0))(
  ( (MissingZero!10490 (index!44331 (_ BitVec 32))) (Found!10490 (index!44332 (_ BitVec 32))) (Intermediate!10490 (undefined!11302 Bool) (index!44333 (_ BitVec 32)) (x!125976 (_ BitVec 32))) (Undefined!10490) (MissingVacant!10490 (index!44334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95639 (_ BitVec 32)) SeekEntryResult!10490)

(assert (=> b!1398455 (= e!791702 (= (seekEntryOrOpen!0 (select (arr!46173 a!2901) j!112) a!2901 mask!2840) (Found!10490 j!112)))))

(declare-fun b!1398456 () Bool)

(declare-fun e!791698 () Bool)

(assert (=> b!1398456 (= e!791700 (not e!791698))))

(declare-fun res!937367 () Bool)

(assert (=> b!1398456 (=> res!937367 e!791698)))

(declare-fun lt!614940 () SeekEntryResult!10490)

(get-info :version)

(assert (=> b!1398456 (= res!937367 (or (not ((_ is Intermediate!10490) lt!614940)) (undefined!11302 lt!614940)))))

(assert (=> b!1398456 e!791702))

(declare-fun res!937368 () Bool)

(assert (=> b!1398456 (=> (not res!937368) (not e!791702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95639 (_ BitVec 32)) Bool)

(assert (=> b!1398456 (= res!937368 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46984 0))(
  ( (Unit!46985) )
))
(declare-fun lt!614939 () Unit!46984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46984)

(assert (=> b!1398456 (= lt!614939 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614937 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95639 (_ BitVec 32)) SeekEntryResult!10490)

(assert (=> b!1398456 (= lt!614940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614937 (select (arr!46173 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398456 (= lt!614937 (toIndex!0 (select (arr!46173 a!2901) j!112) mask!2840))))

(declare-fun res!937372 () Bool)

(assert (=> start!120110 (=> (not res!937372) (not e!791700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120110 (= res!937372 (validMask!0 mask!2840))))

(assert (=> start!120110 e!791700))

(assert (=> start!120110 true))

(declare-fun array_inv!35201 (array!95639) Bool)

(assert (=> start!120110 (array_inv!35201 a!2901)))

(declare-fun b!1398457 () Bool)

(declare-fun e!791699 () Bool)

(assert (=> b!1398457 (= e!791699 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!614935 () SeekEntryResult!10490)

(assert (=> b!1398457 (and (not (undefined!11302 lt!614935)) (= (index!44333 lt!614935) i!1037) (bvslt (x!125976 lt!614935) (x!125976 lt!614940)) (= (select (store (arr!46173 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44333 lt!614935)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614936 () Unit!46984)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46984)

(assert (=> b!1398457 (= lt!614936 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614937 (x!125976 lt!614940) (index!44333 lt!614940) (x!125976 lt!614935) (index!44333 lt!614935) (undefined!11302 lt!614935) mask!2840))))

(declare-fun b!1398458 () Bool)

(declare-fun res!937375 () Bool)

(assert (=> b!1398458 (=> (not res!937375) (not e!791700))))

(assert (=> b!1398458 (= res!937375 (and (= (size!46723 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46723 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46723 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398459 () Bool)

(assert (=> b!1398459 (= e!791698 e!791699)))

(declare-fun res!937371 () Bool)

(assert (=> b!1398459 (=> res!937371 e!791699)))

(assert (=> b!1398459 (= res!937371 (or (= lt!614940 lt!614935) (not ((_ is Intermediate!10490) lt!614935))))))

(declare-fun lt!614938 () (_ BitVec 64))

(assert (=> b!1398459 (= lt!614935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614938 mask!2840) lt!614938 (array!95640 (store (arr!46173 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46723 a!2901)) mask!2840))))

(assert (=> b!1398459 (= lt!614938 (select (store (arr!46173 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398460 () Bool)

(declare-fun res!937374 () Bool)

(assert (=> b!1398460 (=> (not res!937374) (not e!791700))))

(assert (=> b!1398460 (= res!937374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398461 () Bool)

(declare-fun res!937369 () Bool)

(assert (=> b!1398461 (=> (not res!937369) (not e!791700))))

(declare-datatypes ((List!32692 0))(
  ( (Nil!32689) (Cons!32688 (h!33930 (_ BitVec 64)) (t!47386 List!32692)) )
))
(declare-fun arrayNoDuplicates!0 (array!95639 (_ BitVec 32) List!32692) Bool)

(assert (=> b!1398461 (= res!937369 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32689))))

(declare-fun b!1398462 () Bool)

(declare-fun res!937370 () Bool)

(assert (=> b!1398462 (=> (not res!937370) (not e!791700))))

(assert (=> b!1398462 (= res!937370 (validKeyInArray!0 (select (arr!46173 a!2901) i!1037)))))

(assert (= (and start!120110 res!937372) b!1398458))

(assert (= (and b!1398458 res!937375) b!1398462))

(assert (= (and b!1398462 res!937370) b!1398454))

(assert (= (and b!1398454 res!937373) b!1398460))

(assert (= (and b!1398460 res!937374) b!1398461))

(assert (= (and b!1398461 res!937369) b!1398456))

(assert (= (and b!1398456 res!937368) b!1398455))

(assert (= (and b!1398456 (not res!937367)) b!1398459))

(assert (= (and b!1398459 (not res!937371)) b!1398457))

(declare-fun m!1285589 () Bool)

(assert (=> b!1398457 m!1285589))

(declare-fun m!1285591 () Bool)

(assert (=> b!1398457 m!1285591))

(declare-fun m!1285593 () Bool)

(assert (=> b!1398457 m!1285593))

(declare-fun m!1285595 () Bool)

(assert (=> b!1398456 m!1285595))

(declare-fun m!1285597 () Bool)

(assert (=> b!1398456 m!1285597))

(assert (=> b!1398456 m!1285595))

(declare-fun m!1285599 () Bool)

(assert (=> b!1398456 m!1285599))

(assert (=> b!1398456 m!1285595))

(declare-fun m!1285601 () Bool)

(assert (=> b!1398456 m!1285601))

(declare-fun m!1285603 () Bool)

(assert (=> b!1398456 m!1285603))

(assert (=> b!1398455 m!1285595))

(assert (=> b!1398455 m!1285595))

(declare-fun m!1285605 () Bool)

(assert (=> b!1398455 m!1285605))

(declare-fun m!1285607 () Bool)

(assert (=> b!1398462 m!1285607))

(assert (=> b!1398462 m!1285607))

(declare-fun m!1285609 () Bool)

(assert (=> b!1398462 m!1285609))

(declare-fun m!1285611 () Bool)

(assert (=> b!1398461 m!1285611))

(assert (=> b!1398454 m!1285595))

(assert (=> b!1398454 m!1285595))

(declare-fun m!1285613 () Bool)

(assert (=> b!1398454 m!1285613))

(declare-fun m!1285615 () Bool)

(assert (=> b!1398459 m!1285615))

(assert (=> b!1398459 m!1285589))

(assert (=> b!1398459 m!1285615))

(declare-fun m!1285617 () Bool)

(assert (=> b!1398459 m!1285617))

(declare-fun m!1285619 () Bool)

(assert (=> b!1398459 m!1285619))

(declare-fun m!1285621 () Bool)

(assert (=> b!1398460 m!1285621))

(declare-fun m!1285623 () Bool)

(assert (=> start!120110 m!1285623))

(declare-fun m!1285625 () Bool)

(assert (=> start!120110 m!1285625))

(check-sat (not b!1398461) (not start!120110) (not b!1398462) (not b!1398457) (not b!1398455) (not b!1398460) (not b!1398454) (not b!1398459) (not b!1398456))
(check-sat)
