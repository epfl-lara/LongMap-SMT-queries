; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49446 () Bool)

(assert start!49446)

(declare-fun b!544485 () Bool)

(declare-fun res!338758 () Bool)

(declare-fun e!314792 () Bool)

(assert (=> b!544485 (=> (not res!338758) (not e!314792))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34373 0))(
  ( (array!34374 (arr!16518 (Array (_ BitVec 32) (_ BitVec 64))) (size!16882 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34373)

(assert (=> b!544485 (= res!338758 (and (not (= (select (arr!16518 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16518 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16518 a!3154) index!1177) (select (arr!16518 a!3154) j!147)))))))

(declare-fun b!544486 () Bool)

(declare-fun e!314793 () Bool)

(declare-fun e!314791 () Bool)

(assert (=> b!544486 (= e!314793 e!314791)))

(declare-fun res!338756 () Bool)

(assert (=> b!544486 (=> (not res!338756) (not e!314791))))

(declare-datatypes ((SeekEntryResult!4976 0))(
  ( (MissingZero!4976 (index!22128 (_ BitVec 32))) (Found!4976 (index!22129 (_ BitVec 32))) (Intermediate!4976 (undefined!5788 Bool) (index!22130 (_ BitVec 32)) (x!51046 (_ BitVec 32))) (Undefined!4976) (MissingVacant!4976 (index!22131 (_ BitVec 32))) )
))
(declare-fun lt!248503 () SeekEntryResult!4976)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544486 (= res!338756 (or (= lt!248503 (MissingZero!4976 i!1153)) (= lt!248503 (MissingVacant!4976 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34373 (_ BitVec 32)) SeekEntryResult!4976)

(assert (=> b!544486 (= lt!248503 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!338748 () Bool)

(assert (=> start!49446 (=> (not res!338748) (not e!314793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49446 (= res!338748 (validMask!0 mask!3216))))

(assert (=> start!49446 e!314793))

(assert (=> start!49446 true))

(declare-fun array_inv!12314 (array!34373) Bool)

(assert (=> start!49446 (array_inv!12314 a!3154)))

(declare-fun b!544487 () Bool)

(declare-fun res!338754 () Bool)

(assert (=> b!544487 (=> (not res!338754) (not e!314793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544487 (= res!338754 (validKeyInArray!0 (select (arr!16518 a!3154) j!147)))))

(declare-fun lt!248502 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun b!544488 () Bool)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544488 (= e!314792 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (or (bvslt lt!248502 #b00000000000000000000000000000000) (bvsge lt!248502 (size!16882 a!3154)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544488 (= lt!248502 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544489 () Bool)

(declare-fun res!338755 () Bool)

(assert (=> b!544489 (=> (not res!338755) (not e!314791))))

(declare-datatypes ((List!10637 0))(
  ( (Nil!10634) (Cons!10633 (h!11591 (_ BitVec 64)) (t!16865 List!10637)) )
))
(declare-fun arrayNoDuplicates!0 (array!34373 (_ BitVec 32) List!10637) Bool)

(assert (=> b!544489 (= res!338755 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10634))))

(declare-fun b!544490 () Bool)

(declare-fun res!338749 () Bool)

(assert (=> b!544490 (=> (not res!338749) (not e!314793))))

(assert (=> b!544490 (= res!338749 (validKeyInArray!0 k!1998))))

(declare-fun b!544491 () Bool)

(declare-fun res!338757 () Bool)

(assert (=> b!544491 (=> (not res!338757) (not e!314793))))

(declare-fun arrayContainsKey!0 (array!34373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544491 (= res!338757 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544492 () Bool)

(assert (=> b!544492 (= e!314791 e!314792)))

(declare-fun res!338750 () Bool)

(assert (=> b!544492 (=> (not res!338750) (not e!314792))))

(declare-fun lt!248501 () SeekEntryResult!4976)

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!544492 (= res!338750 (= lt!248501 (Intermediate!4976 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34373 (_ BitVec 32)) SeekEntryResult!4976)

(assert (=> b!544492 (= lt!248501 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16518 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544493 () Bool)

(declare-fun res!338759 () Bool)

(assert (=> b!544493 (=> (not res!338759) (not e!314793))))

(assert (=> b!544493 (= res!338759 (and (= (size!16882 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16882 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16882 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544494 () Bool)

(declare-fun res!338753 () Bool)

(assert (=> b!544494 (=> (not res!338753) (not e!314791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34373 (_ BitVec 32)) Bool)

(assert (=> b!544494 (= res!338753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544495 () Bool)

(declare-fun res!338751 () Bool)

(assert (=> b!544495 (=> (not res!338751) (not e!314792))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544495 (= res!338751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16518 a!3154) j!147) mask!3216) (select (arr!16518 a!3154) j!147) a!3154 mask!3216) lt!248501))))

(declare-fun b!544496 () Bool)

(declare-fun res!338752 () Bool)

(assert (=> b!544496 (=> (not res!338752) (not e!314791))))

(assert (=> b!544496 (= res!338752 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16882 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16882 a!3154)) (= (select (arr!16518 a!3154) resIndex!32) (select (arr!16518 a!3154) j!147))))))

(assert (= (and start!49446 res!338748) b!544493))

(assert (= (and b!544493 res!338759) b!544487))

(assert (= (and b!544487 res!338754) b!544490))

(assert (= (and b!544490 res!338749) b!544491))

(assert (= (and b!544491 res!338757) b!544486))

(assert (= (and b!544486 res!338756) b!544494))

(assert (= (and b!544494 res!338753) b!544489))

(assert (= (and b!544489 res!338755) b!544496))

(assert (= (and b!544496 res!338752) b!544492))

(assert (= (and b!544492 res!338750) b!544495))

(assert (= (and b!544495 res!338751) b!544485))

(assert (= (and b!544485 res!338758) b!544488))

(declare-fun m!522375 () Bool)

(assert (=> b!544491 m!522375))

(declare-fun m!522377 () Bool)

(assert (=> b!544485 m!522377))

(declare-fun m!522379 () Bool)

(assert (=> b!544485 m!522379))

(assert (=> b!544495 m!522379))

(assert (=> b!544495 m!522379))

(declare-fun m!522381 () Bool)

(assert (=> b!544495 m!522381))

(assert (=> b!544495 m!522381))

(assert (=> b!544495 m!522379))

(declare-fun m!522383 () Bool)

(assert (=> b!544495 m!522383))

(declare-fun m!522385 () Bool)

(assert (=> b!544494 m!522385))

(declare-fun m!522387 () Bool)

(assert (=> b!544489 m!522387))

(declare-fun m!522389 () Bool)

(assert (=> b!544488 m!522389))

(assert (=> b!544492 m!522379))

(assert (=> b!544492 m!522379))

(declare-fun m!522391 () Bool)

(assert (=> b!544492 m!522391))

(declare-fun m!522393 () Bool)

(assert (=> b!544490 m!522393))

(declare-fun m!522395 () Bool)

(assert (=> b!544486 m!522395))

(declare-fun m!522397 () Bool)

(assert (=> b!544496 m!522397))

(assert (=> b!544496 m!522379))

(declare-fun m!522399 () Bool)

(assert (=> start!49446 m!522399))

(declare-fun m!522401 () Bool)

(assert (=> start!49446 m!522401))

(assert (=> b!544487 m!522379))

(assert (=> b!544487 m!522379))

(declare-fun m!522403 () Bool)

(assert (=> b!544487 m!522403))

(push 1)

(assert (not b!544489))

(assert (not b!544491))

(assert (not b!544487))

(assert (not b!544486))

(assert (not b!544488))

(assert (not start!49446))

(assert (not b!544495))

(assert (not b!544492))

(assert (not b!544490))

(assert (not b!544494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!544647 () Bool)

(declare-fun lt!248543 () SeekEntryResult!4976)

(declare-fun e!314872 () SeekEntryResult!4976)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34373 (_ BitVec 32)) SeekEntryResult!4976)

(assert (=> b!544647 (= e!314872 (seekKeyOrZeroReturnVacant!0 (x!51046 lt!248543) (index!22130 lt!248543) (index!22130 lt!248543) k!1998 a!3154 mask!3216))))

(declare-fun b!544648 () Bool)

(declare-fun e!314873 () SeekEntryResult!4976)

(declare-fun e!314874 () SeekEntryResult!4976)

(assert (=> b!544648 (= e!314873 e!314874)))

(declare-fun lt!248545 () (_ BitVec 64))

(assert (=> b!544648 (= lt!248545 (select (arr!16518 a!3154) (index!22130 lt!248543)))))

(declare-fun c!63214 () Bool)

(assert (=> b!544648 (= c!63214 (= lt!248545 k!1998))))

(declare-fun d!82099 () Bool)

(declare-fun lt!248544 () SeekEntryResult!4976)

(assert (=> d!82099 (and (or (is-Undefined!4976 lt!248544) (not (is-Found!4976 lt!248544)) (and (bvsge (index!22129 lt!248544) #b00000000000000000000000000000000) (bvslt (index!22129 lt!248544) (size!16882 a!3154)))) (or (is-Undefined!4976 lt!248544) (is-Found!4976 lt!248544) (not (is-MissingZero!4976 lt!248544)) (and (bvsge (index!22128 lt!248544) #b00000000000000000000000000000000) (bvslt (index!22128 lt!248544) (size!16882 a!3154)))) (or (is-Undefined!4976 lt!248544) (is-Found!4976 lt!248544) (is-MissingZero!4976 lt!248544) (not (is-MissingVacant!4976 lt!248544)) (and (bvsge (index!22131 lt!248544) #b00000000000000000000000000000000) (bvslt (index!22131 lt!248544) (size!16882 a!3154)))) (or (is-Undefined!4976 lt!248544) (ite (is-Found!4976 lt!248544) (= (select (arr!16518 a!3154) (index!22129 lt!248544)) k!1998) (ite (is-MissingZero!4976 lt!248544) (= (select (arr!16518 a!3154) (index!22128 lt!248544)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4976 lt!248544) (= (select (arr!16518 a!3154) (index!22131 lt!248544)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82099 (= lt!248544 e!314873)))

(declare-fun c!63213 () Bool)

(assert (=> d!82099 (= c!63213 (and (is-Intermediate!4976 lt!248543) (undefined!5788 lt!248543)))))

(assert (=> d!82099 (= lt!248543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!82099 (validMask!0 mask!3216)))

(assert (=> d!82099 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!248544)))

(declare-fun b!544649 () Bool)

(assert (=> b!544649 (= e!314872 (MissingZero!4976 (index!22130 lt!248543)))))

(declare-fun b!544650 () Bool)

(assert (=> b!544650 (= e!314874 (Found!4976 (index!22130 lt!248543)))))

(declare-fun b!544651 () Bool)

(declare-fun c!63215 () Bool)

(assert (=> b!544651 (= c!63215 (= lt!248545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544651 (= e!314874 e!314872)))

(declare-fun b!544652 () Bool)

(assert (=> b!544652 (= e!314873 Undefined!4976)))

(assert (= (and d!82099 c!63213) b!544652))

(assert (= (and d!82099 (not c!63213)) b!544648))

(assert (= (and b!544648 c!63214) b!544650))

(assert (= (and b!544648 (not c!63214)) b!544651))

(assert (= (and b!544651 c!63215) b!544649))

(assert (= (and b!544651 (not c!63215)) b!544647))

(declare-fun m!522493 () Bool)

(assert (=> b!544647 m!522493))

(declare-fun m!522495 () Bool)

(assert (=> b!544648 m!522495))

(declare-fun m!522497 () Bool)

(assert (=> d!82099 m!522497))

(declare-fun m!522499 () Bool)

(assert (=> d!82099 m!522499))

(assert (=> d!82099 m!522499))

(declare-fun m!522501 () Bool)

(assert (=> d!82099 m!522501))

(assert (=> d!82099 m!522399))

(declare-fun m!522503 () Bool)

(assert (=> d!82099 m!522503))

(declare-fun m!522505 () Bool)

(assert (=> d!82099 m!522505))

(assert (=> b!544486 d!82099))

(declare-fun d!82111 () Bool)

(assert (=> d!82111 (= (validKeyInArray!0 (select (arr!16518 a!3154) j!147)) (and (not (= (select (arr!16518 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16518 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544487 d!82111))

(declare-fun b!544710 () Bool)

(declare-fun e!314912 () SeekEntryResult!4976)

(assert (=> b!544710 (= e!314912 (Intermediate!4976 false index!1177 x!1030))))

(declare-fun b!544711 () Bool)

(declare-fun lt!248565 () SeekEntryResult!4976)

(assert (=> b!544711 (and (bvsge (index!22130 lt!248565) #b00000000000000000000000000000000) (bvslt (index!22130 lt!248565) (size!16882 a!3154)))))

(declare-fun res!338890 () Bool)

(assert (=> b!544711 (= res!338890 (= (select (arr!16518 a!3154) (index!22130 lt!248565)) (select (arr!16518 a!3154) j!147)))))

(declare-fun e!314909 () Bool)

(assert (=> b!544711 (=> res!338890 e!314909)))

(declare-fun e!314910 () Bool)

(assert (=> b!544711 (= e!314910 e!314909)))

(declare-fun b!544712 () Bool)

(declare-fun e!314911 () SeekEntryResult!4976)

(assert (=> b!544712 (= e!314911 (Intermediate!4976 true index!1177 x!1030))))

(declare-fun b!544714 () Bool)

(declare-fun e!314913 () Bool)

(assert (=> b!544714 (= e!314913 e!314910)))

(declare-fun res!338891 () Bool)

(assert (=> b!544714 (= res!338891 (and (is-Intermediate!4976 lt!248565) (not (undefined!5788 lt!248565)) (bvslt (x!51046 lt!248565) #b01111111111111111111111111111110) (bvsge (x!51046 lt!248565) #b00000000000000000000000000000000) (bvsge (x!51046 lt!248565) x!1030)))))

(assert (=> b!544714 (=> (not res!338891) (not e!314910))))

(declare-fun b!544715 () Bool)

(assert (=> b!544715 (= e!314912 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16518 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544716 () Bool)

(assert (=> b!544716 (= e!314911 e!314912)))

(declare-fun c!63234 () Bool)

(declare-fun lt!248566 () (_ BitVec 64))

(assert (=> b!544716 (= c!63234 (or (= lt!248566 (select (arr!16518 a!3154) j!147)) (= (bvadd lt!248566 lt!248566) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544717 () Bool)

(assert (=> b!544717 (= e!314913 (bvsge (x!51046 lt!248565) #b01111111111111111111111111111110))))

(declare-fun b!544718 () Bool)

(assert (=> b!544718 (and (bvsge (index!22130 lt!248565) #b00000000000000000000000000000000) (bvslt (index!22130 lt!248565) (size!16882 a!3154)))))

(declare-fun res!338889 () Bool)

(assert (=> b!544718 (= res!338889 (= (select (arr!16518 a!3154) (index!22130 lt!248565)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544718 (=> res!338889 e!314909)))

(declare-fun d!82113 () Bool)

(assert (=> d!82113 e!314913))

(declare-fun c!63236 () Bool)

(assert (=> d!82113 (= c!63236 (and (is-Intermediate!4976 lt!248565) (undefined!5788 lt!248565)))))

(assert (=> d!82113 (= lt!248565 e!314911)))

(declare-fun c!63235 () Bool)

(assert (=> d!82113 (= c!63235 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!82113 (= lt!248566 (select (arr!16518 a!3154) index!1177))))

(assert (=> d!82113 (validMask!0 mask!3216)))

(assert (=> d!82113 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16518 a!3154) j!147) a!3154 mask!3216) lt!248565)))

(declare-fun b!544713 () Bool)

(assert (=> b!544713 (and (bvsge (index!22130 lt!248565) #b00000000000000000000000000000000) (bvslt (index!22130 lt!248565) (size!16882 a!3154)))))

(assert (=> b!544713 (= e!314909 (= (select (arr!16518 a!3154) (index!22130 lt!248565)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82113 c!63235) b!544712))

(assert (= (and d!82113 (not c!63235)) b!544716))

(assert (= (and b!544716 c!63234) b!544710))

(assert (= (and b!544716 (not c!63234)) b!544715))

(assert (= (and d!82113 c!63236) b!544717))

(assert (= (and d!82113 (not c!63236)) b!544714))

(assert (= (and b!544714 res!338891) b!544711))

(assert (= (and b!544711 (not res!338890)) b!544718))

(assert (= (and b!544718 (not res!338889)) b!544713))

(declare-fun m!522519 () Bool)

(assert (=> b!544711 m!522519))

(assert (=> d!82113 m!522377))

(assert (=> d!82113 m!522399))

(assert (=> b!544715 m!522389))

(assert (=> b!544715 m!522389))

(assert (=> b!544715 m!522379))

(declare-fun m!522521 () Bool)

(assert (=> b!544715 m!522521))

(assert (=> b!544718 m!522519))

(assert (=> b!544713 m!522519))

(assert (=> b!544492 d!82113))

(declare-fun d!82121 () Bool)

(assert (=> d!82121 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544490 d!82121))

(declare-fun d!82123 () Bool)

(declare-fun res!338896 () Bool)

(declare-fun e!314920 () Bool)

(assert (=> d!82123 (=> res!338896 e!314920)))

(assert (=> d!82123 (= res!338896 (= (select (arr!16518 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!82123 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!314920)))

(declare-fun b!544727 () Bool)

(declare-fun e!314921 () Bool)

(assert (=> b!544727 (= e!314920 e!314921)))

(declare-fun res!338897 () Bool)

(assert (=> b!544727 (=> (not res!338897) (not e!314921))))

(assert (=> b!544727 (= res!338897 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16882 a!3154)))))

(declare-fun b!544728 () Bool)

(assert (=> b!544728 (= e!314921 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82123 (not res!338896)) b!544727))

(assert (= (and b!544727 res!338897) b!544728))

(declare-fun m!522525 () Bool)

(assert (=> d!82123 m!522525))

(declare-fun m!522527 () Bool)

(assert (=> b!544728 m!522527))

(assert (=> b!544491 d!82123))

(declare-fun d!82127 () Bool)

(declare-fun res!338906 () Bool)

(declare-fun e!314940 () Bool)

(assert (=> d!82127 (=> res!338906 e!314940)))

(assert (=> d!82127 (= res!338906 (bvsge #b00000000000000000000000000000000 (size!16882 a!3154)))))

(assert (=> d!82127 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10634) e!314940)))

(declare-fun b!544753 () Bool)

(declare-fun e!314939 () Bool)

(assert (=> b!544753 (= e!314940 e!314939)))

(declare-fun res!338905 () Bool)

(assert (=> b!544753 (=> (not res!338905) (not e!314939))))

(declare-fun e!314937 () Bool)

(assert (=> b!544753 (= res!338905 (not e!314937))))

(declare-fun res!338904 () Bool)

(assert (=> b!544753 (=> (not res!338904) (not e!314937))))

(assert (=> b!544753 (= res!338904 (validKeyInArray!0 (select (arr!16518 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544754 () Bool)

(declare-fun e!314938 () Bool)

(assert (=> b!544754 (= e!314939 e!314938)))

(declare-fun c!63248 () Bool)

(assert (=> b!544754 (= c!63248 (validKeyInArray!0 (select (arr!16518 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32102 () Bool)

(declare-fun call!32105 () Bool)

(assert (=> bm!32102 (= call!32105 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63248 (Cons!10633 (select (arr!16518 a!3154) #b00000000000000000000000000000000) Nil!10634) Nil!10634)))))

(declare-fun b!544755 () Bool)

(declare-fun contains!2809 (List!10637 (_ BitVec 64)) Bool)

(assert (=> b!544755 (= e!314937 (contains!2809 Nil!10634 (select (arr!16518 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544756 () Bool)

(assert (=> b!544756 (= e!314938 call!32105)))

(declare-fun b!544757 () Bool)

(assert (=> b!544757 (= e!314938 call!32105)))

(assert (= (and d!82127 (not res!338906)) b!544753))

(assert (= (and b!544753 res!338904) b!544755))

(assert (= (and b!544753 res!338905) b!544754))

(assert (= (and b!544754 c!63248) b!544757))

(assert (= (and b!544754 (not c!63248)) b!544756))

(assert (= (or b!544757 b!544756) bm!32102))

(assert (=> b!544753 m!522525))

(assert (=> b!544753 m!522525))

(declare-fun m!522543 () Bool)

(assert (=> b!544753 m!522543))

(assert (=> b!544754 m!522525))

(assert (=> b!544754 m!522525))

(assert (=> b!544754 m!522543))

(assert (=> bm!32102 m!522525))

(declare-fun m!522545 () Bool)

(assert (=> bm!32102 m!522545))

(assert (=> b!544755 m!522525))

(assert (=> b!544755 m!522525))

(declare-fun m!522547 () Bool)

(assert (=> b!544755 m!522547))

(assert (=> b!544489 d!82127))

(declare-fun bm!32105 () Bool)

(declare-fun call!32108 () Bool)

(assert (=> bm!32105 (= call!32108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!82131 () Bool)

(declare-fun res!338916 () Bool)

(declare-fun e!314953 () Bool)

(assert (=> d!82131 (=> res!338916 e!314953)))

(assert (=> d!82131 (= res!338916 (bvsge #b00000000000000000000000000000000 (size!16882 a!3154)))))

(assert (=> d!82131 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314953)))

(declare-fun b!544775 () Bool)

(declare-fun e!314954 () Bool)

(assert (=> b!544775 (= e!314954 call!32108)))

(declare-fun b!544776 () Bool)

(declare-fun e!314952 () Bool)

(assert (=> b!544776 (= e!314953 e!314952)))

(declare-fun c!63254 () Bool)

(assert (=> b!544776 (= c!63254 (validKeyInArray!0 (select (arr!16518 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544777 () Bool)

(assert (=> b!544777 (= e!314952 call!32108)))

(declare-fun b!544778 () Bool)

(assert (=> b!544778 (= e!314952 e!314954)))

(declare-fun lt!248598 () (_ BitVec 64))

(assert (=> b!544778 (= lt!248598 (select (arr!16518 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16914 0))(
  ( (Unit!16915) )
))
(declare-fun lt!248596 () Unit!16914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34373 (_ BitVec 64) (_ BitVec 32)) Unit!16914)

(assert (=> b!544778 (= lt!248596 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248598 #b00000000000000000000000000000000))))

(assert (=> b!544778 (arrayContainsKey!0 a!3154 lt!248598 #b00000000000000000000000000000000)))

(declare-fun lt!248597 () Unit!16914)

(assert (=> b!544778 (= lt!248597 lt!248596)))

(declare-fun res!338915 () Bool)

(assert (=> b!544778 (= res!338915 (= (seekEntryOrOpen!0 (select (arr!16518 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4976 #b00000000000000000000000000000000)))))

(assert (=> b!544778 (=> (not res!338915) (not e!314954))))

(assert (= (and d!82131 (not res!338916)) b!544776))

(assert (= (and b!544776 c!63254) b!544778))

(assert (= (and b!544776 (not c!63254)) b!544777))

(assert (= (and b!544778 res!338915) b!544775))

(assert (= (or b!544775 b!544777) bm!32105))

(declare-fun m!522559 () Bool)

(assert (=> bm!32105 m!522559))

(assert (=> b!544776 m!522525))

(assert (=> b!544776 m!522525))

(assert (=> b!544776 m!522543))

(assert (=> b!544778 m!522525))

(declare-fun m!522561 () Bool)

(assert (=> b!544778 m!522561))

(declare-fun m!522563 () Bool)

(assert (=> b!544778 m!522563))

(assert (=> b!544778 m!522525))

(declare-fun m!522565 () Bool)

(assert (=> b!544778 m!522565))

(assert (=> b!544494 d!82131))

(declare-fun e!314958 () SeekEntryResult!4976)

(declare-fun b!544779 () Bool)

(assert (=> b!544779 (= e!314958 (Intermediate!4976 false (toIndex!0 (select (arr!16518 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544780 () Bool)

(declare-fun lt!248599 () SeekEntryResult!4976)

(assert (=> b!544780 (and (bvsge (index!22130 lt!248599) #b00000000000000000000000000000000) (bvslt (index!22130 lt!248599) (size!16882 a!3154)))))

(declare-fun res!338918 () Bool)

(assert (=> b!544780 (= res!338918 (= (select (arr!16518 a!3154) (index!22130 lt!248599)) (select (arr!16518 a!3154) j!147)))))

(declare-fun e!314955 () Bool)

(assert (=> b!544780 (=> res!338918 e!314955)))

(declare-fun e!314956 () Bool)

(assert (=> b!544780 (= e!314956 e!314955)))

(declare-fun e!314957 () SeekEntryResult!4976)

(declare-fun b!544781 () Bool)

(assert (=> b!544781 (= e!314957 (Intermediate!4976 true (toIndex!0 (select (arr!16518 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544783 () Bool)

(declare-fun e!314959 () Bool)

(assert (=> b!544783 (= e!314959 e!314956)))

(declare-fun res!338919 () Bool)

(assert (=> b!544783 (= res!338919 (and (is-Intermediate!4976 lt!248599) (not (undefined!5788 lt!248599)) (bvslt (x!51046 lt!248599) #b01111111111111111111111111111110) (bvsge (x!51046 lt!248599) #b00000000000000000000000000000000) (bvsge (x!51046 lt!248599) #b00000000000000000000000000000000)))))

(assert (=> b!544783 (=> (not res!338919) (not e!314956))))

(declare-fun b!544784 () Bool)

(assert (=> b!544784 (= e!314958 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16518 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16518 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544785 () Bool)

(assert (=> b!544785 (= e!314957 e!314958)))

(declare-fun lt!248600 () (_ BitVec 64))

(declare-fun c!63255 () Bool)

(assert (=> b!544785 (= c!63255 (or (= lt!248600 (select (arr!16518 a!3154) j!147)) (= (bvadd lt!248600 lt!248600) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544786 () Bool)

(assert (=> b!544786 (= e!314959 (bvsge (x!51046 lt!248599) #b01111111111111111111111111111110))))

(declare-fun b!544787 () Bool)

(assert (=> b!544787 (and (bvsge (index!22130 lt!248599) #b00000000000000000000000000000000) (bvslt (index!22130 lt!248599) (size!16882 a!3154)))))

(declare-fun res!338917 () Bool)

(assert (=> b!544787 (= res!338917 (= (select (arr!16518 a!3154) (index!22130 lt!248599)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544787 (=> res!338917 e!314955)))

(declare-fun d!82143 () Bool)

(assert (=> d!82143 e!314959))

(declare-fun c!63257 () Bool)

(assert (=> d!82143 (= c!63257 (and (is-Intermediate!4976 lt!248599) (undefined!5788 lt!248599)))))

(assert (=> d!82143 (= lt!248599 e!314957)))

(declare-fun c!63256 () Bool)

(assert (=> d!82143 (= c!63256 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!82143 (= lt!248600 (select (arr!16518 a!3154) (toIndex!0 (select (arr!16518 a!3154) j!147) mask!3216)))))

(assert (=> d!82143 (validMask!0 mask!3216)))

(assert (=> d!82143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16518 a!3154) j!147) mask!3216) (select (arr!16518 a!3154) j!147) a!3154 mask!3216) lt!248599)))

(declare-fun b!544782 () Bool)

(assert (=> b!544782 (and (bvsge (index!22130 lt!248599) #b00000000000000000000000000000000) (bvslt (index!22130 lt!248599) (size!16882 a!3154)))))

(assert (=> b!544782 (= e!314955 (= (select (arr!16518 a!3154) (index!22130 lt!248599)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82143 c!63256) b!544781))

(assert (= (and d!82143 (not c!63256)) b!544785))

(assert (= (and b!544785 c!63255) b!544779))

(assert (= (and b!544785 (not c!63255)) b!544784))

(assert (= (and d!82143 c!63257) b!544786))

(assert (= (and d!82143 (not c!63257)) b!544783))

(assert (= (and b!544783 res!338919) b!544780))

(assert (= (and b!544780 (not res!338918)) b!544787))

(assert (= (and b!544787 (not res!338917)) b!544782))

(declare-fun m!522567 () Bool)

(assert (=> b!544780 m!522567))

(assert (=> d!82143 m!522381))

(declare-fun m!522569 () Bool)

(assert (=> d!82143 m!522569))

(assert (=> d!82143 m!522399))

(assert (=> b!544784 m!522381))

(declare-fun m!522571 () Bool)

(assert (=> b!544784 m!522571))

(assert (=> b!544784 m!522571))

(assert (=> b!544784 m!522379))

(declare-fun m!522573 () Bool)

(assert (=> b!544784 m!522573))

(assert (=> b!544787 m!522567))

(assert (=> b!544782 m!522567))

(assert (=> b!544495 d!82143))

(declare-fun d!82145 () Bool)

(declare-fun lt!248606 () (_ BitVec 32))

(declare-fun lt!248605 () (_ BitVec 32))

(assert (=> d!82145 (= lt!248606 (bvmul (bvxor lt!248605 (bvlshr lt!248605 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82145 (= lt!248605 ((_ extract 31 0) (bvand (bvxor (select (arr!16518 a!3154) j!147) (bvlshr (select (arr!16518 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82145 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338920 (let ((h!11595 ((_ extract 31 0) (bvand (bvxor (select (arr!16518 a!3154) j!147) (bvlshr (select (arr!16518 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51055 (bvmul (bvxor h!11595 (bvlshr h!11595 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51055 (bvlshr x!51055 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338920 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338920 #b00000000000000000000000000000000))))))

(assert (=> d!82145 (= (toIndex!0 (select (arr!16518 a!3154) j!147) mask!3216) (bvand (bvxor lt!248606 (bvlshr lt!248606 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!544495 d!82145))

(declare-fun d!82147 () Bool)

(assert (=> d!82147 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49446 d!82147))

(declare-fun d!82153 () Bool)

(assert (=> d!82153 (= (array_inv!12314 a!3154) (bvsge (size!16882 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49446 d!82153))

(declare-fun d!82155 () Bool)

(declare-fun lt!248626 () (_ BitVec 32))

(assert (=> d!82155 (and (bvsge lt!248626 #b00000000000000000000000000000000) (bvslt lt!248626 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82155 (= lt!248626 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82155 (validMask!0 mask!3216)))

(assert (=> d!82155 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248626)))

(declare-fun bs!16992 () Bool)

(assert (= bs!16992 d!82155))

(declare-fun m!522597 () Bool)

(assert (=> bs!16992 m!522597))

(assert (=> bs!16992 m!522399))

(assert (=> b!544488 d!82155))

(push 1)

