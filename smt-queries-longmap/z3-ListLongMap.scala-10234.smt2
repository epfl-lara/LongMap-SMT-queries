; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120458 () Bool)

(assert start!120458)

(declare-fun b!1402533 () Bool)

(declare-fun e!794187 () Bool)

(declare-fun e!794188 () Bool)

(assert (=> b!1402533 (= e!794187 e!794188)))

(declare-fun res!941053 () Bool)

(assert (=> b!1402533 (=> res!941053 e!794188)))

(declare-datatypes ((SeekEntryResult!10601 0))(
  ( (MissingZero!10601 (index!44781 (_ BitVec 32))) (Found!10601 (index!44782 (_ BitVec 32))) (Intermediate!10601 (undefined!11413 Bool) (index!44783 (_ BitVec 32)) (x!126404 (_ BitVec 32))) (Undefined!10601) (MissingVacant!10601 (index!44784 (_ BitVec 32))) )
))
(declare-fun lt!617821 () SeekEntryResult!10601)

(declare-fun lt!617815 () SeekEntryResult!10601)

(get-info :version)

(assert (=> b!1402533 (= res!941053 (or (= lt!617821 lt!617815) (not ((_ is Intermediate!10601) lt!617815))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95867 0))(
  ( (array!95868 (arr!46284 (Array (_ BitVec 32) (_ BitVec 64))) (size!46834 (_ BitVec 32))) )
))
(declare-fun lt!617816 () array!95867)

(declare-fun lt!617819 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95867 (_ BitVec 32)) SeekEntryResult!10601)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402533 (= lt!617815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617819 mask!2840) lt!617819 lt!617816 mask!2840))))

