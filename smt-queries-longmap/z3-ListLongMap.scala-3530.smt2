; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48738 () Bool)

(assert start!48738)

(declare-fun b!535834 () Bool)

(declare-fun res!331192 () Bool)

(declare-fun e!311114 () Bool)

(assert (=> b!535834 (=> (not res!331192) (not e!311114))))

(declare-datatypes ((array!33960 0))(
  ( (array!33961 (arr!16319 (Array (_ BitVec 32) (_ BitVec 64))) (size!16684 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33960)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33960 (_ BitVec 32)) Bool)

(assert (=> b!535834 (= res!331192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535835 () Bool)

(declare-fun e!311113 () Bool)

(assert (=> b!535835 (= e!311114 e!311113)))

(declare-fun res!331188 () Bool)

(assert (=> b!535835 (=> (not res!331188) (not e!311113))))

(declare-datatypes ((SeekEntryResult!4774 0))(
  ( (MissingZero!4774 (index!21320 (_ BitVec 32))) (Found!4774 (index!21321 (_ BitVec 32))) (Intermediate!4774 (undefined!5586 Bool) (index!21322 (_ BitVec 32)) (x!50272 (_ BitVec 32))) (Undefined!4774) (MissingVacant!4774 (index!21323 (_ BitVec 32))) )
))
(declare-fun lt!245759 () SeekEntryResult!4774)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535835 (= res!331188 (= lt!245759 (Intermediate!4774 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33960 (_ BitVec 32)) SeekEntryResult!4774)

(assert (=> b!535835 (= lt!245759 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16319 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535836 () Bool)

(declare-fun res!331184 () Bool)

(declare-fun e!311111 () Bool)

(assert (=> b!535836 (=> (not res!331184) (not e!311111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535836 (= res!331184 (validKeyInArray!0 (select (arr!16319 a!3154) j!147)))))

(declare-fun b!535837 () Bool)

(declare-fun e!311112 () Bool)

(assert (=> b!535837 (= e!311112 false)))

(declare-fun lt!245761 () (_ BitVec 32))

(declare-fun lt!245758 () SeekEntryResult!4774)

(assert (=> b!535837 (= lt!245758 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245761 (select (arr!16319 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535838 () Bool)

(declare-fun res!331187 () Bool)

(assert (=> b!535838 (=> (not res!331187) (not e!311114))))

(declare-datatypes ((List!10477 0))(
  ( (Nil!10474) (Cons!10473 (h!11416 (_ BitVec 64)) (t!16696 List!10477)) )
))
(declare-fun arrayNoDuplicates!0 (array!33960 (_ BitVec 32) List!10477) Bool)

(assert (=> b!535838 (= res!331187 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10474))))

(declare-fun b!535839 () Bool)

(declare-fun res!331193 () Bool)

(assert (=> b!535839 (=> (not res!331193) (not e!311111))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!535839 (= res!331193 (validKeyInArray!0 k0!1998))))

(declare-fun b!535840 () Bool)

(declare-fun res!331189 () Bool)

(assert (=> b!535840 (=> (not res!331189) (not e!311111))))

(declare-fun arrayContainsKey!0 (array!33960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535840 (= res!331189 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535841 () Bool)

(assert (=> b!535841 (= e!311111 e!311114)))

(declare-fun res!331182 () Bool)

(assert (=> b!535841 (=> (not res!331182) (not e!311114))))

(declare-fun lt!245760 () SeekEntryResult!4774)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535841 (= res!331182 (or (= lt!245760 (MissingZero!4774 i!1153)) (= lt!245760 (MissingVacant!4774 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33960 (_ BitVec 32)) SeekEntryResult!4774)

(assert (=> b!535841 (= lt!245760 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535842 () Bool)

(declare-fun res!331190 () Bool)

(assert (=> b!535842 (=> (not res!331190) (not e!311113))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535842 (= res!331190 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16319 a!3154) j!147) mask!3216) (select (arr!16319 a!3154) j!147) a!3154 mask!3216) lt!245759))))

(declare-fun b!535843 () Bool)

(declare-fun res!331185 () Bool)

(assert (=> b!535843 (=> (not res!331185) (not e!311113))))

(assert (=> b!535843 (= res!331185 (and (not (= (select (arr!16319 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16319 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16319 a!3154) index!1177) (select (arr!16319 a!3154) j!147)))))))

(declare-fun b!535844 () Bool)

(assert (=> b!535844 (= e!311113 e!311112)))

(declare-fun res!331191 () Bool)

(assert (=> b!535844 (=> (not res!331191) (not e!311112))))

(assert (=> b!535844 (= res!331191 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245761 #b00000000000000000000000000000000) (bvslt lt!245761 (size!16684 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535844 (= lt!245761 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535845 () Bool)

(declare-fun res!331183 () Bool)

(assert (=> b!535845 (=> (not res!331183) (not e!311111))))

(assert (=> b!535845 (= res!331183 (and (= (size!16684 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16684 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16684 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535846 () Bool)

(declare-fun res!331181 () Bool)

(assert (=> b!535846 (=> (not res!331181) (not e!311114))))

(assert (=> b!535846 (= res!331181 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16684 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16684 a!3154)) (= (select (arr!16319 a!3154) resIndex!32) (select (arr!16319 a!3154) j!147))))))

(declare-fun res!331186 () Bool)

(assert (=> start!48738 (=> (not res!331186) (not e!311111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48738 (= res!331186 (validMask!0 mask!3216))))

(assert (=> start!48738 e!311111))

(assert (=> start!48738 true))

(declare-fun array_inv!12202 (array!33960) Bool)

(assert (=> start!48738 (array_inv!12202 a!3154)))

(assert (= (and start!48738 res!331186) b!535845))

(assert (= (and b!535845 res!331183) b!535836))

(assert (= (and b!535836 res!331184) b!535839))

(assert (= (and b!535839 res!331193) b!535840))

(assert (= (and b!535840 res!331189) b!535841))

(assert (= (and b!535841 res!331182) b!535834))

(assert (= (and b!535834 res!331192) b!535838))

(assert (= (and b!535838 res!331187) b!535846))

(assert (= (and b!535846 res!331181) b!535835))

(assert (= (and b!535835 res!331188) b!535842))

(assert (= (and b!535842 res!331190) b!535843))

(assert (= (and b!535843 res!331185) b!535844))

(assert (= (and b!535844 res!331191) b!535837))

(declare-fun m!514825 () Bool)

(assert (=> b!535836 m!514825))

(assert (=> b!535836 m!514825))

(declare-fun m!514827 () Bool)

(assert (=> b!535836 m!514827))

(declare-fun m!514829 () Bool)

(assert (=> start!48738 m!514829))

(declare-fun m!514831 () Bool)

(assert (=> start!48738 m!514831))

(declare-fun m!514833 () Bool)

(assert (=> b!535839 m!514833))

(declare-fun m!514835 () Bool)

(assert (=> b!535843 m!514835))

(assert (=> b!535843 m!514825))

(assert (=> b!535842 m!514825))

(assert (=> b!535842 m!514825))

(declare-fun m!514837 () Bool)

(assert (=> b!535842 m!514837))

(assert (=> b!535842 m!514837))

(assert (=> b!535842 m!514825))

(declare-fun m!514839 () Bool)

(assert (=> b!535842 m!514839))

(assert (=> b!535837 m!514825))

(assert (=> b!535837 m!514825))

(declare-fun m!514841 () Bool)

(assert (=> b!535837 m!514841))

(assert (=> b!535835 m!514825))

(assert (=> b!535835 m!514825))

(declare-fun m!514843 () Bool)

(assert (=> b!535835 m!514843))

(declare-fun m!514845 () Bool)

(assert (=> b!535840 m!514845))

(declare-fun m!514847 () Bool)

(assert (=> b!535846 m!514847))

(assert (=> b!535846 m!514825))

(declare-fun m!514849 () Bool)

(assert (=> b!535844 m!514849))

(declare-fun m!514851 () Bool)

(assert (=> b!535838 m!514851))

(declare-fun m!514853 () Bool)

(assert (=> b!535834 m!514853))

(declare-fun m!514855 () Bool)

(assert (=> b!535841 m!514855))

(check-sat (not b!535837) (not b!535835) (not b!535838) (not start!48738) (not b!535841) (not b!535836) (not b!535834) (not b!535844) (not b!535840) (not b!535839) (not b!535842))
(check-sat)
