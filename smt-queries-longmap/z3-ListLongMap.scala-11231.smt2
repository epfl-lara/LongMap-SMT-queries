; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131436 () Bool)

(assert start!131436)

(declare-fun b!1539667 () Bool)

(declare-fun res!1055185 () Bool)

(declare-fun e!857052 () Bool)

(assert (=> b!1539667 (=> (not res!1055185) (not e!857052))))

(declare-datatypes ((array!102238 0))(
  ( (array!102239 (arr!49327 (Array (_ BitVec 32) (_ BitVec 64))) (size!49878 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102238)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539667 (= res!1055185 (validKeyInArray!0 (select (arr!49327 a!2792) j!64)))))

(declare-fun e!857056 () Bool)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun b!1539668 () Bool)

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1539668 (= e!857056 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun lt!665553 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13354 0))(
  ( (MissingZero!13354 (index!55811 (_ BitVec 32))) (Found!13354 (index!55812 (_ BitVec 32))) (Intermediate!13354 (undefined!14166 Bool) (index!55813 (_ BitVec 32)) (x!137750 (_ BitVec 32))) (Undefined!13354) (MissingVacant!13354 (index!55814 (_ BitVec 32))) )
))
(declare-fun lt!665552 () SeekEntryResult!13354)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102238 (_ BitVec 32)) SeekEntryResult!13354)

(assert (=> b!1539668 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665553 vacantIndex!5 (select (store (arr!49327 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102239 (store (arr!49327 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49878 a!2792)) mask!2480) lt!665552)))

(declare-datatypes ((Unit!51317 0))(
  ( (Unit!51318) )
))
(declare-fun lt!665551 () Unit!51317)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51317)

(assert (=> b!1539668 (= lt!665551 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665553 vacantIndex!5 mask!2480))))

(declare-fun b!1539669 () Bool)

(declare-fun e!857053 () Bool)

(assert (=> b!1539669 (= e!857053 e!857056)))

(declare-fun res!1055187 () Bool)

(assert (=> b!1539669 (=> (not res!1055187) (not e!857056))))

(declare-fun lt!665550 () SeekEntryResult!13354)

(assert (=> b!1539669 (= res!1055187 (= lt!665552 lt!665550))))

