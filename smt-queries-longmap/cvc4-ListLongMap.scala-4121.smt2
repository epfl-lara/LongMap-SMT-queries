; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56228 () Bool)

(assert start!56228)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!357683 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!623618 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37698 0))(
  ( (array!37699 (arr!18095 (Array (_ BitVec 32) (_ BitVec 64))) (size!18459 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37698)

(assert (=> b!623618 (= e!357683 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!18095 a!2986) index!984) (select (arr!18095 a!2986) j!136)) (not (= index!984 j!136))))))

(declare-fun b!623619 () Bool)

(declare-fun res!401957 () Bool)

(declare-fun e!357684 () Bool)

(assert (=> b!623619 (=> (not res!401957) (not e!357684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623619 (= res!401957 (validKeyInArray!0 (select (arr!18095 a!2986) j!136)))))

(declare-fun b!623620 () Bool)

(declare-fun res!401955 () Bool)

(assert (=> b!623620 (=> (not res!401955) (not e!357683))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6535 0))(
  ( (MissingZero!6535 (index!28424 (_ BitVec 32))) (Found!6535 (index!28425 (_ BitVec 32))) (Intermediate!6535 (undefined!7347 Bool) (index!28426 (_ BitVec 32)) (x!57183 (_ BitVec 32))) (Undefined!6535) (MissingVacant!6535 (index!28427 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37698 (_ BitVec 32)) SeekEntryResult!6535)

(assert (=> b!623620 (= res!401955 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18095 a!2986) j!136) a!2986 mask!3053) (Found!6535 j!136)))))

(declare-fun b!623621 () Bool)

(declare-fun res!401951 () Bool)

(assert (=> b!623621 (=> (not res!401951) (not e!357683))))

(declare-datatypes ((List!12136 0))(
  ( (Nil!12133) (Cons!12132 (h!13177 (_ BitVec 64)) (t!18364 List!12136)) )
))
(declare-fun arrayNoDuplicates!0 (array!37698 (_ BitVec 32) List!12136) Bool)

(assert (=> b!623621 (= res!401951 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12133))))

(declare-fun b!623622 () Bool)

(assert (=> b!623622 (= e!357684 e!357683)))

(declare-fun res!401949 () Bool)

(assert (=> b!623622 (=> (not res!401949) (not e!357683))))

