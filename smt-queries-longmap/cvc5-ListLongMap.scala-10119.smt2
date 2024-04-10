; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119208 () Bool)

(assert start!119208)

(declare-fun b!1390560 () Bool)

(declare-fun res!930723 () Bool)

(declare-fun e!787472 () Bool)

(assert (=> b!1390560 (=> (not res!930723) (not e!787472))))

(declare-datatypes ((array!95145 0))(
  ( (array!95146 (arr!45938 (Array (_ BitVec 32) (_ BitVec 64))) (size!46488 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95145)

(declare-datatypes ((List!32457 0))(
  ( (Nil!32454) (Cons!32453 (h!33671 (_ BitVec 64)) (t!47151 List!32457)) )
))
(declare-fun arrayNoDuplicates!0 (array!95145 (_ BitVec 32) List!32457) Bool)

(assert (=> b!1390560 (= res!930723 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32454))))

(declare-fun b!1390561 () Bool)

(declare-fun res!930724 () Bool)

(assert (=> b!1390561 (=> (not res!930724) (not e!787472))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95145 (_ BitVec 32)) Bool)

(assert (=> b!1390561 (= res!930724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390562 () Bool)

(declare-fun res!930725 () Bool)

(assert (=> b!1390562 (=> (not res!930725) (not e!787472))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390562 (= res!930725 (validKeyInArray!0 (select (arr!45938 a!2901) i!1037)))))

(declare-fun b!1390563 () Bool)

(declare-fun res!930727 () Bool)

(assert (=> b!1390563 (=> (not res!930727) (not e!787472))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390563 (= res!930727 (and (= (size!46488 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46488 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46488 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390564 () Bool)

(declare-fun res!930721 () Bool)

(assert (=> b!1390564 (=> (not res!930721) (not e!787472))))

(assert (=> b!1390564 (= res!930721 (validKeyInArray!0 (select (arr!45938 a!2901) j!112)))))

(declare-fun b!1390565 () Bool)

(declare-fun e!787471 () Bool)

(declare-datatypes ((SeekEntryResult!10255 0))(
  ( (MissingZero!10255 (index!43391 (_ BitVec 32))) (Found!10255 (index!43392 (_ BitVec 32))) (Intermediate!10255 (undefined!11067 Bool) (index!43393 (_ BitVec 32)) (x!125069 (_ BitVec 32))) (Undefined!10255) (MissingVacant!10255 (index!43394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95145 (_ BitVec 32)) SeekEntryResult!10255)

(assert (=> b!1390565 (= e!787471 (= (seekEntryOrOpen!0 (select (arr!45938 a!2901) j!112) a!2901 mask!2840) (Found!10255 j!112)))))

(declare-fun b!1390566 () Bool)

(declare-fun lt!610859 () SeekEntryResult!10255)

(assert (=> b!1390566 (= e!787472 (not (or (not (is-Intermediate!10255 lt!610859)) (undefined!11067 lt!610859) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(assert (=> b!1390566 e!787471))

(declare-fun res!930722 () Bool)

(assert (=> b!1390566 (=> (not res!930722) (not e!787471))))

(assert (=> b!1390566 (= res!930722 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46514 0))(
  ( (Unit!46515) )
))
(declare-fun lt!610860 () Unit!46514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46514)

(assert (=> b!1390566 (= lt!610860 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95145 (_ BitVec 32)) SeekEntryResult!10255)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390566 (= lt!610859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45938 a!2901) j!112) mask!2840) (select (arr!45938 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!930726 () Bool)

(assert (=> start!119208 (=> (not res!930726) (not e!787472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119208 (= res!930726 (validMask!0 mask!2840))))

(assert (=> start!119208 e!787472))

(assert (=> start!119208 true))

(declare-fun array_inv!34966 (array!95145) Bool)

(assert (=> start!119208 (array_inv!34966 a!2901)))

(assert (= (and start!119208 res!930726) b!1390563))

(assert (= (and b!1390563 res!930727) b!1390562))

(assert (= (and b!1390562 res!930725) b!1390564))

(assert (= (and b!1390564 res!930721) b!1390561))

(assert (= (and b!1390561 res!930724) b!1390560))

(assert (= (and b!1390560 res!930723) b!1390566))

(assert (= (and b!1390566 res!930722) b!1390565))

(declare-fun m!1276437 () Bool)

(assert (=> b!1390564 m!1276437))

(assert (=> b!1390564 m!1276437))

(declare-fun m!1276439 () Bool)

(assert (=> b!1390564 m!1276439))

(declare-fun m!1276441 () Bool)

(assert (=> start!119208 m!1276441))

(declare-fun m!1276443 () Bool)

(assert (=> start!119208 m!1276443))

(assert (=> b!1390566 m!1276437))

(declare-fun m!1276445 () Bool)

(assert (=> b!1390566 m!1276445))

(assert (=> b!1390566 m!1276437))

(declare-fun m!1276447 () Bool)

(assert (=> b!1390566 m!1276447))

(assert (=> b!1390566 m!1276445))

(assert (=> b!1390566 m!1276437))

(declare-fun m!1276449 () Bool)

(assert (=> b!1390566 m!1276449))

(declare-fun m!1276451 () Bool)

(assert (=> b!1390566 m!1276451))

(assert (=> b!1390565 m!1276437))

(assert (=> b!1390565 m!1276437))

(declare-fun m!1276453 () Bool)

(assert (=> b!1390565 m!1276453))

(declare-fun m!1276455 () Bool)

(assert (=> b!1390561 m!1276455))

(declare-fun m!1276457 () Bool)

(assert (=> b!1390562 m!1276457))

(assert (=> b!1390562 m!1276457))

(declare-fun m!1276459 () Bool)

(assert (=> b!1390562 m!1276459))

(declare-fun m!1276461 () Bool)

(assert (=> b!1390560 m!1276461))

(push 1)

(assert (not start!119208))

(assert (not b!1390562))

(assert (not b!1390564))

(assert (not b!1390565))

(assert (not b!1390560))

(assert (not b!1390561))

(assert (not b!1390566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1390634 () Bool)

(declare-fun e!787513 () Bool)

(declare-fun call!66703 () Bool)

(assert (=> b!1390634 (= e!787513 call!66703)))

(declare-fun bm!66700 () Bool)

(declare-fun c!129369 () Bool)

(assert (=> bm!66700 (= call!66703 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129369 (Cons!32453 (select (arr!45938 a!2901) #b00000000000000000000000000000000) Nil!32454) Nil!32454)))))

(declare-fun b!1390635 () Bool)

(declare-fun e!787512 () Bool)

(declare-fun contains!9763 (List!32457 (_ BitVec 64)) Bool)

(assert (=> b!1390635 (= e!787512 (contains!9763 Nil!32454 (select (arr!45938 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150201 () Bool)

(declare-fun res!930785 () Bool)

(declare-fun e!787511 () Bool)

(assert (=> d!150201 (=> res!930785 e!787511)))

(assert (=> d!150201 (= res!930785 (bvsge #b00000000000000000000000000000000 (size!46488 a!2901)))))

(assert (=> d!150201 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32454) e!787511)))

(declare-fun b!1390636 () Bool)

(declare-fun e!787514 () Bool)

(assert (=> b!1390636 (= e!787511 e!787514)))

(declare-fun res!930786 () Bool)

(assert (=> b!1390636 (=> (not res!930786) (not e!787514))))

(assert (=> b!1390636 (= res!930786 (not e!787512))))

(declare-fun res!930787 () Bool)

(assert (=> b!1390636 (=> (not res!930787) (not e!787512))))

(assert (=> b!1390636 (= res!930787 (validKeyInArray!0 (select (arr!45938 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390637 () Bool)

(assert (=> b!1390637 (= e!787514 e!787513)))

(assert (=> b!1390637 (= c!129369 (validKeyInArray!0 (select (arr!45938 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390638 () Bool)

(assert (=> b!1390638 (= e!787513 call!66703)))

(assert (= (and d!150201 (not res!930785)) b!1390636))

(assert (= (and b!1390636 res!930787) b!1390635))

(assert (= (and b!1390636 res!930786) b!1390637))

(assert (= (and b!1390637 c!129369) b!1390638))

(assert (= (and b!1390637 (not c!129369)) b!1390634))

(assert (= (or b!1390638 b!1390634) bm!66700))

(declare-fun m!1276523 () Bool)

(assert (=> bm!66700 m!1276523))

(declare-fun m!1276525 () Bool)

(assert (=> bm!66700 m!1276525))

(assert (=> b!1390635 m!1276523))

(assert (=> b!1390635 m!1276523))

(declare-fun m!1276527 () Bool)

(assert (=> b!1390635 m!1276527))

(assert (=> b!1390636 m!1276523))

(assert (=> b!1390636 m!1276523))

(declare-fun m!1276529 () Bool)

(assert (=> b!1390636 m!1276529))

(assert (=> b!1390637 m!1276523))

(assert (=> b!1390637 m!1276523))

(assert (=> b!1390637 m!1276529))

(assert (=> b!1390560 d!150201))

(declare-fun b!1390663 () Bool)

(declare-fun e!787530 () SeekEntryResult!10255)

(declare-fun lt!610893 () SeekEntryResult!10255)

(assert (=> b!1390663 (= e!787530 (Found!10255 (index!43393 lt!610893)))))

(declare-fun d!150207 () Bool)

(declare-fun lt!610891 () SeekEntryResult!10255)

(assert (=> d!150207 (and (or (is-Undefined!10255 lt!610891) (not (is-Found!10255 lt!610891)) (and (bvsge (index!43392 lt!610891) #b00000000000000000000000000000000) (bvslt (index!43392 lt!610891) (size!46488 a!2901)))) (or (is-Undefined!10255 lt!610891) (is-Found!10255 lt!610891) (not (is-MissingZero!10255 lt!610891)) (and (bvsge (index!43391 lt!610891) #b00000000000000000000000000000000) (bvslt (index!43391 lt!610891) (size!46488 a!2901)))) (or (is-Undefined!10255 lt!610891) (is-Found!10255 lt!610891) (is-MissingZero!10255 lt!610891) (not (is-MissingVacant!10255 lt!610891)) (and (bvsge (index!43394 lt!610891) #b00000000000000000000000000000000) (bvslt (index!43394 lt!610891) (size!46488 a!2901)))) (or (is-Undefined!10255 lt!610891) (ite (is-Found!10255 lt!610891) (= (select (arr!45938 a!2901) (index!43392 lt!610891)) (select (arr!45938 a!2901) j!112)) (ite (is-MissingZero!10255 lt!610891) (= (select (arr!45938 a!2901) (index!43391 lt!610891)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10255 lt!610891) (= (select (arr!45938 a!2901) (index!43394 lt!610891)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!787531 () SeekEntryResult!10255)

(assert (=> d!150207 (= lt!610891 e!787531)))

(declare-fun c!129380 () Bool)

(assert (=> d!150207 (= c!129380 (and (is-Intermediate!10255 lt!610893) (undefined!11067 lt!610893)))))

(assert (=> d!150207 (= lt!610893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45938 a!2901) j!112) mask!2840) (select (arr!45938 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150207 (validMask!0 mask!2840)))

(assert (=> d!150207 (= (seekEntryOrOpen!0 (select (arr!45938 a!2901) j!112) a!2901 mask!2840) lt!610891)))

(declare-fun e!787532 () SeekEntryResult!10255)

(declare-fun b!1390664 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95145 (_ BitVec 32)) SeekEntryResult!10255)

(assert (=> b!1390664 (= e!787532 (seekKeyOrZeroReturnVacant!0 (x!125069 lt!610893) (index!43393 lt!610893) (index!43393 lt!610893) (select (arr!45938 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390665 () Bool)

(assert (=> b!1390665 (= e!787532 (MissingZero!10255 (index!43393 lt!610893)))))

(declare-fun b!1390666 () Bool)

(assert (=> b!1390666 (= e!787531 e!787530)))

(declare-fun lt!610892 () (_ BitVec 64))

(assert (=> b!1390666 (= lt!610892 (select (arr!45938 a!2901) (index!43393 lt!610893)))))

(declare-fun c!129381 () Bool)

(assert (=> b!1390666 (= c!129381 (= lt!610892 (select (arr!45938 a!2901) j!112)))))

(declare-fun b!1390667 () Bool)

(declare-fun c!129379 () Bool)

(assert (=> b!1390667 (= c!129379 (= lt!610892 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1390667 (= e!787530 e!787532)))

(declare-fun b!1390668 () Bool)

(assert (=> b!1390668 (= e!787531 Undefined!10255)))

(assert (= (and d!150207 c!129380) b!1390668))

(assert (= (and d!150207 (not c!129380)) b!1390666))

(assert (= (and b!1390666 c!129381) b!1390663))

(assert (= (and b!1390666 (not c!129381)) b!1390667))

(assert (= (and b!1390667 c!129379) b!1390665))

(assert (= (and b!1390667 (not c!129379)) b!1390664))

(declare-fun m!1276539 () Bool)

(assert (=> d!150207 m!1276539))

(assert (=> d!150207 m!1276441))

(assert (=> d!150207 m!1276445))

(assert (=> d!150207 m!1276437))

(assert (=> d!150207 m!1276449))

(assert (=> d!150207 m!1276437))

(assert (=> d!150207 m!1276445))

(declare-fun m!1276541 () Bool)

(assert (=> d!150207 m!1276541))

(declare-fun m!1276543 () Bool)

(assert (=> d!150207 m!1276543))

(assert (=> b!1390664 m!1276437))

(declare-fun m!1276545 () Bool)

(assert (=> b!1390664 m!1276545))

(declare-fun m!1276547 () Bool)

(assert (=> b!1390666 m!1276547))

(assert (=> b!1390565 d!150207))

(declare-fun bm!66706 () Bool)

(declare-fun call!66709 () Bool)

(assert (=> bm!66706 (= call!66709 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1390722 () Bool)

(declare-fun e!787564 () Bool)

(assert (=> b!1390722 (= e!787564 call!66709)))

(declare-fun b!1390723 () Bool)

(declare-fun e!787563 () Bool)

(assert (=> b!1390723 (= e!787563 call!66709)))

(declare-fun b!1390724 () Bool)

(declare-fun e!787565 () Bool)

(assert (=> b!1390724 (= e!787565 e!787563)))

(declare-fun c!129402 () Bool)

(assert (=> b!1390724 (= c!129402 (validKeyInArray!0 (select (arr!45938 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150217 () Bool)

(declare-fun res!930807 () Bool)

(assert (=> d!150217 (=> res!930807 e!787565)))

(assert (=> d!150217 (= res!930807 (bvsge #b00000000000000000000000000000000 (size!46488 a!2901)))))

(assert (=> d!150217 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787565)))

(declare-fun b!1390725 () Bool)

(assert (=> b!1390725 (= e!787563 e!787564)))

(declare-fun lt!610916 () (_ BitVec 64))

(assert (=> b!1390725 (= lt!610916 (select (arr!45938 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!610915 () Unit!46514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95145 (_ BitVec 64) (_ BitVec 32)) Unit!46514)

(assert (=> b!1390725 (= lt!610915 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610916 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1390725 (arrayContainsKey!0 a!2901 lt!610916 #b00000000000000000000000000000000)))

(declare-fun lt!610917 () Unit!46514)

(assert (=> b!1390725 (= lt!610917 lt!610915)))

(declare-fun res!930808 () Bool)

(assert (=> b!1390725 (= res!930808 (= (seekEntryOrOpen!0 (select (arr!45938 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10255 #b00000000000000000000000000000000)))))

(assert (=> b!1390725 (=> (not res!930808) (not e!787564))))

(assert (= (and d!150217 (not res!930807)) b!1390724))

(assert (= (and b!1390724 c!129402) b!1390725))

(assert (= (and b!1390724 (not c!129402)) b!1390723))

(assert (= (and b!1390725 res!930808) b!1390722))

(assert (= (or b!1390722 b!1390723) bm!66706))

(declare-fun m!1276567 () Bool)

(assert (=> bm!66706 m!1276567))

(assert (=> b!1390724 m!1276523))

(assert (=> b!1390724 m!1276523))

(assert (=> b!1390724 m!1276529))

(assert (=> b!1390725 m!1276523))

(declare-fun m!1276569 () Bool)

(assert (=> b!1390725 m!1276569))

(declare-fun m!1276571 () Bool)

(assert (=> b!1390725 m!1276571))

(assert (=> b!1390725 m!1276523))

(declare-fun m!1276573 () Bool)

(assert (=> b!1390725 m!1276573))

(assert (=> b!1390561 d!150217))

(declare-fun call!66710 () Bool)

(declare-fun bm!66707 () Bool)

(assert (=> bm!66707 (= call!66710 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1390726 () Bool)

(declare-fun e!787567 () Bool)

(assert (=> b!1390726 (= e!787567 call!66710)))

(declare-fun b!1390727 () Bool)

(declare-fun e!787566 () Bool)

(assert (=> b!1390727 (= e!787566 call!66710)))

(declare-fun b!1390728 () Bool)

(declare-fun e!787568 () Bool)

(assert (=> b!1390728 (= e!787568 e!787566)))

(declare-fun c!129403 () Bool)

(assert (=> b!1390728 (= c!129403 (validKeyInArray!0 (select (arr!45938 a!2901) j!112)))))

(declare-fun d!150223 () Bool)

(declare-fun res!930810 () Bool)

(assert (=> d!150223 (=> res!930810 e!787568)))

(assert (=> d!150223 (= res!930810 (bvsge j!112 (size!46488 a!2901)))))

(assert (=> d!150223 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!787568)))

(declare-fun b!1390729 () Bool)

(assert (=> b!1390729 (= e!787566 e!787567)))

(declare-fun lt!610919 () (_ BitVec 64))

(assert (=> b!1390729 (= lt!610919 (select (arr!45938 a!2901) j!112))))

(declare-fun lt!610918 () Unit!46514)

(assert (=> b!1390729 (= lt!610918 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610919 j!112))))

(assert (=> b!1390729 (arrayContainsKey!0 a!2901 lt!610919 #b00000000000000000000000000000000)))

(declare-fun lt!610920 () Unit!46514)

(assert (=> b!1390729 (= lt!610920 lt!610918)))

(declare-fun res!930811 () Bool)

(assert (=> b!1390729 (= res!930811 (= (seekEntryOrOpen!0 (select (arr!45938 a!2901) j!112) a!2901 mask!2840) (Found!10255 j!112)))))

(assert (=> b!1390729 (=> (not res!930811) (not e!787567))))

(assert (= (and d!150223 (not res!930810)) b!1390728))

(assert (= (and b!1390728 c!129403) b!1390729))

(assert (= (and b!1390728 (not c!129403)) b!1390727))

(assert (= (and b!1390729 res!930811) b!1390726))

(assert (= (or b!1390726 b!1390727) bm!66707))

(declare-fun m!1276575 () Bool)

(assert (=> bm!66707 m!1276575))

(assert (=> b!1390728 m!1276437))

(assert (=> b!1390728 m!1276437))

(assert (=> b!1390728 m!1276439))

(assert (=> b!1390729 m!1276437))

(declare-fun m!1276577 () Bool)

(assert (=> b!1390729 m!1276577))

(declare-fun m!1276579 () Bool)

(assert (=> b!1390729 m!1276579))

(assert (=> b!1390729 m!1276437))

(assert (=> b!1390729 m!1276453))

(assert (=> b!1390566 d!150223))

(declare-fun d!150225 () Bool)

(assert (=> d!150225 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!610935 () Unit!46514)

(declare-fun choose!38 (array!95145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46514)

(assert (=> d!150225 (= lt!610935 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150225 (validMask!0 mask!2840)))

(assert (=> d!150225 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!610935)))

(declare-fun bs!40455 () Bool)

(assert (= bs!40455 d!150225))

(assert (=> bs!40455 m!1276451))

(declare-fun m!1276581 () Bool)

(assert (=> bs!40455 m!1276581))

(assert (=> bs!40455 m!1276441))

(assert (=> b!1390566 d!150225))

(declare-fun b!1390786 () Bool)

(declare-fun lt!610960 () SeekEntryResult!10255)

(assert (=> b!1390786 (and (bvsge (index!43393 lt!610960) #b00000000000000000000000000000000) (bvslt (index!43393 lt!610960) (size!46488 a!2901)))))

(declare-fun res!930824 () Bool)

(assert (=> b!1390786 (= res!930824 (= (select (arr!45938 a!2901) (index!43393 lt!610960)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787604 () Bool)

(assert (=> b!1390786 (=> res!930824 e!787604)))

(declare-fun b!1390787 () Bool)

(declare-fun e!787603 () SeekEntryResult!10255)

(assert (=> b!1390787 (= e!787603 (Intermediate!10255 false (toIndex!0 (select (arr!45938 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1390788 () Bool)

(declare-fun e!787605 () Bool)

(assert (=> b!1390788 (= e!787605 (bvsge (x!125069 lt!610960) #b01111111111111111111111111111110))))

(declare-fun b!1390789 () Bool)

(assert (=> b!1390789 (and (bvsge (index!43393 lt!610960) #b00000000000000000000000000000000) (bvslt (index!43393 lt!610960) (size!46488 a!2901)))))

(assert (=> b!1390789 (= e!787604 (= (select (arr!45938 a!2901) (index!43393 lt!610960)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1390790 () Bool)

(assert (=> b!1390790 (and (bvsge (index!43393 lt!610960) #b00000000000000000000000000000000) (bvslt (index!43393 lt!610960) (size!46488 a!2901)))))

(declare-fun res!930825 () Bool)

(assert (=> b!1390790 (= res!930825 (= (select (arr!45938 a!2901) (index!43393 lt!610960)) (select (arr!45938 a!2901) j!112)))))

(assert (=> b!1390790 (=> res!930825 e!787604)))

(declare-fun e!787601 () Bool)

(assert (=> b!1390790 (= e!787601 e!787604)))

(declare-fun d!150229 () Bool)

(assert (=> d!150229 e!787605))

(declare-fun c!129426 () Bool)

(assert (=> d!150229 (= c!129426 (and (is-Intermediate!10255 lt!610960) (undefined!11067 lt!610960)))))

(declare-fun e!787602 () SeekEntryResult!10255)

(assert (=> d!150229 (= lt!610960 e!787602)))

(declare-fun c!129427 () Bool)

(assert (=> d!150229 (= c!129427 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!610959 () (_ BitVec 64))

(assert (=> d!150229 (= lt!610959 (select (arr!45938 a!2901) (toIndex!0 (select (arr!45938 a!2901) j!112) mask!2840)))))

(assert (=> d!150229 (validMask!0 mask!2840)))

(assert (=> d!150229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45938 a!2901) j!112) mask!2840) (select (arr!45938 a!2901) j!112) a!2901 mask!2840) lt!610960)))

(declare-fun b!1390791 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390791 (= e!787603 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45938 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45938 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390792 () Bool)

(assert (=> b!1390792 (= e!787602 (Intermediate!10255 true (toIndex!0 (select (arr!45938 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1390793 () Bool)

(assert (=> b!1390793 (= e!787602 e!787603)))

(declare-fun c!129428 () Bool)

(assert (=> b!1390793 (= c!129428 (or (= lt!610959 (select (arr!45938 a!2901) j!112)) (= (bvadd lt!610959 lt!610959) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1390794 () Bool)

(assert (=> b!1390794 (= e!787605 e!787601)))

(declare-fun res!930826 () Bool)

(assert (=> b!1390794 (= res!930826 (and (is-Intermediate!10255 lt!610960) (not (undefined!11067 lt!610960)) (bvslt (x!125069 lt!610960) #b01111111111111111111111111111110) (bvsge (x!125069 lt!610960) #b00000000000000000000000000000000) (bvsge (x!125069 lt!610960) #b00000000000000000000000000000000)))))

(assert (=> b!1390794 (=> (not res!930826) (not e!787601))))

(assert (= (and d!150229 c!129427) b!1390792))

(assert (= (and d!150229 (not c!129427)) b!1390793))

(assert (= (and b!1390793 c!129428) b!1390787))

(assert (= (and b!1390793 (not c!129428)) b!1390791))

(assert (= (and d!150229 c!129426) b!1390788))

(assert (= (and d!150229 (not c!129426)) b!1390794))

(assert (= (and b!1390794 res!930826) b!1390790))

(assert (= (and b!1390790 (not res!930825)) b!1390786))

(assert (= (and b!1390786 (not res!930824)) b!1390789))

(assert (=> d!150229 m!1276445))

(declare-fun m!1276601 () Bool)

(assert (=> d!150229 m!1276601))

(assert (=> d!150229 m!1276441))

(declare-fun m!1276603 () Bool)

(assert (=> b!1390790 m!1276603))

(assert (=> b!1390791 m!1276445))

(declare-fun m!1276605 () Bool)

(assert (=> b!1390791 m!1276605))

(assert (=> b!1390791 m!1276605))

(assert (=> b!1390791 m!1276437))

(declare-fun m!1276607 () Bool)

(assert (=> b!1390791 m!1276607))

(assert (=> b!1390786 m!1276603))

(assert (=> b!1390789 m!1276603))

(assert (=> b!1390566 d!150229))

(declare-fun d!150239 () Bool)

(declare-fun lt!610968 () (_ BitVec 32))

(declare-fun lt!610967 () (_ BitVec 32))

(assert (=> d!150239 (= lt!610968 (bvmul (bvxor lt!610967 (bvlshr lt!610967 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150239 (= lt!610967 ((_ extract 31 0) (bvand (bvxor (select (arr!45938 a!2901) j!112) (bvlshr (select (arr!45938 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150239 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!930833 (let ((h!33675 ((_ extract 31 0) (bvand (bvxor (select (arr!45938 a!2901) j!112) (bvlshr (select (arr!45938 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125076 (bvmul (bvxor h!33675 (bvlshr h!33675 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125076 (bvlshr x!125076 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!930833 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!930833 #b00000000000000000000000000000000))))))

(assert (=> d!150239 (= (toIndex!0 (select (arr!45938 a!2901) j!112) mask!2840) (bvand (bvxor lt!610968 (bvlshr lt!610968 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1390566 d!150239))

(declare-fun d!150241 () Bool)

(assert (=> d!150241 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119208 d!150241))

(declare-fun d!150255 () Bool)

(assert (=> d!150255 (= (array_inv!34966 a!2901) (bvsge (size!46488 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119208 d!150255))

(declare-fun d!150257 () Bool)

(assert (=> d!150257 (= (validKeyInArray!0 (select (arr!45938 a!2901) i!1037)) (and (not (= (select (arr!45938 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45938 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390562 d!150257))

(declare-fun d!150259 () Bool)

(assert (=> d!150259 (= (validKeyInArray!0 (select (arr!45938 a!2901) j!112)) (and (not (= (select (arr!45938 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45938 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390564 d!150259))

(push 1)

