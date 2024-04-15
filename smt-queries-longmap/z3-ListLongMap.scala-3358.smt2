; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46188 () Bool)

(assert start!46188)

(declare-fun b!511219 () Bool)

(declare-fun res!312031 () Bool)

(declare-fun e!298713 () Bool)

(assert (=> b!511219 (=> (not res!312031) (not e!298713))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511219 (= res!312031 (validKeyInArray!0 k0!2280))))

(declare-fun b!511220 () Bool)

(declare-fun res!312027 () Bool)

(declare-fun e!298710 () Bool)

(assert (=> b!511220 (=> res!312027 e!298710)))

(declare-datatypes ((SeekEntryResult!4267 0))(
  ( (MissingZero!4267 (index!19256 (_ BitVec 32))) (Found!4267 (index!19257 (_ BitVec 32))) (Intermediate!4267 (undefined!5079 Bool) (index!19258 (_ BitVec 32)) (x!48221 (_ BitVec 32))) (Undefined!4267) (MissingVacant!4267 (index!19259 (_ BitVec 32))) )
))
(declare-fun lt!233782 () SeekEntryResult!4267)

(get-info :version)

(assert (=> b!511220 (= res!312027 (or (not ((_ is Intermediate!4267) lt!233782)) (not (undefined!5079 lt!233782))))))

(declare-fun b!511221 () Bool)

(declare-fun res!312028 () Bool)

