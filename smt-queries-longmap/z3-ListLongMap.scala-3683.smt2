; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50716 () Bool)

(assert start!50716)

(declare-fun b!554658 () Bool)

(declare-fun e!319788 () Bool)

(assert (=> b!554658 (= e!319788 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5229 0))(
  ( (MissingZero!5229 (index!23143 (_ BitVec 32))) (Found!5229 (index!23144 (_ BitVec 32))) (Intermediate!5229 (undefined!6041 Bool) (index!23145 (_ BitVec 32)) (x!52055 (_ BitVec 32))) (Undefined!5229) (MissingVacant!5229 (index!23146 (_ BitVec 32))) )
))
(declare-fun lt!251898 () SeekEntryResult!5229)

(declare-fun lt!251899 () SeekEntryResult!5229)

(declare-datatypes ((array!34941 0))(
  ( (array!34942 (arr!16780 (Array (_ BitVec 32) (_ BitVec 64))) (size!17144 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34941)

(get-info :version)

(assert (=> b!554658 (and (= lt!251899 (Found!5229 j!142)) (or (undefined!6041 lt!251898) (not ((_ is Intermediate!5229) lt!251898)) (= (select (arr!16780 a!3118) (index!23145 lt!251898)) (select (arr!16780 a!3118) j!142)) (not (= (select (arr!16780 a!3118) (index!23145 lt!251898)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251899 (MissingZero!5229 (index!23145 lt!251898)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34941 (_ BitVec 32)) SeekEntryResult!5229)

(assert (=> b!554658 (= lt!251899 (seekEntryOrOpen!0 (select (arr!16780 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34941 (_ BitVec 32)) Bool)

(assert (=> b!554658 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17232 0))(
  ( (Unit!17233) )
))
(declare-fun lt!251894 () Unit!17232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17232)

(assert (=> b!554658 (= lt!251894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554659 () Bool)

(declare-fun res!347073 () Bool)

(declare-fun e!319791 () Bool)

(assert (=> b!554659 (=> (not res!347073) (not e!319791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554659 (= res!347073 (validKeyInArray!0 (select (arr!16780 a!3118) j!142)))))

(declare-fun b!554660 () Bool)

(declare-fun res!347075 () Bool)

(declare-fun e!319789 () Bool)

(assert (=> b!554660 (=> (not res!347075) (not e!319789))))

(assert (=> b!554660 (= res!347075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554661 () Bool)

(declare-fun res!347071 () Bool)

(assert (=> b!554661 (=> (not res!347071) (not e!319789))))

(declare-datatypes ((List!10860 0))(
  ( (Nil!10857) (Cons!10856 (h!11841 (_ BitVec 64)) (t!17088 List!10860)) )
))
(declare-fun arrayNoDuplicates!0 (array!34941 (_ BitVec 32) List!10860) Bool)

(assert (=> b!554661 (= res!347071 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10857))))

(declare-fun b!554662 () Bool)

(assert (=> b!554662 (= e!319789 e!319788)))

(declare-fun res!347078 () Bool)

(assert (=> b!554662 (=> (not res!347078) (not e!319788))))

(declare-fun lt!251896 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34941 (_ BitVec 32)) SeekEntryResult!5229)

(assert (=> b!554662 (= res!347078 (= lt!251898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251896 (select (store (arr!16780 a!3118) i!1132 k0!1914) j!142) (array!34942 (store (arr!16780 a!3118) i!1132 k0!1914) (size!17144 a!3118)) mask!3119)))))

(declare-fun lt!251897 () (_ BitVec 32))

(assert (=> b!554662 (= lt!251898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251897 (select (arr!16780 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554662 (= lt!251896 (toIndex!0 (select (store (arr!16780 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554662 (= lt!251897 (toIndex!0 (select (arr!16780 a!3118) j!142) mask!3119))))

(declare-fun b!554663 () Bool)

(declare-fun res!347070 () Bool)

(assert (=> b!554663 (=> (not res!347070) (not e!319791))))

(assert (=> b!554663 (= res!347070 (validKeyInArray!0 k0!1914))))

(declare-fun b!554664 () Bool)

(declare-fun res!347077 () Bool)

(assert (=> b!554664 (=> (not res!347077) (not e!319791))))

(assert (=> b!554664 (= res!347077 (and (= (size!17144 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17144 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17144 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554665 () Bool)

(assert (=> b!554665 (= e!319791 e!319789)))

(declare-fun res!347072 () Bool)

(assert (=> b!554665 (=> (not res!347072) (not e!319789))))

(declare-fun lt!251895 () SeekEntryResult!5229)

(assert (=> b!554665 (= res!347072 (or (= lt!251895 (MissingZero!5229 i!1132)) (= lt!251895 (MissingVacant!5229 i!1132))))))

(assert (=> b!554665 (= lt!251895 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554666 () Bool)

(declare-fun res!347074 () Bool)

(assert (=> b!554666 (=> (not res!347074) (not e!319791))))

(declare-fun arrayContainsKey!0 (array!34941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554666 (= res!347074 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!347076 () Bool)

(assert (=> start!50716 (=> (not res!347076) (not e!319791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50716 (= res!347076 (validMask!0 mask!3119))))

(assert (=> start!50716 e!319791))

(assert (=> start!50716 true))

(declare-fun array_inv!12576 (array!34941) Bool)

(assert (=> start!50716 (array_inv!12576 a!3118)))

(assert (= (and start!50716 res!347076) b!554664))

(assert (= (and b!554664 res!347077) b!554659))

(assert (= (and b!554659 res!347073) b!554663))

(assert (= (and b!554663 res!347070) b!554666))

(assert (= (and b!554666 res!347074) b!554665))

(assert (= (and b!554665 res!347072) b!554660))

(assert (= (and b!554660 res!347075) b!554661))

(assert (= (and b!554661 res!347071) b!554662))

(assert (= (and b!554662 res!347078) b!554658))

(declare-fun m!532025 () Bool)

(assert (=> b!554660 m!532025))

(declare-fun m!532027 () Bool)

(assert (=> b!554662 m!532027))

(declare-fun m!532029 () Bool)

(assert (=> b!554662 m!532029))

(assert (=> b!554662 m!532027))

(assert (=> b!554662 m!532027))

(declare-fun m!532031 () Bool)

(assert (=> b!554662 m!532031))

(declare-fun m!532033 () Bool)

(assert (=> b!554662 m!532033))

(declare-fun m!532035 () Bool)

(assert (=> b!554662 m!532035))

(assert (=> b!554662 m!532033))

(declare-fun m!532037 () Bool)

(assert (=> b!554662 m!532037))

(assert (=> b!554662 m!532033))

(declare-fun m!532039 () Bool)

(assert (=> b!554662 m!532039))

(declare-fun m!532041 () Bool)

(assert (=> start!50716 m!532041))

(declare-fun m!532043 () Bool)

(assert (=> start!50716 m!532043))

(declare-fun m!532045 () Bool)

(assert (=> b!554665 m!532045))

(declare-fun m!532047 () Bool)

(assert (=> b!554658 m!532047))

(assert (=> b!554658 m!532027))

(declare-fun m!532049 () Bool)

(assert (=> b!554658 m!532049))

(declare-fun m!532051 () Bool)

(assert (=> b!554658 m!532051))

(assert (=> b!554658 m!532027))

(declare-fun m!532053 () Bool)

(assert (=> b!554658 m!532053))

(declare-fun m!532055 () Bool)

(assert (=> b!554663 m!532055))

(declare-fun m!532057 () Bool)

(assert (=> b!554661 m!532057))

(declare-fun m!532059 () Bool)

(assert (=> b!554666 m!532059))

(assert (=> b!554659 m!532027))

(assert (=> b!554659 m!532027))

(declare-fun m!532061 () Bool)

(assert (=> b!554659 m!532061))

(check-sat (not b!554659) (not b!554665) (not start!50716) (not b!554661) (not b!554663) (not b!554666) (not b!554660) (not b!554658) (not b!554662))
(check-sat)
