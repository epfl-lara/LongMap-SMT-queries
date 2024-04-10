; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120386 () Bool)

(assert start!120386)

(declare-fun b!1401377 () Bool)

(declare-fun e!793497 () Bool)

(declare-fun e!793495 () Bool)

(assert (=> b!1401377 (= e!793497 e!793495)))

(declare-fun res!939892 () Bool)

(assert (=> b!1401377 (=> res!939892 e!793495)))

(declare-datatypes ((array!95795 0))(
  ( (array!95796 (arr!46248 (Array (_ BitVec 32) (_ BitVec 64))) (size!46798 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95795)

(declare-datatypes ((SeekEntryResult!10565 0))(
  ( (MissingZero!10565 (index!44637 (_ BitVec 32))) (Found!10565 (index!44638 (_ BitVec 32))) (Intermediate!10565 (undefined!11377 Bool) (index!44639 (_ BitVec 32)) (x!126272 (_ BitVec 32))) (Undefined!10565) (MissingVacant!10565 (index!44640 (_ BitVec 32))) )
))
(declare-fun lt!616890 () SeekEntryResult!10565)

(declare-fun lt!616888 () SeekEntryResult!10565)

(declare-fun lt!616892 () (_ BitVec 32))

(assert (=> b!1401377 (= res!939892 (or (bvslt (x!126272 lt!616890) #b00000000000000000000000000000000) (bvsgt (x!126272 lt!616890) #b01111111111111111111111111111110) (bvslt (x!126272 lt!616888) #b00000000000000000000000000000000) (bvsgt (x!126272 lt!616888) #b01111111111111111111111111111110) (bvslt lt!616892 #b00000000000000000000000000000000) (bvsge lt!616892 (size!46798 a!2901)) (bvslt (index!44639 lt!616890) #b00000000000000000000000000000000) (bvsge (index!44639 lt!616890) (size!46798 a!2901)) (bvslt (index!44639 lt!616888) #b00000000000000000000000000000000) (bvsge (index!44639 lt!616888) (size!46798 a!2901)) (not (= lt!616890 (Intermediate!10565 false (index!44639 lt!616890) (x!126272 lt!616890)))) (not (= lt!616888 (Intermediate!10565 false (index!44639 lt!616888) (x!126272 lt!616888))))))))

(declare-fun e!793498 () Bool)

(assert (=> b!1401377 e!793498))

(declare-fun res!939893 () Bool)

(assert (=> b!1401377 (=> (not res!939893) (not e!793498))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401377 (= res!939893 (and (not (undefined!11377 lt!616888)) (= (index!44639 lt!616888) i!1037) (bvslt (x!126272 lt!616888) (x!126272 lt!616890)) (= (select (store (arr!46248 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44639 lt!616888)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47134 0))(
  ( (Unit!47135) )
))
(declare-fun lt!616891 () Unit!47134)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47134)

(assert (=> b!1401377 (= lt!616891 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616892 (x!126272 lt!616890) (index!44639 lt!616890) (x!126272 lt!616888) (index!44639 lt!616888) (undefined!11377 lt!616888) mask!2840))))

(declare-fun b!1401378 () Bool)

(assert (=> b!1401378 (= e!793495 true)))

(declare-fun lt!616889 () (_ BitVec 64))

(declare-fun lt!616893 () SeekEntryResult!10565)

(declare-fun lt!616886 () array!95795)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95795 (_ BitVec 32)) SeekEntryResult!10565)

(assert (=> b!1401378 (= lt!616893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616892 lt!616889 lt!616886 mask!2840))))

(declare-fun b!1401379 () Bool)

(declare-fun e!793499 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95795 (_ BitVec 32)) SeekEntryResult!10565)

(assert (=> b!1401379 (= e!793499 (= (seekEntryOrOpen!0 (select (arr!46248 a!2901) j!112) a!2901 mask!2840) (Found!10565 j!112)))))

(declare-fun b!1401380 () Bool)

(declare-fun res!939898 () Bool)

(declare-fun e!793493 () Bool)

(assert (=> b!1401380 (=> (not res!939898) (not e!793493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401380 (= res!939898 (validKeyInArray!0 (select (arr!46248 a!2901) j!112)))))

(declare-fun res!939897 () Bool)

(assert (=> start!120386 (=> (not res!939897) (not e!793493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120386 (= res!939897 (validMask!0 mask!2840))))

(assert (=> start!120386 e!793493))

(assert (=> start!120386 true))

(declare-fun array_inv!35276 (array!95795) Bool)

(assert (=> start!120386 (array_inv!35276 a!2901)))

(declare-fun b!1401381 () Bool)

(declare-fun res!939890 () Bool)

(assert (=> b!1401381 (=> (not res!939890) (not e!793493))))

(assert (=> b!1401381 (= res!939890 (and (= (size!46798 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46798 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46798 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401382 () Bool)

(declare-fun res!939895 () Bool)

(assert (=> b!1401382 (=> (not res!939895) (not e!793493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95795 (_ BitVec 32)) Bool)

(assert (=> b!1401382 (= res!939895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401383 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95795 (_ BitVec 32)) SeekEntryResult!10565)

(assert (=> b!1401383 (= e!793498 (= (seekEntryOrOpen!0 lt!616889 lt!616886 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126272 lt!616888) (index!44639 lt!616888) (index!44639 lt!616888) (select (arr!46248 a!2901) j!112) lt!616886 mask!2840)))))

(declare-fun b!1401384 () Bool)

(declare-fun res!939889 () Bool)

(assert (=> b!1401384 (=> (not res!939889) (not e!793493))))

(declare-datatypes ((List!32767 0))(
  ( (Nil!32764) (Cons!32763 (h!34011 (_ BitVec 64)) (t!47461 List!32767)) )
))
(declare-fun arrayNoDuplicates!0 (array!95795 (_ BitVec 32) List!32767) Bool)

(assert (=> b!1401384 (= res!939889 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32764))))

(declare-fun b!1401385 () Bool)

(declare-fun e!793494 () Bool)

(assert (=> b!1401385 (= e!793494 e!793497)))

(declare-fun res!939894 () Bool)

(assert (=> b!1401385 (=> res!939894 e!793497)))

(get-info :version)

(assert (=> b!1401385 (= res!939894 (or (= lt!616890 lt!616888) (not ((_ is Intermediate!10565) lt!616888))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401385 (= lt!616888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616889 mask!2840) lt!616889 lt!616886 mask!2840))))

(assert (=> b!1401385 (= lt!616889 (select (store (arr!46248 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401385 (= lt!616886 (array!95796 (store (arr!46248 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46798 a!2901)))))

(declare-fun b!1401386 () Bool)

(declare-fun res!939891 () Bool)

(assert (=> b!1401386 (=> (not res!939891) (not e!793493))))

(assert (=> b!1401386 (= res!939891 (validKeyInArray!0 (select (arr!46248 a!2901) i!1037)))))

(declare-fun b!1401387 () Bool)

(assert (=> b!1401387 (= e!793493 (not e!793494))))

(declare-fun res!939888 () Bool)

(assert (=> b!1401387 (=> res!939888 e!793494)))

(assert (=> b!1401387 (= res!939888 (or (not ((_ is Intermediate!10565) lt!616890)) (undefined!11377 lt!616890)))))

(assert (=> b!1401387 e!793499))

(declare-fun res!939896 () Bool)

(assert (=> b!1401387 (=> (not res!939896) (not e!793499))))

(assert (=> b!1401387 (= res!939896 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616887 () Unit!47134)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47134)

(assert (=> b!1401387 (= lt!616887 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401387 (= lt!616890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616892 (select (arr!46248 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401387 (= lt!616892 (toIndex!0 (select (arr!46248 a!2901) j!112) mask!2840))))

(assert (= (and start!120386 res!939897) b!1401381))

(assert (= (and b!1401381 res!939890) b!1401386))

(assert (= (and b!1401386 res!939891) b!1401380))

(assert (= (and b!1401380 res!939898) b!1401382))

(assert (= (and b!1401382 res!939895) b!1401384))

(assert (= (and b!1401384 res!939889) b!1401387))

(assert (= (and b!1401387 res!939896) b!1401379))

(assert (= (and b!1401387 (not res!939888)) b!1401385))

(assert (= (and b!1401385 (not res!939894)) b!1401377))

(assert (= (and b!1401377 res!939893) b!1401383))

(assert (= (and b!1401377 (not res!939892)) b!1401378))

(declare-fun m!1289141 () Bool)

(assert (=> start!120386 m!1289141))

(declare-fun m!1289143 () Bool)

(assert (=> start!120386 m!1289143))

(declare-fun m!1289145 () Bool)

(assert (=> b!1401384 m!1289145))

(declare-fun m!1289147 () Bool)

(assert (=> b!1401380 m!1289147))

(assert (=> b!1401380 m!1289147))

(declare-fun m!1289149 () Bool)

(assert (=> b!1401380 m!1289149))

(declare-fun m!1289151 () Bool)

(assert (=> b!1401377 m!1289151))

(declare-fun m!1289153 () Bool)

(assert (=> b!1401377 m!1289153))

(declare-fun m!1289155 () Bool)

(assert (=> b!1401377 m!1289155))

(declare-fun m!1289157 () Bool)

(assert (=> b!1401378 m!1289157))

(assert (=> b!1401379 m!1289147))

(assert (=> b!1401379 m!1289147))

(declare-fun m!1289159 () Bool)

(assert (=> b!1401379 m!1289159))

(declare-fun m!1289161 () Bool)

(assert (=> b!1401382 m!1289161))

(declare-fun m!1289163 () Bool)

(assert (=> b!1401386 m!1289163))

(assert (=> b!1401386 m!1289163))

(declare-fun m!1289165 () Bool)

(assert (=> b!1401386 m!1289165))

(declare-fun m!1289167 () Bool)

(assert (=> b!1401385 m!1289167))

(assert (=> b!1401385 m!1289167))

(declare-fun m!1289169 () Bool)

(assert (=> b!1401385 m!1289169))

(assert (=> b!1401385 m!1289151))

(declare-fun m!1289171 () Bool)

(assert (=> b!1401385 m!1289171))

(assert (=> b!1401387 m!1289147))

(declare-fun m!1289173 () Bool)

(assert (=> b!1401387 m!1289173))

(assert (=> b!1401387 m!1289147))

(declare-fun m!1289175 () Bool)

(assert (=> b!1401387 m!1289175))

(assert (=> b!1401387 m!1289147))

(declare-fun m!1289177 () Bool)

(assert (=> b!1401387 m!1289177))

(declare-fun m!1289179 () Bool)

(assert (=> b!1401387 m!1289179))

(declare-fun m!1289181 () Bool)

(assert (=> b!1401383 m!1289181))

(assert (=> b!1401383 m!1289147))

(assert (=> b!1401383 m!1289147))

(declare-fun m!1289183 () Bool)

(assert (=> b!1401383 m!1289183))

(check-sat (not b!1401385) (not b!1401380) (not b!1401384) (not b!1401386) (not b!1401377) (not b!1401382) (not b!1401378) (not start!120386) (not b!1401379) (not b!1401383) (not b!1401387))
(check-sat)
