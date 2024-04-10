; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27876 () Bool)

(assert start!27876)

(declare-fun b!286666 () Bool)

(declare-fun res!148744 () Bool)

(declare-fun e!181619 () Bool)

(assert (=> b!286666 (=> (not res!148744) (not e!181619))))

(declare-datatypes ((array!14364 0))(
  ( (array!14365 (arr!6815 (Array (_ BitVec 32) (_ BitVec 64))) (size!7167 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14364)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14364 (_ BitVec 32)) Bool)

(assert (=> b!286666 (= res!148744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286667 () Bool)

(declare-fun res!148749 () Bool)

(declare-fun e!181618 () Bool)

(assert (=> b!286667 (=> (not res!148749) (not e!181618))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286667 (= res!148749 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286668 () Bool)

(declare-fun res!148745 () Bool)

(assert (=> b!286668 (=> (not res!148745) (not e!181618))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286668 (= res!148745 (and (= (size!7167 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7167 a!3312))))))

(declare-fun res!148747 () Bool)

(assert (=> start!27876 (=> (not res!148747) (not e!181618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27876 (= res!148747 (validMask!0 mask!3809))))

(assert (=> start!27876 e!181618))

(assert (=> start!27876 true))

(declare-fun array_inv!4778 (array!14364) Bool)

(assert (=> start!27876 (array_inv!4778 a!3312)))

(declare-fun b!286665 () Bool)

(assert (=> b!286665 (= e!181618 e!181619)))

(declare-fun res!148748 () Bool)

(assert (=> b!286665 (=> (not res!148748) (not e!181619))))

(declare-datatypes ((SeekEntryResult!1964 0))(
  ( (MissingZero!1964 (index!10026 (_ BitVec 32))) (Found!1964 (index!10027 (_ BitVec 32))) (Intermediate!1964 (undefined!2776 Bool) (index!10028 (_ BitVec 32)) (x!28244 (_ BitVec 32))) (Undefined!1964) (MissingVacant!1964 (index!10029 (_ BitVec 32))) )
))
(declare-fun lt!141180 () SeekEntryResult!1964)

(assert (=> b!286665 (= res!148748 (or (= lt!141180 (MissingZero!1964 i!1256)) (= lt!141180 (MissingVacant!1964 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14364 (_ BitVec 32)) SeekEntryResult!1964)

(assert (=> b!286665 (= lt!141180 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286669 () Bool)

(declare-fun res!148746 () Bool)

(assert (=> b!286669 (=> (not res!148746) (not e!181618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286669 (= res!148746 (validKeyInArray!0 k!2524))))

(declare-fun b!286670 () Bool)

(declare-fun lt!141181 () (_ BitVec 32))

(assert (=> b!286670 (= e!181619 (and (bvsge mask!3809 #b00000000000000000000000000000000) (or (bvslt lt!141181 #b00000000000000000000000000000000) (bvsge lt!141181 (bvadd #b00000000000000000000000000000001 mask!3809)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286670 (= lt!141181 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!27876 res!148747) b!286668))

(assert (= (and b!286668 res!148745) b!286669))

(assert (= (and b!286669 res!148746) b!286667))

(assert (= (and b!286667 res!148749) b!286665))

(assert (= (and b!286665 res!148748) b!286666))

(assert (= (and b!286666 res!148744) b!286670))

(declare-fun m!301287 () Bool)

(assert (=> b!286665 m!301287))

(declare-fun m!301289 () Bool)

(assert (=> b!286667 m!301289))

(declare-fun m!301291 () Bool)

(assert (=> b!286666 m!301291))

(declare-fun m!301293 () Bool)

(assert (=> b!286670 m!301293))

(declare-fun m!301295 () Bool)

(assert (=> start!27876 m!301295))

(declare-fun m!301297 () Bool)

(assert (=> start!27876 m!301297))

(declare-fun m!301299 () Bool)

(assert (=> b!286669 m!301299))

(push 1)

(assert (not b!286666))

(assert (not b!286669))

(assert (not b!286665))

(assert (not b!286670))

(assert (not b!286667))

(assert (not start!27876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66003 () Bool)

(assert (=> d!66003 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!286669 d!66003))

(declare-fun d!66005 () Bool)

(assert (=> d!66005 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27876 d!66005))

(declare-fun d!66009 () Bool)

(assert (=> d!66009 (= (array_inv!4778 a!3312) (bvsge (size!7167 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27876 d!66009))

(declare-fun d!66011 () Bool)

(declare-fun res!148796 () Bool)

(declare-fun e!181648 () Bool)

(assert (=> d!66011 (=> res!148796 e!181648)))

(assert (=> d!66011 (= res!148796 (= (select (arr!6815 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66011 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!181648)))

(declare-fun b!286717 () Bool)

(declare-fun e!181649 () Bool)

(assert (=> b!286717 (= e!181648 e!181649)))

(declare-fun res!148797 () Bool)

(assert (=> b!286717 (=> (not res!148797) (not e!181649))))

(assert (=> b!286717 (= res!148797 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7167 a!3312)))))

(declare-fun b!286718 () Bool)

(assert (=> b!286718 (= e!181649 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66011 (not res!148796)) b!286717))

(assert (= (and b!286717 res!148797) b!286718))

(declare-fun m!301333 () Bool)

(assert (=> d!66011 m!301333))

(declare-fun m!301335 () Bool)

(assert (=> b!286718 m!301335))

(assert (=> b!286667 d!66011))

(declare-fun b!286745 () Bool)

(declare-fun e!181666 () Bool)

(declare-fun call!25600 () Bool)

(assert (=> b!286745 (= e!181666 call!25600)))

(declare-fun bm!25597 () Bool)

(assert (=> bm!25597 (= call!25600 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!286747 () Bool)

(declare-fun e!181667 () Bool)

(assert (=> b!286747 (= e!181667 call!25600)))

(declare-fun b!286748 () Bool)

(assert (=> b!286748 (= e!181667 e!181666)))

(declare-fun lt!141209 () (_ BitVec 64))

(assert (=> b!286748 (= lt!141209 (select (arr!6815 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9058 0))(
  ( (Unit!9059) )
))
(declare-fun lt!141211 () Unit!9058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14364 (_ BitVec 64) (_ BitVec 32)) Unit!9058)

(assert (=> b!286748 (= lt!141211 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141209 #b00000000000000000000000000000000))))

(assert (=> b!286748 (arrayContainsKey!0 a!3312 lt!141209 #b00000000000000000000000000000000)))

(declare-fun lt!141210 () Unit!9058)

(assert (=> b!286748 (= lt!141210 lt!141211)))

(declare-fun res!148802 () Bool)

(assert (=> b!286748 (= res!148802 (= (seekEntryOrOpen!0 (select (arr!6815 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1964 #b00000000000000000000000000000000)))))

(assert (=> b!286748 (=> (not res!148802) (not e!181666))))

(declare-fun d!66013 () Bool)

(declare-fun res!148803 () Bool)

(declare-fun e!181665 () Bool)

(assert (=> d!66013 (=> res!148803 e!181665)))

(assert (=> d!66013 (= res!148803 (bvsge #b00000000000000000000000000000000 (size!7167 a!3312)))))

(assert (=> d!66013 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181665)))

(declare-fun b!286746 () Bool)

(assert (=> b!286746 (= e!181665 e!181667)))

(declare-fun c!46527 () Bool)

(assert (=> b!286746 (= c!46527 (validKeyInArray!0 (select (arr!6815 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66013 (not res!148803)) b!286746))

(assert (= (and b!286746 c!46527) b!286748))

(assert (= (and b!286746 (not c!46527)) b!286747))

(assert (= (and b!286748 res!148802) b!286745))

(assert (= (or b!286745 b!286747) bm!25597))

(declare-fun m!301349 () Bool)

(assert (=> bm!25597 m!301349))

(assert (=> b!286748 m!301333))

(declare-fun m!301351 () Bool)

(assert (=> b!286748 m!301351))

(declare-fun m!301353 () Bool)

(assert (=> b!286748 m!301353))

(assert (=> b!286748 m!301333))

(declare-fun m!301355 () Bool)

(assert (=> b!286748 m!301355))

(assert (=> b!286746 m!301333))

(assert (=> b!286746 m!301333))

(declare-fun m!301357 () Bool)

(assert (=> b!286746 m!301357))

(assert (=> b!286666 d!66013))

(declare-fun d!66019 () Bool)

(declare-fun lt!141223 () (_ BitVec 32))

(declare-fun lt!141222 () (_ BitVec 32))

(assert (=> d!66019 (= lt!141223 (bvmul (bvxor lt!141222 (bvlshr lt!141222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66019 (= lt!141222 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66019 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!148804 (let ((h!5247 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28247 (bvmul (bvxor h!5247 (bvlshr h!5247 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28247 (bvlshr x!28247 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!148804 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!148804 #b00000000000000000000000000000000))))))

(assert (=> d!66019 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!141223 (bvlshr lt!141223 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!286670 d!66019))

(declare-fun b!286797 () Bool)

(declare-fun c!46546 () Bool)

(declare-fun lt!141254 () (_ BitVec 64))

(assert (=> b!286797 (= c!46546 (= lt!141254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181699 () SeekEntryResult!1964)

(declare-fun e!181700 () SeekEntryResult!1964)

(assert (=> b!286797 (= e!181699 e!181700)))

(declare-fun b!286798 () Bool)

(declare-fun lt!141252 () SeekEntryResult!1964)

(assert (=> b!286798 (= e!181699 (Found!1964 (index!10028 lt!141252)))))

(declare-fun b!286799 () Bool)

(declare-fun e!181698 () SeekEntryResult!1964)

(assert (=> b!286799 (= e!181698 e!181699)))

(assert (=> b!286799 (= lt!141254 (select (arr!6815 a!3312) (index!10028 lt!141252)))))

(declare-fun c!46547 () Bool)

(assert (=> b!286799 (= c!46547 (= lt!141254 k!2524))))

(declare-fun b!286800 () Bool)

(assert (=> b!286800 (= e!181698 Undefined!1964)))

(declare-fun b!286802 () Bool)

(assert (=> b!286802 (= e!181700 (MissingZero!1964 (index!10028 lt!141252)))))

(declare-fun b!286801 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14364 (_ BitVec 32)) SeekEntryResult!1964)

(assert (=> b!286801 (= e!181700 (seekKeyOrZeroReturnVacant!0 (x!28244 lt!141252) (index!10028 lt!141252) (index!10028 lt!141252) k!2524 a!3312 mask!3809))))

(declare-fun d!66025 () Bool)

(declare-fun lt!141253 () SeekEntryResult!1964)

(assert (=> d!66025 (and (or (is-Undefined!1964 lt!141253) (not (is-Found!1964 lt!141253)) (and (bvsge (index!10027 lt!141253) #b00000000000000000000000000000000) (bvslt (index!10027 lt!141253) (size!7167 a!3312)))) (or (is-Undefined!1964 lt!141253) (is-Found!1964 lt!141253) (not (is-MissingZero!1964 lt!141253)) (and (bvsge (index!10026 lt!141253) #b00000000000000000000000000000000) (bvslt (index!10026 lt!141253) (size!7167 a!3312)))) (or (is-Undefined!1964 lt!141253) (is-Found!1964 lt!141253) (is-MissingZero!1964 lt!141253) (not (is-MissingVacant!1964 lt!141253)) (and (bvsge (index!10029 lt!141253) #b00000000000000000000000000000000) (bvslt (index!10029 lt!141253) (size!7167 a!3312)))) (or (is-Undefined!1964 lt!141253) (ite (is-Found!1964 lt!141253) (= (select (arr!6815 a!3312) (index!10027 lt!141253)) k!2524) (ite (is-MissingZero!1964 lt!141253) (= (select (arr!6815 a!3312) (index!10026 lt!141253)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1964 lt!141253) (= (select (arr!6815 a!3312) (index!10029 lt!141253)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66025 (= lt!141253 e!181698)))

(declare-fun c!46548 () Bool)

(assert (=> d!66025 (= c!46548 (and (is-Intermediate!1964 lt!141252) (undefined!2776 lt!141252)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14364 (_ BitVec 32)) SeekEntryResult!1964)

(assert (=> d!66025 (= lt!141252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66025 (validMask!0 mask!3809)))

(assert (=> d!66025 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!141253)))

(assert (= (and d!66025 c!46548) b!286800))

(assert (= (and d!66025 (not c!46548)) b!286799))

(assert (= (and b!286799 c!46547) b!286798))

(assert (= (and b!286799 (not c!46547)) b!286797))

(assert (= (and b!286797 c!46546) b!286802))

(assert (= (and b!286797 (not c!46546)) b!286801))

(declare-fun m!301385 () Bool)

(assert (=> b!286799 m!301385))

(declare-fun m!301387 () Bool)

(assert (=> b!286801 m!301387))

(declare-fun m!301389 () Bool)

(assert (=> d!66025 m!301389))

(declare-fun m!301391 () Bool)

(assert (=> d!66025 m!301391))

(assert (=> d!66025 m!301293))

(declare-fun m!301393 () Bool)

(assert (=> d!66025 m!301393))

(assert (=> d!66025 m!301295))

(assert (=> d!66025 m!301293))

(declare-fun m!301395 () Bool)

(assert (=> d!66025 m!301395))

(assert (=> b!286665 d!66025))

(push 1)

(assert (not b!286748))

(assert (not bm!25597))

(assert (not b!286718))

(assert (not d!66025))

(assert (not b!286746))

(assert (not b!286801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

