; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46064 () Bool)

(assert start!46064)

(declare-fun b!510236 () Bool)

(declare-fun res!311143 () Bool)

(declare-fun e!298265 () Bool)

(assert (=> b!510236 (=> (not res!311143) (not e!298265))))

(declare-datatypes ((array!32776 0))(
  ( (array!32777 (arr!15766 (Array (_ BitVec 32) (_ BitVec 64))) (size!16130 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32776)

(declare-datatypes ((List!9831 0))(
  ( (Nil!9828) (Cons!9827 (h!10704 (_ BitVec 64)) (t!16051 List!9831)) )
))
(declare-fun arrayNoDuplicates!0 (array!32776 (_ BitVec 32) List!9831) Bool)

(assert (=> b!510236 (= res!311143 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9828))))

(declare-fun res!311138 () Bool)

(declare-fun e!298264 () Bool)

(assert (=> start!46064 (=> (not res!311138) (not e!298264))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46064 (= res!311138 (validMask!0 mask!3524))))

(assert (=> start!46064 e!298264))

(assert (=> start!46064 true))

(declare-fun array_inv!11625 (array!32776) Bool)

(assert (=> start!46064 (array_inv!11625 a!3235)))

(declare-fun b!510237 () Bool)

(declare-fun e!298263 () Bool)

(assert (=> b!510237 (= e!298263 true)))

(declare-datatypes ((SeekEntryResult!4189 0))(
  ( (MissingZero!4189 (index!18944 (_ BitVec 32))) (Found!4189 (index!18945 (_ BitVec 32))) (Intermediate!4189 (undefined!5001 Bool) (index!18946 (_ BitVec 32)) (x!48051 (_ BitVec 32))) (Undefined!4189) (MissingVacant!4189 (index!18947 (_ BitVec 32))) )
))
(declare-fun lt!233302 () SeekEntryResult!4189)

(declare-fun lt!233305 () (_ BitVec 64))

(declare-fun lt!233303 () array!32776)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32776 (_ BitVec 32)) SeekEntryResult!4189)

(assert (=> b!510237 (= lt!233302 (seekEntryOrOpen!0 lt!233305 lt!233303 mask!3524))))

(declare-datatypes ((Unit!15697 0))(
  ( (Unit!15698) )
))
(declare-fun lt!233300 () Unit!15697)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32776 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15697)

