; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45740 () Bool)

(assert start!45740)

(declare-fun b!505992 () Bool)

(declare-fun res!307047 () Bool)

(declare-fun e!296173 () Bool)

(assert (=> b!505992 (=> (not res!307047) (not e!296173))))

(declare-datatypes ((array!32497 0))(
  ( (array!32498 (arr!15628 (Array (_ BitVec 32) (_ BitVec 64))) (size!15992 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32497)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505992 (= res!307047 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505993 () Bool)

(declare-fun e!296175 () Bool)

(assert (=> b!505993 (= e!296175 false)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!296167 () Bool)

(declare-fun lt!230851 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4051 0))(
  ( (MissingZero!4051 (index!18392 (_ BitVec 32))) (Found!4051 (index!18393 (_ BitVec 32))) (Intermediate!4051 (undefined!4863 Bool) (index!18394 (_ BitVec 32)) (x!47545 (_ BitVec 32))) (Undefined!4051) (MissingVacant!4051 (index!18395 (_ BitVec 32))) )
))
(declare-fun lt!230841 () SeekEntryResult!4051)

(declare-fun lt!230848 () SeekEntryResult!4051)

(declare-fun b!505994 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32497 (_ BitVec 32)) SeekEntryResult!4051)

(assert (=> b!505994 (= e!296167 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230851 (index!18394 lt!230841) (select (arr!15628 a!3235) j!176) a!3235 mask!3524) lt!230848)))))

(declare-fun b!505996 () Bool)

(declare-fun res!307048 () Bool)

(declare-fun e!296168 () Bool)

(assert (=> b!505996 (=> res!307048 e!296168)))

(assert (=> b!505996 (= res!307048 e!296167)))

(declare-fun res!307042 () Bool)

(assert (=> b!505996 (=> (not res!307042) (not e!296167))))

