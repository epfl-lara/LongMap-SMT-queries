; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30294 () Bool)

(assert start!30294)

(declare-fun b!303379 () Bool)

(declare-fun res!160918 () Bool)

(declare-fun e!190923 () Bool)

(assert (=> b!303379 (=> (not res!160918) (not e!190923))))

(declare-datatypes ((array!15413 0))(
  ( (array!15414 (arr!7294 (Array (_ BitVec 32) (_ BitVec 64))) (size!7646 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15413)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15413 (_ BitVec 32)) Bool)

(assert (=> b!303379 (= res!160918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303380 () Bool)

(declare-fun res!160917 () Bool)

(assert (=> b!303380 (=> (not res!160917) (not e!190923))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303380 (= res!160917 (validKeyInArray!0 k0!2441))))

(declare-fun res!160923 () Bool)

(assert (=> start!30294 (=> (not res!160923) (not e!190923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30294 (= res!160923 (validMask!0 mask!3709))))

(assert (=> start!30294 e!190923))

(declare-fun array_inv!5244 (array!15413) Bool)

(assert (=> start!30294 (array_inv!5244 a!3293)))

(assert (=> start!30294 true))

(declare-fun b!303381 () Bool)

(declare-fun res!160916 () Bool)

(assert (=> b!303381 (=> (not res!160916) (not e!190923))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303381 (= res!160916 (and (= (size!7646 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7646 a!3293))))))

(declare-fun b!303382 () Bool)

(declare-fun res!160915 () Bool)

(assert (=> b!303382 (=> (not res!160915) (not e!190923))))

(declare-datatypes ((SeekEntryResult!2399 0))(
  ( (MissingZero!2399 (index!11772 (_ BitVec 32))) (Found!2399 (index!11773 (_ BitVec 32))) (Intermediate!2399 (undefined!3211 Bool) (index!11774 (_ BitVec 32)) (x!30141 (_ BitVec 32))) (Undefined!2399) (MissingVacant!2399 (index!11775 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15413 (_ BitVec 32)) SeekEntryResult!2399)

(assert (=> b!303382 (= res!160915 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2399 i!1240)))))

(declare-fun b!303383 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun e!190922 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303383 (= e!190922 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7294 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7294 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7294 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!303384 () Bool)

(assert (=> b!303384 (= e!190923 e!190922)))

(declare-fun res!160919 () Bool)

(assert (=> b!303384 (=> (not res!160919) (not e!190922))))

(declare-fun lt!150225 () SeekEntryResult!2399)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15413 (_ BitVec 32)) SeekEntryResult!2399)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303384 (= res!160919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150225))))

(assert (=> b!303384 (= lt!150225 (Intermediate!2399 false resIndex!52 resX!52))))

(declare-fun b!303385 () Bool)

(declare-fun res!160921 () Bool)

(assert (=> b!303385 (=> (not res!160921) (not e!190922))))

(assert (=> b!303385 (= res!160921 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150225))))

(declare-fun b!303386 () Bool)

(declare-fun res!160920 () Bool)

(assert (=> b!303386 (=> (not res!160920) (not e!190923))))

(declare-fun arrayContainsKey!0 (array!15413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303386 (= res!160920 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303387 () Bool)

(declare-fun res!160922 () Bool)

(assert (=> b!303387 (=> (not res!160922) (not e!190922))))

(assert (=> b!303387 (= res!160922 (and (= (select (arr!7294 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7646 a!3293))))))

(assert (= (and start!30294 res!160923) b!303381))

(assert (= (and b!303381 res!160916) b!303380))

(assert (= (and b!303380 res!160917) b!303386))

(assert (= (and b!303386 res!160920) b!303382))

(assert (= (and b!303382 res!160915) b!303379))

(assert (= (and b!303379 res!160918) b!303384))

(assert (= (and b!303384 res!160919) b!303387))

(assert (= (and b!303387 res!160922) b!303385))

(assert (= (and b!303385 res!160921) b!303383))

(declare-fun m!314893 () Bool)

(assert (=> b!303380 m!314893))

(declare-fun m!314895 () Bool)

(assert (=> b!303383 m!314895))

(declare-fun m!314897 () Bool)

(assert (=> b!303379 m!314897))

(declare-fun m!314899 () Bool)

(assert (=> b!303382 m!314899))

(declare-fun m!314901 () Bool)

(assert (=> start!30294 m!314901))

(declare-fun m!314903 () Bool)

(assert (=> start!30294 m!314903))

(declare-fun m!314905 () Bool)

(assert (=> b!303387 m!314905))

(declare-fun m!314907 () Bool)

(assert (=> b!303385 m!314907))

(declare-fun m!314909 () Bool)

(assert (=> b!303384 m!314909))

(assert (=> b!303384 m!314909))

(declare-fun m!314911 () Bool)

(assert (=> b!303384 m!314911))

(declare-fun m!314913 () Bool)

(assert (=> b!303386 m!314913))

(check-sat (not b!303384) (not b!303386) (not b!303382) (not b!303379) (not b!303380) (not b!303385) (not start!30294))
(check-sat)
