; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44620 () Bool)

(assert start!44620)

(declare-fun b!489462 () Bool)

(declare-fun res!292401 () Bool)

(declare-fun e!287873 () Bool)

(assert (=> b!489462 (=> (not res!292401) (not e!287873))))

(declare-datatypes ((array!31679 0))(
  ( (array!31680 (arr!15227 (Array (_ BitVec 32) (_ BitVec 64))) (size!15591 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31679)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489462 (= res!292401 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489463 () Bool)

(declare-fun e!287874 () Bool)

(assert (=> b!489463 (= e!287873 e!287874)))

(declare-fun res!292399 () Bool)

(assert (=> b!489463 (=> (not res!292399) (not e!287874))))

(declare-datatypes ((SeekEntryResult!3694 0))(
  ( (MissingZero!3694 (index!16955 (_ BitVec 32))) (Found!3694 (index!16956 (_ BitVec 32))) (Intermediate!3694 (undefined!4506 Bool) (index!16957 (_ BitVec 32)) (x!46064 (_ BitVec 32))) (Undefined!3694) (MissingVacant!3694 (index!16958 (_ BitVec 32))) )
))
(declare-fun lt!220841 () SeekEntryResult!3694)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489463 (= res!292399 (or (= lt!220841 (MissingZero!3694 i!1204)) (= lt!220841 (MissingVacant!3694 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31679 (_ BitVec 32)) SeekEntryResult!3694)

(assert (=> b!489463 (= lt!220841 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!292400 () Bool)

(assert (=> start!44620 (=> (not res!292400) (not e!287873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44620 (= res!292400 (validMask!0 mask!3524))))

(assert (=> start!44620 e!287873))

(assert (=> start!44620 true))

(declare-fun array_inv!11023 (array!31679) Bool)

(assert (=> start!44620 (array_inv!11023 a!3235)))

(declare-fun b!489464 () Bool)

(declare-fun res!292404 () Bool)

(assert (=> b!489464 (=> (not res!292404) (not e!287873))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489464 (= res!292404 (validKeyInArray!0 (select (arr!15227 a!3235) j!176)))))

(declare-fun b!489465 () Bool)

(declare-fun e!287872 () Bool)

(assert (=> b!489465 (= e!287872 (= (seekEntryOrOpen!0 (select (arr!15227 a!3235) j!176) a!3235 mask!3524) (Found!3694 j!176)))))

(declare-fun b!489466 () Bool)

(declare-fun res!292405 () Bool)

(assert (=> b!489466 (=> (not res!292405) (not e!287873))))

(assert (=> b!489466 (= res!292405 (validKeyInArray!0 k!2280))))

(declare-fun b!489467 () Bool)

(declare-fun res!292403 () Bool)

(assert (=> b!489467 (=> (not res!292403) (not e!287874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31679 (_ BitVec 32)) Bool)

(assert (=> b!489467 (= res!292403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489468 () Bool)

(declare-fun res!292406 () Bool)

(assert (=> b!489468 (=> (not res!292406) (not e!287874))))

(declare-datatypes ((List!9385 0))(
  ( (Nil!9382) (Cons!9381 (h!10243 (_ BitVec 64)) (t!15613 List!9385)) )
))
(declare-fun arrayNoDuplicates!0 (array!31679 (_ BitVec 32) List!9385) Bool)

(assert (=> b!489468 (= res!292406 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9382))))

(declare-fun b!489469 () Bool)

(declare-fun res!292402 () Bool)

(assert (=> b!489469 (=> (not res!292402) (not e!287873))))

(assert (=> b!489469 (= res!292402 (and (= (size!15591 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15591 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15591 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489470 () Bool)

(assert (=> b!489470 (= e!287874 (not true))))

(declare-fun lt!220843 () SeekEntryResult!3694)

(declare-fun lt!220842 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31679 (_ BitVec 32)) SeekEntryResult!3694)

(assert (=> b!489470 (= lt!220843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220842 (select (store (arr!15227 a!3235) i!1204 k!2280) j!176) (array!31680 (store (arr!15227 a!3235) i!1204 k!2280) (size!15591 a!3235)) mask!3524))))

(declare-fun lt!220846 () SeekEntryResult!3694)

(declare-fun lt!220845 () (_ BitVec 32))

(assert (=> b!489470 (= lt!220846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220845 (select (arr!15227 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489470 (= lt!220842 (toIndex!0 (select (store (arr!15227 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489470 (= lt!220845 (toIndex!0 (select (arr!15227 a!3235) j!176) mask!3524))))

(assert (=> b!489470 e!287872))

(declare-fun res!292398 () Bool)

(assert (=> b!489470 (=> (not res!292398) (not e!287872))))

(assert (=> b!489470 (= res!292398 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14334 0))(
  ( (Unit!14335) )
))
(declare-fun lt!220844 () Unit!14334)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14334)

(assert (=> b!489470 (= lt!220844 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44620 res!292400) b!489469))

(assert (= (and b!489469 res!292402) b!489464))

(assert (= (and b!489464 res!292404) b!489466))

(assert (= (and b!489466 res!292405) b!489462))

(assert (= (and b!489462 res!292401) b!489463))

(assert (= (and b!489463 res!292399) b!489467))

(assert (= (and b!489467 res!292403) b!489468))

(assert (= (and b!489468 res!292406) b!489470))

(assert (= (and b!489470 res!292398) b!489465))

(declare-fun m!469245 () Bool)

(assert (=> b!489468 m!469245))

(declare-fun m!469247 () Bool)

(assert (=> b!489463 m!469247))

(declare-fun m!469249 () Bool)

(assert (=> b!489466 m!469249))

(declare-fun m!469251 () Bool)

(assert (=> b!489470 m!469251))

(declare-fun m!469253 () Bool)

(assert (=> b!489470 m!469253))

(declare-fun m!469255 () Bool)

(assert (=> b!489470 m!469255))

(declare-fun m!469257 () Bool)

(assert (=> b!489470 m!469257))

(assert (=> b!489470 m!469251))

(declare-fun m!469259 () Bool)

(assert (=> b!489470 m!469259))

(declare-fun m!469261 () Bool)

(assert (=> b!489470 m!469261))

(assert (=> b!489470 m!469259))

(declare-fun m!469263 () Bool)

(assert (=> b!489470 m!469263))

(assert (=> b!489470 m!469259))

(declare-fun m!469265 () Bool)

(assert (=> b!489470 m!469265))

(assert (=> b!489470 m!469251))

(declare-fun m!469267 () Bool)

(assert (=> b!489470 m!469267))

(declare-fun m!469269 () Bool)

(assert (=> b!489462 m!469269))

(assert (=> b!489464 m!469259))

(assert (=> b!489464 m!469259))

(declare-fun m!469271 () Bool)

(assert (=> b!489464 m!469271))

(assert (=> b!489465 m!469259))

(assert (=> b!489465 m!469259))

(declare-fun m!469273 () Bool)

(assert (=> b!489465 m!469273))

(declare-fun m!469275 () Bool)

(assert (=> start!44620 m!469275))

(declare-fun m!469277 () Bool)

(assert (=> start!44620 m!469277))

(declare-fun m!469279 () Bool)

(assert (=> b!489467 m!469279))

(push 1)