(assert (=> b!505996 (= res!307042 (bvsgt #b00000000000000000000000000000000 (x!47545 lt!230841)))))

(declare-fun b!505997 () Bool)

(declare-fun res!307043 () Bool)

(assert (=> b!505997 (=> (not res!307043) (not e!296173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505997 (= res!307043 (validKeyInArray!0 k0!2280))))

(declare-fun b!505998 () Bool)

(declare-datatypes ((Unit!15439 0))(
  ( (Unit!15440) )
))
(declare-fun e!296171 () Unit!15439)

(declare-fun Unit!15441 () Unit!15439)

(assert (=> b!505998 (= e!296171 Unit!15441)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!230839 () Unit!15439)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15439)

(assert (=> b!505998 (= lt!230839 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230851 #b00000000000000000000000000000000 (index!18394 lt!230841) (x!47545 lt!230841) mask!3524))))

(declare-fun res!307037 () Bool)

(declare-fun lt!230840 () array!32497)

(declare-fun lt!230845 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32497 (_ BitVec 32)) SeekEntryResult!4051)

(assert (=> b!505998 (= res!307037 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230851 lt!230845 lt!230840 mask!3524) (Intermediate!4051 false (index!18394 lt!230841) (x!47545 lt!230841))))))

(assert (=> b!505998 (=> (not res!307037) (not e!296175))))

(assert (=> b!505998 e!296175))

(declare-fun b!505999 () Bool)

(declare-fun e!296170 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32497 (_ BitVec 32)) SeekEntryResult!4051)

(assert (=> b!505999 (= e!296170 (= (seekEntryOrOpen!0 (select (arr!15628 a!3235) j!176) a!3235 mask!3524) (Found!4051 j!176)))))

(declare-fun b!506000 () Bool)

(declare-fun res!307039 () Bool)

(assert (=> b!506000 (=> (not res!307039) (not e!296173))))

(assert (=> b!506000 (= res!307039 (and (= (size!15992 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15992 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15992 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506001 () Bool)

(declare-fun e!296174 () Bool)

(assert (=> b!506001 (= e!296173 e!296174)))

(declare-fun res!307049 () Bool)

(assert (=> b!506001 (=> (not res!307049) (not e!296174))))

(declare-fun lt!230842 () SeekEntryResult!4051)

(assert (=> b!506001 (= res!307049 (or (= lt!230842 (MissingZero!4051 i!1204)) (= lt!230842 (MissingVacant!4051 i!1204))))))

(assert (=> b!506001 (= lt!230842 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506002 () Bool)

(declare-fun e!296169 () Bool)

(assert (=> b!506002 (= e!296174 (not e!296169))))

(declare-fun res!307050 () Bool)

(assert (=> b!506002 (=> res!307050 e!296169)))

(declare-fun lt!230843 () SeekEntryResult!4051)

(get-info :version)

(assert (=> b!506002 (= res!307050 (or (= lt!230841 lt!230843) (undefined!4863 lt!230841) (not ((_ is Intermediate!4051) lt!230841))))))

(declare-fun lt!230846 () (_ BitVec 32))

(assert (=> b!506002 (= lt!230843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230846 lt!230845 lt!230840 mask!3524))))

(assert (=> b!506002 (= lt!230841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230851 (select (arr!15628 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506002 (= lt!230846 (toIndex!0 lt!230845 mask!3524))))

(assert (=> b!506002 (= lt!230845 (select (store (arr!15628 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!506002 (= lt!230851 (toIndex!0 (select (arr!15628 a!3235) j!176) mask!3524))))

(assert (=> b!506002 (= lt!230840 (array!32498 (store (arr!15628 a!3235) i!1204 k0!2280) (size!15992 a!3235)))))

(assert (=> b!506002 (= lt!230848 (Found!4051 j!176))))

(assert (=> b!506002 e!296170))

(declare-fun res!307045 () Bool)

(assert (=> b!506002 (=> (not res!307045) (not e!296170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32497 (_ BitVec 32)) Bool)

(assert (=> b!506002 (= res!307045 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230850 () Unit!15439)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15439)

(assert (=> b!506002 (= lt!230850 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506003 () Bool)

(declare-fun res!307041 () Bool)

(assert (=> b!506003 (=> res!307041 e!296168)))

(assert (=> b!506003 (= res!307041 (not (= lt!230843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230851 lt!230845 lt!230840 mask!3524))))))

(declare-fun b!506004 () Bool)

(declare-fun res!307040 () Bool)

(assert (=> b!506004 (=> (not res!307040) (not e!296173))))

(assert (=> b!506004 (= res!307040 (validKeyInArray!0 (select (arr!15628 a!3235) j!176)))))

(declare-fun b!506005 () Bool)

(declare-fun Unit!15442 () Unit!15439)

(assert (=> b!506005 (= e!296171 Unit!15442)))

(declare-fun b!506006 () Bool)

(declare-fun res!307038 () Bool)

(assert (=> b!506006 (=> (not res!307038) (not e!296174))))

(assert (=> b!506006 (= res!307038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505995 () Bool)

(assert (=> b!505995 (= e!296169 e!296168)))

(declare-fun res!307044 () Bool)

(assert (=> b!505995 (=> res!307044 e!296168)))

(assert (=> b!505995 (= res!307044 (or (bvsgt (x!47545 lt!230841) #b01111111111111111111111111111110) (bvslt lt!230851 #b00000000000000000000000000000000) (bvsge lt!230851 (size!15992 a!3235)) (bvslt (index!18394 lt!230841) #b00000000000000000000000000000000) (bvsge (index!18394 lt!230841) (size!15992 a!3235)) (not (= lt!230841 (Intermediate!4051 false (index!18394 lt!230841) (x!47545 lt!230841))))))))

(assert (=> b!505995 (= (index!18394 lt!230841) i!1204)))

(declare-fun lt!230844 () Unit!15439)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15439)

(assert (=> b!505995 (= lt!230844 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230851 #b00000000000000000000000000000000 (index!18394 lt!230841) (x!47545 lt!230841) mask!3524))))

(assert (=> b!505995 (and (or (= (select (arr!15628 a!3235) (index!18394 lt!230841)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15628 a!3235) (index!18394 lt!230841)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15628 a!3235) (index!18394 lt!230841)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15628 a!3235) (index!18394 lt!230841)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230849 () Unit!15439)

(assert (=> b!505995 (= lt!230849 e!296171)))

(declare-fun c!59756 () Bool)

(assert (=> b!505995 (= c!59756 (= (select (arr!15628 a!3235) (index!18394 lt!230841)) (select (arr!15628 a!3235) j!176)))))

(assert (=> b!505995 (and (bvslt (x!47545 lt!230841) #b01111111111111111111111111111110) (or (= (select (arr!15628 a!3235) (index!18394 lt!230841)) (select (arr!15628 a!3235) j!176)) (= (select (arr!15628 a!3235) (index!18394 lt!230841)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15628 a!3235) (index!18394 lt!230841)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!307046 () Bool)

(assert (=> start!45740 (=> (not res!307046) (not e!296173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45740 (= res!307046 (validMask!0 mask!3524))))

(assert (=> start!45740 e!296173))

(assert (=> start!45740 true))

(declare-fun array_inv!11487 (array!32497) Bool)

(assert (=> start!45740 (array_inv!11487 a!3235)))

(declare-fun b!506007 () Bool)

(declare-fun res!307051 () Bool)

(assert (=> b!506007 (=> (not res!307051) (not e!296174))))

(declare-datatypes ((List!9693 0))(
  ( (Nil!9690) (Cons!9689 (h!10566 (_ BitVec 64)) (t!15913 List!9693)) )
))
(declare-fun arrayNoDuplicates!0 (array!32497 (_ BitVec 32) List!9693) Bool)

(assert (=> b!506007 (= res!307051 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9690))))

(declare-fun b!506008 () Bool)

(assert (=> b!506008 (= e!296168 true)))

(assert (=> b!506008 (= (seekEntryOrOpen!0 lt!230845 lt!230840 mask!3524) lt!230848)))

(declare-fun lt!230847 () Unit!15439)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15439)

(assert (=> b!506008 (= lt!230847 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230851 #b00000000000000000000000000000000 (index!18394 lt!230841) (x!47545 lt!230841) mask!3524))))

(assert (= (and start!45740 res!307046) b!506000))

(assert (= (and b!506000 res!307039) b!506004))

(assert (= (and b!506004 res!307040) b!505997))

(assert (= (and b!505997 res!307043) b!505992))

(assert (= (and b!505992 res!307047) b!506001))

(assert (= (and b!506001 res!307049) b!506006))

(assert (= (and b!506006 res!307038) b!506007))

(assert (= (and b!506007 res!307051) b!506002))

(assert (= (and b!506002 res!307045) b!505999))

(assert (= (and b!506002 (not res!307050)) b!505995))

(assert (= (and b!505995 c!59756) b!505998))

(assert (= (and b!505995 (not c!59756)) b!506005))

(assert (= (and b!505998 res!307037) b!505993))

(assert (= (and b!505995 (not res!307044)) b!505996))

(assert (= (and b!505996 res!307042) b!505994))

(assert (= (and b!505996 (not res!307048)) b!506003))

(assert (= (and b!506003 (not res!307041)) b!506008))

(declare-fun m!486889 () Bool)

(assert (=> b!506002 m!486889))

(declare-fun m!486891 () Bool)

(assert (=> b!506002 m!486891))

(declare-fun m!486893 () Bool)

(assert (=> b!506002 m!486893))

(declare-fun m!486895 () Bool)

(assert (=> b!506002 m!486895))

(declare-fun m!486897 () Bool)

(assert (=> b!506002 m!486897))

(declare-fun m!486899 () Bool)

(assert (=> b!506002 m!486899))

(assert (=> b!506002 m!486895))

(declare-fun m!486901 () Bool)

(assert (=> b!506002 m!486901))

(declare-fun m!486903 () Bool)

(assert (=> b!506002 m!486903))

(declare-fun m!486905 () Bool)

(assert (=> b!506002 m!486905))

(assert (=> b!506002 m!486895))

(declare-fun m!486907 () Bool)

(assert (=> b!505995 m!486907))

(declare-fun m!486909 () Bool)

(assert (=> b!505995 m!486909))

(assert (=> b!505995 m!486895))

(declare-fun m!486911 () Bool)

(assert (=> b!506003 m!486911))

(declare-fun m!486913 () Bool)

(assert (=> start!45740 m!486913))

(declare-fun m!486915 () Bool)

(assert (=> start!45740 m!486915))

(assert (=> b!505994 m!486895))

(assert (=> b!505994 m!486895))

(declare-fun m!486917 () Bool)

(assert (=> b!505994 m!486917))

(assert (=> b!506004 m!486895))

(assert (=> b!506004 m!486895))

(declare-fun m!486919 () Bool)

(assert (=> b!506004 m!486919))

(declare-fun m!486921 () Bool)

(assert (=> b!506006 m!486921))

(declare-fun m!486923 () Bool)

(assert (=> b!506008 m!486923))

(declare-fun m!486925 () Bool)

(assert (=> b!506008 m!486925))

(declare-fun m!486927 () Bool)

(assert (=> b!505998 m!486927))

(assert (=> b!505998 m!486911))

(assert (=> b!505999 m!486895))

(assert (=> b!505999 m!486895))

(declare-fun m!486929 () Bool)

(assert (=> b!505999 m!486929))

(declare-fun m!486931 () Bool)

(assert (=> b!505997 m!486931))

(declare-fun m!486933 () Bool)

(assert (=> b!506007 m!486933))

(declare-fun m!486935 () Bool)

(assert (=> b!505992 m!486935))

(declare-fun m!486937 () Bool)

(assert (=> b!506001 m!486937))

(check-sat (not b!505992) (not b!506004) (not b!505997) (not b!505994) (not b!505999) (not b!505998) (not start!45740) (not b!506002) (not b!506006) (not b!506001) (not b!506003) (not b!505995) (not b!506008) (not b!506007))
(check-sat)
