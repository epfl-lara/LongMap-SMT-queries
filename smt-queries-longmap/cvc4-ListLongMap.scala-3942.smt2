; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53666 () Bool)

(assert start!53666)

(declare-fun b!584898 () Bool)

(declare-fun res!372720 () Bool)

(declare-fun e!334805 () Bool)

(assert (=> b!584898 (=> (not res!372720) (not e!334805))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36567 0))(
  ( (array!36568 (arr!17558 (Array (_ BitVec 32) (_ BitVec 64))) (size!17922 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36567)

(assert (=> b!584898 (= res!372720 (and (= (size!17922 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17922 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17922 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!372716 () Bool)

(assert (=> start!53666 (=> (not res!372716) (not e!334805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53666 (= res!372716 (validMask!0 mask!3053))))

(assert (=> start!53666 e!334805))

(assert (=> start!53666 true))

(declare-fun array_inv!13354 (array!36567) Bool)

(assert (=> start!53666 (array_inv!13354 a!2986)))

(declare-fun b!584899 () Bool)

(declare-fun res!372719 () Bool)

(assert (=> b!584899 (=> (not res!372719) (not e!334805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584899 (= res!372719 (validKeyInArray!0 (select (arr!17558 a!2986) j!136)))))

(declare-fun b!584900 () Bool)

(declare-fun res!372714 () Bool)

(declare-fun e!334806 () Bool)

(assert (=> b!584900 (=> (not res!372714) (not e!334806))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584900 (= res!372714 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17558 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17558 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584901 () Bool)

(declare-fun e!334804 () Bool)

(assert (=> b!584901 (= e!334804 false)))

(declare-datatypes ((SeekEntryResult!5998 0))(
  ( (MissingZero!5998 (index!26219 (_ BitVec 32))) (Found!5998 (index!26220 (_ BitVec 32))) (Intermediate!5998 (undefined!6810 Bool) (index!26221 (_ BitVec 32)) (x!55043 (_ BitVec 32))) (Undefined!5998) (MissingVacant!5998 (index!26222 (_ BitVec 32))) )
))
(declare-fun lt!265689 () SeekEntryResult!5998)

(declare-fun lt!265688 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36567 (_ BitVec 32)) SeekEntryResult!5998)

(assert (=> b!584901 (= lt!265689 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265688 vacantSpotIndex!68 (select (arr!17558 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584902 () Bool)

(declare-fun res!372718 () Bool)

(assert (=> b!584902 (=> (not res!372718) (not e!334806))))

(declare-datatypes ((List!11599 0))(
  ( (Nil!11596) (Cons!11595 (h!12640 (_ BitVec 64)) (t!17827 List!11599)) )
))
(declare-fun arrayNoDuplicates!0 (array!36567 (_ BitVec 32) List!11599) Bool)

(assert (=> b!584902 (= res!372718 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11596))))

(declare-fun b!584903 () Bool)

(assert (=> b!584903 (= e!334805 e!334806)))

(declare-fun res!372724 () Bool)

(assert (=> b!584903 (=> (not res!372724) (not e!334806))))

(declare-fun lt!265690 () SeekEntryResult!5998)

(assert (=> b!584903 (= res!372724 (or (= lt!265690 (MissingZero!5998 i!1108)) (= lt!265690 (MissingVacant!5998 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36567 (_ BitVec 32)) SeekEntryResult!5998)

(assert (=> b!584903 (= lt!265690 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584904 () Bool)

(assert (=> b!584904 (= e!334806 e!334804)))

(declare-fun res!372725 () Bool)

(assert (=> b!584904 (=> (not res!372725) (not e!334804))))

(assert (=> b!584904 (= res!372725 (and (bvsge lt!265688 #b00000000000000000000000000000000) (bvslt lt!265688 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584904 (= lt!265688 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584905 () Bool)

(declare-fun res!372715 () Bool)

(assert (=> b!584905 (=> (not res!372715) (not e!334806))))

(assert (=> b!584905 (= res!372715 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17558 a!2986) index!984) (select (arr!17558 a!2986) j!136))) (not (= (select (arr!17558 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584906 () Bool)

(declare-fun res!372717 () Bool)

(assert (=> b!584906 (=> (not res!372717) (not e!334806))))

(assert (=> b!584906 (= res!372717 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17558 a!2986) j!136) a!2986 mask!3053) (Found!5998 j!136)))))

(declare-fun b!584907 () Bool)

(declare-fun res!372722 () Bool)

(assert (=> b!584907 (=> (not res!372722) (not e!334805))))

(assert (=> b!584907 (= res!372722 (validKeyInArray!0 k!1786))))

(declare-fun b!584908 () Bool)

(declare-fun res!372723 () Bool)

(assert (=> b!584908 (=> (not res!372723) (not e!334806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36567 (_ BitVec 32)) Bool)

(assert (=> b!584908 (= res!372723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584909 () Bool)

(declare-fun res!372721 () Bool)

(assert (=> b!584909 (=> (not res!372721) (not e!334805))))

(declare-fun arrayContainsKey!0 (array!36567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584909 (= res!372721 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53666 res!372716) b!584898))

(assert (= (and b!584898 res!372720) b!584899))

(assert (= (and b!584899 res!372719) b!584907))

(assert (= (and b!584907 res!372722) b!584909))

(assert (= (and b!584909 res!372721) b!584903))

(assert (= (and b!584903 res!372724) b!584908))

(assert (= (and b!584908 res!372723) b!584902))

(assert (= (and b!584902 res!372718) b!584900))

(assert (= (and b!584900 res!372714) b!584906))

(assert (= (and b!584906 res!372717) b!584905))

(assert (= (and b!584905 res!372715) b!584904))

(assert (= (and b!584904 res!372725) b!584901))

(declare-fun m!563201 () Bool)

(assert (=> b!584903 m!563201))

(declare-fun m!563203 () Bool)

(assert (=> b!584905 m!563203))

(declare-fun m!563205 () Bool)

(assert (=> b!584905 m!563205))

(declare-fun m!563207 () Bool)

(assert (=> b!584908 m!563207))

(assert (=> b!584901 m!563205))

(assert (=> b!584901 m!563205))

(declare-fun m!563209 () Bool)

(assert (=> b!584901 m!563209))

(declare-fun m!563211 () Bool)

(assert (=> b!584902 m!563211))

(assert (=> b!584899 m!563205))

(assert (=> b!584899 m!563205))

(declare-fun m!563213 () Bool)

(assert (=> b!584899 m!563213))

(declare-fun m!563215 () Bool)

(assert (=> b!584904 m!563215))

(declare-fun m!563217 () Bool)

(assert (=> b!584909 m!563217))

(declare-fun m!563219 () Bool)

(assert (=> b!584900 m!563219))

(declare-fun m!563221 () Bool)

(assert (=> b!584900 m!563221))

(declare-fun m!563223 () Bool)

(assert (=> b!584900 m!563223))

(declare-fun m!563225 () Bool)

(assert (=> start!53666 m!563225))

(declare-fun m!563227 () Bool)

(assert (=> start!53666 m!563227))

(assert (=> b!584906 m!563205))

(assert (=> b!584906 m!563205))

(declare-fun m!563229 () Bool)

(assert (=> b!584906 m!563229))

(declare-fun m!563231 () Bool)

(assert (=> b!584907 m!563231))

(push 1)

