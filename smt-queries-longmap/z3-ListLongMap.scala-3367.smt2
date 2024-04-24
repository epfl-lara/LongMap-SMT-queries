; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46244 () Bool)

(assert start!46244)

(declare-fun b!512239 () Bool)

(declare-fun e!299169 () Bool)

(assert (=> b!512239 (= e!299169 true)))

(declare-datatypes ((SeekEntryResult!4249 0))(
  ( (MissingZero!4249 (index!19184 (_ BitVec 32))) (Found!4249 (index!19185 (_ BitVec 32))) (Intermediate!4249 (undefined!5061 Bool) (index!19186 (_ BitVec 32)) (x!48277 (_ BitVec 32))) (Undefined!4249) (MissingVacant!4249 (index!19187 (_ BitVec 32))) )
))
(declare-fun lt!234509 () SeekEntryResult!4249)

(assert (=> b!512239 (= lt!234509 Undefined!4249)))

(declare-fun b!512240 () Bool)

(declare-fun res!312964 () Bool)

(declare-fun e!299171 () Bool)

(assert (=> b!512240 (=> (not res!312964) (not e!299171))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512240 (= res!312964 (validKeyInArray!0 k0!2280))))

(declare-fun b!512241 () Bool)

(declare-fun res!312957 () Bool)

(declare-fun e!299172 () Bool)

(assert (=> b!512241 (=> (not res!312957) (not e!299172))))

