; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53692 () Bool)

(assert start!53692)

(declare-fun b!585366 () Bool)

(declare-fun res!373191 () Bool)

(declare-fun e!334961 () Bool)

(assert (=> b!585366 (=> (not res!373191) (not e!334961))))

(declare-datatypes ((array!36593 0))(
  ( (array!36594 (arr!17571 (Array (_ BitVec 32) (_ BitVec 64))) (size!17935 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36593)

(declare-datatypes ((List!11612 0))(
  ( (Nil!11609) (Cons!11608 (h!12653 (_ BitVec 64)) (t!17840 List!11612)) )
))
(declare-fun arrayNoDuplicates!0 (array!36593 (_ BitVec 32) List!11612) Bool)

(assert (=> b!585366 (= res!373191 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11609))))

(declare-fun b!585367 () Bool)

(declare-fun res!373188 () Bool)

(assert (=> b!585367 (=> (not res!373188) (not e!334961))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585367 (= res!373188 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17571 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17571 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585368 () Bool)

(declare-fun res!373184 () Bool)

(assert (=> b!585368 (=> (not res!373184) (not e!334961))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6011 0))(
  ( (MissingZero!6011 (index!26271 (_ BitVec 32))) (Found!6011 (index!26272 (_ BitVec 32))) (Intermediate!6011 (undefined!6823 Bool) (index!26273 (_ BitVec 32)) (x!55096 (_ BitVec 32))) (Undefined!6011) (MissingVacant!6011 (index!26274 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36593 (_ BitVec 32)) SeekEntryResult!6011)

(assert (=> b!585368 (= res!373184 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17571 a!2986) j!136) a!2986 mask!3053) (Found!6011 j!136)))))

(declare-fun b!585369 () Bool)

(declare-fun e!334959 () Bool)

(assert (=> b!585369 (= e!334959 e!334961)))

(declare-fun res!373182 () Bool)

(assert (=> b!585369 (=> (not res!373182) (not e!334961))))

(declare-fun lt!265806 () SeekEntryResult!6011)

(assert (=> b!585369 (= res!373182 (or (= lt!265806 (MissingZero!6011 i!1108)) (= lt!265806 (MissingVacant!6011 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36593 (_ BitVec 32)) SeekEntryResult!6011)

(assert (=> b!585369 (= lt!265806 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585370 () Bool)

(declare-fun res!373187 () Bool)

(assert (=> b!585370 (=> (not res!373187) (not e!334959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585370 (= res!373187 (validKeyInArray!0 (select (arr!17571 a!2986) j!136)))))

(declare-fun b!585371 () Bool)

(declare-fun res!373193 () Bool)

(assert (=> b!585371 (=> (not res!373193) (not e!334961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36593 (_ BitVec 32)) Bool)

(assert (=> b!585371 (= res!373193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585372 () Bool)

(declare-fun res!373186 () Bool)

(assert (=> b!585372 (=> (not res!373186) (not e!334959))))

(assert (=> b!585372 (= res!373186 (and (= (size!17935 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17935 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17935 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585373 () Bool)

(declare-fun e!334960 () Bool)

(assert (=> b!585373 (= e!334961 e!334960)))

(declare-fun res!373185 () Bool)

(assert (=> b!585373 (=> (not res!373185) (not e!334960))))

(declare-fun lt!265805 () (_ BitVec 32))

(assert (=> b!585373 (= res!373185 (and (bvsge lt!265805 #b00000000000000000000000000000000) (bvslt lt!265805 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585373 (= lt!265805 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585374 () Bool)

(declare-fun res!373189 () Bool)

(assert (=> b!585374 (=> (not res!373189) (not e!334961))))

(assert (=> b!585374 (= res!373189 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17571 a!2986) index!984) (select (arr!17571 a!2986) j!136))) (not (= (select (arr!17571 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373190 () Bool)

(assert (=> start!53692 (=> (not res!373190) (not e!334959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53692 (= res!373190 (validMask!0 mask!3053))))

(assert (=> start!53692 e!334959))

(assert (=> start!53692 true))

(declare-fun array_inv!13367 (array!36593) Bool)

(assert (=> start!53692 (array_inv!13367 a!2986)))

(declare-fun b!585375 () Bool)

(assert (=> b!585375 (= e!334960 false)))

(declare-fun lt!265807 () SeekEntryResult!6011)

(assert (=> b!585375 (= lt!265807 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265805 vacantSpotIndex!68 (select (arr!17571 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585376 () Bool)

(declare-fun res!373192 () Bool)

(assert (=> b!585376 (=> (not res!373192) (not e!334959))))

(declare-fun arrayContainsKey!0 (array!36593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585376 (= res!373192 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585377 () Bool)

(declare-fun res!373183 () Bool)

(assert (=> b!585377 (=> (not res!373183) (not e!334959))))

(assert (=> b!585377 (= res!373183 (validKeyInArray!0 k!1786))))

(assert (= (and start!53692 res!373190) b!585372))

(assert (= (and b!585372 res!373186) b!585370))

(assert (= (and b!585370 res!373187) b!585377))

(assert (= (and b!585377 res!373183) b!585376))

(assert (= (and b!585376 res!373192) b!585369))

(assert (= (and b!585369 res!373182) b!585371))

(assert (= (and b!585371 res!373193) b!585366))

(assert (= (and b!585366 res!373191) b!585367))

(assert (= (and b!585367 res!373188) b!585368))

(assert (= (and b!585368 res!373184) b!585374))

(assert (= (and b!585374 res!373189) b!585373))

(assert (= (and b!585373 res!373185) b!585375))

(declare-fun m!563617 () Bool)

(assert (=> b!585377 m!563617))

(declare-fun m!563619 () Bool)

(assert (=> b!585367 m!563619))

(declare-fun m!563621 () Bool)

(assert (=> b!585367 m!563621))

(declare-fun m!563623 () Bool)

(assert (=> b!585367 m!563623))

(declare-fun m!563625 () Bool)

(assert (=> b!585373 m!563625))

(declare-fun m!563627 () Bool)

(assert (=> b!585376 m!563627))

(declare-fun m!563629 () Bool)

(assert (=> start!53692 m!563629))

(declare-fun m!563631 () Bool)

(assert (=> start!53692 m!563631))

(declare-fun m!563633 () Bool)

(assert (=> b!585370 m!563633))

(assert (=> b!585370 m!563633))

(declare-fun m!563635 () Bool)

(assert (=> b!585370 m!563635))

(declare-fun m!563637 () Bool)

(assert (=> b!585371 m!563637))

(assert (=> b!585368 m!563633))

(assert (=> b!585368 m!563633))

(declare-fun m!563639 () Bool)

(assert (=> b!585368 m!563639))

(declare-fun m!563641 () Bool)

(assert (=> b!585366 m!563641))

(declare-fun m!563643 () Bool)

(assert (=> b!585374 m!563643))

(assert (=> b!585374 m!563633))

(assert (=> b!585375 m!563633))

(assert (=> b!585375 m!563633))

(declare-fun m!563645 () Bool)

(assert (=> b!585375 m!563645))

(declare-fun m!563647 () Bool)

(assert (=> b!585369 m!563647))

(push 1)

