; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32376 () Bool)

(assert start!32376)

(declare-fun b!322628 () Bool)

(declare-datatypes ((Unit!9885 0))(
  ( (Unit!9886) )
))
(declare-fun e!199631 () Unit!9885)

(declare-fun e!199633 () Unit!9885)

(assert (=> b!322628 (= e!199631 e!199633)))

(declare-fun c!50708 () Bool)

(declare-datatypes ((array!16515 0))(
  ( (array!16516 (arr!7815 (Array (_ BitVec 32) (_ BitVec 64))) (size!8167 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16515)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!322628 (= c!50708 (or (= (select (arr!7815 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7815 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322629 () Bool)

(declare-fun e!199630 () Bool)

(declare-fun e!199628 () Bool)

(assert (=> b!322629 (= e!199630 e!199628)))

(declare-fun res!176473 () Bool)

(assert (=> b!322629 (=> (not res!176473) (not e!199628))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2946 0))(
  ( (MissingZero!2946 (index!13960 (_ BitVec 32))) (Found!2946 (index!13961 (_ BitVec 32))) (Intermediate!2946 (undefined!3758 Bool) (index!13962 (_ BitVec 32)) (x!32222 (_ BitVec 32))) (Undefined!2946) (MissingVacant!2946 (index!13963 (_ BitVec 32))) )
))
(declare-fun lt!156484 () SeekEntryResult!2946)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16515 (_ BitVec 32)) SeekEntryResult!2946)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322629 (= res!176473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156484))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322629 (= lt!156484 (Intermediate!2946 false resIndex!58 resX!58))))

(declare-fun b!322630 () Bool)

(declare-fun Unit!9887 () Unit!9885)

(assert (=> b!322630 (= e!199631 Unit!9887)))

(declare-fun b!322631 () Bool)

(declare-fun e!199629 () Unit!9885)

(declare-fun Unit!9888 () Unit!9885)

(assert (=> b!322631 (= e!199629 Unit!9888)))

(declare-fun b!322632 () Bool)

(assert (=> b!322632 (= e!199628 (not true))))

(assert (=> b!322632 (= index!1840 resIndex!58)))

(declare-fun lt!156486 () Unit!9885)

(assert (=> b!322632 (= lt!156486 e!199631)))

(declare-fun c!50707 () Bool)

(assert (=> b!322632 (= c!50707 (not (= resIndex!58 index!1840)))))

(declare-fun b!322633 () Bool)

(declare-fun res!176471 () Bool)

(assert (=> b!322633 (=> (not res!176471) (not e!199630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322633 (= res!176471 (validKeyInArray!0 k0!2497))))

(declare-fun b!322634 () Bool)

(declare-fun res!176474 () Bool)

(assert (=> b!322634 (=> (not res!176474) (not e!199628))))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322634 (= res!176474 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7815 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322635 () Bool)

(declare-fun Unit!9889 () Unit!9885)

(assert (=> b!322635 (= e!199629 Unit!9889)))

(assert (=> b!322635 false))

(declare-fun b!322636 () Bool)

(declare-fun res!176476 () Bool)

(assert (=> b!322636 (=> (not res!176476) (not e!199628))))

(assert (=> b!322636 (= res!176476 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156484))))

(declare-fun res!176472 () Bool)

(assert (=> start!32376 (=> (not res!176472) (not e!199630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32376 (= res!176472 (validMask!0 mask!3777))))

(assert (=> start!32376 e!199630))

(declare-fun array_inv!5778 (array!16515) Bool)

(assert (=> start!32376 (array_inv!5778 a!3305)))

(assert (=> start!32376 true))

(declare-fun b!322637 () Bool)

(declare-fun res!176469 () Bool)

(assert (=> b!322637 (=> (not res!176469) (not e!199630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16515 (_ BitVec 32)) Bool)

(assert (=> b!322637 (= res!176469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322638 () Bool)

(declare-fun res!176477 () Bool)

(assert (=> b!322638 (=> (not res!176477) (not e!199630))))

(declare-fun arrayContainsKey!0 (array!16515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322638 (= res!176477 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322639 () Bool)

(declare-fun res!176478 () Bool)

(assert (=> b!322639 (=> (not res!176478) (not e!199628))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322639 (= res!176478 (and (= (select (arr!7815 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8167 a!3305))))))

(declare-fun b!322640 () Bool)

(assert (=> b!322640 false))

(declare-fun lt!156485 () Unit!9885)

(assert (=> b!322640 (= lt!156485 e!199629)))

(declare-fun c!50709 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322640 (= c!50709 ((_ is Intermediate!2946) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9890 () Unit!9885)

(assert (=> b!322640 (= e!199633 Unit!9890)))

(declare-fun b!322641 () Bool)

(declare-fun res!176470 () Bool)

(assert (=> b!322641 (=> (not res!176470) (not e!199630))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16515 (_ BitVec 32)) SeekEntryResult!2946)

(assert (=> b!322641 (= res!176470 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2946 i!1250)))))

(declare-fun b!322642 () Bool)

(assert (=> b!322642 false))

(declare-fun Unit!9891 () Unit!9885)

(assert (=> b!322642 (= e!199633 Unit!9891)))

(declare-fun b!322643 () Bool)

(declare-fun res!176475 () Bool)

(assert (=> b!322643 (=> (not res!176475) (not e!199630))))

(assert (=> b!322643 (= res!176475 (and (= (size!8167 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8167 a!3305))))))

(assert (= (and start!32376 res!176472) b!322643))

(assert (= (and b!322643 res!176475) b!322633))

(assert (= (and b!322633 res!176471) b!322638))

(assert (= (and b!322638 res!176477) b!322641))

(assert (= (and b!322641 res!176470) b!322637))

(assert (= (and b!322637 res!176469) b!322629))

(assert (= (and b!322629 res!176473) b!322639))

(assert (= (and b!322639 res!176478) b!322636))

(assert (= (and b!322636 res!176476) b!322634))

(assert (= (and b!322634 res!176474) b!322632))

(assert (= (and b!322632 c!50707) b!322628))

(assert (= (and b!322632 (not c!50707)) b!322630))

(assert (= (and b!322628 c!50708) b!322642))

(assert (= (and b!322628 (not c!50708)) b!322640))

(assert (= (and b!322640 c!50709) b!322631))

(assert (= (and b!322640 (not c!50709)) b!322635))

(declare-fun m!330379 () Bool)

(assert (=> b!322637 m!330379))

(declare-fun m!330381 () Bool)

(assert (=> b!322638 m!330381))

(declare-fun m!330383 () Bool)

(assert (=> b!322641 m!330383))

(declare-fun m!330385 () Bool)

(assert (=> b!322628 m!330385))

(declare-fun m!330387 () Bool)

(assert (=> b!322633 m!330387))

(declare-fun m!330389 () Bool)

(assert (=> b!322636 m!330389))

(declare-fun m!330391 () Bool)

(assert (=> b!322639 m!330391))

(declare-fun m!330393 () Bool)

(assert (=> start!32376 m!330393))

(declare-fun m!330395 () Bool)

(assert (=> start!32376 m!330395))

(declare-fun m!330397 () Bool)

(assert (=> b!322640 m!330397))

(assert (=> b!322640 m!330397))

(declare-fun m!330399 () Bool)

(assert (=> b!322640 m!330399))

(declare-fun m!330401 () Bool)

(assert (=> b!322629 m!330401))

(assert (=> b!322629 m!330401))

(declare-fun m!330403 () Bool)

(assert (=> b!322629 m!330403))

(assert (=> b!322634 m!330385))

(check-sat (not b!322637) (not start!32376) (not b!322640) (not b!322629) (not b!322638) (not b!322633) (not b!322636) (not b!322641))
(check-sat)
