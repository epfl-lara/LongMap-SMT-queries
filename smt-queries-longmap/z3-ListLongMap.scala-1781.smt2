; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32372 () Bool)

(assert start!32372)

(declare-fun b!322593 () Bool)

(declare-fun res!176495 () Bool)

(declare-fun e!199546 () Bool)

(assert (=> b!322593 (=> (not res!176495) (not e!199546))))

(declare-datatypes ((array!16515 0))(
  ( (array!16516 (arr!7815 (Array (_ BitVec 32) (_ BitVec 64))) (size!8168 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16515)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2945 0))(
  ( (MissingZero!2945 (index!13956 (_ BitVec 32))) (Found!2945 (index!13957 (_ BitVec 32))) (Intermediate!2945 (undefined!3757 Bool) (index!13958 (_ BitVec 32)) (x!32232 (_ BitVec 32))) (Undefined!2945) (MissingVacant!2945 (index!13959 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16515 (_ BitVec 32)) SeekEntryResult!2945)

(assert (=> b!322593 (= res!176495 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2945 i!1250)))))

(declare-fun b!322594 () Bool)

(declare-fun res!176496 () Bool)

(declare-fun e!199545 () Bool)

(assert (=> b!322594 (=> (not res!176496) (not e!199545))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322594 (= res!176496 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7815 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322595 () Bool)

(assert (=> b!322595 false))

(declare-datatypes ((Unit!9884 0))(
  ( (Unit!9885) )
))
(declare-fun lt!156294 () Unit!9884)

(declare-fun e!199544 () Unit!9884)

(assert (=> b!322595 (= lt!156294 e!199544)))

(declare-fun c!50679 () Bool)

(get-info :version)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16515 (_ BitVec 32)) SeekEntryResult!2945)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322595 (= c!50679 ((_ is Intermediate!2945) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!199547 () Unit!9884)

(declare-fun Unit!9886 () Unit!9884)

(assert (=> b!322595 (= e!199547 Unit!9886)))

(declare-fun b!322596 () Bool)

(declare-fun e!199542 () Unit!9884)

(declare-fun Unit!9887 () Unit!9884)

(assert (=> b!322596 (= e!199542 Unit!9887)))

(declare-fun b!322597 () Bool)

(declare-fun res!176492 () Bool)

(assert (=> b!322597 (=> (not res!176492) (not e!199546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16515 (_ BitVec 32)) Bool)

(assert (=> b!322597 (= res!176492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!176491 () Bool)

(assert (=> start!32372 (=> (not res!176491) (not e!199546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32372 (= res!176491 (validMask!0 mask!3777))))

(assert (=> start!32372 e!199546))

(declare-fun array_inv!5787 (array!16515) Bool)

(assert (=> start!32372 (array_inv!5787 a!3305)))

(assert (=> start!32372 true))

(declare-fun b!322598 () Bool)

(assert (=> b!322598 (= e!199546 e!199545)))

(declare-fun res!176490 () Bool)

(assert (=> b!322598 (=> (not res!176490) (not e!199545))))

(declare-fun lt!156295 () SeekEntryResult!2945)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322598 (= res!176490 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156295))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322598 (= lt!156295 (Intermediate!2945 false resIndex!58 resX!58))))

(declare-fun b!322599 () Bool)

(declare-fun res!176494 () Bool)

(assert (=> b!322599 (=> (not res!176494) (not e!199546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322599 (= res!176494 (validKeyInArray!0 k0!2497))))

(declare-fun b!322600 () Bool)

(declare-fun Unit!9888 () Unit!9884)

(assert (=> b!322600 (= e!199544 Unit!9888)))

(declare-fun b!322601 () Bool)

(declare-fun res!176498 () Bool)

(assert (=> b!322601 (=> (not res!176498) (not e!199545))))

(assert (=> b!322601 (= res!176498 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156295))))

(declare-fun b!322602 () Bool)

(declare-fun res!176497 () Bool)

(assert (=> b!322602 (=> (not res!176497) (not e!199546))))

(declare-fun arrayContainsKey!0 (array!16515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322602 (= res!176497 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322603 () Bool)

(assert (=> b!322603 false))

(declare-fun Unit!9889 () Unit!9884)

(assert (=> b!322603 (= e!199547 Unit!9889)))

(declare-fun b!322604 () Bool)

(assert (=> b!322604 (= e!199545 (not (or (not (= (select (arr!7815 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(assert (=> b!322604 (= index!1840 resIndex!58)))

(declare-fun lt!156296 () Unit!9884)

(assert (=> b!322604 (= lt!156296 e!199542)))

(declare-fun c!50680 () Bool)

(assert (=> b!322604 (= c!50680 (not (= resIndex!58 index!1840)))))

(declare-fun b!322605 () Bool)

(assert (=> b!322605 (= e!199542 e!199547)))

(declare-fun c!50681 () Bool)

(assert (=> b!322605 (= c!50681 (or (= (select (arr!7815 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7815 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322606 () Bool)

(declare-fun Unit!9890 () Unit!9884)

(assert (=> b!322606 (= e!199544 Unit!9890)))

(assert (=> b!322606 false))

(declare-fun b!322607 () Bool)

(declare-fun res!176493 () Bool)

(assert (=> b!322607 (=> (not res!176493) (not e!199545))))

(assert (=> b!322607 (= res!176493 (and (= (select (arr!7815 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8168 a!3305))))))

(declare-fun b!322608 () Bool)

(declare-fun res!176499 () Bool)

(assert (=> b!322608 (=> (not res!176499) (not e!199546))))

(assert (=> b!322608 (= res!176499 (and (= (size!8168 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8168 a!3305))))))

(assert (= (and start!32372 res!176491) b!322608))

(assert (= (and b!322608 res!176499) b!322599))

(assert (= (and b!322599 res!176494) b!322602))

(assert (= (and b!322602 res!176497) b!322593))

(assert (= (and b!322593 res!176495) b!322597))

(assert (= (and b!322597 res!176492) b!322598))

(assert (= (and b!322598 res!176490) b!322607))

(assert (= (and b!322607 res!176493) b!322601))

(assert (= (and b!322601 res!176498) b!322594))

(assert (= (and b!322594 res!176496) b!322604))

(assert (= (and b!322604 c!50680) b!322605))

(assert (= (and b!322604 (not c!50680)) b!322596))

(assert (= (and b!322605 c!50681) b!322603))

(assert (= (and b!322605 (not c!50681)) b!322595))

(assert (= (and b!322595 c!50679) b!322600))

(assert (= (and b!322595 (not c!50679)) b!322606))

(declare-fun m!329779 () Bool)

(assert (=> b!322602 m!329779))

(declare-fun m!329781 () Bool)

(assert (=> b!322607 m!329781))

(declare-fun m!329783 () Bool)

(assert (=> b!322605 m!329783))

(declare-fun m!329785 () Bool)

(assert (=> b!322599 m!329785))

(declare-fun m!329787 () Bool)

(assert (=> b!322593 m!329787))

(declare-fun m!329789 () Bool)

(assert (=> start!32372 m!329789))

(declare-fun m!329791 () Bool)

(assert (=> start!32372 m!329791))

(declare-fun m!329793 () Bool)

(assert (=> b!322601 m!329793))

(assert (=> b!322604 m!329783))

(declare-fun m!329795 () Bool)

(assert (=> b!322595 m!329795))

(assert (=> b!322595 m!329795))

(declare-fun m!329797 () Bool)

(assert (=> b!322595 m!329797))

(declare-fun m!329799 () Bool)

(assert (=> b!322598 m!329799))

(assert (=> b!322598 m!329799))

(declare-fun m!329801 () Bool)

(assert (=> b!322598 m!329801))

(declare-fun m!329803 () Bool)

(assert (=> b!322597 m!329803))

(assert (=> b!322594 m!329783))

(check-sat (not b!322599) (not b!322597) (not b!322602) (not b!322595) (not start!32372) (not b!322601) (not b!322598) (not b!322593))
(check-sat)
