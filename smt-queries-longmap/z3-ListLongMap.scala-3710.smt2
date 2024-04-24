; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51102 () Bool)

(assert start!51102)

(declare-fun b!557992 () Bool)

(declare-fun res!349751 () Bool)

(declare-fun e!321481 () Bool)

(assert (=> b!557992 (=> (not res!349751) (not e!321481))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35103 0))(
  ( (array!35104 (arr!16855 (Array (_ BitVec 32) (_ BitVec 64))) (size!17219 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35103)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!557992 (= res!349751 (and (= (size!17219 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17219 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17219 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557994 () Bool)

(declare-fun e!321483 () Bool)

(assert (=> b!557994 (= e!321481 e!321483)))

(declare-fun res!349754 () Bool)

(assert (=> b!557994 (=> (not res!349754) (not e!321483))))

(declare-datatypes ((SeekEntryResult!5260 0))(
  ( (MissingZero!5260 (index!23267 (_ BitVec 32))) (Found!5260 (index!23268 (_ BitVec 32))) (Intermediate!5260 (undefined!6072 Bool) (index!23269 (_ BitVec 32)) (x!52323 (_ BitVec 32))) (Undefined!5260) (MissingVacant!5260 (index!23270 (_ BitVec 32))) )
))
(declare-fun lt!253564 () SeekEntryResult!5260)

(assert (=> b!557994 (= res!349754 (or (= lt!253564 (MissingZero!5260 i!1132)) (= lt!253564 (MissingVacant!5260 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35103 (_ BitVec 32)) SeekEntryResult!5260)

(assert (=> b!557994 (= lt!253564 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557995 () Bool)

(declare-fun res!349750 () Bool)

(assert (=> b!557995 (=> (not res!349750) (not e!321481))))

(declare-fun arrayContainsKey!0 (array!35103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557995 (= res!349750 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557996 () Bool)

(declare-fun res!349757 () Bool)

(assert (=> b!557996 (=> (not res!349757) (not e!321481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557996 (= res!349757 (validKeyInArray!0 (select (arr!16855 a!3118) j!142)))))

(declare-fun b!557997 () Bool)

(declare-fun res!349755 () Bool)

(assert (=> b!557997 (=> (not res!349755) (not e!321483))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35103 (_ BitVec 32)) SeekEntryResult!5260)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557997 (= res!349755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16855 a!3118) j!142) mask!3119) (select (arr!16855 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16855 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16855 a!3118) i!1132 k0!1914) j!142) (array!35104 (store (arr!16855 a!3118) i!1132 k0!1914) (size!17219 a!3118)) mask!3119)))))

(declare-fun b!557998 () Bool)

(declare-fun res!349759 () Bool)

(assert (=> b!557998 (=> (not res!349759) (not e!321483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35103 (_ BitVec 32)) Bool)

(assert (=> b!557998 (= res!349759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557999 () Bool)

(declare-fun res!349753 () Bool)

(assert (=> b!557999 (=> (not res!349753) (not e!321483))))

(declare-datatypes ((List!10842 0))(
  ( (Nil!10839) (Cons!10838 (h!11835 (_ BitVec 64)) (t!17062 List!10842)) )
))
(declare-fun arrayNoDuplicates!0 (array!35103 (_ BitVec 32) List!10842) Bool)

(assert (=> b!557999 (= res!349753 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10839))))

(declare-fun res!349758 () Bool)

(assert (=> start!51102 (=> (not res!349758) (not e!321481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51102 (= res!349758 (validMask!0 mask!3119))))

(assert (=> start!51102 e!321481))

(assert (=> start!51102 true))

(declare-fun array_inv!12714 (array!35103) Bool)

(assert (=> start!51102 (array_inv!12714 a!3118)))

(declare-fun b!557993 () Bool)

(declare-fun res!349752 () Bool)

(assert (=> b!557993 (=> (not res!349752) (not e!321481))))

(assert (=> b!557993 (= res!349752 (validKeyInArray!0 k0!1914))))

(declare-fun b!558000 () Bool)

(assert (=> b!558000 (= e!321483 (not true))))

(declare-fun e!321480 () Bool)

(assert (=> b!558000 e!321480))

(declare-fun res!349756 () Bool)

(assert (=> b!558000 (=> (not res!349756) (not e!321480))))

(assert (=> b!558000 (= res!349756 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17365 0))(
  ( (Unit!17366) )
))
(declare-fun lt!253563 () Unit!17365)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17365)

(assert (=> b!558000 (= lt!253563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558001 () Bool)

(assert (=> b!558001 (= e!321480 (= (seekEntryOrOpen!0 (select (arr!16855 a!3118) j!142) a!3118 mask!3119) (Found!5260 j!142)))))

(assert (= (and start!51102 res!349758) b!557992))

(assert (= (and b!557992 res!349751) b!557996))

(assert (= (and b!557996 res!349757) b!557993))

(assert (= (and b!557993 res!349752) b!557995))

(assert (= (and b!557995 res!349750) b!557994))

(assert (= (and b!557994 res!349754) b!557998))

(assert (= (and b!557998 res!349759) b!557999))

(assert (= (and b!557999 res!349753) b!557997))

(assert (= (and b!557997 res!349755) b!558000))

(assert (= (and b!558000 res!349756) b!558001))

(declare-fun m!535979 () Bool)

(assert (=> b!557996 m!535979))

(assert (=> b!557996 m!535979))

(declare-fun m!535981 () Bool)

(assert (=> b!557996 m!535981))

(assert (=> b!558001 m!535979))

(assert (=> b!558001 m!535979))

(declare-fun m!535983 () Bool)

(assert (=> b!558001 m!535983))

(declare-fun m!535985 () Bool)

(assert (=> b!557993 m!535985))

(declare-fun m!535987 () Bool)

(assert (=> b!557998 m!535987))

(declare-fun m!535989 () Bool)

(assert (=> b!558000 m!535989))

(declare-fun m!535991 () Bool)

(assert (=> b!558000 m!535991))

(declare-fun m!535993 () Bool)

(assert (=> start!51102 m!535993))

(declare-fun m!535995 () Bool)

(assert (=> start!51102 m!535995))

(declare-fun m!535997 () Bool)

(assert (=> b!557994 m!535997))

(declare-fun m!535999 () Bool)

(assert (=> b!557999 m!535999))

(assert (=> b!557997 m!535979))

(declare-fun m!536001 () Bool)

(assert (=> b!557997 m!536001))

(assert (=> b!557997 m!535979))

(declare-fun m!536003 () Bool)

(assert (=> b!557997 m!536003))

(declare-fun m!536005 () Bool)

(assert (=> b!557997 m!536005))

(assert (=> b!557997 m!536003))

(declare-fun m!536007 () Bool)

(assert (=> b!557997 m!536007))

(assert (=> b!557997 m!536001))

(assert (=> b!557997 m!535979))

(declare-fun m!536009 () Bool)

(assert (=> b!557997 m!536009))

(declare-fun m!536011 () Bool)

(assert (=> b!557997 m!536011))

(assert (=> b!557997 m!536003))

(assert (=> b!557997 m!536005))

(declare-fun m!536013 () Bool)

(assert (=> b!557995 m!536013))

(check-sat (not b!557995) (not b!557998) (not b!558000) (not b!557993) (not b!557997) (not b!558001) (not b!557994) (not b!557996) (not b!557999) (not start!51102))
(check-sat)
