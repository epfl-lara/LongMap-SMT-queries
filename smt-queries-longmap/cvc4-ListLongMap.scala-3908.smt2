; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53462 () Bool)

(assert start!53462)

(declare-fun b!581769 () Bool)

(declare-fun res!369590 () Bool)

(declare-fun e!333770 () Bool)

(assert (=> b!581769 (=> (not res!369590) (not e!333770))))

(declare-datatypes ((array!36363 0))(
  ( (array!36364 (arr!17456 (Array (_ BitVec 32) (_ BitVec 64))) (size!17820 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36363)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581769 (= res!369590 (validKeyInArray!0 (select (arr!17456 a!2986) j!136)))))

(declare-fun b!581770 () Bool)

(declare-fun res!369588 () Bool)

(assert (=> b!581770 (=> (not res!369588) (not e!333770))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581770 (= res!369588 (and (= (size!17820 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17820 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17820 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581771 () Bool)

(declare-fun res!369589 () Bool)

(declare-fun e!333771 () Bool)

(assert (=> b!581771 (=> (not res!369589) (not e!333771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36363 (_ BitVec 32)) Bool)

(assert (=> b!581771 (= res!369589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581772 () Bool)

(declare-fun res!369593 () Bool)

(assert (=> b!581772 (=> (not res!369593) (not e!333770))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581772 (= res!369593 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581773 () Bool)

(declare-fun res!369587 () Bool)

(assert (=> b!581773 (=> (not res!369587) (not e!333771))))

(declare-datatypes ((List!11497 0))(
  ( (Nil!11494) (Cons!11493 (h!12538 (_ BitVec 64)) (t!17725 List!11497)) )
))
(declare-fun arrayNoDuplicates!0 (array!36363 (_ BitVec 32) List!11497) Bool)

(assert (=> b!581773 (= res!369587 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11494))))

(declare-fun b!581775 () Bool)

(assert (=> b!581775 (= e!333770 e!333771)))

(declare-fun res!369592 () Bool)

(assert (=> b!581775 (=> (not res!369592) (not e!333771))))

(declare-datatypes ((SeekEntryResult!5896 0))(
  ( (MissingZero!5896 (index!25811 (_ BitVec 32))) (Found!5896 (index!25812 (_ BitVec 32))) (Intermediate!5896 (undefined!6708 Bool) (index!25813 (_ BitVec 32)) (x!54669 (_ BitVec 32))) (Undefined!5896) (MissingVacant!5896 (index!25814 (_ BitVec 32))) )
))
(declare-fun lt!264978 () SeekEntryResult!5896)

(assert (=> b!581775 (= res!369592 (or (= lt!264978 (MissingZero!5896 i!1108)) (= lt!264978 (MissingVacant!5896 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36363 (_ BitVec 32)) SeekEntryResult!5896)

(assert (=> b!581775 (= lt!264978 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581776 () Bool)

(declare-fun res!369585 () Bool)

(assert (=> b!581776 (=> (not res!369585) (not e!333770))))

(assert (=> b!581776 (= res!369585 (validKeyInArray!0 k!1786))))

(declare-fun b!581777 () Bool)

(assert (=> b!581777 (= e!333771 false)))

(declare-fun lt!264979 () SeekEntryResult!5896)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36363 (_ BitVec 32)) SeekEntryResult!5896)

(assert (=> b!581777 (= lt!264979 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17456 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581774 () Bool)

(declare-fun res!369586 () Bool)

(assert (=> b!581774 (=> (not res!369586) (not e!333771))))

(assert (=> b!581774 (= res!369586 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17456 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17456 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!369591 () Bool)

(assert (=> start!53462 (=> (not res!369591) (not e!333770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53462 (= res!369591 (validMask!0 mask!3053))))

(assert (=> start!53462 e!333770))

(assert (=> start!53462 true))

(declare-fun array_inv!13252 (array!36363) Bool)

(assert (=> start!53462 (array_inv!13252 a!2986)))

(assert (= (and start!53462 res!369591) b!581770))

(assert (= (and b!581770 res!369588) b!581769))

(assert (= (and b!581769 res!369590) b!581776))

(assert (= (and b!581776 res!369585) b!581772))

(assert (= (and b!581772 res!369593) b!581775))

(assert (= (and b!581775 res!369592) b!581771))

(assert (= (and b!581771 res!369589) b!581773))

(assert (= (and b!581773 res!369587) b!581774))

(assert (= (and b!581774 res!369586) b!581777))

(declare-fun m!560297 () Bool)

(assert (=> b!581775 m!560297))

(declare-fun m!560299 () Bool)

(assert (=> b!581774 m!560299))

(declare-fun m!560301 () Bool)

(assert (=> b!581774 m!560301))

(declare-fun m!560303 () Bool)

(assert (=> b!581774 m!560303))

(declare-fun m!560305 () Bool)

(assert (=> b!581776 m!560305))

(declare-fun m!560307 () Bool)

(assert (=> b!581772 m!560307))

(declare-fun m!560309 () Bool)

(assert (=> b!581777 m!560309))

(assert (=> b!581777 m!560309))

(declare-fun m!560311 () Bool)

(assert (=> b!581777 m!560311))

(declare-fun m!560313 () Bool)

(assert (=> b!581773 m!560313))

(declare-fun m!560315 () Bool)

(assert (=> start!53462 m!560315))

(declare-fun m!560317 () Bool)

(assert (=> start!53462 m!560317))

(declare-fun m!560319 () Bool)

(assert (=> b!581771 m!560319))

(assert (=> b!581769 m!560309))

(assert (=> b!581769 m!560309))

(declare-fun m!560321 () Bool)

(assert (=> b!581769 m!560321))

(push 1)

(assert (not b!581777))

(assert (not b!581775))

(assert (not b!581773))

(assert (not b!581772))

(assert (not b!581776))

(assert (not b!581769))

