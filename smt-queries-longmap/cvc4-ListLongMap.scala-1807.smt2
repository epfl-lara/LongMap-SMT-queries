; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32600 () Bool)

(assert start!32600)

(declare-fun b!325867 () Bool)

(declare-fun e!200779 () Bool)

(declare-fun e!200780 () Bool)

(assert (=> b!325867 (= e!200779 e!200780)))

(declare-fun res!179060 () Bool)

(assert (=> b!325867 (=> (not res!179060) (not e!200780))))

(declare-datatypes ((array!16688 0))(
  ( (array!16689 (arr!7900 (Array (_ BitVec 32) (_ BitVec 64))) (size!8252 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16688)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3031 0))(
  ( (MissingZero!3031 (index!14300 (_ BitVec 32))) (Found!3031 (index!14301 (_ BitVec 32))) (Intermediate!3031 (undefined!3843 Bool) (index!14302 (_ BitVec 32)) (x!32540 (_ BitVec 32))) (Undefined!3031) (MissingVacant!3031 (index!14303 (_ BitVec 32))) )
))
(declare-fun lt!157149 () SeekEntryResult!3031)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16688 (_ BitVec 32)) SeekEntryResult!3031)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325867 (= res!179060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157149))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325867 (= lt!157149 (Intermediate!3031 false resIndex!58 resX!58))))

(declare-fun b!325868 () Bool)

(declare-fun e!200782 () Bool)

(assert (=> b!325868 (= e!200780 e!200782)))

(declare-fun res!179065 () Bool)

(assert (=> b!325868 (=> (not res!179065) (not e!200782))))

