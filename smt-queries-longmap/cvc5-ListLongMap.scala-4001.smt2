; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54262 () Bool)

(assert start!54262)

(declare-datatypes ((array!36929 0))(
  ( (array!36930 (arr!17733 (Array (_ BitVec 32) (_ BitVec 64))) (size!18097 (_ BitVec 32))) )
))
(declare-fun lt!269214 () array!36929)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!338689 () Bool)

(declare-fun b!593000 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!36929)

(declare-fun arrayContainsKey!0 (array!36929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593000 (= e!338689 (arrayContainsKey!0 lt!269214 (select (arr!17733 a!2986) j!136) index!984))))

(declare-fun b!593001 () Bool)

(declare-fun res!379620 () Bool)

(declare-fun e!338680 () Bool)

(assert (=> b!593001 (=> (not res!379620) (not e!338680))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!593001 (= res!379620 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!379615 () Bool)

(assert (=> start!54262 (=> (not res!379615) (not e!338680))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54262 (= res!379615 (validMask!0 mask!3053))))

(assert (=> start!54262 e!338680))

(assert (=> start!54262 true))

(declare-fun array_inv!13529 (array!36929) Bool)

(assert (=> start!54262 (array_inv!13529 a!2986)))

(declare-fun b!593002 () Bool)

(declare-datatypes ((Unit!18610 0))(
  ( (Unit!18611) )
))
(declare-fun e!338688 () Unit!18610)

(declare-fun Unit!18612 () Unit!18610)

(assert (=> b!593002 (= e!338688 Unit!18612)))

(declare-fun b!593003 () Bool)

(declare-fun e!338682 () Bool)

(declare-datatypes ((SeekEntryResult!6173 0))(
  ( (MissingZero!6173 (index!26931 (_ BitVec 32))) (Found!6173 (index!26932 (_ BitVec 32))) (Intermediate!6173 (undefined!6985 Bool) (index!26933 (_ BitVec 32)) (x!55726 (_ BitVec 32))) (Undefined!6173) (MissingVacant!6173 (index!26934 (_ BitVec 32))) )
))
(declare-fun lt!269216 () SeekEntryResult!6173)

(declare-fun lt!269218 () SeekEntryResult!6173)

(assert (=> b!593003 (= e!338682 (= lt!269216 lt!269218))))

(declare-fun b!593004 () Bool)

(declare-fun e!338687 () Bool)

(declare-fun e!338684 () Bool)

(assert (=> b!593004 (= e!338687 e!338684)))

(declare-fun res!379611 () Bool)

(assert (=> b!593004 (=> res!379611 e!338684)))

(declare-fun lt!269210 () (_ BitVec 64))

(declare-fun lt!269217 () (_ BitVec 64))

(assert (=> b!593004 (= res!379611 (or (not (= (select (arr!17733 a!2986) j!136) lt!269210)) (not (= (select (arr!17733 a!2986) j!136) lt!269217)) (bvsge j!136 index!984)))))

(declare-fun b!593005 () Bool)

(declare-fun res!379618 () Bool)

(declare-fun e!338683 () Bool)

(assert (=> b!593005 (=> (not res!379618) (not e!338683))))

(declare-datatypes ((List!11774 0))(
  ( (Nil!11771) (Cons!11770 (h!12815 (_ BitVec 64)) (t!18002 List!11774)) )
))
(declare-fun arrayNoDuplicates!0 (array!36929 (_ BitVec 32) List!11774) Bool)

(assert (=> b!593005 (= res!379618 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11771))))

(declare-fun b!593006 () Bool)

(declare-fun res!379614 () Bool)

(assert (=> b!593006 (=> (not res!379614) (not e!338680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593006 (= res!379614 (validKeyInArray!0 (select (arr!17733 a!2986) j!136)))))

(declare-fun b!593007 () Bool)

(declare-fun e!338686 () Bool)

(assert (=> b!593007 (= e!338686 (or (bvsgt #b00000000000000000000000000000000 (size!18097 a!2986)) (bvslt (size!18097 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!593007 (arrayContainsKey!0 lt!269214 (select (arr!17733 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269215 () Unit!18610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36929 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18610)

(assert (=> b!593007 (= lt!269215 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269214 (select (arr!17733 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!593008 () Bool)

(declare-fun e!338690 () Bool)

(declare-fun e!338691 () Bool)

(assert (=> b!593008 (= e!338690 (not e!338691))))

(declare-fun res!379617 () Bool)

(assert (=> b!593008 (=> res!379617 e!338691)))

(declare-fun lt!269208 () SeekEntryResult!6173)

(assert (=> b!593008 (= res!379617 (not (= lt!269208 (Found!6173 index!984))))))

(declare-fun lt!269211 () Unit!18610)

(assert (=> b!593008 (= lt!269211 e!338688)))

(declare-fun c!67064 () Bool)

(assert (=> b!593008 (= c!67064 (= lt!269208 Undefined!6173))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36929 (_ BitVec 32)) SeekEntryResult!6173)

(assert (=> b!593008 (= lt!269208 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269210 lt!269214 mask!3053))))

(assert (=> b!593008 e!338682))

(declare-fun res!379616 () Bool)

(assert (=> b!593008 (=> (not res!379616) (not e!338682))))

(declare-fun lt!269213 () (_ BitVec 32))

(assert (=> b!593008 (= res!379616 (= lt!269218 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269213 vacantSpotIndex!68 lt!269210 lt!269214 mask!3053)))))

(assert (=> b!593008 (= lt!269218 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269213 vacantSpotIndex!68 (select (arr!17733 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!593008 (= lt!269210 (select (store (arr!17733 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269209 () Unit!18610)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18610)

(assert (=> b!593008 (= lt!269209 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269213 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593008 (= lt!269213 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!593009 () Bool)

(assert (=> b!593009 (= e!338684 e!338689)))

(declare-fun res!379619 () Bool)

(assert (=> b!593009 (=> (not res!379619) (not e!338689))))

(assert (=> b!593009 (= res!379619 (arrayContainsKey!0 lt!269214 (select (arr!17733 a!2986) j!136) j!136))))

(declare-fun b!593010 () Bool)

(assert (=> b!593010 (= e!338691 e!338686)))

(declare-fun res!379609 () Bool)

(assert (=> b!593010 (=> res!379609 e!338686)))

(assert (=> b!593010 (= res!379609 (or (not (= (select (arr!17733 a!2986) j!136) lt!269210)) (not (= (select (arr!17733 a!2986) j!136) lt!269217)) (bvsge j!136 index!984)))))

(assert (=> b!593010 e!338687))

(declare-fun res!379607 () Bool)

(assert (=> b!593010 (=> (not res!379607) (not e!338687))))

(assert (=> b!593010 (= res!379607 (= lt!269217 (select (arr!17733 a!2986) j!136)))))

(assert (=> b!593010 (= lt!269217 (select (store (arr!17733 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!593011 () Bool)

(declare-fun res!379606 () Bool)

(assert (=> b!593011 (=> (not res!379606) (not e!338683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36929 (_ BitVec 32)) Bool)

(assert (=> b!593011 (= res!379606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593012 () Bool)

(declare-fun res!379610 () Bool)

(assert (=> b!593012 (=> (not res!379610) (not e!338680))))

(assert (=> b!593012 (= res!379610 (and (= (size!18097 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18097 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18097 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593013 () Bool)

(declare-fun res!379613 () Bool)

(assert (=> b!593013 (=> (not res!379613) (not e!338680))))

(assert (=> b!593013 (= res!379613 (validKeyInArray!0 k!1786))))

(declare-fun b!593014 () Bool)

(declare-fun e!338681 () Bool)

(assert (=> b!593014 (= e!338683 e!338681)))

(declare-fun res!379621 () Bool)

(assert (=> b!593014 (=> (not res!379621) (not e!338681))))

(assert (=> b!593014 (= res!379621 (= (select (store (arr!17733 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593014 (= lt!269214 (array!36930 (store (arr!17733 a!2986) i!1108 k!1786) (size!18097 a!2986)))))

(declare-fun b!593015 () Bool)

(declare-fun res!379608 () Bool)

(assert (=> b!593015 (=> (not res!379608) (not e!338683))))

(assert (=> b!593015 (= res!379608 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17733 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593016 () Bool)

(declare-fun Unit!18613 () Unit!18610)

(assert (=> b!593016 (= e!338688 Unit!18613)))

(assert (=> b!593016 false))

(declare-fun b!593017 () Bool)

(assert (=> b!593017 (= e!338681 e!338690)))

(declare-fun res!379612 () Bool)

(assert (=> b!593017 (=> (not res!379612) (not e!338690))))

(assert (=> b!593017 (= res!379612 (and (= lt!269216 (Found!6173 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17733 a!2986) index!984) (select (arr!17733 a!2986) j!136))) (not (= (select (arr!17733 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!593017 (= lt!269216 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17733 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593018 () Bool)

(assert (=> b!593018 (= e!338680 e!338683)))

(declare-fun res!379622 () Bool)

(assert (=> b!593018 (=> (not res!379622) (not e!338683))))

(declare-fun lt!269212 () SeekEntryResult!6173)

(assert (=> b!593018 (= res!379622 (or (= lt!269212 (MissingZero!6173 i!1108)) (= lt!269212 (MissingVacant!6173 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36929 (_ BitVec 32)) SeekEntryResult!6173)

(assert (=> b!593018 (= lt!269212 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!54262 res!379615) b!593012))

(assert (= (and b!593012 res!379610) b!593006))

(assert (= (and b!593006 res!379614) b!593013))

(assert (= (and b!593013 res!379613) b!593001))

(assert (= (and b!593001 res!379620) b!593018))

(assert (= (and b!593018 res!379622) b!593011))

(assert (= (and b!593011 res!379606) b!593005))

(assert (= (and b!593005 res!379618) b!593015))

(assert (= (and b!593015 res!379608) b!593014))

(assert (= (and b!593014 res!379621) b!593017))

(assert (= (and b!593017 res!379612) b!593008))

(assert (= (and b!593008 res!379616) b!593003))

(assert (= (and b!593008 c!67064) b!593016))

(assert (= (and b!593008 (not c!67064)) b!593002))

(assert (= (and b!593008 (not res!379617)) b!593010))

(assert (= (and b!593010 res!379607) b!593004))

(assert (= (and b!593004 (not res!379611)) b!593009))

(assert (= (and b!593009 res!379619) b!593000))

(assert (= (and b!593010 (not res!379609)) b!593007))

(declare-fun m!571033 () Bool)

(assert (=> b!593008 m!571033))

(declare-fun m!571035 () Bool)

(assert (=> b!593008 m!571035))

(declare-fun m!571037 () Bool)

(assert (=> b!593008 m!571037))

(declare-fun m!571039 () Bool)

(assert (=> b!593008 m!571039))

(declare-fun m!571041 () Bool)

(assert (=> b!593008 m!571041))

(declare-fun m!571043 () Bool)

(assert (=> b!593008 m!571043))

(assert (=> b!593008 m!571035))

(declare-fun m!571045 () Bool)

(assert (=> b!593008 m!571045))

(declare-fun m!571047 () Bool)

(assert (=> b!593008 m!571047))

(assert (=> b!593014 m!571037))

(declare-fun m!571049 () Bool)

(assert (=> b!593014 m!571049))

(assert (=> b!593006 m!571035))

(assert (=> b!593006 m!571035))

(declare-fun m!571051 () Bool)

(assert (=> b!593006 m!571051))

(declare-fun m!571053 () Bool)

(assert (=> b!593011 m!571053))

(assert (=> b!593000 m!571035))

(assert (=> b!593000 m!571035))

(declare-fun m!571055 () Bool)

(assert (=> b!593000 m!571055))

(declare-fun m!571057 () Bool)

(assert (=> b!593005 m!571057))

(declare-fun m!571059 () Bool)

(assert (=> b!593017 m!571059))

(assert (=> b!593017 m!571035))

(assert (=> b!593017 m!571035))

(declare-fun m!571061 () Bool)

(assert (=> b!593017 m!571061))

(declare-fun m!571063 () Bool)

(assert (=> b!593015 m!571063))

(assert (=> b!593007 m!571035))

(assert (=> b!593007 m!571035))

(declare-fun m!571065 () Bool)

(assert (=> b!593007 m!571065))

(assert (=> b!593007 m!571035))

(declare-fun m!571067 () Bool)

(assert (=> b!593007 m!571067))

(assert (=> b!593010 m!571035))

(assert (=> b!593010 m!571037))

(declare-fun m!571069 () Bool)

(assert (=> b!593010 m!571069))

(assert (=> b!593004 m!571035))

(declare-fun m!571071 () Bool)

(assert (=> b!593013 m!571071))

(declare-fun m!571073 () Bool)

(assert (=> b!593018 m!571073))

(declare-fun m!571075 () Bool)

(assert (=> b!593001 m!571075))

(declare-fun m!571077 () Bool)

(assert (=> start!54262 m!571077))

(declare-fun m!571079 () Bool)

(assert (=> start!54262 m!571079))

(assert (=> b!593009 m!571035))

(assert (=> b!593009 m!571035))

(declare-fun m!571081 () Bool)

(assert (=> b!593009 m!571081))

(push 1)

(assert (not b!593006))

(assert (not b!593008))

(assert (not b!593005))

(assert (not start!54262))

(assert (not b!593017))

(assert (not b!593001))

(assert (not b!593011))

(assert (not b!593018))

(assert (not b!593000))

(assert (not b!593007))

(assert (not b!593009))

(assert (not b!593013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

