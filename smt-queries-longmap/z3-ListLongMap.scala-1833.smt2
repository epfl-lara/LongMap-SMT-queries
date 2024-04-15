; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33194 () Bool)

(assert start!33194)

(declare-fun b!329847 () Bool)

(assert (=> b!329847 false))

(declare-datatypes ((Unit!10209 0))(
  ( (Unit!10210) )
))
(declare-fun lt!158218 () Unit!10209)

(declare-fun e!202538 () Unit!10209)

(assert (=> b!329847 (= lt!158218 e!202538)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((array!16857 0))(
  ( (array!16858 (arr!7971 (Array (_ BitVec 32) (_ BitVec 64))) (size!8324 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16857)

(declare-fun c!51679 () Bool)

(get-info :version)

(declare-datatypes ((SeekEntryResult!3101 0))(
  ( (MissingZero!3101 (index!14580 (_ BitVec 32))) (Found!3101 (index!14581 (_ BitVec 32))) (Intermediate!3101 (undefined!3913 Bool) (index!14582 (_ BitVec 32)) (x!32879 (_ BitVec 32))) (Undefined!3101) (MissingVacant!3101 (index!14583 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16857 (_ BitVec 32)) SeekEntryResult!3101)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329847 (= c!51679 ((_ is Intermediate!3101) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!202536 () Unit!10209)

(declare-fun Unit!10211 () Unit!10209)

(assert (=> b!329847 (= e!202536 Unit!10211)))

(declare-fun b!329848 () Bool)

(declare-fun res!181783 () Bool)

(declare-fun e!202541 () Bool)

(assert (=> b!329848 (=> (not res!181783) (not e!202541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16857 (_ BitVec 32)) Bool)

(assert (=> b!329848 (= res!181783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329850 () Bool)

(declare-fun e!202539 () Unit!10209)

(declare-fun Unit!10212 () Unit!10209)

(assert (=> b!329850 (= e!202539 Unit!10212)))

(declare-fun b!329851 () Bool)

(declare-fun Unit!10213 () Unit!10209)

(assert (=> b!329851 (= e!202538 Unit!10213)))

(assert (=> b!329851 false))

(declare-fun b!329852 () Bool)

(declare-fun e!202537 () Bool)

(assert (=> b!329852 (= e!202541 e!202537)))

(declare-fun res!181779 () Bool)

(assert (=> b!329852 (=> (not res!181779) (not e!202537))))

(declare-fun lt!158219 () SeekEntryResult!3101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329852 (= res!181779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158219))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!329852 (= lt!158219 (Intermediate!3101 false resIndex!58 resX!58))))

(declare-fun b!329853 () Bool)

(declare-fun res!181785 () Bool)

(assert (=> b!329853 (=> (not res!181785) (not e!202541))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329853 (= res!181785 (and (= (size!8324 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8324 a!3305))))))

(declare-fun b!329854 () Bool)

(assert (=> b!329854 (= e!202537 (not true))))

(assert (=> b!329854 (= index!1840 resIndex!58)))

(declare-fun lt!158217 () Unit!10209)

(assert (=> b!329854 (= lt!158217 e!202539)))

(declare-fun c!51678 () Bool)

(assert (=> b!329854 (= c!51678 (not (= resIndex!58 index!1840)))))

(declare-fun b!329855 () Bool)

(declare-fun res!181778 () Bool)

(assert (=> b!329855 (=> (not res!181778) (not e!202537))))

(assert (=> b!329855 (= res!181778 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158219))))

(declare-fun b!329856 () Bool)

(declare-fun res!181777 () Bool)

(assert (=> b!329856 (=> (not res!181777) (not e!202537))))

(assert (=> b!329856 (= res!181777 (and (= (select (arr!7971 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8324 a!3305))))))

(declare-fun b!329857 () Bool)

(assert (=> b!329857 false))

(declare-fun Unit!10214 () Unit!10209)

(assert (=> b!329857 (= e!202536 Unit!10214)))

(declare-fun b!329858 () Bool)

(declare-fun Unit!10215 () Unit!10209)

(assert (=> b!329858 (= e!202538 Unit!10215)))

(declare-fun res!181781 () Bool)

(assert (=> start!33194 (=> (not res!181781) (not e!202541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33194 (= res!181781 (validMask!0 mask!3777))))

(assert (=> start!33194 e!202541))

(declare-fun array_inv!5943 (array!16857) Bool)

(assert (=> start!33194 (array_inv!5943 a!3305)))

(assert (=> start!33194 true))

(declare-fun b!329849 () Bool)

(assert (=> b!329849 (= e!202539 e!202536)))

(declare-fun c!51680 () Bool)

(assert (=> b!329849 (= c!51680 (or (= (select (arr!7971 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7971 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329859 () Bool)

(declare-fun res!181780 () Bool)

(assert (=> b!329859 (=> (not res!181780) (not e!202541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329859 (= res!181780 (validKeyInArray!0 k0!2497))))

(declare-fun b!329860 () Bool)

(declare-fun res!181784 () Bool)

(assert (=> b!329860 (=> (not res!181784) (not e!202537))))

(assert (=> b!329860 (= res!181784 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7971 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!329861 () Bool)

(declare-fun res!181776 () Bool)

(assert (=> b!329861 (=> (not res!181776) (not e!202541))))

(declare-fun arrayContainsKey!0 (array!16857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329861 (= res!181776 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329862 () Bool)

(declare-fun res!181782 () Bool)

(assert (=> b!329862 (=> (not res!181782) (not e!202541))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16857 (_ BitVec 32)) SeekEntryResult!3101)

(assert (=> b!329862 (= res!181782 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3101 i!1250)))))

(assert (= (and start!33194 res!181781) b!329853))

(assert (= (and b!329853 res!181785) b!329859))

(assert (= (and b!329859 res!181780) b!329861))

(assert (= (and b!329861 res!181776) b!329862))

(assert (= (and b!329862 res!181782) b!329848))

(assert (= (and b!329848 res!181783) b!329852))

(assert (= (and b!329852 res!181779) b!329856))

(assert (= (and b!329856 res!181777) b!329855))

(assert (= (and b!329855 res!181778) b!329860))

(assert (= (and b!329860 res!181784) b!329854))

(assert (= (and b!329854 c!51678) b!329849))

(assert (= (and b!329854 (not c!51678)) b!329850))

(assert (= (and b!329849 c!51680) b!329857))

(assert (= (and b!329849 (not c!51680)) b!329847))

(assert (= (and b!329847 c!51679) b!329858))

(assert (= (and b!329847 (not c!51679)) b!329851))

(declare-fun m!334771 () Bool)

(assert (=> b!329848 m!334771))

(declare-fun m!334773 () Bool)

(assert (=> b!329852 m!334773))

(assert (=> b!329852 m!334773))

(declare-fun m!334775 () Bool)

(assert (=> b!329852 m!334775))

(declare-fun m!334777 () Bool)

(assert (=> b!329849 m!334777))

(declare-fun m!334779 () Bool)

(assert (=> b!329855 m!334779))

(declare-fun m!334781 () Bool)

(assert (=> b!329861 m!334781))

(declare-fun m!334783 () Bool)

(assert (=> b!329856 m!334783))

(declare-fun m!334785 () Bool)

(assert (=> b!329862 m!334785))

(declare-fun m!334787 () Bool)

(assert (=> start!33194 m!334787))

(declare-fun m!334789 () Bool)

(assert (=> start!33194 m!334789))

(declare-fun m!334791 () Bool)

(assert (=> b!329847 m!334791))

(assert (=> b!329847 m!334791))

(declare-fun m!334793 () Bool)

(assert (=> b!329847 m!334793))

(declare-fun m!334795 () Bool)

(assert (=> b!329859 m!334795))

(assert (=> b!329860 m!334777))

(check-sat (not b!329855) (not b!329847) (not b!329848) (not b!329859) (not b!329861) (not b!329862) (not start!33194) (not b!329852))
(check-sat)
