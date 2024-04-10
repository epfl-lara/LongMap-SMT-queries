; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51694 () Bool)

(assert start!51694)

(declare-fun b!565403 () Bool)

(declare-fun res!356372 () Bool)

(declare-fun e!325548 () Bool)

(assert (=> b!565403 (=> (not res!356372) (not e!325548))))

(declare-datatypes ((array!35502 0))(
  ( (array!35503 (arr!17050 (Array (_ BitVec 32) (_ BitVec 64))) (size!17414 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35502)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565403 (= res!356372 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!325547 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!565404 () Bool)

(declare-datatypes ((SeekEntryResult!5499 0))(
  ( (MissingZero!5499 (index!24223 (_ BitVec 32))) (Found!5499 (index!24224 (_ BitVec 32))) (Intermediate!5499 (undefined!6311 Bool) (index!24225 (_ BitVec 32)) (x!53096 (_ BitVec 32))) (Undefined!5499) (MissingVacant!5499 (index!24226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35502 (_ BitVec 32)) SeekEntryResult!5499)

(assert (=> b!565404 (= e!325547 (= (seekEntryOrOpen!0 (select (arr!17050 a!3118) j!142) a!3118 mask!3119) (Found!5499 j!142)))))

(declare-fun b!565405 () Bool)

(declare-fun res!356377 () Bool)

(assert (=> b!565405 (=> (not res!356377) (not e!325548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565405 (= res!356377 (validKeyInArray!0 (select (arr!17050 a!3118) j!142)))))

(declare-fun b!565406 () Bool)

(declare-fun res!356380 () Bool)

(declare-fun e!325546 () Bool)

(assert (=> b!565406 (=> (not res!356380) (not e!325546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35502 (_ BitVec 32)) Bool)

(assert (=> b!565406 (= res!356380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565408 () Bool)

(declare-fun res!356374 () Bool)

(assert (=> b!565408 (=> (not res!356374) (not e!325546))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35502 (_ BitVec 32)) SeekEntryResult!5499)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565408 (= res!356374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17050 a!3118) j!142) mask!3119) (select (arr!17050 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17050 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17050 a!3118) i!1132 k0!1914) j!142) (array!35503 (store (arr!17050 a!3118) i!1132 k0!1914) (size!17414 a!3118)) mask!3119)))))

(declare-fun b!565409 () Bool)

(declare-fun res!356378 () Bool)

(assert (=> b!565409 (=> (not res!356378) (not e!325548))))

(assert (=> b!565409 (= res!356378 (and (= (size!17414 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17414 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17414 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565410 () Bool)

(assert (=> b!565410 (= e!325548 e!325546)))

(declare-fun res!356379 () Bool)

(assert (=> b!565410 (=> (not res!356379) (not e!325546))))

(declare-fun lt!257881 () SeekEntryResult!5499)

(assert (=> b!565410 (= res!356379 (or (= lt!257881 (MissingZero!5499 i!1132)) (= lt!257881 (MissingVacant!5499 i!1132))))))

(assert (=> b!565410 (= lt!257881 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565411 () Bool)

(declare-fun res!356376 () Bool)

(assert (=> b!565411 (=> (not res!356376) (not e!325546))))

(declare-datatypes ((List!11130 0))(
  ( (Nil!11127) (Cons!11126 (h!12132 (_ BitVec 64)) (t!17358 List!11130)) )
))
(declare-fun arrayNoDuplicates!0 (array!35502 (_ BitVec 32) List!11130) Bool)

(assert (=> b!565411 (= res!356376 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11127))))

(declare-fun b!565412 () Bool)

(declare-fun res!356373 () Bool)

(assert (=> b!565412 (=> (not res!356373) (not e!325548))))

(assert (=> b!565412 (= res!356373 (validKeyInArray!0 k0!1914))))

(declare-fun res!356381 () Bool)

(assert (=> start!51694 (=> (not res!356381) (not e!325548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51694 (= res!356381 (validMask!0 mask!3119))))

(assert (=> start!51694 e!325548))

(assert (=> start!51694 true))

(declare-fun array_inv!12846 (array!35502) Bool)

(assert (=> start!51694 (array_inv!12846 a!3118)))

(declare-fun b!565407 () Bool)

(assert (=> b!565407 (= e!325546 (not true))))

(assert (=> b!565407 e!325547))

(declare-fun res!356375 () Bool)

(assert (=> b!565407 (=> (not res!356375) (not e!325547))))

(assert (=> b!565407 (= res!356375 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17700 0))(
  ( (Unit!17701) )
))
(declare-fun lt!257880 () Unit!17700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17700)

(assert (=> b!565407 (= lt!257880 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51694 res!356381) b!565409))

(assert (= (and b!565409 res!356378) b!565405))

(assert (= (and b!565405 res!356377) b!565412))

(assert (= (and b!565412 res!356373) b!565403))

(assert (= (and b!565403 res!356372) b!565410))

(assert (= (and b!565410 res!356379) b!565406))

(assert (= (and b!565406 res!356380) b!565411))

(assert (= (and b!565411 res!356376) b!565408))

(assert (= (and b!565408 res!356374) b!565407))

(assert (= (and b!565407 res!356375) b!565404))

(declare-fun m!543855 () Bool)

(assert (=> b!565411 m!543855))

(declare-fun m!543857 () Bool)

(assert (=> b!565410 m!543857))

(declare-fun m!543859 () Bool)

(assert (=> b!565407 m!543859))

(declare-fun m!543861 () Bool)

(assert (=> b!565407 m!543861))

(declare-fun m!543863 () Bool)

(assert (=> b!565403 m!543863))

(declare-fun m!543865 () Bool)

(assert (=> b!565408 m!543865))

(declare-fun m!543867 () Bool)

(assert (=> b!565408 m!543867))

(assert (=> b!565408 m!543865))

(declare-fun m!543869 () Bool)

(assert (=> b!565408 m!543869))

(declare-fun m!543871 () Bool)

(assert (=> b!565408 m!543871))

(assert (=> b!565408 m!543869))

(declare-fun m!543873 () Bool)

(assert (=> b!565408 m!543873))

(assert (=> b!565408 m!543867))

(assert (=> b!565408 m!543865))

(declare-fun m!543875 () Bool)

(assert (=> b!565408 m!543875))

(declare-fun m!543877 () Bool)

(assert (=> b!565408 m!543877))

(assert (=> b!565408 m!543869))

(assert (=> b!565408 m!543871))

(declare-fun m!543879 () Bool)

(assert (=> b!565406 m!543879))

(declare-fun m!543881 () Bool)

(assert (=> b!565412 m!543881))

(declare-fun m!543883 () Bool)

(assert (=> start!51694 m!543883))

(declare-fun m!543885 () Bool)

(assert (=> start!51694 m!543885))

(assert (=> b!565405 m!543865))

(assert (=> b!565405 m!543865))

(declare-fun m!543887 () Bool)

(assert (=> b!565405 m!543887))

(assert (=> b!565404 m!543865))

(assert (=> b!565404 m!543865))

(declare-fun m!543889 () Bool)

(assert (=> b!565404 m!543889))

(check-sat (not b!565410) (not b!565406) (not b!565403) (not b!565405) (not b!565412) (not b!565404) (not b!565408) (not start!51694) (not b!565411) (not b!565407))
(check-sat)
