; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120124 () Bool)

(assert start!120124)

(declare-fun b!1398643 () Bool)

(declare-fun e!791806 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10497 0))(
  ( (MissingZero!10497 (index!44359 (_ BitVec 32))) (Found!10497 (index!44360 (_ BitVec 32))) (Intermediate!10497 (undefined!11309 Bool) (index!44361 (_ BitVec 32)) (x!125999 (_ BitVec 32))) (Undefined!10497) (MissingVacant!10497 (index!44362 (_ BitVec 32))) )
))
(declare-fun lt!615062 () SeekEntryResult!10497)

(assert (=> b!1398643 (= e!791806 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge (index!44361 lt!615062) #b00000000000000000000000000000000) (bvslt (index!44361 lt!615062) (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-datatypes ((array!95653 0))(
  ( (array!95654 (arr!46180 (Array (_ BitVec 32) (_ BitVec 64))) (size!46730 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95653)

(declare-fun lt!615064 () SeekEntryResult!10497)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398643 (and (not (undefined!11309 lt!615062)) (= (index!44361 lt!615062) i!1037) (bvslt (x!125999 lt!615062) (x!125999 lt!615064)) (= (select (store (arr!46180 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44361 lt!615062)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46998 0))(
  ( (Unit!46999) )
))
(declare-fun lt!615061 () Unit!46998)

(declare-fun lt!615065 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46998)

(assert (=> b!1398643 (= lt!615061 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615065 (x!125999 lt!615064) (index!44361 lt!615064) (x!125999 lt!615062) (index!44361 lt!615062) (undefined!11309 lt!615062) mask!2840))))

(declare-fun b!1398644 () Bool)

(declare-fun e!791807 () Bool)

(declare-fun e!791805 () Bool)

(assert (=> b!1398644 (= e!791807 (not e!791805))))

(declare-fun res!937564 () Bool)

(assert (=> b!1398644 (=> res!937564 e!791805)))

(assert (=> b!1398644 (= res!937564 (or (not (is-Intermediate!10497 lt!615064)) (undefined!11309 lt!615064)))))

(declare-fun e!791804 () Bool)

(assert (=> b!1398644 e!791804))

(declare-fun res!937557 () Bool)

(assert (=> b!1398644 (=> (not res!937557) (not e!791804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95653 (_ BitVec 32)) Bool)

(assert (=> b!1398644 (= res!937557 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615063 () Unit!46998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46998)

(assert (=> b!1398644 (= lt!615063 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95653 (_ BitVec 32)) SeekEntryResult!10497)

(assert (=> b!1398644 (= lt!615064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615065 (select (arr!46180 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398644 (= lt!615065 (toIndex!0 (select (arr!46180 a!2901) j!112) mask!2840))))

(declare-fun b!1398645 () Bool)

(declare-fun res!937556 () Bool)

(assert (=> b!1398645 (=> (not res!937556) (not e!791807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398645 (= res!937556 (validKeyInArray!0 (select (arr!46180 a!2901) j!112)))))

(declare-fun b!1398646 () Bool)

(declare-fun res!937563 () Bool)

(assert (=> b!1398646 (=> (not res!937563) (not e!791807))))

(assert (=> b!1398646 (= res!937563 (and (= (size!46730 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46730 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46730 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398647 () Bool)

(declare-fun res!937562 () Bool)

(assert (=> b!1398647 (=> (not res!937562) (not e!791807))))

(assert (=> b!1398647 (= res!937562 (validKeyInArray!0 (select (arr!46180 a!2901) i!1037)))))

(declare-fun res!937559 () Bool)

(assert (=> start!120124 (=> (not res!937559) (not e!791807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120124 (= res!937559 (validMask!0 mask!2840))))

(assert (=> start!120124 e!791807))

(assert (=> start!120124 true))

(declare-fun array_inv!35208 (array!95653) Bool)

(assert (=> start!120124 (array_inv!35208 a!2901)))

(declare-fun b!1398648 () Bool)

(declare-fun res!937561 () Bool)

(assert (=> b!1398648 (=> (not res!937561) (not e!791807))))

(declare-datatypes ((List!32699 0))(
  ( (Nil!32696) (Cons!32695 (h!33937 (_ BitVec 64)) (t!47393 List!32699)) )
))
(declare-fun arrayNoDuplicates!0 (array!95653 (_ BitVec 32) List!32699) Bool)

(assert (=> b!1398648 (= res!937561 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32696))))

(declare-fun b!1398649 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95653 (_ BitVec 32)) SeekEntryResult!10497)

(assert (=> b!1398649 (= e!791804 (= (seekEntryOrOpen!0 (select (arr!46180 a!2901) j!112) a!2901 mask!2840) (Found!10497 j!112)))))

(declare-fun b!1398650 () Bool)

(declare-fun res!937558 () Bool)

(assert (=> b!1398650 (=> (not res!937558) (not e!791807))))

(assert (=> b!1398650 (= res!937558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398651 () Bool)

(assert (=> b!1398651 (= e!791805 e!791806)))

(declare-fun res!937560 () Bool)

(assert (=> b!1398651 (=> res!937560 e!791806)))

(assert (=> b!1398651 (= res!937560 (or (= lt!615064 lt!615062) (not (is-Intermediate!10497 lt!615062))))))

(declare-fun lt!615066 () (_ BitVec 64))

(assert (=> b!1398651 (= lt!615062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615066 mask!2840) lt!615066 (array!95654 (store (arr!46180 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46730 a!2901)) mask!2840))))

(assert (=> b!1398651 (= lt!615066 (select (store (arr!46180 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120124 res!937559) b!1398646))

(assert (= (and b!1398646 res!937563) b!1398647))

(assert (= (and b!1398647 res!937562) b!1398645))

(assert (= (and b!1398645 res!937556) b!1398650))

(assert (= (and b!1398650 res!937558) b!1398648))

(assert (= (and b!1398648 res!937561) b!1398644))

(assert (= (and b!1398644 res!937557) b!1398649))

(assert (= (and b!1398644 (not res!937564)) b!1398651))

(assert (= (and b!1398651 (not res!937560)) b!1398643))

(declare-fun m!1285855 () Bool)

(assert (=> b!1398644 m!1285855))

(declare-fun m!1285857 () Bool)

(assert (=> b!1398644 m!1285857))

(assert (=> b!1398644 m!1285855))

(declare-fun m!1285859 () Bool)

(assert (=> b!1398644 m!1285859))

(assert (=> b!1398644 m!1285855))

(declare-fun m!1285861 () Bool)

(assert (=> b!1398644 m!1285861))

(declare-fun m!1285863 () Bool)

(assert (=> b!1398644 m!1285863))

(declare-fun m!1285865 () Bool)

(assert (=> b!1398647 m!1285865))

(assert (=> b!1398647 m!1285865))

(declare-fun m!1285867 () Bool)

(assert (=> b!1398647 m!1285867))

(assert (=> b!1398645 m!1285855))

(assert (=> b!1398645 m!1285855))

(declare-fun m!1285869 () Bool)

(assert (=> b!1398645 m!1285869))

(declare-fun m!1285871 () Bool)

(assert (=> b!1398643 m!1285871))

(declare-fun m!1285873 () Bool)

(assert (=> b!1398643 m!1285873))

(declare-fun m!1285875 () Bool)

(assert (=> b!1398643 m!1285875))

(assert (=> b!1398649 m!1285855))

(assert (=> b!1398649 m!1285855))

(declare-fun m!1285877 () Bool)

(assert (=> b!1398649 m!1285877))

(declare-fun m!1285879 () Bool)

(assert (=> b!1398651 m!1285879))

(assert (=> b!1398651 m!1285871))

(assert (=> b!1398651 m!1285879))

(declare-fun m!1285881 () Bool)

(assert (=> b!1398651 m!1285881))

(declare-fun m!1285883 () Bool)

(assert (=> b!1398651 m!1285883))

(declare-fun m!1285885 () Bool)

(assert (=> b!1398648 m!1285885))

(declare-fun m!1285887 () Bool)

(assert (=> b!1398650 m!1285887))

(declare-fun m!1285889 () Bool)

(assert (=> start!120124 m!1285889))

(declare-fun m!1285891 () Bool)

(assert (=> start!120124 m!1285891))

(push 1)

(assert (not b!1398649))

(assert (not b!1398643))

(assert (not b!1398647))

(assert (not b!1398648))

(assert (not b!1398651))

(assert (not b!1398650))

(assert (not b!1398644))

(assert (not b!1398645))

(assert (not start!120124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

