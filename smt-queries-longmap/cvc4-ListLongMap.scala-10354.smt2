; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122062 () Bool)

(assert start!122062)

(declare-fun b!1415877 () Bool)

(declare-fun e!801416 () Bool)

(declare-fun e!801418 () Bool)

(assert (=> b!1415877 (= e!801416 (not e!801418))))

(declare-fun res!951476 () Bool)

(assert (=> b!1415877 (=> res!951476 e!801418)))

(declare-datatypes ((SeekEntryResult!10911 0))(
  ( (MissingZero!10911 (index!46033 (_ BitVec 32))) (Found!10911 (index!46034 (_ BitVec 32))) (Intermediate!10911 (undefined!11723 Bool) (index!46035 (_ BitVec 32)) (x!127789 (_ BitVec 32))) (Undefined!10911) (MissingVacant!10911 (index!46036 (_ BitVec 32))) )
))
(declare-fun lt!624127 () SeekEntryResult!10911)

(assert (=> b!1415877 (= res!951476 (or (not (is-Intermediate!10911 lt!624127)) (undefined!11723 lt!624127)))))

(declare-fun e!801415 () Bool)

(assert (=> b!1415877 e!801415))

(declare-fun res!951474 () Bool)

(assert (=> b!1415877 (=> (not res!951474) (not e!801415))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96733 0))(
  ( (array!96734 (arr!46697 (Array (_ BitVec 32) (_ BitVec 64))) (size!47248 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96733)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96733 (_ BitVec 32)) Bool)

(assert (=> b!1415877 (= res!951474 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47823 0))(
  ( (Unit!47824) )
))
(declare-fun lt!624122 () Unit!47823)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47823)