(declare-datatypes ((array!32899 0))(
  ( (array!32900 (arr!15826 (Array (_ BitVec 32) (_ BitVec 64))) (size!16190 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32899)

(declare-datatypes ((List!9891 0))(
  ( (Nil!9888) (Cons!9887 (h!10767 (_ BitVec 64)) (t!16111 List!9891)) )
))
(declare-fun arrayNoDuplicates!0 (array!32899 (_ BitVec 32) List!9891) Bool)

(assert (=> b!512241 (= res!312957 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9888))))

(declare-fun b!512242 () Bool)

(declare-fun res!312960 () Bool)

(assert (=> b!512242 (=> (not res!312960) (not e!299172))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32899 (_ BitVec 32)) Bool)

(assert (=> b!512242 (= res!312960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512243 () Bool)

(declare-fun res!312958 () Bool)

(assert (=> b!512243 (=> res!312958 e!299169)))

(declare-fun lt!234510 () SeekEntryResult!4249)

(get-info :version)

(assert (=> b!512243 (= res!312958 (or (not ((_ is Intermediate!4249) lt!234510)) (not (undefined!5061 lt!234510))))))

(declare-fun b!512244 () Bool)

(assert (=> b!512244 (= e!299172 (not e!299169))))

(declare-fun res!312963 () Bool)

(assert (=> b!512244 (=> res!312963 e!299169)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234514 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32899 (_ BitVec 32)) SeekEntryResult!4249)

(assert (=> b!512244 (= res!312963 (= lt!234510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234514 (select (store (arr!15826 a!3235) i!1204 k0!2280) j!176) (array!32900 (store (arr!15826 a!3235) i!1204 k0!2280) (size!16190 a!3235)) mask!3524)))))

(declare-fun lt!234512 () (_ BitVec 32))

(assert (=> b!512244 (= lt!234510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234512 (select (arr!15826 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512244 (= lt!234514 (toIndex!0 (select (store (arr!15826 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512244 (= lt!234512 (toIndex!0 (select (arr!15826 a!3235) j!176) mask!3524))))

(assert (=> b!512244 (= lt!234509 (Found!4249 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32899 (_ BitVec 32)) SeekEntryResult!4249)

(assert (=> b!512244 (= lt!234509 (seekEntryOrOpen!0 (select (arr!15826 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512244 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15817 0))(
  ( (Unit!15818) )
))
(declare-fun lt!234513 () Unit!15817)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32899 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15817)

(assert (=> b!512244 (= lt!234513 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!312959 () Bool)

(assert (=> start!46244 (=> (not res!312959) (not e!299171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46244 (= res!312959 (validMask!0 mask!3524))))

(assert (=> start!46244 e!299171))

(assert (=> start!46244 true))

(declare-fun array_inv!11685 (array!32899) Bool)

(assert (=> start!46244 (array_inv!11685 a!3235)))

(declare-fun b!512245 () Bool)

(assert (=> b!512245 (= e!299171 e!299172)))

(declare-fun res!312962 () Bool)

(assert (=> b!512245 (=> (not res!312962) (not e!299172))))

(declare-fun lt!234511 () SeekEntryResult!4249)

(assert (=> b!512245 (= res!312962 (or (= lt!234511 (MissingZero!4249 i!1204)) (= lt!234511 (MissingVacant!4249 i!1204))))))

(assert (=> b!512245 (= lt!234511 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512246 () Bool)

(declare-fun res!312955 () Bool)

(assert (=> b!512246 (=> (not res!312955) (not e!299171))))

(declare-fun arrayContainsKey!0 (array!32899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512246 (= res!312955 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512247 () Bool)

(declare-fun res!312956 () Bool)

(assert (=> b!512247 (=> (not res!312956) (not e!299171))))

(assert (=> b!512247 (= res!312956 (and (= (size!16190 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16190 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16190 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512248 () Bool)

(declare-fun res!312961 () Bool)

(assert (=> b!512248 (=> (not res!312961) (not e!299171))))

(assert (=> b!512248 (= res!312961 (validKeyInArray!0 (select (arr!15826 a!3235) j!176)))))

(assert (= (and start!46244 res!312959) b!512247))

(assert (= (and b!512247 res!312956) b!512248))

(assert (= (and b!512248 res!312961) b!512240))

(assert (= (and b!512240 res!312964) b!512246))

(assert (= (and b!512246 res!312955) b!512245))

(assert (= (and b!512245 res!312962) b!512242))

(assert (= (and b!512242 res!312960) b!512241))

(assert (= (and b!512241 res!312957) b!512244))

(assert (= (and b!512244 (not res!312963)) b!512243))

(assert (= (and b!512243 (not res!312958)) b!512239))

(declare-fun m!494113 () Bool)

(assert (=> b!512248 m!494113))

(assert (=> b!512248 m!494113))

(declare-fun m!494115 () Bool)

(assert (=> b!512248 m!494115))

(declare-fun m!494117 () Bool)

(assert (=> b!512241 m!494117))

(declare-fun m!494119 () Bool)

(assert (=> b!512245 m!494119))

(declare-fun m!494121 () Bool)

(assert (=> b!512246 m!494121))

(declare-fun m!494123 () Bool)

(assert (=> start!46244 m!494123))

(declare-fun m!494125 () Bool)

(assert (=> start!46244 m!494125))

(declare-fun m!494127 () Bool)

(assert (=> b!512242 m!494127))

(declare-fun m!494129 () Bool)

(assert (=> b!512244 m!494129))

(declare-fun m!494131 () Bool)

(assert (=> b!512244 m!494131))

(declare-fun m!494133 () Bool)

(assert (=> b!512244 m!494133))

(assert (=> b!512244 m!494133))

(declare-fun m!494135 () Bool)

(assert (=> b!512244 m!494135))

(assert (=> b!512244 m!494113))

(declare-fun m!494137 () Bool)

(assert (=> b!512244 m!494137))

(assert (=> b!512244 m!494113))

(declare-fun m!494139 () Bool)

(assert (=> b!512244 m!494139))

(assert (=> b!512244 m!494133))

(declare-fun m!494141 () Bool)

(assert (=> b!512244 m!494141))

(assert (=> b!512244 m!494113))

(declare-fun m!494143 () Bool)

(assert (=> b!512244 m!494143))

(assert (=> b!512244 m!494113))

(declare-fun m!494145 () Bool)

(assert (=> b!512244 m!494145))

(declare-fun m!494147 () Bool)

(assert (=> b!512240 m!494147))

(check-sat (not b!512240) (not start!46244) (not b!512242) (not b!512246) (not b!512245) (not b!512241) (not b!512248) (not b!512244))
(check-sat)
