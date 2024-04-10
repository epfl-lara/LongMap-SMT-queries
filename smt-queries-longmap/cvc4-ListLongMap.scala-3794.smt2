; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52062 () Bool)

(assert start!52062)

(declare-fun b!568515 () Bool)

(declare-fun res!358720 () Bool)

(declare-fun e!327112 () Bool)

(assert (=> b!568515 (=> (not res!358720) (not e!327112))))

(declare-datatypes ((array!35642 0))(
  ( (array!35643 (arr!17114 (Array (_ BitVec 32) (_ BitVec 64))) (size!17478 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35642)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568515 (= res!358720 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568516 () Bool)

(declare-fun e!327111 () Bool)

(declare-fun e!327113 () Bool)

(assert (=> b!568516 (= e!327111 e!327113)))

(declare-fun res!358716 () Bool)

(assert (=> b!568516 (=> (not res!358716) (not e!327113))))

(declare-fun lt!258994 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5563 0))(
  ( (MissingZero!5563 (index!24479 (_ BitVec 32))) (Found!5563 (index!24480 (_ BitVec 32))) (Intermediate!5563 (undefined!6375 Bool) (index!24481 (_ BitVec 32)) (x!53352 (_ BitVec 32))) (Undefined!5563) (MissingVacant!5563 (index!24482 (_ BitVec 32))) )
))
(declare-fun lt!258992 () SeekEntryResult!5563)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35642 (_ BitVec 32)) SeekEntryResult!5563)

(assert (=> b!568516 (= res!358716 (= lt!258992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258994 (select (store (arr!17114 a!3118) i!1132 k!1914) j!142) (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118)) mask!3119)))))

(declare-fun lt!258995 () (_ BitVec 32))

