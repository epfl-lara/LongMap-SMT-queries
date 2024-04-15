; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51536 () Bool)

(assert start!51536)

(declare-fun b!563797 () Bool)

(declare-fun res!355097 () Bool)

(declare-fun e!324795 () Bool)

(assert (=> b!563797 (=> (not res!355097) (not e!324795))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563797 (= res!355097 (validKeyInArray!0 k0!1914))))

(declare-fun b!563798 () Bool)

(declare-fun e!324793 () Bool)

(assert (=> b!563798 (= e!324793 false)))

(declare-fun lt!257196 () Bool)

(declare-datatypes ((array!35410 0))(
  ( (array!35411 (arr!17006 (Array (_ BitVec 32) (_ BitVec 64))) (size!17371 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35410)

(declare-datatypes ((List!11125 0))(
  ( (Nil!11122) (Cons!11121 (h!12124 (_ BitVec 64)) (t!17344 List!11125)) )
))
(declare-fun arrayNoDuplicates!0 (array!35410 (_ BitVec 32) List!11125) Bool)

(assert (=> b!563798 (= lt!257196 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11122))))

(declare-fun res!355094 () Bool)

(assert (=> start!51536 (=> (not res!355094) (not e!324795))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51536 (= res!355094 (validMask!0 mask!3119))))

(assert (=> start!51536 e!324795))

(assert (=> start!51536 true))

(declare-fun array_inv!12889 (array!35410) Bool)

(assert (=> start!51536 (array_inv!12889 a!3118)))

(declare-fun b!563799 () Bool)

(declare-fun res!355096 () Bool)

(assert (=> b!563799 (=> (not res!355096) (not e!324793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35410 (_ BitVec 32)) Bool)

(assert (=> b!563799 (= res!355096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563800 () Bool)

(declare-fun res!355095 () Bool)

(assert (=> b!563800 (=> (not res!355095) (not e!324795))))

(declare-fun arrayContainsKey!0 (array!35410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563800 (= res!355095 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563801 () Bool)

(declare-fun res!355093 () Bool)

(assert (=> b!563801 (=> (not res!355093) (not e!324795))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563801 (= res!355093 (validKeyInArray!0 (select (arr!17006 a!3118) j!142)))))

(declare-fun b!563802 () Bool)

(declare-fun res!355091 () Bool)

(assert (=> b!563802 (=> (not res!355091) (not e!324795))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563802 (= res!355091 (and (= (size!17371 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17371 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17371 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563803 () Bool)

(assert (=> b!563803 (= e!324795 e!324793)))

(declare-fun res!355092 () Bool)

(assert (=> b!563803 (=> (not res!355092) (not e!324793))))

(declare-datatypes ((SeekEntryResult!5452 0))(
  ( (MissingZero!5452 (index!24035 (_ BitVec 32))) (Found!5452 (index!24036 (_ BitVec 32))) (Intermediate!5452 (undefined!6264 Bool) (index!24037 (_ BitVec 32)) (x!52926 (_ BitVec 32))) (Undefined!5452) (MissingVacant!5452 (index!24038 (_ BitVec 32))) )
))
(declare-fun lt!257197 () SeekEntryResult!5452)

(assert (=> b!563803 (= res!355092 (or (= lt!257197 (MissingZero!5452 i!1132)) (= lt!257197 (MissingVacant!5452 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35410 (_ BitVec 32)) SeekEntryResult!5452)

(assert (=> b!563803 (= lt!257197 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51536 res!355094) b!563802))

(assert (= (and b!563802 res!355091) b!563801))

(assert (= (and b!563801 res!355093) b!563797))

(assert (= (and b!563797 res!355097) b!563800))

(assert (= (and b!563800 res!355095) b!563803))

(assert (= (and b!563803 res!355092) b!563799))

(assert (= (and b!563799 res!355096) b!563798))

(declare-fun m!541769 () Bool)

(assert (=> b!563800 m!541769))

(declare-fun m!541771 () Bool)

(assert (=> b!563799 m!541771))

(declare-fun m!541773 () Bool)

(assert (=> b!563797 m!541773))

(declare-fun m!541775 () Bool)

(assert (=> start!51536 m!541775))

(declare-fun m!541777 () Bool)

(assert (=> start!51536 m!541777))

(declare-fun m!541779 () Bool)

(assert (=> b!563801 m!541779))

(assert (=> b!563801 m!541779))

(declare-fun m!541781 () Bool)

(assert (=> b!563801 m!541781))

(declare-fun m!541783 () Bool)

(assert (=> b!563803 m!541783))

(declare-fun m!541785 () Bool)

(assert (=> b!563798 m!541785))

(check-sat (not b!563797) (not b!563803) (not b!563801) (not b!563800) (not b!563799) (not start!51536) (not b!563798))
(check-sat)
