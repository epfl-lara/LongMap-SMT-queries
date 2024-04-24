; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44852 () Bool)

(assert start!44852)

(declare-fun b!492185 () Bool)

(declare-fun res!295000 () Bool)

(declare-fun e!289148 () Bool)

(assert (=> b!492185 (=> (not res!295000) (not e!289148))))

(declare-datatypes ((array!31855 0))(
  ( (array!31856 (arr!15313 (Array (_ BitVec 32) (_ BitVec 64))) (size!15677 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31855)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31855 (_ BitVec 32)) Bool)

(assert (=> b!492185 (= res!295000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492186 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!289146 () Bool)

(declare-datatypes ((SeekEntryResult!3736 0))(
  ( (MissingZero!3736 (index!17123 (_ BitVec 32))) (Found!3736 (index!17124 (_ BitVec 32))) (Intermediate!3736 (undefined!4548 Bool) (index!17125 (_ BitVec 32)) (x!46357 (_ BitVec 32))) (Undefined!3736) (MissingVacant!3736 (index!17126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31855 (_ BitVec 32)) SeekEntryResult!3736)

(assert (=> b!492186 (= e!289146 (= (seekEntryOrOpen!0 (select (arr!15313 a!3235) j!176) a!3235 mask!3524) (Found!3736 j!176)))))

(declare-fun b!492187 () Bool)

(declare-fun res!294995 () Bool)

(declare-fun e!289147 () Bool)

(assert (=> b!492187 (=> (not res!294995) (not e!289147))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492187 (= res!294995 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492188 () Bool)

(declare-fun res!294993 () Bool)

(assert (=> b!492188 (=> (not res!294993) (not e!289147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492188 (= res!294993 (validKeyInArray!0 (select (arr!15313 a!3235) j!176)))))

(declare-fun b!492189 () Bool)

(assert (=> b!492189 (= e!289147 e!289148)))

(declare-fun res!294994 () Bool)

(assert (=> b!492189 (=> (not res!294994) (not e!289148))))

(declare-fun lt!222549 () SeekEntryResult!3736)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492189 (= res!294994 (or (= lt!222549 (MissingZero!3736 i!1204)) (= lt!222549 (MissingVacant!3736 i!1204))))))

(assert (=> b!492189 (= lt!222549 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492190 () Bool)

(assert (=> b!492190 (= e!289148 (not true))))

(declare-fun lt!222550 () SeekEntryResult!3736)

(declare-fun lt!222553 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31855 (_ BitVec 32)) SeekEntryResult!3736)

(assert (=> b!492190 (= lt!222550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222553 (select (store (arr!15313 a!3235) i!1204 k0!2280) j!176) (array!31856 (store (arr!15313 a!3235) i!1204 k0!2280) (size!15677 a!3235)) mask!3524))))

(declare-fun lt!222548 () (_ BitVec 32))

(declare-fun lt!222552 () SeekEntryResult!3736)

(assert (=> b!492190 (= lt!222552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222548 (select (arr!15313 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492190 (= lt!222553 (toIndex!0 (select (store (arr!15313 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492190 (= lt!222548 (toIndex!0 (select (arr!15313 a!3235) j!176) mask!3524))))

(assert (=> b!492190 e!289146))

(declare-fun res!294996 () Bool)

(assert (=> b!492190 (=> (not res!294996) (not e!289146))))

(assert (=> b!492190 (= res!294996 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14479 0))(
  ( (Unit!14480) )
))
(declare-fun lt!222551 () Unit!14479)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14479)

(assert (=> b!492190 (= lt!222551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492191 () Bool)

(declare-fun res!294999 () Bool)

(assert (=> b!492191 (=> (not res!294999) (not e!289148))))

(declare-datatypes ((List!9378 0))(
  ( (Nil!9375) (Cons!9374 (h!10239 (_ BitVec 64)) (t!15598 List!9378)) )
))
(declare-fun arrayNoDuplicates!0 (array!31855 (_ BitVec 32) List!9378) Bool)

(assert (=> b!492191 (= res!294999 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9375))))

(declare-fun b!492192 () Bool)

(declare-fun res!294992 () Bool)

(assert (=> b!492192 (=> (not res!294992) (not e!289147))))

(assert (=> b!492192 (= res!294992 (validKeyInArray!0 k0!2280))))

(declare-fun b!492193 () Bool)

(declare-fun res!294998 () Bool)

(assert (=> b!492193 (=> (not res!294998) (not e!289147))))

(assert (=> b!492193 (= res!294998 (and (= (size!15677 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15677 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15677 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!294997 () Bool)

(assert (=> start!44852 (=> (not res!294997) (not e!289147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44852 (= res!294997 (validMask!0 mask!3524))))

(assert (=> start!44852 e!289147))

(assert (=> start!44852 true))

(declare-fun array_inv!11172 (array!31855) Bool)

(assert (=> start!44852 (array_inv!11172 a!3235)))

(assert (= (and start!44852 res!294997) b!492193))

(assert (= (and b!492193 res!294998) b!492188))

(assert (= (and b!492188 res!294993) b!492192))

(assert (= (and b!492192 res!294992) b!492187))

(assert (= (and b!492187 res!294995) b!492189))

(assert (= (and b!492189 res!294994) b!492185))

(assert (= (and b!492185 res!295000) b!492191))

(assert (= (and b!492191 res!294999) b!492190))

(assert (= (and b!492190 res!294996) b!492186))

(declare-fun m!473107 () Bool)

(assert (=> b!492191 m!473107))

(declare-fun m!473109 () Bool)

(assert (=> b!492187 m!473109))

(declare-fun m!473111 () Bool)

(assert (=> b!492188 m!473111))

(assert (=> b!492188 m!473111))

(declare-fun m!473113 () Bool)

(assert (=> b!492188 m!473113))

(declare-fun m!473115 () Bool)

(assert (=> b!492192 m!473115))

(assert (=> b!492186 m!473111))

(assert (=> b!492186 m!473111))

(declare-fun m!473117 () Bool)

(assert (=> b!492186 m!473117))

(declare-fun m!473119 () Bool)

(assert (=> b!492185 m!473119))

(declare-fun m!473121 () Bool)

(assert (=> b!492189 m!473121))

(declare-fun m!473123 () Bool)

(assert (=> b!492190 m!473123))

(declare-fun m!473125 () Bool)

(assert (=> b!492190 m!473125))

(declare-fun m!473127 () Bool)

(assert (=> b!492190 m!473127))

(assert (=> b!492190 m!473111))

(declare-fun m!473129 () Bool)

(assert (=> b!492190 m!473129))

(assert (=> b!492190 m!473111))

(declare-fun m!473131 () Bool)

(assert (=> b!492190 m!473131))

(assert (=> b!492190 m!473111))

(declare-fun m!473133 () Bool)

(assert (=> b!492190 m!473133))

(assert (=> b!492190 m!473127))

(declare-fun m!473135 () Bool)

(assert (=> b!492190 m!473135))

(assert (=> b!492190 m!473127))

(declare-fun m!473137 () Bool)

(assert (=> b!492190 m!473137))

(declare-fun m!473139 () Bool)

(assert (=> start!44852 m!473139))

(declare-fun m!473141 () Bool)

(assert (=> start!44852 m!473141))

(check-sat (not b!492190) (not start!44852) (not b!492192) (not b!492186) (not b!492191) (not b!492188) (not b!492187) (not b!492185) (not b!492189))
(check-sat)
