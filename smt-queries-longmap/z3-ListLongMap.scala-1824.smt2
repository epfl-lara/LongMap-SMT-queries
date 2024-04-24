; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32936 () Bool)

(assert start!32936)

(declare-fun b!328345 () Bool)

(declare-fun res!180866 () Bool)

(declare-fun e!201854 () Bool)

(assert (=> b!328345 (=> (not res!180866) (not e!201854))))

(declare-datatypes ((array!16800 0))(
  ( (array!16801 (arr!7948 (Array (_ BitVec 32) (_ BitVec 64))) (size!8300 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16800)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328345 (= res!180866 (and (= (size!8300 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8300 a!3305))))))

(declare-fun b!328346 () Bool)

(declare-fun e!201853 () Bool)

(assert (=> b!328346 (= e!201854 e!201853)))

(declare-fun res!180864 () Bool)

(assert (=> b!328346 (=> (not res!180864) (not e!201853))))

(declare-datatypes ((SeekEntryResult!3044 0))(
  ( (MissingZero!3044 (index!14352 (_ BitVec 32))) (Found!3044 (index!14353 (_ BitVec 32))) (Intermediate!3044 (undefined!3856 Bool) (index!14354 (_ BitVec 32)) (x!32722 (_ BitVec 32))) (Undefined!3044) (MissingVacant!3044 (index!14355 (_ BitVec 32))) )
))
(declare-fun lt!157926 () SeekEntryResult!3044)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16800 (_ BitVec 32)) SeekEntryResult!3044)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328346 (= res!180864 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157926))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!328346 (= lt!157926 (Intermediate!3044 false resIndex!58 resX!58))))

(declare-fun b!328347 () Bool)

(declare-fun res!180867 () Bool)

(assert (=> b!328347 (=> (not res!180867) (not e!201853))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328347 (= res!180867 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157926))))

(declare-fun b!328348 () Bool)

(declare-fun res!180870 () Bool)

(assert (=> b!328348 (=> (not res!180870) (not e!201853))))

