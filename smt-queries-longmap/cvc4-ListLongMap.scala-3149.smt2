; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44320 () Bool)

(assert start!44320)

(declare-fun b!487425 () Bool)

(declare-fun res!290817 () Bool)

(declare-fun e!286784 () Bool)

(assert (=> b!487425 (=> (not res!290817) (not e!286784))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31571 0))(
  ( (array!31572 (arr!15179 (Array (_ BitVec 32) (_ BitVec 64))) (size!15543 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31571)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487425 (= res!290817 (and (= (size!15543 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15543 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15543 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487426 () Bool)

(declare-fun res!290811 () Bool)

(assert (=> b!487426 (=> (not res!290811) (not e!286784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487426 (= res!290811 (validKeyInArray!0 (select (arr!15179 a!3235) j!176)))))

(declare-fun b!487427 () Bool)

(declare-fun res!290818 () Bool)

(assert (=> b!487427 (=> (not res!290818) (not e!286784))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487427 (= res!290818 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487428 () Bool)

(declare-fun res!290816 () Bool)

(assert (=> b!487428 (=> (not res!290816) (not e!286784))))

(assert (=> b!487428 (= res!290816 (validKeyInArray!0 k!2280))))

(declare-fun e!286782 () Bool)

(declare-fun b!487429 () Bool)

(declare-datatypes ((SeekEntryResult!3646 0))(
  ( (MissingZero!3646 (index!16763 (_ BitVec 32))) (Found!3646 (index!16764 (_ BitVec 32))) (Intermediate!3646 (undefined!4458 Bool) (index!16765 (_ BitVec 32)) (x!45882 (_ BitVec 32))) (Undefined!3646) (MissingVacant!3646 (index!16766 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31571 (_ BitVec 32)) SeekEntryResult!3646)

(assert (=> b!487429 (= e!286782 (= (seekEntryOrOpen!0 (select (arr!15179 a!3235) j!176) a!3235 mask!3524) (Found!3646 j!176)))))

(declare-fun res!290812 () Bool)

(assert (=> start!44320 (=> (not res!290812) (not e!286784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44320 (= res!290812 (validMask!0 mask!3524))))

(assert (=> start!44320 e!286784))

(assert (=> start!44320 true))

(declare-fun array_inv!10975 (array!31571) Bool)

(assert (=> start!44320 (array_inv!10975 a!3235)))

(declare-fun b!487430 () Bool)

(declare-fun e!286785 () Bool)

(assert (=> b!487430 (= e!286784 e!286785)))

(declare-fun res!290814 () Bool)

(assert (=> b!487430 (=> (not res!290814) (not e!286785))))

(declare-fun lt!220018 () SeekEntryResult!3646)

(assert (=> b!487430 (= res!290814 (or (= lt!220018 (MissingZero!3646 i!1204)) (= lt!220018 (MissingVacant!3646 i!1204))))))

(assert (=> b!487430 (= lt!220018 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487431 () Bool)

(declare-fun res!290813 () Bool)

(assert (=> b!487431 (=> (not res!290813) (not e!286785))))

(declare-datatypes ((List!9337 0))(
  ( (Nil!9334) (Cons!9333 (h!10189 (_ BitVec 64)) (t!15565 List!9337)) )
))
(declare-fun arrayNoDuplicates!0 (array!31571 (_ BitVec 32) List!9337) Bool)

(assert (=> b!487431 (= res!290813 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9334))))

(declare-fun b!487432 () Bool)

(assert (=> b!487432 (= e!286785 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(assert (=> b!487432 e!286782))

(declare-fun res!290815 () Bool)

(assert (=> b!487432 (=> (not res!290815) (not e!286782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31571 (_ BitVec 32)) Bool)

(assert (=> b!487432 (= res!290815 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14238 0))(
  ( (Unit!14239) )
))
(declare-fun lt!220017 () Unit!14238)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14238)

(assert (=> b!487432 (= lt!220017 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487433 () Bool)

(declare-fun res!290819 () Bool)

(assert (=> b!487433 (=> (not res!290819) (not e!286785))))

(assert (=> b!487433 (= res!290819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44320 res!290812) b!487425))

(assert (= (and b!487425 res!290817) b!487426))

(assert (= (and b!487426 res!290811) b!487428))

(assert (= (and b!487428 res!290816) b!487427))

(assert (= (and b!487427 res!290818) b!487430))

(assert (= (and b!487430 res!290814) b!487433))

(assert (= (and b!487433 res!290819) b!487431))

(assert (= (and b!487431 res!290813) b!487432))

(assert (= (and b!487432 res!290815) b!487429))

(declare-fun m!467241 () Bool)

(assert (=> b!487427 m!467241))

(declare-fun m!467243 () Bool)

(assert (=> b!487428 m!467243))

(declare-fun m!467245 () Bool)

(assert (=> b!487433 m!467245))

(declare-fun m!467247 () Bool)

(assert (=> b!487426 m!467247))

(assert (=> b!487426 m!467247))

(declare-fun m!467249 () Bool)

(assert (=> b!487426 m!467249))

(declare-fun m!467251 () Bool)

(assert (=> b!487432 m!467251))

(declare-fun m!467253 () Bool)

(assert (=> b!487432 m!467253))

(declare-fun m!467255 () Bool)

(assert (=> b!487430 m!467255))

(declare-fun m!467257 () Bool)

(assert (=> start!44320 m!467257))

(declare-fun m!467259 () Bool)

(assert (=> start!44320 m!467259))

(declare-fun m!467261 () Bool)

(assert (=> b!487431 m!467261))

(assert (=> b!487429 m!467247))

(assert (=> b!487429 m!467247))

(declare-fun m!467263 () Bool)

(assert (=> b!487429 m!467263))

(push 1)

(assert (not b!487430))

(assert (not start!44320))

(assert (not b!487431))

(assert (not b!487433))

(assert (not b!487432))

(assert (not b!487428))

(assert (not b!487429))

(assert (not b!487426))

(assert (not b!487427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!487444 () Bool)

(declare-fun e!286795 () Bool)

(declare-fun e!286794 () Bool)

(assert (=> b!487444 (= e!286795 e!286794)))

(declare-fun res!290828 () Bool)

(assert (=> b!487444 (=> (not res!290828) (not e!286794))))

(declare-fun e!286796 () Bool)

(assert (=> b!487444 (= res!290828 (not e!286796))))

(declare-fun res!290826 () Bool)

(assert (=> b!487444 (=> (not res!290826) (not e!286796))))

(assert (=> b!487444 (= res!290826 (validKeyInArray!0 (select (arr!15179 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77639 () Bool)

(declare-fun res!290827 () Bool)

(assert (=> d!77639 (=> res!290827 e!286795)))

(assert (=> d!77639 (= res!290827 (bvsge #b00000000000000000000000000000000 (size!15543 a!3235)))))

(assert (=> d!77639 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9334) e!286795)))

(declare-fun b!487445 () Bool)

(declare-fun e!286797 () Bool)

(declare-fun call!31286 () Bool)

(assert (=> b!487445 (= e!286797 call!31286)))

(declare-fun b!487446 () Bool)

(assert (=> b!487446 (= e!286797 call!31286)))

(declare-fun bm!31283 () Bool)

(declare-fun c!58577 () Bool)

(assert (=> bm!31283 (= call!31286 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58577 (Cons!9333 (select (arr!15179 a!3235) #b00000000000000000000000000000000) Nil!9334) Nil!9334)))))

(declare-fun b!487447 () Bool)

(declare-fun contains!2699 (List!9337 (_ BitVec 64)) Bool)

(assert (=> b!487447 (= e!286796 (contains!2699 Nil!9334 (select (arr!15179 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487448 () Bool)

(assert (=> b!487448 (= e!286794 e!286797)))

(assert (=> b!487448 (= c!58577 (validKeyInArray!0 (select (arr!15179 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77639 (not res!290827)) b!487444))

(assert (= (and b!487444 res!290826) b!487447))

(assert (= (and b!487444 res!290828) b!487448))

(assert (= (and b!487448 c!58577) b!487445))

(assert (= (and b!487448 (not c!58577)) b!487446))

(assert (= (or b!487445 b!487446) bm!31283))

(declare-fun m!467265 () Bool)

(assert (=> b!487444 m!467265))

(assert (=> b!487444 m!467265))

(declare-fun m!467267 () Bool)

(assert (=> b!487444 m!467267))

(assert (=> bm!31283 m!467265))

(declare-fun m!467269 () Bool)

(assert (=> bm!31283 m!467269))

(assert (=> b!487447 m!467265))

(assert (=> b!487447 m!467265))

(declare-fun m!467271 () Bool)

(assert (=> b!487447 m!467271))

(assert (=> b!487448 m!467265))

(assert (=> b!487448 m!467265))

(assert (=> b!487448 m!467267))

(assert (=> b!487431 d!77639))

(declare-fun d!77643 () Bool)

(assert (=> d!77643 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44320 d!77643))

(declare-fun d!77647 () Bool)

(assert (=> d!77647 (= (array_inv!10975 a!3235) (bvsge (size!15543 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44320 d!77647))

(declare-fun lt!220056 () SeekEntryResult!3646)

(declare-fun e!286848 () SeekEntryResult!3646)

(declare-fun b!487523 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31571 (_ BitVec 32)) SeekEntryResult!3646)

(assert (=> b!487523 (= e!286848 (seekKeyOrZeroReturnVacant!0 (x!45882 lt!220056) (index!16765 lt!220056) (index!16765 lt!220056) k!2280 a!3235 mask!3524))))

(declare-fun b!487524 () Bool)

(declare-fun c!58610 () Bool)

(declare-fun lt!220057 () (_ BitVec 64))

(assert (=> b!487524 (= c!58610 (= lt!220057 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!286846 () SeekEntryResult!3646)

(assert (=> b!487524 (= e!286846 e!286848)))

(declare-fun b!487525 () Bool)

(assert (=> b!487525 (= e!286848 (MissingZero!3646 (index!16765 lt!220056)))))

(declare-fun b!487526 () Bool)

(declare-fun e!286847 () SeekEntryResult!3646)

(assert (=> b!487526 (= e!286847 e!286846)))

(assert (=> b!487526 (= lt!220057 (select (arr!15179 a!3235) (index!16765 lt!220056)))))

(declare-fun c!58609 () Bool)

(assert (=> b!487526 (= c!58609 (= lt!220057 k!2280))))

(declare-fun b!487527 () Bool)

(assert (=> b!487527 (= e!286846 (Found!3646 (index!16765 lt!220056)))))

(declare-fun d!77649 () Bool)

(declare-fun lt!220055 () SeekEntryResult!3646)

(assert (=> d!77649 (and (or (is-Undefined!3646 lt!220055) (not (is-Found!3646 lt!220055)) (and (bvsge (index!16764 lt!220055) #b00000000000000000000000000000000) (bvslt (index!16764 lt!220055) (size!15543 a!3235)))) (or (is-Undefined!3646 lt!220055) (is-Found!3646 lt!220055) (not (is-MissingZero!3646 lt!220055)) (and (bvsge (index!16763 lt!220055) #b00000000000000000000000000000000) (bvslt (index!16763 lt!220055) (size!15543 a!3235)))) (or (is-Undefined!3646 lt!220055) (is-Found!3646 lt!220055) (is-MissingZero!3646 lt!220055) (not (is-MissingVacant!3646 lt!220055)) (and (bvsge (index!16766 lt!220055) #b00000000000000000000000000000000) (bvslt (index!16766 lt!220055) (size!15543 a!3235)))) (or (is-Undefined!3646 lt!220055) (ite (is-Found!3646 lt!220055) (= (select (arr!15179 a!3235) (index!16764 lt!220055)) k!2280) (ite (is-MissingZero!3646 lt!220055) (= (select (arr!15179 a!3235) (index!16763 lt!220055)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3646 lt!220055) (= (select (arr!15179 a!3235) (index!16766 lt!220055)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77649 (= lt!220055 e!286847)))

(declare-fun c!58608 () Bool)

(assert (=> d!77649 (= c!58608 (and (is-Intermediate!3646 lt!220056) (undefined!4458 lt!220056)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31571 (_ BitVec 32)) SeekEntryResult!3646)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77649 (= lt!220056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77649 (validMask!0 mask!3524)))

(assert (=> d!77649 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!220055)))

(declare-fun b!487528 () Bool)

(assert (=> b!487528 (= e!286847 Undefined!3646)))

(assert (= (and d!77649 c!58608) b!487528))

(assert (= (and d!77649 (not c!58608)) b!487526))

(assert (= (and b!487526 c!58609) b!487527))

(assert (= (and b!487526 (not c!58609)) b!487524))

(assert (= (and b!487524 c!58610) b!487525))

(assert (= (and b!487524 (not c!58610)) b!487523))

(declare-fun m!467329 () Bool)

(assert (=> b!487523 m!467329))

(declare-fun m!467331 () Bool)

(assert (=> b!487526 m!467331))

(declare-fun m!467333 () Bool)

(assert (=> d!77649 m!467333))

(declare-fun m!467335 () Bool)

(assert (=> d!77649 m!467335))

(declare-fun m!467337 () Bool)

(assert (=> d!77649 m!467337))

(declare-fun m!467339 () Bool)

(assert (=> d!77649 m!467339))

(assert (=> d!77649 m!467257))

(assert (=> d!77649 m!467335))

(declare-fun m!467341 () Bool)

(assert (=> d!77649 m!467341))

(assert (=> b!487430 d!77649))

(declare-fun d!77663 () Bool)

(declare-fun res!290854 () Bool)

(declare-fun e!286859 () Bool)

(assert (=> d!77663 (=> res!290854 e!286859)))

(assert (=> d!77663 (= res!290854 (= (select (arr!15179 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!77663 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!286859)))

(declare-fun b!487546 () Bool)

(declare-fun e!286860 () Bool)

(assert (=> b!487546 (= e!286859 e!286860)))

(declare-fun res!290855 () Bool)

(assert (=> b!487546 (=> (not res!290855) (not e!286860))))

(assert (=> b!487546 (= res!290855 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15543 a!3235)))))

(declare-fun b!487547 () Bool)

(assert (=> b!487547 (= e!286860 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77663 (not res!290854)) b!487546))

(assert (= (and b!487546 res!290855) b!487547))

(assert (=> d!77663 m!467265))

(declare-fun m!467347 () Bool)

(assert (=> b!487547 m!467347))

(assert (=> b!487427 d!77663))

(declare-fun b!487572 () Bool)

(declare-fun e!286880 () Bool)

(declare-fun e!286881 () Bool)

(assert (=> b!487572 (= e!286880 e!286881)))

(declare-fun c!58620 () Bool)

(assert (=> b!487572 (= c!58620 (validKeyInArray!0 (select (arr!15179 a!3235) j!176)))))

(declare-fun b!487573 () Bool)

(declare-fun call!31299 () Bool)

(assert (=> b!487573 (= e!286881 call!31299)))

(declare-fun d!77665 () Bool)

(declare-fun res!290869 () Bool)

(assert (=> d!77665 (=> res!290869 e!286880)))

(assert (=> d!77665 (= res!290869 (bvsge j!176 (size!15543 a!3235)))))

(assert (=> d!77665 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!286880)))

(declare-fun bm!31296 () Bool)

(assert (=> bm!31296 (= call!31299 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!487574 () Bool)

(declare-fun e!286879 () Bool)

(assert (=> b!487574 (= e!286879 call!31299)))

(declare-fun b!487575 () Bool)

(assert (=> b!487575 (= e!286881 e!286879)))

(declare-fun lt!220079 () (_ BitVec 64))

(assert (=> b!487575 (= lt!220079 (select (arr!15179 a!3235) j!176))))

(declare-fun lt!220080 () Unit!14238)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31571 (_ BitVec 64) (_ BitVec 32)) Unit!14238)

(assert (=> b!487575 (= lt!220080 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220079 j!176))))

(assert (=> b!487575 (arrayContainsKey!0 a!3235 lt!220079 #b00000000000000000000000000000000)))

(declare-fun lt!220081 () Unit!14238)

(assert (=> b!487575 (= lt!220081 lt!220080)))

(declare-fun res!290868 () Bool)

(assert (=> b!487575 (= res!290868 (= (seekEntryOrOpen!0 (select (arr!15179 a!3235) j!176) a!3235 mask!3524) (Found!3646 j!176)))))

(assert (=> b!487575 (=> (not res!290868) (not e!286879))))

(assert (= (and d!77665 (not res!290869)) b!487572))

(assert (= (and b!487572 c!58620) b!487575))

(assert (= (and b!487572 (not c!58620)) b!487573))

(assert (= (and b!487575 res!290868) b!487574))

(assert (= (or b!487574 b!487573) bm!31296))

(assert (=> b!487572 m!467247))

(assert (=> b!487572 m!467247))

(assert (=> b!487572 m!467249))

(declare-fun m!467363 () Bool)

(assert (=> bm!31296 m!467363))

(assert (=> b!487575 m!467247))

(declare-fun m!467365 () Bool)

(assert (=> b!487575 m!467365))

(declare-fun m!467367 () Bool)

(assert (=> b!487575 m!467367))

(assert (=> b!487575 m!467247))

(assert (=> b!487575 m!467263))

(assert (=> b!487432 d!77665))

