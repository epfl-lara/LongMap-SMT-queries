; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44774 () Bool)

(assert start!44774)

(declare-fun b!491550 () Bool)

(declare-fun res!294493 () Bool)

(declare-fun e!288807 () Bool)

(assert (=> b!491550 (=> (not res!294493) (not e!288807))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491550 (= res!294493 (validKeyInArray!0 k0!2280))))

(declare-fun b!491551 () Bool)

(declare-fun res!294490 () Bool)

(declare-fun e!288806 () Bool)

(assert (=> b!491551 (=> (not res!294490) (not e!288806))))

(declare-datatypes ((array!31833 0))(
  ( (array!31834 (arr!15304 (Array (_ BitVec 32) (_ BitVec 64))) (size!15668 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31833)

(declare-datatypes ((List!9462 0))(
  ( (Nil!9459) (Cons!9458 (h!10320 (_ BitVec 64)) (t!15690 List!9462)) )
))
(declare-fun arrayNoDuplicates!0 (array!31833 (_ BitVec 32) List!9462) Bool)

(assert (=> b!491551 (= res!294490 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9459))))

(declare-fun b!491552 () Bool)

(assert (=> b!491552 (= e!288807 e!288806)))

(declare-fun res!294494 () Bool)

(assert (=> b!491552 (=> (not res!294494) (not e!288806))))

(declare-datatypes ((SeekEntryResult!3771 0))(
  ( (MissingZero!3771 (index!17263 (_ BitVec 32))) (Found!3771 (index!17264 (_ BitVec 32))) (Intermediate!3771 (undefined!4583 Bool) (index!17265 (_ BitVec 32)) (x!46349 (_ BitVec 32))) (Undefined!3771) (MissingVacant!3771 (index!17266 (_ BitVec 32))) )
))
(declare-fun lt!222231 () SeekEntryResult!3771)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491552 (= res!294494 (or (= lt!222231 (MissingZero!3771 i!1204)) (= lt!222231 (MissingVacant!3771 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31833 (_ BitVec 32)) SeekEntryResult!3771)

(assert (=> b!491552 (= lt!222231 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491553 () Bool)

(declare-fun e!288805 () Bool)

(assert (=> b!491553 (= e!288805 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!222229 () array!31833)

(declare-fun lt!222232 () SeekEntryResult!3771)

(declare-fun lt!222230 () (_ BitVec 64))

(assert (=> b!491553 (= lt!222232 (seekEntryOrOpen!0 lt!222230 lt!222229 mask!3524))))

(declare-datatypes ((Unit!14488 0))(
  ( (Unit!14489) )
))
(declare-fun lt!222228 () Unit!14488)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14488)

(assert (=> b!491553 (= lt!222228 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun res!294488 () Bool)

(assert (=> start!44774 (=> (not res!294488) (not e!288807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44774 (= res!294488 (validMask!0 mask!3524))))

(assert (=> start!44774 e!288807))

(assert (=> start!44774 true))

(declare-fun array_inv!11100 (array!31833) Bool)

(assert (=> start!44774 (array_inv!11100 a!3235)))

(declare-fun b!491554 () Bool)

(declare-fun res!294492 () Bool)

(assert (=> b!491554 (=> (not res!294492) (not e!288806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31833 (_ BitVec 32)) Bool)

(assert (=> b!491554 (= res!294492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491555 () Bool)

(assert (=> b!491555 (= e!288806 (not e!288805))))

(declare-fun res!294489 () Bool)

(assert (=> b!491555 (=> res!294489 e!288805)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31833 (_ BitVec 32)) SeekEntryResult!3771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491555 (= res!294489 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15304 a!3235) j!176) mask!3524) (select (arr!15304 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222230 mask!3524) lt!222230 lt!222229 mask!3524))))))

(assert (=> b!491555 (= lt!222230 (select (store (arr!15304 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491555 (= lt!222229 (array!31834 (store (arr!15304 a!3235) i!1204 k0!2280) (size!15668 a!3235)))))

(assert (=> b!491555 (= lt!222232 (Found!3771 j!176))))

(assert (=> b!491555 (= lt!222232 (seekEntryOrOpen!0 (select (arr!15304 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491555 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222227 () Unit!14488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14488)

(assert (=> b!491555 (= lt!222227 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491556 () Bool)

(declare-fun res!294486 () Bool)

(assert (=> b!491556 (=> (not res!294486) (not e!288807))))

(assert (=> b!491556 (= res!294486 (validKeyInArray!0 (select (arr!15304 a!3235) j!176)))))

(declare-fun b!491557 () Bool)

(declare-fun res!294491 () Bool)

(assert (=> b!491557 (=> (not res!294491) (not e!288807))))

(declare-fun arrayContainsKey!0 (array!31833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491557 (= res!294491 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491558 () Bool)

(declare-fun res!294487 () Bool)

(assert (=> b!491558 (=> (not res!294487) (not e!288807))))

(assert (=> b!491558 (= res!294487 (and (= (size!15668 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15668 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15668 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44774 res!294488) b!491558))

(assert (= (and b!491558 res!294487) b!491556))

(assert (= (and b!491556 res!294486) b!491550))

(assert (= (and b!491550 res!294493) b!491557))

(assert (= (and b!491557 res!294491) b!491552))

(assert (= (and b!491552 res!294494) b!491554))

(assert (= (and b!491554 res!294492) b!491551))

(assert (= (and b!491551 res!294490) b!491555))

(assert (= (and b!491555 (not res!294489)) b!491553))

(declare-fun m!472183 () Bool)

(assert (=> b!491553 m!472183))

(declare-fun m!472185 () Bool)

(assert (=> b!491553 m!472185))

(declare-fun m!472187 () Bool)

(assert (=> b!491554 m!472187))

(declare-fun m!472189 () Bool)

(assert (=> b!491550 m!472189))

(declare-fun m!472191 () Bool)

(assert (=> b!491556 m!472191))

(assert (=> b!491556 m!472191))

(declare-fun m!472193 () Bool)

(assert (=> b!491556 m!472193))

(declare-fun m!472195 () Bool)

(assert (=> b!491551 m!472195))

(declare-fun m!472197 () Bool)

(assert (=> b!491555 m!472197))

(declare-fun m!472199 () Bool)

(assert (=> b!491555 m!472199))

(declare-fun m!472201 () Bool)

(assert (=> b!491555 m!472201))

(assert (=> b!491555 m!472199))

(declare-fun m!472203 () Bool)

(assert (=> b!491555 m!472203))

(declare-fun m!472205 () Bool)

(assert (=> b!491555 m!472205))

(declare-fun m!472207 () Bool)

(assert (=> b!491555 m!472207))

(assert (=> b!491555 m!472191))

(declare-fun m!472209 () Bool)

(assert (=> b!491555 m!472209))

(assert (=> b!491555 m!472191))

(assert (=> b!491555 m!472207))

(assert (=> b!491555 m!472191))

(declare-fun m!472211 () Bool)

(assert (=> b!491555 m!472211))

(assert (=> b!491555 m!472191))

(declare-fun m!472213 () Bool)

(assert (=> b!491555 m!472213))

(declare-fun m!472215 () Bool)

(assert (=> b!491557 m!472215))

(declare-fun m!472217 () Bool)

(assert (=> start!44774 m!472217))

(declare-fun m!472219 () Bool)

(assert (=> start!44774 m!472219))

(declare-fun m!472221 () Bool)

(assert (=> b!491552 m!472221))

(check-sat (not b!491551) (not b!491555) (not b!491550) (not b!491552) (not b!491557) (not start!44774) (not b!491556) (not b!491553) (not b!491554))
(check-sat)