(declare-fun a!2901 () array!95867)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402533 (= lt!617819 (select (store (arr!46284 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402533 (= lt!617816 (array!95868 (store (arr!46284 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46834 a!2901)))))

(declare-fun b!1402534 () Bool)

(declare-fun res!941047 () Bool)

(declare-fun e!794186 () Bool)

(assert (=> b!1402534 (=> (not res!941047) (not e!794186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95867 (_ BitVec 32)) Bool)

(assert (=> b!1402534 (= res!941047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402535 () Bool)

(declare-fun res!941049 () Bool)

(declare-fun e!794189 () Bool)

(assert (=> b!1402535 (=> res!941049 e!794189)))

(declare-fun lt!617822 () (_ BitVec 32))

(assert (=> b!1402535 (= res!941049 (not (= lt!617815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617822 lt!617819 lt!617816 mask!2840))))))

(declare-fun b!1402536 () Bool)

(declare-fun res!941048 () Bool)

(assert (=> b!1402536 (=> (not res!941048) (not e!794186))))

(assert (=> b!1402536 (= res!941048 (and (= (size!46834 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46834 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46834 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402537 () Bool)

(assert (=> b!1402537 (= e!794189 true)))

(declare-fun lt!617818 () SeekEntryResult!10601)

(declare-fun lt!617823 () SeekEntryResult!10601)

(assert (=> b!1402537 (= lt!617818 lt!617823)))

(declare-datatypes ((Unit!47206 0))(
  ( (Unit!47207) )
))
(declare-fun lt!617814 () Unit!47206)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47206)

(assert (=> b!1402537 (= lt!617814 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617822 (x!126404 lt!617821) (index!44783 lt!617821) (x!126404 lt!617815) (index!44783 lt!617815) mask!2840))))

(declare-fun b!1402538 () Bool)

(declare-fun res!941045 () Bool)

(assert (=> b!1402538 (=> (not res!941045) (not e!794186))))

(declare-datatypes ((List!32803 0))(
  ( (Nil!32800) (Cons!32799 (h!34047 (_ BitVec 64)) (t!47497 List!32803)) )
))
(declare-fun arrayNoDuplicates!0 (array!95867 (_ BitVec 32) List!32803) Bool)

(assert (=> b!1402538 (= res!941045 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32800))))

(declare-fun b!1402539 () Bool)

(assert (=> b!1402539 (= e!794188 e!794189)))

(declare-fun res!941050 () Bool)

(assert (=> b!1402539 (=> res!941050 e!794189)))

(assert (=> b!1402539 (= res!941050 (or (bvslt (x!126404 lt!617821) #b00000000000000000000000000000000) (bvsgt (x!126404 lt!617821) #b01111111111111111111111111111110) (bvslt (x!126404 lt!617815) #b00000000000000000000000000000000) (bvsgt (x!126404 lt!617815) #b01111111111111111111111111111110) (bvslt lt!617822 #b00000000000000000000000000000000) (bvsge lt!617822 (size!46834 a!2901)) (bvslt (index!44783 lt!617821) #b00000000000000000000000000000000) (bvsge (index!44783 lt!617821) (size!46834 a!2901)) (bvslt (index!44783 lt!617815) #b00000000000000000000000000000000) (bvsge (index!44783 lt!617815) (size!46834 a!2901)) (not (= lt!617821 (Intermediate!10601 false (index!44783 lt!617821) (x!126404 lt!617821)))) (not (= lt!617815 (Intermediate!10601 false (index!44783 lt!617815) (x!126404 lt!617815))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95867 (_ BitVec 32)) SeekEntryResult!10601)

(assert (=> b!1402539 (= lt!617823 (seekKeyOrZeroReturnVacant!0 (x!126404 lt!617815) (index!44783 lt!617815) (index!44783 lt!617815) (select (arr!46284 a!2901) j!112) lt!617816 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95867 (_ BitVec 32)) SeekEntryResult!10601)

(assert (=> b!1402539 (= lt!617823 (seekEntryOrOpen!0 lt!617819 lt!617816 mask!2840))))

(assert (=> b!1402539 (and (not (undefined!11413 lt!617815)) (= (index!44783 lt!617815) i!1037) (bvslt (x!126404 lt!617815) (x!126404 lt!617821)) (= (select (store (arr!46284 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44783 lt!617815)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617817 () Unit!47206)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47206)

(assert (=> b!1402539 (= lt!617817 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617822 (x!126404 lt!617821) (index!44783 lt!617821) (x!126404 lt!617815) (index!44783 lt!617815) (undefined!11413 lt!617815) mask!2840))))

(declare-fun b!1402540 () Bool)

(assert (=> b!1402540 (= e!794186 (not e!794187))))

(declare-fun res!941051 () Bool)

(assert (=> b!1402540 (=> res!941051 e!794187)))

(assert (=> b!1402540 (= res!941051 (or (not ((_ is Intermediate!10601) lt!617821)) (undefined!11413 lt!617821)))))

(assert (=> b!1402540 (= lt!617818 (Found!10601 j!112))))

(assert (=> b!1402540 (= lt!617818 (seekEntryOrOpen!0 (select (arr!46284 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402540 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617820 () Unit!47206)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47206)

(assert (=> b!1402540 (= lt!617820 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402540 (= lt!617821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617822 (select (arr!46284 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402540 (= lt!617822 (toIndex!0 (select (arr!46284 a!2901) j!112) mask!2840))))

(declare-fun b!1402541 () Bool)

(declare-fun res!941044 () Bool)

(assert (=> b!1402541 (=> (not res!941044) (not e!794186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402541 (= res!941044 (validKeyInArray!0 (select (arr!46284 a!2901) i!1037)))))

(declare-fun b!1402542 () Bool)

(declare-fun res!941046 () Bool)

(assert (=> b!1402542 (=> (not res!941046) (not e!794186))))

(assert (=> b!1402542 (= res!941046 (validKeyInArray!0 (select (arr!46284 a!2901) j!112)))))

(declare-fun res!941052 () Bool)

(assert (=> start!120458 (=> (not res!941052) (not e!794186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120458 (= res!941052 (validMask!0 mask!2840))))

(assert (=> start!120458 e!794186))

(assert (=> start!120458 true))

(declare-fun array_inv!35312 (array!95867) Bool)

(assert (=> start!120458 (array_inv!35312 a!2901)))

(assert (= (and start!120458 res!941052) b!1402536))

(assert (= (and b!1402536 res!941048) b!1402541))

(assert (= (and b!1402541 res!941044) b!1402542))

(assert (= (and b!1402542 res!941046) b!1402534))

(assert (= (and b!1402534 res!941047) b!1402538))

(assert (= (and b!1402538 res!941045) b!1402540))

(assert (= (and b!1402540 (not res!941051)) b!1402533))

(assert (= (and b!1402533 (not res!941053)) b!1402539))

(assert (= (and b!1402539 (not res!941050)) b!1402535))

(assert (= (and b!1402535 (not res!941049)) b!1402537))

(declare-fun m!1290745 () Bool)

(assert (=> start!120458 m!1290745))

(declare-fun m!1290747 () Bool)

(assert (=> start!120458 m!1290747))

(declare-fun m!1290749 () Bool)

(assert (=> b!1402542 m!1290749))

(assert (=> b!1402542 m!1290749))

(declare-fun m!1290751 () Bool)

(assert (=> b!1402542 m!1290751))

(declare-fun m!1290753 () Bool)

(assert (=> b!1402541 m!1290753))

(assert (=> b!1402541 m!1290753))

(declare-fun m!1290755 () Bool)

(assert (=> b!1402541 m!1290755))

(declare-fun m!1290757 () Bool)

(assert (=> b!1402537 m!1290757))

(assert (=> b!1402540 m!1290749))

(declare-fun m!1290759 () Bool)

(assert (=> b!1402540 m!1290759))

(assert (=> b!1402540 m!1290749))

(declare-fun m!1290761 () Bool)

(assert (=> b!1402540 m!1290761))

(assert (=> b!1402540 m!1290749))

(declare-fun m!1290763 () Bool)

(assert (=> b!1402540 m!1290763))

(assert (=> b!1402540 m!1290749))

(declare-fun m!1290765 () Bool)

(assert (=> b!1402540 m!1290765))

(declare-fun m!1290767 () Bool)

(assert (=> b!1402540 m!1290767))

(declare-fun m!1290769 () Bool)

(assert (=> b!1402538 m!1290769))

(declare-fun m!1290771 () Bool)

(assert (=> b!1402534 m!1290771))

(declare-fun m!1290773 () Bool)

(assert (=> b!1402533 m!1290773))

(assert (=> b!1402533 m!1290773))

(declare-fun m!1290775 () Bool)

(assert (=> b!1402533 m!1290775))

(declare-fun m!1290777 () Bool)

(assert (=> b!1402533 m!1290777))

(declare-fun m!1290779 () Bool)

(assert (=> b!1402533 m!1290779))

(declare-fun m!1290781 () Bool)

(assert (=> b!1402535 m!1290781))

(assert (=> b!1402539 m!1290749))

(declare-fun m!1290783 () Bool)

(assert (=> b!1402539 m!1290783))

(assert (=> b!1402539 m!1290749))

(declare-fun m!1290785 () Bool)

(assert (=> b!1402539 m!1290785))

(assert (=> b!1402539 m!1290777))

(declare-fun m!1290787 () Bool)

(assert (=> b!1402539 m!1290787))

(declare-fun m!1290789 () Bool)

(assert (=> b!1402539 m!1290789))

(check-sat (not b!1402542) (not b!1402533) (not b!1402538) (not b!1402537) (not b!1402539) (not b!1402541) (not start!120458) (not b!1402540) (not b!1402534) (not b!1402535))
(check-sat)
