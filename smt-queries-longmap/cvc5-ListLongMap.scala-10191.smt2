; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120072 () Bool)

(assert start!120072)

(declare-fun b!1397932 () Bool)

(declare-fun res!936852 () Bool)

(declare-fun e!791404 () Bool)

(assert (=> b!1397932 (=> (not res!936852) (not e!791404))))

(declare-datatypes ((array!95601 0))(
  ( (array!95602 (arr!46154 (Array (_ BitVec 32) (_ BitVec 64))) (size!46704 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95601)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95601 (_ BitVec 32)) Bool)

(assert (=> b!1397932 (= res!936852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397933 () Bool)

(declare-fun res!936847 () Bool)

(assert (=> b!1397933 (=> (not res!936847) (not e!791404))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397933 (= res!936847 (and (= (size!46704 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46704 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46704 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397934 () Bool)

(declare-fun e!791408 () Bool)

(assert (=> b!1397934 (= e!791404 (not e!791408))))

(declare-fun res!936848 () Bool)

(assert (=> b!1397934 (=> res!936848 e!791408)))

(declare-datatypes ((SeekEntryResult!10471 0))(
  ( (MissingZero!10471 (index!44255 (_ BitVec 32))) (Found!10471 (index!44256 (_ BitVec 32))) (Intermediate!10471 (undefined!11283 Bool) (index!44257 (_ BitVec 32)) (x!125909 (_ BitVec 32))) (Undefined!10471) (MissingVacant!10471 (index!44258 (_ BitVec 32))) )
))
(declare-fun lt!614592 () SeekEntryResult!10471)

(assert (=> b!1397934 (= res!936848 (or (not (is-Intermediate!10471 lt!614592)) (undefined!11283 lt!614592)))))

(declare-fun e!791406 () Bool)

(assert (=> b!1397934 e!791406))

(declare-fun res!936850 () Bool)

(assert (=> b!1397934 (=> (not res!936850) (not e!791406))))

(assert (=> b!1397934 (= res!936850 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46946 0))(
  ( (Unit!46947) )
))
(declare-fun lt!614588 () Unit!46946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46946)

(assert (=> b!1397934 (= lt!614588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614591 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95601 (_ BitVec 32)) SeekEntryResult!10471)

(assert (=> b!1397934 (= lt!614592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614591 (select (arr!46154 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397934 (= lt!614591 (toIndex!0 (select (arr!46154 a!2901) j!112) mask!2840))))

(declare-fun b!1397935 () Bool)

(declare-fun e!791407 () Bool)

(assert (=> b!1397935 (= e!791408 e!791407)))

(declare-fun res!936853 () Bool)

(assert (=> b!1397935 (=> res!936853 e!791407)))

(declare-fun lt!614590 () SeekEntryResult!10471)

(assert (=> b!1397935 (= res!936853 (or (= lt!614592 lt!614590) (not (is-Intermediate!10471 lt!614590)) (bvslt (x!125909 lt!614592) #b00000000000000000000000000000000) (bvsgt (x!125909 lt!614592) #b01111111111111111111111111111110) (bvslt lt!614591 #b00000000000000000000000000000000) (bvsge lt!614591 (size!46704 a!2901)) (bvslt (index!44257 lt!614592) #b00000000000000000000000000000000) (bvsge (index!44257 lt!614592) (size!46704 a!2901)) (not (= lt!614592 (Intermediate!10471 false (index!44257 lt!614592) (x!125909 lt!614592)))) (not (= lt!614590 (Intermediate!10471 (undefined!11283 lt!614590) (index!44257 lt!614590) (x!125909 lt!614590))))))))

(declare-fun lt!614589 () (_ BitVec 64))

(declare-fun lt!614586 () array!95601)

(assert (=> b!1397935 (= lt!614590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614589 mask!2840) lt!614589 lt!614586 mask!2840))))

(assert (=> b!1397935 (= lt!614589 (select (store (arr!46154 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397935 (= lt!614586 (array!95602 (store (arr!46154 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46704 a!2901)))))

(declare-fun res!936846 () Bool)

(assert (=> start!120072 (=> (not res!936846) (not e!791404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120072 (= res!936846 (validMask!0 mask!2840))))

(assert (=> start!120072 e!791404))

(assert (=> start!120072 true))

(declare-fun array_inv!35182 (array!95601) Bool)

(assert (=> start!120072 (array_inv!35182 a!2901)))

(declare-fun b!1397936 () Bool)

(declare-fun res!936851 () Bool)

(assert (=> b!1397936 (=> (not res!936851) (not e!791404))))

(declare-datatypes ((List!32673 0))(
  ( (Nil!32670) (Cons!32669 (h!33911 (_ BitVec 64)) (t!47367 List!32673)) )
))
(declare-fun arrayNoDuplicates!0 (array!95601 (_ BitVec 32) List!32673) Bool)

(assert (=> b!1397936 (= res!936851 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32670))))

(declare-fun b!1397937 () Bool)

(declare-fun res!936845 () Bool)

(assert (=> b!1397937 (=> (not res!936845) (not e!791404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397937 (= res!936845 (validKeyInArray!0 (select (arr!46154 a!2901) i!1037)))))

(declare-fun b!1397938 () Bool)

(assert (=> b!1397938 (= e!791407 true)))

(declare-fun lt!614587 () SeekEntryResult!10471)

(assert (=> b!1397938 (= lt!614587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614591 lt!614589 lt!614586 mask!2840))))

(declare-fun b!1397939 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95601 (_ BitVec 32)) SeekEntryResult!10471)

(assert (=> b!1397939 (= e!791406 (= (seekEntryOrOpen!0 (select (arr!46154 a!2901) j!112) a!2901 mask!2840) (Found!10471 j!112)))))

(declare-fun b!1397940 () Bool)

(declare-fun res!936849 () Bool)

(assert (=> b!1397940 (=> (not res!936849) (not e!791404))))

(assert (=> b!1397940 (= res!936849 (validKeyInArray!0 (select (arr!46154 a!2901) j!112)))))

(assert (= (and start!120072 res!936846) b!1397933))

(assert (= (and b!1397933 res!936847) b!1397937))

(assert (= (and b!1397937 res!936845) b!1397940))

(assert (= (and b!1397940 res!936849) b!1397932))

(assert (= (and b!1397932 res!936852) b!1397936))

(assert (= (and b!1397936 res!936851) b!1397934))

(assert (= (and b!1397934 res!936850) b!1397939))

(assert (= (and b!1397934 (not res!936848)) b!1397935))

(assert (= (and b!1397935 (not res!936853)) b!1397938))

(declare-fun m!1284867 () Bool)

(assert (=> b!1397934 m!1284867))

(declare-fun m!1284869 () Bool)

(assert (=> b!1397934 m!1284869))

(assert (=> b!1397934 m!1284867))

(declare-fun m!1284871 () Bool)

(assert (=> b!1397934 m!1284871))

(declare-fun m!1284873 () Bool)

(assert (=> b!1397934 m!1284873))

(assert (=> b!1397934 m!1284867))

(declare-fun m!1284875 () Bool)

(assert (=> b!1397934 m!1284875))

(declare-fun m!1284877 () Bool)

(assert (=> b!1397938 m!1284877))

(declare-fun m!1284879 () Bool)

(assert (=> b!1397936 m!1284879))

(assert (=> b!1397939 m!1284867))

(assert (=> b!1397939 m!1284867))

(declare-fun m!1284881 () Bool)

(assert (=> b!1397939 m!1284881))

(declare-fun m!1284883 () Bool)

(assert (=> b!1397935 m!1284883))

(assert (=> b!1397935 m!1284883))

(declare-fun m!1284885 () Bool)

(assert (=> b!1397935 m!1284885))

(declare-fun m!1284887 () Bool)

(assert (=> b!1397935 m!1284887))

(declare-fun m!1284889 () Bool)

(assert (=> b!1397935 m!1284889))

(declare-fun m!1284891 () Bool)

(assert (=> b!1397932 m!1284891))

(assert (=> b!1397940 m!1284867))

(assert (=> b!1397940 m!1284867))

(declare-fun m!1284893 () Bool)

(assert (=> b!1397940 m!1284893))

(declare-fun m!1284895 () Bool)

(assert (=> b!1397937 m!1284895))

(assert (=> b!1397937 m!1284895))

(declare-fun m!1284897 () Bool)

(assert (=> b!1397937 m!1284897))

(declare-fun m!1284899 () Bool)

(assert (=> start!120072 m!1284899))

(declare-fun m!1284901 () Bool)

(assert (=> start!120072 m!1284901))

(push 1)

