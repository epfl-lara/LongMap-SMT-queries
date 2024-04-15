; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51050 () Bool)

(assert start!51050)

(declare-fun b!557613 () Bool)

(declare-fun res!349619 () Bool)

(declare-fun e!321221 () Bool)

(assert (=> b!557613 (=> (not res!349619) (not e!321221))))

(declare-datatypes ((array!35113 0))(
  ( (array!35114 (arr!16862 (Array (_ BitVec 32) (_ BitVec 64))) (size!17227 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35113)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35113 (_ BitVec 32)) Bool)

(assert (=> b!557613 (= res!349619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557614 () Bool)

(declare-fun res!349622 () Bool)

(declare-fun e!321219 () Bool)

(assert (=> b!557614 (=> (not res!349622) (not e!321219))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557614 (= res!349622 (validKeyInArray!0 (select (arr!16862 a!3118) j!142)))))

(declare-fun b!557615 () Bool)

(declare-fun e!321217 () Bool)

(declare-fun e!321222 () Bool)

(assert (=> b!557615 (= e!321217 e!321222)))

(declare-fun res!349623 () Bool)

(assert (=> b!557615 (=> res!349623 e!321222)))

(declare-datatypes ((SeekEntryResult!5308 0))(
  ( (MissingZero!5308 (index!23459 (_ BitVec 32))) (Found!5308 (index!23460 (_ BitVec 32))) (Intermediate!5308 (undefined!6120 Bool) (index!23461 (_ BitVec 32)) (x!52371 (_ BitVec 32))) (Undefined!5308) (MissingVacant!5308 (index!23462 (_ BitVec 32))) )
))
(declare-fun lt!253249 () SeekEntryResult!5308)

(get-info :version)

(assert (=> b!557615 (= res!349623 (or (undefined!6120 lt!253249) (not ((_ is Intermediate!5308) lt!253249)) (= (select (arr!16862 a!3118) (index!23461 lt!253249)) (select (arr!16862 a!3118) j!142)) (= (select (arr!16862 a!3118) (index!23461 lt!253249)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557616 () Bool)

(declare-fun res!349624 () Bool)

(assert (=> b!557616 (=> (not res!349624) (not e!321219))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!557616 (= res!349624 (validKeyInArray!0 k0!1914))))

(declare-fun b!557617 () Bool)

(assert (=> b!557617 (= e!321219 e!321221)))

(declare-fun res!349621 () Bool)

(assert (=> b!557617 (=> (not res!349621) (not e!321221))))

(declare-fun lt!253246 () SeekEntryResult!5308)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557617 (= res!349621 (or (= lt!253246 (MissingZero!5308 i!1132)) (= lt!253246 (MissingVacant!5308 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35113 (_ BitVec 32)) SeekEntryResult!5308)

(assert (=> b!557617 (= lt!253246 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557618 () Bool)

(declare-fun e!321220 () Bool)

(assert (=> b!557618 (= e!321220 (not true))))

(assert (=> b!557618 e!321217))

(declare-fun res!349620 () Bool)

(assert (=> b!557618 (=> (not res!349620) (not e!321217))))

(declare-fun lt!253244 () SeekEntryResult!5308)

(assert (=> b!557618 (= res!349620 (= lt!253244 (Found!5308 j!142)))))

(assert (=> b!557618 (= lt!253244 (seekEntryOrOpen!0 (select (arr!16862 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!557618 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17376 0))(
  ( (Unit!17377) )
))
(declare-fun lt!253245 () Unit!17376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17376)

(assert (=> b!557618 (= lt!253245 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557619 () Bool)

(declare-fun res!349625 () Bool)

(assert (=> b!557619 (=> (not res!349625) (not e!321221))))

(declare-datatypes ((List!10981 0))(
  ( (Nil!10978) (Cons!10977 (h!11971 (_ BitVec 64)) (t!17200 List!10981)) )
))
(declare-fun arrayNoDuplicates!0 (array!35113 (_ BitVec 32) List!10981) Bool)

(assert (=> b!557619 (= res!349625 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10978))))

(declare-fun res!349618 () Bool)

(assert (=> start!51050 (=> (not res!349618) (not e!321219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51050 (= res!349618 (validMask!0 mask!3119))))

(assert (=> start!51050 e!321219))

(assert (=> start!51050 true))

(declare-fun array_inv!12745 (array!35113) Bool)

(assert (=> start!51050 (array_inv!12745 a!3118)))

(declare-fun b!557620 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35113 (_ BitVec 32)) SeekEntryResult!5308)

(assert (=> b!557620 (= e!321222 (= lt!253244 (seekKeyOrZeroReturnVacant!0 (x!52371 lt!253249) (index!23461 lt!253249) (index!23461 lt!253249) (select (arr!16862 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!557621 () Bool)

(declare-fun res!349626 () Bool)

(assert (=> b!557621 (=> (not res!349626) (not e!321219))))

(declare-fun arrayContainsKey!0 (array!35113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557621 (= res!349626 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557622 () Bool)

(assert (=> b!557622 (= e!321221 e!321220)))

(declare-fun res!349627 () Bool)

(assert (=> b!557622 (=> (not res!349627) (not e!321220))))

(declare-fun lt!253247 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35113 (_ BitVec 32)) SeekEntryResult!5308)

(assert (=> b!557622 (= res!349627 (= lt!253249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253247 (select (store (arr!16862 a!3118) i!1132 k0!1914) j!142) (array!35114 (store (arr!16862 a!3118) i!1132 k0!1914) (size!17227 a!3118)) mask!3119)))))

(declare-fun lt!253248 () (_ BitVec 32))

(assert (=> b!557622 (= lt!253249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253248 (select (arr!16862 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557622 (= lt!253247 (toIndex!0 (select (store (arr!16862 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!557622 (= lt!253248 (toIndex!0 (select (arr!16862 a!3118) j!142) mask!3119))))

(declare-fun b!557623 () Bool)

(declare-fun res!349628 () Bool)

(assert (=> b!557623 (=> (not res!349628) (not e!321219))))

(assert (=> b!557623 (= res!349628 (and (= (size!17227 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17227 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17227 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51050 res!349618) b!557623))

(assert (= (and b!557623 res!349628) b!557614))

(assert (= (and b!557614 res!349622) b!557616))

(assert (= (and b!557616 res!349624) b!557621))

(assert (= (and b!557621 res!349626) b!557617))

(assert (= (and b!557617 res!349621) b!557613))

(assert (= (and b!557613 res!349619) b!557619))

(assert (= (and b!557619 res!349625) b!557622))

(assert (= (and b!557622 res!349627) b!557618))

(assert (= (and b!557618 res!349620) b!557615))

(assert (= (and b!557615 (not res!349623)) b!557620))

(declare-fun m!534977 () Bool)

(assert (=> b!557615 m!534977))

(declare-fun m!534979 () Bool)

(assert (=> b!557615 m!534979))

(declare-fun m!534981 () Bool)

(assert (=> b!557617 m!534981))

(declare-fun m!534983 () Bool)

(assert (=> b!557619 m!534983))

(declare-fun m!534985 () Bool)

(assert (=> b!557616 m!534985))

(assert (=> b!557618 m!534979))

(assert (=> b!557618 m!534979))

(declare-fun m!534987 () Bool)

(assert (=> b!557618 m!534987))

(declare-fun m!534989 () Bool)

(assert (=> b!557618 m!534989))

(declare-fun m!534991 () Bool)

(assert (=> b!557618 m!534991))

(assert (=> b!557614 m!534979))

(assert (=> b!557614 m!534979))

(declare-fun m!534993 () Bool)

(assert (=> b!557614 m!534993))

(assert (=> b!557620 m!534979))

(assert (=> b!557620 m!534979))

(declare-fun m!534995 () Bool)

(assert (=> b!557620 m!534995))

(declare-fun m!534997 () Bool)

(assert (=> start!51050 m!534997))

(declare-fun m!534999 () Bool)

(assert (=> start!51050 m!534999))

(assert (=> b!557622 m!534979))

(declare-fun m!535001 () Bool)

(assert (=> b!557622 m!535001))

(assert (=> b!557622 m!534979))

(declare-fun m!535003 () Bool)

(assert (=> b!557622 m!535003))

(declare-fun m!535005 () Bool)

(assert (=> b!557622 m!535005))

(declare-fun m!535007 () Bool)

(assert (=> b!557622 m!535007))

(assert (=> b!557622 m!534979))

(assert (=> b!557622 m!535005))

(declare-fun m!535009 () Bool)

(assert (=> b!557622 m!535009))

(assert (=> b!557622 m!535005))

(declare-fun m!535011 () Bool)

(assert (=> b!557622 m!535011))

(declare-fun m!535013 () Bool)

(assert (=> b!557621 m!535013))

(declare-fun m!535015 () Bool)

(assert (=> b!557613 m!535015))

(check-sat (not b!557621) (not b!557614) (not b!557620) (not b!557617) (not start!51050) (not b!557619) (not b!557622) (not b!557616) (not b!557618) (not b!557613))
(check-sat)
