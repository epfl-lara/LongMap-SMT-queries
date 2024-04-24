; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50268 () Bool)

(assert start!50268)

(declare-fun b!549921 () Bool)

(declare-fun res!342967 () Bool)

(declare-fun e!317577 () Bool)

(assert (=> b!549921 (=> (not res!342967) (not e!317577))))

(declare-datatypes ((array!34668 0))(
  ( (array!34669 (arr!16648 (Array (_ BitVec 32) (_ BitVec 64))) (size!17012 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34668)

(declare-datatypes ((List!10635 0))(
  ( (Nil!10632) (Cons!10631 (h!11607 (_ BitVec 64)) (t!16855 List!10635)) )
))
(declare-fun arrayNoDuplicates!0 (array!34668 (_ BitVec 32) List!10635) Bool)

(assert (=> b!549921 (= res!342967 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10632))))

(declare-fun res!342964 () Bool)

(declare-fun e!317576 () Bool)

(assert (=> start!50268 (=> (not res!342964) (not e!317576))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50268 (= res!342964 (validMask!0 mask!3119))))

(assert (=> start!50268 e!317576))

(assert (=> start!50268 true))

(declare-fun array_inv!12507 (array!34668) Bool)

(assert (=> start!50268 (array_inv!12507 a!3118)))

(declare-fun b!549922 () Bool)

(declare-fun res!342961 () Bool)

(assert (=> b!549922 (=> (not res!342961) (not e!317576))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549922 (= res!342961 (and (= (size!17012 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17012 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17012 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549923 () Bool)

(declare-fun res!342962 () Bool)

(assert (=> b!549923 (=> (not res!342962) (not e!317576))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549923 (= res!342962 (validKeyInArray!0 k0!1914))))

(declare-fun b!549924 () Bool)

(declare-fun res!342963 () Bool)

(assert (=> b!549924 (=> (not res!342963) (not e!317576))))

(declare-fun arrayContainsKey!0 (array!34668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549924 (= res!342963 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549925 () Bool)

(assert (=> b!549925 (= e!317576 e!317577)))

(declare-fun res!342960 () Bool)

(assert (=> b!549925 (=> (not res!342960) (not e!317577))))

(declare-datatypes ((SeekEntryResult!5053 0))(
  ( (MissingZero!5053 (index!22439 (_ BitVec 32))) (Found!5053 (index!22440 (_ BitVec 32))) (Intermediate!5053 (undefined!5865 Bool) (index!22441 (_ BitVec 32)) (x!51522 (_ BitVec 32))) (Undefined!5053) (MissingVacant!5053 (index!22442 (_ BitVec 32))) )
))
(declare-fun lt!250417 () SeekEntryResult!5053)

(assert (=> b!549925 (= res!342960 (or (= lt!250417 (MissingZero!5053 i!1132)) (= lt!250417 (MissingVacant!5053 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34668 (_ BitVec 32)) SeekEntryResult!5053)

(assert (=> b!549925 (= lt!250417 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549926 () Bool)

(assert (=> b!549926 (= e!317577 false)))

(declare-fun lt!250419 () SeekEntryResult!5053)

(declare-fun lt!250416 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34668 (_ BitVec 32)) SeekEntryResult!5053)

(assert (=> b!549926 (= lt!250419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250416 (select (store (arr!16648 a!3118) i!1132 k0!1914) j!142) (array!34669 (store (arr!16648 a!3118) i!1132 k0!1914) (size!17012 a!3118)) mask!3119))))

(declare-fun lt!250418 () SeekEntryResult!5053)

(declare-fun lt!250420 () (_ BitVec 32))

(assert (=> b!549926 (= lt!250418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250420 (select (arr!16648 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549926 (= lt!250416 (toIndex!0 (select (store (arr!16648 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549926 (= lt!250420 (toIndex!0 (select (arr!16648 a!3118) j!142) mask!3119))))

(declare-fun b!549927 () Bool)

(declare-fun res!342965 () Bool)

(assert (=> b!549927 (=> (not res!342965) (not e!317577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34668 (_ BitVec 32)) Bool)

(assert (=> b!549927 (= res!342965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549928 () Bool)

(declare-fun res!342966 () Bool)

(assert (=> b!549928 (=> (not res!342966) (not e!317576))))

(assert (=> b!549928 (= res!342966 (validKeyInArray!0 (select (arr!16648 a!3118) j!142)))))

(assert (= (and start!50268 res!342964) b!549922))

(assert (= (and b!549922 res!342961) b!549928))

(assert (= (and b!549928 res!342966) b!549923))

(assert (= (and b!549923 res!342962) b!549924))

(assert (= (and b!549924 res!342963) b!549925))

(assert (= (and b!549925 res!342960) b!549927))

(assert (= (and b!549927 res!342965) b!549921))

(assert (= (and b!549921 res!342967) b!549926))

(declare-fun m!526979 () Bool)

(assert (=> b!549928 m!526979))

(assert (=> b!549928 m!526979))

(declare-fun m!526981 () Bool)

(assert (=> b!549928 m!526981))

(declare-fun m!526983 () Bool)

(assert (=> b!549923 m!526983))

(declare-fun m!526985 () Bool)

(assert (=> b!549927 m!526985))

(assert (=> b!549926 m!526979))

(declare-fun m!526987 () Bool)

(assert (=> b!549926 m!526987))

(assert (=> b!549926 m!526979))

(declare-fun m!526989 () Bool)

(assert (=> b!549926 m!526989))

(declare-fun m!526991 () Bool)

(assert (=> b!549926 m!526991))

(assert (=> b!549926 m!526989))

(declare-fun m!526993 () Bool)

(assert (=> b!549926 m!526993))

(assert (=> b!549926 m!526979))

(declare-fun m!526995 () Bool)

(assert (=> b!549926 m!526995))

(assert (=> b!549926 m!526989))

(declare-fun m!526997 () Bool)

(assert (=> b!549926 m!526997))

(declare-fun m!526999 () Bool)

(assert (=> b!549924 m!526999))

(declare-fun m!527001 () Bool)

(assert (=> start!50268 m!527001))

(declare-fun m!527003 () Bool)

(assert (=> start!50268 m!527003))

(declare-fun m!527005 () Bool)

(assert (=> b!549921 m!527005))

(declare-fun m!527007 () Bool)

(assert (=> b!549925 m!527007))

(check-sat (not b!549923) (not b!549927) (not b!549921) (not b!549928) (not b!549926) (not start!50268) (not b!549924) (not b!549925))
(check-sat)
