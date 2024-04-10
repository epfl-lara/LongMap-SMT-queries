; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30322 () Bool)

(assert start!30322)

(declare-fun b!303621 () Bool)

(declare-fun res!161109 () Bool)

(declare-fun e!191020 () Bool)

(assert (=> b!303621 (=> (not res!161109) (not e!191020))))

(declare-datatypes ((array!15428 0))(
  ( (array!15429 (arr!7302 (Array (_ BitVec 32) (_ BitVec 64))) (size!7654 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15428)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303621 (= res!161109 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!161111 () Bool)

(assert (=> start!30322 (=> (not res!161111) (not e!191020))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30322 (= res!161111 (validMask!0 mask!3709))))

(assert (=> start!30322 e!191020))

(declare-fun array_inv!5265 (array!15428) Bool)

(assert (=> start!30322 (array_inv!5265 a!3293)))

(assert (=> start!30322 true))

(declare-fun b!303622 () Bool)

(declare-fun e!191019 () Bool)

(assert (=> b!303622 (= e!191020 e!191019)))

(declare-fun res!161107 () Bool)

(assert (=> b!303622 (=> (not res!161107) (not e!191019))))

(declare-datatypes ((SeekEntryResult!2442 0))(
  ( (MissingZero!2442 (index!11944 (_ BitVec 32))) (Found!2442 (index!11945 (_ BitVec 32))) (Intermediate!2442 (undefined!3254 Bool) (index!11946 (_ BitVec 32)) (x!30203 (_ BitVec 32))) (Undefined!2442) (MissingVacant!2442 (index!11947 (_ BitVec 32))) )
))
(declare-fun lt!150228 () SeekEntryResult!2442)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15428 (_ BitVec 32)) SeekEntryResult!2442)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303622 (= res!161107 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150228))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303622 (= lt!150228 (Intermediate!2442 false resIndex!52 resX!52))))

(declare-fun b!303623 () Bool)

(declare-fun res!161110 () Bool)

(assert (=> b!303623 (=> (not res!161110) (not e!191019))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303623 (= res!161110 (and (= (select (arr!7302 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7654 a!3293))))))

(declare-fun b!303624 () Bool)

(declare-fun res!161108 () Bool)

(assert (=> b!303624 (=> (not res!161108) (not e!191020))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15428 (_ BitVec 32)) SeekEntryResult!2442)

(assert (=> b!303624 (= res!161108 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2442 i!1240)))))

(declare-fun b!303625 () Bool)

(assert (=> b!303625 (= e!191019 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7302 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7302 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7302 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!303626 () Bool)

(declare-fun res!161114 () Bool)

(assert (=> b!303626 (=> (not res!161114) (not e!191020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15428 (_ BitVec 32)) Bool)

(assert (=> b!303626 (= res!161114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303627 () Bool)

(declare-fun res!161115 () Bool)

(assert (=> b!303627 (=> (not res!161115) (not e!191020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303627 (= res!161115 (validKeyInArray!0 k0!2441))))

(declare-fun b!303628 () Bool)

(declare-fun res!161112 () Bool)

(assert (=> b!303628 (=> (not res!161112) (not e!191020))))

(assert (=> b!303628 (= res!161112 (and (= (size!7654 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7654 a!3293))))))

(declare-fun b!303629 () Bool)

(declare-fun res!161113 () Bool)

(assert (=> b!303629 (=> (not res!161113) (not e!191019))))

(assert (=> b!303629 (= res!161113 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150228))))

(assert (= (and start!30322 res!161111) b!303628))

(assert (= (and b!303628 res!161112) b!303627))

(assert (= (and b!303627 res!161115) b!303621))

(assert (= (and b!303621 res!161109) b!303624))

(assert (= (and b!303624 res!161108) b!303626))

(assert (= (and b!303626 res!161114) b!303622))

(assert (= (and b!303622 res!161107) b!303623))

(assert (= (and b!303623 res!161110) b!303629))

(assert (= (and b!303629 res!161113) b!303625))

(declare-fun m!314937 () Bool)

(assert (=> b!303623 m!314937))

(declare-fun m!314939 () Bool)

(assert (=> b!303626 m!314939))

(declare-fun m!314941 () Bool)

(assert (=> b!303625 m!314941))

(declare-fun m!314943 () Bool)

(assert (=> b!303622 m!314943))

(assert (=> b!303622 m!314943))

(declare-fun m!314945 () Bool)

(assert (=> b!303622 m!314945))

(declare-fun m!314947 () Bool)

(assert (=> b!303629 m!314947))

(declare-fun m!314949 () Bool)

(assert (=> start!30322 m!314949))

(declare-fun m!314951 () Bool)

(assert (=> start!30322 m!314951))

(declare-fun m!314953 () Bool)

(assert (=> b!303624 m!314953))

(declare-fun m!314955 () Bool)

(assert (=> b!303627 m!314955))

(declare-fun m!314957 () Bool)

(assert (=> b!303621 m!314957))

(check-sat (not b!303624) (not b!303621) (not start!30322) (not b!303622) (not b!303629) (not b!303626) (not b!303627))
(check-sat)
