; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45200 () Bool)

(assert start!45200)

(declare-fun b!496123 () Bool)

(declare-fun res!298511 () Bool)

(declare-fun e!290979 () Bool)

(assert (=> b!496123 (=> (not res!298511) (not e!290979))))

(declare-datatypes ((array!32088 0))(
  ( (array!32089 (arr!15427 (Array (_ BitVec 32) (_ BitVec 64))) (size!15791 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32088)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496123 (= res!298511 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496124 () Bool)

(declare-fun res!298512 () Bool)

(assert (=> b!496124 (=> (not res!298512) (not e!290979))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496124 (= res!298512 (and (= (size!15791 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15791 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15791 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496125 () Bool)

(declare-fun res!298510 () Bool)

(declare-fun e!290982 () Bool)

(assert (=> b!496125 (=> (not res!298510) (not e!290982))))

(declare-datatypes ((List!9585 0))(
  ( (Nil!9582) (Cons!9581 (h!10452 (_ BitVec 64)) (t!15813 List!9585)) )
))
(declare-fun arrayNoDuplicates!0 (array!32088 (_ BitVec 32) List!9585) Bool)

(assert (=> b!496125 (= res!298510 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9582))))

(declare-fun b!496126 () Bool)

(assert (=> b!496126 (= e!290979 e!290982)))

(declare-fun res!298513 () Bool)

(assert (=> b!496126 (=> (not res!298513) (not e!290982))))

(declare-datatypes ((SeekEntryResult!3894 0))(
  ( (MissingZero!3894 (index!17755 (_ BitVec 32))) (Found!3894 (index!17756 (_ BitVec 32))) (Intermediate!3894 (undefined!4706 Bool) (index!17757 (_ BitVec 32)) (x!46818 (_ BitVec 32))) (Undefined!3894) (MissingVacant!3894 (index!17758 (_ BitVec 32))) )
))
(declare-fun lt!224602 () SeekEntryResult!3894)

(assert (=> b!496126 (= res!298513 (or (= lt!224602 (MissingZero!3894 i!1204)) (= lt!224602 (MissingVacant!3894 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32088 (_ BitVec 32)) SeekEntryResult!3894)

(assert (=> b!496126 (= lt!224602 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496127 () Bool)

(declare-fun e!290981 () Bool)

(assert (=> b!496127 (= e!290981 (= (seekEntryOrOpen!0 (select (arr!15427 a!3235) j!176) a!3235 mask!3524) (Found!3894 j!176)))))

(declare-fun b!496128 () Bool)

(declare-fun res!298516 () Bool)

(declare-fun e!290980 () Bool)

(assert (=> b!496128 (=> res!298516 e!290980)))

(declare-fun lt!224601 () SeekEntryResult!3894)

(get-info :version)

(assert (=> b!496128 (= res!298516 (or (undefined!4706 lt!224601) (not ((_ is Intermediate!3894) lt!224601))))))

(declare-fun b!496129 () Bool)

(declare-fun res!298515 () Bool)

(assert (=> b!496129 (=> (not res!298515) (not e!290979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496129 (= res!298515 (validKeyInArray!0 (select (arr!15427 a!3235) j!176)))))

(declare-fun b!496130 () Bool)

(assert (=> b!496130 (= e!290980 true)))

(assert (=> b!496130 (and (bvslt (x!46818 lt!224601) #b01111111111111111111111111111110) (or (= (select (arr!15427 a!3235) (index!17757 lt!224601)) (select (arr!15427 a!3235) j!176)) (= (select (arr!15427 a!3235) (index!17757 lt!224601)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15427 a!3235) (index!17757 lt!224601)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496131 () Bool)

(assert (=> b!496131 (= e!290982 (not e!290980))))

(declare-fun res!298520 () Bool)

(assert (=> b!496131 (=> res!298520 e!290980)))

(declare-fun lt!224600 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32088 (_ BitVec 32)) SeekEntryResult!3894)

(assert (=> b!496131 (= res!298520 (= lt!224601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224600 (select (store (arr!15427 a!3235) i!1204 k0!2280) j!176) (array!32089 (store (arr!15427 a!3235) i!1204 k0!2280) (size!15791 a!3235)) mask!3524)))))

(declare-fun lt!224598 () (_ BitVec 32))

(assert (=> b!496131 (= lt!224601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224598 (select (arr!15427 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496131 (= lt!224600 (toIndex!0 (select (store (arr!15427 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496131 (= lt!224598 (toIndex!0 (select (arr!15427 a!3235) j!176) mask!3524))))

(assert (=> b!496131 e!290981))

(declare-fun res!298514 () Bool)

(assert (=> b!496131 (=> (not res!298514) (not e!290981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32088 (_ BitVec 32)) Bool)

(assert (=> b!496131 (= res!298514 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14734 0))(
  ( (Unit!14735) )
))
(declare-fun lt!224599 () Unit!14734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14734)

(assert (=> b!496131 (= lt!224599 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!298517 () Bool)

(assert (=> start!45200 (=> (not res!298517) (not e!290979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45200 (= res!298517 (validMask!0 mask!3524))))

(assert (=> start!45200 e!290979))

(assert (=> start!45200 true))

(declare-fun array_inv!11223 (array!32088) Bool)

(assert (=> start!45200 (array_inv!11223 a!3235)))

(declare-fun b!496132 () Bool)

(declare-fun res!298519 () Bool)

(assert (=> b!496132 (=> (not res!298519) (not e!290982))))

(assert (=> b!496132 (= res!298519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496133 () Bool)

(declare-fun res!298518 () Bool)

(assert (=> b!496133 (=> (not res!298518) (not e!290979))))

(assert (=> b!496133 (= res!298518 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45200 res!298517) b!496124))

(assert (= (and b!496124 res!298512) b!496129))

(assert (= (and b!496129 res!298515) b!496133))

(assert (= (and b!496133 res!298518) b!496123))

(assert (= (and b!496123 res!298511) b!496126))

(assert (= (and b!496126 res!298513) b!496132))

(assert (= (and b!496132 res!298519) b!496125))

(assert (= (and b!496125 res!298510) b!496131))

(assert (= (and b!496131 res!298514) b!496127))

(assert (= (and b!496131 (not res!298520)) b!496128))

(assert (= (and b!496128 (not res!298516)) b!496130))

(declare-fun m!477311 () Bool)

(assert (=> b!496125 m!477311))

(declare-fun m!477313 () Bool)

(assert (=> b!496129 m!477313))

(assert (=> b!496129 m!477313))

(declare-fun m!477315 () Bool)

(assert (=> b!496129 m!477315))

(assert (=> b!496127 m!477313))

(assert (=> b!496127 m!477313))

(declare-fun m!477317 () Bool)

(assert (=> b!496127 m!477317))

(declare-fun m!477319 () Bool)

(assert (=> b!496130 m!477319))

(assert (=> b!496130 m!477313))

(declare-fun m!477321 () Bool)

(assert (=> b!496123 m!477321))

(declare-fun m!477323 () Bool)

(assert (=> b!496131 m!477323))

(declare-fun m!477325 () Bool)

(assert (=> b!496131 m!477325))

(declare-fun m!477327 () Bool)

(assert (=> b!496131 m!477327))

(declare-fun m!477329 () Bool)

(assert (=> b!496131 m!477329))

(assert (=> b!496131 m!477323))

(assert (=> b!496131 m!477313))

(declare-fun m!477331 () Bool)

(assert (=> b!496131 m!477331))

(assert (=> b!496131 m!477313))

(declare-fun m!477333 () Bool)

(assert (=> b!496131 m!477333))

(assert (=> b!496131 m!477313))

(declare-fun m!477335 () Bool)

(assert (=> b!496131 m!477335))

(assert (=> b!496131 m!477323))

(declare-fun m!477337 () Bool)

(assert (=> b!496131 m!477337))

(declare-fun m!477339 () Bool)

(assert (=> b!496133 m!477339))

(declare-fun m!477341 () Bool)

(assert (=> b!496126 m!477341))

(declare-fun m!477343 () Bool)

(assert (=> b!496132 m!477343))

(declare-fun m!477345 () Bool)

(assert (=> start!45200 m!477345))

(declare-fun m!477347 () Bool)

(assert (=> start!45200 m!477347))

(check-sat (not b!496123) (not b!496131) (not b!496126) (not b!496125) (not b!496133) (not b!496127) (not b!496132) (not b!496129) (not start!45200))
