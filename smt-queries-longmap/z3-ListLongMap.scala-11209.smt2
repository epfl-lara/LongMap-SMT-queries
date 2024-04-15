; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130836 () Bool)

(assert start!130836)

(declare-fun b!1534810 () Bool)

(declare-fun e!854505 () Bool)

(declare-fun e!854504 () Bool)

(assert (=> b!1534810 (= e!854505 e!854504)))

(declare-fun res!1052085 () Bool)

(assert (=> b!1534810 (=> (not res!1052085) (not e!854504))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101932 0))(
  ( (array!101933 (arr!49183 (Array (_ BitVec 32) (_ BitVec 64))) (size!49735 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101932)

(declare-fun lt!663710 () (_ BitVec 32))

(assert (=> b!1534810 (= res!1052085 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663710 #b00000000000000000000000000000000) (bvslt lt!663710 (size!49735 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534810 (= lt!663710 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534811 () Bool)

(declare-fun res!1052081 () Bool)

(assert (=> b!1534811 (=> (not res!1052081) (not e!854505))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534811 (= res!1052081 (validKeyInArray!0 (select (arr!49183 a!2792) i!951)))))

(declare-fun b!1534812 () Bool)

(declare-fun res!1052088 () Bool)

(assert (=> b!1534812 (=> (not res!1052088) (not e!854505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101932 (_ BitVec 32)) Bool)

(assert (=> b!1534812 (= res!1052088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534813 () Bool)

(declare-fun res!1052084 () Bool)

(assert (=> b!1534813 (=> (not res!1052084) (not e!854505))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1534813 (= res!1052084 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49735 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49735 a!2792)) (= (select (arr!49183 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534814 () Bool)

(declare-fun res!1052083 () Bool)

(assert (=> b!1534814 (=> (not res!1052083) (not e!854505))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534814 (= res!1052083 (validKeyInArray!0 (select (arr!49183 a!2792) j!64)))))

(declare-fun b!1534815 () Bool)

(declare-fun res!1052086 () Bool)

(assert (=> b!1534815 (=> (not res!1052086) (not e!854505))))

(assert (=> b!1534815 (= res!1052086 (not (= (select (arr!49183 a!2792) index!463) (select (arr!49183 a!2792) j!64))))))

(declare-fun b!1534816 () Bool)

(declare-fun res!1052089 () Bool)

(assert (=> b!1534816 (=> (not res!1052089) (not e!854505))))

(assert (=> b!1534816 (= res!1052089 (and (= (size!49735 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49735 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49735 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534817 () Bool)

(assert (=> b!1534817 (= e!854504 false)))

(declare-datatypes ((SeekEntryResult!13340 0))(
  ( (MissingZero!13340 (index!55755 (_ BitVec 32))) (Found!13340 (index!55756 (_ BitVec 32))) (Intermediate!13340 (undefined!14152 Bool) (index!55757 (_ BitVec 32)) (x!137505 (_ BitVec 32))) (Undefined!13340) (MissingVacant!13340 (index!55758 (_ BitVec 32))) )
))
(declare-fun lt!663711 () SeekEntryResult!13340)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101932 (_ BitVec 32)) SeekEntryResult!13340)

(assert (=> b!1534817 (= lt!663711 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663710 vacantIndex!5 (select (arr!49183 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534819 () Bool)

(declare-fun res!1052082 () Bool)

(assert (=> b!1534819 (=> (not res!1052082) (not e!854505))))

(declare-datatypes ((List!35735 0))(
  ( (Nil!35732) (Cons!35731 (h!37177 (_ BitVec 64)) (t!50421 List!35735)) )
))
(declare-fun arrayNoDuplicates!0 (array!101932 (_ BitVec 32) List!35735) Bool)

(assert (=> b!1534819 (= res!1052082 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35732))))

(declare-fun b!1534818 () Bool)

(declare-fun res!1052080 () Bool)

(assert (=> b!1534818 (=> (not res!1052080) (not e!854505))))

(assert (=> b!1534818 (= res!1052080 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49183 a!2792) j!64) a!2792 mask!2480) (Found!13340 j!64)))))

(declare-fun res!1052087 () Bool)

(assert (=> start!130836 (=> (not res!1052087) (not e!854505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130836 (= res!1052087 (validMask!0 mask!2480))))

(assert (=> start!130836 e!854505))

(assert (=> start!130836 true))

(declare-fun array_inv!38416 (array!101932) Bool)

(assert (=> start!130836 (array_inv!38416 a!2792)))

(assert (= (and start!130836 res!1052087) b!1534816))

(assert (= (and b!1534816 res!1052089) b!1534811))

(assert (= (and b!1534811 res!1052081) b!1534814))

(assert (= (and b!1534814 res!1052083) b!1534812))

(assert (= (and b!1534812 res!1052088) b!1534819))

(assert (= (and b!1534819 res!1052082) b!1534813))

(assert (= (and b!1534813 res!1052084) b!1534818))

(assert (= (and b!1534818 res!1052080) b!1534815))

(assert (= (and b!1534815 res!1052086) b!1534810))

(assert (= (and b!1534810 res!1052085) b!1534817))

(declare-fun m!1416791 () Bool)

(assert (=> b!1534818 m!1416791))

(assert (=> b!1534818 m!1416791))

(declare-fun m!1416793 () Bool)

(assert (=> b!1534818 m!1416793))

(assert (=> b!1534817 m!1416791))

(assert (=> b!1534817 m!1416791))

(declare-fun m!1416795 () Bool)

(assert (=> b!1534817 m!1416795))

(assert (=> b!1534814 m!1416791))

(assert (=> b!1534814 m!1416791))

(declare-fun m!1416797 () Bool)

(assert (=> b!1534814 m!1416797))

(declare-fun m!1416799 () Bool)

(assert (=> start!130836 m!1416799))

(declare-fun m!1416801 () Bool)

(assert (=> start!130836 m!1416801))

(declare-fun m!1416803 () Bool)

(assert (=> b!1534819 m!1416803))

(declare-fun m!1416805 () Bool)

(assert (=> b!1534813 m!1416805))

(declare-fun m!1416807 () Bool)

(assert (=> b!1534811 m!1416807))

(assert (=> b!1534811 m!1416807))

(declare-fun m!1416809 () Bool)

(assert (=> b!1534811 m!1416809))

(declare-fun m!1416811 () Bool)

(assert (=> b!1534812 m!1416811))

(declare-fun m!1416813 () Bool)

(assert (=> b!1534810 m!1416813))

(declare-fun m!1416815 () Bool)

(assert (=> b!1534815 m!1416815))

(assert (=> b!1534815 m!1416791))

(check-sat (not b!1534812) (not start!130836) (not b!1534814) (not b!1534819) (not b!1534817) (not b!1534810) (not b!1534811) (not b!1534818))
(check-sat)
