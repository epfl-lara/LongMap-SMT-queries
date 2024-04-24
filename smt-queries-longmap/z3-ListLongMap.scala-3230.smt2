; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45176 () Bool)

(assert start!45176)

(declare-fun res!298279 () Bool)

(declare-fun e!290838 () Bool)

(assert (=> start!45176 (=> (not res!298279) (not e!290838))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45176 (= res!298279 (validMask!0 mask!3524))))

(assert (=> start!45176 e!290838))

(assert (=> start!45176 true))

(declare-datatypes ((array!32065 0))(
  ( (array!32066 (arr!15415 (Array (_ BitVec 32) (_ BitVec 64))) (size!15779 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32065)

(declare-fun array_inv!11274 (array!32065) Bool)

(assert (=> start!45176 (array_inv!11274 a!3235)))

(declare-fun b!495831 () Bool)

(declare-fun res!298281 () Bool)

(declare-fun e!290837 () Bool)

(assert (=> b!495831 (=> (not res!298281) (not e!290837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32065 (_ BitVec 32)) Bool)

(assert (=> b!495831 (= res!298281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495832 () Bool)

(declare-fun e!290834 () Bool)

(assert (=> b!495832 (= e!290837 (not e!290834))))

(declare-fun res!298272 () Bool)

(assert (=> b!495832 (=> res!298272 e!290834)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224506 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3838 0))(
  ( (MissingZero!3838 (index!17531 (_ BitVec 32))) (Found!3838 (index!17532 (_ BitVec 32))) (Intermediate!3838 (undefined!4650 Bool) (index!17533 (_ BitVec 32)) (x!46743 (_ BitVec 32))) (Undefined!3838) (MissingVacant!3838 (index!17534 (_ BitVec 32))) )
))
(declare-fun lt!224509 () SeekEntryResult!3838)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32065 (_ BitVec 32)) SeekEntryResult!3838)

(assert (=> b!495832 (= res!298272 (= lt!224509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224506 (select (store (arr!15415 a!3235) i!1204 k0!2280) j!176) (array!32066 (store (arr!15415 a!3235) i!1204 k0!2280) (size!15779 a!3235)) mask!3524)))))

(declare-fun lt!224507 () (_ BitVec 32))

(assert (=> b!495832 (= lt!224509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224507 (select (arr!15415 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495832 (= lt!224506 (toIndex!0 (select (store (arr!15415 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495832 (= lt!224507 (toIndex!0 (select (arr!15415 a!3235) j!176) mask!3524))))

(declare-fun e!290835 () Bool)

(assert (=> b!495832 e!290835))

(declare-fun res!298275 () Bool)

(assert (=> b!495832 (=> (not res!298275) (not e!290835))))

(assert (=> b!495832 (= res!298275 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14683 0))(
  ( (Unit!14684) )
))
(declare-fun lt!224505 () Unit!14683)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32065 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14683)

(assert (=> b!495832 (= lt!224505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495833 () Bool)

(declare-fun res!298280 () Bool)

(assert (=> b!495833 (=> (not res!298280) (not e!290838))))

(assert (=> b!495833 (= res!298280 (and (= (size!15779 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15779 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15779 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495834 () Bool)

(assert (=> b!495834 (= e!290834 true)))

(assert (=> b!495834 (and (bvslt (x!46743 lt!224509) #b01111111111111111111111111111110) (or (= (select (arr!15415 a!3235) (index!17533 lt!224509)) (select (arr!15415 a!3235) j!176)) (= (select (arr!15415 a!3235) (index!17533 lt!224509)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15415 a!3235) (index!17533 lt!224509)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495835 () Bool)

(assert (=> b!495835 (= e!290838 e!290837)))

(declare-fun res!298277 () Bool)

(assert (=> b!495835 (=> (not res!298277) (not e!290837))))

(declare-fun lt!224508 () SeekEntryResult!3838)

(assert (=> b!495835 (= res!298277 (or (= lt!224508 (MissingZero!3838 i!1204)) (= lt!224508 (MissingVacant!3838 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32065 (_ BitVec 32)) SeekEntryResult!3838)

(assert (=> b!495835 (= lt!224508 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495836 () Bool)

(declare-fun res!298276 () Bool)

(assert (=> b!495836 (=> res!298276 e!290834)))

(get-info :version)

(assert (=> b!495836 (= res!298276 (or (undefined!4650 lt!224509) (not ((_ is Intermediate!3838) lt!224509))))))

(declare-fun b!495837 () Bool)

(declare-fun res!298274 () Bool)

(assert (=> b!495837 (=> (not res!298274) (not e!290838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495837 (= res!298274 (validKeyInArray!0 (select (arr!15415 a!3235) j!176)))))

(declare-fun b!495838 () Bool)

(assert (=> b!495838 (= e!290835 (= (seekEntryOrOpen!0 (select (arr!15415 a!3235) j!176) a!3235 mask!3524) (Found!3838 j!176)))))

(declare-fun b!495839 () Bool)

(declare-fun res!298273 () Bool)

(assert (=> b!495839 (=> (not res!298273) (not e!290838))))

(assert (=> b!495839 (= res!298273 (validKeyInArray!0 k0!2280))))

(declare-fun b!495840 () Bool)

(declare-fun res!298278 () Bool)

(assert (=> b!495840 (=> (not res!298278) (not e!290838))))

(declare-fun arrayContainsKey!0 (array!32065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495840 (= res!298278 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495841 () Bool)

(declare-fun res!298282 () Bool)

(assert (=> b!495841 (=> (not res!298282) (not e!290837))))

(declare-datatypes ((List!9480 0))(
  ( (Nil!9477) (Cons!9476 (h!10347 (_ BitVec 64)) (t!15700 List!9480)) )
))
(declare-fun arrayNoDuplicates!0 (array!32065 (_ BitVec 32) List!9480) Bool)

(assert (=> b!495841 (= res!298282 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9477))))

(assert (= (and start!45176 res!298279) b!495833))

(assert (= (and b!495833 res!298280) b!495837))

(assert (= (and b!495837 res!298274) b!495839))

(assert (= (and b!495839 res!298273) b!495840))

(assert (= (and b!495840 res!298278) b!495835))

(assert (= (and b!495835 res!298277) b!495831))

(assert (= (and b!495831 res!298281) b!495841))

(assert (= (and b!495841 res!298282) b!495832))

(assert (= (and b!495832 res!298275) b!495838))

(assert (= (and b!495832 (not res!298272)) b!495836))

(assert (= (and b!495836 (not res!298276)) b!495834))

(declare-fun m!477229 () Bool)

(assert (=> b!495835 m!477229))

(declare-fun m!477231 () Bool)

(assert (=> b!495831 m!477231))

(declare-fun m!477233 () Bool)

(assert (=> b!495837 m!477233))

(assert (=> b!495837 m!477233))

(declare-fun m!477235 () Bool)

(assert (=> b!495837 m!477235))

(assert (=> b!495838 m!477233))

(assert (=> b!495838 m!477233))

(declare-fun m!477237 () Bool)

(assert (=> b!495838 m!477237))

(declare-fun m!477239 () Bool)

(assert (=> b!495832 m!477239))

(declare-fun m!477241 () Bool)

(assert (=> b!495832 m!477241))

(declare-fun m!477243 () Bool)

(assert (=> b!495832 m!477243))

(assert (=> b!495832 m!477233))

(declare-fun m!477245 () Bool)

(assert (=> b!495832 m!477245))

(assert (=> b!495832 m!477233))

(declare-fun m!477247 () Bool)

(assert (=> b!495832 m!477247))

(assert (=> b!495832 m!477233))

(declare-fun m!477249 () Bool)

(assert (=> b!495832 m!477249))

(assert (=> b!495832 m!477243))

(declare-fun m!477251 () Bool)

(assert (=> b!495832 m!477251))

(assert (=> b!495832 m!477243))

(declare-fun m!477253 () Bool)

(assert (=> b!495832 m!477253))

(declare-fun m!477255 () Bool)

(assert (=> b!495834 m!477255))

(assert (=> b!495834 m!477233))

(declare-fun m!477257 () Bool)

(assert (=> b!495841 m!477257))

(declare-fun m!477259 () Bool)

(assert (=> start!45176 m!477259))

(declare-fun m!477261 () Bool)

(assert (=> start!45176 m!477261))

(declare-fun m!477263 () Bool)

(assert (=> b!495839 m!477263))

(declare-fun m!477265 () Bool)

(assert (=> b!495840 m!477265))

(check-sat (not b!495840) (not start!45176) (not b!495839) (not b!495831) (not b!495841) (not b!495832) (not b!495835) (not b!495837) (not b!495838))
(check-sat)
