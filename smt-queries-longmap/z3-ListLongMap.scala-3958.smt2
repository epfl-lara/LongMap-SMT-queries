; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53742 () Bool)

(assert start!53742)

(declare-fun b!586200 () Bool)

(declare-fun res!374159 () Bool)

(declare-fun e!335098 () Bool)

(assert (=> b!586200 (=> (not res!374159) (not e!335098))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586200 (= res!374159 (validKeyInArray!0 k0!1786))))

(declare-fun b!586201 () Bool)

(declare-fun res!374165 () Bool)

(assert (=> b!586201 (=> (not res!374165) (not e!335098))))

(declare-datatypes ((array!36657 0))(
  ( (array!36658 (arr!17603 (Array (_ BitVec 32) (_ BitVec 64))) (size!17968 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36657)

(declare-fun arrayContainsKey!0 (array!36657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586201 (= res!374165 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586202 () Bool)

(declare-fun e!335100 () Bool)

(assert (=> b!586202 (= e!335098 e!335100)))

(declare-fun res!374164 () Bool)

(assert (=> b!586202 (=> (not res!374164) (not e!335100))))

(declare-datatypes ((SeekEntryResult!6040 0))(
  ( (MissingZero!6040 (index!26387 (_ BitVec 32))) (Found!6040 (index!26388 (_ BitVec 32))) (Intermediate!6040 (undefined!6852 Bool) (index!26389 (_ BitVec 32)) (x!55208 (_ BitVec 32))) (Undefined!6040) (MissingVacant!6040 (index!26390 (_ BitVec 32))) )
))
(declare-fun lt!265869 () SeekEntryResult!6040)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586202 (= res!374164 (or (= lt!265869 (MissingZero!6040 i!1108)) (= lt!265869 (MissingVacant!6040 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36657 (_ BitVec 32)) SeekEntryResult!6040)

(assert (=> b!586202 (= lt!265869 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586203 () Bool)

(declare-fun res!374168 () Bool)

(assert (=> b!586203 (=> (not res!374168) (not e!335098))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!586203 (= res!374168 (validKeyInArray!0 (select (arr!17603 a!2986) j!136)))))

(declare-fun res!374162 () Bool)

(assert (=> start!53742 (=> (not res!374162) (not e!335098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53742 (= res!374162 (validMask!0 mask!3053))))

(assert (=> start!53742 e!335098))

(assert (=> start!53742 true))

(declare-fun array_inv!13486 (array!36657) Bool)

(assert (=> start!53742 (array_inv!13486 a!2986)))

(declare-fun b!586204 () Bool)

(declare-fun res!374158 () Bool)

(assert (=> b!586204 (=> (not res!374158) (not e!335100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36657 (_ BitVec 32)) Bool)

(assert (=> b!586204 (= res!374158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586205 () Bool)

(declare-fun res!374160 () Bool)

(assert (=> b!586205 (=> (not res!374160) (not e!335098))))

(assert (=> b!586205 (= res!374160 (and (= (size!17968 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17968 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17968 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586206 () Bool)

(declare-fun res!374166 () Bool)

(assert (=> b!586206 (=> (not res!374166) (not e!335100))))

(declare-datatypes ((List!11683 0))(
  ( (Nil!11680) (Cons!11679 (h!12724 (_ BitVec 64)) (t!17902 List!11683)) )
))
(declare-fun arrayNoDuplicates!0 (array!36657 (_ BitVec 32) List!11683) Bool)

(assert (=> b!586206 (= res!374166 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11680))))

(declare-fun b!586207 () Bool)

(declare-fun res!374161 () Bool)

(assert (=> b!586207 (=> (not res!374161) (not e!335100))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586207 (= res!374161 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17603 a!2986) index!984) (select (arr!17603 a!2986) j!136))) (not (= (select (arr!17603 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586208 () Bool)

(declare-fun res!374167 () Bool)

(assert (=> b!586208 (=> (not res!374167) (not e!335100))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36657 (_ BitVec 32)) SeekEntryResult!6040)

(assert (=> b!586208 (= res!374167 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17603 a!2986) j!136) a!2986 mask!3053) (Found!6040 j!136)))))

(declare-fun b!586209 () Bool)

(declare-fun res!374163 () Bool)

(assert (=> b!586209 (=> (not res!374163) (not e!335100))))

(assert (=> b!586209 (= res!374163 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17603 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17603 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586210 () Bool)

(assert (=> b!586210 (= e!335100 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!265868 () (_ BitVec 32))

(assert (=> b!586210 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265868 vacantSpotIndex!68 (select (arr!17603 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265868 vacantSpotIndex!68 (select (store (arr!17603 a!2986) i!1108 k0!1786) j!136) (array!36658 (store (arr!17603 a!2986) i!1108 k0!1786) (size!17968 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18186 0))(
  ( (Unit!18187) )
))
(declare-fun lt!265870 () Unit!18186)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18186)

(assert (=> b!586210 (= lt!265870 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265868 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586210 (= lt!265868 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53742 res!374162) b!586205))

(assert (= (and b!586205 res!374160) b!586203))

(assert (= (and b!586203 res!374168) b!586200))

(assert (= (and b!586200 res!374159) b!586201))

(assert (= (and b!586201 res!374165) b!586202))

(assert (= (and b!586202 res!374164) b!586204))

(assert (= (and b!586204 res!374158) b!586206))

(assert (= (and b!586206 res!374166) b!586209))

(assert (= (and b!586209 res!374163) b!586208))

(assert (= (and b!586208 res!374167) b!586207))

(assert (= (and b!586207 res!374161) b!586210))

(declare-fun m!564049 () Bool)

(assert (=> b!586203 m!564049))

(assert (=> b!586203 m!564049))

(declare-fun m!564051 () Bool)

(assert (=> b!586203 m!564051))

(declare-fun m!564053 () Bool)

(assert (=> b!586202 m!564053))

(declare-fun m!564055 () Bool)

(assert (=> b!586204 m!564055))

(declare-fun m!564057 () Bool)

(assert (=> b!586201 m!564057))

(declare-fun m!564059 () Bool)

(assert (=> b!586209 m!564059))

(declare-fun m!564061 () Bool)

(assert (=> b!586209 m!564061))

(declare-fun m!564063 () Bool)

(assert (=> b!586209 m!564063))

(declare-fun m!564065 () Bool)

(assert (=> start!53742 m!564065))

(declare-fun m!564067 () Bool)

(assert (=> start!53742 m!564067))

(declare-fun m!564069 () Bool)

(assert (=> b!586210 m!564069))

(declare-fun m!564071 () Bool)

(assert (=> b!586210 m!564071))

(assert (=> b!586210 m!564049))

(assert (=> b!586210 m!564061))

(declare-fun m!564073 () Bool)

(assert (=> b!586210 m!564073))

(assert (=> b!586210 m!564071))

(declare-fun m!564075 () Bool)

(assert (=> b!586210 m!564075))

(assert (=> b!586210 m!564049))

(declare-fun m!564077 () Bool)

(assert (=> b!586210 m!564077))

(declare-fun m!564079 () Bool)

(assert (=> b!586206 m!564079))

(declare-fun m!564081 () Bool)

(assert (=> b!586200 m!564081))

(assert (=> b!586208 m!564049))

(assert (=> b!586208 m!564049))

(declare-fun m!564083 () Bool)

(assert (=> b!586208 m!564083))

(declare-fun m!564085 () Bool)

(assert (=> b!586207 m!564085))

(assert (=> b!586207 m!564049))

(check-sat (not b!586206) (not start!53742) (not b!586200) (not b!586203) (not b!586208) (not b!586210) (not b!586204) (not b!586201) (not b!586202))
(check-sat)
