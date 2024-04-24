; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46250 () Bool)

(assert start!46250)

(declare-fun b!512329 () Bool)

(declare-fun res!313054 () Bool)

(declare-fun e!299207 () Bool)

(assert (=> b!512329 (=> (not res!313054) (not e!299207))))

(declare-datatypes ((array!32905 0))(
  ( (array!32906 (arr!15829 (Array (_ BitVec 32) (_ BitVec 64))) (size!16193 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32905)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32905 (_ BitVec 32)) Bool)

(assert (=> b!512329 (= res!313054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512330 () Bool)

(declare-fun res!313047 () Bool)

(declare-fun e!299206 () Bool)

(assert (=> b!512330 (=> (not res!313047) (not e!299206))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512330 (= res!313047 (and (= (size!16193 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16193 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16193 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512331 () Bool)

(declare-fun res!313051 () Bool)

(assert (=> b!512331 (=> (not res!313051) (not e!299207))))

(declare-datatypes ((List!9894 0))(
  ( (Nil!9891) (Cons!9890 (h!10770 (_ BitVec 64)) (t!16114 List!9894)) )
))
(declare-fun arrayNoDuplicates!0 (array!32905 (_ BitVec 32) List!9894) Bool)

(assert (=> b!512331 (= res!313051 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9891))))

(declare-fun b!512332 () Bool)

(declare-fun res!313048 () Bool)

(assert (=> b!512332 (=> (not res!313048) (not e!299206))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512332 (= res!313048 (validKeyInArray!0 k0!2280))))

(declare-fun b!512333 () Bool)

(assert (=> b!512333 (= e!299206 e!299207)))

(declare-fun res!313050 () Bool)

(assert (=> b!512333 (=> (not res!313050) (not e!299207))))

(declare-datatypes ((SeekEntryResult!4252 0))(
  ( (MissingZero!4252 (index!19196 (_ BitVec 32))) (Found!4252 (index!19197 (_ BitVec 32))) (Intermediate!4252 (undefined!5064 Bool) (index!19198 (_ BitVec 32)) (x!48288 (_ BitVec 32))) (Undefined!4252) (MissingVacant!4252 (index!19199 (_ BitVec 32))) )
))
(declare-fun lt!234566 () SeekEntryResult!4252)

(assert (=> b!512333 (= res!313050 (or (= lt!234566 (MissingZero!4252 i!1204)) (= lt!234566 (MissingVacant!4252 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32905 (_ BitVec 32)) SeekEntryResult!4252)

(assert (=> b!512333 (= lt!234566 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512334 () Bool)

(declare-fun e!299205 () Bool)

(assert (=> b!512334 (= e!299205 true)))

(declare-fun lt!234567 () SeekEntryResult!4252)

(assert (=> b!512334 (= lt!234567 Undefined!4252)))

(declare-fun b!512335 () Bool)

(declare-fun res!313049 () Bool)

(assert (=> b!512335 (=> res!313049 e!299205)))

(declare-fun lt!234564 () SeekEntryResult!4252)

(get-info :version)

(assert (=> b!512335 (= res!313049 (or (not ((_ is Intermediate!4252) lt!234564)) (not (undefined!5064 lt!234564))))))

(declare-fun res!313052 () Bool)

(assert (=> start!46250 (=> (not res!313052) (not e!299206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46250 (= res!313052 (validMask!0 mask!3524))))

(assert (=> start!46250 e!299206))

(assert (=> start!46250 true))

(declare-fun array_inv!11688 (array!32905) Bool)

(assert (=> start!46250 (array_inv!11688 a!3235)))

(declare-fun b!512336 () Bool)

(declare-fun res!313046 () Bool)

(assert (=> b!512336 (=> (not res!313046) (not e!299206))))

(declare-fun arrayContainsKey!0 (array!32905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512336 (= res!313046 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512337 () Bool)

(assert (=> b!512337 (= e!299207 (not e!299205))))

(declare-fun res!313045 () Bool)

(assert (=> b!512337 (=> res!313045 e!299205)))

(declare-fun lt!234563 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32905 (_ BitVec 32)) SeekEntryResult!4252)

(assert (=> b!512337 (= res!313045 (= lt!234564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234563 (select (store (arr!15829 a!3235) i!1204 k0!2280) j!176) (array!32906 (store (arr!15829 a!3235) i!1204 k0!2280) (size!16193 a!3235)) mask!3524)))))

(declare-fun lt!234568 () (_ BitVec 32))

(assert (=> b!512337 (= lt!234564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234568 (select (arr!15829 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512337 (= lt!234563 (toIndex!0 (select (store (arr!15829 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512337 (= lt!234568 (toIndex!0 (select (arr!15829 a!3235) j!176) mask!3524))))

(assert (=> b!512337 (= lt!234567 (Found!4252 j!176))))

(assert (=> b!512337 (= lt!234567 (seekEntryOrOpen!0 (select (arr!15829 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512337 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15823 0))(
  ( (Unit!15824) )
))
(declare-fun lt!234565 () Unit!15823)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15823)

(assert (=> b!512337 (= lt!234565 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512338 () Bool)

(declare-fun res!313053 () Bool)

(assert (=> b!512338 (=> (not res!313053) (not e!299206))))

(assert (=> b!512338 (= res!313053 (validKeyInArray!0 (select (arr!15829 a!3235) j!176)))))

(assert (= (and start!46250 res!313052) b!512330))

(assert (= (and b!512330 res!313047) b!512338))

(assert (= (and b!512338 res!313053) b!512332))

(assert (= (and b!512332 res!313048) b!512336))

(assert (= (and b!512336 res!313046) b!512333))

(assert (= (and b!512333 res!313050) b!512329))

(assert (= (and b!512329 res!313054) b!512331))

(assert (= (and b!512331 res!313051) b!512337))

(assert (= (and b!512337 (not res!313045)) b!512335))

(assert (= (and b!512335 (not res!313049)) b!512334))

(declare-fun m!494221 () Bool)

(assert (=> b!512337 m!494221))

(declare-fun m!494223 () Bool)

(assert (=> b!512337 m!494223))

(declare-fun m!494225 () Bool)

(assert (=> b!512337 m!494225))

(declare-fun m!494227 () Bool)

(assert (=> b!512337 m!494227))

(declare-fun m!494229 () Bool)

(assert (=> b!512337 m!494229))

(assert (=> b!512337 m!494227))

(declare-fun m!494231 () Bool)

(assert (=> b!512337 m!494231))

(declare-fun m!494233 () Bool)

(assert (=> b!512337 m!494233))

(assert (=> b!512337 m!494227))

(declare-fun m!494235 () Bool)

(assert (=> b!512337 m!494235))

(assert (=> b!512337 m!494225))

(declare-fun m!494237 () Bool)

(assert (=> b!512337 m!494237))

(assert (=> b!512337 m!494225))

(declare-fun m!494239 () Bool)

(assert (=> b!512337 m!494239))

(assert (=> b!512337 m!494227))

(declare-fun m!494241 () Bool)

(assert (=> start!46250 m!494241))

(declare-fun m!494243 () Bool)

(assert (=> start!46250 m!494243))

(declare-fun m!494245 () Bool)

(assert (=> b!512333 m!494245))

(assert (=> b!512338 m!494227))

(assert (=> b!512338 m!494227))

(declare-fun m!494247 () Bool)

(assert (=> b!512338 m!494247))

(declare-fun m!494249 () Bool)

(assert (=> b!512336 m!494249))

(declare-fun m!494251 () Bool)

(assert (=> b!512329 m!494251))

(declare-fun m!494253 () Bool)

(assert (=> b!512332 m!494253))

(declare-fun m!494255 () Bool)

(assert (=> b!512331 m!494255))

(check-sat (not b!512336) (not b!512338) (not start!46250) (not b!512329) (not b!512333) (not b!512337) (not b!512332) (not b!512331))
(check-sat)
