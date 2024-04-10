; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56286 () Bool)

(assert start!56286)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!289434 () (_ BitVec 64))

(declare-fun e!357890 () Bool)

(declare-datatypes ((array!37711 0))(
  ( (array!37712 (arr!18100 (Array (_ BitVec 32) (_ BitVec 64))) (size!18464 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37711)

(declare-fun b!624000 () Bool)

(assert (=> b!624000 (= e!357890 (= (select (arr!18100 a!2986) j!136) lt!289434))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624000 (= (select (store (arr!18100 a!2986) i!1108 k0!1786) index!984) (select (arr!18100 a!2986) j!136))))

(declare-fun b!624001 () Bool)

(declare-fun res!402185 () Bool)

(declare-fun e!357888 () Bool)

(assert (=> b!624001 (=> (not res!402185) (not e!357888))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!624001 (= res!402185 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18100 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624002 () Bool)

(declare-fun res!402186 () Bool)

(declare-fun e!357889 () Bool)

(assert (=> b!624002 (=> (not res!402186) (not e!357889))))

(declare-fun arrayContainsKey!0 (array!37711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624002 (= res!402186 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624003 () Bool)

(declare-fun res!402188 () Bool)

(assert (=> b!624003 (=> (not res!402188) (not e!357888))))

(declare-datatypes ((List!12141 0))(
  ( (Nil!12138) (Cons!12137 (h!13182 (_ BitVec 64)) (t!18369 List!12141)) )
))
(declare-fun arrayNoDuplicates!0 (array!37711 (_ BitVec 32) List!12141) Bool)

(assert (=> b!624003 (= res!402188 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12138))))

(declare-fun b!624004 () Bool)

(declare-fun e!357894 () Bool)

(assert (=> b!624004 (= e!357888 e!357894)))

(declare-fun res!402180 () Bool)

(assert (=> b!624004 (=> (not res!402180) (not e!357894))))

(assert (=> b!624004 (= res!402180 (= (select (store (arr!18100 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!289441 () array!37711)

(assert (=> b!624004 (= lt!289441 (array!37712 (store (arr!18100 a!2986) i!1108 k0!1786) (size!18464 a!2986)))))

(declare-fun b!624005 () Bool)

(declare-fun res!402187 () Bool)

(assert (=> b!624005 (=> (not res!402187) (not e!357888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37711 (_ BitVec 32)) Bool)

(assert (=> b!624005 (= res!402187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624006 () Bool)

(declare-fun e!357893 () Bool)

(assert (=> b!624006 (= e!357893 (not e!357890))))

(declare-fun res!402178 () Bool)

(assert (=> b!624006 (=> res!402178 e!357890)))

(declare-datatypes ((SeekEntryResult!6540 0))(
  ( (MissingZero!6540 (index!28444 (_ BitVec 32))) (Found!6540 (index!28445 (_ BitVec 32))) (Intermediate!6540 (undefined!7352 Bool) (index!28446 (_ BitVec 32)) (x!57207 (_ BitVec 32))) (Undefined!6540) (MissingVacant!6540 (index!28447 (_ BitVec 32))) )
))
(declare-fun lt!289437 () SeekEntryResult!6540)

(assert (=> b!624006 (= res!402178 (not (= lt!289437 (Found!6540 index!984))))))

(declare-datatypes ((Unit!21068 0))(
  ( (Unit!21069) )
))
(declare-fun lt!289436 () Unit!21068)

(declare-fun e!357887 () Unit!21068)

(assert (=> b!624006 (= lt!289436 e!357887)))

(declare-fun c!71279 () Bool)

(assert (=> b!624006 (= c!71279 (= lt!289437 Undefined!6540))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37711 (_ BitVec 32)) SeekEntryResult!6540)

(assert (=> b!624006 (= lt!289437 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289434 lt!289441 mask!3053))))

(declare-fun e!357891 () Bool)

(assert (=> b!624006 e!357891))

(declare-fun res!402183 () Bool)

(assert (=> b!624006 (=> (not res!402183) (not e!357891))))

(declare-fun lt!289438 () (_ BitVec 32))

(declare-fun lt!289440 () SeekEntryResult!6540)

(assert (=> b!624006 (= res!402183 (= lt!289440 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289438 vacantSpotIndex!68 lt!289434 lt!289441 mask!3053)))))

(assert (=> b!624006 (= lt!289440 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289438 vacantSpotIndex!68 (select (arr!18100 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!624006 (= lt!289434 (select (store (arr!18100 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289435 () Unit!21068)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37711 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21068)

(assert (=> b!624006 (= lt!289435 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289438 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624006 (= lt!289438 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!624008 () Bool)

(declare-fun lt!289439 () SeekEntryResult!6540)

(assert (=> b!624008 (= e!357891 (= lt!289439 lt!289440))))

(declare-fun b!624009 () Bool)

(declare-fun res!402176 () Bool)

(assert (=> b!624009 (=> (not res!402176) (not e!357889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624009 (= res!402176 (validKeyInArray!0 (select (arr!18100 a!2986) j!136)))))

(declare-fun b!624010 () Bool)

(declare-fun res!402181 () Bool)

(assert (=> b!624010 (=> (not res!402181) (not e!357889))))

(assert (=> b!624010 (= res!402181 (validKeyInArray!0 k0!1786))))

(declare-fun b!624011 () Bool)

(assert (=> b!624011 (= e!357894 e!357893)))

(declare-fun res!402177 () Bool)

(assert (=> b!624011 (=> (not res!402177) (not e!357893))))

(assert (=> b!624011 (= res!402177 (and (= lt!289439 (Found!6540 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18100 a!2986) index!984) (select (arr!18100 a!2986) j!136))) (not (= (select (arr!18100 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!624011 (= lt!289439 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18100 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624012 () Bool)

(assert (=> b!624012 (= e!357889 e!357888)))

(declare-fun res!402179 () Bool)

(assert (=> b!624012 (=> (not res!402179) (not e!357888))))

(declare-fun lt!289433 () SeekEntryResult!6540)

(assert (=> b!624012 (= res!402179 (or (= lt!289433 (MissingZero!6540 i!1108)) (= lt!289433 (MissingVacant!6540 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37711 (_ BitVec 32)) SeekEntryResult!6540)

(assert (=> b!624012 (= lt!289433 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624013 () Bool)

(declare-fun res!402184 () Bool)

(assert (=> b!624013 (=> (not res!402184) (not e!357889))))

(assert (=> b!624013 (= res!402184 (and (= (size!18464 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18464 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18464 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624014 () Bool)

(declare-fun Unit!21070 () Unit!21068)

(assert (=> b!624014 (= e!357887 Unit!21070)))

(assert (=> b!624014 false))

(declare-fun res!402182 () Bool)

(assert (=> start!56286 (=> (not res!402182) (not e!357889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56286 (= res!402182 (validMask!0 mask!3053))))

(assert (=> start!56286 e!357889))

(assert (=> start!56286 true))

(declare-fun array_inv!13896 (array!37711) Bool)

(assert (=> start!56286 (array_inv!13896 a!2986)))

(declare-fun b!624007 () Bool)

(declare-fun Unit!21071 () Unit!21068)

(assert (=> b!624007 (= e!357887 Unit!21071)))

(assert (= (and start!56286 res!402182) b!624013))

(assert (= (and b!624013 res!402184) b!624009))

(assert (= (and b!624009 res!402176) b!624010))

(assert (= (and b!624010 res!402181) b!624002))

(assert (= (and b!624002 res!402186) b!624012))

(assert (= (and b!624012 res!402179) b!624005))

(assert (= (and b!624005 res!402187) b!624003))

(assert (= (and b!624003 res!402188) b!624001))

(assert (= (and b!624001 res!402185) b!624004))

(assert (= (and b!624004 res!402180) b!624011))

(assert (= (and b!624011 res!402177) b!624006))

(assert (= (and b!624006 res!402183) b!624008))

(assert (= (and b!624006 c!71279) b!624014))

(assert (= (and b!624006 (not c!71279)) b!624007))

(assert (= (and b!624006 (not res!402178)) b!624000))

(declare-fun m!599747 () Bool)

(assert (=> b!624002 m!599747))

(declare-fun m!599749 () Bool)

(assert (=> b!624000 m!599749))

(declare-fun m!599751 () Bool)

(assert (=> b!624000 m!599751))

(declare-fun m!599753 () Bool)

(assert (=> b!624000 m!599753))

(declare-fun m!599755 () Bool)

(assert (=> b!624001 m!599755))

(declare-fun m!599757 () Bool)

(assert (=> b!624003 m!599757))

(assert (=> b!624004 m!599751))

(declare-fun m!599759 () Bool)

(assert (=> b!624004 m!599759))

(declare-fun m!599761 () Bool)

(assert (=> b!624010 m!599761))

(assert (=> b!624009 m!599749))

(assert (=> b!624009 m!599749))

(declare-fun m!599763 () Bool)

(assert (=> b!624009 m!599763))

(declare-fun m!599765 () Bool)

(assert (=> b!624011 m!599765))

(assert (=> b!624011 m!599749))

(assert (=> b!624011 m!599749))

(declare-fun m!599767 () Bool)

(assert (=> b!624011 m!599767))

(declare-fun m!599769 () Bool)

(assert (=> b!624005 m!599769))

(declare-fun m!599771 () Bool)

(assert (=> start!56286 m!599771))

(declare-fun m!599773 () Bool)

(assert (=> start!56286 m!599773))

(declare-fun m!599775 () Bool)

(assert (=> b!624012 m!599775))

(declare-fun m!599777 () Bool)

(assert (=> b!624006 m!599777))

(declare-fun m!599779 () Bool)

(assert (=> b!624006 m!599779))

(assert (=> b!624006 m!599749))

(assert (=> b!624006 m!599749))

(declare-fun m!599781 () Bool)

(assert (=> b!624006 m!599781))

(assert (=> b!624006 m!599751))

(declare-fun m!599783 () Bool)

(assert (=> b!624006 m!599783))

(declare-fun m!599785 () Bool)

(assert (=> b!624006 m!599785))

(declare-fun m!599787 () Bool)

(assert (=> b!624006 m!599787))

(check-sat (not b!624005) (not b!624006) (not b!624002) (not b!624011) (not b!624010) (not start!56286) (not b!624009) (not b!624003) (not b!624012))
(check-sat)
