; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120510 () Bool)

(assert start!120510)

(declare-fun b!1403246 () Bool)

(declare-fun res!941758 () Bool)

(declare-fun e!794546 () Bool)

(assert (=> b!1403246 (=> (not res!941758) (not e!794546))))

(declare-datatypes ((array!95919 0))(
  ( (array!95920 (arr!46310 (Array (_ BitVec 32) (_ BitVec 64))) (size!46860 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95919)

(declare-datatypes ((List!32829 0))(
  ( (Nil!32826) (Cons!32825 (h!34073 (_ BitVec 64)) (t!47523 List!32829)) )
))
(declare-fun arrayNoDuplicates!0 (array!95919 (_ BitVec 32) List!32829) Bool)

(assert (=> b!1403246 (= res!941758 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32826))))

(declare-fun b!1403247 () Bool)

(declare-fun res!941763 () Bool)

(assert (=> b!1403247 (=> (not res!941763) (not e!794546))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403247 (= res!941763 (validKeyInArray!0 (select (arr!46310 a!2901) i!1037)))))

(declare-fun b!1403248 () Bool)

(declare-fun res!941757 () Bool)

(assert (=> b!1403248 (=> (not res!941757) (not e!794546))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95919 (_ BitVec 32)) Bool)

(assert (=> b!1403248 (= res!941757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!941762 () Bool)

(assert (=> start!120510 (=> (not res!941762) (not e!794546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120510 (= res!941762 (validMask!0 mask!2840))))

(assert (=> start!120510 e!794546))

(assert (=> start!120510 true))

(declare-fun array_inv!35338 (array!95919) Bool)

(assert (=> start!120510 (array_inv!35338 a!2901)))

(declare-fun b!1403249 () Bool)

(declare-fun e!794548 () Bool)

(assert (=> b!1403249 (= e!794546 (not e!794548))))

(declare-fun res!941764 () Bool)

(assert (=> b!1403249 (=> res!941764 e!794548)))

(declare-datatypes ((SeekEntryResult!10627 0))(
  ( (MissingZero!10627 (index!44885 (_ BitVec 32))) (Found!10627 (index!44886 (_ BitVec 32))) (Intermediate!10627 (undefined!11439 Bool) (index!44887 (_ BitVec 32)) (x!126502 (_ BitVec 32))) (Undefined!10627) (MissingVacant!10627 (index!44888 (_ BitVec 32))) )
))
(declare-fun lt!618329 () SeekEntryResult!10627)

(assert (=> b!1403249 (= res!941764 (or (not (is-Intermediate!10627 lt!618329)) (undefined!11439 lt!618329)))))

(declare-fun e!794547 () Bool)

(assert (=> b!1403249 e!794547))

(declare-fun res!941761 () Bool)

(assert (=> b!1403249 (=> (not res!941761) (not e!794547))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403249 (= res!941761 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47258 0))(
  ( (Unit!47259) )
))
(declare-fun lt!618330 () Unit!47258)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47258)

(assert (=> b!1403249 (= lt!618330 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95919 (_ BitVec 32)) SeekEntryResult!10627)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403249 (= lt!618329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46310 a!2901) j!112) mask!2840) (select (arr!46310 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403250 () Bool)

(declare-fun res!941759 () Bool)

(assert (=> b!1403250 (=> (not res!941759) (not e!794546))))

(assert (=> b!1403250 (= res!941759 (validKeyInArray!0 (select (arr!46310 a!2901) j!112)))))

(declare-fun b!1403251 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95919 (_ BitVec 32)) SeekEntryResult!10627)

(assert (=> b!1403251 (= e!794547 (= (seekEntryOrOpen!0 (select (arr!46310 a!2901) j!112) a!2901 mask!2840) (Found!10627 j!112)))))

(declare-fun b!1403252 () Bool)

(declare-fun res!941760 () Bool)

(assert (=> b!1403252 (=> (not res!941760) (not e!794546))))

(assert (=> b!1403252 (= res!941760 (and (= (size!46860 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46860 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46860 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403253 () Bool)

(assert (=> b!1403253 (= e!794548 true)))

(declare-fun lt!618328 () SeekEntryResult!10627)

(assert (=> b!1403253 (= lt!618328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46310 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46310 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95920 (store (arr!46310 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46860 a!2901)) mask!2840))))

(assert (= (and start!120510 res!941762) b!1403252))

(assert (= (and b!1403252 res!941760) b!1403247))

(assert (= (and b!1403247 res!941763) b!1403250))

(assert (= (and b!1403250 res!941759) b!1403248))

(assert (= (and b!1403248 res!941757) b!1403246))

(assert (= (and b!1403246 res!941758) b!1403249))

(assert (= (and b!1403249 res!941761) b!1403251))

(assert (= (and b!1403249 (not res!941764)) b!1403253))

(declare-fun m!1291803 () Bool)

(assert (=> b!1403248 m!1291803))

(declare-fun m!1291805 () Bool)

(assert (=> b!1403250 m!1291805))

(assert (=> b!1403250 m!1291805))

(declare-fun m!1291807 () Bool)

(assert (=> b!1403250 m!1291807))

(assert (=> b!1403249 m!1291805))

(declare-fun m!1291809 () Bool)

(assert (=> b!1403249 m!1291809))

(assert (=> b!1403249 m!1291805))

(declare-fun m!1291811 () Bool)

(assert (=> b!1403249 m!1291811))

(assert (=> b!1403249 m!1291809))

(assert (=> b!1403249 m!1291805))

(declare-fun m!1291813 () Bool)

(assert (=> b!1403249 m!1291813))

(declare-fun m!1291815 () Bool)

(assert (=> b!1403249 m!1291815))

(declare-fun m!1291817 () Bool)

(assert (=> b!1403246 m!1291817))

(declare-fun m!1291819 () Bool)

(assert (=> b!1403253 m!1291819))

(declare-fun m!1291821 () Bool)

(assert (=> b!1403253 m!1291821))

(assert (=> b!1403253 m!1291821))

(declare-fun m!1291823 () Bool)

(assert (=> b!1403253 m!1291823))

(assert (=> b!1403253 m!1291823))

(assert (=> b!1403253 m!1291821))

(declare-fun m!1291825 () Bool)

(assert (=> b!1403253 m!1291825))

(assert (=> b!1403251 m!1291805))

(assert (=> b!1403251 m!1291805))

(declare-fun m!1291827 () Bool)

(assert (=> b!1403251 m!1291827))

(declare-fun m!1291829 () Bool)

(assert (=> start!120510 m!1291829))

(declare-fun m!1291831 () Bool)

(assert (=> start!120510 m!1291831))

(declare-fun m!1291833 () Bool)

(assert (=> b!1403247 m!1291833))

(assert (=> b!1403247 m!1291833))

(declare-fun m!1291835 () Bool)

(assert (=> b!1403247 m!1291835))

(push 1)

(assert (not start!120510))

(assert (not b!1403253))

(assert (not b!1403248))

(assert (not b!1403250))

(assert (not b!1403247))

(assert (not b!1403251))

(assert (not b!1403249))

(assert (not b!1403246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

