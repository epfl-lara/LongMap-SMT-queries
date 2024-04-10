; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44764 () Bool)

(assert start!44764)

(declare-fun b!491415 () Bool)

(declare-fun res!294353 () Bool)

(declare-fun e!288746 () Bool)

(assert (=> b!491415 (=> (not res!294353) (not e!288746))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31823 0))(
  ( (array!31824 (arr!15299 (Array (_ BitVec 32) (_ BitVec 64))) (size!15663 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31823)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491415 (= res!294353 (and (= (size!15663 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15663 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15663 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491416 () Bool)

(declare-fun res!294354 () Bool)

(declare-fun e!288747 () Bool)

(assert (=> b!491416 (=> (not res!294354) (not e!288747))))

(declare-datatypes ((List!9457 0))(
  ( (Nil!9454) (Cons!9453 (h!10315 (_ BitVec 64)) (t!15685 List!9457)) )
))
(declare-fun arrayNoDuplicates!0 (array!31823 (_ BitVec 32) List!9457) Bool)

(assert (=> b!491416 (= res!294354 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9454))))

(declare-fun b!491418 () Bool)

(declare-fun e!288744 () Bool)

(assert (=> b!491418 (= e!288747 (not e!288744))))

(declare-fun res!294358 () Bool)

(assert (=> b!491418 (=> res!294358 e!288744)))

(declare-fun lt!222140 () (_ BitVec 64))

(declare-fun lt!222138 () array!31823)

(declare-datatypes ((SeekEntryResult!3766 0))(
  ( (MissingZero!3766 (index!17243 (_ BitVec 32))) (Found!3766 (index!17244 (_ BitVec 32))) (Intermediate!3766 (undefined!4578 Bool) (index!17245 (_ BitVec 32)) (x!46328 (_ BitVec 32))) (Undefined!3766) (MissingVacant!3766 (index!17246 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31823 (_ BitVec 32)) SeekEntryResult!3766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491418 (= res!294358 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15299 a!3235) j!176) mask!3524) (select (arr!15299 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222140 mask!3524) lt!222140 lt!222138 mask!3524))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!491418 (= lt!222140 (select (store (arr!15299 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491418 (= lt!222138 (array!31824 (store (arr!15299 a!3235) i!1204 k!2280) (size!15663 a!3235)))))

(declare-fun lt!222137 () SeekEntryResult!3766)

(assert (=> b!491418 (= lt!222137 (Found!3766 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31823 (_ BitVec 32)) SeekEntryResult!3766)

(assert (=> b!491418 (= lt!222137 (seekEntryOrOpen!0 (select (arr!15299 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31823 (_ BitVec 32)) Bool)

(assert (=> b!491418 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14478 0))(
  ( (Unit!14479) )
))
(declare-fun lt!222142 () Unit!14478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14478)

(assert (=> b!491418 (= lt!222142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491419 () Bool)

(declare-fun res!294357 () Bool)

(assert (=> b!491419 (=> (not res!294357) (not e!288746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491419 (= res!294357 (validKeyInArray!0 (select (arr!15299 a!3235) j!176)))))

(declare-fun b!491420 () Bool)

(declare-fun res!294356 () Bool)

(assert (=> b!491420 (=> (not res!294356) (not e!288747))))

(assert (=> b!491420 (= res!294356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491421 () Bool)

(assert (=> b!491421 (= e!288746 e!288747)))

(declare-fun res!294355 () Bool)

(assert (=> b!491421 (=> (not res!294355) (not e!288747))))

(declare-fun lt!222141 () SeekEntryResult!3766)

(assert (=> b!491421 (= res!294355 (or (= lt!222141 (MissingZero!3766 i!1204)) (= lt!222141 (MissingVacant!3766 i!1204))))))

(assert (=> b!491421 (= lt!222141 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491422 () Bool)

(assert (=> b!491422 (= e!288744 true)))

(assert (=> b!491422 (= lt!222137 (seekEntryOrOpen!0 lt!222140 lt!222138 mask!3524))))

(declare-fun lt!222139 () Unit!14478)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31823 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14478)

(assert (=> b!491422 (= lt!222139 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491423 () Bool)

(declare-fun res!294359 () Bool)

(assert (=> b!491423 (=> (not res!294359) (not e!288746))))

(declare-fun arrayContainsKey!0 (array!31823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491423 (= res!294359 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!294351 () Bool)

(assert (=> start!44764 (=> (not res!294351) (not e!288746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44764 (= res!294351 (validMask!0 mask!3524))))

(assert (=> start!44764 e!288746))

(assert (=> start!44764 true))

(declare-fun array_inv!11095 (array!31823) Bool)

(assert (=> start!44764 (array_inv!11095 a!3235)))

(declare-fun b!491417 () Bool)

(declare-fun res!294352 () Bool)

(assert (=> b!491417 (=> (not res!294352) (not e!288746))))

(assert (=> b!491417 (= res!294352 (validKeyInArray!0 k!2280))))

(assert (= (and start!44764 res!294351) b!491415))

(assert (= (and b!491415 res!294353) b!491419))

(assert (= (and b!491419 res!294357) b!491417))

(assert (= (and b!491417 res!294352) b!491423))

(assert (= (and b!491423 res!294359) b!491421))

(assert (= (and b!491421 res!294355) b!491420))

(assert (= (and b!491420 res!294356) b!491416))

(assert (= (and b!491416 res!294354) b!491418))

(assert (= (and b!491418 (not res!294358)) b!491422))

(declare-fun m!471983 () Bool)

(assert (=> b!491421 m!471983))

(declare-fun m!471985 () Bool)

(assert (=> b!491417 m!471985))

(declare-fun m!471987 () Bool)

(assert (=> start!44764 m!471987))

(declare-fun m!471989 () Bool)

(assert (=> start!44764 m!471989))

(declare-fun m!471991 () Bool)

(assert (=> b!491422 m!471991))

(declare-fun m!471993 () Bool)

(assert (=> b!491422 m!471993))

(declare-fun m!471995 () Bool)

(assert (=> b!491423 m!471995))

(declare-fun m!471997 () Bool)

(assert (=> b!491420 m!471997))

(declare-fun m!471999 () Bool)

(assert (=> b!491416 m!471999))

(declare-fun m!472001 () Bool)

(assert (=> b!491419 m!472001))

(assert (=> b!491419 m!472001))

(declare-fun m!472003 () Bool)

(assert (=> b!491419 m!472003))

(declare-fun m!472005 () Bool)

(assert (=> b!491418 m!472005))

(declare-fun m!472007 () Bool)

(assert (=> b!491418 m!472007))

(declare-fun m!472009 () Bool)

(assert (=> b!491418 m!472009))

(assert (=> b!491418 m!472001))

(declare-fun m!472011 () Bool)

(assert (=> b!491418 m!472011))

(declare-fun m!472013 () Bool)

(assert (=> b!491418 m!472013))

(assert (=> b!491418 m!472001))

(assert (=> b!491418 m!472009))

(assert (=> b!491418 m!472001))

(declare-fun m!472015 () Bool)

(assert (=> b!491418 m!472015))

(assert (=> b!491418 m!472001))

(declare-fun m!472017 () Bool)

(assert (=> b!491418 m!472017))

(assert (=> b!491418 m!472013))

(declare-fun m!472019 () Bool)

(assert (=> b!491418 m!472019))

(declare-fun m!472021 () Bool)

(assert (=> b!491418 m!472021))

(push 1)

(assert (not b!491416))

(assert (not b!491423))

(assert (not b!491419))

(assert (not b!491421))

(assert (not start!44764))

(assert (not b!491422))

