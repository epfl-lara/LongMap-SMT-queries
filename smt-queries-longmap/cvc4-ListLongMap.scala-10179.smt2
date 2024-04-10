; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120004 () Bool)

(assert start!120004)

(declare-fun b!1397014 () Bool)

(declare-fun e!790895 () Bool)

(declare-fun e!790897 () Bool)

(assert (=> b!1397014 (= e!790895 (not e!790897))))

(declare-fun res!935927 () Bool)

(assert (=> b!1397014 (=> res!935927 e!790897)))

(declare-datatypes ((SeekEntryResult!10437 0))(
  ( (MissingZero!10437 (index!44119 (_ BitVec 32))) (Found!10437 (index!44120 (_ BitVec 32))) (Intermediate!10437 (undefined!11249 Bool) (index!44121 (_ BitVec 32)) (x!125779 (_ BitVec 32))) (Undefined!10437) (MissingVacant!10437 (index!44122 (_ BitVec 32))) )
))
(declare-fun lt!613873 () SeekEntryResult!10437)

(assert (=> b!1397014 (= res!935927 (or (not (is-Intermediate!10437 lt!613873)) (undefined!11249 lt!613873)))))

(declare-fun e!790894 () Bool)

(assert (=> b!1397014 e!790894))

(declare-fun res!935935 () Bool)