(assert (=> b!1539669 (= lt!665552 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665553 vacantIndex!5 (select (arr!49327 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1539671 () Bool)

(declare-fun res!1055178 () Bool)

(assert (=> b!1539671 (=> (not res!1055178) (not e!857052))))

(declare-datatypes ((List!35788 0))(
  ( (Nil!35785) (Cons!35784 (h!37247 (_ BitVec 64)) (t!50474 List!35788)) )
))
(declare-fun arrayNoDuplicates!0 (array!102238 (_ BitVec 32) List!35788) Bool)

(assert (=> b!1539671 (= res!1055178 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35785))))

(declare-fun b!1539672 () Bool)

(declare-fun res!1055177 () Bool)

(assert (=> b!1539672 (=> (not res!1055177) (not e!857052))))

(assert (=> b!1539672 (= res!1055177 (validKeyInArray!0 (select (arr!49327 a!2792) i!951)))))

(declare-fun b!1539673 () Bool)

(declare-fun e!857055 () Bool)

(assert (=> b!1539673 (= e!857055 e!857053)))

(declare-fun res!1055180 () Bool)

(assert (=> b!1539673 (=> (not res!1055180) (not e!857053))))

(assert (=> b!1539673 (= res!1055180 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665553 #b00000000000000000000000000000000) (bvslt lt!665553 (size!49878 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539673 (= lt!665553 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1539674 () Bool)

(declare-fun res!1055186 () Bool)

(assert (=> b!1539674 (=> (not res!1055186) (not e!857052))))

(assert (=> b!1539674 (= res!1055186 (and (= (size!49878 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49878 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49878 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539675 () Bool)

(assert (=> b!1539675 (= e!857052 e!857055)))

(declare-fun res!1055184 () Bool)

(assert (=> b!1539675 (=> (not res!1055184) (not e!857055))))

(assert (=> b!1539675 (= res!1055184 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49327 a!2792) j!64) a!2792 mask!2480) lt!665550))))

(assert (=> b!1539675 (= lt!665550 (Found!13354 j!64))))

(declare-fun b!1539670 () Bool)

(declare-fun res!1055179 () Bool)

(assert (=> b!1539670 (=> (not res!1055179) (not e!857052))))

(assert (=> b!1539670 (= res!1055179 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49878 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49878 a!2792)) (= (select (arr!49327 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1055183 () Bool)

(assert (=> start!131436 (=> (not res!1055183) (not e!857052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131436 (= res!1055183 (validMask!0 mask!2480))))

(assert (=> start!131436 e!857052))

(assert (=> start!131436 true))

(declare-fun array_inv!38608 (array!102238) Bool)

(assert (=> start!131436 (array_inv!38608 a!2792)))

(declare-fun b!1539676 () Bool)

(declare-fun res!1055182 () Bool)

(assert (=> b!1539676 (=> (not res!1055182) (not e!857055))))

(assert (=> b!1539676 (= res!1055182 (not (= (select (arr!49327 a!2792) index!463) (select (arr!49327 a!2792) j!64))))))

(declare-fun b!1539677 () Bool)

(declare-fun res!1055181 () Bool)

(assert (=> b!1539677 (=> (not res!1055181) (not e!857052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102238 (_ BitVec 32)) Bool)

(assert (=> b!1539677 (= res!1055181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131436 res!1055183) b!1539674))

(assert (= (and b!1539674 res!1055186) b!1539672))

(assert (= (and b!1539672 res!1055177) b!1539667))

(assert (= (and b!1539667 res!1055185) b!1539677))

(assert (= (and b!1539677 res!1055181) b!1539671))

(assert (= (and b!1539671 res!1055178) b!1539670))

(assert (= (and b!1539670 res!1055179) b!1539675))

(assert (= (and b!1539675 res!1055184) b!1539676))

(assert (= (and b!1539676 res!1055182) b!1539673))

(assert (= (and b!1539673 res!1055180) b!1539669))

(assert (= (and b!1539669 res!1055187) b!1539668))

(declare-fun m!1421965 () Bool)

(assert (=> start!131436 m!1421965))

(declare-fun m!1421967 () Bool)

(assert (=> start!131436 m!1421967))

(declare-fun m!1421969 () Bool)

(assert (=> b!1539668 m!1421969))

(declare-fun m!1421971 () Bool)

(assert (=> b!1539668 m!1421971))

(assert (=> b!1539668 m!1421971))

(declare-fun m!1421973 () Bool)

(assert (=> b!1539668 m!1421973))

(declare-fun m!1421975 () Bool)

(assert (=> b!1539668 m!1421975))

(declare-fun m!1421977 () Bool)

(assert (=> b!1539676 m!1421977))

(declare-fun m!1421979 () Bool)

(assert (=> b!1539676 m!1421979))

(declare-fun m!1421981 () Bool)

(assert (=> b!1539672 m!1421981))

(assert (=> b!1539672 m!1421981))

(declare-fun m!1421983 () Bool)

(assert (=> b!1539672 m!1421983))

(assert (=> b!1539667 m!1421979))

(assert (=> b!1539667 m!1421979))

(declare-fun m!1421985 () Bool)

(assert (=> b!1539667 m!1421985))

(declare-fun m!1421987 () Bool)

(assert (=> b!1539677 m!1421987))

(declare-fun m!1421989 () Bool)

(assert (=> b!1539670 m!1421989))

(assert (=> b!1539675 m!1421979))

(assert (=> b!1539675 m!1421979))

(declare-fun m!1421991 () Bool)

(assert (=> b!1539675 m!1421991))

(declare-fun m!1421993 () Bool)

(assert (=> b!1539673 m!1421993))

(assert (=> b!1539669 m!1421979))

(assert (=> b!1539669 m!1421979))

(declare-fun m!1421995 () Bool)

(assert (=> b!1539669 m!1421995))

(declare-fun m!1421997 () Bool)

(assert (=> b!1539671 m!1421997))

(check-sat (not b!1539667) (not b!1539675) (not b!1539672) (not start!131436) (not b!1539669) (not b!1539668) (not b!1539671) (not b!1539677) (not b!1539673))
(check-sat)
