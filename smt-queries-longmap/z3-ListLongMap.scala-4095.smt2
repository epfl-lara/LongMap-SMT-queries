; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56052 () Bool)

(assert start!56052)

(declare-fun b!617602 () Bool)

(declare-datatypes ((Unit!20256 0))(
  ( (Unit!20257) )
))
(declare-fun e!354146 () Unit!20256)

(declare-fun Unit!20258 () Unit!20256)

(assert (=> b!617602 (= e!354146 Unit!20258)))

(assert (=> b!617602 false))

(declare-fun b!617603 () Bool)

(declare-fun res!397934 () Bool)

(declare-fun e!354143 () Bool)

(assert (=> b!617603 (=> (not res!397934) (not e!354143))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37536 0))(
  ( (array!37537 (arr!18014 (Array (_ BitVec 32) (_ BitVec 64))) (size!18379 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37536)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!617603 (= res!397934 (and (= (size!18379 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18379 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18379 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617604 () Bool)

(declare-fun res!397942 () Bool)

(declare-fun e!354148 () Bool)

(assert (=> b!617604 (=> (not res!397942) (not e!354148))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!617604 (= res!397942 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18014 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617605 () Bool)

(assert (=> b!617605 false))

(declare-fun lt!284424 () array!37536)

(declare-fun lt!284439 () Unit!20256)

(declare-datatypes ((List!12094 0))(
  ( (Nil!12091) (Cons!12090 (h!13135 (_ BitVec 64)) (t!18313 List!12094)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37536 (_ BitVec 64) (_ BitVec 32) List!12094) Unit!20256)

(assert (=> b!617605 (= lt!284439 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284424 (select (arr!18014 a!2986) j!136) index!984 Nil!12091))))

(declare-fun arrayNoDuplicates!0 (array!37536 (_ BitVec 32) List!12094) Bool)

(assert (=> b!617605 (arrayNoDuplicates!0 lt!284424 index!984 Nil!12091)))

(declare-fun lt!284425 () Unit!20256)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37536 (_ BitVec 32) (_ BitVec 32)) Unit!20256)

(assert (=> b!617605 (= lt!284425 (lemmaNoDuplicateFromThenFromBigger!0 lt!284424 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617605 (arrayNoDuplicates!0 lt!284424 #b00000000000000000000000000000000 Nil!12091)))

(declare-fun lt!284431 () Unit!20256)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37536 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12094) Unit!20256)

(assert (=> b!617605 (= lt!284431 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12091))))

(declare-fun arrayContainsKey!0 (array!37536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617605 (arrayContainsKey!0 lt!284424 (select (arr!18014 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284443 () Unit!20256)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37536 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20256)

(assert (=> b!617605 (= lt!284443 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284424 (select (arr!18014 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354142 () Bool)

(assert (=> b!617605 e!354142))

(declare-fun res!397930 () Bool)

(assert (=> b!617605 (=> (not res!397930) (not e!354142))))

(assert (=> b!617605 (= res!397930 (arrayContainsKey!0 lt!284424 (select (arr!18014 a!2986) j!136) j!136))))

(declare-fun e!354147 () Unit!20256)

(declare-fun Unit!20259 () Unit!20256)

(assert (=> b!617605 (= e!354147 Unit!20259)))

(declare-fun res!397933 () Bool)

(declare-fun b!617606 () Bool)

(assert (=> b!617606 (= res!397933 (arrayContainsKey!0 lt!284424 (select (arr!18014 a!2986) j!136) j!136))))

(declare-fun e!354145 () Bool)

(assert (=> b!617606 (=> (not res!397933) (not e!354145))))

(declare-fun e!354139 () Bool)

(assert (=> b!617606 (= e!354139 e!354145)))

(declare-fun b!617608 () Bool)

(declare-fun e!354149 () Unit!20256)

(declare-fun Unit!20260 () Unit!20256)

(assert (=> b!617608 (= e!354149 Unit!20260)))

(declare-fun res!397931 () Bool)

(assert (=> b!617608 (= res!397931 (= (select (store (arr!18014 a!2986) i!1108 k0!1786) index!984) (select (arr!18014 a!2986) j!136)))))

(declare-fun e!354151 () Bool)

(assert (=> b!617608 (=> (not res!397931) (not e!354151))))

(assert (=> b!617608 e!354151))

(declare-fun c!70204 () Bool)

(assert (=> b!617608 (= c!70204 (bvslt j!136 index!984))))

(declare-fun lt!284433 () Unit!20256)

(declare-fun e!354141 () Unit!20256)

(assert (=> b!617608 (= lt!284433 e!354141)))

(declare-fun c!70203 () Bool)

(assert (=> b!617608 (= c!70203 (bvslt index!984 j!136))))

(declare-fun lt!284432 () Unit!20256)

(assert (=> b!617608 (= lt!284432 e!354147)))

(assert (=> b!617608 false))

(declare-fun b!617609 () Bool)

(declare-fun Unit!20261 () Unit!20256)

(assert (=> b!617609 (= e!354146 Unit!20261)))

(declare-fun b!617610 () Bool)

(declare-fun e!354152 () Bool)

(declare-fun e!354140 () Bool)

(assert (=> b!617610 (= e!354152 (not e!354140))))

(declare-fun res!397941 () Bool)

(assert (=> b!617610 (=> res!397941 e!354140)))

(declare-datatypes ((SeekEntryResult!6451 0))(
  ( (MissingZero!6451 (index!28088 (_ BitVec 32))) (Found!6451 (index!28089 (_ BitVec 32))) (Intermediate!6451 (undefined!7263 Bool) (index!28090 (_ BitVec 32)) (x!56886 (_ BitVec 32))) (Undefined!6451) (MissingVacant!6451 (index!28091 (_ BitVec 32))) )
))
(declare-fun lt!284428 () SeekEntryResult!6451)

(assert (=> b!617610 (= res!397941 (not (= lt!284428 (MissingVacant!6451 vacantSpotIndex!68))))))

(declare-fun lt!284438 () Unit!20256)

(assert (=> b!617610 (= lt!284438 e!354149)))

(declare-fun c!70205 () Bool)

(assert (=> b!617610 (= c!70205 (= lt!284428 (Found!6451 index!984)))))

(declare-fun lt!284440 () Unit!20256)

(assert (=> b!617610 (= lt!284440 e!354146)))

(declare-fun c!70206 () Bool)

(assert (=> b!617610 (= c!70206 (= lt!284428 Undefined!6451))))

(declare-fun lt!284435 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37536 (_ BitVec 32)) SeekEntryResult!6451)

(assert (=> b!617610 (= lt!284428 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284435 lt!284424 mask!3053))))

(declare-fun e!354153 () Bool)

(assert (=> b!617610 e!354153))

(declare-fun res!397944 () Bool)

(assert (=> b!617610 (=> (not res!397944) (not e!354153))))

(declare-fun lt!284436 () (_ BitVec 32))

(declare-fun lt!284429 () SeekEntryResult!6451)

(assert (=> b!617610 (= res!397944 (= lt!284429 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284436 vacantSpotIndex!68 lt!284435 lt!284424 mask!3053)))))

(assert (=> b!617610 (= lt!284429 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284436 vacantSpotIndex!68 (select (arr!18014 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617610 (= lt!284435 (select (store (arr!18014 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284442 () Unit!20256)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37536 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20256)

(assert (=> b!617610 (= lt!284442 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284436 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617610 (= lt!284436 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!617611 () Bool)

(declare-fun e!354144 () Bool)

(assert (=> b!617611 (= e!354144 e!354152)))

(declare-fun res!397939 () Bool)

(assert (=> b!617611 (=> (not res!397939) (not e!354152))))

(declare-fun lt!284430 () SeekEntryResult!6451)

(assert (=> b!617611 (= res!397939 (and (= lt!284430 (Found!6451 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18014 a!2986) index!984) (select (arr!18014 a!2986) j!136))) (not (= (select (arr!18014 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!617611 (= lt!284430 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18014 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!397945 () Bool)

(assert (=> start!56052 (=> (not res!397945) (not e!354143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56052 (= res!397945 (validMask!0 mask!3053))))

(assert (=> start!56052 e!354143))

(assert (=> start!56052 true))

(declare-fun array_inv!13897 (array!37536) Bool)

(assert (=> start!56052 (array_inv!13897 a!2986)))

(declare-fun b!617607 () Bool)

(declare-fun res!397940 () Bool)

(assert (=> b!617607 (= res!397940 (bvsge j!136 index!984))))

(assert (=> b!617607 (=> res!397940 e!354139)))

(assert (=> b!617607 (= e!354151 e!354139)))

(declare-fun b!617612 () Bool)

(declare-fun res!397937 () Bool)

(assert (=> b!617612 (=> (not res!397937) (not e!354148))))

(assert (=> b!617612 (= res!397937 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12091))))

(declare-fun b!617613 () Bool)

(assert (=> b!617613 (= e!354148 e!354144)))

(declare-fun res!397943 () Bool)

(assert (=> b!617613 (=> (not res!397943) (not e!354144))))

(assert (=> b!617613 (= res!397943 (= (select (store (arr!18014 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!617613 (= lt!284424 (array!37537 (store (arr!18014 a!2986) i!1108 k0!1786) (size!18379 a!2986)))))

(declare-fun b!617614 () Bool)

(assert (=> b!617614 false))

(declare-fun lt!284426 () Unit!20256)

(assert (=> b!617614 (= lt!284426 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284424 (select (arr!18014 a!2986) j!136) j!136 Nil!12091))))

(assert (=> b!617614 (arrayNoDuplicates!0 lt!284424 j!136 Nil!12091)))

(declare-fun lt!284441 () Unit!20256)

(assert (=> b!617614 (= lt!284441 (lemmaNoDuplicateFromThenFromBigger!0 lt!284424 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617614 (arrayNoDuplicates!0 lt!284424 #b00000000000000000000000000000000 Nil!12091)))

(declare-fun lt!284427 () Unit!20256)

(assert (=> b!617614 (= lt!284427 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12091))))

(assert (=> b!617614 (arrayContainsKey!0 lt!284424 (select (arr!18014 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284437 () Unit!20256)

(assert (=> b!617614 (= lt!284437 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284424 (select (arr!18014 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20262 () Unit!20256)

(assert (=> b!617614 (= e!354141 Unit!20262)))

(declare-fun b!617615 () Bool)

(declare-fun res!397946 () Bool)

(assert (=> b!617615 (=> (not res!397946) (not e!354143))))

(assert (=> b!617615 (= res!397946 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617616 () Bool)

(assert (=> b!617616 (= e!354153 (= lt!284430 lt!284429))))

(declare-fun b!617617 () Bool)

(assert (=> b!617617 (= e!354143 e!354148)))

(declare-fun res!397935 () Bool)

(assert (=> b!617617 (=> (not res!397935) (not e!354148))))

(declare-fun lt!284434 () SeekEntryResult!6451)

(assert (=> b!617617 (= res!397935 (or (= lt!284434 (MissingZero!6451 i!1108)) (= lt!284434 (MissingVacant!6451 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37536 (_ BitVec 32)) SeekEntryResult!6451)

(assert (=> b!617617 (= lt!284434 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617618 () Bool)

(declare-fun Unit!20263 () Unit!20256)

(assert (=> b!617618 (= e!354149 Unit!20263)))

(declare-fun b!617619 () Bool)

(assert (=> b!617619 (= e!354142 (arrayContainsKey!0 lt!284424 (select (arr!18014 a!2986) j!136) index!984))))

(declare-fun b!617620 () Bool)

(declare-fun res!397936 () Bool)

(assert (=> b!617620 (=> (not res!397936) (not e!354148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37536 (_ BitVec 32)) Bool)

(assert (=> b!617620 (= res!397936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617621 () Bool)

(declare-fun Unit!20264 () Unit!20256)

(assert (=> b!617621 (= e!354147 Unit!20264)))

(declare-fun b!617622 () Bool)

(declare-fun res!397938 () Bool)

(assert (=> b!617622 (=> (not res!397938) (not e!354143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617622 (= res!397938 (validKeyInArray!0 (select (arr!18014 a!2986) j!136)))))

(declare-fun b!617623 () Bool)

(assert (=> b!617623 (= e!354140 true)))

(assert (=> b!617623 (= (select (store (arr!18014 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617624 () Bool)

(declare-fun Unit!20265 () Unit!20256)

(assert (=> b!617624 (= e!354141 Unit!20265)))

(declare-fun b!617625 () Bool)

(declare-fun res!397932 () Bool)

(assert (=> b!617625 (=> (not res!397932) (not e!354143))))

(assert (=> b!617625 (= res!397932 (validKeyInArray!0 k0!1786))))

(declare-fun b!617626 () Bool)

(assert (=> b!617626 (= e!354145 (arrayContainsKey!0 lt!284424 (select (arr!18014 a!2986) j!136) index!984))))

(assert (= (and start!56052 res!397945) b!617603))

(assert (= (and b!617603 res!397934) b!617622))

(assert (= (and b!617622 res!397938) b!617625))

(assert (= (and b!617625 res!397932) b!617615))

(assert (= (and b!617615 res!397946) b!617617))

(assert (= (and b!617617 res!397935) b!617620))

(assert (= (and b!617620 res!397936) b!617612))

(assert (= (and b!617612 res!397937) b!617604))

(assert (= (and b!617604 res!397942) b!617613))

(assert (= (and b!617613 res!397943) b!617611))

(assert (= (and b!617611 res!397939) b!617610))

(assert (= (and b!617610 res!397944) b!617616))

(assert (= (and b!617610 c!70206) b!617602))

(assert (= (and b!617610 (not c!70206)) b!617609))

(assert (= (and b!617610 c!70205) b!617608))

(assert (= (and b!617610 (not c!70205)) b!617618))

(assert (= (and b!617608 res!397931) b!617607))

(assert (= (and b!617607 (not res!397940)) b!617606))

(assert (= (and b!617606 res!397933) b!617626))

(assert (= (and b!617608 c!70204) b!617614))

(assert (= (and b!617608 (not c!70204)) b!617624))

(assert (= (and b!617608 c!70203) b!617605))

(assert (= (and b!617608 (not c!70203)) b!617621))

(assert (= (and b!617605 res!397930) b!617619))

(assert (= (and b!617610 (not res!397941)) b!617623))

(declare-fun m!593179 () Bool)

(assert (=> b!617622 m!593179))

(assert (=> b!617622 m!593179))

(declare-fun m!593181 () Bool)

(assert (=> b!617622 m!593181))

(declare-fun m!593183 () Bool)

(assert (=> b!617608 m!593183))

(declare-fun m!593185 () Bool)

(assert (=> b!617608 m!593185))

(assert (=> b!617608 m!593179))

(declare-fun m!593187 () Bool)

(assert (=> b!617612 m!593187))

(assert (=> b!617606 m!593179))

(assert (=> b!617606 m!593179))

(declare-fun m!593189 () Bool)

(assert (=> b!617606 m!593189))

(assert (=> b!617614 m!593179))

(declare-fun m!593191 () Bool)

(assert (=> b!617614 m!593191))

(declare-fun m!593193 () Bool)

(assert (=> b!617614 m!593193))

(assert (=> b!617614 m!593179))

(declare-fun m!593195 () Bool)

(assert (=> b!617614 m!593195))

(assert (=> b!617614 m!593179))

(declare-fun m!593197 () Bool)

(assert (=> b!617614 m!593197))

(declare-fun m!593199 () Bool)

(assert (=> b!617614 m!593199))

(assert (=> b!617614 m!593179))

(declare-fun m!593201 () Bool)

(assert (=> b!617614 m!593201))

(declare-fun m!593203 () Bool)

(assert (=> b!617614 m!593203))

(declare-fun m!593205 () Bool)

(assert (=> b!617615 m!593205))

(assert (=> b!617623 m!593183))

(assert (=> b!617623 m!593185))

(assert (=> b!617626 m!593179))

(assert (=> b!617626 m!593179))

(declare-fun m!593207 () Bool)

(assert (=> b!617626 m!593207))

(declare-fun m!593209 () Bool)

(assert (=> start!56052 m!593209))

(declare-fun m!593211 () Bool)

(assert (=> start!56052 m!593211))

(declare-fun m!593213 () Bool)

(assert (=> b!617604 m!593213))

(assert (=> b!617605 m!593179))

(assert (=> b!617605 m!593193))

(declare-fun m!593215 () Bool)

(assert (=> b!617605 m!593215))

(assert (=> b!617605 m!593179))

(declare-fun m!593217 () Bool)

(assert (=> b!617605 m!593217))

(assert (=> b!617605 m!593179))

(assert (=> b!617605 m!593189))

(assert (=> b!617605 m!593179))

(declare-fun m!593219 () Bool)

(assert (=> b!617605 m!593219))

(assert (=> b!617605 m!593179))

(declare-fun m!593221 () Bool)

(assert (=> b!617605 m!593221))

(assert (=> b!617605 m!593203))

(declare-fun m!593223 () Bool)

(assert (=> b!617605 m!593223))

(declare-fun m!593225 () Bool)

(assert (=> b!617611 m!593225))

(assert (=> b!617611 m!593179))

(assert (=> b!617611 m!593179))

(declare-fun m!593227 () Bool)

(assert (=> b!617611 m!593227))

(declare-fun m!593229 () Bool)

(assert (=> b!617617 m!593229))

(declare-fun m!593231 () Bool)

(assert (=> b!617620 m!593231))

(declare-fun m!593233 () Bool)

(assert (=> b!617625 m!593233))

(declare-fun m!593235 () Bool)

(assert (=> b!617610 m!593235))

(declare-fun m!593237 () Bool)

(assert (=> b!617610 m!593237))

(assert (=> b!617610 m!593179))

(assert (=> b!617610 m!593183))

(declare-fun m!593239 () Bool)

(assert (=> b!617610 m!593239))

(declare-fun m!593241 () Bool)

(assert (=> b!617610 m!593241))

(declare-fun m!593243 () Bool)

(assert (=> b!617610 m!593243))

(assert (=> b!617610 m!593179))

(declare-fun m!593245 () Bool)

(assert (=> b!617610 m!593245))

(assert (=> b!617613 m!593183))

(declare-fun m!593247 () Bool)

(assert (=> b!617613 m!593247))

(assert (=> b!617619 m!593179))

(assert (=> b!617619 m!593179))

(assert (=> b!617619 m!593207))

(check-sat (not b!617606) (not b!617610) (not b!617622) (not b!617614) (not b!617620) (not b!617615) (not b!617605) (not b!617626) (not start!56052) (not b!617611) (not b!617619) (not b!617625) (not b!617612) (not b!617617))
(check-sat)