(assert (=> b!1397014 (=> (not res!935935) (not e!790894))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95533 0))(
  ( (array!95534 (arr!46120 (Array (_ BitVec 32) (_ BitVec 64))) (size!46670 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95533)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95533 (_ BitVec 32)) Bool)

(assert (=> b!1397014 (= res!935935 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46878 0))(
  ( (Unit!46879) )
))
(declare-fun lt!613872 () Unit!46878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46878)

(assert (=> b!1397014 (= lt!613872 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613876 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95533 (_ BitVec 32)) SeekEntryResult!10437)

(assert (=> b!1397014 (= lt!613873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613876 (select (arr!46120 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397014 (= lt!613876 (toIndex!0 (select (arr!46120 a!2901) j!112) mask!2840))))

(declare-fun b!1397015 () Bool)

(declare-fun e!790896 () Bool)

(assert (=> b!1397015 (= e!790896 true)))

(declare-fun lt!613875 () (_ BitVec 64))

(declare-fun lt!613874 () array!95533)

(declare-fun lt!613877 () SeekEntryResult!10437)

(assert (=> b!1397015 (= lt!613877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613876 lt!613875 lt!613874 mask!2840))))

(declare-fun b!1397016 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95533 (_ BitVec 32)) SeekEntryResult!10437)

(assert (=> b!1397016 (= e!790894 (= (seekEntryOrOpen!0 (select (arr!46120 a!2901) j!112) a!2901 mask!2840) (Found!10437 j!112)))))

(declare-fun b!1397017 () Bool)

(assert (=> b!1397017 (= e!790897 e!790896)))

(declare-fun res!935933 () Bool)

(assert (=> b!1397017 (=> res!935933 e!790896)))

(declare-fun lt!613878 () SeekEntryResult!10437)

(assert (=> b!1397017 (= res!935933 (or (= lt!613873 lt!613878) (not (is-Intermediate!10437 lt!613878)) (bvslt (x!125779 lt!613873) #b00000000000000000000000000000000) (bvsgt (x!125779 lt!613873) #b01111111111111111111111111111110) (bvslt lt!613876 #b00000000000000000000000000000000) (bvsge lt!613876 (size!46670 a!2901)) (bvslt (index!44121 lt!613873) #b00000000000000000000000000000000) (bvsge (index!44121 lt!613873) (size!46670 a!2901)) (not (= lt!613873 (Intermediate!10437 false (index!44121 lt!613873) (x!125779 lt!613873)))) (not (= lt!613878 (Intermediate!10437 (undefined!11249 lt!613878) (index!44121 lt!613878) (x!125779 lt!613878))))))))

(assert (=> b!1397017 (= lt!613878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613875 mask!2840) lt!613875 lt!613874 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397017 (= lt!613875 (select (store (arr!46120 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397017 (= lt!613874 (array!95534 (store (arr!46120 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46670 a!2901)))))

(declare-fun b!1397018 () Bool)

(declare-fun res!935931 () Bool)

(assert (=> b!1397018 (=> (not res!935931) (not e!790895))))

(assert (=> b!1397018 (= res!935931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397019 () Bool)

(declare-fun res!935930 () Bool)

(assert (=> b!1397019 (=> (not res!935930) (not e!790895))))

(declare-datatypes ((List!32639 0))(
  ( (Nil!32636) (Cons!32635 (h!33877 (_ BitVec 64)) (t!47333 List!32639)) )
))
(declare-fun arrayNoDuplicates!0 (array!95533 (_ BitVec 32) List!32639) Bool)

(assert (=> b!1397019 (= res!935930 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32636))))

(declare-fun b!1397020 () Bool)

(declare-fun res!935929 () Bool)

(assert (=> b!1397020 (=> (not res!935929) (not e!790895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397020 (= res!935929 (validKeyInArray!0 (select (arr!46120 a!2901) i!1037)))))

(declare-fun b!1397021 () Bool)

(declare-fun res!935934 () Bool)

(assert (=> b!1397021 (=> (not res!935934) (not e!790895))))

(assert (=> b!1397021 (= res!935934 (and (= (size!46670 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46670 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46670 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!935932 () Bool)

(assert (=> start!120004 (=> (not res!935932) (not e!790895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120004 (= res!935932 (validMask!0 mask!2840))))

(assert (=> start!120004 e!790895))

(assert (=> start!120004 true))

(declare-fun array_inv!35148 (array!95533) Bool)

(assert (=> start!120004 (array_inv!35148 a!2901)))

(declare-fun b!1397022 () Bool)

(declare-fun res!935928 () Bool)

(assert (=> b!1397022 (=> (not res!935928) (not e!790895))))

(assert (=> b!1397022 (= res!935928 (validKeyInArray!0 (select (arr!46120 a!2901) j!112)))))

(assert (= (and start!120004 res!935932) b!1397021))

(assert (= (and b!1397021 res!935934) b!1397020))

(assert (= (and b!1397020 res!935929) b!1397022))

(assert (= (and b!1397022 res!935928) b!1397018))

(assert (= (and b!1397018 res!935931) b!1397019))

(assert (= (and b!1397019 res!935930) b!1397014))

(assert (= (and b!1397014 res!935935) b!1397016))

(assert (= (and b!1397014 (not res!935927)) b!1397017))

(assert (= (and b!1397017 (not res!935933)) b!1397015))

(declare-fun m!1283643 () Bool)

(assert (=> b!1397022 m!1283643))

(assert (=> b!1397022 m!1283643))

(declare-fun m!1283645 () Bool)

(assert (=> b!1397022 m!1283645))

(declare-fun m!1283647 () Bool)

(assert (=> b!1397019 m!1283647))

(declare-fun m!1283649 () Bool)

(assert (=> b!1397020 m!1283649))

(assert (=> b!1397020 m!1283649))

(declare-fun m!1283651 () Bool)

(assert (=> b!1397020 m!1283651))

(declare-fun m!1283653 () Bool)

(assert (=> b!1397017 m!1283653))

(assert (=> b!1397017 m!1283653))

(declare-fun m!1283655 () Bool)

(assert (=> b!1397017 m!1283655))

(declare-fun m!1283657 () Bool)

(assert (=> b!1397017 m!1283657))

(declare-fun m!1283659 () Bool)

(assert (=> b!1397017 m!1283659))

(assert (=> b!1397014 m!1283643))

(declare-fun m!1283661 () Bool)

(assert (=> b!1397014 m!1283661))

(assert (=> b!1397014 m!1283643))

(declare-fun m!1283663 () Bool)

(assert (=> b!1397014 m!1283663))

(assert (=> b!1397014 m!1283643))

(declare-fun m!1283665 () Bool)

(assert (=> b!1397014 m!1283665))

(declare-fun m!1283667 () Bool)

(assert (=> b!1397014 m!1283667))

(declare-fun m!1283669 () Bool)

(assert (=> start!120004 m!1283669))

(declare-fun m!1283671 () Bool)

(assert (=> start!120004 m!1283671))

(declare-fun m!1283673 () Bool)

(assert (=> b!1397015 m!1283673))

(declare-fun m!1283675 () Bool)

(assert (=> b!1397018 m!1283675))

(assert (=> b!1397016 m!1283643))

(assert (=> b!1397016 m!1283643))

(declare-fun m!1283677 () Bool)

(assert (=> b!1397016 m!1283677))

(push 1)

