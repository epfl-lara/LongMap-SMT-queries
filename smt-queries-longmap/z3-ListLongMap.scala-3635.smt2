; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50174 () Bool)

(assert start!50174)

(declare-fun b!549009 () Bool)

(declare-fun res!342297 () Bool)

(declare-fun e!317101 () Bool)

(assert (=> b!549009 (=> (not res!342297) (not e!317101))))

(declare-datatypes ((array!34636 0))(
  ( (array!34637 (arr!16634 (Array (_ BitVec 32) (_ BitVec 64))) (size!16999 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34636)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34636 (_ BitVec 32)) Bool)

(assert (=> b!549009 (= res!342297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549010 () Bool)

(declare-fun e!317102 () Bool)

(assert (=> b!549010 (= e!317102 e!317101)))

(declare-fun res!342298 () Bool)

(assert (=> b!549010 (=> (not res!342298) (not e!317101))))

(declare-datatypes ((SeekEntryResult!5080 0))(
  ( (MissingZero!5080 (index!22547 (_ BitVec 32))) (Found!5080 (index!22548 (_ BitVec 32))) (Intermediate!5080 (undefined!5892 Bool) (index!22549 (_ BitVec 32)) (x!51493 (_ BitVec 32))) (Undefined!5080) (MissingVacant!5080 (index!22550 (_ BitVec 32))) )
))
(declare-fun lt!249850 () SeekEntryResult!5080)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549010 (= res!342298 (or (= lt!249850 (MissingZero!5080 i!1132)) (= lt!249850 (MissingVacant!5080 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34636 (_ BitVec 32)) SeekEntryResult!5080)

(assert (=> b!549010 (= lt!249850 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549011 () Bool)

(declare-fun res!342300 () Bool)

(assert (=> b!549011 (=> (not res!342300) (not e!317102))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549011 (= res!342300 (validKeyInArray!0 (select (arr!16634 a!3118) j!142)))))

(declare-fun b!549012 () Bool)

(declare-fun res!342299 () Bool)

(assert (=> b!549012 (=> (not res!342299) (not e!317102))))

(declare-fun arrayContainsKey!0 (array!34636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549012 (= res!342299 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549013 () Bool)

(declare-fun res!342302 () Bool)

(assert (=> b!549013 (=> (not res!342302) (not e!317101))))

(declare-datatypes ((List!10753 0))(
  ( (Nil!10750) (Cons!10749 (h!11722 (_ BitVec 64)) (t!16972 List!10753)) )
))
(declare-fun arrayNoDuplicates!0 (array!34636 (_ BitVec 32) List!10753) Bool)

(assert (=> b!549013 (= res!342302 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10750))))

(declare-fun b!549014 () Bool)

(assert (=> b!549014 (= e!317101 false)))

(declare-fun lt!249849 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549014 (= lt!249849 (toIndex!0 (select (store (arr!16634 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun res!342301 () Bool)

(assert (=> start!50174 (=> (not res!342301) (not e!317102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50174 (= res!342301 (validMask!0 mask!3119))))

(assert (=> start!50174 e!317102))

(assert (=> start!50174 true))

(declare-fun array_inv!12517 (array!34636) Bool)

(assert (=> start!50174 (array_inv!12517 a!3118)))

(declare-fun b!549015 () Bool)

(declare-fun res!342295 () Bool)

(assert (=> b!549015 (=> (not res!342295) (not e!317102))))

(assert (=> b!549015 (= res!342295 (validKeyInArray!0 k0!1914))))

(declare-fun b!549016 () Bool)

(declare-fun res!342296 () Bool)

(assert (=> b!549016 (=> (not res!342296) (not e!317102))))

(assert (=> b!549016 (= res!342296 (and (= (size!16999 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16999 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16999 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50174 res!342301) b!549016))

(assert (= (and b!549016 res!342296) b!549011))

(assert (= (and b!549011 res!342300) b!549015))

(assert (= (and b!549015 res!342295) b!549012))

(assert (= (and b!549012 res!342299) b!549010))

(assert (= (and b!549010 res!342298) b!549009))

(assert (= (and b!549009 res!342297) b!549013))

(assert (= (and b!549013 res!342302) b!549014))

(declare-fun m!525359 () Bool)

(assert (=> b!549009 m!525359))

(declare-fun m!525361 () Bool)

(assert (=> b!549014 m!525361))

(declare-fun m!525363 () Bool)

(assert (=> b!549014 m!525363))

(assert (=> b!549014 m!525363))

(declare-fun m!525365 () Bool)

(assert (=> b!549014 m!525365))

(declare-fun m!525367 () Bool)

(assert (=> b!549011 m!525367))

(assert (=> b!549011 m!525367))

(declare-fun m!525369 () Bool)

(assert (=> b!549011 m!525369))

(declare-fun m!525371 () Bool)

(assert (=> start!50174 m!525371))

(declare-fun m!525373 () Bool)

(assert (=> start!50174 m!525373))

(declare-fun m!525375 () Bool)

(assert (=> b!549013 m!525375))

(declare-fun m!525377 () Bool)

(assert (=> b!549012 m!525377))

(declare-fun m!525379 () Bool)

(assert (=> b!549015 m!525379))

(declare-fun m!525381 () Bool)

(assert (=> b!549010 m!525381))

(check-sat (not b!549013) (not start!50174) (not b!549010) (not b!549014) (not b!549015) (not b!549009) (not b!549011) (not b!549012))
(check-sat)