(assert (=> b!511221 (=> (not res!312028) (not e!298713))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32852 0))(
  ( (array!32853 (arr!15803 (Array (_ BitVec 32) (_ BitVec 64))) (size!16168 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32852)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511221 (= res!312028 (and (= (size!16168 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16168 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16168 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511222 () Bool)

(declare-fun res!312026 () Bool)

(assert (=> b!511222 (=> (not res!312026) (not e!298713))))

(declare-fun arrayContainsKey!0 (array!32852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511222 (= res!312026 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!312030 () Bool)

(assert (=> start!46188 (=> (not res!312030) (not e!298713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46188 (= res!312030 (validMask!0 mask!3524))))

(assert (=> start!46188 e!298713))

(assert (=> start!46188 true))

(declare-fun array_inv!11686 (array!32852) Bool)

(assert (=> start!46188 (array_inv!11686 a!3235)))

(declare-fun b!511223 () Bool)

(declare-fun res!312029 () Bool)

(assert (=> b!511223 (=> (not res!312029) (not e!298713))))

(assert (=> b!511223 (= res!312029 (validKeyInArray!0 (select (arr!15803 a!3235) j!176)))))

(declare-fun b!511224 () Bool)

(declare-fun res!312025 () Bool)

(declare-fun e!298712 () Bool)

(assert (=> b!511224 (=> (not res!312025) (not e!298712))))

(declare-datatypes ((List!10000 0))(
  ( (Nil!9997) (Cons!9996 (h!10876 (_ BitVec 64)) (t!16219 List!10000)) )
))
(declare-fun arrayNoDuplicates!0 (array!32852 (_ BitVec 32) List!10000) Bool)

(assert (=> b!511224 (= res!312025 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9997))))

(declare-fun b!511225 () Bool)

(declare-fun res!312024 () Bool)

(assert (=> b!511225 (=> (not res!312024) (not e!298712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32852 (_ BitVec 32)) Bool)

(assert (=> b!511225 (= res!312024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511226 () Bool)

(assert (=> b!511226 (= e!298712 (not e!298710))))

(declare-fun res!312032 () Bool)

(assert (=> b!511226 (=> res!312032 e!298710)))

(declare-fun lt!233779 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32852 (_ BitVec 32)) SeekEntryResult!4267)

(assert (=> b!511226 (= res!312032 (= lt!233782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233779 (select (store (arr!15803 a!3235) i!1204 k0!2280) j!176) (array!32853 (store (arr!15803 a!3235) i!1204 k0!2280) (size!16168 a!3235)) mask!3524)))))

(declare-fun lt!233781 () (_ BitVec 32))

(assert (=> b!511226 (= lt!233782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233781 (select (arr!15803 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511226 (= lt!233779 (toIndex!0 (select (store (arr!15803 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511226 (= lt!233781 (toIndex!0 (select (arr!15803 a!3235) j!176) mask!3524))))

(declare-fun lt!233780 () SeekEntryResult!4267)

(assert (=> b!511226 (= lt!233780 (Found!4267 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32852 (_ BitVec 32)) SeekEntryResult!4267)

(assert (=> b!511226 (= lt!233780 (seekEntryOrOpen!0 (select (arr!15803 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511226 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15778 0))(
  ( (Unit!15779) )
))
(declare-fun lt!233777 () Unit!15778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15778)

(assert (=> b!511226 (= lt!233777 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511227 () Bool)

(assert (=> b!511227 (= e!298710 true)))

(assert (=> b!511227 (= lt!233780 Undefined!4267)))

(declare-fun b!511228 () Bool)

(assert (=> b!511228 (= e!298713 e!298712)))

(declare-fun res!312023 () Bool)

(assert (=> b!511228 (=> (not res!312023) (not e!298712))))

(declare-fun lt!233778 () SeekEntryResult!4267)

(assert (=> b!511228 (= res!312023 (or (= lt!233778 (MissingZero!4267 i!1204)) (= lt!233778 (MissingVacant!4267 i!1204))))))

(assert (=> b!511228 (= lt!233778 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46188 res!312030) b!511221))

(assert (= (and b!511221 res!312028) b!511223))

(assert (= (and b!511223 res!312029) b!511219))

(assert (= (and b!511219 res!312031) b!511222))

(assert (= (and b!511222 res!312026) b!511228))

(assert (= (and b!511228 res!312023) b!511225))

(assert (= (and b!511225 res!312024) b!511224))

(assert (= (and b!511224 res!312025) b!511226))

(assert (= (and b!511226 (not res!312032)) b!511220))

(assert (= (and b!511220 (not res!312027)) b!511227))

(declare-fun m!492205 () Bool)

(assert (=> b!511223 m!492205))

(assert (=> b!511223 m!492205))

(declare-fun m!492207 () Bool)

(assert (=> b!511223 m!492207))

(declare-fun m!492209 () Bool)

(assert (=> b!511228 m!492209))

(declare-fun m!492211 () Bool)

(assert (=> start!46188 m!492211))

(declare-fun m!492213 () Bool)

(assert (=> start!46188 m!492213))

(declare-fun m!492215 () Bool)

(assert (=> b!511224 m!492215))

(declare-fun m!492217 () Bool)

(assert (=> b!511225 m!492217))

(declare-fun m!492219 () Bool)

(assert (=> b!511226 m!492219))

(declare-fun m!492221 () Bool)

(assert (=> b!511226 m!492221))

(declare-fun m!492223 () Bool)

(assert (=> b!511226 m!492223))

(declare-fun m!492225 () Bool)

(assert (=> b!511226 m!492225))

(assert (=> b!511226 m!492219))

(assert (=> b!511226 m!492205))

(declare-fun m!492227 () Bool)

(assert (=> b!511226 m!492227))

(assert (=> b!511226 m!492205))

(declare-fun m!492229 () Bool)

(assert (=> b!511226 m!492229))

(assert (=> b!511226 m!492205))

(declare-fun m!492231 () Bool)

(assert (=> b!511226 m!492231))

(assert (=> b!511226 m!492219))

(declare-fun m!492233 () Bool)

(assert (=> b!511226 m!492233))

(assert (=> b!511226 m!492205))

(declare-fun m!492235 () Bool)

(assert (=> b!511226 m!492235))

(declare-fun m!492237 () Bool)

(assert (=> b!511222 m!492237))

(declare-fun m!492239 () Bool)

(assert (=> b!511219 m!492239))

(check-sat (not b!511223) (not b!511219) (not b!511224) (not b!511226) (not b!511225) (not b!511222) (not start!46188) (not b!511228))
(check-sat)
