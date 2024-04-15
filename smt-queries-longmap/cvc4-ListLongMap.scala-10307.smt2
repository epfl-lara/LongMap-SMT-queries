; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121162 () Bool)

(assert start!121162)

(declare-fun b!1408757 () Bool)

(declare-fun e!797256 () Bool)

(assert (=> b!1408757 (= e!797256 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96269 0))(
  ( (array!96270 (arr!46478 (Array (_ BitVec 32) (_ BitVec 64))) (size!47030 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96269)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10815 0))(
  ( (MissingZero!10815 (index!45637 (_ BitVec 32))) (Found!10815 (index!45638 (_ BitVec 32))) (Intermediate!10815 (undefined!11627 Bool) (index!45639 (_ BitVec 32)) (x!127229 (_ BitVec 32))) (Undefined!10815) (MissingVacant!10815 (index!45640 (_ BitVec 32))) )
))
(declare-fun lt!620308 () SeekEntryResult!10815)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96269 (_ BitVec 32)) SeekEntryResult!10815)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408757 (= lt!620308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46478 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46478 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96270 (store (arr!46478 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47030 a!2901)) mask!2840))))

(declare-fun b!1408758 () Bool)

(declare-fun e!797255 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96269 (_ BitVec 32)) SeekEntryResult!10815)

(assert (=> b!1408758 (= e!797255 (= (seekEntryOrOpen!0 (select (arr!46478 a!2901) j!112) a!2901 mask!2840) (Found!10815 j!112)))))

(declare-fun res!946533 () Bool)

(declare-fun e!797258 () Bool)

(assert (=> start!121162 (=> (not res!946533) (not e!797258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121162 (= res!946533 (validMask!0 mask!2840))))

(assert (=> start!121162 e!797258))

(assert (=> start!121162 true))

(declare-fun array_inv!35711 (array!96269) Bool)

(assert (=> start!121162 (array_inv!35711 a!2901)))

(declare-fun b!1408759 () Bool)

(declare-fun res!946534 () Bool)

(assert (=> b!1408759 (=> (not res!946534) (not e!797258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408759 (= res!946534 (validKeyInArray!0 (select (arr!46478 a!2901) i!1037)))))

(declare-fun b!1408760 () Bool)

(declare-fun res!946530 () Bool)

(assert (=> b!1408760 (=> (not res!946530) (not e!797258))))

(assert (=> b!1408760 (= res!946530 (validKeyInArray!0 (select (arr!46478 a!2901) j!112)))))

(declare-fun b!1408761 () Bool)

(declare-fun res!946537 () Bool)

(assert (=> b!1408761 (=> (not res!946537) (not e!797258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96269 (_ BitVec 32)) Bool)

(assert (=> b!1408761 (= res!946537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408762 () Bool)

(declare-fun res!946535 () Bool)

(assert (=> b!1408762 (=> (not res!946535) (not e!797258))))

(declare-datatypes ((List!33075 0))(
  ( (Nil!33072) (Cons!33071 (h!34334 (_ BitVec 64)) (t!47761 List!33075)) )
))
(declare-fun arrayNoDuplicates!0 (array!96269 (_ BitVec 32) List!33075) Bool)

(assert (=> b!1408762 (= res!946535 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33072))))

(declare-fun b!1408763 () Bool)

(declare-fun res!946531 () Bool)

(assert (=> b!1408763 (=> (not res!946531) (not e!797258))))

(assert (=> b!1408763 (= res!946531 (and (= (size!47030 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47030 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47030 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408764 () Bool)

(assert (=> b!1408764 (= e!797258 (not e!797256))))

(declare-fun res!946536 () Bool)

(assert (=> b!1408764 (=> res!946536 e!797256)))

(declare-fun lt!620309 () SeekEntryResult!10815)

(assert (=> b!1408764 (= res!946536 (or (not (is-Intermediate!10815 lt!620309)) (undefined!11627 lt!620309)))))

(assert (=> b!1408764 e!797255))

(declare-fun res!946532 () Bool)

(assert (=> b!1408764 (=> (not res!946532) (not e!797255))))

(assert (=> b!1408764 (= res!946532 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47447 0))(
  ( (Unit!47448) )
))
(declare-fun lt!620307 () Unit!47447)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47447)

(assert (=> b!1408764 (= lt!620307 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408764 (= lt!620309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46478 a!2901) j!112) mask!2840) (select (arr!46478 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121162 res!946533) b!1408763))

(assert (= (and b!1408763 res!946531) b!1408759))

(assert (= (and b!1408759 res!946534) b!1408760))

(assert (= (and b!1408760 res!946530) b!1408761))

(assert (= (and b!1408761 res!946537) b!1408762))

(assert (= (and b!1408762 res!946535) b!1408764))

(assert (= (and b!1408764 res!946532) b!1408758))

(assert (= (and b!1408764 (not res!946536)) b!1408757))

(declare-fun m!1297769 () Bool)

(assert (=> b!1408759 m!1297769))

(assert (=> b!1408759 m!1297769))

(declare-fun m!1297771 () Bool)

(assert (=> b!1408759 m!1297771))

(declare-fun m!1297773 () Bool)

(assert (=> b!1408762 m!1297773))

(declare-fun m!1297775 () Bool)

(assert (=> b!1408761 m!1297775))

(declare-fun m!1297777 () Bool)

(assert (=> b!1408764 m!1297777))

(declare-fun m!1297779 () Bool)

(assert (=> b!1408764 m!1297779))

(assert (=> b!1408764 m!1297777))

(declare-fun m!1297781 () Bool)

(assert (=> b!1408764 m!1297781))

(assert (=> b!1408764 m!1297779))

(assert (=> b!1408764 m!1297777))

(declare-fun m!1297783 () Bool)

(assert (=> b!1408764 m!1297783))

(declare-fun m!1297785 () Bool)

(assert (=> b!1408764 m!1297785))

(assert (=> b!1408758 m!1297777))

(assert (=> b!1408758 m!1297777))

(declare-fun m!1297787 () Bool)

(assert (=> b!1408758 m!1297787))

(assert (=> b!1408760 m!1297777))

(assert (=> b!1408760 m!1297777))

(declare-fun m!1297789 () Bool)

(assert (=> b!1408760 m!1297789))

(declare-fun m!1297791 () Bool)

(assert (=> start!121162 m!1297791))

(declare-fun m!1297793 () Bool)

(assert (=> start!121162 m!1297793))

(declare-fun m!1297795 () Bool)

(assert (=> b!1408757 m!1297795))

(declare-fun m!1297797 () Bool)

(assert (=> b!1408757 m!1297797))

(assert (=> b!1408757 m!1297797))

(declare-fun m!1297799 () Bool)

(assert (=> b!1408757 m!1297799))

(assert (=> b!1408757 m!1297799))

(assert (=> b!1408757 m!1297797))

(declare-fun m!1297801 () Bool)

(assert (=> b!1408757 m!1297801))

(push 1)

(assert (not b!1408761))

(assert (not b!1408760))

(assert (not start!121162))

(assert (not b!1408757))

(assert (not b!1408759))

(assert (not b!1408764))

(assert (not b!1408762))

(assert (not b!1408758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

