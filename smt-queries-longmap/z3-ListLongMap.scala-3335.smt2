; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45992 () Bool)

(assert start!45992)

(declare-fun b!509264 () Bool)

(declare-fun e!297831 () Bool)

(assert (=> b!509264 (= e!297831 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4153 0))(
  ( (MissingZero!4153 (index!18800 (_ BitVec 32))) (Found!4153 (index!18801 (_ BitVec 32))) (Intermediate!4153 (undefined!4965 Bool) (index!18802 (_ BitVec 32)) (x!47919 (_ BitVec 32))) (Undefined!4153) (MissingVacant!4153 (index!18803 (_ BitVec 32))) )
))
(declare-fun lt!232655 () SeekEntryResult!4153)

(declare-fun lt!232652 () (_ BitVec 32))

(declare-datatypes ((array!32704 0))(
  ( (array!32705 (arr!15730 (Array (_ BitVec 32) (_ BitVec 64))) (size!16094 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32704)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32704 (_ BitVec 32)) SeekEntryResult!4153)

(assert (=> b!509264 (= lt!232655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232652 (select (store (arr!15730 a!3235) i!1204 k0!2280) j!176) (array!32705 (store (arr!15730 a!3235) i!1204 k0!2280) (size!16094 a!3235)) mask!3524))))

(declare-fun lt!232654 () (_ BitVec 32))

(declare-fun lt!232656 () SeekEntryResult!4153)

(assert (=> b!509264 (= lt!232656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232654 (select (arr!15730 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509264 (= lt!232652 (toIndex!0 (select (store (arr!15730 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509264 (= lt!232654 (toIndex!0 (select (arr!15730 a!3235) j!176) mask!3524))))

(declare-fun e!297834 () Bool)

(assert (=> b!509264 e!297834))

(declare-fun res!310164 () Bool)

(assert (=> b!509264 (=> (not res!310164) (not e!297834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32704 (_ BitVec 32)) Bool)

(assert (=> b!509264 (= res!310164 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15625 0))(
  ( (Unit!15626) )
))
(declare-fun lt!232657 () Unit!15625)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15625)

(assert (=> b!509264 (= lt!232657 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509265 () Bool)

(declare-fun res!310169 () Bool)

(assert (=> b!509265 (=> (not res!310169) (not e!297831))))

(assert (=> b!509265 (= res!310169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509266 () Bool)

(declare-fun e!297832 () Bool)

(assert (=> b!509266 (= e!297832 e!297831)))

(declare-fun res!310168 () Bool)

(assert (=> b!509266 (=> (not res!310168) (not e!297831))))

(declare-fun lt!232653 () SeekEntryResult!4153)

(assert (=> b!509266 (= res!310168 (or (= lt!232653 (MissingZero!4153 i!1204)) (= lt!232653 (MissingVacant!4153 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32704 (_ BitVec 32)) SeekEntryResult!4153)

(assert (=> b!509266 (= lt!232653 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509267 () Bool)

(declare-fun res!310166 () Bool)

(assert (=> b!509267 (=> (not res!310166) (not e!297832))))

(declare-fun arrayContainsKey!0 (array!32704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509267 (= res!310166 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509268 () Bool)

(assert (=> b!509268 (= e!297834 (= (seekEntryOrOpen!0 (select (arr!15730 a!3235) j!176) a!3235 mask!3524) (Found!4153 j!176)))))

(declare-fun b!509269 () Bool)

(declare-fun res!310170 () Bool)

(assert (=> b!509269 (=> (not res!310170) (not e!297832))))

(assert (=> b!509269 (= res!310170 (and (= (size!16094 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16094 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16094 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!310167 () Bool)

(assert (=> start!45992 (=> (not res!310167) (not e!297832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45992 (= res!310167 (validMask!0 mask!3524))))

(assert (=> start!45992 e!297832))

(assert (=> start!45992 true))

(declare-fun array_inv!11589 (array!32704) Bool)

(assert (=> start!45992 (array_inv!11589 a!3235)))

(declare-fun b!509270 () Bool)

(declare-fun res!310163 () Bool)

(assert (=> b!509270 (=> (not res!310163) (not e!297831))))

(declare-datatypes ((List!9795 0))(
  ( (Nil!9792) (Cons!9791 (h!10668 (_ BitVec 64)) (t!16015 List!9795)) )
))
(declare-fun arrayNoDuplicates!0 (array!32704 (_ BitVec 32) List!9795) Bool)

(assert (=> b!509270 (= res!310163 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9792))))

(declare-fun b!509271 () Bool)

(declare-fun res!310171 () Bool)

(assert (=> b!509271 (=> (not res!310171) (not e!297832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509271 (= res!310171 (validKeyInArray!0 (select (arr!15730 a!3235) j!176)))))

(declare-fun b!509272 () Bool)

(declare-fun res!310165 () Bool)

(assert (=> b!509272 (=> (not res!310165) (not e!297832))))

(assert (=> b!509272 (= res!310165 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45992 res!310167) b!509269))

(assert (= (and b!509269 res!310170) b!509271))

(assert (= (and b!509271 res!310171) b!509272))

(assert (= (and b!509272 res!310165) b!509267))

(assert (= (and b!509267 res!310166) b!509266))

(assert (= (and b!509266 res!310168) b!509265))

(assert (= (and b!509265 res!310169) b!509270))

(assert (= (and b!509270 res!310163) b!509264))

(assert (= (and b!509264 res!310164) b!509268))

(declare-fun m!490357 () Bool)

(assert (=> b!509264 m!490357))

(declare-fun m!490359 () Bool)

(assert (=> b!509264 m!490359))

(declare-fun m!490361 () Bool)

(assert (=> b!509264 m!490361))

(assert (=> b!509264 m!490361))

(declare-fun m!490363 () Bool)

(assert (=> b!509264 m!490363))

(declare-fun m!490365 () Bool)

(assert (=> b!509264 m!490365))

(declare-fun m!490367 () Bool)

(assert (=> b!509264 m!490367))

(assert (=> b!509264 m!490365))

(declare-fun m!490369 () Bool)

(assert (=> b!509264 m!490369))

(assert (=> b!509264 m!490365))

(declare-fun m!490371 () Bool)

(assert (=> b!509264 m!490371))

(assert (=> b!509264 m!490361))

(declare-fun m!490373 () Bool)

(assert (=> b!509264 m!490373))

(declare-fun m!490375 () Bool)

(assert (=> b!509266 m!490375))

(declare-fun m!490377 () Bool)

(assert (=> b!509267 m!490377))

(declare-fun m!490379 () Bool)

(assert (=> b!509265 m!490379))

(declare-fun m!490381 () Bool)

(assert (=> start!45992 m!490381))

(declare-fun m!490383 () Bool)

(assert (=> start!45992 m!490383))

(declare-fun m!490385 () Bool)

(assert (=> b!509270 m!490385))

(declare-fun m!490387 () Bool)

(assert (=> b!509272 m!490387))

(assert (=> b!509268 m!490365))

(assert (=> b!509268 m!490365))

(declare-fun m!490389 () Bool)

(assert (=> b!509268 m!490389))

(assert (=> b!509271 m!490365))

(assert (=> b!509271 m!490365))

(declare-fun m!490391 () Bool)

(assert (=> b!509271 m!490391))

(check-sat (not start!45992) (not b!509270) (not b!509264) (not b!509271) (not b!509266) (not b!509265) (not b!509268) (not b!509267) (not b!509272))
(check-sat)
