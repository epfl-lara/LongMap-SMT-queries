; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130912 () Bool)

(assert start!130912)

(declare-fun b!1535985 () Bool)

(declare-fun res!1053264 () Bool)

(declare-fun e!854920 () Bool)

(assert (=> b!1535985 (=> (not res!1053264) (not e!854920))))

(declare-datatypes ((array!102008 0))(
  ( (array!102009 (arr!49221 (Array (_ BitVec 32) (_ BitVec 64))) (size!49773 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102008)

(declare-datatypes ((List!35773 0))(
  ( (Nil!35770) (Cons!35769 (h!37215 (_ BitVec 64)) (t!50459 List!35773)) )
))
(declare-fun arrayNoDuplicates!0 (array!102008 (_ BitVec 32) List!35773) Bool)

(assert (=> b!1535985 (= res!1053264 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35770))))

(declare-fun b!1535986 () Bool)

(declare-fun res!1053261 () Bool)

(assert (=> b!1535986 (=> (not res!1053261) (not e!854920))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535986 (= res!1053261 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49773 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49773 a!2792)) (= (select (arr!49221 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535987 () Bool)

(declare-fun e!854917 () Bool)

(declare-fun e!854918 () Bool)

(assert (=> b!1535987 (= e!854917 e!854918)))

(declare-fun res!1053259 () Bool)

(assert (=> b!1535987 (=> (not res!1053259) (not e!854918))))

(declare-datatypes ((SeekEntryResult!13378 0))(
  ( (MissingZero!13378 (index!55907 (_ BitVec 32))) (Found!13378 (index!55908 (_ BitVec 32))) (Intermediate!13378 (undefined!14190 Bool) (index!55909 (_ BitVec 32)) (x!137639 (_ BitVec 32))) (Undefined!13378) (MissingVacant!13378 (index!55910 (_ BitVec 32))) )
))
(declare-fun lt!664011 () SeekEntryResult!13378)

(declare-fun lt!664009 () SeekEntryResult!13378)

(assert (=> b!1535987 (= res!1053259 (= lt!664011 lt!664009))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun lt!664008 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102008 (_ BitVec 32)) SeekEntryResult!13378)

(assert (=> b!1535987 (= lt!664011 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664008 vacantIndex!5 (select (arr!49221 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535988 () Bool)

(declare-fun res!1053255 () Bool)

(assert (=> b!1535988 (=> (not res!1053255) (not e!854920))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535988 (= res!1053255 (and (= (size!49773 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49773 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49773 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535989 () Bool)

(declare-fun res!1053263 () Bool)

(assert (=> b!1535989 (=> (not res!1053263) (not e!854920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102008 (_ BitVec 32)) Bool)

(assert (=> b!1535989 (= res!1053263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1053265 () Bool)

(assert (=> start!130912 (=> (not res!1053265) (not e!854920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130912 (= res!1053265 (validMask!0 mask!2480))))

(assert (=> start!130912 e!854920))

(assert (=> start!130912 true))

(declare-fun array_inv!38454 (array!102008) Bool)

(assert (=> start!130912 (array_inv!38454 a!2792)))

(declare-fun b!1535990 () Bool)

(declare-fun e!854916 () Bool)

(assert (=> b!1535990 (= e!854916 e!854917)))

(declare-fun res!1053256 () Bool)

(assert (=> b!1535990 (=> (not res!1053256) (not e!854917))))

(assert (=> b!1535990 (= res!1053256 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664008 #b00000000000000000000000000000000) (bvslt lt!664008 (size!49773 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535990 (= lt!664008 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535991 () Bool)

(declare-fun res!1053257 () Bool)

(assert (=> b!1535991 (=> (not res!1053257) (not e!854920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535991 (= res!1053257 (validKeyInArray!0 (select (arr!49221 a!2792) i!951)))))

(declare-fun b!1535992 () Bool)

(assert (=> b!1535992 (= e!854920 e!854916)))

(declare-fun res!1053258 () Bool)

(assert (=> b!1535992 (=> (not res!1053258) (not e!854916))))

(assert (=> b!1535992 (= res!1053258 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49221 a!2792) j!64) a!2792 mask!2480) lt!664009))))

(assert (=> b!1535992 (= lt!664009 (Found!13378 j!64))))

(declare-fun b!1535993 () Bool)

(declare-fun res!1053260 () Bool)

(assert (=> b!1535993 (=> (not res!1053260) (not e!854916))))

(assert (=> b!1535993 (= res!1053260 (not (= (select (arr!49221 a!2792) index!463) (select (arr!49221 a!2792) j!64))))))

(declare-fun b!1535994 () Bool)

(assert (=> b!1535994 (= e!854918 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(assert (=> b!1535994 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664008 vacantIndex!5 (select (store (arr!49221 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102009 (store (arr!49221 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49773 a!2792)) mask!2480) lt!664011)))

(declare-datatypes ((Unit!51163 0))(
  ( (Unit!51164) )
))
(declare-fun lt!664010 () Unit!51163)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51163)

(assert (=> b!1535994 (= lt!664010 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664008 vacantIndex!5 mask!2480))))

(declare-fun b!1535995 () Bool)

(declare-fun res!1053262 () Bool)

(assert (=> b!1535995 (=> (not res!1053262) (not e!854920))))

(assert (=> b!1535995 (= res!1053262 (validKeyInArray!0 (select (arr!49221 a!2792) j!64)))))

(assert (= (and start!130912 res!1053265) b!1535988))

(assert (= (and b!1535988 res!1053255) b!1535991))

(assert (= (and b!1535991 res!1053257) b!1535995))

(assert (= (and b!1535995 res!1053262) b!1535989))

(assert (= (and b!1535989 res!1053263) b!1535985))

(assert (= (and b!1535985 res!1053264) b!1535986))

(assert (= (and b!1535986 res!1053261) b!1535992))

(assert (= (and b!1535992 res!1053258) b!1535993))

(assert (= (and b!1535993 res!1053260) b!1535990))

(assert (= (and b!1535990 res!1053256) b!1535987))

(assert (= (and b!1535987 res!1053259) b!1535994))

(declare-fun m!1417867 () Bool)

(assert (=> b!1535994 m!1417867))

(declare-fun m!1417869 () Bool)

(assert (=> b!1535994 m!1417869))

(assert (=> b!1535994 m!1417869))

(declare-fun m!1417871 () Bool)

(assert (=> b!1535994 m!1417871))

(declare-fun m!1417873 () Bool)

(assert (=> b!1535994 m!1417873))

(declare-fun m!1417875 () Bool)

(assert (=> b!1535993 m!1417875))

(declare-fun m!1417877 () Bool)

(assert (=> b!1535993 m!1417877))

(assert (=> b!1535992 m!1417877))

(assert (=> b!1535992 m!1417877))

(declare-fun m!1417879 () Bool)

(assert (=> b!1535992 m!1417879))

(declare-fun m!1417881 () Bool)

(assert (=> b!1535991 m!1417881))

(assert (=> b!1535991 m!1417881))

(declare-fun m!1417883 () Bool)

(assert (=> b!1535991 m!1417883))

(assert (=> b!1535995 m!1417877))

(assert (=> b!1535995 m!1417877))

(declare-fun m!1417885 () Bool)

(assert (=> b!1535995 m!1417885))

(assert (=> b!1535987 m!1417877))

(assert (=> b!1535987 m!1417877))

(declare-fun m!1417887 () Bool)

(assert (=> b!1535987 m!1417887))

(declare-fun m!1417889 () Bool)

(assert (=> b!1535990 m!1417889))

(declare-fun m!1417891 () Bool)

(assert (=> b!1535986 m!1417891))

(declare-fun m!1417893 () Bool)

(assert (=> start!130912 m!1417893))

(declare-fun m!1417895 () Bool)

(assert (=> start!130912 m!1417895))

(declare-fun m!1417897 () Bool)

(assert (=> b!1535989 m!1417897))

(declare-fun m!1417899 () Bool)

(assert (=> b!1535985 m!1417899))

(push 1)

(assert (not b!1535989))

(assert (not b!1535991))

(assert (not b!1535995))

(assert (not b!1535990))

(assert (not b!1535987))

(assert (not b!1535994))

(assert (not start!130912))

(assert (not b!1535992))

(assert (not b!1535985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

