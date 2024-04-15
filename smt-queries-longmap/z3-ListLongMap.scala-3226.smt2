; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45150 () Bool)

(assert start!45150)

(declare-fun res!297755 () Bool)

(declare-fun e!290520 () Bool)

(assert (=> start!45150 (=> (not res!297755) (not e!290520))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45150 (= res!297755 (validMask!0 mask!3524))))

(assert (=> start!45150 e!290520))

(assert (=> start!45150 true))

(declare-datatypes ((array!32048 0))(
  ( (array!32049 (arr!15407 (Array (_ BitVec 32) (_ BitVec 64))) (size!15772 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32048)

(declare-fun array_inv!11290 (array!32048) Bool)

(assert (=> start!45150 (array_inv!11290 a!3235)))

(declare-fun b!495225 () Bool)

(declare-fun res!297759 () Bool)

(assert (=> b!495225 (=> (not res!297759) (not e!290520))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495225 (= res!297759 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495226 () Bool)

(declare-fun res!297754 () Bool)

(declare-fun e!290519 () Bool)

(assert (=> b!495226 (=> (not res!297754) (not e!290519))))

(declare-datatypes ((List!9604 0))(
  ( (Nil!9601) (Cons!9600 (h!10471 (_ BitVec 64)) (t!15823 List!9604)) )
))
(declare-fun arrayNoDuplicates!0 (array!32048 (_ BitVec 32) List!9604) Bool)

(assert (=> b!495226 (= res!297754 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9601))))

(declare-fun b!495227 () Bool)

(declare-fun res!297756 () Bool)

(assert (=> b!495227 (=> (not res!297756) (not e!290520))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495227 (= res!297756 (validKeyInArray!0 (select (arr!15407 a!3235) j!176)))))

(declare-fun e!290521 () Bool)

(declare-fun b!495228 () Bool)

(declare-datatypes ((SeekEntryResult!3871 0))(
  ( (MissingZero!3871 (index!17663 (_ BitVec 32))) (Found!3871 (index!17664 (_ BitVec 32))) (Intermediate!3871 (undefined!4683 Bool) (index!17665 (_ BitVec 32)) (x!46742 (_ BitVec 32))) (Undefined!3871) (MissingVacant!3871 (index!17666 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32048 (_ BitVec 32)) SeekEntryResult!3871)

(assert (=> b!495228 (= e!290521 (= (seekEntryOrOpen!0 (select (arr!15407 a!3235) j!176) a!3235 mask!3524) (Found!3871 j!176)))))

(declare-fun b!495229 () Bool)

(declare-fun res!297764 () Bool)

(assert (=> b!495229 (=> (not res!297764) (not e!290520))))

(assert (=> b!495229 (= res!297764 (validKeyInArray!0 k0!2280))))

(declare-fun b!495230 () Bool)

(declare-fun e!290523 () Bool)

(assert (=> b!495230 (= e!290523 true)))

(declare-fun lt!224081 () SeekEntryResult!3871)

(assert (=> b!495230 (and (bvslt (x!46742 lt!224081) #b01111111111111111111111111111110) (or (= (select (arr!15407 a!3235) (index!17665 lt!224081)) (select (arr!15407 a!3235) j!176)) (= (select (arr!15407 a!3235) (index!17665 lt!224081)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15407 a!3235) (index!17665 lt!224081)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495231 () Bool)

(declare-fun res!297760 () Bool)

(assert (=> b!495231 (=> (not res!297760) (not e!290519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32048 (_ BitVec 32)) Bool)

(assert (=> b!495231 (= res!297760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495232 () Bool)

(assert (=> b!495232 (= e!290519 (not e!290523))))

(declare-fun res!297762 () Bool)

(assert (=> b!495232 (=> res!297762 e!290523)))

(declare-fun lt!224079 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32048 (_ BitVec 32)) SeekEntryResult!3871)

(assert (=> b!495232 (= res!297762 (= lt!224081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224079 (select (store (arr!15407 a!3235) i!1204 k0!2280) j!176) (array!32049 (store (arr!15407 a!3235) i!1204 k0!2280) (size!15772 a!3235)) mask!3524)))))

(declare-fun lt!224080 () (_ BitVec 32))

(assert (=> b!495232 (= lt!224081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224080 (select (arr!15407 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495232 (= lt!224079 (toIndex!0 (select (store (arr!15407 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495232 (= lt!224080 (toIndex!0 (select (arr!15407 a!3235) j!176) mask!3524))))

(assert (=> b!495232 e!290521))

(declare-fun res!297758 () Bool)

(assert (=> b!495232 (=> (not res!297758) (not e!290521))))

(assert (=> b!495232 (= res!297758 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14674 0))(
  ( (Unit!14675) )
))
(declare-fun lt!224083 () Unit!14674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14674)

(assert (=> b!495232 (= lt!224083 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495233 () Bool)

(declare-fun res!297757 () Bool)

(assert (=> b!495233 (=> res!297757 e!290523)))

(get-info :version)

(assert (=> b!495233 (= res!297757 (or (undefined!4683 lt!224081) (not ((_ is Intermediate!3871) lt!224081))))))

(declare-fun b!495234 () Bool)

(assert (=> b!495234 (= e!290520 e!290519)))

(declare-fun res!297761 () Bool)

(assert (=> b!495234 (=> (not res!297761) (not e!290519))))

(declare-fun lt!224082 () SeekEntryResult!3871)

(assert (=> b!495234 (= res!297761 (or (= lt!224082 (MissingZero!3871 i!1204)) (= lt!224082 (MissingVacant!3871 i!1204))))))

(assert (=> b!495234 (= lt!224082 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495235 () Bool)

(declare-fun res!297763 () Bool)

(assert (=> b!495235 (=> (not res!297763) (not e!290520))))

(assert (=> b!495235 (= res!297763 (and (= (size!15772 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15772 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15772 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45150 res!297755) b!495235))

(assert (= (and b!495235 res!297763) b!495227))

(assert (= (and b!495227 res!297756) b!495229))

(assert (= (and b!495229 res!297764) b!495225))

(assert (= (and b!495225 res!297759) b!495234))

(assert (= (and b!495234 res!297761) b!495231))

(assert (= (and b!495231 res!297760) b!495226))

(assert (= (and b!495226 res!297754) b!495232))

(assert (= (and b!495232 res!297758) b!495228))

(assert (= (and b!495232 (not res!297762)) b!495233))

(assert (= (and b!495233 (not res!297757)) b!495230))

(declare-fun m!475837 () Bool)

(assert (=> b!495226 m!475837))

(declare-fun m!475839 () Bool)

(assert (=> b!495228 m!475839))

(assert (=> b!495228 m!475839))

(declare-fun m!475841 () Bool)

(assert (=> b!495228 m!475841))

(declare-fun m!475843 () Bool)

(assert (=> start!45150 m!475843))

(declare-fun m!475845 () Bool)

(assert (=> start!45150 m!475845))

(declare-fun m!475847 () Bool)

(assert (=> b!495229 m!475847))

(assert (=> b!495227 m!475839))

(assert (=> b!495227 m!475839))

(declare-fun m!475849 () Bool)

(assert (=> b!495227 m!475849))

(declare-fun m!475851 () Bool)

(assert (=> b!495231 m!475851))

(declare-fun m!475853 () Bool)

(assert (=> b!495230 m!475853))

(assert (=> b!495230 m!475839))

(declare-fun m!475855 () Bool)

(assert (=> b!495232 m!475855))

(declare-fun m!475857 () Bool)

(assert (=> b!495232 m!475857))

(declare-fun m!475859 () Bool)

(assert (=> b!495232 m!475859))

(declare-fun m!475861 () Bool)

(assert (=> b!495232 m!475861))

(assert (=> b!495232 m!475855))

(assert (=> b!495232 m!475839))

(declare-fun m!475863 () Bool)

(assert (=> b!495232 m!475863))

(assert (=> b!495232 m!475839))

(declare-fun m!475865 () Bool)

(assert (=> b!495232 m!475865))

(assert (=> b!495232 m!475839))

(declare-fun m!475867 () Bool)

(assert (=> b!495232 m!475867))

(assert (=> b!495232 m!475855))

(declare-fun m!475869 () Bool)

(assert (=> b!495232 m!475869))

(declare-fun m!475871 () Bool)

(assert (=> b!495225 m!475871))

(declare-fun m!475873 () Bool)

(assert (=> b!495234 m!475873))

(check-sat (not b!495234) (not start!45150) (not b!495228) (not b!495231) (not b!495232) (not b!495226) (not b!495225) (not b!495227) (not b!495229))
(check-sat)
