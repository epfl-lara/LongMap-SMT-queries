; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121504 () Bool)

(assert start!121504)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96505 0))(
  ( (array!96506 (arr!46591 (Array (_ BitVec 32) (_ BitVec 64))) (size!47141 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96505)

(declare-fun e!798953 () Bool)

(declare-fun b!1411849 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10902 0))(
  ( (MissingZero!10902 (index!45985 (_ BitVec 32))) (Found!10902 (index!45986 (_ BitVec 32))) (Intermediate!10902 (undefined!11714 Bool) (index!45987 (_ BitVec 32)) (x!127569 (_ BitVec 32))) (Undefined!10902) (MissingVacant!10902 (index!45988 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96505 (_ BitVec 32)) SeekEntryResult!10902)

(assert (=> b!1411849 (= e!798953 (= (seekEntryOrOpen!0 (select (arr!46591 a!2901) j!112) a!2901 mask!2840) (Found!10902 j!112)))))

(declare-fun b!1411850 () Bool)

(declare-fun res!949079 () Bool)

(declare-fun e!798954 () Bool)

(assert (=> b!1411850 (=> (not res!949079) (not e!798954))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411850 (= res!949079 (validKeyInArray!0 (select (arr!46591 a!2901) i!1037)))))

(declare-fun b!1411851 () Bool)

(declare-fun e!798956 () Bool)

(assert (=> b!1411851 (= e!798956 true)))

(declare-fun lt!621988 () SeekEntryResult!10902)

(declare-fun lt!621989 () SeekEntryResult!10902)

(assert (=> b!1411851 (and (not (undefined!11714 lt!621989)) (= (index!45987 lt!621989) i!1037) (bvslt (x!127569 lt!621989) (x!127569 lt!621988)) (= (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45987 lt!621989)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47778 0))(
  ( (Unit!47779) )
))
(declare-fun lt!621993 () Unit!47778)

(declare-fun lt!621992 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47778)

(assert (=> b!1411851 (= lt!621993 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621992 (x!127569 lt!621988) (index!45987 lt!621988) (x!127569 lt!621989) (index!45987 lt!621989) (undefined!11714 lt!621989) mask!2840))))

(declare-fun res!949083 () Bool)

(assert (=> start!121504 (=> (not res!949083) (not e!798954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121504 (= res!949083 (validMask!0 mask!2840))))

(assert (=> start!121504 e!798954))

(assert (=> start!121504 true))

(declare-fun array_inv!35619 (array!96505) Bool)

(assert (=> start!121504 (array_inv!35619 a!2901)))

(declare-fun b!1411852 () Bool)

(declare-fun res!949084 () Bool)

(assert (=> b!1411852 (=> (not res!949084) (not e!798954))))

(assert (=> b!1411852 (= res!949084 (and (= (size!47141 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47141 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47141 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411853 () Bool)

(declare-fun res!949078 () Bool)

(assert (=> b!1411853 (=> (not res!949078) (not e!798954))))

(assert (=> b!1411853 (= res!949078 (validKeyInArray!0 (select (arr!46591 a!2901) j!112)))))

(declare-fun b!1411854 () Bool)

(declare-fun e!798952 () Bool)

(assert (=> b!1411854 (= e!798954 (not e!798952))))

(declare-fun res!949081 () Bool)

(assert (=> b!1411854 (=> res!949081 e!798952)))

(assert (=> b!1411854 (= res!949081 (or (not (is-Intermediate!10902 lt!621988)) (undefined!11714 lt!621988)))))

(assert (=> b!1411854 e!798953))

(declare-fun res!949080 () Bool)

(assert (=> b!1411854 (=> (not res!949080) (not e!798953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96505 (_ BitVec 32)) Bool)

(assert (=> b!1411854 (= res!949080 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621990 () Unit!47778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47778)

(assert (=> b!1411854 (= lt!621990 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96505 (_ BitVec 32)) SeekEntryResult!10902)

(assert (=> b!1411854 (= lt!621988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621992 (select (arr!46591 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411854 (= lt!621992 (toIndex!0 (select (arr!46591 a!2901) j!112) mask!2840))))

(declare-fun b!1411855 () Bool)

(assert (=> b!1411855 (= e!798952 e!798956)))

(declare-fun res!949082 () Bool)

(assert (=> b!1411855 (=> res!949082 e!798956)))

(assert (=> b!1411855 (= res!949082 (or (= lt!621988 lt!621989) (not (is-Intermediate!10902 lt!621989))))))

(declare-fun lt!621991 () (_ BitVec 64))

(assert (=> b!1411855 (= lt!621989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621991 mask!2840) lt!621991 (array!96506 (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47141 a!2901)) mask!2840))))

(assert (=> b!1411855 (= lt!621991 (select (store (arr!46591 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411856 () Bool)

(declare-fun res!949076 () Bool)

(assert (=> b!1411856 (=> (not res!949076) (not e!798954))))

(assert (=> b!1411856 (= res!949076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411857 () Bool)

(declare-fun res!949077 () Bool)

(assert (=> b!1411857 (=> (not res!949077) (not e!798954))))

(declare-datatypes ((List!33110 0))(
  ( (Nil!33107) (Cons!33106 (h!34378 (_ BitVec 64)) (t!47804 List!33110)) )
))
(declare-fun arrayNoDuplicates!0 (array!96505 (_ BitVec 32) List!33110) Bool)

(assert (=> b!1411857 (= res!949077 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33107))))

(assert (= (and start!121504 res!949083) b!1411852))

(assert (= (and b!1411852 res!949084) b!1411850))

(assert (= (and b!1411850 res!949079) b!1411853))

(assert (= (and b!1411853 res!949078) b!1411856))

(assert (= (and b!1411856 res!949076) b!1411857))

(assert (= (and b!1411857 res!949077) b!1411854))

(assert (= (and b!1411854 res!949080) b!1411849))

(assert (= (and b!1411854 (not res!949081)) b!1411855))

(assert (= (and b!1411855 (not res!949082)) b!1411851))

(declare-fun m!1301863 () Bool)

(assert (=> start!121504 m!1301863))

(declare-fun m!1301865 () Bool)

(assert (=> start!121504 m!1301865))

(declare-fun m!1301867 () Bool)

(assert (=> b!1411856 m!1301867))

(declare-fun m!1301869 () Bool)

(assert (=> b!1411854 m!1301869))

(declare-fun m!1301871 () Bool)

(assert (=> b!1411854 m!1301871))

(assert (=> b!1411854 m!1301869))

(assert (=> b!1411854 m!1301869))

(declare-fun m!1301873 () Bool)

(assert (=> b!1411854 m!1301873))

(declare-fun m!1301875 () Bool)

(assert (=> b!1411854 m!1301875))

(declare-fun m!1301877 () Bool)

(assert (=> b!1411854 m!1301877))

(declare-fun m!1301879 () Bool)

(assert (=> b!1411851 m!1301879))

(declare-fun m!1301881 () Bool)

(assert (=> b!1411851 m!1301881))

(declare-fun m!1301883 () Bool)

(assert (=> b!1411851 m!1301883))

(declare-fun m!1301885 () Bool)

(assert (=> b!1411857 m!1301885))

(declare-fun m!1301887 () Bool)

(assert (=> b!1411850 m!1301887))

(assert (=> b!1411850 m!1301887))

(declare-fun m!1301889 () Bool)

(assert (=> b!1411850 m!1301889))

(assert (=> b!1411849 m!1301869))

(assert (=> b!1411849 m!1301869))

(declare-fun m!1301891 () Bool)

(assert (=> b!1411849 m!1301891))

(declare-fun m!1301893 () Bool)

(assert (=> b!1411855 m!1301893))

(assert (=> b!1411855 m!1301879))

(assert (=> b!1411855 m!1301893))

(declare-fun m!1301895 () Bool)

(assert (=> b!1411855 m!1301895))

(declare-fun m!1301897 () Bool)

(assert (=> b!1411855 m!1301897))

(assert (=> b!1411853 m!1301869))

(assert (=> b!1411853 m!1301869))

(declare-fun m!1301899 () Bool)

(assert (=> b!1411853 m!1301899))

(push 1)

