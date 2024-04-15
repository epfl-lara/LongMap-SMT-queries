; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130842 () Bool)

(assert start!130842)

(declare-fun b!1534900 () Bool)

(declare-fun e!854531 () Bool)

(declare-fun e!854532 () Bool)

(assert (=> b!1534900 (= e!854531 e!854532)))

(declare-fun res!1052174 () Bool)

(assert (=> b!1534900 (=> (not res!1052174) (not e!854532))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101938 0))(
  ( (array!101939 (arr!49186 (Array (_ BitVec 32) (_ BitVec 64))) (size!49738 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101938)

(declare-fun lt!663728 () (_ BitVec 32))

(assert (=> b!1534900 (= res!1052174 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663728 #b00000000000000000000000000000000) (bvslt lt!663728 (size!49738 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534900 (= lt!663728 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534901 () Bool)

(declare-fun res!1052176 () Bool)

(assert (=> b!1534901 (=> (not res!1052176) (not e!854531))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534901 (= res!1052176 (and (= (size!49738 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49738 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49738 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534902 () Bool)

(declare-fun res!1052177 () Bool)

(assert (=> b!1534902 (=> (not res!1052177) (not e!854531))))

(declare-datatypes ((List!35738 0))(
  ( (Nil!35735) (Cons!35734 (h!37180 (_ BitVec 64)) (t!50424 List!35738)) )
))
(declare-fun arrayNoDuplicates!0 (array!101938 (_ BitVec 32) List!35738) Bool)

(assert (=> b!1534902 (= res!1052177 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35735))))

(declare-fun b!1534903 () Bool)

(declare-fun res!1052175 () Bool)

(assert (=> b!1534903 (=> (not res!1052175) (not e!854531))))

(assert (=> b!1534903 (= res!1052175 (not (= (select (arr!49186 a!2792) index!463) (select (arr!49186 a!2792) j!64))))))

(declare-fun b!1534904 () Bool)

(declare-fun res!1052179 () Bool)

(assert (=> b!1534904 (=> (not res!1052179) (not e!854531))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13343 0))(
  ( (MissingZero!13343 (index!55767 (_ BitVec 32))) (Found!13343 (index!55768 (_ BitVec 32))) (Intermediate!13343 (undefined!14155 Bool) (index!55769 (_ BitVec 32)) (x!137516 (_ BitVec 32))) (Undefined!13343) (MissingVacant!13343 (index!55770 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101938 (_ BitVec 32)) SeekEntryResult!13343)

(assert (=> b!1534904 (= res!1052179 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49186 a!2792) j!64) a!2792 mask!2480) (Found!13343 j!64)))))

(declare-fun b!1534905 () Bool)

(declare-fun res!1052172 () Bool)

(assert (=> b!1534905 (=> (not res!1052172) (not e!854531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101938 (_ BitVec 32)) Bool)

(assert (=> b!1534905 (= res!1052172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534906 () Bool)

(declare-fun res!1052173 () Bool)

(assert (=> b!1534906 (=> (not res!1052173) (not e!854531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534906 (= res!1052173 (validKeyInArray!0 (select (arr!49186 a!2792) i!951)))))

(declare-fun b!1534907 () Bool)

(assert (=> b!1534907 (= e!854532 false)))

(declare-fun lt!663729 () SeekEntryResult!13343)

(assert (=> b!1534907 (= lt!663729 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663728 vacantIndex!5 (select (arr!49186 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534909 () Bool)

(declare-fun res!1052170 () Bool)

(assert (=> b!1534909 (=> (not res!1052170) (not e!854531))))

(assert (=> b!1534909 (= res!1052170 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49738 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49738 a!2792)) (= (select (arr!49186 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534908 () Bool)

(declare-fun res!1052178 () Bool)

(assert (=> b!1534908 (=> (not res!1052178) (not e!854531))))

(assert (=> b!1534908 (= res!1052178 (validKeyInArray!0 (select (arr!49186 a!2792) j!64)))))

(declare-fun res!1052171 () Bool)

(assert (=> start!130842 (=> (not res!1052171) (not e!854531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130842 (= res!1052171 (validMask!0 mask!2480))))

(assert (=> start!130842 e!854531))

(assert (=> start!130842 true))

(declare-fun array_inv!38419 (array!101938) Bool)

(assert (=> start!130842 (array_inv!38419 a!2792)))

(assert (= (and start!130842 res!1052171) b!1534901))

(assert (= (and b!1534901 res!1052176) b!1534906))

(assert (= (and b!1534906 res!1052173) b!1534908))

(assert (= (and b!1534908 res!1052178) b!1534905))

(assert (= (and b!1534905 res!1052172) b!1534902))

(assert (= (and b!1534902 res!1052177) b!1534909))

(assert (= (and b!1534909 res!1052170) b!1534904))

(assert (= (and b!1534904 res!1052179) b!1534903))

(assert (= (and b!1534903 res!1052175) b!1534900))

(assert (= (and b!1534900 res!1052174) b!1534907))

(declare-fun m!1416869 () Bool)

(assert (=> b!1534904 m!1416869))

(assert (=> b!1534904 m!1416869))

(declare-fun m!1416871 () Bool)

(assert (=> b!1534904 m!1416871))

(assert (=> b!1534907 m!1416869))

(assert (=> b!1534907 m!1416869))

(declare-fun m!1416873 () Bool)

(assert (=> b!1534907 m!1416873))

(declare-fun m!1416875 () Bool)

(assert (=> b!1534902 m!1416875))

(declare-fun m!1416877 () Bool)

(assert (=> b!1534900 m!1416877))

(declare-fun m!1416879 () Bool)

(assert (=> b!1534905 m!1416879))

(declare-fun m!1416881 () Bool)

(assert (=> b!1534903 m!1416881))

(assert (=> b!1534903 m!1416869))

(declare-fun m!1416883 () Bool)

(assert (=> start!130842 m!1416883))

(declare-fun m!1416885 () Bool)

(assert (=> start!130842 m!1416885))

(assert (=> b!1534908 m!1416869))

(assert (=> b!1534908 m!1416869))

(declare-fun m!1416887 () Bool)

(assert (=> b!1534908 m!1416887))

(declare-fun m!1416889 () Bool)

(assert (=> b!1534906 m!1416889))

(assert (=> b!1534906 m!1416889))

(declare-fun m!1416891 () Bool)

(assert (=> b!1534906 m!1416891))

(declare-fun m!1416893 () Bool)

(assert (=> b!1534909 m!1416893))

(check-sat (not b!1534902) (not b!1534900) (not b!1534907) (not b!1534908) (not b!1534905) (not start!130842) (not b!1534904) (not b!1534906))
(check-sat)
