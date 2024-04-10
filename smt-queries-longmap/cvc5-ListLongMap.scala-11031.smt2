; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129018 () Bool)

(assert start!129018)

(declare-fun b!1513027 () Bool)

(declare-fun res!1032936 () Bool)

(declare-fun e!844468 () Bool)

(assert (=> b!1513027 (=> (not res!1032936) (not e!844468))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100874 0))(
  ( (array!100875 (arr!48674 (Array (_ BitVec 32) (_ BitVec 64))) (size!49224 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100874)

(declare-datatypes ((SeekEntryResult!12845 0))(
  ( (MissingZero!12845 (index!53775 (_ BitVec 32))) (Found!12845 (index!53776 (_ BitVec 32))) (Intermediate!12845 (undefined!13657 Bool) (index!53777 (_ BitVec 32)) (x!135499 (_ BitVec 32))) (Undefined!12845) (MissingVacant!12845 (index!53778 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100874 (_ BitVec 32)) SeekEntryResult!12845)

(assert (=> b!1513027 (= res!1032936 (= (seekEntry!0 (select (arr!48674 a!2804) j!70) a!2804 mask!2512) (Found!12845 j!70)))))

(declare-fun b!1513028 () Bool)

(declare-fun res!1032941 () Bool)

(declare-fun e!844464 () Bool)

(assert (=> b!1513028 (=> (not res!1032941) (not e!844464))))

(declare-datatypes ((List!35157 0))(
  ( (Nil!35154) (Cons!35153 (h!36565 (_ BitVec 64)) (t!49851 List!35157)) )
))
(declare-fun arrayNoDuplicates!0 (array!100874 (_ BitVec 32) List!35157) Bool)

(assert (=> b!1513028 (= res!1032941 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35154))))

(declare-fun b!1513029 () Bool)

(declare-fun e!844465 () Bool)

(assert (=> b!1513029 (= e!844468 e!844465)))

(declare-fun res!1032938 () Bool)

(assert (=> b!1513029 (=> res!1032938 e!844465)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!655833 () (_ BitVec 64))

(assert (=> b!1513029 (= res!1032938 (or (not (= (select (arr!48674 a!2804) j!70) lt!655833)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48674 a!2804) index!487) (select (arr!48674 a!2804) j!70)) (not (= (select (arr!48674 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513030 () Bool)

(declare-fun res!1032930 () Bool)

(assert (=> b!1513030 (=> (not res!1032930) (not e!844464))))

(assert (=> b!1513030 (= res!1032930 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49224 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49224 a!2804))))))

(declare-fun b!1513031 () Bool)

(declare-fun res!1032932 () Bool)

(declare-fun e!844462 () Bool)

(assert (=> b!1513031 (=> (not res!1032932) (not e!844462))))

(declare-fun lt!655831 () SeekEntryResult!12845)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100874 (_ BitVec 32)) SeekEntryResult!12845)

(assert (=> b!1513031 (= res!1032932 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48674 a!2804) j!70) a!2804 mask!2512) lt!655831))))

(declare-fun b!1513032 () Bool)

(declare-fun e!844466 () Bool)

(assert (=> b!1513032 (= e!844465 e!844466)))

(declare-fun res!1032935 () Bool)

(assert (=> b!1513032 (=> (not res!1032935) (not e!844466))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100874 (_ BitVec 32)) SeekEntryResult!12845)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100874 (_ BitVec 32)) SeekEntryResult!12845)

