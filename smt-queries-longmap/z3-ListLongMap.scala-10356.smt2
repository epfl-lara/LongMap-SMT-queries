; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121946 () Bool)

(assert start!121946)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96585 0))(
  ( (array!96586 (arr!46624 (Array (_ BitVec 32) (_ BitVec 64))) (size!47176 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96585)

(declare-fun lt!623800 () array!96585)

(declare-datatypes ((SeekEntryResult!10961 0))(
  ( (MissingZero!10961 (index!46236 (_ BitVec 32))) (Found!10961 (index!46237 (_ BitVec 32))) (Intermediate!10961 (undefined!11773 Bool) (index!46238 (_ BitVec 32)) (x!127845 (_ BitVec 32))) (Undefined!10961) (MissingVacant!10961 (index!46239 (_ BitVec 32))) )
))
(declare-fun lt!623798 () SeekEntryResult!10961)

(declare-fun lt!623796 () (_ BitVec 64))

(declare-fun e!800922 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1415133 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96585 (_ BitVec 32)) SeekEntryResult!10961)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96585 (_ BitVec 32)) SeekEntryResult!10961)

(assert (=> b!1415133 (= e!800922 (= (seekEntryOrOpen!0 lt!623796 lt!623800 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127845 lt!623798) (index!46238 lt!623798) (index!46238 lt!623798) (select (arr!46624 a!2901) j!112) lt!623800 mask!2840)))))

(declare-fun b!1415134 () Bool)

(declare-fun e!800927 () Bool)

(declare-fun e!800926 () Bool)

(assert (=> b!1415134 (= e!800927 e!800926)))

(declare-fun res!951231 () Bool)

(assert (=> b!1415134 (=> res!951231 e!800926)))

(declare-fun lt!623795 () SeekEntryResult!10961)

(get-info :version)