(assert (=> b!568516 (= lt!258992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258995 (select (arr!17114 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568516 (= lt!258994 (toIndex!0 (select (store (arr!17114 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!568516 (= lt!258995 (toIndex!0 (select (arr!17114 a!3118) j!142) mask!3119))))

(declare-fun b!568517 () Bool)

(declare-fun res!358719 () Bool)

(assert (=> b!568517 (=> (not res!358719) (not e!327111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35642 (_ BitVec 32)) Bool)

(assert (=> b!568517 (= res!358719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568518 () Bool)

(declare-fun res!358724 () Bool)

(assert (=> b!568518 (=> (not res!358724) (not e!327112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568518 (= res!358724 (validKeyInArray!0 (select (arr!17114 a!3118) j!142)))))

(declare-fun res!358721 () Bool)

(assert (=> start!52062 (=> (not res!358721) (not e!327112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52062 (= res!358721 (validMask!0 mask!3119))))

(assert (=> start!52062 e!327112))

(assert (=> start!52062 true))

(declare-fun array_inv!12910 (array!35642) Bool)

(assert (=> start!52062 (array_inv!12910 a!3118)))

(declare-fun b!568519 () Bool)

(assert (=> b!568519 (= e!327112 e!327111)))

(declare-fun res!358718 () Bool)

(assert (=> b!568519 (=> (not res!358718) (not e!327111))))

(declare-fun lt!258993 () SeekEntryResult!5563)

(assert (=> b!568519 (= res!358718 (or (= lt!258993 (MissingZero!5563 i!1132)) (= lt!258993 (MissingVacant!5563 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35642 (_ BitVec 32)) SeekEntryResult!5563)

(assert (=> b!568519 (= lt!258993 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!568520 () Bool)

(declare-fun res!358717 () Bool)

(assert (=> b!568520 (=> (not res!358717) (not e!327111))))

(declare-datatypes ((List!11194 0))(
  ( (Nil!11191) (Cons!11190 (h!12208 (_ BitVec 64)) (t!17422 List!11194)) )
))
(declare-fun arrayNoDuplicates!0 (array!35642 (_ BitVec 32) List!11194) Bool)

(assert (=> b!568520 (= res!358717 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11191))))

(declare-fun lt!258997 () SeekEntryResult!5563)

(declare-fun b!568521 () Bool)

(assert (=> b!568521 (= e!327113 (not (or (not (is-Intermediate!5563 lt!258992)) (undefined!6375 lt!258992) (= (select (arr!17114 a!3118) (index!24481 lt!258992)) (select (arr!17114 a!3118) j!142)) (not (= (select (arr!17114 a!3118) (index!24481 lt!258992)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!258997 (MissingZero!5563 (index!24481 lt!258992))))))))

(assert (=> b!568521 (= lt!258997 (Found!5563 j!142))))

(assert (=> b!568521 (= lt!258997 (seekEntryOrOpen!0 (select (arr!17114 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568521 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17828 0))(
  ( (Unit!17829) )
))
(declare-fun lt!258996 () Unit!17828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17828)

(assert (=> b!568521 (= lt!258996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568522 () Bool)

(declare-fun res!358722 () Bool)

(assert (=> b!568522 (=> (not res!358722) (not e!327112))))

(assert (=> b!568522 (= res!358722 (and (= (size!17478 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17478 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17478 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568523 () Bool)

(declare-fun res!358723 () Bool)

(assert (=> b!568523 (=> (not res!358723) (not e!327112))))

(assert (=> b!568523 (= res!358723 (validKeyInArray!0 k!1914))))

(assert (= (and start!52062 res!358721) b!568522))

(assert (= (and b!568522 res!358722) b!568518))

(assert (= (and b!568518 res!358724) b!568523))

(assert (= (and b!568523 res!358723) b!568515))

(assert (= (and b!568515 res!358720) b!568519))

(assert (= (and b!568519 res!358718) b!568517))

(assert (= (and b!568517 res!358719) b!568520))

(assert (= (and b!568520 res!358717) b!568516))

(assert (= (and b!568516 res!358716) b!568521))

(declare-fun m!547075 () Bool)

(assert (=> b!568515 m!547075))

(declare-fun m!547077 () Bool)

(assert (=> b!568518 m!547077))

(assert (=> b!568518 m!547077))

(declare-fun m!547079 () Bool)

(assert (=> b!568518 m!547079))

(declare-fun m!547081 () Bool)

(assert (=> b!568519 m!547081))

(declare-fun m!547083 () Bool)

(assert (=> b!568520 m!547083))

(declare-fun m!547085 () Bool)

(assert (=> b!568523 m!547085))

(declare-fun m!547087 () Bool)

(assert (=> b!568517 m!547087))

(declare-fun m!547089 () Bool)

(assert (=> start!52062 m!547089))

(declare-fun m!547091 () Bool)

(assert (=> start!52062 m!547091))

(assert (=> b!568521 m!547077))

(declare-fun m!547093 () Bool)

(assert (=> b!568521 m!547093))

(declare-fun m!547095 () Bool)

(assert (=> b!568521 m!547095))

(declare-fun m!547097 () Bool)

(assert (=> b!568521 m!547097))

(assert (=> b!568521 m!547077))

(declare-fun m!547099 () Bool)

(assert (=> b!568521 m!547099))

(assert (=> b!568516 m!547077))

(declare-fun m!547101 () Bool)

(assert (=> b!568516 m!547101))

(assert (=> b!568516 m!547077))

(declare-fun m!547103 () Bool)

(assert (=> b!568516 m!547103))

(declare-fun m!547105 () Bool)

(assert (=> b!568516 m!547105))

(assert (=> b!568516 m!547103))

(declare-fun m!547107 () Bool)

(assert (=> b!568516 m!547107))

(assert (=> b!568516 m!547077))

(declare-fun m!547109 () Bool)

(assert (=> b!568516 m!547109))

(assert (=> b!568516 m!547103))

(declare-fun m!547111 () Bool)

(assert (=> b!568516 m!547111))

(push 1)

(assert (not b!568515))

(assert (not b!568517))

(assert (not b!568523))

(assert (not b!568516))

(assert (not b!568521))

(assert (not b!568519))

(assert (not start!52062))

(assert (not b!568518))

(assert (not b!568520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!259025 () SeekEntryResult!5563)

(declare-fun b!568620 () Bool)

(assert (=> b!568620 (and (bvsge (index!24481 lt!259025) #b00000000000000000000000000000000) (bvslt (index!24481 lt!259025) (size!17478 (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118)))))))

(declare-fun res!358773 () Bool)

(assert (=> b!568620 (= res!358773 (= (select (arr!17114 (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118))) (index!24481 lt!259025)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327184 () Bool)

(assert (=> b!568620 (=> res!358773 e!327184)))

(declare-fun b!568621 () Bool)

(declare-fun e!327186 () SeekEntryResult!5563)

(declare-fun e!327183 () SeekEntryResult!5563)

(assert (=> b!568621 (= e!327186 e!327183)))

(declare-fun lt!259024 () (_ BitVec 64))

(declare-fun c!65278 () Bool)

(assert (=> b!568621 (= c!65278 (or (= lt!259024 (select (store (arr!17114 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!259024 lt!259024) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568622 () Bool)

(assert (=> b!568622 (and (bvsge (index!24481 lt!259025) #b00000000000000000000000000000000) (bvslt (index!24481 lt!259025) (size!17478 (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118)))))))

(declare-fun res!358774 () Bool)

(assert (=> b!568622 (= res!358774 (= (select (arr!17114 (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118))) (index!24481 lt!259025)) (select (store (arr!17114 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!568622 (=> res!358774 e!327184)))

(declare-fun e!327185 () Bool)

(assert (=> b!568622 (= e!327185 e!327184)))

(declare-fun b!568623 () Bool)

(assert (=> b!568623 (and (bvsge (index!24481 lt!259025) #b00000000000000000000000000000000) (bvslt (index!24481 lt!259025) (size!17478 (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118)))))))

(assert (=> b!568623 (= e!327184 (= (select (arr!17114 (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118))) (index!24481 lt!259025)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568624 () Bool)

(assert (=> b!568624 (= e!327183 (Intermediate!5563 false lt!258994 #b00000000000000000000000000000000))))

(declare-fun b!568625 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568625 (= e!327183 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258994 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17114 a!3118) i!1132 k!1914) j!142) (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118)) mask!3119))))

(declare-fun b!568627 () Bool)

(declare-fun e!327187 () Bool)

(assert (=> b!568627 (= e!327187 e!327185)))

(declare-fun res!358775 () Bool)

(assert (=> b!568627 (= res!358775 (and (is-Intermediate!5563 lt!259025) (not (undefined!6375 lt!259025)) (bvslt (x!53352 lt!259025) #b01111111111111111111111111111110) (bvsge (x!53352 lt!259025) #b00000000000000000000000000000000) (bvsge (x!53352 lt!259025) #b00000000000000000000000000000000)))))

(assert (=> b!568627 (=> (not res!358775) (not e!327185))))

(declare-fun b!568628 () Bool)

(assert (=> b!568628 (= e!327187 (bvsge (x!53352 lt!259025) #b01111111111111111111111111111110))))

(declare-fun d!84501 () Bool)

(assert (=> d!84501 e!327187))

(declare-fun c!65277 () Bool)

(assert (=> d!84501 (= c!65277 (and (is-Intermediate!5563 lt!259025) (undefined!6375 lt!259025)))))

(assert (=> d!84501 (= lt!259025 e!327186)))

(declare-fun c!65279 () Bool)

(assert (=> d!84501 (= c!65279 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84501 (= lt!259024 (select (arr!17114 (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118))) lt!258994))))

(assert (=> d!84501 (validMask!0 mask!3119)))

(assert (=> d!84501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258994 (select (store (arr!17114 a!3118) i!1132 k!1914) j!142) (array!35643 (store (arr!17114 a!3118) i!1132 k!1914) (size!17478 a!3118)) mask!3119) lt!259025)))

(declare-fun b!568626 () Bool)

(assert (=> b!568626 (= e!327186 (Intermediate!5563 true lt!258994 #b00000000000000000000000000000000))))

(assert (= (and d!84501 c!65279) b!568626))

(assert (= (and d!84501 (not c!65279)) b!568621))

(assert (= (and b!568621 c!65278) b!568624))

(assert (= (and b!568621 (not c!65278)) b!568625))

(assert (= (and d!84501 c!65277) b!568628))

(assert (= (and d!84501 (not c!65277)) b!568627))

(assert (= (and b!568627 res!358775) b!568622))

(assert (= (and b!568622 (not res!358774)) b!568620))

(assert (= (and b!568620 (not res!358773)) b!568623))

(declare-fun m!547147 () Bool)

(assert (=> b!568625 m!547147))

(assert (=> b!568625 m!547147))

(assert (=> b!568625 m!547103))

(declare-fun m!547149 () Bool)

(assert (=> b!568625 m!547149))

(declare-fun m!547151 () Bool)

(assert (=> b!568622 m!547151))

(assert (=> b!568623 m!547151))

(declare-fun m!547153 () Bool)

(assert (=> d!84501 m!547153))

(assert (=> d!84501 m!547089))

(assert (=> b!568620 m!547151))

(assert (=> b!568516 d!84501))

(declare-fun b!568629 () Bool)

(declare-fun lt!259027 () SeekEntryResult!5563)

(assert (=> b!568629 (and (bvsge (index!24481 lt!259027) #b00000000000000000000000000000000) (bvslt (index!24481 lt!259027) (size!17478 a!3118)))))

(declare-fun res!358776 () Bool)

(assert (=> b!568629 (= res!358776 (= (select (arr!17114 a!3118) (index!24481 lt!259027)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327189 () Bool)

(assert (=> b!568629 (=> res!358776 e!327189)))

(declare-fun b!568630 () Bool)

(declare-fun e!327191 () SeekEntryResult!5563)

(declare-fun e!327188 () SeekEntryResult!5563)

(assert (=> b!568630 (= e!327191 e!327188)))

(declare-fun c!65281 () Bool)

(declare-fun lt!259026 () (_ BitVec 64))

(assert (=> b!568630 (= c!65281 (or (= lt!259026 (select (arr!17114 a!3118) j!142)) (= (bvadd lt!259026 lt!259026) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568631 () Bool)

(assert (=> b!568631 (and (bvsge (index!24481 lt!259027) #b00000000000000000000000000000000) (bvslt (index!24481 lt!259027) (size!17478 a!3118)))))

(declare-fun res!358777 () Bool)

(assert (=> b!568631 (= res!358777 (= (select (arr!17114 a!3118) (index!24481 lt!259027)) (select (arr!17114 a!3118) j!142)))))

(assert (=> b!568631 (=> res!358777 e!327189)))

(declare-fun e!327190 () Bool)

(assert (=> b!568631 (= e!327190 e!327189)))

(declare-fun b!568632 () Bool)

(assert (=> b!568632 (and (bvsge (index!24481 lt!259027) #b00000000000000000000000000000000) (bvslt (index!24481 lt!259027) (size!17478 a!3118)))))

(assert (=> b!568632 (= e!327189 (= (select (arr!17114 a!3118) (index!24481 lt!259027)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568633 () Bool)

(assert (=> b!568633 (= e!327188 (Intermediate!5563 false lt!258995 #b00000000000000000000000000000000))))

(declare-fun b!568634 () Bool)

(assert (=> b!568634 (= e!327188 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258995 #b00000000000000000000000000000000 mask!3119) (select (arr!17114 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568636 () Bool)

(declare-fun e!327192 () Bool)

(assert (=> b!568636 (= e!327192 e!327190)))

(declare-fun res!358778 () Bool)

(assert (=> b!568636 (= res!358778 (and (is-Intermediate!5563 lt!259027) (not (undefined!6375 lt!259027)) (bvslt (x!53352 lt!259027) #b01111111111111111111111111111110) (bvsge (x!53352 lt!259027) #b00000000000000000000000000000000) (bvsge (x!53352 lt!259027) #b00000000000000000000000000000000)))))

(assert (=> b!568636 (=> (not res!358778) (not e!327190))))

(declare-fun b!568637 () Bool)

(assert (=> b!568637 (= e!327192 (bvsge (x!53352 lt!259027) #b01111111111111111111111111111110))))

(declare-fun d!84507 () Bool)

(assert (=> d!84507 e!327192))

(declare-fun c!65280 () Bool)

(assert (=> d!84507 (= c!65280 (and (is-Intermediate!5563 lt!259027) (undefined!6375 lt!259027)))))

(assert (=> d!84507 (= lt!259027 e!327191)))

(declare-fun c!65282 () Bool)

(assert (=> d!84507 (= c!65282 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84507 (= lt!259026 (select (arr!17114 a!3118) lt!258995))))

(assert (=> d!84507 (validMask!0 mask!3119)))

(assert (=> d!84507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258995 (select (arr!17114 a!3118) j!142) a!3118 mask!3119) lt!259027)))

(declare-fun b!568635 () Bool)

(assert (=> b!568635 (= e!327191 (Intermediate!5563 true lt!258995 #b00000000000000000000000000000000))))

(assert (= (and d!84507 c!65282) b!568635))

(assert (= (and d!84507 (not c!65282)) b!568630))

(assert (= (and b!568630 c!65281) b!568633))

(assert (= (and b!568630 (not c!65281)) b!568634))

(assert (= (and d!84507 c!65280) b!568637))

(assert (= (and d!84507 (not c!65280)) b!568636))

(assert (= (and b!568636 res!358778) b!568631))

(assert (= (and b!568631 (not res!358777)) b!568629))

(assert (= (and b!568629 (not res!358776)) b!568632))

(declare-fun m!547155 () Bool)

(assert (=> b!568634 m!547155))

(assert (=> b!568634 m!547155))

(assert (=> b!568634 m!547077))

(declare-fun m!547157 () Bool)

(assert (=> b!568634 m!547157))

(declare-fun m!547159 () Bool)

(assert (=> b!568631 m!547159))

(assert (=> b!568632 m!547159))

(declare-fun m!547161 () Bool)

(assert (=> d!84507 m!547161))

(assert (=> d!84507 m!547089))

(assert (=> b!568629 m!547159))

(assert (=> b!568516 d!84507))

(declare-fun d!84509 () Bool)

(declare-fun lt!259049 () (_ BitVec 32))

(declare-fun lt!259048 () (_ BitVec 32))

(assert (=> d!84509 (= lt!259049 (bvmul (bvxor lt!259048 (bvlshr lt!259048 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84509 (= lt!259048 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17114 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17114 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84509 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358779 (let ((h!12209 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17114 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17114 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53355 (bvmul (bvxor h!12209 (bvlshr h!12209 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53355 (bvlshr x!53355 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358779 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358779 #b00000000000000000000000000000000))))))

(assert (=> d!84509 (= (toIndex!0 (select (store (arr!17114 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!259049 (bvlshr lt!259049 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568516 d!84509))

(declare-fun d!84517 () Bool)

(declare-fun lt!259051 () (_ BitVec 32))

(declare-fun lt!259050 () (_ BitVec 32))

(assert (=> d!84517 (= lt!259051 (bvmul (bvxor lt!259050 (bvlshr lt!259050 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84517 (= lt!259050 ((_ extract 31 0) (bvand (bvxor (select (arr!17114 a!3118) j!142) (bvlshr (select (arr!17114 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84517 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358779 (let ((h!12209 ((_ extract 31 0) (bvand (bvxor (select (arr!17114 a!3118) j!142) (bvlshr (select (arr!17114 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53355 (bvmul (bvxor h!12209 (bvlshr h!12209 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53355 (bvlshr x!53355 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358779 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358779 #b00000000000000000000000000000000))))))

(assert (=> d!84517 (= (toIndex!0 (select (arr!17114 a!3118) j!142) mask!3119) (bvand (bvxor lt!259051 (bvlshr lt!259051 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568516 d!84517))

(declare-fun b!568710 () Bool)

(declare-fun c!65316 () Bool)

(declare-fun lt!259080 () (_ BitVec 64))

(assert (=> b!568710 (= c!65316 (= lt!259080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327229 () SeekEntryResult!5563)

(declare-fun e!327231 () SeekEntryResult!5563)

(assert (=> b!568710 (= e!327229 e!327231)))

(declare-fun b!568711 () Bool)

(declare-fun e!327230 () SeekEntryResult!5563)

(assert (=> b!568711 (= e!327230 e!327229)))

(declare-fun lt!259081 () SeekEntryResult!5563)

(assert (=> b!568711 (= lt!259080 (select (arr!17114 a!3118) (index!24481 lt!259081)))))

(declare-fun c!65313 () Bool)

(assert (=> b!568711 (= c!65313 (= lt!259080 (select (arr!17114 a!3118) j!142)))))

(declare-fun b!568712 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35642 (_ BitVec 32)) SeekEntryResult!5563)

(assert (=> b!568712 (= e!327231 (seekKeyOrZeroReturnVacant!0 (x!53352 lt!259081) (index!24481 lt!259081) (index!24481 lt!259081) (select (arr!17114 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568713 () Bool)

(assert (=> b!568713 (= e!327231 (MissingZero!5563 (index!24481 lt!259081)))))

(declare-fun b!568714 () Bool)

(assert (=> b!568714 (= e!327230 Undefined!5563)))

(declare-fun b!568715 () Bool)

(assert (=> b!568715 (= e!327229 (Found!5563 (index!24481 lt!259081)))))

(declare-fun d!84519 () Bool)

(declare-fun lt!259079 () SeekEntryResult!5563)

(assert (=> d!84519 (and (or (is-Undefined!5563 lt!259079) (not (is-Found!5563 lt!259079)) (and (bvsge (index!24480 lt!259079) #b00000000000000000000000000000000) (bvslt (index!24480 lt!259079) (size!17478 a!3118)))) (or (is-Undefined!5563 lt!259079) (is-Found!5563 lt!259079) (not (is-MissingZero!5563 lt!259079)) (and (bvsge (index!24479 lt!259079) #b00000000000000000000000000000000) (bvslt (index!24479 lt!259079) (size!17478 a!3118)))) (or (is-Undefined!5563 lt!259079) (is-Found!5563 lt!259079) (is-MissingZero!5563 lt!259079) (not (is-MissingVacant!5563 lt!259079)) (and (bvsge (index!24482 lt!259079) #b00000000000000000000000000000000) (bvslt (index!24482 lt!259079) (size!17478 a!3118)))) (or (is-Undefined!5563 lt!259079) (ite (is-Found!5563 lt!259079) (= (select (arr!17114 a!3118) (index!24480 lt!259079)) (select (arr!17114 a!3118) j!142)) (ite (is-MissingZero!5563 lt!259079) (= (select (arr!17114 a!3118) (index!24479 lt!259079)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5563 lt!259079) (= (select (arr!17114 a!3118) (index!24482 lt!259079)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84519 (= lt!259079 e!327230)))

(declare-fun c!65314 () Bool)

(assert (=> d!84519 (= c!65314 (and (is-Intermediate!5563 lt!259081) (undefined!6375 lt!259081)))))

(assert (=> d!84519 (= lt!259081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17114 a!3118) j!142) mask!3119) (select (arr!17114 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84519 (validMask!0 mask!3119)))

(assert (=> d!84519 (= (seekEntryOrOpen!0 (select (arr!17114 a!3118) j!142) a!3118 mask!3119) lt!259079)))

(assert (= (and d!84519 c!65314) b!568714))

(assert (= (and d!84519 (not c!65314)) b!568711))

(assert (= (and b!568711 c!65313) b!568715))

(assert (= (and b!568711 (not c!65313)) b!568710))

(assert (= (and b!568710 c!65316) b!568713))

(assert (= (and b!568710 (not c!65316)) b!568712))

(declare-fun m!547199 () Bool)

(assert (=> b!568711 m!547199))

(assert (=> b!568712 m!547077))

(declare-fun m!547201 () Bool)

(assert (=> b!568712 m!547201))

(assert (=> d!84519 m!547077))

(assert (=> d!84519 m!547101))

(declare-fun m!547203 () Bool)

(assert (=> d!84519 m!547203))

(declare-fun m!547205 () Bool)

(assert (=> d!84519 m!547205))

(assert (=> d!84519 m!547089))

(declare-fun m!547207 () Bool)

(assert (=> d!84519 m!547207))

(assert (=> d!84519 m!547101))

(assert (=> d!84519 m!547077))

(declare-fun m!547209 () Bool)

(assert (=> d!84519 m!547209))

(assert (=> b!568521 d!84519))

(declare-fun b!568774 () Bool)

(declare-fun e!327272 () Bool)

(declare-fun call!32578 () Bool)

(assert (=> b!568774 (= e!327272 call!32578)))

(declare-fun b!568775 () Bool)

(declare-fun e!327273 () Bool)

(assert (=> b!568775 (= e!327273 call!32578)))

(declare-fun b!568776 () Bool)

(assert (=> b!568776 (= e!327273 e!327272)))

(declare-fun lt!259102 () (_ BitVec 64))

(assert (=> b!568776 (= lt!259102 (select (arr!17114 a!3118) j!142))))

(declare-fun lt!259101 () Unit!17828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35642 (_ BitVec 64) (_ BitVec 32)) Unit!17828)

(assert (=> b!568776 (= lt!259101 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259102 j!142))))

(assert (=> b!568776 (arrayContainsKey!0 a!3118 lt!259102 #b00000000000000000000000000000000)))

(declare-fun lt!259103 () Unit!17828)

(assert (=> b!568776 (= lt!259103 lt!259101)))

(declare-fun res!358814 () Bool)

(assert (=> b!568776 (= res!358814 (= (seekEntryOrOpen!0 (select (arr!17114 a!3118) j!142) a!3118 mask!3119) (Found!5563 j!142)))))

(assert (=> b!568776 (=> (not res!358814) (not e!327272))))

(declare-fun d!84531 () Bool)

(declare-fun res!358815 () Bool)

(declare-fun e!327271 () Bool)

(assert (=> d!84531 (=> res!358815 e!327271)))

(assert (=> d!84531 (= res!358815 (bvsge j!142 (size!17478 a!3118)))))

(assert (=> d!84531 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!327271)))

(declare-fun bm!32575 () Bool)

(assert (=> bm!32575 (= call!32578 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!568777 () Bool)

(assert (=> b!568777 (= e!327271 e!327273)))

(declare-fun c!65335 () Bool)

(assert (=> b!568777 (= c!65335 (validKeyInArray!0 (select (arr!17114 a!3118) j!142)))))

(assert (= (and d!84531 (not res!358815)) b!568777))

(assert (= (and b!568777 c!65335) b!568776))

(assert (= (and b!568777 (not c!65335)) b!568775))

(assert (= (and b!568776 res!358814) b!568774))

(assert (= (or b!568774 b!568775) bm!32575))

(assert (=> b!568776 m!547077))

(declare-fun m!547261 () Bool)

(assert (=> b!568776 m!547261))

(declare-fun m!547263 () Bool)

(assert (=> b!568776 m!547263))

(assert (=> b!568776 m!547077))

(assert (=> b!568776 m!547099))

(declare-fun m!547265 () Bool)

(assert (=> bm!32575 m!547265))

(assert (=> b!568777 m!547077))

(assert (=> b!568777 m!547077))

(assert (=> b!568777 m!547079))

(assert (=> b!568521 d!84531))

(declare-fun d!84545 () Bool)

(assert (=> d!84545 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!259120 () Unit!17828)

(declare-fun choose!38 (array!35642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17828)

(assert (=> d!84545 (= lt!259120 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84545 (validMask!0 mask!3119)))

(assert (=> d!84545 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!259120)))

(declare-fun bs!17640 () Bool)

(assert (= bs!17640 d!84545))

(assert (=> bs!17640 m!547095))

(declare-fun m!547283 () Bool)

(assert (=> bs!17640 m!547283))

(assert (=> bs!17640 m!547089))

(assert (=> b!568521 d!84545))

(declare-fun d!84555 () Bool)

(declare-fun res!358820 () Bool)

(declare-fun e!327281 () Bool)

(assert (=> d!84555 (=> res!358820 e!327281)))

(assert (=> d!84555 (= res!358820 (= (select (arr!17114 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84555 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!327281)))

(declare-fun b!568788 () Bool)

(declare-fun e!327282 () Bool)

(assert (=> b!568788 (= e!327281 e!327282)))

(declare-fun res!358821 () Bool)

(assert (=> b!568788 (=> (not res!358821) (not e!327282))))

(assert (=> b!568788 (= res!358821 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17478 a!3118)))))

(declare-fun b!568789 () Bool)

(assert (=> b!568789 (= e!327282 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

