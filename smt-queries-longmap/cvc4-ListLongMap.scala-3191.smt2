; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44776 () Bool)

(assert start!44776)

(declare-fun b!491577 () Bool)

(declare-fun res!294513 () Bool)

(declare-fun e!288818 () Bool)

(assert (=> b!491577 (=> (not res!294513) (not e!288818))))

(declare-datatypes ((array!31835 0))(
  ( (array!31836 (arr!15305 (Array (_ BitVec 32) (_ BitVec 64))) (size!15669 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31835)

(declare-datatypes ((List!9463 0))(
  ( (Nil!9460) (Cons!9459 (h!10321 (_ BitVec 64)) (t!15691 List!9463)) )
))
(declare-fun arrayNoDuplicates!0 (array!31835 (_ BitVec 32) List!9463) Bool)

(assert (=> b!491577 (= res!294513 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9460))))

(declare-fun b!491578 () Bool)

(declare-fun res!294516 () Bool)

(declare-fun e!288817 () Bool)

(assert (=> b!491578 (=> (not res!294516) (not e!288817))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491578 (= res!294516 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491579 () Bool)

(declare-fun res!294514 () Bool)

(assert (=> b!491579 (=> (not res!294514) (not e!288817))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491579 (= res!294514 (validKeyInArray!0 (select (arr!15305 a!3235) j!176)))))

(declare-fun b!491580 () Bool)

(declare-fun res!294519 () Bool)

(assert (=> b!491580 (=> (not res!294519) (not e!288818))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31835 (_ BitVec 32)) Bool)

(assert (=> b!491580 (= res!294519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491582 () Bool)

(assert (=> b!491582 (= e!288817 e!288818)))

(declare-fun res!294518 () Bool)

(assert (=> b!491582 (=> (not res!294518) (not e!288818))))

(declare-datatypes ((SeekEntryResult!3772 0))(
  ( (MissingZero!3772 (index!17267 (_ BitVec 32))) (Found!3772 (index!17268 (_ BitVec 32))) (Intermediate!3772 (undefined!4584 Bool) (index!17269 (_ BitVec 32)) (x!46350 (_ BitVec 32))) (Undefined!3772) (MissingVacant!3772 (index!17270 (_ BitVec 32))) )
))
(declare-fun lt!222246 () SeekEntryResult!3772)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491582 (= res!294518 (or (= lt!222246 (MissingZero!3772 i!1204)) (= lt!222246 (MissingVacant!3772 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31835 (_ BitVec 32)) SeekEntryResult!3772)

(assert (=> b!491582 (= lt!222246 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491583 () Bool)

(declare-fun e!288819 () Bool)

(assert (=> b!491583 (= e!288819 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!222245 () array!31835)

(declare-fun lt!222248 () SeekEntryResult!3772)

(declare-fun lt!222250 () (_ BitVec 64))

(assert (=> b!491583 (= lt!222248 (seekEntryOrOpen!0 lt!222250 lt!222245 mask!3524))))

(declare-datatypes ((Unit!14490 0))(
  ( (Unit!14491) )
))
(declare-fun lt!222247 () Unit!14490)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14490)

(assert (=> b!491583 (= lt!222247 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491584 () Bool)

(declare-fun res!294521 () Bool)

(assert (=> b!491584 (=> (not res!294521) (not e!288817))))

(assert (=> b!491584 (= res!294521 (validKeyInArray!0 k!2280))))

(declare-fun b!491585 () Bool)

(declare-fun res!294515 () Bool)

(assert (=> b!491585 (=> (not res!294515) (not e!288817))))

(assert (=> b!491585 (= res!294515 (and (= (size!15669 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15669 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15669 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!294517 () Bool)

(assert (=> start!44776 (=> (not res!294517) (not e!288817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44776 (= res!294517 (validMask!0 mask!3524))))

(assert (=> start!44776 e!288817))

(assert (=> start!44776 true))

(declare-fun array_inv!11101 (array!31835) Bool)

(assert (=> start!44776 (array_inv!11101 a!3235)))

(declare-fun b!491581 () Bool)

(assert (=> b!491581 (= e!288818 (not e!288819))))

(declare-fun res!294520 () Bool)

(assert (=> b!491581 (=> res!294520 e!288819)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31835 (_ BitVec 32)) SeekEntryResult!3772)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491581 (= res!294520 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15305 a!3235) j!176) mask!3524) (select (arr!15305 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222250 mask!3524) lt!222250 lt!222245 mask!3524))))))

(assert (=> b!491581 (= lt!222250 (select (store (arr!15305 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491581 (= lt!222245 (array!31836 (store (arr!15305 a!3235) i!1204 k!2280) (size!15669 a!3235)))))

(assert (=> b!491581 (= lt!222248 (Found!3772 j!176))))

(assert (=> b!491581 (= lt!222248 (seekEntryOrOpen!0 (select (arr!15305 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491581 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222249 () Unit!14490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14490)

(assert (=> b!491581 (= lt!222249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44776 res!294517) b!491585))

(assert (= (and b!491585 res!294515) b!491579))

(assert (= (and b!491579 res!294514) b!491584))

(assert (= (and b!491584 res!294521) b!491578))

(assert (= (and b!491578 res!294516) b!491582))

(assert (= (and b!491582 res!294518) b!491580))

(assert (= (and b!491580 res!294519) b!491577))

(assert (= (and b!491577 res!294513) b!491581))

(assert (= (and b!491581 (not res!294520)) b!491583))

(declare-fun m!472223 () Bool)

(assert (=> b!491580 m!472223))

(declare-fun m!472225 () Bool)

(assert (=> start!44776 m!472225))

(declare-fun m!472227 () Bool)

(assert (=> start!44776 m!472227))

(declare-fun m!472229 () Bool)

(assert (=> b!491579 m!472229))

(assert (=> b!491579 m!472229))

(declare-fun m!472231 () Bool)

(assert (=> b!491579 m!472231))

(declare-fun m!472233 () Bool)

(assert (=> b!491581 m!472233))

(declare-fun m!472235 () Bool)

(assert (=> b!491581 m!472235))

(declare-fun m!472237 () Bool)

(assert (=> b!491581 m!472237))

(declare-fun m!472239 () Bool)

(assert (=> b!491581 m!472239))

(assert (=> b!491581 m!472229))

(declare-fun m!472241 () Bool)

(assert (=> b!491581 m!472241))

(assert (=> b!491581 m!472229))

(assert (=> b!491581 m!472239))

(declare-fun m!472243 () Bool)

(assert (=> b!491581 m!472243))

(assert (=> b!491581 m!472229))

(declare-fun m!472245 () Bool)

(assert (=> b!491581 m!472245))

(assert (=> b!491581 m!472229))

(declare-fun m!472247 () Bool)

(assert (=> b!491581 m!472247))

(assert (=> b!491581 m!472243))

(declare-fun m!472249 () Bool)

(assert (=> b!491581 m!472249))

(declare-fun m!472251 () Bool)

(assert (=> b!491577 m!472251))

(declare-fun m!472253 () Bool)

(assert (=> b!491582 m!472253))

(declare-fun m!472255 () Bool)

(assert (=> b!491583 m!472255))

(declare-fun m!472257 () Bool)

(assert (=> b!491583 m!472257))

(declare-fun m!472259 () Bool)

(assert (=> b!491584 m!472259))

(declare-fun m!472261 () Bool)

(assert (=> b!491578 m!472261))

(push 1)

(assert (not b!491581))

(assert (not b!491582))

(assert (not b!491579))

(assert (not b!491584))

(assert (not start!44776))

(assert (not b!491580))

(assert (not b!491577))

(assert (not b!491583))

(assert (not b!491578))

(check-sat)

(pop 1)

(push 1)

(check-sat)

