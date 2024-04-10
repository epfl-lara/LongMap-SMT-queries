; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120216 () Bool)

(assert start!120216)

(declare-fun b!1399341 () Bool)

(declare-fun res!938089 () Bool)

(declare-fun e!792217 () Bool)

(assert (=> b!1399341 (=> (not res!938089) (not e!792217))))

(declare-datatypes ((array!95688 0))(
  ( (array!95689 (arr!46196 (Array (_ BitVec 32) (_ BitVec 64))) (size!46746 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95688)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399341 (= res!938089 (validKeyInArray!0 (select (arr!46196 a!2901) i!1037)))))

(declare-fun b!1399342 () Bool)

(declare-fun res!938090 () Bool)

(assert (=> b!1399342 (=> (not res!938090) (not e!792217))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95688 (_ BitVec 32)) Bool)

(assert (=> b!1399342 (= res!938090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399343 () Bool)

(declare-fun res!938097 () Bool)

(assert (=> b!1399343 (=> (not res!938097) (not e!792217))))

(declare-datatypes ((List!32715 0))(
  ( (Nil!32712) (Cons!32711 (h!33956 (_ BitVec 64)) (t!47409 List!32715)) )
))
(declare-fun arrayNoDuplicates!0 (array!95688 (_ BitVec 32) List!32715) Bool)

(assert (=> b!1399343 (= res!938097 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32712))))

(declare-fun b!1399344 () Bool)

(declare-fun e!792215 () Bool)

(assert (=> b!1399344 (= e!792217 (not e!792215))))

(declare-fun res!938092 () Bool)

(assert (=> b!1399344 (=> res!938092 e!792215)))

(declare-datatypes ((SeekEntryResult!10513 0))(
  ( (MissingZero!10513 (index!44426 (_ BitVec 32))) (Found!10513 (index!44427 (_ BitVec 32))) (Intermediate!10513 (undefined!11325 Bool) (index!44428 (_ BitVec 32)) (x!126072 (_ BitVec 32))) (Undefined!10513) (MissingVacant!10513 (index!44429 (_ BitVec 32))) )
))
(declare-fun lt!615494 () SeekEntryResult!10513)

(assert (=> b!1399344 (= res!938092 (or (not (is-Intermediate!10513 lt!615494)) (undefined!11325 lt!615494)))))

(declare-fun e!792218 () Bool)

(assert (=> b!1399344 e!792218))

(declare-fun res!938091 () Bool)

(assert (=> b!1399344 (=> (not res!938091) (not e!792218))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399344 (= res!938091 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47030 0))(
  ( (Unit!47031) )
))
(declare-fun lt!615491 () Unit!47030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47030)

(assert (=> b!1399344 (= lt!615491 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615495 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95688 (_ BitVec 32)) SeekEntryResult!10513)

(assert (=> b!1399344 (= lt!615494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615495 (select (arr!46196 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399344 (= lt!615495 (toIndex!0 (select (arr!46196 a!2901) j!112) mask!2840))))

(declare-fun b!1399346 () Bool)

(declare-fun res!938096 () Bool)

(assert (=> b!1399346 (=> (not res!938096) (not e!792217))))

(assert (=> b!1399346 (= res!938096 (and (= (size!46746 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46746 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46746 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399347 () Bool)

(declare-fun e!792213 () Bool)

(assert (=> b!1399347 (= e!792213 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun e!792214 () Bool)

(assert (=> b!1399347 e!792214))

(declare-fun res!938098 () Bool)

(assert (=> b!1399347 (=> (not res!938098) (not e!792214))))

(declare-fun lt!615490 () SeekEntryResult!10513)

(assert (=> b!1399347 (= res!938098 (and (not (undefined!11325 lt!615490)) (= (index!44428 lt!615490) i!1037) (bvslt (x!126072 lt!615490) (x!126072 lt!615494)) (= (select (store (arr!46196 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44428 lt!615490)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615493 () Unit!47030)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47030)

(assert (=> b!1399347 (= lt!615493 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615495 (x!126072 lt!615494) (index!44428 lt!615494) (x!126072 lt!615490) (index!44428 lt!615490) (undefined!11325 lt!615490) mask!2840))))

(declare-fun lt!615489 () array!95688)

(declare-fun lt!615492 () (_ BitVec 64))

(declare-fun b!1399348 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95688 (_ BitVec 32)) SeekEntryResult!10513)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95688 (_ BitVec 32)) SeekEntryResult!10513)

(assert (=> b!1399348 (= e!792214 (= (seekEntryOrOpen!0 lt!615492 lt!615489 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126072 lt!615490) (index!44428 lt!615490) (index!44428 lt!615490) (select (arr!46196 a!2901) j!112) lt!615489 mask!2840)))))

(declare-fun b!1399349 () Bool)

(declare-fun res!938093 () Bool)

(assert (=> b!1399349 (=> (not res!938093) (not e!792217))))

(assert (=> b!1399349 (= res!938093 (validKeyInArray!0 (select (arr!46196 a!2901) j!112)))))

(declare-fun b!1399350 () Bool)

(assert (=> b!1399350 (= e!792218 (= (seekEntryOrOpen!0 (select (arr!46196 a!2901) j!112) a!2901 mask!2840) (Found!10513 j!112)))))

(declare-fun res!938094 () Bool)

(assert (=> start!120216 (=> (not res!938094) (not e!792217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120216 (= res!938094 (validMask!0 mask!2840))))

(assert (=> start!120216 e!792217))

(assert (=> start!120216 true))

(declare-fun array_inv!35224 (array!95688) Bool)

(assert (=> start!120216 (array_inv!35224 a!2901)))

(declare-fun b!1399345 () Bool)

(assert (=> b!1399345 (= e!792215 e!792213)))

(declare-fun res!938095 () Bool)

(assert (=> b!1399345 (=> res!938095 e!792213)))

(assert (=> b!1399345 (= res!938095 (or (= lt!615494 lt!615490) (not (is-Intermediate!10513 lt!615490))))))

(assert (=> b!1399345 (= lt!615490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615492 mask!2840) lt!615492 lt!615489 mask!2840))))

(assert (=> b!1399345 (= lt!615492 (select (store (arr!46196 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399345 (= lt!615489 (array!95689 (store (arr!46196 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46746 a!2901)))))

(assert (= (and start!120216 res!938094) b!1399346))

(assert (= (and b!1399346 res!938096) b!1399341))

(assert (= (and b!1399341 res!938089) b!1399349))

(assert (= (and b!1399349 res!938093) b!1399342))

(assert (= (and b!1399342 res!938090) b!1399343))

(assert (= (and b!1399343 res!938097) b!1399344))

(assert (= (and b!1399344 res!938091) b!1399350))

(assert (= (and b!1399344 (not res!938092)) b!1399345))

(assert (= (and b!1399345 (not res!938095)) b!1399347))

(assert (= (and b!1399347 res!938098) b!1399348))

(declare-fun m!1286637 () Bool)

(assert (=> b!1399343 m!1286637))

(declare-fun m!1286639 () Bool)

(assert (=> b!1399348 m!1286639))

(declare-fun m!1286641 () Bool)

(assert (=> b!1399348 m!1286641))

(assert (=> b!1399348 m!1286641))

(declare-fun m!1286643 () Bool)

(assert (=> b!1399348 m!1286643))

(declare-fun m!1286645 () Bool)

(assert (=> b!1399347 m!1286645))

(declare-fun m!1286647 () Bool)

(assert (=> b!1399347 m!1286647))

(declare-fun m!1286649 () Bool)

(assert (=> b!1399347 m!1286649))

(declare-fun m!1286651 () Bool)

(assert (=> start!120216 m!1286651))

(declare-fun m!1286653 () Bool)

(assert (=> start!120216 m!1286653))

(declare-fun m!1286655 () Bool)

(assert (=> b!1399342 m!1286655))

(assert (=> b!1399344 m!1286641))

(declare-fun m!1286657 () Bool)

(assert (=> b!1399344 m!1286657))

(assert (=> b!1399344 m!1286641))

(declare-fun m!1286659 () Bool)

(assert (=> b!1399344 m!1286659))

(assert (=> b!1399344 m!1286641))

(declare-fun m!1286661 () Bool)

(assert (=> b!1399344 m!1286661))

(declare-fun m!1286663 () Bool)

(assert (=> b!1399344 m!1286663))

(declare-fun m!1286665 () Bool)

(assert (=> b!1399345 m!1286665))

(assert (=> b!1399345 m!1286665))

(declare-fun m!1286667 () Bool)

(assert (=> b!1399345 m!1286667))

(assert (=> b!1399345 m!1286645))

(declare-fun m!1286669 () Bool)

(assert (=> b!1399345 m!1286669))

(assert (=> b!1399350 m!1286641))

(assert (=> b!1399350 m!1286641))

(declare-fun m!1286671 () Bool)

(assert (=> b!1399350 m!1286671))

(declare-fun m!1286673 () Bool)

(assert (=> b!1399341 m!1286673))

(assert (=> b!1399341 m!1286673))

(declare-fun m!1286675 () Bool)

(assert (=> b!1399341 m!1286675))

(assert (=> b!1399349 m!1286641))

(assert (=> b!1399349 m!1286641))

(declare-fun m!1286677 () Bool)

(assert (=> b!1399349 m!1286677))

(push 1)

(assert (not b!1399345))

(assert (not b!1399349))

(assert (not start!120216))

(assert (not b!1399350))

(assert (not b!1399343))

(assert (not b!1399342))

(assert (not b!1399341))

(assert (not b!1399344))

(assert (not b!1399348))

(assert (not b!1399347))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1399441 () Bool)

(declare-fun e!792278 () Bool)

(declare-fun lt!615555 () SeekEntryResult!10513)

(assert (=> b!1399441 (= e!792278 (bvsge (x!126072 lt!615555) #b01111111111111111111111111111110))))

(declare-fun b!1399442 () Bool)

(assert (=> b!1399442 (and (bvsge (index!44428 lt!615555) #b00000000000000000000000000000000) (bvslt (index!44428 lt!615555) (size!46746 lt!615489)))))

(declare-fun e!792277 () Bool)

(assert (=> b!1399442 (= e!792277 (= (select (arr!46196 lt!615489) (index!44428 lt!615555)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1399443 () Bool)

(assert (=> b!1399443 (and (bvsge (index!44428 lt!615555) #b00000000000000000000000000000000) (bvslt (index!44428 lt!615555) (size!46746 lt!615489)))))

(declare-fun res!938173 () Bool)

(assert (=> b!1399443 (= res!938173 (= (select (arr!46196 lt!615489) (index!44428 lt!615555)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399443 (=> res!938173 e!792277)))

(declare-fun e!792275 () SeekEntryResult!10513)

(declare-fun b!1399444 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399444 (= e!792275 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!615492 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!615492 lt!615489 mask!2840))))

(declare-fun b!1399446 () Bool)

(assert (=> b!1399446 (= e!792275 (Intermediate!10513 false (toIndex!0 lt!615492 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1399447 () Bool)

(declare-fun e!792274 () SeekEntryResult!10513)

(assert (=> b!1399447 (= e!792274 e!792275)))

(declare-fun c!130095 () Bool)

(declare-fun lt!615554 () (_ BitVec 64))

(assert (=> b!1399447 (= c!130095 (or (= lt!615554 lt!615492) (= (bvadd lt!615554 lt!615554) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1399448 () Bool)

(assert (=> b!1399448 (and (bvsge (index!44428 lt!615555) #b00000000000000000000000000000000) (bvslt (index!44428 lt!615555) (size!46746 lt!615489)))))

(declare-fun res!938172 () Bool)

(assert (=> b!1399448 (= res!938172 (= (select (arr!46196 lt!615489) (index!44428 lt!615555)) lt!615492))))

(assert (=> b!1399448 (=> res!938172 e!792277)))

(declare-fun e!792276 () Bool)

(assert (=> b!1399448 (= e!792276 e!792277)))

(declare-fun b!1399449 () Bool)

(assert (=> b!1399449 (= e!792274 (Intermediate!10513 true (toIndex!0 lt!615492 mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151039 () Bool)

(assert (=> d!151039 e!792278))

(declare-fun c!130093 () Bool)

(assert (=> d!151039 (= c!130093 (and (is-Intermediate!10513 lt!615555) (undefined!11325 lt!615555)))))

(assert (=> d!151039 (= lt!615555 e!792274)))

(declare-fun c!130094 () Bool)

(assert (=> d!151039 (= c!130094 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151039 (= lt!615554 (select (arr!46196 lt!615489) (toIndex!0 lt!615492 mask!2840)))))

(assert (=> d!151039 (validMask!0 mask!2840)))

(assert (=> d!151039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615492 mask!2840) lt!615492 lt!615489 mask!2840) lt!615555)))

(declare-fun b!1399445 () Bool)

(assert (=> b!1399445 (= e!792278 e!792276)))

(declare-fun res!938171 () Bool)

(assert (=> b!1399445 (= res!938171 (and (is-Intermediate!10513 lt!615555) (not (undefined!11325 lt!615555)) (bvslt (x!126072 lt!615555) #b01111111111111111111111111111110) (bvsge (x!126072 lt!615555) #b00000000000000000000000000000000) (bvsge (x!126072 lt!615555) #b00000000000000000000000000000000)))))

(assert (=> b!1399445 (=> (not res!938171) (not e!792276))))

(assert (= (and d!151039 c!130094) b!1399449))

(assert (= (and d!151039 (not c!130094)) b!1399447))

(assert (= (and b!1399447 c!130095) b!1399446))

(assert (= (and b!1399447 (not c!130095)) b!1399444))

(assert (= (and d!151039 c!130093) b!1399441))

(assert (= (and d!151039 (not c!130093)) b!1399445))

(assert (= (and b!1399445 res!938171) b!1399448))

(assert (= (and b!1399448 (not res!938172)) b!1399443))

(assert (= (and b!1399443 (not res!938173)) b!1399442))

(declare-fun m!1286771 () Bool)

(assert (=> b!1399448 m!1286771))

(assert (=> b!1399442 m!1286771))

(assert (=> b!1399443 m!1286771))

(assert (=> b!1399444 m!1286665))

(declare-fun m!1286773 () Bool)

(assert (=> b!1399444 m!1286773))

(assert (=> b!1399444 m!1286773))

(declare-fun m!1286775 () Bool)

(assert (=> b!1399444 m!1286775))

(assert (=> d!151039 m!1286665))

(declare-fun m!1286777 () Bool)

(assert (=> d!151039 m!1286777))

(assert (=> d!151039 m!1286651))

(assert (=> b!1399345 d!151039))

(declare-fun d!151045 () Bool)

(declare-fun lt!615561 () (_ BitVec 32))

(declare-fun lt!615560 () (_ BitVec 32))

(assert (=> d!151045 (= lt!615561 (bvmul (bvxor lt!615560 (bvlshr lt!615560 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151045 (= lt!615560 ((_ extract 31 0) (bvand (bvxor lt!615492 (bvlshr lt!615492 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151045 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!938174 (let ((h!33959 ((_ extract 31 0) (bvand (bvxor lt!615492 (bvlshr lt!615492 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126076 (bvmul (bvxor h!33959 (bvlshr h!33959 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126076 (bvlshr x!126076 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!938174 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!938174 #b00000000000000000000000000000000))))))

(assert (=> d!151045 (= (toIndex!0 lt!615492 mask!2840) (bvand (bvxor lt!615561 (bvlshr lt!615561 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1399345 d!151045))

(declare-fun b!1399502 () Bool)

(declare-fun e!792309 () SeekEntryResult!10513)

(declare-fun e!792308 () SeekEntryResult!10513)

(assert (=> b!1399502 (= e!792309 e!792308)))

(declare-fun lt!615588 () (_ BitVec 64))

(declare-fun lt!615587 () SeekEntryResult!10513)

(assert (=> b!1399502 (= lt!615588 (select (arr!46196 a!2901) (index!44428 lt!615587)))))

(declare-fun c!130117 () Bool)

(assert (=> b!1399502 (= c!130117 (= lt!615588 (select (arr!46196 a!2901) j!112)))))

(declare-fun e!792310 () SeekEntryResult!10513)

(declare-fun b!1399503 () Bool)

(assert (=> b!1399503 (= e!792310 (seekKeyOrZeroReturnVacant!0 (x!126072 lt!615587) (index!44428 lt!615587) (index!44428 lt!615587) (select (arr!46196 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1399504 () Bool)

(declare-fun c!130116 () Bool)

(assert (=> b!1399504 (= c!130116 (= lt!615588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399504 (= e!792308 e!792310)))

(declare-fun b!1399505 () Bool)

(assert (=> b!1399505 (= e!792309 Undefined!10513)))

(declare-fun b!1399506 () Bool)

(assert (=> b!1399506 (= e!792310 (MissingZero!10513 (index!44428 lt!615587)))))

(declare-fun d!151047 () Bool)

(declare-fun lt!615589 () SeekEntryResult!10513)

(assert (=> d!151047 (and (or (is-Undefined!10513 lt!615589) (not (is-Found!10513 lt!615589)) (and (bvsge (index!44427 lt!615589) #b00000000000000000000000000000000) (bvslt (index!44427 lt!615589) (size!46746 a!2901)))) (or (is-Undefined!10513 lt!615589) (is-Found!10513 lt!615589) (not (is-MissingZero!10513 lt!615589)) (and (bvsge (index!44426 lt!615589) #b00000000000000000000000000000000) (bvslt (index!44426 lt!615589) (size!46746 a!2901)))) (or (is-Undefined!10513 lt!615589) (is-Found!10513 lt!615589) (is-MissingZero!10513 lt!615589) (not (is-MissingVacant!10513 lt!615589)) (and (bvsge (index!44429 lt!615589) #b00000000000000000000000000000000) (bvslt (index!44429 lt!615589) (size!46746 a!2901)))) (or (is-Undefined!10513 lt!615589) (ite (is-Found!10513 lt!615589) (= (select (arr!46196 a!2901) (index!44427 lt!615589)) (select (arr!46196 a!2901) j!112)) (ite (is-MissingZero!10513 lt!615589) (= (select (arr!46196 a!2901) (index!44426 lt!615589)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10513 lt!615589) (= (select (arr!46196 a!2901) (index!44429 lt!615589)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151047 (= lt!615589 e!792309)))

(declare-fun c!130115 () Bool)

(assert (=> d!151047 (= c!130115 (and (is-Intermediate!10513 lt!615587) (undefined!11325 lt!615587)))))

(assert (=> d!151047 (= lt!615587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46196 a!2901) j!112) mask!2840) (select (arr!46196 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151047 (validMask!0 mask!2840)))

(assert (=> d!151047 (= (seekEntryOrOpen!0 (select (arr!46196 a!2901) j!112) a!2901 mask!2840) lt!615589)))

(declare-fun b!1399507 () Bool)

(assert (=> b!1399507 (= e!792308 (Found!10513 (index!44428 lt!615587)))))

(assert (= (and d!151047 c!130115) b!1399505))

(assert (= (and d!151047 (not c!130115)) b!1399502))

(assert (= (and b!1399502 c!130117) b!1399507))

(assert (= (and b!1399502 (not c!130117)) b!1399504))

(assert (= (and b!1399504 c!130116) b!1399506))

(assert (= (and b!1399504 (not c!130116)) b!1399503))

(declare-fun m!1286807 () Bool)

(assert (=> b!1399502 m!1286807))

(assert (=> b!1399503 m!1286641))

(declare-fun m!1286809 () Bool)

(assert (=> b!1399503 m!1286809))

(assert (=> d!151047 m!1286641))

(assert (=> d!151047 m!1286657))

(assert (=> d!151047 m!1286657))

(assert (=> d!151047 m!1286641))

(declare-fun m!1286811 () Bool)

(assert (=> d!151047 m!1286811))

(declare-fun m!1286813 () Bool)

(assert (=> d!151047 m!1286813))

(declare-fun m!1286815 () Bool)

(assert (=> d!151047 m!1286815))

(assert (=> d!151047 m!1286651))

(declare-fun m!1286817 () Bool)

(assert (=> d!151047 m!1286817))

(assert (=> b!1399350 d!151047))

(declare-fun d!151071 () Bool)

(assert (=> d!151071 (= (validKeyInArray!0 (select (arr!46196 a!2901) j!112)) (and (not (= (select (arr!46196 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46196 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1399349 d!151071))

(declare-fun d!151073 () Bool)

(declare-fun res!938194 () Bool)

(declare-fun e!792331 () Bool)

(assert (=> d!151073 (=> res!938194 e!792331)))

(assert (=> d!151073 (= res!938194 (bvsge j!112 (size!46746 a!2901)))))

(assert (=> d!151073 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!792331)))

(declare-fun b!1399540 () Bool)

(declare-fun e!792329 () Bool)

(declare-fun call!66893 () Bool)

(assert (=> b!1399540 (= e!792329 call!66893)))

(declare-fun b!1399541 () Bool)

(declare-fun e!792330 () Bool)

(assert (=> b!1399541 (= e!792330 e!792329)))

(declare-fun lt!615610 () (_ BitVec 64))

(assert (=> b!1399541 (= lt!615610 (select (arr!46196 a!2901) j!112))))

(declare-fun lt!615608 () Unit!47030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95688 (_ BitVec 64) (_ BitVec 32)) Unit!47030)

(assert (=> b!1399541 (= lt!615608 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615610 j!112))))

(declare-fun arrayContainsKey!0 (array!95688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1399541 (arrayContainsKey!0 a!2901 lt!615610 #b00000000000000000000000000000000)))

(declare-fun lt!615609 () Unit!47030)

(assert (=> b!1399541 (= lt!615609 lt!615608)))

(declare-fun res!938195 () Bool)

(assert (=> b!1399541 (= res!938195 (= (seekEntryOrOpen!0 (select (arr!46196 a!2901) j!112) a!2901 mask!2840) (Found!10513 j!112)))))

(assert (=> b!1399541 (=> (not res!938195) (not e!792329))))

(declare-fun b!1399542 () Bool)

(assert (=> b!1399542 (= e!792330 call!66893)))

(declare-fun bm!66890 () Bool)

(assert (=> bm!66890 (= call!66893 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1399543 () Bool)

(assert (=> b!1399543 (= e!792331 e!792330)))

(declare-fun c!130132 () Bool)

(assert (=> b!1399543 (= c!130132 (validKeyInArray!0 (select (arr!46196 a!2901) j!112)))))

(assert (= (and d!151073 (not res!938194)) b!1399543))

(assert (= (and b!1399543 c!130132) b!1399541))

(assert (= (and b!1399543 (not c!130132)) b!1399542))

(assert (= (and b!1399541 res!938195) b!1399540))

(assert (= (or b!1399540 b!1399542) bm!66890))

(assert (=> b!1399541 m!1286641))

(declare-fun m!1286819 () Bool)

(assert (=> b!1399541 m!1286819))

(declare-fun m!1286821 () Bool)

(assert (=> b!1399541 m!1286821))

(assert (=> b!1399541 m!1286641))

(assert (=> b!1399541 m!1286671))

(declare-fun m!1286823 () Bool)

(assert (=> bm!66890 m!1286823))

(assert (=> b!1399543 m!1286641))

(assert (=> b!1399543 m!1286641))

(assert (=> b!1399543 m!1286677))

(assert (=> b!1399344 d!151073))

(declare-fun d!151075 () Bool)

(assert (=> d!151075 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!615622 () Unit!47030)

(declare-fun choose!38 (array!95688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47030)

(assert (=> d!151075 (= lt!615622 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151075 (validMask!0 mask!2840)))

(assert (=> d!151075 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!615622)))

(declare-fun bs!40743 () Bool)

(assert (= bs!40743 d!151075))

(assert (=> bs!40743 m!1286663))

(declare-fun m!1286857 () Bool)

(assert (=> bs!40743 m!1286857))

(assert (=> bs!40743 m!1286651))

(assert (=> b!1399344 d!151075))

(declare-fun b!1399562 () Bool)

(declare-fun e!792345 () Bool)

(declare-fun lt!615624 () SeekEntryResult!10513)

(assert (=> b!1399562 (= e!792345 (bvsge (x!126072 lt!615624) #b01111111111111111111111111111110))))

(declare-fun b!1399563 () Bool)

(assert (=> b!1399563 (and (bvsge (index!44428 lt!615624) #b00000000000000000000000000000000) (bvslt (index!44428 lt!615624) (size!46746 a!2901)))))

(declare-fun e!792344 () Bool)

(assert (=> b!1399563 (= e!792344 (= (select (arr!46196 a!2901) (index!44428 lt!615624)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1399564 () Bool)

(assert (=> b!1399564 (and (bvsge (index!44428 lt!615624) #b00000000000000000000000000000000) (bvslt (index!44428 lt!615624) (size!46746 a!2901)))))

(declare-fun res!938198 () Bool)

(assert (=> b!1399564 (= res!938198 (= (select (arr!46196 a!2901) (index!44428 lt!615624)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399564 (=> res!938198 e!792344)))

(declare-fun b!1399565 () Bool)

(declare-fun e!792342 () SeekEntryResult!10513)

(assert (=> b!1399565 (= e!792342 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!615495 #b00000000000000000000000000000000 mask!2840) (select (arr!46196 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1399567 () Bool)

(assert (=> b!1399567 (= e!792342 (Intermediate!10513 false lt!615495 #b00000000000000000000000000000000))))

(declare-fun b!1399568 () Bool)

(declare-fun e!792341 () SeekEntryResult!10513)

(assert (=> b!1399568 (= e!792341 e!792342)))

(declare-fun lt!615623 () (_ BitVec 64))

(declare-fun c!130144 () Bool)

(assert (=> b!1399568 (= c!130144 (or (= lt!615623 (select (arr!46196 a!2901) j!112)) (= (bvadd lt!615623 lt!615623) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1399569 () Bool)

(assert (=> b!1399569 (and (bvsge (index!44428 lt!615624) #b00000000000000000000000000000000) (bvslt (index!44428 lt!615624) (size!46746 a!2901)))))

(declare-fun res!938197 () Bool)

(assert (=> b!1399569 (= res!938197 (= (select (arr!46196 a!2901) (index!44428 lt!615624)) (select (arr!46196 a!2901) j!112)))))

(assert (=> b!1399569 (=> res!938197 e!792344)))

(declare-fun e!792343 () Bool)

(assert (=> b!1399569 (= e!792343 e!792344)))

(declare-fun b!1399570 () Bool)

(assert (=> b!1399570 (= e!792341 (Intermediate!10513 true lt!615495 #b00000000000000000000000000000000))))

(declare-fun d!151083 () Bool)

(assert (=> d!151083 e!792345))

(declare-fun c!130142 () Bool)

(assert (=> d!151083 (= c!130142 (and (is-Intermediate!10513 lt!615624) (undefined!11325 lt!615624)))))

(assert (=> d!151083 (= lt!615624 e!792341)))

(declare-fun c!130143 () Bool)

(assert (=> d!151083 (= c!130143 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151083 (= lt!615623 (select (arr!46196 a!2901) lt!615495))))

(assert (=> d!151083 (validMask!0 mask!2840)))

(assert (=> d!151083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615495 (select (arr!46196 a!2901) j!112) a!2901 mask!2840) lt!615624)))

(declare-fun b!1399566 () Bool)

(assert (=> b!1399566 (= e!792345 e!792343)))

(declare-fun res!938196 () Bool)

(assert (=> b!1399566 (= res!938196 (and (is-Intermediate!10513 lt!615624) (not (undefined!11325 lt!615624)) (bvslt (x!126072 lt!615624) #b01111111111111111111111111111110) (bvsge (x!126072 lt!615624) #b00000000000000000000000000000000) (bvsge (x!126072 lt!615624) #b00000000000000000000000000000000)))))

(assert (=> b!1399566 (=> (not res!938196) (not e!792343))))

(assert (= (and d!151083 c!130143) b!1399570))

(assert (= (and d!151083 (not c!130143)) b!1399568))

(assert (= (and b!1399568 c!130144) b!1399567))

(assert (= (and b!1399568 (not c!130144)) b!1399565))

(assert (= (and d!151083 c!130142) b!1399562))

(assert (= (and d!151083 (not c!130142)) b!1399566))

(assert (= (and b!1399566 res!938196) b!1399569))

(assert (= (and b!1399569 (not res!938197)) b!1399564))

(assert (= (and b!1399564 (not res!938198)) b!1399563))

(declare-fun m!1286859 () Bool)

(assert (=> b!1399569 m!1286859))

(assert (=> b!1399563 m!1286859))

(assert (=> b!1399564 m!1286859))

(declare-fun m!1286861 () Bool)

(assert (=> b!1399565 m!1286861))

(assert (=> b!1399565 m!1286861))

(assert (=> b!1399565 m!1286641))

(declare-fun m!1286863 () Bool)

(assert (=> b!1399565 m!1286863))

(declare-fun m!1286865 () Bool)

(assert (=> d!151083 m!1286865))

(assert (=> d!151083 m!1286651))

(assert (=> b!1399344 d!151083))

(declare-fun d!151085 () Bool)

(declare-fun lt!615626 () (_ BitVec 32))

(declare-fun lt!615625 () (_ BitVec 32))

(assert (=> d!151085 (= lt!615626 (bvmul (bvxor lt!615625 (bvlshr lt!615625 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151085 (= lt!615625 ((_ extract 31 0) (bvand (bvxor (select (arr!46196 a!2901) j!112) (bvlshr (select (arr!46196 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151085 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!938174 (let ((h!33959 ((_ extract 31 0) (bvand (bvxor (select (arr!46196 a!2901) j!112) (bvlshr (select (arr!46196 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126076 (bvmul (bvxor h!33959 (bvlshr h!33959 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126076 (bvlshr x!126076 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!938174 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!938174 #b00000000000000000000000000000000))))))

(assert (=> d!151085 (= (toIndex!0 (select (arr!46196 a!2901) j!112) mask!2840) (bvand (bvxor lt!615626 (bvlshr lt!615626 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1399344 d!151085))

(declare-fun d!151087 () Bool)

(declare-fun res!938199 () Bool)

(declare-fun e!792348 () Bool)

(assert (=> d!151087 (=> res!938199 e!792348)))

(assert (=> d!151087 (= res!938199 (bvsge #b00000000000000000000000000000000 (size!46746 a!2901)))))

(assert (=> d!151087 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!792348)))

(declare-fun b!1399571 () Bool)

(declare-fun e!792346 () Bool)

(declare-fun call!66894 () Bool)

(assert (=> b!1399571 (= e!792346 call!66894)))

(declare-fun b!1399572 () Bool)

(declare-fun e!792347 () Bool)

(assert (=> b!1399572 (= e!792347 e!792346)))

(declare-fun lt!615629 () (_ BitVec 64))

(assert (=> b!1399572 (= lt!615629 (select (arr!46196 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!615627 () Unit!47030)

(assert (=> b!1399572 (= lt!615627 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615629 #b00000000000000000000000000000000))))

(assert (=> b!1399572 (arrayContainsKey!0 a!2901 lt!615629 #b00000000000000000000000000000000)))

(declare-fun lt!615628 () Unit!47030)

(assert (=> b!1399572 (= lt!615628 lt!615627)))

(declare-fun res!938200 () Bool)

(assert (=> b!1399572 (= res!938200 (= (seekEntryOrOpen!0 (select (arr!46196 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10513 #b00000000000000000000000000000000)))))

(assert (=> b!1399572 (=> (not res!938200) (not e!792346))))

(declare-fun b!1399573 () Bool)

(assert (=> b!1399573 (= e!792347 call!66894)))

(declare-fun bm!66891 () Bool)

(assert (=> bm!66891 (= call!66894 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1399574 () Bool)

(assert (=> b!1399574 (= e!792348 e!792347)))

(declare-fun c!130145 () Bool)

(assert (=> b!1399574 (= c!130145 (validKeyInArray!0 (select (arr!46196 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151087 (not res!938199)) b!1399574))

(assert (= (and b!1399574 c!130145) b!1399572))

(assert (= (and b!1399574 (not c!130145)) b!1399573))

(assert (= (and b!1399572 res!938200) b!1399571))

(assert (= (or b!1399571 b!1399573) bm!66891))

(declare-fun m!1286867 () Bool)

(assert (=> b!1399572 m!1286867))

(declare-fun m!1286869 () Bool)

(assert (=> b!1399572 m!1286869))

(declare-fun m!1286871 () Bool)

(assert (=> b!1399572 m!1286871))

(assert (=> b!1399572 m!1286867))

(declare-fun m!1286873 () Bool)

(assert (=> b!1399572 m!1286873))

(declare-fun m!1286875 () Bool)

(assert (=> bm!66891 m!1286875))

(assert (=> b!1399574 m!1286867))

(assert (=> b!1399574 m!1286867))

(declare-fun m!1286877 () Bool)

(assert (=> b!1399574 m!1286877))

(assert (=> b!1399342 d!151087))

(declare-fun b!1399603 () Bool)

(declare-fun e!792368 () Bool)

(declare-fun e!792367 () Bool)

(assert (=> b!1399603 (= e!792368 e!792367)))

(declare-fun res!938207 () Bool)

(assert (=> b!1399603 (=> (not res!938207) (not e!792367))))

(declare-fun e!792366 () Bool)

(assert (=> b!1399603 (= res!938207 (not e!792366))))

(declare-fun res!938209 () Bool)

(assert (=> b!1399603 (=> (not res!938209) (not e!792366))))

(assert (=> b!1399603 (= res!938209 (validKeyInArray!0 (select (arr!46196 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1399604 () Bool)

(declare-fun e!792369 () Bool)

(assert (=> b!1399604 (= e!792367 e!792369)))

(declare-fun c!130157 () Bool)

(assert (=> b!1399604 (= c!130157 (validKeyInArray!0 (select (arr!46196 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1399605 () Bool)

(declare-fun contains!9787 (List!32715 (_ BitVec 64)) Bool)

(assert (=> b!1399605 (= e!792366 (contains!9787 Nil!32712 (select (arr!46196 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1399606 () Bool)

(declare-fun call!66897 () Bool)

(assert (=> b!1399606 (= e!792369 call!66897)))

(declare-fun b!1399607 () Bool)

(assert (=> b!1399607 (= e!792369 call!66897)))

(declare-fun bm!66894 () Bool)

(assert (=> bm!66894 (= call!66897 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130157 (Cons!32711 (select (arr!46196 a!2901) #b00000000000000000000000000000000) Nil!32712) Nil!32712)))))

(declare-fun d!151089 () Bool)

(declare-fun res!938208 () Bool)

(assert (=> d!151089 (=> res!938208 e!792368)))

(assert (=> d!151089 (= res!938208 (bvsge #b00000000000000000000000000000000 (size!46746 a!2901)))))

(assert (=> d!151089 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32712) e!792368)))

(assert (= (and d!151089 (not res!938208)) b!1399603))

(assert (= (and b!1399603 res!938209) b!1399605))

(assert (= (and b!1399603 res!938207) b!1399604))

(assert (= (and b!1399604 c!130157) b!1399606))

(assert (= (and b!1399604 (not c!130157)) b!1399607))

(assert (= (or b!1399606 b!1399607) bm!66894))

(assert (=> b!1399603 m!1286867))

(assert (=> b!1399603 m!1286867))

(assert (=> b!1399603 m!1286877))

(assert (=> b!1399604 m!1286867))

(assert (=> b!1399604 m!1286867))

(assert (=> b!1399604 m!1286877))

(assert (=> b!1399605 m!1286867))

(assert (=> b!1399605 m!1286867))

(declare-fun m!1286889 () Bool)

(assert (=> b!1399605 m!1286889))

(assert (=> bm!66894 m!1286867))

(declare-fun m!1286891 () Bool)

(assert (=> bm!66894 m!1286891))

(assert (=> b!1399343 d!151089))

(declare-fun b!1399608 () Bool)

(declare-fun e!792371 () SeekEntryResult!10513)

(declare-fun e!792370 () SeekEntryResult!10513)

(assert (=> b!1399608 (= e!792371 e!792370)))

(declare-fun lt!615637 () (_ BitVec 64))

(declare-fun lt!615636 () SeekEntryResult!10513)

(assert (=> b!1399608 (= lt!615637 (select (arr!46196 lt!615489) (index!44428 lt!615636)))))

(declare-fun c!130160 () Bool)

(assert (=> b!1399608 (= c!130160 (= lt!615637 lt!615492))))

(declare-fun e!792372 () SeekEntryResult!10513)

(declare-fun b!1399609 () Bool)

(assert (=> b!1399609 (= e!792372 (seekKeyOrZeroReturnVacant!0 (x!126072 lt!615636) (index!44428 lt!615636) (index!44428 lt!615636) lt!615492 lt!615489 mask!2840))))

(declare-fun b!1399610 () Bool)

(declare-fun c!130159 () Bool)

(assert (=> b!1399610 (= c!130159 (= lt!615637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1399610 (= e!792370 e!792372)))

(declare-fun b!1399611 () Bool)

(assert (=> b!1399611 (= e!792371 Undefined!10513)))

(declare-fun b!1399612 () Bool)

(assert (=> b!1399612 (= e!792372 (MissingZero!10513 (index!44428 lt!615636)))))

(declare-fun d!151095 () Bool)

(declare-fun lt!615638 () SeekEntryResult!10513)

(assert (=> d!151095 (and (or (is-Undefined!10513 lt!615638) (not (is-Found!10513 lt!615638)) (and (bvsge (index!44427 lt!615638) #b00000000000000000000000000000000) (bvslt (index!44427 lt!615638) (size!46746 lt!615489)))) (or (is-Undefined!10513 lt!615638) (is-Found!10513 lt!615638) (not (is-MissingZero!10513 lt!615638)) (and (bvsge (index!44426 lt!615638) #b00000000000000000000000000000000) (bvslt (index!44426 lt!615638) (size!46746 lt!615489)))) (or (is-Undefined!10513 lt!615638) (is-Found!10513 lt!615638) (is-MissingZero!10513 lt!615638) (not (is-MissingVacant!10513 lt!615638)) (and (bvsge (index!44429 lt!615638) #b00000000000000000000000000000000) (bvslt (index!44429 lt!615638) (size!46746 lt!615489)))) (or (is-Undefined!10513 lt!615638) (ite (is-Found!10513 lt!615638) (= (select (arr!46196 lt!615489) (index!44427 lt!615638)) lt!615492) (ite (is-MissingZero!10513 lt!615638) (= (select (arr!46196 lt!615489) (index!44426 lt!615638)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10513 lt!615638) (= (select (arr!46196 lt!615489) (index!44429 lt!615638)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151095 (= lt!615638 e!792371)))

(declare-fun c!130158 () Bool)

(assert (=> d!151095 (= c!130158 (and (is-Intermediate!10513 lt!615636) (undefined!11325 lt!615636)))))

(assert (=> d!151095 (= lt!615636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615492 mask!2840) lt!615492 lt!615489 mask!2840))))

(assert (=> d!151095 (validMask!0 mask!2840)))

(assert (=> d!151095 (= (seekEntryOrOpen!0 lt!615492 lt!615489 mask!2840) lt!615638)))

(declare-fun b!1399613 () Bool)

(assert (=> b!1399613 (= e!792370 (Found!10513 (index!44428 lt!615636)))))

(assert (= (and d!151095 c!130158) b!1399611))

(assert (= (and d!151095 (not c!130158)) b!1399608))

(assert (= (and b!1399608 c!130160) b!1399613))

(assert (= (and b!1399608 (not c!130160)) b!1399610))

(assert (= (and b!1399610 c!130159) b!1399612))

(assert (= (and b!1399610 (not c!130159)) b!1399609))

(declare-fun m!1286893 () Bool)

(assert (=> b!1399608 m!1286893))

(declare-fun m!1286895 () Bool)

(assert (=> b!1399609 m!1286895))

(assert (=> d!151095 m!1286665))

(assert (=> d!151095 m!1286665))

(assert (=> d!151095 m!1286667))

(declare-fun m!1286899 () Bool)

(assert (=> d!151095 m!1286899))

(declare-fun m!1286901 () Bool)

(assert (=> d!151095 m!1286901))

(assert (=> d!151095 m!1286651))

(declare-fun m!1286903 () Bool)

(assert (=> d!151095 m!1286903))

(assert (=> b!1399348 d!151095))

(declare-fun b!1399659 () Bool)

(declare-fun e!792401 () SeekEntryResult!10513)

(assert (=> b!1399659 (= e!792401 (MissingVacant!10513 (index!44428 lt!615490)))))

(declare-fun d!151099 () Bool)

(declare-fun lt!615653 () SeekEntryResult!10513)

(assert (=> d!151099 (and (or (is-Undefined!10513 lt!615653) (not (is-Found!10513 lt!615653)) (and (bvsge (index!44427 lt!615653) #b00000000000000000000000000000000) (bvslt (index!44427 lt!615653) (size!46746 lt!615489)))) (or (is-Undefined!10513 lt!615653) (is-Found!10513 lt!615653) (not (is-MissingVacant!10513 lt!615653)) (not (= (index!44429 lt!615653) (index!44428 lt!615490))) (and (bvsge (index!44429 lt!615653) #b00000000000000000000000000000000) (bvslt (index!44429 lt!615653) (size!46746 lt!615489)))) (or (is-Undefined!10513 lt!615653) (ite (is-Found!10513 lt!615653) (= (select (arr!46196 lt!615489) (index!44427 lt!615653)) (select (arr!46196 a!2901) j!112)) (and (is-MissingVacant!10513 lt!615653) (= (index!44429 lt!615653) (index!44428 lt!615490)) (= (select (arr!46196 lt!615489) (index!44429 lt!615653)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!792402 () SeekEntryResult!10513)

(assert (=> d!151099 (= lt!615653 e!792402)))

(declare-fun c!130179 () Bool)

(assert (=> d!151099 (= c!130179 (bvsge (x!126072 lt!615490) #b01111111111111111111111111111110))))

(declare-fun lt!615652 () (_ BitVec 64))

(assert (=> d!151099 (= lt!615652 (select (arr!46196 lt!615489) (index!44428 lt!615490)))))

(assert (=> d!151099 (validMask!0 mask!2840)))

(assert (=> d!151099 (= (seekKeyOrZeroReturnVacant!0 (x!126072 lt!615490) (index!44428 lt!615490) (index!44428 lt!615490) (select (arr!46196 a!2901) j!112) lt!615489 mask!2840) lt!615653)))

(declare-fun b!1399660 () Bool)

(declare-fun c!130180 () Bool)

(assert (=> b!1399660 (= c!130180 (= lt!615652 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!792400 () SeekEntryResult!10513)

(assert (=> b!1399660 (= e!792400 e!792401)))

(declare-fun b!1399661 () Bool)

(assert (=> b!1399661 (= e!792400 (Found!10513 (index!44428 lt!615490)))))

(declare-fun b!1399662 () Bool)

(assert (=> b!1399662 (= e!792402 e!792400)))

(declare-fun c!130181 () Bool)

(assert (=> b!1399662 (= c!130181 (= lt!615652 (select (arr!46196 a!2901) j!112)))))

(declare-fun b!1399663 () Bool)

(assert (=> b!1399663 (= e!792401 (seekKeyOrZeroReturnVacant!0 (bvadd (x!126072 lt!615490) #b00000000000000000000000000000001) (nextIndex!0 (index!44428 lt!615490) (x!126072 lt!615490) mask!2840) (index!44428 lt!615490) (select (arr!46196 a!2901) j!112) lt!615489 mask!2840))))

(declare-fun b!1399664 () Bool)

(assert (=> b!1399664 (= e!792402 Undefined!10513)))

(assert (= (and d!151099 c!130179) b!1399664))

(assert (= (and d!151099 (not c!130179)) b!1399662))

(assert (= (and b!1399662 c!130181) b!1399661))

(assert (= (and b!1399662 (not c!130181)) b!1399660))

(assert (= (and b!1399660 c!130180) b!1399659))

(assert (= (and b!1399660 (not c!130180)) b!1399663))

(declare-fun m!1286919 () Bool)

(assert (=> d!151099 m!1286919))

(declare-fun m!1286921 () Bool)

(assert (=> d!151099 m!1286921))

(declare-fun m!1286923 () Bool)

(assert (=> d!151099 m!1286923))

(assert (=> d!151099 m!1286651))

(declare-fun m!1286925 () Bool)

(assert (=> b!1399663 m!1286925))

(assert (=> b!1399663 m!1286925))

(assert (=> b!1399663 m!1286641))

(declare-fun m!1286927 () Bool)

(assert (=> b!1399663 m!1286927))

(assert (=> b!1399348 d!151099))

(declare-fun d!151103 () Bool)

(assert (=> d!151103 (= (validKeyInArray!0 (select (arr!46196 a!2901) i!1037)) (and (not (= (select (arr!46196 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46196 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1399341 d!151103))

(declare-fun d!151105 () Bool)

(assert (=> d!151105 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120216 d!151105))

(declare-fun d!151107 () Bool)

(assert (=> d!151107 (= (array_inv!35224 a!2901) (bvsge (size!46746 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120216 d!151107))

(declare-fun d!151109 () Bool)

(assert (=> d!151109 (and (not (undefined!11325 lt!615490)) (= (index!44428 lt!615490) i!1037) (bvslt (x!126072 lt!615490) (x!126072 lt!615494)))))

(declare-fun lt!615662 () Unit!47030)

(declare-fun choose!62 (array!95688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47030)

(assert (=> d!151109 (= lt!615662 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615495 (x!126072 lt!615494) (index!44428 lt!615494) (x!126072 lt!615490) (index!44428 lt!615490) (undefined!11325 lt!615490) mask!2840))))

(assert (=> d!151109 (validMask!0 mask!2840)))

(assert (=> d!151109 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615495 (x!126072 lt!615494) (index!44428 lt!615494) (x!126072 lt!615490) (index!44428 lt!615490) (undefined!11325 lt!615490) mask!2840) lt!615662)))

(declare-fun bs!40745 () Bool)

(assert (= bs!40745 d!151109))

(declare-fun m!1286937 () Bool)

(assert (=> bs!40745 m!1286937))

(assert (=> bs!40745 m!1286651))

(assert (=> b!1399347 d!151109))

(push 1)

