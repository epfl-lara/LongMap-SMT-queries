; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44778 () Bool)

(assert start!44778)

(declare-fun b!491604 () Bool)

(declare-fun res!294543 () Bool)

(declare-fun e!288831 () Bool)

(assert (=> b!491604 (=> (not res!294543) (not e!288831))))

(declare-datatypes ((array!31837 0))(
  ( (array!31838 (arr!15306 (Array (_ BitVec 32) (_ BitVec 64))) (size!15670 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31837)

(declare-datatypes ((List!9464 0))(
  ( (Nil!9461) (Cons!9460 (h!10322 (_ BitVec 64)) (t!15692 List!9464)) )
))
(declare-fun arrayNoDuplicates!0 (array!31837 (_ BitVec 32) List!9464) Bool)

(assert (=> b!491604 (= res!294543 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9461))))

(declare-fun b!491605 () Bool)

(declare-fun e!288829 () Bool)

(assert (=> b!491605 (= e!288831 (not e!288829))))

(declare-fun res!294544 () Bool)

(assert (=> b!491605 (=> res!294544 e!288829)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!222265 () array!31837)

(declare-fun lt!222267 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3773 0))(
  ( (MissingZero!3773 (index!17271 (_ BitVec 32))) (Found!3773 (index!17272 (_ BitVec 32))) (Intermediate!3773 (undefined!4585 Bool) (index!17273 (_ BitVec 32)) (x!46359 (_ BitVec 32))) (Undefined!3773) (MissingVacant!3773 (index!17274 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31837 (_ BitVec 32)) SeekEntryResult!3773)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491605 (= res!294544 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15306 a!3235) j!176) mask!3524) (select (arr!15306 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222267 mask!3524) lt!222267 lt!222265 mask!3524))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491605 (= lt!222267 (select (store (arr!15306 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491605 (= lt!222265 (array!31838 (store (arr!15306 a!3235) i!1204 k!2280) (size!15670 a!3235)))))

(declare-fun lt!222264 () SeekEntryResult!3773)

(assert (=> b!491605 (= lt!222264 (Found!3773 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31837 (_ BitVec 32)) SeekEntryResult!3773)

(assert (=> b!491605 (= lt!222264 (seekEntryOrOpen!0 (select (arr!15306 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31837 (_ BitVec 32)) Bool)

(assert (=> b!491605 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14492 0))(
  ( (Unit!14493) )
))
(declare-fun lt!222268 () Unit!14492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14492)

(assert (=> b!491605 (= lt!222268 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!294548 () Bool)

(declare-fun e!288830 () Bool)

(assert (=> start!44778 (=> (not res!294548) (not e!288830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44778 (= res!294548 (validMask!0 mask!3524))))

(assert (=> start!44778 e!288830))

(assert (=> start!44778 true))

(declare-fun array_inv!11102 (array!31837) Bool)

(assert (=> start!44778 (array_inv!11102 a!3235)))

(declare-fun b!491606 () Bool)

(declare-fun res!294541 () Bool)

(assert (=> b!491606 (=> (not res!294541) (not e!288830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491606 (= res!294541 (validKeyInArray!0 (select (arr!15306 a!3235) j!176)))))

(declare-fun b!491607 () Bool)

(declare-fun res!294542 () Bool)

(assert (=> b!491607 (=> (not res!294542) (not e!288830))))

(declare-fun arrayContainsKey!0 (array!31837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491607 (= res!294542 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491608 () Bool)

(assert (=> b!491608 (= e!288830 e!288831)))

(declare-fun res!294540 () Bool)

(assert (=> b!491608 (=> (not res!294540) (not e!288831))))

(declare-fun lt!222266 () SeekEntryResult!3773)

(assert (=> b!491608 (= res!294540 (or (= lt!222266 (MissingZero!3773 i!1204)) (= lt!222266 (MissingVacant!3773 i!1204))))))

(assert (=> b!491608 (= lt!222266 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491609 () Bool)

(assert (=> b!491609 (= e!288829 true)))

(assert (=> b!491609 (= lt!222264 (seekEntryOrOpen!0 lt!222267 lt!222265 mask!3524))))

(declare-fun lt!222263 () Unit!14492)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31837 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14492)

(assert (=> b!491609 (= lt!222263 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491610 () Bool)

(declare-fun res!294546 () Bool)

(assert (=> b!491610 (=> (not res!294546) (not e!288830))))

(assert (=> b!491610 (= res!294546 (and (= (size!15670 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15670 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15670 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491611 () Bool)

(declare-fun res!294545 () Bool)

(assert (=> b!491611 (=> (not res!294545) (not e!288831))))

(assert (=> b!491611 (= res!294545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491612 () Bool)

(declare-fun res!294547 () Bool)

(assert (=> b!491612 (=> (not res!294547) (not e!288830))))

(assert (=> b!491612 (= res!294547 (validKeyInArray!0 k!2280))))

(assert (= (and start!44778 res!294548) b!491610))

(assert (= (and b!491610 res!294546) b!491606))

(assert (= (and b!491606 res!294541) b!491612))

(assert (= (and b!491612 res!294547) b!491607))

(assert (= (and b!491607 res!294542) b!491608))

(assert (= (and b!491608 res!294540) b!491611))

(assert (= (and b!491611 res!294545) b!491604))

(assert (= (and b!491604 res!294543) b!491605))

(assert (= (and b!491605 (not res!294544)) b!491609))

(declare-fun m!472263 () Bool)

(assert (=> b!491607 m!472263))

(declare-fun m!472265 () Bool)

(assert (=> b!491606 m!472265))

(assert (=> b!491606 m!472265))

(declare-fun m!472267 () Bool)

(assert (=> b!491606 m!472267))

(declare-fun m!472269 () Bool)

(assert (=> b!491609 m!472269))

(declare-fun m!472271 () Bool)

(assert (=> b!491609 m!472271))

(declare-fun m!472273 () Bool)

(assert (=> b!491611 m!472273))

(declare-fun m!472275 () Bool)

(assert (=> start!44778 m!472275))

(declare-fun m!472277 () Bool)

(assert (=> start!44778 m!472277))

(declare-fun m!472279 () Bool)

(assert (=> b!491604 m!472279))

(declare-fun m!472281 () Bool)

(assert (=> b!491608 m!472281))

(declare-fun m!472283 () Bool)

(assert (=> b!491612 m!472283))

(declare-fun m!472285 () Bool)

(assert (=> b!491605 m!472285))

(declare-fun m!472287 () Bool)

(assert (=> b!491605 m!472287))

(declare-fun m!472289 () Bool)

(assert (=> b!491605 m!472289))

(declare-fun m!472291 () Bool)

(assert (=> b!491605 m!472291))

(assert (=> b!491605 m!472265))

(declare-fun m!472293 () Bool)

(assert (=> b!491605 m!472293))

(declare-fun m!472295 () Bool)

(assert (=> b!491605 m!472295))

(assert (=> b!491605 m!472265))

(assert (=> b!491605 m!472291))

(assert (=> b!491605 m!472265))

(declare-fun m!472297 () Bool)

(assert (=> b!491605 m!472297))

(assert (=> b!491605 m!472265))

(declare-fun m!472299 () Bool)

(assert (=> b!491605 m!472299))

(assert (=> b!491605 m!472295))

(declare-fun m!472301 () Bool)

(assert (=> b!491605 m!472301))

(push 1)

