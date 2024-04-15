; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53346 () Bool)

(assert start!53346)

(declare-fun b!580130 () Bool)

(declare-fun res!368090 () Bool)

(declare-fun e!333147 () Bool)

(assert (=> b!580130 (=> (not res!368090) (not e!333147))))

(declare-datatypes ((array!36261 0))(
  ( (array!36262 (arr!17405 (Array (_ BitVec 32) (_ BitVec 64))) (size!17770 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36261)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580130 (= res!368090 (validKeyInArray!0 (select (arr!17405 a!2986) j!136)))))

(declare-fun b!580131 () Bool)

(declare-fun e!333146 () Bool)

(assert (=> b!580131 (= e!333146 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5842 0))(
  ( (MissingZero!5842 (index!25595 (_ BitVec 32))) (Found!5842 (index!25596 (_ BitVec 32))) (Intermediate!5842 (undefined!6654 Bool) (index!25597 (_ BitVec 32)) (x!54482 (_ BitVec 32))) (Undefined!5842) (MissingVacant!5842 (index!25598 (_ BitVec 32))) )
))
(declare-fun lt!264463 () SeekEntryResult!5842)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36261 (_ BitVec 32)) SeekEntryResult!5842)

(assert (=> b!580131 (= lt!264463 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17405 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580132 () Bool)

(declare-fun res!368089 () Bool)

(assert (=> b!580132 (=> (not res!368089) (not e!333147))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580132 (= res!368089 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580134 () Bool)

(declare-fun res!368093 () Bool)

(assert (=> b!580134 (=> (not res!368093) (not e!333147))))

(assert (=> b!580134 (= res!368093 (validKeyInArray!0 k0!1786))))

(declare-fun b!580135 () Bool)

(declare-fun res!368091 () Bool)

(assert (=> b!580135 (=> (not res!368091) (not e!333146))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580135 (= res!368091 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17405 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17405 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580136 () Bool)

(declare-fun res!368095 () Bool)

(assert (=> b!580136 (=> (not res!368095) (not e!333146))))

(declare-datatypes ((List!11485 0))(
  ( (Nil!11482) (Cons!11481 (h!12526 (_ BitVec 64)) (t!17704 List!11485)) )
))
(declare-fun arrayNoDuplicates!0 (array!36261 (_ BitVec 32) List!11485) Bool)

(assert (=> b!580136 (= res!368095 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11482))))

(declare-fun res!368094 () Bool)

(assert (=> start!53346 (=> (not res!368094) (not e!333147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53346 (= res!368094 (validMask!0 mask!3053))))

(assert (=> start!53346 e!333147))

(assert (=> start!53346 true))

(declare-fun array_inv!13288 (array!36261) Bool)

(assert (=> start!53346 (array_inv!13288 a!2986)))

(declare-fun b!580133 () Bool)

(declare-fun res!368096 () Bool)

(assert (=> b!580133 (=> (not res!368096) (not e!333146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36261 (_ BitVec 32)) Bool)

(assert (=> b!580133 (= res!368096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580137 () Bool)

(assert (=> b!580137 (= e!333147 e!333146)))

(declare-fun res!368088 () Bool)

(assert (=> b!580137 (=> (not res!368088) (not e!333146))))

(declare-fun lt!264462 () SeekEntryResult!5842)

(assert (=> b!580137 (= res!368088 (or (= lt!264462 (MissingZero!5842 i!1108)) (= lt!264462 (MissingVacant!5842 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36261 (_ BitVec 32)) SeekEntryResult!5842)

(assert (=> b!580137 (= lt!264462 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580138 () Bool)

(declare-fun res!368092 () Bool)

(assert (=> b!580138 (=> (not res!368092) (not e!333147))))

(assert (=> b!580138 (= res!368092 (and (= (size!17770 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17770 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17770 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53346 res!368094) b!580138))

(assert (= (and b!580138 res!368092) b!580130))

(assert (= (and b!580130 res!368090) b!580134))

(assert (= (and b!580134 res!368093) b!580132))

(assert (= (and b!580132 res!368089) b!580137))

(assert (= (and b!580137 res!368088) b!580133))

(assert (= (and b!580133 res!368096) b!580136))

(assert (= (and b!580136 res!368095) b!580135))

(assert (= (and b!580135 res!368091) b!580131))

(declare-fun m!558199 () Bool)

(assert (=> b!580132 m!558199))

(declare-fun m!558201 () Bool)

(assert (=> b!580133 m!558201))

(declare-fun m!558203 () Bool)

(assert (=> b!580134 m!558203))

(declare-fun m!558205 () Bool)

(assert (=> b!580130 m!558205))

(assert (=> b!580130 m!558205))

(declare-fun m!558207 () Bool)

(assert (=> b!580130 m!558207))

(declare-fun m!558209 () Bool)

(assert (=> b!580135 m!558209))

(declare-fun m!558211 () Bool)

(assert (=> b!580135 m!558211))

(declare-fun m!558213 () Bool)

(assert (=> b!580135 m!558213))

(declare-fun m!558215 () Bool)

(assert (=> start!53346 m!558215))

(declare-fun m!558217 () Bool)

(assert (=> start!53346 m!558217))

(declare-fun m!558219 () Bool)

(assert (=> b!580137 m!558219))

(assert (=> b!580131 m!558205))

(assert (=> b!580131 m!558205))

(declare-fun m!558221 () Bool)

(assert (=> b!580131 m!558221))

(declare-fun m!558223 () Bool)

(assert (=> b!580136 m!558223))

(check-sat (not start!53346) (not b!580136) (not b!580133) (not b!580134) (not b!580137) (not b!580131) (not b!580130) (not b!580132))
(check-sat)
