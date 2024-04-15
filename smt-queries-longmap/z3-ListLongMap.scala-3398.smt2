; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46968 () Bool)

(assert start!46968)

(declare-fun b!517665 () Bool)

(declare-fun e!302070 () Bool)

(assert (=> b!517665 (= e!302070 true)))

(declare-datatypes ((SeekEntryResult!4387 0))(
  ( (MissingZero!4387 (index!19736 (_ BitVec 32))) (Found!4387 (index!19737 (_ BitVec 32))) (Intermediate!4387 (undefined!5199 Bool) (index!19738 (_ BitVec 32)) (x!48715 (_ BitVec 32))) (Undefined!4387) (MissingVacant!4387 (index!19739 (_ BitVec 32))) )
))
(declare-fun lt!236854 () SeekEntryResult!4387)

(declare-datatypes ((array!33119 0))(
  ( (array!33120 (arr!15923 (Array (_ BitVec 32) (_ BitVec 64))) (size!16288 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33119)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!517665 (and (bvslt (x!48715 lt!236854) #b01111111111111111111111111111110) (or (= (select (arr!15923 a!3235) (index!19738 lt!236854)) (select (arr!15923 a!3235) j!176)) (= (select (arr!15923 a!3235) (index!19738 lt!236854)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15923 a!3235) (index!19738 lt!236854)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517666 () Bool)

(declare-fun res!316826 () Bool)

(declare-fun e!302071 () Bool)

(assert (=> b!517666 (=> (not res!316826) (not e!302071))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517666 (= res!316826 (validKeyInArray!0 k0!2280))))

(declare-fun e!302069 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!517667 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33119 (_ BitVec 32)) SeekEntryResult!4387)

(assert (=> b!517667 (= e!302069 (= (seekEntryOrOpen!0 (select (arr!15923 a!3235) j!176) a!3235 mask!3524) (Found!4387 j!176)))))

(declare-fun b!517668 () Bool)

(declare-fun res!316824 () Bool)

(declare-fun e!302073 () Bool)

(assert (=> b!517668 (=> (not res!316824) (not e!302073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33119 (_ BitVec 32)) Bool)

(assert (=> b!517668 (= res!316824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517669 () Bool)

(declare-fun res!316828 () Bool)

(assert (=> b!517669 (=> (not res!316828) (not e!302071))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517669 (= res!316828 (and (= (size!16288 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16288 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16288 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517670 () Bool)

(assert (=> b!517670 (= e!302073 (not e!302070))))

(declare-fun res!316829 () Bool)

(assert (=> b!517670 (=> res!316829 e!302070)))

(declare-fun lt!236857 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33119 (_ BitVec 32)) SeekEntryResult!4387)

(assert (=> b!517670 (= res!316829 (= lt!236854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236857 (select (store (arr!15923 a!3235) i!1204 k0!2280) j!176) (array!33120 (store (arr!15923 a!3235) i!1204 k0!2280) (size!16288 a!3235)) mask!3524)))))

(declare-fun lt!236855 () (_ BitVec 32))

(assert (=> b!517670 (= lt!236854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236855 (select (arr!15923 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517670 (= lt!236857 (toIndex!0 (select (store (arr!15923 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517670 (= lt!236855 (toIndex!0 (select (arr!15923 a!3235) j!176) mask!3524))))

(assert (=> b!517670 e!302069))

(declare-fun res!316822 () Bool)

(assert (=> b!517670 (=> (not res!316822) (not e!302069))))

(assert (=> b!517670 (= res!316822 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16018 0))(
  ( (Unit!16019) )
))
(declare-fun lt!236853 () Unit!16018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16018)

(assert (=> b!517670 (= lt!236853 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517671 () Bool)

(declare-fun res!316827 () Bool)

(assert (=> b!517671 (=> (not res!316827) (not e!302071))))

(declare-fun arrayContainsKey!0 (array!33119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517671 (= res!316827 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517672 () Bool)

(declare-fun res!316830 () Bool)

(assert (=> b!517672 (=> (not res!316830) (not e!302073))))

(declare-datatypes ((List!10120 0))(
  ( (Nil!10117) (Cons!10116 (h!11023 (_ BitVec 64)) (t!16339 List!10120)) )
))
(declare-fun arrayNoDuplicates!0 (array!33119 (_ BitVec 32) List!10120) Bool)

(assert (=> b!517672 (= res!316830 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10117))))

(declare-fun b!517673 () Bool)

(declare-fun res!316823 () Bool)

(assert (=> b!517673 (=> res!316823 e!302070)))

(get-info :version)

(assert (=> b!517673 (= res!316823 (or (undefined!5199 lt!236854) (not ((_ is Intermediate!4387) lt!236854))))))

(declare-fun res!316825 () Bool)

(assert (=> start!46968 (=> (not res!316825) (not e!302071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46968 (= res!316825 (validMask!0 mask!3524))))

(assert (=> start!46968 e!302071))

(assert (=> start!46968 true))

(declare-fun array_inv!11806 (array!33119) Bool)

(assert (=> start!46968 (array_inv!11806 a!3235)))

(declare-fun b!517674 () Bool)

(declare-fun res!316831 () Bool)

(assert (=> b!517674 (=> (not res!316831) (not e!302071))))

(assert (=> b!517674 (= res!316831 (validKeyInArray!0 (select (arr!15923 a!3235) j!176)))))

(declare-fun b!517675 () Bool)

(assert (=> b!517675 (= e!302071 e!302073)))

(declare-fun res!316832 () Bool)

(assert (=> b!517675 (=> (not res!316832) (not e!302073))))

(declare-fun lt!236856 () SeekEntryResult!4387)

(assert (=> b!517675 (= res!316832 (or (= lt!236856 (MissingZero!4387 i!1204)) (= lt!236856 (MissingVacant!4387 i!1204))))))

(assert (=> b!517675 (= lt!236856 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46968 res!316825) b!517669))

(assert (= (and b!517669 res!316828) b!517674))

(assert (= (and b!517674 res!316831) b!517666))

(assert (= (and b!517666 res!316826) b!517671))

(assert (= (and b!517671 res!316827) b!517675))

(assert (= (and b!517675 res!316832) b!517668))

(assert (= (and b!517668 res!316824) b!517672))

(assert (= (and b!517672 res!316830) b!517670))

(assert (= (and b!517670 res!316822) b!517667))

(assert (= (and b!517670 (not res!316829)) b!517673))

(assert (= (and b!517673 (not res!316823)) b!517665))

(declare-fun m!498505 () Bool)

(assert (=> b!517671 m!498505))

(declare-fun m!498507 () Bool)

(assert (=> b!517670 m!498507))

(declare-fun m!498509 () Bool)

(assert (=> b!517670 m!498509))

(declare-fun m!498511 () Bool)

(assert (=> b!517670 m!498511))

(declare-fun m!498513 () Bool)

(assert (=> b!517670 m!498513))

(declare-fun m!498515 () Bool)

(assert (=> b!517670 m!498515))

(assert (=> b!517670 m!498513))

(declare-fun m!498517 () Bool)

(assert (=> b!517670 m!498517))

(declare-fun m!498519 () Bool)

(assert (=> b!517670 m!498519))

(assert (=> b!517670 m!498511))

(declare-fun m!498521 () Bool)

(assert (=> b!517670 m!498521))

(assert (=> b!517670 m!498511))

(declare-fun m!498523 () Bool)

(assert (=> b!517670 m!498523))

(assert (=> b!517670 m!498513))

(assert (=> b!517674 m!498513))

(assert (=> b!517674 m!498513))

(declare-fun m!498525 () Bool)

(assert (=> b!517674 m!498525))

(declare-fun m!498527 () Bool)

(assert (=> b!517666 m!498527))

(assert (=> b!517667 m!498513))

(assert (=> b!517667 m!498513))

(declare-fun m!498529 () Bool)

(assert (=> b!517667 m!498529))

(declare-fun m!498531 () Bool)

(assert (=> b!517665 m!498531))

(assert (=> b!517665 m!498513))

(declare-fun m!498533 () Bool)

(assert (=> b!517668 m!498533))

(declare-fun m!498535 () Bool)

(assert (=> start!46968 m!498535))

(declare-fun m!498537 () Bool)

(assert (=> start!46968 m!498537))

(declare-fun m!498539 () Bool)

(assert (=> b!517672 m!498539))

(declare-fun m!498541 () Bool)

(assert (=> b!517675 m!498541))

(check-sat (not b!517672) (not b!517668) (not start!46968) (not b!517666) (not b!517671) (not b!517675) (not b!517667) (not b!517674) (not b!517670))
(check-sat)
