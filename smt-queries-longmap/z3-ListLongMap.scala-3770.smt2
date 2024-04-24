; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51660 () Bool)

(assert start!51660)

(declare-fun b!565044 () Bool)

(declare-fun res!356096 () Bool)

(declare-fun e!325395 () Bool)

(assert (=> b!565044 (=> (not res!356096) (not e!325395))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565044 (= res!356096 (validKeyInArray!0 k0!1914))))

(declare-fun res!356092 () Bool)

(assert (=> start!51660 (=> (not res!356092) (not e!325395))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51660 (= res!356092 (validMask!0 mask!3119))))

(assert (=> start!51660 e!325395))

(assert (=> start!51660 true))

(declare-datatypes ((array!35472 0))(
  ( (array!35473 (arr!17035 (Array (_ BitVec 32) (_ BitVec 64))) (size!17399 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35472)

(declare-fun array_inv!12894 (array!35472) Bool)

(assert (=> start!51660 (array_inv!12894 a!3118)))

(declare-fun b!565045 () Bool)

(declare-fun e!325393 () Bool)

(assert (=> b!565045 (= e!325395 e!325393)))

(declare-fun res!356097 () Bool)

(assert (=> b!565045 (=> (not res!356097) (not e!325393))))

(declare-datatypes ((SeekEntryResult!5440 0))(
  ( (MissingZero!5440 (index!23987 (_ BitVec 32))) (Found!5440 (index!23988 (_ BitVec 32))) (Intermediate!5440 (undefined!6252 Bool) (index!23989 (_ BitVec 32)) (x!53010 (_ BitVec 32))) (Undefined!5440) (MissingVacant!5440 (index!23990 (_ BitVec 32))) )
))
(declare-fun lt!257785 () SeekEntryResult!5440)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565045 (= res!356097 (or (= lt!257785 (MissingZero!5440 i!1132)) (= lt!257785 (MissingVacant!5440 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35472 (_ BitVec 32)) SeekEntryResult!5440)

(assert (=> b!565045 (= lt!257785 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565046 () Bool)

(declare-fun res!356098 () Bool)

(assert (=> b!565046 (=> (not res!356098) (not e!325395))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!565046 (= res!356098 (and (= (size!17399 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17399 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17399 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565047 () Bool)

(declare-fun res!356095 () Bool)

(assert (=> b!565047 (=> (not res!356095) (not e!325395))))

(declare-fun arrayContainsKey!0 (array!35472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565047 (= res!356095 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565048 () Bool)

(declare-fun res!356093 () Bool)

(assert (=> b!565048 (=> (not res!356093) (not e!325395))))

(assert (=> b!565048 (= res!356093 (validKeyInArray!0 (select (arr!17035 a!3118) j!142)))))

(declare-fun b!565049 () Bool)

(declare-fun res!356094 () Bool)

(assert (=> b!565049 (=> (not res!356094) (not e!325393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35472 (_ BitVec 32)) Bool)

(assert (=> b!565049 (= res!356094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565050 () Bool)

(declare-fun res!356091 () Bool)

(assert (=> b!565050 (=> (not res!356091) (not e!325393))))

(declare-datatypes ((List!11022 0))(
  ( (Nil!11019) (Cons!11018 (h!12024 (_ BitVec 64)) (t!17242 List!11022)) )
))
(declare-fun arrayNoDuplicates!0 (array!35472 (_ BitVec 32) List!11022) Bool)

(assert (=> b!565050 (= res!356091 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11019))))

(declare-fun b!565051 () Bool)

(assert (=> b!565051 (= e!325393 false)))

(declare-fun lt!257782 () SeekEntryResult!5440)

(declare-fun lt!257781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35472 (_ BitVec 32)) SeekEntryResult!5440)

(assert (=> b!565051 (= lt!257782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257781 (select (store (arr!17035 a!3118) i!1132 k0!1914) j!142) (array!35473 (store (arr!17035 a!3118) i!1132 k0!1914) (size!17399 a!3118)) mask!3119))))

(declare-fun lt!257783 () (_ BitVec 32))

(declare-fun lt!257784 () SeekEntryResult!5440)

(assert (=> b!565051 (= lt!257784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257783 (select (arr!17035 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565051 (= lt!257781 (toIndex!0 (select (store (arr!17035 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!565051 (= lt!257783 (toIndex!0 (select (arr!17035 a!3118) j!142) mask!3119))))

(assert (= (and start!51660 res!356092) b!565046))

(assert (= (and b!565046 res!356098) b!565048))

(assert (= (and b!565048 res!356093) b!565044))

(assert (= (and b!565044 res!356096) b!565047))

(assert (= (and b!565047 res!356095) b!565045))

(assert (= (and b!565045 res!356097) b!565049))

(assert (= (and b!565049 res!356094) b!565050))

(assert (= (and b!565050 res!356091) b!565051))

(declare-fun m!543659 () Bool)

(assert (=> b!565048 m!543659))

(assert (=> b!565048 m!543659))

(declare-fun m!543661 () Bool)

(assert (=> b!565048 m!543661))

(declare-fun m!543663 () Bool)

(assert (=> start!51660 m!543663))

(declare-fun m!543665 () Bool)

(assert (=> start!51660 m!543665))

(declare-fun m!543667 () Bool)

(assert (=> b!565047 m!543667))

(declare-fun m!543669 () Bool)

(assert (=> b!565049 m!543669))

(assert (=> b!565051 m!543659))

(declare-fun m!543671 () Bool)

(assert (=> b!565051 m!543671))

(declare-fun m!543673 () Bool)

(assert (=> b!565051 m!543673))

(assert (=> b!565051 m!543671))

(declare-fun m!543675 () Bool)

(assert (=> b!565051 m!543675))

(assert (=> b!565051 m!543671))

(declare-fun m!543677 () Bool)

(assert (=> b!565051 m!543677))

(assert (=> b!565051 m!543659))

(declare-fun m!543679 () Bool)

(assert (=> b!565051 m!543679))

(assert (=> b!565051 m!543659))

(declare-fun m!543681 () Bool)

(assert (=> b!565051 m!543681))

(declare-fun m!543683 () Bool)

(assert (=> b!565050 m!543683))

(declare-fun m!543685 () Bool)

(assert (=> b!565044 m!543685))

(declare-fun m!543687 () Bool)

(assert (=> b!565045 m!543687))

(check-sat (not b!565044) (not start!51660) (not b!565051) (not b!565049) (not b!565045) (not b!565050) (not b!565048) (not b!565047))
(check-sat)
