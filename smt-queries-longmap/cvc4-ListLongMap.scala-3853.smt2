; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53054 () Bool)

(assert start!53054)

(declare-fun b!577407 () Bool)

(declare-fun res!365334 () Bool)

(declare-fun e!332159 () Bool)

(assert (=> b!577407 (=> (not res!365334) (not e!332159))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36017 0))(
  ( (array!36018 (arr!17285 (Array (_ BitVec 32) (_ BitVec 64))) (size!17649 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36017)

(assert (=> b!577407 (= res!365334 (and (= (size!17649 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17649 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17649 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365336 () Bool)

(assert (=> start!53054 (=> (not res!365336) (not e!332159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53054 (= res!365336 (validMask!0 mask!3053))))

(assert (=> start!53054 e!332159))

(assert (=> start!53054 true))

(declare-fun array_inv!13144 (array!36017) Bool)

(assert (=> start!53054 (array_inv!13144 a!2986)))

(declare-fun b!577408 () Bool)

(assert (=> b!577408 (= e!332159 false)))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5681 0))(
  ( (MissingZero!5681 (index!24951 (_ BitVec 32))) (Found!5681 (index!24952 (_ BitVec 32))) (Intermediate!5681 (undefined!6493 Bool) (index!24953 (_ BitVec 32)) (x!54017 (_ BitVec 32))) (Undefined!5681) (MissingVacant!5681 (index!24954 (_ BitVec 32))) )
))
(declare-fun lt!264031 () SeekEntryResult!5681)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36017 (_ BitVec 32)) SeekEntryResult!5681)

(assert (=> b!577408 (= lt!264031 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577409 () Bool)

(declare-fun res!365337 () Bool)

(assert (=> b!577409 (=> (not res!365337) (not e!332159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577409 (= res!365337 (validKeyInArray!0 k!1786))))

(declare-fun b!577410 () Bool)

(declare-fun res!365338 () Bool)

(assert (=> b!577410 (=> (not res!365338) (not e!332159))))

(assert (=> b!577410 (= res!365338 (validKeyInArray!0 (select (arr!17285 a!2986) j!136)))))

(declare-fun b!577411 () Bool)

(declare-fun res!365335 () Bool)

(assert (=> b!577411 (=> (not res!365335) (not e!332159))))

(declare-fun arrayContainsKey!0 (array!36017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577411 (= res!365335 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53054 res!365336) b!577407))

(assert (= (and b!577407 res!365334) b!577410))

(assert (= (and b!577410 res!365338) b!577409))

(assert (= (and b!577409 res!365337) b!577411))

(assert (= (and b!577411 res!365335) b!577408))

(declare-fun m!556453 () Bool)

(assert (=> start!53054 m!556453))

(declare-fun m!556455 () Bool)

(assert (=> start!53054 m!556455))

(declare-fun m!556457 () Bool)

(assert (=> b!577410 m!556457))

(assert (=> b!577410 m!556457))

(declare-fun m!556459 () Bool)

(assert (=> b!577410 m!556459))

(declare-fun m!556461 () Bool)

(assert (=> b!577408 m!556461))

(declare-fun m!556463 () Bool)

(assert (=> b!577411 m!556463))

(declare-fun m!556465 () Bool)

(assert (=> b!577409 m!556465))

(push 1)

(assert (not b!577409))

(assert (not start!53054))

(assert (not b!577408))

(assert (not b!577410))

(assert (not b!577411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

