; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32388 () Bool)

(assert start!32388)

(declare-fun b!322916 () Bool)

(declare-fun e!199739 () Bool)

(declare-fun e!199738 () Bool)

(assert (=> b!322916 (= e!199739 e!199738)))

(declare-fun res!176654 () Bool)

(assert (=> b!322916 (=> (not res!176654) (not e!199738))))

(declare-datatypes ((array!16527 0))(
  ( (array!16528 (arr!7821 (Array (_ BitVec 32) (_ BitVec 64))) (size!8173 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16527)

(declare-datatypes ((SeekEntryResult!2952 0))(
  ( (MissingZero!2952 (index!13984 (_ BitVec 32))) (Found!2952 (index!13985 (_ BitVec 32))) (Intermediate!2952 (undefined!3764 Bool) (index!13986 (_ BitVec 32)) (x!32244 (_ BitVec 32))) (Undefined!2952) (MissingVacant!2952 (index!13987 (_ BitVec 32))) )
))
(declare-fun lt!156539 () SeekEntryResult!2952)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16527 (_ BitVec 32)) SeekEntryResult!2952)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322916 (= res!176654 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156539))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322916 (= lt!156539 (Intermediate!2952 false resIndex!58 resX!58))))

(declare-fun res!176650 () Bool)

(assert (=> start!32388 (=> (not res!176650) (not e!199739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32388 (= res!176650 (validMask!0 mask!3777))))

(assert (=> start!32388 e!199739))

(declare-fun array_inv!5784 (array!16527) Bool)

(assert (=> start!32388 (array_inv!5784 a!3305)))

(assert (=> start!32388 true))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!322917 () Bool)

(assert (=> b!322917 (= e!199738 (not (or (not (= (select (arr!7821 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(assert (=> b!322917 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!9927 0))(
  ( (Unit!9928) )
))
(declare-fun lt!156540 () Unit!9927)

(declare-fun e!199736 () Unit!9927)

(assert (=> b!322917 (= lt!156540 e!199736)))

(declare-fun c!50761 () Bool)

(assert (=> b!322917 (= c!50761 (not (= resIndex!58 index!1840)))))

(declare-fun b!322918 () Bool)

(declare-fun e!199737 () Unit!9927)

(declare-fun Unit!9929 () Unit!9927)

(assert (=> b!322918 (= e!199737 Unit!9929)))

(assert (=> b!322918 false))

(declare-fun b!322919 () Bool)

(declare-fun res!176658 () Bool)

(assert (=> b!322919 (=> (not res!176658) (not e!199738))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322919 (= res!176658 (and (= (select (arr!7821 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8173 a!3305))))))

(declare-fun b!322920 () Bool)

(declare-fun res!176656 () Bool)

(assert (=> b!322920 (=> (not res!176656) (not e!199739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16527 (_ BitVec 32)) Bool)

(assert (=> b!322920 (= res!176656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322921 () Bool)

(declare-fun res!176657 () Bool)

(assert (=> b!322921 (=> (not res!176657) (not e!199738))))

(assert (=> b!322921 (= res!176657 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156539))))

(declare-fun b!322922 () Bool)

(declare-fun res!176651 () Bool)

(assert (=> b!322922 (=> (not res!176651) (not e!199739))))

(assert (=> b!322922 (= res!176651 (and (= (size!8173 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8173 a!3305))))))

(declare-fun b!322923 () Bool)

(assert (=> b!322923 false))

(declare-fun lt!156538 () Unit!9927)

(assert (=> b!322923 (= lt!156538 e!199737)))

(declare-fun c!50762 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322923 (= c!50762 ((_ is Intermediate!2952) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!199741 () Unit!9927)

(declare-fun Unit!9930 () Unit!9927)

(assert (=> b!322923 (= e!199741 Unit!9930)))

(declare-fun b!322924 () Bool)

(declare-fun Unit!9931 () Unit!9927)

(assert (=> b!322924 (= e!199737 Unit!9931)))

(declare-fun b!322925 () Bool)

(declare-fun res!176649 () Bool)

(assert (=> b!322925 (=> (not res!176649) (not e!199738))))

(assert (=> b!322925 (= res!176649 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7821 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322926 () Bool)

(declare-fun res!176655 () Bool)

(assert (=> b!322926 (=> (not res!176655) (not e!199739))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16527 (_ BitVec 32)) SeekEntryResult!2952)

(assert (=> b!322926 (= res!176655 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2952 i!1250)))))

(declare-fun b!322927 () Bool)

(declare-fun Unit!9932 () Unit!9927)

(assert (=> b!322927 (= e!199736 Unit!9932)))

(declare-fun b!322928 () Bool)

(assert (=> b!322928 false))

(declare-fun Unit!9933 () Unit!9927)

(assert (=> b!322928 (= e!199741 Unit!9933)))

(declare-fun b!322929 () Bool)

(declare-fun res!176652 () Bool)

(assert (=> b!322929 (=> (not res!176652) (not e!199739))))

(declare-fun arrayContainsKey!0 (array!16527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322929 (= res!176652 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322930 () Bool)

(declare-fun res!176653 () Bool)

(assert (=> b!322930 (=> (not res!176653) (not e!199739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322930 (= res!176653 (validKeyInArray!0 k0!2497))))

(declare-fun b!322931 () Bool)

(assert (=> b!322931 (= e!199736 e!199741)))

(declare-fun c!50763 () Bool)

(assert (=> b!322931 (= c!50763 (or (= (select (arr!7821 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7821 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!32388 res!176650) b!322922))

(assert (= (and b!322922 res!176651) b!322930))

(assert (= (and b!322930 res!176653) b!322929))

(assert (= (and b!322929 res!176652) b!322926))

(assert (= (and b!322926 res!176655) b!322920))

(assert (= (and b!322920 res!176656) b!322916))

(assert (= (and b!322916 res!176654) b!322919))

(assert (= (and b!322919 res!176658) b!322921))

(assert (= (and b!322921 res!176657) b!322925))

(assert (= (and b!322925 res!176649) b!322917))

(assert (= (and b!322917 c!50761) b!322931))

(assert (= (and b!322917 (not c!50761)) b!322927))

(assert (= (and b!322931 c!50763) b!322928))

(assert (= (and b!322931 (not c!50763)) b!322923))

(assert (= (and b!322923 c!50762) b!322924))

(assert (= (and b!322923 (not c!50762)) b!322918))

(declare-fun m!330535 () Bool)

(assert (=> start!32388 m!330535))

(declare-fun m!330537 () Bool)

(assert (=> start!32388 m!330537))

(declare-fun m!330539 () Bool)

(assert (=> b!322931 m!330539))

(declare-fun m!330541 () Bool)

(assert (=> b!322923 m!330541))

(assert (=> b!322923 m!330541))

(declare-fun m!330543 () Bool)

(assert (=> b!322923 m!330543))

(declare-fun m!330545 () Bool)

(assert (=> b!322920 m!330545))

(declare-fun m!330547 () Bool)

(assert (=> b!322930 m!330547))

(declare-fun m!330549 () Bool)

(assert (=> b!322926 m!330549))

(declare-fun m!330551 () Bool)

(assert (=> b!322919 m!330551))

(declare-fun m!330553 () Bool)

(assert (=> b!322921 m!330553))

(assert (=> b!322925 m!330539))

(declare-fun m!330555 () Bool)

(assert (=> b!322929 m!330555))

(assert (=> b!322917 m!330539))

(declare-fun m!330557 () Bool)

(assert (=> b!322916 m!330557))

(assert (=> b!322916 m!330557))

(declare-fun m!330559 () Bool)

(assert (=> b!322916 m!330559))

(check-sat (not b!322923) (not b!322921) (not b!322926) (not b!322930) (not b!322929) (not start!32388) (not b!322916) (not b!322920))
(check-sat)
