; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46214 () Bool)

(assert start!46214)

(declare-fun b!511789 () Bool)

(declare-fun res!312510 () Bool)

(declare-fun e!298990 () Bool)

(assert (=> b!511789 (=> (not res!312510) (not e!298990))))

(declare-datatypes ((array!32869 0))(
  ( (array!32870 (arr!15811 (Array (_ BitVec 32) (_ BitVec 64))) (size!16175 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32869)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32869 (_ BitVec 32)) Bool)

(assert (=> b!511789 (= res!312510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!312512 () Bool)

(declare-fun e!298992 () Bool)

(assert (=> start!46214 (=> (not res!312512) (not e!298992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46214 (= res!312512 (validMask!0 mask!3524))))

(assert (=> start!46214 e!298992))

(assert (=> start!46214 true))

(declare-fun array_inv!11670 (array!32869) Bool)

(assert (=> start!46214 (array_inv!11670 a!3235)))

(declare-fun b!511790 () Bool)

(declare-fun e!298991 () Bool)

(assert (=> b!511790 (= e!298990 (not e!298991))))

(declare-fun res!312508 () Bool)

(assert (=> b!511790 (=> res!312508 e!298991)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4234 0))(
  ( (MissingZero!4234 (index!19124 (_ BitVec 32))) (Found!4234 (index!19125 (_ BitVec 32))) (Intermediate!4234 (undefined!5046 Bool) (index!19126 (_ BitVec 32)) (x!48222 (_ BitVec 32))) (Undefined!4234) (MissingVacant!4234 (index!19127 (_ BitVec 32))) )
))
(declare-fun lt!234243 () SeekEntryResult!4234)

(declare-fun lt!234241 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32869 (_ BitVec 32)) SeekEntryResult!4234)

(assert (=> b!511790 (= res!312508 (= lt!234243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234241 (select (store (arr!15811 a!3235) i!1204 k0!2280) j!176) (array!32870 (store (arr!15811 a!3235) i!1204 k0!2280) (size!16175 a!3235)) mask!3524)))))

(declare-fun lt!234240 () (_ BitVec 32))

(assert (=> b!511790 (= lt!234243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234240 (select (arr!15811 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511790 (= lt!234241 (toIndex!0 (select (store (arr!15811 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511790 (= lt!234240 (toIndex!0 (select (arr!15811 a!3235) j!176) mask!3524))))

(declare-fun lt!234239 () SeekEntryResult!4234)

(assert (=> b!511790 (= lt!234239 (Found!4234 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32869 (_ BitVec 32)) SeekEntryResult!4234)

(assert (=> b!511790 (= lt!234239 (seekEntryOrOpen!0 (select (arr!15811 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511790 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15787 0))(
  ( (Unit!15788) )
))
(declare-fun lt!234242 () Unit!15787)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15787)

(assert (=> b!511790 (= lt!234242 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511791 () Bool)

(declare-fun res!312509 () Bool)

(assert (=> b!511791 (=> res!312509 e!298991)))

(get-info :version)

(assert (=> b!511791 (= res!312509 (or (not ((_ is Intermediate!4234) lt!234243)) (not (undefined!5046 lt!234243))))))

(declare-fun b!511792 () Bool)

(assert (=> b!511792 (= e!298992 e!298990)))

(declare-fun res!312507 () Bool)

(assert (=> b!511792 (=> (not res!312507) (not e!298990))))

(declare-fun lt!234244 () SeekEntryResult!4234)

(assert (=> b!511792 (= res!312507 (or (= lt!234244 (MissingZero!4234 i!1204)) (= lt!234244 (MissingVacant!4234 i!1204))))))

(assert (=> b!511792 (= lt!234244 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511793 () Bool)

(declare-fun res!312514 () Bool)

(assert (=> b!511793 (=> (not res!312514) (not e!298992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511793 (= res!312514 (validKeyInArray!0 k0!2280))))

(declare-fun b!511794 () Bool)

(declare-fun res!312513 () Bool)

(assert (=> b!511794 (=> (not res!312513) (not e!298992))))

(assert (=> b!511794 (= res!312513 (validKeyInArray!0 (select (arr!15811 a!3235) j!176)))))

(declare-fun b!511795 () Bool)

(declare-fun res!312506 () Bool)

(assert (=> b!511795 (=> (not res!312506) (not e!298992))))

(declare-fun arrayContainsKey!0 (array!32869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511795 (= res!312506 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511796 () Bool)

(declare-fun res!312505 () Bool)

(assert (=> b!511796 (=> (not res!312505) (not e!298992))))

(assert (=> b!511796 (= res!312505 (and (= (size!16175 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16175 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16175 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511797 () Bool)

(assert (=> b!511797 (= e!298991 true)))

(assert (=> b!511797 (= lt!234239 Undefined!4234)))

(declare-fun b!511798 () Bool)

(declare-fun res!312511 () Bool)

(assert (=> b!511798 (=> (not res!312511) (not e!298990))))

(declare-datatypes ((List!9876 0))(
  ( (Nil!9873) (Cons!9872 (h!10752 (_ BitVec 64)) (t!16096 List!9876)) )
))
(declare-fun arrayNoDuplicates!0 (array!32869 (_ BitVec 32) List!9876) Bool)

(assert (=> b!511798 (= res!312511 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9873))))

(assert (= (and start!46214 res!312512) b!511796))

(assert (= (and b!511796 res!312505) b!511794))

(assert (= (and b!511794 res!312513) b!511793))

(assert (= (and b!511793 res!312514) b!511795))

(assert (= (and b!511795 res!312506) b!511792))

(assert (= (and b!511792 res!312507) b!511789))

(assert (= (and b!511789 res!312510) b!511798))

(assert (= (and b!511798 res!312511) b!511790))

(assert (= (and b!511790 (not res!312508)) b!511791))

(assert (= (and b!511791 (not res!312509)) b!511797))

(declare-fun m!493573 () Bool)

(assert (=> b!511793 m!493573))

(declare-fun m!493575 () Bool)

(assert (=> b!511795 m!493575))

(declare-fun m!493577 () Bool)

(assert (=> b!511794 m!493577))

(assert (=> b!511794 m!493577))

(declare-fun m!493579 () Bool)

(assert (=> b!511794 m!493579))

(declare-fun m!493581 () Bool)

(assert (=> b!511798 m!493581))

(declare-fun m!493583 () Bool)

(assert (=> start!46214 m!493583))

(declare-fun m!493585 () Bool)

(assert (=> start!46214 m!493585))

(declare-fun m!493587 () Bool)

(assert (=> b!511789 m!493587))

(declare-fun m!493589 () Bool)

(assert (=> b!511790 m!493589))

(declare-fun m!493591 () Bool)

(assert (=> b!511790 m!493591))

(declare-fun m!493593 () Bool)

(assert (=> b!511790 m!493593))

(assert (=> b!511790 m!493577))

(declare-fun m!493595 () Bool)

(assert (=> b!511790 m!493595))

(assert (=> b!511790 m!493577))

(declare-fun m!493597 () Bool)

(assert (=> b!511790 m!493597))

(declare-fun m!493599 () Bool)

(assert (=> b!511790 m!493599))

(assert (=> b!511790 m!493577))

(declare-fun m!493601 () Bool)

(assert (=> b!511790 m!493601))

(assert (=> b!511790 m!493593))

(declare-fun m!493603 () Bool)

(assert (=> b!511790 m!493603))

(assert (=> b!511790 m!493593))

(declare-fun m!493605 () Bool)

(assert (=> b!511790 m!493605))

(assert (=> b!511790 m!493577))

(declare-fun m!493607 () Bool)

(assert (=> b!511792 m!493607))

(check-sat (not start!46214) (not b!511793) (not b!511789) (not b!511790) (not b!511794) (not b!511798) (not b!511795) (not b!511792))
(check-sat)
