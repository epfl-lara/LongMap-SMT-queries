; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28912 () Bool)

(assert start!28912)

(declare-fun b!294384 () Bool)

(declare-fun res!154761 () Bool)

(declare-fun e!186105 () Bool)

(assert (=> b!294384 (=> (not res!154761) (not e!186105))))

(declare-datatypes ((array!14895 0))(
  ( (array!14896 (arr!7064 (Array (_ BitVec 32) (_ BitVec 64))) (size!7416 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14895)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294384 (= res!154761 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!154757 () Bool)

(assert (=> start!28912 (=> (not res!154757) (not e!186105))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28912 (= res!154757 (validMask!0 mask!3809))))

(assert (=> start!28912 e!186105))

(assert (=> start!28912 true))

(declare-fun array_inv!5027 (array!14895) Bool)

(assert (=> start!28912 (array_inv!5027 a!3312)))

(declare-fun e!186104 () Bool)

(declare-datatypes ((SeekEntryResult!2213 0))(
  ( (MissingZero!2213 (index!11022 (_ BitVec 32))) (Found!2213 (index!11023 (_ BitVec 32))) (Intermediate!2213 (undefined!3025 Bool) (index!11024 (_ BitVec 32)) (x!29225 (_ BitVec 32))) (Undefined!2213) (MissingVacant!2213 (index!11025 (_ BitVec 32))) )
))
(declare-fun lt!145926 () SeekEntryResult!2213)

(declare-fun lt!145929 () Bool)

(declare-fun b!294385 () Bool)

(assert (=> b!294385 (= e!186104 (and lt!145929 (let ((bdg!6235 (not (is-Intermediate!2213 lt!145926)))) (and (or bdg!6235 (not (undefined!3025 lt!145926))) (or bdg!6235 (not (= (select (arr!7064 a!3312) (index!11024 lt!145926)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6235) (= (select (arr!7064 a!3312) (index!11024 lt!145926)) k!2524)))))))

(declare-fun lt!145925 () SeekEntryResult!2213)

(declare-fun lt!145928 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14895 (_ BitVec 32)) SeekEntryResult!2213)

(assert (=> b!294385 (= lt!145925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145928 k!2524 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312)) mask!3809))))

(assert (=> b!294385 (= lt!145926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145928 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294385 (= lt!145928 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!294386 () Bool)

(declare-fun res!154758 () Bool)

(assert (=> b!294386 (=> (not res!154758) (not e!186104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14895 (_ BitVec 32)) Bool)

(assert (=> b!294386 (= res!154758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294387 () Bool)

(declare-fun res!154760 () Bool)

(assert (=> b!294387 (=> (not res!154760) (not e!186105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294387 (= res!154760 (validKeyInArray!0 k!2524))))

(declare-fun b!294388 () Bool)

(assert (=> b!294388 (= e!186105 e!186104)))

(declare-fun res!154756 () Bool)

(assert (=> b!294388 (=> (not res!154756) (not e!186104))))

(declare-fun lt!145927 () SeekEntryResult!2213)

(assert (=> b!294388 (= res!154756 (or lt!145929 (= lt!145927 (MissingVacant!2213 i!1256))))))

(assert (=> b!294388 (= lt!145929 (= lt!145927 (MissingZero!2213 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14895 (_ BitVec 32)) SeekEntryResult!2213)

(assert (=> b!294388 (= lt!145927 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!294389 () Bool)

(declare-fun res!154759 () Bool)

(assert (=> b!294389 (=> (not res!154759) (not e!186105))))

(assert (=> b!294389 (= res!154759 (and (= (size!7416 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7416 a!3312))))))

(assert (= (and start!28912 res!154757) b!294389))

(assert (= (and b!294389 res!154759) b!294387))

(assert (= (and b!294387 res!154760) b!294384))

(assert (= (and b!294384 res!154761) b!294388))

(assert (= (and b!294388 res!154756) b!294386))

(assert (= (and b!294386 res!154758) b!294385))

(declare-fun m!307845 () Bool)

(assert (=> b!294384 m!307845))

(declare-fun m!307847 () Bool)

(assert (=> b!294388 m!307847))

(declare-fun m!307849 () Bool)

(assert (=> b!294386 m!307849))

(declare-fun m!307851 () Bool)

(assert (=> b!294385 m!307851))

(declare-fun m!307853 () Bool)

(assert (=> b!294385 m!307853))

(declare-fun m!307855 () Bool)

(assert (=> b!294385 m!307855))

(declare-fun m!307857 () Bool)

(assert (=> b!294385 m!307857))

(declare-fun m!307859 () Bool)

(assert (=> b!294385 m!307859))

(declare-fun m!307861 () Bool)

(assert (=> b!294387 m!307861))

(declare-fun m!307863 () Bool)

(assert (=> start!28912 m!307863))

(declare-fun m!307865 () Bool)

(assert (=> start!28912 m!307865))

(push 1)

(assert (not b!294385))

(assert (not b!294387))

(assert (not start!28912))

(assert (not b!294388))

(assert (not b!294386))

(assert (not b!294384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66805 () Bool)

(assert (=> d!66805 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28912 d!66805))

(declare-fun d!66813 () Bool)

(assert (=> d!66813 (= (array_inv!5027 a!3312) (bvsge (size!7416 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28912 d!66813))

(declare-fun d!66817 () Bool)

(assert (=> d!66817 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294387 d!66817))

(declare-fun b!294452 () Bool)

(declare-fun e!186148 () Bool)

(declare-fun e!186146 () Bool)

(assert (=> b!294452 (= e!186148 e!186146)))

(declare-fun c!47391 () Bool)

(assert (=> b!294452 (= c!47391 (validKeyInArray!0 (select (arr!7064 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294453 () Bool)

(declare-fun e!186147 () Bool)

(assert (=> b!294453 (= e!186146 e!186147)))

(declare-fun lt!145975 () (_ BitVec 64))

(assert (=> b!294453 (= lt!145975 (select (arr!7064 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9204 0))(
  ( (Unit!9205) )
))
(declare-fun lt!145977 () Unit!9204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14895 (_ BitVec 64) (_ BitVec 32)) Unit!9204)

(assert (=> b!294453 (= lt!145977 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145975 #b00000000000000000000000000000000))))

(assert (=> b!294453 (arrayContainsKey!0 a!3312 lt!145975 #b00000000000000000000000000000000)))

(declare-fun lt!145976 () Unit!9204)

(assert (=> b!294453 (= lt!145976 lt!145977)))

(declare-fun res!154814 () Bool)

(assert (=> b!294453 (= res!154814 (= (seekEntryOrOpen!0 (select (arr!7064 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2213 #b00000000000000000000000000000000)))))

(assert (=> b!294453 (=> (not res!154814) (not e!186147))))

(declare-fun b!294454 () Bool)

(declare-fun call!25705 () Bool)

(assert (=> b!294454 (= e!186147 call!25705)))

(declare-fun b!294455 () Bool)

(assert (=> b!294455 (= e!186146 call!25705)))

(declare-fun bm!25702 () Bool)

(assert (=> bm!25702 (= call!25705 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66819 () Bool)

(declare-fun res!154815 () Bool)

(assert (=> d!66819 (=> res!154815 e!186148)))

(assert (=> d!66819 (= res!154815 (bvsge #b00000000000000000000000000000000 (size!7416 a!3312)))))

(assert (=> d!66819 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186148)))

(assert (= (and d!66819 (not res!154815)) b!294452))

(assert (= (and b!294452 c!47391) b!294453))

(assert (= (and b!294452 (not c!47391)) b!294455))

(assert (= (and b!294453 res!154814) b!294454))

(assert (= (or b!294454 b!294455) bm!25702))

(declare-fun m!307925 () Bool)

(assert (=> b!294452 m!307925))

(assert (=> b!294452 m!307925))

(declare-fun m!307927 () Bool)

(assert (=> b!294452 m!307927))

(assert (=> b!294453 m!307925))

(declare-fun m!307929 () Bool)

(assert (=> b!294453 m!307929))

(declare-fun m!307931 () Bool)

(assert (=> b!294453 m!307931))

(assert (=> b!294453 m!307925))

(declare-fun m!307933 () Bool)

(assert (=> b!294453 m!307933))

(declare-fun m!307935 () Bool)

(assert (=> bm!25702 m!307935))

(assert (=> b!294386 d!66819))

(declare-fun d!66821 () Bool)

(declare-fun e!186206 () Bool)

(assert (=> d!66821 e!186206))

(declare-fun c!47424 () Bool)

(declare-fun lt!146011 () SeekEntryResult!2213)

(assert (=> d!66821 (= c!47424 (and (is-Intermediate!2213 lt!146011) (undefined!3025 lt!146011)))))

(declare-fun e!186205 () SeekEntryResult!2213)

(assert (=> d!66821 (= lt!146011 e!186205)))

(declare-fun c!47422 () Bool)

(assert (=> d!66821 (= c!47422 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!146010 () (_ BitVec 64))

(assert (=> d!66821 (= lt!146010 (select (arr!7064 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312))) lt!145928))))

(assert (=> d!66821 (validMask!0 mask!3809)))

(assert (=> d!66821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145928 k!2524 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312)) mask!3809) lt!146011)))

(declare-fun b!294552 () Bool)

(assert (=> b!294552 (= e!186206 (bvsge (x!29225 lt!146011) #b01111111111111111111111111111110))))

(declare-fun b!294553 () Bool)

(assert (=> b!294553 (= e!186205 (Intermediate!2213 true lt!145928 #b00000000000000000000000000000000))))

(declare-fun b!294554 () Bool)

(declare-fun e!186207 () SeekEntryResult!2213)

(assert (=> b!294554 (= e!186207 (Intermediate!2213 false lt!145928 #b00000000000000000000000000000000))))

(declare-fun b!294555 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294555 (= e!186207 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145928 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312)) mask!3809))))

(declare-fun b!294556 () Bool)

(assert (=> b!294556 (and (bvsge (index!11024 lt!146011) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146011) (size!7416 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312)))))))

(declare-fun res!154856 () Bool)

(assert (=> b!294556 (= res!154856 (= (select (arr!7064 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312))) (index!11024 lt!146011)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186208 () Bool)

(assert (=> b!294556 (=> res!154856 e!186208)))

(declare-fun b!294557 () Bool)

(assert (=> b!294557 (and (bvsge (index!11024 lt!146011) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146011) (size!7416 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312)))))))

(declare-fun res!154855 () Bool)

(assert (=> b!294557 (= res!154855 (= (select (arr!7064 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312))) (index!11024 lt!146011)) k!2524))))

(assert (=> b!294557 (=> res!154855 e!186208)))

(declare-fun e!186209 () Bool)

(assert (=> b!294557 (= e!186209 e!186208)))

(declare-fun b!294558 () Bool)

(assert (=> b!294558 (and (bvsge (index!11024 lt!146011) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146011) (size!7416 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312)))))))

(assert (=> b!294558 (= e!186208 (= (select (arr!7064 (array!14896 (store (arr!7064 a!3312) i!1256 k!2524) (size!7416 a!3312))) (index!11024 lt!146011)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294559 () Bool)

(assert (=> b!294559 (= e!186205 e!186207)))

(declare-fun c!47423 () Bool)

(assert (=> b!294559 (= c!47423 (or (= lt!146010 k!2524) (= (bvadd lt!146010 lt!146010) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294560 () Bool)

(assert (=> b!294560 (= e!186206 e!186209)))

(declare-fun res!154854 () Bool)

(assert (=> b!294560 (= res!154854 (and (is-Intermediate!2213 lt!146011) (not (undefined!3025 lt!146011)) (bvslt (x!29225 lt!146011) #b01111111111111111111111111111110) (bvsge (x!29225 lt!146011) #b00000000000000000000000000000000) (bvsge (x!29225 lt!146011) #b00000000000000000000000000000000)))))

(assert (=> b!294560 (=> (not res!154854) (not e!186209))))

(assert (= (and d!66821 c!47422) b!294553))

(assert (= (and d!66821 (not c!47422)) b!294559))

(assert (= (and b!294559 c!47423) b!294554))

(assert (= (and b!294559 (not c!47423)) b!294555))

(assert (= (and d!66821 c!47424) b!294552))

(assert (= (and d!66821 (not c!47424)) b!294560))

(assert (= (and b!294560 res!154854) b!294557))

(assert (= (and b!294557 (not res!154855)) b!294556))

(assert (= (and b!294556 (not res!154856)) b!294558))

(declare-fun m!307969 () Bool)

(assert (=> b!294555 m!307969))

(assert (=> b!294555 m!307969))

(declare-fun m!307971 () Bool)

(assert (=> b!294555 m!307971))

(declare-fun m!307973 () Bool)

(assert (=> b!294557 m!307973))

(assert (=> b!294556 m!307973))

(assert (=> b!294558 m!307973))

(declare-fun m!307975 () Bool)

(assert (=> d!66821 m!307975))

(assert (=> d!66821 m!307863))

(assert (=> b!294385 d!66821))

(declare-fun d!66837 () Bool)

(declare-fun e!186211 () Bool)

(assert (=> d!66837 e!186211))

(declare-fun c!47427 () Bool)

(declare-fun lt!146013 () SeekEntryResult!2213)

(assert (=> d!66837 (= c!47427 (and (is-Intermediate!2213 lt!146013) (undefined!3025 lt!146013)))))

(declare-fun e!186210 () SeekEntryResult!2213)

(assert (=> d!66837 (= lt!146013 e!186210)))

(declare-fun c!47425 () Bool)

(assert (=> d!66837 (= c!47425 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!146012 () (_ BitVec 64))

(assert (=> d!66837 (= lt!146012 (select (arr!7064 a!3312) lt!145928))))

(assert (=> d!66837 (validMask!0 mask!3809)))

(assert (=> d!66837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145928 k!2524 a!3312 mask!3809) lt!146013)))

(declare-fun b!294561 () Bool)

(assert (=> b!294561 (= e!186211 (bvsge (x!29225 lt!146013) #b01111111111111111111111111111110))))

(declare-fun b!294562 () Bool)

(assert (=> b!294562 (= e!186210 (Intermediate!2213 true lt!145928 #b00000000000000000000000000000000))))

(declare-fun b!294563 () Bool)

(declare-fun e!186212 () SeekEntryResult!2213)

(assert (=> b!294563 (= e!186212 (Intermediate!2213 false lt!145928 #b00000000000000000000000000000000))))

(declare-fun b!294564 () Bool)

(assert (=> b!294564 (= e!186212 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145928 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294565 () Bool)

(assert (=> b!294565 (and (bvsge (index!11024 lt!146013) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146013) (size!7416 a!3312)))))

(declare-fun res!154859 () Bool)

(assert (=> b!294565 (= res!154859 (= (select (arr!7064 a!3312) (index!11024 lt!146013)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186213 () Bool)

(assert (=> b!294565 (=> res!154859 e!186213)))

(declare-fun b!294566 () Bool)

(assert (=> b!294566 (and (bvsge (index!11024 lt!146013) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146013) (size!7416 a!3312)))))

(declare-fun res!154858 () Bool)

(assert (=> b!294566 (= res!154858 (= (select (arr!7064 a!3312) (index!11024 lt!146013)) k!2524))))

(assert (=> b!294566 (=> res!154858 e!186213)))

(declare-fun e!186214 () Bool)

(assert (=> b!294566 (= e!186214 e!186213)))

(declare-fun b!294567 () Bool)

(assert (=> b!294567 (and (bvsge (index!11024 lt!146013) #b00000000000000000000000000000000) (bvslt (index!11024 lt!146013) (size!7416 a!3312)))))

(assert (=> b!294567 (= e!186213 (= (select (arr!7064 a!3312) (index!11024 lt!146013)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294568 () Bool)

(assert (=> b!294568 (= e!186210 e!186212)))

(declare-fun c!47426 () Bool)

(assert (=> b!294568 (= c!47426 (or (= lt!146012 k!2524) (= (bvadd lt!146012 lt!146012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294569 () Bool)

(assert (=> b!294569 (= e!186211 e!186214)))

(declare-fun res!154857 () Bool)

(assert (=> b!294569 (= res!154857 (and (is-Intermediate!2213 lt!146013) (not (undefined!3025 lt!146013)) (bvslt (x!29225 lt!146013) #b01111111111111111111111111111110) (bvsge (x!29225 lt!146013) #b00000000000000000000000000000000) (bvsge (x!29225 lt!146013) #b00000000000000000000000000000000)))))

(assert (=> b!294569 (=> (not res!154857) (not e!186214))))

(assert (= (and d!66837 c!47425) b!294562))

(assert (= (and d!66837 (not c!47425)) b!294568))

(assert (= (and b!294568 c!47426) b!294563))

(assert (= (and b!294568 (not c!47426)) b!294564))

(assert (= (and d!66837 c!47427) b!294561))

(assert (= (and d!66837 (not c!47427)) b!294569))

(assert (= (and b!294569 res!154857) b!294566))

(assert (= (and b!294566 (not res!154858)) b!294565))

(assert (= (and b!294565 (not res!154859)) b!294567))

(assert (=> b!294564 m!307969))

(assert (=> b!294564 m!307969))

(declare-fun m!307977 () Bool)

(assert (=> b!294564 m!307977))

(declare-fun m!307979 () Bool)

(assert (=> b!294566 m!307979))

(assert (=> b!294565 m!307979))

(assert (=> b!294567 m!307979))

(declare-fun m!307981 () Bool)

(assert (=> d!66837 m!307981))

(assert (=> d!66837 m!307863))

(assert (=> b!294385 d!66837))

(declare-fun d!66839 () Bool)

(declare-fun lt!146019 () (_ BitVec 32))

(declare-fun lt!146018 () (_ BitVec 32))

(assert (=> d!66839 (= lt!146019 (bvmul (bvxor lt!146018 (bvlshr lt!146018 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66839 (= lt!146018 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66839 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154860 (let ((h!5282 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29233 (bvmul (bvxor h!5282 (bvlshr h!5282 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29233 (bvlshr x!29233 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154860 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154860 #b00000000000000000000000000000000))))))

(assert (=> d!66839 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!146019 (bvlshr lt!146019 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294385 d!66839))

(declare-fun d!66841 () Bool)

(declare-fun res!154865 () Bool)

(declare-fun e!186219 () Bool)

(assert (=> d!66841 (=> res!154865 e!186219)))

(assert (=> d!66841 (= res!154865 (= (select (arr!7064 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66841 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!186219)))

(declare-fun b!294574 () Bool)

(declare-fun e!186220 () Bool)

(assert (=> b!294574 (= e!186219 e!186220)))

(declare-fun res!154866 () Bool)

(assert (=> b!294574 (=> (not res!154866) (not e!186220))))

(assert (=> b!294574 (= res!154866 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7416 a!3312)))))

(declare-fun b!294575 () Bool)

(assert (=> b!294575 (= e!186220 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66841 (not res!154865)) b!294574))

(assert (= (and b!294574 res!154866) b!294575))

(assert (=> d!66841 m!307925))

(declare-fun m!307983 () Bool)

(assert (=> b!294575 m!307983))

(assert (=> b!294384 d!66841))

(declare-fun b!294636 () Bool)

(declare-fun e!186256 () SeekEntryResult!2213)

(assert (=> b!294636 (= e!186256 Undefined!2213)))

(declare-fun b!294637 () Bool)

(declare-fun c!47455 () Bool)

(declare-fun lt!146054 () (_ BitVec 64))

(assert (=> b!294637 (= c!47455 (= lt!146054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186254 () SeekEntryResult!2213)

(declare-fun e!186255 () SeekEntryResult!2213)

(assert (=> b!294637 (= e!186254 e!186255)))

(declare-fun b!294638 () Bool)

(declare-fun lt!146053 () SeekEntryResult!2213)

(assert (=> b!294638 (= e!186255 (MissingZero!2213 (index!11024 lt!146053)))))

(declare-fun b!294639 () Bool)

(assert (=> b!294639 (= e!186256 e!186254)))

(assert (=> b!294639 (= lt!146054 (select (arr!7064 a!3312) (index!11024 lt!146053)))))

(declare-fun c!47457 () Bool)

(assert (=> b!294639 (= c!47457 (= lt!146054 k!2524))))

(declare-fun d!66843 () Bool)

(declare-fun lt!146055 () SeekEntryResult!2213)

(assert (=> d!66843 (and (or (is-Undefined!2213 lt!146055) (not (is-Found!2213 lt!146055)) (and (bvsge (index!11023 lt!146055) #b00000000000000000000000000000000) (bvslt (index!11023 lt!146055) (size!7416 a!3312)))) (or (is-Undefined!2213 lt!146055) (is-Found!2213 lt!146055) (not (is-MissingZero!2213 lt!146055)) (and (bvsge (index!11022 lt!146055) #b00000000000000000000000000000000) (bvslt (index!11022 lt!146055) (size!7416 a!3312)))) (or (is-Undefined!2213 lt!146055) (is-Found!2213 lt!146055) (is-MissingZero!2213 lt!146055) (not (is-MissingVacant!2213 lt!146055)) (and (bvsge (index!11025 lt!146055) #b00000000000000000000000000000000) (bvslt (index!11025 lt!146055) (size!7416 a!3312)))) (or (is-Undefined!2213 lt!146055) (ite (is-Found!2213 lt!146055) (= (select (arr!7064 a!3312) (index!11023 lt!146055)) k!2524) (ite (is-MissingZero!2213 lt!146055) (= (select (arr!7064 a!3312) (index!11022 lt!146055)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2213 lt!146055) (= (select (arr!7064 a!3312) (index!11025 lt!146055)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66843 (= lt!146055 e!186256)))

(declare-fun c!47456 () Bool)

(assert (=> d!66843 (= c!47456 (and (is-Intermediate!2213 lt!146053) (undefined!3025 lt!146053)))))

(assert (=> d!66843 (= lt!146053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66843 (validMask!0 mask!3809)))

(assert (=> d!66843 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!146055)))

(declare-fun b!294640 () Bool)

(assert (=> b!294640 (= e!186254 (Found!2213 (index!11024 lt!146053)))))

(declare-fun b!294641 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14895 (_ BitVec 32)) SeekEntryResult!2213)

(assert (=> b!294641 (= e!186255 (seekKeyOrZeroReturnVacant!0 (x!29225 lt!146053) (index!11024 lt!146053) (index!11024 lt!146053) k!2524 a!3312 mask!3809))))

(assert (= (and d!66843 c!47456) b!294636))

(assert (= (and d!66843 (not c!47456)) b!294639))

(assert (= (and b!294639 c!47457) b!294640))

(assert (= (and b!294639 (not c!47457)) b!294637))

(assert (= (and b!294637 c!47455) b!294638))

(assert (= (and b!294637 (not c!47455)) b!294641))

(declare-fun m!308019 () Bool)

(assert (=> b!294639 m!308019))

(assert (=> d!66843 m!307859))

(declare-fun m!308021 () Bool)

(assert (=> d!66843 m!308021))

(assert (=> d!66843 m!307863))

(declare-fun m!308023 () Bool)

(assert (=> d!66843 m!308023))

(declare-fun m!308025 () Bool)

(assert (=> d!66843 m!308025))

(declare-fun m!308027 () Bool)

(assert (=> d!66843 m!308027))

(assert (=> d!66843 m!307859))

(declare-fun m!308029 () Bool)

(assert (=> b!294641 m!308029))

(assert (=> b!294388 d!66843))

(push 1)

