; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46194 () Bool)

(assert start!46194)

(declare-fun b!511309 () Bool)

(declare-fun res!312115 () Bool)

(declare-fun e!298749 () Bool)

(assert (=> b!511309 (=> (not res!312115) (not e!298749))))

(declare-datatypes ((array!32858 0))(
  ( (array!32859 (arr!15806 (Array (_ BitVec 32) (_ BitVec 64))) (size!16171 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32858)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32858 (_ BitVec 32)) Bool)

(assert (=> b!511309 (= res!312115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511310 () Bool)

(declare-fun res!312117 () Bool)

(declare-fun e!298747 () Bool)

(assert (=> b!511310 (=> (not res!312117) (not e!298747))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511310 (= res!312117 (validKeyInArray!0 (select (arr!15806 a!3235) j!176)))))

(declare-fun b!511311 () Bool)

(declare-fun res!312121 () Bool)

(assert (=> b!511311 (=> (not res!312121) (not e!298747))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511311 (= res!312121 (and (= (size!16171 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16171 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16171 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!312116 () Bool)

(assert (=> start!46194 (=> (not res!312116) (not e!298747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46194 (= res!312116 (validMask!0 mask!3524))))

(assert (=> start!46194 e!298747))

(assert (=> start!46194 true))

(declare-fun array_inv!11689 (array!32858) Bool)

(assert (=> start!46194 (array_inv!11689 a!3235)))

(declare-fun b!511312 () Bool)

(declare-fun res!312122 () Bool)

(assert (=> b!511312 (=> (not res!312122) (not e!298747))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511312 (= res!312122 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511313 () Bool)

(declare-fun res!312113 () Bool)

(assert (=> b!511313 (=> (not res!312113) (not e!298747))))

(assert (=> b!511313 (= res!312113 (validKeyInArray!0 k0!2280))))

(declare-fun b!511314 () Bool)

(declare-fun e!298746 () Bool)

(assert (=> b!511314 (= e!298746 (bvsle #b00000000000000000000000000000000 (size!16171 a!3235)))))

(declare-datatypes ((SeekEntryResult!4270 0))(
  ( (MissingZero!4270 (index!19268 (_ BitVec 32))) (Found!4270 (index!19269 (_ BitVec 32))) (Intermediate!4270 (undefined!5082 Bool) (index!19270 (_ BitVec 32)) (x!48232 (_ BitVec 32))) (Undefined!4270) (MissingVacant!4270 (index!19271 (_ BitVec 32))) )
))
(declare-fun lt!233832 () SeekEntryResult!4270)

(assert (=> b!511314 (= lt!233832 Undefined!4270)))

(declare-fun b!511315 () Bool)

(assert (=> b!511315 (= e!298749 (not e!298746))))

(declare-fun res!312120 () Bool)

(assert (=> b!511315 (=> res!312120 e!298746)))

(declare-fun lt!233834 () SeekEntryResult!4270)

(declare-fun lt!233836 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32858 (_ BitVec 32)) SeekEntryResult!4270)

(assert (=> b!511315 (= res!312120 (= lt!233834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233836 (select (store (arr!15806 a!3235) i!1204 k0!2280) j!176) (array!32859 (store (arr!15806 a!3235) i!1204 k0!2280) (size!16171 a!3235)) mask!3524)))))

(declare-fun lt!233831 () (_ BitVec 32))

(assert (=> b!511315 (= lt!233834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233831 (select (arr!15806 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511315 (= lt!233836 (toIndex!0 (select (store (arr!15806 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511315 (= lt!233831 (toIndex!0 (select (arr!15806 a!3235) j!176) mask!3524))))

(assert (=> b!511315 (= lt!233832 (Found!4270 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32858 (_ BitVec 32)) SeekEntryResult!4270)

(assert (=> b!511315 (= lt!233832 (seekEntryOrOpen!0 (select (arr!15806 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511315 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15784 0))(
  ( (Unit!15785) )
))
(declare-fun lt!233835 () Unit!15784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15784)

(assert (=> b!511315 (= lt!233835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511316 () Bool)

(declare-fun res!312119 () Bool)

(assert (=> b!511316 (=> (not res!312119) (not e!298749))))

(declare-datatypes ((List!10003 0))(
  ( (Nil!10000) (Cons!9999 (h!10879 (_ BitVec 64)) (t!16222 List!10003)) )
))
(declare-fun arrayNoDuplicates!0 (array!32858 (_ BitVec 32) List!10003) Bool)

(assert (=> b!511316 (= res!312119 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10000))))

(declare-fun b!511317 () Bool)

(declare-fun res!312118 () Bool)

(assert (=> b!511317 (=> res!312118 e!298746)))

(get-info :version)

(assert (=> b!511317 (= res!312118 (or (not ((_ is Intermediate!4270) lt!233834)) (not (undefined!5082 lt!233834))))))

(declare-fun b!511318 () Bool)

(assert (=> b!511318 (= e!298747 e!298749)))

(declare-fun res!312114 () Bool)

(assert (=> b!511318 (=> (not res!312114) (not e!298749))))

(declare-fun lt!233833 () SeekEntryResult!4270)

(assert (=> b!511318 (= res!312114 (or (= lt!233833 (MissingZero!4270 i!1204)) (= lt!233833 (MissingVacant!4270 i!1204))))))

(assert (=> b!511318 (= lt!233833 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46194 res!312116) b!511311))

(assert (= (and b!511311 res!312121) b!511310))

(assert (= (and b!511310 res!312117) b!511313))

(assert (= (and b!511313 res!312113) b!511312))

(assert (= (and b!511312 res!312122) b!511318))

(assert (= (and b!511318 res!312114) b!511309))

(assert (= (and b!511309 res!312115) b!511316))

(assert (= (and b!511316 res!312119) b!511315))

(assert (= (and b!511315 (not res!312120)) b!511317))

(assert (= (and b!511317 (not res!312118)) b!511314))

(declare-fun m!492313 () Bool)

(assert (=> b!511313 m!492313))

(declare-fun m!492315 () Bool)

(assert (=> b!511310 m!492315))

(assert (=> b!511310 m!492315))

(declare-fun m!492317 () Bool)

(assert (=> b!511310 m!492317))

(declare-fun m!492319 () Bool)

(assert (=> b!511312 m!492319))

(declare-fun m!492321 () Bool)

(assert (=> b!511318 m!492321))

(declare-fun m!492323 () Bool)

(assert (=> b!511316 m!492323))

(declare-fun m!492325 () Bool)

(assert (=> b!511315 m!492325))

(declare-fun m!492327 () Bool)

(assert (=> b!511315 m!492327))

(declare-fun m!492329 () Bool)

(assert (=> b!511315 m!492329))

(assert (=> b!511315 m!492329))

(declare-fun m!492331 () Bool)

(assert (=> b!511315 m!492331))

(assert (=> b!511315 m!492315))

(declare-fun m!492333 () Bool)

(assert (=> b!511315 m!492333))

(assert (=> b!511315 m!492315))

(declare-fun m!492335 () Bool)

(assert (=> b!511315 m!492335))

(assert (=> b!511315 m!492315))

(declare-fun m!492337 () Bool)

(assert (=> b!511315 m!492337))

(assert (=> b!511315 m!492315))

(declare-fun m!492339 () Bool)

(assert (=> b!511315 m!492339))

(assert (=> b!511315 m!492329))

(declare-fun m!492341 () Bool)

(assert (=> b!511315 m!492341))

(declare-fun m!492343 () Bool)

(assert (=> b!511309 m!492343))

(declare-fun m!492345 () Bool)

(assert (=> start!46194 m!492345))

(declare-fun m!492347 () Bool)

(assert (=> start!46194 m!492347))

(check-sat (not b!511309) (not b!511313) (not b!511315) (not b!511316) (not b!511310) (not start!46194) (not b!511312) (not b!511318))
(check-sat)