(assert (=> b!510237 (= lt!233300 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510238 () Bool)

(declare-fun res!311142 () Bool)

(assert (=> b!510238 (=> (not res!311142) (not e!298264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510238 (= res!311142 (validKeyInArray!0 (select (arr!15766 a!3235) j!176)))))

(declare-fun b!510239 () Bool)

(declare-fun res!311140 () Bool)

(assert (=> b!510239 (=> (not res!311140) (not e!298264))))

(declare-fun arrayContainsKey!0 (array!32776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510239 (= res!311140 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510240 () Bool)

(declare-fun res!311141 () Bool)

(assert (=> b!510240 (=> (not res!311141) (not e!298264))))

(assert (=> b!510240 (= res!311141 (and (= (size!16130 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16130 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16130 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510241 () Bool)

(declare-fun res!311137 () Bool)

(assert (=> b!510241 (=> (not res!311137) (not e!298265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32776 (_ BitVec 32)) Bool)

(assert (=> b!510241 (= res!311137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510242 () Bool)

(assert (=> b!510242 (= e!298265 (not e!298263))))

(declare-fun res!311139 () Bool)

(assert (=> b!510242 (=> res!311139 e!298263)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32776 (_ BitVec 32)) SeekEntryResult!4189)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510242 (= res!311139 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15766 a!3235) j!176) mask!3524) (select (arr!15766 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233305 mask!3524) lt!233305 lt!233303 mask!3524))))))

(assert (=> b!510242 (= lt!233305 (select (store (arr!15766 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510242 (= lt!233303 (array!32777 (store (arr!15766 a!3235) i!1204 k0!2280) (size!16130 a!3235)))))

(assert (=> b!510242 (= lt!233302 (Found!4189 j!176))))

(assert (=> b!510242 (= lt!233302 (seekEntryOrOpen!0 (select (arr!15766 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510242 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233301 () Unit!15697)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15697)

(assert (=> b!510242 (= lt!233301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510243 () Bool)

(declare-fun res!311135 () Bool)

(assert (=> b!510243 (=> (not res!311135) (not e!298264))))

(assert (=> b!510243 (= res!311135 (validKeyInArray!0 k0!2280))))

(declare-fun b!510244 () Bool)

(assert (=> b!510244 (= e!298264 e!298265)))

(declare-fun res!311136 () Bool)

(assert (=> b!510244 (=> (not res!311136) (not e!298265))))

(declare-fun lt!233304 () SeekEntryResult!4189)

(assert (=> b!510244 (= res!311136 (or (= lt!233304 (MissingZero!4189 i!1204)) (= lt!233304 (MissingVacant!4189 i!1204))))))

(assert (=> b!510244 (= lt!233304 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46064 res!311138) b!510240))

(assert (= (and b!510240 res!311141) b!510238))

(assert (= (and b!510238 res!311142) b!510243))

(assert (= (and b!510243 res!311135) b!510239))

(assert (= (and b!510239 res!311140) b!510244))

(assert (= (and b!510244 res!311136) b!510241))

(assert (= (and b!510241 res!311137) b!510236))

(assert (= (and b!510236 res!311143) b!510242))

(assert (= (and b!510242 (not res!311139)) b!510237))

(declare-fun m!491677 () Bool)

(assert (=> b!510237 m!491677))

(declare-fun m!491679 () Bool)

(assert (=> b!510237 m!491679))

(declare-fun m!491681 () Bool)

(assert (=> b!510242 m!491681))

(declare-fun m!491683 () Bool)

(assert (=> b!510242 m!491683))

(declare-fun m!491685 () Bool)

(assert (=> b!510242 m!491685))

(declare-fun m!491687 () Bool)

(assert (=> b!510242 m!491687))

(declare-fun m!491689 () Bool)

(assert (=> b!510242 m!491689))

(declare-fun m!491691 () Bool)

(assert (=> b!510242 m!491691))

(declare-fun m!491693 () Bool)

(assert (=> b!510242 m!491693))

(assert (=> b!510242 m!491691))

(assert (=> b!510242 m!491689))

(assert (=> b!510242 m!491681))

(declare-fun m!491695 () Bool)

(assert (=> b!510242 m!491695))

(assert (=> b!510242 m!491691))

(declare-fun m!491697 () Bool)

(assert (=> b!510242 m!491697))

(assert (=> b!510242 m!491691))

(declare-fun m!491699 () Bool)

(assert (=> b!510242 m!491699))

(assert (=> b!510238 m!491691))

(assert (=> b!510238 m!491691))

(declare-fun m!491701 () Bool)

(assert (=> b!510238 m!491701))

(declare-fun m!491703 () Bool)

(assert (=> b!510241 m!491703))

(declare-fun m!491705 () Bool)

(assert (=> b!510244 m!491705))

(declare-fun m!491707 () Bool)

(assert (=> b!510239 m!491707))

(declare-fun m!491709 () Bool)

(assert (=> b!510236 m!491709))

(declare-fun m!491711 () Bool)

(assert (=> b!510243 m!491711))

(declare-fun m!491713 () Bool)

(assert (=> start!46064 m!491713))

(declare-fun m!491715 () Bool)

(assert (=> start!46064 m!491715))

(check-sat (not start!46064) (not b!510244) (not b!510236) (not b!510241) (not b!510242) (not b!510239) (not b!510243) (not b!510238) (not b!510237))
(check-sat)
