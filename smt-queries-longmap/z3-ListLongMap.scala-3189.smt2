; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44750 () Bool)

(assert start!44750)

(declare-fun b!491300 () Bool)

(declare-fun res!294297 () Bool)

(declare-fun e!288684 () Bool)

(assert (=> b!491300 (=> (not res!294297) (not e!288684))))

(declare-datatypes ((array!31810 0))(
  ( (array!31811 (arr!15292 (Array (_ BitVec 32) (_ BitVec 64))) (size!15656 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31810)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491300 (= res!294297 (validKeyInArray!0 (select (arr!15292 a!3235) j!176)))))

(declare-fun b!491301 () Bool)

(declare-fun e!288683 () Bool)

(declare-fun e!288681 () Bool)

(assert (=> b!491301 (= e!288683 (not e!288681))))

(declare-fun res!294296 () Bool)

(assert (=> b!491301 (=> res!294296 e!288681)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!222113 () array!31810)

(declare-fun lt!222114 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3715 0))(
  ( (MissingZero!3715 (index!17039 (_ BitVec 32))) (Found!3715 (index!17040 (_ BitVec 32))) (Intermediate!3715 (undefined!4527 Bool) (index!17041 (_ BitVec 32)) (x!46274 (_ BitVec 32))) (Undefined!3715) (MissingVacant!3715 (index!17042 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31810 (_ BitVec 32)) SeekEntryResult!3715)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491301 (= res!294296 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15292 a!3235) j!176) mask!3524) (select (arr!15292 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222114 mask!3524) lt!222114 lt!222113 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491301 (= lt!222114 (select (store (arr!15292 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491301 (= lt!222113 (array!31811 (store (arr!15292 a!3235) i!1204 k0!2280) (size!15656 a!3235)))))

(declare-fun lt!222116 () SeekEntryResult!3715)

(assert (=> b!491301 (= lt!222116 (Found!3715 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31810 (_ BitVec 32)) SeekEntryResult!3715)

(assert (=> b!491301 (= lt!222116 (seekEntryOrOpen!0 (select (arr!15292 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31810 (_ BitVec 32)) Bool)

(assert (=> b!491301 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14437 0))(
  ( (Unit!14438) )
))
(declare-fun lt!222118 () Unit!14437)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14437)

(assert (=> b!491301 (= lt!222118 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491303 () Bool)

(declare-fun res!294293 () Bool)

(assert (=> b!491303 (=> (not res!294293) (not e!288684))))

(assert (=> b!491303 (= res!294293 (and (= (size!15656 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15656 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15656 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491304 () Bool)

(declare-fun res!294294 () Bool)

(assert (=> b!491304 (=> (not res!294294) (not e!288683))))

(declare-datatypes ((List!9357 0))(
  ( (Nil!9354) (Cons!9353 (h!10215 (_ BitVec 64)) (t!15577 List!9357)) )
))
(declare-fun arrayNoDuplicates!0 (array!31810 (_ BitVec 32) List!9357) Bool)

(assert (=> b!491304 (= res!294294 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9354))))

(declare-fun b!491305 () Bool)

(assert (=> b!491305 (= e!288681 true)))

(assert (=> b!491305 (= lt!222116 (seekEntryOrOpen!0 lt!222114 lt!222113 mask!3524))))

(declare-fun lt!222115 () Unit!14437)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31810 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14437)

(assert (=> b!491305 (= lt!222115 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491306 () Bool)

(declare-fun res!294292 () Bool)

(assert (=> b!491306 (=> (not res!294292) (not e!288684))))

(declare-fun arrayContainsKey!0 (array!31810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491306 (= res!294292 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491307 () Bool)

(declare-fun res!294298 () Bool)

(assert (=> b!491307 (=> (not res!294298) (not e!288684))))

(assert (=> b!491307 (= res!294298 (validKeyInArray!0 k0!2280))))

(declare-fun b!491308 () Bool)

(declare-fun res!294291 () Bool)

(assert (=> b!491308 (=> (not res!294291) (not e!288683))))

(assert (=> b!491308 (= res!294291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491302 () Bool)

(assert (=> b!491302 (= e!288684 e!288683)))

(declare-fun res!294295 () Bool)

(assert (=> b!491302 (=> (not res!294295) (not e!288683))))

(declare-fun lt!222117 () SeekEntryResult!3715)

(assert (=> b!491302 (= res!294295 (or (= lt!222117 (MissingZero!3715 i!1204)) (= lt!222117 (MissingVacant!3715 i!1204))))))

(assert (=> b!491302 (= lt!222117 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!294290 () Bool)

(assert (=> start!44750 (=> (not res!294290) (not e!288684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44750 (= res!294290 (validMask!0 mask!3524))))

(assert (=> start!44750 e!288684))

(assert (=> start!44750 true))

(declare-fun array_inv!11151 (array!31810) Bool)

(assert (=> start!44750 (array_inv!11151 a!3235)))

(assert (= (and start!44750 res!294290) b!491303))

(assert (= (and b!491303 res!294293) b!491300))

(assert (= (and b!491300 res!294297) b!491307))

(assert (= (and b!491307 res!294298) b!491306))

(assert (= (and b!491306 res!294292) b!491302))

(assert (= (and b!491302 res!294295) b!491308))

(assert (= (and b!491308 res!294291) b!491304))

(assert (= (and b!491304 res!294294) b!491301))

(assert (= (and b!491301 (not res!294296)) b!491305))

(declare-fun m!472087 () Bool)

(assert (=> b!491305 m!472087))

(declare-fun m!472089 () Bool)

(assert (=> b!491305 m!472089))

(declare-fun m!472091 () Bool)

(assert (=> b!491300 m!472091))

(assert (=> b!491300 m!472091))

(declare-fun m!472093 () Bool)

(assert (=> b!491300 m!472093))

(declare-fun m!472095 () Bool)

(assert (=> b!491301 m!472095))

(declare-fun m!472097 () Bool)

(assert (=> b!491301 m!472097))

(declare-fun m!472099 () Bool)

(assert (=> b!491301 m!472099))

(declare-fun m!472101 () Bool)

(assert (=> b!491301 m!472101))

(assert (=> b!491301 m!472091))

(declare-fun m!472103 () Bool)

(assert (=> b!491301 m!472103))

(declare-fun m!472105 () Bool)

(assert (=> b!491301 m!472105))

(assert (=> b!491301 m!472091))

(declare-fun m!472107 () Bool)

(assert (=> b!491301 m!472107))

(assert (=> b!491301 m!472091))

(declare-fun m!472109 () Bool)

(assert (=> b!491301 m!472109))

(assert (=> b!491301 m!472105))

(declare-fun m!472111 () Bool)

(assert (=> b!491301 m!472111))

(assert (=> b!491301 m!472091))

(assert (=> b!491301 m!472101))

(declare-fun m!472113 () Bool)

(assert (=> b!491304 m!472113))

(declare-fun m!472115 () Bool)

(assert (=> b!491306 m!472115))

(declare-fun m!472117 () Bool)

(assert (=> b!491307 m!472117))

(declare-fun m!472119 () Bool)

(assert (=> b!491308 m!472119))

(declare-fun m!472121 () Bool)

(assert (=> start!44750 m!472121))

(declare-fun m!472123 () Bool)

(assert (=> start!44750 m!472123))

(declare-fun m!472125 () Bool)

(assert (=> b!491302 m!472125))

(check-sat (not b!491302) (not b!491306) (not start!44750) (not b!491304) (not b!491308) (not b!491307) (not b!491301) (not b!491300) (not b!491305))
(check-sat)
