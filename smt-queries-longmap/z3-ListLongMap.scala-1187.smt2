; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25464 () Bool)

(assert start!25464)

(declare-fun b!265045 () Bool)

(declare-fun res!129561 () Bool)

(declare-fun e!171650 () Bool)

(assert (=> b!265045 (=> (not res!129561) (not e!171650))))

(declare-datatypes ((array!12760 0))(
  ( (array!12761 (arr!6039 (Array (_ BitVec 32) (_ BitVec 64))) (size!6391 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12760)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12760 (_ BitVec 32)) Bool)

(assert (=> b!265045 (= res!129561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265046 () Bool)

(declare-fun e!171648 () Bool)

(assert (=> b!265046 (= e!171648 e!171650)))

(declare-fun res!129560 () Bool)

(assert (=> b!265046 (=> (not res!129560) (not e!171650))))

(declare-datatypes ((SeekEntryResult!1230 0))(
  ( (MissingZero!1230 (index!7090 (_ BitVec 32))) (Found!1230 (index!7091 (_ BitVec 32))) (Intermediate!1230 (undefined!2042 Bool) (index!7092 (_ BitVec 32)) (x!25411 (_ BitVec 32))) (Undefined!1230) (MissingVacant!1230 (index!7093 (_ BitVec 32))) )
))
(declare-fun lt!133963 () SeekEntryResult!1230)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265046 (= res!129560 (or (= lt!133963 (MissingZero!1230 i!1355)) (= lt!133963 (MissingVacant!1230 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12760 (_ BitVec 32)) SeekEntryResult!1230)

(assert (=> b!265046 (= lt!133963 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265047 () Bool)

(declare-fun res!129557 () Bool)

(assert (=> b!265047 (=> (not res!129557) (not e!171648))))

(declare-fun arrayContainsKey!0 (array!12760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265047 (= res!129557 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265048 () Bool)

(assert (=> b!265048 (= e!171650 (and (bvsle #b00000000000000000000000000000000 (size!6391 a!3436)) (bvsge (size!6391 a!3436) #b01111111111111111111111111111111)))))

(declare-fun b!265049 () Bool)

(declare-fun res!129558 () Bool)

(assert (=> b!265049 (=> (not res!129558) (not e!171648))))

(assert (=> b!265049 (= res!129558 (and (= (size!6391 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6391 a!3436))))))

(declare-fun b!265044 () Bool)

(declare-fun res!129556 () Bool)

(assert (=> b!265044 (=> (not res!129556) (not e!171648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265044 (= res!129556 (validKeyInArray!0 k0!2698))))

(declare-fun res!129559 () Bool)

(assert (=> start!25464 (=> (not res!129559) (not e!171648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25464 (= res!129559 (validMask!0 mask!4002))))

(assert (=> start!25464 e!171648))

(assert (=> start!25464 true))

(declare-fun array_inv!4002 (array!12760) Bool)

(assert (=> start!25464 (array_inv!4002 a!3436)))

(assert (= (and start!25464 res!129559) b!265049))

(assert (= (and b!265049 res!129558) b!265044))

(assert (= (and b!265044 res!129556) b!265047))

(assert (= (and b!265047 res!129557) b!265046))

(assert (= (and b!265046 res!129560) b!265045))

(assert (= (and b!265045 res!129561) b!265048))

(declare-fun m!281973 () Bool)

(assert (=> b!265047 m!281973))

(declare-fun m!281975 () Bool)

(assert (=> b!265045 m!281975))

(declare-fun m!281977 () Bool)

(assert (=> b!265046 m!281977))

(declare-fun m!281979 () Bool)

(assert (=> b!265044 m!281979))

(declare-fun m!281981 () Bool)

(assert (=> start!25464 m!281981))

(declare-fun m!281983 () Bool)

(assert (=> start!25464 m!281983))

(check-sat (not b!265045) (not b!265047) (not b!265044) (not start!25464) (not b!265046))
(check-sat)
(get-model)

(declare-fun d!64105 () Bool)

(assert (=> d!64105 (= (validKeyInArray!0 k0!2698) (and (not (= k0!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265044 d!64105))

(declare-fun d!64107 () Bool)

(assert (=> d!64107 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25464 d!64107))

(declare-fun d!64113 () Bool)

(assert (=> d!64113 (= (array_inv!4002 a!3436) (bvsge (size!6391 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25464 d!64113))

(declare-fun d!64115 () Bool)

(declare-fun res!129594 () Bool)

(declare-fun e!171676 () Bool)

(assert (=> d!64115 (=> res!129594 e!171676)))

(assert (=> d!64115 (= res!129594 (= (select (arr!6039 a!3436) #b00000000000000000000000000000000) k0!2698))))

(assert (=> d!64115 (= (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000) e!171676)))

(declare-fun b!265086 () Bool)

(declare-fun e!171677 () Bool)

(assert (=> b!265086 (= e!171676 e!171677)))

(declare-fun res!129595 () Bool)

(assert (=> b!265086 (=> (not res!129595) (not e!171677))))

(assert (=> b!265086 (= res!129595 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6391 a!3436)))))

(declare-fun b!265087 () Bool)

(assert (=> b!265087 (= e!171677 (arrayContainsKey!0 a!3436 k0!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64115 (not res!129594)) b!265086))

(assert (= (and b!265086 res!129595) b!265087))

(declare-fun m!282001 () Bool)

(assert (=> d!64115 m!282001))

(declare-fun m!282003 () Bool)

(assert (=> b!265087 m!282003))

(assert (=> b!265047 d!64115))

(declare-fun b!265100 () Bool)

(declare-fun e!171688 () Bool)

(declare-fun e!171689 () Bool)

(assert (=> b!265100 (= e!171688 e!171689)))

(declare-fun lt!133984 () (_ BitVec 64))

(assert (=> b!265100 (= lt!133984 (select (arr!6039 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8255 0))(
  ( (Unit!8256) )
))
(declare-fun lt!133983 () Unit!8255)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12760 (_ BitVec 64) (_ BitVec 32)) Unit!8255)

(assert (=> b!265100 (= lt!133983 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!133984 #b00000000000000000000000000000000))))

(assert (=> b!265100 (arrayContainsKey!0 a!3436 lt!133984 #b00000000000000000000000000000000)))

(declare-fun lt!133982 () Unit!8255)

(assert (=> b!265100 (= lt!133982 lt!133983)))

(declare-fun res!129603 () Bool)

(assert (=> b!265100 (= res!129603 (= (seekEntryOrOpen!0 (select (arr!6039 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1230 #b00000000000000000000000000000000)))))

(assert (=> b!265100 (=> (not res!129603) (not e!171689))))

(declare-fun b!265101 () Bool)

(declare-fun call!25318 () Bool)

(assert (=> b!265101 (= e!171689 call!25318)))

(declare-fun d!64119 () Bool)

(declare-fun res!129602 () Bool)

(declare-fun e!171687 () Bool)

(assert (=> d!64119 (=> res!129602 e!171687)))

(assert (=> d!64119 (= res!129602 (bvsge #b00000000000000000000000000000000 (size!6391 a!3436)))))

(assert (=> d!64119 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171687)))

(declare-fun bm!25315 () Bool)

(assert (=> bm!25315 (= call!25318 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun b!265102 () Bool)

(assert (=> b!265102 (= e!171687 e!171688)))

(declare-fun c!45300 () Bool)

(assert (=> b!265102 (= c!45300 (validKeyInArray!0 (select (arr!6039 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265103 () Bool)

(assert (=> b!265103 (= e!171688 call!25318)))

(assert (= (and d!64119 (not res!129602)) b!265102))

(assert (= (and b!265102 c!45300) b!265100))

(assert (= (and b!265102 (not c!45300)) b!265103))

(assert (= (and b!265100 res!129603) b!265101))

(assert (= (or b!265101 b!265103) bm!25315))

(assert (=> b!265100 m!282001))

(declare-fun m!282017 () Bool)

(assert (=> b!265100 m!282017))

(declare-fun m!282019 () Bool)

(assert (=> b!265100 m!282019))

(assert (=> b!265100 m!282001))

(declare-fun m!282021 () Bool)

(assert (=> b!265100 m!282021))

(declare-fun m!282023 () Bool)

(assert (=> bm!25315 m!282023))

(assert (=> b!265102 m!282001))

(assert (=> b!265102 m!282001))

(declare-fun m!282025 () Bool)

(assert (=> b!265102 m!282025))

(assert (=> b!265045 d!64119))

(declare-fun b!265122 () Bool)

(declare-fun e!171703 () SeekEntryResult!1230)

(declare-fun e!171704 () SeekEntryResult!1230)

(assert (=> b!265122 (= e!171703 e!171704)))

(declare-fun lt!133992 () (_ BitVec 64))

(declare-fun lt!133993 () SeekEntryResult!1230)

(assert (=> b!265122 (= lt!133992 (select (arr!6039 a!3436) (index!7092 lt!133993)))))

(declare-fun c!45307 () Bool)

(assert (=> b!265122 (= c!45307 (= lt!133992 k0!2698))))

(declare-fun b!265123 () Bool)

(declare-fun c!45309 () Bool)

(assert (=> b!265123 (= c!45309 (= lt!133992 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171702 () SeekEntryResult!1230)

(assert (=> b!265123 (= e!171704 e!171702)))

(declare-fun b!265124 () Bool)

(assert (=> b!265124 (= e!171704 (Found!1230 (index!7092 lt!133993)))))

(declare-fun b!265125 () Bool)

(assert (=> b!265125 (= e!171703 Undefined!1230)))

(declare-fun d!64123 () Bool)

(declare-fun lt!133991 () SeekEntryResult!1230)

(get-info :version)

(assert (=> d!64123 (and (or ((_ is Undefined!1230) lt!133991) (not ((_ is Found!1230) lt!133991)) (and (bvsge (index!7091 lt!133991) #b00000000000000000000000000000000) (bvslt (index!7091 lt!133991) (size!6391 a!3436)))) (or ((_ is Undefined!1230) lt!133991) ((_ is Found!1230) lt!133991) (not ((_ is MissingZero!1230) lt!133991)) (and (bvsge (index!7090 lt!133991) #b00000000000000000000000000000000) (bvslt (index!7090 lt!133991) (size!6391 a!3436)))) (or ((_ is Undefined!1230) lt!133991) ((_ is Found!1230) lt!133991) ((_ is MissingZero!1230) lt!133991) (not ((_ is MissingVacant!1230) lt!133991)) (and (bvsge (index!7093 lt!133991) #b00000000000000000000000000000000) (bvslt (index!7093 lt!133991) (size!6391 a!3436)))) (or ((_ is Undefined!1230) lt!133991) (ite ((_ is Found!1230) lt!133991) (= (select (arr!6039 a!3436) (index!7091 lt!133991)) k0!2698) (ite ((_ is MissingZero!1230) lt!133991) (= (select (arr!6039 a!3436) (index!7090 lt!133991)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1230) lt!133991) (= (select (arr!6039 a!3436) (index!7093 lt!133991)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64123 (= lt!133991 e!171703)))

(declare-fun c!45308 () Bool)

(assert (=> d!64123 (= c!45308 (and ((_ is Intermediate!1230) lt!133993) (undefined!2042 lt!133993)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12760 (_ BitVec 32)) SeekEntryResult!1230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64123 (= lt!133993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2698 mask!4002) k0!2698 a!3436 mask!4002))))

(assert (=> d!64123 (validMask!0 mask!4002)))

(assert (=> d!64123 (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) lt!133991)))

(declare-fun b!265126 () Bool)

(assert (=> b!265126 (= e!171702 (MissingZero!1230 (index!7092 lt!133993)))))

(declare-fun b!265127 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12760 (_ BitVec 32)) SeekEntryResult!1230)

(assert (=> b!265127 (= e!171702 (seekKeyOrZeroReturnVacant!0 (x!25411 lt!133993) (index!7092 lt!133993) (index!7092 lt!133993) k0!2698 a!3436 mask!4002))))

(assert (= (and d!64123 c!45308) b!265125))

(assert (= (and d!64123 (not c!45308)) b!265122))

(assert (= (and b!265122 c!45307) b!265124))

(assert (= (and b!265122 (not c!45307)) b!265123))

(assert (= (and b!265123 c!45309) b!265126))

(assert (= (and b!265123 (not c!45309)) b!265127))

(declare-fun m!282029 () Bool)

(assert (=> b!265122 m!282029))

(declare-fun m!282031 () Bool)

(assert (=> d!64123 m!282031))

(assert (=> d!64123 m!282031))

(declare-fun m!282033 () Bool)

(assert (=> d!64123 m!282033))

(assert (=> d!64123 m!281981))

(declare-fun m!282035 () Bool)

(assert (=> d!64123 m!282035))

(declare-fun m!282037 () Bool)

(assert (=> d!64123 m!282037))

(declare-fun m!282039 () Bool)

(assert (=> d!64123 m!282039))

(declare-fun m!282041 () Bool)

(assert (=> b!265127 m!282041))

(assert (=> b!265046 d!64123))

(check-sat (not d!64123) (not bm!25315) (not b!265102) (not b!265100) (not b!265087) (not b!265127))
(check-sat)
