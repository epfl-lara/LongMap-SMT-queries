; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46200 () Bool)

(assert start!46200)

(declare-fun b!511399 () Bool)

(declare-fun res!312210 () Bool)

(declare-fun e!298782 () Bool)

(assert (=> b!511399 (=> (not res!312210) (not e!298782))))

(declare-datatypes ((array!32864 0))(
  ( (array!32865 (arr!15809 (Array (_ BitVec 32) (_ BitVec 64))) (size!16174 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32864)

(declare-datatypes ((List!10006 0))(
  ( (Nil!10003) (Cons!10002 (h!10882 (_ BitVec 64)) (t!16225 List!10006)) )
))
(declare-fun arrayNoDuplicates!0 (array!32864 (_ BitVec 32) List!10006) Bool)

(assert (=> b!511399 (= res!312210 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10003))))

(declare-fun b!511400 () Bool)

(declare-fun res!312208 () Bool)

(assert (=> b!511400 (=> (not res!312208) (not e!298782))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32864 (_ BitVec 32)) Bool)

(assert (=> b!511400 (= res!312208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511401 () Bool)

(declare-fun res!312212 () Bool)

(declare-fun e!298785 () Bool)

(assert (=> b!511401 (=> (not res!312212) (not e!298785))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511401 (= res!312212 (validKeyInArray!0 k0!2280))))

(declare-fun b!511402 () Bool)

(declare-fun res!312203 () Bool)

(assert (=> b!511402 (=> (not res!312203) (not e!298785))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511402 (= res!312203 (and (= (size!16174 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16174 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16174 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!312209 () Bool)

(assert (=> start!46200 (=> (not res!312209) (not e!298785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46200 (= res!312209 (validMask!0 mask!3524))))

(assert (=> start!46200 e!298785))

(assert (=> start!46200 true))

(declare-fun array_inv!11692 (array!32864) Bool)

(assert (=> start!46200 (array_inv!11692 a!3235)))

(declare-fun b!511403 () Bool)

(declare-fun res!312205 () Bool)

(assert (=> b!511403 (=> (not res!312205) (not e!298785))))

(assert (=> b!511403 (= res!312205 (validKeyInArray!0 (select (arr!15809 a!3235) j!176)))))

(declare-fun b!511404 () Bool)

(declare-fun e!298784 () Bool)

(assert (=> b!511404 (= e!298784 (or (bvsgt #b00000000000000000000000000000000 (size!16174 a!3235)) (bvsle j!176 (size!16174 a!3235))))))

(declare-datatypes ((SeekEntryResult!4273 0))(
  ( (MissingZero!4273 (index!19280 (_ BitVec 32))) (Found!4273 (index!19281 (_ BitVec 32))) (Intermediate!4273 (undefined!5085 Bool) (index!19282 (_ BitVec 32)) (x!48243 (_ BitVec 32))) (Undefined!4273) (MissingVacant!4273 (index!19283 (_ BitVec 32))) )
))
(declare-fun lt!233889 () SeekEntryResult!4273)

(assert (=> b!511404 (= lt!233889 Undefined!4273)))

(declare-fun b!511405 () Bool)

(assert (=> b!511405 (= e!298785 e!298782)))

(declare-fun res!312206 () Bool)

(assert (=> b!511405 (=> (not res!312206) (not e!298782))))

(declare-fun lt!233885 () SeekEntryResult!4273)

(assert (=> b!511405 (= res!312206 (or (= lt!233885 (MissingZero!4273 i!1204)) (= lt!233885 (MissingVacant!4273 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32864 (_ BitVec 32)) SeekEntryResult!4273)

(assert (=> b!511405 (= lt!233885 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511406 () Bool)

(declare-fun res!312211 () Bool)

(assert (=> b!511406 (=> (not res!312211) (not e!298785))))

(declare-fun arrayContainsKey!0 (array!32864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511406 (= res!312211 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511407 () Bool)

(declare-fun res!312207 () Bool)

(assert (=> b!511407 (=> res!312207 e!298784)))

(declare-fun lt!233887 () SeekEntryResult!4273)

(get-info :version)

(assert (=> b!511407 (= res!312207 (or (not ((_ is Intermediate!4273) lt!233887)) (not (undefined!5085 lt!233887))))))

(declare-fun b!511408 () Bool)

(assert (=> b!511408 (= e!298782 (not e!298784))))

(declare-fun res!312204 () Bool)

(assert (=> b!511408 (=> res!312204 e!298784)))

(declare-fun lt!233886 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32864 (_ BitVec 32)) SeekEntryResult!4273)

(assert (=> b!511408 (= res!312204 (= lt!233887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233886 (select (store (arr!15809 a!3235) i!1204 k0!2280) j!176) (array!32865 (store (arr!15809 a!3235) i!1204 k0!2280) (size!16174 a!3235)) mask!3524)))))

(declare-fun lt!233888 () (_ BitVec 32))

(assert (=> b!511408 (= lt!233887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233888 (select (arr!15809 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511408 (= lt!233886 (toIndex!0 (select (store (arr!15809 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511408 (= lt!233888 (toIndex!0 (select (arr!15809 a!3235) j!176) mask!3524))))

(assert (=> b!511408 (= lt!233889 (Found!4273 j!176))))

(assert (=> b!511408 (= lt!233889 (seekEntryOrOpen!0 (select (arr!15809 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511408 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15790 0))(
  ( (Unit!15791) )
))
(declare-fun lt!233890 () Unit!15790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15790)

(assert (=> b!511408 (= lt!233890 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46200 res!312209) b!511402))

(assert (= (and b!511402 res!312203) b!511403))

(assert (= (and b!511403 res!312205) b!511401))

(assert (= (and b!511401 res!312212) b!511406))

(assert (= (and b!511406 res!312211) b!511405))

(assert (= (and b!511405 res!312206) b!511400))

(assert (= (and b!511400 res!312208) b!511399))

(assert (= (and b!511399 res!312210) b!511408))

(assert (= (and b!511408 (not res!312204)) b!511407))

(assert (= (and b!511407 (not res!312207)) b!511404))

(declare-fun m!492421 () Bool)

(assert (=> b!511400 m!492421))

(declare-fun m!492423 () Bool)

(assert (=> b!511405 m!492423))

(declare-fun m!492425 () Bool)

(assert (=> b!511403 m!492425))

(assert (=> b!511403 m!492425))

(declare-fun m!492427 () Bool)

(assert (=> b!511403 m!492427))

(declare-fun m!492429 () Bool)

(assert (=> b!511408 m!492429))

(declare-fun m!492431 () Bool)

(assert (=> b!511408 m!492431))

(assert (=> b!511408 m!492425))

(declare-fun m!492433 () Bool)

(assert (=> b!511408 m!492433))

(assert (=> b!511408 m!492425))

(declare-fun m!492435 () Bool)

(assert (=> b!511408 m!492435))

(assert (=> b!511408 m!492425))

(declare-fun m!492437 () Bool)

(assert (=> b!511408 m!492437))

(assert (=> b!511408 m!492425))

(declare-fun m!492439 () Bool)

(assert (=> b!511408 m!492439))

(assert (=> b!511408 m!492431))

(declare-fun m!492441 () Bool)

(assert (=> b!511408 m!492441))

(declare-fun m!492443 () Bool)

(assert (=> b!511408 m!492443))

(assert (=> b!511408 m!492431))

(declare-fun m!492445 () Bool)

(assert (=> b!511408 m!492445))

(declare-fun m!492447 () Bool)

(assert (=> b!511399 m!492447))

(declare-fun m!492449 () Bool)

(assert (=> start!46200 m!492449))

(declare-fun m!492451 () Bool)

(assert (=> start!46200 m!492451))

(declare-fun m!492453 () Bool)

(assert (=> b!511401 m!492453))

(declare-fun m!492455 () Bool)

(assert (=> b!511406 m!492455))

(check-sat (not b!511401) (not b!511400) (not b!511408) (not b!511399) (not start!46200) (not b!511403) (not b!511405) (not b!511406))
(check-sat)
