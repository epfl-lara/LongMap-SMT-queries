; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64386 () Bool)

(assert start!64386)

(declare-fun b!724233 () Bool)

(declare-fun res!485714 () Bool)

(declare-fun e!405649 () Bool)

(assert (=> b!724233 (=> (not res!485714) (not e!405649))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40967 0))(
  ( (array!40968 (arr!19606 (Array (_ BitVec 32) (_ BitVec 64))) (size!20027 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40967)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724233 (= res!485714 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20027 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20027 a!3186))))))

(declare-fun b!724234 () Bool)

(declare-fun res!485710 () Bool)

(declare-fun e!405650 () Bool)

(assert (=> b!724234 (=> (not res!485710) (not e!405650))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724234 (= res!485710 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724235 () Bool)

(declare-fun e!405644 () Bool)

(declare-fun e!405645 () Bool)

(assert (=> b!724235 (= e!405644 e!405645)))

(declare-fun res!485704 () Bool)

(assert (=> b!724235 (=> (not res!485704) (not e!405645))))

(declare-fun lt!320920 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!320922 () array!40967)

(declare-datatypes ((SeekEntryResult!7206 0))(
  ( (MissingZero!7206 (index!31192 (_ BitVec 32))) (Found!7206 (index!31193 (_ BitVec 32))) (Intermediate!7206 (undefined!8018 Bool) (index!31194 (_ BitVec 32)) (x!62183 (_ BitVec 32))) (Undefined!7206) (MissingVacant!7206 (index!31195 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40967 (_ BitVec 32)) SeekEntryResult!7206)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724235 (= res!485704 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320920 mask!3328) lt!320920 lt!320922 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320920 lt!320922 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724235 (= lt!320920 (select (store (arr!19606 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724235 (= lt!320922 (array!40968 (store (arr!19606 a!3186) i!1173 k0!2102) (size!20027 a!3186)))))

(declare-fun b!724236 () Bool)

(declare-fun res!485716 () Bool)

(assert (=> b!724236 (=> (not res!485716) (not e!405644))))

(declare-fun e!405647 () Bool)

(assert (=> b!724236 (= res!485716 e!405647)))

(declare-fun c!79636 () Bool)

(assert (=> b!724236 (= c!79636 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724237 () Bool)

(declare-fun res!485713 () Bool)

(assert (=> b!724237 (=> (not res!485713) (not e!405644))))

(assert (=> b!724237 (= res!485713 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19606 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724238 () Bool)

(declare-fun res!485705 () Bool)

(assert (=> b!724238 (=> (not res!485705) (not e!405649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40967 (_ BitVec 32)) Bool)

(assert (=> b!724238 (= res!485705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724239 () Bool)

(assert (=> b!724239 (= e!405645 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateX!5 #b00000000000000000000000000000000))))))

(declare-fun e!405648 () Bool)

(assert (=> b!724239 e!405648))

(declare-fun res!485717 () Bool)

(assert (=> b!724239 (=> (not res!485717) (not e!405648))))

(assert (=> b!724239 (= res!485717 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24730 0))(
  ( (Unit!24731) )
))
(declare-fun lt!320924 () Unit!24730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24730)

(assert (=> b!724239 (= lt!320924 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!485706 () Bool)

(assert (=> start!64386 (=> (not res!485706) (not e!405650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64386 (= res!485706 (validMask!0 mask!3328))))

(assert (=> start!64386 e!405650))

(assert (=> start!64386 true))

(declare-fun array_inv!15402 (array!40967) Bool)

(assert (=> start!64386 (array_inv!15402 a!3186)))

(declare-fun b!724240 () Bool)

(declare-fun res!485708 () Bool)

(assert (=> b!724240 (=> (not res!485708) (not e!405650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724240 (= res!485708 (validKeyInArray!0 (select (arr!19606 a!3186) j!159)))))

(declare-fun b!724241 () Bool)

(declare-fun res!485707 () Bool)

(assert (=> b!724241 (=> (not res!485707) (not e!405650))))

(assert (=> b!724241 (= res!485707 (and (= (size!20027 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20027 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20027 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724242 () Bool)

(declare-fun res!485715 () Bool)

(assert (=> b!724242 (=> (not res!485715) (not e!405649))))

(declare-datatypes ((List!13608 0))(
  ( (Nil!13605) (Cons!13604 (h!14658 (_ BitVec 64)) (t!19923 List!13608)) )
))
(declare-fun arrayNoDuplicates!0 (array!40967 (_ BitVec 32) List!13608) Bool)

(assert (=> b!724242 (= res!485715 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13605))))

(declare-fun b!724243 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40967 (_ BitVec 32)) SeekEntryResult!7206)

(assert (=> b!724243 (= e!405647 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) (Found!7206 j!159)))))

(declare-fun b!724244 () Bool)

(assert (=> b!724244 (= e!405650 e!405649)))

(declare-fun res!485709 () Bool)

(assert (=> b!724244 (=> (not res!485709) (not e!405649))))

(declare-fun lt!320923 () SeekEntryResult!7206)

(assert (=> b!724244 (= res!485709 (or (= lt!320923 (MissingZero!7206 i!1173)) (= lt!320923 (MissingVacant!7206 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40967 (_ BitVec 32)) SeekEntryResult!7206)

(assert (=> b!724244 (= lt!320923 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!724245 () Bool)

(declare-fun res!485711 () Bool)

(assert (=> b!724245 (=> (not res!485711) (not e!405650))))

(assert (=> b!724245 (= res!485711 (validKeyInArray!0 k0!2102))))

(declare-fun b!724246 () Bool)

(assert (=> b!724246 (= e!405648 (= (seekEntryOrOpen!0 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) (Found!7206 j!159)))))

(declare-fun lt!320921 () SeekEntryResult!7206)

(declare-fun b!724247 () Bool)

(assert (=> b!724247 (= e!405647 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) lt!320921))))

(declare-fun b!724248 () Bool)

(assert (=> b!724248 (= e!405649 e!405644)))

(declare-fun res!485712 () Bool)

(assert (=> b!724248 (=> (not res!485712) (not e!405644))))

(assert (=> b!724248 (= res!485712 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19606 a!3186) j!159) mask!3328) (select (arr!19606 a!3186) j!159) a!3186 mask!3328) lt!320921))))

(assert (=> b!724248 (= lt!320921 (Intermediate!7206 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64386 res!485706) b!724241))

(assert (= (and b!724241 res!485707) b!724240))

(assert (= (and b!724240 res!485708) b!724245))

(assert (= (and b!724245 res!485711) b!724234))

(assert (= (and b!724234 res!485710) b!724244))

(assert (= (and b!724244 res!485709) b!724238))

(assert (= (and b!724238 res!485705) b!724242))

(assert (= (and b!724242 res!485715) b!724233))

(assert (= (and b!724233 res!485714) b!724248))

(assert (= (and b!724248 res!485712) b!724237))

(assert (= (and b!724237 res!485713) b!724236))

(assert (= (and b!724236 c!79636) b!724247))

(assert (= (and b!724236 (not c!79636)) b!724243))

(assert (= (and b!724236 res!485716) b!724235))

(assert (= (and b!724235 res!485704) b!724239))

(assert (= (and b!724239 res!485717) b!724246))

(declare-fun m!678609 () Bool)

(assert (=> b!724245 m!678609))

(declare-fun m!678611 () Bool)

(assert (=> b!724244 m!678611))

(declare-fun m!678613 () Bool)

(assert (=> b!724243 m!678613))

(assert (=> b!724243 m!678613))

(declare-fun m!678615 () Bool)

(assert (=> b!724243 m!678615))

(declare-fun m!678617 () Bool)

(assert (=> b!724235 m!678617))

(declare-fun m!678619 () Bool)

(assert (=> b!724235 m!678619))

(assert (=> b!724235 m!678617))

(declare-fun m!678621 () Bool)

(assert (=> b!724235 m!678621))

(declare-fun m!678623 () Bool)

(assert (=> b!724235 m!678623))

(declare-fun m!678625 () Bool)

(assert (=> b!724235 m!678625))

(declare-fun m!678627 () Bool)

(assert (=> b!724237 m!678627))

(assert (=> b!724248 m!678613))

(assert (=> b!724248 m!678613))

(declare-fun m!678629 () Bool)

(assert (=> b!724248 m!678629))

(assert (=> b!724248 m!678629))

(assert (=> b!724248 m!678613))

(declare-fun m!678631 () Bool)

(assert (=> b!724248 m!678631))

(declare-fun m!678633 () Bool)

(assert (=> b!724238 m!678633))

(assert (=> b!724246 m!678613))

(assert (=> b!724246 m!678613))

(declare-fun m!678635 () Bool)

(assert (=> b!724246 m!678635))

(declare-fun m!678637 () Bool)

(assert (=> start!64386 m!678637))

(declare-fun m!678639 () Bool)

(assert (=> start!64386 m!678639))

(assert (=> b!724240 m!678613))

(assert (=> b!724240 m!678613))

(declare-fun m!678641 () Bool)

(assert (=> b!724240 m!678641))

(declare-fun m!678643 () Bool)

(assert (=> b!724234 m!678643))

(assert (=> b!724247 m!678613))

(assert (=> b!724247 m!678613))

(declare-fun m!678645 () Bool)

(assert (=> b!724247 m!678645))

(declare-fun m!678647 () Bool)

(assert (=> b!724242 m!678647))

(declare-fun m!678649 () Bool)

(assert (=> b!724239 m!678649))

(declare-fun m!678651 () Bool)

(assert (=> b!724239 m!678651))

(check-sat (not b!724244) (not start!64386) (not b!724240) (not b!724239) (not b!724238) (not b!724245) (not b!724235) (not b!724246) (not b!724234) (not b!724243) (not b!724248) (not b!724242) (not b!724247))
(check-sat)
(get-model)

(declare-fun b!724309 () Bool)

(declare-fun e!405678 () SeekEntryResult!7206)

(declare-fun e!405679 () SeekEntryResult!7206)

(assert (=> b!724309 (= e!405678 e!405679)))

(declare-fun c!79647 () Bool)

(declare-fun lt!320945 () (_ BitVec 64))

(assert (=> b!724309 (= c!79647 (= lt!320945 (select (arr!19606 a!3186) j!159)))))

(declare-fun b!724310 () Bool)

(declare-fun e!405680 () SeekEntryResult!7206)

(assert (=> b!724310 (= e!405680 (MissingVacant!7206 resIntermediateIndex!5))))

(declare-fun lt!320944 () SeekEntryResult!7206)

(declare-fun d!99305 () Bool)

(get-info :version)

(assert (=> d!99305 (and (or ((_ is Undefined!7206) lt!320944) (not ((_ is Found!7206) lt!320944)) (and (bvsge (index!31193 lt!320944) #b00000000000000000000000000000000) (bvslt (index!31193 lt!320944) (size!20027 a!3186)))) (or ((_ is Undefined!7206) lt!320944) ((_ is Found!7206) lt!320944) (not ((_ is MissingVacant!7206) lt!320944)) (not (= (index!31195 lt!320944) resIntermediateIndex!5)) (and (bvsge (index!31195 lt!320944) #b00000000000000000000000000000000) (bvslt (index!31195 lt!320944) (size!20027 a!3186)))) (or ((_ is Undefined!7206) lt!320944) (ite ((_ is Found!7206) lt!320944) (= (select (arr!19606 a!3186) (index!31193 lt!320944)) (select (arr!19606 a!3186) j!159)) (and ((_ is MissingVacant!7206) lt!320944) (= (index!31195 lt!320944) resIntermediateIndex!5) (= (select (arr!19606 a!3186) (index!31195 lt!320944)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99305 (= lt!320944 e!405678)))

(declare-fun c!79648 () Bool)

(assert (=> d!99305 (= c!79648 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99305 (= lt!320945 (select (arr!19606 a!3186) index!1321))))

(assert (=> d!99305 (validMask!0 mask!3328)))

(assert (=> d!99305 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) lt!320944)))

(declare-fun b!724311 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724311 (= e!405680 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19606 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724312 () Bool)

(assert (=> b!724312 (= e!405679 (Found!7206 index!1321))))

(declare-fun b!724313 () Bool)

(assert (=> b!724313 (= e!405678 Undefined!7206)))

(declare-fun b!724314 () Bool)

(declare-fun c!79646 () Bool)

(assert (=> b!724314 (= c!79646 (= lt!320945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724314 (= e!405679 e!405680)))

(assert (= (and d!99305 c!79648) b!724313))

(assert (= (and d!99305 (not c!79648)) b!724309))

(assert (= (and b!724309 c!79647) b!724312))

(assert (= (and b!724309 (not c!79647)) b!724314))

(assert (= (and b!724314 c!79646) b!724310))

(assert (= (and b!724314 (not c!79646)) b!724311))

(declare-fun m!678697 () Bool)

(assert (=> d!99305 m!678697))

(declare-fun m!678699 () Bool)

(assert (=> d!99305 m!678699))

(declare-fun m!678701 () Bool)

(assert (=> d!99305 m!678701))

(assert (=> d!99305 m!678637))

(declare-fun m!678703 () Bool)

(assert (=> b!724311 m!678703))

(assert (=> b!724311 m!678703))

(assert (=> b!724311 m!678613))

(declare-fun m!678705 () Bool)

(assert (=> b!724311 m!678705))

(assert (=> b!724243 d!99305))

(declare-fun b!724325 () Bool)

(declare-fun e!405692 () Bool)

(declare-fun e!405691 () Bool)

(assert (=> b!724325 (= e!405692 e!405691)))

(declare-fun res!485766 () Bool)

(assert (=> b!724325 (=> (not res!485766) (not e!405691))))

(declare-fun e!405689 () Bool)

(assert (=> b!724325 (= res!485766 (not e!405689))))

(declare-fun res!485767 () Bool)

(assert (=> b!724325 (=> (not res!485767) (not e!405689))))

(assert (=> b!724325 (= res!485767 (validKeyInArray!0 (select (arr!19606 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724326 () Bool)

(declare-fun e!405690 () Bool)

(declare-fun call!34788 () Bool)

(assert (=> b!724326 (= e!405690 call!34788)))

(declare-fun b!724328 () Bool)

(assert (=> b!724328 (= e!405690 call!34788)))

(declare-fun b!724329 () Bool)

(declare-fun contains!4046 (List!13608 (_ BitVec 64)) Bool)

(assert (=> b!724329 (= e!405689 (contains!4046 Nil!13605 (select (arr!19606 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34785 () Bool)

(declare-fun c!79651 () Bool)

(assert (=> bm!34785 (= call!34788 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79651 (Cons!13604 (select (arr!19606 a!3186) #b00000000000000000000000000000000) Nil!13605) Nil!13605)))))

(declare-fun b!724327 () Bool)

(assert (=> b!724327 (= e!405691 e!405690)))

(assert (=> b!724327 (= c!79651 (validKeyInArray!0 (select (arr!19606 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99307 () Bool)

(declare-fun res!485768 () Bool)

(assert (=> d!99307 (=> res!485768 e!405692)))

(assert (=> d!99307 (= res!485768 (bvsge #b00000000000000000000000000000000 (size!20027 a!3186)))))

(assert (=> d!99307 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13605) e!405692)))

(assert (= (and d!99307 (not res!485768)) b!724325))

(assert (= (and b!724325 res!485767) b!724329))

(assert (= (and b!724325 res!485766) b!724327))

(assert (= (and b!724327 c!79651) b!724328))

(assert (= (and b!724327 (not c!79651)) b!724326))

(assert (= (or b!724328 b!724326) bm!34785))

(declare-fun m!678707 () Bool)

(assert (=> b!724325 m!678707))

(assert (=> b!724325 m!678707))

(declare-fun m!678709 () Bool)

(assert (=> b!724325 m!678709))

(assert (=> b!724329 m!678707))

(assert (=> b!724329 m!678707))

(declare-fun m!678711 () Bool)

(assert (=> b!724329 m!678711))

(assert (=> bm!34785 m!678707))

(declare-fun m!678713 () Bool)

(assert (=> bm!34785 m!678713))

(assert (=> b!724327 m!678707))

(assert (=> b!724327 m!678707))

(assert (=> b!724327 m!678709))

(assert (=> b!724242 d!99307))

(declare-fun b!724348 () Bool)

(declare-fun e!405706 () SeekEntryResult!7206)

(declare-fun lt!320952 () SeekEntryResult!7206)

(assert (=> b!724348 (= e!405706 (MissingZero!7206 (index!31194 lt!320952)))))

(declare-fun d!99309 () Bool)

(declare-fun lt!320954 () SeekEntryResult!7206)

(assert (=> d!99309 (and (or ((_ is Undefined!7206) lt!320954) (not ((_ is Found!7206) lt!320954)) (and (bvsge (index!31193 lt!320954) #b00000000000000000000000000000000) (bvslt (index!31193 lt!320954) (size!20027 a!3186)))) (or ((_ is Undefined!7206) lt!320954) ((_ is Found!7206) lt!320954) (not ((_ is MissingZero!7206) lt!320954)) (and (bvsge (index!31192 lt!320954) #b00000000000000000000000000000000) (bvslt (index!31192 lt!320954) (size!20027 a!3186)))) (or ((_ is Undefined!7206) lt!320954) ((_ is Found!7206) lt!320954) ((_ is MissingZero!7206) lt!320954) (not ((_ is MissingVacant!7206) lt!320954)) (and (bvsge (index!31195 lt!320954) #b00000000000000000000000000000000) (bvslt (index!31195 lt!320954) (size!20027 a!3186)))) (or ((_ is Undefined!7206) lt!320954) (ite ((_ is Found!7206) lt!320954) (= (select (arr!19606 a!3186) (index!31193 lt!320954)) k0!2102) (ite ((_ is MissingZero!7206) lt!320954) (= (select (arr!19606 a!3186) (index!31192 lt!320954)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7206) lt!320954) (= (select (arr!19606 a!3186) (index!31195 lt!320954)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!405707 () SeekEntryResult!7206)

(assert (=> d!99309 (= lt!320954 e!405707)))

(declare-fun c!79660 () Bool)

(assert (=> d!99309 (= c!79660 (and ((_ is Intermediate!7206) lt!320952) (undefined!8018 lt!320952)))))

(assert (=> d!99309 (= lt!320952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99309 (validMask!0 mask!3328)))

(assert (=> d!99309 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!320954)))

(declare-fun b!724349 () Bool)

(assert (=> b!724349 (= e!405706 (seekKeyOrZeroReturnVacant!0 (x!62183 lt!320952) (index!31194 lt!320952) (index!31194 lt!320952) k0!2102 a!3186 mask!3328))))

(declare-fun b!724350 () Bool)

(declare-fun c!79659 () Bool)

(declare-fun lt!320953 () (_ BitVec 64))

(assert (=> b!724350 (= c!79659 (= lt!320953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405705 () SeekEntryResult!7206)

(assert (=> b!724350 (= e!405705 e!405706)))

(declare-fun b!724351 () Bool)

(assert (=> b!724351 (= e!405707 e!405705)))

(assert (=> b!724351 (= lt!320953 (select (arr!19606 a!3186) (index!31194 lt!320952)))))

(declare-fun c!79658 () Bool)

(assert (=> b!724351 (= c!79658 (= lt!320953 k0!2102))))

(declare-fun b!724352 () Bool)

(assert (=> b!724352 (= e!405705 (Found!7206 (index!31194 lt!320952)))))

(declare-fun b!724353 () Bool)

(assert (=> b!724353 (= e!405707 Undefined!7206)))

(assert (= (and d!99309 c!79660) b!724353))

(assert (= (and d!99309 (not c!79660)) b!724351))

(assert (= (and b!724351 c!79658) b!724352))

(assert (= (and b!724351 (not c!79658)) b!724350))

(assert (= (and b!724350 c!79659) b!724348))

(assert (= (and b!724350 (not c!79659)) b!724349))

(declare-fun m!678719 () Bool)

(assert (=> d!99309 m!678719))

(declare-fun m!678721 () Bool)

(assert (=> d!99309 m!678721))

(declare-fun m!678723 () Bool)

(assert (=> d!99309 m!678723))

(assert (=> d!99309 m!678637))

(declare-fun m!678725 () Bool)

(assert (=> d!99309 m!678725))

(assert (=> d!99309 m!678721))

(declare-fun m!678727 () Bool)

(assert (=> d!99309 m!678727))

(declare-fun m!678729 () Bool)

(assert (=> b!724349 m!678729))

(declare-fun m!678731 () Bool)

(assert (=> b!724351 m!678731))

(assert (=> b!724244 d!99309))

(declare-fun d!99317 () Bool)

(assert (=> d!99317 (= (validKeyInArray!0 (select (arr!19606 a!3186) j!159)) (and (not (= (select (arr!19606 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19606 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!724240 d!99317))

(declare-fun e!405754 () SeekEntryResult!7206)

(declare-fun b!724421 () Bool)

(assert (=> b!724421 (= e!405754 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19606 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19606 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724422 () Bool)

(declare-fun lt!320979 () SeekEntryResult!7206)

(assert (=> b!724422 (and (bvsge (index!31194 lt!320979) #b00000000000000000000000000000000) (bvslt (index!31194 lt!320979) (size!20027 a!3186)))))

(declare-fun e!405751 () Bool)

(assert (=> b!724422 (= e!405751 (= (select (arr!19606 a!3186) (index!31194 lt!320979)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724424 () Bool)

(assert (=> b!724424 (and (bvsge (index!31194 lt!320979) #b00000000000000000000000000000000) (bvslt (index!31194 lt!320979) (size!20027 a!3186)))))

(declare-fun res!485802 () Bool)

(assert (=> b!724424 (= res!485802 (= (select (arr!19606 a!3186) (index!31194 lt!320979)) (select (arr!19606 a!3186) j!159)))))

(assert (=> b!724424 (=> res!485802 e!405751)))

(declare-fun e!405752 () Bool)

(assert (=> b!724424 (= e!405752 e!405751)))

(declare-fun b!724428 () Bool)

(declare-fun e!405753 () SeekEntryResult!7206)

(assert (=> b!724428 (= e!405753 e!405754)))

(declare-fun c!79683 () Bool)

(declare-fun lt!320980 () (_ BitVec 64))

(assert (=> b!724428 (= c!79683 (or (= lt!320980 (select (arr!19606 a!3186) j!159)) (= (bvadd lt!320980 lt!320980) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724430 () Bool)

(declare-fun e!405755 () Bool)

(assert (=> b!724430 (= e!405755 e!405752)))

(declare-fun res!485804 () Bool)

(assert (=> b!724430 (= res!485804 (and ((_ is Intermediate!7206) lt!320979) (not (undefined!8018 lt!320979)) (bvslt (x!62183 lt!320979) #b01111111111111111111111111111110) (bvsge (x!62183 lt!320979) #b00000000000000000000000000000000) (bvsge (x!62183 lt!320979) #b00000000000000000000000000000000)))))

(assert (=> b!724430 (=> (not res!485804) (not e!405752))))

(declare-fun b!724431 () Bool)

(assert (=> b!724431 (= e!405753 (Intermediate!7206 true (toIndex!0 (select (arr!19606 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724432 () Bool)

(assert (=> b!724432 (= e!405755 (bvsge (x!62183 lt!320979) #b01111111111111111111111111111110))))

(declare-fun b!724433 () Bool)

(assert (=> b!724433 (and (bvsge (index!31194 lt!320979) #b00000000000000000000000000000000) (bvslt (index!31194 lt!320979) (size!20027 a!3186)))))

(declare-fun res!485803 () Bool)

(assert (=> b!724433 (= res!485803 (= (select (arr!19606 a!3186) (index!31194 lt!320979)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724433 (=> res!485803 e!405751)))

(declare-fun d!99319 () Bool)

(assert (=> d!99319 e!405755))

(declare-fun c!79681 () Bool)

(assert (=> d!99319 (= c!79681 (and ((_ is Intermediate!7206) lt!320979) (undefined!8018 lt!320979)))))

(assert (=> d!99319 (= lt!320979 e!405753)))

(declare-fun c!79682 () Bool)

(assert (=> d!99319 (= c!79682 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99319 (= lt!320980 (select (arr!19606 a!3186) (toIndex!0 (select (arr!19606 a!3186) j!159) mask!3328)))))

(assert (=> d!99319 (validMask!0 mask!3328)))

(assert (=> d!99319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19606 a!3186) j!159) mask!3328) (select (arr!19606 a!3186) j!159) a!3186 mask!3328) lt!320979)))

(declare-fun b!724423 () Bool)

(assert (=> b!724423 (= e!405754 (Intermediate!7206 false (toIndex!0 (select (arr!19606 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99319 c!79682) b!724431))

(assert (= (and d!99319 (not c!79682)) b!724428))

(assert (= (and b!724428 c!79683) b!724423))

(assert (= (and b!724428 (not c!79683)) b!724421))

(assert (= (and d!99319 c!79681) b!724432))

(assert (= (and d!99319 (not c!79681)) b!724430))

(assert (= (and b!724430 res!485804) b!724424))

(assert (= (and b!724424 (not res!485802)) b!724433))

(assert (= (and b!724433 (not res!485803)) b!724422))

(declare-fun m!678747 () Bool)

(assert (=> b!724422 m!678747))

(assert (=> b!724433 m!678747))

(assert (=> b!724421 m!678629))

(declare-fun m!678749 () Bool)

(assert (=> b!724421 m!678749))

(assert (=> b!724421 m!678749))

(assert (=> b!724421 m!678613))

(declare-fun m!678751 () Bool)

(assert (=> b!724421 m!678751))

(assert (=> d!99319 m!678629))

(declare-fun m!678753 () Bool)

(assert (=> d!99319 m!678753))

(assert (=> d!99319 m!678637))

(assert (=> b!724424 m!678747))

(assert (=> b!724248 d!99319))

(declare-fun d!99327 () Bool)

(declare-fun lt!320993 () (_ BitVec 32))

(declare-fun lt!320992 () (_ BitVec 32))

(assert (=> d!99327 (= lt!320993 (bvmul (bvxor lt!320992 (bvlshr lt!320992 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99327 (= lt!320992 ((_ extract 31 0) (bvand (bvxor (select (arr!19606 a!3186) j!159) (bvlshr (select (arr!19606 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99327 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!485805 (let ((h!14660 ((_ extract 31 0) (bvand (bvxor (select (arr!19606 a!3186) j!159) (bvlshr (select (arr!19606 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62189 (bvmul (bvxor h!14660 (bvlshr h!14660 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62189 (bvlshr x!62189 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!485805 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!485805 #b00000000000000000000000000000000))))))

(assert (=> d!99327 (= (toIndex!0 (select (arr!19606 a!3186) j!159) mask!3328) (bvand (bvxor lt!320993 (bvlshr lt!320993 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!724248 d!99327))

(declare-fun b!724465 () Bool)

(declare-fun e!405779 () Bool)

(declare-fun e!405778 () Bool)

(assert (=> b!724465 (= e!405779 e!405778)))

(declare-fun lt!321007 () (_ BitVec 64))

(assert (=> b!724465 (= lt!321007 (select (arr!19606 a!3186) j!159))))

(declare-fun lt!321006 () Unit!24730)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40967 (_ BitVec 64) (_ BitVec 32)) Unit!24730)

(assert (=> b!724465 (= lt!321006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!321007 j!159))))

(assert (=> b!724465 (arrayContainsKey!0 a!3186 lt!321007 #b00000000000000000000000000000000)))

(declare-fun lt!321008 () Unit!24730)

(assert (=> b!724465 (= lt!321008 lt!321006)))

(declare-fun res!485817 () Bool)

(assert (=> b!724465 (= res!485817 (= (seekEntryOrOpen!0 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) (Found!7206 j!159)))))

(assert (=> b!724465 (=> (not res!485817) (not e!405778))))

(declare-fun b!724466 () Bool)

(declare-fun call!34798 () Bool)

(assert (=> b!724466 (= e!405779 call!34798)))

(declare-fun d!99335 () Bool)

(declare-fun res!485816 () Bool)

(declare-fun e!405777 () Bool)

(assert (=> d!99335 (=> res!485816 e!405777)))

(assert (=> d!99335 (= res!485816 (bvsge j!159 (size!20027 a!3186)))))

(assert (=> d!99335 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!405777)))

(declare-fun b!724467 () Bool)

(assert (=> b!724467 (= e!405777 e!405779)))

(declare-fun c!79697 () Bool)

(assert (=> b!724467 (= c!79697 (validKeyInArray!0 (select (arr!19606 a!3186) j!159)))))

(declare-fun b!724468 () Bool)

(assert (=> b!724468 (= e!405778 call!34798)))

(declare-fun bm!34795 () Bool)

(assert (=> bm!34795 (= call!34798 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!99335 (not res!485816)) b!724467))

(assert (= (and b!724467 c!79697) b!724465))

(assert (= (and b!724467 (not c!79697)) b!724466))

(assert (= (and b!724465 res!485817) b!724468))

(assert (= (or b!724468 b!724466) bm!34795))

(assert (=> b!724465 m!678613))

(declare-fun m!678785 () Bool)

(assert (=> b!724465 m!678785))

(declare-fun m!678787 () Bool)

(assert (=> b!724465 m!678787))

(assert (=> b!724465 m!678613))

(assert (=> b!724465 m!678635))

(assert (=> b!724467 m!678613))

(assert (=> b!724467 m!678613))

(assert (=> b!724467 m!678641))

(declare-fun m!678789 () Bool)

(assert (=> bm!34795 m!678789))

(assert (=> b!724239 d!99335))

(declare-fun d!99339 () Bool)

(assert (=> d!99339 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!321015 () Unit!24730)

(declare-fun choose!38 (array!40967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24730)

(assert (=> d!99339 (= lt!321015 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99339 (validMask!0 mask!3328)))

(assert (=> d!99339 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!321015)))

(declare-fun bs!20810 () Bool)

(assert (= bs!20810 d!99339))

(assert (=> bs!20810 m!678649))

(declare-fun m!678791 () Bool)

(assert (=> bs!20810 m!678791))

(assert (=> bs!20810 m!678637))

(assert (=> b!724239 d!99339))

(declare-fun b!724477 () Bool)

(declare-fun e!405786 () Bool)

(declare-fun e!405785 () Bool)

(assert (=> b!724477 (= e!405786 e!405785)))

(declare-fun lt!321017 () (_ BitVec 64))

(assert (=> b!724477 (= lt!321017 (select (arr!19606 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!321016 () Unit!24730)

(assert (=> b!724477 (= lt!321016 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!321017 #b00000000000000000000000000000000))))

(assert (=> b!724477 (arrayContainsKey!0 a!3186 lt!321017 #b00000000000000000000000000000000)))

(declare-fun lt!321018 () Unit!24730)

(assert (=> b!724477 (= lt!321018 lt!321016)))

(declare-fun res!485819 () Bool)

(assert (=> b!724477 (= res!485819 (= (seekEntryOrOpen!0 (select (arr!19606 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7206 #b00000000000000000000000000000000)))))

(assert (=> b!724477 (=> (not res!485819) (not e!405785))))

(declare-fun b!724478 () Bool)

(declare-fun call!34799 () Bool)

(assert (=> b!724478 (= e!405786 call!34799)))

(declare-fun d!99345 () Bool)

(declare-fun res!485818 () Bool)

(declare-fun e!405784 () Bool)

(assert (=> d!99345 (=> res!485818 e!405784)))

(assert (=> d!99345 (= res!485818 (bvsge #b00000000000000000000000000000000 (size!20027 a!3186)))))

(assert (=> d!99345 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!405784)))

(declare-fun b!724479 () Bool)

(assert (=> b!724479 (= e!405784 e!405786)))

(declare-fun c!79702 () Bool)

(assert (=> b!724479 (= c!79702 (validKeyInArray!0 (select (arr!19606 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724480 () Bool)

(assert (=> b!724480 (= e!405785 call!34799)))

(declare-fun bm!34796 () Bool)

(assert (=> bm!34796 (= call!34799 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!99345 (not res!485818)) b!724479))

(assert (= (and b!724479 c!79702) b!724477))

(assert (= (and b!724479 (not c!79702)) b!724478))

(assert (= (and b!724477 res!485819) b!724480))

(assert (= (or b!724480 b!724478) bm!34796))

(assert (=> b!724477 m!678707))

(declare-fun m!678793 () Bool)

(assert (=> b!724477 m!678793))

(declare-fun m!678795 () Bool)

(assert (=> b!724477 m!678795))

(assert (=> b!724477 m!678707))

(declare-fun m!678797 () Bool)

(assert (=> b!724477 m!678797))

(assert (=> b!724479 m!678707))

(assert (=> b!724479 m!678707))

(assert (=> b!724479 m!678709))

(declare-fun m!678799 () Bool)

(assert (=> bm!34796 m!678799))

(assert (=> b!724238 d!99345))

(declare-fun b!724491 () Bool)

(declare-fun e!405796 () SeekEntryResult!7206)

(assert (=> b!724491 (= e!405796 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!320920 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!320920 lt!320922 mask!3328))))

(declare-fun b!724492 () Bool)

(declare-fun lt!321019 () SeekEntryResult!7206)

(assert (=> b!724492 (and (bvsge (index!31194 lt!321019) #b00000000000000000000000000000000) (bvslt (index!31194 lt!321019) (size!20027 lt!320922)))))

(declare-fun e!405793 () Bool)

(assert (=> b!724492 (= e!405793 (= (select (arr!19606 lt!320922) (index!31194 lt!321019)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724494 () Bool)

(assert (=> b!724494 (and (bvsge (index!31194 lt!321019) #b00000000000000000000000000000000) (bvslt (index!31194 lt!321019) (size!20027 lt!320922)))))

(declare-fun res!485826 () Bool)

(assert (=> b!724494 (= res!485826 (= (select (arr!19606 lt!320922) (index!31194 lt!321019)) lt!320920))))

(assert (=> b!724494 (=> res!485826 e!405793)))

(declare-fun e!405794 () Bool)

(assert (=> b!724494 (= e!405794 e!405793)))

(declare-fun b!724495 () Bool)

(declare-fun e!405795 () SeekEntryResult!7206)

(assert (=> b!724495 (= e!405795 e!405796)))

(declare-fun c!79707 () Bool)

(declare-fun lt!321020 () (_ BitVec 64))

(assert (=> b!724495 (= c!79707 (or (= lt!321020 lt!320920) (= (bvadd lt!321020 lt!321020) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724496 () Bool)

(declare-fun e!405797 () Bool)

(assert (=> b!724496 (= e!405797 e!405794)))

(declare-fun res!485828 () Bool)

(assert (=> b!724496 (= res!485828 (and ((_ is Intermediate!7206) lt!321019) (not (undefined!8018 lt!321019)) (bvslt (x!62183 lt!321019) #b01111111111111111111111111111110) (bvsge (x!62183 lt!321019) #b00000000000000000000000000000000) (bvsge (x!62183 lt!321019) #b00000000000000000000000000000000)))))

(assert (=> b!724496 (=> (not res!485828) (not e!405794))))

(declare-fun b!724497 () Bool)

(assert (=> b!724497 (= e!405795 (Intermediate!7206 true (toIndex!0 lt!320920 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724498 () Bool)

(assert (=> b!724498 (= e!405797 (bvsge (x!62183 lt!321019) #b01111111111111111111111111111110))))

(declare-fun b!724499 () Bool)

(assert (=> b!724499 (and (bvsge (index!31194 lt!321019) #b00000000000000000000000000000000) (bvslt (index!31194 lt!321019) (size!20027 lt!320922)))))

(declare-fun res!485827 () Bool)

(assert (=> b!724499 (= res!485827 (= (select (arr!19606 lt!320922) (index!31194 lt!321019)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724499 (=> res!485827 e!405793)))

(declare-fun d!99351 () Bool)

(assert (=> d!99351 e!405797))

(declare-fun c!79705 () Bool)

(assert (=> d!99351 (= c!79705 (and ((_ is Intermediate!7206) lt!321019) (undefined!8018 lt!321019)))))

(assert (=> d!99351 (= lt!321019 e!405795)))

(declare-fun c!79706 () Bool)

(assert (=> d!99351 (= c!79706 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99351 (= lt!321020 (select (arr!19606 lt!320922) (toIndex!0 lt!320920 mask!3328)))))

(assert (=> d!99351 (validMask!0 mask!3328)))

(assert (=> d!99351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320920 mask!3328) lt!320920 lt!320922 mask!3328) lt!321019)))

(declare-fun b!724493 () Bool)

(assert (=> b!724493 (= e!405796 (Intermediate!7206 false (toIndex!0 lt!320920 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99351 c!79706) b!724497))

(assert (= (and d!99351 (not c!79706)) b!724495))

(assert (= (and b!724495 c!79707) b!724493))

(assert (= (and b!724495 (not c!79707)) b!724491))

(assert (= (and d!99351 c!79705) b!724498))

(assert (= (and d!99351 (not c!79705)) b!724496))

(assert (= (and b!724496 res!485828) b!724494))

(assert (= (and b!724494 (not res!485826)) b!724499))

(assert (= (and b!724499 (not res!485827)) b!724492))

(declare-fun m!678801 () Bool)

(assert (=> b!724492 m!678801))

(assert (=> b!724499 m!678801))

(assert (=> b!724491 m!678617))

(declare-fun m!678803 () Bool)

(assert (=> b!724491 m!678803))

(assert (=> b!724491 m!678803))

(declare-fun m!678805 () Bool)

(assert (=> b!724491 m!678805))

(assert (=> d!99351 m!678617))

(declare-fun m!678807 () Bool)

(assert (=> d!99351 m!678807))

(assert (=> d!99351 m!678637))

(assert (=> b!724494 m!678801))

(assert (=> b!724235 d!99351))

(declare-fun d!99353 () Bool)

(declare-fun lt!321022 () (_ BitVec 32))

(declare-fun lt!321021 () (_ BitVec 32))

(assert (=> d!99353 (= lt!321022 (bvmul (bvxor lt!321021 (bvlshr lt!321021 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99353 (= lt!321021 ((_ extract 31 0) (bvand (bvxor lt!320920 (bvlshr lt!320920 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99353 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!485805 (let ((h!14660 ((_ extract 31 0) (bvand (bvxor lt!320920 (bvlshr lt!320920 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62189 (bvmul (bvxor h!14660 (bvlshr h!14660 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62189 (bvlshr x!62189 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!485805 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!485805 #b00000000000000000000000000000000))))))

(assert (=> d!99353 (= (toIndex!0 lt!320920 mask!3328) (bvand (bvxor lt!321022 (bvlshr lt!321022 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!724235 d!99353))

(declare-fun e!405801 () SeekEntryResult!7206)

(declare-fun b!724500 () Bool)

(assert (=> b!724500 (= e!405801 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!320920 lt!320922 mask!3328))))

(declare-fun b!724501 () Bool)

(declare-fun lt!321023 () SeekEntryResult!7206)

(assert (=> b!724501 (and (bvsge (index!31194 lt!321023) #b00000000000000000000000000000000) (bvslt (index!31194 lt!321023) (size!20027 lt!320922)))))

(declare-fun e!405798 () Bool)

(assert (=> b!724501 (= e!405798 (= (select (arr!19606 lt!320922) (index!31194 lt!321023)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724503 () Bool)

(assert (=> b!724503 (and (bvsge (index!31194 lt!321023) #b00000000000000000000000000000000) (bvslt (index!31194 lt!321023) (size!20027 lt!320922)))))

(declare-fun res!485829 () Bool)

(assert (=> b!724503 (= res!485829 (= (select (arr!19606 lt!320922) (index!31194 lt!321023)) lt!320920))))

(assert (=> b!724503 (=> res!485829 e!405798)))

(declare-fun e!405799 () Bool)

(assert (=> b!724503 (= e!405799 e!405798)))

(declare-fun b!724504 () Bool)

(declare-fun e!405800 () SeekEntryResult!7206)

(assert (=> b!724504 (= e!405800 e!405801)))

(declare-fun c!79710 () Bool)

(declare-fun lt!321024 () (_ BitVec 64))

(assert (=> b!724504 (= c!79710 (or (= lt!321024 lt!320920) (= (bvadd lt!321024 lt!321024) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724505 () Bool)

(declare-fun e!405802 () Bool)

(assert (=> b!724505 (= e!405802 e!405799)))

(declare-fun res!485831 () Bool)

(assert (=> b!724505 (= res!485831 (and ((_ is Intermediate!7206) lt!321023) (not (undefined!8018 lt!321023)) (bvslt (x!62183 lt!321023) #b01111111111111111111111111111110) (bvsge (x!62183 lt!321023) #b00000000000000000000000000000000) (bvsge (x!62183 lt!321023) x!1131)))))

(assert (=> b!724505 (=> (not res!485831) (not e!405799))))

(declare-fun b!724506 () Bool)

(assert (=> b!724506 (= e!405800 (Intermediate!7206 true index!1321 x!1131))))

(declare-fun b!724507 () Bool)

(assert (=> b!724507 (= e!405802 (bvsge (x!62183 lt!321023) #b01111111111111111111111111111110))))

(declare-fun b!724508 () Bool)

(assert (=> b!724508 (and (bvsge (index!31194 lt!321023) #b00000000000000000000000000000000) (bvslt (index!31194 lt!321023) (size!20027 lt!320922)))))

(declare-fun res!485830 () Bool)

(assert (=> b!724508 (= res!485830 (= (select (arr!19606 lt!320922) (index!31194 lt!321023)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724508 (=> res!485830 e!405798)))

(declare-fun d!99355 () Bool)

(assert (=> d!99355 e!405802))

(declare-fun c!79708 () Bool)

(assert (=> d!99355 (= c!79708 (and ((_ is Intermediate!7206) lt!321023) (undefined!8018 lt!321023)))))

(assert (=> d!99355 (= lt!321023 e!405800)))

(declare-fun c!79709 () Bool)

(assert (=> d!99355 (= c!79709 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99355 (= lt!321024 (select (arr!19606 lt!320922) index!1321))))

(assert (=> d!99355 (validMask!0 mask!3328)))

(assert (=> d!99355 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320920 lt!320922 mask!3328) lt!321023)))

(declare-fun b!724502 () Bool)

(assert (=> b!724502 (= e!405801 (Intermediate!7206 false index!1321 x!1131))))

(assert (= (and d!99355 c!79709) b!724506))

(assert (= (and d!99355 (not c!79709)) b!724504))

(assert (= (and b!724504 c!79710) b!724502))

(assert (= (and b!724504 (not c!79710)) b!724500))

(assert (= (and d!99355 c!79708) b!724507))

(assert (= (and d!99355 (not c!79708)) b!724505))

(assert (= (and b!724505 res!485831) b!724503))

(assert (= (and b!724503 (not res!485829)) b!724508))

(assert (= (and b!724508 (not res!485830)) b!724501))

(declare-fun m!678809 () Bool)

(assert (=> b!724501 m!678809))

(assert (=> b!724508 m!678809))

(assert (=> b!724500 m!678703))

(assert (=> b!724500 m!678703))

(declare-fun m!678811 () Bool)

(assert (=> b!724500 m!678811))

(declare-fun m!678813 () Bool)

(assert (=> d!99355 m!678813))

(assert (=> d!99355 m!678637))

(assert (=> b!724503 m!678809))

(assert (=> b!724235 d!99355))

(declare-fun d!99357 () Bool)

(assert (=> d!99357 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!724245 d!99357))

(declare-fun d!99359 () Bool)

(declare-fun res!485839 () Bool)

(declare-fun e!405812 () Bool)

(assert (=> d!99359 (=> res!485839 e!405812)))

(assert (=> d!99359 (= res!485839 (= (select (arr!19606 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99359 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!405812)))

(declare-fun b!724522 () Bool)

(declare-fun e!405813 () Bool)

(assert (=> b!724522 (= e!405812 e!405813)))

(declare-fun res!485840 () Bool)

(assert (=> b!724522 (=> (not res!485840) (not e!405813))))

(assert (=> b!724522 (= res!485840 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20027 a!3186)))))

(declare-fun b!724523 () Bool)

(assert (=> b!724523 (= e!405813 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99359 (not res!485839)) b!724522))

(assert (= (and b!724522 res!485840) b!724523))

(assert (=> d!99359 m!678707))

(declare-fun m!678819 () Bool)

(assert (=> b!724523 m!678819))

(assert (=> b!724234 d!99359))

(declare-fun b!724524 () Bool)

(declare-fun e!405817 () SeekEntryResult!7206)

(assert (=> b!724524 (= e!405817 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19606 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724525 () Bool)

(declare-fun lt!321027 () SeekEntryResult!7206)

(assert (=> b!724525 (and (bvsge (index!31194 lt!321027) #b00000000000000000000000000000000) (bvslt (index!31194 lt!321027) (size!20027 a!3186)))))

(declare-fun e!405814 () Bool)

(assert (=> b!724525 (= e!405814 (= (select (arr!19606 a!3186) (index!31194 lt!321027)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724527 () Bool)

(assert (=> b!724527 (and (bvsge (index!31194 lt!321027) #b00000000000000000000000000000000) (bvslt (index!31194 lt!321027) (size!20027 a!3186)))))

(declare-fun res!485841 () Bool)

(assert (=> b!724527 (= res!485841 (= (select (arr!19606 a!3186) (index!31194 lt!321027)) (select (arr!19606 a!3186) j!159)))))

(assert (=> b!724527 (=> res!485841 e!405814)))

(declare-fun e!405815 () Bool)

(assert (=> b!724527 (= e!405815 e!405814)))

(declare-fun b!724528 () Bool)

(declare-fun e!405816 () SeekEntryResult!7206)

(assert (=> b!724528 (= e!405816 e!405817)))

(declare-fun c!79716 () Bool)

(declare-fun lt!321028 () (_ BitVec 64))

(assert (=> b!724528 (= c!79716 (or (= lt!321028 (select (arr!19606 a!3186) j!159)) (= (bvadd lt!321028 lt!321028) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724529 () Bool)

(declare-fun e!405818 () Bool)

(assert (=> b!724529 (= e!405818 e!405815)))

(declare-fun res!485843 () Bool)

(assert (=> b!724529 (= res!485843 (and ((_ is Intermediate!7206) lt!321027) (not (undefined!8018 lt!321027)) (bvslt (x!62183 lt!321027) #b01111111111111111111111111111110) (bvsge (x!62183 lt!321027) #b00000000000000000000000000000000) (bvsge (x!62183 lt!321027) x!1131)))))

(assert (=> b!724529 (=> (not res!485843) (not e!405815))))

(declare-fun b!724530 () Bool)

(assert (=> b!724530 (= e!405816 (Intermediate!7206 true index!1321 x!1131))))

(declare-fun b!724531 () Bool)

(assert (=> b!724531 (= e!405818 (bvsge (x!62183 lt!321027) #b01111111111111111111111111111110))))

(declare-fun b!724532 () Bool)

(assert (=> b!724532 (and (bvsge (index!31194 lt!321027) #b00000000000000000000000000000000) (bvslt (index!31194 lt!321027) (size!20027 a!3186)))))

(declare-fun res!485842 () Bool)

(assert (=> b!724532 (= res!485842 (= (select (arr!19606 a!3186) (index!31194 lt!321027)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724532 (=> res!485842 e!405814)))

(declare-fun d!99363 () Bool)

(assert (=> d!99363 e!405818))

(declare-fun c!79714 () Bool)

(assert (=> d!99363 (= c!79714 (and ((_ is Intermediate!7206) lt!321027) (undefined!8018 lt!321027)))))

(assert (=> d!99363 (= lt!321027 e!405816)))

(declare-fun c!79715 () Bool)

(assert (=> d!99363 (= c!79715 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99363 (= lt!321028 (select (arr!19606 a!3186) index!1321))))

(assert (=> d!99363 (validMask!0 mask!3328)))

(assert (=> d!99363 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) lt!321027)))

(declare-fun b!724526 () Bool)

(assert (=> b!724526 (= e!405817 (Intermediate!7206 false index!1321 x!1131))))

(assert (= (and d!99363 c!79715) b!724530))

(assert (= (and d!99363 (not c!79715)) b!724528))

(assert (= (and b!724528 c!79716) b!724526))

(assert (= (and b!724528 (not c!79716)) b!724524))

(assert (= (and d!99363 c!79714) b!724531))

(assert (= (and d!99363 (not c!79714)) b!724529))

(assert (= (and b!724529 res!485843) b!724527))

(assert (= (and b!724527 (not res!485841)) b!724532))

(assert (= (and b!724532 (not res!485842)) b!724525))

(declare-fun m!678821 () Bool)

(assert (=> b!724525 m!678821))

(assert (=> b!724532 m!678821))

(assert (=> b!724524 m!678703))

(assert (=> b!724524 m!678703))

(assert (=> b!724524 m!678613))

(declare-fun m!678823 () Bool)

(assert (=> b!724524 m!678823))

(assert (=> d!99363 m!678701))

(assert (=> d!99363 m!678637))

(assert (=> b!724527 m!678821))

(assert (=> b!724247 d!99363))

(declare-fun d!99367 () Bool)

(assert (=> d!99367 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64386 d!99367))

(declare-fun d!99375 () Bool)

(assert (=> d!99375 (= (array_inv!15402 a!3186) (bvsge (size!20027 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64386 d!99375))

(declare-fun b!724560 () Bool)

(declare-fun e!405834 () SeekEntryResult!7206)

(declare-fun lt!321037 () SeekEntryResult!7206)

(assert (=> b!724560 (= e!405834 (MissingZero!7206 (index!31194 lt!321037)))))

(declare-fun d!99377 () Bool)

(declare-fun lt!321039 () SeekEntryResult!7206)

(assert (=> d!99377 (and (or ((_ is Undefined!7206) lt!321039) (not ((_ is Found!7206) lt!321039)) (and (bvsge (index!31193 lt!321039) #b00000000000000000000000000000000) (bvslt (index!31193 lt!321039) (size!20027 a!3186)))) (or ((_ is Undefined!7206) lt!321039) ((_ is Found!7206) lt!321039) (not ((_ is MissingZero!7206) lt!321039)) (and (bvsge (index!31192 lt!321039) #b00000000000000000000000000000000) (bvslt (index!31192 lt!321039) (size!20027 a!3186)))) (or ((_ is Undefined!7206) lt!321039) ((_ is Found!7206) lt!321039) ((_ is MissingZero!7206) lt!321039) (not ((_ is MissingVacant!7206) lt!321039)) (and (bvsge (index!31195 lt!321039) #b00000000000000000000000000000000) (bvslt (index!31195 lt!321039) (size!20027 a!3186)))) (or ((_ is Undefined!7206) lt!321039) (ite ((_ is Found!7206) lt!321039) (= (select (arr!19606 a!3186) (index!31193 lt!321039)) (select (arr!19606 a!3186) j!159)) (ite ((_ is MissingZero!7206) lt!321039) (= (select (arr!19606 a!3186) (index!31192 lt!321039)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7206) lt!321039) (= (select (arr!19606 a!3186) (index!31195 lt!321039)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!405835 () SeekEntryResult!7206)

(assert (=> d!99377 (= lt!321039 e!405835)))

(declare-fun c!79731 () Bool)

(assert (=> d!99377 (= c!79731 (and ((_ is Intermediate!7206) lt!321037) (undefined!8018 lt!321037)))))

(assert (=> d!99377 (= lt!321037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19606 a!3186) j!159) mask!3328) (select (arr!19606 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99377 (validMask!0 mask!3328)))

(assert (=> d!99377 (= (seekEntryOrOpen!0 (select (arr!19606 a!3186) j!159) a!3186 mask!3328) lt!321039)))

(declare-fun b!724561 () Bool)

(assert (=> b!724561 (= e!405834 (seekKeyOrZeroReturnVacant!0 (x!62183 lt!321037) (index!31194 lt!321037) (index!31194 lt!321037) (select (arr!19606 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724562 () Bool)

(declare-fun c!79730 () Bool)

(declare-fun lt!321038 () (_ BitVec 64))

(assert (=> b!724562 (= c!79730 (= lt!321038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405833 () SeekEntryResult!7206)

(assert (=> b!724562 (= e!405833 e!405834)))

(declare-fun b!724563 () Bool)

(assert (=> b!724563 (= e!405835 e!405833)))

(assert (=> b!724563 (= lt!321038 (select (arr!19606 a!3186) (index!31194 lt!321037)))))

(declare-fun c!79729 () Bool)

(assert (=> b!724563 (= c!79729 (= lt!321038 (select (arr!19606 a!3186) j!159)))))

(declare-fun b!724564 () Bool)

(assert (=> b!724564 (= e!405833 (Found!7206 (index!31194 lt!321037)))))

(declare-fun b!724565 () Bool)

(assert (=> b!724565 (= e!405835 Undefined!7206)))

(assert (= (and d!99377 c!79731) b!724565))

(assert (= (and d!99377 (not c!79731)) b!724563))

(assert (= (and b!724563 c!79729) b!724564))

(assert (= (and b!724563 (not c!79729)) b!724562))

(assert (= (and b!724562 c!79730) b!724560))

(assert (= (and b!724562 (not c!79730)) b!724561))

(declare-fun m!678843 () Bool)

(assert (=> d!99377 m!678843))

(assert (=> d!99377 m!678629))

(assert (=> d!99377 m!678613))

(assert (=> d!99377 m!678631))

(assert (=> d!99377 m!678637))

(declare-fun m!678845 () Bool)

(assert (=> d!99377 m!678845))

(assert (=> d!99377 m!678613))

(assert (=> d!99377 m!678629))

(declare-fun m!678847 () Bool)

(assert (=> d!99377 m!678847))

(assert (=> b!724561 m!678613))

(declare-fun m!678849 () Bool)

(assert (=> b!724561 m!678849))

(declare-fun m!678851 () Bool)

(assert (=> b!724563 m!678851))

(assert (=> b!724246 d!99377))

(check-sat (not b!724329) (not bm!34796) (not d!99305) (not d!99309) (not d!99377) (not b!724327) (not d!99339) (not b!724491) (not d!99319) (not d!99355) (not b!724524) (not b!724311) (not bm!34795) (not d!99363) (not b!724467) (not d!99351) (not bm!34785) (not b!724500) (not b!724561) (not b!724477) (not b!724479) (not b!724465) (not b!724523) (not b!724421) (not b!724325) (not b!724349))
(check-sat)
