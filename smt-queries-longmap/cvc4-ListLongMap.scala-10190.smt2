; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120070 () Bool)

(assert start!120070)

(declare-fun b!1397905 () Bool)

(declare-fun e!791390 () Bool)

(declare-fun e!791391 () Bool)

(assert (=> b!1397905 (= e!791390 e!791391)))

(declare-fun res!936821 () Bool)

(assert (=> b!1397905 (=> res!936821 e!791391)))

(declare-datatypes ((SeekEntryResult!10470 0))(
  ( (MissingZero!10470 (index!44251 (_ BitVec 32))) (Found!10470 (index!44252 (_ BitVec 32))) (Intermediate!10470 (undefined!11282 Bool) (index!44253 (_ BitVec 32)) (x!125900 (_ BitVec 32))) (Undefined!10470) (MissingVacant!10470 (index!44254 (_ BitVec 32))) )
))
(declare-fun lt!614565 () SeekEntryResult!10470)

(declare-datatypes ((array!95599 0))(
  ( (array!95600 (arr!46153 (Array (_ BitVec 32) (_ BitVec 64))) (size!46703 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95599)

(declare-fun lt!614567 () (_ BitVec 32))

(declare-fun lt!614566 () SeekEntryResult!10470)

(assert (=> b!1397905 (= res!936821 (or (= lt!614566 lt!614565) (not (is-Intermediate!10470 lt!614565)) (bvslt (x!125900 lt!614566) #b00000000000000000000000000000000) (bvsgt (x!125900 lt!614566) #b01111111111111111111111111111110) (bvslt lt!614567 #b00000000000000000000000000000000) (bvsge lt!614567 (size!46703 a!2901)) (bvslt (index!44253 lt!614566) #b00000000000000000000000000000000) (bvsge (index!44253 lt!614566) (size!46703 a!2901)) (not (= lt!614566 (Intermediate!10470 false (index!44253 lt!614566) (x!125900 lt!614566)))) (not (= lt!614565 (Intermediate!10470 (undefined!11282 lt!614565) (index!44253 lt!614565) (x!125900 lt!614565))))))))

(declare-fun lt!614570 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!614569 () array!95599)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95599 (_ BitVec 32)) SeekEntryResult!10470)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397905 (= lt!614565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614570 mask!2840) lt!614570 lt!614569 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397905 (= lt!614570 (select (store (arr!46153 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397905 (= lt!614569 (array!95600 (store (arr!46153 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46703 a!2901)))))

(declare-fun res!936819 () Bool)

(declare-fun e!791389 () Bool)

(assert (=> start!120070 (=> (not res!936819) (not e!791389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120070 (= res!936819 (validMask!0 mask!2840))))

(assert (=> start!120070 e!791389))

(assert (=> start!120070 true))

(declare-fun array_inv!35181 (array!95599) Bool)

(assert (=> start!120070 (array_inv!35181 a!2901)))

(declare-fun b!1397906 () Bool)

(declare-fun res!936825 () Bool)

(assert (=> b!1397906 (=> (not res!936825) (not e!791389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95599 (_ BitVec 32)) Bool)

(assert (=> b!1397906 (= res!936825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397907 () Bool)

(declare-fun res!936818 () Bool)

(assert (=> b!1397907 (=> (not res!936818) (not e!791389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397907 (= res!936818 (validKeyInArray!0 (select (arr!46153 a!2901) j!112)))))

(declare-fun b!1397908 () Bool)

(assert (=> b!1397908 (= e!791391 true)))

(declare-fun lt!614571 () SeekEntryResult!10470)

(assert (=> b!1397908 (= lt!614571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614567 lt!614570 lt!614569 mask!2840))))

(declare-fun b!1397909 () Bool)

(declare-fun res!936824 () Bool)

(assert (=> b!1397909 (=> (not res!936824) (not e!791389))))

(declare-datatypes ((List!32672 0))(
  ( (Nil!32669) (Cons!32668 (h!33910 (_ BitVec 64)) (t!47366 List!32672)) )
))
(declare-fun arrayNoDuplicates!0 (array!95599 (_ BitVec 32) List!32672) Bool)

(assert (=> b!1397909 (= res!936824 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32669))))

(declare-fun b!1397910 () Bool)

(assert (=> b!1397910 (= e!791389 (not e!791390))))

(declare-fun res!936822 () Bool)

(assert (=> b!1397910 (=> res!936822 e!791390)))

(assert (=> b!1397910 (= res!936822 (or (not (is-Intermediate!10470 lt!614566)) (undefined!11282 lt!614566)))))

(declare-fun e!791393 () Bool)

(assert (=> b!1397910 e!791393))

(declare-fun res!936823 () Bool)

(assert (=> b!1397910 (=> (not res!936823) (not e!791393))))

(assert (=> b!1397910 (= res!936823 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46944 0))(
  ( (Unit!46945) )
))
(declare-fun lt!614568 () Unit!46944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46944)

(assert (=> b!1397910 (= lt!614568 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397910 (= lt!614566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614567 (select (arr!46153 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397910 (= lt!614567 (toIndex!0 (select (arr!46153 a!2901) j!112) mask!2840))))

(declare-fun b!1397911 () Bool)

(declare-fun res!936826 () Bool)

(assert (=> b!1397911 (=> (not res!936826) (not e!791389))))

(assert (=> b!1397911 (= res!936826 (validKeyInArray!0 (select (arr!46153 a!2901) i!1037)))))

(declare-fun b!1397912 () Bool)

(declare-fun res!936820 () Bool)

(assert (=> b!1397912 (=> (not res!936820) (not e!791389))))

(assert (=> b!1397912 (= res!936820 (and (= (size!46703 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46703 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46703 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397913 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95599 (_ BitVec 32)) SeekEntryResult!10470)

(assert (=> b!1397913 (= e!791393 (= (seekEntryOrOpen!0 (select (arr!46153 a!2901) j!112) a!2901 mask!2840) (Found!10470 j!112)))))

(assert (= (and start!120070 res!936819) b!1397912))

(assert (= (and b!1397912 res!936820) b!1397911))

(assert (= (and b!1397911 res!936826) b!1397907))

(assert (= (and b!1397907 res!936818) b!1397906))

(assert (= (and b!1397906 res!936825) b!1397909))

(assert (= (and b!1397909 res!936824) b!1397910))

(assert (= (and b!1397910 res!936823) b!1397913))

(assert (= (and b!1397910 (not res!936822)) b!1397905))

(assert (= (and b!1397905 (not res!936821)) b!1397908))

(declare-fun m!1284831 () Bool)

(assert (=> b!1397909 m!1284831))

(declare-fun m!1284833 () Bool)

(assert (=> start!120070 m!1284833))

(declare-fun m!1284835 () Bool)

(assert (=> start!120070 m!1284835))

(declare-fun m!1284837 () Bool)

(assert (=> b!1397908 m!1284837))

(declare-fun m!1284839 () Bool)

(assert (=> b!1397906 m!1284839))

(declare-fun m!1284841 () Bool)

(assert (=> b!1397910 m!1284841))

(declare-fun m!1284843 () Bool)

(assert (=> b!1397910 m!1284843))

(assert (=> b!1397910 m!1284841))

(assert (=> b!1397910 m!1284841))

(declare-fun m!1284845 () Bool)

(assert (=> b!1397910 m!1284845))

(declare-fun m!1284847 () Bool)

(assert (=> b!1397910 m!1284847))

(declare-fun m!1284849 () Bool)

(assert (=> b!1397910 m!1284849))

(declare-fun m!1284851 () Bool)

(assert (=> b!1397911 m!1284851))

(assert (=> b!1397911 m!1284851))

(declare-fun m!1284853 () Bool)

(assert (=> b!1397911 m!1284853))

(declare-fun m!1284855 () Bool)

(assert (=> b!1397905 m!1284855))

(assert (=> b!1397905 m!1284855))

(declare-fun m!1284857 () Bool)

(assert (=> b!1397905 m!1284857))

(declare-fun m!1284859 () Bool)

(assert (=> b!1397905 m!1284859))

(declare-fun m!1284861 () Bool)

(assert (=> b!1397905 m!1284861))

(assert (=> b!1397913 m!1284841))

(assert (=> b!1397913 m!1284841))

(declare-fun m!1284863 () Bool)

(assert (=> b!1397913 m!1284863))

(assert (=> b!1397907 m!1284841))

(assert (=> b!1397907 m!1284841))

(declare-fun m!1284865 () Bool)

(assert (=> b!1397907 m!1284865))

(push 1)

