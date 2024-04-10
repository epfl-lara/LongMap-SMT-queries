; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47818 () Bool)

(assert start!47818)

(declare-fun b!526978 () Bool)

(declare-fun res!323527 () Bool)

(declare-fun e!307128 () Bool)

(assert (=> b!526978 (=> (not res!323527) (not e!307128))))

(declare-datatypes ((array!33455 0))(
  ( (array!33456 (arr!16079 (Array (_ BitVec 32) (_ BitVec 64))) (size!16443 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33455)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526978 (= res!323527 (validKeyInArray!0 (select (arr!16079 a!3235) j!176)))))

(declare-fun e!307133 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!526979 () Bool)

(declare-datatypes ((SeekEntryResult!4546 0))(
  ( (MissingZero!4546 (index!20396 (_ BitVec 32))) (Found!4546 (index!20397 (_ BitVec 32))) (Intermediate!4546 (undefined!5358 Bool) (index!20398 (_ BitVec 32)) (x!49359 (_ BitVec 32))) (Undefined!4546) (MissingVacant!4546 (index!20399 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33455 (_ BitVec 32)) SeekEntryResult!4546)

(assert (=> b!526979 (= e!307133 (= (seekEntryOrOpen!0 (select (arr!16079 a!3235) j!176) a!3235 mask!3524) (Found!4546 j!176)))))

(declare-fun b!526980 () Bool)

(declare-fun res!323525 () Bool)

(declare-fun e!307131 () Bool)

(assert (=> b!526980 (=> res!323525 e!307131)))

(declare-fun lt!242503 () SeekEntryResult!4546)

(assert (=> b!526980 (= res!323525 (or (undefined!5358 lt!242503) (not (is-Intermediate!4546 lt!242503))))))

(declare-fun b!526981 () Bool)

(declare-fun res!323531 () Bool)

(assert (=> b!526981 (=> (not res!323531) (not e!307128))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526981 (= res!323531 (and (= (size!16443 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16443 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16443 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526982 () Bool)

(declare-fun res!323529 () Bool)

(declare-fun e!307130 () Bool)

(assert (=> b!526982 (=> (not res!323529) (not e!307130))))

(declare-datatypes ((List!10237 0))(
  ( (Nil!10234) (Cons!10233 (h!11164 (_ BitVec 64)) (t!16465 List!10237)) )
))
(declare-fun arrayNoDuplicates!0 (array!33455 (_ BitVec 32) List!10237) Bool)

(assert (=> b!526982 (= res!323529 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10234))))

(declare-fun b!526983 () Bool)

(declare-fun res!323524 () Bool)

(assert (=> b!526983 (=> (not res!323524) (not e!307128))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!526983 (= res!323524 (validKeyInArray!0 k!2280))))

(declare-fun res!323523 () Bool)

(assert (=> start!47818 (=> (not res!323523) (not e!307128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47818 (= res!323523 (validMask!0 mask!3524))))

(assert (=> start!47818 e!307128))

(assert (=> start!47818 true))

(declare-fun array_inv!11875 (array!33455) Bool)

(assert (=> start!47818 (array_inv!11875 a!3235)))

(declare-fun b!526984 () Bool)

(assert (=> b!526984 (= e!307130 (not e!307131))))

(declare-fun res!323532 () Bool)

(assert (=> b!526984 (=> res!323532 e!307131)))

(declare-fun lt!242500 () (_ BitVec 32))

(declare-fun lt!242502 () array!33455)

(declare-fun lt!242494 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33455 (_ BitVec 32)) SeekEntryResult!4546)

(assert (=> b!526984 (= res!323532 (= lt!242503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242500 lt!242494 lt!242502 mask!3524)))))

(declare-fun lt!242496 () (_ BitVec 32))

(assert (=> b!526984 (= lt!242503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242496 (select (arr!16079 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526984 (= lt!242500 (toIndex!0 lt!242494 mask!3524))))

(assert (=> b!526984 (= lt!242494 (select (store (arr!16079 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526984 (= lt!242496 (toIndex!0 (select (arr!16079 a!3235) j!176) mask!3524))))

(assert (=> b!526984 (= lt!242502 (array!33456 (store (arr!16079 a!3235) i!1204 k!2280) (size!16443 a!3235)))))

(assert (=> b!526984 e!307133))

(declare-fun res!323534 () Bool)

(assert (=> b!526984 (=> (not res!323534) (not e!307133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33455 (_ BitVec 32)) Bool)

(assert (=> b!526984 (= res!323534 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16636 0))(
  ( (Unit!16637) )
))
(declare-fun lt!242497 () Unit!16636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16636)

(assert (=> b!526984 (= lt!242497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526985 () Bool)

(declare-fun res!323526 () Bool)

(assert (=> b!526985 (=> (not res!323526) (not e!307130))))

(assert (=> b!526985 (= res!323526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526986 () Bool)

(assert (=> b!526986 (= e!307131 (or (bvsgt (x!49359 lt!242503) #b01111111111111111111111111111110) (and (bvsge lt!242496 #b00000000000000000000000000000000) (bvslt lt!242496 (size!16443 a!3235)))))))

(assert (=> b!526986 (= (index!20398 lt!242503) i!1204)))

(declare-fun lt!242499 () Unit!16636)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16636)

(assert (=> b!526986 (= lt!242499 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242496 #b00000000000000000000000000000000 (index!20398 lt!242503) (x!49359 lt!242503) mask!3524))))

(assert (=> b!526986 (and (or (= (select (arr!16079 a!3235) (index!20398 lt!242503)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16079 a!3235) (index!20398 lt!242503)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16079 a!3235) (index!20398 lt!242503)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16079 a!3235) (index!20398 lt!242503)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242498 () Unit!16636)

(declare-fun e!307134 () Unit!16636)

(assert (=> b!526986 (= lt!242498 e!307134)))

(declare-fun c!62033 () Bool)

(assert (=> b!526986 (= c!62033 (= (select (arr!16079 a!3235) (index!20398 lt!242503)) (select (arr!16079 a!3235) j!176)))))

(assert (=> b!526986 (and (bvslt (x!49359 lt!242503) #b01111111111111111111111111111110) (or (= (select (arr!16079 a!3235) (index!20398 lt!242503)) (select (arr!16079 a!3235) j!176)) (= (select (arr!16079 a!3235) (index!20398 lt!242503)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16079 a!3235) (index!20398 lt!242503)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526987 () Bool)

(declare-fun Unit!16638 () Unit!16636)

(assert (=> b!526987 (= e!307134 Unit!16638)))

(declare-fun b!526988 () Bool)

(declare-fun Unit!16639 () Unit!16636)

(assert (=> b!526988 (= e!307134 Unit!16639)))

(declare-fun lt!242501 () Unit!16636)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16636)

(assert (=> b!526988 (= lt!242501 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242496 #b00000000000000000000000000000000 (index!20398 lt!242503) (x!49359 lt!242503) mask!3524))))

(declare-fun res!323528 () Bool)

(assert (=> b!526988 (= res!323528 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242496 lt!242494 lt!242502 mask!3524) (Intermediate!4546 false (index!20398 lt!242503) (x!49359 lt!242503))))))

(declare-fun e!307129 () Bool)

(assert (=> b!526988 (=> (not res!323528) (not e!307129))))

(assert (=> b!526988 e!307129))

(declare-fun b!526989 () Bool)

(assert (=> b!526989 (= e!307128 e!307130)))

(declare-fun res!323533 () Bool)

(assert (=> b!526989 (=> (not res!323533) (not e!307130))))

(declare-fun lt!242495 () SeekEntryResult!4546)

(assert (=> b!526989 (= res!323533 (or (= lt!242495 (MissingZero!4546 i!1204)) (= lt!242495 (MissingVacant!4546 i!1204))))))

(assert (=> b!526989 (= lt!242495 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526990 () Bool)

(declare-fun res!323530 () Bool)

(assert (=> b!526990 (=> (not res!323530) (not e!307128))))

(declare-fun arrayContainsKey!0 (array!33455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526990 (= res!323530 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526991 () Bool)

(assert (=> b!526991 (= e!307129 false)))

(assert (= (and start!47818 res!323523) b!526981))

(assert (= (and b!526981 res!323531) b!526978))

(assert (= (and b!526978 res!323527) b!526983))

(assert (= (and b!526983 res!323524) b!526990))

(assert (= (and b!526990 res!323530) b!526989))

(assert (= (and b!526989 res!323533) b!526985))

(assert (= (and b!526985 res!323526) b!526982))

(assert (= (and b!526982 res!323529) b!526984))

(assert (= (and b!526984 res!323534) b!526979))

(assert (= (and b!526984 (not res!323532)) b!526980))

(assert (= (and b!526980 (not res!323525)) b!526986))

(assert (= (and b!526986 c!62033) b!526988))

(assert (= (and b!526986 (not c!62033)) b!526987))

(assert (= (and b!526988 res!323528) b!526991))

(declare-fun m!507709 () Bool)

(assert (=> b!526984 m!507709))

(declare-fun m!507711 () Bool)

(assert (=> b!526984 m!507711))

(declare-fun m!507713 () Bool)

(assert (=> b!526984 m!507713))

(declare-fun m!507715 () Bool)

(assert (=> b!526984 m!507715))

(declare-fun m!507717 () Bool)

(assert (=> b!526984 m!507717))

(declare-fun m!507719 () Bool)

(assert (=> b!526984 m!507719))

(assert (=> b!526984 m!507717))

(declare-fun m!507721 () Bool)

(assert (=> b!526984 m!507721))

(declare-fun m!507723 () Bool)

(assert (=> b!526984 m!507723))

(assert (=> b!526984 m!507717))

(declare-fun m!507725 () Bool)

(assert (=> b!526984 m!507725))

(declare-fun m!507727 () Bool)

(assert (=> b!526989 m!507727))

(declare-fun m!507729 () Bool)

(assert (=> b!526985 m!507729))

(assert (=> b!526978 m!507717))

(assert (=> b!526978 m!507717))

(declare-fun m!507731 () Bool)

(assert (=> b!526978 m!507731))

(declare-fun m!507733 () Bool)

(assert (=> b!526983 m!507733))

(declare-fun m!507735 () Bool)

(assert (=> b!526990 m!507735))

(declare-fun m!507737 () Bool)

(assert (=> b!526986 m!507737))

(declare-fun m!507739 () Bool)

(assert (=> b!526986 m!507739))

(assert (=> b!526986 m!507717))

(declare-fun m!507741 () Bool)

(assert (=> b!526988 m!507741))

(declare-fun m!507743 () Bool)

(assert (=> b!526988 m!507743))

(assert (=> b!526979 m!507717))

(assert (=> b!526979 m!507717))

(declare-fun m!507745 () Bool)

(assert (=> b!526979 m!507745))

(declare-fun m!507747 () Bool)

(assert (=> b!526982 m!507747))

(declare-fun m!507749 () Bool)

(assert (=> start!47818 m!507749))

(declare-fun m!507751 () Bool)

(assert (=> start!47818 m!507751))

(push 1)

(assert (not start!47818))

(assert (not b!526989))

(assert (not b!526983))

(assert (not b!526986))

(assert (not b!526984))

(assert (not b!526985))

(assert (not b!526979))

(assert (not b!526978))

(assert (not b!526982))

(assert (not b!526990))

(assert (not b!526988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80777 () Bool)

(assert (=> d!80777 (= (index!20398 lt!242503) i!1204)))

(declare-fun lt!242521 () Unit!16636)

(declare-fun choose!104 (array!33455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16636)

(assert (=> d!80777 (= lt!242521 (choose!104 a!3235 i!1204 k!2280 j!176 lt!242496 #b00000000000000000000000000000000 (index!20398 lt!242503) (x!49359 lt!242503) mask!3524))))

(assert (=> d!80777 (validMask!0 mask!3524)))

(assert (=> d!80777 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242496 #b00000000000000000000000000000000 (index!20398 lt!242503) (x!49359 lt!242503) mask!3524) lt!242521)))

(declare-fun bs!16525 () Bool)

(assert (= bs!16525 d!80777))

(declare-fun m!507765 () Bool)

(assert (=> bs!16525 m!507765))

(assert (=> bs!16525 m!507749))

(assert (=> b!526986 d!80777))

(declare-fun d!80779 () Bool)

(assert (=> d!80779 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47818 d!80779))

(declare-fun d!80791 () Bool)

(assert (=> d!80791 (= (array_inv!11875 a!3235) (bvsge (size!16443 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47818 d!80791))

(declare-fun b!527087 () Bool)

(declare-fun e!307198 () Bool)

(declare-fun e!307200 () Bool)

(assert (=> b!527087 (= e!307198 e!307200)))

(declare-fun lt!242555 () (_ BitVec 64))

(assert (=> b!527087 (= lt!242555 (select (arr!16079 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!242556 () Unit!16636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33455 (_ BitVec 64) (_ BitVec 32)) Unit!16636)

(assert (=> b!527087 (= lt!242556 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242555 #b00000000000000000000000000000000))))

(assert (=> b!527087 (arrayContainsKey!0 a!3235 lt!242555 #b00000000000000000000000000000000)))

(declare-fun lt!242557 () Unit!16636)

(assert (=> b!527087 (= lt!242557 lt!242556)))

(declare-fun res!323566 () Bool)

(assert (=> b!527087 (= res!323566 (= (seekEntryOrOpen!0 (select (arr!16079 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4546 #b00000000000000000000000000000000)))))

(assert (=> b!527087 (=> (not res!323566) (not e!307200))))

(declare-fun b!527088 () Bool)

(declare-fun e!307199 () Bool)

(assert (=> b!527088 (= e!307199 e!307198)))

(declare-fun c!62066 () Bool)

(assert (=> b!527088 (= c!62066 (validKeyInArray!0 (select (arr!16079 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527089 () Bool)

(declare-fun call!31883 () Bool)

(assert (=> b!527089 (= e!307198 call!31883)))

(declare-fun b!527090 () Bool)

(assert (=> b!527090 (= e!307200 call!31883)))

(declare-fun bm!31880 () Bool)

(assert (=> bm!31880 (= call!31883 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80795 () Bool)

(declare-fun res!323567 () Bool)

(assert (=> d!80795 (=> res!323567 e!307199)))

(assert (=> d!80795 (= res!323567 (bvsge #b00000000000000000000000000000000 (size!16443 a!3235)))))

(assert (=> d!80795 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!307199)))

(assert (= (and d!80795 (not res!323567)) b!527088))

(assert (= (and b!527088 c!62066) b!527087))

(assert (= (and b!527088 (not c!62066)) b!527089))

(assert (= (and b!527087 res!323566) b!527090))

(assert (= (or b!527090 b!527089) bm!31880))

(declare-fun m!507825 () Bool)

(assert (=> b!527087 m!507825))

(declare-fun m!507827 () Bool)

(assert (=> b!527087 m!507827))

(declare-fun m!507829 () Bool)

(assert (=> b!527087 m!507829))

(assert (=> b!527087 m!507825))

(declare-fun m!507831 () Bool)

(assert (=> b!527087 m!507831))

(assert (=> b!527088 m!507825))

(assert (=> b!527088 m!507825))

(declare-fun m!507833 () Bool)

(assert (=> b!527088 m!507833))

(declare-fun m!507835 () Bool)

(assert (=> bm!31880 m!507835))

(assert (=> b!526985 d!80795))

(declare-fun d!80801 () Bool)

(declare-fun res!323578 () Bool)

(declare-fun e!307211 () Bool)

(assert (=> d!80801 (=> res!323578 e!307211)))

(assert (=> d!80801 (= res!323578 (= (select (arr!16079 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80801 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!307211)))

(declare-fun b!527101 () Bool)

(declare-fun e!307212 () Bool)

(assert (=> b!527101 (= e!307211 e!307212)))

(declare-fun res!323579 () Bool)

(assert (=> b!527101 (=> (not res!323579) (not e!307212))))

(assert (=> b!527101 (= res!323579 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16443 a!3235)))))

(declare-fun b!527102 () Bool)

(assert (=> b!527102 (= e!307212 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80801 (not res!323578)) b!527101))

(assert (= (and b!527101 res!323579) b!527102))

(assert (=> d!80801 m!507825))

(declare-fun m!507839 () Bool)

(assert (=> b!527102 m!507839))

(assert (=> b!526990 d!80801))

(declare-fun b!527121 () Bool)

(declare-fun e!307224 () SeekEntryResult!4546)

(declare-fun lt!242585 () SeekEntryResult!4546)

(assert (=> b!527121 (= e!307224 (Found!4546 (index!20398 lt!242585)))))

(declare-fun b!527122 () Bool)

(declare-fun e!307225 () SeekEntryResult!4546)

(assert (=> b!527122 (= e!307225 Undefined!4546)))

(declare-fun b!527124 () Bool)

(declare-fun c!62075 () Bool)

(declare-fun lt!242584 () (_ BitVec 64))

(assert (=> b!527124 (= c!62075 (= lt!242584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307226 () SeekEntryResult!4546)

(assert (=> b!527124 (= e!307224 e!307226)))

(declare-fun b!527125 () Bool)

(assert (=> b!527125 (= e!307226 (MissingZero!4546 (index!20398 lt!242585)))))

(declare-fun b!527126 () Bool)

(assert (=> b!527126 (= e!307225 e!307224)))

(assert (=> b!527126 (= lt!242584 (select (arr!16079 a!3235) (index!20398 lt!242585)))))

(declare-fun c!62076 () Bool)

(assert (=> b!527126 (= c!62076 (= lt!242584 (select (arr!16079 a!3235) j!176)))))

(declare-fun b!527123 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33455 (_ BitVec 32)) SeekEntryResult!4546)

(assert (=> b!527123 (= e!307226 (seekKeyOrZeroReturnVacant!0 (x!49359 lt!242585) (index!20398 lt!242585) (index!20398 lt!242585) (select (arr!16079 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!80805 () Bool)

(declare-fun lt!242583 () SeekEntryResult!4546)

(assert (=> d!80805 (and (or (is-Undefined!4546 lt!242583) (not (is-Found!4546 lt!242583)) (and (bvsge (index!20397 lt!242583) #b00000000000000000000000000000000) (bvslt (index!20397 lt!242583) (size!16443 a!3235)))) (or (is-Undefined!4546 lt!242583) (is-Found!4546 lt!242583) (not (is-MissingZero!4546 lt!242583)) (and (bvsge (index!20396 lt!242583) #b00000000000000000000000000000000) (bvslt (index!20396 lt!242583) (size!16443 a!3235)))) (or (is-Undefined!4546 lt!242583) (is-Found!4546 lt!242583) (is-MissingZero!4546 lt!242583) (not (is-MissingVacant!4546 lt!242583)) (and (bvsge (index!20399 lt!242583) #b00000000000000000000000000000000) (bvslt (index!20399 lt!242583) (size!16443 a!3235)))) (or (is-Undefined!4546 lt!242583) (ite (is-Found!4546 lt!242583) (= (select (arr!16079 a!3235) (index!20397 lt!242583)) (select (arr!16079 a!3235) j!176)) (ite (is-MissingZero!4546 lt!242583) (= (select (arr!16079 a!3235) (index!20396 lt!242583)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4546 lt!242583) (= (select (arr!16079 a!3235) (index!20399 lt!242583)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80805 (= lt!242583 e!307225)))

(declare-fun c!62074 () Bool)

(assert (=> d!80805 (= c!62074 (and (is-Intermediate!4546 lt!242585) (undefined!5358 lt!242585)))))

(assert (=> d!80805 (= lt!242585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16079 a!3235) j!176) mask!3524) (select (arr!16079 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80805 (validMask!0 mask!3524)))

(assert (=> d!80805 (= (seekEntryOrOpen!0 (select (arr!16079 a!3235) j!176) a!3235 mask!3524) lt!242583)))

(assert (= (and d!80805 c!62074) b!527122))

(assert (= (and d!80805 (not c!62074)) b!527126))

(assert (= (and b!527126 c!62076) b!527121))

(assert (= (and b!527126 (not c!62076)) b!527124))

(assert (= (and b!527124 c!62075) b!527125))

(assert (= (and b!527124 (not c!62075)) b!527123))

(declare-fun m!507851 () Bool)

(assert (=> b!527126 m!507851))

(assert (=> b!527123 m!507717))

(declare-fun m!507853 () Bool)

(assert (=> b!527123 m!507853))

(declare-fun m!507855 () Bool)

(assert (=> d!80805 m!507855))

(declare-fun m!507857 () Bool)

(assert (=> d!80805 m!507857))

(assert (=> d!80805 m!507749))

(assert (=> d!80805 m!507717))

(assert (=> d!80805 m!507719))

(declare-fun m!507859 () Bool)

(assert (=> d!80805 m!507859))

(assert (=> d!80805 m!507719))

(assert (=> d!80805 m!507717))

(declare-fun m!507861 () Bool)

(assert (=> d!80805 m!507861))

(assert (=> b!526979 d!80805))

(declare-fun d!80821 () Bool)

(declare-fun e!307275 () Bool)

(assert (=> d!80821 e!307275))

(declare-fun c!62107 () Bool)

(declare-fun lt!242607 () SeekEntryResult!4546)

(assert (=> d!80821 (= c!62107 (and (is-Intermediate!4546 lt!242607) (undefined!5358 lt!242607)))))

(declare-fun e!307277 () SeekEntryResult!4546)

(assert (=> d!80821 (= lt!242607 e!307277)))

(declare-fun c!62106 () Bool)

(assert (=> d!80821 (= c!62106 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242606 () (_ BitVec 64))

(assert (=> d!80821 (= lt!242606 (select (arr!16079 lt!242502) lt!242500))))

(assert (=> d!80821 (validMask!0 mask!3524)))

(assert (=> d!80821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242500 lt!242494 lt!242502 mask!3524) lt!242607)))

(declare-fun b!527210 () Bool)

(assert (=> b!527210 (and (bvsge (index!20398 lt!242607) #b00000000000000000000000000000000) (bvslt (index!20398 lt!242607) (size!16443 lt!242502)))))

(declare-fun res!323611 () Bool)

(assert (=> b!527210 (= res!323611 (= (select (arr!16079 lt!242502) (index!20398 lt!242607)) lt!242494))))

(declare-fun e!307276 () Bool)

(assert (=> b!527210 (=> res!323611 e!307276)))

(declare-fun e!307279 () Bool)

(assert (=> b!527210 (= e!307279 e!307276)))

(declare-fun b!527211 () Bool)

(assert (=> b!527211 (= e!307275 e!307279)))

(declare-fun res!323610 () Bool)

(assert (=> b!527211 (= res!323610 (and (is-Intermediate!4546 lt!242607) (not (undefined!5358 lt!242607)) (bvslt (x!49359 lt!242607) #b01111111111111111111111111111110) (bvsge (x!49359 lt!242607) #b00000000000000000000000000000000) (bvsge (x!49359 lt!242607) #b00000000000000000000000000000000)))))

(assert (=> b!527211 (=> (not res!323610) (not e!307279))))

(declare-fun b!527212 () Bool)

(assert (=> b!527212 (and (bvsge (index!20398 lt!242607) #b00000000000000000000000000000000) (bvslt (index!20398 lt!242607) (size!16443 lt!242502)))))

(declare-fun res!323612 () Bool)

(assert (=> b!527212 (= res!323612 (= (select (arr!16079 lt!242502) (index!20398 lt!242607)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527212 (=> res!323612 e!307276)))

(declare-fun e!307278 () SeekEntryResult!4546)

(declare-fun b!527213 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527213 (= e!307278 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242500 #b00000000000000000000000000000000 mask!3524) lt!242494 lt!242502 mask!3524))))

(declare-fun b!527214 () Bool)

(assert (=> b!527214 (= e!307275 (bvsge (x!49359 lt!242607) #b01111111111111111111111111111110))))

(declare-fun b!527215 () Bool)

(assert (=> b!527215 (= e!307277 (Intermediate!4546 true lt!242500 #b00000000000000000000000000000000))))

(declare-fun b!527216 () Bool)

(assert (=> b!527216 (and (bvsge (index!20398 lt!242607) #b00000000000000000000000000000000) (bvslt (index!20398 lt!242607) (size!16443 lt!242502)))))

(assert (=> b!527216 (= e!307276 (= (select (arr!16079 lt!242502) (index!20398 lt!242607)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527217 () Bool)

(assert (=> b!527217 (= e!307278 (Intermediate!4546 false lt!242500 #b00000000000000000000000000000000))))

(declare-fun b!527218 () Bool)

(assert (=> b!527218 (= e!307277 e!307278)))

(declare-fun c!62108 () Bool)

(assert (=> b!527218 (= c!62108 (or (= lt!242606 lt!242494) (= (bvadd lt!242606 lt!242606) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80821 c!62106) b!527215))

(assert (= (and d!80821 (not c!62106)) b!527218))

(assert (= (and b!527218 c!62108) b!527217))

(assert (= (and b!527218 (not c!62108)) b!527213))

(assert (= (and d!80821 c!62107) b!527214))

(assert (= (and d!80821 (not c!62107)) b!527211))

(assert (= (and b!527211 res!323610) b!527210))

(assert (= (and b!527210 (not res!323611)) b!527212))

(assert (= (and b!527212 (not res!323612)) b!527216))

(declare-fun m!507897 () Bool)

(assert (=> b!527213 m!507897))

(assert (=> b!527213 m!507897))

(declare-fun m!507899 () Bool)

(assert (=> b!527213 m!507899))

(declare-fun m!507901 () Bool)

(assert (=> d!80821 m!507901))

(assert (=> d!80821 m!507749))

(declare-fun m!507903 () Bool)

(assert (=> b!527212 m!507903))

(assert (=> b!527216 m!507903))

(assert (=> b!527210 m!507903))

(assert (=> b!526984 d!80821))

(declare-fun d!80833 () Bool)

(declare-fun lt!242615 () (_ BitVec 32))

(declare-fun lt!242614 () (_ BitVec 32))

(assert (=> d!80833 (= lt!242615 (bvmul (bvxor lt!242614 (bvlshr lt!242614 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80833 (= lt!242614 ((_ extract 31 0) (bvand (bvxor (select (arr!16079 a!3235) j!176) (bvlshr (select (arr!16079 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80833 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323619 (let ((h!11166 ((_ extract 31 0) (bvand (bvxor (select (arr!16079 a!3235) j!176) (bvlshr (select (arr!16079 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49368 (bvmul (bvxor h!11166 (bvlshr h!11166 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49368 (bvlshr x!49368 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323619 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323619 #b00000000000000000000000000000000))))))

(assert (=> d!80833 (= (toIndex!0 (select (arr!16079 a!3235) j!176) mask!3524) (bvand (bvxor lt!242615 (bvlshr lt!242615 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526984 d!80833))

(declare-fun d!80837 () Bool)

(declare-fun lt!242617 () (_ BitVec 32))

(declare-fun lt!242616 () (_ BitVec 32))

(assert (=> d!80837 (= lt!242617 (bvmul (bvxor lt!242616 (bvlshr lt!242616 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80837 (= lt!242616 ((_ extract 31 0) (bvand (bvxor lt!242494 (bvlshr lt!242494 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80837 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!323619 (let ((h!11166 ((_ extract 31 0) (bvand (bvxor lt!242494 (bvlshr lt!242494 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49368 (bvmul (bvxor h!11166 (bvlshr h!11166 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49368 (bvlshr x!49368 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!323619 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!323619 #b00000000000000000000000000000000))))))

(assert (=> d!80837 (= (toIndex!0 lt!242494 mask!3524) (bvand (bvxor lt!242617 (bvlshr lt!242617 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!526984 d!80837))

(declare-fun d!80839 () Bool)

(declare-fun e!307293 () Bool)

(assert (=> d!80839 e!307293))

(declare-fun c!62114 () Bool)

(declare-fun lt!242619 () SeekEntryResult!4546)

(assert (=> d!80839 (= c!62114 (and (is-Intermediate!4546 lt!242619) (undefined!5358 lt!242619)))))

(declare-fun e!307295 () SeekEntryResult!4546)

(assert (=> d!80839 (= lt!242619 e!307295)))

(declare-fun c!62113 () Bool)

(assert (=> d!80839 (= c!62113 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242618 () (_ BitVec 64))

(assert (=> d!80839 (= lt!242618 (select (arr!16079 a!3235) lt!242496))))

(assert (=> d!80839 (validMask!0 mask!3524)))

(assert (=> d!80839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242496 (select (arr!16079 a!3235) j!176) a!3235 mask!3524) lt!242619)))

(declare-fun b!527239 () Bool)

(assert (=> b!527239 (and (bvsge (index!20398 lt!242619) #b00000000000000000000000000000000) (bvslt (index!20398 lt!242619) (size!16443 a!3235)))))

(declare-fun res!323627 () Bool)

(assert (=> b!527239 (= res!323627 (= (select (arr!16079 a!3235) (index!20398 lt!242619)) (select (arr!16079 a!3235) j!176)))))

(declare-fun e!307294 () Bool)

(assert (=> b!527239 (=> res!323627 e!307294)))

(declare-fun e!307297 () Bool)

(assert (=> b!527239 (= e!307297 e!307294)))

(declare-fun b!527240 () Bool)

(assert (=> b!527240 (= e!307293 e!307297)))

(declare-fun res!323626 () Bool)

(assert (=> b!527240 (= res!323626 (and (is-Intermediate!4546 lt!242619) (not (undefined!5358 lt!242619)) (bvslt (x!49359 lt!242619) #b01111111111111111111111111111110) (bvsge (x!49359 lt!242619) #b00000000000000000000000000000000) (bvsge (x!49359 lt!242619) #b00000000000000000000000000000000)))))

(assert (=> b!527240 (=> (not res!323626) (not e!307297))))

(declare-fun b!527241 () Bool)

(assert (=> b!527241 (and (bvsge (index!20398 lt!242619) #b00000000000000000000000000000000) (bvslt (index!20398 lt!242619) (size!16443 a!3235)))))

(declare-fun res!323628 () Bool)

(assert (=> b!527241 (= res!323628 (= (select (arr!16079 a!3235) (index!20398 lt!242619)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527241 (=> res!323628 e!307294)))

(declare-fun e!307296 () SeekEntryResult!4546)

(declare-fun b!527242 () Bool)

(assert (=> b!527242 (= e!307296 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242496 #b00000000000000000000000000000000 mask!3524) (select (arr!16079 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!527243 () Bool)

(assert (=> b!527243 (= e!307293 (bvsge (x!49359 lt!242619) #b01111111111111111111111111111110))))

(declare-fun b!527244 () Bool)

(assert (=> b!527244 (= e!307295 (Intermediate!4546 true lt!242496 #b00000000000000000000000000000000))))

(declare-fun b!527245 () Bool)

(assert (=> b!527245 (and (bvsge (index!20398 lt!242619) #b00000000000000000000000000000000) (bvslt (index!20398 lt!242619) (size!16443 a!3235)))))

(assert (=> b!527245 (= e!307294 (= (select (arr!16079 a!3235) (index!20398 lt!242619)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527246 () Bool)

(assert (=> b!527246 (= e!307296 (Intermediate!4546 false lt!242496 #b00000000000000000000000000000000))))

(declare-fun b!527247 () Bool)

(assert (=> b!527247 (= e!307295 e!307296)))

(declare-fun c!62115 () Bool)

(assert (=> b!527247 (= c!62115 (or (= lt!242618 (select (arr!16079 a!3235) j!176)) (= (bvadd lt!242618 lt!242618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80839 c!62113) b!527244))

(assert (= (and d!80839 (not c!62113)) b!527247))

(assert (= (and b!527247 c!62115) b!527246))

(assert (= (and b!527247 (not c!62115)) b!527242))

(assert (= (and d!80839 c!62114) b!527243))

(assert (= (and d!80839 (not c!62114)) b!527240))

(assert (= (and b!527240 res!323626) b!527239))

(assert (= (and b!527239 (not res!323627)) b!527241))

(assert (= (and b!527241 (not res!323628)) b!527245))

(declare-fun m!507917 () Bool)

(assert (=> b!527242 m!507917))

(assert (=> b!527242 m!507917))

(assert (=> b!527242 m!507717))

(declare-fun m!507919 () Bool)

(assert (=> b!527242 m!507919))

(declare-fun m!507921 () Bool)

(assert (=> d!80839 m!507921))

(assert (=> d!80839 m!507749))

(declare-fun m!507925 () Bool)

(assert (=> b!527241 m!507925))

(assert (=> b!527245 m!507925))

(assert (=> b!527239 m!507925))

(assert (=> b!526984 d!80839))

(declare-fun b!527257 () Bool)

(declare-fun e!307303 () Bool)

(declare-fun e!307305 () Bool)

(assert (=> b!527257 (= e!307303 e!307305)))

(declare-fun lt!242622 () (_ BitVec 64))

(assert (=> b!527257 (= lt!242622 (select (arr!16079 a!3235) j!176))))

(declare-fun lt!242623 () Unit!16636)

(assert (=> b!527257 (= lt!242623 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!242622 j!176))))

(assert (=> b!527257 (arrayContainsKey!0 a!3235 lt!242622 #b00000000000000000000000000000000)))

(declare-fun lt!242624 () Unit!16636)

(assert (=> b!527257 (= lt!242624 lt!242623)))

(declare-fun res!323632 () Bool)

(assert (=> b!527257 (= res!323632 (= (seekEntryOrOpen!0 (select (arr!16079 a!3235) j!176) a!3235 mask!3524) (Found!4546 j!176)))))

(assert (=> b!527257 (=> (not res!323632) (not e!307305))))

(declare-fun b!527258 () Bool)

(declare-fun e!307304 () Bool)

(assert (=> b!527258 (= e!307304 e!307303)))

(declare-fun c!62119 () Bool)

(assert (=> b!527258 (= c!62119 (validKeyInArray!0 (select (arr!16079 a!3235) j!176)))))

(declare-fun b!527259 () Bool)

(declare-fun call!31888 () Bool)

(assert (=> b!527259 (= e!307303 call!31888)))

(declare-fun b!527260 () Bool)

(assert (=> b!527260 (= e!307305 call!31888)))

(declare-fun bm!31885 () Bool)

(assert (=> bm!31885 (= call!31888 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80843 () Bool)

(declare-fun res!323633 () Bool)

(assert (=> d!80843 (=> res!323633 e!307304)))

(assert (=> d!80843 (= res!323633 (bvsge j!176 (size!16443 a!3235)))))

(assert (=> d!80843 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!307304)))

(assert (= (and d!80843 (not res!323633)) b!527258))

(assert (= (and b!527258 c!62119) b!527257))

(assert (= (and b!527258 (not c!62119)) b!527259))

(assert (= (and b!527257 res!323632) b!527260))

(assert (= (or b!527260 b!527259) bm!31885))

(assert (=> b!527257 m!507717))

(declare-fun m!507933 () Bool)

(assert (=> b!527257 m!507933))

(declare-fun m!507935 () Bool)

(assert (=> b!527257 m!507935))

(assert (=> b!527257 m!507717))

(assert (=> b!527257 m!507745))

(assert (=> b!527258 m!507717))

(assert (=> b!527258 m!507717))

(assert (=> b!527258 m!507731))

(declare-fun m!507937 () Bool)

(assert (=> bm!31885 m!507937))

(assert (=> b!526984 d!80843))

(declare-fun d!80847 () Bool)

(assert (=> d!80847 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!242629 () Unit!16636)

(declare-fun choose!38 (array!33455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16636)

(assert (=> d!80847 (= lt!242629 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80847 (validMask!0 mask!3524)))

(assert (=> d!80847 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!242629)))

(declare-fun bs!16529 () Bool)

(assert (= bs!16529 d!80847))

(assert (=> bs!16529 m!507723))

(declare-fun m!507939 () Bool)

(assert (=> bs!16529 m!507939))

(assert (=> bs!16529 m!507749))

(assert (=> b!526984 d!80847))

(declare-fun b!527263 () Bool)

(declare-fun e!307308 () SeekEntryResult!4546)

(declare-fun lt!242636 () SeekEntryResult!4546)

(assert (=> b!527263 (= e!307308 (Found!4546 (index!20398 lt!242636)))))

(declare-fun b!527264 () Bool)

(declare-fun e!307309 () SeekEntryResult!4546)

(assert (=> b!527264 (= e!307309 Undefined!4546)))

(declare-fun b!527266 () Bool)

(declare-fun c!62121 () Bool)

(declare-fun lt!242635 () (_ BitVec 64))

(assert (=> b!527266 (= c!62121 (= lt!242635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!307310 () SeekEntryResult!4546)

(assert (=> b!527266 (= e!307308 e!307310)))

(declare-fun b!527267 () Bool)

(assert (=> b!527267 (= e!307310 (MissingZero!4546 (index!20398 lt!242636)))))

(declare-fun b!527268 () Bool)

(assert (=> b!527268 (= e!307309 e!307308)))

(assert (=> b!527268 (= lt!242635 (select (arr!16079 a!3235) (index!20398 lt!242636)))))

(declare-fun c!62122 () Bool)

(assert (=> b!527268 (= c!62122 (= lt!242635 k!2280))))

(declare-fun b!527265 () Bool)

(assert (=> b!527265 (= e!307310 (seekKeyOrZeroReturnVacant!0 (x!49359 lt!242636) (index!20398 lt!242636) (index!20398 lt!242636) k!2280 a!3235 mask!3524))))

(declare-fun d!80849 () Bool)

(declare-fun lt!242634 () SeekEntryResult!4546)

(assert (=> d!80849 (and (or (is-Undefined!4546 lt!242634) (not (is-Found!4546 lt!242634)) (and (bvsge (index!20397 lt!242634) #b00000000000000000000000000000000) (bvslt (index!20397 lt!242634) (size!16443 a!3235)))) (or (is-Undefined!4546 lt!242634) (is-Found!4546 lt!242634) (not (is-MissingZero!4546 lt!242634)) (and (bvsge (index!20396 lt!242634) #b00000000000000000000000000000000) (bvslt (index!20396 lt!242634) (size!16443 a!3235)))) (or (is-Undefined!4546 lt!242634) (is-Found!4546 lt!242634) (is-MissingZero!4546 lt!242634) (not (is-MissingVacant!4546 lt!242634)) (and (bvsge (index!20399 lt!242634) #b00000000000000000000000000000000) (bvslt (index!20399 lt!242634) (size!16443 a!3235)))) (or (is-Undefined!4546 lt!242634) (ite (is-Found!4546 lt!242634) (= (select (arr!16079 a!3235) (index!20397 lt!242634)) k!2280) (ite (is-MissingZero!4546 lt!242634) (= (select (arr!16079 a!3235) (index!20396 lt!242634)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4546 lt!242634) (= (select (arr!16079 a!3235) (index!20399 lt!242634)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80849 (= lt!242634 e!307309)))

(declare-fun c!62120 () Bool)

(assert (=> d!80849 (= c!62120 (and (is-Intermediate!4546 lt!242636) (undefined!5358 lt!242636)))))

(assert (=> d!80849 (= lt!242636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80849 (validMask!0 mask!3524)))

(assert (=> d!80849 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!242634)))

(assert (= (and d!80849 c!62120) b!527264))

(assert (= (and d!80849 (not c!62120)) b!527268))

(assert (= (and b!527268 c!62122) b!527263))

(assert (= (and b!527268 (not c!62122)) b!527266))

(assert (= (and b!527266 c!62121) b!527267))

(assert (= (and b!527266 (not c!62121)) b!527265))

(declare-fun m!507941 () Bool)

(assert (=> b!527268 m!507941))

(declare-fun m!507943 () Bool)

(assert (=> b!527265 m!507943))

(declare-fun m!507945 () Bool)

(assert (=> d!80849 m!507945))

(declare-fun m!507947 () Bool)

(assert (=> d!80849 m!507947))

(assert (=> d!80849 m!507749))

(declare-fun m!507949 () Bool)

(assert (=> d!80849 m!507949))

(declare-fun m!507951 () Bool)

(assert (=> d!80849 m!507951))

(assert (=> d!80849 m!507949))

(declare-fun m!507953 () Bool)

(assert (=> d!80849 m!507953))

(assert (=> b!526989 d!80849))

(declare-fun d!80851 () Bool)

(assert (=> d!80851 (= (validKeyInArray!0 (select (arr!16079 a!3235) j!176)) (and (not (= (select (arr!16079 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16079 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526978 d!80851))

(declare-fun d!80855 () Bool)

(assert (=> d!80855 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!526983 d!80855))

(declare-fun d!80857 () Bool)

(declare-fun e!307327 () Bool)

(assert (=> d!80857 e!307327))

(declare-fun res!323648 () Bool)

(assert (=> d!80857 (=> (not res!323648) (not e!307327))))

(assert (=> d!80857 (= res!323648 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16443 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16443 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16443 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16443 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16443 a!3235))))))

(declare-fun lt!242654 () Unit!16636)

(declare-fun choose!47 (array!33455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16636)

(assert (=> d!80857 (= lt!242654 (choose!47 a!3235 i!1204 k!2280 j!176 lt!242496 #b00000000000000000000000000000000 (index!20398 lt!242503) (x!49359 lt!242503) mask!3524))))

(assert (=> d!80857 (validMask!0 mask!3524)))

(assert (=> d!80857 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242496 #b00000000000000000000000000000000 (index!20398 lt!242503) (x!49359 lt!242503) mask!3524) lt!242654)))

(declare-fun b!527294 () Bool)

(assert (=> b!527294 (= e!307327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242496 (select (store (arr!16079 a!3235) i!1204 k!2280) j!176) (array!33456 (store (arr!16079 a!3235) i!1204 k!2280) (size!16443 a!3235)) mask!3524) (Intermediate!4546 false (index!20398 lt!242503) (x!49359 lt!242503))))))

(assert (= (and d!80857 res!323648) b!527294))

(declare-fun m!507979 () Bool)

(assert (=> d!80857 m!507979))

(assert (=> d!80857 m!507749))

(assert (=> b!527294 m!507709))

(assert (=> b!527294 m!507713))

(assert (=> b!527294 m!507713))

(declare-fun m!507981 () Bool)

(assert (=> b!527294 m!507981))

(assert (=> b!526988 d!80857))

(declare-fun d!80875 () Bool)

(declare-fun e!307328 () Bool)

(assert (=> d!80875 e!307328))

(declare-fun c!62131 () Bool)

(declare-fun lt!242656 () SeekEntryResult!4546)

(assert (=> d!80875 (= c!62131 (and (is-Intermediate!4546 lt!242656) (undefined!5358 lt!242656)))))

(declare-fun e!307330 () SeekEntryResult!4546)

(assert (=> d!80875 (= lt!242656 e!307330)))

(declare-fun c!62130 () Bool)

(assert (=> d!80875 (= c!62130 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!242655 () (_ BitVec 64))

(assert (=> d!80875 (= lt!242655 (select (arr!16079 lt!242502) lt!242496))))

(assert (=> d!80875 (validMask!0 mask!3524)))

(assert (=> d!80875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242496 lt!242494 lt!242502 mask!3524) lt!242656)))

(declare-fun b!527295 () Bool)

(assert (=> b!527295 (and (bvsge (index!20398 lt!242656) #b00000000000000000000000000000000) (bvslt (index!20398 lt!242656) (size!16443 lt!242502)))))

(declare-fun res!323650 () Bool)

(assert (=> b!527295 (= res!323650 (= (select (arr!16079 lt!242502) (index!20398 lt!242656)) lt!242494))))

(declare-fun e!307329 () Bool)

(assert (=> b!527295 (=> res!323650 e!307329)))

(declare-fun e!307332 () Bool)

(assert (=> b!527295 (= e!307332 e!307329)))

(declare-fun b!527296 () Bool)

(assert (=> b!527296 (= e!307328 e!307332)))

(declare-fun res!323649 () Bool)

(assert (=> b!527296 (= res!323649 (and (is-Intermediate!4546 lt!242656) (not (undefined!5358 lt!242656)) (bvslt (x!49359 lt!242656) #b01111111111111111111111111111110) (bvsge (x!49359 lt!242656) #b00000000000000000000000000000000) (bvsge (x!49359 lt!242656) #b00000000000000000000000000000000)))))

(assert (=> b!527296 (=> (not res!323649) (not e!307332))))

(declare-fun b!527297 () Bool)

(assert (=> b!527297 (and (bvsge (index!20398 lt!242656) #b00000000000000000000000000000000) (bvslt (index!20398 lt!242656) (size!16443 lt!242502)))))

(declare-fun res!323651 () Bool)

(assert (=> b!527297 (= res!323651 (= (select (arr!16079 lt!242502) (index!20398 lt!242656)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!527297 (=> res!323651 e!307329)))

(declare-fun e!307331 () SeekEntryResult!4546)

(declare-fun b!527298 () Bool)

(assert (=> b!527298 (= e!307331 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!242496 #b00000000000000000000000000000000 mask!3524) lt!242494 lt!242502 mask!3524))))

(declare-fun b!527299 () Bool)

(assert (=> b!527299 (= e!307328 (bvsge (x!49359 lt!242656) #b01111111111111111111111111111110))))

(declare-fun b!527300 () Bool)

(assert (=> b!527300 (= e!307330 (Intermediate!4546 true lt!242496 #b00000000000000000000000000000000))))

(declare-fun b!527301 () Bool)

(assert (=> b!527301 (and (bvsge (index!20398 lt!242656) #b00000000000000000000000000000000) (bvslt (index!20398 lt!242656) (size!16443 lt!242502)))))

(assert (=> b!527301 (= e!307329 (= (select (arr!16079 lt!242502) (index!20398 lt!242656)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!527302 () Bool)

(assert (=> b!527302 (= e!307331 (Intermediate!4546 false lt!242496 #b00000000000000000000000000000000))))

(declare-fun b!527303 () Bool)

(assert (=> b!527303 (= e!307330 e!307331)))

(declare-fun c!62132 () Bool)

(assert (=> b!527303 (= c!62132 (or (= lt!242655 lt!242494) (= (bvadd lt!242655 lt!242655) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80875 c!62130) b!527300))

(assert (= (and d!80875 (not c!62130)) b!527303))

(assert (= (and b!527303 c!62132) b!527302))

(assert (= (and b!527303 (not c!62132)) b!527298))

(assert (= (and d!80875 c!62131) b!527299))

(assert (= (and d!80875 (not c!62131)) b!527296))

(assert (= (and b!527296 res!323649) b!527295))

(assert (= (and b!527295 (not res!323650)) b!527297))

(assert (= (and b!527297 (not res!323651)) b!527301))

(assert (=> b!527298 m!507917))

(assert (=> b!527298 m!507917))

(declare-fun m!507983 () Bool)

(assert (=> b!527298 m!507983))

(declare-fun m!507985 () Bool)

(assert (=> d!80875 m!507985))

(assert (=> d!80875 m!507749))

(declare-fun m!507987 () Bool)

(assert (=> b!527297 m!507987))

(assert (=> b!527301 m!507987))

(assert (=> b!527295 m!507987))

(assert (=> b!526988 d!80875))

(declare-fun d!80877 () Bool)

(declare-fun res!323658 () Bool)

(declare-fun e!307341 () Bool)

(assert (=> d!80877 (=> res!323658 e!307341)))

(assert (=> d!80877 (= res!323658 (bvsge #b00000000000000000000000000000000 (size!16443 a!3235)))))

(assert (=> d!80877 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10234) e!307341)))

(declare-fun b!527314 () Bool)

(declare-fun e!307344 () Bool)

(declare-fun e!307342 () Bool)

(assert (=> b!527314 (= e!307344 e!307342)))

(declare-fun c!62135 () Bool)

(assert (=> b!527314 (= c!62135 (validKeyInArray!0 (select (arr!16079 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527315 () Bool)

(declare-fun e!307343 () Bool)

(declare-fun contains!2775 (List!10237 (_ BitVec 64)) Bool)

(assert (=> b!527315 (= e!307343 (contains!2775 Nil!10234 (select (arr!16079 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527316 () Bool)

(declare-fun call!31892 () Bool)

(assert (=> b!527316 (= e!307342 call!31892)))

(declare-fun b!527317 () Bool)

(assert (=> b!527317 (= e!307341 e!307344)))

(declare-fun res!323660 () Bool)

(assert (=> b!527317 (=> (not res!323660) (not e!307344))))

(assert (=> b!527317 (= res!323660 (not e!307343))))

(declare-fun res!323659 () Bool)

(assert (=> b!527317 (=> (not res!323659) (not e!307343))))

(assert (=> b!527317 (= res!323659 (validKeyInArray!0 (select (arr!16079 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!527318 () Bool)

(assert (=> b!527318 (= e!307342 call!31892)))

(declare-fun bm!31889 () Bool)

(assert (=> bm!31889 (= call!31892 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62135 (Cons!10233 (select (arr!16079 a!3235) #b00000000000000000000000000000000) Nil!10234) Nil!10234)))))

(assert (= (and d!80877 (not res!323658)) b!527317))

(assert (= (and b!527317 res!323659) b!527315))

(assert (= (and b!527317 res!323660) b!527314))

(assert (= (and b!527314 c!62135) b!527316))

(assert (= (and b!527314 (not c!62135)) b!527318))

(assert (= (or b!527316 b!527318) bm!31889))

(assert (=> b!527314 m!507825))

(assert (=> b!527314 m!507825))

(assert (=> b!527314 m!507833))

(assert (=> b!527315 m!507825))

(assert (=> b!527315 m!507825))

(declare-fun m!507989 () Bool)

(assert (=> b!527315 m!507989))

(assert (=> b!527317 m!507825))

(assert (=> b!527317 m!507825))

(assert (=> b!527317 m!507833))

(assert (=> bm!31889 m!507825))

(declare-fun m!507991 () Bool)

(assert (=> bm!31889 m!507991))

(assert (=> b!526982 d!80877))

(push 1)

