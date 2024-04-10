; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46046 () Bool)

(assert start!46046)

(declare-fun b!509919 () Bool)

(declare-fun e!298134 () Bool)

(declare-fun e!298136 () Bool)

(assert (=> b!509919 (= e!298134 e!298136)))

(declare-fun res!310770 () Bool)

(assert (=> b!509919 (=> (not res!310770) (not e!298136))))

(declare-datatypes ((SeekEntryResult!4224 0))(
  ( (MissingZero!4224 (index!19084 (_ BitVec 32))) (Found!4224 (index!19085 (_ BitVec 32))) (Intermediate!4224 (undefined!5036 Bool) (index!19086 (_ BitVec 32)) (x!48049 (_ BitVec 32))) (Undefined!4224) (MissingVacant!4224 (index!19087 (_ BitVec 32))) )
))
(declare-fun lt!233038 () SeekEntryResult!4224)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509919 (= res!310770 (or (= lt!233038 (MissingZero!4224 i!1204)) (= lt!233038 (MissingVacant!4224 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32757 0))(
  ( (array!32758 (arr!15757 (Array (_ BitVec 32) (_ BitVec 64))) (size!16121 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32757)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32757 (_ BitVec 32)) SeekEntryResult!4224)

(assert (=> b!509919 (= lt!233038 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509920 () Bool)

(declare-fun res!310769 () Bool)

(assert (=> b!509920 (=> (not res!310769) (not e!298134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509920 (= res!310769 (validKeyInArray!0 k0!2280))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!509921 () Bool)

(declare-fun e!298135 () Bool)

(assert (=> b!509921 (= e!298135 (= (seekEntryOrOpen!0 (select (arr!15757 a!3235) j!176) a!3235 mask!3524) (Found!4224 j!176)))))

(declare-fun b!509922 () Bool)

(declare-fun res!310771 () Bool)

(assert (=> b!509922 (=> (not res!310771) (not e!298136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32757 (_ BitVec 32)) Bool)

(assert (=> b!509922 (= res!310771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!310765 () Bool)

(assert (=> start!46046 (=> (not res!310765) (not e!298134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46046 (= res!310765 (validMask!0 mask!3524))))

(assert (=> start!46046 e!298134))

(assert (=> start!46046 true))

(declare-fun array_inv!11553 (array!32757) Bool)

(assert (=> start!46046 (array_inv!11553 a!3235)))

(declare-fun b!509923 () Bool)

(declare-fun res!310768 () Bool)

(assert (=> b!509923 (=> (not res!310768) (not e!298136))))

(declare-datatypes ((List!9915 0))(
  ( (Nil!9912) (Cons!9911 (h!10788 (_ BitVec 64)) (t!16143 List!9915)) )
))
(declare-fun arrayNoDuplicates!0 (array!32757 (_ BitVec 32) List!9915) Bool)

(assert (=> b!509923 (= res!310768 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9912))))

(declare-fun b!509924 () Bool)

(declare-fun res!310772 () Bool)

(assert (=> b!509924 (=> (not res!310772) (not e!298134))))

(assert (=> b!509924 (= res!310772 (validKeyInArray!0 (select (arr!15757 a!3235) j!176)))))

(declare-fun b!509925 () Bool)

(declare-fun res!310766 () Bool)

(assert (=> b!509925 (=> (not res!310766) (not e!298134))))

(assert (=> b!509925 (= res!310766 (and (= (size!16121 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16121 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16121 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509926 () Bool)

(assert (=> b!509926 (= e!298136 (not true))))

(declare-fun lt!233039 () (_ BitVec 32))

(declare-fun lt!233036 () SeekEntryResult!4224)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32757 (_ BitVec 32)) SeekEntryResult!4224)

(assert (=> b!509926 (= lt!233036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233039 (select (store (arr!15757 a!3235) i!1204 k0!2280) j!176) (array!32758 (store (arr!15757 a!3235) i!1204 k0!2280) (size!16121 a!3235)) mask!3524))))

(declare-fun lt!233037 () SeekEntryResult!4224)

(declare-fun lt!233041 () (_ BitVec 32))

(assert (=> b!509926 (= lt!233037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233041 (select (arr!15757 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509926 (= lt!233039 (toIndex!0 (select (store (arr!15757 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509926 (= lt!233041 (toIndex!0 (select (arr!15757 a!3235) j!176) mask!3524))))

(assert (=> b!509926 e!298135))

(declare-fun res!310764 () Bool)

(assert (=> b!509926 (=> (not res!310764) (not e!298135))))

(assert (=> b!509926 (= res!310764 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15706 0))(
  ( (Unit!15707) )
))
(declare-fun lt!233040 () Unit!15706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15706)

(assert (=> b!509926 (= lt!233040 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509927 () Bool)

(declare-fun res!310767 () Bool)

(assert (=> b!509927 (=> (not res!310767) (not e!298134))))

(declare-fun arrayContainsKey!0 (array!32757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509927 (= res!310767 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46046 res!310765) b!509925))

(assert (= (and b!509925 res!310766) b!509924))

(assert (= (and b!509924 res!310772) b!509920))

(assert (= (and b!509920 res!310769) b!509927))

(assert (= (and b!509927 res!310767) b!509919))

(assert (= (and b!509919 res!310770) b!509922))

(assert (= (and b!509922 res!310771) b!509923))

(assert (= (and b!509923 res!310768) b!509926))

(assert (= (and b!509926 res!310764) b!509921))

(declare-fun m!490965 () Bool)

(assert (=> b!509924 m!490965))

(assert (=> b!509924 m!490965))

(declare-fun m!490967 () Bool)

(assert (=> b!509924 m!490967))

(declare-fun m!490969 () Bool)

(assert (=> b!509919 m!490969))

(declare-fun m!490971 () Bool)

(assert (=> b!509920 m!490971))

(declare-fun m!490973 () Bool)

(assert (=> start!46046 m!490973))

(declare-fun m!490975 () Bool)

(assert (=> start!46046 m!490975))

(declare-fun m!490977 () Bool)

(assert (=> b!509927 m!490977))

(assert (=> b!509921 m!490965))

(assert (=> b!509921 m!490965))

(declare-fun m!490979 () Bool)

(assert (=> b!509921 m!490979))

(declare-fun m!490981 () Bool)

(assert (=> b!509923 m!490981))

(declare-fun m!490983 () Bool)

(assert (=> b!509926 m!490983))

(declare-fun m!490985 () Bool)

(assert (=> b!509926 m!490985))

(assert (=> b!509926 m!490965))

(declare-fun m!490987 () Bool)

(assert (=> b!509926 m!490987))

(assert (=> b!509926 m!490965))

(declare-fun m!490989 () Bool)

(assert (=> b!509926 m!490989))

(assert (=> b!509926 m!490985))

(declare-fun m!490991 () Bool)

(assert (=> b!509926 m!490991))

(assert (=> b!509926 m!490965))

(declare-fun m!490993 () Bool)

(assert (=> b!509926 m!490993))

(assert (=> b!509926 m!490985))

(declare-fun m!490995 () Bool)

(assert (=> b!509926 m!490995))

(declare-fun m!490997 () Bool)

(assert (=> b!509926 m!490997))

(declare-fun m!490999 () Bool)

(assert (=> b!509922 m!490999))

(check-sat (not b!509924) (not b!509922) (not b!509926) (not b!509920) (not start!46046) (not b!509919) (not b!509921) (not b!509927) (not b!509923))
(check-sat)
