; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122012 () Bool)

(assert start!122012)

(declare-fun b!1416171 () Bool)

(declare-fun e!801524 () Bool)

(declare-fun e!801525 () Bool)

(assert (=> b!1416171 (= e!801524 e!801525)))

(declare-fun res!952215 () Bool)

(assert (=> b!1416171 (=> res!952215 e!801525)))

(declare-datatypes ((array!96698 0))(
  ( (array!96699 (arr!46680 (Array (_ BitVec 32) (_ BitVec 64))) (size!47230 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96698)

(declare-datatypes ((SeekEntryResult!10991 0))(
  ( (MissingZero!10991 (index!46356 (_ BitVec 32))) (Found!10991 (index!46357 (_ BitVec 32))) (Intermediate!10991 (undefined!11803 Bool) (index!46358 (_ BitVec 32)) (x!127958 (_ BitVec 32))) (Undefined!10991) (MissingVacant!10991 (index!46359 (_ BitVec 32))) )
))
(declare-fun lt!624729 () SeekEntryResult!10991)

(declare-fun lt!624728 () (_ BitVec 32))

(declare-fun lt!624732 () SeekEntryResult!10991)

(assert (=> b!1416171 (= res!952215 (or (bvslt (x!127958 lt!624729) #b00000000000000000000000000000000) (bvsgt (x!127958 lt!624729) #b01111111111111111111111111111110) (bvslt (x!127958 lt!624732) #b00000000000000000000000000000000) (bvsgt (x!127958 lt!624732) #b01111111111111111111111111111110) (bvslt lt!624728 #b00000000000000000000000000000000) (bvsge lt!624728 (size!47230 a!2901)) (bvslt (index!46358 lt!624729) #b00000000000000000000000000000000) (bvsge (index!46358 lt!624729) (size!47230 a!2901)) (bvslt (index!46358 lt!624732) #b00000000000000000000000000000000) (bvsge (index!46358 lt!624732) (size!47230 a!2901)) (not (= lt!624729 (Intermediate!10991 false (index!46358 lt!624729) (x!127958 lt!624729)))) (not (= lt!624732 (Intermediate!10991 false (index!46358 lt!624732) (x!127958 lt!624732))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624730 () SeekEntryResult!10991)

(declare-fun lt!624725 () array!96698)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96698 (_ BitVec 32)) SeekEntryResult!10991)

(assert (=> b!1416171 (= lt!624730 (seekKeyOrZeroReturnVacant!0 (x!127958 lt!624732) (index!46358 lt!624732) (index!46358 lt!624732) (select (arr!46680 a!2901) j!112) lt!624725 mask!2840))))

(declare-fun lt!624727 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96698 (_ BitVec 32)) SeekEntryResult!10991)

(assert (=> b!1416171 (= lt!624730 (seekEntryOrOpen!0 lt!624727 lt!624725 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416171 (and (not (undefined!11803 lt!624732)) (= (index!46358 lt!624732) i!1037) (bvslt (x!127958 lt!624732) (x!127958 lt!624729)) (= (select (store (arr!46680 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46358 lt!624732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47956 0))(
  ( (Unit!47957) )
))
(declare-fun lt!624724 () Unit!47956)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47956)

(assert (=> b!1416171 (= lt!624724 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624728 (x!127958 lt!624729) (index!46358 lt!624729) (x!127958 lt!624732) (index!46358 lt!624732) (undefined!11803 lt!624732) mask!2840))))

(declare-fun b!1416172 () Bool)

(declare-fun res!952213 () Bool)

(declare-fun e!801527 () Bool)

(assert (=> b!1416172 (=> (not res!952213) (not e!801527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416172 (= res!952213 (validKeyInArray!0 (select (arr!46680 a!2901) i!1037)))))

(declare-fun b!1416173 () Bool)

(declare-fun e!801526 () Bool)

(assert (=> b!1416173 (= e!801526 e!801524)))

(declare-fun res!952216 () Bool)

(assert (=> b!1416173 (=> res!952216 e!801524)))

(get-info :version)

(assert (=> b!1416173 (= res!952216 (or (= lt!624729 lt!624732) (not ((_ is Intermediate!10991) lt!624732))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96698 (_ BitVec 32)) SeekEntryResult!10991)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416173 (= lt!624732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624727 mask!2840) lt!624727 lt!624725 mask!2840))))

(assert (=> b!1416173 (= lt!624727 (select (store (arr!46680 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416173 (= lt!624725 (array!96699 (store (arr!46680 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47230 a!2901)))))

(declare-fun res!952220 () Bool)

(assert (=> start!122012 (=> (not res!952220) (not e!801527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122012 (= res!952220 (validMask!0 mask!2840))))

(assert (=> start!122012 e!801527))

(assert (=> start!122012 true))

(declare-fun array_inv!35708 (array!96698) Bool)

(assert (=> start!122012 (array_inv!35708 a!2901)))

(declare-fun b!1416174 () Bool)

(declare-fun res!952214 () Bool)

(assert (=> b!1416174 (=> (not res!952214) (not e!801527))))

(declare-datatypes ((List!33199 0))(
  ( (Nil!33196) (Cons!33195 (h!34482 (_ BitVec 64)) (t!47893 List!33199)) )
))
(declare-fun arrayNoDuplicates!0 (array!96698 (_ BitVec 32) List!33199) Bool)

(assert (=> b!1416174 (= res!952214 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33196))))

(declare-fun b!1416175 () Bool)

(assert (=> b!1416175 (= e!801527 (not e!801526))))

(declare-fun res!952219 () Bool)

(assert (=> b!1416175 (=> res!952219 e!801526)))

(assert (=> b!1416175 (= res!952219 (or (not ((_ is Intermediate!10991) lt!624729)) (undefined!11803 lt!624729)))))

(declare-fun lt!624723 () SeekEntryResult!10991)

(assert (=> b!1416175 (= lt!624723 (Found!10991 j!112))))

(assert (=> b!1416175 (= lt!624723 (seekEntryOrOpen!0 (select (arr!46680 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96698 (_ BitVec 32)) Bool)

(assert (=> b!1416175 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624731 () Unit!47956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47956)

(assert (=> b!1416175 (= lt!624731 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416175 (= lt!624729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624728 (select (arr!46680 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416175 (= lt!624728 (toIndex!0 (select (arr!46680 a!2901) j!112) mask!2840))))

(declare-fun b!1416176 () Bool)

(declare-fun res!952222 () Bool)

(assert (=> b!1416176 (=> (not res!952222) (not e!801527))))

(assert (=> b!1416176 (= res!952222 (validKeyInArray!0 (select (arr!46680 a!2901) j!112)))))

(declare-fun b!1416177 () Bool)

(declare-fun res!952217 () Bool)

(assert (=> b!1416177 (=> (not res!952217) (not e!801527))))

(assert (=> b!1416177 (= res!952217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416178 () Bool)

(declare-fun res!952221 () Bool)

(assert (=> b!1416178 (=> res!952221 e!801525)))

(assert (=> b!1416178 (= res!952221 (not (= lt!624732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624728 lt!624727 lt!624725 mask!2840))))))

(declare-fun b!1416179 () Bool)

(declare-fun res!952218 () Bool)

(assert (=> b!1416179 (=> (not res!952218) (not e!801527))))

(assert (=> b!1416179 (= res!952218 (and (= (size!47230 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47230 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47230 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416180 () Bool)

(assert (=> b!1416180 (= e!801525 true)))

(assert (=> b!1416180 (= lt!624723 lt!624730)))

(declare-fun lt!624726 () Unit!47956)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47956)

(assert (=> b!1416180 (= lt!624726 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624728 (x!127958 lt!624729) (index!46358 lt!624729) (x!127958 lt!624732) (index!46358 lt!624732) mask!2840))))

(assert (= (and start!122012 res!952220) b!1416179))

(assert (= (and b!1416179 res!952218) b!1416172))

(assert (= (and b!1416172 res!952213) b!1416176))

(assert (= (and b!1416176 res!952222) b!1416177))

(assert (= (and b!1416177 res!952217) b!1416174))

(assert (= (and b!1416174 res!952214) b!1416175))

(assert (= (and b!1416175 (not res!952219)) b!1416173))

(assert (= (and b!1416173 (not res!952216)) b!1416171))

(assert (= (and b!1416171 (not res!952215)) b!1416178))

(assert (= (and b!1416178 (not res!952221)) b!1416180))

(declare-fun m!1306753 () Bool)

(assert (=> start!122012 m!1306753))

(declare-fun m!1306755 () Bool)

(assert (=> start!122012 m!1306755))

(declare-fun m!1306757 () Bool)

(assert (=> b!1416176 m!1306757))

(assert (=> b!1416176 m!1306757))

(declare-fun m!1306759 () Bool)

(assert (=> b!1416176 m!1306759))

(declare-fun m!1306761 () Bool)

(assert (=> b!1416180 m!1306761))

(declare-fun m!1306763 () Bool)

(assert (=> b!1416173 m!1306763))

(assert (=> b!1416173 m!1306763))

(declare-fun m!1306765 () Bool)

(assert (=> b!1416173 m!1306765))

(declare-fun m!1306767 () Bool)

(assert (=> b!1416173 m!1306767))

(declare-fun m!1306769 () Bool)

(assert (=> b!1416173 m!1306769))

(declare-fun m!1306771 () Bool)

(assert (=> b!1416172 m!1306771))

(assert (=> b!1416172 m!1306771))

(declare-fun m!1306773 () Bool)

(assert (=> b!1416172 m!1306773))

(declare-fun m!1306775 () Bool)

(assert (=> b!1416177 m!1306775))

(declare-fun m!1306777 () Bool)

(assert (=> b!1416174 m!1306777))

(declare-fun m!1306779 () Bool)

(assert (=> b!1416178 m!1306779))

(assert (=> b!1416175 m!1306757))

(declare-fun m!1306781 () Bool)

(assert (=> b!1416175 m!1306781))

(assert (=> b!1416175 m!1306757))

(assert (=> b!1416175 m!1306757))

(declare-fun m!1306783 () Bool)

(assert (=> b!1416175 m!1306783))

(declare-fun m!1306785 () Bool)

(assert (=> b!1416175 m!1306785))

(assert (=> b!1416175 m!1306757))

(declare-fun m!1306787 () Bool)

(assert (=> b!1416175 m!1306787))

(declare-fun m!1306789 () Bool)

(assert (=> b!1416175 m!1306789))

(assert (=> b!1416171 m!1306757))

(declare-fun m!1306791 () Bool)

(assert (=> b!1416171 m!1306791))

(assert (=> b!1416171 m!1306757))

(declare-fun m!1306793 () Bool)

(assert (=> b!1416171 m!1306793))

(declare-fun m!1306795 () Bool)

(assert (=> b!1416171 m!1306795))

(declare-fun m!1306797 () Bool)

(assert (=> b!1416171 m!1306797))

(assert (=> b!1416171 m!1306767))

(check-sat (not b!1416178) (not b!1416180) (not start!122012) (not b!1416175) (not b!1416177) (not b!1416173) (not b!1416174) (not b!1416176) (not b!1416172) (not b!1416171))
(check-sat)
