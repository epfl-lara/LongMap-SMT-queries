; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46748 () Bool)

(assert start!46748)

(declare-fun b!516205 () Bool)

(declare-fun res!315770 () Bool)

(declare-fun e!301298 () Bool)

(assert (=> b!516205 (=> (not res!315770) (not e!301298))))

(declare-datatypes ((array!33060 0))(
  ( (array!33061 (arr!15898 (Array (_ BitVec 32) (_ BitVec 64))) (size!16262 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33060)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33060 (_ BitVec 32)) Bool)

(assert (=> b!516205 (= res!315770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516206 () Bool)

(declare-fun res!315779 () Bool)

(declare-fun e!301295 () Bool)

(assert (=> b!516206 (=> (not res!315779) (not e!301295))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516206 (= res!315779 (validKeyInArray!0 (select (arr!15898 a!3235) j!176)))))

(declare-fun b!516207 () Bool)

(declare-fun e!301296 () Bool)

(assert (=> b!516207 (= e!301296 true)))

(declare-datatypes ((SeekEntryResult!4365 0))(
  ( (MissingZero!4365 (index!19648 (_ BitVec 32))) (Found!4365 (index!19649 (_ BitVec 32))) (Intermediate!4365 (undefined!5177 Bool) (index!19650 (_ BitVec 32)) (x!48608 (_ BitVec 32))) (Undefined!4365) (MissingVacant!4365 (index!19651 (_ BitVec 32))) )
))
(declare-fun lt!236310 () SeekEntryResult!4365)

(assert (=> b!516207 (and (bvslt (x!48608 lt!236310) #b01111111111111111111111111111110) (or (= (select (arr!15898 a!3235) (index!19650 lt!236310)) (select (arr!15898 a!3235) j!176)) (= (select (arr!15898 a!3235) (index!19650 lt!236310)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15898 a!3235) (index!19650 lt!236310)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516208 () Bool)

(declare-fun e!301297 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33060 (_ BitVec 32)) SeekEntryResult!4365)

(assert (=> b!516208 (= e!301297 (= (seekEntryOrOpen!0 (select (arr!15898 a!3235) j!176) a!3235 mask!3524) (Found!4365 j!176)))))

(declare-fun b!516209 () Bool)

(declare-fun res!315771 () Bool)

(assert (=> b!516209 (=> res!315771 e!301296)))

(get-info :version)

(assert (=> b!516209 (= res!315771 (or (undefined!5177 lt!236310) (not ((_ is Intermediate!4365) lt!236310))))))

(declare-fun b!516210 () Bool)

(declare-fun res!315775 () Bool)

(assert (=> b!516210 (=> (not res!315775) (not e!301295))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!516210 (= res!315775 (validKeyInArray!0 k0!2280))))

(declare-fun b!516211 () Bool)

(declare-fun res!315778 () Bool)

(assert (=> b!516211 (=> (not res!315778) (not e!301295))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516211 (= res!315778 (and (= (size!16262 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16262 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16262 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516212 () Bool)

(assert (=> b!516212 (= e!301295 e!301298)))

(declare-fun res!315772 () Bool)

(assert (=> b!516212 (=> (not res!315772) (not e!301298))))

(declare-fun lt!236311 () SeekEntryResult!4365)

(assert (=> b!516212 (= res!315772 (or (= lt!236311 (MissingZero!4365 i!1204)) (= lt!236311 (MissingVacant!4365 i!1204))))))

(assert (=> b!516212 (= lt!236311 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516213 () Bool)

(declare-fun res!315774 () Bool)

(assert (=> b!516213 (=> (not res!315774) (not e!301295))))

(declare-fun arrayContainsKey!0 (array!33060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516213 (= res!315774 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!315777 () Bool)

(assert (=> start!46748 (=> (not res!315777) (not e!301295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46748 (= res!315777 (validMask!0 mask!3524))))

(assert (=> start!46748 e!301295))

(assert (=> start!46748 true))

(declare-fun array_inv!11694 (array!33060) Bool)

(assert (=> start!46748 (array_inv!11694 a!3235)))

(declare-fun b!516214 () Bool)

(assert (=> b!516214 (= e!301298 (not e!301296))))

(declare-fun res!315769 () Bool)

(assert (=> b!516214 (=> res!315769 e!301296)))

(declare-fun lt!236313 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33060 (_ BitVec 32)) SeekEntryResult!4365)

(assert (=> b!516214 (= res!315769 (= lt!236310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236313 (select (store (arr!15898 a!3235) i!1204 k0!2280) j!176) (array!33061 (store (arr!15898 a!3235) i!1204 k0!2280) (size!16262 a!3235)) mask!3524)))))

(declare-fun lt!236314 () (_ BitVec 32))

(assert (=> b!516214 (= lt!236310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236314 (select (arr!15898 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516214 (= lt!236313 (toIndex!0 (select (store (arr!15898 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516214 (= lt!236314 (toIndex!0 (select (arr!15898 a!3235) j!176) mask!3524))))

(assert (=> b!516214 e!301297))

(declare-fun res!315776 () Bool)

(assert (=> b!516214 (=> (not res!315776) (not e!301297))))

(assert (=> b!516214 (= res!315776 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15988 0))(
  ( (Unit!15989) )
))
(declare-fun lt!236312 () Unit!15988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15988)

(assert (=> b!516214 (= lt!236312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516215 () Bool)

(declare-fun res!315773 () Bool)

(assert (=> b!516215 (=> (not res!315773) (not e!301298))))

(declare-datatypes ((List!10056 0))(
  ( (Nil!10053) (Cons!10052 (h!10950 (_ BitVec 64)) (t!16284 List!10056)) )
))
(declare-fun arrayNoDuplicates!0 (array!33060 (_ BitVec 32) List!10056) Bool)

(assert (=> b!516215 (= res!315773 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10053))))

(assert (= (and start!46748 res!315777) b!516211))

(assert (= (and b!516211 res!315778) b!516206))

(assert (= (and b!516206 res!315779) b!516210))

(assert (= (and b!516210 res!315775) b!516213))

(assert (= (and b!516213 res!315774) b!516212))

(assert (= (and b!516212 res!315772) b!516205))

(assert (= (and b!516205 res!315770) b!516215))

(assert (= (and b!516215 res!315773) b!516214))

(assert (= (and b!516214 res!315776) b!516208))

(assert (= (and b!516214 (not res!315769)) b!516209))

(assert (= (and b!516209 (not res!315771)) b!516207))

(declare-fun m!497657 () Bool)

(assert (=> b!516212 m!497657))

(declare-fun m!497659 () Bool)

(assert (=> b!516215 m!497659))

(declare-fun m!497661 () Bool)

(assert (=> b!516213 m!497661))

(declare-fun m!497663 () Bool)

(assert (=> b!516214 m!497663))

(declare-fun m!497665 () Bool)

(assert (=> b!516214 m!497665))

(declare-fun m!497667 () Bool)

(assert (=> b!516214 m!497667))

(declare-fun m!497669 () Bool)

(assert (=> b!516214 m!497669))

(assert (=> b!516214 m!497663))

(declare-fun m!497671 () Bool)

(assert (=> b!516214 m!497671))

(declare-fun m!497673 () Bool)

(assert (=> b!516214 m!497673))

(assert (=> b!516214 m!497671))

(declare-fun m!497675 () Bool)

(assert (=> b!516214 m!497675))

(assert (=> b!516214 m!497671))

(declare-fun m!497677 () Bool)

(assert (=> b!516214 m!497677))

(assert (=> b!516214 m!497663))

(declare-fun m!497679 () Bool)

(assert (=> b!516214 m!497679))

(declare-fun m!497681 () Bool)

(assert (=> b!516205 m!497681))

(assert (=> b!516208 m!497671))

(assert (=> b!516208 m!497671))

(declare-fun m!497683 () Bool)

(assert (=> b!516208 m!497683))

(declare-fun m!497685 () Bool)

(assert (=> b!516207 m!497685))

(assert (=> b!516207 m!497671))

(declare-fun m!497687 () Bool)

(assert (=> b!516210 m!497687))

(assert (=> b!516206 m!497671))

(assert (=> b!516206 m!497671))

(declare-fun m!497689 () Bool)

(assert (=> b!516206 m!497689))

(declare-fun m!497691 () Bool)

(assert (=> start!46748 m!497691))

(declare-fun m!497693 () Bool)

(assert (=> start!46748 m!497693))

(check-sat (not b!516210) (not b!516206) (not b!516208) (not start!46748) (not b!516214) (not b!516215) (not b!516213) (not b!516212) (not b!516205))
(check-sat)
