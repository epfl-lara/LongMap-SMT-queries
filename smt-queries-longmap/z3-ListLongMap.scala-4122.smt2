; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56328 () Bool)

(assert start!56328)

(declare-fun b!624064 () Bool)

(declare-fun res!402146 () Bool)

(declare-fun e!357957 () Bool)

(assert (=> b!624064 (=> (not res!402146) (not e!357957))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37698 0))(
  ( (array!37699 (arr!18091 (Array (_ BitVec 32) (_ BitVec 64))) (size!18455 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37698)

(assert (=> b!624064 (= res!402146 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18091 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18091 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!402148 () Bool)

(declare-fun e!357955 () Bool)

(assert (=> start!56328 (=> (not res!402148) (not e!357955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56328 (= res!402148 (validMask!0 mask!3053))))

(assert (=> start!56328 e!357955))

(assert (=> start!56328 true))

(declare-fun array_inv!13950 (array!37698) Bool)

(assert (=> start!56328 (array_inv!13950 a!2986)))

(declare-fun b!624065 () Bool)

(declare-fun res!402149 () Bool)

(assert (=> b!624065 (=> (not res!402149) (not e!357957))))

(declare-datatypes ((List!12039 0))(
  ( (Nil!12036) (Cons!12035 (h!13083 (_ BitVec 64)) (t!18259 List!12039)) )
))
(declare-fun arrayNoDuplicates!0 (array!37698 (_ BitVec 32) List!12039) Bool)

(assert (=> b!624065 (= res!402149 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12036))))

(declare-fun b!624066 () Bool)

(declare-fun res!402145 () Bool)

(assert (=> b!624066 (=> (not res!402145) (not e!357957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37698 (_ BitVec 32)) Bool)

(assert (=> b!624066 (= res!402145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624067 () Bool)

(declare-fun res!402152 () Bool)

(assert (=> b!624067 (=> (not res!402152) (not e!357955))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624067 (= res!402152 (and (= (size!18455 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18455 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18455 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624068 () Bool)

(assert (=> b!624068 (= e!357955 e!357957)))

(declare-fun res!402153 () Bool)

(assert (=> b!624068 (=> (not res!402153) (not e!357957))))

(declare-datatypes ((SeekEntryResult!6487 0))(
  ( (MissingZero!6487 (index!28232 (_ BitVec 32))) (Found!6487 (index!28233 (_ BitVec 32))) (Intermediate!6487 (undefined!7299 Bool) (index!28234 (_ BitVec 32)) (x!57149 (_ BitVec 32))) (Undefined!6487) (MissingVacant!6487 (index!28235 (_ BitVec 32))) )
))
(declare-fun lt!289483 () SeekEntryResult!6487)

(assert (=> b!624068 (= res!402153 (or (= lt!289483 (MissingZero!6487 i!1108)) (= lt!289483 (MissingVacant!6487 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37698 (_ BitVec 32)) SeekEntryResult!6487)

(assert (=> b!624068 (= lt!289483 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624069 () Bool)

(assert (=> b!624069 (= e!357957 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18091 a!2986) index!984) (select (arr!18091 a!2986) j!136))) (not (= (select (arr!18091 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (= index!984 j!136)))))

(declare-fun b!624070 () Bool)

(declare-fun res!402150 () Bool)

(assert (=> b!624070 (=> (not res!402150) (not e!357955))))

(declare-fun arrayContainsKey!0 (array!37698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624070 (= res!402150 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624071 () Bool)

(declare-fun res!402147 () Bool)

(assert (=> b!624071 (=> (not res!402147) (not e!357955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624071 (= res!402147 (validKeyInArray!0 k0!1786))))

(declare-fun b!624072 () Bool)

(declare-fun res!402151 () Bool)

(assert (=> b!624072 (=> (not res!402151) (not e!357957))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37698 (_ BitVec 32)) SeekEntryResult!6487)

(assert (=> b!624072 (= res!402151 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18091 a!2986) j!136) a!2986 mask!3053) (Found!6487 j!136)))))

(declare-fun b!624073 () Bool)

(declare-fun res!402154 () Bool)

(assert (=> b!624073 (=> (not res!402154) (not e!357955))))

(assert (=> b!624073 (= res!402154 (validKeyInArray!0 (select (arr!18091 a!2986) j!136)))))

(assert (= (and start!56328 res!402148) b!624067))

(assert (= (and b!624067 res!402152) b!624073))

(assert (= (and b!624073 res!402154) b!624071))

(assert (= (and b!624071 res!402147) b!624070))

(assert (= (and b!624070 res!402150) b!624068))

(assert (= (and b!624068 res!402153) b!624066))

(assert (= (and b!624066 res!402145) b!624065))

(assert (= (and b!624065 res!402149) b!624064))

(assert (= (and b!624064 res!402146) b!624072))

(assert (= (and b!624072 res!402151) b!624069))

(declare-fun m!600103 () Bool)

(assert (=> b!624069 m!600103))

(declare-fun m!600105 () Bool)

(assert (=> b!624069 m!600105))

(declare-fun m!600107 () Bool)

(assert (=> b!624071 m!600107))

(declare-fun m!600109 () Bool)

(assert (=> b!624070 m!600109))

(assert (=> b!624072 m!600105))

(assert (=> b!624072 m!600105))

(declare-fun m!600111 () Bool)

(assert (=> b!624072 m!600111))

(declare-fun m!600113 () Bool)

(assert (=> b!624068 m!600113))

(declare-fun m!600115 () Bool)

(assert (=> b!624065 m!600115))

(declare-fun m!600117 () Bool)

(assert (=> b!624064 m!600117))

(declare-fun m!600119 () Bool)

(assert (=> b!624064 m!600119))

(declare-fun m!600121 () Bool)

(assert (=> b!624064 m!600121))

(declare-fun m!600123 () Bool)

(assert (=> start!56328 m!600123))

(declare-fun m!600125 () Bool)

(assert (=> start!56328 m!600125))

(declare-fun m!600127 () Bool)

(assert (=> b!624066 m!600127))

(assert (=> b!624073 m!600105))

(assert (=> b!624073 m!600105))

(declare-fun m!600129 () Bool)

(assert (=> b!624073 m!600129))

(check-sat (not b!624066) (not b!624068) (not b!624071) (not b!624073) (not b!624065) (not b!624070) (not start!56328) (not b!624072))
(check-sat)
