; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32382 () Bool)

(assert start!32382)

(declare-fun b!322772 () Bool)

(declare-fun res!176563 () Bool)

(declare-fun e!199687 () Bool)

(assert (=> b!322772 (=> (not res!176563) (not e!199687))))

(declare-datatypes ((array!16521 0))(
  ( (array!16522 (arr!7818 (Array (_ BitVec 32) (_ BitVec 64))) (size!8170 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16521)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16521 (_ BitVec 32)) Bool)

(assert (=> b!322772 (= res!176563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322773 () Bool)

(declare-fun res!176562 () Bool)

(assert (=> b!322773 (=> (not res!176562) (not e!199687))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322773 (= res!176562 (validKeyInArray!0 k0!2497))))

(declare-fun b!322774 () Bool)

(declare-datatypes ((Unit!9906 0))(
  ( (Unit!9907) )
))
(declare-fun e!199684 () Unit!9906)

(declare-fun e!199686 () Unit!9906)

(assert (=> b!322774 (= e!199684 e!199686)))

(declare-fun c!50736 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!322774 (= c!50736 (or (= (select (arr!7818 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7818 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322775 () Bool)

(declare-fun res!176568 () Bool)

(declare-fun e!199685 () Bool)

(assert (=> b!322775 (=> (not res!176568) (not e!199685))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322775 (= res!176568 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7818 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322776 () Bool)

(assert (=> b!322776 (= e!199687 e!199685)))

(declare-fun res!176566 () Bool)

(assert (=> b!322776 (=> (not res!176566) (not e!199685))))

(declare-datatypes ((SeekEntryResult!2949 0))(
  ( (MissingZero!2949 (index!13972 (_ BitVec 32))) (Found!2949 (index!13973 (_ BitVec 32))) (Intermediate!2949 (undefined!3761 Bool) (index!13974 (_ BitVec 32)) (x!32233 (_ BitVec 32))) (Undefined!2949) (MissingVacant!2949 (index!13975 (_ BitVec 32))) )
))
(declare-fun lt!156511 () SeekEntryResult!2949)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16521 (_ BitVec 32)) SeekEntryResult!2949)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322776 (= res!176566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156511))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322776 (= lt!156511 (Intermediate!2949 false resIndex!58 resX!58))))

(declare-fun b!322778 () Bool)

(declare-fun e!199682 () Unit!9906)

(declare-fun Unit!9908 () Unit!9906)

(assert (=> b!322778 (= e!199682 Unit!9908)))

(declare-fun b!322779 () Bool)

(declare-fun Unit!9909 () Unit!9906)

(assert (=> b!322779 (= e!199684 Unit!9909)))

(declare-fun b!322780 () Bool)

(declare-fun res!176560 () Bool)

(assert (=> b!322780 (=> (not res!176560) (not e!199687))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322780 (= res!176560 (and (= (size!8170 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8170 a!3305))))))

(declare-fun b!322781 () Bool)

(declare-fun res!176565 () Bool)

(assert (=> b!322781 (=> (not res!176565) (not e!199687))))

(declare-fun arrayContainsKey!0 (array!16521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322781 (= res!176565 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322782 () Bool)

(assert (=> b!322782 false))

(declare-fun Unit!9910 () Unit!9906)

(assert (=> b!322782 (= e!199686 Unit!9910)))

(declare-fun b!322783 () Bool)

(declare-fun res!176567 () Bool)

(assert (=> b!322783 (=> (not res!176567) (not e!199685))))

(assert (=> b!322783 (= res!176567 (and (= (select (arr!7818 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8170 a!3305))))))

(declare-fun b!322784 () Bool)

(declare-fun Unit!9911 () Unit!9906)

(assert (=> b!322784 (= e!199682 Unit!9911)))

(assert (=> b!322784 false))

(declare-fun b!322785 () Bool)

(assert (=> b!322785 (= e!199685 (not (or (not (= (select (arr!7818 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(assert (=> b!322785 (= index!1840 resIndex!58)))

(declare-fun lt!156512 () Unit!9906)

(assert (=> b!322785 (= lt!156512 e!199684)))

(declare-fun c!50734 () Bool)

(assert (=> b!322785 (= c!50734 (not (= resIndex!58 index!1840)))))

(declare-fun res!176559 () Bool)

(assert (=> start!32382 (=> (not res!176559) (not e!199687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32382 (= res!176559 (validMask!0 mask!3777))))

(assert (=> start!32382 e!199687))

(declare-fun array_inv!5781 (array!16521) Bool)

(assert (=> start!32382 (array_inv!5781 a!3305)))

(assert (=> start!32382 true))

(declare-fun b!322777 () Bool)

(declare-fun res!176561 () Bool)

(assert (=> b!322777 (=> (not res!176561) (not e!199685))))

(assert (=> b!322777 (= res!176561 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156511))))

(declare-fun b!322786 () Bool)

(declare-fun res!176564 () Bool)

(assert (=> b!322786 (=> (not res!176564) (not e!199687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16521 (_ BitVec 32)) SeekEntryResult!2949)

(assert (=> b!322786 (= res!176564 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2949 i!1250)))))

(declare-fun b!322787 () Bool)

(assert (=> b!322787 false))

(declare-fun lt!156513 () Unit!9906)

(assert (=> b!322787 (= lt!156513 e!199682)))

(declare-fun c!50735 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322787 (= c!50735 ((_ is Intermediate!2949) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9912 () Unit!9906)

(assert (=> b!322787 (= e!199686 Unit!9912)))

(assert (= (and start!32382 res!176559) b!322780))

(assert (= (and b!322780 res!176560) b!322773))

(assert (= (and b!322773 res!176562) b!322781))

(assert (= (and b!322781 res!176565) b!322786))

(assert (= (and b!322786 res!176564) b!322772))

(assert (= (and b!322772 res!176563) b!322776))

(assert (= (and b!322776 res!176566) b!322783))

(assert (= (and b!322783 res!176567) b!322777))

(assert (= (and b!322777 res!176561) b!322775))

(assert (= (and b!322775 res!176568) b!322785))

(assert (= (and b!322785 c!50734) b!322774))

(assert (= (and b!322785 (not c!50734)) b!322779))

(assert (= (and b!322774 c!50736) b!322782))

(assert (= (and b!322774 (not c!50736)) b!322787))

(assert (= (and b!322787 c!50735) b!322778))

(assert (= (and b!322787 (not c!50735)) b!322784))

(declare-fun m!330457 () Bool)

(assert (=> b!322776 m!330457))

(assert (=> b!322776 m!330457))

(declare-fun m!330459 () Bool)

(assert (=> b!322776 m!330459))

(declare-fun m!330461 () Bool)

(assert (=> b!322772 m!330461))

(declare-fun m!330463 () Bool)

(assert (=> b!322785 m!330463))

(declare-fun m!330465 () Bool)

(assert (=> b!322783 m!330465))

(declare-fun m!330467 () Bool)

(assert (=> b!322781 m!330467))

(assert (=> b!322774 m!330463))

(declare-fun m!330469 () Bool)

(assert (=> start!32382 m!330469))

(declare-fun m!330471 () Bool)

(assert (=> start!32382 m!330471))

(declare-fun m!330473 () Bool)

(assert (=> b!322777 m!330473))

(declare-fun m!330475 () Bool)

(assert (=> b!322786 m!330475))

(declare-fun m!330477 () Bool)

(assert (=> b!322773 m!330477))

(assert (=> b!322775 m!330463))

(declare-fun m!330479 () Bool)

(assert (=> b!322787 m!330479))

(assert (=> b!322787 m!330479))

(declare-fun m!330481 () Bool)

(assert (=> b!322787 m!330481))

(check-sat (not start!32382) (not b!322773) (not b!322787) (not b!322781) (not b!322776) (not b!322772) (not b!322786) (not b!322777))
(check-sat)
