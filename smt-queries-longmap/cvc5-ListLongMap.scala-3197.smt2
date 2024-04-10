; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44868 () Bool)

(assert start!44868)

(declare-fun e!289223 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31870 0))(
  ( (array!31871 (arr!15321 (Array (_ BitVec 32) (_ BitVec 64))) (size!15685 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31870)

(declare-fun b!492329 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3788 0))(
  ( (MissingZero!3788 (index!17331 (_ BitVec 32))) (Found!3788 (index!17332 (_ BitVec 32))) (Intermediate!3788 (undefined!4600 Bool) (index!17333 (_ BitVec 32)) (x!46420 (_ BitVec 32))) (Undefined!3788) (MissingVacant!3788 (index!17334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31870 (_ BitVec 32)) SeekEntryResult!3788)

(assert (=> b!492329 (= e!289223 (= (seekEntryOrOpen!0 (select (arr!15321 a!3235) j!176) a!3235 mask!3524) (Found!3788 j!176)))))

(declare-fun b!492330 () Bool)

(declare-fun res!295084 () Bool)

(declare-fun e!289227 () Bool)

(assert (=> b!492330 (=> (not res!295084) (not e!289227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31870 (_ BitVec 32)) Bool)

(assert (=> b!492330 (= res!295084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492331 () Bool)

(declare-fun res!295087 () Bool)

(declare-fun e!289226 () Bool)

(assert (=> b!492331 (=> (not res!295087) (not e!289226))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492331 (= res!295087 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492332 () Bool)

(declare-fun res!295091 () Bool)

(assert (=> b!492332 (=> (not res!295091) (not e!289226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492332 (= res!295091 (validKeyInArray!0 (select (arr!15321 a!3235) j!176)))))

(declare-fun b!492334 () Bool)

(declare-fun res!295089 () Bool)

(assert (=> b!492334 (=> (not res!295089) (not e!289227))))

(declare-datatypes ((List!9479 0))(
  ( (Nil!9476) (Cons!9475 (h!10340 (_ BitVec 64)) (t!15707 List!9479)) )
))
(declare-fun arrayNoDuplicates!0 (array!31870 (_ BitVec 32) List!9479) Bool)

(assert (=> b!492334 (= res!295089 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9476))))

(declare-fun b!492335 () Bool)

(declare-fun e!289225 () Bool)

(assert (=> b!492335 (= e!289227 (not e!289225))))

(declare-fun res!295082 () Bool)

(assert (=> b!492335 (=> res!295082 e!289225)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31870 (_ BitVec 32)) SeekEntryResult!3788)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492335 (= res!295082 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15321 a!3235) j!176) mask!3524) (select (arr!15321 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15321 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15321 a!3235) i!1204 k!2280) j!176) (array!31871 (store (arr!15321 a!3235) i!1204 k!2280) (size!15685 a!3235)) mask!3524)))))

(assert (=> b!492335 e!289223))

(declare-fun res!295085 () Bool)

(assert (=> b!492335 (=> (not res!295085) (not e!289223))))

(assert (=> b!492335 (= res!295085 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14522 0))(
  ( (Unit!14523) )
))
(declare-fun lt!222582 () Unit!14522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14522)

(assert (=> b!492335 (= lt!222582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492336 () Bool)

(assert (=> b!492336 (= e!289225 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!492337 () Bool)

(declare-fun res!295086 () Bool)

(assert (=> b!492337 (=> (not res!295086) (not e!289226))))

(assert (=> b!492337 (= res!295086 (validKeyInArray!0 k!2280))))

(declare-fun b!492338 () Bool)

(assert (=> b!492338 (= e!289226 e!289227)))

(declare-fun res!295088 () Bool)

(assert (=> b!492338 (=> (not res!295088) (not e!289227))))

(declare-fun lt!222583 () SeekEntryResult!3788)

(assert (=> b!492338 (= res!295088 (or (= lt!222583 (MissingZero!3788 i!1204)) (= lt!222583 (MissingVacant!3788 i!1204))))))

(assert (=> b!492338 (= lt!222583 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!295083 () Bool)

(assert (=> start!44868 (=> (not res!295083) (not e!289226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44868 (= res!295083 (validMask!0 mask!3524))))

(assert (=> start!44868 e!289226))

(assert (=> start!44868 true))

(declare-fun array_inv!11117 (array!31870) Bool)

(assert (=> start!44868 (array_inv!11117 a!3235)))

(declare-fun b!492333 () Bool)

(declare-fun res!295090 () Bool)

(assert (=> b!492333 (=> (not res!295090) (not e!289226))))

(assert (=> b!492333 (= res!295090 (and (= (size!15685 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15685 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15685 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44868 res!295083) b!492333))

(assert (= (and b!492333 res!295090) b!492332))

(assert (= (and b!492332 res!295091) b!492337))

(assert (= (and b!492337 res!295086) b!492331))

(assert (= (and b!492331 res!295087) b!492338))

(assert (= (and b!492338 res!295088) b!492330))

(assert (= (and b!492330 res!295084) b!492334))

(assert (= (and b!492334 res!295089) b!492335))

(assert (= (and b!492335 res!295085) b!492329))

(assert (= (and b!492335 (not res!295082)) b!492336))

(declare-fun m!473031 () Bool)

(assert (=> b!492334 m!473031))

(declare-fun m!473033 () Bool)

(assert (=> b!492337 m!473033))

(declare-fun m!473035 () Bool)

(assert (=> b!492330 m!473035))

(declare-fun m!473037 () Bool)

(assert (=> b!492332 m!473037))

(assert (=> b!492332 m!473037))

(declare-fun m!473039 () Bool)

(assert (=> b!492332 m!473039))

(declare-fun m!473041 () Bool)

(assert (=> b!492331 m!473041))

(declare-fun m!473043 () Bool)

(assert (=> start!44868 m!473043))

(declare-fun m!473045 () Bool)

(assert (=> start!44868 m!473045))

(assert (=> b!492329 m!473037))

(assert (=> b!492329 m!473037))

(declare-fun m!473047 () Bool)

(assert (=> b!492329 m!473047))

(declare-fun m!473049 () Bool)

(assert (=> b!492335 m!473049))

(declare-fun m!473051 () Bool)

(assert (=> b!492335 m!473051))

(declare-fun m!473053 () Bool)

(assert (=> b!492335 m!473053))

(declare-fun m!473055 () Bool)

(assert (=> b!492335 m!473055))

(assert (=> b!492335 m!473037))

(declare-fun m!473057 () Bool)

(assert (=> b!492335 m!473057))

(assert (=> b!492335 m!473037))

(assert (=> b!492335 m!473055))

(declare-fun m!473059 () Bool)

(assert (=> b!492335 m!473059))

(assert (=> b!492335 m!473053))

(declare-fun m!473061 () Bool)

(assert (=> b!492335 m!473061))

(assert (=> b!492335 m!473037))

(declare-fun m!473063 () Bool)

(assert (=> b!492335 m!473063))

(assert (=> b!492335 m!473053))

(assert (=> b!492335 m!473059))

(declare-fun m!473065 () Bool)

(assert (=> b!492338 m!473065))

(push 1)

