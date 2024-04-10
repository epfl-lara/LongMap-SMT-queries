; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45182 () Bool)

(assert start!45182)

(declare-fun b!495827 () Bool)

(declare-fun e!290846 () Bool)

(assert (=> b!495827 (= e!290846 true)))

(declare-datatypes ((SeekEntryResult!3885 0))(
  ( (MissingZero!3885 (index!17719 (_ BitVec 32))) (Found!3885 (index!17720 (_ BitVec 32))) (Intermediate!3885 (undefined!4697 Bool) (index!17721 (_ BitVec 32)) (x!46785 (_ BitVec 32))) (Undefined!3885) (MissingVacant!3885 (index!17722 (_ BitVec 32))) )
))
(declare-fun lt!224464 () SeekEntryResult!3885)

(declare-datatypes ((array!32070 0))(
  ( (array!32071 (arr!15418 (Array (_ BitVec 32) (_ BitVec 64))) (size!15782 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32070)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495827 (and (bvslt (x!46785 lt!224464) #b01111111111111111111111111111110) (or (= (select (arr!15418 a!3235) (index!17721 lt!224464)) (select (arr!15418 a!3235) j!176)) (= (select (arr!15418 a!3235) (index!17721 lt!224464)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15418 a!3235) (index!17721 lt!224464)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495828 () Bool)

(declare-fun e!290845 () Bool)

(declare-fun e!290844 () Bool)

(assert (=> b!495828 (= e!290845 e!290844)))

(declare-fun res!298221 () Bool)

(assert (=> b!495828 (=> (not res!298221) (not e!290844))))

(declare-fun lt!224465 () SeekEntryResult!3885)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495828 (= res!298221 (or (= lt!224465 (MissingZero!3885 i!1204)) (= lt!224465 (MissingVacant!3885 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32070 (_ BitVec 32)) SeekEntryResult!3885)

(assert (=> b!495828 (= lt!224465 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495829 () Bool)

(declare-fun res!298219 () Bool)

(assert (=> b!495829 (=> (not res!298219) (not e!290844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32070 (_ BitVec 32)) Bool)

(assert (=> b!495829 (= res!298219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495830 () Bool)

(declare-fun res!298215 () Bool)

(assert (=> b!495830 (=> res!298215 e!290846)))

(get-info :version)

(assert (=> b!495830 (= res!298215 (or (undefined!4697 lt!224464) (not ((_ is Intermediate!3885) lt!224464))))))

(declare-fun b!495831 () Bool)

(declare-fun res!298216 () Bool)

(assert (=> b!495831 (=> (not res!298216) (not e!290845))))

(declare-fun arrayContainsKey!0 (array!32070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495831 (= res!298216 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495832 () Bool)

(declare-fun res!298223 () Bool)

(assert (=> b!495832 (=> (not res!298223) (not e!290844))))

(declare-datatypes ((List!9576 0))(
  ( (Nil!9573) (Cons!9572 (h!10443 (_ BitVec 64)) (t!15804 List!9576)) )
))
(declare-fun arrayNoDuplicates!0 (array!32070 (_ BitVec 32) List!9576) Bool)

(assert (=> b!495832 (= res!298223 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9573))))

(declare-fun res!298214 () Bool)

(assert (=> start!45182 (=> (not res!298214) (not e!290845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45182 (= res!298214 (validMask!0 mask!3524))))

(assert (=> start!45182 e!290845))

(assert (=> start!45182 true))

(declare-fun array_inv!11214 (array!32070) Bool)

(assert (=> start!45182 (array_inv!11214 a!3235)))

(declare-fun e!290843 () Bool)

(declare-fun b!495826 () Bool)

(assert (=> b!495826 (= e!290843 (= (seekEntryOrOpen!0 (select (arr!15418 a!3235) j!176) a!3235 mask!3524) (Found!3885 j!176)))))

(declare-fun b!495833 () Bool)

(declare-fun res!298217 () Bool)

(assert (=> b!495833 (=> (not res!298217) (not e!290845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495833 (= res!298217 (validKeyInArray!0 (select (arr!15418 a!3235) j!176)))))

(declare-fun b!495834 () Bool)

(declare-fun res!298213 () Bool)

(assert (=> b!495834 (=> (not res!298213) (not e!290845))))

(assert (=> b!495834 (= res!298213 (validKeyInArray!0 k0!2280))))

(declare-fun b!495835 () Bool)

(declare-fun res!298218 () Bool)

(assert (=> b!495835 (=> (not res!298218) (not e!290845))))

(assert (=> b!495835 (= res!298218 (and (= (size!15782 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15782 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15782 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495836 () Bool)

(assert (=> b!495836 (= e!290844 (not e!290846))))

(declare-fun res!298220 () Bool)

(assert (=> b!495836 (=> res!298220 e!290846)))

(declare-fun lt!224466 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32070 (_ BitVec 32)) SeekEntryResult!3885)

(assert (=> b!495836 (= res!298220 (= lt!224464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224466 (select (store (arr!15418 a!3235) i!1204 k0!2280) j!176) (array!32071 (store (arr!15418 a!3235) i!1204 k0!2280) (size!15782 a!3235)) mask!3524)))))

(declare-fun lt!224463 () (_ BitVec 32))

(assert (=> b!495836 (= lt!224464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224463 (select (arr!15418 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495836 (= lt!224466 (toIndex!0 (select (store (arr!15418 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495836 (= lt!224463 (toIndex!0 (select (arr!15418 a!3235) j!176) mask!3524))))

(assert (=> b!495836 e!290843))

(declare-fun res!298222 () Bool)

(assert (=> b!495836 (=> (not res!298222) (not e!290843))))

(assert (=> b!495836 (= res!298222 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14716 0))(
  ( (Unit!14717) )
))
(declare-fun lt!224467 () Unit!14716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14716)

(assert (=> b!495836 (= lt!224467 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45182 res!298214) b!495835))

(assert (= (and b!495835 res!298218) b!495833))

(assert (= (and b!495833 res!298217) b!495834))

(assert (= (and b!495834 res!298213) b!495831))

(assert (= (and b!495831 res!298216) b!495828))

(assert (= (and b!495828 res!298221) b!495829))

(assert (= (and b!495829 res!298219) b!495832))

(assert (= (and b!495832 res!298223) b!495836))

(assert (= (and b!495836 res!298222) b!495826))

(assert (= (and b!495836 (not res!298220)) b!495830))

(assert (= (and b!495830 (not res!298215)) b!495827))

(declare-fun m!476969 () Bool)

(assert (=> start!45182 m!476969))

(declare-fun m!476971 () Bool)

(assert (=> start!45182 m!476971))

(declare-fun m!476973 () Bool)

(assert (=> b!495828 m!476973))

(declare-fun m!476975 () Bool)

(assert (=> b!495834 m!476975))

(declare-fun m!476977 () Bool)

(assert (=> b!495827 m!476977))

(declare-fun m!476979 () Bool)

(assert (=> b!495827 m!476979))

(declare-fun m!476981 () Bool)

(assert (=> b!495832 m!476981))

(declare-fun m!476983 () Bool)

(assert (=> b!495836 m!476983))

(declare-fun m!476985 () Bool)

(assert (=> b!495836 m!476985))

(declare-fun m!476987 () Bool)

(assert (=> b!495836 m!476987))

(assert (=> b!495836 m!476979))

(declare-fun m!476989 () Bool)

(assert (=> b!495836 m!476989))

(assert (=> b!495836 m!476979))

(declare-fun m!476991 () Bool)

(assert (=> b!495836 m!476991))

(assert (=> b!495836 m!476979))

(declare-fun m!476993 () Bool)

(assert (=> b!495836 m!476993))

(assert (=> b!495836 m!476987))

(declare-fun m!476995 () Bool)

(assert (=> b!495836 m!476995))

(assert (=> b!495836 m!476987))

(declare-fun m!476997 () Bool)

(assert (=> b!495836 m!476997))

(declare-fun m!476999 () Bool)

(assert (=> b!495831 m!476999))

(assert (=> b!495826 m!476979))

(assert (=> b!495826 m!476979))

(declare-fun m!477001 () Bool)

(assert (=> b!495826 m!477001))

(declare-fun m!477003 () Bool)

(assert (=> b!495829 m!477003))

(assert (=> b!495833 m!476979))

(assert (=> b!495833 m!476979))

(declare-fun m!477005 () Bool)

(assert (=> b!495833 m!477005))

(check-sat (not b!495831) (not b!495828) (not b!495834) (not b!495832) (not start!45182) (not b!495833) (not b!495826) (not b!495829) (not b!495836))
