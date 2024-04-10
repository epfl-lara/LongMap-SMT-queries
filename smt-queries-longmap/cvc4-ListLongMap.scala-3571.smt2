; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49108 () Bool)

(assert start!49108)

(declare-fun b!540956 () Bool)

(declare-fun res!335848 () Bool)

(declare-fun e!313318 () Bool)

(assert (=> b!540956 (=> (not res!335848) (not e!313318))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540956 (= res!335848 (validKeyInArray!0 k!1998))))

(declare-fun b!540957 () Bool)

(declare-fun res!335846 () Bool)

(assert (=> b!540957 (=> (not res!335846) (not e!313318))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34218 0))(
  ( (array!34219 (arr!16445 (Array (_ BitVec 32) (_ BitVec 64))) (size!16809 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34218)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540957 (= res!335846 (and (= (size!16809 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16809 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16809 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540958 () Bool)

(declare-fun res!335847 () Bool)

(assert (=> b!540958 (=> (not res!335847) (not e!313318))))

(assert (=> b!540958 (= res!335847 (validKeyInArray!0 (select (arr!16445 a!3154) j!147)))))

(declare-fun res!335851 () Bool)

(assert (=> start!49108 (=> (not res!335851) (not e!313318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49108 (= res!335851 (validMask!0 mask!3216))))

(assert (=> start!49108 e!313318))

(assert (=> start!49108 true))

(declare-fun array_inv!12241 (array!34218) Bool)

(assert (=> start!49108 (array_inv!12241 a!3154)))

(declare-fun b!540959 () Bool)

(declare-fun e!313319 () Bool)

(assert (=> b!540959 (= e!313318 e!313319)))

(declare-fun res!335844 () Bool)

(assert (=> b!540959 (=> (not res!335844) (not e!313319))))

(declare-datatypes ((SeekEntryResult!4903 0))(
  ( (MissingZero!4903 (index!21836 (_ BitVec 32))) (Found!4903 (index!21837 (_ BitVec 32))) (Intermediate!4903 (undefined!5715 Bool) (index!21838 (_ BitVec 32)) (x!50746 (_ BitVec 32))) (Undefined!4903) (MissingVacant!4903 (index!21839 (_ BitVec 32))) )
))
(declare-fun lt!247524 () SeekEntryResult!4903)

(assert (=> b!540959 (= res!335844 (or (= lt!247524 (MissingZero!4903 i!1153)) (= lt!247524 (MissingVacant!4903 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34218 (_ BitVec 32)) SeekEntryResult!4903)

(assert (=> b!540959 (= lt!247524 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540960 () Bool)

(declare-fun res!335843 () Bool)

(assert (=> b!540960 (=> (not res!335843) (not e!313319))))

(declare-datatypes ((List!10564 0))(
  ( (Nil!10561) (Cons!10560 (h!11509 (_ BitVec 64)) (t!16792 List!10564)) )
))
(declare-fun arrayNoDuplicates!0 (array!34218 (_ BitVec 32) List!10564) Bool)

(assert (=> b!540960 (= res!335843 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10561))))

(declare-fun b!540961 () Bool)

(declare-fun res!335852 () Bool)

(assert (=> b!540961 (=> (not res!335852) (not e!313319))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34218 (_ BitVec 32)) SeekEntryResult!4903)

(assert (=> b!540961 (= res!335852 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16445 a!3154) j!147) a!3154 mask!3216) (Intermediate!4903 false resIndex!32 resX!32)))))

(declare-fun b!540962 () Bool)

(declare-fun res!335845 () Bool)

(assert (=> b!540962 (=> (not res!335845) (not e!313318))))

(declare-fun arrayContainsKey!0 (array!34218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540962 (= res!335845 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540963 () Bool)

(assert (=> b!540963 (= e!313319 false)))

(declare-fun lt!247525 () SeekEntryResult!4903)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540963 (= lt!247525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16445 a!3154) j!147) mask!3216) (select (arr!16445 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540964 () Bool)

(declare-fun res!335849 () Bool)

(assert (=> b!540964 (=> (not res!335849) (not e!313319))))

(assert (=> b!540964 (= res!335849 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16809 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16809 a!3154)) (= (select (arr!16445 a!3154) resIndex!32) (select (arr!16445 a!3154) j!147))))))

(declare-fun b!540965 () Bool)

(declare-fun res!335850 () Bool)

(assert (=> b!540965 (=> (not res!335850) (not e!313319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34218 (_ BitVec 32)) Bool)

(assert (=> b!540965 (= res!335850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49108 res!335851) b!540957))

(assert (= (and b!540957 res!335846) b!540958))

(assert (= (and b!540958 res!335847) b!540956))

(assert (= (and b!540956 res!335848) b!540962))

(assert (= (and b!540962 res!335845) b!540959))

(assert (= (and b!540959 res!335844) b!540965))

(assert (= (and b!540965 res!335850) b!540960))

(assert (= (and b!540960 res!335843) b!540964))

(assert (= (and b!540964 res!335849) b!540961))

(assert (= (and b!540961 res!335852) b!540963))

(declare-fun m!519595 () Bool)

(assert (=> b!540960 m!519595))

(declare-fun m!519597 () Bool)

(assert (=> b!540964 m!519597))

(declare-fun m!519599 () Bool)

(assert (=> b!540964 m!519599))

(declare-fun m!519601 () Bool)

(assert (=> b!540965 m!519601))

(declare-fun m!519603 () Bool)

(assert (=> b!540962 m!519603))

(assert (=> b!540963 m!519599))

(assert (=> b!540963 m!519599))

(declare-fun m!519605 () Bool)

(assert (=> b!540963 m!519605))

(assert (=> b!540963 m!519605))

(assert (=> b!540963 m!519599))

(declare-fun m!519607 () Bool)

(assert (=> b!540963 m!519607))

(assert (=> b!540961 m!519599))

(assert (=> b!540961 m!519599))

(declare-fun m!519609 () Bool)

(assert (=> b!540961 m!519609))

(declare-fun m!519611 () Bool)

(assert (=> b!540956 m!519611))

(declare-fun m!519613 () Bool)

(assert (=> b!540959 m!519613))

(declare-fun m!519615 () Bool)

(assert (=> start!49108 m!519615))

(declare-fun m!519617 () Bool)

(assert (=> start!49108 m!519617))

(assert (=> b!540958 m!519599))

(assert (=> b!540958 m!519599))

(declare-fun m!519619 () Bool)

(assert (=> b!540958 m!519619))

(push 1)

(assert (not b!540960))

(assert (not b!540959))

(assert (not start!49108))

(assert (not b!540956))

(assert (not b!540962))

(assert (not b!540958))

(assert (not b!540963))

(assert (not b!540965))

(assert (not b!540961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

