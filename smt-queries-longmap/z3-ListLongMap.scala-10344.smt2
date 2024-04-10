; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121616 () Bool)

(assert start!121616)

(declare-fun b!1412856 () Bool)

(declare-fun res!949852 () Bool)

(declare-fun e!799556 () Bool)

(assert (=> b!1412856 (=> (not res!949852) (not e!799556))))

(declare-datatypes ((array!96554 0))(
  ( (array!96555 (arr!46614 (Array (_ BitVec 32) (_ BitVec 64))) (size!47164 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96554)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412856 (= res!949852 (validKeyInArray!0 (select (arr!46614 a!2901) i!1037)))))

(declare-fun b!1412857 () Bool)

(declare-fun e!799554 () Bool)

(assert (=> b!1412857 (= e!799556 (not e!799554))))

(declare-fun res!949848 () Bool)

(assert (=> b!1412857 (=> res!949848 e!799554)))

(declare-datatypes ((SeekEntryResult!10925 0))(
  ( (MissingZero!10925 (index!46080 (_ BitVec 32))) (Found!10925 (index!46081 (_ BitVec 32))) (Intermediate!10925 (undefined!11737 Bool) (index!46082 (_ BitVec 32)) (x!127668 (_ BitVec 32))) (Undefined!10925) (MissingVacant!10925 (index!46083 (_ BitVec 32))) )
))
(declare-fun lt!622629 () SeekEntryResult!10925)

(get-info :version)

(assert (=> b!1412857 (= res!949848 (or (not ((_ is Intermediate!10925) lt!622629)) (undefined!11737 lt!622629)))))

(declare-fun e!799555 () Bool)

(assert (=> b!1412857 e!799555))

(declare-fun res!949851 () Bool)

(assert (=> b!1412857 (=> (not res!949851) (not e!799555))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96554 (_ BitVec 32)) Bool)

(assert (=> b!1412857 (= res!949851 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47824 0))(
  ( (Unit!47825) )
))
(declare-fun lt!622626 () Unit!47824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47824)

(assert (=> b!1412857 (= lt!622626 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622630 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96554 (_ BitVec 32)) SeekEntryResult!10925)

(assert (=> b!1412857 (= lt!622629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622630 (select (arr!46614 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412857 (= lt!622630 (toIndex!0 (select (arr!46614 a!2901) j!112) mask!2840))))

(declare-fun b!1412858 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96554 (_ BitVec 32)) SeekEntryResult!10925)

(assert (=> b!1412858 (= e!799555 (= (seekEntryOrOpen!0 (select (arr!46614 a!2901) j!112) a!2901 mask!2840) (Found!10925 j!112)))))

(declare-fun b!1412859 () Bool)

(declare-fun e!799553 () Bool)

(assert (=> b!1412859 (= e!799554 e!799553)))

(declare-fun res!949846 () Bool)

(assert (=> b!1412859 (=> res!949846 e!799553)))

(declare-fun lt!622631 () SeekEntryResult!10925)

(assert (=> b!1412859 (= res!949846 (or (= lt!622629 lt!622631) (not ((_ is Intermediate!10925) lt!622631))))))

(declare-fun lt!622632 () (_ BitVec 64))

(declare-fun lt!622628 () array!96554)

(assert (=> b!1412859 (= lt!622631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622632 mask!2840) lt!622632 lt!622628 mask!2840))))

(assert (=> b!1412859 (= lt!622632 (select (store (arr!46614 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412859 (= lt!622628 (array!96555 (store (arr!46614 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47164 a!2901)))))

(declare-fun b!1412860 () Bool)

(declare-fun res!949854 () Bool)

(assert (=> b!1412860 (=> (not res!949854) (not e!799556))))

(assert (=> b!1412860 (= res!949854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412861 () Bool)

(declare-fun res!949850 () Bool)

(assert (=> b!1412861 (=> (not res!949850) (not e!799556))))

(assert (=> b!1412861 (= res!949850 (and (= (size!47164 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47164 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47164 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412862 () Bool)

(declare-fun e!799551 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96554 (_ BitVec 32)) SeekEntryResult!10925)

(assert (=> b!1412862 (= e!799551 (= (seekEntryOrOpen!0 lt!622632 lt!622628 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127668 lt!622631) (index!46082 lt!622631) (index!46082 lt!622631) (select (arr!46614 a!2901) j!112) lt!622628 mask!2840)))))

(declare-fun b!1412864 () Bool)

(declare-fun res!949853 () Bool)

(assert (=> b!1412864 (=> (not res!949853) (not e!799556))))

(declare-datatypes ((List!33133 0))(
  ( (Nil!33130) (Cons!33129 (h!34404 (_ BitVec 64)) (t!47827 List!33133)) )
))
(declare-fun arrayNoDuplicates!0 (array!96554 (_ BitVec 32) List!33133) Bool)

(assert (=> b!1412864 (= res!949853 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33130))))

(declare-fun b!1412865 () Bool)

(declare-fun res!949847 () Bool)

(assert (=> b!1412865 (=> (not res!949847) (not e!799556))))

(assert (=> b!1412865 (= res!949847 (validKeyInArray!0 (select (arr!46614 a!2901) j!112)))))

(declare-fun b!1412863 () Bool)

(assert (=> b!1412863 (= e!799553 true)))

(assert (=> b!1412863 e!799551))

(declare-fun res!949849 () Bool)

(assert (=> b!1412863 (=> (not res!949849) (not e!799551))))

(assert (=> b!1412863 (= res!949849 (and (not (undefined!11737 lt!622631)) (= (index!46082 lt!622631) i!1037) (bvslt (x!127668 lt!622631) (x!127668 lt!622629)) (= (select (store (arr!46614 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46082 lt!622631)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622627 () Unit!47824)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47824)

(assert (=> b!1412863 (= lt!622627 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622630 (x!127668 lt!622629) (index!46082 lt!622629) (x!127668 lt!622631) (index!46082 lt!622631) (undefined!11737 lt!622631) mask!2840))))

(declare-fun res!949855 () Bool)

(assert (=> start!121616 (=> (not res!949855) (not e!799556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121616 (= res!949855 (validMask!0 mask!2840))))

(assert (=> start!121616 e!799556))

(assert (=> start!121616 true))

(declare-fun array_inv!35642 (array!96554) Bool)

(assert (=> start!121616 (array_inv!35642 a!2901)))

(assert (= (and start!121616 res!949855) b!1412861))

(assert (= (and b!1412861 res!949850) b!1412856))

(assert (= (and b!1412856 res!949852) b!1412865))

(assert (= (and b!1412865 res!949847) b!1412860))

(assert (= (and b!1412860 res!949854) b!1412864))

(assert (= (and b!1412864 res!949853) b!1412857))

(assert (= (and b!1412857 res!949851) b!1412858))

(assert (= (and b!1412857 (not res!949848)) b!1412859))

(assert (= (and b!1412859 (not res!949846)) b!1412863))

(assert (= (and b!1412863 res!949849) b!1412862))

(declare-fun m!1303047 () Bool)

(assert (=> start!121616 m!1303047))

(declare-fun m!1303049 () Bool)

(assert (=> start!121616 m!1303049))

(declare-fun m!1303051 () Bool)

(assert (=> b!1412858 m!1303051))

(assert (=> b!1412858 m!1303051))

(declare-fun m!1303053 () Bool)

(assert (=> b!1412858 m!1303053))

(declare-fun m!1303055 () Bool)

(assert (=> b!1412860 m!1303055))

(declare-fun m!1303057 () Bool)

(assert (=> b!1412863 m!1303057))

(declare-fun m!1303059 () Bool)

(assert (=> b!1412863 m!1303059))

(declare-fun m!1303061 () Bool)

(assert (=> b!1412863 m!1303061))

(assert (=> b!1412857 m!1303051))

(declare-fun m!1303063 () Bool)

(assert (=> b!1412857 m!1303063))

(assert (=> b!1412857 m!1303051))

(declare-fun m!1303065 () Bool)

(assert (=> b!1412857 m!1303065))

(declare-fun m!1303067 () Bool)

(assert (=> b!1412857 m!1303067))

(assert (=> b!1412857 m!1303051))

(declare-fun m!1303069 () Bool)

(assert (=> b!1412857 m!1303069))

(declare-fun m!1303071 () Bool)

(assert (=> b!1412862 m!1303071))

(assert (=> b!1412862 m!1303051))

(assert (=> b!1412862 m!1303051))

(declare-fun m!1303073 () Bool)

(assert (=> b!1412862 m!1303073))

(assert (=> b!1412865 m!1303051))

(assert (=> b!1412865 m!1303051))

(declare-fun m!1303075 () Bool)

(assert (=> b!1412865 m!1303075))

(declare-fun m!1303077 () Bool)

(assert (=> b!1412859 m!1303077))

(assert (=> b!1412859 m!1303077))

(declare-fun m!1303079 () Bool)

(assert (=> b!1412859 m!1303079))

(assert (=> b!1412859 m!1303057))

(declare-fun m!1303081 () Bool)

(assert (=> b!1412859 m!1303081))

(declare-fun m!1303083 () Bool)

(assert (=> b!1412864 m!1303083))

(declare-fun m!1303085 () Bool)

(assert (=> b!1412856 m!1303085))

(assert (=> b!1412856 m!1303085))

(declare-fun m!1303087 () Bool)

(assert (=> b!1412856 m!1303087))

(check-sat (not b!1412863) (not b!1412857) (not b!1412856) (not b!1412865) (not b!1412858) (not b!1412862) (not b!1412859) (not b!1412860) (not start!121616) (not b!1412864))
(check-sat)