(assert (=> b!1513032 (= res!1032935 (= (seekEntryOrOpen!0 (select (arr!48674 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48674 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513033 () Bool)

(assert (=> b!1513033 (= e!844464 e!844462)))

(declare-fun res!1032934 () Bool)

(assert (=> b!1513033 (=> (not res!1032934) (not e!844462))))

(declare-fun lt!655834 () SeekEntryResult!12845)

(assert (=> b!1513033 (= res!1032934 (= lt!655834 lt!655831))))

(assert (=> b!1513033 (= lt!655831 (Intermediate!12845 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513033 (= lt!655834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48674 a!2804) j!70) mask!2512) (select (arr!48674 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513034 () Bool)

(declare-fun res!1032931 () Bool)

(assert (=> b!1513034 (=> (not res!1032931) (not e!844464))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513034 (= res!1032931 (validKeyInArray!0 (select (arr!48674 a!2804) i!961)))))

(declare-fun res!1032933 () Bool)

(assert (=> start!129018 (=> (not res!1032933) (not e!844464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129018 (= res!1032933 (validMask!0 mask!2512))))

(assert (=> start!129018 e!844464))

(assert (=> start!129018 true))

(declare-fun array_inv!37702 (array!100874) Bool)

(assert (=> start!129018 (array_inv!37702 a!2804)))

(declare-fun b!1513035 () Bool)

(declare-fun e!844467 () Bool)

(assert (=> b!1513035 (= e!844467 (not true))))

(assert (=> b!1513035 e!844468))

(declare-fun res!1032943 () Bool)

(assert (=> b!1513035 (=> (not res!1032943) (not e!844468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100874 (_ BitVec 32)) Bool)

(assert (=> b!1513035 (= res!1032943 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50558 0))(
  ( (Unit!50559) )
))
(declare-fun lt!655832 () Unit!50558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50558)

(assert (=> b!1513035 (= lt!655832 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun lt!655830 () array!100874)

(declare-fun b!1513036 () Bool)

(assert (=> b!1513036 (= e!844466 (= (seekEntryOrOpen!0 lt!655833 lt!655830 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655833 lt!655830 mask!2512)))))

(declare-fun b!1513037 () Bool)

(declare-fun res!1032937 () Bool)

(assert (=> b!1513037 (=> (not res!1032937) (not e!844464))))

(assert (=> b!1513037 (= res!1032937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513038 () Bool)

(assert (=> b!1513038 (= e!844462 e!844467)))

(declare-fun res!1032939 () Bool)

(assert (=> b!1513038 (=> (not res!1032939) (not e!844467))))

(assert (=> b!1513038 (= res!1032939 (= lt!655834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655833 mask!2512) lt!655833 lt!655830 mask!2512)))))

(assert (=> b!1513038 (= lt!655833 (select (store (arr!48674 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513038 (= lt!655830 (array!100875 (store (arr!48674 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49224 a!2804)))))

(declare-fun b!1513039 () Bool)

(declare-fun res!1032940 () Bool)

(assert (=> b!1513039 (=> (not res!1032940) (not e!844464))))

(assert (=> b!1513039 (= res!1032940 (validKeyInArray!0 (select (arr!48674 a!2804) j!70)))))

(declare-fun b!1513040 () Bool)

(declare-fun res!1032942 () Bool)

(assert (=> b!1513040 (=> (not res!1032942) (not e!844464))))

(assert (=> b!1513040 (= res!1032942 (and (= (size!49224 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49224 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49224 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129018 res!1032933) b!1513040))

(assert (= (and b!1513040 res!1032942) b!1513034))

(assert (= (and b!1513034 res!1032931) b!1513039))

(assert (= (and b!1513039 res!1032940) b!1513037))

(assert (= (and b!1513037 res!1032937) b!1513028))

(assert (= (and b!1513028 res!1032941) b!1513030))

(assert (= (and b!1513030 res!1032930) b!1513033))

(assert (= (and b!1513033 res!1032934) b!1513031))

(assert (= (and b!1513031 res!1032932) b!1513038))

(assert (= (and b!1513038 res!1032939) b!1513035))

(assert (= (and b!1513035 res!1032943) b!1513027))

(assert (= (and b!1513027 res!1032936) b!1513029))

(assert (= (and b!1513029 (not res!1032938)) b!1513032))

(assert (= (and b!1513032 res!1032935) b!1513036))

(declare-fun m!1395847 () Bool)

(assert (=> b!1513033 m!1395847))

(assert (=> b!1513033 m!1395847))

(declare-fun m!1395849 () Bool)

(assert (=> b!1513033 m!1395849))

(assert (=> b!1513033 m!1395849))

(assert (=> b!1513033 m!1395847))

(declare-fun m!1395851 () Bool)

(assert (=> b!1513033 m!1395851))

(declare-fun m!1395853 () Bool)

(assert (=> b!1513038 m!1395853))

(assert (=> b!1513038 m!1395853))

(declare-fun m!1395855 () Bool)

(assert (=> b!1513038 m!1395855))

(declare-fun m!1395857 () Bool)

(assert (=> b!1513038 m!1395857))

(declare-fun m!1395859 () Bool)

(assert (=> b!1513038 m!1395859))

(assert (=> b!1513039 m!1395847))

(assert (=> b!1513039 m!1395847))

(declare-fun m!1395861 () Bool)

(assert (=> b!1513039 m!1395861))

(assert (=> b!1513029 m!1395847))

(declare-fun m!1395863 () Bool)

(assert (=> b!1513029 m!1395863))

(assert (=> b!1513031 m!1395847))

(assert (=> b!1513031 m!1395847))

(declare-fun m!1395865 () Bool)

(assert (=> b!1513031 m!1395865))

(declare-fun m!1395867 () Bool)

(assert (=> b!1513037 m!1395867))

(assert (=> b!1513027 m!1395847))

(assert (=> b!1513027 m!1395847))

(declare-fun m!1395869 () Bool)

(assert (=> b!1513027 m!1395869))

(assert (=> b!1513032 m!1395847))

(assert (=> b!1513032 m!1395847))

(declare-fun m!1395871 () Bool)

(assert (=> b!1513032 m!1395871))

(assert (=> b!1513032 m!1395847))

(declare-fun m!1395873 () Bool)

(assert (=> b!1513032 m!1395873))

(declare-fun m!1395875 () Bool)

(assert (=> start!129018 m!1395875))

(declare-fun m!1395877 () Bool)

(assert (=> start!129018 m!1395877))

(declare-fun m!1395879 () Bool)

(assert (=> b!1513028 m!1395879))

(declare-fun m!1395881 () Bool)

(assert (=> b!1513034 m!1395881))

(assert (=> b!1513034 m!1395881))

(declare-fun m!1395883 () Bool)

(assert (=> b!1513034 m!1395883))

(declare-fun m!1395885 () Bool)

(assert (=> b!1513036 m!1395885))

(declare-fun m!1395887 () Bool)

(assert (=> b!1513036 m!1395887))

(declare-fun m!1395889 () Bool)

(assert (=> b!1513035 m!1395889))

(declare-fun m!1395891 () Bool)

(assert (=> b!1513035 m!1395891))

(push 1)

