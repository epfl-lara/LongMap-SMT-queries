; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53256 () Bool)

(assert start!53256)

(declare-fun b!578554 () Bool)

(declare-fun res!366269 () Bool)

(declare-fun e!332748 () Bool)

(assert (=> b!578554 (=> (not res!366269) (not e!332748))))

(declare-datatypes ((array!36102 0))(
  ( (array!36103 (arr!17323 (Array (_ BitVec 32) (_ BitVec 64))) (size!17687 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36102)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578554 (= res!366269 (validKeyInArray!0 (select (arr!17323 a!2986) j!136)))))

(declare-fun b!578555 () Bool)

(declare-fun e!332746 () Bool)

(assert (=> b!578555 (= e!332748 e!332746)))

(declare-fun res!366267 () Bool)

(assert (=> b!578555 (=> (not res!366267) (not e!332746))))

(declare-datatypes ((SeekEntryResult!5719 0))(
  ( (MissingZero!5719 (index!25103 (_ BitVec 32))) (Found!5719 (index!25104 (_ BitVec 32))) (Intermediate!5719 (undefined!6531 Bool) (index!25105 (_ BitVec 32)) (x!54159 (_ BitVec 32))) (Undefined!5719) (MissingVacant!5719 (index!25106 (_ BitVec 32))) )
))
(declare-fun lt!264349 () SeekEntryResult!5719)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578555 (= res!366267 (or (= lt!264349 (MissingZero!5719 i!1108)) (= lt!264349 (MissingVacant!5719 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36102 (_ BitVec 32)) SeekEntryResult!5719)

(assert (=> b!578555 (= lt!264349 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578556 () Bool)

(declare-fun res!366265 () Bool)

(assert (=> b!578556 (=> (not res!366265) (not e!332748))))

(assert (=> b!578556 (= res!366265 (and (= (size!17687 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17687 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17687 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!366270 () Bool)

(assert (=> start!53256 (=> (not res!366270) (not e!332748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53256 (= res!366270 (validMask!0 mask!3053))))

(assert (=> start!53256 e!332748))

(assert (=> start!53256 true))

(declare-fun array_inv!13182 (array!36102) Bool)

(assert (=> start!53256 (array_inv!13182 a!2986)))

(declare-fun b!578557 () Bool)

(declare-fun res!366266 () Bool)

(assert (=> b!578557 (=> (not res!366266) (not e!332748))))

(assert (=> b!578557 (= res!366266 (validKeyInArray!0 k0!1786))))

(declare-fun b!578558 () Bool)

(declare-fun res!366268 () Bool)

(assert (=> b!578558 (=> (not res!366268) (not e!332748))))

(declare-fun arrayContainsKey!0 (array!36102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578558 (= res!366268 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578559 () Bool)

(assert (=> b!578559 (= e!332746 false)))

(declare-fun lt!264348 () Bool)

(declare-datatypes ((List!11271 0))(
  ( (Nil!11268) (Cons!11267 (h!12315 (_ BitVec 64)) (t!17491 List!11271)) )
))
(declare-fun arrayNoDuplicates!0 (array!36102 (_ BitVec 32) List!11271) Bool)

(assert (=> b!578559 (= lt!264348 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11268))))

(declare-fun b!578560 () Bool)

(declare-fun res!366271 () Bool)

(assert (=> b!578560 (=> (not res!366271) (not e!332746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36102 (_ BitVec 32)) Bool)

(assert (=> b!578560 (= res!366271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53256 res!366270) b!578556))

(assert (= (and b!578556 res!366265) b!578554))

(assert (= (and b!578554 res!366269) b!578557))

(assert (= (and b!578557 res!366266) b!578558))

(assert (= (and b!578558 res!366268) b!578555))

(assert (= (and b!578555 res!366267) b!578560))

(assert (= (and b!578560 res!366271) b!578559))

(declare-fun m!557405 () Bool)

(assert (=> b!578554 m!557405))

(assert (=> b!578554 m!557405))

(declare-fun m!557407 () Bool)

(assert (=> b!578554 m!557407))

(declare-fun m!557409 () Bool)

(assert (=> start!53256 m!557409))

(declare-fun m!557411 () Bool)

(assert (=> start!53256 m!557411))

(declare-fun m!557413 () Bool)

(assert (=> b!578559 m!557413))

(declare-fun m!557415 () Bool)

(assert (=> b!578555 m!557415))

(declare-fun m!557417 () Bool)

(assert (=> b!578558 m!557417))

(declare-fun m!557419 () Bool)

(assert (=> b!578560 m!557419))

(declare-fun m!557421 () Bool)

(assert (=> b!578557 m!557421))

(check-sat (not b!578559) (not b!578560) (not b!578557) (not start!53256) (not b!578558) (not b!578555) (not b!578554))
(check-sat)
