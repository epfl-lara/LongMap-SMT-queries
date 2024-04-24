; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120176 () Bool)

(assert start!120176)

(declare-fun b!1397938 () Bool)

(declare-fun res!936171 () Bool)

(declare-fun e!791514 () Bool)

(assert (=> b!1397938 (=> (not res!936171) (not e!791514))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95627 0))(
  ( (array!95628 (arr!46165 (Array (_ BitVec 32) (_ BitVec 64))) (size!46716 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95627)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397938 (= res!936171 (and (= (size!46716 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46716 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46716 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397939 () Bool)

(declare-fun e!791515 () Bool)

(assert (=> b!1397939 (= e!791514 (not e!791515))))

(declare-fun res!936175 () Bool)

(assert (=> b!1397939 (=> res!936175 e!791515)))

(declare-datatypes ((SeekEntryResult!10385 0))(
  ( (MissingZero!10385 (index!43911 (_ BitVec 32))) (Found!10385 (index!43912 (_ BitVec 32))) (Intermediate!10385 (undefined!11197 Bool) (index!43913 (_ BitVec 32)) (x!125730 (_ BitVec 32))) (Undefined!10385) (MissingVacant!10385 (index!43914 (_ BitVec 32))) )
))
(declare-fun lt!614107 () SeekEntryResult!10385)

(get-info :version)

(assert (=> b!1397939 (= res!936175 (or (not ((_ is Intermediate!10385) lt!614107)) (undefined!11197 lt!614107)))))

(declare-fun e!791516 () Bool)

(assert (=> b!1397939 e!791516))

(declare-fun res!936169 () Bool)

(assert (=> b!1397939 (=> (not res!936169) (not e!791516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95627 (_ BitVec 32)) Bool)

(assert (=> b!1397939 (= res!936169 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46801 0))(
  ( (Unit!46802) )
))
(declare-fun lt!614108 () Unit!46801)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46801)

(assert (=> b!1397939 (= lt!614108 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614104 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95627 (_ BitVec 32)) SeekEntryResult!10385)

(assert (=> b!1397939 (= lt!614107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614104 (select (arr!46165 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397939 (= lt!614104 (toIndex!0 (select (arr!46165 a!2901) j!112) mask!2840))))

(declare-fun b!1397940 () Bool)

(declare-fun res!936172 () Bool)

(assert (=> b!1397940 (=> (not res!936172) (not e!791514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397940 (= res!936172 (validKeyInArray!0 (select (arr!46165 a!2901) i!1037)))))

(declare-fun b!1397941 () Bool)

(declare-fun e!791513 () Bool)

(assert (=> b!1397941 (= e!791513 true)))

(declare-fun lt!614102 () array!95627)

(declare-fun lt!614103 () SeekEntryResult!10385)

(declare-fun lt!614105 () (_ BitVec 64))

(assert (=> b!1397941 (= lt!614103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614104 lt!614105 lt!614102 mask!2840))))

(declare-fun res!936168 () Bool)

(assert (=> start!120176 (=> (not res!936168) (not e!791514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120176 (= res!936168 (validMask!0 mask!2840))))

(assert (=> start!120176 e!791514))

(assert (=> start!120176 true))

(declare-fun array_inv!35446 (array!95627) Bool)

(assert (=> start!120176 (array_inv!35446 a!2901)))

(declare-fun b!1397942 () Bool)

(assert (=> b!1397942 (= e!791515 e!791513)))

(declare-fun res!936167 () Bool)

(assert (=> b!1397942 (=> res!936167 e!791513)))

(declare-fun lt!614106 () SeekEntryResult!10385)

(assert (=> b!1397942 (= res!936167 (or (= lt!614107 lt!614106) (not ((_ is Intermediate!10385) lt!614106)) (bvslt (x!125730 lt!614107) #b00000000000000000000000000000000) (bvsgt (x!125730 lt!614107) #b01111111111111111111111111111110) (bvslt lt!614104 #b00000000000000000000000000000000) (bvsge lt!614104 (size!46716 a!2901)) (bvslt (index!43913 lt!614107) #b00000000000000000000000000000000) (bvsge (index!43913 lt!614107) (size!46716 a!2901)) (not (= lt!614107 (Intermediate!10385 false (index!43913 lt!614107) (x!125730 lt!614107)))) (not (= lt!614106 (Intermediate!10385 (undefined!11197 lt!614106) (index!43913 lt!614106) (x!125730 lt!614106))))))))

(assert (=> b!1397942 (= lt!614106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614105 mask!2840) lt!614105 lt!614102 mask!2840))))

(assert (=> b!1397942 (= lt!614105 (select (store (arr!46165 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397942 (= lt!614102 (array!95628 (store (arr!46165 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46716 a!2901)))))

(declare-fun b!1397943 () Bool)

(declare-fun res!936170 () Bool)

(assert (=> b!1397943 (=> (not res!936170) (not e!791514))))

(declare-datatypes ((List!32671 0))(
  ( (Nil!32668) (Cons!32667 (h!33917 (_ BitVec 64)) (t!47357 List!32671)) )
))
(declare-fun arrayNoDuplicates!0 (array!95627 (_ BitVec 32) List!32671) Bool)

(assert (=> b!1397943 (= res!936170 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32668))))

(declare-fun b!1397944 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95627 (_ BitVec 32)) SeekEntryResult!10385)

(assert (=> b!1397944 (= e!791516 (= (seekEntryOrOpen!0 (select (arr!46165 a!2901) j!112) a!2901 mask!2840) (Found!10385 j!112)))))

(declare-fun b!1397945 () Bool)

(declare-fun res!936173 () Bool)

(assert (=> b!1397945 (=> (not res!936173) (not e!791514))))

(assert (=> b!1397945 (= res!936173 (validKeyInArray!0 (select (arr!46165 a!2901) j!112)))))

(declare-fun b!1397946 () Bool)

(declare-fun res!936174 () Bool)

(assert (=> b!1397946 (=> (not res!936174) (not e!791514))))

(assert (=> b!1397946 (= res!936174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120176 res!936168) b!1397938))

(assert (= (and b!1397938 res!936171) b!1397940))

(assert (= (and b!1397940 res!936172) b!1397945))

(assert (= (and b!1397945 res!936173) b!1397946))

(assert (= (and b!1397946 res!936174) b!1397943))

(assert (= (and b!1397943 res!936170) b!1397939))

(assert (= (and b!1397939 res!936169) b!1397944))

(assert (= (and b!1397939 (not res!936175)) b!1397942))

(assert (= (and b!1397942 (not res!936167)) b!1397941))

(declare-fun m!1284727 () Bool)

(assert (=> b!1397943 m!1284727))

(declare-fun m!1284729 () Bool)

(assert (=> b!1397945 m!1284729))

(assert (=> b!1397945 m!1284729))

(declare-fun m!1284731 () Bool)

(assert (=> b!1397945 m!1284731))

(declare-fun m!1284733 () Bool)

(assert (=> start!120176 m!1284733))

(declare-fun m!1284735 () Bool)

(assert (=> start!120176 m!1284735))

(assert (=> b!1397939 m!1284729))

(declare-fun m!1284737 () Bool)

(assert (=> b!1397939 m!1284737))

(assert (=> b!1397939 m!1284729))

(assert (=> b!1397939 m!1284729))

(declare-fun m!1284739 () Bool)

(assert (=> b!1397939 m!1284739))

(declare-fun m!1284741 () Bool)

(assert (=> b!1397939 m!1284741))

(declare-fun m!1284743 () Bool)

(assert (=> b!1397939 m!1284743))

(declare-fun m!1284745 () Bool)

(assert (=> b!1397941 m!1284745))

(declare-fun m!1284747 () Bool)

(assert (=> b!1397942 m!1284747))

(assert (=> b!1397942 m!1284747))

(declare-fun m!1284749 () Bool)

(assert (=> b!1397942 m!1284749))

(declare-fun m!1284751 () Bool)

(assert (=> b!1397942 m!1284751))

(declare-fun m!1284753 () Bool)

(assert (=> b!1397942 m!1284753))

(declare-fun m!1284755 () Bool)

(assert (=> b!1397946 m!1284755))

(assert (=> b!1397944 m!1284729))

(assert (=> b!1397944 m!1284729))

(declare-fun m!1284757 () Bool)

(assert (=> b!1397944 m!1284757))

(declare-fun m!1284759 () Bool)

(assert (=> b!1397940 m!1284759))

(assert (=> b!1397940 m!1284759))

(declare-fun m!1284761 () Bool)

(assert (=> b!1397940 m!1284761))

(check-sat (not b!1397942) (not b!1397939) (not b!1397941) (not start!120176) (not b!1397940) (not b!1397944) (not b!1397945) (not b!1397946) (not b!1397943))
(check-sat)
