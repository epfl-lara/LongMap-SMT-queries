; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122996 () Bool)

(assert start!122996)

(declare-fun b!1424184 () Bool)

(declare-fun res!958740 () Bool)

(declare-fun e!805199 () Bool)

(assert (=> b!1424184 (=> (not res!958740) (not e!805199))))

(declare-datatypes ((array!97232 0))(
  ( (array!97233 (arr!46930 (Array (_ BitVec 32) (_ BitVec 64))) (size!47481 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97232)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424184 (= res!958740 (validKeyInArray!0 (select (arr!46930 a!2831) j!81)))))

(declare-fun b!1424185 () Bool)

(declare-fun res!958743 () Bool)

(declare-fun e!805196 () Bool)

(assert (=> b!1424185 (=> res!958743 e!805196)))

(declare-datatypes ((SeekEntryResult!11117 0))(
  ( (MissingZero!11117 (index!46860 (_ BitVec 32))) (Found!11117 (index!46861 (_ BitVec 32))) (Intermediate!11117 (undefined!11929 Bool) (index!46862 (_ BitVec 32)) (x!128664 (_ BitVec 32))) (Undefined!11117) (MissingVacant!11117 (index!46863 (_ BitVec 32))) )
))
(declare-fun lt!627340 () SeekEntryResult!11117)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627336 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97232 (_ BitVec 32)) SeekEntryResult!11117)

(assert (=> b!1424185 (= res!958743 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627336 (select (arr!46930 a!2831) j!81) a!2831 mask!2608) lt!627340)))))

(declare-fun b!1424186 () Bool)

(declare-fun e!805198 () Bool)

(assert (=> b!1424186 (= e!805199 e!805198)))

(declare-fun res!958738 () Bool)

