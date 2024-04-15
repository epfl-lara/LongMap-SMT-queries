; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44280 () Bool)

(assert start!44280)

(declare-fun b!486801 () Bool)

(declare-fun res!290330 () Bool)

(declare-fun e!286467 () Bool)

(assert (=> b!486801 (=> (not res!290330) (not e!286467))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31541 0))(
  ( (array!31542 (arr!15164 (Array (_ BitVec 32) (_ BitVec 64))) (size!15529 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31541)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486801 (= res!290330 (and (= (size!15529 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15529 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15529 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486802 () Bool)

(declare-fun res!290335 () Bool)

(assert (=> b!486802 (=> (not res!290335) (not e!286467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486802 (= res!290335 (validKeyInArray!0 (select (arr!15164 a!3235) j!176)))))

(declare-fun b!486803 () Bool)

(declare-fun res!290332 () Bool)

(assert (=> b!486803 (=> (not res!290332) (not e!286467))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!486803 (= res!290332 (validKeyInArray!0 k0!2280))))

(declare-fun b!486804 () Bool)

(declare-fun e!286465 () Bool)

(assert (=> b!486804 (= e!286467 e!286465)))

(declare-fun res!290333 () Bool)

(assert (=> b!486804 (=> (not res!290333) (not e!286465))))

(declare-datatypes ((SeekEntryResult!3628 0))(
  ( (MissingZero!3628 (index!16691 (_ BitVec 32))) (Found!3628 (index!16692 (_ BitVec 32))) (Intermediate!3628 (undefined!4440 Bool) (index!16693 (_ BitVec 32)) (x!45827 (_ BitVec 32))) (Undefined!3628) (MissingVacant!3628 (index!16694 (_ BitVec 32))) )
))
(declare-fun lt!219699 () SeekEntryResult!3628)

(assert (=> b!486804 (= res!290333 (or (= lt!219699 (MissingZero!3628 i!1204)) (= lt!219699 (MissingVacant!3628 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31541 (_ BitVec 32)) SeekEntryResult!3628)

(assert (=> b!486804 (= lt!219699 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486805 () Bool)

(declare-fun res!290336 () Bool)

(assert (=> b!486805 (=> (not res!290336) (not e!286465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31541 (_ BitVec 32)) Bool)

(assert (=> b!486805 (= res!290336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486806 () Bool)

(declare-fun res!290331 () Bool)

(assert (=> b!486806 (=> (not res!290331) (not e!286465))))

(declare-datatypes ((List!9361 0))(
  ( (Nil!9358) (Cons!9357 (h!10213 (_ BitVec 64)) (t!15580 List!9361)) )
))
(declare-fun arrayNoDuplicates!0 (array!31541 (_ BitVec 32) List!9361) Bool)

(assert (=> b!486806 (= res!290331 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9358))))

(declare-fun b!486807 () Bool)

(declare-fun res!290334 () Bool)

(assert (=> b!486807 (=> (not res!290334) (not e!286467))))

(declare-fun arrayContainsKey!0 (array!31541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486807 (= res!290334 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290329 () Bool)

(assert (=> start!44280 (=> (not res!290329) (not e!286467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44280 (= res!290329 (validMask!0 mask!3524))))

(assert (=> start!44280 e!286467))

(assert (=> start!44280 true))

(declare-fun array_inv!11047 (array!31541) Bool)

(assert (=> start!44280 (array_inv!11047 a!3235)))

(declare-fun b!486808 () Bool)

(assert (=> b!486808 (= e!286465 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!486808 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14188 0))(
  ( (Unit!14189) )
))
(declare-fun lt!219700 () Unit!14188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14188)

(assert (=> b!486808 (= lt!219700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44280 res!290329) b!486801))

(assert (= (and b!486801 res!290330) b!486802))

(assert (= (and b!486802 res!290335) b!486803))

(assert (= (and b!486803 res!290332) b!486807))

(assert (= (and b!486807 res!290334) b!486804))

(assert (= (and b!486804 res!290333) b!486805))

(assert (= (and b!486805 res!290336) b!486806))

(assert (= (and b!486806 res!290331) b!486808))

(declare-fun m!466171 () Bool)

(assert (=> b!486807 m!466171))

(declare-fun m!466173 () Bool)

(assert (=> b!486802 m!466173))

(assert (=> b!486802 m!466173))

(declare-fun m!466175 () Bool)

(assert (=> b!486802 m!466175))

(declare-fun m!466177 () Bool)

(assert (=> b!486805 m!466177))

(declare-fun m!466179 () Bool)

(assert (=> b!486808 m!466179))

(declare-fun m!466181 () Bool)

(assert (=> b!486808 m!466181))

(declare-fun m!466183 () Bool)

(assert (=> start!44280 m!466183))

(declare-fun m!466185 () Bool)

(assert (=> start!44280 m!466185))

(declare-fun m!466187 () Bool)

(assert (=> b!486804 m!466187))

(declare-fun m!466189 () Bool)

(assert (=> b!486803 m!466189))

(declare-fun m!466191 () Bool)

(assert (=> b!486806 m!466191))

(check-sat (not b!486806) (not start!44280) (not b!486802) (not b!486805) (not b!486803) (not b!486807) (not b!486804) (not b!486808))
(check-sat)