(assert (=> b!328348 (= res!180870 (and (= (select (arr!7948 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8300 a!3305))))))

(declare-fun b!328349 () Bool)

(declare-fun res!180868 () Bool)

(assert (=> b!328349 (=> (not res!180868) (not e!201854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16800 (_ BitVec 32)) Bool)

(assert (=> b!328349 (= res!180868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328350 () Bool)

(declare-fun res!180865 () Bool)

(assert (=> b!328350 (=> (not res!180865) (not e!201854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328350 (= res!180865 (validKeyInArray!0 k0!2497))))

(declare-fun b!328351 () Bool)

(assert (=> b!328351 (= e!201853 (bvslt (bvsub #b01111111111111111111111111111110 x!1490) #b00000000000000000000000000000000))))

(declare-fun res!180869 () Bool)

(assert (=> start!32936 (=> (not res!180869) (not e!201854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32936 (= res!180869 (validMask!0 mask!3777))))

(assert (=> start!32936 e!201854))

(declare-fun array_inv!5898 (array!16800) Bool)

(assert (=> start!32936 (array_inv!5898 a!3305)))

(assert (=> start!32936 true))

(declare-fun b!328352 () Bool)

(declare-fun res!180863 () Bool)

(assert (=> b!328352 (=> (not res!180863) (not e!201854))))

(declare-fun arrayContainsKey!0 (array!16800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328352 (= res!180863 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328353 () Bool)

(declare-fun res!180862 () Bool)

(assert (=> b!328353 (=> (not res!180862) (not e!201854))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16800 (_ BitVec 32)) SeekEntryResult!3044)

(assert (=> b!328353 (= res!180862 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3044 i!1250)))))

(assert (= (and start!32936 res!180869) b!328345))

(assert (= (and b!328345 res!180866) b!328350))

(assert (= (and b!328350 res!180865) b!328352))

(assert (= (and b!328352 res!180863) b!328353))

(assert (= (and b!328353 res!180862) b!328349))

(assert (= (and b!328349 res!180868) b!328346))

(assert (= (and b!328346 res!180864) b!328348))

(assert (= (and b!328348 res!180870) b!328347))

(assert (= (and b!328347 res!180867) b!328351))

(declare-fun m!334585 () Bool)

(assert (=> start!32936 m!334585))

(declare-fun m!334587 () Bool)

(assert (=> start!32936 m!334587))

(declare-fun m!334589 () Bool)

(assert (=> b!328349 m!334589))

(declare-fun m!334591 () Bool)

(assert (=> b!328352 m!334591))

(declare-fun m!334593 () Bool)

(assert (=> b!328347 m!334593))

(declare-fun m!334595 () Bool)

(assert (=> b!328353 m!334595))

(declare-fun m!334597 () Bool)

(assert (=> b!328350 m!334597))

(declare-fun m!334599 () Bool)

(assert (=> b!328348 m!334599))

(declare-fun m!334601 () Bool)

(assert (=> b!328346 m!334601))

(assert (=> b!328346 m!334601))

(declare-fun m!334603 () Bool)

(assert (=> b!328346 m!334603))

(check-sat (not b!328349) (not start!32936) (not b!328346) (not b!328350) (not b!328353) (not b!328352) (not b!328347))
(check-sat)
(get-model)

(declare-fun d!70059 () Bool)

(declare-fun res!180929 () Bool)

(declare-fun e!201881 () Bool)

(assert (=> d!70059 (=> res!180929 e!201881)))

(assert (=> d!70059 (= res!180929 (bvsge #b00000000000000000000000000000000 (size!8300 a!3305)))))

(assert (=> d!70059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201881)))

(declare-fun b!328416 () Bool)

(declare-fun e!201880 () Bool)

(assert (=> b!328416 (= e!201881 e!201880)))

(declare-fun c!51380 () Bool)

(assert (=> b!328416 (= c!51380 (validKeyInArray!0 (select (arr!7948 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!328417 () Bool)

(declare-fun e!201882 () Bool)

(assert (=> b!328417 (= e!201880 e!201882)))

(declare-fun lt!157941 () (_ BitVec 64))

(assert (=> b!328417 (= lt!157941 (select (arr!7948 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10156 0))(
  ( (Unit!10157) )
))
(declare-fun lt!157940 () Unit!10156)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16800 (_ BitVec 64) (_ BitVec 32)) Unit!10156)

(assert (=> b!328417 (= lt!157940 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157941 #b00000000000000000000000000000000))))

(assert (=> b!328417 (arrayContainsKey!0 a!3305 lt!157941 #b00000000000000000000000000000000)))

(declare-fun lt!157939 () Unit!10156)

(assert (=> b!328417 (= lt!157939 lt!157940)))

(declare-fun res!180930 () Bool)

(assert (=> b!328417 (= res!180930 (= (seekEntryOrOpen!0 (select (arr!7948 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3044 #b00000000000000000000000000000000)))))

(assert (=> b!328417 (=> (not res!180930) (not e!201882))))

(declare-fun b!328418 () Bool)

(declare-fun call!26114 () Bool)

(assert (=> b!328418 (= e!201880 call!26114)))

(declare-fun b!328419 () Bool)

(assert (=> b!328419 (= e!201882 call!26114)))

(declare-fun bm!26111 () Bool)

(assert (=> bm!26111 (= call!26114 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!70059 (not res!180929)) b!328416))

(assert (= (and b!328416 c!51380) b!328417))

(assert (= (and b!328416 (not c!51380)) b!328418))

(assert (= (and b!328417 res!180930) b!328419))

(assert (= (or b!328419 b!328418) bm!26111))

(declare-fun m!334645 () Bool)

(assert (=> b!328416 m!334645))

(assert (=> b!328416 m!334645))

(declare-fun m!334647 () Bool)

(assert (=> b!328416 m!334647))

(assert (=> b!328417 m!334645))

(declare-fun m!334649 () Bool)

(assert (=> b!328417 m!334649))

(declare-fun m!334651 () Bool)

(assert (=> b!328417 m!334651))

(assert (=> b!328417 m!334645))

(declare-fun m!334653 () Bool)

(assert (=> b!328417 m!334653))

(declare-fun m!334655 () Bool)

(assert (=> bm!26111 m!334655))

(assert (=> b!328349 d!70059))

(declare-fun d!70063 () Bool)

(assert (=> d!70063 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328350 d!70063))

(declare-fun d!70065 () Bool)

(assert (=> d!70065 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32936 d!70065))

(declare-fun d!70071 () Bool)

(assert (=> d!70071 (= (array_inv!5898 a!3305) (bvsge (size!8300 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32936 d!70071))

(declare-fun b!328503 () Bool)

(declare-fun lt!157976 () SeekEntryResult!3044)

(assert (=> b!328503 (and (bvsge (index!14354 lt!157976) #b00000000000000000000000000000000) (bvslt (index!14354 lt!157976) (size!8300 a!3305)))))

(declare-fun e!201934 () Bool)

(assert (=> b!328503 (= e!201934 (= (select (arr!7948 a!3305) (index!14354 lt!157976)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328504 () Bool)

(assert (=> b!328504 (and (bvsge (index!14354 lt!157976) #b00000000000000000000000000000000) (bvslt (index!14354 lt!157976) (size!8300 a!3305)))))

(declare-fun res!180957 () Bool)

(assert (=> b!328504 (= res!180957 (= (select (arr!7948 a!3305) (index!14354 lt!157976)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328504 (=> res!180957 e!201934)))

(declare-fun b!328505 () Bool)

(declare-fun e!201935 () Bool)

(declare-fun e!201933 () Bool)

(assert (=> b!328505 (= e!201935 e!201933)))

(declare-fun res!180958 () Bool)

(get-info :version)

(assert (=> b!328505 (= res!180958 (and ((_ is Intermediate!3044) lt!157976) (not (undefined!3856 lt!157976)) (bvslt (x!32722 lt!157976) #b01111111111111111111111111111110) (bvsge (x!32722 lt!157976) #b00000000000000000000000000000000) (bvsge (x!32722 lt!157976) #b00000000000000000000000000000000)))))

(assert (=> b!328505 (=> (not res!180958) (not e!201933))))

(declare-fun b!328506 () Bool)

(declare-fun e!201932 () SeekEntryResult!3044)

(declare-fun e!201936 () SeekEntryResult!3044)

(assert (=> b!328506 (= e!201932 e!201936)))

(declare-fun c!51410 () Bool)

(declare-fun lt!157977 () (_ BitVec 64))

(assert (=> b!328506 (= c!51410 (or (= lt!157977 k0!2497) (= (bvadd lt!157977 lt!157977) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328507 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328507 (= e!201936 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328508 () Bool)

(assert (=> b!328508 (= e!201936 (Intermediate!3044 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328509 () Bool)

(assert (=> b!328509 (and (bvsge (index!14354 lt!157976) #b00000000000000000000000000000000) (bvslt (index!14354 lt!157976) (size!8300 a!3305)))))

(declare-fun res!180956 () Bool)

(assert (=> b!328509 (= res!180956 (= (select (arr!7948 a!3305) (index!14354 lt!157976)) k0!2497))))

(assert (=> b!328509 (=> res!180956 e!201934)))

(assert (=> b!328509 (= e!201933 e!201934)))

(declare-fun b!328510 () Bool)

(assert (=> b!328510 (= e!201932 (Intermediate!3044 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!70073 () Bool)

(assert (=> d!70073 e!201935))

(declare-fun c!51412 () Bool)

(assert (=> d!70073 (= c!51412 (and ((_ is Intermediate!3044) lt!157976) (undefined!3856 lt!157976)))))

(assert (=> d!70073 (= lt!157976 e!201932)))

(declare-fun c!51411 () Bool)

(assert (=> d!70073 (= c!51411 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70073 (= lt!157977 (select (arr!7948 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70073 (validMask!0 mask!3777)))

(assert (=> d!70073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157976)))

(declare-fun b!328511 () Bool)

(assert (=> b!328511 (= e!201935 (bvsge (x!32722 lt!157976) #b01111111111111111111111111111110))))

(assert (= (and d!70073 c!51411) b!328510))

(assert (= (and d!70073 (not c!51411)) b!328506))

(assert (= (and b!328506 c!51410) b!328508))

(assert (= (and b!328506 (not c!51410)) b!328507))

(assert (= (and d!70073 c!51412) b!328511))

(assert (= (and d!70073 (not c!51412)) b!328505))

(assert (= (and b!328505 res!180958) b!328509))

(assert (= (and b!328509 (not res!180956)) b!328504))

(assert (= (and b!328504 (not res!180957)) b!328503))

(assert (=> b!328507 m!334601))

(declare-fun m!334687 () Bool)

(assert (=> b!328507 m!334687))

(assert (=> b!328507 m!334687))

(declare-fun m!334689 () Bool)

(assert (=> b!328507 m!334689))

(declare-fun m!334691 () Bool)

(assert (=> b!328509 m!334691))

(assert (=> d!70073 m!334601))

(declare-fun m!334693 () Bool)

(assert (=> d!70073 m!334693))

(assert (=> d!70073 m!334585))

(assert (=> b!328504 m!334691))

(assert (=> b!328503 m!334691))

(assert (=> b!328346 d!70073))

(declare-fun d!70081 () Bool)

(declare-fun lt!157986 () (_ BitVec 32))

(declare-fun lt!157985 () (_ BitVec 32))

(assert (=> d!70081 (= lt!157986 (bvmul (bvxor lt!157985 (bvlshr lt!157985 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70081 (= lt!157985 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70081 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180959 (let ((h!5321 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32727 (bvmul (bvxor h!5321 (bvlshr h!5321 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32727 (bvlshr x!32727 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180959 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180959 #b00000000000000000000000000000000))))))

(assert (=> d!70081 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157986 (bvlshr lt!157986 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328346 d!70081))

(declare-fun b!328516 () Bool)

(declare-fun lt!157987 () SeekEntryResult!3044)

(assert (=> b!328516 (and (bvsge (index!14354 lt!157987) #b00000000000000000000000000000000) (bvslt (index!14354 lt!157987) (size!8300 a!3305)))))

(declare-fun e!201942 () Bool)

(assert (=> b!328516 (= e!201942 (= (select (arr!7948 a!3305) (index!14354 lt!157987)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328517 () Bool)

(assert (=> b!328517 (and (bvsge (index!14354 lt!157987) #b00000000000000000000000000000000) (bvslt (index!14354 lt!157987) (size!8300 a!3305)))))

(declare-fun res!180963 () Bool)

(assert (=> b!328517 (= res!180963 (= (select (arr!7948 a!3305) (index!14354 lt!157987)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328517 (=> res!180963 e!201942)))

(declare-fun b!328518 () Bool)

(declare-fun e!201943 () Bool)

(declare-fun e!201941 () Bool)

(assert (=> b!328518 (= e!201943 e!201941)))

(declare-fun res!180964 () Bool)

(assert (=> b!328518 (= res!180964 (and ((_ is Intermediate!3044) lt!157987) (not (undefined!3856 lt!157987)) (bvslt (x!32722 lt!157987) #b01111111111111111111111111111110) (bvsge (x!32722 lt!157987) #b00000000000000000000000000000000) (bvsge (x!32722 lt!157987) x!1490)))))

(assert (=> b!328518 (=> (not res!180964) (not e!201941))))

(declare-fun b!328519 () Bool)

(declare-fun e!201940 () SeekEntryResult!3044)

(declare-fun e!201944 () SeekEntryResult!3044)

(assert (=> b!328519 (= e!201940 e!201944)))

(declare-fun c!51414 () Bool)

(declare-fun lt!157988 () (_ BitVec 64))

(assert (=> b!328519 (= c!51414 (or (= lt!157988 k0!2497) (= (bvadd lt!157988 lt!157988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328520 () Bool)

(assert (=> b!328520 (= e!201944 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328521 () Bool)

(assert (=> b!328521 (= e!201944 (Intermediate!3044 false index!1840 x!1490))))

(declare-fun b!328522 () Bool)

(assert (=> b!328522 (and (bvsge (index!14354 lt!157987) #b00000000000000000000000000000000) (bvslt (index!14354 lt!157987) (size!8300 a!3305)))))

(declare-fun res!180962 () Bool)

(assert (=> b!328522 (= res!180962 (= (select (arr!7948 a!3305) (index!14354 lt!157987)) k0!2497))))

(assert (=> b!328522 (=> res!180962 e!201942)))

(assert (=> b!328522 (= e!201941 e!201942)))

(declare-fun b!328523 () Bool)

(assert (=> b!328523 (= e!201940 (Intermediate!3044 true index!1840 x!1490))))

(declare-fun d!70085 () Bool)

(assert (=> d!70085 e!201943))

(declare-fun c!51416 () Bool)

(assert (=> d!70085 (= c!51416 (and ((_ is Intermediate!3044) lt!157987) (undefined!3856 lt!157987)))))

(assert (=> d!70085 (= lt!157987 e!201940)))

(declare-fun c!51415 () Bool)

(assert (=> d!70085 (= c!51415 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70085 (= lt!157988 (select (arr!7948 a!3305) index!1840))))

(assert (=> d!70085 (validMask!0 mask!3777)))

(assert (=> d!70085 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157987)))

(declare-fun b!328524 () Bool)

(assert (=> b!328524 (= e!201943 (bvsge (x!32722 lt!157987) #b01111111111111111111111111111110))))

(assert (= (and d!70085 c!51415) b!328523))

(assert (= (and d!70085 (not c!51415)) b!328519))

(assert (= (and b!328519 c!51414) b!328521))

(assert (= (and b!328519 (not c!51414)) b!328520))

(assert (= (and d!70085 c!51416) b!328524))

(assert (= (and d!70085 (not c!51416)) b!328518))

(assert (= (and b!328518 res!180964) b!328522))

(assert (= (and b!328522 (not res!180962)) b!328517))

(assert (= (and b!328517 (not res!180963)) b!328516))

(declare-fun m!334707 () Bool)

(assert (=> b!328520 m!334707))

(assert (=> b!328520 m!334707))

(declare-fun m!334709 () Bool)

(assert (=> b!328520 m!334709))

(declare-fun m!334711 () Bool)

(assert (=> b!328522 m!334711))

(declare-fun m!334713 () Bool)

(assert (=> d!70085 m!334713))

(assert (=> d!70085 m!334585))

(assert (=> b!328517 m!334711))

(assert (=> b!328516 m!334711))

(assert (=> b!328347 d!70085))

(declare-fun d!70087 () Bool)

(declare-fun res!180969 () Bool)

(declare-fun e!201949 () Bool)

(assert (=> d!70087 (=> res!180969 e!201949)))

(assert (=> d!70087 (= res!180969 (= (select (arr!7948 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70087 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201949)))

(declare-fun b!328529 () Bool)

(declare-fun e!201950 () Bool)

(assert (=> b!328529 (= e!201949 e!201950)))

(declare-fun res!180970 () Bool)

(assert (=> b!328529 (=> (not res!180970) (not e!201950))))

(assert (=> b!328529 (= res!180970 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8300 a!3305)))))

(declare-fun b!328530 () Bool)

(assert (=> b!328530 (= e!201950 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70087 (not res!180969)) b!328529))

(assert (= (and b!328529 res!180970) b!328530))

(assert (=> d!70087 m!334645))

(declare-fun m!334715 () Bool)

(assert (=> b!328530 m!334715))

(assert (=> b!328352 d!70087))

(declare-fun b!328591 () Bool)

(declare-fun e!201985 () SeekEntryResult!3044)

(declare-fun e!201984 () SeekEntryResult!3044)

(assert (=> b!328591 (= e!201985 e!201984)))

(declare-fun lt!158016 () (_ BitVec 64))

(declare-fun lt!158017 () SeekEntryResult!3044)

(assert (=> b!328591 (= lt!158016 (select (arr!7948 a!3305) (index!14354 lt!158017)))))

(declare-fun c!51443 () Bool)

(assert (=> b!328591 (= c!51443 (= lt!158016 k0!2497))))

(declare-fun b!328592 () Bool)

(declare-fun e!201983 () SeekEntryResult!3044)

(assert (=> b!328592 (= e!201983 (MissingZero!3044 (index!14354 lt!158017)))))

(declare-fun b!328593 () Bool)

(declare-fun c!51441 () Bool)

(assert (=> b!328593 (= c!51441 (= lt!158016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328593 (= e!201984 e!201983)))

(declare-fun b!328594 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16800 (_ BitVec 32)) SeekEntryResult!3044)

(assert (=> b!328594 (= e!201983 (seekKeyOrZeroReturnVacant!0 (x!32722 lt!158017) (index!14354 lt!158017) (index!14354 lt!158017) k0!2497 a!3305 mask!3777))))

(declare-fun d!70089 () Bool)

(declare-fun lt!158015 () SeekEntryResult!3044)

(assert (=> d!70089 (and (or ((_ is Undefined!3044) lt!158015) (not ((_ is Found!3044) lt!158015)) (and (bvsge (index!14353 lt!158015) #b00000000000000000000000000000000) (bvslt (index!14353 lt!158015) (size!8300 a!3305)))) (or ((_ is Undefined!3044) lt!158015) ((_ is Found!3044) lt!158015) (not ((_ is MissingZero!3044) lt!158015)) (and (bvsge (index!14352 lt!158015) #b00000000000000000000000000000000) (bvslt (index!14352 lt!158015) (size!8300 a!3305)))) (or ((_ is Undefined!3044) lt!158015) ((_ is Found!3044) lt!158015) ((_ is MissingZero!3044) lt!158015) (not ((_ is MissingVacant!3044) lt!158015)) (and (bvsge (index!14355 lt!158015) #b00000000000000000000000000000000) (bvslt (index!14355 lt!158015) (size!8300 a!3305)))) (or ((_ is Undefined!3044) lt!158015) (ite ((_ is Found!3044) lt!158015) (= (select (arr!7948 a!3305) (index!14353 lt!158015)) k0!2497) (ite ((_ is MissingZero!3044) lt!158015) (= (select (arr!7948 a!3305) (index!14352 lt!158015)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3044) lt!158015) (= (select (arr!7948 a!3305) (index!14355 lt!158015)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70089 (= lt!158015 e!201985)))

(declare-fun c!51442 () Bool)

(assert (=> d!70089 (= c!51442 (and ((_ is Intermediate!3044) lt!158017) (undefined!3856 lt!158017)))))

(assert (=> d!70089 (= lt!158017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70089 (validMask!0 mask!3777)))

(assert (=> d!70089 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158015)))

(declare-fun b!328595 () Bool)

(assert (=> b!328595 (= e!201984 (Found!3044 (index!14354 lt!158017)))))

(declare-fun b!328596 () Bool)

(assert (=> b!328596 (= e!201985 Undefined!3044)))

(assert (= (and d!70089 c!51442) b!328596))

(assert (= (and d!70089 (not c!51442)) b!328591))

(assert (= (and b!328591 c!51443) b!328595))

(assert (= (and b!328591 (not c!51443)) b!328593))

(assert (= (and b!328593 c!51441) b!328592))

(assert (= (and b!328593 (not c!51441)) b!328594))

(declare-fun m!334733 () Bool)

(assert (=> b!328591 m!334733))

(declare-fun m!334735 () Bool)

(assert (=> b!328594 m!334735))

(declare-fun m!334737 () Bool)

(assert (=> d!70089 m!334737))

(assert (=> d!70089 m!334601))

(assert (=> d!70089 m!334603))

(assert (=> d!70089 m!334601))

(declare-fun m!334739 () Bool)

(assert (=> d!70089 m!334739))

(assert (=> d!70089 m!334585))

(declare-fun m!334741 () Bool)

(assert (=> d!70089 m!334741))

(assert (=> b!328353 d!70089))

(check-sat (not bm!26111) (not b!328594) (not d!70073) (not b!328530) (not d!70089) (not b!328520) (not d!70085) (not b!328417) (not b!328416) (not b!328507))
(check-sat)