(declare-fun lt!289306 () SeekEntryResult!6535)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!623622 (= res!401949 (or (= lt!289306 (MissingZero!6535 i!1108)) (= lt!289306 (MissingVacant!6535 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37698 (_ BitVec 32)) SeekEntryResult!6535)

(assert (=> b!623622 (= lt!289306 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!623623 () Bool)

(declare-fun res!401956 () Bool)

(assert (=> b!623623 (=> (not res!401956) (not e!357684))))

(declare-fun arrayContainsKey!0 (array!37698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623623 (= res!401956 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!401950 () Bool)

(assert (=> start!56228 (=> (not res!401950) (not e!357684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56228 (= res!401950 (validMask!0 mask!3053))))

(assert (=> start!56228 e!357684))

(assert (=> start!56228 true))

(declare-fun array_inv!13891 (array!37698) Bool)

(assert (=> start!56228 (array_inv!13891 a!2986)))

(declare-fun b!623624 () Bool)

(declare-fun res!401954 () Bool)

(assert (=> b!623624 (=> (not res!401954) (not e!357683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37698 (_ BitVec 32)) Bool)

(assert (=> b!623624 (= res!401954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623625 () Bool)

(declare-fun res!401948 () Bool)

(assert (=> b!623625 (=> (not res!401948) (not e!357684))))

(assert (=> b!623625 (= res!401948 (validKeyInArray!0 k!1786))))

(declare-fun b!623626 () Bool)

(declare-fun res!401953 () Bool)

(assert (=> b!623626 (=> (not res!401953) (not e!357683))))

(assert (=> b!623626 (= res!401953 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18095 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18095 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623627 () Bool)

(declare-fun res!401952 () Bool)

(assert (=> b!623627 (=> (not res!401952) (not e!357684))))

(assert (=> b!623627 (= res!401952 (and (= (size!18459 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18459 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18459 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56228 res!401950) b!623627))

(assert (= (and b!623627 res!401952) b!623619))

(assert (= (and b!623619 res!401957) b!623625))

(assert (= (and b!623625 res!401948) b!623623))

(assert (= (and b!623623 res!401956) b!623622))

(assert (= (and b!623622 res!401949) b!623624))

(assert (= (and b!623624 res!401954) b!623621))

(assert (= (and b!623621 res!401951) b!623626))

(assert (= (and b!623626 res!401953) b!623620))

(assert (= (and b!623620 res!401955) b!623618))

(declare-fun m!599473 () Bool)

(assert (=> b!623626 m!599473))

(declare-fun m!599475 () Bool)

(assert (=> b!623626 m!599475))

(declare-fun m!599477 () Bool)

(assert (=> b!623626 m!599477))

(declare-fun m!599479 () Bool)

(assert (=> b!623622 m!599479))

(declare-fun m!599481 () Bool)

(assert (=> b!623620 m!599481))

(assert (=> b!623620 m!599481))

(declare-fun m!599483 () Bool)

(assert (=> b!623620 m!599483))

(declare-fun m!599485 () Bool)

(assert (=> start!56228 m!599485))

(declare-fun m!599487 () Bool)

(assert (=> start!56228 m!599487))

(declare-fun m!599489 () Bool)

(assert (=> b!623625 m!599489))

(assert (=> b!623619 m!599481))

(assert (=> b!623619 m!599481))

(declare-fun m!599491 () Bool)

(assert (=> b!623619 m!599491))

(declare-fun m!599493 () Bool)

(assert (=> b!623623 m!599493))

(declare-fun m!599495 () Bool)

(assert (=> b!623624 m!599495))

(declare-fun m!599497 () Bool)

(assert (=> b!623618 m!599497))

(assert (=> b!623618 m!599481))

(declare-fun m!599499 () Bool)

(assert (=> b!623621 m!599499))

(push 1)

(assert (not b!623620))

(assert (not b!623621))

(assert (not b!623622))

(assert (not b!623624))

(assert (not b!623625))

(assert (not b!623619))

(assert (not start!56228))

(assert (not b!623623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!623666 () Bool)

(declare-fun e!357709 () Bool)

(declare-fun e!357711 () Bool)

(assert (=> b!623666 (= e!357709 e!357711)))

(declare-fun c!71216 () Bool)

(assert (=> b!623666 (= c!71216 (validKeyInArray!0 (select (arr!18095 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88691 () Bool)

(declare-fun res!401969 () Bool)

(assert (=> d!88691 (=> res!401969 e!357709)))

(assert (=> d!88691 (= res!401969 (bvsge #b00000000000000000000000000000000 (size!18459 a!2986)))))

(assert (=> d!88691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!357709)))

(declare-fun b!623667 () Bool)

(declare-fun e!357710 () Bool)

(declare-fun call!33188 () Bool)

(assert (=> b!623667 (= e!357710 call!33188)))

(declare-fun b!623668 () Bool)

(assert (=> b!623668 (= e!357711 e!357710)))

(declare-fun lt!289332 () (_ BitVec 64))

(assert (=> b!623668 (= lt!289332 (select (arr!18095 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21062 0))(
  ( (Unit!21063) )
))
(declare-fun lt!289333 () Unit!21062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37698 (_ BitVec 64) (_ BitVec 32)) Unit!21062)

(assert (=> b!623668 (= lt!289333 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289332 #b00000000000000000000000000000000))))

(assert (=> b!623668 (arrayContainsKey!0 a!2986 lt!289332 #b00000000000000000000000000000000)))

(declare-fun lt!289331 () Unit!21062)

(assert (=> b!623668 (= lt!289331 lt!289333)))

(declare-fun res!401968 () Bool)

(assert (=> b!623668 (= res!401968 (= (seekEntryOrOpen!0 (select (arr!18095 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6535 #b00000000000000000000000000000000)))))

(assert (=> b!623668 (=> (not res!401968) (not e!357710))))

(declare-fun b!623669 () Bool)

(assert (=> b!623669 (= e!357711 call!33188)))

(declare-fun bm!33185 () Bool)

(assert (=> bm!33185 (= call!33188 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!88691 (not res!401969)) b!623666))

(assert (= (and b!623666 c!71216) b!623668))

(assert (= (and b!623666 (not c!71216)) b!623669))

(assert (= (and b!623668 res!401968) b!623667))

(assert (= (or b!623667 b!623669) bm!33185))

(declare-fun m!599527 () Bool)

(assert (=> b!623666 m!599527))

(assert (=> b!623666 m!599527))

(declare-fun m!599529 () Bool)

(assert (=> b!623666 m!599529))

(assert (=> b!623668 m!599527))

(declare-fun m!599531 () Bool)

(assert (=> b!623668 m!599531))

(declare-fun m!599533 () Bool)

(assert (=> b!623668 m!599533))

(assert (=> b!623668 m!599527))

(declare-fun m!599535 () Bool)

(assert (=> b!623668 m!599535))

(declare-fun m!599537 () Bool)

(assert (=> bm!33185 m!599537))

(assert (=> b!623624 d!88691))

(declare-fun d!88699 () Bool)

(assert (=> d!88699 (= (validKeyInArray!0 (select (arr!18095 a!2986) j!136)) (and (not (= (select (arr!18095 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18095 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!623619 d!88699))

(declare-fun d!88701 () Bool)

(assert (=> d!88701 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56228 d!88701))

(declare-fun d!88707 () Bool)

(assert (=> d!88707 (= (array_inv!13891 a!2986) (bvsge (size!18459 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56228 d!88707))

(declare-fun b!623766 () Bool)

(declare-fun e!357776 () SeekEntryResult!6535)

(assert (=> b!623766 (= e!357776 Undefined!6535)))

(declare-fun e!357775 () SeekEntryResult!6535)

(declare-fun lt!289363 () SeekEntryResult!6535)

(declare-fun b!623767 () Bool)

(assert (=> b!623767 (= e!357775 (seekKeyOrZeroReturnVacant!0 (x!57183 lt!289363) (index!28426 lt!289363) (index!28426 lt!289363) k!1786 a!2986 mask!3053))))

(declare-fun b!623768 () Bool)

(declare-fun e!357777 () SeekEntryResult!6535)

(assert (=> b!623768 (= e!357776 e!357777)))

(declare-fun lt!289361 () (_ BitVec 64))

(assert (=> b!623768 (= lt!289361 (select (arr!18095 a!2986) (index!28426 lt!289363)))))

(declare-fun c!71250 () Bool)

(assert (=> b!623768 (= c!71250 (= lt!289361 k!1786))))

(declare-fun b!623769 () Bool)

(assert (=> b!623769 (= e!357777 (Found!6535 (index!28426 lt!289363)))))

(declare-fun d!88709 () Bool)

(declare-fun lt!289362 () SeekEntryResult!6535)

(assert (=> d!88709 (and (or (is-Undefined!6535 lt!289362) (not (is-Found!6535 lt!289362)) (and (bvsge (index!28425 lt!289362) #b00000000000000000000000000000000) (bvslt (index!28425 lt!289362) (size!18459 a!2986)))) (or (is-Undefined!6535 lt!289362) (is-Found!6535 lt!289362) (not (is-MissingZero!6535 lt!289362)) (and (bvsge (index!28424 lt!289362) #b00000000000000000000000000000000) (bvslt (index!28424 lt!289362) (size!18459 a!2986)))) (or (is-Undefined!6535 lt!289362) (is-Found!6535 lt!289362) (is-MissingZero!6535 lt!289362) (not (is-MissingVacant!6535 lt!289362)) (and (bvsge (index!28427 lt!289362) #b00000000000000000000000000000000) (bvslt (index!28427 lt!289362) (size!18459 a!2986)))) (or (is-Undefined!6535 lt!289362) (ite (is-Found!6535 lt!289362) (= (select (arr!18095 a!2986) (index!28425 lt!289362)) k!1786) (ite (is-MissingZero!6535 lt!289362) (= (select (arr!18095 a!2986) (index!28424 lt!289362)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6535 lt!289362) (= (select (arr!18095 a!2986) (index!28427 lt!289362)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88709 (= lt!289362 e!357776)))

(declare-fun c!71251 () Bool)

(assert (=> d!88709 (= c!71251 (and (is-Intermediate!6535 lt!289363) (undefined!7347 lt!289363)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37698 (_ BitVec 32)) SeekEntryResult!6535)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88709 (= lt!289363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!88709 (validMask!0 mask!3053)))

(assert (=> d!88709 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!289362)))

(declare-fun b!623770 () Bool)

(declare-fun c!71252 () Bool)

(assert (=> b!623770 (= c!71252 (= lt!289361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623770 (= e!357777 e!357775)))

(declare-fun b!623771 () Bool)

(assert (=> b!623771 (= e!357775 (MissingZero!6535 (index!28426 lt!289363)))))

(assert (= (and d!88709 c!71251) b!623766))

(assert (= (and d!88709 (not c!71251)) b!623768))

(assert (= (and b!623768 c!71250) b!623769))

(assert (= (and b!623768 (not c!71250)) b!623770))

(assert (= (and b!623770 c!71252) b!623771))

(assert (= (and b!623770 (not c!71252)) b!623767))

(declare-fun m!599577 () Bool)

(assert (=> b!623767 m!599577))

(declare-fun m!599579 () Bool)

(assert (=> b!623768 m!599579))

