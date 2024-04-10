; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31072 () Bool)

(assert start!31072)

(declare-fun b!312618 () Bool)

(declare-fun res!169080 () Bool)

(declare-fun e!194911 () Bool)

(assert (=> b!312618 (=> (not res!169080) (not e!194911))))

(declare-datatypes ((array!15974 0))(
  ( (array!15975 (arr!7569 (Array (_ BitVec 32) (_ BitVec 64))) (size!7921 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15974)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2709 0))(
  ( (MissingZero!2709 (index!13012 (_ BitVec 32))) (Found!2709 (index!13013 (_ BitVec 32))) (Intermediate!2709 (undefined!3521 Bool) (index!13014 (_ BitVec 32)) (x!31218 (_ BitVec 32))) (Undefined!2709) (MissingVacant!2709 (index!13015 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15974 (_ BitVec 32)) SeekEntryResult!2709)

(assert (=> b!312618 (= res!169080 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2709 i!1240)))))

(declare-fun b!312619 () Bool)

(declare-fun e!194910 () Bool)

(declare-fun e!194909 () Bool)

(assert (=> b!312619 (= e!194910 e!194909)))

(declare-fun res!169078 () Bool)

(assert (=> b!312619 (=> (not res!169078) (not e!194909))))

(declare-fun lt!153171 () SeekEntryResult!2709)

(declare-fun lt!153172 () SeekEntryResult!2709)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!312619 (= res!169078 (and (= lt!153171 lt!153172) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7569 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15974 (_ BitVec 32)) SeekEntryResult!2709)

(assert (=> b!312619 (= lt!153171 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312620 () Bool)

(declare-fun res!169077 () Bool)

(assert (=> b!312620 (=> (not res!169077) (not e!194911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15974 (_ BitVec 32)) Bool)

(assert (=> b!312620 (= res!169077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312621 () Bool)

(declare-fun res!169074 () Bool)

(assert (=> b!312621 (=> (not res!169074) (not e!194911))))

(declare-fun arrayContainsKey!0 (array!15974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312621 (= res!169074 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312622 () Bool)

(declare-fun res!169079 () Bool)

(assert (=> b!312622 (=> (not res!169079) (not e!194911))))

(assert (=> b!312622 (= res!169079 (and (= (size!7921 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7921 a!3293))))))

(declare-fun b!312623 () Bool)

(declare-fun res!169072 () Bool)

(assert (=> b!312623 (=> (not res!169072) (not e!194911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312623 (= res!169072 (validKeyInArray!0 k0!2441))))

(declare-fun b!312624 () Bool)

(declare-fun res!169075 () Bool)

(assert (=> b!312624 (=> (not res!169075) (not e!194910))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312624 (= res!169075 (and (= (select (arr!7569 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7921 a!3293))))))

(declare-fun res!169076 () Bool)

(assert (=> start!31072 (=> (not res!169076) (not e!194911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31072 (= res!169076 (validMask!0 mask!3709))))

(assert (=> start!31072 e!194911))

(declare-fun array_inv!5532 (array!15974) Bool)

(assert (=> start!31072 (array_inv!5532 a!3293)))

(assert (=> start!31072 true))

(declare-fun b!312617 () Bool)

(assert (=> b!312617 (= e!194911 e!194910)))

(declare-fun res!169073 () Bool)

(assert (=> b!312617 (=> (not res!169073) (not e!194910))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312617 (= res!169073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153172))))

(assert (=> b!312617 (= lt!153172 (Intermediate!2709 false resIndex!52 resX!52))))

(declare-fun b!312625 () Bool)

(declare-fun e!194908 () Bool)

(assert (=> b!312625 (= e!194909 (not e!194908))))

(declare-fun res!169071 () Bool)

(assert (=> b!312625 (=> res!169071 e!194908)))

(declare-fun lt!153177 () SeekEntryResult!2709)

(declare-fun lt!153176 () (_ BitVec 32))

(assert (=> b!312625 (= res!169071 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153176 #b00000000000000000000000000000000) (bvsge lt!153176 (size!7921 a!3293)) (not (= lt!153177 lt!153172))))))

(declare-fun lt!153170 () SeekEntryResult!2709)

(declare-fun lt!153174 () SeekEntryResult!2709)

(assert (=> b!312625 (= lt!153170 lt!153174)))

(declare-fun lt!153173 () array!15974)

(assert (=> b!312625 (= lt!153174 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153176 k0!2441 lt!153173 mask!3709))))

(assert (=> b!312625 (= lt!153170 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153173 mask!3709))))

(assert (=> b!312625 (= lt!153173 (array!15975 (store (arr!7569 a!3293) i!1240 k0!2441) (size!7921 a!3293)))))

(assert (=> b!312625 (= lt!153171 lt!153177)))

(assert (=> b!312625 (= lt!153177 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153176 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312625 (= lt!153176 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312626 () Bool)

(assert (=> b!312626 (= e!194908 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(assert (=> b!312626 (= lt!153174 lt!153177)))

(declare-datatypes ((Unit!9649 0))(
  ( (Unit!9650) )
))
(declare-fun lt!153175 () Unit!9649)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15974 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9649)

(assert (=> b!312626 (= lt!153175 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153176 resIndex!52 resX!52 mask!3709))))

(assert (= (and start!31072 res!169076) b!312622))

(assert (= (and b!312622 res!169079) b!312623))

(assert (= (and b!312623 res!169072) b!312621))

(assert (= (and b!312621 res!169074) b!312618))

(assert (= (and b!312618 res!169080) b!312620))

(assert (= (and b!312620 res!169077) b!312617))

(assert (= (and b!312617 res!169073) b!312624))

(assert (= (and b!312624 res!169075) b!312619))

(assert (= (and b!312619 res!169078) b!312625))

(assert (= (and b!312625 (not res!169071)) b!312626))

(declare-fun m!322725 () Bool)

(assert (=> b!312621 m!322725))

(declare-fun m!322727 () Bool)

(assert (=> b!312620 m!322727))

(declare-fun m!322729 () Bool)

(assert (=> b!312625 m!322729))

(declare-fun m!322731 () Bool)

(assert (=> b!312625 m!322731))

(declare-fun m!322733 () Bool)

(assert (=> b!312625 m!322733))

(declare-fun m!322735 () Bool)

(assert (=> b!312625 m!322735))

(declare-fun m!322737 () Bool)

(assert (=> b!312625 m!322737))

(declare-fun m!322739 () Bool)

(assert (=> b!312623 m!322739))

(declare-fun m!322741 () Bool)

(assert (=> b!312619 m!322741))

(declare-fun m!322743 () Bool)

(assert (=> b!312619 m!322743))

(declare-fun m!322745 () Bool)

(assert (=> b!312624 m!322745))

(declare-fun m!322747 () Bool)

(assert (=> b!312618 m!322747))

(declare-fun m!322749 () Bool)

(assert (=> start!31072 m!322749))

(declare-fun m!322751 () Bool)

(assert (=> start!31072 m!322751))

(declare-fun m!322753 () Bool)

(assert (=> b!312626 m!322753))

(declare-fun m!322755 () Bool)

(assert (=> b!312617 m!322755))

(assert (=> b!312617 m!322755))

(declare-fun m!322757 () Bool)

(assert (=> b!312617 m!322757))

(check-sat (not b!312619) (not b!312621) (not b!312623) (not b!312618) (not start!31072) (not b!312626) (not b!312620) (not b!312625) (not b!312617))
(check-sat)
