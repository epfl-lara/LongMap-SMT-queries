; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46718 () Bool)

(assert start!46718)

(declare-fun b!515814 () Bool)

(declare-fun res!315441 () Bool)

(declare-fun e!301106 () Bool)

(assert (=> b!515814 (=> res!315441 e!301106)))

(declare-datatypes ((SeekEntryResult!4306 0))(
  ( (MissingZero!4306 (index!19412 (_ BitVec 32))) (Found!4306 (index!19413 (_ BitVec 32))) (Intermediate!4306 (undefined!5118 Bool) (index!19414 (_ BitVec 32)) (x!48522 (_ BitVec 32))) (Undefined!4306) (MissingVacant!4306 (index!19415 (_ BitVec 32))) )
))
(declare-fun lt!236174 () SeekEntryResult!4306)

(get-info :version)

(assert (=> b!515814 (= res!315441 (or (undefined!5118 lt!236174) (not ((_ is Intermediate!4306) lt!236174))))))

(declare-fun b!515815 () Bool)

(declare-fun res!315440 () Bool)

(declare-fun e!301110 () Bool)

(assert (=> b!515815 (=> (not res!315440) (not e!301110))))

(declare-datatypes ((array!33031 0))(
  ( (array!33032 (arr!15883 (Array (_ BitVec 32) (_ BitVec 64))) (size!16247 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33031)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515815 (= res!315440 (validKeyInArray!0 (select (arr!15883 a!3235) j!176)))))

(declare-fun b!515816 () Bool)

(declare-fun res!315433 () Bool)

(declare-fun e!301109 () Bool)

(assert (=> b!515816 (=> (not res!315433) (not e!301109))))

(declare-datatypes ((List!9948 0))(
  ( (Nil!9945) (Cons!9944 (h!10842 (_ BitVec 64)) (t!16168 List!9948)) )
))
(declare-fun arrayNoDuplicates!0 (array!33031 (_ BitVec 32) List!9948) Bool)

(assert (=> b!515816 (= res!315433 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9945))))

(declare-fun b!515817 () Bool)

(assert (=> b!515817 (= e!301106 true)))

(assert (=> b!515817 (and (bvslt (x!48522 lt!236174) #b01111111111111111111111111111110) (or (= (select (arr!15883 a!3235) (index!19414 lt!236174)) (select (arr!15883 a!3235) j!176)) (= (select (arr!15883 a!3235) (index!19414 lt!236174)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15883 a!3235) (index!19414 lt!236174)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515818 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!301108 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33031 (_ BitVec 32)) SeekEntryResult!4306)

(assert (=> b!515818 (= e!301108 (= (seekEntryOrOpen!0 (select (arr!15883 a!3235) j!176) a!3235 mask!3524) (Found!4306 j!176)))))

(declare-fun res!315432 () Bool)

(assert (=> start!46718 (=> (not res!315432) (not e!301110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46718 (= res!315432 (validMask!0 mask!3524))))

(assert (=> start!46718 e!301110))

(assert (=> start!46718 true))

(declare-fun array_inv!11742 (array!33031) Bool)

(assert (=> start!46718 (array_inv!11742 a!3235)))

(declare-fun b!515819 () Bool)

(assert (=> b!515819 (= e!301109 (not e!301106))))

(declare-fun res!315438 () Bool)

(assert (=> b!515819 (=> res!315438 e!301106)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236172 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33031 (_ BitVec 32)) SeekEntryResult!4306)

(assert (=> b!515819 (= res!315438 (= lt!236174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236172 (select (store (arr!15883 a!3235) i!1204 k0!2280) j!176) (array!33032 (store (arr!15883 a!3235) i!1204 k0!2280) (size!16247 a!3235)) mask!3524)))))

(declare-fun lt!236175 () (_ BitVec 32))

(assert (=> b!515819 (= lt!236174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236175 (select (arr!15883 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515819 (= lt!236172 (toIndex!0 (select (store (arr!15883 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515819 (= lt!236175 (toIndex!0 (select (arr!15883 a!3235) j!176) mask!3524))))

(assert (=> b!515819 e!301108))

(declare-fun res!315439 () Bool)

(assert (=> b!515819 (=> (not res!315439) (not e!301108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33031 (_ BitVec 32)) Bool)

(assert (=> b!515819 (= res!315439 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15931 0))(
  ( (Unit!15932) )
))
(declare-fun lt!236176 () Unit!15931)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15931)

(assert (=> b!515819 (= lt!236176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515820 () Bool)

(declare-fun res!315436 () Bool)

(assert (=> b!515820 (=> (not res!315436) (not e!301110))))

(declare-fun arrayContainsKey!0 (array!33031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515820 (= res!315436 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515821 () Bool)

(declare-fun res!315434 () Bool)

(assert (=> b!515821 (=> (not res!315434) (not e!301110))))

(assert (=> b!515821 (= res!315434 (and (= (size!16247 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16247 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16247 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515822 () Bool)

(declare-fun res!315442 () Bool)

(assert (=> b!515822 (=> (not res!315442) (not e!301110))))

(assert (=> b!515822 (= res!315442 (validKeyInArray!0 k0!2280))))

(declare-fun b!515823 () Bool)

(declare-fun res!315435 () Bool)

(assert (=> b!515823 (=> (not res!315435) (not e!301109))))

(assert (=> b!515823 (= res!315435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515824 () Bool)

(assert (=> b!515824 (= e!301110 e!301109)))

(declare-fun res!315437 () Bool)

(assert (=> b!515824 (=> (not res!315437) (not e!301109))))

(declare-fun lt!236173 () SeekEntryResult!4306)

(assert (=> b!515824 (= res!315437 (or (= lt!236173 (MissingZero!4306 i!1204)) (= lt!236173 (MissingVacant!4306 i!1204))))))

(assert (=> b!515824 (= lt!236173 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46718 res!315432) b!515821))

(assert (= (and b!515821 res!315434) b!515815))

(assert (= (and b!515815 res!315440) b!515822))

(assert (= (and b!515822 res!315442) b!515820))

(assert (= (and b!515820 res!315436) b!515824))

(assert (= (and b!515824 res!315437) b!515823))

(assert (= (and b!515823 res!315435) b!515816))

(assert (= (and b!515816 res!315433) b!515819))

(assert (= (and b!515819 res!315439) b!515818))

(assert (= (and b!515819 (not res!315438)) b!515814))

(assert (= (and b!515814 (not res!315441)) b!515817))

(declare-fun m!497461 () Bool)

(assert (=> b!515818 m!497461))

(assert (=> b!515818 m!497461))

(declare-fun m!497463 () Bool)

(assert (=> b!515818 m!497463))

(declare-fun m!497465 () Bool)

(assert (=> b!515820 m!497465))

(declare-fun m!497467 () Bool)

(assert (=> b!515819 m!497467))

(declare-fun m!497469 () Bool)

(assert (=> b!515819 m!497469))

(declare-fun m!497471 () Bool)

(assert (=> b!515819 m!497471))

(assert (=> b!515819 m!497461))

(declare-fun m!497473 () Bool)

(assert (=> b!515819 m!497473))

(assert (=> b!515819 m!497471))

(declare-fun m!497475 () Bool)

(assert (=> b!515819 m!497475))

(assert (=> b!515819 m!497461))

(declare-fun m!497477 () Bool)

(assert (=> b!515819 m!497477))

(assert (=> b!515819 m!497471))

(declare-fun m!497479 () Bool)

(assert (=> b!515819 m!497479))

(assert (=> b!515819 m!497461))

(declare-fun m!497481 () Bool)

(assert (=> b!515819 m!497481))

(declare-fun m!497483 () Bool)

(assert (=> b!515816 m!497483))

(declare-fun m!497485 () Bool)

(assert (=> b!515822 m!497485))

(declare-fun m!497487 () Bool)

(assert (=> b!515823 m!497487))

(declare-fun m!497489 () Bool)

(assert (=> start!46718 m!497489))

(declare-fun m!497491 () Bool)

(assert (=> start!46718 m!497491))

(assert (=> b!515815 m!497461))

(assert (=> b!515815 m!497461))

(declare-fun m!497493 () Bool)

(assert (=> b!515815 m!497493))

(declare-fun m!497495 () Bool)

(assert (=> b!515824 m!497495))

(declare-fun m!497497 () Bool)

(assert (=> b!515817 m!497497))

(assert (=> b!515817 m!497461))

(check-sat (not b!515822) (not b!515823) (not b!515815) (not start!46718) (not b!515816) (not b!515820) (not b!515824) (not b!515818) (not b!515819))
(check-sat)
