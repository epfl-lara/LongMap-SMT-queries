; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121268 () Bool)

(assert start!121268)

(declare-fun b!1408894 () Bool)

(declare-fun res!945940 () Bool)

(declare-fun e!797517 () Bool)

(assert (=> b!1408894 (=> (not res!945940) (not e!797517))))

(declare-datatypes ((array!96344 0))(
  ( (array!96345 (arr!46513 (Array (_ BitVec 32) (_ BitVec 64))) (size!47064 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96344)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408894 (= res!945940 (validKeyInArray!0 (select (arr!46513 a!2901) j!112)))))

(declare-fun b!1408895 () Bool)

(declare-fun res!945939 () Bool)

(assert (=> b!1408895 (=> (not res!945939) (not e!797517))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408895 (= res!945939 (and (= (size!47064 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47064 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47064 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408896 () Bool)

(declare-fun res!945936 () Bool)

(assert (=> b!1408896 (=> (not res!945936) (not e!797517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96344 (_ BitVec 32)) Bool)

(assert (=> b!1408896 (= res!945936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!797516 () Bool)

(declare-fun b!1408897 () Bool)

(declare-datatypes ((SeekEntryResult!10727 0))(
  ( (MissingZero!10727 (index!45285 (_ BitVec 32))) (Found!10727 (index!45286 (_ BitVec 32))) (Intermediate!10727 (undefined!11539 Bool) (index!45287 (_ BitVec 32)) (x!127051 (_ BitVec 32))) (Undefined!10727) (MissingVacant!10727 (index!45288 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96344 (_ BitVec 32)) SeekEntryResult!10727)

(assert (=> b!1408897 (= e!797516 (= (seekEntryOrOpen!0 (select (arr!46513 a!2901) j!112) a!2901 mask!2840) (Found!10727 j!112)))))

(declare-fun b!1408898 () Bool)

(declare-fun res!945935 () Bool)

(assert (=> b!1408898 (=> (not res!945935) (not e!797517))))

(assert (=> b!1408898 (= res!945935 (validKeyInArray!0 (select (arr!46513 a!2901) i!1037)))))

(declare-fun res!945937 () Bool)

(assert (=> start!121268 (=> (not res!945937) (not e!797517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121268 (= res!945937 (validMask!0 mask!2840))))

(assert (=> start!121268 e!797517))

(assert (=> start!121268 true))

(declare-fun array_inv!35794 (array!96344) Bool)

(assert (=> start!121268 (array_inv!35794 a!2901)))

(declare-fun b!1408899 () Bool)

(declare-fun e!797518 () Bool)

(assert (=> b!1408899 (= e!797517 (not e!797518))))

(declare-fun res!945932 () Bool)

(assert (=> b!1408899 (=> res!945932 e!797518)))

(declare-fun lt!620329 () SeekEntryResult!10727)

(get-info :version)

(assert (=> b!1408899 (= res!945932 (or (not ((_ is Intermediate!10727) lt!620329)) (undefined!11539 lt!620329)))))

(assert (=> b!1408899 e!797516))

(declare-fun res!945938 () Bool)

(assert (=> b!1408899 (=> (not res!945938) (not e!797516))))

(assert (=> b!1408899 (= res!945938 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47455 0))(
  ( (Unit!47456) )
))
(declare-fun lt!620328 () Unit!47455)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47455)

(assert (=> b!1408899 (= lt!620328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!620330 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96344 (_ BitVec 32)) SeekEntryResult!10727)

(assert (=> b!1408899 (= lt!620329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620330 (select (arr!46513 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408899 (= lt!620330 (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840))))

(declare-fun b!1408900 () Bool)

(declare-fun res!945934 () Bool)

(assert (=> b!1408900 (=> res!945934 e!797518)))

(assert (=> b!1408900 (= res!945934 (not (= lt!620329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96345 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47064 a!2901)) mask!2840))))))

(declare-fun b!1408901 () Bool)

(assert (=> b!1408901 (= e!797518 (or (bvslt (x!127051 lt!620329) #b00000000000000000000000000000000) (bvsgt (x!127051 lt!620329) #b01111111111111111111111111111110) (bvslt lt!620330 #b00000000000000000000000000000000) (bvsge lt!620330 (size!47064 a!2901)) (bvslt (index!45287 lt!620329) #b00000000000000000000000000000000) (bvsge (index!45287 lt!620329) (size!47064 a!2901)) (= lt!620329 (Intermediate!10727 false (index!45287 lt!620329) (x!127051 lt!620329)))))))

(declare-fun b!1408902 () Bool)

(declare-fun res!945933 () Bool)

(assert (=> b!1408902 (=> (not res!945933) (not e!797517))))

(declare-datatypes ((List!33019 0))(
  ( (Nil!33016) (Cons!33015 (h!34286 (_ BitVec 64)) (t!47705 List!33019)) )
))
(declare-fun arrayNoDuplicates!0 (array!96344 (_ BitVec 32) List!33019) Bool)

(assert (=> b!1408902 (= res!945933 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33016))))

(assert (= (and start!121268 res!945937) b!1408895))

(assert (= (and b!1408895 res!945939) b!1408898))

(assert (= (and b!1408898 res!945935) b!1408894))

(assert (= (and b!1408894 res!945940) b!1408896))

(assert (= (and b!1408896 res!945936) b!1408902))

(assert (= (and b!1408902 res!945933) b!1408899))

(assert (= (and b!1408899 res!945938) b!1408897))

(assert (= (and b!1408899 (not res!945932)) b!1408900))

(assert (= (and b!1408900 (not res!945934)) b!1408901))

(declare-fun m!1298155 () Bool)

(assert (=> b!1408900 m!1298155))

(declare-fun m!1298157 () Bool)

(assert (=> b!1408900 m!1298157))

(assert (=> b!1408900 m!1298157))

(declare-fun m!1298159 () Bool)

(assert (=> b!1408900 m!1298159))

(assert (=> b!1408900 m!1298159))

(assert (=> b!1408900 m!1298157))

(declare-fun m!1298161 () Bool)

(assert (=> b!1408900 m!1298161))

(declare-fun m!1298163 () Bool)

(assert (=> b!1408896 m!1298163))

(declare-fun m!1298165 () Bool)

(assert (=> b!1408894 m!1298165))

(assert (=> b!1408894 m!1298165))

(declare-fun m!1298167 () Bool)

(assert (=> b!1408894 m!1298167))

(assert (=> b!1408899 m!1298165))

(declare-fun m!1298169 () Bool)

(assert (=> b!1408899 m!1298169))

(assert (=> b!1408899 m!1298165))

(assert (=> b!1408899 m!1298165))

(declare-fun m!1298171 () Bool)

(assert (=> b!1408899 m!1298171))

(declare-fun m!1298173 () Bool)

(assert (=> b!1408899 m!1298173))

(declare-fun m!1298175 () Bool)

(assert (=> b!1408899 m!1298175))

(declare-fun m!1298177 () Bool)

(assert (=> b!1408898 m!1298177))

(assert (=> b!1408898 m!1298177))

(declare-fun m!1298179 () Bool)

(assert (=> b!1408898 m!1298179))

(declare-fun m!1298181 () Bool)

(assert (=> start!121268 m!1298181))

(declare-fun m!1298183 () Bool)

(assert (=> start!121268 m!1298183))

(declare-fun m!1298185 () Bool)

(assert (=> b!1408902 m!1298185))

(assert (=> b!1408897 m!1298165))

(assert (=> b!1408897 m!1298165))

(declare-fun m!1298187 () Bool)

(assert (=> b!1408897 m!1298187))

(check-sat (not b!1408899) (not b!1408897) (not b!1408894) (not b!1408896) (not b!1408900) (not b!1408902) (not b!1408898) (not start!121268))
(check-sat)
