; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57188 () Bool)

(assert start!57188)

(declare-fun b!633003 () Bool)

(declare-fun res!409374 () Bool)

(declare-fun e!361908 () Bool)

(assert (=> b!633003 (=> (not res!409374) (not e!361908))))

(declare-datatypes ((array!38150 0))(
  ( (array!38151 (arr!18306 (Array (_ BitVec 32) (_ BitVec 64))) (size!18670 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38150)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633003 (= res!409374 (validKeyInArray!0 (select (arr!18306 a!2986) j!136)))))

(declare-fun b!633004 () Bool)

(declare-fun e!361912 () Bool)

(declare-fun e!361907 () Bool)

(assert (=> b!633004 (= e!361912 e!361907)))

(declare-fun res!409378 () Bool)

(assert (=> b!633004 (=> res!409378 e!361907)))

(declare-fun lt!292565 () (_ BitVec 64))

(declare-fun lt!292573 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633004 (= res!409378 (or (not (= (select (arr!18306 a!2986) j!136) lt!292565)) (not (= (select (arr!18306 a!2986) j!136) lt!292573)) (bvsge j!136 index!984)))))

(declare-fun e!361910 () Bool)

(assert (=> b!633004 e!361910))

(declare-fun res!409376 () Bool)

(assert (=> b!633004 (=> (not res!409376) (not e!361910))))

(assert (=> b!633004 (= res!409376 (= lt!292573 (select (arr!18306 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!633004 (= lt!292573 (select (store (arr!18306 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!633005 () Bool)

(declare-fun res!409382 () Bool)

(declare-fun e!361915 () Bool)

(assert (=> b!633005 (=> (not res!409382) (not e!361915))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38150 (_ BitVec 32)) Bool)

(assert (=> b!633005 (= res!409382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633006 () Bool)

(declare-fun e!361909 () Bool)

(declare-fun e!361916 () Bool)

(assert (=> b!633006 (= e!361909 e!361916)))

(declare-fun res!409379 () Bool)

(assert (=> b!633006 (=> (not res!409379) (not e!361916))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6746 0))(
  ( (MissingZero!6746 (index!29280 (_ BitVec 32))) (Found!6746 (index!29281 (_ BitVec 32))) (Intermediate!6746 (undefined!7558 Bool) (index!29282 (_ BitVec 32)) (x!58022 (_ BitVec 32))) (Undefined!6746) (MissingVacant!6746 (index!29283 (_ BitVec 32))) )
))
(declare-fun lt!292571 () SeekEntryResult!6746)

(assert (=> b!633006 (= res!409379 (and (= lt!292571 (Found!6746 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18306 a!2986) index!984) (select (arr!18306 a!2986) j!136))) (not (= (select (arr!18306 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38150 (_ BitVec 32)) SeekEntryResult!6746)

(assert (=> b!633006 (= lt!292571 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18306 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633007 () Bool)

(assert (=> b!633007 (= e!361916 (not e!361912))))

(declare-fun res!409370 () Bool)

(assert (=> b!633007 (=> res!409370 e!361912)))

(declare-fun lt!292570 () SeekEntryResult!6746)

(assert (=> b!633007 (= res!409370 (not (= lt!292570 (Found!6746 index!984))))))

(declare-datatypes ((Unit!21318 0))(
  ( (Unit!21319) )
))
(declare-fun lt!292566 () Unit!21318)

(declare-fun e!361913 () Unit!21318)

(assert (=> b!633007 (= lt!292566 e!361913)))

(declare-fun c!72185 () Bool)

(assert (=> b!633007 (= c!72185 (= lt!292570 Undefined!6746))))

(declare-fun lt!292568 () array!38150)

(assert (=> b!633007 (= lt!292570 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292565 lt!292568 mask!3053))))

(declare-fun e!361914 () Bool)

(assert (=> b!633007 e!361914))

(declare-fun res!409381 () Bool)

(assert (=> b!633007 (=> (not res!409381) (not e!361914))))

(declare-fun lt!292569 () (_ BitVec 32))

(declare-fun lt!292567 () SeekEntryResult!6746)

(assert (=> b!633007 (= res!409381 (= lt!292567 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292569 vacantSpotIndex!68 lt!292565 lt!292568 mask!3053)))))

(assert (=> b!633007 (= lt!292567 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292569 vacantSpotIndex!68 (select (arr!18306 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633007 (= lt!292565 (select (store (arr!18306 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292572 () Unit!21318)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38150 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21318)

(assert (=> b!633007 (= lt!292572 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292569 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633007 (= lt!292569 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633008 () Bool)

(declare-fun Unit!21320 () Unit!21318)

(assert (=> b!633008 (= e!361913 Unit!21320)))

(assert (=> b!633008 false))

(declare-fun b!633009 () Bool)

(assert (=> b!633009 (= e!361914 (= lt!292571 lt!292567))))

(declare-fun res!409367 () Bool)

(assert (=> start!57188 (=> (not res!409367) (not e!361908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57188 (= res!409367 (validMask!0 mask!3053))))

(assert (=> start!57188 e!361908))

(assert (=> start!57188 true))

(declare-fun array_inv!14102 (array!38150) Bool)

(assert (=> start!57188 (array_inv!14102 a!2986)))

(declare-fun b!633010 () Bool)

(assert (=> b!633010 (= e!361915 e!361909)))

(declare-fun res!409373 () Bool)

(assert (=> b!633010 (=> (not res!409373) (not e!361909))))

(assert (=> b!633010 (= res!409373 (= (select (store (arr!18306 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633010 (= lt!292568 (array!38151 (store (arr!18306 a!2986) i!1108 k!1786) (size!18670 a!2986)))))

(declare-fun b!633011 () Bool)

(declare-fun Unit!21321 () Unit!21318)

(assert (=> b!633011 (= e!361913 Unit!21321)))

(declare-fun b!633012 () Bool)

(declare-fun res!409372 () Bool)

(assert (=> b!633012 (=> (not res!409372) (not e!361908))))

(assert (=> b!633012 (= res!409372 (validKeyInArray!0 k!1786))))

(declare-fun b!633013 () Bool)

(declare-fun res!409375 () Bool)

(assert (=> b!633013 (=> (not res!409375) (not e!361908))))

(assert (=> b!633013 (= res!409375 (and (= (size!18670 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18670 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18670 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633014 () Bool)

(declare-fun e!361917 () Bool)

(assert (=> b!633014 (= e!361910 e!361917)))

(declare-fun res!409380 () Bool)

(assert (=> b!633014 (=> res!409380 e!361917)))

(assert (=> b!633014 (= res!409380 (or (not (= (select (arr!18306 a!2986) j!136) lt!292565)) (not (= (select (arr!18306 a!2986) j!136) lt!292573)) (bvsge j!136 index!984)))))

(declare-fun b!633015 () Bool)

(assert (=> b!633015 (= e!361908 e!361915)))

(declare-fun res!409371 () Bool)

(assert (=> b!633015 (=> (not res!409371) (not e!361915))))

(declare-fun lt!292564 () SeekEntryResult!6746)

(assert (=> b!633015 (= res!409371 (or (= lt!292564 (MissingZero!6746 i!1108)) (= lt!292564 (MissingVacant!6746 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38150 (_ BitVec 32)) SeekEntryResult!6746)

(assert (=> b!633015 (= lt!292564 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!633016 () Bool)

(declare-fun res!409369 () Bool)

(assert (=> b!633016 (=> (not res!409369) (not e!361915))))

(declare-datatypes ((List!12347 0))(
  ( (Nil!12344) (Cons!12343 (h!13388 (_ BitVec 64)) (t!18575 List!12347)) )
))
(declare-fun arrayNoDuplicates!0 (array!38150 (_ BitVec 32) List!12347) Bool)

(assert (=> b!633016 (= res!409369 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12344))))

(declare-fun b!633017 () Bool)

(declare-fun arrayContainsKey!0 (array!38150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633017 (= e!361907 (arrayContainsKey!0 lt!292568 (select (arr!18306 a!2986) j!136) index!984))))

(declare-fun b!633018 () Bool)

(declare-fun res!409377 () Bool)

(assert (=> b!633018 (=> (not res!409377) (not e!361908))))

(assert (=> b!633018 (= res!409377 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633019 () Bool)

(declare-fun res!409368 () Bool)

(assert (=> b!633019 (=> (not res!409368) (not e!361915))))

(assert (=> b!633019 (= res!409368 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18306 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633020 () Bool)

(assert (=> b!633020 (= e!361917 (arrayContainsKey!0 lt!292568 (select (arr!18306 a!2986) j!136) j!136))))

(assert (= (and start!57188 res!409367) b!633013))

(assert (= (and b!633013 res!409375) b!633003))

(assert (= (and b!633003 res!409374) b!633012))

(assert (= (and b!633012 res!409372) b!633018))

(assert (= (and b!633018 res!409377) b!633015))

(assert (= (and b!633015 res!409371) b!633005))

(assert (= (and b!633005 res!409382) b!633016))

(assert (= (and b!633016 res!409369) b!633019))

(assert (= (and b!633019 res!409368) b!633010))

(assert (= (and b!633010 res!409373) b!633006))

(assert (= (and b!633006 res!409379) b!633007))

(assert (= (and b!633007 res!409381) b!633009))

(assert (= (and b!633007 c!72185) b!633008))

(assert (= (and b!633007 (not c!72185)) b!633011))

(assert (= (and b!633007 (not res!409370)) b!633004))

(assert (= (and b!633004 res!409376) b!633014))

(assert (= (and b!633014 (not res!409380)) b!633020))

(assert (= (and b!633004 (not res!409378)) b!633017))

(declare-fun m!607749 () Bool)

(assert (=> b!633014 m!607749))

(declare-fun m!607751 () Bool)

(assert (=> b!633012 m!607751))

(assert (=> b!633020 m!607749))

(assert (=> b!633020 m!607749))

(declare-fun m!607753 () Bool)

(assert (=> b!633020 m!607753))

(declare-fun m!607755 () Bool)

(assert (=> b!633018 m!607755))

(assert (=> b!633003 m!607749))

(assert (=> b!633003 m!607749))

(declare-fun m!607757 () Bool)

(assert (=> b!633003 m!607757))

(declare-fun m!607759 () Bool)

(assert (=> b!633006 m!607759))

(assert (=> b!633006 m!607749))

(assert (=> b!633006 m!607749))

(declare-fun m!607761 () Bool)

(assert (=> b!633006 m!607761))

(declare-fun m!607763 () Bool)

(assert (=> b!633005 m!607763))

(assert (=> b!633004 m!607749))

(declare-fun m!607765 () Bool)

(assert (=> b!633004 m!607765))

(declare-fun m!607767 () Bool)

(assert (=> b!633004 m!607767))

(declare-fun m!607769 () Bool)

(assert (=> b!633019 m!607769))

(declare-fun m!607771 () Bool)

(assert (=> b!633015 m!607771))

(declare-fun m!607773 () Bool)

(assert (=> b!633007 m!607773))

(assert (=> b!633007 m!607749))

(assert (=> b!633007 m!607765))

(declare-fun m!607775 () Bool)

(assert (=> b!633007 m!607775))

(declare-fun m!607777 () Bool)

(assert (=> b!633007 m!607777))

(assert (=> b!633007 m!607749))

(declare-fun m!607779 () Bool)

(assert (=> b!633007 m!607779))

(declare-fun m!607781 () Bool)

(assert (=> b!633007 m!607781))

(declare-fun m!607783 () Bool)

(assert (=> b!633007 m!607783))

(declare-fun m!607785 () Bool)

(assert (=> start!57188 m!607785))

(declare-fun m!607787 () Bool)

(assert (=> start!57188 m!607787))

(declare-fun m!607789 () Bool)

(assert (=> b!633016 m!607789))

(assert (=> b!633017 m!607749))

(assert (=> b!633017 m!607749))

(declare-fun m!607791 () Bool)

(assert (=> b!633017 m!607791))

(assert (=> b!633010 m!607765))

(declare-fun m!607793 () Bool)

(assert (=> b!633010 m!607793))

(push 1)

(assert (not b!633005))

(assert (not b!633016))

(assert (not b!633015))

(assert (not b!633003))

(assert (not b!633012))

(assert (not b!633017))

(assert (not b!633020))

(assert (not start!57188))

(assert (not b!633006))

(assert (not b!633007))

(assert (not b!633018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

