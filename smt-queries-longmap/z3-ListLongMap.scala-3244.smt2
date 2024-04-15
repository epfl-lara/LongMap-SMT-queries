; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45258 () Bool)

(assert start!45258)

(declare-fun res!299546 () Bool)

(declare-fun e!291330 () Bool)

(assert (=> start!45258 (=> (not res!299546) (not e!291330))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45258 (= res!299546 (validMask!0 mask!3524))))

(assert (=> start!45258 e!291330))

(assert (=> start!45258 true))

(declare-datatypes ((array!32156 0))(
  ( (array!32157 (arr!15461 (Array (_ BitVec 32) (_ BitVec 64))) (size!15826 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32156)

(declare-fun array_inv!11344 (array!32156) Bool)

(assert (=> start!45258 (array_inv!11344 a!3235)))

(declare-fun b!497007 () Bool)

(declare-fun res!299543 () Bool)

(assert (=> b!497007 (=> (not res!299543) (not e!291330))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497007 (= res!299543 (and (= (size!15826 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15826 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15826 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497008 () Bool)

(declare-fun res!299538 () Bool)

(assert (=> b!497008 (=> (not res!299538) (not e!291330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497008 (= res!299538 (validKeyInArray!0 (select (arr!15461 a!3235) j!176)))))

(declare-fun b!497009 () Bool)

(declare-fun res!299545 () Bool)

(declare-fun e!291329 () Bool)

(assert (=> b!497009 (=> (not res!299545) (not e!291329))))

(declare-datatypes ((List!9658 0))(
  ( (Nil!9655) (Cons!9654 (h!10525 (_ BitVec 64)) (t!15877 List!9658)) )
))
(declare-fun arrayNoDuplicates!0 (array!32156 (_ BitVec 32) List!9658) Bool)

(assert (=> b!497009 (= res!299545 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9655))))

(declare-fun b!497010 () Bool)

(declare-fun res!299539 () Bool)

(assert (=> b!497010 (=> (not res!299539) (not e!291330))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!497010 (= res!299539 (validKeyInArray!0 k0!2280))))

(declare-fun b!497011 () Bool)

(declare-fun res!299540 () Bool)

(declare-fun e!291332 () Bool)

(assert (=> b!497011 (=> res!299540 e!291332)))

(declare-datatypes ((SeekEntryResult!3925 0))(
  ( (MissingZero!3925 (index!17879 (_ BitVec 32))) (Found!3925 (index!17880 (_ BitVec 32))) (Intermediate!3925 (undefined!4737 Bool) (index!17881 (_ BitVec 32)) (x!46940 (_ BitVec 32))) (Undefined!3925) (MissingVacant!3925 (index!17882 (_ BitVec 32))) )
))
(declare-fun lt!224890 () SeekEntryResult!3925)

(get-info :version)

(assert (=> b!497011 (= res!299540 (or (undefined!4737 lt!224890) (not ((_ is Intermediate!3925) lt!224890))))))

(declare-fun b!497012 () Bool)

(declare-fun e!291331 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32156 (_ BitVec 32)) SeekEntryResult!3925)

(assert (=> b!497012 (= e!291331 (= (seekEntryOrOpen!0 (select (arr!15461 a!3235) j!176) a!3235 mask!3524) (Found!3925 j!176)))))

(declare-fun b!497013 () Bool)

(assert (=> b!497013 (= e!291330 e!291329)))

(declare-fun res!299544 () Bool)

(assert (=> b!497013 (=> (not res!299544) (not e!291329))))

(declare-fun lt!224891 () SeekEntryResult!3925)

(assert (=> b!497013 (= res!299544 (or (= lt!224891 (MissingZero!3925 i!1204)) (= lt!224891 (MissingVacant!3925 i!1204))))))

(assert (=> b!497013 (= lt!224891 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497014 () Bool)

(declare-fun res!299536 () Bool)

(assert (=> b!497014 (=> (not res!299536) (not e!291330))))

(declare-fun arrayContainsKey!0 (array!32156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497014 (= res!299536 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497015 () Bool)

(assert (=> b!497015 (= e!291329 (not e!291332))))

(declare-fun res!299542 () Bool)

(assert (=> b!497015 (=> res!299542 e!291332)))

(declare-fun lt!224893 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32156 (_ BitVec 32)) SeekEntryResult!3925)

(assert (=> b!497015 (= res!299542 (= lt!224890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224893 (select (store (arr!15461 a!3235) i!1204 k0!2280) j!176) (array!32157 (store (arr!15461 a!3235) i!1204 k0!2280) (size!15826 a!3235)) mask!3524)))))

(declare-fun lt!224892 () (_ BitVec 32))

(assert (=> b!497015 (= lt!224890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224892 (select (arr!15461 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497015 (= lt!224893 (toIndex!0 (select (store (arr!15461 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497015 (= lt!224892 (toIndex!0 (select (arr!15461 a!3235) j!176) mask!3524))))

(assert (=> b!497015 e!291331))

(declare-fun res!299537 () Bool)

(assert (=> b!497015 (=> (not res!299537) (not e!291331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32156 (_ BitVec 32)) Bool)

(assert (=> b!497015 (= res!299537 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14782 0))(
  ( (Unit!14783) )
))
(declare-fun lt!224889 () Unit!14782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14782)

(assert (=> b!497015 (= lt!224889 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497016 () Bool)

(assert (=> b!497016 (= e!291332 true)))

(assert (=> b!497016 (and (bvslt (x!46940 lt!224890) #b01111111111111111111111111111110) (or (= (select (arr!15461 a!3235) (index!17881 lt!224890)) (select (arr!15461 a!3235) j!176)) (= (select (arr!15461 a!3235) (index!17881 lt!224890)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15461 a!3235) (index!17881 lt!224890)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497017 () Bool)

(declare-fun res!299541 () Bool)

(assert (=> b!497017 (=> (not res!299541) (not e!291329))))

(assert (=> b!497017 (= res!299541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45258 res!299546) b!497007))

(assert (= (and b!497007 res!299543) b!497008))

(assert (= (and b!497008 res!299538) b!497010))

(assert (= (and b!497010 res!299539) b!497014))

(assert (= (and b!497014 res!299536) b!497013))

(assert (= (and b!497013 res!299544) b!497017))

(assert (= (and b!497017 res!299541) b!497009))

(assert (= (and b!497009 res!299545) b!497015))

(assert (= (and b!497015 res!299537) b!497012))

(assert (= (and b!497015 (not res!299542)) b!497011))

(assert (= (and b!497011 (not res!299540)) b!497016))

(declare-fun m!477889 () Bool)

(assert (=> b!497014 m!477889))

(declare-fun m!477891 () Bool)

(assert (=> b!497015 m!477891))

(declare-fun m!477893 () Bool)

(assert (=> b!497015 m!477893))

(declare-fun m!477895 () Bool)

(assert (=> b!497015 m!477895))

(declare-fun m!477897 () Bool)

(assert (=> b!497015 m!477897))

(declare-fun m!477899 () Bool)

(assert (=> b!497015 m!477899))

(assert (=> b!497015 m!477897))

(declare-fun m!477901 () Bool)

(assert (=> b!497015 m!477901))

(assert (=> b!497015 m!477897))

(declare-fun m!477903 () Bool)

(assert (=> b!497015 m!477903))

(assert (=> b!497015 m!477895))

(declare-fun m!477905 () Bool)

(assert (=> b!497015 m!477905))

(assert (=> b!497015 m!477895))

(declare-fun m!477907 () Bool)

(assert (=> b!497015 m!477907))

(assert (=> b!497008 m!477897))

(assert (=> b!497008 m!477897))

(declare-fun m!477909 () Bool)

(assert (=> b!497008 m!477909))

(declare-fun m!477911 () Bool)

(assert (=> b!497016 m!477911))

(assert (=> b!497016 m!477897))

(declare-fun m!477913 () Bool)

(assert (=> b!497013 m!477913))

(declare-fun m!477915 () Bool)

(assert (=> b!497010 m!477915))

(assert (=> b!497012 m!477897))

(assert (=> b!497012 m!477897))

(declare-fun m!477917 () Bool)

(assert (=> b!497012 m!477917))

(declare-fun m!477919 () Bool)

(assert (=> b!497009 m!477919))

(declare-fun m!477921 () Bool)

(assert (=> b!497017 m!477921))

(declare-fun m!477923 () Bool)

(assert (=> start!45258 m!477923))

(declare-fun m!477925 () Bool)

(assert (=> start!45258 m!477925))

(check-sat (not b!497012) (not b!497014) (not b!497013) (not b!497015) (not b!497017) (not b!497010) (not b!497008) (not start!45258) (not b!497009))
(check-sat)
