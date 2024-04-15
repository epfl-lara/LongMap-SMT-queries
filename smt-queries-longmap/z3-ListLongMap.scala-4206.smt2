; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57590 () Bool)

(assert start!57590)

(declare-fun b!636557 () Bool)

(declare-fun e!364190 () Bool)

(declare-fun e!364183 () Bool)

(assert (=> b!636557 (= e!364190 e!364183)))

(declare-fun res!411845 () Bool)

(assert (=> b!636557 (=> (not res!411845) (not e!364183))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6784 0))(
  ( (MissingZero!6784 (index!29447 (_ BitVec 32))) (Found!6784 (index!29448 (_ BitVec 32))) (Intermediate!6784 (undefined!7596 Bool) (index!29449 (_ BitVec 32)) (x!58212 (_ BitVec 32))) (Undefined!6784) (MissingVacant!6784 (index!29450 (_ BitVec 32))) )
))
(declare-fun lt!294220 () SeekEntryResult!6784)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38247 0))(
  ( (array!38248 (arr!18347 (Array (_ BitVec 32) (_ BitVec 64))) (size!18712 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38247)

(assert (=> b!636557 (= res!411845 (and (= lt!294220 (Found!6784 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18347 a!2986) index!984) (select (arr!18347 a!2986) j!136))) (not (= (select (arr!18347 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38247 (_ BitVec 32)) SeekEntryResult!6784)

(assert (=> b!636557 (= lt!294220 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636558 () Bool)

(declare-fun e!364188 () Bool)

(declare-fun e!364185 () Bool)

(assert (=> b!636558 (= e!364188 e!364185)))

(declare-fun res!411854 () Bool)

(assert (=> b!636558 (=> (not res!411854) (not e!364185))))

(declare-fun lt!294216 () SeekEntryResult!6784)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!636558 (= res!411854 (or (= lt!294216 (MissingZero!6784 i!1108)) (= lt!294216 (MissingVacant!6784 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38247 (_ BitVec 32)) SeekEntryResult!6784)

(assert (=> b!636558 (= lt!294216 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!636559 () Bool)

(declare-datatypes ((Unit!21464 0))(
  ( (Unit!21465) )
))
(declare-fun e!364187 () Unit!21464)

(declare-fun Unit!21466 () Unit!21464)

(assert (=> b!636559 (= e!364187 Unit!21466)))

(declare-fun b!636560 () Bool)

(declare-fun res!411856 () Bool)

(assert (=> b!636560 (=> (not res!411856) (not e!364188))))

(declare-fun arrayContainsKey!0 (array!38247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636560 (= res!411856 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!636561 () Bool)

(declare-fun res!411850 () Bool)

(assert (=> b!636561 (=> (not res!411850) (not e!364188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!636561 (= res!411850 (validKeyInArray!0 (select (arr!18347 a!2986) j!136)))))

(declare-fun b!636562 () Bool)

(declare-fun e!364189 () Bool)

(assert (=> b!636562 (= e!364183 (not e!364189))))

(declare-fun res!411853 () Bool)

(assert (=> b!636562 (=> res!411853 e!364189)))

(declare-fun lt!294217 () SeekEntryResult!6784)

(assert (=> b!636562 (= res!411853 (not (= lt!294217 (Found!6784 index!984))))))

(declare-fun lt!294213 () Unit!21464)

(assert (=> b!636562 (= lt!294213 e!364187)))

(declare-fun c!72723 () Bool)

(assert (=> b!636562 (= c!72723 (= lt!294217 Undefined!6784))))

(declare-fun lt!294214 () array!38247)

(declare-fun lt!294222 () (_ BitVec 64))

(assert (=> b!636562 (= lt!294217 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294222 lt!294214 mask!3053))))

(declare-fun e!364178 () Bool)

(assert (=> b!636562 e!364178))

(declare-fun res!411863 () Bool)

(assert (=> b!636562 (=> (not res!411863) (not e!364178))))

(declare-fun lt!294221 () (_ BitVec 32))

(declare-fun lt!294218 () SeekEntryResult!6784)

(assert (=> b!636562 (= res!411863 (= lt!294218 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294221 vacantSpotIndex!68 lt!294222 lt!294214 mask!3053)))))

(assert (=> b!636562 (= lt!294218 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294221 vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!636562 (= lt!294222 (select (store (arr!18347 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294215 () Unit!21464)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38247 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21464)

(assert (=> b!636562 (= lt!294215 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294221 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636562 (= lt!294221 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!636563 () Bool)

(assert (=> b!636563 (= e!364185 e!364190)))

(declare-fun res!411857 () Bool)

(assert (=> b!636563 (=> (not res!411857) (not e!364190))))

(assert (=> b!636563 (= res!411857 (= (select (store (arr!18347 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636563 (= lt!294214 (array!38248 (store (arr!18347 a!2986) i!1108 k0!1786) (size!18712 a!2986)))))

(declare-fun b!636564 () Bool)

(declare-fun Unit!21467 () Unit!21464)

(assert (=> b!636564 (= e!364187 Unit!21467)))

(assert (=> b!636564 false))

(declare-fun b!636565 () Bool)

(declare-fun res!411849 () Bool)

(assert (=> b!636565 (=> (not res!411849) (not e!364185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38247 (_ BitVec 32)) Bool)

(assert (=> b!636565 (= res!411849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!411864 () Bool)

(assert (=> start!57590 (=> (not res!411864) (not e!364188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57590 (= res!411864 (validMask!0 mask!3053))))

(assert (=> start!57590 e!364188))

(assert (=> start!57590 true))

(declare-fun array_inv!14230 (array!38247) Bool)

(assert (=> start!57590 (array_inv!14230 a!2986)))

(declare-fun b!636566 () Bool)

(declare-fun res!411865 () Bool)

(declare-fun e!364181 () Bool)

(assert (=> b!636566 (=> res!411865 e!364181)))

(declare-datatypes ((List!12427 0))(
  ( (Nil!12424) (Cons!12423 (h!13468 (_ BitVec 64)) (t!18646 List!12427)) )
))
(declare-fun contains!3087 (List!12427 (_ BitVec 64)) Bool)

(assert (=> b!636566 (= res!411865 (contains!3087 Nil!12424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636567 () Bool)

(assert (=> b!636567 (= e!364178 (= lt!294220 lt!294218))))

(declare-fun b!636568 () Bool)

(declare-fun e!364180 () Bool)

(assert (=> b!636568 (= e!364180 (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) index!984))))

(declare-fun b!636569 () Bool)

(declare-fun e!364182 () Bool)

(assert (=> b!636569 (= e!364182 e!364181)))

(declare-fun res!411848 () Bool)

(assert (=> b!636569 (=> res!411848 e!364181)))

(assert (=> b!636569 (= res!411848 (or (bvsge (size!18712 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18712 a!2986))))))

(assert (=> b!636569 (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294212 () Unit!21464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38247 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21464)

(assert (=> b!636569 (= lt!294212 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294214 (select (arr!18347 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!636570 () Bool)

(assert (=> b!636570 (= e!364181 (not (contains!3087 Nil!12424 k0!1786)))))

(declare-fun b!636571 () Bool)

(assert (=> b!636571 (= e!364189 e!364182)))

(declare-fun res!411846 () Bool)

(assert (=> b!636571 (=> res!411846 e!364182)))

(declare-fun lt!294219 () (_ BitVec 64))

(assert (=> b!636571 (= res!411846 (or (not (= (select (arr!18347 a!2986) j!136) lt!294222)) (not (= (select (arr!18347 a!2986) j!136) lt!294219)) (bvsge j!136 index!984)))))

(declare-fun e!364186 () Bool)

(assert (=> b!636571 e!364186))

(declare-fun res!411861 () Bool)

(assert (=> b!636571 (=> (not res!411861) (not e!364186))))

(assert (=> b!636571 (= res!411861 (= lt!294219 (select (arr!18347 a!2986) j!136)))))

(assert (=> b!636571 (= lt!294219 (select (store (arr!18347 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!636572 () Bool)

(declare-fun e!364179 () Bool)

(assert (=> b!636572 (= e!364186 e!364179)))

(declare-fun res!411860 () Bool)

(assert (=> b!636572 (=> res!411860 e!364179)))

(assert (=> b!636572 (= res!411860 (or (not (= (select (arr!18347 a!2986) j!136) lt!294222)) (not (= (select (arr!18347 a!2986) j!136) lt!294219)) (bvsge j!136 index!984)))))

(declare-fun b!636573 () Bool)

(declare-fun res!411847 () Bool)

(assert (=> b!636573 (=> (not res!411847) (not e!364188))))

(assert (=> b!636573 (= res!411847 (validKeyInArray!0 k0!1786))))

(declare-fun b!636574 () Bool)

(declare-fun res!411858 () Bool)

(assert (=> b!636574 (=> (not res!411858) (not e!364188))))

(assert (=> b!636574 (= res!411858 (and (= (size!18712 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18712 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18712 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!636575 () Bool)

(declare-fun res!411859 () Bool)

(assert (=> b!636575 (=> (not res!411859) (not e!364185))))

(declare-fun arrayNoDuplicates!0 (array!38247 (_ BitVec 32) List!12427) Bool)

(assert (=> b!636575 (= res!411859 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12424))))

(declare-fun b!636576 () Bool)

(declare-fun res!411862 () Bool)

(assert (=> b!636576 (=> res!411862 e!364181)))

(declare-fun noDuplicate!386 (List!12427) Bool)

(assert (=> b!636576 (= res!411862 (not (noDuplicate!386 Nil!12424)))))

(declare-fun b!636577 () Bool)

(declare-fun res!411852 () Bool)

(assert (=> b!636577 (=> res!411852 e!364181)))

(assert (=> b!636577 (= res!411852 (contains!3087 Nil!12424 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636578 () Bool)

(assert (=> b!636578 (= e!364179 e!364180)))

(declare-fun res!411855 () Bool)

(assert (=> b!636578 (=> (not res!411855) (not e!364180))))

(assert (=> b!636578 (= res!411855 (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) j!136))))

(declare-fun b!636579 () Bool)

(declare-fun res!411851 () Bool)

(assert (=> b!636579 (=> (not res!411851) (not e!364185))))

(assert (=> b!636579 (= res!411851 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18347 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57590 res!411864) b!636574))

(assert (= (and b!636574 res!411858) b!636561))

(assert (= (and b!636561 res!411850) b!636573))

(assert (= (and b!636573 res!411847) b!636560))

(assert (= (and b!636560 res!411856) b!636558))

(assert (= (and b!636558 res!411854) b!636565))

(assert (= (and b!636565 res!411849) b!636575))

(assert (= (and b!636575 res!411859) b!636579))

(assert (= (and b!636579 res!411851) b!636563))

(assert (= (and b!636563 res!411857) b!636557))

(assert (= (and b!636557 res!411845) b!636562))

(assert (= (and b!636562 res!411863) b!636567))

(assert (= (and b!636562 c!72723) b!636564))

(assert (= (and b!636562 (not c!72723)) b!636559))

(assert (= (and b!636562 (not res!411853)) b!636571))

(assert (= (and b!636571 res!411861) b!636572))

(assert (= (and b!636572 (not res!411860)) b!636578))

(assert (= (and b!636578 res!411855) b!636568))

(assert (= (and b!636571 (not res!411846)) b!636569))

(assert (= (and b!636569 (not res!411848)) b!636576))

(assert (= (and b!636576 (not res!411862)) b!636566))

(assert (= (and b!636566 (not res!411865)) b!636577))

(assert (= (and b!636577 (not res!411852)) b!636570))

(declare-fun m!610227 () Bool)

(assert (=> b!636571 m!610227))

(declare-fun m!610229 () Bool)

(assert (=> b!636571 m!610229))

(declare-fun m!610231 () Bool)

(assert (=> b!636571 m!610231))

(declare-fun m!610233 () Bool)

(assert (=> b!636562 m!610233))

(declare-fun m!610235 () Bool)

(assert (=> b!636562 m!610235))

(assert (=> b!636562 m!610227))

(assert (=> b!636562 m!610229))

(declare-fun m!610237 () Bool)

(assert (=> b!636562 m!610237))

(assert (=> b!636562 m!610227))

(declare-fun m!610239 () Bool)

(assert (=> b!636562 m!610239))

(declare-fun m!610241 () Bool)

(assert (=> b!636562 m!610241))

(declare-fun m!610243 () Bool)

(assert (=> b!636562 m!610243))

(declare-fun m!610245 () Bool)

(assert (=> b!636576 m!610245))

(declare-fun m!610247 () Bool)

(assert (=> b!636565 m!610247))

(declare-fun m!610249 () Bool)

(assert (=> b!636557 m!610249))

(assert (=> b!636557 m!610227))

(assert (=> b!636557 m!610227))

(declare-fun m!610251 () Bool)

(assert (=> b!636557 m!610251))

(declare-fun m!610253 () Bool)

(assert (=> b!636575 m!610253))

(declare-fun m!610255 () Bool)

(assert (=> b!636573 m!610255))

(declare-fun m!610257 () Bool)

(assert (=> b!636560 m!610257))

(declare-fun m!610259 () Bool)

(assert (=> b!636570 m!610259))

(assert (=> b!636572 m!610227))

(declare-fun m!610261 () Bool)

(assert (=> start!57590 m!610261))

(declare-fun m!610263 () Bool)

(assert (=> start!57590 m!610263))

(assert (=> b!636563 m!610229))

(declare-fun m!610265 () Bool)

(assert (=> b!636563 m!610265))

(assert (=> b!636569 m!610227))

(assert (=> b!636569 m!610227))

(declare-fun m!610267 () Bool)

(assert (=> b!636569 m!610267))

(assert (=> b!636569 m!610227))

(declare-fun m!610269 () Bool)

(assert (=> b!636569 m!610269))

(assert (=> b!636561 m!610227))

(assert (=> b!636561 m!610227))

(declare-fun m!610271 () Bool)

(assert (=> b!636561 m!610271))

(assert (=> b!636578 m!610227))

(assert (=> b!636578 m!610227))

(declare-fun m!610273 () Bool)

(assert (=> b!636578 m!610273))

(assert (=> b!636568 m!610227))

(assert (=> b!636568 m!610227))

(declare-fun m!610275 () Bool)

(assert (=> b!636568 m!610275))

(declare-fun m!610277 () Bool)

(assert (=> b!636577 m!610277))

(declare-fun m!610279 () Bool)

(assert (=> b!636558 m!610279))

(declare-fun m!610281 () Bool)

(assert (=> b!636566 m!610281))

(declare-fun m!610283 () Bool)

(assert (=> b!636579 m!610283))

(check-sat (not b!636570) (not b!636566) (not b!636575) (not b!636578) (not b!636560) (not b!636557) (not b!636576) (not b!636569) (not b!636562) (not b!636561) (not start!57590) (not b!636558) (not b!636573) (not b!636568) (not b!636565) (not b!636577))
(check-sat)
(get-model)

(declare-fun d!89851 () Bool)

(declare-fun res!411996 () Bool)

(declare-fun e!364273 () Bool)

(assert (=> d!89851 (=> res!411996 e!364273)))

(assert (=> d!89851 (= res!411996 (= (select (arr!18347 lt!294214) j!136) (select (arr!18347 a!2986) j!136)))))

(assert (=> d!89851 (= (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) j!136) e!364273)))

(declare-fun b!636722 () Bool)

(declare-fun e!364274 () Bool)

(assert (=> b!636722 (= e!364273 e!364274)))

(declare-fun res!411997 () Bool)

(assert (=> b!636722 (=> (not res!411997) (not e!364274))))

(assert (=> b!636722 (= res!411997 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18712 lt!294214)))))

(declare-fun b!636723 () Bool)

(assert (=> b!636723 (= e!364274 (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89851 (not res!411996)) b!636722))

(assert (= (and b!636722 res!411997) b!636723))

(declare-fun m!610401 () Bool)

(assert (=> d!89851 m!610401))

(assert (=> b!636723 m!610227))

(declare-fun m!610403 () Bool)

(assert (=> b!636723 m!610403))

(assert (=> b!636578 d!89851))

(declare-fun b!636736 () Bool)

(declare-fun e!364281 () SeekEntryResult!6784)

(assert (=> b!636736 (= e!364281 Undefined!6784)))

(declare-fun b!636737 () Bool)

(declare-fun e!364283 () SeekEntryResult!6784)

(assert (=> b!636737 (= e!364283 (MissingVacant!6784 vacantSpotIndex!68))))

(declare-fun b!636738 () Bool)

(declare-fun e!364282 () SeekEntryResult!6784)

(assert (=> b!636738 (= e!364282 (Found!6784 index!984))))

(declare-fun b!636740 () Bool)

(assert (=> b!636740 (= e!364283 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636741 () Bool)

(declare-fun c!72736 () Bool)

(declare-fun lt!294293 () (_ BitVec 64))

(assert (=> b!636741 (= c!72736 (= lt!294293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636741 (= e!364282 e!364283)))

(declare-fun b!636739 () Bool)

(assert (=> b!636739 (= e!364281 e!364282)))

(declare-fun c!72737 () Bool)

(assert (=> b!636739 (= c!72737 (= lt!294293 (select (arr!18347 a!2986) j!136)))))

(declare-fun lt!294294 () SeekEntryResult!6784)

(declare-fun d!89853 () Bool)

(get-info :version)

(assert (=> d!89853 (and (or ((_ is Undefined!6784) lt!294294) (not ((_ is Found!6784) lt!294294)) (and (bvsge (index!29448 lt!294294) #b00000000000000000000000000000000) (bvslt (index!29448 lt!294294) (size!18712 a!2986)))) (or ((_ is Undefined!6784) lt!294294) ((_ is Found!6784) lt!294294) (not ((_ is MissingVacant!6784) lt!294294)) (not (= (index!29450 lt!294294) vacantSpotIndex!68)) (and (bvsge (index!29450 lt!294294) #b00000000000000000000000000000000) (bvslt (index!29450 lt!294294) (size!18712 a!2986)))) (or ((_ is Undefined!6784) lt!294294) (ite ((_ is Found!6784) lt!294294) (= (select (arr!18347 a!2986) (index!29448 lt!294294)) (select (arr!18347 a!2986) j!136)) (and ((_ is MissingVacant!6784) lt!294294) (= (index!29450 lt!294294) vacantSpotIndex!68) (= (select (arr!18347 a!2986) (index!29450 lt!294294)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89853 (= lt!294294 e!364281)))

(declare-fun c!72738 () Bool)

(assert (=> d!89853 (= c!72738 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89853 (= lt!294293 (select (arr!18347 a!2986) index!984))))

(assert (=> d!89853 (validMask!0 mask!3053)))

(assert (=> d!89853 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053) lt!294294)))

(assert (= (and d!89853 c!72738) b!636736))

(assert (= (and d!89853 (not c!72738)) b!636739))

(assert (= (and b!636739 c!72737) b!636738))

(assert (= (and b!636739 (not c!72737)) b!636741))

(assert (= (and b!636741 c!72736) b!636737))

(assert (= (and b!636741 (not c!72736)) b!636740))

(assert (=> b!636740 m!610233))

(assert (=> b!636740 m!610233))

(assert (=> b!636740 m!610227))

(declare-fun m!610405 () Bool)

(assert (=> b!636740 m!610405))

(declare-fun m!610407 () Bool)

(assert (=> d!89853 m!610407))

(declare-fun m!610409 () Bool)

(assert (=> d!89853 m!610409))

(assert (=> d!89853 m!610249))

(assert (=> d!89853 m!610261))

(assert (=> b!636557 d!89853))

(declare-fun d!89855 () Bool)

(declare-fun res!411998 () Bool)

(declare-fun e!364284 () Bool)

(assert (=> d!89855 (=> res!411998 e!364284)))

(assert (=> d!89855 (= res!411998 (= (select (arr!18347 lt!294214) index!984) (select (arr!18347 a!2986) j!136)))))

(assert (=> d!89855 (= (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) index!984) e!364284)))

(declare-fun b!636742 () Bool)

(declare-fun e!364285 () Bool)

(assert (=> b!636742 (= e!364284 e!364285)))

(declare-fun res!411999 () Bool)

(assert (=> b!636742 (=> (not res!411999) (not e!364285))))

(assert (=> b!636742 (= res!411999 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18712 lt!294214)))))

(declare-fun b!636743 () Bool)

(assert (=> b!636743 (= e!364285 (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89855 (not res!411998)) b!636742))

(assert (= (and b!636742 res!411999) b!636743))

(declare-fun m!610411 () Bool)

(assert (=> d!89855 m!610411))

(assert (=> b!636743 m!610227))

(declare-fun m!610413 () Bool)

(assert (=> b!636743 m!610413))

(assert (=> b!636568 d!89855))

(declare-fun d!89857 () Bool)

(declare-fun lt!294297 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!242 (List!12427) (InoxSet (_ BitVec 64)))

(assert (=> d!89857 (= lt!294297 (select (content!242 Nil!12424) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364290 () Bool)

(assert (=> d!89857 (= lt!294297 e!364290)))

(declare-fun res!412005 () Bool)

(assert (=> d!89857 (=> (not res!412005) (not e!364290))))

(assert (=> d!89857 (= res!412005 ((_ is Cons!12423) Nil!12424))))

(assert (=> d!89857 (= (contains!3087 Nil!12424 #b0000000000000000000000000000000000000000000000000000000000000000) lt!294297)))

(declare-fun b!636748 () Bool)

(declare-fun e!364291 () Bool)

(assert (=> b!636748 (= e!364290 e!364291)))

(declare-fun res!412004 () Bool)

(assert (=> b!636748 (=> res!412004 e!364291)))

(assert (=> b!636748 (= res!412004 (= (h!13468 Nil!12424) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636749 () Bool)

(assert (=> b!636749 (= e!364291 (contains!3087 (t!18646 Nil!12424) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!89857 res!412005) b!636748))

(assert (= (and b!636748 (not res!412004)) b!636749))

(declare-fun m!610415 () Bool)

(assert (=> d!89857 m!610415))

(declare-fun m!610417 () Bool)

(assert (=> d!89857 m!610417))

(declare-fun m!610419 () Bool)

(assert (=> b!636749 m!610419))

(assert (=> b!636566 d!89857))

(declare-fun d!89859 () Bool)

(declare-fun lt!294298 () Bool)

(assert (=> d!89859 (= lt!294298 (select (content!242 Nil!12424) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364292 () Bool)

(assert (=> d!89859 (= lt!294298 e!364292)))

(declare-fun res!412007 () Bool)

(assert (=> d!89859 (=> (not res!412007) (not e!364292))))

(assert (=> d!89859 (= res!412007 ((_ is Cons!12423) Nil!12424))))

(assert (=> d!89859 (= (contains!3087 Nil!12424 #b1000000000000000000000000000000000000000000000000000000000000000) lt!294298)))

(declare-fun b!636750 () Bool)

(declare-fun e!364293 () Bool)

(assert (=> b!636750 (= e!364292 e!364293)))

(declare-fun res!412006 () Bool)

(assert (=> b!636750 (=> res!412006 e!364293)))

(assert (=> b!636750 (= res!412006 (= (h!13468 Nil!12424) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636751 () Bool)

(assert (=> b!636751 (= e!364293 (contains!3087 (t!18646 Nil!12424) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!89859 res!412007) b!636750))

(assert (= (and b!636750 (not res!412006)) b!636751))

(assert (=> d!89859 m!610415))

(declare-fun m!610421 () Bool)

(assert (=> d!89859 m!610421))

(declare-fun m!610423 () Bool)

(assert (=> b!636751 m!610423))

(assert (=> b!636577 d!89859))

(declare-fun b!636762 () Bool)

(declare-fun e!364305 () Bool)

(declare-fun call!33424 () Bool)

(assert (=> b!636762 (= e!364305 call!33424)))

(declare-fun b!636763 () Bool)

(declare-fun e!364302 () Bool)

(assert (=> b!636763 (= e!364302 (contains!3087 Nil!12424 (select (arr!18347 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89861 () Bool)

(declare-fun res!412015 () Bool)

(declare-fun e!364303 () Bool)

(assert (=> d!89861 (=> res!412015 e!364303)))

(assert (=> d!89861 (= res!412015 (bvsge #b00000000000000000000000000000000 (size!18712 a!2986)))))

(assert (=> d!89861 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12424) e!364303)))

(declare-fun b!636764 () Bool)

(declare-fun e!364304 () Bool)

(assert (=> b!636764 (= e!364303 e!364304)))

(declare-fun res!412014 () Bool)

(assert (=> b!636764 (=> (not res!412014) (not e!364304))))

(assert (=> b!636764 (= res!412014 (not e!364302))))

(declare-fun res!412016 () Bool)

(assert (=> b!636764 (=> (not res!412016) (not e!364302))))

(assert (=> b!636764 (= res!412016 (validKeyInArray!0 (select (arr!18347 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636765 () Bool)

(assert (=> b!636765 (= e!364305 call!33424)))

(declare-fun bm!33421 () Bool)

(declare-fun c!72741 () Bool)

(assert (=> bm!33421 (= call!33424 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72741 (Cons!12423 (select (arr!18347 a!2986) #b00000000000000000000000000000000) Nil!12424) Nil!12424)))))

(declare-fun b!636766 () Bool)

(assert (=> b!636766 (= e!364304 e!364305)))

(assert (=> b!636766 (= c!72741 (validKeyInArray!0 (select (arr!18347 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89861 (not res!412015)) b!636764))

(assert (= (and b!636764 res!412016) b!636763))

(assert (= (and b!636764 res!412014) b!636766))

(assert (= (and b!636766 c!72741) b!636765))

(assert (= (and b!636766 (not c!72741)) b!636762))

(assert (= (or b!636765 b!636762) bm!33421))

(declare-fun m!610425 () Bool)

(assert (=> b!636763 m!610425))

(assert (=> b!636763 m!610425))

(declare-fun m!610427 () Bool)

(assert (=> b!636763 m!610427))

(assert (=> b!636764 m!610425))

(assert (=> b!636764 m!610425))

(declare-fun m!610429 () Bool)

(assert (=> b!636764 m!610429))

(assert (=> bm!33421 m!610425))

(declare-fun m!610431 () Bool)

(assert (=> bm!33421 m!610431))

(assert (=> b!636766 m!610425))

(assert (=> b!636766 m!610425))

(assert (=> b!636766 m!610429))

(assert (=> b!636575 d!89861))

(declare-fun b!636775 () Bool)

(declare-fun e!364313 () Bool)

(declare-fun call!33427 () Bool)

(assert (=> b!636775 (= e!364313 call!33427)))

(declare-fun d!89863 () Bool)

(declare-fun res!412022 () Bool)

(declare-fun e!364314 () Bool)

(assert (=> d!89863 (=> res!412022 e!364314)))

(assert (=> d!89863 (= res!412022 (bvsge #b00000000000000000000000000000000 (size!18712 a!2986)))))

(assert (=> d!89863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!364314)))

(declare-fun bm!33424 () Bool)

(assert (=> bm!33424 (= call!33427 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!636776 () Bool)

(declare-fun e!364312 () Bool)

(assert (=> b!636776 (= e!364312 call!33427)))

(declare-fun b!636777 () Bool)

(assert (=> b!636777 (= e!364314 e!364312)))

(declare-fun c!72744 () Bool)

(assert (=> b!636777 (= c!72744 (validKeyInArray!0 (select (arr!18347 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636778 () Bool)

(assert (=> b!636778 (= e!364312 e!364313)))

(declare-fun lt!294307 () (_ BitVec 64))

(assert (=> b!636778 (= lt!294307 (select (arr!18347 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294306 () Unit!21464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38247 (_ BitVec 64) (_ BitVec 32)) Unit!21464)

(assert (=> b!636778 (= lt!294306 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294307 #b00000000000000000000000000000000))))

(assert (=> b!636778 (arrayContainsKey!0 a!2986 lt!294307 #b00000000000000000000000000000000)))

(declare-fun lt!294305 () Unit!21464)

(assert (=> b!636778 (= lt!294305 lt!294306)))

(declare-fun res!412021 () Bool)

(assert (=> b!636778 (= res!412021 (= (seekEntryOrOpen!0 (select (arr!18347 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6784 #b00000000000000000000000000000000)))))

(assert (=> b!636778 (=> (not res!412021) (not e!364313))))

(assert (= (and d!89863 (not res!412022)) b!636777))

(assert (= (and b!636777 c!72744) b!636778))

(assert (= (and b!636777 (not c!72744)) b!636776))

(assert (= (and b!636778 res!412021) b!636775))

(assert (= (or b!636775 b!636776) bm!33424))

(declare-fun m!610433 () Bool)

(assert (=> bm!33424 m!610433))

(assert (=> b!636777 m!610425))

(assert (=> b!636777 m!610425))

(assert (=> b!636777 m!610429))

(assert (=> b!636778 m!610425))

(declare-fun m!610435 () Bool)

(assert (=> b!636778 m!610435))

(declare-fun m!610437 () Bool)

(assert (=> b!636778 m!610437))

(assert (=> b!636778 m!610425))

(declare-fun m!610439 () Bool)

(assert (=> b!636778 m!610439))

(assert (=> b!636565 d!89863))

(declare-fun d!89865 () Bool)

(declare-fun res!412027 () Bool)

(declare-fun e!364319 () Bool)

(assert (=> d!89865 (=> res!412027 e!364319)))

(assert (=> d!89865 (= res!412027 ((_ is Nil!12424) Nil!12424))))

(assert (=> d!89865 (= (noDuplicate!386 Nil!12424) e!364319)))

(declare-fun b!636783 () Bool)

(declare-fun e!364320 () Bool)

(assert (=> b!636783 (= e!364319 e!364320)))

(declare-fun res!412028 () Bool)

(assert (=> b!636783 (=> (not res!412028) (not e!364320))))

(assert (=> b!636783 (= res!412028 (not (contains!3087 (t!18646 Nil!12424) (h!13468 Nil!12424))))))

(declare-fun b!636784 () Bool)

(assert (=> b!636784 (= e!364320 (noDuplicate!386 (t!18646 Nil!12424)))))

(assert (= (and d!89865 (not res!412027)) b!636783))

(assert (= (and b!636783 res!412028) b!636784))

(declare-fun m!610441 () Bool)

(assert (=> b!636783 m!610441))

(declare-fun m!610443 () Bool)

(assert (=> b!636784 m!610443))

(assert (=> b!636576 d!89865))

(declare-fun d!89869 () Bool)

(assert (=> d!89869 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57590 d!89869))

(declare-fun d!89877 () Bool)

(assert (=> d!89877 (= (array_inv!14230 a!2986) (bvsge (size!18712 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57590 d!89877))

(declare-fun d!89879 () Bool)

(declare-fun e!364355 () Bool)

(assert (=> d!89879 e!364355))

(declare-fun res!412051 () Bool)

(assert (=> d!89879 (=> (not res!412051) (not e!364355))))

(assert (=> d!89879 (= res!412051 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18712 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18712 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18712 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18712 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18712 a!2986))))))

(declare-fun lt!294325 () Unit!21464)

(declare-fun choose!9 (array!38247 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21464)

(assert (=> d!89879 (= lt!294325 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294221 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89879 (validMask!0 mask!3053)))

(assert (=> d!89879 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294221 vacantSpotIndex!68 mask!3053) lt!294325)))

(declare-fun b!636831 () Bool)

(assert (=> b!636831 (= e!364355 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294221 vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294221 vacantSpotIndex!68 (select (store (arr!18347 a!2986) i!1108 k0!1786) j!136) (array!38248 (store (arr!18347 a!2986) i!1108 k0!1786) (size!18712 a!2986)) mask!3053)))))

(assert (= (and d!89879 res!412051) b!636831))

(declare-fun m!610475 () Bool)

(assert (=> d!89879 m!610475))

(assert (=> d!89879 m!610261))

(assert (=> b!636831 m!610235))

(assert (=> b!636831 m!610227))

(assert (=> b!636831 m!610239))

(assert (=> b!636831 m!610229))

(assert (=> b!636831 m!610227))

(assert (=> b!636831 m!610235))

(declare-fun m!610477 () Bool)

(assert (=> b!636831 m!610477))

(assert (=> b!636562 d!89879))

(declare-fun b!636832 () Bool)

(declare-fun e!364356 () SeekEntryResult!6784)

(assert (=> b!636832 (= e!364356 Undefined!6784)))

(declare-fun b!636833 () Bool)

(declare-fun e!364358 () SeekEntryResult!6784)

(assert (=> b!636833 (= e!364358 (MissingVacant!6784 vacantSpotIndex!68))))

(declare-fun b!636834 () Bool)

(declare-fun e!364357 () SeekEntryResult!6784)

(assert (=> b!636834 (= e!364357 (Found!6784 lt!294221))))

(declare-fun b!636836 () Bool)

(assert (=> b!636836 (= e!364358 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294221 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636837 () Bool)

(declare-fun c!72757 () Bool)

(declare-fun lt!294326 () (_ BitVec 64))

(assert (=> b!636837 (= c!72757 (= lt!294326 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636837 (= e!364357 e!364358)))

(declare-fun b!636835 () Bool)

(assert (=> b!636835 (= e!364356 e!364357)))

(declare-fun c!72758 () Bool)

(assert (=> b!636835 (= c!72758 (= lt!294326 (select (arr!18347 a!2986) j!136)))))

(declare-fun d!89893 () Bool)

(declare-fun lt!294327 () SeekEntryResult!6784)

(assert (=> d!89893 (and (or ((_ is Undefined!6784) lt!294327) (not ((_ is Found!6784) lt!294327)) (and (bvsge (index!29448 lt!294327) #b00000000000000000000000000000000) (bvslt (index!29448 lt!294327) (size!18712 a!2986)))) (or ((_ is Undefined!6784) lt!294327) ((_ is Found!6784) lt!294327) (not ((_ is MissingVacant!6784) lt!294327)) (not (= (index!29450 lt!294327) vacantSpotIndex!68)) (and (bvsge (index!29450 lt!294327) #b00000000000000000000000000000000) (bvslt (index!29450 lt!294327) (size!18712 a!2986)))) (or ((_ is Undefined!6784) lt!294327) (ite ((_ is Found!6784) lt!294327) (= (select (arr!18347 a!2986) (index!29448 lt!294327)) (select (arr!18347 a!2986) j!136)) (and ((_ is MissingVacant!6784) lt!294327) (= (index!29450 lt!294327) vacantSpotIndex!68) (= (select (arr!18347 a!2986) (index!29450 lt!294327)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89893 (= lt!294327 e!364356)))

(declare-fun c!72759 () Bool)

(assert (=> d!89893 (= c!72759 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89893 (= lt!294326 (select (arr!18347 a!2986) lt!294221))))

(assert (=> d!89893 (validMask!0 mask!3053)))

(assert (=> d!89893 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294221 vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053) lt!294327)))

(assert (= (and d!89893 c!72759) b!636832))

(assert (= (and d!89893 (not c!72759)) b!636835))

(assert (= (and b!636835 c!72758) b!636834))

(assert (= (and b!636835 (not c!72758)) b!636837))

(assert (= (and b!636837 c!72757) b!636833))

(assert (= (and b!636837 (not c!72757)) b!636836))

(declare-fun m!610479 () Bool)

(assert (=> b!636836 m!610479))

(assert (=> b!636836 m!610479))

(assert (=> b!636836 m!610227))

(declare-fun m!610481 () Bool)

(assert (=> b!636836 m!610481))

(declare-fun m!610483 () Bool)

(assert (=> d!89893 m!610483))

(declare-fun m!610485 () Bool)

(assert (=> d!89893 m!610485))

(declare-fun m!610487 () Bool)

(assert (=> d!89893 m!610487))

(assert (=> d!89893 m!610261))

(assert (=> b!636562 d!89893))

(declare-fun b!636842 () Bool)

(declare-fun e!364363 () SeekEntryResult!6784)

(assert (=> b!636842 (= e!364363 Undefined!6784)))

(declare-fun b!636843 () Bool)

(declare-fun e!364365 () SeekEntryResult!6784)

(assert (=> b!636843 (= e!364365 (MissingVacant!6784 vacantSpotIndex!68))))

(declare-fun b!636844 () Bool)

(declare-fun e!364364 () SeekEntryResult!6784)

(assert (=> b!636844 (= e!364364 (Found!6784 index!984))))

(declare-fun b!636846 () Bool)

(assert (=> b!636846 (= e!364365 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!294222 lt!294214 mask!3053))))

(declare-fun b!636847 () Bool)

(declare-fun c!72760 () Bool)

(declare-fun lt!294330 () (_ BitVec 64))

(assert (=> b!636847 (= c!72760 (= lt!294330 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636847 (= e!364364 e!364365)))

(declare-fun b!636845 () Bool)

(assert (=> b!636845 (= e!364363 e!364364)))

(declare-fun c!72761 () Bool)

(assert (=> b!636845 (= c!72761 (= lt!294330 lt!294222))))

(declare-fun lt!294331 () SeekEntryResult!6784)

(declare-fun d!89895 () Bool)

(assert (=> d!89895 (and (or ((_ is Undefined!6784) lt!294331) (not ((_ is Found!6784) lt!294331)) (and (bvsge (index!29448 lt!294331) #b00000000000000000000000000000000) (bvslt (index!29448 lt!294331) (size!18712 lt!294214)))) (or ((_ is Undefined!6784) lt!294331) ((_ is Found!6784) lt!294331) (not ((_ is MissingVacant!6784) lt!294331)) (not (= (index!29450 lt!294331) vacantSpotIndex!68)) (and (bvsge (index!29450 lt!294331) #b00000000000000000000000000000000) (bvslt (index!29450 lt!294331) (size!18712 lt!294214)))) (or ((_ is Undefined!6784) lt!294331) (ite ((_ is Found!6784) lt!294331) (= (select (arr!18347 lt!294214) (index!29448 lt!294331)) lt!294222) (and ((_ is MissingVacant!6784) lt!294331) (= (index!29450 lt!294331) vacantSpotIndex!68) (= (select (arr!18347 lt!294214) (index!29450 lt!294331)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89895 (= lt!294331 e!364363)))

(declare-fun c!72762 () Bool)

(assert (=> d!89895 (= c!72762 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89895 (= lt!294330 (select (arr!18347 lt!294214) index!984))))

(assert (=> d!89895 (validMask!0 mask!3053)))

(assert (=> d!89895 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294222 lt!294214 mask!3053) lt!294331)))

(assert (= (and d!89895 c!72762) b!636842))

(assert (= (and d!89895 (not c!72762)) b!636845))

(assert (= (and b!636845 c!72761) b!636844))

(assert (= (and b!636845 (not c!72761)) b!636847))

(assert (= (and b!636847 c!72760) b!636843))

(assert (= (and b!636847 (not c!72760)) b!636846))

(assert (=> b!636846 m!610233))

(assert (=> b!636846 m!610233))

(declare-fun m!610489 () Bool)

(assert (=> b!636846 m!610489))

(declare-fun m!610491 () Bool)

(assert (=> d!89895 m!610491))

(declare-fun m!610493 () Bool)

(assert (=> d!89895 m!610493))

(assert (=> d!89895 m!610411))

(assert (=> d!89895 m!610261))

(assert (=> b!636562 d!89895))

(declare-fun d!89897 () Bool)

(declare-fun lt!294338 () (_ BitVec 32))

(assert (=> d!89897 (and (bvsge lt!294338 #b00000000000000000000000000000000) (bvslt lt!294338 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89897 (= lt!294338 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89897 (validMask!0 mask!3053)))

(assert (=> d!89897 (= (nextIndex!0 index!984 x!910 mask!3053) lt!294338)))

(declare-fun bs!19092 () Bool)

(assert (= bs!19092 d!89897))

(declare-fun m!610513 () Bool)

(assert (=> bs!19092 m!610513))

(assert (=> bs!19092 m!610261))

(assert (=> b!636562 d!89897))

(declare-fun b!636858 () Bool)

(declare-fun e!364376 () SeekEntryResult!6784)

(assert (=> b!636858 (= e!364376 Undefined!6784)))

(declare-fun b!636859 () Bool)

(declare-fun e!364378 () SeekEntryResult!6784)

(assert (=> b!636859 (= e!364378 (MissingVacant!6784 vacantSpotIndex!68))))

(declare-fun b!636860 () Bool)

(declare-fun e!364377 () SeekEntryResult!6784)

(assert (=> b!636860 (= e!364377 (Found!6784 lt!294221))))

(declare-fun b!636862 () Bool)

(assert (=> b!636862 (= e!364378 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294221 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!294222 lt!294214 mask!3053))))

(declare-fun b!636863 () Bool)

(declare-fun c!72763 () Bool)

(declare-fun lt!294339 () (_ BitVec 64))

(assert (=> b!636863 (= c!72763 (= lt!294339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636863 (= e!364377 e!364378)))

(declare-fun b!636861 () Bool)

(assert (=> b!636861 (= e!364376 e!364377)))

(declare-fun c!72764 () Bool)

(assert (=> b!636861 (= c!72764 (= lt!294339 lt!294222))))

(declare-fun d!89907 () Bool)

(declare-fun lt!294340 () SeekEntryResult!6784)

(assert (=> d!89907 (and (or ((_ is Undefined!6784) lt!294340) (not ((_ is Found!6784) lt!294340)) (and (bvsge (index!29448 lt!294340) #b00000000000000000000000000000000) (bvslt (index!29448 lt!294340) (size!18712 lt!294214)))) (or ((_ is Undefined!6784) lt!294340) ((_ is Found!6784) lt!294340) (not ((_ is MissingVacant!6784) lt!294340)) (not (= (index!29450 lt!294340) vacantSpotIndex!68)) (and (bvsge (index!29450 lt!294340) #b00000000000000000000000000000000) (bvslt (index!29450 lt!294340) (size!18712 lt!294214)))) (or ((_ is Undefined!6784) lt!294340) (ite ((_ is Found!6784) lt!294340) (= (select (arr!18347 lt!294214) (index!29448 lt!294340)) lt!294222) (and ((_ is MissingVacant!6784) lt!294340) (= (index!29450 lt!294340) vacantSpotIndex!68) (= (select (arr!18347 lt!294214) (index!29450 lt!294340)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89907 (= lt!294340 e!364376)))

(declare-fun c!72765 () Bool)

(assert (=> d!89907 (= c!72765 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89907 (= lt!294339 (select (arr!18347 lt!294214) lt!294221))))

(assert (=> d!89907 (validMask!0 mask!3053)))

(assert (=> d!89907 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294221 vacantSpotIndex!68 lt!294222 lt!294214 mask!3053) lt!294340)))

(assert (= (and d!89907 c!72765) b!636858))

(assert (= (and d!89907 (not c!72765)) b!636861))

(assert (= (and b!636861 c!72764) b!636860))

(assert (= (and b!636861 (not c!72764)) b!636863))

(assert (= (and b!636863 c!72763) b!636859))

(assert (= (and b!636863 (not c!72763)) b!636862))

(assert (=> b!636862 m!610479))

(assert (=> b!636862 m!610479))

(declare-fun m!610515 () Bool)

(assert (=> b!636862 m!610515))

(declare-fun m!610517 () Bool)

(assert (=> d!89907 m!610517))

(declare-fun m!610519 () Bool)

(assert (=> d!89907 m!610519))

(declare-fun m!610521 () Bool)

(assert (=> d!89907 m!610521))

(assert (=> d!89907 m!610261))

(assert (=> b!636562 d!89907))

(declare-fun d!89909 () Bool)

(assert (=> d!89909 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636573 d!89909))

(declare-fun d!89913 () Bool)

(assert (=> d!89913 (= (validKeyInArray!0 (select (arr!18347 a!2986) j!136)) (and (not (= (select (arr!18347 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18347 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636561 d!89913))

(declare-fun d!89915 () Bool)

(declare-fun lt!294345 () Bool)

(assert (=> d!89915 (= lt!294345 (select (content!242 Nil!12424) k0!1786))))

(declare-fun e!364380 () Bool)

(assert (=> d!89915 (= lt!294345 e!364380)))

(declare-fun res!412068 () Bool)

(assert (=> d!89915 (=> (not res!412068) (not e!364380))))

(assert (=> d!89915 (= res!412068 ((_ is Cons!12423) Nil!12424))))

(assert (=> d!89915 (= (contains!3087 Nil!12424 k0!1786) lt!294345)))

(declare-fun b!636865 () Bool)

(declare-fun e!364381 () Bool)

(assert (=> b!636865 (= e!364380 e!364381)))

(declare-fun res!412067 () Bool)

(assert (=> b!636865 (=> res!412067 e!364381)))

(assert (=> b!636865 (= res!412067 (= (h!13468 Nil!12424) k0!1786))))

(declare-fun b!636866 () Bool)

(assert (=> b!636866 (= e!364381 (contains!3087 (t!18646 Nil!12424) k0!1786))))

(assert (= (and d!89915 res!412068) b!636865))

(assert (= (and b!636865 (not res!412067)) b!636866))

(assert (=> d!89915 m!610415))

(declare-fun m!610529 () Bool)

(assert (=> d!89915 m!610529))

(declare-fun m!610531 () Bool)

(assert (=> b!636866 m!610531))

(assert (=> b!636570 d!89915))

(declare-fun d!89919 () Bool)

(declare-fun res!412069 () Bool)

(declare-fun e!364385 () Bool)

(assert (=> d!89919 (=> res!412069 e!364385)))

(assert (=> d!89919 (= res!412069 (= (select (arr!18347 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89919 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!364385)))

(declare-fun b!636873 () Bool)

(declare-fun e!364386 () Bool)

(assert (=> b!636873 (= e!364385 e!364386)))

(declare-fun res!412070 () Bool)

(assert (=> b!636873 (=> (not res!412070) (not e!364386))))

(assert (=> b!636873 (= res!412070 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18712 a!2986)))))

(declare-fun b!636874 () Bool)

(assert (=> b!636874 (= e!364386 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89919 (not res!412069)) b!636873))

(assert (= (and b!636873 res!412070) b!636874))

(assert (=> d!89919 m!610425))

(declare-fun m!610533 () Bool)

(assert (=> b!636874 m!610533))

(assert (=> b!636560 d!89919))

(declare-fun b!636928 () Bool)

(declare-fun e!364426 () SeekEntryResult!6784)

(declare-fun lt!294373 () SeekEntryResult!6784)

(assert (=> b!636928 (= e!364426 (Found!6784 (index!29449 lt!294373)))))

(declare-fun b!636929 () Bool)

(declare-fun c!72784 () Bool)

(declare-fun lt!294372 () (_ BitVec 64))

(assert (=> b!636929 (= c!72784 (= lt!294372 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364427 () SeekEntryResult!6784)

(assert (=> b!636929 (= e!364426 e!364427)))

(declare-fun b!636930 () Bool)

(assert (=> b!636930 (= e!364427 (MissingZero!6784 (index!29449 lt!294373)))))

(declare-fun b!636931 () Bool)

(assert (=> b!636931 (= e!364427 (seekKeyOrZeroReturnVacant!0 (x!58212 lt!294373) (index!29449 lt!294373) (index!29449 lt!294373) k0!1786 a!2986 mask!3053))))

(declare-fun b!636932 () Bool)

(declare-fun e!364425 () SeekEntryResult!6784)

(assert (=> b!636932 (= e!364425 Undefined!6784)))

(declare-fun d!89921 () Bool)

(declare-fun lt!294374 () SeekEntryResult!6784)

(assert (=> d!89921 (and (or ((_ is Undefined!6784) lt!294374) (not ((_ is Found!6784) lt!294374)) (and (bvsge (index!29448 lt!294374) #b00000000000000000000000000000000) (bvslt (index!29448 lt!294374) (size!18712 a!2986)))) (or ((_ is Undefined!6784) lt!294374) ((_ is Found!6784) lt!294374) (not ((_ is MissingZero!6784) lt!294374)) (and (bvsge (index!29447 lt!294374) #b00000000000000000000000000000000) (bvslt (index!29447 lt!294374) (size!18712 a!2986)))) (or ((_ is Undefined!6784) lt!294374) ((_ is Found!6784) lt!294374) ((_ is MissingZero!6784) lt!294374) (not ((_ is MissingVacant!6784) lt!294374)) (and (bvsge (index!29450 lt!294374) #b00000000000000000000000000000000) (bvslt (index!29450 lt!294374) (size!18712 a!2986)))) (or ((_ is Undefined!6784) lt!294374) (ite ((_ is Found!6784) lt!294374) (= (select (arr!18347 a!2986) (index!29448 lt!294374)) k0!1786) (ite ((_ is MissingZero!6784) lt!294374) (= (select (arr!18347 a!2986) (index!29447 lt!294374)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6784) lt!294374) (= (select (arr!18347 a!2986) (index!29450 lt!294374)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89921 (= lt!294374 e!364425)))

(declare-fun c!72785 () Bool)

(assert (=> d!89921 (= c!72785 (and ((_ is Intermediate!6784) lt!294373) (undefined!7596 lt!294373)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38247 (_ BitVec 32)) SeekEntryResult!6784)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89921 (= lt!294373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89921 (validMask!0 mask!3053)))

(assert (=> d!89921 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!294374)))

(declare-fun b!636933 () Bool)

(assert (=> b!636933 (= e!364425 e!364426)))

(assert (=> b!636933 (= lt!294372 (select (arr!18347 a!2986) (index!29449 lt!294373)))))

(declare-fun c!72786 () Bool)

(assert (=> b!636933 (= c!72786 (= lt!294372 k0!1786))))

(assert (= (and d!89921 c!72785) b!636932))

(assert (= (and d!89921 (not c!72785)) b!636933))

(assert (= (and b!636933 c!72786) b!636928))

(assert (= (and b!636933 (not c!72786)) b!636929))

(assert (= (and b!636929 c!72784) b!636930))

(assert (= (and b!636929 (not c!72784)) b!636931))

(declare-fun m!610581 () Bool)

(assert (=> b!636931 m!610581))

(assert (=> d!89921 m!610261))

(declare-fun m!610583 () Bool)

(assert (=> d!89921 m!610583))

(declare-fun m!610585 () Bool)

(assert (=> d!89921 m!610585))

(assert (=> d!89921 m!610585))

(declare-fun m!610587 () Bool)

(assert (=> d!89921 m!610587))

(declare-fun m!610589 () Bool)

(assert (=> d!89921 m!610589))

(declare-fun m!610591 () Bool)

(assert (=> d!89921 m!610591))

(declare-fun m!610593 () Bool)

(assert (=> b!636933 m!610593))

(assert (=> b!636558 d!89921))

(declare-fun d!89943 () Bool)

(declare-fun res!412094 () Bool)

(declare-fun e!364428 () Bool)

(assert (=> d!89943 (=> res!412094 e!364428)))

(assert (=> d!89943 (= res!412094 (= (select (arr!18347 lt!294214) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18347 a!2986) j!136)))))

(assert (=> d!89943 (= (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364428)))

(declare-fun b!636934 () Bool)

(declare-fun e!364429 () Bool)

(assert (=> b!636934 (= e!364428 e!364429)))

(declare-fun res!412095 () Bool)

(assert (=> b!636934 (=> (not res!412095) (not e!364429))))

(assert (=> b!636934 (= res!412095 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18712 lt!294214)))))

(declare-fun b!636935 () Bool)

(assert (=> b!636935 (= e!364429 (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89943 (not res!412094)) b!636934))

(assert (= (and b!636934 res!412095) b!636935))

(declare-fun m!610595 () Bool)

(assert (=> d!89943 m!610595))

(assert (=> b!636935 m!610227))

(declare-fun m!610597 () Bool)

(assert (=> b!636935 m!610597))

(assert (=> b!636569 d!89943))

(declare-fun d!89945 () Bool)

(assert (=> d!89945 (arrayContainsKey!0 lt!294214 (select (arr!18347 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294377 () Unit!21464)

(declare-fun choose!114 (array!38247 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21464)

(assert (=> d!89945 (= lt!294377 (choose!114 lt!294214 (select (arr!18347 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89945 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89945 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294214 (select (arr!18347 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294377)))

(declare-fun bs!19096 () Bool)

(assert (= bs!19096 d!89945))

(assert (=> bs!19096 m!610227))

(assert (=> bs!19096 m!610267))

(assert (=> bs!19096 m!610227))

(declare-fun m!610599 () Bool)

(assert (=> bs!19096 m!610599))

(assert (=> b!636569 d!89945))

(check-sat (not b!636723) (not b!636777) (not b!636874) (not b!636784) (not d!89879) (not b!636749) (not b!636751) (not b!636778) (not b!636862) (not b!636764) (not b!636783) (not b!636846) (not b!636831) (not d!89915) (not d!89893) (not b!636931) (not bm!33424) (not d!89945) (not d!89859) (not b!636935) (not b!636836) (not b!636766) (not d!89853) (not b!636740) (not d!89921) (not b!636763) (not b!636866) (not b!636743) (not d!89857) (not d!89907) (not d!89895) (not d!89897) (not bm!33421))
(check-sat)
