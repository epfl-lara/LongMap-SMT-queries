; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57492 () Bool)

(assert start!57492)

(declare-fun b!635884 () Bool)

(declare-fun res!411363 () Bool)

(declare-fun e!363728 () Bool)

(assert (=> b!635884 (=> (not res!411363) (not e!363728))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38220 0))(
  ( (array!38221 (arr!18334 (Array (_ BitVec 32) (_ BitVec 64))) (size!18698 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38220)

(assert (=> b!635884 (= res!411363 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18334 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635885 () Bool)

(declare-fun e!363729 () Bool)

(assert (=> b!635885 (= e!363729 e!363728)))

(declare-fun res!411353 () Bool)

(assert (=> b!635885 (=> (not res!411353) (not e!363728))))

(declare-datatypes ((SeekEntryResult!6730 0))(
  ( (MissingZero!6730 (index!29225 (_ BitVec 32))) (Found!6730 (index!29226 (_ BitVec 32))) (Intermediate!6730 (undefined!7542 Bool) (index!29227 (_ BitVec 32)) (x!58124 (_ BitVec 32))) (Undefined!6730) (MissingVacant!6730 (index!29228 (_ BitVec 32))) )
))
(declare-fun lt!294032 () SeekEntryResult!6730)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635885 (= res!411353 (or (= lt!294032 (MissingZero!6730 i!1108)) (= lt!294032 (MissingVacant!6730 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38220 (_ BitVec 32)) SeekEntryResult!6730)

(assert (=> b!635885 (= lt!294032 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!635886 () Bool)

(declare-fun res!411351 () Bool)

(assert (=> b!635886 (=> (not res!411351) (not e!363729))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!635886 (= res!411351 (and (= (size!18698 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18698 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18698 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!294030 () array!38220)

(declare-fun b!635887 () Bool)

(declare-fun e!363719 () Bool)

(declare-fun arrayContainsKey!0 (array!38220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635887 (= e!363719 (arrayContainsKey!0 lt!294030 (select (arr!18334 a!2986) j!136) index!984))))

(declare-fun b!635889 () Bool)

(declare-fun e!363727 () Bool)

(declare-fun e!363724 () Bool)

(assert (=> b!635889 (= e!363727 e!363724)))

(declare-fun res!411360 () Bool)

(assert (=> b!635889 (=> (not res!411360) (not e!363724))))

(declare-fun lt!294027 () SeekEntryResult!6730)

(assert (=> b!635889 (= res!411360 (and (= lt!294027 (Found!6730 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18334 a!2986) index!984) (select (arr!18334 a!2986) j!136))) (not (= (select (arr!18334 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38220 (_ BitVec 32)) SeekEntryResult!6730)

(assert (=> b!635889 (= lt!294027 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18334 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635890 () Bool)

(declare-fun e!363725 () Bool)

(declare-fun e!363720 () Bool)

(assert (=> b!635890 (= e!363725 e!363720)))

(declare-fun res!411359 () Bool)

(assert (=> b!635890 (=> res!411359 e!363720)))

(declare-fun lt!294033 () (_ BitVec 64))

(declare-fun lt!294037 () (_ BitVec 64))

(assert (=> b!635890 (= res!411359 (or (not (= (select (arr!18334 a!2986) j!136) lt!294033)) (not (= (select (arr!18334 a!2986) j!136) lt!294037)) (bvsge j!136 index!984)))))

(declare-fun e!363722 () Bool)

(assert (=> b!635890 e!363722))

(declare-fun res!411366 () Bool)

(assert (=> b!635890 (=> (not res!411366) (not e!363722))))

(assert (=> b!635890 (= res!411366 (= lt!294037 (select (arr!18334 a!2986) j!136)))))

(assert (=> b!635890 (= lt!294037 (select (store (arr!18334 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635891 () Bool)

(assert (=> b!635891 (= e!363720 (or (bvsge (size!18698 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18698 a!2986))))))

(assert (=> b!635891 (arrayContainsKey!0 lt!294030 (select (arr!18334 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!21429 0))(
  ( (Unit!21430) )
))
(declare-fun lt!294034 () Unit!21429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38220 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21429)

(assert (=> b!635891 (= lt!294034 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294030 (select (arr!18334 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635892 () Bool)

(declare-fun res!411367 () Bool)

(assert (=> b!635892 (=> (not res!411367) (not e!363729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635892 (= res!411367 (validKeyInArray!0 k0!1786))))

(declare-fun b!635893 () Bool)

(declare-fun res!411356 () Bool)

(assert (=> b!635893 (=> (not res!411356) (not e!363729))))

(assert (=> b!635893 (= res!411356 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635894 () Bool)

(assert (=> b!635894 (= e!363724 (not e!363725))))

(declare-fun res!411355 () Bool)

(assert (=> b!635894 (=> res!411355 e!363725)))

(declare-fun lt!294029 () SeekEntryResult!6730)

(assert (=> b!635894 (= res!411355 (not (= lt!294029 (Found!6730 index!984))))))

(declare-fun lt!294031 () Unit!21429)

(declare-fun e!363726 () Unit!21429)

(assert (=> b!635894 (= lt!294031 e!363726)))

(declare-fun c!72635 () Bool)

(assert (=> b!635894 (= c!72635 (= lt!294029 Undefined!6730))))

(assert (=> b!635894 (= lt!294029 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294033 lt!294030 mask!3053))))

(declare-fun e!363723 () Bool)

(assert (=> b!635894 e!363723))

(declare-fun res!411358 () Bool)

(assert (=> b!635894 (=> (not res!411358) (not e!363723))))

(declare-fun lt!294036 () (_ BitVec 32))

(declare-fun lt!294035 () SeekEntryResult!6730)

(assert (=> b!635894 (= res!411358 (= lt!294035 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294036 vacantSpotIndex!68 lt!294033 lt!294030 mask!3053)))))

(assert (=> b!635894 (= lt!294035 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294036 vacantSpotIndex!68 (select (arr!18334 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635894 (= lt!294033 (select (store (arr!18334 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294028 () Unit!21429)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38220 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21429)

(assert (=> b!635894 (= lt!294028 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294036 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635894 (= lt!294036 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!635895 () Bool)

(declare-fun e!363718 () Bool)

(assert (=> b!635895 (= e!363718 e!363719)))

(declare-fun res!411352 () Bool)

(assert (=> b!635895 (=> (not res!411352) (not e!363719))))

(assert (=> b!635895 (= res!411352 (arrayContainsKey!0 lt!294030 (select (arr!18334 a!2986) j!136) j!136))))

(declare-fun b!635896 () Bool)

(declare-fun res!411365 () Bool)

(assert (=> b!635896 (=> (not res!411365) (not e!363728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38220 (_ BitVec 32)) Bool)

(assert (=> b!635896 (= res!411365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635897 () Bool)

(assert (=> b!635897 (= e!363722 e!363718)))

(declare-fun res!411362 () Bool)

(assert (=> b!635897 (=> res!411362 e!363718)))

(assert (=> b!635897 (= res!411362 (or (not (= (select (arr!18334 a!2986) j!136) lt!294033)) (not (= (select (arr!18334 a!2986) j!136) lt!294037)) (bvsge j!136 index!984)))))

(declare-fun b!635898 () Bool)

(assert (=> b!635898 (= e!363728 e!363727)))

(declare-fun res!411357 () Bool)

(assert (=> b!635898 (=> (not res!411357) (not e!363727))))

(assert (=> b!635898 (= res!411357 (= (select (store (arr!18334 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635898 (= lt!294030 (array!38221 (store (arr!18334 a!2986) i!1108 k0!1786) (size!18698 a!2986)))))

(declare-fun res!411361 () Bool)

(assert (=> start!57492 (=> (not res!411361) (not e!363729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57492 (= res!411361 (validMask!0 mask!3053))))

(assert (=> start!57492 e!363729))

(assert (=> start!57492 true))

(declare-fun array_inv!14193 (array!38220) Bool)

(assert (=> start!57492 (array_inv!14193 a!2986)))

(declare-fun b!635888 () Bool)

(declare-fun Unit!21431 () Unit!21429)

(assert (=> b!635888 (= e!363726 Unit!21431)))

(declare-fun b!635899 () Bool)

(declare-fun res!411354 () Bool)

(assert (=> b!635899 (=> (not res!411354) (not e!363729))))

(assert (=> b!635899 (= res!411354 (validKeyInArray!0 (select (arr!18334 a!2986) j!136)))))

(declare-fun b!635900 () Bool)

(assert (=> b!635900 (= e!363723 (= lt!294027 lt!294035))))

(declare-fun b!635901 () Bool)

(declare-fun Unit!21432 () Unit!21429)

(assert (=> b!635901 (= e!363726 Unit!21432)))

(assert (=> b!635901 false))

(declare-fun b!635902 () Bool)

(declare-fun res!411364 () Bool)

(assert (=> b!635902 (=> (not res!411364) (not e!363728))))

(declare-datatypes ((List!12282 0))(
  ( (Nil!12279) (Cons!12278 (h!13326 (_ BitVec 64)) (t!18502 List!12282)) )
))
(declare-fun arrayNoDuplicates!0 (array!38220 (_ BitVec 32) List!12282) Bool)

(assert (=> b!635902 (= res!411364 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12279))))

(assert (= (and start!57492 res!411361) b!635886))

(assert (= (and b!635886 res!411351) b!635899))

(assert (= (and b!635899 res!411354) b!635892))

(assert (= (and b!635892 res!411367) b!635893))

(assert (= (and b!635893 res!411356) b!635885))

(assert (= (and b!635885 res!411353) b!635896))

(assert (= (and b!635896 res!411365) b!635902))

(assert (= (and b!635902 res!411364) b!635884))

(assert (= (and b!635884 res!411363) b!635898))

(assert (= (and b!635898 res!411357) b!635889))

(assert (= (and b!635889 res!411360) b!635894))

(assert (= (and b!635894 res!411358) b!635900))

(assert (= (and b!635894 c!72635) b!635901))

(assert (= (and b!635894 (not c!72635)) b!635888))

(assert (= (and b!635894 (not res!411355)) b!635890))

(assert (= (and b!635890 res!411366) b!635897))

(assert (= (and b!635897 (not res!411362)) b!635895))

(assert (= (and b!635895 res!411352) b!635887))

(assert (= (and b!635890 (not res!411359)) b!635891))

(declare-fun m!610561 () Bool)

(assert (=> b!635884 m!610561))

(declare-fun m!610563 () Bool)

(assert (=> b!635897 m!610563))

(assert (=> b!635899 m!610563))

(assert (=> b!635899 m!610563))

(declare-fun m!610565 () Bool)

(assert (=> b!635899 m!610565))

(declare-fun m!610567 () Bool)

(assert (=> b!635892 m!610567))

(assert (=> b!635887 m!610563))

(assert (=> b!635887 m!610563))

(declare-fun m!610569 () Bool)

(assert (=> b!635887 m!610569))

(assert (=> b!635895 m!610563))

(assert (=> b!635895 m!610563))

(declare-fun m!610571 () Bool)

(assert (=> b!635895 m!610571))

(declare-fun m!610573 () Bool)

(assert (=> b!635894 m!610573))

(assert (=> b!635894 m!610563))

(declare-fun m!610575 () Bool)

(assert (=> b!635894 m!610575))

(assert (=> b!635894 m!610563))

(declare-fun m!610577 () Bool)

(assert (=> b!635894 m!610577))

(declare-fun m!610579 () Bool)

(assert (=> b!635894 m!610579))

(declare-fun m!610581 () Bool)

(assert (=> b!635894 m!610581))

(declare-fun m!610583 () Bool)

(assert (=> b!635894 m!610583))

(declare-fun m!610585 () Bool)

(assert (=> b!635894 m!610585))

(declare-fun m!610587 () Bool)

(assert (=> start!57492 m!610587))

(declare-fun m!610589 () Bool)

(assert (=> start!57492 m!610589))

(declare-fun m!610591 () Bool)

(assert (=> b!635893 m!610591))

(assert (=> b!635898 m!610575))

(declare-fun m!610593 () Bool)

(assert (=> b!635898 m!610593))

(assert (=> b!635890 m!610563))

(assert (=> b!635890 m!610575))

(declare-fun m!610595 () Bool)

(assert (=> b!635890 m!610595))

(declare-fun m!610597 () Bool)

(assert (=> b!635885 m!610597))

(declare-fun m!610599 () Bool)

(assert (=> b!635896 m!610599))

(declare-fun m!610601 () Bool)

(assert (=> b!635902 m!610601))

(assert (=> b!635891 m!610563))

(assert (=> b!635891 m!610563))

(declare-fun m!610603 () Bool)

(assert (=> b!635891 m!610603))

(assert (=> b!635891 m!610563))

(declare-fun m!610605 () Bool)

(assert (=> b!635891 m!610605))

(declare-fun m!610607 () Bool)

(assert (=> b!635889 m!610607))

(assert (=> b!635889 m!610563))

(assert (=> b!635889 m!610563))

(declare-fun m!610609 () Bool)

(assert (=> b!635889 m!610609))

(check-sat (not b!635887) (not b!635891) (not b!635896) (not b!635895) (not start!57492) (not b!635894) (not b!635893) (not b!635902) (not b!635889) (not b!635899) (not b!635892) (not b!635885))
(check-sat)