(assert (=> b!1415134 (= res!951231 (or (= lt!623795 lt!623798) (not ((_ is Intermediate!10961) lt!623798))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96585 (_ BitVec 32)) SeekEntryResult!10961)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415134 (= lt!623798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623796 mask!2840) lt!623796 lt!623800 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415134 (= lt!623796 (select (store (arr!46624 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415134 (= lt!623800 (array!96586 (store (arr!46624 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47176 a!2901)))))

(declare-fun res!951230 () Bool)

(declare-fun e!800925 () Bool)

(assert (=> start!121946 (=> (not res!951230) (not e!800925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121946 (= res!951230 (validMask!0 mask!2840))))

(assert (=> start!121946 e!800925))

(assert (=> start!121946 true))

(declare-fun array_inv!35857 (array!96585) Bool)

(assert (=> start!121946 (array_inv!35857 a!2901)))

(declare-fun b!1415135 () Bool)

(assert (=> b!1415135 (= e!800925 (not e!800927))))

(declare-fun res!951232 () Bool)

(assert (=> b!1415135 (=> res!951232 e!800927)))

(assert (=> b!1415135 (= res!951232 (or (not ((_ is Intermediate!10961) lt!623795)) (undefined!11773 lt!623795)))))

(declare-fun e!800923 () Bool)

(assert (=> b!1415135 e!800923))

(declare-fun res!951234 () Bool)

(assert (=> b!1415135 (=> (not res!951234) (not e!800923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96585 (_ BitVec 32)) Bool)

(assert (=> b!1415135 (= res!951234 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47739 0))(
  ( (Unit!47740) )
))
(declare-fun lt!623801 () Unit!47739)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47739)

(assert (=> b!1415135 (= lt!623801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623797 () (_ BitVec 32))

(assert (=> b!1415135 (= lt!623795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623797 (select (arr!46624 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415135 (= lt!623797 (toIndex!0 (select (arr!46624 a!2901) j!112) mask!2840))))

(declare-fun b!1415136 () Bool)

(declare-fun res!951235 () Bool)

(assert (=> b!1415136 (=> (not res!951235) (not e!800925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415136 (= res!951235 (validKeyInArray!0 (select (arr!46624 a!2901) j!112)))))

(declare-fun b!1415137 () Bool)

(declare-fun res!951226 () Bool)

(assert (=> b!1415137 (=> (not res!951226) (not e!800925))))

(declare-datatypes ((List!33221 0))(
  ( (Nil!33218) (Cons!33217 (h!34504 (_ BitVec 64)) (t!47907 List!33221)) )
))
(declare-fun arrayNoDuplicates!0 (array!96585 (_ BitVec 32) List!33221) Bool)

(assert (=> b!1415137 (= res!951226 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33218))))

(declare-fun b!1415138 () Bool)

(declare-fun res!951228 () Bool)

(assert (=> b!1415138 (=> (not res!951228) (not e!800925))))

(assert (=> b!1415138 (= res!951228 (validKeyInArray!0 (select (arr!46624 a!2901) i!1037)))))

(declare-fun b!1415139 () Bool)

(declare-fun res!951227 () Bool)

(assert (=> b!1415139 (=> (not res!951227) (not e!800925))))

(assert (=> b!1415139 (= res!951227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415140 () Bool)

(assert (=> b!1415140 (= e!800926 true)))

(assert (=> b!1415140 e!800922))

(declare-fun res!951233 () Bool)

(assert (=> b!1415140 (=> (not res!951233) (not e!800922))))

(assert (=> b!1415140 (= res!951233 (and (not (undefined!11773 lt!623798)) (= (index!46238 lt!623798) i!1037) (bvslt (x!127845 lt!623798) (x!127845 lt!623795)) (= (select (store (arr!46624 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46238 lt!623798)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623799 () Unit!47739)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47739)

(assert (=> b!1415140 (= lt!623799 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623797 (x!127845 lt!623795) (index!46238 lt!623795) (x!127845 lt!623798) (index!46238 lt!623798) (undefined!11773 lt!623798) mask!2840))))

(declare-fun b!1415141 () Bool)

(assert (=> b!1415141 (= e!800923 (= (seekEntryOrOpen!0 (select (arr!46624 a!2901) j!112) a!2901 mask!2840) (Found!10961 j!112)))))

(declare-fun b!1415142 () Bool)

(declare-fun res!951229 () Bool)

(assert (=> b!1415142 (=> (not res!951229) (not e!800925))))

(assert (=> b!1415142 (= res!951229 (and (= (size!47176 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47176 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47176 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121946 res!951230) b!1415142))

(assert (= (and b!1415142 res!951229) b!1415138))

(assert (= (and b!1415138 res!951228) b!1415136))

(assert (= (and b!1415136 res!951235) b!1415139))

(assert (= (and b!1415139 res!951227) b!1415137))

(assert (= (and b!1415137 res!951226) b!1415135))

(assert (= (and b!1415135 res!951234) b!1415141))

(assert (= (and b!1415135 (not res!951232)) b!1415134))

(assert (= (and b!1415134 (not res!951231)) b!1415140))

(assert (= (and b!1415140 res!951233) b!1415133))

(declare-fun m!1304869 () Bool)

(assert (=> b!1415135 m!1304869))

(declare-fun m!1304871 () Bool)

(assert (=> b!1415135 m!1304871))

(assert (=> b!1415135 m!1304869))

(declare-fun m!1304873 () Bool)

(assert (=> b!1415135 m!1304873))

(assert (=> b!1415135 m!1304869))

(declare-fun m!1304875 () Bool)

(assert (=> b!1415135 m!1304875))

(declare-fun m!1304877 () Bool)

(assert (=> b!1415135 m!1304877))

(declare-fun m!1304879 () Bool)

(assert (=> b!1415140 m!1304879))

(declare-fun m!1304881 () Bool)

(assert (=> b!1415140 m!1304881))

(declare-fun m!1304883 () Bool)

(assert (=> b!1415140 m!1304883))

(declare-fun m!1304885 () Bool)

(assert (=> b!1415137 m!1304885))

(declare-fun m!1304887 () Bool)

(assert (=> b!1415134 m!1304887))

(assert (=> b!1415134 m!1304887))

(declare-fun m!1304889 () Bool)

(assert (=> b!1415134 m!1304889))

(assert (=> b!1415134 m!1304879))

(declare-fun m!1304891 () Bool)

(assert (=> b!1415134 m!1304891))

(assert (=> b!1415141 m!1304869))

(assert (=> b!1415141 m!1304869))

(declare-fun m!1304893 () Bool)

(assert (=> b!1415141 m!1304893))

(declare-fun m!1304895 () Bool)

(assert (=> b!1415139 m!1304895))

(declare-fun m!1304897 () Bool)

(assert (=> start!121946 m!1304897))

(declare-fun m!1304899 () Bool)

(assert (=> start!121946 m!1304899))

(declare-fun m!1304901 () Bool)

(assert (=> b!1415133 m!1304901))

(assert (=> b!1415133 m!1304869))

(assert (=> b!1415133 m!1304869))

(declare-fun m!1304903 () Bool)

(assert (=> b!1415133 m!1304903))

(assert (=> b!1415136 m!1304869))

(assert (=> b!1415136 m!1304869))

(declare-fun m!1304905 () Bool)

(assert (=> b!1415136 m!1304905))

(declare-fun m!1304907 () Bool)

(assert (=> b!1415138 m!1304907))

(assert (=> b!1415138 m!1304907))

(declare-fun m!1304909 () Bool)

(assert (=> b!1415138 m!1304909))

(check-sat (not b!1415140) (not b!1415133) (not b!1415136) (not b!1415138) (not b!1415141) (not start!121946) (not b!1415134) (not b!1415139) (not b!1415137) (not b!1415135))
(check-sat)
