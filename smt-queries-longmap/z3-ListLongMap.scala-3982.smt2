; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54012 () Bool)

(assert start!54012)

(declare-fun b!589458 () Bool)

(declare-datatypes ((Unit!18361 0))(
  ( (Unit!18362) )
))
(declare-fun e!336557 () Unit!18361)

(declare-fun Unit!18363 () Unit!18361)

(assert (=> b!589458 (= e!336557 Unit!18363)))

(assert (=> b!589458 false))

(declare-fun b!589459 () Bool)

(declare-fun res!376904 () Bool)

(declare-fun e!336558 () Bool)

(assert (=> b!589459 (=> (not res!376904) (not e!336558))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589459 (= res!376904 (validKeyInArray!0 k0!1786))))

(declare-fun b!589460 () Bool)

(declare-fun Unit!18364 () Unit!18361)

(assert (=> b!589460 (= e!336557 Unit!18364)))

(declare-fun b!589461 () Bool)

(declare-fun e!336553 () Bool)

(assert (=> b!589461 (= e!336558 e!336553)))

(declare-fun res!376897 () Bool)

(assert (=> b!589461 (=> (not res!376897) (not e!336553))))

(declare-datatypes ((SeekEntryResult!6067 0))(
  ( (MissingZero!6067 (index!26498 (_ BitVec 32))) (Found!6067 (index!26499 (_ BitVec 32))) (Intermediate!6067 (undefined!6879 Bool) (index!26500 (_ BitVec 32)) (x!55444 (_ BitVec 32))) (Undefined!6067) (MissingVacant!6067 (index!26501 (_ BitVec 32))) )
))
(declare-fun lt!267340 () SeekEntryResult!6067)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589461 (= res!376897 (or (= lt!267340 (MissingZero!6067 i!1108)) (= lt!267340 (MissingVacant!6067 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36801 0))(
  ( (array!36802 (arr!17671 (Array (_ BitVec 32) (_ BitVec 64))) (size!18035 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36801)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36801 (_ BitVec 32)) SeekEntryResult!6067)

(assert (=> b!589461 (= lt!267340 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589462 () Bool)

(declare-fun res!376895 () Bool)

(assert (=> b!589462 (=> (not res!376895) (not e!336558))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!589462 (= res!376895 (validKeyInArray!0 (select (arr!17671 a!2986) j!136)))))

(declare-fun b!589463 () Bool)

(declare-fun e!336556 () Bool)

(declare-fun lt!267334 () SeekEntryResult!6067)

(declare-fun lt!267335 () SeekEntryResult!6067)

(assert (=> b!589463 (= e!336556 (= lt!267334 lt!267335))))

(declare-fun b!589465 () Bool)

(declare-fun res!376905 () Bool)

(assert (=> b!589465 (=> (not res!376905) (not e!336553))))

(declare-datatypes ((List!11619 0))(
  ( (Nil!11616) (Cons!11615 (h!12663 (_ BitVec 64)) (t!17839 List!11619)) )
))
(declare-fun arrayNoDuplicates!0 (array!36801 (_ BitVec 32) List!11619) Bool)

(assert (=> b!589465 (= res!376905 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11616))))

(declare-fun b!589466 () Bool)

(declare-fun res!376899 () Bool)

(assert (=> b!589466 (=> (not res!376899) (not e!336553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36801 (_ BitVec 32)) Bool)

(assert (=> b!589466 (= res!376899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589467 () Bool)

(declare-fun e!336554 () Bool)

(assert (=> b!589467 (= e!336554 (not true))))

(declare-fun lt!267337 () Unit!18361)

(assert (=> b!589467 (= lt!267337 e!336557)))

(declare-fun lt!267336 () (_ BitVec 64))

(declare-fun lt!267333 () array!36801)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun c!66650 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36801 (_ BitVec 32)) SeekEntryResult!6067)

(assert (=> b!589467 (= c!66650 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267336 lt!267333 mask!3053) Undefined!6067))))

(assert (=> b!589467 e!336556))

(declare-fun res!376901 () Bool)

(assert (=> b!589467 (=> (not res!376901) (not e!336556))))

(declare-fun lt!267338 () (_ BitVec 32))

(assert (=> b!589467 (= res!376901 (= lt!267335 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267338 vacantSpotIndex!68 lt!267336 lt!267333 mask!3053)))))

(assert (=> b!589467 (= lt!267335 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267338 vacantSpotIndex!68 (select (arr!17671 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589467 (= lt!267336 (select (store (arr!17671 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267339 () Unit!18361)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18361)

(assert (=> b!589467 (= lt!267339 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267338 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589467 (= lt!267338 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!589468 () Bool)

(declare-fun res!376902 () Bool)

(assert (=> b!589468 (=> (not res!376902) (not e!336553))))

(assert (=> b!589468 (= res!376902 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17671 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589469 () Bool)

(declare-fun res!376896 () Bool)

(assert (=> b!589469 (=> (not res!376896) (not e!336558))))

(declare-fun arrayContainsKey!0 (array!36801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589469 (= res!376896 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589470 () Bool)

(declare-fun res!376900 () Bool)

(assert (=> b!589470 (=> (not res!376900) (not e!336558))))

(assert (=> b!589470 (= res!376900 (and (= (size!18035 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18035 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18035 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589471 () Bool)

(declare-fun e!336552 () Bool)

(assert (=> b!589471 (= e!336552 e!336554)))

(declare-fun res!376906 () Bool)

(assert (=> b!589471 (=> (not res!376906) (not e!336554))))

(assert (=> b!589471 (= res!376906 (and (= lt!267334 (Found!6067 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17671 a!2986) index!984) (select (arr!17671 a!2986) j!136))) (not (= (select (arr!17671 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589471 (= lt!267334 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17671 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589464 () Bool)

(assert (=> b!589464 (= e!336553 e!336552)))

(declare-fun res!376903 () Bool)

(assert (=> b!589464 (=> (not res!376903) (not e!336552))))

(assert (=> b!589464 (= res!376903 (= (select (store (arr!17671 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589464 (= lt!267333 (array!36802 (store (arr!17671 a!2986) i!1108 k0!1786) (size!18035 a!2986)))))

(declare-fun res!376898 () Bool)

(assert (=> start!54012 (=> (not res!376898) (not e!336558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54012 (= res!376898 (validMask!0 mask!3053))))

(assert (=> start!54012 e!336558))

(assert (=> start!54012 true))

(declare-fun array_inv!13530 (array!36801) Bool)

(assert (=> start!54012 (array_inv!13530 a!2986)))

(assert (= (and start!54012 res!376898) b!589470))

(assert (= (and b!589470 res!376900) b!589462))

(assert (= (and b!589462 res!376895) b!589459))

(assert (= (and b!589459 res!376904) b!589469))

(assert (= (and b!589469 res!376896) b!589461))

(assert (= (and b!589461 res!376897) b!589466))

(assert (= (and b!589466 res!376899) b!589465))

(assert (= (and b!589465 res!376905) b!589468))

(assert (= (and b!589468 res!376902) b!589464))

(assert (= (and b!589464 res!376903) b!589471))

(assert (= (and b!589471 res!376906) b!589467))

(assert (= (and b!589467 res!376901) b!589463))

(assert (= (and b!589467 c!66650) b!589458))

(assert (= (and b!589467 (not c!66650)) b!589460))

(declare-fun m!568151 () Bool)

(assert (=> b!589469 m!568151))

(declare-fun m!568153 () Bool)

(assert (=> b!589462 m!568153))

(assert (=> b!589462 m!568153))

(declare-fun m!568155 () Bool)

(assert (=> b!589462 m!568155))

(declare-fun m!568157 () Bool)

(assert (=> b!589459 m!568157))

(declare-fun m!568159 () Bool)

(assert (=> start!54012 m!568159))

(declare-fun m!568161 () Bool)

(assert (=> start!54012 m!568161))

(declare-fun m!568163 () Bool)

(assert (=> b!589471 m!568163))

(assert (=> b!589471 m!568153))

(assert (=> b!589471 m!568153))

(declare-fun m!568165 () Bool)

(assert (=> b!589471 m!568165))

(declare-fun m!568167 () Bool)

(assert (=> b!589467 m!568167))

(declare-fun m!568169 () Bool)

(assert (=> b!589467 m!568169))

(assert (=> b!589467 m!568153))

(declare-fun m!568171 () Bool)

(assert (=> b!589467 m!568171))

(assert (=> b!589467 m!568153))

(declare-fun m!568173 () Bool)

(assert (=> b!589467 m!568173))

(declare-fun m!568175 () Bool)

(assert (=> b!589467 m!568175))

(declare-fun m!568177 () Bool)

(assert (=> b!589467 m!568177))

(declare-fun m!568179 () Bool)

(assert (=> b!589467 m!568179))

(assert (=> b!589464 m!568171))

(declare-fun m!568181 () Bool)

(assert (=> b!589464 m!568181))

(declare-fun m!568183 () Bool)

(assert (=> b!589466 m!568183))

(declare-fun m!568185 () Bool)

(assert (=> b!589465 m!568185))

(declare-fun m!568187 () Bool)

(assert (=> b!589461 m!568187))

(declare-fun m!568189 () Bool)

(assert (=> b!589468 m!568189))

(check-sat (not b!589471) (not b!589469) (not b!589459) (not b!589465) (not b!589462) (not b!589461) (not start!54012) (not b!589467) (not b!589466))
(check-sat)