(assert (=> b!1415877 (= lt!624122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624123 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96733 (_ BitVec 32)) SeekEntryResult!10911)

(assert (=> b!1415877 (= lt!624127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624123 (select (arr!46697 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415877 (= lt!624123 (toIndex!0 (select (arr!46697 a!2901) j!112) mask!2840))))

(declare-fun b!1415879 () Bool)

(declare-fun res!951479 () Bool)

(assert (=> b!1415879 (=> (not res!951479) (not e!801416))))

(declare-datatypes ((List!33203 0))(
  ( (Nil!33200) (Cons!33199 (h!34491 (_ BitVec 64)) (t!47889 List!33203)) )
))
(declare-fun arrayNoDuplicates!0 (array!96733 (_ BitVec 32) List!33203) Bool)

(assert (=> b!1415879 (= res!951479 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33200))))

(declare-fun b!1415880 () Bool)

(declare-fun res!951477 () Bool)

(assert (=> b!1415880 (=> (not res!951477) (not e!801416))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415880 (= res!951477 (validKeyInArray!0 (select (arr!46697 a!2901) i!1037)))))

(declare-fun b!1415881 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96733 (_ BitVec 32)) SeekEntryResult!10911)

(assert (=> b!1415881 (= e!801415 (= (seekEntryOrOpen!0 (select (arr!46697 a!2901) j!112) a!2901 mask!2840) (Found!10911 j!112)))))

(declare-fun b!1415882 () Bool)

(declare-fun lt!624124 () SeekEntryResult!10911)

(declare-fun e!801414 () Bool)

(assert (=> b!1415882 (= e!801414 (or (bvslt (x!127789 lt!624127) #b00000000000000000000000000000000) (bvsgt (x!127789 lt!624127) #b01111111111111111111111111111110) (bvslt (x!127789 lt!624124) #b00000000000000000000000000000000) (bvsgt (x!127789 lt!624124) #b01111111111111111111111111111110) (bvslt lt!624123 #b00000000000000000000000000000000) (bvsge lt!624123 (size!47248 a!2901)) (and (bvsge (index!46035 lt!624127) #b00000000000000000000000000000000) (bvslt (index!46035 lt!624127) (size!47248 a!2901)))))))

(declare-fun e!801417 () Bool)

(assert (=> b!1415882 e!801417))

(declare-fun res!951473 () Bool)

(assert (=> b!1415882 (=> (not res!951473) (not e!801417))))

(assert (=> b!1415882 (= res!951473 (and (not (undefined!11723 lt!624124)) (= (index!46035 lt!624124) i!1037) (bvslt (x!127789 lt!624124) (x!127789 lt!624127)) (= (select (store (arr!46697 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46035 lt!624124)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624128 () Unit!47823)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47823)

(assert (=> b!1415882 (= lt!624128 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624123 (x!127789 lt!624127) (index!46035 lt!624127) (x!127789 lt!624124) (index!46035 lt!624124) (undefined!11723 lt!624124) mask!2840))))

(declare-fun b!1415883 () Bool)

(assert (=> b!1415883 (= e!801418 e!801414)))

(declare-fun res!951481 () Bool)

(assert (=> b!1415883 (=> res!951481 e!801414)))

(assert (=> b!1415883 (= res!951481 (or (= lt!624127 lt!624124) (not (is-Intermediate!10911 lt!624124))))))

(declare-fun lt!624125 () (_ BitVec 64))

(declare-fun lt!624126 () array!96733)

(assert (=> b!1415883 (= lt!624124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624125 mask!2840) lt!624125 lt!624126 mask!2840))))

(assert (=> b!1415883 (= lt!624125 (select (store (arr!46697 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415883 (= lt!624126 (array!96734 (store (arr!46697 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47248 a!2901)))))

(declare-fun b!1415884 () Bool)

(declare-fun res!951475 () Bool)

(assert (=> b!1415884 (=> (not res!951475) (not e!801416))))

(assert (=> b!1415884 (= res!951475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415885 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96733 (_ BitVec 32)) SeekEntryResult!10911)

(assert (=> b!1415885 (= e!801417 (= (seekEntryOrOpen!0 lt!624125 lt!624126 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127789 lt!624124) (index!46035 lt!624124) (index!46035 lt!624124) (select (arr!46697 a!2901) j!112) lt!624126 mask!2840)))))

(declare-fun b!1415886 () Bool)

(declare-fun res!951472 () Bool)

(assert (=> b!1415886 (=> (not res!951472) (not e!801416))))

(assert (=> b!1415886 (= res!951472 (and (= (size!47248 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47248 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47248 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415878 () Bool)

(declare-fun res!951480 () Bool)

(assert (=> b!1415878 (=> (not res!951480) (not e!801416))))

(assert (=> b!1415878 (= res!951480 (validKeyInArray!0 (select (arr!46697 a!2901) j!112)))))

(declare-fun res!951478 () Bool)

(assert (=> start!122062 (=> (not res!951478) (not e!801416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122062 (= res!951478 (validMask!0 mask!2840))))

(assert (=> start!122062 e!801416))

(assert (=> start!122062 true))

(declare-fun array_inv!35978 (array!96733) Bool)

(assert (=> start!122062 (array_inv!35978 a!2901)))

(assert (= (and start!122062 res!951478) b!1415886))

(assert (= (and b!1415886 res!951472) b!1415880))

(assert (= (and b!1415880 res!951477) b!1415878))

(assert (= (and b!1415878 res!951480) b!1415884))

(assert (= (and b!1415884 res!951475) b!1415879))

(assert (= (and b!1415879 res!951479) b!1415877))

(assert (= (and b!1415877 res!951474) b!1415881))

(assert (= (and b!1415877 (not res!951476)) b!1415883))

(assert (= (and b!1415883 (not res!951481)) b!1415882))

(assert (= (and b!1415882 res!951473) b!1415885))

(declare-fun m!1306345 () Bool)

(assert (=> b!1415878 m!1306345))

(assert (=> b!1415878 m!1306345))

(declare-fun m!1306347 () Bool)

(assert (=> b!1415878 m!1306347))

(declare-fun m!1306349 () Bool)

(assert (=> start!122062 m!1306349))

(declare-fun m!1306351 () Bool)

(assert (=> start!122062 m!1306351))

(assert (=> b!1415877 m!1306345))

(declare-fun m!1306353 () Bool)

(assert (=> b!1415877 m!1306353))

(assert (=> b!1415877 m!1306345))

(declare-fun m!1306355 () Bool)

(assert (=> b!1415877 m!1306355))

(declare-fun m!1306357 () Bool)

(assert (=> b!1415877 m!1306357))

(assert (=> b!1415877 m!1306345))

(declare-fun m!1306359 () Bool)

(assert (=> b!1415877 m!1306359))

(declare-fun m!1306361 () Bool)

(assert (=> b!1415884 m!1306361))

(declare-fun m!1306363 () Bool)

(assert (=> b!1415883 m!1306363))

(assert (=> b!1415883 m!1306363))

(declare-fun m!1306365 () Bool)

(assert (=> b!1415883 m!1306365))

(declare-fun m!1306367 () Bool)

(assert (=> b!1415883 m!1306367))

(declare-fun m!1306369 () Bool)

(assert (=> b!1415883 m!1306369))

(declare-fun m!1306371 () Bool)

(assert (=> b!1415879 m!1306371))

(declare-fun m!1306373 () Bool)

(assert (=> b!1415885 m!1306373))

(assert (=> b!1415885 m!1306345))

(assert (=> b!1415885 m!1306345))

(declare-fun m!1306375 () Bool)

(assert (=> b!1415885 m!1306375))

(assert (=> b!1415881 m!1306345))

(assert (=> b!1415881 m!1306345))

(declare-fun m!1306377 () Bool)

(assert (=> b!1415881 m!1306377))

(assert (=> b!1415882 m!1306367))

(declare-fun m!1306379 () Bool)

(assert (=> b!1415882 m!1306379))

(declare-fun m!1306381 () Bool)

(assert (=> b!1415882 m!1306381))

(declare-fun m!1306383 () Bool)

(assert (=> b!1415880 m!1306383))

(assert (=> b!1415880 m!1306383))

(declare-fun m!1306385 () Bool)

(assert (=> b!1415880 m!1306385))

(push 1)

(assert (not b!1415883))

(assert (not b!1415884))

(assert (not b!1415878))

(assert (not b!1415880))

(assert (not b!1415877))

(assert (not start!122062))

(assert (not b!1415881))

(assert (not b!1415882))

(assert (not b!1415885))

(assert (not b!1415879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!67225 () Bool)

(declare-fun call!67228 () Bool)

(declare-fun c!131696 () Bool)

(assert (=> bm!67225 (= call!67228 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131696 (Cons!33199 (select (arr!46697 a!2901) #b00000000000000000000000000000000) Nil!33200) Nil!33200)))))

(declare-fun d!152779 () Bool)

(declare-fun res!951536 () Bool)

(declare-fun e!801471 () Bool)

(assert (=> d!152779 (=> res!951536 e!801471)))

(assert (=> d!152779 (= res!951536 (bvsge #b00000000000000000000000000000000 (size!47248 a!2901)))))

(assert (=> d!152779 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33200) e!801471)))

(declare-fun b!1415958 () Bool)

(declare-fun e!801472 () Bool)

(assert (=> b!1415958 (= e!801472 call!67228)))

(declare-fun b!1415959 () Bool)

(declare-fun e!801473 () Bool)

(assert (=> b!1415959 (= e!801473 e!801472)))

(assert (=> b!1415959 (= c!131696 (validKeyInArray!0 (select (arr!46697 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1415960 () Bool)

(assert (=> b!1415960 (= e!801471 e!801473)))

(declare-fun res!951535 () Bool)

(assert (=> b!1415960 (=> (not res!951535) (not e!801473))))

(declare-fun e!801470 () Bool)

(assert (=> b!1415960 (= res!951535 (not e!801470))))

(declare-fun res!951537 () Bool)

(assert (=> b!1415960 (=> (not res!951537) (not e!801470))))

(assert (=> b!1415960 (= res!951537 (validKeyInArray!0 (select (arr!46697 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1415961 () Bool)

(assert (=> b!1415961 (= e!801472 call!67228)))

(declare-fun b!1415962 () Bool)

(declare-fun contains!9866 (List!33203 (_ BitVec 64)) Bool)

(assert (=> b!1415962 (= e!801470 (contains!9866 Nil!33200 (select (arr!46697 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152779 (not res!951536)) b!1415960))

(assert (= (and b!1415960 res!951537) b!1415962))

(assert (= (and b!1415960 res!951535) b!1415959))

(assert (= (and b!1415959 c!131696) b!1415961))

(assert (= (and b!1415959 (not c!131696)) b!1415958))

(assert (= (or b!1415961 b!1415958) bm!67225))

(declare-fun m!1306455 () Bool)

(assert (=> bm!67225 m!1306455))

(declare-fun m!1306457 () Bool)

(assert (=> bm!67225 m!1306457))

(assert (=> b!1415959 m!1306455))

(assert (=> b!1415959 m!1306455))

(declare-fun m!1306459 () Bool)

(assert (=> b!1415959 m!1306459))

(assert (=> b!1415960 m!1306455))

(assert (=> b!1415960 m!1306455))

(assert (=> b!1415960 m!1306459))

(assert (=> b!1415962 m!1306455))

(assert (=> b!1415962 m!1306455))

(declare-fun m!1306461 () Bool)

(assert (=> b!1415962 m!1306461))

(assert (=> b!1415879 d!152779))

(declare-fun d!152785 () Bool)

(assert (=> d!152785 (= (validKeyInArray!0 (select (arr!46697 a!2901) i!1037)) (and (not (= (select (arr!46697 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46697 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1415880 d!152785))

(declare-fun b!1416020 () Bool)

(declare-fun e!801504 () SeekEntryResult!10911)

(declare-fun lt!624196 () SeekEntryResult!10911)

(assert (=> b!1416020 (= e!801504 (Found!10911 (index!46035 lt!624196)))))

(declare-fun b!1416021 () Bool)

(declare-fun e!801505 () SeekEntryResult!10911)

(assert (=> b!1416021 (= e!801505 (seekKeyOrZeroReturnVacant!0 (x!127789 lt!624196) (index!46035 lt!624196) (index!46035 lt!624196) lt!624125 lt!624126 mask!2840))))

(declare-fun d!152787 () Bool)

(declare-fun lt!624195 () SeekEntryResult!10911)

(assert (=> d!152787 (and (or (is-Undefined!10911 lt!624195) (not (is-Found!10911 lt!624195)) (and (bvsge (index!46034 lt!624195) #b00000000000000000000000000000000) (bvslt (index!46034 lt!624195) (size!47248 lt!624126)))) (or (is-Undefined!10911 lt!624195) (is-Found!10911 lt!624195) (not (is-MissingZero!10911 lt!624195)) (and (bvsge (index!46033 lt!624195) #b00000000000000000000000000000000) (bvslt (index!46033 lt!624195) (size!47248 lt!624126)))) (or (is-Undefined!10911 lt!624195) (is-Found!10911 lt!624195) (is-MissingZero!10911 lt!624195) (not (is-MissingVacant!10911 lt!624195)) (and (bvsge (index!46036 lt!624195) #b00000000000000000000000000000000) (bvslt (index!46036 lt!624195) (size!47248 lt!624126)))) (or (is-Undefined!10911 lt!624195) (ite (is-Found!10911 lt!624195) (= (select (arr!46697 lt!624126) (index!46034 lt!624195)) lt!624125) (ite (is-MissingZero!10911 lt!624195) (= (select (arr!46697 lt!624126) (index!46033 lt!624195)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10911 lt!624195) (= (select (arr!46697 lt!624126) (index!46036 lt!624195)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!801506 () SeekEntryResult!10911)

(assert (=> d!152787 (= lt!624195 e!801506)))

(declare-fun c!131723 () Bool)

(assert (=> d!152787 (= c!131723 (and (is-Intermediate!10911 lt!624196) (undefined!11723 lt!624196)))))

(assert (=> d!152787 (= lt!624196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624125 mask!2840) lt!624125 lt!624126 mask!2840))))

(assert (=> d!152787 (validMask!0 mask!2840)))

(assert (=> d!152787 (= (seekEntryOrOpen!0 lt!624125 lt!624126 mask!2840) lt!624195)))

(declare-fun b!1416022 () Bool)

(declare-fun c!131722 () Bool)

(declare-fun lt!624197 () (_ BitVec 64))

(assert (=> b!1416022 (= c!131722 (= lt!624197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416022 (= e!801504 e!801505)))

(declare-fun b!1416023 () Bool)

(assert (=> b!1416023 (= e!801506 e!801504)))

(assert (=> b!1416023 (= lt!624197 (select (arr!46697 lt!624126) (index!46035 lt!624196)))))

(declare-fun c!131721 () Bool)

(assert (=> b!1416023 (= c!131721 (= lt!624197 lt!624125))))

(declare-fun b!1416024 () Bool)

(assert (=> b!1416024 (= e!801506 Undefined!10911)))

(declare-fun b!1416025 () Bool)

(assert (=> b!1416025 (= e!801505 (MissingZero!10911 (index!46035 lt!624196)))))

(assert (= (and d!152787 c!131723) b!1416024))

(assert (= (and d!152787 (not c!131723)) b!1416023))

(assert (= (and b!1416023 c!131721) b!1416020))

(assert (= (and b!1416023 (not c!131721)) b!1416022))

(assert (= (and b!1416022 c!131722) b!1416025))

(assert (= (and b!1416022 (not c!131722)) b!1416021))

(declare-fun m!1306481 () Bool)

(assert (=> b!1416021 m!1306481))

(declare-fun m!1306483 () Bool)

(assert (=> d!152787 m!1306483))

(assert (=> d!152787 m!1306363))

(assert (=> d!152787 m!1306365))

(assert (=> d!152787 m!1306349))

(declare-fun m!1306485 () Bool)

(assert (=> d!152787 m!1306485))

(assert (=> d!152787 m!1306363))

(declare-fun m!1306487 () Bool)

(assert (=> d!152787 m!1306487))

(declare-fun m!1306489 () Bool)

(assert (=> b!1416023 m!1306489))

(assert (=> b!1415885 d!152787))

(declare-fun lt!624214 () SeekEntryResult!10911)

(declare-fun d!152797 () Bool)

(assert (=> d!152797 (and (or (is-Undefined!10911 lt!624214) (not (is-Found!10911 lt!624214)) (and (bvsge (index!46034 lt!624214) #b00000000000000000000000000000000) (bvslt (index!46034 lt!624214) (size!47248 lt!624126)))) (or (is-Undefined!10911 lt!624214) (is-Found!10911 lt!624214) (not (is-MissingVacant!10911 lt!624214)) (not (= (index!46036 lt!624214) (index!46035 lt!624124))) (and (bvsge (index!46036 lt!624214) #b00000000000000000000000000000000) (bvslt (index!46036 lt!624214) (size!47248 lt!624126)))) (or (is-Undefined!10911 lt!624214) (ite (is-Found!10911 lt!624214) (= (select (arr!46697 lt!624126) (index!46034 lt!624214)) (select (arr!46697 a!2901) j!112)) (and (is-MissingVacant!10911 lt!624214) (= (index!46036 lt!624214) (index!46035 lt!624124)) (= (select (arr!46697 lt!624126) (index!46036 lt!624214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!801530 () SeekEntryResult!10911)

(assert (=> d!152797 (= lt!624214 e!801530)))

(declare-fun c!131747 () Bool)

(assert (=> d!152797 (= c!131747 (bvsge (x!127789 lt!624124) #b01111111111111111111111111111110))))

(declare-fun lt!624215 () (_ BitVec 64))

(assert (=> d!152797 (= lt!624215 (select (arr!46697 lt!624126) (index!46035 lt!624124)))))

(assert (=> d!152797 (validMask!0 mask!2840)))

(assert (=> d!152797 (= (seekKeyOrZeroReturnVacant!0 (x!127789 lt!624124) (index!46035 lt!624124) (index!46035 lt!624124) (select (arr!46697 a!2901) j!112) lt!624126 mask!2840) lt!624214)))

(declare-fun b!1416070 () Bool)

(declare-fun c!131745 () Bool)

(assert (=> b!1416070 (= c!131745 (= lt!624215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!801532 () SeekEntryResult!10911)

(declare-fun e!801531 () SeekEntryResult!10911)

(assert (=> b!1416070 (= e!801532 e!801531)))

(declare-fun b!1416071 () Bool)

(assert (=> b!1416071 (= e!801532 (Found!10911 (index!46035 lt!624124)))))

(declare-fun b!1416072 () Bool)

(assert (=> b!1416072 (= e!801530 e!801532)))

(declare-fun c!131746 () Bool)

(assert (=> b!1416072 (= c!131746 (= lt!624215 (select (arr!46697 a!2901) j!112)))))

(declare-fun b!1416073 () Bool)

(assert (=> b!1416073 (= e!801530 Undefined!10911)))

(declare-fun b!1416074 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416074 (= e!801531 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127789 lt!624124) #b00000000000000000000000000000001) (nextIndex!0 (index!46035 lt!624124) (bvadd (x!127789 lt!624124) #b00000000000000000000000000000001) mask!2840) (index!46035 lt!624124) (select (arr!46697 a!2901) j!112) lt!624126 mask!2840))))

(declare-fun b!1416075 () Bool)

(assert (=> b!1416075 (= e!801531 (MissingVacant!10911 (index!46035 lt!624124)))))

(assert (= (and d!152797 c!131747) b!1416073))

(assert (= (and d!152797 (not c!131747)) b!1416072))

(assert (= (and b!1416072 c!131746) b!1416071))

(assert (= (and b!1416072 (not c!131746)) b!1416070))

(assert (= (and b!1416070 c!131745) b!1416075))

(assert (= (and b!1416070 (not c!131745)) b!1416074))

(declare-fun m!1306501 () Bool)

(assert (=> d!152797 m!1306501))

(declare-fun m!1306503 () Bool)

(assert (=> d!152797 m!1306503))

(declare-fun m!1306505 () Bool)

(assert (=> d!152797 m!1306505))

(assert (=> d!152797 m!1306349))

(declare-fun m!1306507 () Bool)

(assert (=> b!1416074 m!1306507))

(assert (=> b!1416074 m!1306507))

(assert (=> b!1416074 m!1306345))

(declare-fun m!1306509 () Bool)

(assert (=> b!1416074 m!1306509))

(assert (=> b!1415885 d!152797))

(declare-fun b!1416082 () Bool)

(declare-fun e!801537 () SeekEntryResult!10911)

(declare-fun lt!624223 () SeekEntryResult!10911)

(assert (=> b!1416082 (= e!801537 (Found!10911 (index!46035 lt!624223)))))

(declare-fun b!1416083 () Bool)

(declare-fun e!801538 () SeekEntryResult!10911)

(assert (=> b!1416083 (= e!801538 (seekKeyOrZeroReturnVacant!0 (x!127789 lt!624223) (index!46035 lt!624223) (index!46035 lt!624223) (select (arr!46697 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!152801 () Bool)

(declare-fun lt!624222 () SeekEntryResult!10911)

(assert (=> d!152801 (and (or (is-Undefined!10911 lt!624222) (not (is-Found!10911 lt!624222)) (and (bvsge (index!46034 lt!624222) #b00000000000000000000000000000000) (bvslt (index!46034 lt!624222) (size!47248 a!2901)))) (or (is-Undefined!10911 lt!624222) (is-Found!10911 lt!624222) (not (is-MissingZero!10911 lt!624222)) (and (bvsge (index!46033 lt!624222) #b00000000000000000000000000000000) (bvslt (index!46033 lt!624222) (size!47248 a!2901)))) (or (is-Undefined!10911 lt!624222) (is-Found!10911 lt!624222) (is-MissingZero!10911 lt!624222) (not (is-MissingVacant!10911 lt!624222)) (and (bvsge (index!46036 lt!624222) #b00000000000000000000000000000000) (bvslt (index!46036 lt!624222) (size!47248 a!2901)))) (or (is-Undefined!10911 lt!624222) (ite (is-Found!10911 lt!624222) (= (select (arr!46697 a!2901) (index!46034 lt!624222)) (select (arr!46697 a!2901) j!112)) (ite (is-MissingZero!10911 lt!624222) (= (select (arr!46697 a!2901) (index!46033 lt!624222)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10911 lt!624222) (= (select (arr!46697 a!2901) (index!46036 lt!624222)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!801539 () SeekEntryResult!10911)

(assert (=> d!152801 (= lt!624222 e!801539)))

(declare-fun c!131752 () Bool)

(assert (=> d!152801 (= c!131752 (and (is-Intermediate!10911 lt!624223) (undefined!11723 lt!624223)))))

(assert (=> d!152801 (= lt!624223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46697 a!2901) j!112) mask!2840) (select (arr!46697 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152801 (validMask!0 mask!2840)))

(assert (=> d!152801 (= (seekEntryOrOpen!0 (select (arr!46697 a!2901) j!112) a!2901 mask!2840) lt!624222)))

(declare-fun b!1416084 () Bool)

(declare-fun c!131751 () Bool)

(declare-fun lt!624224 () (_ BitVec 64))

(assert (=> b!1416084 (= c!131751 (= lt!624224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416084 (= e!801537 e!801538)))

(declare-fun b!1416085 () Bool)

(assert (=> b!1416085 (= e!801539 e!801537)))

(assert (=> b!1416085 (= lt!624224 (select (arr!46697 a!2901) (index!46035 lt!624223)))))

(declare-fun c!131750 () Bool)

(assert (=> b!1416085 (= c!131750 (= lt!624224 (select (arr!46697 a!2901) j!112)))))

(declare-fun b!1416086 () Bool)

(assert (=> b!1416086 (= e!801539 Undefined!10911)))

(declare-fun b!1416087 () Bool)

(assert (=> b!1416087 (= e!801538 (MissingZero!10911 (index!46035 lt!624223)))))

(assert (= (and d!152801 c!131752) b!1416086))

(assert (= (and d!152801 (not c!131752)) b!1416085))

(assert (= (and b!1416085 c!131750) b!1416082))

(assert (= (and b!1416085 (not c!131750)) b!1416084))

(assert (= (and b!1416084 c!131751) b!1416087))

(assert (= (and b!1416084 (not c!131751)) b!1416083))

(assert (=> b!1416083 m!1306345))

(declare-fun m!1306511 () Bool)

(assert (=> b!1416083 m!1306511))

(declare-fun m!1306513 () Bool)

(assert (=> d!152801 m!1306513))

(assert (=> d!152801 m!1306353))

(assert (=> d!152801 m!1306345))

(declare-fun m!1306515 () Bool)

(assert (=> d!152801 m!1306515))

(assert (=> d!152801 m!1306349))

(declare-fun m!1306517 () Bool)

(assert (=> d!152801 m!1306517))

(assert (=> d!152801 m!1306345))

(assert (=> d!152801 m!1306353))

(declare-fun m!1306519 () Bool)

(assert (=> d!152801 m!1306519))

(declare-fun m!1306521 () Bool)

(assert (=> b!1416085 m!1306521))

(assert (=> b!1415881 d!152801))

(declare-fun d!152803 () Bool)

(assert (=> d!152803 (and (not (undefined!11723 lt!624124)) (= (index!46035 lt!624124) i!1037) (bvslt (x!127789 lt!624124) (x!127789 lt!624127)))))

(declare-fun lt!624240 () Unit!47823)

(declare-fun choose!62 (array!96733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47823)

(assert (=> d!152803 (= lt!624240 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624123 (x!127789 lt!624127) (index!46035 lt!624127) (x!127789 lt!624124) (index!46035 lt!624124) (undefined!11723 lt!624124) mask!2840))))

(assert (=> d!152803 (validMask!0 mask!2840)))

(assert (=> d!152803 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624123 (x!127789 lt!624127) (index!46035 lt!624127) (x!127789 lt!624124) (index!46035 lt!624124) (undefined!11723 lt!624124) mask!2840) lt!624240)))

(declare-fun bs!41250 () Bool)

(assert (= bs!41250 d!152803))

(declare-fun m!1306559 () Bool)

(assert (=> bs!41250 m!1306559))

(assert (=> bs!41250 m!1306349))

(assert (=> b!1415882 d!152803))

(declare-fun d!152815 () Bool)

(declare-fun res!951561 () Bool)

(declare-fun e!801562 () Bool)

(assert (=> d!152815 (=> res!951561 e!801562)))

(assert (=> d!152815 (= res!951561 (bvsge j!112 (size!47248 a!2901)))))

(assert (=> d!152815 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!801562)))

(declare-fun bm!67231 () Bool)

(declare-fun call!67234 () Bool)

(assert (=> bm!67231 (= call!67234 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1416121 () Bool)

(declare-fun e!801561 () Bool)

(assert (=> b!1416121 (= e!801561 call!67234)))

(declare-fun b!1416122 () Bool)

(declare-fun e!801560 () Bool)

(assert (=> b!1416122 (= e!801560 call!67234)))

(declare-fun b!1416123 () Bool)

(assert (=> b!1416123 (= e!801561 e!801560)))

(declare-fun lt!624251 () (_ BitVec 64))

(assert (=> b!1416123 (= lt!624251 (select (arr!46697 a!2901) j!112))))

(declare-fun lt!624250 () Unit!47823)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96733 (_ BitVec 64) (_ BitVec 32)) Unit!47823)

(assert (=> b!1416123 (= lt!624250 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!624251 j!112))))

(declare-fun arrayContainsKey!0 (array!96733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1416123 (arrayContainsKey!0 a!2901 lt!624251 #b00000000000000000000000000000000)))

(declare-fun lt!624252 () Unit!47823)

(assert (=> b!1416123 (= lt!624252 lt!624250)))

(declare-fun res!951562 () Bool)

(assert (=> b!1416123 (= res!951562 (= (seekEntryOrOpen!0 (select (arr!46697 a!2901) j!112) a!2901 mask!2840) (Found!10911 j!112)))))

(assert (=> b!1416123 (=> (not res!951562) (not e!801560))))

(declare-fun b!1416124 () Bool)

(assert (=> b!1416124 (= e!801562 e!801561)))

(declare-fun c!131765 () Bool)

(assert (=> b!1416124 (= c!131765 (validKeyInArray!0 (select (arr!46697 a!2901) j!112)))))

(assert (= (and d!152815 (not res!951561)) b!1416124))

(assert (= (and b!1416124 c!131765) b!1416123))

(assert (= (and b!1416124 (not c!131765)) b!1416121))

(assert (= (and b!1416123 res!951562) b!1416122))

(assert (= (or b!1416122 b!1416121) bm!67231))

(declare-fun m!1306563 () Bool)

(assert (=> bm!67231 m!1306563))

(assert (=> b!1416123 m!1306345))

(declare-fun m!1306565 () Bool)

(assert (=> b!1416123 m!1306565))

(declare-fun m!1306567 () Bool)

(assert (=> b!1416123 m!1306567))

(assert (=> b!1416123 m!1306345))

(assert (=> b!1416123 m!1306377))

(assert (=> b!1416124 m!1306345))

(assert (=> b!1416124 m!1306345))

(assert (=> b!1416124 m!1306347))

(assert (=> b!1415877 d!152815))

(declare-fun d!152819 () Bool)

(assert (=> d!152819 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624259 () Unit!47823)

(declare-fun choose!38 (array!96733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47823)

(assert (=> d!152819 (= lt!624259 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152819 (validMask!0 mask!2840)))

(assert (=> d!152819 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!624259)))

(declare-fun bs!41252 () Bool)

(assert (= bs!41252 d!152819))

(assert (=> bs!41252 m!1306355))

(declare-fun m!1306569 () Bool)

(assert (=> bs!41252 m!1306569))

(assert (=> bs!41252 m!1306349))

(assert (=> b!1415877 d!152819))

(declare-fun b!1416198 () Bool)

(declare-fun e!801605 () SeekEntryResult!10911)

(assert (=> b!1416198 (= e!801605 (Intermediate!10911 true lt!624123 #b00000000000000000000000000000000))))

(declare-fun d!152821 () Bool)

(declare-fun e!801607 () Bool)

(assert (=> d!152821 e!801607))

(declare-fun c!131794 () Bool)

(declare-fun lt!624278 () SeekEntryResult!10911)

(assert (=> d!152821 (= c!131794 (and (is-Intermediate!10911 lt!624278) (undefined!11723 lt!624278)))))

(assert (=> d!152821 (= lt!624278 e!801605)))

(declare-fun c!131793 () Bool)

(assert (=> d!152821 (= c!131793 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!624279 () (_ BitVec 64))

(assert (=> d!152821 (= lt!624279 (select (arr!46697 a!2901) lt!624123))))

(assert (=> d!152821 (validMask!0 mask!2840)))

(assert (=> d!152821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624123 (select (arr!46697 a!2901) j!112) a!2901 mask!2840) lt!624278)))

(declare-fun b!1416199 () Bool)

(declare-fun e!801606 () SeekEntryResult!10911)

(assert (=> b!1416199 (= e!801606 (Intermediate!10911 false lt!624123 #b00000000000000000000000000000000))))

(declare-fun b!1416200 () Bool)

(assert (=> b!1416200 (and (bvsge (index!46035 lt!624278) #b00000000000000000000000000000000) (bvslt (index!46035 lt!624278) (size!47248 a!2901)))))

(declare-fun e!801608 () Bool)

(assert (=> b!1416200 (= e!801608 (= (select (arr!46697 a!2901) (index!46035 lt!624278)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416201 () Bool)

(declare-fun e!801609 () Bool)

(assert (=> b!1416201 (= e!801607 e!801609)))

(declare-fun res!951585 () Bool)

(assert (=> b!1416201 (= res!951585 (and (is-Intermediate!10911 lt!624278) (not (undefined!11723 lt!624278)) (bvslt (x!127789 lt!624278) #b01111111111111111111111111111110) (bvsge (x!127789 lt!624278) #b00000000000000000000000000000000) (bvsge (x!127789 lt!624278) #b00000000000000000000000000000000)))))

(assert (=> b!1416201 (=> (not res!951585) (not e!801609))))

(declare-fun b!1416202 () Bool)

(assert (=> b!1416202 (and (bvsge (index!46035 lt!624278) #b00000000000000000000000000000000) (bvslt (index!46035 lt!624278) (size!47248 a!2901)))))

(declare-fun res!951586 () Bool)

(assert (=> b!1416202 (= res!951586 (= (select (arr!46697 a!2901) (index!46035 lt!624278)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416202 (=> res!951586 e!801608)))

(declare-fun b!1416203 () Bool)

(assert (=> b!1416203 (and (bvsge (index!46035 lt!624278) #b00000000000000000000000000000000) (bvslt (index!46035 lt!624278) (size!47248 a!2901)))))

(declare-fun res!951587 () Bool)

(assert (=> b!1416203 (= res!951587 (= (select (arr!46697 a!2901) (index!46035 lt!624278)) (select (arr!46697 a!2901) j!112)))))

(assert (=> b!1416203 (=> res!951587 e!801608)))

(assert (=> b!1416203 (= e!801609 e!801608)))

(declare-fun b!1416204 () Bool)

(assert (=> b!1416204 (= e!801607 (bvsge (x!127789 lt!624278) #b01111111111111111111111111111110))))

(declare-fun b!1416205 () Bool)

(assert (=> b!1416205 (= e!801605 e!801606)))

(declare-fun c!131792 () Bool)

(assert (=> b!1416205 (= c!131792 (or (= lt!624279 (select (arr!46697 a!2901) j!112)) (= (bvadd lt!624279 lt!624279) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1416206 () Bool)

(assert (=> b!1416206 (= e!801606 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!624123 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46697 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152821 c!131793) b!1416198))

(assert (= (and d!152821 (not c!131793)) b!1416205))

(assert (= (and b!1416205 c!131792) b!1416199))

(assert (= (and b!1416205 (not c!131792)) b!1416206))

(assert (= (and d!152821 c!131794) b!1416204))

(assert (= (and d!152821 (not c!131794)) b!1416201))

(assert (= (and b!1416201 res!951585) b!1416203))

(assert (= (and b!1416203 (not res!951587)) b!1416202))

(assert (= (and b!1416202 (not res!951586)) b!1416200))

(declare-fun m!1306589 () Bool)

(assert (=> d!152821 m!1306589))

(assert (=> d!152821 m!1306349))

(declare-fun m!1306591 () Bool)

(assert (=> b!1416202 m!1306591))

(assert (=> b!1416203 m!1306591))

(declare-fun m!1306593 () Bool)

(assert (=> b!1416206 m!1306593))

(assert (=> b!1416206 m!1306593))

(assert (=> b!1416206 m!1306345))

(declare-fun m!1306595 () Bool)

(assert (=> b!1416206 m!1306595))

(assert (=> b!1416200 m!1306591))

(assert (=> b!1415877 d!152821))

(declare-fun d!152827 () Bool)

(declare-fun lt!624292 () (_ BitVec 32))

(declare-fun lt!624291 () (_ BitVec 32))

(assert (=> d!152827 (= lt!624292 (bvmul (bvxor lt!624291 (bvlshr lt!624291 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152827 (= lt!624291 ((_ extract 31 0) (bvand (bvxor (select (arr!46697 a!2901) j!112) (bvlshr (select (arr!46697 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152827 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951588 (let ((h!34495 ((_ extract 31 0) (bvand (bvxor (select (arr!46697 a!2901) j!112) (bvlshr (select (arr!46697 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127801 (bvmul (bvxor h!34495 (bvlshr h!34495 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127801 (bvlshr x!127801 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951588 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951588 #b00000000000000000000000000000000))))))

(assert (=> d!152827 (= (toIndex!0 (select (arr!46697 a!2901) j!112) mask!2840) (bvand (bvxor lt!624292 (bvlshr lt!624292 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1415877 d!152827))

(declare-fun d!152839 () Bool)

(assert (=> d!152839 (= (validKeyInArray!0 (select (arr!46697 a!2901) j!112)) (and (not (= (select (arr!46697 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46697 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1415878 d!152839))

(declare-fun d!152841 () Bool)

(assert (=> d!152841 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122062 d!152841))

(declare-fun d!152847 () Bool)

(assert (=> d!152847 (= (array_inv!35978 a!2901) (bvsge (size!47248 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122062 d!152847))

(declare-fun b!1416231 () Bool)

(declare-fun e!801625 () SeekEntryResult!10911)

(assert (=> b!1416231 (= e!801625 (Intermediate!10911 true (toIndex!0 lt!624125 mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!152849 () Bool)

(declare-fun e!801627 () Bool)

(assert (=> d!152849 e!801627))

(declare-fun c!131805 () Bool)

(declare-fun lt!624299 () SeekEntryResult!10911)

(assert (=> d!152849 (= c!131805 (and (is-Intermediate!10911 lt!624299) (undefined!11723 lt!624299)))))

(assert (=> d!152849 (= lt!624299 e!801625)))

(declare-fun c!131804 () Bool)

(assert (=> d!152849 (= c!131804 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!624300 () (_ BitVec 64))

(assert (=> d!152849 (= lt!624300 (select (arr!46697 lt!624126) (toIndex!0 lt!624125 mask!2840)))))

(assert (=> d!152849 (validMask!0 mask!2840)))

(assert (=> d!152849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624125 mask!2840) lt!624125 lt!624126 mask!2840) lt!624299)))

(declare-fun b!1416232 () Bool)

(declare-fun e!801626 () SeekEntryResult!10911)

(assert (=> b!1416232 (= e!801626 (Intermediate!10911 false (toIndex!0 lt!624125 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416233 () Bool)

(assert (=> b!1416233 (and (bvsge (index!46035 lt!624299) #b00000000000000000000000000000000) (bvslt (index!46035 lt!624299) (size!47248 lt!624126)))))

(declare-fun e!801628 () Bool)

(assert (=> b!1416233 (= e!801628 (= (select (arr!46697 lt!624126) (index!46035 lt!624299)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416234 () Bool)

(declare-fun e!801629 () Bool)

(assert (=> b!1416234 (= e!801627 e!801629)))

(declare-fun res!951597 () Bool)

(assert (=> b!1416234 (= res!951597 (and (is-Intermediate!10911 lt!624299) (not (undefined!11723 lt!624299)) (bvslt (x!127789 lt!624299) #b01111111111111111111111111111110) (bvsge (x!127789 lt!624299) #b00000000000000000000000000000000) (bvsge (x!127789 lt!624299) #b00000000000000000000000000000000)))))

(assert (=> b!1416234 (=> (not res!951597) (not e!801629))))

(declare-fun b!1416235 () Bool)

(assert (=> b!1416235 (and (bvsge (index!46035 lt!624299) #b00000000000000000000000000000000) (bvslt (index!46035 lt!624299) (size!47248 lt!624126)))))

(declare-fun res!951598 () Bool)

(assert (=> b!1416235 (= res!951598 (= (select (arr!46697 lt!624126) (index!46035 lt!624299)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416235 (=> res!951598 e!801628)))

(declare-fun b!1416236 () Bool)

(assert (=> b!1416236 (and (bvsge (index!46035 lt!624299) #b00000000000000000000000000000000) (bvslt (index!46035 lt!624299) (size!47248 lt!624126)))))

(declare-fun res!951599 () Bool)

(assert (=> b!1416236 (= res!951599 (= (select (arr!46697 lt!624126) (index!46035 lt!624299)) lt!624125))))

(assert (=> b!1416236 (=> res!951599 e!801628)))

(assert (=> b!1416236 (= e!801629 e!801628)))

(declare-fun b!1416237 () Bool)

(assert (=> b!1416237 (= e!801627 (bvsge (x!127789 lt!624299) #b01111111111111111111111111111110))))

(declare-fun b!1416238 () Bool)

(assert (=> b!1416238 (= e!801625 e!801626)))

(declare-fun c!131803 () Bool)

(assert (=> b!1416238 (= c!131803 (or (= lt!624300 lt!624125) (= (bvadd lt!624300 lt!624300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1416239 () Bool)

(assert (=> b!1416239 (= e!801626 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!624125 mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) lt!624125 lt!624126 mask!2840))))

(assert (= (and d!152849 c!131804) b!1416231))

(assert (= (and d!152849 (not c!131804)) b!1416238))

(assert (= (and b!1416238 c!131803) b!1416232))

(assert (= (and b!1416238 (not c!131803)) b!1416239))

(assert (= (and d!152849 c!131805) b!1416237))

(assert (= (and d!152849 (not c!131805)) b!1416234))

(assert (= (and b!1416234 res!951597) b!1416236))

(assert (= (and b!1416236 (not res!951599)) b!1416235))

(assert (= (and b!1416235 (not res!951598)) b!1416233))

(assert (=> d!152849 m!1306363))

(declare-fun m!1306635 () Bool)

(assert (=> d!152849 m!1306635))

(assert (=> d!152849 m!1306349))

(declare-fun m!1306637 () Bool)

(assert (=> b!1416235 m!1306637))

(assert (=> b!1416236 m!1306637))

(assert (=> b!1416239 m!1306363))

(declare-fun m!1306639 () Bool)

(assert (=> b!1416239 m!1306639))

(assert (=> b!1416239 m!1306639))

(declare-fun m!1306641 () Bool)

(assert (=> b!1416239 m!1306641))

(assert (=> b!1416233 m!1306637))

(assert (=> b!1415883 d!152849))

(declare-fun d!152851 () Bool)

(declare-fun lt!624302 () (_ BitVec 32))

(declare-fun lt!624301 () (_ BitVec 32))

(assert (=> d!152851 (= lt!624302 (bvmul (bvxor lt!624301 (bvlshr lt!624301 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152851 (= lt!624301 ((_ extract 31 0) (bvand (bvxor lt!624125 (bvlshr lt!624125 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152851 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951588 (let ((h!34495 ((_ extract 31 0) (bvand (bvxor lt!624125 (bvlshr lt!624125 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127801 (bvmul (bvxor h!34495 (bvlshr h!34495 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127801 (bvlshr x!127801 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951588 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951588 #b00000000000000000000000000000000))))))

(assert (=> d!152851 (= (toIndex!0 lt!624125 mask!2840) (bvand (bvxor lt!624302 (bvlshr lt!624302 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1415883 d!152851))

(declare-fun d!152853 () Bool)

(declare-fun res!951600 () Bool)

(declare-fun e!801632 () Bool)

(assert (=> d!152853 (=> res!951600 e!801632)))

(assert (=> d!152853 (= res!951600 (bvsge #b00000000000000000000000000000000 (size!47248 a!2901)))))

(assert (=> d!152853 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!801632)))

(declare-fun bm!67236 () Bool)

(declare-fun call!67239 () Bool)

(assert (=> bm!67236 (= call!67239 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1416240 () Bool)

(declare-fun e!801631 () Bool)

(assert (=> b!1416240 (= e!801631 call!67239)))

(declare-fun b!1416241 () Bool)

(declare-fun e!801630 () Bool)

(assert (=> b!1416241 (= e!801630 call!67239)))

(declare-fun b!1416242 () Bool)

(assert (=> b!1416242 (= e!801631 e!801630)))

(declare-fun lt!624304 () (_ BitVec 64))

(assert (=> b!1416242 (= lt!624304 (select (arr!46697 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!624303 () Unit!47823)

(assert (=> b!1416242 (= lt!624303 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!624304 #b00000000000000000000000000000000))))

(assert (=> b!1416242 (arrayContainsKey!0 a!2901 lt!624304 #b00000000000000000000000000000000)))

(declare-fun lt!624305 () Unit!47823)

(assert (=> b!1416242 (= lt!624305 lt!624303)))

(declare-fun res!951601 () Bool)

(assert (=> b!1416242 (= res!951601 (= (seekEntryOrOpen!0 (select (arr!46697 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10911 #b00000000000000000000000000000000)))))

(assert (=> b!1416242 (=> (not res!951601) (not e!801630))))

(declare-fun b!1416243 () Bool)

(assert (=> b!1416243 (= e!801632 e!801631)))

(declare-fun c!131806 () Bool)

(assert (=> b!1416243 (= c!131806 (validKeyInArray!0 (select (arr!46697 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152853 (not res!951600)) b!1416243))

(assert (= (and b!1416243 c!131806) b!1416242))

(assert (= (and b!1416243 (not c!131806)) b!1416240))

(assert (= (and b!1416242 res!951601) b!1416241))

(assert (= (or b!1416241 b!1416240) bm!67236))

(declare-fun m!1306643 () Bool)

(assert (=> bm!67236 m!1306643))

(assert (=> b!1416242 m!1306455))

(declare-fun m!1306645 () Bool)

(assert (=> b!1416242 m!1306645))

(declare-fun m!1306647 () Bool)

(assert (=> b!1416242 m!1306647))

(assert (=> b!1416242 m!1306455))

(declare-fun m!1306649 () Bool)

(assert (=> b!1416242 m!1306649))

(assert (=> b!1416243 m!1306455))

(assert (=> b!1416243 m!1306455))

(assert (=> b!1416243 m!1306459))

(assert (=> b!1415884 d!152853))

(push 1)

(assert (not bm!67236))

(assert (not b!1415960))

(assert (not b!1416083))

(assert (not d!152797))

(assert (not d!152787))

(assert (not b!1416124))

(assert (not b!1416074))

(assert (not b!1416123))

(assert (not bm!67225))

(assert (not b!1416239))

(assert (not d!152821))

(assert (not b!1415959))

(assert (not d!152803))

(assert (not d!152849))

(assert (not b!1416242))

(assert (not d!152801))

(assert (not b!1415962))

(assert (not b!1416243))

(assert (not bm!67231))

(assert (not d!152819))

(assert (not b!1416206))

(assert (not b!1416021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

