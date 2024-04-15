; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45210 () Bool)

(assert start!45210)

(declare-fun b!496215 () Bool)

(declare-fun e!290970 () Bool)

(declare-fun e!290972 () Bool)

(assert (=> b!496215 (= e!290970 (not e!290972))))

(declare-fun res!298747 () Bool)

(assert (=> b!496215 (=> res!298747 e!290972)))

(declare-datatypes ((SeekEntryResult!3901 0))(
  ( (MissingZero!3901 (index!17783 (_ BitVec 32))) (Found!3901 (index!17784 (_ BitVec 32))) (Intermediate!3901 (undefined!4713 Bool) (index!17785 (_ BitVec 32)) (x!46852 (_ BitVec 32))) (Undefined!3901) (MissingVacant!3901 (index!17786 (_ BitVec 32))) )
))
(declare-fun lt!224532 () SeekEntryResult!3901)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224530 () (_ BitVec 32))

(declare-datatypes ((array!32108 0))(
  ( (array!32109 (arr!15437 (Array (_ BitVec 32) (_ BitVec 64))) (size!15802 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32108)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32108 (_ BitVec 32)) SeekEntryResult!3901)

(assert (=> b!496215 (= res!298747 (= lt!224532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224530 (select (store (arr!15437 a!3235) i!1204 k0!2280) j!176) (array!32109 (store (arr!15437 a!3235) i!1204 k0!2280) (size!15802 a!3235)) mask!3524)))))

(declare-fun lt!224531 () (_ BitVec 32))

(assert (=> b!496215 (= lt!224532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224531 (select (arr!15437 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496215 (= lt!224530 (toIndex!0 (select (store (arr!15437 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496215 (= lt!224531 (toIndex!0 (select (arr!15437 a!3235) j!176) mask!3524))))

(declare-fun e!290971 () Bool)

(assert (=> b!496215 e!290971))

(declare-fun res!298749 () Bool)

(assert (=> b!496215 (=> (not res!298749) (not e!290971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32108 (_ BitVec 32)) Bool)

(assert (=> b!496215 (= res!298749 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14734 0))(
  ( (Unit!14735) )
))
(declare-fun lt!224529 () Unit!14734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14734)

(assert (=> b!496215 (= lt!224529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496216 () Bool)

(declare-fun res!298746 () Bool)

(declare-fun e!290973 () Bool)

(assert (=> b!496216 (=> (not res!298746) (not e!290973))))

(assert (=> b!496216 (= res!298746 (and (= (size!15802 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15802 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15802 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496217 () Bool)

(assert (=> b!496217 (= e!290973 e!290970)))

(declare-fun res!298751 () Bool)

(assert (=> b!496217 (=> (not res!298751) (not e!290970))))

(declare-fun lt!224533 () SeekEntryResult!3901)

(assert (=> b!496217 (= res!298751 (or (= lt!224533 (MissingZero!3901 i!1204)) (= lt!224533 (MissingVacant!3901 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32108 (_ BitVec 32)) SeekEntryResult!3901)

(assert (=> b!496217 (= lt!224533 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496218 () Bool)

(assert (=> b!496218 (= e!290971 (= (seekEntryOrOpen!0 (select (arr!15437 a!3235) j!176) a!3235 mask!3524) (Found!3901 j!176)))))

(declare-fun b!496219 () Bool)

(declare-fun res!298750 () Bool)

(assert (=> b!496219 (=> (not res!298750) (not e!290973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496219 (= res!298750 (validKeyInArray!0 (select (arr!15437 a!3235) j!176)))))

(declare-fun b!496220 () Bool)

(declare-fun res!298753 () Bool)

(assert (=> b!496220 (=> (not res!298753) (not e!290970))))

(assert (=> b!496220 (= res!298753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!298745 () Bool)

(assert (=> start!45210 (=> (not res!298745) (not e!290973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45210 (= res!298745 (validMask!0 mask!3524))))

(assert (=> start!45210 e!290973))

(assert (=> start!45210 true))

(declare-fun array_inv!11320 (array!32108) Bool)

(assert (=> start!45210 (array_inv!11320 a!3235)))

(declare-fun b!496221 () Bool)

(assert (=> b!496221 (= e!290972 true)))

(assert (=> b!496221 (and (bvslt (x!46852 lt!224532) #b01111111111111111111111111111110) (or (= (select (arr!15437 a!3235) (index!17785 lt!224532)) (select (arr!15437 a!3235) j!176)) (= (select (arr!15437 a!3235) (index!17785 lt!224532)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15437 a!3235) (index!17785 lt!224532)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496222 () Bool)

(declare-fun res!298744 () Bool)

(assert (=> b!496222 (=> res!298744 e!290972)))

(get-info :version)

(assert (=> b!496222 (= res!298744 (or (undefined!4713 lt!224532) (not ((_ is Intermediate!3901) lt!224532))))))

(declare-fun b!496223 () Bool)

(declare-fun res!298754 () Bool)

(assert (=> b!496223 (=> (not res!298754) (not e!290970))))

(declare-datatypes ((List!9634 0))(
  ( (Nil!9631) (Cons!9630 (h!10501 (_ BitVec 64)) (t!15853 List!9634)) )
))
(declare-fun arrayNoDuplicates!0 (array!32108 (_ BitVec 32) List!9634) Bool)

(assert (=> b!496223 (= res!298754 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9631))))

(declare-fun b!496224 () Bool)

(declare-fun res!298752 () Bool)

(assert (=> b!496224 (=> (not res!298752) (not e!290973))))

(declare-fun arrayContainsKey!0 (array!32108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496224 (= res!298752 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496225 () Bool)

(declare-fun res!298748 () Bool)

(assert (=> b!496225 (=> (not res!298748) (not e!290973))))

(assert (=> b!496225 (= res!298748 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45210 res!298745) b!496216))

(assert (= (and b!496216 res!298746) b!496219))

(assert (= (and b!496219 res!298750) b!496225))

(assert (= (and b!496225 res!298748) b!496224))

(assert (= (and b!496224 res!298752) b!496217))

(assert (= (and b!496217 res!298751) b!496220))

(assert (= (and b!496220 res!298753) b!496223))

(assert (= (and b!496223 res!298754) b!496215))

(assert (= (and b!496215 res!298749) b!496218))

(assert (= (and b!496215 (not res!298747)) b!496222))

(assert (= (and b!496222 (not res!298744)) b!496221))

(declare-fun m!476977 () Bool)

(assert (=> b!496220 m!476977))

(declare-fun m!476979 () Bool)

(assert (=> b!496217 m!476979))

(declare-fun m!476981 () Bool)

(assert (=> b!496215 m!476981))

(declare-fun m!476983 () Bool)

(assert (=> b!496215 m!476983))

(declare-fun m!476985 () Bool)

(assert (=> b!496215 m!476985))

(assert (=> b!496215 m!476985))

(declare-fun m!476987 () Bool)

(assert (=> b!496215 m!476987))

(declare-fun m!476989 () Bool)

(assert (=> b!496215 m!476989))

(declare-fun m!476991 () Bool)

(assert (=> b!496215 m!476991))

(assert (=> b!496215 m!476989))

(declare-fun m!476993 () Bool)

(assert (=> b!496215 m!476993))

(assert (=> b!496215 m!476989))

(declare-fun m!476995 () Bool)

(assert (=> b!496215 m!476995))

(assert (=> b!496215 m!476985))

(declare-fun m!476997 () Bool)

(assert (=> b!496215 m!476997))

(assert (=> b!496219 m!476989))

(assert (=> b!496219 m!476989))

(declare-fun m!476999 () Bool)

(assert (=> b!496219 m!476999))

(assert (=> b!496218 m!476989))

(assert (=> b!496218 m!476989))

(declare-fun m!477001 () Bool)

(assert (=> b!496218 m!477001))

(declare-fun m!477003 () Bool)

(assert (=> b!496221 m!477003))

(assert (=> b!496221 m!476989))

(declare-fun m!477005 () Bool)

(assert (=> b!496223 m!477005))

(declare-fun m!477007 () Bool)

(assert (=> start!45210 m!477007))

(declare-fun m!477009 () Bool)

(assert (=> start!45210 m!477009))

(declare-fun m!477011 () Bool)

(assert (=> b!496225 m!477011))

(declare-fun m!477013 () Bool)

(assert (=> b!496224 m!477013))

(check-sat (not b!496223) (not b!496218) (not b!496217) (not b!496224) (not start!45210) (not b!496219) (not b!496215) (not b!496220) (not b!496225))
(check-sat)
