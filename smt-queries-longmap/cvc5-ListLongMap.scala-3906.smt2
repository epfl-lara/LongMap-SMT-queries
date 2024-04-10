; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53446 () Bool)

(assert start!53446)

(declare-fun b!581553 () Bool)

(declare-fun res!369377 () Bool)

(declare-fun e!333697 () Bool)

(assert (=> b!581553 (=> (not res!369377) (not e!333697))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581553 (= res!369377 (validKeyInArray!0 k!1786))))

(declare-fun b!581554 () Bool)

(declare-fun res!369374 () Bool)

(assert (=> b!581554 (=> (not res!369374) (not e!333697))))

(declare-datatypes ((array!36347 0))(
  ( (array!36348 (arr!17448 (Array (_ BitVec 32) (_ BitVec 64))) (size!17812 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36347)

(declare-fun arrayContainsKey!0 (array!36347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581554 (= res!369374 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581555 () Bool)

(declare-fun res!369373 () Bool)

(declare-fun e!333699 () Bool)

(assert (=> b!581555 (=> (not res!369373) (not e!333699))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36347 (_ BitVec 32)) Bool)

(assert (=> b!581555 (= res!369373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581556 () Bool)

(assert (=> b!581556 (= e!333699 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5888 0))(
  ( (MissingZero!5888 (index!25779 (_ BitVec 32))) (Found!5888 (index!25780 (_ BitVec 32))) (Intermediate!5888 (undefined!6700 Bool) (index!25781 (_ BitVec 32)) (x!54645 (_ BitVec 32))) (Undefined!5888) (MissingVacant!5888 (index!25782 (_ BitVec 32))) )
))
(declare-fun lt!264930 () SeekEntryResult!5888)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36347 (_ BitVec 32)) SeekEntryResult!5888)

(assert (=> b!581556 (= lt!264930 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17448 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581557 () Bool)

(declare-fun res!369371 () Bool)

(assert (=> b!581557 (=> (not res!369371) (not e!333697))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581557 (= res!369371 (and (= (size!17812 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17812 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17812 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!369372 () Bool)

(assert (=> start!53446 (=> (not res!369372) (not e!333697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53446 (= res!369372 (validMask!0 mask!3053))))

(assert (=> start!53446 e!333697))

(assert (=> start!53446 true))

(declare-fun array_inv!13244 (array!36347) Bool)

(assert (=> start!53446 (array_inv!13244 a!2986)))

(declare-fun b!581558 () Bool)

(assert (=> b!581558 (= e!333697 e!333699)))

(declare-fun res!369376 () Bool)

(assert (=> b!581558 (=> (not res!369376) (not e!333699))))

(declare-fun lt!264931 () SeekEntryResult!5888)

(assert (=> b!581558 (= res!369376 (or (= lt!264931 (MissingZero!5888 i!1108)) (= lt!264931 (MissingVacant!5888 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36347 (_ BitVec 32)) SeekEntryResult!5888)

(assert (=> b!581558 (= lt!264931 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581559 () Bool)

(declare-fun res!369375 () Bool)

(assert (=> b!581559 (=> (not res!369375) (not e!333699))))

(declare-datatypes ((List!11489 0))(
  ( (Nil!11486) (Cons!11485 (h!12530 (_ BitVec 64)) (t!17717 List!11489)) )
))
(declare-fun arrayNoDuplicates!0 (array!36347 (_ BitVec 32) List!11489) Bool)

(assert (=> b!581559 (= res!369375 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11486))))

(declare-fun b!581560 () Bool)

(declare-fun res!369370 () Bool)

(assert (=> b!581560 (=> (not res!369370) (not e!333697))))

(assert (=> b!581560 (= res!369370 (validKeyInArray!0 (select (arr!17448 a!2986) j!136)))))

(declare-fun b!581561 () Bool)

(declare-fun res!369369 () Bool)

(assert (=> b!581561 (=> (not res!369369) (not e!333699))))

(assert (=> b!581561 (= res!369369 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17448 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17448 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53446 res!369372) b!581557))

(assert (= (and b!581557 res!369371) b!581560))

(assert (= (and b!581560 res!369370) b!581553))

(assert (= (and b!581553 res!369377) b!581554))

(assert (= (and b!581554 res!369374) b!581558))

(assert (= (and b!581558 res!369376) b!581555))

(assert (= (and b!581555 res!369373) b!581559))

(assert (= (and b!581559 res!369375) b!581561))

(assert (= (and b!581561 res!369369) b!581556))

(declare-fun m!560089 () Bool)

(assert (=> start!53446 m!560089))

(declare-fun m!560091 () Bool)

(assert (=> start!53446 m!560091))

(declare-fun m!560093 () Bool)

(assert (=> b!581553 m!560093))

(declare-fun m!560095 () Bool)

(assert (=> b!581556 m!560095))

(assert (=> b!581556 m!560095))

(declare-fun m!560097 () Bool)

(assert (=> b!581556 m!560097))

(declare-fun m!560099 () Bool)

(assert (=> b!581559 m!560099))

(assert (=> b!581560 m!560095))

(assert (=> b!581560 m!560095))

(declare-fun m!560101 () Bool)

(assert (=> b!581560 m!560101))

(declare-fun m!560103 () Bool)

(assert (=> b!581554 m!560103))

(declare-fun m!560105 () Bool)

(assert (=> b!581555 m!560105))

(declare-fun m!560107 () Bool)

(assert (=> b!581558 m!560107))

(declare-fun m!560109 () Bool)

(assert (=> b!581561 m!560109))

(declare-fun m!560111 () Bool)

(assert (=> b!581561 m!560111))

(declare-fun m!560113 () Bool)

(assert (=> b!581561 m!560113))

(push 1)

