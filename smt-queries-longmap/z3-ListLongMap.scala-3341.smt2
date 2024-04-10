; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46040 () Bool)

(assert start!46040)

(declare-fun b!509838 () Bool)

(declare-fun res!310686 () Bool)

(declare-fun e!298101 () Bool)

(assert (=> b!509838 (=> (not res!310686) (not e!298101))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509838 (= res!310686 (validKeyInArray!0 k0!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!298100 () Bool)

(declare-datatypes ((array!32751 0))(
  ( (array!32752 (arr!15754 (Array (_ BitVec 32) (_ BitVec 64))) (size!16118 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32751)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!509839 () Bool)

(declare-datatypes ((SeekEntryResult!4221 0))(
  ( (MissingZero!4221 (index!19072 (_ BitVec 32))) (Found!4221 (index!19073 (_ BitVec 32))) (Intermediate!4221 (undefined!5033 Bool) (index!19074 (_ BitVec 32)) (x!48038 (_ BitVec 32))) (Undefined!4221) (MissingVacant!4221 (index!19075 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32751 (_ BitVec 32)) SeekEntryResult!4221)

(assert (=> b!509839 (= e!298100 (= (seekEntryOrOpen!0 (select (arr!15754 a!3235) j!176) a!3235 mask!3524) (Found!4221 j!176)))))

(declare-fun res!310691 () Bool)

(assert (=> start!46040 (=> (not res!310691) (not e!298101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46040 (= res!310691 (validMask!0 mask!3524))))

(assert (=> start!46040 e!298101))

(assert (=> start!46040 true))

(declare-fun array_inv!11550 (array!32751) Bool)

(assert (=> start!46040 (array_inv!11550 a!3235)))

(declare-fun b!509840 () Bool)

(declare-fun res!310689 () Bool)

(assert (=> b!509840 (=> (not res!310689) (not e!298101))))

(declare-fun arrayContainsKey!0 (array!32751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509840 (= res!310689 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509841 () Bool)

(declare-fun res!310685 () Bool)

(assert (=> b!509841 (=> (not res!310685) (not e!298101))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509841 (= res!310685 (and (= (size!16118 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16118 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16118 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509842 () Bool)

(declare-fun res!310688 () Bool)

(declare-fun e!298098 () Bool)

(assert (=> b!509842 (=> (not res!310688) (not e!298098))))

(declare-datatypes ((List!9912 0))(
  ( (Nil!9909) (Cons!9908 (h!10785 (_ BitVec 64)) (t!16140 List!9912)) )
))
(declare-fun arrayNoDuplicates!0 (array!32751 (_ BitVec 32) List!9912) Bool)

(assert (=> b!509842 (= res!310688 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9909))))

(declare-fun b!509843 () Bool)

(assert (=> b!509843 (= e!298098 (not true))))

(declare-fun lt!232986 () (_ BitVec 32))

(declare-fun lt!232982 () SeekEntryResult!4221)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32751 (_ BitVec 32)) SeekEntryResult!4221)

(assert (=> b!509843 (= lt!232982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232986 (select (store (arr!15754 a!3235) i!1204 k0!2280) j!176) (array!32752 (store (arr!15754 a!3235) i!1204 k0!2280) (size!16118 a!3235)) mask!3524))))

(declare-fun lt!232983 () SeekEntryResult!4221)

(declare-fun lt!232985 () (_ BitVec 32))

(assert (=> b!509843 (= lt!232983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232985 (select (arr!15754 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509843 (= lt!232986 (toIndex!0 (select (store (arr!15754 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509843 (= lt!232985 (toIndex!0 (select (arr!15754 a!3235) j!176) mask!3524))))

(assert (=> b!509843 e!298100))

(declare-fun res!310683 () Bool)

(assert (=> b!509843 (=> (not res!310683) (not e!298100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32751 (_ BitVec 32)) Bool)

(assert (=> b!509843 (= res!310683 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15700 0))(
  ( (Unit!15701) )
))
(declare-fun lt!232987 () Unit!15700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15700)

(assert (=> b!509843 (= lt!232987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509844 () Bool)

(declare-fun res!310684 () Bool)

(assert (=> b!509844 (=> (not res!310684) (not e!298098))))

(assert (=> b!509844 (= res!310684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509845 () Bool)

(assert (=> b!509845 (= e!298101 e!298098)))

(declare-fun res!310687 () Bool)

(assert (=> b!509845 (=> (not res!310687) (not e!298098))))

(declare-fun lt!232984 () SeekEntryResult!4221)

(assert (=> b!509845 (= res!310687 (or (= lt!232984 (MissingZero!4221 i!1204)) (= lt!232984 (MissingVacant!4221 i!1204))))))

(assert (=> b!509845 (= lt!232984 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509846 () Bool)

(declare-fun res!310690 () Bool)

(assert (=> b!509846 (=> (not res!310690) (not e!298101))))

(assert (=> b!509846 (= res!310690 (validKeyInArray!0 (select (arr!15754 a!3235) j!176)))))

(assert (= (and start!46040 res!310691) b!509841))

(assert (= (and b!509841 res!310685) b!509846))

(assert (= (and b!509846 res!310690) b!509838))

(assert (= (and b!509838 res!310686) b!509840))

(assert (= (and b!509840 res!310689) b!509845))

(assert (= (and b!509845 res!310687) b!509844))

(assert (= (and b!509844 res!310684) b!509842))

(assert (= (and b!509842 res!310688) b!509843))

(assert (= (and b!509843 res!310683) b!509839))

(declare-fun m!490857 () Bool)

(assert (=> b!509843 m!490857))

(declare-fun m!490859 () Bool)

(assert (=> b!509843 m!490859))

(declare-fun m!490861 () Bool)

(assert (=> b!509843 m!490861))

(declare-fun m!490863 () Bool)

(assert (=> b!509843 m!490863))

(declare-fun m!490865 () Bool)

(assert (=> b!509843 m!490865))

(assert (=> b!509843 m!490863))

(declare-fun m!490867 () Bool)

(assert (=> b!509843 m!490867))

(assert (=> b!509843 m!490861))

(declare-fun m!490869 () Bool)

(assert (=> b!509843 m!490869))

(assert (=> b!509843 m!490863))

(declare-fun m!490871 () Bool)

(assert (=> b!509843 m!490871))

(assert (=> b!509843 m!490861))

(declare-fun m!490873 () Bool)

(assert (=> b!509843 m!490873))

(assert (=> b!509839 m!490863))

(assert (=> b!509839 m!490863))

(declare-fun m!490875 () Bool)

(assert (=> b!509839 m!490875))

(declare-fun m!490877 () Bool)

(assert (=> b!509838 m!490877))

(declare-fun m!490879 () Bool)

(assert (=> b!509840 m!490879))

(assert (=> b!509846 m!490863))

(assert (=> b!509846 m!490863))

(declare-fun m!490881 () Bool)

(assert (=> b!509846 m!490881))

(declare-fun m!490883 () Bool)

(assert (=> b!509844 m!490883))

(declare-fun m!490885 () Bool)

(assert (=> b!509842 m!490885))

(declare-fun m!490887 () Bool)

(assert (=> start!46040 m!490887))

(declare-fun m!490889 () Bool)

(assert (=> start!46040 m!490889))

(declare-fun m!490891 () Bool)

(assert (=> b!509845 m!490891))

(check-sat (not b!509840) (not b!509839) (not b!509844) (not b!509838) (not b!509846) (not b!509845) (not b!509842) (not b!509843) (not start!46040))
(check-sat)
