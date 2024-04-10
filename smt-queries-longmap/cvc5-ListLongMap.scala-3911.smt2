; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53476 () Bool)

(assert start!53476)

(declare-fun b!581976 () Bool)

(declare-fun e!333833 () Bool)

(declare-fun e!333834 () Bool)

(assert (=> b!581976 (= e!333833 e!333834)))

(declare-fun res!369800 () Bool)

(assert (=> b!581976 (=> (not res!369800) (not e!333834))))

(declare-datatypes ((SeekEntryResult!5903 0))(
  ( (MissingZero!5903 (index!25839 (_ BitVec 32))) (Found!5903 (index!25840 (_ BitVec 32))) (Intermediate!5903 (undefined!6715 Bool) (index!25841 (_ BitVec 32)) (x!54700 (_ BitVec 32))) (Undefined!5903) (MissingVacant!5903 (index!25842 (_ BitVec 32))) )
))
(declare-fun lt!265012 () SeekEntryResult!5903)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581976 (= res!369800 (or (= lt!265012 (MissingZero!5903 i!1108)) (= lt!265012 (MissingVacant!5903 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36377 0))(
  ( (array!36378 (arr!17463 (Array (_ BitVec 32) (_ BitVec 64))) (size!17827 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36377)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36377 (_ BitVec 32)) SeekEntryResult!5903)

(assert (=> b!581976 (= lt!265012 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581977 () Bool)

(declare-fun res!369794 () Bool)

(assert (=> b!581977 (=> (not res!369794) (not e!333834))))

(declare-datatypes ((List!11504 0))(
  ( (Nil!11501) (Cons!11500 (h!12545 (_ BitVec 64)) (t!17732 List!11504)) )
))
(declare-fun arrayNoDuplicates!0 (array!36377 (_ BitVec 32) List!11504) Bool)

(assert (=> b!581977 (= res!369794 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11501))))

(declare-fun b!581978 () Bool)

(declare-fun res!369793 () Bool)

(assert (=> b!581978 (=> (not res!369793) (not e!333834))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581978 (= res!369793 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17463 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17463 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581979 () Bool)

(declare-fun res!369797 () Bool)

(assert (=> b!581979 (=> (not res!369797) (not e!333833))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581979 (= res!369797 (validKeyInArray!0 (select (arr!17463 a!2986) j!136)))))

(declare-fun b!581980 () Bool)

(assert (=> b!581980 (= e!333834 false)))

(declare-fun lt!265011 () SeekEntryResult!5903)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36377 (_ BitVec 32)) SeekEntryResult!5903)

(assert (=> b!581980 (= lt!265011 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17463 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!369795 () Bool)

(assert (=> start!53476 (=> (not res!369795) (not e!333833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53476 (= res!369795 (validMask!0 mask!3053))))

(assert (=> start!53476 e!333833))

(assert (=> start!53476 true))

(declare-fun array_inv!13259 (array!36377) Bool)

(assert (=> start!53476 (array_inv!13259 a!2986)))

(declare-fun b!581981 () Bool)

(declare-fun res!369799 () Bool)

(assert (=> b!581981 (=> (not res!369799) (not e!333834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36377 (_ BitVec 32)) Bool)

(assert (=> b!581981 (= res!369799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581982 () Bool)

(declare-fun res!369796 () Bool)

(assert (=> b!581982 (=> (not res!369796) (not e!333833))))

(declare-fun arrayContainsKey!0 (array!36377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581982 (= res!369796 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581983 () Bool)

(declare-fun res!369792 () Bool)

(assert (=> b!581983 (=> (not res!369792) (not e!333833))))

(assert (=> b!581983 (= res!369792 (validKeyInArray!0 k!1786))))

(declare-fun b!581984 () Bool)

(declare-fun res!369798 () Bool)

(assert (=> b!581984 (=> (not res!369798) (not e!333833))))

(assert (=> b!581984 (= res!369798 (and (= (size!17827 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17827 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17827 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53476 res!369795) b!581984))

(assert (= (and b!581984 res!369798) b!581979))

(assert (= (and b!581979 res!369797) b!581983))

(assert (= (and b!581983 res!369792) b!581982))

(assert (= (and b!581982 res!369796) b!581976))

(assert (= (and b!581976 res!369800) b!581981))

(assert (= (and b!581981 res!369799) b!581977))

(assert (= (and b!581977 res!369794) b!581978))

(assert (= (and b!581978 res!369793) b!581980))

(declare-fun m!560497 () Bool)

(assert (=> b!581981 m!560497))

(declare-fun m!560499 () Bool)

(assert (=> b!581978 m!560499))

(declare-fun m!560501 () Bool)

(assert (=> b!581978 m!560501))

(declare-fun m!560503 () Bool)

(assert (=> b!581978 m!560503))

(declare-fun m!560505 () Bool)

(assert (=> start!53476 m!560505))

(declare-fun m!560507 () Bool)

(assert (=> start!53476 m!560507))

(declare-fun m!560509 () Bool)

(assert (=> b!581976 m!560509))

(declare-fun m!560511 () Bool)

(assert (=> b!581979 m!560511))

(assert (=> b!581979 m!560511))

(declare-fun m!560513 () Bool)

(assert (=> b!581979 m!560513))

(declare-fun m!560515 () Bool)

(assert (=> b!581977 m!560515))

(assert (=> b!581980 m!560511))

(assert (=> b!581980 m!560511))

(declare-fun m!560517 () Bool)

(assert (=> b!581980 m!560517))

(declare-fun m!560519 () Bool)

(assert (=> b!581982 m!560519))

(declare-fun m!560521 () Bool)

(assert (=> b!581983 m!560521))

(push 1)

