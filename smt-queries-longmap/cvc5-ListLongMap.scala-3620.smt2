; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49868 () Bool)

(assert start!49868)

(declare-fun b!547424 () Bool)

(declare-fun e!316317 () Bool)

(declare-datatypes ((List!10670 0))(
  ( (Nil!10667) (Cons!10666 (h!11633 (_ BitVec 64)) (t!16898 List!10670)) )
))
(declare-fun contains!2819 (List!10670 (_ BitVec 64)) Bool)

(assert (=> b!547424 (= e!316317 (contains!2819 Nil!10667 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547425 () Bool)

(declare-fun res!341002 () Bool)

(declare-fun e!316320 () Bool)

(assert (=> b!547425 (=> (not res!341002) (not e!316320))))

(declare-datatypes ((array!34534 0))(
  ( (array!34535 (arr!16590 (Array (_ BitVec 32) (_ BitVec 64))) (size!16954 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34534)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34534 (_ BitVec 32)) Bool)

(assert (=> b!547425 (= res!341002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!341003 () Bool)

(declare-fun e!316318 () Bool)

(assert (=> start!49868 (=> (not res!341003) (not e!316318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49868 (= res!341003 (validMask!0 mask!3119))))

(assert (=> start!49868 e!316318))

(assert (=> start!49868 true))

(declare-fun array_inv!12386 (array!34534) Bool)

(assert (=> start!49868 (array_inv!12386 a!3118)))

(declare-fun b!547426 () Bool)

(declare-fun res!340994 () Bool)

(assert (=> b!547426 (=> (not res!340994) (not e!316318))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547426 (= res!340994 (validKeyInArray!0 k!1914))))

(declare-fun b!547427 () Bool)

(declare-fun res!341001 () Bool)

(assert (=> b!547427 (=> (not res!341001) (not e!316318))))

(declare-fun arrayContainsKey!0 (array!34534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547427 (= res!341001 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547428 () Bool)

(declare-fun res!340996 () Bool)

(assert (=> b!547428 (=> (not res!340996) (not e!316318))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547428 (= res!340996 (and (= (size!16954 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16954 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16954 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547429 () Bool)

(assert (=> b!547429 (= e!316318 e!316320)))

(declare-fun res!340995 () Bool)

(assert (=> b!547429 (=> (not res!340995) (not e!316320))))

(declare-datatypes ((SeekEntryResult!5039 0))(
  ( (MissingZero!5039 (index!22383 (_ BitVec 32))) (Found!5039 (index!22384 (_ BitVec 32))) (Intermediate!5039 (undefined!5851 Bool) (index!22385 (_ BitVec 32)) (x!51331 (_ BitVec 32))) (Undefined!5039) (MissingVacant!5039 (index!22386 (_ BitVec 32))) )
))
(declare-fun lt!249538 () SeekEntryResult!5039)

(assert (=> b!547429 (= res!340995 (or (= lt!249538 (MissingZero!5039 i!1132)) (= lt!249538 (MissingVacant!5039 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34534 (_ BitVec 32)) SeekEntryResult!5039)

(assert (=> b!547429 (= lt!249538 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!547430 () Bool)

(declare-fun res!340997 () Bool)

(assert (=> b!547430 (=> (not res!340997) (not e!316320))))

(assert (=> b!547430 (= res!340997 (and (bvsle #b00000000000000000000000000000000 (size!16954 a!3118)) (bvslt (size!16954 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547431 () Bool)

(assert (=> b!547431 (= e!316320 e!316317)))

(declare-fun res!340998 () Bool)

(assert (=> b!547431 (=> res!340998 e!316317)))

(assert (=> b!547431 (= res!340998 (contains!2819 Nil!10667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547432 () Bool)

(declare-fun res!340999 () Bool)

(assert (=> b!547432 (=> (not res!340999) (not e!316320))))

(declare-fun noDuplicate!222 (List!10670) Bool)

(assert (=> b!547432 (= res!340999 (noDuplicate!222 Nil!10667))))

(declare-fun b!547433 () Bool)

(declare-fun res!341000 () Bool)

(assert (=> b!547433 (=> (not res!341000) (not e!316318))))

(assert (=> b!547433 (= res!341000 (validKeyInArray!0 (select (arr!16590 a!3118) j!142)))))

(assert (= (and start!49868 res!341003) b!547428))

(assert (= (and b!547428 res!340996) b!547433))

(assert (= (and b!547433 res!341000) b!547426))

(assert (= (and b!547426 res!340994) b!547427))

(assert (= (and b!547427 res!341001) b!547429))

(assert (= (and b!547429 res!340995) b!547425))

(assert (= (and b!547425 res!341002) b!547430))

(assert (= (and b!547430 res!340997) b!547432))

(assert (= (and b!547432 res!340999) b!547431))

(assert (= (and b!547431 (not res!340998)) b!547424))

(declare-fun m!524691 () Bool)

(assert (=> b!547427 m!524691))

(declare-fun m!524693 () Bool)

(assert (=> b!547429 m!524693))

(declare-fun m!524695 () Bool)

(assert (=> b!547425 m!524695))

(declare-fun m!524697 () Bool)

(assert (=> b!547432 m!524697))

(declare-fun m!524699 () Bool)

(assert (=> b!547431 m!524699))

(declare-fun m!524701 () Bool)

(assert (=> b!547426 m!524701))

(declare-fun m!524703 () Bool)

(assert (=> b!547433 m!524703))

(assert (=> b!547433 m!524703))

(declare-fun m!524705 () Bool)

(assert (=> b!547433 m!524705))

(declare-fun m!524707 () Bool)

(assert (=> start!49868 m!524707))

(declare-fun m!524709 () Bool)

(assert (=> start!49868 m!524709))

(declare-fun m!524711 () Bool)

(assert (=> b!547424 m!524711))

(push 1)

(assert (not b!547426))

(assert (not b!547432))

(assert (not b!547427))

(assert (not b!547425))

(assert (not b!547429))

(assert (not start!49868))

(assert (not b!547433))

(assert (not b!547431))

(assert (not b!547424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82501 () Bool)

(assert (=> d!82501 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547426 d!82501))

(declare-fun d!82507 () Bool)

(declare-fun res!341092 () Bool)

(declare-fun e!316373 () Bool)

(assert (=> d!82507 (=> res!341092 e!316373)))

(assert (=> d!82507 (= res!341092 (= (select (arr!16590 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82507 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316373)))

(declare-fun b!547522 () Bool)

(declare-fun e!316374 () Bool)

(assert (=> b!547522 (= e!316373 e!316374)))

(declare-fun res!341093 () Bool)

(assert (=> b!547522 (=> (not res!341093) (not e!316374))))

(assert (=> b!547522 (= res!341093 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16954 a!3118)))))

(declare-fun b!547523 () Bool)

(assert (=> b!547523 (= e!316374 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82507 (not res!341092)) b!547522))

(assert (= (and b!547522 res!341093) b!547523))

(declare-fun m!524777 () Bool)

(assert (=> d!82507 m!524777))

(declare-fun m!524779 () Bool)

(assert (=> b!547523 m!524779))

(assert (=> b!547427 d!82507))

(declare-fun d!82513 () Bool)

(declare-fun res!341108 () Bool)

(declare-fun e!316389 () Bool)

(assert (=> d!82513 (=> res!341108 e!316389)))

(assert (=> d!82513 (= res!341108 (is-Nil!10667 Nil!10667))))

(assert (=> d!82513 (= (noDuplicate!222 Nil!10667) e!316389)))

(declare-fun b!547536 () Bool)

(declare-fun e!316390 () Bool)

(assert (=> b!547536 (= e!316389 e!316390)))

(declare-fun res!341109 () Bool)

(assert (=> b!547536 (=> (not res!341109) (not e!316390))))

(assert (=> b!547536 (= res!341109 (not (contains!2819 (t!16898 Nil!10667) (h!11633 Nil!10667))))))

(declare-fun b!547537 () Bool)

(assert (=> b!547537 (= e!316390 (noDuplicate!222 (t!16898 Nil!10667)))))

(assert (= (and d!82513 (not res!341108)) b!547536))

(assert (= (and b!547536 res!341109) b!547537))

(declare-fun m!524785 () Bool)

(assert (=> b!547536 m!524785))

(declare-fun m!524787 () Bool)

(assert (=> b!547537 m!524787))

(assert (=> b!547432 d!82513))

(declare-fun b!547564 () Bool)

(declare-fun e!316411 () Bool)

(declare-fun call!32171 () Bool)

(assert (=> b!547564 (= e!316411 call!32171)))

(declare-fun b!547565 () Bool)

(declare-fun e!316412 () Bool)

(assert (=> b!547565 (= e!316412 e!316411)))

(declare-fun c!63548 () Bool)

(assert (=> b!547565 (= c!63548 (validKeyInArray!0 (select (arr!16590 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82517 () Bool)

(declare-fun res!341125 () Bool)

(assert (=> d!82517 (=> res!341125 e!316412)))

(assert (=> d!82517 (= res!341125 (bvsge #b00000000000000000000000000000000 (size!16954 a!3118)))))

(assert (=> d!82517 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316412)))

(declare-fun b!547566 () Bool)

(declare-fun e!316410 () Bool)

(assert (=> b!547566 (= e!316411 e!316410)))

(declare-fun lt!249567 () (_ BitVec 64))

(assert (=> b!547566 (= lt!249567 (select (arr!16590 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16960 0))(
  ( (Unit!16961) )
))
(declare-fun lt!249568 () Unit!16960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34534 (_ BitVec 64) (_ BitVec 32)) Unit!16960)

(assert (=> b!547566 (= lt!249568 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249567 #b00000000000000000000000000000000))))

(assert (=> b!547566 (arrayContainsKey!0 a!3118 lt!249567 #b00000000000000000000000000000000)))

(declare-fun lt!249569 () Unit!16960)

(assert (=> b!547566 (= lt!249569 lt!249568)))

(declare-fun res!341124 () Bool)

(assert (=> b!547566 (= res!341124 (= (seekEntryOrOpen!0 (select (arr!16590 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5039 #b00000000000000000000000000000000)))))

(assert (=> b!547566 (=> (not res!341124) (not e!316410))))

(declare-fun bm!32168 () Bool)

(assert (=> bm!32168 (= call!32171 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547567 () Bool)

(assert (=> b!547567 (= e!316410 call!32171)))

(assert (= (and d!82517 (not res!341125)) b!547565))

(assert (= (and b!547565 c!63548) b!547566))

(assert (= (and b!547565 (not c!63548)) b!547564))

(assert (= (and b!547566 res!341124) b!547567))

(assert (= (or b!547567 b!547564) bm!32168))

(assert (=> b!547565 m!524777))

(assert (=> b!547565 m!524777))

(declare-fun m!524807 () Bool)

(assert (=> b!547565 m!524807))

(assert (=> b!547566 m!524777))

(declare-fun m!524809 () Bool)

(assert (=> b!547566 m!524809))

(declare-fun m!524811 () Bool)

(assert (=> b!547566 m!524811))

(assert (=> b!547566 m!524777))

(declare-fun m!524813 () Bool)

(assert (=> b!547566 m!524813))

(declare-fun m!524815 () Bool)

(assert (=> bm!32168 m!524815))

(assert (=> b!547425 d!82517))

(declare-fun d!82531 () Bool)

(declare-fun lt!249578 () Bool)

(declare-fun content!230 (List!10670) (Set (_ BitVec 64)))

(assert (=> d!82531 (= lt!249578 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!230 Nil!10667)))))

(declare-fun e!316423 () Bool)

(assert (=> d!82531 (= lt!249578 e!316423)))

(declare-fun res!341135 () Bool)

(assert (=> d!82531 (=> (not res!341135) (not e!316423))))

(assert (=> d!82531 (= res!341135 (is-Cons!10666 Nil!10667))))

(assert (=> d!82531 (= (contains!2819 Nil!10667 #b0000000000000000000000000000000000000000000000000000000000000000) lt!249578)))

(declare-fun b!547580 () Bool)

(declare-fun e!316424 () Bool)

(assert (=> b!547580 (= e!316423 e!316424)))

(declare-fun res!341134 () Bool)

(assert (=> b!547580 (=> res!341134 e!316424)))

(assert (=> b!547580 (= res!341134 (= (h!11633 Nil!10667) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547581 () Bool)

(assert (=> b!547581 (= e!316424 (contains!2819 (t!16898 Nil!10667) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82531 res!341135) b!547580))

(assert (= (and b!547580 (not res!341134)) b!547581))

(declare-fun m!524817 () Bool)

(assert (=> d!82531 m!524817))

(declare-fun m!524819 () Bool)

(assert (=> d!82531 m!524819))

(declare-fun m!524821 () Bool)

(assert (=> b!547581 m!524821))

(assert (=> b!547431 d!82531))

(declare-fun b!547628 () Bool)

(declare-fun c!63574 () Bool)

(declare-fun lt!249605 () (_ BitVec 64))

(assert (=> b!547628 (= c!63574 (= lt!249605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316449 () SeekEntryResult!5039)

(declare-fun e!316450 () SeekEntryResult!5039)

(assert (=> b!547628 (= e!316449 e!316450)))

(declare-fun b!547629 () Bool)

(declare-fun lt!249604 () SeekEntryResult!5039)

(assert (=> b!547629 (= e!316449 (Found!5039 (index!22385 lt!249604)))))

(declare-fun d!82533 () Bool)

(declare-fun lt!249603 () SeekEntryResult!5039)

(assert (=> d!82533 (and (or (is-Undefined!5039 lt!249603) (not (is-Found!5039 lt!249603)) (and (bvsge (index!22384 lt!249603) #b00000000000000000000000000000000) (bvslt (index!22384 lt!249603) (size!16954 a!3118)))) (or (is-Undefined!5039 lt!249603) (is-Found!5039 lt!249603) (not (is-MissingZero!5039 lt!249603)) (and (bvsge (index!22383 lt!249603) #b00000000000000000000000000000000) (bvslt (index!22383 lt!249603) (size!16954 a!3118)))) (or (is-Undefined!5039 lt!249603) (is-Found!5039 lt!249603) (is-MissingZero!5039 lt!249603) (not (is-MissingVacant!5039 lt!249603)) (and (bvsge (index!22386 lt!249603) #b00000000000000000000000000000000) (bvslt (index!22386 lt!249603) (size!16954 a!3118)))) (or (is-Undefined!5039 lt!249603) (ite (is-Found!5039 lt!249603) (= (select (arr!16590 a!3118) (index!22384 lt!249603)) k!1914) (ite (is-MissingZero!5039 lt!249603) (= (select (arr!16590 a!3118) (index!22383 lt!249603)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5039 lt!249603) (= (select (arr!16590 a!3118) (index!22386 lt!249603)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316451 () SeekEntryResult!5039)

(assert (=> d!82533 (= lt!249603 e!316451)))

(declare-fun c!63575 () Bool)

(assert (=> d!82533 (= c!63575 (and (is-Intermediate!5039 lt!249604) (undefined!5851 lt!249604)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34534 (_ BitVec 32)) SeekEntryResult!5039)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82533 (= lt!249604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82533 (validMask!0 mask!3119)))

(assert (=> d!82533 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249603)))

(declare-fun b!547630 () Bool)

(assert (=> b!547630 (= e!316451 Undefined!5039)))

(declare-fun b!547631 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34534 (_ BitVec 32)) SeekEntryResult!5039)

(assert (=> b!547631 (= e!316450 (seekKeyOrZeroReturnVacant!0 (x!51331 lt!249604) (index!22385 lt!249604) (index!22385 lt!249604) k!1914 a!3118 mask!3119))))

(declare-fun b!547632 () Bool)

(assert (=> b!547632 (= e!316450 (MissingZero!5039 (index!22385 lt!249604)))))

(declare-fun b!547633 () Bool)

(assert (=> b!547633 (= e!316451 e!316449)))

(assert (=> b!547633 (= lt!249605 (select (arr!16590 a!3118) (index!22385 lt!249604)))))

(declare-fun c!63573 () Bool)

(assert (=> b!547633 (= c!63573 (= lt!249605 k!1914))))

(assert (= (and d!82533 c!63575) b!547630))

(assert (= (and d!82533 (not c!63575)) b!547633))

(assert (= (and b!547633 c!63573) b!547629))

(assert (= (and b!547633 (not c!63573)) b!547628))

(assert (= (and b!547628 c!63574) b!547632))

(assert (= (and b!547628 (not c!63574)) b!547631))

(assert (=> d!82533 m!524707))

(declare-fun m!524847 () Bool)

(assert (=> d!82533 m!524847))

(declare-fun m!524849 () Bool)

(assert (=> d!82533 m!524849))

(declare-fun m!524851 () Bool)

