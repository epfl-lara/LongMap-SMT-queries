; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51734 () Bool)

(assert start!51734)

(declare-fun b!566003 () Bool)

(declare-fun e!325786 () Bool)

(declare-fun e!325787 () Bool)

(assert (=> b!566003 (= e!325786 e!325787)))

(declare-fun res!356978 () Bool)

(assert (=> b!566003 (=> (not res!356978) (not e!325787))))

(declare-datatypes ((SeekEntryResult!5519 0))(
  ( (MissingZero!5519 (index!24303 (_ BitVec 32))) (Found!5519 (index!24304 (_ BitVec 32))) (Intermediate!5519 (undefined!6331 Bool) (index!24305 (_ BitVec 32)) (x!53172 (_ BitVec 32))) (Undefined!5519) (MissingVacant!5519 (index!24306 (_ BitVec 32))) )
))
(declare-fun lt!258000 () SeekEntryResult!5519)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566003 (= res!356978 (or (= lt!258000 (MissingZero!5519 i!1132)) (= lt!258000 (MissingVacant!5519 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35542 0))(
  ( (array!35543 (arr!17070 (Array (_ BitVec 32) (_ BitVec 64))) (size!17434 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35542)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35542 (_ BitVec 32)) SeekEntryResult!5519)

(assert (=> b!566003 (= lt!258000 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!356975 () Bool)

(assert (=> start!51734 (=> (not res!356975) (not e!325786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51734 (= res!356975 (validMask!0 mask!3119))))

(assert (=> start!51734 e!325786))

(assert (=> start!51734 true))

(declare-fun array_inv!12866 (array!35542) Bool)

(assert (=> start!51734 (array_inv!12866 a!3118)))

(declare-fun b!566004 () Bool)

(declare-fun res!356977 () Bool)

(assert (=> b!566004 (=> (not res!356977) (not e!325786))))

(declare-fun arrayContainsKey!0 (array!35542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566004 (= res!356977 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566005 () Bool)

(declare-fun res!356974 () Bool)

(assert (=> b!566005 (=> (not res!356974) (not e!325786))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566005 (= res!356974 (validKeyInArray!0 (select (arr!17070 a!3118) j!142)))))

(declare-fun b!566006 () Bool)

(declare-fun res!356980 () Bool)

(assert (=> b!566006 (=> (not res!356980) (not e!325787))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35542 (_ BitVec 32)) SeekEntryResult!5519)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566006 (= res!356980 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17070 a!3118) j!142) mask!3119) (select (arr!17070 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17070 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17070 a!3118) i!1132 k!1914) j!142) (array!35543 (store (arr!17070 a!3118) i!1132 k!1914) (size!17434 a!3118)) mask!3119)))))

(declare-fun e!325788 () Bool)

(declare-fun b!566007 () Bool)

(assert (=> b!566007 (= e!325788 (= (seekEntryOrOpen!0 (select (arr!17070 a!3118) j!142) a!3118 mask!3119) (Found!5519 j!142)))))

(declare-fun b!566008 () Bool)

(declare-fun res!356981 () Bool)

(assert (=> b!566008 (=> (not res!356981) (not e!325786))))

(assert (=> b!566008 (= res!356981 (validKeyInArray!0 k!1914))))

(declare-fun b!566009 () Bool)

(declare-fun res!356976 () Bool)

(assert (=> b!566009 (=> (not res!356976) (not e!325787))))

(declare-datatypes ((List!11150 0))(
  ( (Nil!11147) (Cons!11146 (h!12152 (_ BitVec 64)) (t!17378 List!11150)) )
))
(declare-fun arrayNoDuplicates!0 (array!35542 (_ BitVec 32) List!11150) Bool)

(assert (=> b!566009 (= res!356976 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11147))))

(declare-fun b!566010 () Bool)

(assert (=> b!566010 (= e!325787 (not true))))

(assert (=> b!566010 e!325788))

(declare-fun res!356972 () Bool)

(assert (=> b!566010 (=> (not res!356972) (not e!325788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35542 (_ BitVec 32)) Bool)

(assert (=> b!566010 (= res!356972 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17740 0))(
  ( (Unit!17741) )
))
(declare-fun lt!258001 () Unit!17740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17740)

(assert (=> b!566010 (= lt!258001 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566011 () Bool)

(declare-fun res!356979 () Bool)

(assert (=> b!566011 (=> (not res!356979) (not e!325787))))

(assert (=> b!566011 (= res!356979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566012 () Bool)

(declare-fun res!356973 () Bool)

(assert (=> b!566012 (=> (not res!356973) (not e!325786))))

(assert (=> b!566012 (= res!356973 (and (= (size!17434 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17434 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17434 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51734 res!356975) b!566012))

(assert (= (and b!566012 res!356973) b!566005))

(assert (= (and b!566005 res!356974) b!566008))

(assert (= (and b!566008 res!356981) b!566004))

(assert (= (and b!566004 res!356977) b!566003))

(assert (= (and b!566003 res!356978) b!566011))

(assert (= (and b!566011 res!356979) b!566009))

(assert (= (and b!566009 res!356976) b!566006))

(assert (= (and b!566006 res!356980) b!566010))

(assert (= (and b!566010 res!356972) b!566007))

(declare-fun m!544575 () Bool)

(assert (=> b!566009 m!544575))

(declare-fun m!544577 () Bool)

(assert (=> b!566006 m!544577))

(declare-fun m!544579 () Bool)

(assert (=> b!566006 m!544579))

(assert (=> b!566006 m!544577))

(declare-fun m!544581 () Bool)

(assert (=> b!566006 m!544581))

(declare-fun m!544583 () Bool)

(assert (=> b!566006 m!544583))

(assert (=> b!566006 m!544581))

(declare-fun m!544585 () Bool)

(assert (=> b!566006 m!544585))

(assert (=> b!566006 m!544579))

(assert (=> b!566006 m!544577))

(declare-fun m!544587 () Bool)

(assert (=> b!566006 m!544587))

(declare-fun m!544589 () Bool)

(assert (=> b!566006 m!544589))

(assert (=> b!566006 m!544581))

(assert (=> b!566006 m!544583))

(declare-fun m!544591 () Bool)

(assert (=> b!566003 m!544591))

(declare-fun m!544593 () Bool)

(assert (=> b!566011 m!544593))

(declare-fun m!544595 () Bool)

(assert (=> b!566008 m!544595))

(declare-fun m!544597 () Bool)

(assert (=> start!51734 m!544597))

(declare-fun m!544599 () Bool)

(assert (=> start!51734 m!544599))

(declare-fun m!544601 () Bool)

(assert (=> b!566004 m!544601))

(assert (=> b!566007 m!544577))

(assert (=> b!566007 m!544577))

(declare-fun m!544603 () Bool)

(assert (=> b!566007 m!544603))

(assert (=> b!566005 m!544577))

(assert (=> b!566005 m!544577))

(declare-fun m!544605 () Bool)

(assert (=> b!566005 m!544605))

(declare-fun m!544607 () Bool)

(assert (=> b!566010 m!544607))

(declare-fun m!544609 () Bool)

(assert (=> b!566010 m!544609))

(push 1)

