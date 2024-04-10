; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46730 () Bool)

(assert start!46730)

(declare-fun b!515908 () Bool)

(declare-fun res!315474 () Bool)

(declare-fun e!301162 () Bool)

(assert (=> b!515908 (=> (not res!315474) (not e!301162))))

(declare-datatypes ((array!33042 0))(
  ( (array!33043 (arr!15889 (Array (_ BitVec 32) (_ BitVec 64))) (size!16253 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33042)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515908 (= res!315474 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515909 () Bool)

(declare-fun res!315472 () Bool)

(declare-fun e!301160 () Bool)

(assert (=> b!515909 (=> res!315472 e!301160)))

(declare-datatypes ((SeekEntryResult!4356 0))(
  ( (MissingZero!4356 (index!19612 (_ BitVec 32))) (Found!4356 (index!19613 (_ BitVec 32))) (Intermediate!4356 (undefined!5168 Bool) (index!19614 (_ BitVec 32)) (x!48575 (_ BitVec 32))) (Undefined!4356) (MissingVacant!4356 (index!19615 (_ BitVec 32))) )
))
(declare-fun lt!236175 () SeekEntryResult!4356)

(get-info :version)

(assert (=> b!515909 (= res!315472 (or (undefined!5168 lt!236175) (not ((_ is Intermediate!4356) lt!236175))))))

(declare-fun b!515910 () Bool)

(assert (=> b!515910 (= e!301160 true)))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515910 (and (bvslt (x!48575 lt!236175) #b01111111111111111111111111111110) (or (= (select (arr!15889 a!3235) (index!19614 lt!236175)) (select (arr!15889 a!3235) j!176)) (= (select (arr!15889 a!3235) (index!19614 lt!236175)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15889 a!3235) (index!19614 lt!236175)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515911 () Bool)

(declare-fun res!315479 () Bool)

(assert (=> b!515911 (=> (not res!315479) (not e!301162))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515911 (= res!315479 (and (= (size!16253 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16253 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16253 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!315482 () Bool)

(assert (=> start!46730 (=> (not res!315482) (not e!301162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46730 (= res!315482 (validMask!0 mask!3524))))

(assert (=> start!46730 e!301162))

(assert (=> start!46730 true))

(declare-fun array_inv!11685 (array!33042) Bool)

(assert (=> start!46730 (array_inv!11685 a!3235)))

(declare-fun b!515912 () Bool)

(declare-fun res!315481 () Bool)

(assert (=> b!515912 (=> (not res!315481) (not e!301162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515912 (= res!315481 (validKeyInArray!0 (select (arr!15889 a!3235) j!176)))))

(declare-fun b!515913 () Bool)

(declare-fun e!301164 () Bool)

(assert (=> b!515913 (= e!301164 (not e!301160))))

(declare-fun res!315475 () Bool)

(assert (=> b!515913 (=> res!315475 e!301160)))

(declare-fun lt!236178 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33042 (_ BitVec 32)) SeekEntryResult!4356)

(assert (=> b!515913 (= res!315475 (= lt!236175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236178 (select (store (arr!15889 a!3235) i!1204 k0!2280) j!176) (array!33043 (store (arr!15889 a!3235) i!1204 k0!2280) (size!16253 a!3235)) mask!3524)))))

(declare-fun lt!236179 () (_ BitVec 32))

(assert (=> b!515913 (= lt!236175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236179 (select (arr!15889 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515913 (= lt!236178 (toIndex!0 (select (store (arr!15889 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515913 (= lt!236179 (toIndex!0 (select (arr!15889 a!3235) j!176) mask!3524))))

(declare-fun e!301163 () Bool)

(assert (=> b!515913 e!301163))

(declare-fun res!315476 () Bool)

(assert (=> b!515913 (=> (not res!315476) (not e!301163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33042 (_ BitVec 32)) Bool)

(assert (=> b!515913 (= res!315476 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15970 0))(
  ( (Unit!15971) )
))
(declare-fun lt!236177 () Unit!15970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15970)

(assert (=> b!515913 (= lt!236177 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515914 () Bool)

(declare-fun res!315478 () Bool)

(assert (=> b!515914 (=> (not res!315478) (not e!301164))))

(declare-datatypes ((List!10047 0))(
  ( (Nil!10044) (Cons!10043 (h!10941 (_ BitVec 64)) (t!16275 List!10047)) )
))
(declare-fun arrayNoDuplicates!0 (array!33042 (_ BitVec 32) List!10047) Bool)

(assert (=> b!515914 (= res!315478 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10044))))

(declare-fun b!515915 () Bool)

(declare-fun res!315477 () Bool)

(assert (=> b!515915 (=> (not res!315477) (not e!301162))))

(assert (=> b!515915 (= res!315477 (validKeyInArray!0 k0!2280))))

(declare-fun b!515916 () Bool)

(declare-fun res!315473 () Bool)

(assert (=> b!515916 (=> (not res!315473) (not e!301164))))

(assert (=> b!515916 (= res!315473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515917 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33042 (_ BitVec 32)) SeekEntryResult!4356)

(assert (=> b!515917 (= e!301163 (= (seekEntryOrOpen!0 (select (arr!15889 a!3235) j!176) a!3235 mask!3524) (Found!4356 j!176)))))

(declare-fun b!515918 () Bool)

(assert (=> b!515918 (= e!301162 e!301164)))

(declare-fun res!315480 () Bool)

(assert (=> b!515918 (=> (not res!315480) (not e!301164))))

(declare-fun lt!236176 () SeekEntryResult!4356)

(assert (=> b!515918 (= res!315480 (or (= lt!236176 (MissingZero!4356 i!1204)) (= lt!236176 (MissingVacant!4356 i!1204))))))

(assert (=> b!515918 (= lt!236176 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46730 res!315482) b!515911))

(assert (= (and b!515911 res!315479) b!515912))

(assert (= (and b!515912 res!315481) b!515915))

(assert (= (and b!515915 res!315477) b!515908))

(assert (= (and b!515908 res!315474) b!515918))

(assert (= (and b!515918 res!315480) b!515916))

(assert (= (and b!515916 res!315473) b!515914))

(assert (= (and b!515914 res!315478) b!515913))

(assert (= (and b!515913 res!315476) b!515917))

(assert (= (and b!515913 (not res!315475)) b!515909))

(assert (= (and b!515909 (not res!315472)) b!515910))

(declare-fun m!497315 () Bool)

(assert (=> b!515915 m!497315))

(declare-fun m!497317 () Bool)

(assert (=> start!46730 m!497317))

(declare-fun m!497319 () Bool)

(assert (=> start!46730 m!497319))

(declare-fun m!497321 () Bool)

(assert (=> b!515917 m!497321))

(assert (=> b!515917 m!497321))

(declare-fun m!497323 () Bool)

(assert (=> b!515917 m!497323))

(declare-fun m!497325 () Bool)

(assert (=> b!515908 m!497325))

(declare-fun m!497327 () Bool)

(assert (=> b!515910 m!497327))

(assert (=> b!515910 m!497321))

(declare-fun m!497329 () Bool)

(assert (=> b!515918 m!497329))

(assert (=> b!515912 m!497321))

(assert (=> b!515912 m!497321))

(declare-fun m!497331 () Bool)

(assert (=> b!515912 m!497331))

(declare-fun m!497333 () Bool)

(assert (=> b!515916 m!497333))

(declare-fun m!497335 () Bool)

(assert (=> b!515914 m!497335))

(assert (=> b!515913 m!497321))

(declare-fun m!497337 () Bool)

(assert (=> b!515913 m!497337))

(declare-fun m!497339 () Bool)

(assert (=> b!515913 m!497339))

(declare-fun m!497341 () Bool)

(assert (=> b!515913 m!497341))

(declare-fun m!497343 () Bool)

(assert (=> b!515913 m!497343))

(declare-fun m!497345 () Bool)

(assert (=> b!515913 m!497345))

(assert (=> b!515913 m!497339))

(assert (=> b!515913 m!497321))

(declare-fun m!497347 () Bool)

(assert (=> b!515913 m!497347))

(assert (=> b!515913 m!497321))

(declare-fun m!497349 () Bool)

(assert (=> b!515913 m!497349))

(assert (=> b!515913 m!497339))

(declare-fun m!497351 () Bool)

(assert (=> b!515913 m!497351))

(check-sat (not b!515918) (not b!515914) (not b!515916) (not start!46730) (not b!515912) (not b!515908) (not b!515913) (not b!515915) (not b!515917))
(check-sat)
