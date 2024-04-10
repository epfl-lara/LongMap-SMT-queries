; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53224 () Bool)

(assert start!53224)

(declare-fun res!366359 () Bool)

(declare-fun e!332700 () Bool)

(assert (=> start!53224 (=> (not res!366359) (not e!332700))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53224 (= res!366359 (validMask!0 mask!3053))))

(assert (=> start!53224 e!332700))

(assert (=> start!53224 true))

(declare-datatypes ((array!36125 0))(
  ( (array!36126 (arr!17337 (Array (_ BitVec 32) (_ BitVec 64))) (size!17701 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36125)

(declare-fun array_inv!13133 (array!36125) Bool)

(assert (=> start!53224 (array_inv!13133 a!2986)))

(declare-fun b!578543 () Bool)

(declare-fun res!366363 () Bool)

(assert (=> b!578543 (=> (not res!366363) (not e!332700))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578543 (= res!366363 (and (= (size!17701 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17701 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17701 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578544 () Bool)

(declare-fun res!366364 () Bool)

(declare-fun e!332698 () Bool)

(assert (=> b!578544 (=> (not res!366364) (not e!332698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36125 (_ BitVec 32)) Bool)

(assert (=> b!578544 (= res!366364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578545 () Bool)

(declare-fun res!366362 () Bool)

(assert (=> b!578545 (=> (not res!366362) (not e!332700))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578545 (= res!366362 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578546 () Bool)

(assert (=> b!578546 (= e!332698 false)))

(declare-fun lt!264291 () Bool)

(declare-datatypes ((List!11378 0))(
  ( (Nil!11375) (Cons!11374 (h!12419 (_ BitVec 64)) (t!17606 List!11378)) )
))
(declare-fun arrayNoDuplicates!0 (array!36125 (_ BitVec 32) List!11378) Bool)

(assert (=> b!578546 (= lt!264291 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11375))))

(declare-fun b!578547 () Bool)

(declare-fun res!366365 () Bool)

(assert (=> b!578547 (=> (not res!366365) (not e!332700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578547 (= res!366365 (validKeyInArray!0 k!1786))))

(declare-fun b!578548 () Bool)

(assert (=> b!578548 (= e!332700 e!332698)))

(declare-fun res!366361 () Bool)

(assert (=> b!578548 (=> (not res!366361) (not e!332698))))

(declare-datatypes ((SeekEntryResult!5777 0))(
  ( (MissingZero!5777 (index!25335 (_ BitVec 32))) (Found!5777 (index!25336 (_ BitVec 32))) (Intermediate!5777 (undefined!6589 Bool) (index!25337 (_ BitVec 32)) (x!54238 (_ BitVec 32))) (Undefined!5777) (MissingVacant!5777 (index!25338 (_ BitVec 32))) )
))
(declare-fun lt!264292 () SeekEntryResult!5777)

(assert (=> b!578548 (= res!366361 (or (= lt!264292 (MissingZero!5777 i!1108)) (= lt!264292 (MissingVacant!5777 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36125 (_ BitVec 32)) SeekEntryResult!5777)

(assert (=> b!578548 (= lt!264292 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578549 () Bool)

(declare-fun res!366360 () Bool)

(assert (=> b!578549 (=> (not res!366360) (not e!332700))))

(assert (=> b!578549 (= res!366360 (validKeyInArray!0 (select (arr!17337 a!2986) j!136)))))

(assert (= (and start!53224 res!366359) b!578543))

(assert (= (and b!578543 res!366363) b!578549))

(assert (= (and b!578549 res!366360) b!578547))

(assert (= (and b!578547 res!366365) b!578545))

(assert (= (and b!578545 res!366362) b!578548))

(assert (= (and b!578548 res!366361) b!578544))

(assert (= (and b!578544 res!366364) b!578546))

(declare-fun m!557215 () Bool)

(assert (=> start!53224 m!557215))

(declare-fun m!557217 () Bool)

(assert (=> start!53224 m!557217))

(declare-fun m!557219 () Bool)

(assert (=> b!578549 m!557219))

(assert (=> b!578549 m!557219))

(declare-fun m!557221 () Bool)

(assert (=> b!578549 m!557221))

(declare-fun m!557223 () Bool)

(assert (=> b!578544 m!557223))

(declare-fun m!557225 () Bool)

(assert (=> b!578545 m!557225))

(declare-fun m!557227 () Bool)

(assert (=> b!578546 m!557227))

(declare-fun m!557229 () Bool)

(assert (=> b!578548 m!557229))

(declare-fun m!557231 () Bool)

(assert (=> b!578547 m!557231))

(push 1)

