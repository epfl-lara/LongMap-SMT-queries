; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119998 () Bool)

(assert start!119998)

(declare-fun b!1396933 () Bool)

(declare-fun res!935853 () Bool)

(declare-fun e!790851 () Bool)

(assert (=> b!1396933 (=> (not res!935853) (not e!790851))))

(declare-datatypes ((array!95527 0))(
  ( (array!95528 (arr!46117 (Array (_ BitVec 32) (_ BitVec 64))) (size!46667 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95527)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396933 (= res!935853 (validKeyInArray!0 (select (arr!46117 a!2901) i!1037)))))

(declare-fun b!1396934 () Bool)

(declare-fun e!790849 () Bool)

(assert (=> b!1396934 (= e!790851 (not e!790849))))

(declare-fun res!935854 () Bool)

(assert (=> b!1396934 (=> res!935854 e!790849)))

(declare-datatypes ((SeekEntryResult!10434 0))(
  ( (MissingZero!10434 (index!44107 (_ BitVec 32))) (Found!10434 (index!44108 (_ BitVec 32))) (Intermediate!10434 (undefined!11246 Bool) (index!44109 (_ BitVec 32)) (x!125768 (_ BitVec 32))) (Undefined!10434) (MissingVacant!10434 (index!44110 (_ BitVec 32))) )
))
(declare-fun lt!613813 () SeekEntryResult!10434)

(assert (=> b!1396934 (= res!935854 (or (not (is-Intermediate!10434 lt!613813)) (undefined!11246 lt!613813)))))

(declare-fun e!790850 () Bool)

(assert (=> b!1396934 e!790850))

(declare-fun res!935849 () Bool)

(assert (=> b!1396934 (=> (not res!935849) (not e!790850))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95527 (_ BitVec 32)) Bool)

(assert (=> b!1396934 (= res!935849 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46872 0))(
  ( (Unit!46873) )
))
(declare-fun lt!613815 () Unit!46872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46872)

(assert (=> b!1396934 (= lt!613815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95527 (_ BitVec 32)) SeekEntryResult!10434)

(assert (=> b!1396934 (= lt!613813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613809 (select (arr!46117 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396934 (= lt!613809 (toIndex!0 (select (arr!46117 a!2901) j!112) mask!2840))))

(declare-fun b!1396935 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95527 (_ BitVec 32)) SeekEntryResult!10434)

(assert (=> b!1396935 (= e!790850 (= (seekEntryOrOpen!0 (select (arr!46117 a!2901) j!112) a!2901 mask!2840) (Found!10434 j!112)))))

(declare-fun b!1396936 () Bool)

(declare-fun res!935850 () Bool)

(assert (=> b!1396936 (=> (not res!935850) (not e!790851))))

(assert (=> b!1396936 (= res!935850 (validKeyInArray!0 (select (arr!46117 a!2901) j!112)))))

(declare-fun b!1396938 () Bool)

(declare-fun e!790853 () Bool)

(assert (=> b!1396938 (= e!790853 true)))

(declare-fun lt!613812 () SeekEntryResult!10434)

(declare-fun lt!613811 () (_ BitVec 64))

(declare-fun lt!613810 () array!95527)

(assert (=> b!1396938 (= lt!613812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613809 lt!613811 lt!613810 mask!2840))))

(declare-fun b!1396939 () Bool)

(declare-fun res!935848 () Bool)

(assert (=> b!1396939 (=> (not res!935848) (not e!790851))))

(declare-datatypes ((List!32636 0))(
  ( (Nil!32633) (Cons!32632 (h!33874 (_ BitVec 64)) (t!47330 List!32636)) )
))
(declare-fun arrayNoDuplicates!0 (array!95527 (_ BitVec 32) List!32636) Bool)

(assert (=> b!1396939 (= res!935848 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32633))))

(declare-fun b!1396940 () Bool)

(assert (=> b!1396940 (= e!790849 e!790853)))

(declare-fun res!935846 () Bool)

(assert (=> b!1396940 (=> res!935846 e!790853)))

(declare-fun lt!613814 () SeekEntryResult!10434)

(assert (=> b!1396940 (= res!935846 (or (= lt!613813 lt!613814) (not (is-Intermediate!10434 lt!613814)) (bvslt (x!125768 lt!613813) #b00000000000000000000000000000000) (bvsgt (x!125768 lt!613813) #b01111111111111111111111111111110) (bvslt lt!613809 #b00000000000000000000000000000000) (bvsge lt!613809 (size!46667 a!2901)) (bvslt (index!44109 lt!613813) #b00000000000000000000000000000000) (bvsge (index!44109 lt!613813) (size!46667 a!2901)) (not (= lt!613813 (Intermediate!10434 false (index!44109 lt!613813) (x!125768 lt!613813)))) (not (= lt!613814 (Intermediate!10434 (undefined!11246 lt!613814) (index!44109 lt!613814) (x!125768 lt!613814))))))))

(assert (=> b!1396940 (= lt!613814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613811 mask!2840) lt!613811 lt!613810 mask!2840))))

(assert (=> b!1396940 (= lt!613811 (select (store (arr!46117 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396940 (= lt!613810 (array!95528 (store (arr!46117 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46667 a!2901)))))

(declare-fun b!1396941 () Bool)

(declare-fun res!935847 () Bool)

(assert (=> b!1396941 (=> (not res!935847) (not e!790851))))

(assert (=> b!1396941 (= res!935847 (and (= (size!46667 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46667 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46667 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396937 () Bool)

(declare-fun res!935852 () Bool)

(assert (=> b!1396937 (=> (not res!935852) (not e!790851))))

(assert (=> b!1396937 (= res!935852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!935851 () Bool)

(assert (=> start!119998 (=> (not res!935851) (not e!790851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119998 (= res!935851 (validMask!0 mask!2840))))

(assert (=> start!119998 e!790851))

(assert (=> start!119998 true))

(declare-fun array_inv!35145 (array!95527) Bool)

(assert (=> start!119998 (array_inv!35145 a!2901)))

(assert (= (and start!119998 res!935851) b!1396941))

(assert (= (and b!1396941 res!935847) b!1396933))

(assert (= (and b!1396933 res!935853) b!1396936))

(assert (= (and b!1396936 res!935850) b!1396937))

(assert (= (and b!1396937 res!935852) b!1396939))

(assert (= (and b!1396939 res!935848) b!1396934))

(assert (= (and b!1396934 res!935849) b!1396935))

(assert (= (and b!1396934 (not res!935854)) b!1396940))

(assert (= (and b!1396940 (not res!935846)) b!1396938))

(declare-fun m!1283535 () Bool)

(assert (=> b!1396938 m!1283535))

(declare-fun m!1283537 () Bool)

(assert (=> b!1396940 m!1283537))

(assert (=> b!1396940 m!1283537))

(declare-fun m!1283539 () Bool)

(assert (=> b!1396940 m!1283539))

(declare-fun m!1283541 () Bool)

(assert (=> b!1396940 m!1283541))

(declare-fun m!1283543 () Bool)

(assert (=> b!1396940 m!1283543))

(declare-fun m!1283545 () Bool)

(assert (=> b!1396934 m!1283545))

(declare-fun m!1283547 () Bool)

(assert (=> b!1396934 m!1283547))

(assert (=> b!1396934 m!1283545))

(assert (=> b!1396934 m!1283545))

(declare-fun m!1283549 () Bool)

(assert (=> b!1396934 m!1283549))

(declare-fun m!1283551 () Bool)

(assert (=> b!1396934 m!1283551))

(declare-fun m!1283553 () Bool)

(assert (=> b!1396934 m!1283553))

(declare-fun m!1283555 () Bool)

(assert (=> start!119998 m!1283555))

(declare-fun m!1283557 () Bool)

(assert (=> start!119998 m!1283557))

(assert (=> b!1396936 m!1283545))

(assert (=> b!1396936 m!1283545))

(declare-fun m!1283559 () Bool)

(assert (=> b!1396936 m!1283559))

(declare-fun m!1283561 () Bool)

(assert (=> b!1396939 m!1283561))

(declare-fun m!1283563 () Bool)

(assert (=> b!1396937 m!1283563))

(assert (=> b!1396935 m!1283545))

(assert (=> b!1396935 m!1283545))

(declare-fun m!1283565 () Bool)

(assert (=> b!1396935 m!1283565))

(declare-fun m!1283567 () Bool)

(assert (=> b!1396933 m!1283567))

(assert (=> b!1396933 m!1283567))

(declare-fun m!1283569 () Bool)

(assert (=> b!1396933 m!1283569))

(push 1)

