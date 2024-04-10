; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67582 () Bool)

(assert start!67582)

(declare-fun res!529610 () Bool)

(declare-fun e!435168 () Bool)

(assert (=> start!67582 (=> (not res!529610) (not e!435168))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67582 (= res!529610 (validMask!0 mask!3328))))

(assert (=> start!67582 e!435168))

(assert (=> start!67582 true))

(declare-datatypes ((array!42685 0))(
  ( (array!42686 (arr!20432 (Array (_ BitVec 32) (_ BitVec 64))) (size!20853 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42685)

(declare-fun array_inv!16228 (array!42685) Bool)

(assert (=> start!67582 (array_inv!16228 a!3186)))

(declare-fun b!782644 () Bool)

(declare-fun e!435169 () Bool)

(assert (=> b!782644 (= e!435168 e!435169)))

(declare-fun res!529617 () Bool)

(assert (=> b!782644 (=> (not res!529617) (not e!435169))))

(declare-datatypes ((SeekEntryResult!8032 0))(
  ( (MissingZero!8032 (index!34496 (_ BitVec 32))) (Found!8032 (index!34497 (_ BitVec 32))) (Intermediate!8032 (undefined!8844 Bool) (index!34498 (_ BitVec 32)) (x!65443 (_ BitVec 32))) (Undefined!8032) (MissingVacant!8032 (index!34499 (_ BitVec 32))) )
))
(declare-fun lt!348818 () SeekEntryResult!8032)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782644 (= res!529617 (or (= lt!348818 (MissingZero!8032 i!1173)) (= lt!348818 (MissingVacant!8032 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42685 (_ BitVec 32)) SeekEntryResult!8032)

(assert (=> b!782644 (= lt!348818 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!782645 () Bool)

(declare-fun res!529606 () Bool)

(assert (=> b!782645 (=> (not res!529606) (not e!435168))))

(declare-fun arrayContainsKey!0 (array!42685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782645 (= res!529606 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782646 () Bool)

(declare-fun res!529620 () Bool)

(declare-fun e!435176 () Bool)

(assert (=> b!782646 (=> res!529620 e!435176)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!348813 () SeekEntryResult!8032)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42685 (_ BitVec 32)) SeekEntryResult!8032)

(assert (=> b!782646 (= res!529620 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348813)))))

(declare-fun b!782647 () Bool)

(declare-fun e!435170 () Bool)

(assert (=> b!782647 (= e!435176 e!435170)))

(declare-fun res!529616 () Bool)

(assert (=> b!782647 (=> res!529616 e!435170)))

(declare-fun lt!348808 () (_ BitVec 64))

(declare-fun lt!348810 () (_ BitVec 64))

(assert (=> b!782647 (= res!529616 (= lt!348808 lt!348810))))

(assert (=> b!782647 (= lt!348808 (select (store (arr!20432 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!782648 () Bool)

(declare-fun res!529618 () Bool)

(assert (=> b!782648 (=> (not res!529618) (not e!435169))))

(declare-datatypes ((List!14434 0))(
  ( (Nil!14431) (Cons!14430 (h!15550 (_ BitVec 64)) (t!20749 List!14434)) )
))
(declare-fun arrayNoDuplicates!0 (array!42685 (_ BitVec 32) List!14434) Bool)

(assert (=> b!782648 (= res!529618 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14431))))

(declare-fun b!782649 () Bool)

(declare-datatypes ((Unit!27016 0))(
  ( (Unit!27017) )
))
(declare-fun e!435174 () Unit!27016)

(declare-fun Unit!27018 () Unit!27016)

(assert (=> b!782649 (= e!435174 Unit!27018)))

(assert (=> b!782649 false))

(declare-fun b!782650 () Bool)

(declare-fun res!529608 () Bool)

(assert (=> b!782650 (=> (not res!529608) (not e!435168))))

(assert (=> b!782650 (= res!529608 (and (= (size!20853 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20853 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20853 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782651 () Bool)

(declare-fun e!435172 () Bool)

(assert (=> b!782651 (= e!435172 (not e!435176))))

(declare-fun res!529621 () Bool)

(assert (=> b!782651 (=> res!529621 e!435176)))

(declare-fun lt!348809 () SeekEntryResult!8032)

(assert (=> b!782651 (= res!529621 (or (not (is-Intermediate!8032 lt!348809)) (bvslt x!1131 (x!65443 lt!348809)) (not (= x!1131 (x!65443 lt!348809))) (not (= index!1321 (index!34498 lt!348809)))))))

(declare-fun e!435171 () Bool)

(assert (=> b!782651 e!435171))

(declare-fun res!529609 () Bool)

(assert (=> b!782651 (=> (not res!529609) (not e!435171))))

(declare-fun lt!348816 () SeekEntryResult!8032)

(assert (=> b!782651 (= res!529609 (= lt!348816 lt!348813))))

(assert (=> b!782651 (= lt!348813 (Found!8032 j!159))))

(assert (=> b!782651 (= lt!348816 (seekEntryOrOpen!0 (select (arr!20432 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42685 (_ BitVec 32)) Bool)

(assert (=> b!782651 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348817 () Unit!27016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27016)

(assert (=> b!782651 (= lt!348817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782652 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782652 (= e!435171 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348813))))

(declare-fun b!782653 () Bool)

(declare-fun res!529614 () Bool)

(assert (=> b!782653 (=> (not res!529614) (not e!435169))))

(assert (=> b!782653 (= res!529614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782654 () Bool)

(declare-fun res!529613 () Bool)

(declare-fun e!435167 () Bool)

(assert (=> b!782654 (=> (not res!529613) (not e!435167))))

(assert (=> b!782654 (= res!529613 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20432 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782655 () Bool)

(declare-fun res!529607 () Bool)

(assert (=> b!782655 (=> (not res!529607) (not e!435168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782655 (= res!529607 (validKeyInArray!0 (select (arr!20432 a!3186) j!159)))))

(declare-fun b!782656 () Bool)

(assert (=> b!782656 (= e!435167 e!435172)))

(declare-fun res!529612 () Bool)

(assert (=> b!782656 (=> (not res!529612) (not e!435172))))

(declare-fun lt!348814 () SeekEntryResult!8032)

(assert (=> b!782656 (= res!529612 (= lt!348814 lt!348809))))

(declare-fun lt!348812 () array!42685)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42685 (_ BitVec 32)) SeekEntryResult!8032)

(assert (=> b!782656 (= lt!348809 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348810 lt!348812 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782656 (= lt!348814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348810 mask!3328) lt!348810 lt!348812 mask!3328))))

(assert (=> b!782656 (= lt!348810 (select (store (arr!20432 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!782656 (= lt!348812 (array!42686 (store (arr!20432 a!3186) i!1173 k!2102) (size!20853 a!3186)))))

(declare-fun b!782657 () Bool)

(assert (=> b!782657 (= e!435170 (= (seekEntryOrOpen!0 lt!348810 lt!348812 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348810 lt!348812 mask!3328)))))

(assert (=> b!782657 (= lt!348808 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348811 () Unit!27016)

(assert (=> b!782657 (= lt!348811 e!435174)))

(declare-fun c!86925 () Bool)

(assert (=> b!782657 (= c!86925 (= lt!348808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782658 () Bool)

(declare-fun res!529622 () Bool)

(assert (=> b!782658 (=> (not res!529622) (not e!435169))))

(assert (=> b!782658 (= res!529622 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20853 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20853 a!3186))))))

(declare-fun b!782659 () Bool)

(assert (=> b!782659 (= e!435169 e!435167)))

(declare-fun res!529619 () Bool)

(assert (=> b!782659 (=> (not res!529619) (not e!435167))))

(declare-fun lt!348815 () SeekEntryResult!8032)

(assert (=> b!782659 (= res!529619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20432 a!3186) j!159) mask!3328) (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348815))))

(assert (=> b!782659 (= lt!348815 (Intermediate!8032 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782660 () Bool)

(declare-fun res!529615 () Bool)

(assert (=> b!782660 (=> (not res!529615) (not e!435168))))

(assert (=> b!782660 (= res!529615 (validKeyInArray!0 k!2102))))

(declare-fun e!435173 () Bool)

(declare-fun b!782661 () Bool)

(assert (=> b!782661 (= e!435173 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) (Found!8032 j!159)))))

(declare-fun b!782662 () Bool)

(declare-fun res!529611 () Bool)

(assert (=> b!782662 (=> (not res!529611) (not e!435167))))

(assert (=> b!782662 (= res!529611 e!435173)))

(declare-fun c!86926 () Bool)

(assert (=> b!782662 (= c!86926 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782663 () Bool)

(declare-fun Unit!27019 () Unit!27016)

(assert (=> b!782663 (= e!435174 Unit!27019)))

(declare-fun b!782664 () Bool)

(assert (=> b!782664 (= e!435173 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348815))))

(assert (= (and start!67582 res!529610) b!782650))

(assert (= (and b!782650 res!529608) b!782655))

(assert (= (and b!782655 res!529607) b!782660))

(assert (= (and b!782660 res!529615) b!782645))

(assert (= (and b!782645 res!529606) b!782644))

(assert (= (and b!782644 res!529617) b!782653))

(assert (= (and b!782653 res!529614) b!782648))

(assert (= (and b!782648 res!529618) b!782658))

(assert (= (and b!782658 res!529622) b!782659))

(assert (= (and b!782659 res!529619) b!782654))

(assert (= (and b!782654 res!529613) b!782662))

(assert (= (and b!782662 c!86926) b!782664))

(assert (= (and b!782662 (not c!86926)) b!782661))

(assert (= (and b!782662 res!529611) b!782656))

(assert (= (and b!782656 res!529612) b!782651))

(assert (= (and b!782651 res!529609) b!782652))

(assert (= (and b!782651 (not res!529621)) b!782646))

(assert (= (and b!782646 (not res!529620)) b!782647))

(assert (= (and b!782647 (not res!529616)) b!782657))

(assert (= (and b!782657 c!86925) b!782649))

(assert (= (and b!782657 (not c!86925)) b!782663))

(declare-fun m!725395 () Bool)

(assert (=> b!782651 m!725395))

(assert (=> b!782651 m!725395))

(declare-fun m!725397 () Bool)

(assert (=> b!782651 m!725397))

(declare-fun m!725399 () Bool)

(assert (=> b!782651 m!725399))

(declare-fun m!725401 () Bool)

(assert (=> b!782651 m!725401))

(assert (=> b!782655 m!725395))

(assert (=> b!782655 m!725395))

(declare-fun m!725403 () Bool)

(assert (=> b!782655 m!725403))

(declare-fun m!725405 () Bool)

(assert (=> b!782653 m!725405))

(declare-fun m!725407 () Bool)

(assert (=> b!782645 m!725407))

(assert (=> b!782652 m!725395))

(assert (=> b!782652 m!725395))

(declare-fun m!725409 () Bool)

(assert (=> b!782652 m!725409))

(declare-fun m!725411 () Bool)

(assert (=> b!782644 m!725411))

(assert (=> b!782646 m!725395))

(assert (=> b!782646 m!725395))

(declare-fun m!725413 () Bool)

(assert (=> b!782646 m!725413))

(declare-fun m!725415 () Bool)

(assert (=> b!782660 m!725415))

(assert (=> b!782661 m!725395))

(assert (=> b!782661 m!725395))

(assert (=> b!782661 m!725413))

(declare-fun m!725417 () Bool)

(assert (=> b!782657 m!725417))

(declare-fun m!725419 () Bool)

(assert (=> b!782657 m!725419))

(declare-fun m!725421 () Bool)

(assert (=> b!782647 m!725421))

(declare-fun m!725423 () Bool)

(assert (=> b!782647 m!725423))

(declare-fun m!725425 () Bool)

(assert (=> start!67582 m!725425))

(declare-fun m!725427 () Bool)

(assert (=> start!67582 m!725427))

(declare-fun m!725429 () Bool)

(assert (=> b!782656 m!725429))

(declare-fun m!725431 () Bool)

(assert (=> b!782656 m!725431))

(assert (=> b!782656 m!725429))

(assert (=> b!782656 m!725421))

(declare-fun m!725433 () Bool)

(assert (=> b!782656 m!725433))

(declare-fun m!725435 () Bool)

(assert (=> b!782656 m!725435))

(assert (=> b!782659 m!725395))

(assert (=> b!782659 m!725395))

(declare-fun m!725437 () Bool)

(assert (=> b!782659 m!725437))

(assert (=> b!782659 m!725437))

(assert (=> b!782659 m!725395))

(declare-fun m!725439 () Bool)

(assert (=> b!782659 m!725439))

(declare-fun m!725441 () Bool)

(assert (=> b!782654 m!725441))

(declare-fun m!725443 () Bool)

(assert (=> b!782648 m!725443))

(assert (=> b!782664 m!725395))

(assert (=> b!782664 m!725395))

(declare-fun m!725445 () Bool)

(assert (=> b!782664 m!725445))

(push 1)

(assert (not b!782651))

(assert (not b!782656))

(assert (not start!67582))

(assert (not b!782661))

(assert (not b!782652))

(assert (not b!782645))

(assert (not b!782655))

(assert (not b!782659))

(assert (not b!782648))

(assert (not b!782646))

(assert (not b!782657))

(assert (not b!782644))

(assert (not b!782660))

(assert (not b!782664))

(assert (not b!782653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102663 () Bool)

(declare-fun res!529653 () Bool)

(declare-fun e!435229 () Bool)

(assert (=> d!102663 (=> res!529653 e!435229)))

(assert (=> d!102663 (= res!529653 (bvsge #b00000000000000000000000000000000 (size!20853 a!3186)))))

(assert (=> d!102663 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14431) e!435229)))

(declare-fun b!782750 () Bool)

(declare-fun e!435228 () Bool)

(declare-fun call!35262 () Bool)

(assert (=> b!782750 (= e!435228 call!35262)))

(declare-fun b!782751 () Bool)

(declare-fun e!435231 () Bool)

(declare-fun contains!4108 (List!14434 (_ BitVec 64)) Bool)

(assert (=> b!782751 (= e!435231 (contains!4108 Nil!14431 (select (arr!20432 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!782752 () Bool)

(declare-fun e!435230 () Bool)

(assert (=> b!782752 (= e!435230 e!435228)))

(declare-fun c!86956 () Bool)

(assert (=> b!782752 (= c!86956 (validKeyInArray!0 (select (arr!20432 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!782753 () Bool)

(assert (=> b!782753 (= e!435229 e!435230)))

(declare-fun res!529651 () Bool)

(assert (=> b!782753 (=> (not res!529651) (not e!435230))))

(assert (=> b!782753 (= res!529651 (not e!435231))))

(declare-fun res!529652 () Bool)

(assert (=> b!782753 (=> (not res!529652) (not e!435231))))

(assert (=> b!782753 (= res!529652 (validKeyInArray!0 (select (arr!20432 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!782754 () Bool)

(assert (=> b!782754 (= e!435228 call!35262)))

(declare-fun bm!35259 () Bool)

(assert (=> bm!35259 (= call!35262 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86956 (Cons!14430 (select (arr!20432 a!3186) #b00000000000000000000000000000000) Nil!14431) Nil!14431)))))

(assert (= (and d!102663 (not res!529653)) b!782753))

(assert (= (and b!782753 res!529652) b!782751))

(assert (= (and b!782753 res!529651) b!782752))

(assert (= (and b!782752 c!86956) b!782750))

(assert (= (and b!782752 (not c!86956)) b!782754))

(assert (= (or b!782750 b!782754) bm!35259))

(declare-fun m!725487 () Bool)

(assert (=> b!782751 m!725487))

(assert (=> b!782751 m!725487))

(declare-fun m!725489 () Bool)

(assert (=> b!782751 m!725489))

(assert (=> b!782752 m!725487))

(assert (=> b!782752 m!725487))

(declare-fun m!725491 () Bool)

(assert (=> b!782752 m!725491))

(assert (=> b!782753 m!725487))

(assert (=> b!782753 m!725487))

(assert (=> b!782753 m!725491))

(assert (=> bm!35259 m!725487))

(declare-fun m!725493 () Bool)

(assert (=> bm!35259 m!725493))

(assert (=> b!782648 d!102663))

(declare-fun b!782830 () Bool)

(declare-fun lt!348879 () SeekEntryResult!8032)

(assert (=> b!782830 (and (bvsge (index!34498 lt!348879) #b00000000000000000000000000000000) (bvslt (index!34498 lt!348879) (size!20853 a!3186)))))

(declare-fun res!529670 () Bool)

(assert (=> b!782830 (= res!529670 (= (select (arr!20432 a!3186) (index!34498 lt!348879)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435274 () Bool)

(assert (=> b!782830 (=> res!529670 e!435274)))

(declare-fun e!435277 () SeekEntryResult!8032)

(declare-fun b!782831 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782831 (= e!435277 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20432 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20432 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782832 () Bool)

(assert (=> b!782832 (= e!435277 (Intermediate!8032 false (toIndex!0 (select (arr!20432 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!782833 () Bool)

(declare-fun e!435276 () Bool)

(declare-fun e!435278 () Bool)

(assert (=> b!782833 (= e!435276 e!435278)))

(declare-fun res!529671 () Bool)

(assert (=> b!782833 (= res!529671 (and (is-Intermediate!8032 lt!348879) (not (undefined!8844 lt!348879)) (bvslt (x!65443 lt!348879) #b01111111111111111111111111111110) (bvsge (x!65443 lt!348879) #b00000000000000000000000000000000) (bvsge (x!65443 lt!348879) #b00000000000000000000000000000000)))))

(assert (=> b!782833 (=> (not res!529671) (not e!435278))))

(declare-fun b!782834 () Bool)

(declare-fun e!435275 () SeekEntryResult!8032)

(assert (=> b!782834 (= e!435275 e!435277)))

(declare-fun c!86989 () Bool)

(declare-fun lt!348880 () (_ BitVec 64))

(assert (=> b!782834 (= c!86989 (or (= lt!348880 (select (arr!20432 a!3186) j!159)) (= (bvadd lt!348880 lt!348880) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102673 () Bool)

(assert (=> d!102673 e!435276))

(declare-fun c!86987 () Bool)

(assert (=> d!102673 (= c!86987 (and (is-Intermediate!8032 lt!348879) (undefined!8844 lt!348879)))))

(assert (=> d!102673 (= lt!348879 e!435275)))

(declare-fun c!86988 () Bool)

(assert (=> d!102673 (= c!86988 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102673 (= lt!348880 (select (arr!20432 a!3186) (toIndex!0 (select (arr!20432 a!3186) j!159) mask!3328)))))

(assert (=> d!102673 (validMask!0 mask!3328)))

(assert (=> d!102673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20432 a!3186) j!159) mask!3328) (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348879)))

(declare-fun b!782835 () Bool)

(assert (=> b!782835 (and (bvsge (index!34498 lt!348879) #b00000000000000000000000000000000) (bvslt (index!34498 lt!348879) (size!20853 a!3186)))))

(declare-fun res!529669 () Bool)

(assert (=> b!782835 (= res!529669 (= (select (arr!20432 a!3186) (index!34498 lt!348879)) (select (arr!20432 a!3186) j!159)))))

(assert (=> b!782835 (=> res!529669 e!435274)))

(assert (=> b!782835 (= e!435278 e!435274)))

(declare-fun b!782836 () Bool)

(assert (=> b!782836 (= e!435276 (bvsge (x!65443 lt!348879) #b01111111111111111111111111111110))))

(declare-fun b!782837 () Bool)

(assert (=> b!782837 (and (bvsge (index!34498 lt!348879) #b00000000000000000000000000000000) (bvslt (index!34498 lt!348879) (size!20853 a!3186)))))

(assert (=> b!782837 (= e!435274 (= (select (arr!20432 a!3186) (index!34498 lt!348879)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782838 () Bool)

(assert (=> b!782838 (= e!435275 (Intermediate!8032 true (toIndex!0 (select (arr!20432 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102673 c!86988) b!782838))

(assert (= (and d!102673 (not c!86988)) b!782834))

(assert (= (and b!782834 c!86989) b!782832))

(assert (= (and b!782834 (not c!86989)) b!782831))

(assert (= (and d!102673 c!86987) b!782836))

(assert (= (and d!102673 (not c!86987)) b!782833))

(assert (= (and b!782833 res!529671) b!782835))

(assert (= (and b!782835 (not res!529669)) b!782830))

(assert (= (and b!782830 (not res!529670)) b!782837))

(assert (=> d!102673 m!725437))

(declare-fun m!725531 () Bool)

(assert (=> d!102673 m!725531))

(assert (=> d!102673 m!725425))

(declare-fun m!725533 () Bool)

(assert (=> b!782837 m!725533))

(assert (=> b!782830 m!725533))

(assert (=> b!782831 m!725437))

(declare-fun m!725535 () Bool)

(assert (=> b!782831 m!725535))

(assert (=> b!782831 m!725535))

(assert (=> b!782831 m!725395))

(declare-fun m!725537 () Bool)

(assert (=> b!782831 m!725537))

(assert (=> b!782835 m!725533))

(assert (=> b!782659 d!102673))

(declare-fun d!102691 () Bool)

(declare-fun lt!348888 () (_ BitVec 32))

(declare-fun lt!348887 () (_ BitVec 32))

(assert (=> d!102691 (= lt!348888 (bvmul (bvxor lt!348887 (bvlshr lt!348887 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102691 (= lt!348887 ((_ extract 31 0) (bvand (bvxor (select (arr!20432 a!3186) j!159) (bvlshr (select (arr!20432 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102691 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!529672 (let ((h!15552 ((_ extract 31 0) (bvand (bvxor (select (arr!20432 a!3186) j!159) (bvlshr (select (arr!20432 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65449 (bvmul (bvxor h!15552 (bvlshr h!15552 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65449 (bvlshr x!65449 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!529672 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!529672 #b00000000000000000000000000000000))))))

(assert (=> d!102691 (= (toIndex!0 (select (arr!20432 a!3186) j!159) mask!3328) (bvand (bvxor lt!348888 (bvlshr lt!348888 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!782659 d!102691))

(declare-fun d!102699 () Bool)

(assert (=> d!102699 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!782660 d!102699))

(declare-fun b!782900 () Bool)

(declare-fun e!435316 () SeekEntryResult!8032)

(assert (=> b!782900 (= e!435316 (Found!8032 index!1321))))

(declare-fun b!782901 () Bool)

(declare-fun e!435317 () SeekEntryResult!8032)

(assert (=> b!782901 (= e!435317 Undefined!8032)))

(declare-fun b!782902 () Bool)

(declare-fun c!87016 () Bool)

(declare-fun lt!348908 () (_ BitVec 64))

(assert (=> b!782902 (= c!87016 (= lt!348908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435315 () SeekEntryResult!8032)

(assert (=> b!782902 (= e!435316 e!435315)))

(declare-fun b!782904 () Bool)

(assert (=> b!782904 (= e!435315 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782905 () Bool)

(assert (=> b!782905 (= e!435315 (MissingVacant!8032 resIntermediateIndex!5))))

(declare-fun lt!348907 () SeekEntryResult!8032)

(declare-fun d!102701 () Bool)

(assert (=> d!102701 (and (or (is-Undefined!8032 lt!348907) (not (is-Found!8032 lt!348907)) (and (bvsge (index!34497 lt!348907) #b00000000000000000000000000000000) (bvslt (index!34497 lt!348907) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348907) (is-Found!8032 lt!348907) (not (is-MissingVacant!8032 lt!348907)) (not (= (index!34499 lt!348907) resIntermediateIndex!5)) (and (bvsge (index!34499 lt!348907) #b00000000000000000000000000000000) (bvslt (index!34499 lt!348907) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348907) (ite (is-Found!8032 lt!348907) (= (select (arr!20432 a!3186) (index!34497 lt!348907)) (select (arr!20432 a!3186) j!159)) (and (is-MissingVacant!8032 lt!348907) (= (index!34499 lt!348907) resIntermediateIndex!5) (= (select (arr!20432 a!3186) (index!34499 lt!348907)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102701 (= lt!348907 e!435317)))

(declare-fun c!87015 () Bool)

(assert (=> d!102701 (= c!87015 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102701 (= lt!348908 (select (arr!20432 a!3186) index!1321))))

(assert (=> d!102701 (validMask!0 mask!3328)))

(assert (=> d!102701 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348907)))

(declare-fun b!782903 () Bool)

(assert (=> b!782903 (= e!435317 e!435316)))

(declare-fun c!87017 () Bool)

(assert (=> b!782903 (= c!87017 (= lt!348908 (select (arr!20432 a!3186) j!159)))))

(assert (= (and d!102701 c!87015) b!782901))

(assert (= (and d!102701 (not c!87015)) b!782903))

(assert (= (and b!782903 c!87017) b!782900))

(assert (= (and b!782903 (not c!87017)) b!782902))

(assert (= (and b!782902 c!87016) b!782905))

(assert (= (and b!782902 (not c!87016)) b!782904))

(declare-fun m!725583 () Bool)

(assert (=> b!782904 m!725583))

(assert (=> b!782904 m!725583))

(assert (=> b!782904 m!725395))

(declare-fun m!725585 () Bool)

(assert (=> b!782904 m!725585))

(declare-fun m!725587 () Bool)

(assert (=> d!102701 m!725587))

(declare-fun m!725589 () Bool)

(assert (=> d!102701 m!725589))

(declare-fun m!725591 () Bool)

(assert (=> d!102701 m!725591))

(assert (=> d!102701 m!725425))

(assert (=> b!782661 d!102701))

(declare-fun d!102711 () Bool)

(declare-fun lt!348925 () SeekEntryResult!8032)

(assert (=> d!102711 (and (or (is-Undefined!8032 lt!348925) (not (is-Found!8032 lt!348925)) (and (bvsge (index!34497 lt!348925) #b00000000000000000000000000000000) (bvslt (index!34497 lt!348925) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348925) (is-Found!8032 lt!348925) (not (is-MissingZero!8032 lt!348925)) (and (bvsge (index!34496 lt!348925) #b00000000000000000000000000000000) (bvslt (index!34496 lt!348925) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348925) (is-Found!8032 lt!348925) (is-MissingZero!8032 lt!348925) (not (is-MissingVacant!8032 lt!348925)) (and (bvsge (index!34499 lt!348925) #b00000000000000000000000000000000) (bvslt (index!34499 lt!348925) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348925) (ite (is-Found!8032 lt!348925) (= (select (arr!20432 a!3186) (index!34497 lt!348925)) (select (arr!20432 a!3186) j!159)) (ite (is-MissingZero!8032 lt!348925) (= (select (arr!20432 a!3186) (index!34496 lt!348925)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8032 lt!348925) (= (select (arr!20432 a!3186) (index!34499 lt!348925)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!435335 () SeekEntryResult!8032)

(assert (=> d!102711 (= lt!348925 e!435335)))

(declare-fun c!87035 () Bool)

(declare-fun lt!348926 () SeekEntryResult!8032)

(assert (=> d!102711 (= c!87035 (and (is-Intermediate!8032 lt!348926) (undefined!8844 lt!348926)))))

(assert (=> d!102711 (= lt!348926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20432 a!3186) j!159) mask!3328) (select (arr!20432 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102711 (validMask!0 mask!3328)))

(assert (=> d!102711 (= (seekEntryOrOpen!0 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348925)))

(declare-fun b!782938 () Bool)

(declare-fun e!435336 () SeekEntryResult!8032)

(assert (=> b!782938 (= e!435335 e!435336)))

(declare-fun lt!348924 () (_ BitVec 64))

(assert (=> b!782938 (= lt!348924 (select (arr!20432 a!3186) (index!34498 lt!348926)))))

(declare-fun c!87036 () Bool)

(assert (=> b!782938 (= c!87036 (= lt!348924 (select (arr!20432 a!3186) j!159)))))

(declare-fun b!782939 () Bool)

(assert (=> b!782939 (= e!435335 Undefined!8032)))

(declare-fun b!782940 () Bool)

(assert (=> b!782940 (= e!435336 (Found!8032 (index!34498 lt!348926)))))

(declare-fun b!782941 () Bool)

(declare-fun e!435334 () SeekEntryResult!8032)

(assert (=> b!782941 (= e!435334 (seekKeyOrZeroReturnVacant!0 (x!65443 lt!348926) (index!34498 lt!348926) (index!34498 lt!348926) (select (arr!20432 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782942 () Bool)

(declare-fun c!87034 () Bool)

(assert (=> b!782942 (= c!87034 (= lt!348924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782942 (= e!435336 e!435334)))

(declare-fun b!782943 () Bool)

(assert (=> b!782943 (= e!435334 (MissingZero!8032 (index!34498 lt!348926)))))

(assert (= (and d!102711 c!87035) b!782939))

(assert (= (and d!102711 (not c!87035)) b!782938))

(assert (= (and b!782938 c!87036) b!782940))

(assert (= (and b!782938 (not c!87036)) b!782942))

(assert (= (and b!782942 c!87034) b!782943))

(assert (= (and b!782942 (not c!87034)) b!782941))

(declare-fun m!725611 () Bool)

(assert (=> d!102711 m!725611))

(assert (=> d!102711 m!725437))

(assert (=> d!102711 m!725395))

(assert (=> d!102711 m!725439))

(assert (=> d!102711 m!725395))

(assert (=> d!102711 m!725437))

(assert (=> d!102711 m!725425))

(declare-fun m!725613 () Bool)

(assert (=> d!102711 m!725613))

(declare-fun m!725615 () Bool)

(assert (=> d!102711 m!725615))

(declare-fun m!725617 () Bool)

(assert (=> b!782938 m!725617))

(assert (=> b!782941 m!725395))

(declare-fun m!725619 () Bool)

(assert (=> b!782941 m!725619))

(assert (=> b!782651 d!102711))

(declare-fun d!102717 () Bool)

(declare-fun res!529697 () Bool)

(declare-fun e!435360 () Bool)

(assert (=> d!102717 (=> res!529697 e!435360)))

(assert (=> d!102717 (= res!529697 (bvsge j!159 (size!20853 a!3186)))))

(assert (=> d!102717 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!435360)))

(declare-fun b!782983 () Bool)

(declare-fun e!435361 () Bool)

(declare-fun call!35269 () Bool)

(assert (=> b!782983 (= e!435361 call!35269)))

(declare-fun b!782984 () Bool)

(declare-fun e!435362 () Bool)

(assert (=> b!782984 (= e!435362 e!435361)))

(declare-fun lt!348940 () (_ BitVec 64))

(assert (=> b!782984 (= lt!348940 (select (arr!20432 a!3186) j!159))))

(declare-fun lt!348941 () Unit!27016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42685 (_ BitVec 64) (_ BitVec 32)) Unit!27016)

(assert (=> b!782984 (= lt!348941 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348940 j!159))))

(assert (=> b!782984 (arrayContainsKey!0 a!3186 lt!348940 #b00000000000000000000000000000000)))

(declare-fun lt!348942 () Unit!27016)

(assert (=> b!782984 (= lt!348942 lt!348941)))

(declare-fun res!529698 () Bool)

(assert (=> b!782984 (= res!529698 (= (seekEntryOrOpen!0 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) (Found!8032 j!159)))))

(assert (=> b!782984 (=> (not res!529698) (not e!435361))))

(declare-fun b!782985 () Bool)

(assert (=> b!782985 (= e!435360 e!435362)))

(declare-fun c!87050 () Bool)

(assert (=> b!782985 (= c!87050 (validKeyInArray!0 (select (arr!20432 a!3186) j!159)))))

(declare-fun b!782986 () Bool)

(assert (=> b!782986 (= e!435362 call!35269)))

(declare-fun bm!35266 () Bool)

(assert (=> bm!35266 (= call!35269 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102717 (not res!529697)) b!782985))

(assert (= (and b!782985 c!87050) b!782984))

(assert (= (and b!782985 (not c!87050)) b!782986))

(assert (= (and b!782984 res!529698) b!782983))

(assert (= (or b!782983 b!782986) bm!35266))

(assert (=> b!782984 m!725395))

(declare-fun m!725633 () Bool)

(assert (=> b!782984 m!725633))

(declare-fun m!725635 () Bool)

(assert (=> b!782984 m!725635))

(assert (=> b!782984 m!725395))

(assert (=> b!782984 m!725397))

(assert (=> b!782985 m!725395))

(assert (=> b!782985 m!725395))

(assert (=> b!782985 m!725403))

(declare-fun m!725641 () Bool)

(assert (=> bm!35266 m!725641))

(assert (=> b!782651 d!102717))

(declare-fun d!102725 () Bool)

(assert (=> d!102725 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348948 () Unit!27016)

(declare-fun choose!38 (array!42685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27016)

(assert (=> d!102725 (= lt!348948 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102725 (validMask!0 mask!3328)))

(assert (=> d!102725 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!348948)))

(declare-fun bs!21755 () Bool)

(assert (= bs!21755 d!102725))

(assert (=> bs!21755 m!725399))

(declare-fun m!725663 () Bool)

(assert (=> bs!21755 m!725663))

(assert (=> bs!21755 m!725425))

(assert (=> b!782651 d!102725))

(declare-fun b!782993 () Bool)

(declare-fun e!435367 () SeekEntryResult!8032)

(assert (=> b!782993 (= e!435367 (Found!8032 resIntermediateIndex!5))))

(declare-fun b!782994 () Bool)

(declare-fun e!435368 () SeekEntryResult!8032)

(assert (=> b!782994 (= e!435368 Undefined!8032)))

(declare-fun b!782995 () Bool)

(declare-fun c!87055 () Bool)

(declare-fun lt!348950 () (_ BitVec 64))

(assert (=> b!782995 (= c!87055 (= lt!348950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435366 () SeekEntryResult!8032)

(assert (=> b!782995 (= e!435367 e!435366)))

(declare-fun b!782997 () Bool)

(assert (=> b!782997 (= e!435366 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782998 () Bool)

(assert (=> b!782998 (= e!435366 (MissingVacant!8032 resIntermediateIndex!5))))

(declare-fun lt!348949 () SeekEntryResult!8032)

(declare-fun d!102731 () Bool)

(assert (=> d!102731 (and (or (is-Undefined!8032 lt!348949) (not (is-Found!8032 lt!348949)) (and (bvsge (index!34497 lt!348949) #b00000000000000000000000000000000) (bvslt (index!34497 lt!348949) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348949) (is-Found!8032 lt!348949) (not (is-MissingVacant!8032 lt!348949)) (not (= (index!34499 lt!348949) resIntermediateIndex!5)) (and (bvsge (index!34499 lt!348949) #b00000000000000000000000000000000) (bvslt (index!34499 lt!348949) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348949) (ite (is-Found!8032 lt!348949) (= (select (arr!20432 a!3186) (index!34497 lt!348949)) (select (arr!20432 a!3186) j!159)) (and (is-MissingVacant!8032 lt!348949) (= (index!34499 lt!348949) resIntermediateIndex!5) (= (select (arr!20432 a!3186) (index!34499 lt!348949)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102731 (= lt!348949 e!435368)))

(declare-fun c!87054 () Bool)

(assert (=> d!102731 (= c!87054 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102731 (= lt!348950 (select (arr!20432 a!3186) resIntermediateIndex!5))))

(assert (=> d!102731 (validMask!0 mask!3328)))

(assert (=> d!102731 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348949)))

(declare-fun b!782996 () Bool)

(assert (=> b!782996 (= e!435368 e!435367)))

(declare-fun c!87056 () Bool)

(assert (=> b!782996 (= c!87056 (= lt!348950 (select (arr!20432 a!3186) j!159)))))

(assert (= (and d!102731 c!87054) b!782994))

(assert (= (and d!102731 (not c!87054)) b!782996))

(assert (= (and b!782996 c!87056) b!782993))

(assert (= (and b!782996 (not c!87056)) b!782995))

(assert (= (and b!782995 c!87055) b!782998))

(assert (= (and b!782995 (not c!87055)) b!782997))

(declare-fun m!725665 () Bool)

(assert (=> b!782997 m!725665))

(assert (=> b!782997 m!725665))

(assert (=> b!782997 m!725395))

(declare-fun m!725667 () Bool)

(assert (=> b!782997 m!725667))

(declare-fun m!725669 () Bool)

(assert (=> d!102731 m!725669))

(declare-fun m!725671 () Bool)

(assert (=> d!102731 m!725671))

(assert (=> d!102731 m!725441))

(assert (=> d!102731 m!725425))

(assert (=> b!782652 d!102731))

(declare-fun d!102733 () Bool)

(assert (=> d!102733 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67582 d!102733))

(declare-fun d!102737 () Bool)

(assert (=> d!102737 (= (array_inv!16228 a!3186) (bvsge (size!20853 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67582 d!102737))

(declare-fun b!783011 () Bool)

(declare-fun lt!348960 () SeekEntryResult!8032)

(assert (=> b!783011 (and (bvsge (index!34498 lt!348960) #b00000000000000000000000000000000) (bvslt (index!34498 lt!348960) (size!20853 a!3186)))))

(declare-fun res!529706 () Bool)

(assert (=> b!783011 (= res!529706 (= (select (arr!20432 a!3186) (index!34498 lt!348960)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435378 () Bool)

(assert (=> b!783011 (=> res!529706 e!435378)))

(declare-fun b!783012 () Bool)

(declare-fun e!435381 () SeekEntryResult!8032)

(assert (=> b!783012 (= e!435381 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20432 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783013 () Bool)

(assert (=> b!783013 (= e!435381 (Intermediate!8032 false index!1321 x!1131))))

(declare-fun b!783014 () Bool)

(declare-fun e!435380 () Bool)

(declare-fun e!435382 () Bool)

(assert (=> b!783014 (= e!435380 e!435382)))

(declare-fun res!529707 () Bool)

(assert (=> b!783014 (= res!529707 (and (is-Intermediate!8032 lt!348960) (not (undefined!8844 lt!348960)) (bvslt (x!65443 lt!348960) #b01111111111111111111111111111110) (bvsge (x!65443 lt!348960) #b00000000000000000000000000000000) (bvsge (x!65443 lt!348960) x!1131)))))

(assert (=> b!783014 (=> (not res!529707) (not e!435382))))

(declare-fun b!783015 () Bool)

(declare-fun e!435379 () SeekEntryResult!8032)

(assert (=> b!783015 (= e!435379 e!435381)))

(declare-fun lt!348961 () (_ BitVec 64))

(declare-fun c!87062 () Bool)

(assert (=> b!783015 (= c!87062 (or (= lt!348961 (select (arr!20432 a!3186) j!159)) (= (bvadd lt!348961 lt!348961) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102739 () Bool)

(assert (=> d!102739 e!435380))

(declare-fun c!87060 () Bool)

(assert (=> d!102739 (= c!87060 (and (is-Intermediate!8032 lt!348960) (undefined!8844 lt!348960)))))

(assert (=> d!102739 (= lt!348960 e!435379)))

(declare-fun c!87061 () Bool)

(assert (=> d!102739 (= c!87061 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102739 (= lt!348961 (select (arr!20432 a!3186) index!1321))))

(assert (=> d!102739 (validMask!0 mask!3328)))

(assert (=> d!102739 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348960)))

(declare-fun b!783016 () Bool)

(assert (=> b!783016 (and (bvsge (index!34498 lt!348960) #b00000000000000000000000000000000) (bvslt (index!34498 lt!348960) (size!20853 a!3186)))))

(declare-fun res!529705 () Bool)

(assert (=> b!783016 (= res!529705 (= (select (arr!20432 a!3186) (index!34498 lt!348960)) (select (arr!20432 a!3186) j!159)))))

(assert (=> b!783016 (=> res!529705 e!435378)))

(assert (=> b!783016 (= e!435382 e!435378)))

(declare-fun b!783017 () Bool)

(assert (=> b!783017 (= e!435380 (bvsge (x!65443 lt!348960) #b01111111111111111111111111111110))))

(declare-fun b!783018 () Bool)

(assert (=> b!783018 (and (bvsge (index!34498 lt!348960) #b00000000000000000000000000000000) (bvslt (index!34498 lt!348960) (size!20853 a!3186)))))

(assert (=> b!783018 (= e!435378 (= (select (arr!20432 a!3186) (index!34498 lt!348960)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783019 () Bool)

(assert (=> b!783019 (= e!435379 (Intermediate!8032 true index!1321 x!1131))))

(assert (= (and d!102739 c!87061) b!783019))

(assert (= (and d!102739 (not c!87061)) b!783015))

(assert (= (and b!783015 c!87062) b!783013))

(assert (= (and b!783015 (not c!87062)) b!783012))

(assert (= (and d!102739 c!87060) b!783017))

(assert (= (and d!102739 (not c!87060)) b!783014))

(assert (= (and b!783014 res!529707) b!783016))

(assert (= (and b!783016 (not res!529705)) b!783011))

(assert (= (and b!783011 (not res!529706)) b!783018))

(assert (=> d!102739 m!725591))

(assert (=> d!102739 m!725425))

(declare-fun m!725679 () Bool)

(assert (=> b!783018 m!725679))

(assert (=> b!783011 m!725679))

(assert (=> b!783012 m!725583))

(assert (=> b!783012 m!725583))

(assert (=> b!783012 m!725395))

(declare-fun m!725681 () Bool)

(assert (=> b!783012 m!725681))

(assert (=> b!783016 m!725679))

(assert (=> b!782664 d!102739))

(declare-fun d!102741 () Bool)

(declare-fun res!529708 () Bool)

(declare-fun e!435383 () Bool)

(assert (=> d!102741 (=> res!529708 e!435383)))

(assert (=> d!102741 (= res!529708 (bvsge #b00000000000000000000000000000000 (size!20853 a!3186)))))

(assert (=> d!102741 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!435383)))

(declare-fun b!783020 () Bool)

(declare-fun e!435384 () Bool)

(declare-fun call!35273 () Bool)

(assert (=> b!783020 (= e!435384 call!35273)))

(declare-fun b!783021 () Bool)

(declare-fun e!435385 () Bool)

(assert (=> b!783021 (= e!435385 e!435384)))

(declare-fun lt!348962 () (_ BitVec 64))

(assert (=> b!783021 (= lt!348962 (select (arr!20432 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!348963 () Unit!27016)

(assert (=> b!783021 (= lt!348963 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348962 #b00000000000000000000000000000000))))

(assert (=> b!783021 (arrayContainsKey!0 a!3186 lt!348962 #b00000000000000000000000000000000)))

(declare-fun lt!348964 () Unit!27016)

(assert (=> b!783021 (= lt!348964 lt!348963)))

(declare-fun res!529709 () Bool)

(assert (=> b!783021 (= res!529709 (= (seekEntryOrOpen!0 (select (arr!20432 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8032 #b00000000000000000000000000000000)))))

(assert (=> b!783021 (=> (not res!529709) (not e!435384))))

(declare-fun b!783022 () Bool)

(assert (=> b!783022 (= e!435383 e!435385)))

(declare-fun c!87063 () Bool)

(assert (=> b!783022 (= c!87063 (validKeyInArray!0 (select (arr!20432 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!783023 () Bool)

(assert (=> b!783023 (= e!435385 call!35273)))

(declare-fun bm!35270 () Bool)

(assert (=> bm!35270 (= call!35273 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102741 (not res!529708)) b!783022))

(assert (= (and b!783022 c!87063) b!783021))

(assert (= (and b!783022 (not c!87063)) b!783023))

(assert (= (and b!783021 res!529709) b!783020))

(assert (= (or b!783020 b!783023) bm!35270))

(assert (=> b!783021 m!725487))

(declare-fun m!725683 () Bool)

(assert (=> b!783021 m!725683))

(declare-fun m!725685 () Bool)

(assert (=> b!783021 m!725685))

(assert (=> b!783021 m!725487))

(declare-fun m!725687 () Bool)

(assert (=> b!783021 m!725687))

(assert (=> b!783022 m!725487))

(assert (=> b!783022 m!725487))

(assert (=> b!783022 m!725491))

(declare-fun m!725689 () Bool)

(assert (=> bm!35270 m!725689))

(assert (=> b!782653 d!102741))

(declare-fun d!102743 () Bool)

(declare-fun lt!348969 () SeekEntryResult!8032)

(assert (=> d!102743 (and (or (is-Undefined!8032 lt!348969) (not (is-Found!8032 lt!348969)) (and (bvsge (index!34497 lt!348969) #b00000000000000000000000000000000) (bvslt (index!34497 lt!348969) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348969) (is-Found!8032 lt!348969) (not (is-MissingZero!8032 lt!348969)) (and (bvsge (index!34496 lt!348969) #b00000000000000000000000000000000) (bvslt (index!34496 lt!348969) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348969) (is-Found!8032 lt!348969) (is-MissingZero!8032 lt!348969) (not (is-MissingVacant!8032 lt!348969)) (and (bvsge (index!34499 lt!348969) #b00000000000000000000000000000000) (bvslt (index!34499 lt!348969) (size!20853 a!3186)))) (or (is-Undefined!8032 lt!348969) (ite (is-Found!8032 lt!348969) (= (select (arr!20432 a!3186) (index!34497 lt!348969)) k!2102) (ite (is-MissingZero!8032 lt!348969) (= (select (arr!20432 a!3186) (index!34496 lt!348969)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8032 lt!348969) (= (select (arr!20432 a!3186) (index!34499 lt!348969)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!435387 () SeekEntryResult!8032)

(assert (=> d!102743 (= lt!348969 e!435387)))

(declare-fun c!87065 () Bool)

(declare-fun lt!348970 () SeekEntryResult!8032)

(assert (=> d!102743 (= c!87065 (and (is-Intermediate!8032 lt!348970) (undefined!8844 lt!348970)))))

(assert (=> d!102743 (= lt!348970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!102743 (validMask!0 mask!3328)))

(assert (=> d!102743 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!348969)))

(declare-fun b!783024 () Bool)

(declare-fun e!435388 () SeekEntryResult!8032)

(assert (=> b!783024 (= e!435387 e!435388)))

(declare-fun lt!348968 () (_ BitVec 64))

(assert (=> b!783024 (= lt!348968 (select (arr!20432 a!3186) (index!34498 lt!348970)))))

(declare-fun c!87066 () Bool)

(assert (=> b!783024 (= c!87066 (= lt!348968 k!2102))))

(declare-fun b!783025 () Bool)

(assert (=> b!783025 (= e!435387 Undefined!8032)))

(declare-fun b!783026 () Bool)

(assert (=> b!783026 (= e!435388 (Found!8032 (index!34498 lt!348970)))))

(declare-fun b!783027 () Bool)

(declare-fun e!435386 () SeekEntryResult!8032)

(assert (=> b!783027 (= e!435386 (seekKeyOrZeroReturnVacant!0 (x!65443 lt!348970) (index!34498 lt!348970) (index!34498 lt!348970) k!2102 a!3186 mask!3328))))

(declare-fun b!783028 () Bool)

(declare-fun c!87064 () Bool)

(assert (=> b!783028 (= c!87064 (= lt!348968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!783028 (= e!435388 e!435386)))

(declare-fun b!783029 () Bool)

(assert (=> b!783029 (= e!435386 (MissingZero!8032 (index!34498 lt!348970)))))

(assert (= (and d!102743 c!87065) b!783025))

(assert (= (and d!102743 (not c!87065)) b!783024))

(assert (= (and b!783024 c!87066) b!783026))

(assert (= (and b!783024 (not c!87066)) b!783028))

(assert (= (and b!783028 c!87064) b!783029))

(assert (= (and b!783028 (not c!87064)) b!783027))

(declare-fun m!725693 () Bool)

(assert (=> d!102743 m!725693))

(declare-fun m!725695 () Bool)

(assert (=> d!102743 m!725695))

(declare-fun m!725697 () Bool)

(assert (=> d!102743 m!725697))

(assert (=> d!102743 m!725695))

(assert (=> d!102743 m!725425))

(declare-fun m!725699 () Bool)

(assert (=> d!102743 m!725699))

(declare-fun m!725701 () Bool)

(assert (=> d!102743 m!725701))

(declare-fun m!725703 () Bool)

(assert (=> b!783024 m!725703))

(declare-fun m!725705 () Bool)

(assert (=> b!783027 m!725705))

(assert (=> b!782644 d!102743))

(declare-fun d!102747 () Bool)

(assert (=> d!102747 (= (validKeyInArray!0 (select (arr!20432 a!3186) j!159)) (and (not (= (select (arr!20432 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20432 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!782655 d!102747))

(declare-fun b!783030 () Bool)

(declare-fun lt!348971 () SeekEntryResult!8032)

(assert (=> b!783030 (and (bvsge (index!34498 lt!348971) #b00000000000000000000000000000000) (bvslt (index!34498 lt!348971) (size!20853 lt!348812)))))

(declare-fun res!529711 () Bool)

(assert (=> b!783030 (= res!529711 (= (select (arr!20432 lt!348812) (index!34498 lt!348971)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435389 () Bool)

(assert (=> b!783030 (=> res!529711 e!435389)))

(declare-fun e!435392 () SeekEntryResult!8032)

(declare-fun b!783031 () Bool)

(assert (=> b!783031 (= e!435392 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!348810 lt!348812 mask!3328))))

(declare-fun b!783032 () Bool)

(assert (=> b!783032 (= e!435392 (Intermediate!8032 false index!1321 x!1131))))

(declare-fun b!783033 () Bool)

(declare-fun e!435391 () Bool)

(declare-fun e!435393 () Bool)

(assert (=> b!783033 (= e!435391 e!435393)))

(declare-fun res!529712 () Bool)

(assert (=> b!783033 (= res!529712 (and (is-Intermediate!8032 lt!348971) (not (undefined!8844 lt!348971)) (bvslt (x!65443 lt!348971) #b01111111111111111111111111111110) (bvsge (x!65443 lt!348971) #b00000000000000000000000000000000) (bvsge (x!65443 lt!348971) x!1131)))))

(assert (=> b!783033 (=> (not res!529712) (not e!435393))))

(declare-fun b!783034 () Bool)

(declare-fun e!435390 () SeekEntryResult!8032)

(assert (=> b!783034 (= e!435390 e!435392)))

(declare-fun c!87069 () Bool)

(declare-fun lt!348972 () (_ BitVec 64))

(assert (=> b!783034 (= c!87069 (or (= lt!348972 lt!348810) (= (bvadd lt!348972 lt!348972) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102749 () Bool)

(assert (=> d!102749 e!435391))

(declare-fun c!87067 () Bool)

(assert (=> d!102749 (= c!87067 (and (is-Intermediate!8032 lt!348971) (undefined!8844 lt!348971)))))

