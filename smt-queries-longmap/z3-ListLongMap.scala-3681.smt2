; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50748 () Bool)

(assert start!50748)

(declare-fun b!554662 () Bool)

(declare-fun res!346978 () Bool)

(declare-fun e!319833 () Bool)

(assert (=> b!554662 (=> (not res!346978) (not e!319833))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34920 0))(
  ( (array!34921 (arr!16768 (Array (_ BitVec 32) (_ BitVec 64))) (size!17132 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34920)

(declare-datatypes ((SeekEntryResult!5173 0))(
  ( (MissingZero!5173 (index!22919 (_ BitVec 32))) (Found!5173 (index!22920 (_ BitVec 32))) (Intermediate!5173 (undefined!5985 Bool) (index!22921 (_ BitVec 32)) (x!51986 (_ BitVec 32))) (Undefined!5173) (MissingVacant!5173 (index!22922 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34920 (_ BitVec 32)) SeekEntryResult!5173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554662 (= res!346978 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16768 a!3118) j!142) mask!3119) (select (arr!16768 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16768 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16768 a!3118) i!1132 k0!1914) j!142) (array!34921 (store (arr!16768 a!3118) i!1132 k0!1914) (size!17132 a!3118)) mask!3119)))))

(declare-fun b!554663 () Bool)

(declare-fun res!346973 () Bool)

(declare-fun e!319836 () Bool)

(assert (=> b!554663 (=> (not res!346973) (not e!319836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554663 (= res!346973 (validKeyInArray!0 (select (arr!16768 a!3118) j!142)))))

(declare-fun b!554664 () Bool)

(assert (=> b!554664 (= e!319836 e!319833)))

(declare-fun res!346969 () Bool)

(assert (=> b!554664 (=> (not res!346969) (not e!319833))))

(declare-fun lt!251908 () SeekEntryResult!5173)

(assert (=> b!554664 (= res!346969 (or (= lt!251908 (MissingZero!5173 i!1132)) (= lt!251908 (MissingVacant!5173 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34920 (_ BitVec 32)) SeekEntryResult!5173)

(assert (=> b!554664 (= lt!251908 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554665 () Bool)

(assert (=> b!554665 (= e!319833 (not true))))

(declare-fun e!319835 () Bool)

(assert (=> b!554665 e!319835))

(declare-fun res!346976 () Bool)

(assert (=> b!554665 (=> (not res!346976) (not e!319835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34920 (_ BitVec 32)) Bool)

(assert (=> b!554665 (= res!346976 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17191 0))(
  ( (Unit!17192) )
))
(declare-fun lt!251907 () Unit!17191)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17191)

(assert (=> b!554665 (= lt!251907 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554666 () Bool)

(declare-fun res!346970 () Bool)

(assert (=> b!554666 (=> (not res!346970) (not e!319836))))

(assert (=> b!554666 (= res!346970 (validKeyInArray!0 k0!1914))))

(declare-fun b!554667 () Bool)

(assert (=> b!554667 (= e!319835 (= (seekEntryOrOpen!0 (select (arr!16768 a!3118) j!142) a!3118 mask!3119) (Found!5173 j!142)))))

(declare-fun b!554668 () Bool)

(declare-fun res!346971 () Bool)

(assert (=> b!554668 (=> (not res!346971) (not e!319836))))

(declare-fun arrayContainsKey!0 (array!34920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554668 (= res!346971 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!346972 () Bool)

(assert (=> start!50748 (=> (not res!346972) (not e!319836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50748 (= res!346972 (validMask!0 mask!3119))))

(assert (=> start!50748 e!319836))

(assert (=> start!50748 true))

(declare-fun array_inv!12627 (array!34920) Bool)

(assert (=> start!50748 (array_inv!12627 a!3118)))

(declare-fun b!554669 () Bool)

(declare-fun res!346977 () Bool)

(assert (=> b!554669 (=> (not res!346977) (not e!319836))))

(assert (=> b!554669 (= res!346977 (and (= (size!17132 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17132 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17132 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554670 () Bool)

(declare-fun res!346974 () Bool)

(assert (=> b!554670 (=> (not res!346974) (not e!319833))))

(declare-datatypes ((List!10755 0))(
  ( (Nil!10752) (Cons!10751 (h!11739 (_ BitVec 64)) (t!16975 List!10755)) )
))
(declare-fun arrayNoDuplicates!0 (array!34920 (_ BitVec 32) List!10755) Bool)

(assert (=> b!554670 (= res!346974 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10752))))

(declare-fun b!554671 () Bool)

(declare-fun res!346975 () Bool)

(assert (=> b!554671 (=> (not res!346975) (not e!319833))))

(assert (=> b!554671 (= res!346975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50748 res!346972) b!554669))

(assert (= (and b!554669 res!346977) b!554663))

(assert (= (and b!554663 res!346973) b!554666))

(assert (= (and b!554666 res!346970) b!554668))

(assert (= (and b!554668 res!346971) b!554664))

(assert (= (and b!554664 res!346969) b!554671))

(assert (= (and b!554671 res!346975) b!554670))

(assert (= (and b!554670 res!346974) b!554662))

(assert (= (and b!554662 res!346978) b!554665))

(assert (= (and b!554665 res!346976) b!554667))

(declare-fun m!532103 () Bool)

(assert (=> b!554662 m!532103))

(declare-fun m!532105 () Bool)

(assert (=> b!554662 m!532105))

(assert (=> b!554662 m!532103))

(declare-fun m!532107 () Bool)

(assert (=> b!554662 m!532107))

(declare-fun m!532109 () Bool)

(assert (=> b!554662 m!532109))

(assert (=> b!554662 m!532107))

(declare-fun m!532111 () Bool)

(assert (=> b!554662 m!532111))

(assert (=> b!554662 m!532105))

(assert (=> b!554662 m!532103))

(declare-fun m!532113 () Bool)

(assert (=> b!554662 m!532113))

(declare-fun m!532115 () Bool)

(assert (=> b!554662 m!532115))

(assert (=> b!554662 m!532107))

(assert (=> b!554662 m!532109))

(declare-fun m!532117 () Bool)

(assert (=> b!554664 m!532117))

(declare-fun m!532119 () Bool)

(assert (=> b!554666 m!532119))

(declare-fun m!532121 () Bool)

(assert (=> b!554665 m!532121))

(declare-fun m!532123 () Bool)

(assert (=> b!554665 m!532123))

(declare-fun m!532125 () Bool)

(assert (=> b!554670 m!532125))

(declare-fun m!532127 () Bool)

(assert (=> start!50748 m!532127))

(declare-fun m!532129 () Bool)

(assert (=> start!50748 m!532129))

(assert (=> b!554667 m!532103))

(assert (=> b!554667 m!532103))

(declare-fun m!532131 () Bool)

(assert (=> b!554667 m!532131))

(declare-fun m!532133 () Bool)

(assert (=> b!554668 m!532133))

(declare-fun m!532135 () Bool)

(assert (=> b!554671 m!532135))

(assert (=> b!554663 m!532103))

(assert (=> b!554663 m!532103))

(declare-fun m!532137 () Bool)

(assert (=> b!554663 m!532137))

(check-sat (not b!554665) (not b!554670) (not start!50748) (not b!554667) (not b!554664) (not b!554662) (not b!554668) (not b!554666) (not b!554671) (not b!554663))
(check-sat)