(declare-fun lt!157148 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!325868 (= res!179065 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000) (bvsge lt!157148 #b00000000000000000000000000000000) (bvslt lt!157148 (size!8252 a!3305))))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325868 (= lt!157148 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun res!179057 () Bool)

(assert (=> start!32600 (=> (not res!179057) (not e!200779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32600 (= res!179057 (validMask!0 mask!3777))))

(assert (=> start!32600 e!200779))

(declare-fun array_inv!5863 (array!16688) Bool)

(assert (=> start!32600 (array_inv!5863 a!3305)))

(assert (=> start!32600 true))

(declare-fun b!325869 () Bool)

(declare-fun res!179067 () Bool)

(assert (=> b!325869 (=> (not res!179067) (not e!200780))))

(assert (=> b!325869 (= res!179067 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157149))))

(declare-fun b!325870 () Bool)

(declare-fun res!179064 () Bool)

(assert (=> b!325870 (=> (not res!179064) (not e!200779))))

(declare-fun arrayContainsKey!0 (array!16688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325870 (= res!179064 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325871 () Bool)

(declare-fun res!179059 () Bool)

(assert (=> b!325871 (=> (not res!179059) (not e!200780))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325871 (= res!179059 (and (= (select (arr!7900 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8252 a!3305))))))

(declare-fun b!325872 () Bool)

(assert (=> b!325872 (= e!200782 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!157148 k!2497 a!3305 mask!3777) lt!157149)))))

(declare-fun b!325873 () Bool)

(declare-fun res!179058 () Bool)

(assert (=> b!325873 (=> (not res!179058) (not e!200780))))

(assert (=> b!325873 (= res!179058 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7900 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325874 () Bool)

(declare-fun res!179061 () Bool)

(assert (=> b!325874 (=> (not res!179061) (not e!200779))))

(assert (=> b!325874 (= res!179061 (and (= (size!8252 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8252 a!3305))))))

(declare-fun b!325875 () Bool)

(declare-fun res!179063 () Bool)

(assert (=> b!325875 (=> (not res!179063) (not e!200779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325875 (= res!179063 (validKeyInArray!0 k!2497))))

(declare-fun b!325876 () Bool)

(declare-fun res!179066 () Bool)

(assert (=> b!325876 (=> (not res!179066) (not e!200779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16688 (_ BitVec 32)) Bool)

(assert (=> b!325876 (= res!179066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325877 () Bool)

(declare-fun res!179062 () Bool)

(assert (=> b!325877 (=> (not res!179062) (not e!200779))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16688 (_ BitVec 32)) SeekEntryResult!3031)

(assert (=> b!325877 (= res!179062 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3031 i!1250)))))

(assert (= (and start!32600 res!179057) b!325874))

(assert (= (and b!325874 res!179061) b!325875))

(assert (= (and b!325875 res!179063) b!325870))

(assert (= (and b!325870 res!179064) b!325877))

(assert (= (and b!325877 res!179062) b!325876))

(assert (= (and b!325876 res!179066) b!325867))

(assert (= (and b!325867 res!179060) b!325871))

(assert (= (and b!325871 res!179059) b!325869))

(assert (= (and b!325869 res!179067) b!325873))

(assert (= (and b!325873 res!179058) b!325868))

(assert (= (and b!325868 res!179065) b!325872))

(declare-fun m!332565 () Bool)

(assert (=> b!325877 m!332565))

(declare-fun m!332567 () Bool)

(assert (=> b!325872 m!332567))

(declare-fun m!332569 () Bool)

(assert (=> b!325875 m!332569))

(declare-fun m!332571 () Bool)

(assert (=> b!325876 m!332571))

(declare-fun m!332573 () Bool)

(assert (=> b!325869 m!332573))

(declare-fun m!332575 () Bool)

(assert (=> start!32600 m!332575))

(declare-fun m!332577 () Bool)

(assert (=> start!32600 m!332577))

(declare-fun m!332579 () Bool)

(assert (=> b!325868 m!332579))

(declare-fun m!332581 () Bool)

(assert (=> b!325867 m!332581))

(assert (=> b!325867 m!332581))

(declare-fun m!332583 () Bool)

(assert (=> b!325867 m!332583))

(declare-fun m!332585 () Bool)

(assert (=> b!325870 m!332585))

(declare-fun m!332587 () Bool)

(assert (=> b!325871 m!332587))

(declare-fun m!332589 () Bool)

(assert (=> b!325873 m!332589))

(push 1)

(assert (not b!325870))

(assert (not b!325876))

(assert (not b!325872))

(assert (not b!325877))

(assert (not start!32600))

(assert (not b!325875))

(assert (not b!325867))

(assert (not b!325869))

(assert (not b!325868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69715 () Bool)

(assert (=> d!69715 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32600 d!69715))

(declare-fun d!69719 () Bool)

(assert (=> d!69719 (= (array_inv!5863 a!3305) (bvsge (size!8252 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32600 d!69719))

(declare-fun d!69721 () Bool)

(declare-fun lt!157161 () (_ BitVec 32))

(assert (=> d!69721 (and (bvsge lt!157161 #b00000000000000000000000000000000) (bvslt lt!157161 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69721 (= lt!157161 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69721 (validMask!0 mask!3777)))

(assert (=> d!69721 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157161)))

(declare-fun bs!11333 () Bool)

(assert (= bs!11333 d!69721))

(declare-fun m!332605 () Bool)

(assert (=> bs!11333 m!332605))

(assert (=> bs!11333 m!332575))

(assert (=> b!325868 d!69721))

(declare-fun d!69723 () Bool)

(declare-fun lt!157179 () SeekEntryResult!3031)

(assert (=> d!69723 (and (or (is-Undefined!3031 lt!157179) (not (is-Found!3031 lt!157179)) (and (bvsge (index!14301 lt!157179) #b00000000000000000000000000000000) (bvslt (index!14301 lt!157179) (size!8252 a!3305)))) (or (is-Undefined!3031 lt!157179) (is-Found!3031 lt!157179) (not (is-MissingZero!3031 lt!157179)) (and (bvsge (index!14300 lt!157179) #b00000000000000000000000000000000) (bvslt (index!14300 lt!157179) (size!8252 a!3305)))) (or (is-Undefined!3031 lt!157179) (is-Found!3031 lt!157179) (is-MissingZero!3031 lt!157179) (not (is-MissingVacant!3031 lt!157179)) (and (bvsge (index!14303 lt!157179) #b00000000000000000000000000000000) (bvslt (index!14303 lt!157179) (size!8252 a!3305)))) (or (is-Undefined!3031 lt!157179) (ite (is-Found!3031 lt!157179) (= (select (arr!7900 a!3305) (index!14301 lt!157179)) k!2497) (ite (is-MissingZero!3031 lt!157179) (= (select (arr!7900 a!3305) (index!14300 lt!157179)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3031 lt!157179) (= (select (arr!7900 a!3305) (index!14303 lt!157179)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!200826 () SeekEntryResult!3031)

(assert (=> d!69723 (= lt!157179 e!200826)))

(declare-fun c!51053 () Bool)

(declare-fun lt!157177 () SeekEntryResult!3031)

(assert (=> d!69723 (= c!51053 (and (is-Intermediate!3031 lt!157177) (undefined!3843 lt!157177)))))

(assert (=> d!69723 (= lt!157177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!69723 (validMask!0 mask!3777)))

(assert (=> d!69723 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157179)))

(declare-fun b!325941 () Bool)

(declare-fun e!200825 () SeekEntryResult!3031)

(assert (=> b!325941 (= e!200825 (MissingZero!3031 (index!14302 lt!157177)))))

(declare-fun b!325942 () Bool)

(declare-fun c!51054 () Bool)

(declare-fun lt!157178 () (_ BitVec 64))

(assert (=> b!325942 (= c!51054 (= lt!157178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!200827 () SeekEntryResult!3031)

(assert (=> b!325942 (= e!200827 e!200825)))

(declare-fun b!325943 () Bool)

(assert (=> b!325943 (= e!200827 (Found!3031 (index!14302 lt!157177)))))

(declare-fun b!325944 () Bool)

(assert (=> b!325944 (= e!200826 Undefined!3031)))

(declare-fun b!325945 () Bool)

(assert (=> b!325945 (= e!200826 e!200827)))

(assert (=> b!325945 (= lt!157178 (select (arr!7900 a!3305) (index!14302 lt!157177)))))

(declare-fun c!51052 () Bool)

(assert (=> b!325945 (= c!51052 (= lt!157178 k!2497))))

(declare-fun b!325946 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16688 (_ BitVec 32)) SeekEntryResult!3031)

(assert (=> b!325946 (= e!200825 (seekKeyOrZeroReturnVacant!0 (x!32540 lt!157177) (index!14302 lt!157177) (index!14302 lt!157177) k!2497 a!3305 mask!3777))))

(assert (= (and d!69723 c!51053) b!325944))

(assert (= (and d!69723 (not c!51053)) b!325945))

(assert (= (and b!325945 c!51052) b!325943))

(assert (= (and b!325945 (not c!51052)) b!325942))

(assert (= (and b!325942 c!51054) b!325941))

(assert (= (and b!325942 (not c!51054)) b!325946))

(assert (=> d!69723 m!332575))

(assert (=> d!69723 m!332581))

(assert (=> d!69723 m!332583))

(declare-fun m!332617 () Bool)

(assert (=> d!69723 m!332617))

(assert (=> d!69723 m!332581))

(declare-fun m!332619 () Bool)

(assert (=> d!69723 m!332619))

(declare-fun m!332621 () Bool)

(assert (=> d!69723 m!332621))

(declare-fun m!332623 () Bool)

(assert (=> b!325945 m!332623))

(declare-fun m!332625 () Bool)

(assert (=> b!325946 m!332625))

(assert (=> b!325877 d!69723))

(declare-fun b!326022 () Bool)

(declare-fun lt!157210 () SeekEntryResult!3031)

(assert (=> b!326022 (and (bvsge (index!14302 lt!157210) #b00000000000000000000000000000000) (bvslt (index!14302 lt!157210) (size!8252 a!3305)))))

(declare-fun e!200874 () Bool)

(assert (=> b!326022 (= e!200874 (= (select (arr!7900 a!3305) (index!14302 lt!157210)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!326023 () Bool)

(assert (=> b!326023 (and (bvsge (index!14302 lt!157210) #b00000000000000000000000000000000) (bvslt (index!14302 lt!157210) (size!8252 a!3305)))))

(declare-fun res!179124 () Bool)

(assert (=> b!326023 (= res!179124 (= (select (arr!7900 a!3305) (index!14302 lt!157210)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!326023 (=> res!179124 e!200874)))

(declare-fun b!326024 () Bool)

(declare-fun e!200872 () Bool)

(declare-fun e!200875 () Bool)

(assert (=> b!326024 (= e!200872 e!200875)))

(declare-fun res!179125 () Bool)

(assert (=> b!326024 (= res!179125 (and (is-Intermediate!3031 lt!157210) (not (undefined!3843 lt!157210)) (bvslt (x!32540 lt!157210) #b01111111111111111111111111111110) (bvsge (x!32540 lt!157210) #b00000000000000000000000000000000) (bvsge (x!32540 lt!157210) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!326024 (=> (not res!179125) (not e!200875))))

(declare-fun b!326025 () Bool)

(declare-fun e!200873 () SeekEntryResult!3031)

(assert (=> b!326025 (= e!200873 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 lt!157148 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!326026 () Bool)

(declare-fun e!200876 () SeekEntryResult!3031)

(assert (=> b!326026 (= e!200876 (Intermediate!3031 true lt!157148 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!326027 () Bool)

(assert (=> b!326027 (= e!200873 (Intermediate!3031 false lt!157148 (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun d!69735 () Bool)

(assert (=> d!69735 e!200872))

(declare-fun c!51081 () Bool)

(assert (=> d!69735 (= c!51081 (and (is-Intermediate!3031 lt!157210) (undefined!3843 lt!157210)))))

(assert (=> d!69735 (= lt!157210 e!200876)))

(declare-fun c!51080 () Bool)

(assert (=> d!69735 (= c!51080 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!157209 () (_ BitVec 64))

(assert (=> d!69735 (= lt!157209 (select (arr!7900 a!3305) lt!157148))))

(assert (=> d!69735 (validMask!0 mask!3777)))

(assert (=> d!69735 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) lt!157148 k!2497 a!3305 mask!3777) lt!157210)))

(declare-fun b!326028 () Bool)

(assert (=> b!326028 (= e!200872 (bvsge (x!32540 lt!157210) #b01111111111111111111111111111110))))

(declare-fun b!326029 () Bool)

(assert (=> b!326029 (= e!200876 e!200873)))

(declare-fun c!51079 () Bool)

(assert (=> b!326029 (= c!51079 (or (= lt!157209 k!2497) (= (bvadd lt!157209 lt!157209) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!326030 () Bool)

(assert (=> b!326030 (and (bvsge (index!14302 lt!157210) #b00000000000000000000000000000000) (bvslt (index!14302 lt!157210) (size!8252 a!3305)))))

(declare-fun res!179123 () Bool)

(assert (=> b!326030 (= res!179123 (= (select (arr!7900 a!3305) (index!14302 lt!157210)) k!2497))))

(assert (=> b!326030 (=> res!179123 e!200874)))

(assert (=> b!326030 (= e!200875 e!200874)))

(assert (= (and d!69735 c!51080) b!326026))

(assert (= (and d!69735 (not c!51080)) b!326029))

(assert (= (and b!326029 c!51079) b!326027))

(assert (= (and b!326029 (not c!51079)) b!326025))

(assert (= (and d!69735 c!51081) b!326028))

(assert (= (and d!69735 (not c!51081)) b!326024))

(assert (= (and b!326024 res!179125) b!326030))

(assert (= (and b!326030 (not res!179123)) b!326023))

(assert (= (and b!326023 (not res!179124)) b!326022))

(declare-fun m!332657 () Bool)

(assert (=> b!326022 m!332657))

(declare-fun m!332659 () Bool)

(assert (=> d!69735 m!332659))

(assert (=> d!69735 m!332575))

(assert (=> b!326023 m!332657))

(declare-fun m!332661 () Bool)

(assert (=> b!326025 m!332661))

(assert (=> b!326025 m!332661))

(declare-fun m!332663 () Bool)

(assert (=> b!326025 m!332663))

(assert (=> b!326030 m!332657))

(assert (=> b!325872 d!69735))

(declare-fun b!326031 () Bool)

(declare-fun lt!157212 () SeekEntryResult!3031)

(assert (=> b!326031 (and (bvsge (index!14302 lt!157212) #b00000000000000000000000000000000) (bvslt (index!14302 lt!157212) (size!8252 a!3305)))))

(declare-fun e!200879 () Bool)

(assert (=> b!326031 (= e!200879 (= (select (arr!7900 a!3305) (index!14302 lt!157212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!326032 () Bool)

(assert (=> b!326032 (and (bvsge (index!14302 lt!157212) #b00000000000000000000000000000000) (bvslt (index!14302 lt!157212) (size!8252 a!3305)))))

(declare-fun res!179127 () Bool)

(assert (=> b!326032 (= res!179127 (= (select (arr!7900 a!3305) (index!14302 lt!157212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!326032 (=> res!179127 e!200879)))

(declare-fun b!326033 () Bool)

(declare-fun e!200877 () Bool)

(declare-fun e!200880 () Bool)

(assert (=> b!326033 (= e!200877 e!200880)))

(declare-fun res!179128 () Bool)

(assert (=> b!326033 (= res!179128 (and (is-Intermediate!3031 lt!157212) (not (undefined!3843 lt!157212)) (bvslt (x!32540 lt!157212) #b01111111111111111111111111111110) (bvsge (x!32540 lt!157212) #b00000000000000000000000000000000) (bvsge (x!32540 lt!157212) #b00000000000000000000000000000000)))))

(assert (=> b!326033 (=> (not res!179128) (not e!200880))))

(declare-fun b!326034 () Bool)

(declare-fun e!200878 () SeekEntryResult!3031)

(assert (=> b!326034 (= e!200878 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!326035 () Bool)

(declare-fun e!200881 () SeekEntryResult!3031)

(assert (=> b!326035 (= e!200881 (Intermediate!3031 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!326036 () Bool)

(assert (=> b!326036 (= e!200878 (Intermediate!3031 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!69747 () Bool)

(assert (=> d!69747 e!200877))

(declare-fun c!51084 () Bool)

(assert (=> d!69747 (= c!51084 (and (is-Intermediate!3031 lt!157212) (undefined!3843 lt!157212)))))

(assert (=> d!69747 (= lt!157212 e!200881)))

(declare-fun c!51083 () Bool)

(assert (=> d!69747 (= c!51083 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157211 () (_ BitVec 64))

(assert (=> d!69747 (= lt!157211 (select (arr!7900 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!69747 (validMask!0 mask!3777)))

(assert (=> d!69747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157212)))

(declare-fun b!326037 () Bool)

(assert (=> b!326037 (= e!200877 (bvsge (x!32540 lt!157212) #b01111111111111111111111111111110))))

(declare-fun b!326038 () Bool)

(assert (=> b!326038 (= e!200881 e!200878)))

(declare-fun c!51082 () Bool)

(assert (=> b!326038 (= c!51082 (or (= lt!157211 k!2497) (= (bvadd lt!157211 lt!157211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!326039 () Bool)

(assert (=> b!326039 (and (bvsge (index!14302 lt!157212) #b00000000000000000000000000000000) (bvslt (index!14302 lt!157212) (size!8252 a!3305)))))

(declare-fun res!179126 () Bool)

(assert (=> b!326039 (= res!179126 (= (select (arr!7900 a!3305) (index!14302 lt!157212)) k!2497))))

(assert (=> b!326039 (=> res!179126 e!200879)))

(assert (=> b!326039 (= e!200880 e!200879)))

(assert (= (and d!69747 c!51083) b!326035))

(assert (= (and d!69747 (not c!51083)) b!326038))

(assert (= (and b!326038 c!51082) b!326036))

(assert (= (and b!326038 (not c!51082)) b!326034))

(assert (= (and d!69747 c!51084) b!326037))

(assert (= (and d!69747 (not c!51084)) b!326033))

(assert (= (and b!326033 res!179128) b!326039))

(assert (= (and b!326039 (not res!179126)) b!326032))

(assert (= (and b!326032 (not res!179127)) b!326031))

(declare-fun m!332665 () Bool)

(assert (=> b!326031 m!332665))

(assert (=> d!69747 m!332581))

(declare-fun m!332667 () Bool)

(assert (=> d!69747 m!332667))

(assert (=> d!69747 m!332575))

(assert (=> b!326032 m!332665))

(assert (=> b!326034 m!332581))

(declare-fun m!332669 () Bool)

(assert (=> b!326034 m!332669))

(assert (=> b!326034 m!332669))

(declare-fun m!332671 () Bool)

(assert (=> b!326034 m!332671))

(assert (=> b!326039 m!332665))

(assert (=> b!325867 d!69747))

(declare-fun d!69749 () Bool)

(declare-fun lt!157218 () (_ BitVec 32))

(declare-fun lt!157217 () (_ BitVec 32))

(assert (=> d!69749 (= lt!157218 (bvmul (bvxor lt!157217 (bvlshr lt!157217 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69749 (= lt!157217 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69749 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!179129 (let ((h!5395 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32547 (bvmul (bvxor h!5395 (bvlshr h!5395 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32547 (bvlshr x!32547 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!179129 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!179129 #b00000000000000000000000000000000))))))

(assert (=> d!69749 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157218 (bvlshr lt!157218 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!325867 d!69749))

(declare-fun d!69751 () Bool)

(declare-fun res!179135 () Bool)

(declare-fun e!200901 () Bool)

(assert (=> d!69751 (=> res!179135 e!200901)))

(assert (=> d!69751 (= res!179135 (bvsge #b00000000000000000000000000000000 (size!8252 a!3305)))))

(assert (=> d!69751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!200901)))

(declare-fun b!326072 () Bool)

(declare-fun e!200902 () Bool)

(assert (=> b!326072 (= e!200901 e!200902)))

(declare-fun c!51099 () Bool)

(assert (=> b!326072 (= c!51099 (validKeyInArray!0 (select (arr!7900 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!326073 () Bool)

(declare-fun e!200900 () Bool)

(declare-fun call!26089 () Bool)

(assert (=> b!326073 (= e!200900 call!26089)))

(declare-fun b!326074 () Bool)

(assert (=> b!326074 (= e!200902 e!200900)))

(declare-fun lt!157238 () (_ BitVec 64))

(assert (=> b!326074 (= lt!157238 (select (arr!7900 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10096 0))(
  ( (Unit!10097) )
))
(declare-fun lt!157237 () Unit!10096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16688 (_ BitVec 64) (_ BitVec 32)) Unit!10096)

(assert (=> b!326074 (= lt!157237 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157238 #b00000000000000000000000000000000))))

(assert (=> b!326074 (arrayContainsKey!0 a!3305 lt!157238 #b00000000000000000000000000000000)))

(declare-fun lt!157239 () Unit!10096)

(assert (=> b!326074 (= lt!157239 lt!157237)))

(declare-fun res!179134 () Bool)

(assert (=> b!326074 (= res!179134 (= (seekEntryOrOpen!0 (select (arr!7900 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3031 #b00000000000000000000000000000000)))))

(assert (=> b!326074 (=> (not res!179134) (not e!200900))))

(declare-fun bm!26086 () Bool)

(assert (=> bm!26086 (= call!26089 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!326075 () Bool)

(assert (=> b!326075 (= e!200902 call!26089)))

(assert (= (and d!69751 (not res!179135)) b!326072))

(assert (= (and b!326072 c!51099) b!326074))

(assert (= (and b!326072 (not c!51099)) b!326075))

(assert (= (and b!326074 res!179134) b!326073))

(assert (= (or b!326073 b!326075) bm!26086))

(declare-fun m!332673 () Bool)

(assert (=> b!326072 m!332673))

(assert (=> b!326072 m!332673))

(declare-fun m!332675 () Bool)

(assert (=> b!326072 m!332675))

(assert (=> b!326074 m!332673))

(declare-fun m!332677 () Bool)

(assert (=> b!326074 m!332677))

(declare-fun m!332679 () Bool)

(assert (=> b!326074 m!332679))

(assert (=> b!326074 m!332673))

(declare-fun m!332681 () Bool)

(assert (=> b!326074 m!332681))

(declare-fun m!332683 () Bool)

(assert (=> bm!26086 m!332683))

(assert (=> b!325876 d!69751))

(declare-fun b!326088 () Bool)

(declare-fun lt!157247 () SeekEntryResult!3031)

(assert (=> b!326088 (and (bvsge (index!14302 lt!157247) #b00000000000000000000000000000000) (bvslt (index!14302 lt!157247) (size!8252 a!3305)))))

(declare-fun e!200911 () Bool)

(assert (=> b!326088 (= e!200911 (= (select (arr!7900 a!3305) (index!14302 lt!157247)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!326089 () Bool)

(assert (=> b!326089 (and (bvsge (index!14302 lt!157247) #b00000000000000000000000000000000) (bvslt (index!14302 lt!157247) (size!8252 a!3305)))))

(declare-fun res!179137 () Bool)

(assert (=> b!326089 (= res!179137 (= (select (arr!7900 a!3305) (index!14302 lt!157247)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!326089 (=> res!179137 e!200911)))

(declare-fun b!326090 () Bool)

(declare-fun e!200909 () Bool)

(declare-fun e!200912 () Bool)

(assert (=> b!326090 (= e!200909 e!200912)))

(declare-fun res!179138 () Bool)

(assert (=> b!326090 (= res!179138 (and (is-Intermediate!3031 lt!157247) (not (undefined!3843 lt!157247)) (bvslt (x!32540 lt!157247) #b01111111111111111111111111111110) (bvsge (x!32540 lt!157247) #b00000000000000000000000000000000) (bvsge (x!32540 lt!157247) x!1490)))))

(assert (=> b!326090 (=> (not res!179138) (not e!200912))))

(declare-fun e!200910 () SeekEntryResult!3031)

(declare-fun b!326091 () Bool)

(assert (=> b!326091 (= e!200910 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!326092 () Bool)

(declare-fun e!200913 () SeekEntryResult!3031)

(assert (=> b!326092 (= e!200913 (Intermediate!3031 true index!1840 x!1490))))

(declare-fun b!326093 () Bool)

(assert (=> b!326093 (= e!200910 (Intermediate!3031 false index!1840 x!1490))))

(declare-fun d!69753 () Bool)

(assert (=> d!69753 e!200909))

(declare-fun c!51108 () Bool)

(assert (=> d!69753 (= c!51108 (and (is-Intermediate!3031 lt!157247) (undefined!3843 lt!157247)))))

(assert (=> d!69753 (= lt!157247 e!200913)))

(declare-fun c!51107 () Bool)

(assert (=> d!69753 (= c!51107 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157246 () (_ BitVec 64))

(assert (=> d!69753 (= lt!157246 (select (arr!7900 a!3305) index!1840))))

(assert (=> d!69753 (validMask!0 mask!3777)))

(assert (=> d!69753 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157247)))

(declare-fun b!326094 () Bool)

(assert (=> b!326094 (= e!200909 (bvsge (x!32540 lt!157247) #b01111111111111111111111111111110))))

(declare-fun b!326095 () Bool)

(assert (=> b!326095 (= e!200913 e!200910)))

(declare-fun c!51106 () Bool)

(assert (=> b!326095 (= c!51106 (or (= lt!157246 k!2497) (= (bvadd lt!157246 lt!157246) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!326096 () Bool)

(assert (=> b!326096 (and (bvsge (index!14302 lt!157247) #b00000000000000000000000000000000) (bvslt (index!14302 lt!157247) (size!8252 a!3305)))))

(declare-fun res!179136 () Bool)

(assert (=> b!326096 (= res!179136 (= (select (arr!7900 a!3305) (index!14302 lt!157247)) k!2497))))

(assert (=> b!326096 (=> res!179136 e!200911)))

(assert (=> b!326096 (= e!200912 e!200911)))

(assert (= (and d!69753 c!51107) b!326092))

(assert (= (and d!69753 (not c!51107)) b!326095))

(assert (= (and b!326095 c!51106) b!326093))

(assert (= (and b!326095 (not c!51106)) b!326091))

(assert (= (and d!69753 c!51108) b!326094))

(assert (= (and d!69753 (not c!51108)) b!326090))

(assert (= (and b!326090 res!179138) b!326096))

(assert (= (and b!326096 (not res!179136)) b!326089))

(assert (= (and b!326089 (not res!179137)) b!326088))

(declare-fun m!332705 () Bool)

(assert (=> b!326088 m!332705))

(assert (=> d!69753 m!332589))

(assert (=> d!69753 m!332575))

(assert (=> b!326089 m!332705))

(assert (=> b!326091 m!332579))

(assert (=> b!326091 m!332579))

(declare-fun m!332707 () Bool)

(assert (=> b!326091 m!332707))

(assert (=> b!326096 m!332705))

(assert (=> b!325869 d!69753))

(declare-fun d!69759 () Bool)

(assert (=> d!69759 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325875 d!69759))

(declare-fun d!69761 () Bool)

(declare-fun res!179147 () Bool)

(declare-fun e!200923 () Bool)

(assert (=> d!69761 (=> res!179147 e!200923)))

(assert (=> d!69761 (= res!179147 (= (select (arr!7900 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!69761 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!200923)))

(declare-fun b!326110 () Bool)

(declare-fun e!200924 () Bool)

(assert (=> b!326110 (= e!200923 e!200924)))

(declare-fun res!179148 () Bool)

(assert (=> b!326110 (=> (not res!179148) (not e!200924))))

(assert (=> b!326110 (= res!179148 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8252 a!3305)))))

(declare-fun b!326111 () Bool)

(assert (=> b!326111 (= e!200924 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69761 (not res!179147)) b!326110))

(assert (= (and b!326110 res!179148) b!326111))

(assert (=> d!69761 m!332673))

(declare-fun m!332717 () Bool)

(assert (=> b!326111 m!332717))

(assert (=> b!325870 d!69761))

(push 1)

