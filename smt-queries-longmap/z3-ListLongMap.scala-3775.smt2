; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51706 () Bool)

(assert start!51706)

(declare-fun res!356558 () Bool)

(declare-fun e!325617 () Bool)

(assert (=> start!51706 (=> (not res!356558) (not e!325617))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51706 (= res!356558 (validMask!0 mask!3119))))

(assert (=> start!51706 e!325617))

(assert (=> start!51706 true))

(declare-datatypes ((array!35514 0))(
  ( (array!35515 (arr!17056 (Array (_ BitVec 32) (_ BitVec 64))) (size!17420 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35514)

(declare-fun array_inv!12852 (array!35514) Bool)

(assert (=> start!51706 (array_inv!12852 a!3118)))

(declare-fun b!565583 () Bool)

(declare-fun e!325619 () Bool)

(assert (=> b!565583 (= e!325619 (not true))))

(declare-fun e!325618 () Bool)

(assert (=> b!565583 e!325618))

(declare-fun res!356561 () Bool)

(assert (=> b!565583 (=> (not res!356561) (not e!325618))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35514 (_ BitVec 32)) Bool)

(assert (=> b!565583 (= res!356561 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17712 0))(
  ( (Unit!17713) )
))
(declare-fun lt!257917 () Unit!17712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17712)

(assert (=> b!565583 (= lt!257917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565584 () Bool)

(declare-fun res!356556 () Bool)

(assert (=> b!565584 (=> (not res!356556) (not e!325619))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5505 0))(
  ( (MissingZero!5505 (index!24247 (_ BitVec 32))) (Found!5505 (index!24248 (_ BitVec 32))) (Intermediate!5505 (undefined!6317 Bool) (index!24249 (_ BitVec 32)) (x!53118 (_ BitVec 32))) (Undefined!5505) (MissingVacant!5505 (index!24250 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35514 (_ BitVec 32)) SeekEntryResult!5505)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565584 (= res!356556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17056 a!3118) j!142) mask!3119) (select (arr!17056 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17056 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17056 a!3118) i!1132 k0!1914) j!142) (array!35515 (store (arr!17056 a!3118) i!1132 k0!1914) (size!17420 a!3118)) mask!3119)))))

(declare-fun b!565585 () Bool)

(assert (=> b!565585 (= e!325617 e!325619)))

(declare-fun res!356557 () Bool)

(assert (=> b!565585 (=> (not res!356557) (not e!325619))))

(declare-fun lt!257916 () SeekEntryResult!5505)

(assert (=> b!565585 (= res!356557 (or (= lt!257916 (MissingZero!5505 i!1132)) (= lt!257916 (MissingVacant!5505 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35514 (_ BitVec 32)) SeekEntryResult!5505)

(assert (=> b!565585 (= lt!257916 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565586 () Bool)

(declare-fun res!356555 () Bool)

(assert (=> b!565586 (=> (not res!356555) (not e!325619))))

(declare-datatypes ((List!11136 0))(
  ( (Nil!11133) (Cons!11132 (h!12138 (_ BitVec 64)) (t!17364 List!11136)) )
))
(declare-fun arrayNoDuplicates!0 (array!35514 (_ BitVec 32) List!11136) Bool)

(assert (=> b!565586 (= res!356555 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11133))))

(declare-fun b!565587 () Bool)

(declare-fun res!356553 () Bool)

(assert (=> b!565587 (=> (not res!356553) (not e!325617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565587 (= res!356553 (validKeyInArray!0 k0!1914))))

(declare-fun b!565588 () Bool)

(declare-fun res!356560 () Bool)

(assert (=> b!565588 (=> (not res!356560) (not e!325617))))

(declare-fun arrayContainsKey!0 (array!35514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565588 (= res!356560 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565589 () Bool)

(declare-fun res!356559 () Bool)

(assert (=> b!565589 (=> (not res!356559) (not e!325617))))

(assert (=> b!565589 (= res!356559 (and (= (size!17420 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17420 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17420 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565590 () Bool)

(declare-fun res!356552 () Bool)

(assert (=> b!565590 (=> (not res!356552) (not e!325619))))

(assert (=> b!565590 (= res!356552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565591 () Bool)

(assert (=> b!565591 (= e!325618 (= (seekEntryOrOpen!0 (select (arr!17056 a!3118) j!142) a!3118 mask!3119) (Found!5505 j!142)))))

(declare-fun b!565592 () Bool)

(declare-fun res!356554 () Bool)

(assert (=> b!565592 (=> (not res!356554) (not e!325617))))

(assert (=> b!565592 (= res!356554 (validKeyInArray!0 (select (arr!17056 a!3118) j!142)))))

(assert (= (and start!51706 res!356558) b!565589))

(assert (= (and b!565589 res!356559) b!565592))

(assert (= (and b!565592 res!356554) b!565587))

(assert (= (and b!565587 res!356553) b!565588))

(assert (= (and b!565588 res!356560) b!565585))

(assert (= (and b!565585 res!356557) b!565590))

(assert (= (and b!565590 res!356552) b!565586))

(assert (= (and b!565586 res!356555) b!565584))

(assert (= (and b!565584 res!356556) b!565583))

(assert (= (and b!565583 res!356561) b!565591))

(declare-fun m!544071 () Bool)

(assert (=> b!565590 m!544071))

(declare-fun m!544073 () Bool)

(assert (=> b!565587 m!544073))

(declare-fun m!544075 () Bool)

(assert (=> b!565583 m!544075))

(declare-fun m!544077 () Bool)

(assert (=> b!565583 m!544077))

(declare-fun m!544079 () Bool)

(assert (=> b!565588 m!544079))

(declare-fun m!544081 () Bool)

(assert (=> b!565584 m!544081))

(declare-fun m!544083 () Bool)

(assert (=> b!565584 m!544083))

(assert (=> b!565584 m!544081))

(declare-fun m!544085 () Bool)

(assert (=> b!565584 m!544085))

(declare-fun m!544087 () Bool)

(assert (=> b!565584 m!544087))

(assert (=> b!565584 m!544085))

(declare-fun m!544089 () Bool)

(assert (=> b!565584 m!544089))

(assert (=> b!565584 m!544083))

(assert (=> b!565584 m!544081))

(declare-fun m!544091 () Bool)

(assert (=> b!565584 m!544091))

(declare-fun m!544093 () Bool)

(assert (=> b!565584 m!544093))

(assert (=> b!565584 m!544085))

(assert (=> b!565584 m!544087))

(declare-fun m!544095 () Bool)

(assert (=> b!565585 m!544095))

(declare-fun m!544097 () Bool)

(assert (=> start!51706 m!544097))

(declare-fun m!544099 () Bool)

(assert (=> start!51706 m!544099))

(assert (=> b!565592 m!544081))

(assert (=> b!565592 m!544081))

(declare-fun m!544101 () Bool)

(assert (=> b!565592 m!544101))

(declare-fun m!544103 () Bool)

(assert (=> b!565586 m!544103))

(assert (=> b!565591 m!544081))

(assert (=> b!565591 m!544081))

(declare-fun m!544105 () Bool)

(assert (=> b!565591 m!544105))

(check-sat (not b!565591) (not b!565584) (not b!565590) (not b!565586) (not b!565585) (not start!51706) (not b!565588) (not b!565583) (not b!565587) (not b!565592))
(check-sat)
