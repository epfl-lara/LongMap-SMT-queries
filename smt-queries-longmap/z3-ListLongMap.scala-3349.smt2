; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46076 () Bool)

(assert start!46076)

(declare-fun b!510398 () Bool)

(declare-fun res!311301 () Bool)

(declare-fun e!298336 () Bool)

(assert (=> b!510398 (=> (not res!311301) (not e!298336))))

(declare-datatypes ((array!32788 0))(
  ( (array!32789 (arr!15772 (Array (_ BitVec 32) (_ BitVec 64))) (size!16136 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32788)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510398 (= res!311301 (validKeyInArray!0 (select (arr!15772 a!3235) j!176)))))

(declare-fun b!510399 () Bool)

(declare-fun e!298335 () Bool)

(declare-fun e!298337 () Bool)

(assert (=> b!510399 (= e!298335 (not e!298337))))

(declare-fun res!311304 () Bool)

(assert (=> b!510399 (=> res!311304 e!298337)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!233409 () (_ BitVec 64))

(declare-fun lt!233408 () array!32788)

(declare-datatypes ((SeekEntryResult!4195 0))(
  ( (MissingZero!4195 (index!18968 (_ BitVec 32))) (Found!4195 (index!18969 (_ BitVec 32))) (Intermediate!4195 (undefined!5007 Bool) (index!18970 (_ BitVec 32)) (x!48073 (_ BitVec 32))) (Undefined!4195) (MissingVacant!4195 (index!18971 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32788 (_ BitVec 32)) SeekEntryResult!4195)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510399 (= res!311304 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15772 a!3235) j!176) mask!3524) (select (arr!15772 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233409 mask!3524) lt!233409 lt!233408 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510399 (= lt!233409 (select (store (arr!15772 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510399 (= lt!233408 (array!32789 (store (arr!15772 a!3235) i!1204 k0!2280) (size!16136 a!3235)))))

(declare-fun lt!233412 () SeekEntryResult!4195)

(assert (=> b!510399 (= lt!233412 (Found!4195 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32788 (_ BitVec 32)) SeekEntryResult!4195)

(assert (=> b!510399 (= lt!233412 (seekEntryOrOpen!0 (select (arr!15772 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32788 (_ BitVec 32)) Bool)

(assert (=> b!510399 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15709 0))(
  ( (Unit!15710) )
))
(declare-fun lt!233413 () Unit!15709)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15709)

(assert (=> b!510399 (= lt!233413 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510400 () Bool)

(assert (=> b!510400 (= e!298336 e!298335)))

(declare-fun res!311297 () Bool)

(assert (=> b!510400 (=> (not res!311297) (not e!298335))))

(declare-fun lt!233410 () SeekEntryResult!4195)

(assert (=> b!510400 (= res!311297 (or (= lt!233410 (MissingZero!4195 i!1204)) (= lt!233410 (MissingVacant!4195 i!1204))))))

(assert (=> b!510400 (= lt!233410 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510401 () Bool)

(declare-fun res!311303 () Bool)

(assert (=> b!510401 (=> (not res!311303) (not e!298336))))

(assert (=> b!510401 (= res!311303 (and (= (size!16136 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16136 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16136 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510402 () Bool)

(declare-fun res!311298 () Bool)

(assert (=> b!510402 (=> (not res!311298) (not e!298335))))

(declare-datatypes ((List!9837 0))(
  ( (Nil!9834) (Cons!9833 (h!10710 (_ BitVec 64)) (t!16057 List!9837)) )
))
(declare-fun arrayNoDuplicates!0 (array!32788 (_ BitVec 32) List!9837) Bool)

(assert (=> b!510402 (= res!311298 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9834))))

(declare-fun b!510403 () Bool)

(declare-fun res!311300 () Bool)

(assert (=> b!510403 (=> (not res!311300) (not e!298336))))

(assert (=> b!510403 (= res!311300 (validKeyInArray!0 k0!2280))))

(declare-fun b!510404 () Bool)

(declare-fun res!311299 () Bool)

(assert (=> b!510404 (=> (not res!311299) (not e!298335))))

(assert (=> b!510404 (= res!311299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510405 () Bool)

(declare-fun res!311302 () Bool)

(assert (=> b!510405 (=> (not res!311302) (not e!298336))))

(declare-fun arrayContainsKey!0 (array!32788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510405 (= res!311302 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311305 () Bool)

(assert (=> start!46076 (=> (not res!311305) (not e!298336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46076 (= res!311305 (validMask!0 mask!3524))))

(assert (=> start!46076 e!298336))

(assert (=> start!46076 true))

(declare-fun array_inv!11631 (array!32788) Bool)

(assert (=> start!46076 (array_inv!11631 a!3235)))

(declare-fun b!510406 () Bool)

(assert (=> b!510406 (= e!298337 true)))

(assert (=> b!510406 (= lt!233412 (seekEntryOrOpen!0 lt!233409 lt!233408 mask!3524))))

(declare-fun lt!233411 () Unit!15709)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32788 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15709)

(assert (=> b!510406 (= lt!233411 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!46076 res!311305) b!510401))

(assert (= (and b!510401 res!311303) b!510398))

(assert (= (and b!510398 res!311301) b!510403))

(assert (= (and b!510403 res!311300) b!510405))

(assert (= (and b!510405 res!311302) b!510400))

(assert (= (and b!510400 res!311297) b!510404))

(assert (= (and b!510404 res!311299) b!510402))

(assert (= (and b!510402 res!311298) b!510399))

(assert (= (and b!510399 (not res!311304)) b!510406))

(declare-fun m!491917 () Bool)

(assert (=> b!510400 m!491917))

(declare-fun m!491919 () Bool)

(assert (=> start!46076 m!491919))

(declare-fun m!491921 () Bool)

(assert (=> start!46076 m!491921))

(declare-fun m!491923 () Bool)

(assert (=> b!510403 m!491923))

(declare-fun m!491925 () Bool)

(assert (=> b!510405 m!491925))

(declare-fun m!491927 () Bool)

(assert (=> b!510406 m!491927))

(declare-fun m!491929 () Bool)

(assert (=> b!510406 m!491929))

(declare-fun m!491931 () Bool)

(assert (=> b!510398 m!491931))

(assert (=> b!510398 m!491931))

(declare-fun m!491933 () Bool)

(assert (=> b!510398 m!491933))

(declare-fun m!491935 () Bool)

(assert (=> b!510399 m!491935))

(declare-fun m!491937 () Bool)

(assert (=> b!510399 m!491937))

(declare-fun m!491939 () Bool)

(assert (=> b!510399 m!491939))

(declare-fun m!491941 () Bool)

(assert (=> b!510399 m!491941))

(assert (=> b!510399 m!491931))

(declare-fun m!491943 () Bool)

(assert (=> b!510399 m!491943))

(declare-fun m!491945 () Bool)

(assert (=> b!510399 m!491945))

(declare-fun m!491947 () Bool)

(assert (=> b!510399 m!491947))

(assert (=> b!510399 m!491931))

(assert (=> b!510399 m!491941))

(assert (=> b!510399 m!491931))

(declare-fun m!491949 () Bool)

(assert (=> b!510399 m!491949))

(assert (=> b!510399 m!491931))

(declare-fun m!491951 () Bool)

(assert (=> b!510399 m!491951))

(assert (=> b!510399 m!491945))

(declare-fun m!491953 () Bool)

(assert (=> b!510402 m!491953))

(declare-fun m!491955 () Bool)

(assert (=> b!510404 m!491955))

(check-sat (not b!510398) (not b!510405) (not b!510399) (not b!510404) (not b!510403) (not b!510406) (not b!510402) (not start!46076) (not b!510400))
(check-sat)
