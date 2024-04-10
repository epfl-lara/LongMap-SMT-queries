; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31384 () Bool)

(assert start!31384)

(declare-fun b!314560 () Bool)

(declare-fun res!170316 () Bool)

(declare-fun e!195883 () Bool)

(assert (=> b!314560 (=> (not res!170316) (not e!195883))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314560 (= res!170316 (validKeyInArray!0 k0!2441))))

(declare-fun e!195881 () Bool)

(declare-datatypes ((array!16055 0))(
  ( (array!16056 (arr!7602 (Array (_ BitVec 32) (_ BitVec 64))) (size!7954 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16055)

(declare-fun b!314561 () Bool)

(declare-datatypes ((SeekEntryResult!2742 0))(
  ( (MissingZero!2742 (index!13144 (_ BitVec 32))) (Found!2742 (index!13145 (_ BitVec 32))) (Intermediate!2742 (undefined!3554 Bool) (index!13146 (_ BitVec 32)) (x!31372 (_ BitVec 32))) (Undefined!2742) (MissingVacant!2742 (index!13147 (_ BitVec 32))) )
))
(declare-fun lt!153927 () SeekEntryResult!2742)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!153926 () SeekEntryResult!2742)

(assert (=> b!314561 (= e!195881 (and (= lt!153927 lt!153926) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7602 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7602 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7602 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!153927 (Intermediate!2742 false index!1781 resX!52)))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16055 (_ BitVec 32)) SeekEntryResult!2742)

(assert (=> b!314561 (= lt!153927 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314562 () Bool)

(declare-fun res!170314 () Bool)

(assert (=> b!314562 (=> (not res!170314) (not e!195883))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314562 (= res!170314 (and (= (size!7954 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7954 a!3293))))))

(declare-fun b!314563 () Bool)

(declare-fun res!170315 () Bool)

(assert (=> b!314563 (=> (not res!170315) (not e!195881))))

(assert (=> b!314563 (= res!170315 (and (= (select (arr!7602 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7954 a!3293))))))

(declare-fun b!314564 () Bool)

(assert (=> b!314564 (= e!195883 e!195881)))

(declare-fun res!170310 () Bool)

(assert (=> b!314564 (=> (not res!170310) (not e!195881))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314564 (= res!170310 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153926))))

(assert (=> b!314564 (= lt!153926 (Intermediate!2742 false resIndex!52 resX!52))))

(declare-fun b!314565 () Bool)

(declare-fun res!170309 () Bool)

(assert (=> b!314565 (=> (not res!170309) (not e!195883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16055 (_ BitVec 32)) Bool)

(assert (=> b!314565 (= res!170309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314566 () Bool)

(declare-fun res!170311 () Bool)

(assert (=> b!314566 (=> (not res!170311) (not e!195883))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16055 (_ BitVec 32)) SeekEntryResult!2742)

(assert (=> b!314566 (= res!170311 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2742 i!1240)))))

(declare-fun b!314567 () Bool)

(declare-fun res!170313 () Bool)

(assert (=> b!314567 (=> (not res!170313) (not e!195883))))

(declare-fun arrayContainsKey!0 (array!16055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314567 (= res!170313 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!170312 () Bool)

(assert (=> start!31384 (=> (not res!170312) (not e!195883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31384 (= res!170312 (validMask!0 mask!3709))))

(assert (=> start!31384 e!195883))

(declare-fun array_inv!5565 (array!16055) Bool)

(assert (=> start!31384 (array_inv!5565 a!3293)))

(assert (=> start!31384 true))

(assert (= (and start!31384 res!170312) b!314562))

(assert (= (and b!314562 res!170314) b!314560))

(assert (= (and b!314560 res!170316) b!314567))

(assert (= (and b!314567 res!170313) b!314566))

(assert (= (and b!314566 res!170311) b!314565))

(assert (= (and b!314565 res!170309) b!314564))

(assert (= (and b!314564 res!170310) b!314563))

(assert (= (and b!314563 res!170315) b!314561))

(declare-fun m!324099 () Bool)

(assert (=> b!314565 m!324099))

(declare-fun m!324101 () Bool)

(assert (=> b!314563 m!324101))

(declare-fun m!324103 () Bool)

(assert (=> start!31384 m!324103))

(declare-fun m!324105 () Bool)

(assert (=> start!31384 m!324105))

(declare-fun m!324107 () Bool)

(assert (=> b!314564 m!324107))

(assert (=> b!314564 m!324107))

(declare-fun m!324109 () Bool)

(assert (=> b!314564 m!324109))

(declare-fun m!324111 () Bool)

(assert (=> b!314560 m!324111))

(declare-fun m!324113 () Bool)

(assert (=> b!314567 m!324113))

(declare-fun m!324115 () Bool)

(assert (=> b!314561 m!324115))

(declare-fun m!324117 () Bool)

(assert (=> b!314561 m!324117))

(declare-fun m!324119 () Bool)

(assert (=> b!314566 m!324119))

(check-sat (not b!314560) (not b!314561) (not b!314564) (not b!314566) (not b!314567) (not b!314565) (not start!31384))
(check-sat)
(get-model)

(declare-fun d!68771 () Bool)

(declare-fun res!170345 () Bool)

(declare-fun e!195897 () Bool)

(assert (=> d!68771 (=> res!170345 e!195897)))

(assert (=> d!68771 (= res!170345 (= (select (arr!7602 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68771 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195897)))

(declare-fun b!314596 () Bool)

(declare-fun e!195898 () Bool)

(assert (=> b!314596 (= e!195897 e!195898)))

(declare-fun res!170346 () Bool)

(assert (=> b!314596 (=> (not res!170346) (not e!195898))))

(assert (=> b!314596 (= res!170346 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7954 a!3293)))))

(declare-fun b!314597 () Bool)

(assert (=> b!314597 (= e!195898 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68771 (not res!170345)) b!314596))

(assert (= (and b!314596 res!170346) b!314597))

(declare-fun m!324143 () Bool)

(assert (=> d!68771 m!324143))

(declare-fun m!324145 () Bool)

(assert (=> b!314597 m!324145))

(assert (=> b!314567 d!68771))

(declare-fun d!68773 () Bool)

(assert (=> d!68773 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31384 d!68773))

(declare-fun d!68775 () Bool)

(assert (=> d!68775 (= (array_inv!5565 a!3293) (bvsge (size!7954 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31384 d!68775))

(declare-fun b!314620 () Bool)

(declare-fun e!195909 () SeekEntryResult!2742)

(declare-fun lt!153946 () SeekEntryResult!2742)

(assert (=> b!314620 (= e!195909 (MissingZero!2742 (index!13146 lt!153946)))))

(declare-fun d!68777 () Bool)

(declare-fun lt!153944 () SeekEntryResult!2742)

(get-info :version)

(assert (=> d!68777 (and (or ((_ is Undefined!2742) lt!153944) (not ((_ is Found!2742) lt!153944)) (and (bvsge (index!13145 lt!153944) #b00000000000000000000000000000000) (bvslt (index!13145 lt!153944) (size!7954 a!3293)))) (or ((_ is Undefined!2742) lt!153944) ((_ is Found!2742) lt!153944) (not ((_ is MissingZero!2742) lt!153944)) (and (bvsge (index!13144 lt!153944) #b00000000000000000000000000000000) (bvslt (index!13144 lt!153944) (size!7954 a!3293)))) (or ((_ is Undefined!2742) lt!153944) ((_ is Found!2742) lt!153944) ((_ is MissingZero!2742) lt!153944) (not ((_ is MissingVacant!2742) lt!153944)) (and (bvsge (index!13147 lt!153944) #b00000000000000000000000000000000) (bvslt (index!13147 lt!153944) (size!7954 a!3293)))) (or ((_ is Undefined!2742) lt!153944) (ite ((_ is Found!2742) lt!153944) (= (select (arr!7602 a!3293) (index!13145 lt!153944)) k0!2441) (ite ((_ is MissingZero!2742) lt!153944) (= (select (arr!7602 a!3293) (index!13144 lt!153944)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2742) lt!153944) (= (select (arr!7602 a!3293) (index!13147 lt!153944)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195910 () SeekEntryResult!2742)

(assert (=> d!68777 (= lt!153944 e!195910)))

(declare-fun c!49749 () Bool)

(assert (=> d!68777 (= c!49749 (and ((_ is Intermediate!2742) lt!153946) (undefined!3554 lt!153946)))))

(assert (=> d!68777 (= lt!153946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68777 (validMask!0 mask!3709)))

(assert (=> d!68777 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153944)))

(declare-fun b!314621 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16055 (_ BitVec 32)) SeekEntryResult!2742)

(assert (=> b!314621 (= e!195909 (seekKeyOrZeroReturnVacant!0 (x!31372 lt!153946) (index!13146 lt!153946) (index!13146 lt!153946) k0!2441 a!3293 mask!3709))))

(declare-fun b!314622 () Bool)

(declare-fun e!195911 () SeekEntryResult!2742)

(assert (=> b!314622 (= e!195911 (Found!2742 (index!13146 lt!153946)))))

(declare-fun b!314623 () Bool)

(assert (=> b!314623 (= e!195910 e!195911)))

(declare-fun lt!153945 () (_ BitVec 64))

(assert (=> b!314623 (= lt!153945 (select (arr!7602 a!3293) (index!13146 lt!153946)))))

(declare-fun c!49750 () Bool)

(assert (=> b!314623 (= c!49750 (= lt!153945 k0!2441))))

(declare-fun b!314624 () Bool)

(declare-fun c!49748 () Bool)

(assert (=> b!314624 (= c!49748 (= lt!153945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314624 (= e!195911 e!195909)))

(declare-fun b!314625 () Bool)

(assert (=> b!314625 (= e!195910 Undefined!2742)))

(assert (= (and d!68777 c!49749) b!314625))

(assert (= (and d!68777 (not c!49749)) b!314623))

(assert (= (and b!314623 c!49750) b!314622))

(assert (= (and b!314623 (not c!49750)) b!314624))

(assert (= (and b!314624 c!49748) b!314620))

(assert (= (and b!314624 (not c!49748)) b!314621))

(declare-fun m!324147 () Bool)

(assert (=> d!68777 m!324147))

(declare-fun m!324149 () Bool)

(assert (=> d!68777 m!324149))

(assert (=> d!68777 m!324107))

(declare-fun m!324151 () Bool)

(assert (=> d!68777 m!324151))

(assert (=> d!68777 m!324107))

(assert (=> d!68777 m!324109))

(assert (=> d!68777 m!324103))

(declare-fun m!324153 () Bool)

(assert (=> b!314621 m!324153))

(declare-fun m!324155 () Bool)

(assert (=> b!314623 m!324155))

(assert (=> b!314566 d!68777))

(declare-fun b!314694 () Bool)

(declare-fun lt!153965 () SeekEntryResult!2742)

(assert (=> b!314694 (and (bvsge (index!13146 lt!153965) #b00000000000000000000000000000000) (bvslt (index!13146 lt!153965) (size!7954 a!3293)))))

(declare-fun e!195955 () Bool)

(assert (=> b!314694 (= e!195955 (= (select (arr!7602 a!3293) (index!13146 lt!153965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314695 () Bool)

(declare-fun e!195956 () Bool)

(declare-fun e!195957 () Bool)

(assert (=> b!314695 (= e!195956 e!195957)))

(declare-fun res!170380 () Bool)

(assert (=> b!314695 (= res!170380 (and ((_ is Intermediate!2742) lt!153965) (not (undefined!3554 lt!153965)) (bvslt (x!31372 lt!153965) #b01111111111111111111111111111110) (bvsge (x!31372 lt!153965) #b00000000000000000000000000000000) (bvsge (x!31372 lt!153965) x!1427)))))

(assert (=> b!314695 (=> (not res!170380) (not e!195957))))

(declare-fun d!68785 () Bool)

(assert (=> d!68785 e!195956))

(declare-fun c!49771 () Bool)

(assert (=> d!68785 (= c!49771 (and ((_ is Intermediate!2742) lt!153965) (undefined!3554 lt!153965)))))

(declare-fun e!195954 () SeekEntryResult!2742)

(assert (=> d!68785 (= lt!153965 e!195954)))

(declare-fun c!49773 () Bool)

(assert (=> d!68785 (= c!49773 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153966 () (_ BitVec 64))

(assert (=> d!68785 (= lt!153966 (select (arr!7602 a!3293) index!1781))))

(assert (=> d!68785 (validMask!0 mask!3709)))

(assert (=> d!68785 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153965)))

(declare-fun b!314696 () Bool)

(assert (=> b!314696 (and (bvsge (index!13146 lt!153965) #b00000000000000000000000000000000) (bvslt (index!13146 lt!153965) (size!7954 a!3293)))))

(declare-fun res!170378 () Bool)

(assert (=> b!314696 (= res!170378 (= (select (arr!7602 a!3293) (index!13146 lt!153965)) k0!2441))))

(assert (=> b!314696 (=> res!170378 e!195955)))

(assert (=> b!314696 (= e!195957 e!195955)))

(declare-fun b!314697 () Bool)

(assert (=> b!314697 (and (bvsge (index!13146 lt!153965) #b00000000000000000000000000000000) (bvslt (index!13146 lt!153965) (size!7954 a!3293)))))

(declare-fun res!170379 () Bool)

(assert (=> b!314697 (= res!170379 (= (select (arr!7602 a!3293) (index!13146 lt!153965)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314697 (=> res!170379 e!195955)))

(declare-fun b!314698 () Bool)

(declare-fun e!195958 () SeekEntryResult!2742)

(assert (=> b!314698 (= e!195954 e!195958)))

(declare-fun c!49772 () Bool)

(assert (=> b!314698 (= c!49772 (or (= lt!153966 k0!2441) (= (bvadd lt!153966 lt!153966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314699 () Bool)

(assert (=> b!314699 (= e!195954 (Intermediate!2742 true index!1781 x!1427))))

(declare-fun b!314700 () Bool)

(assert (=> b!314700 (= e!195956 (bvsge (x!31372 lt!153965) #b01111111111111111111111111111110))))

(declare-fun b!314701 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314701 (= e!195958 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314702 () Bool)

(assert (=> b!314702 (= e!195958 (Intermediate!2742 false index!1781 x!1427))))

(assert (= (and d!68785 c!49773) b!314699))

(assert (= (and d!68785 (not c!49773)) b!314698))

(assert (= (and b!314698 c!49772) b!314702))

(assert (= (and b!314698 (not c!49772)) b!314701))

(assert (= (and d!68785 c!49771) b!314700))

(assert (= (and d!68785 (not c!49771)) b!314695))

(assert (= (and b!314695 res!170380) b!314696))

(assert (= (and b!314696 (not res!170378)) b!314697))

(assert (= (and b!314697 (not res!170379)) b!314694))

(declare-fun m!324175 () Bool)

(assert (=> b!314694 m!324175))

(assert (=> b!314697 m!324175))

(assert (=> d!68785 m!324115))

(assert (=> d!68785 m!324103))

(assert (=> b!314696 m!324175))

(declare-fun m!324177 () Bool)

(assert (=> b!314701 m!324177))

(assert (=> b!314701 m!324177))

(declare-fun m!324179 () Bool)

(assert (=> b!314701 m!324179))

(assert (=> b!314561 d!68785))

(declare-fun d!68797 () Bool)

(assert (=> d!68797 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314560 d!68797))

(declare-fun b!314741 () Bool)

(declare-fun e!195983 () Bool)

(declare-fun e!195981 () Bool)

(assert (=> b!314741 (= e!195983 e!195981)))

(declare-fun lt!153989 () (_ BitVec 64))

(assert (=> b!314741 (= lt!153989 (select (arr!7602 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9693 0))(
  ( (Unit!9694) )
))
(declare-fun lt!153991 () Unit!9693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16055 (_ BitVec 64) (_ BitVec 32)) Unit!9693)

(assert (=> b!314741 (= lt!153991 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153989 #b00000000000000000000000000000000))))

(assert (=> b!314741 (arrayContainsKey!0 a!3293 lt!153989 #b00000000000000000000000000000000)))

(declare-fun lt!153990 () Unit!9693)

(assert (=> b!314741 (= lt!153990 lt!153991)))

(declare-fun res!170392 () Bool)

(assert (=> b!314741 (= res!170392 (= (seekEntryOrOpen!0 (select (arr!7602 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2742 #b00000000000000000000000000000000)))))

(assert (=> b!314741 (=> (not res!170392) (not e!195981))))

(declare-fun b!314742 () Bool)

(declare-fun call!25975 () Bool)

(assert (=> b!314742 (= e!195983 call!25975)))

(declare-fun d!68799 () Bool)

(declare-fun res!170393 () Bool)

(declare-fun e!195982 () Bool)

(assert (=> d!68799 (=> res!170393 e!195982)))

(assert (=> d!68799 (= res!170393 (bvsge #b00000000000000000000000000000000 (size!7954 a!3293)))))

(assert (=> d!68799 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195982)))

(declare-fun bm!25972 () Bool)

(assert (=> bm!25972 (= call!25975 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!314743 () Bool)

(assert (=> b!314743 (= e!195982 e!195983)))

(declare-fun c!49788 () Bool)

(assert (=> b!314743 (= c!49788 (validKeyInArray!0 (select (arr!7602 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!314744 () Bool)

(assert (=> b!314744 (= e!195981 call!25975)))

(assert (= (and d!68799 (not res!170393)) b!314743))

(assert (= (and b!314743 c!49788) b!314741))

(assert (= (and b!314743 (not c!49788)) b!314742))

(assert (= (and b!314741 res!170392) b!314744))

(assert (= (or b!314744 b!314742) bm!25972))

(assert (=> b!314741 m!324143))

(declare-fun m!324195 () Bool)

(assert (=> b!314741 m!324195))

(declare-fun m!324197 () Bool)

(assert (=> b!314741 m!324197))

(assert (=> b!314741 m!324143))

(declare-fun m!324199 () Bool)

(assert (=> b!314741 m!324199))

(declare-fun m!324201 () Bool)

(assert (=> bm!25972 m!324201))

(assert (=> b!314743 m!324143))

(assert (=> b!314743 m!324143))

(declare-fun m!324203 () Bool)

(assert (=> b!314743 m!324203))

(assert (=> b!314565 d!68799))

(declare-fun b!314745 () Bool)

(declare-fun lt!153992 () SeekEntryResult!2742)

(assert (=> b!314745 (and (bvsge (index!13146 lt!153992) #b00000000000000000000000000000000) (bvslt (index!13146 lt!153992) (size!7954 a!3293)))))

(declare-fun e!195985 () Bool)

(assert (=> b!314745 (= e!195985 (= (select (arr!7602 a!3293) (index!13146 lt!153992)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314746 () Bool)

(declare-fun e!195986 () Bool)

(declare-fun e!195987 () Bool)

(assert (=> b!314746 (= e!195986 e!195987)))

(declare-fun res!170396 () Bool)

(assert (=> b!314746 (= res!170396 (and ((_ is Intermediate!2742) lt!153992) (not (undefined!3554 lt!153992)) (bvslt (x!31372 lt!153992) #b01111111111111111111111111111110) (bvsge (x!31372 lt!153992) #b00000000000000000000000000000000) (bvsge (x!31372 lt!153992) #b00000000000000000000000000000000)))))

(assert (=> b!314746 (=> (not res!170396) (not e!195987))))

(declare-fun d!68807 () Bool)

(assert (=> d!68807 e!195986))

(declare-fun c!49789 () Bool)

(assert (=> d!68807 (= c!49789 (and ((_ is Intermediate!2742) lt!153992) (undefined!3554 lt!153992)))))

(declare-fun e!195984 () SeekEntryResult!2742)

(assert (=> d!68807 (= lt!153992 e!195984)))

(declare-fun c!49791 () Bool)

(assert (=> d!68807 (= c!49791 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153993 () (_ BitVec 64))

(assert (=> d!68807 (= lt!153993 (select (arr!7602 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68807 (validMask!0 mask!3709)))

(assert (=> d!68807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153992)))

(declare-fun b!314747 () Bool)

(assert (=> b!314747 (and (bvsge (index!13146 lt!153992) #b00000000000000000000000000000000) (bvslt (index!13146 lt!153992) (size!7954 a!3293)))))

(declare-fun res!170394 () Bool)

(assert (=> b!314747 (= res!170394 (= (select (arr!7602 a!3293) (index!13146 lt!153992)) k0!2441))))

(assert (=> b!314747 (=> res!170394 e!195985)))

(assert (=> b!314747 (= e!195987 e!195985)))

(declare-fun b!314748 () Bool)

(assert (=> b!314748 (and (bvsge (index!13146 lt!153992) #b00000000000000000000000000000000) (bvslt (index!13146 lt!153992) (size!7954 a!3293)))))

(declare-fun res!170395 () Bool)

(assert (=> b!314748 (= res!170395 (= (select (arr!7602 a!3293) (index!13146 lt!153992)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314748 (=> res!170395 e!195985)))

(declare-fun b!314749 () Bool)

(declare-fun e!195988 () SeekEntryResult!2742)

(assert (=> b!314749 (= e!195984 e!195988)))

(declare-fun c!49790 () Bool)

(assert (=> b!314749 (= c!49790 (or (= lt!153993 k0!2441) (= (bvadd lt!153993 lt!153993) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314750 () Bool)

(assert (=> b!314750 (= e!195984 (Intermediate!2742 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314751 () Bool)

(assert (=> b!314751 (= e!195986 (bvsge (x!31372 lt!153992) #b01111111111111111111111111111110))))

(declare-fun b!314752 () Bool)

(assert (=> b!314752 (= e!195988 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314753 () Bool)

(assert (=> b!314753 (= e!195988 (Intermediate!2742 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68807 c!49791) b!314750))

(assert (= (and d!68807 (not c!49791)) b!314749))

(assert (= (and b!314749 c!49790) b!314753))

(assert (= (and b!314749 (not c!49790)) b!314752))

(assert (= (and d!68807 c!49789) b!314751))

(assert (= (and d!68807 (not c!49789)) b!314746))

(assert (= (and b!314746 res!170396) b!314747))

(assert (= (and b!314747 (not res!170394)) b!314748))

(assert (= (and b!314748 (not res!170395)) b!314745))

(declare-fun m!324205 () Bool)

(assert (=> b!314745 m!324205))

(assert (=> b!314748 m!324205))

(assert (=> d!68807 m!324107))

(declare-fun m!324207 () Bool)

(assert (=> d!68807 m!324207))

(assert (=> d!68807 m!324103))

(assert (=> b!314747 m!324205))

(assert (=> b!314752 m!324107))

(declare-fun m!324209 () Bool)

(assert (=> b!314752 m!324209))

(assert (=> b!314752 m!324209))

(declare-fun m!324211 () Bool)

(assert (=> b!314752 m!324211))

(assert (=> b!314564 d!68807))

(declare-fun d!68809 () Bool)

(declare-fun lt!154008 () (_ BitVec 32))

(declare-fun lt!154007 () (_ BitVec 32))

(assert (=> d!68809 (= lt!154008 (bvmul (bvxor lt!154007 (bvlshr lt!154007 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68809 (= lt!154007 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68809 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170397 (let ((h!5363 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31379 (bvmul (bvxor h!5363 (bvlshr h!5363 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31379 (bvlshr x!31379 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170397 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170397 #b00000000000000000000000000000000))))))

(assert (=> d!68809 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154008 (bvlshr lt!154008 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314564 d!68809))

(check-sat (not b!314741) (not d!68777) (not b!314621) (not b!314752) (not d!68807) (not bm!25972) (not b!314597) (not d!68785) (not b!314743) (not b!314701))
(check-sat)
