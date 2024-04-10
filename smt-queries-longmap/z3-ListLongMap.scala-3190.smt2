; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44768 () Bool)

(assert start!44768)

(declare-fun b!491469 () Bool)

(declare-fun res!294405 () Bool)

(declare-fun e!288768 () Bool)

(assert (=> b!491469 (=> (not res!294405) (not e!288768))))

(declare-datatypes ((array!31827 0))(
  ( (array!31828 (arr!15301 (Array (_ BitVec 32) (_ BitVec 64))) (size!15665 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31827)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491469 (= res!294405 (validKeyInArray!0 (select (arr!15301 a!3235) j!176)))))

(declare-fun b!491470 () Bool)

(declare-fun res!294413 () Bool)

(assert (=> b!491470 (=> (not res!294413) (not e!288768))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!491470 (= res!294413 (validKeyInArray!0 k0!2280))))

(declare-fun b!491471 () Bool)

(declare-fun res!294410 () Bool)

(assert (=> b!491471 (=> (not res!294410) (not e!288768))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491471 (= res!294410 (and (= (size!15665 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15665 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15665 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491472 () Bool)

(declare-fun res!294412 () Bool)

(declare-fun e!288771 () Bool)

(assert (=> b!491472 (=> (not res!294412) (not e!288771))))

(declare-datatypes ((List!9459 0))(
  ( (Nil!9456) (Cons!9455 (h!10317 (_ BitVec 64)) (t!15687 List!9459)) )
))
(declare-fun arrayNoDuplicates!0 (array!31827 (_ BitVec 32) List!9459) Bool)

(assert (=> b!491472 (= res!294412 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9456))))

(declare-fun b!491474 () Bool)

(assert (=> b!491474 (= e!288768 e!288771)))

(declare-fun res!294411 () Bool)

(assert (=> b!491474 (=> (not res!294411) (not e!288771))))

(declare-datatypes ((SeekEntryResult!3768 0))(
  ( (MissingZero!3768 (index!17251 (_ BitVec 32))) (Found!3768 (index!17252 (_ BitVec 32))) (Intermediate!3768 (undefined!4580 Bool) (index!17253 (_ BitVec 32)) (x!46338 (_ BitVec 32))) (Undefined!3768) (MissingVacant!3768 (index!17254 (_ BitVec 32))) )
))
(declare-fun lt!222178 () SeekEntryResult!3768)

(assert (=> b!491474 (= res!294411 (or (= lt!222178 (MissingZero!3768 i!1204)) (= lt!222178 (MissingVacant!3768 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31827 (_ BitVec 32)) SeekEntryResult!3768)

(assert (=> b!491474 (= lt!222178 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491475 () Bool)

(declare-fun e!288769 () Bool)

(assert (=> b!491475 (= e!288771 (not e!288769))))

(declare-fun res!294407 () Bool)

(assert (=> b!491475 (=> res!294407 e!288769)))

(declare-fun lt!222176 () array!31827)

(declare-fun lt!222177 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31827 (_ BitVec 32)) SeekEntryResult!3768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491475 (= res!294407 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15301 a!3235) j!176) mask!3524) (select (arr!15301 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222177 mask!3524) lt!222177 lt!222176 mask!3524))))))

(assert (=> b!491475 (= lt!222177 (select (store (arr!15301 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491475 (= lt!222176 (array!31828 (store (arr!15301 a!3235) i!1204 k0!2280) (size!15665 a!3235)))))

(declare-fun lt!222175 () SeekEntryResult!3768)

(assert (=> b!491475 (= lt!222175 (Found!3768 j!176))))

(assert (=> b!491475 (= lt!222175 (seekEntryOrOpen!0 (select (arr!15301 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31827 (_ BitVec 32)) Bool)

(assert (=> b!491475 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14482 0))(
  ( (Unit!14483) )
))
(declare-fun lt!222174 () Unit!14482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14482)

(assert (=> b!491475 (= lt!222174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491476 () Bool)

(declare-fun res!294409 () Bool)

(assert (=> b!491476 (=> (not res!294409) (not e!288771))))

(assert (=> b!491476 (= res!294409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491477 () Bool)

(declare-fun res!294406 () Bool)

(assert (=> b!491477 (=> (not res!294406) (not e!288768))))

(declare-fun arrayContainsKey!0 (array!31827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491477 (= res!294406 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!294408 () Bool)

(assert (=> start!44768 (=> (not res!294408) (not e!288768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44768 (= res!294408 (validMask!0 mask!3524))))

(assert (=> start!44768 e!288768))

(assert (=> start!44768 true))

(declare-fun array_inv!11097 (array!31827) Bool)

(assert (=> start!44768 (array_inv!11097 a!3235)))

(declare-fun b!491473 () Bool)

(assert (=> b!491473 (= e!288769 true)))

(assert (=> b!491473 (= lt!222175 (seekEntryOrOpen!0 lt!222177 lt!222176 mask!3524))))

(declare-fun lt!222173 () Unit!14482)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31827 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14482)

(assert (=> b!491473 (= lt!222173 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!44768 res!294408) b!491471))

(assert (= (and b!491471 res!294410) b!491469))

(assert (= (and b!491469 res!294405) b!491470))

(assert (= (and b!491470 res!294413) b!491477))

(assert (= (and b!491477 res!294406) b!491474))

(assert (= (and b!491474 res!294411) b!491476))

(assert (= (and b!491476 res!294409) b!491472))

(assert (= (and b!491472 res!294412) b!491475))

(assert (= (and b!491475 (not res!294407)) b!491473))

(declare-fun m!472063 () Bool)

(assert (=> b!491475 m!472063))

(declare-fun m!472065 () Bool)

(assert (=> b!491475 m!472065))

(declare-fun m!472067 () Bool)

(assert (=> b!491475 m!472067))

(declare-fun m!472069 () Bool)

(assert (=> b!491475 m!472069))

(declare-fun m!472071 () Bool)

(assert (=> b!491475 m!472071))

(declare-fun m!472073 () Bool)

(assert (=> b!491475 m!472073))

(declare-fun m!472075 () Bool)

(assert (=> b!491475 m!472075))

(assert (=> b!491475 m!472073))

(declare-fun m!472077 () Bool)

(assert (=> b!491475 m!472077))

(assert (=> b!491475 m!472073))

(declare-fun m!472079 () Bool)

(assert (=> b!491475 m!472079))

(assert (=> b!491475 m!472075))

(assert (=> b!491475 m!472073))

(declare-fun m!472081 () Bool)

(assert (=> b!491475 m!472081))

(assert (=> b!491475 m!472069))

(assert (=> b!491469 m!472073))

(assert (=> b!491469 m!472073))

(declare-fun m!472083 () Bool)

(assert (=> b!491469 m!472083))

(declare-fun m!472085 () Bool)

(assert (=> b!491473 m!472085))

(declare-fun m!472087 () Bool)

(assert (=> b!491473 m!472087))

(declare-fun m!472089 () Bool)

(assert (=> b!491476 m!472089))

(declare-fun m!472091 () Bool)

(assert (=> b!491472 m!472091))

(declare-fun m!472093 () Bool)

(assert (=> b!491477 m!472093))

(declare-fun m!472095 () Bool)

(assert (=> b!491474 m!472095))

(declare-fun m!472097 () Bool)

(assert (=> start!44768 m!472097))

(declare-fun m!472099 () Bool)

(assert (=> start!44768 m!472099))

(declare-fun m!472101 () Bool)

(assert (=> b!491470 m!472101))

(check-sat (not b!491477) (not b!491473) (not start!44768) (not b!491472) (not b!491469) (not b!491476) (not b!491470) (not b!491474) (not b!491475))
(check-sat)
