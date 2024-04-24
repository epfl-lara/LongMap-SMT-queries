; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121088 () Bool)

(assert start!121088)

(declare-fun b!1407886 () Bool)

(declare-fun res!945425 () Bool)

(declare-fun e!796934 () Bool)

(assert (=> b!1407886 (=> (not res!945425) (not e!796934))))

(declare-datatypes ((array!96317 0))(
  ( (array!96318 (arr!46504 (Array (_ BitVec 32) (_ BitVec 64))) (size!47055 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96317)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96317 (_ BitVec 32)) Bool)

(assert (=> b!1407886 (= res!945425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407888 () Bool)

(declare-fun e!796933 () Bool)

(assert (=> b!1407888 (= e!796934 (not e!796933))))

(declare-fun res!945423 () Bool)

(assert (=> b!1407888 (=> res!945423 e!796933)))

(declare-datatypes ((SeekEntryResult!10718 0))(
  ( (MissingZero!10718 (index!45249 (_ BitVec 32))) (Found!10718 (index!45250 (_ BitVec 32))) (Intermediate!10718 (undefined!11530 Bool) (index!45251 (_ BitVec 32)) (x!127000 (_ BitVec 32))) (Undefined!10718) (MissingVacant!10718 (index!45252 (_ BitVec 32))) )
))
(declare-fun lt!619894 () SeekEntryResult!10718)

(get-info :version)

(assert (=> b!1407888 (= res!945423 (or (not ((_ is Intermediate!10718) lt!619894)) (undefined!11530 lt!619894)))))

(declare-fun e!796931 () Bool)

(assert (=> b!1407888 e!796931))

(declare-fun res!945422 () Bool)

(assert (=> b!1407888 (=> (not res!945422) (not e!796931))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1407888 (= res!945422 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47437 0))(
  ( (Unit!47438) )
))
(declare-fun lt!619895 () Unit!47437)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47437)

(assert (=> b!1407888 (= lt!619895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96317 (_ BitVec 32)) SeekEntryResult!10718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407888 (= lt!619894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46504 a!2901) j!112) mask!2840) (select (arr!46504 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407889 () Bool)

(assert (=> b!1407889 (= e!796933 (and (bvsge (x!127000 lt!619894) #b00000000000000000000000000000000) (bvsle (x!127000 lt!619894) #b01111111111111111111111111111110)))))

(declare-fun b!1407890 () Bool)

(declare-fun res!945427 () Bool)

(assert (=> b!1407890 (=> res!945427 e!796933)))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407890 (= res!945427 (not (= lt!619894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901)) mask!2840))))))

(declare-fun b!1407891 () Bool)

(declare-fun res!945419 () Bool)

(assert (=> b!1407891 (=> (not res!945419) (not e!796934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407891 (= res!945419 (validKeyInArray!0 (select (arr!46504 a!2901) i!1037)))))

(declare-fun b!1407892 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96317 (_ BitVec 32)) SeekEntryResult!10718)

(assert (=> b!1407892 (= e!796931 (= (seekEntryOrOpen!0 (select (arr!46504 a!2901) j!112) a!2901 mask!2840) (Found!10718 j!112)))))

(declare-fun b!1407893 () Bool)

(declare-fun res!945420 () Bool)

(assert (=> b!1407893 (=> (not res!945420) (not e!796934))))

(assert (=> b!1407893 (= res!945420 (and (= (size!47055 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47055 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47055 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407894 () Bool)

(declare-fun res!945421 () Bool)

(assert (=> b!1407894 (=> (not res!945421) (not e!796934))))

(declare-datatypes ((List!33010 0))(
  ( (Nil!33007) (Cons!33006 (h!34268 (_ BitVec 64)) (t!47696 List!33010)) )
))
(declare-fun arrayNoDuplicates!0 (array!96317 (_ BitVec 32) List!33010) Bool)

(assert (=> b!1407894 (= res!945421 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33007))))

(declare-fun res!945426 () Bool)

(assert (=> start!121088 (=> (not res!945426) (not e!796934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121088 (= res!945426 (validMask!0 mask!2840))))

(assert (=> start!121088 e!796934))

(assert (=> start!121088 true))

(declare-fun array_inv!35785 (array!96317) Bool)

(assert (=> start!121088 (array_inv!35785 a!2901)))

(declare-fun b!1407887 () Bool)

(declare-fun res!945424 () Bool)

(assert (=> b!1407887 (=> (not res!945424) (not e!796934))))

(assert (=> b!1407887 (= res!945424 (validKeyInArray!0 (select (arr!46504 a!2901) j!112)))))

(assert (= (and start!121088 res!945426) b!1407893))

(assert (= (and b!1407893 res!945420) b!1407891))

(assert (= (and b!1407891 res!945419) b!1407887))

(assert (= (and b!1407887 res!945424) b!1407886))

(assert (= (and b!1407886 res!945425) b!1407894))

(assert (= (and b!1407894 res!945421) b!1407888))

(assert (= (and b!1407888 res!945422) b!1407892))

(assert (= (and b!1407888 (not res!945423)) b!1407890))

(assert (= (and b!1407890 (not res!945427)) b!1407889))

(declare-fun m!1297387 () Bool)

(assert (=> start!121088 m!1297387))

(declare-fun m!1297389 () Bool)

(assert (=> start!121088 m!1297389))

(declare-fun m!1297391 () Bool)

(assert (=> b!1407888 m!1297391))

(declare-fun m!1297393 () Bool)

(assert (=> b!1407888 m!1297393))

(assert (=> b!1407888 m!1297391))

(declare-fun m!1297395 () Bool)

(assert (=> b!1407888 m!1297395))

(assert (=> b!1407888 m!1297393))

(assert (=> b!1407888 m!1297391))

(declare-fun m!1297397 () Bool)

(assert (=> b!1407888 m!1297397))

(declare-fun m!1297399 () Bool)

(assert (=> b!1407888 m!1297399))

(declare-fun m!1297401 () Bool)

(assert (=> b!1407886 m!1297401))

(assert (=> b!1407892 m!1297391))

(assert (=> b!1407892 m!1297391))

(declare-fun m!1297403 () Bool)

(assert (=> b!1407892 m!1297403))

(declare-fun m!1297405 () Bool)

(assert (=> b!1407890 m!1297405))

(declare-fun m!1297407 () Bool)

(assert (=> b!1407890 m!1297407))

(assert (=> b!1407890 m!1297407))

(declare-fun m!1297409 () Bool)

(assert (=> b!1407890 m!1297409))

(assert (=> b!1407890 m!1297409))

(assert (=> b!1407890 m!1297407))

(declare-fun m!1297411 () Bool)

(assert (=> b!1407890 m!1297411))

(declare-fun m!1297413 () Bool)

(assert (=> b!1407894 m!1297413))

(assert (=> b!1407887 m!1297391))

(assert (=> b!1407887 m!1297391))

(declare-fun m!1297415 () Bool)

(assert (=> b!1407887 m!1297415))

(declare-fun m!1297417 () Bool)

(assert (=> b!1407891 m!1297417))

(assert (=> b!1407891 m!1297417))

(declare-fun m!1297419 () Bool)

(assert (=> b!1407891 m!1297419))

(check-sat (not b!1407894) (not b!1407886) (not b!1407892) (not start!121088) (not b!1407887) (not b!1407891) (not b!1407890) (not b!1407888))
(check-sat)
(get-model)

(declare-fun b!1407982 () Bool)

(declare-fun lt!619913 () SeekEntryResult!10718)

(assert (=> b!1407982 (and (bvsge (index!45251 lt!619913) #b00000000000000000000000000000000) (bvslt (index!45251 lt!619913) (size!47055 (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901)))))))

(declare-fun res!945499 () Bool)

(assert (=> b!1407982 (= res!945499 (= (select (arr!46504 (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901))) (index!45251 lt!619913)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796982 () Bool)

(assert (=> b!1407982 (=> res!945499 e!796982)))

(declare-fun e!796981 () SeekEntryResult!10718)

(declare-fun b!1407983 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407983 (= e!796981 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901)) mask!2840))))

(declare-fun b!1407984 () Bool)

(declare-fun e!796983 () SeekEntryResult!10718)

(assert (=> b!1407984 (= e!796983 (Intermediate!10718 true (toIndex!0 (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407985 () Bool)

(assert (=> b!1407985 (= e!796981 (Intermediate!10718 false (toIndex!0 (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151779 () Bool)

(declare-fun e!796984 () Bool)

(assert (=> d!151779 e!796984))

(declare-fun c!130713 () Bool)

(assert (=> d!151779 (= c!130713 (and ((_ is Intermediate!10718) lt!619913) (undefined!11530 lt!619913)))))

(assert (=> d!151779 (= lt!619913 e!796983)))

(declare-fun c!130712 () Bool)

(assert (=> d!151779 (= c!130712 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619912 () (_ BitVec 64))

(assert (=> d!151779 (= lt!619912 (select (arr!46504 (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901))) (toIndex!0 (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151779 (validMask!0 mask!2840)))

(assert (=> d!151779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901)) mask!2840) lt!619913)))

(declare-fun b!1407986 () Bool)

(assert (=> b!1407986 (and (bvsge (index!45251 lt!619913) #b00000000000000000000000000000000) (bvslt (index!45251 lt!619913) (size!47055 (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901)))))))

(declare-fun res!945498 () Bool)

(assert (=> b!1407986 (= res!945498 (= (select (arr!46504 (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901))) (index!45251 lt!619913)) (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407986 (=> res!945498 e!796982)))

(declare-fun e!796985 () Bool)

(assert (=> b!1407986 (= e!796985 e!796982)))

(declare-fun b!1407987 () Bool)

(assert (=> b!1407987 (= e!796984 e!796985)))

(declare-fun res!945497 () Bool)

(assert (=> b!1407987 (= res!945497 (and ((_ is Intermediate!10718) lt!619913) (not (undefined!11530 lt!619913)) (bvslt (x!127000 lt!619913) #b01111111111111111111111111111110) (bvsge (x!127000 lt!619913) #b00000000000000000000000000000000) (bvsge (x!127000 lt!619913) #b00000000000000000000000000000000)))))

(assert (=> b!1407987 (=> (not res!945497) (not e!796985))))

(declare-fun b!1407988 () Bool)

(assert (=> b!1407988 (= e!796983 e!796981)))

(declare-fun c!130714 () Bool)

(assert (=> b!1407988 (= c!130714 (or (= lt!619912 (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619912 lt!619912) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407989 () Bool)

(assert (=> b!1407989 (= e!796984 (bvsge (x!127000 lt!619913) #b01111111111111111111111111111110))))

(declare-fun b!1407990 () Bool)

(assert (=> b!1407990 (and (bvsge (index!45251 lt!619913) #b00000000000000000000000000000000) (bvslt (index!45251 lt!619913) (size!47055 (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901)))))))

(assert (=> b!1407990 (= e!796982 (= (select (arr!46504 (array!96318 (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47055 a!2901))) (index!45251 lt!619913)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151779 c!130712) b!1407984))

(assert (= (and d!151779 (not c!130712)) b!1407988))

(assert (= (and b!1407988 c!130714) b!1407985))

(assert (= (and b!1407988 (not c!130714)) b!1407983))

(assert (= (and d!151779 c!130713) b!1407989))

(assert (= (and d!151779 (not c!130713)) b!1407987))

(assert (= (and b!1407987 res!945497) b!1407986))

(assert (= (and b!1407986 (not res!945498)) b!1407982))

(assert (= (and b!1407982 (not res!945499)) b!1407990))

(declare-fun m!1297497 () Bool)

(assert (=> b!1407990 m!1297497))

(assert (=> d!151779 m!1297409))

(declare-fun m!1297499 () Bool)

(assert (=> d!151779 m!1297499))

(assert (=> d!151779 m!1297387))

(assert (=> b!1407986 m!1297497))

(assert (=> b!1407982 m!1297497))

(assert (=> b!1407983 m!1297409))

(declare-fun m!1297501 () Bool)

(assert (=> b!1407983 m!1297501))

(assert (=> b!1407983 m!1297501))

(assert (=> b!1407983 m!1297407))

(declare-fun m!1297503 () Bool)

(assert (=> b!1407983 m!1297503))

(assert (=> b!1407890 d!151779))

(declare-fun d!151787 () Bool)

(declare-fun lt!619928 () (_ BitVec 32))

(declare-fun lt!619927 () (_ BitVec 32))

(assert (=> d!151787 (= lt!619928 (bvmul (bvxor lt!619927 (bvlshr lt!619927 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151787 (= lt!619927 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151787 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945504 (let ((h!34271 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127004 (bvmul (bvxor h!34271 (bvlshr h!34271 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127004 (bvlshr x!127004 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945504 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945504 #b00000000000000000000000000000000))))))

(assert (=> d!151787 (= (toIndex!0 (select (store (arr!46504 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619928 (bvlshr lt!619928 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407890 d!151787))

(declare-fun d!151791 () Bool)

(assert (=> d!151791 (= (validKeyInArray!0 (select (arr!46504 a!2901) i!1037)) (and (not (= (select (arr!46504 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46504 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407891 d!151791))

(declare-fun d!151793 () Bool)

(assert (=> d!151793 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121088 d!151793))

(declare-fun d!151799 () Bool)

(assert (=> d!151799 (= (array_inv!35785 a!2901) (bvsge (size!47055 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121088 d!151799))

(declare-fun b!1408045 () Bool)

(declare-fun e!797022 () Bool)

(declare-fun call!67021 () Bool)

(assert (=> b!1408045 (= e!797022 call!67021)))

(declare-fun b!1408046 () Bool)

(declare-fun e!797023 () Bool)

(assert (=> b!1408046 (= e!797023 call!67021)))

(declare-fun d!151801 () Bool)

(declare-fun res!945519 () Bool)

(declare-fun e!797024 () Bool)

(assert (=> d!151801 (=> res!945519 e!797024)))

(assert (=> d!151801 (= res!945519 (bvsge #b00000000000000000000000000000000 (size!47055 a!2901)))))

(assert (=> d!151801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!797024)))

(declare-fun bm!67018 () Bool)

(assert (=> bm!67018 (= call!67021 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1408047 () Bool)

(assert (=> b!1408047 (= e!797023 e!797022)))

(declare-fun lt!619961 () (_ BitVec 64))

(assert (=> b!1408047 (= lt!619961 (select (arr!46504 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619960 () Unit!47437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96317 (_ BitVec 64) (_ BitVec 32)) Unit!47437)

(assert (=> b!1408047 (= lt!619960 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619961 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1408047 (arrayContainsKey!0 a!2901 lt!619961 #b00000000000000000000000000000000)))

(declare-fun lt!619959 () Unit!47437)

(assert (=> b!1408047 (= lt!619959 lt!619960)))

(declare-fun res!945520 () Bool)

(assert (=> b!1408047 (= res!945520 (= (seekEntryOrOpen!0 (select (arr!46504 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10718 #b00000000000000000000000000000000)))))

(assert (=> b!1408047 (=> (not res!945520) (not e!797022))))

(declare-fun b!1408048 () Bool)

(assert (=> b!1408048 (= e!797024 e!797023)))

(declare-fun c!130733 () Bool)

(assert (=> b!1408048 (= c!130733 (validKeyInArray!0 (select (arr!46504 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151801 (not res!945519)) b!1408048))

(assert (= (and b!1408048 c!130733) b!1408047))

(assert (= (and b!1408048 (not c!130733)) b!1408046))

(assert (= (and b!1408047 res!945520) b!1408045))

(assert (= (or b!1408045 b!1408046) bm!67018))

(declare-fun m!1297543 () Bool)

(assert (=> bm!67018 m!1297543))

(declare-fun m!1297545 () Bool)

(assert (=> b!1408047 m!1297545))

(declare-fun m!1297547 () Bool)

(assert (=> b!1408047 m!1297547))

(declare-fun m!1297549 () Bool)

(assert (=> b!1408047 m!1297549))

(assert (=> b!1408047 m!1297545))

(declare-fun m!1297553 () Bool)

(assert (=> b!1408047 m!1297553))

(assert (=> b!1408048 m!1297545))

(assert (=> b!1408048 m!1297545))

(declare-fun m!1297557 () Bool)

(assert (=> b!1408048 m!1297557))

(assert (=> b!1407886 d!151801))

(declare-fun b!1408100 () Bool)

(declare-fun c!130754 () Bool)

(declare-fun lt!619986 () (_ BitVec 64))

(assert (=> b!1408100 (= c!130754 (= lt!619986 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797055 () SeekEntryResult!10718)

(declare-fun e!797054 () SeekEntryResult!10718)

(assert (=> b!1408100 (= e!797055 e!797054)))

(declare-fun b!1408101 () Bool)

(declare-fun e!797053 () SeekEntryResult!10718)

(assert (=> b!1408101 (= e!797053 Undefined!10718)))

(declare-fun b!1408102 () Bool)

(assert (=> b!1408102 (= e!797053 e!797055)))

(declare-fun lt!619984 () SeekEntryResult!10718)

(assert (=> b!1408102 (= lt!619986 (select (arr!46504 a!2901) (index!45251 lt!619984)))))

(declare-fun c!130756 () Bool)

(assert (=> b!1408102 (= c!130756 (= lt!619986 (select (arr!46504 a!2901) j!112)))))

(declare-fun b!1408103 () Bool)

(assert (=> b!1408103 (= e!797055 (Found!10718 (index!45251 lt!619984)))))

(declare-fun b!1408104 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96317 (_ BitVec 32)) SeekEntryResult!10718)

(assert (=> b!1408104 (= e!797054 (seekKeyOrZeroReturnVacant!0 (x!127000 lt!619984) (index!45251 lt!619984) (index!45251 lt!619984) (select (arr!46504 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408105 () Bool)

(assert (=> b!1408105 (= e!797054 (MissingZero!10718 (index!45251 lt!619984)))))

(declare-fun d!151813 () Bool)

(declare-fun lt!619985 () SeekEntryResult!10718)

(assert (=> d!151813 (and (or ((_ is Undefined!10718) lt!619985) (not ((_ is Found!10718) lt!619985)) (and (bvsge (index!45250 lt!619985) #b00000000000000000000000000000000) (bvslt (index!45250 lt!619985) (size!47055 a!2901)))) (or ((_ is Undefined!10718) lt!619985) ((_ is Found!10718) lt!619985) (not ((_ is MissingZero!10718) lt!619985)) (and (bvsge (index!45249 lt!619985) #b00000000000000000000000000000000) (bvslt (index!45249 lt!619985) (size!47055 a!2901)))) (or ((_ is Undefined!10718) lt!619985) ((_ is Found!10718) lt!619985) ((_ is MissingZero!10718) lt!619985) (not ((_ is MissingVacant!10718) lt!619985)) (and (bvsge (index!45252 lt!619985) #b00000000000000000000000000000000) (bvslt (index!45252 lt!619985) (size!47055 a!2901)))) (or ((_ is Undefined!10718) lt!619985) (ite ((_ is Found!10718) lt!619985) (= (select (arr!46504 a!2901) (index!45250 lt!619985)) (select (arr!46504 a!2901) j!112)) (ite ((_ is MissingZero!10718) lt!619985) (= (select (arr!46504 a!2901) (index!45249 lt!619985)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10718) lt!619985) (= (select (arr!46504 a!2901) (index!45252 lt!619985)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151813 (= lt!619985 e!797053)))

(declare-fun c!130755 () Bool)

(assert (=> d!151813 (= c!130755 (and ((_ is Intermediate!10718) lt!619984) (undefined!11530 lt!619984)))))

(assert (=> d!151813 (= lt!619984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46504 a!2901) j!112) mask!2840) (select (arr!46504 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151813 (validMask!0 mask!2840)))

(assert (=> d!151813 (= (seekEntryOrOpen!0 (select (arr!46504 a!2901) j!112) a!2901 mask!2840) lt!619985)))

(assert (= (and d!151813 c!130755) b!1408101))

(assert (= (and d!151813 (not c!130755)) b!1408102))

(assert (= (and b!1408102 c!130756) b!1408103))

(assert (= (and b!1408102 (not c!130756)) b!1408100))

(assert (= (and b!1408100 c!130754) b!1408105))

(assert (= (and b!1408100 (not c!130754)) b!1408104))

(declare-fun m!1297571 () Bool)

(assert (=> b!1408102 m!1297571))

(assert (=> b!1408104 m!1297391))

(declare-fun m!1297573 () Bool)

(assert (=> b!1408104 m!1297573))

(declare-fun m!1297575 () Bool)

(assert (=> d!151813 m!1297575))

(assert (=> d!151813 m!1297387))

(assert (=> d!151813 m!1297391))

(assert (=> d!151813 m!1297393))

(assert (=> d!151813 m!1297393))

(assert (=> d!151813 m!1297391))

(assert (=> d!151813 m!1297397))

(declare-fun m!1297577 () Bool)

(assert (=> d!151813 m!1297577))

(declare-fun m!1297579 () Bool)

(assert (=> d!151813 m!1297579))

(assert (=> b!1407892 d!151813))

(declare-fun d!151821 () Bool)

(assert (=> d!151821 (= (validKeyInArray!0 (select (arr!46504 a!2901) j!112)) (and (not (= (select (arr!46504 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46504 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407887 d!151821))

(declare-fun b!1408110 () Bool)

(declare-fun e!797058 () Bool)

(declare-fun call!67023 () Bool)

(assert (=> b!1408110 (= e!797058 call!67023)))

(declare-fun b!1408111 () Bool)

(declare-fun e!797059 () Bool)

(assert (=> b!1408111 (= e!797059 call!67023)))

(declare-fun d!151823 () Bool)

(declare-fun res!945533 () Bool)

(declare-fun e!797060 () Bool)

(assert (=> d!151823 (=> res!945533 e!797060)))

(assert (=> d!151823 (= res!945533 (bvsge j!112 (size!47055 a!2901)))))

(assert (=> d!151823 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!797060)))

(declare-fun bm!67020 () Bool)

(assert (=> bm!67020 (= call!67023 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1408112 () Bool)

(assert (=> b!1408112 (= e!797059 e!797058)))

(declare-fun lt!619989 () (_ BitVec 64))

(assert (=> b!1408112 (= lt!619989 (select (arr!46504 a!2901) j!112))))

(declare-fun lt!619988 () Unit!47437)

(assert (=> b!1408112 (= lt!619988 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619989 j!112))))

(assert (=> b!1408112 (arrayContainsKey!0 a!2901 lt!619989 #b00000000000000000000000000000000)))

(declare-fun lt!619987 () Unit!47437)

(assert (=> b!1408112 (= lt!619987 lt!619988)))

(declare-fun res!945534 () Bool)

(assert (=> b!1408112 (= res!945534 (= (seekEntryOrOpen!0 (select (arr!46504 a!2901) j!112) a!2901 mask!2840) (Found!10718 j!112)))))

(assert (=> b!1408112 (=> (not res!945534) (not e!797058))))

(declare-fun b!1408113 () Bool)

(assert (=> b!1408113 (= e!797060 e!797059)))

(declare-fun c!130759 () Bool)

(assert (=> b!1408113 (= c!130759 (validKeyInArray!0 (select (arr!46504 a!2901) j!112)))))

(assert (= (and d!151823 (not res!945533)) b!1408113))

(assert (= (and b!1408113 c!130759) b!1408112))

(assert (= (and b!1408113 (not c!130759)) b!1408111))

(assert (= (and b!1408112 res!945534) b!1408110))

(assert (= (or b!1408110 b!1408111) bm!67020))

(declare-fun m!1297581 () Bool)

(assert (=> bm!67020 m!1297581))

(assert (=> b!1408112 m!1297391))

(declare-fun m!1297583 () Bool)

(assert (=> b!1408112 m!1297583))

(declare-fun m!1297585 () Bool)

(assert (=> b!1408112 m!1297585))

(assert (=> b!1408112 m!1297391))

(assert (=> b!1408112 m!1297403))

(assert (=> b!1408113 m!1297391))

(assert (=> b!1408113 m!1297391))

(assert (=> b!1408113 m!1297415))

(assert (=> b!1407888 d!151823))

(declare-fun d!151825 () Bool)

(assert (=> d!151825 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620004 () Unit!47437)

(declare-fun choose!38 (array!96317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47437)

(assert (=> d!151825 (= lt!620004 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151825 (validMask!0 mask!2840)))

(assert (=> d!151825 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!620004)))

(declare-fun bs!41016 () Bool)

(assert (= bs!41016 d!151825))

(assert (=> bs!41016 m!1297399))

(declare-fun m!1297599 () Bool)

(assert (=> bs!41016 m!1297599))

(assert (=> bs!41016 m!1297387))

(assert (=> b!1407888 d!151825))

(declare-fun b!1408138 () Bool)

(declare-fun lt!620006 () SeekEntryResult!10718)

(assert (=> b!1408138 (and (bvsge (index!45251 lt!620006) #b00000000000000000000000000000000) (bvslt (index!45251 lt!620006) (size!47055 a!2901)))))

(declare-fun res!945549 () Bool)

(assert (=> b!1408138 (= res!945549 (= (select (arr!46504 a!2901) (index!45251 lt!620006)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797076 () Bool)

(assert (=> b!1408138 (=> res!945549 e!797076)))

(declare-fun b!1408139 () Bool)

(declare-fun e!797075 () SeekEntryResult!10718)

(assert (=> b!1408139 (= e!797075 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46504 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46504 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408140 () Bool)

(declare-fun e!797077 () SeekEntryResult!10718)

(assert (=> b!1408140 (= e!797077 (Intermediate!10718 true (toIndex!0 (select (arr!46504 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1408141 () Bool)

(assert (=> b!1408141 (= e!797075 (Intermediate!10718 false (toIndex!0 (select (arr!46504 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151835 () Bool)

(declare-fun e!797078 () Bool)

(assert (=> d!151835 e!797078))

(declare-fun c!130767 () Bool)

(assert (=> d!151835 (= c!130767 (and ((_ is Intermediate!10718) lt!620006) (undefined!11530 lt!620006)))))

(assert (=> d!151835 (= lt!620006 e!797077)))

(declare-fun c!130766 () Bool)

(assert (=> d!151835 (= c!130766 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620005 () (_ BitVec 64))

(assert (=> d!151835 (= lt!620005 (select (arr!46504 a!2901) (toIndex!0 (select (arr!46504 a!2901) j!112) mask!2840)))))

(assert (=> d!151835 (validMask!0 mask!2840)))

(assert (=> d!151835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46504 a!2901) j!112) mask!2840) (select (arr!46504 a!2901) j!112) a!2901 mask!2840) lt!620006)))

(declare-fun b!1408142 () Bool)

(assert (=> b!1408142 (and (bvsge (index!45251 lt!620006) #b00000000000000000000000000000000) (bvslt (index!45251 lt!620006) (size!47055 a!2901)))))

(declare-fun res!945548 () Bool)

(assert (=> b!1408142 (= res!945548 (= (select (arr!46504 a!2901) (index!45251 lt!620006)) (select (arr!46504 a!2901) j!112)))))

(assert (=> b!1408142 (=> res!945548 e!797076)))

(declare-fun e!797079 () Bool)

(assert (=> b!1408142 (= e!797079 e!797076)))

(declare-fun b!1408143 () Bool)

(assert (=> b!1408143 (= e!797078 e!797079)))

(declare-fun res!945547 () Bool)

(assert (=> b!1408143 (= res!945547 (and ((_ is Intermediate!10718) lt!620006) (not (undefined!11530 lt!620006)) (bvslt (x!127000 lt!620006) #b01111111111111111111111111111110) (bvsge (x!127000 lt!620006) #b00000000000000000000000000000000) (bvsge (x!127000 lt!620006) #b00000000000000000000000000000000)))))

(assert (=> b!1408143 (=> (not res!945547) (not e!797079))))

(declare-fun b!1408144 () Bool)

(assert (=> b!1408144 (= e!797077 e!797075)))

(declare-fun c!130768 () Bool)

(assert (=> b!1408144 (= c!130768 (or (= lt!620005 (select (arr!46504 a!2901) j!112)) (= (bvadd lt!620005 lt!620005) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1408145 () Bool)

(assert (=> b!1408145 (= e!797078 (bvsge (x!127000 lt!620006) #b01111111111111111111111111111110))))

(declare-fun b!1408146 () Bool)

(assert (=> b!1408146 (and (bvsge (index!45251 lt!620006) #b00000000000000000000000000000000) (bvslt (index!45251 lt!620006) (size!47055 a!2901)))))

(assert (=> b!1408146 (= e!797076 (= (select (arr!46504 a!2901) (index!45251 lt!620006)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151835 c!130766) b!1408140))

(assert (= (and d!151835 (not c!130766)) b!1408144))

(assert (= (and b!1408144 c!130768) b!1408141))

(assert (= (and b!1408144 (not c!130768)) b!1408139))

(assert (= (and d!151835 c!130767) b!1408145))

(assert (= (and d!151835 (not c!130767)) b!1408143))

(assert (= (and b!1408143 res!945547) b!1408142))

(assert (= (and b!1408142 (not res!945548)) b!1408138))

(assert (= (and b!1408138 (not res!945549)) b!1408146))

(declare-fun m!1297605 () Bool)

(assert (=> b!1408146 m!1297605))

(assert (=> d!151835 m!1297393))

(declare-fun m!1297607 () Bool)

(assert (=> d!151835 m!1297607))

(assert (=> d!151835 m!1297387))

(assert (=> b!1408142 m!1297605))

(assert (=> b!1408138 m!1297605))

(assert (=> b!1408139 m!1297393))

(declare-fun m!1297609 () Bool)

(assert (=> b!1408139 m!1297609))

(assert (=> b!1408139 m!1297609))

(assert (=> b!1408139 m!1297391))

(declare-fun m!1297611 () Bool)

(assert (=> b!1408139 m!1297611))

(assert (=> b!1407888 d!151835))

(declare-fun d!151839 () Bool)

(declare-fun lt!620008 () (_ BitVec 32))

(declare-fun lt!620007 () (_ BitVec 32))

(assert (=> d!151839 (= lt!620008 (bvmul (bvxor lt!620007 (bvlshr lt!620007 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151839 (= lt!620007 ((_ extract 31 0) (bvand (bvxor (select (arr!46504 a!2901) j!112) (bvlshr (select (arr!46504 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151839 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945504 (let ((h!34271 ((_ extract 31 0) (bvand (bvxor (select (arr!46504 a!2901) j!112) (bvlshr (select (arr!46504 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127004 (bvmul (bvxor h!34271 (bvlshr h!34271 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127004 (bvlshr x!127004 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945504 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945504 #b00000000000000000000000000000000))))))

(assert (=> d!151839 (= (toIndex!0 (select (arr!46504 a!2901) j!112) mask!2840) (bvand (bvxor lt!620008 (bvlshr lt!620008 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407888 d!151839))

(declare-fun d!151841 () Bool)

(declare-fun res!945559 () Bool)

(declare-fun e!797090 () Bool)

(assert (=> d!151841 (=> res!945559 e!797090)))

(assert (=> d!151841 (= res!945559 (bvsge #b00000000000000000000000000000000 (size!47055 a!2901)))))

(assert (=> d!151841 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33007) e!797090)))

(declare-fun b!1408157 () Bool)

(declare-fun e!797088 () Bool)

(declare-fun contains!9837 (List!33010 (_ BitVec 64)) Bool)

(assert (=> b!1408157 (= e!797088 (contains!9837 Nil!33007 (select (arr!46504 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1408158 () Bool)

(declare-fun e!797091 () Bool)

(declare-fun call!67026 () Bool)

(assert (=> b!1408158 (= e!797091 call!67026)))

(declare-fun b!1408159 () Bool)

(declare-fun e!797089 () Bool)

(assert (=> b!1408159 (= e!797090 e!797089)))

(declare-fun res!945557 () Bool)

(assert (=> b!1408159 (=> (not res!945557) (not e!797089))))

(assert (=> b!1408159 (= res!945557 (not e!797088))))

(declare-fun res!945558 () Bool)

(assert (=> b!1408159 (=> (not res!945558) (not e!797088))))

(assert (=> b!1408159 (= res!945558 (validKeyInArray!0 (select (arr!46504 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1408160 () Bool)

(assert (=> b!1408160 (= e!797091 call!67026)))

(declare-fun bm!67023 () Bool)

(declare-fun c!130771 () Bool)

(assert (=> bm!67023 (= call!67026 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130771 (Cons!33006 (select (arr!46504 a!2901) #b00000000000000000000000000000000) Nil!33007) Nil!33007)))))

(declare-fun b!1408161 () Bool)

(assert (=> b!1408161 (= e!797089 e!797091)))

(assert (=> b!1408161 (= c!130771 (validKeyInArray!0 (select (arr!46504 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151841 (not res!945559)) b!1408159))

(assert (= (and b!1408159 res!945558) b!1408157))

(assert (= (and b!1408159 res!945557) b!1408161))

(assert (= (and b!1408161 c!130771) b!1408158))

(assert (= (and b!1408161 (not c!130771)) b!1408160))

(assert (= (or b!1408158 b!1408160) bm!67023))

(assert (=> b!1408157 m!1297545))

(assert (=> b!1408157 m!1297545))

(declare-fun m!1297613 () Bool)

(assert (=> b!1408157 m!1297613))

(assert (=> b!1408159 m!1297545))

(assert (=> b!1408159 m!1297545))

(assert (=> b!1408159 m!1297557))

(assert (=> bm!67023 m!1297545))

(declare-fun m!1297615 () Bool)

(assert (=> bm!67023 m!1297615))

(assert (=> b!1408161 m!1297545))

(assert (=> b!1408161 m!1297545))

(assert (=> b!1408161 m!1297557))

(assert (=> b!1407894 d!151841))

(check-sat (not b!1408157) (not d!151835) (not bm!67018) (not b!1408113) (not b!1408048) (not b!1408161) (not bm!67023) (not d!151779) (not b!1408112) (not b!1408104) (not b!1408047) (not d!151825) (not b!1407983) (not b!1408139) (not d!151813) (not b!1408159) (not bm!67020))
(check-sat)
