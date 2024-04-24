; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121820 () Bool)

(assert start!121820)

(declare-fun b!1414236 () Bool)

(declare-fun res!950545 () Bool)

(declare-fun e!800434 () Bool)

(assert (=> b!1414236 (=> (not res!950545) (not e!800434))))

(declare-datatypes ((array!96680 0))(
  ( (array!96681 (arr!46675 (Array (_ BitVec 32) (_ BitVec 64))) (size!47226 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96680)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414236 (= res!950545 (validKeyInArray!0 (select (arr!46675 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!800433 () Bool)

(declare-fun b!1414237 () Bool)

(declare-datatypes ((SeekEntryResult!10889 0))(
  ( (MissingZero!10889 (index!45936 (_ BitVec 32))) (Found!10889 (index!45937 (_ BitVec 32))) (Intermediate!10889 (undefined!11701 Bool) (index!45938 (_ BitVec 32)) (x!127675 (_ BitVec 32))) (Undefined!10889) (MissingVacant!10889 (index!45939 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96680 (_ BitVec 32)) SeekEntryResult!10889)

(assert (=> b!1414237 (= e!800433 (= (seekEntryOrOpen!0 (select (arr!46675 a!2901) j!112) a!2901 mask!2840) (Found!10889 j!112)))))

(declare-fun b!1414238 () Bool)

(declare-fun res!950549 () Bool)

(assert (=> b!1414238 (=> (not res!950549) (not e!800434))))

(declare-datatypes ((List!33181 0))(
  ( (Nil!33178) (Cons!33177 (h!34460 (_ BitVec 64)) (t!47867 List!33181)) )
))
(declare-fun arrayNoDuplicates!0 (array!96680 (_ BitVec 32) List!33181) Bool)

(assert (=> b!1414238 (= res!950549 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33178))))

(declare-fun b!1414240 () Bool)

(declare-fun res!950551 () Bool)

(assert (=> b!1414240 (=> (not res!950551) (not e!800434))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1414240 (= res!950551 (validKeyInArray!0 (select (arr!46675 a!2901) i!1037)))))

(declare-fun b!1414241 () Bool)

(declare-fun e!800437 () Bool)

(assert (=> b!1414241 (= e!800437 true)))

(declare-fun e!800438 () Bool)

(assert (=> b!1414241 e!800438))

(declare-fun res!950542 () Bool)

(assert (=> b!1414241 (=> (not res!950542) (not e!800438))))

(declare-fun lt!623196 () SeekEntryResult!10889)

(declare-fun lt!623193 () SeekEntryResult!10889)

(assert (=> b!1414241 (= res!950542 (and (not (undefined!11701 lt!623193)) (= (index!45938 lt!623193) i!1037) (bvslt (x!127675 lt!623193) (x!127675 lt!623196)) (= (select (store (arr!46675 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45938 lt!623193)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47779 0))(
  ( (Unit!47780) )
))
(declare-fun lt!623198 () Unit!47779)

(declare-fun lt!623195 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47779)

(assert (=> b!1414241 (= lt!623198 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623195 (x!127675 lt!623196) (index!45938 lt!623196) (x!127675 lt!623193) (index!45938 lt!623193) (undefined!11701 lt!623193) mask!2840))))

(declare-fun b!1414242 () Bool)

(declare-fun e!800436 () Bool)

(assert (=> b!1414242 (= e!800436 e!800437)))

(declare-fun res!950550 () Bool)

(assert (=> b!1414242 (=> res!950550 e!800437)))

(get-info :version)

(assert (=> b!1414242 (= res!950550 (or (= lt!623196 lt!623193) (not ((_ is Intermediate!10889) lt!623193))))))

(declare-fun lt!623194 () array!96680)

(declare-fun lt!623197 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96680 (_ BitVec 32)) SeekEntryResult!10889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414242 (= lt!623193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623197 mask!2840) lt!623197 lt!623194 mask!2840))))

(assert (=> b!1414242 (= lt!623197 (select (store (arr!46675 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414242 (= lt!623194 (array!96681 (store (arr!46675 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47226 a!2901)))))

(declare-fun b!1414243 () Bool)

(assert (=> b!1414243 (= e!800434 (not e!800436))))

(declare-fun res!950546 () Bool)

(assert (=> b!1414243 (=> res!950546 e!800436)))

(assert (=> b!1414243 (= res!950546 (or (not ((_ is Intermediate!10889) lt!623196)) (undefined!11701 lt!623196)))))

(assert (=> b!1414243 e!800433))

(declare-fun res!950548 () Bool)

(assert (=> b!1414243 (=> (not res!950548) (not e!800433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96680 (_ BitVec 32)) Bool)

(assert (=> b!1414243 (= res!950548 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623192 () Unit!47779)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47779)

(assert (=> b!1414243 (= lt!623192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1414243 (= lt!623196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623195 (select (arr!46675 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414243 (= lt!623195 (toIndex!0 (select (arr!46675 a!2901) j!112) mask!2840))))

(declare-fun b!1414244 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96680 (_ BitVec 32)) SeekEntryResult!10889)

(assert (=> b!1414244 (= e!800438 (= (seekEntryOrOpen!0 lt!623197 lt!623194 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127675 lt!623193) (index!45938 lt!623193) (index!45938 lt!623193) (select (arr!46675 a!2901) j!112) lt!623194 mask!2840)))))

(declare-fun b!1414245 () Bool)

(declare-fun res!950547 () Bool)

(assert (=> b!1414245 (=> (not res!950547) (not e!800434))))

(assert (=> b!1414245 (= res!950547 (and (= (size!47226 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47226 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47226 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!950544 () Bool)

(assert (=> start!121820 (=> (not res!950544) (not e!800434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121820 (= res!950544 (validMask!0 mask!2840))))

(assert (=> start!121820 e!800434))

(assert (=> start!121820 true))

(declare-fun array_inv!35956 (array!96680) Bool)

(assert (=> start!121820 (array_inv!35956 a!2901)))

(declare-fun b!1414239 () Bool)

(declare-fun res!950543 () Bool)

(assert (=> b!1414239 (=> (not res!950543) (not e!800434))))

(assert (=> b!1414239 (= res!950543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121820 res!950544) b!1414245))

(assert (= (and b!1414245 res!950547) b!1414240))

(assert (= (and b!1414240 res!950551) b!1414236))

(assert (= (and b!1414236 res!950545) b!1414239))

(assert (= (and b!1414239 res!950543) b!1414238))

(assert (= (and b!1414238 res!950549) b!1414243))

(assert (= (and b!1414243 res!950548) b!1414237))

(assert (= (and b!1414243 (not res!950546)) b!1414242))

(assert (= (and b!1414242 (not res!950550)) b!1414241))

(assert (= (and b!1414241 res!950542) b!1414244))

(declare-fun m!1304755 () Bool)

(assert (=> b!1414241 m!1304755))

(declare-fun m!1304757 () Bool)

(assert (=> b!1414241 m!1304757))

(declare-fun m!1304759 () Bool)

(assert (=> b!1414241 m!1304759))

(declare-fun m!1304761 () Bool)

(assert (=> b!1414242 m!1304761))

(assert (=> b!1414242 m!1304761))

(declare-fun m!1304763 () Bool)

(assert (=> b!1414242 m!1304763))

(assert (=> b!1414242 m!1304755))

(declare-fun m!1304765 () Bool)

(assert (=> b!1414242 m!1304765))

(declare-fun m!1304767 () Bool)

(assert (=> b!1414236 m!1304767))

(assert (=> b!1414236 m!1304767))

(declare-fun m!1304769 () Bool)

(assert (=> b!1414236 m!1304769))

(assert (=> b!1414237 m!1304767))

(assert (=> b!1414237 m!1304767))

(declare-fun m!1304771 () Bool)

(assert (=> b!1414237 m!1304771))

(declare-fun m!1304773 () Bool)

(assert (=> b!1414239 m!1304773))

(assert (=> b!1414243 m!1304767))

(declare-fun m!1304775 () Bool)

(assert (=> b!1414243 m!1304775))

(assert (=> b!1414243 m!1304767))

(assert (=> b!1414243 m!1304767))

(declare-fun m!1304777 () Bool)

(assert (=> b!1414243 m!1304777))

(declare-fun m!1304779 () Bool)

(assert (=> b!1414243 m!1304779))

(declare-fun m!1304781 () Bool)

(assert (=> b!1414243 m!1304781))

(declare-fun m!1304783 () Bool)

(assert (=> b!1414244 m!1304783))

(assert (=> b!1414244 m!1304767))

(assert (=> b!1414244 m!1304767))

(declare-fun m!1304785 () Bool)

(assert (=> b!1414244 m!1304785))

(declare-fun m!1304787 () Bool)

(assert (=> b!1414238 m!1304787))

(declare-fun m!1304789 () Bool)

(assert (=> b!1414240 m!1304789))

(assert (=> b!1414240 m!1304789))

(declare-fun m!1304791 () Bool)

(assert (=> b!1414240 m!1304791))

(declare-fun m!1304793 () Bool)

(assert (=> start!121820 m!1304793))

(declare-fun m!1304795 () Bool)

(assert (=> start!121820 m!1304795))

(check-sat (not b!1414239) (not b!1414240) (not b!1414237) (not b!1414242) (not b!1414238) (not b!1414241) (not b!1414236) (not b!1414244) (not b!1414243) (not start!121820))
(check-sat)