(assert (=> b!1424186 (=> (not res!958738) (not e!805198))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424186 (= res!958738 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46930 a!2831) j!81) mask!2608) (select (arr!46930 a!2831) j!81) a!2831 mask!2608) lt!627340))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424186 (= lt!627340 (Intermediate!11117 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424187 () Bool)

(declare-fun e!805197 () Bool)

(assert (=> b!1424187 (= e!805198 e!805197)))

(declare-fun res!958736 () Bool)

(assert (=> b!1424187 (=> (not res!958736) (not e!805197))))

(declare-fun lt!627339 () array!97232)

(declare-fun lt!627335 () (_ BitVec 64))

(declare-fun lt!627337 () SeekEntryResult!11117)

(assert (=> b!1424187 (= res!958736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627335 mask!2608) lt!627335 lt!627339 mask!2608) lt!627337))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424187 (= lt!627337 (Intermediate!11117 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424187 (= lt!627335 (select (store (arr!46930 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424187 (= lt!627339 (array!97233 (store (arr!46930 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47481 a!2831)))))

(declare-fun b!1424188 () Bool)

(declare-fun res!958737 () Bool)

(assert (=> b!1424188 (=> (not res!958737) (not e!805199))))

(assert (=> b!1424188 (= res!958737 (and (= (size!47481 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47481 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47481 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424189 () Bool)

(declare-fun e!805202 () Bool)

(assert (=> b!1424189 (= e!805202 e!805196)))

(declare-fun res!958733 () Bool)

(assert (=> b!1424189 (=> res!958733 e!805196)))

(assert (=> b!1424189 (= res!958733 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627336 #b00000000000000000000000000000000) (bvsge lt!627336 (size!47481 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424189 (= lt!627336 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1424190 () Bool)

(declare-fun res!958735 () Bool)

(assert (=> b!1424190 (=> (not res!958735) (not e!805199))))

(declare-datatypes ((List!33427 0))(
  ( (Nil!33424) (Cons!33423 (h!34736 (_ BitVec 64)) (t!48113 List!33427)) )
))
(declare-fun arrayNoDuplicates!0 (array!97232 (_ BitVec 32) List!33427) Bool)

(assert (=> b!1424190 (= res!958735 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33424))))

(declare-fun b!1424191 () Bool)

(assert (=> b!1424191 (= e!805197 (not e!805202))))

(declare-fun res!958742 () Bool)

(assert (=> b!1424191 (=> res!958742 e!805202)))

(assert (=> b!1424191 (= res!958742 (or (= (select (arr!46930 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46930 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46930 a!2831) index!585) (select (arr!46930 a!2831) j!81)) (= (select (store (arr!46930 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805201 () Bool)

(assert (=> b!1424191 e!805201))

(declare-fun res!958732 () Bool)

(assert (=> b!1424191 (=> (not res!958732) (not e!805201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97232 (_ BitVec 32)) Bool)

(assert (=> b!1424191 (= res!958732 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48101 0))(
  ( (Unit!48102) )
))
(declare-fun lt!627341 () Unit!48101)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48101)

(assert (=> b!1424191 (= lt!627341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!958747 () Bool)

(assert (=> start!122996 (=> (not res!958747) (not e!805199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122996 (= res!958747 (validMask!0 mask!2608))))

(assert (=> start!122996 e!805199))

(assert (=> start!122996 true))

(declare-fun array_inv!36211 (array!97232) Bool)

(assert (=> start!122996 (array_inv!36211 a!2831)))

(declare-fun b!1424192 () Bool)

(declare-fun res!958745 () Bool)

(assert (=> b!1424192 (=> (not res!958745) (not e!805199))))

(assert (=> b!1424192 (= res!958745 (validKeyInArray!0 (select (arr!46930 a!2831) i!982)))))

(declare-fun b!1424193 () Bool)

(declare-fun res!958741 () Bool)

(assert (=> b!1424193 (=> (not res!958741) (not e!805199))))

(assert (=> b!1424193 (= res!958741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424194 () Bool)

(declare-fun res!958734 () Bool)

(assert (=> b!1424194 (=> (not res!958734) (not e!805197))))

(assert (=> b!1424194 (= res!958734 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46930 a!2831) j!81) a!2831 mask!2608) lt!627340))))

(declare-fun b!1424195 () Bool)

(assert (=> b!1424195 (= e!805196 true)))

(declare-fun lt!627338 () SeekEntryResult!11117)

(assert (=> b!1424195 (= lt!627338 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627336 lt!627335 lt!627339 mask!2608))))

(declare-fun b!1424196 () Bool)

(declare-fun res!958746 () Bool)

(assert (=> b!1424196 (=> (not res!958746) (not e!805199))))

(assert (=> b!1424196 (= res!958746 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47481 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47481 a!2831))))))

(declare-fun b!1424197 () Bool)

(declare-fun res!958744 () Bool)

(assert (=> b!1424197 (=> (not res!958744) (not e!805197))))

(assert (=> b!1424197 (= res!958744 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627335 lt!627339 mask!2608) lt!627337))))

(declare-fun b!1424198 () Bool)

(declare-fun res!958739 () Bool)

(assert (=> b!1424198 (=> (not res!958739) (not e!805197))))

(assert (=> b!1424198 (= res!958739 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424199 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97232 (_ BitVec 32)) SeekEntryResult!11117)

(assert (=> b!1424199 (= e!805201 (= (seekEntryOrOpen!0 (select (arr!46930 a!2831) j!81) a!2831 mask!2608) (Found!11117 j!81)))))

(assert (= (and start!122996 res!958747) b!1424188))

(assert (= (and b!1424188 res!958737) b!1424192))

(assert (= (and b!1424192 res!958745) b!1424184))

(assert (= (and b!1424184 res!958740) b!1424193))

(assert (= (and b!1424193 res!958741) b!1424190))

(assert (= (and b!1424190 res!958735) b!1424196))

(assert (= (and b!1424196 res!958746) b!1424186))

(assert (= (and b!1424186 res!958738) b!1424187))

(assert (= (and b!1424187 res!958736) b!1424194))

(assert (= (and b!1424194 res!958734) b!1424197))

(assert (= (and b!1424197 res!958744) b!1424198))

(assert (= (and b!1424198 res!958739) b!1424191))

(assert (= (and b!1424191 res!958732) b!1424199))

(assert (= (and b!1424191 (not res!958742)) b!1424189))

(assert (= (and b!1424189 (not res!958733)) b!1424185))

(assert (= (and b!1424185 (not res!958743)) b!1424195))

(declare-fun m!1314849 () Bool)

(assert (=> b!1424185 m!1314849))

(assert (=> b!1424185 m!1314849))

(declare-fun m!1314851 () Bool)

(assert (=> b!1424185 m!1314851))

(declare-fun m!1314853 () Bool)

(assert (=> b!1424190 m!1314853))

(declare-fun m!1314855 () Bool)

(assert (=> b!1424192 m!1314855))

(assert (=> b!1424192 m!1314855))

(declare-fun m!1314857 () Bool)

(assert (=> b!1424192 m!1314857))

(assert (=> b!1424186 m!1314849))

(assert (=> b!1424186 m!1314849))

(declare-fun m!1314859 () Bool)

(assert (=> b!1424186 m!1314859))

(assert (=> b!1424186 m!1314859))

(assert (=> b!1424186 m!1314849))

(declare-fun m!1314861 () Bool)

(assert (=> b!1424186 m!1314861))

(assert (=> b!1424184 m!1314849))

(assert (=> b!1424184 m!1314849))

(declare-fun m!1314863 () Bool)

(assert (=> b!1424184 m!1314863))

(declare-fun m!1314865 () Bool)

(assert (=> b!1424187 m!1314865))

(assert (=> b!1424187 m!1314865))

(declare-fun m!1314867 () Bool)

(assert (=> b!1424187 m!1314867))

(declare-fun m!1314869 () Bool)

(assert (=> b!1424187 m!1314869))

(declare-fun m!1314871 () Bool)

(assert (=> b!1424187 m!1314871))

(assert (=> b!1424194 m!1314849))

(assert (=> b!1424194 m!1314849))

(declare-fun m!1314873 () Bool)

(assert (=> b!1424194 m!1314873))

(declare-fun m!1314875 () Bool)

(assert (=> start!122996 m!1314875))

(declare-fun m!1314877 () Bool)

(assert (=> start!122996 m!1314877))

(assert (=> b!1424199 m!1314849))

(assert (=> b!1424199 m!1314849))

(declare-fun m!1314879 () Bool)

(assert (=> b!1424199 m!1314879))

(declare-fun m!1314881 () Bool)

(assert (=> b!1424197 m!1314881))

(assert (=> b!1424191 m!1314869))

(declare-fun m!1314883 () Bool)

(assert (=> b!1424191 m!1314883))

(declare-fun m!1314885 () Bool)

(assert (=> b!1424191 m!1314885))

(declare-fun m!1314887 () Bool)

(assert (=> b!1424191 m!1314887))

(assert (=> b!1424191 m!1314849))

(declare-fun m!1314889 () Bool)

(assert (=> b!1424191 m!1314889))

(declare-fun m!1314891 () Bool)

(assert (=> b!1424189 m!1314891))

(declare-fun m!1314893 () Bool)

(assert (=> b!1424193 m!1314893))

(declare-fun m!1314895 () Bool)

(assert (=> b!1424195 m!1314895))

(check-sat (not b!1424189) (not b!1424197) (not b!1424195) (not start!122996) (not b!1424191) (not b!1424194) (not b!1424193) (not b!1424199) (not b!1424184) (not b!1424187) (not b!1424192) (not b!1424185) (not b!1424186) (not b!1424190))
(check-sat)
