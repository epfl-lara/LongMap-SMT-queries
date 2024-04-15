; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52172 () Bool)

(assert start!52172)

(declare-fun res!359534 () Bool)

(declare-fun e!327497 () Bool)

(assert (=> start!52172 (=> (not res!359534) (not e!327497))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52172 (= res!359534 (validMask!0 mask!3119))))

(assert (=> start!52172 e!327497))

(assert (=> start!52172 true))

(declare-datatypes ((array!35704 0))(
  ( (array!35705 (arr!17144 (Array (_ BitVec 32) (_ BitVec 64))) (size!17509 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35704)

(declare-fun array_inv!13027 (array!35704) Bool)

(assert (=> start!52172 (array_inv!13027 a!3118)))

(declare-fun b!569372 () Bool)

(declare-fun e!327498 () Bool)

(assert (=> b!569372 (= e!327498 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5590 0))(
  ( (MissingZero!5590 (index!24587 (_ BitVec 32))) (Found!5590 (index!24588 (_ BitVec 32))) (Intermediate!5590 (undefined!6402 Bool) (index!24589 (_ BitVec 32)) (x!53468 (_ BitVec 32))) (Undefined!5590) (MissingVacant!5590 (index!24590 (_ BitVec 32))) )
))
(declare-fun lt!259448 () SeekEntryResult!5590)

(declare-fun lt!259449 () SeekEntryResult!5590)

(get-info :version)

(assert (=> b!569372 (and (= lt!259449 (Found!5590 j!142)) (or (undefined!6402 lt!259448) (not ((_ is Intermediate!5590) lt!259448)) (= (select (arr!17144 a!3118) (index!24589 lt!259448)) (select (arr!17144 a!3118) j!142)) (not (= (select (arr!17144 a!3118) (index!24589 lt!259448)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259449 (MissingZero!5590 (index!24589 lt!259448)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35704 (_ BitVec 32)) SeekEntryResult!5590)

(assert (=> b!569372 (= lt!259449 (seekEntryOrOpen!0 (select (arr!17144 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35704 (_ BitVec 32)) Bool)

(assert (=> b!569372 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17868 0))(
  ( (Unit!17869) )
))
(declare-fun lt!259450 () Unit!17868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17868)

(assert (=> b!569372 (= lt!259450 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569373 () Bool)

(declare-fun res!359539 () Bool)

(assert (=> b!569373 (=> (not res!359539) (not e!327497))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569373 (= res!359539 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569374 () Bool)

(declare-fun res!359540 () Bool)

(assert (=> b!569374 (=> (not res!359540) (not e!327497))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569374 (= res!359540 (and (= (size!17509 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17509 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17509 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569375 () Bool)

(declare-fun res!359535 () Bool)

(assert (=> b!569375 (=> (not res!359535) (not e!327497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569375 (= res!359535 (validKeyInArray!0 (select (arr!17144 a!3118) j!142)))))

(declare-fun b!569376 () Bool)

(declare-fun res!359536 () Bool)

(declare-fun e!327496 () Bool)

(assert (=> b!569376 (=> (not res!359536) (not e!327496))))

(declare-datatypes ((List!11263 0))(
  ( (Nil!11260) (Cons!11259 (h!12280 (_ BitVec 64)) (t!17482 List!11263)) )
))
(declare-fun arrayNoDuplicates!0 (array!35704 (_ BitVec 32) List!11263) Bool)

(assert (=> b!569376 (= res!359536 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11260))))

(declare-fun b!569377 () Bool)

(declare-fun res!359538 () Bool)

(assert (=> b!569377 (=> (not res!359538) (not e!327496))))

(assert (=> b!569377 (= res!359538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569378 () Bool)

(assert (=> b!569378 (= e!327497 e!327496)))

(declare-fun res!359533 () Bool)

(assert (=> b!569378 (=> (not res!359533) (not e!327496))))

(declare-fun lt!259445 () SeekEntryResult!5590)

(assert (=> b!569378 (= res!359533 (or (= lt!259445 (MissingZero!5590 i!1132)) (= lt!259445 (MissingVacant!5590 i!1132))))))

(assert (=> b!569378 (= lt!259445 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569379 () Bool)

(declare-fun res!359537 () Bool)

(assert (=> b!569379 (=> (not res!359537) (not e!327497))))

(assert (=> b!569379 (= res!359537 (validKeyInArray!0 k0!1914))))

(declare-fun b!569380 () Bool)

(assert (=> b!569380 (= e!327496 e!327498)))

(declare-fun res!359532 () Bool)

(assert (=> b!569380 (=> (not res!359532) (not e!327498))))

(declare-fun lt!259446 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35704 (_ BitVec 32)) SeekEntryResult!5590)

(assert (=> b!569380 (= res!359532 (= lt!259448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259446 (select (store (arr!17144 a!3118) i!1132 k0!1914) j!142) (array!35705 (store (arr!17144 a!3118) i!1132 k0!1914) (size!17509 a!3118)) mask!3119)))))

(declare-fun lt!259447 () (_ BitVec 32))

(assert (=> b!569380 (= lt!259448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259447 (select (arr!17144 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569380 (= lt!259446 (toIndex!0 (select (store (arr!17144 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569380 (= lt!259447 (toIndex!0 (select (arr!17144 a!3118) j!142) mask!3119))))

(assert (= (and start!52172 res!359534) b!569374))

(assert (= (and b!569374 res!359540) b!569375))

(assert (= (and b!569375 res!359535) b!569379))

(assert (= (and b!569379 res!359537) b!569373))

(assert (= (and b!569373 res!359539) b!569378))

(assert (= (and b!569378 res!359533) b!569377))

(assert (= (and b!569377 res!359538) b!569376))

(assert (= (and b!569376 res!359536) b!569380))

(assert (= (and b!569380 res!359532) b!569372))

(declare-fun m!547685 () Bool)

(assert (=> b!569375 m!547685))

(assert (=> b!569375 m!547685))

(declare-fun m!547687 () Bool)

(assert (=> b!569375 m!547687))

(declare-fun m!547689 () Bool)

(assert (=> start!52172 m!547689))

(declare-fun m!547691 () Bool)

(assert (=> start!52172 m!547691))

(declare-fun m!547693 () Bool)

(assert (=> b!569373 m!547693))

(assert (=> b!569380 m!547685))

(declare-fun m!547695 () Bool)

(assert (=> b!569380 m!547695))

(assert (=> b!569380 m!547685))

(declare-fun m!547697 () Bool)

(assert (=> b!569380 m!547697))

(assert (=> b!569380 m!547697))

(declare-fun m!547699 () Bool)

(assert (=> b!569380 m!547699))

(declare-fun m!547701 () Bool)

(assert (=> b!569380 m!547701))

(assert (=> b!569380 m!547685))

(declare-fun m!547703 () Bool)

(assert (=> b!569380 m!547703))

(assert (=> b!569380 m!547697))

(declare-fun m!547705 () Bool)

(assert (=> b!569380 m!547705))

(assert (=> b!569372 m!547685))

(declare-fun m!547707 () Bool)

(assert (=> b!569372 m!547707))

(declare-fun m!547709 () Bool)

(assert (=> b!569372 m!547709))

(declare-fun m!547711 () Bool)

(assert (=> b!569372 m!547711))

(assert (=> b!569372 m!547685))

(declare-fun m!547713 () Bool)

(assert (=> b!569372 m!547713))

(declare-fun m!547715 () Bool)

(assert (=> b!569378 m!547715))

(declare-fun m!547717 () Bool)

(assert (=> b!569376 m!547717))

(declare-fun m!547719 () Bool)

(assert (=> b!569379 m!547719))

(declare-fun m!547721 () Bool)

(assert (=> b!569377 m!547721))

(check-sat (not b!569379) (not b!569377) (not b!569373) (not b!569376) (not b!569375) (not b!569380) (not start!52172) (not b!569372) (not b!569378))
(check-sat)
