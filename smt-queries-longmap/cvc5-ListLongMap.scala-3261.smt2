; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45438 () Bool)

(assert start!45438)

(declare-fun b!499818 () Bool)

(declare-fun res!301733 () Bool)

(declare-fun e!292877 () Bool)

(assert (=> b!499818 (=> (not res!301733) (not e!292877))))

(declare-datatypes ((array!32263 0))(
  ( (array!32264 (arr!15513 (Array (_ BitVec 32) (_ BitVec 64))) (size!15877 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32263)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499818 (= res!301733 (validKeyInArray!0 (select (arr!15513 a!3235) j!176)))))

(declare-fun b!499819 () Bool)

(declare-fun e!292874 () Bool)

(assert (=> b!499819 (= e!292877 e!292874)))

(declare-fun res!301730 () Bool)

(assert (=> b!499819 (=> (not res!301730) (not e!292874))))

(declare-datatypes ((SeekEntryResult!3980 0))(
  ( (MissingZero!3980 (index!18102 (_ BitVec 32))) (Found!3980 (index!18103 (_ BitVec 32))) (Intermediate!3980 (undefined!4792 Bool) (index!18104 (_ BitVec 32)) (x!47145 (_ BitVec 32))) (Undefined!3980) (MissingVacant!3980 (index!18105 (_ BitVec 32))) )
))
(declare-fun lt!226702 () SeekEntryResult!3980)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499819 (= res!301730 (or (= lt!226702 (MissingZero!3980 i!1204)) (= lt!226702 (MissingVacant!3980 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32263 (_ BitVec 32)) SeekEntryResult!3980)

(assert (=> b!499819 (= lt!226702 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!301739 () Bool)

(assert (=> start!45438 (=> (not res!301739) (not e!292877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45438 (= res!301739 (validMask!0 mask!3524))))

(assert (=> start!45438 e!292877))

(assert (=> start!45438 true))

(declare-fun array_inv!11309 (array!32263) Bool)

(assert (=> start!45438 (array_inv!11309 a!3235)))

(declare-fun b!499820 () Bool)

(declare-fun res!301731 () Bool)

(assert (=> b!499820 (=> (not res!301731) (not e!292874))))

(declare-datatypes ((List!9671 0))(
  ( (Nil!9668) (Cons!9667 (h!10541 (_ BitVec 64)) (t!15899 List!9671)) )
))
(declare-fun arrayNoDuplicates!0 (array!32263 (_ BitVec 32) List!9671) Bool)

(assert (=> b!499820 (= res!301731 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9668))))

(declare-fun b!499821 () Bool)

(declare-fun e!292875 () Bool)

(assert (=> b!499821 (= e!292875 true)))

(declare-fun lt!226703 () array!32263)

(declare-fun lt!226705 () SeekEntryResult!3980)

(declare-fun lt!226700 () (_ BitVec 64))

(declare-fun lt!226708 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32263 (_ BitVec 32)) SeekEntryResult!3980)

(assert (=> b!499821 (= lt!226705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226708 lt!226700 lt!226703 mask!3524))))

(declare-fun b!499822 () Bool)

(declare-fun res!301735 () Bool)

(assert (=> b!499822 (=> (not res!301735) (not e!292877))))

(declare-fun arrayContainsKey!0 (array!32263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499822 (= res!301735 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499823 () Bool)

(declare-fun res!301732 () Bool)

(assert (=> b!499823 (=> (not res!301732) (not e!292877))))

(assert (=> b!499823 (= res!301732 (validKeyInArray!0 k!2280))))

(declare-fun b!499824 () Bool)

(declare-fun e!292873 () Bool)

(assert (=> b!499824 (= e!292873 e!292875)))

(declare-fun res!301736 () Bool)

(assert (=> b!499824 (=> res!301736 e!292875)))

(declare-fun lt!226699 () SeekEntryResult!3980)

(assert (=> b!499824 (= res!301736 (or (bvsgt #b00000000000000000000000000000000 (x!47145 lt!226699)) (bvsgt (x!47145 lt!226699) #b01111111111111111111111111111110) (bvslt lt!226708 #b00000000000000000000000000000000) (bvsge lt!226708 (size!15877 a!3235)) (bvslt (index!18104 lt!226699) #b00000000000000000000000000000000) (bvsge (index!18104 lt!226699) (size!15877 a!3235)) (not (= lt!226699 (Intermediate!3980 false (index!18104 lt!226699) (x!47145 lt!226699))))))))

(assert (=> b!499824 (and (or (= (select (arr!15513 a!3235) (index!18104 lt!226699)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15513 a!3235) (index!18104 lt!226699)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15513 a!3235) (index!18104 lt!226699)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15513 a!3235) (index!18104 lt!226699)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14996 0))(
  ( (Unit!14997) )
))
(declare-fun lt!226701 () Unit!14996)

(declare-fun e!292876 () Unit!14996)

(assert (=> b!499824 (= lt!226701 e!292876)))

(declare-fun c!59321 () Bool)

(assert (=> b!499824 (= c!59321 (= (select (arr!15513 a!3235) (index!18104 lt!226699)) (select (arr!15513 a!3235) j!176)))))

(assert (=> b!499824 (and (bvslt (x!47145 lt!226699) #b01111111111111111111111111111110) (or (= (select (arr!15513 a!3235) (index!18104 lt!226699)) (select (arr!15513 a!3235) j!176)) (= (select (arr!15513 a!3235) (index!18104 lt!226699)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15513 a!3235) (index!18104 lt!226699)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499825 () Bool)

(declare-fun Unit!14998 () Unit!14996)

(assert (=> b!499825 (= e!292876 Unit!14998)))

(declare-fun b!499826 () Bool)

(assert (=> b!499826 (= e!292874 (not e!292873))))

(declare-fun res!301741 () Bool)

(assert (=> b!499826 (=> res!301741 e!292873)))

(declare-fun lt!226707 () (_ BitVec 32))

(assert (=> b!499826 (= res!301741 (= lt!226699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226707 lt!226700 lt!226703 mask!3524)))))

(assert (=> b!499826 (= lt!226699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226708 (select (arr!15513 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499826 (= lt!226707 (toIndex!0 lt!226700 mask!3524))))

(assert (=> b!499826 (= lt!226700 (select (store (arr!15513 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499826 (= lt!226708 (toIndex!0 (select (arr!15513 a!3235) j!176) mask!3524))))

(assert (=> b!499826 (= lt!226703 (array!32264 (store (arr!15513 a!3235) i!1204 k!2280) (size!15877 a!3235)))))

(declare-fun e!292872 () Bool)

(assert (=> b!499826 e!292872))

(declare-fun res!301734 () Bool)

(assert (=> b!499826 (=> (not res!301734) (not e!292872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32263 (_ BitVec 32)) Bool)

(assert (=> b!499826 (= res!301734 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226704 () Unit!14996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14996)

(assert (=> b!499826 (= lt!226704 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499827 () Bool)

(declare-fun Unit!14999 () Unit!14996)

(assert (=> b!499827 (= e!292876 Unit!14999)))

(declare-fun lt!226706 () Unit!14996)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32263 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14996)

(assert (=> b!499827 (= lt!226706 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226708 #b00000000000000000000000000000000 (index!18104 lt!226699) (x!47145 lt!226699) mask!3524))))

(declare-fun res!301742 () Bool)

(assert (=> b!499827 (= res!301742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226708 lt!226700 lt!226703 mask!3524) (Intermediate!3980 false (index!18104 lt!226699) (x!47145 lt!226699))))))

(declare-fun e!292871 () Bool)

(assert (=> b!499827 (=> (not res!301742) (not e!292871))))

(assert (=> b!499827 e!292871))

(declare-fun b!499828 () Bool)

(declare-fun res!301738 () Bool)

(assert (=> b!499828 (=> (not res!301738) (not e!292874))))

(assert (=> b!499828 (= res!301738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499829 () Bool)

(declare-fun res!301740 () Bool)

(assert (=> b!499829 (=> res!301740 e!292873)))

(assert (=> b!499829 (= res!301740 (or (undefined!4792 lt!226699) (not (is-Intermediate!3980 lt!226699))))))

(declare-fun b!499830 () Bool)

(declare-fun res!301737 () Bool)

(assert (=> b!499830 (=> (not res!301737) (not e!292877))))

(assert (=> b!499830 (= res!301737 (and (= (size!15877 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15877 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15877 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499831 () Bool)

(assert (=> b!499831 (= e!292871 false)))

(declare-fun b!499832 () Bool)

(assert (=> b!499832 (= e!292872 (= (seekEntryOrOpen!0 (select (arr!15513 a!3235) j!176) a!3235 mask!3524) (Found!3980 j!176)))))

(assert (= (and start!45438 res!301739) b!499830))

(assert (= (and b!499830 res!301737) b!499818))

(assert (= (and b!499818 res!301733) b!499823))

(assert (= (and b!499823 res!301732) b!499822))

(assert (= (and b!499822 res!301735) b!499819))

(assert (= (and b!499819 res!301730) b!499828))

(assert (= (and b!499828 res!301738) b!499820))

(assert (= (and b!499820 res!301731) b!499826))

(assert (= (and b!499826 res!301734) b!499832))

(assert (= (and b!499826 (not res!301741)) b!499829))

(assert (= (and b!499829 (not res!301740)) b!499824))

(assert (= (and b!499824 c!59321) b!499827))

(assert (= (and b!499824 (not c!59321)) b!499825))

(assert (= (and b!499827 res!301742) b!499831))

(assert (= (and b!499824 (not res!301736)) b!499821))

(declare-fun m!480993 () Bool)

(assert (=> b!499819 m!480993))

(declare-fun m!480995 () Bool)

(assert (=> b!499824 m!480995))

(declare-fun m!480997 () Bool)

(assert (=> b!499824 m!480997))

(declare-fun m!480999 () Bool)

(assert (=> b!499823 m!480999))

(assert (=> b!499818 m!480997))

(assert (=> b!499818 m!480997))

(declare-fun m!481001 () Bool)

(assert (=> b!499818 m!481001))

(declare-fun m!481003 () Bool)

(assert (=> b!499821 m!481003))

(declare-fun m!481005 () Bool)

(assert (=> b!499826 m!481005))

(declare-fun m!481007 () Bool)

(assert (=> b!499826 m!481007))

(declare-fun m!481009 () Bool)

(assert (=> b!499826 m!481009))

(declare-fun m!481011 () Bool)

(assert (=> b!499826 m!481011))

(assert (=> b!499826 m!480997))

(declare-fun m!481013 () Bool)

(assert (=> b!499826 m!481013))

(assert (=> b!499826 m!480997))

(declare-fun m!481015 () Bool)

(assert (=> b!499826 m!481015))

(declare-fun m!481017 () Bool)

(assert (=> b!499826 m!481017))

(assert (=> b!499826 m!480997))

(declare-fun m!481019 () Bool)

(assert (=> b!499826 m!481019))

(declare-fun m!481021 () Bool)

(assert (=> b!499822 m!481021))

(declare-fun m!481023 () Bool)

(assert (=> b!499820 m!481023))

(declare-fun m!481025 () Bool)

(assert (=> b!499828 m!481025))

(declare-fun m!481027 () Bool)

(assert (=> b!499827 m!481027))

(assert (=> b!499827 m!481003))

(declare-fun m!481029 () Bool)

(assert (=> start!45438 m!481029))

(declare-fun m!481031 () Bool)

(assert (=> start!45438 m!481031))

(assert (=> b!499832 m!480997))

(assert (=> b!499832 m!480997))

(declare-fun m!481033 () Bool)

(assert (=> b!499832 m!481033))

(push 1)

