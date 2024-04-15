; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53844 () Bool)

(assert start!53844)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!266161 () (_ BitVec 32))

(declare-fun e!335449 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!587145 () Bool)

(assert (=> b!587145 (= e!335449 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (bvslt lt!266161 #b00000000000000000000000000000000) (bvsge lt!266161 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000))))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36702 0))(
  ( (array!36703 (arr!17624 (Array (_ BitVec 32) (_ BitVec 64))) (size!17989 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36702)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6061 0))(
  ( (MissingZero!6061 (index!26474 (_ BitVec 32))) (Found!6061 (index!26475 (_ BitVec 32))) (Intermediate!6061 (undefined!6873 Bool) (index!26476 (_ BitVec 32)) (x!55294 (_ BitVec 32))) (Undefined!6061) (MissingVacant!6061 (index!26477 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36702 (_ BitVec 32)) SeekEntryResult!6061)

(assert (=> b!587145 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266161 vacantSpotIndex!68 (select (arr!17624 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266161 vacantSpotIndex!68 (select (store (arr!17624 a!2986) i!1108 k0!1786) j!136) (array!36703 (store (arr!17624 a!2986) i!1108 k0!1786) (size!17989 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18228 0))(
  ( (Unit!18229) )
))
(declare-fun lt!266159 () Unit!18228)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36702 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18228)

(assert (=> b!587145 (= lt!266159 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266161 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587145 (= lt!266161 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587146 () Bool)

(declare-fun res!374925 () Bool)

(assert (=> b!587146 (=> (not res!374925) (not e!335449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36702 (_ BitVec 32)) Bool)

(assert (=> b!587146 (= res!374925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587147 () Bool)

(declare-fun res!374923 () Bool)

(declare-fun e!335450 () Bool)

(assert (=> b!587147 (=> (not res!374923) (not e!335450))))

(declare-fun arrayContainsKey!0 (array!36702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587147 (= res!374923 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587148 () Bool)

(declare-fun res!374933 () Bool)

(assert (=> b!587148 (=> (not res!374933) (not e!335449))))

(assert (=> b!587148 (= res!374933 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17624 a!2986) index!984) (select (arr!17624 a!2986) j!136))) (not (= (select (arr!17624 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587149 () Bool)

(declare-fun res!374932 () Bool)

(assert (=> b!587149 (=> (not res!374932) (not e!335450))))

(assert (=> b!587149 (= res!374932 (and (= (size!17989 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17989 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17989 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587150 () Bool)

(declare-fun res!374924 () Bool)

(assert (=> b!587150 (=> (not res!374924) (not e!335450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587150 (= res!374924 (validKeyInArray!0 (select (arr!17624 a!2986) j!136)))))

(declare-fun b!587151 () Bool)

(assert (=> b!587151 (= e!335450 e!335449)))

(declare-fun res!374928 () Bool)

(assert (=> b!587151 (=> (not res!374928) (not e!335449))))

(declare-fun lt!266160 () SeekEntryResult!6061)

(assert (=> b!587151 (= res!374928 (or (= lt!266160 (MissingZero!6061 i!1108)) (= lt!266160 (MissingVacant!6061 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36702 (_ BitVec 32)) SeekEntryResult!6061)

(assert (=> b!587151 (= lt!266160 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587152 () Bool)

(declare-fun res!374927 () Bool)

(assert (=> b!587152 (=> (not res!374927) (not e!335449))))

(declare-datatypes ((List!11704 0))(
  ( (Nil!11701) (Cons!11700 (h!12745 (_ BitVec 64)) (t!17923 List!11704)) )
))
(declare-fun arrayNoDuplicates!0 (array!36702 (_ BitVec 32) List!11704) Bool)

(assert (=> b!587152 (= res!374927 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11701))))

(declare-fun b!587153 () Bool)

(declare-fun res!374926 () Bool)

(assert (=> b!587153 (=> (not res!374926) (not e!335449))))

(assert (=> b!587153 (= res!374926 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17624 a!2986) j!136) a!2986 mask!3053) (Found!6061 j!136)))))

(declare-fun res!374929 () Bool)

(assert (=> start!53844 (=> (not res!374929) (not e!335450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53844 (= res!374929 (validMask!0 mask!3053))))

(assert (=> start!53844 e!335450))

(assert (=> start!53844 true))

(declare-fun array_inv!13507 (array!36702) Bool)

(assert (=> start!53844 (array_inv!13507 a!2986)))

(declare-fun b!587154 () Bool)

(declare-fun res!374930 () Bool)

(assert (=> b!587154 (=> (not res!374930) (not e!335449))))

(assert (=> b!587154 (= res!374930 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17624 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17624 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587155 () Bool)

(declare-fun res!374931 () Bool)

(assert (=> b!587155 (=> (not res!374931) (not e!335450))))

(assert (=> b!587155 (= res!374931 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53844 res!374929) b!587149))

(assert (= (and b!587149 res!374932) b!587150))

(assert (= (and b!587150 res!374924) b!587155))

(assert (= (and b!587155 res!374931) b!587147))

(assert (= (and b!587147 res!374923) b!587151))

(assert (= (and b!587151 res!374928) b!587146))

(assert (= (and b!587146 res!374925) b!587152))

(assert (= (and b!587152 res!374927) b!587154))

(assert (= (and b!587154 res!374930) b!587153))

(assert (= (and b!587153 res!374926) b!587148))

(assert (= (and b!587148 res!374933) b!587145))

(declare-fun m!565027 () Bool)

(assert (=> b!587146 m!565027))

(declare-fun m!565029 () Bool)

(assert (=> start!53844 m!565029))

(declare-fun m!565031 () Bool)

(assert (=> start!53844 m!565031))

(declare-fun m!565033 () Bool)

(assert (=> b!587148 m!565033))

(declare-fun m!565035 () Bool)

(assert (=> b!587148 m!565035))

(assert (=> b!587153 m!565035))

(assert (=> b!587153 m!565035))

(declare-fun m!565037 () Bool)

(assert (=> b!587153 m!565037))

(declare-fun m!565039 () Bool)

(assert (=> b!587145 m!565039))

(declare-fun m!565041 () Bool)

(assert (=> b!587145 m!565041))

(assert (=> b!587145 m!565035))

(declare-fun m!565043 () Bool)

(assert (=> b!587145 m!565043))

(assert (=> b!587145 m!565035))

(declare-fun m!565045 () Bool)

(assert (=> b!587145 m!565045))

(declare-fun m!565047 () Bool)

(assert (=> b!587145 m!565047))

(assert (=> b!587145 m!565041))

(declare-fun m!565049 () Bool)

(assert (=> b!587145 m!565049))

(declare-fun m!565051 () Bool)

(assert (=> b!587152 m!565051))

(declare-fun m!565053 () Bool)

(assert (=> b!587151 m!565053))

(assert (=> b!587150 m!565035))

(assert (=> b!587150 m!565035))

(declare-fun m!565055 () Bool)

(assert (=> b!587150 m!565055))

(declare-fun m!565057 () Bool)

(assert (=> b!587147 m!565057))

(declare-fun m!565059 () Bool)

(assert (=> b!587155 m!565059))

(declare-fun m!565061 () Bool)

(assert (=> b!587154 m!565061))

(assert (=> b!587154 m!565045))

(declare-fun m!565063 () Bool)

(assert (=> b!587154 m!565063))

(check-sat (not b!587155) (not b!587152) (not start!53844) (not b!587150) (not b!587146) (not b!587153) (not b!587145) (not b!587147) (not b!587151))
(check-sat)
