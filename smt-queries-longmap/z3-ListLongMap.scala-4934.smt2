; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67892 () Bool)

(assert start!67892)

(declare-fun res!535387 () Bool)

(declare-fun e!439125 () Bool)

(assert (=> start!67892 (=> (not res!535387) (not e!439125))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67892 (= res!535387 (validMask!0 mask!3328))))

(assert (=> start!67892 e!439125))

(assert (=> start!67892 true))

(declare-datatypes ((array!42888 0))(
  ( (array!42889 (arr!20531 (Array (_ BitVec 32) (_ BitVec 64))) (size!20952 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42888)

(declare-fun array_inv!16414 (array!42888) Bool)

(assert (=> start!67892 (array_inv!16414 a!3186)))

(declare-fun b!790123 () Bool)

(declare-fun res!535383 () Bool)

(assert (=> b!790123 (=> (not res!535383) (not e!439125))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790123 (= res!535383 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790124 () Bool)

(declare-fun res!535389 () Bool)

(assert (=> b!790124 (=> (not res!535389) (not e!439125))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790124 (= res!535389 (validKeyInArray!0 (select (arr!20531 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!439126 () Bool)

(declare-datatypes ((SeekEntryResult!8128 0))(
  ( (MissingZero!8128 (index!34880 (_ BitVec 32))) (Found!8128 (index!34881 (_ BitVec 32))) (Intermediate!8128 (undefined!8940 Bool) (index!34882 (_ BitVec 32)) (x!65824 (_ BitVec 32))) (Undefined!8128) (MissingVacant!8128 (index!34883 (_ BitVec 32))) )
))
(declare-fun lt!352609 () SeekEntryResult!8128)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!790125 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42888 (_ BitVec 32)) SeekEntryResult!8128)

(assert (=> b!790125 (= e!439126 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352609))))

(declare-fun b!790126 () Bool)

(declare-fun res!535382 () Bool)

(declare-fun e!439128 () Bool)

(assert (=> b!790126 (=> (not res!535382) (not e!439128))))

(assert (=> b!790126 (= res!535382 e!439126)))

(declare-fun c!87783 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790126 (= c!87783 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790127 () Bool)

(declare-fun res!535380 () Bool)

(declare-fun e!439130 () Bool)

(assert (=> b!790127 (=> (not res!535380) (not e!439130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42888 (_ BitVec 32)) Bool)

(assert (=> b!790127 (= res!535380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790128 () Bool)

(assert (=> b!790128 (= e!439125 e!439130)))

(declare-fun res!535384 () Bool)

(assert (=> b!790128 (=> (not res!535384) (not e!439130))))

(declare-fun lt!352612 () SeekEntryResult!8128)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790128 (= res!535384 (or (= lt!352612 (MissingZero!8128 i!1173)) (= lt!352612 (MissingVacant!8128 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42888 (_ BitVec 32)) SeekEntryResult!8128)

(assert (=> b!790128 (= lt!352612 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790129 () Bool)

(declare-fun e!439132 () Bool)

(declare-fun e!439131 () Bool)

(assert (=> b!790129 (= e!439132 e!439131)))

(declare-fun res!535378 () Bool)

(assert (=> b!790129 (=> (not res!535378) (not e!439131))))

(declare-fun lt!352616 () SeekEntryResult!8128)

(assert (=> b!790129 (= res!535378 (= (seekEntryOrOpen!0 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352616))))

(assert (=> b!790129 (= lt!352616 (Found!8128 j!159))))

(declare-fun b!790130 () Bool)

(declare-fun res!535388 () Bool)

(assert (=> b!790130 (=> (not res!535388) (not e!439130))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!790130 (= res!535388 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20952 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20952 a!3186))))))

(declare-fun b!790131 () Bool)

(declare-fun res!535381 () Bool)

(assert (=> b!790131 (=> (not res!535381) (not e!439128))))

(assert (=> b!790131 (= res!535381 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20531 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790132 () Bool)

(declare-fun res!535376 () Bool)

(assert (=> b!790132 (=> (not res!535376) (not e!439130))))

(declare-datatypes ((List!14572 0))(
  ( (Nil!14569) (Cons!14568 (h!15694 (_ BitVec 64)) (t!20878 List!14572)) )
))
(declare-fun arrayNoDuplicates!0 (array!42888 (_ BitVec 32) List!14572) Bool)

(assert (=> b!790132 (= res!535376 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14569))))

(declare-fun b!790133 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42888 (_ BitVec 32)) SeekEntryResult!8128)

(assert (=> b!790133 (= e!439131 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352616))))

(declare-fun b!790134 () Bool)

(declare-fun res!535385 () Bool)

(assert (=> b!790134 (=> (not res!535385) (not e!439125))))

(assert (=> b!790134 (= res!535385 (and (= (size!20952 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20952 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20952 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790135 () Bool)

(assert (=> b!790135 (= e!439126 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) (Found!8128 j!159)))))

(declare-fun b!790136 () Bool)

(declare-fun e!439129 () Bool)

(assert (=> b!790136 (= e!439128 e!439129)))

(declare-fun res!535379 () Bool)

(assert (=> b!790136 (=> (not res!535379) (not e!439129))))

(declare-fun lt!352614 () SeekEntryResult!8128)

(declare-fun lt!352611 () SeekEntryResult!8128)

(assert (=> b!790136 (= res!535379 (= lt!352614 lt!352611))))

(declare-fun lt!352610 () array!42888)

(declare-fun lt!352615 () (_ BitVec 64))

(assert (=> b!790136 (= lt!352611 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352615 lt!352610 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790136 (= lt!352614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352615 mask!3328) lt!352615 lt!352610 mask!3328))))

(assert (=> b!790136 (= lt!352615 (select (store (arr!20531 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790136 (= lt!352610 (array!42889 (store (arr!20531 a!3186) i!1173 k0!2102) (size!20952 a!3186)))))

(declare-fun b!790137 () Bool)

(assert (=> b!790137 (= e!439130 e!439128)))

(declare-fun res!535375 () Bool)

(assert (=> b!790137 (=> (not res!535375) (not e!439128))))

(assert (=> b!790137 (= res!535375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20531 a!3186) j!159) mask!3328) (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352609))))

(assert (=> b!790137 (= lt!352609 (Intermediate!8128 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790138 () Bool)

(get-info :version)

(assert (=> b!790138 (= e!439129 (not ((_ is Intermediate!8128) lt!352611)))))

(assert (=> b!790138 e!439132))

(declare-fun res!535377 () Bool)

(assert (=> b!790138 (=> (not res!535377) (not e!439132))))

(assert (=> b!790138 (= res!535377 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27380 0))(
  ( (Unit!27381) )
))
(declare-fun lt!352613 () Unit!27380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27380)

(assert (=> b!790138 (= lt!352613 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790139 () Bool)

(declare-fun res!535386 () Bool)

(assert (=> b!790139 (=> (not res!535386) (not e!439125))))

(assert (=> b!790139 (= res!535386 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67892 res!535387) b!790134))

(assert (= (and b!790134 res!535385) b!790124))

(assert (= (and b!790124 res!535389) b!790139))

(assert (= (and b!790139 res!535386) b!790123))

(assert (= (and b!790123 res!535383) b!790128))

(assert (= (and b!790128 res!535384) b!790127))

(assert (= (and b!790127 res!535380) b!790132))

(assert (= (and b!790132 res!535376) b!790130))

(assert (= (and b!790130 res!535388) b!790137))

(assert (= (and b!790137 res!535375) b!790131))

(assert (= (and b!790131 res!535381) b!790126))

(assert (= (and b!790126 c!87783) b!790125))

(assert (= (and b!790126 (not c!87783)) b!790135))

(assert (= (and b!790126 res!535382) b!790136))

(assert (= (and b!790136 res!535379) b!790138))

(assert (= (and b!790138 res!535377) b!790129))

(assert (= (and b!790129 res!535378) b!790133))

(declare-fun m!730551 () Bool)

(assert (=> b!790127 m!730551))

(declare-fun m!730553 () Bool)

(assert (=> b!790129 m!730553))

(assert (=> b!790129 m!730553))

(declare-fun m!730555 () Bool)

(assert (=> b!790129 m!730555))

(assert (=> b!790137 m!730553))

(assert (=> b!790137 m!730553))

(declare-fun m!730557 () Bool)

(assert (=> b!790137 m!730557))

(assert (=> b!790137 m!730557))

(assert (=> b!790137 m!730553))

(declare-fun m!730559 () Bool)

(assert (=> b!790137 m!730559))

(declare-fun m!730561 () Bool)

(assert (=> b!790138 m!730561))

(declare-fun m!730563 () Bool)

(assert (=> b!790138 m!730563))

(declare-fun m!730565 () Bool)

(assert (=> b!790131 m!730565))

(declare-fun m!730567 () Bool)

(assert (=> b!790136 m!730567))

(declare-fun m!730569 () Bool)

(assert (=> b!790136 m!730569))

(assert (=> b!790136 m!730567))

(declare-fun m!730571 () Bool)

(assert (=> b!790136 m!730571))

(declare-fun m!730573 () Bool)

(assert (=> b!790136 m!730573))

(declare-fun m!730575 () Bool)

(assert (=> b!790136 m!730575))

(declare-fun m!730577 () Bool)

(assert (=> b!790123 m!730577))

(assert (=> b!790124 m!730553))

(assert (=> b!790124 m!730553))

(declare-fun m!730579 () Bool)

(assert (=> b!790124 m!730579))

(assert (=> b!790125 m!730553))

(assert (=> b!790125 m!730553))

(declare-fun m!730581 () Bool)

(assert (=> b!790125 m!730581))

(declare-fun m!730583 () Bool)

(assert (=> b!790139 m!730583))

(assert (=> b!790133 m!730553))

(assert (=> b!790133 m!730553))

(declare-fun m!730585 () Bool)

(assert (=> b!790133 m!730585))

(declare-fun m!730587 () Bool)

(assert (=> b!790132 m!730587))

(declare-fun m!730589 () Bool)

(assert (=> b!790128 m!730589))

(assert (=> b!790135 m!730553))

(assert (=> b!790135 m!730553))

(declare-fun m!730591 () Bool)

(assert (=> b!790135 m!730591))

(declare-fun m!730593 () Bool)

(assert (=> start!67892 m!730593))

(declare-fun m!730595 () Bool)

(assert (=> start!67892 m!730595))

(check-sat (not b!790127) (not b!790135) (not b!790136) (not b!790132) (not b!790129) (not b!790123) (not b!790139) (not b!790124) (not b!790128) (not b!790137) (not b!790133) (not b!790125) (not start!67892) (not b!790138))
(check-sat)
(get-model)

(declare-fun b!790254 () Bool)

(declare-fun c!87798 () Bool)

(declare-fun lt!352673 () (_ BitVec 64))

(assert (=> b!790254 (= c!87798 (= lt!352673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439189 () SeekEntryResult!8128)

(declare-fun e!439188 () SeekEntryResult!8128)

(assert (=> b!790254 (= e!439189 e!439188)))

(declare-fun b!790256 () Bool)

(declare-fun lt!352672 () SeekEntryResult!8128)

(assert (=> b!790256 (= e!439189 (Found!8128 (index!34882 lt!352672)))))

(declare-fun b!790257 () Bool)

(assert (=> b!790257 (= e!439188 (MissingZero!8128 (index!34882 lt!352672)))))

(declare-fun b!790258 () Bool)

(declare-fun e!439187 () SeekEntryResult!8128)

(assert (=> b!790258 (= e!439187 Undefined!8128)))

(declare-fun b!790259 () Bool)

(assert (=> b!790259 (= e!439187 e!439189)))

(assert (=> b!790259 (= lt!352673 (select (arr!20531 a!3186) (index!34882 lt!352672)))))

(declare-fun c!87796 () Bool)

(assert (=> b!790259 (= c!87796 (= lt!352673 k0!2102))))

(declare-fun d!102775 () Bool)

(declare-fun lt!352671 () SeekEntryResult!8128)

(assert (=> d!102775 (and (or ((_ is Undefined!8128) lt!352671) (not ((_ is Found!8128) lt!352671)) (and (bvsge (index!34881 lt!352671) #b00000000000000000000000000000000) (bvslt (index!34881 lt!352671) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352671) ((_ is Found!8128) lt!352671) (not ((_ is MissingZero!8128) lt!352671)) (and (bvsge (index!34880 lt!352671) #b00000000000000000000000000000000) (bvslt (index!34880 lt!352671) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352671) ((_ is Found!8128) lt!352671) ((_ is MissingZero!8128) lt!352671) (not ((_ is MissingVacant!8128) lt!352671)) (and (bvsge (index!34883 lt!352671) #b00000000000000000000000000000000) (bvslt (index!34883 lt!352671) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352671) (ite ((_ is Found!8128) lt!352671) (= (select (arr!20531 a!3186) (index!34881 lt!352671)) k0!2102) (ite ((_ is MissingZero!8128) lt!352671) (= (select (arr!20531 a!3186) (index!34880 lt!352671)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8128) lt!352671) (= (select (arr!20531 a!3186) (index!34883 lt!352671)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102775 (= lt!352671 e!439187)))

(declare-fun c!87797 () Bool)

(assert (=> d!102775 (= c!87797 (and ((_ is Intermediate!8128) lt!352672) (undefined!8940 lt!352672)))))

(assert (=> d!102775 (= lt!352672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102775 (validMask!0 mask!3328)))

(assert (=> d!102775 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!352671)))

(declare-fun b!790255 () Bool)

(assert (=> b!790255 (= e!439188 (seekKeyOrZeroReturnVacant!0 (x!65824 lt!352672) (index!34882 lt!352672) (index!34882 lt!352672) k0!2102 a!3186 mask!3328))))

(assert (= (and d!102775 c!87797) b!790258))

(assert (= (and d!102775 (not c!87797)) b!790259))

(assert (= (and b!790259 c!87796) b!790256))

(assert (= (and b!790259 (not c!87796)) b!790254))

(assert (= (and b!790254 c!87798) b!790257))

(assert (= (and b!790254 (not c!87798)) b!790255))

(declare-fun m!730689 () Bool)

(assert (=> b!790259 m!730689))

(declare-fun m!730691 () Bool)

(assert (=> d!102775 m!730691))

(declare-fun m!730693 () Bool)

(assert (=> d!102775 m!730693))

(assert (=> d!102775 m!730693))

(declare-fun m!730695 () Bool)

(assert (=> d!102775 m!730695))

(assert (=> d!102775 m!730593))

(declare-fun m!730697 () Bool)

(assert (=> d!102775 m!730697))

(declare-fun m!730699 () Bool)

(assert (=> d!102775 m!730699))

(declare-fun m!730701 () Bool)

(assert (=> b!790255 m!730701))

(assert (=> b!790128 d!102775))

(declare-fun d!102777 () Bool)

(assert (=> d!102777 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!790139 d!102777))

(declare-fun b!790260 () Bool)

(declare-fun c!87801 () Bool)

(declare-fun lt!352676 () (_ BitVec 64))

(assert (=> b!790260 (= c!87801 (= lt!352676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439192 () SeekEntryResult!8128)

(declare-fun e!439191 () SeekEntryResult!8128)

(assert (=> b!790260 (= e!439192 e!439191)))

(declare-fun b!790262 () Bool)

(declare-fun lt!352675 () SeekEntryResult!8128)

(assert (=> b!790262 (= e!439192 (Found!8128 (index!34882 lt!352675)))))

(declare-fun b!790263 () Bool)

(assert (=> b!790263 (= e!439191 (MissingZero!8128 (index!34882 lt!352675)))))

(declare-fun b!790264 () Bool)

(declare-fun e!439190 () SeekEntryResult!8128)

(assert (=> b!790264 (= e!439190 Undefined!8128)))

(declare-fun b!790265 () Bool)

(assert (=> b!790265 (= e!439190 e!439192)))

(assert (=> b!790265 (= lt!352676 (select (arr!20531 a!3186) (index!34882 lt!352675)))))

(declare-fun c!87799 () Bool)

(assert (=> b!790265 (= c!87799 (= lt!352676 (select (arr!20531 a!3186) j!159)))))

(declare-fun d!102779 () Bool)

(declare-fun lt!352674 () SeekEntryResult!8128)

(assert (=> d!102779 (and (or ((_ is Undefined!8128) lt!352674) (not ((_ is Found!8128) lt!352674)) (and (bvsge (index!34881 lt!352674) #b00000000000000000000000000000000) (bvslt (index!34881 lt!352674) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352674) ((_ is Found!8128) lt!352674) (not ((_ is MissingZero!8128) lt!352674)) (and (bvsge (index!34880 lt!352674) #b00000000000000000000000000000000) (bvslt (index!34880 lt!352674) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352674) ((_ is Found!8128) lt!352674) ((_ is MissingZero!8128) lt!352674) (not ((_ is MissingVacant!8128) lt!352674)) (and (bvsge (index!34883 lt!352674) #b00000000000000000000000000000000) (bvslt (index!34883 lt!352674) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352674) (ite ((_ is Found!8128) lt!352674) (= (select (arr!20531 a!3186) (index!34881 lt!352674)) (select (arr!20531 a!3186) j!159)) (ite ((_ is MissingZero!8128) lt!352674) (= (select (arr!20531 a!3186) (index!34880 lt!352674)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8128) lt!352674) (= (select (arr!20531 a!3186) (index!34883 lt!352674)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102779 (= lt!352674 e!439190)))

(declare-fun c!87800 () Bool)

(assert (=> d!102779 (= c!87800 (and ((_ is Intermediate!8128) lt!352675) (undefined!8940 lt!352675)))))

(assert (=> d!102779 (= lt!352675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20531 a!3186) j!159) mask!3328) (select (arr!20531 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102779 (validMask!0 mask!3328)))

(assert (=> d!102779 (= (seekEntryOrOpen!0 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352674)))

(declare-fun b!790261 () Bool)

(assert (=> b!790261 (= e!439191 (seekKeyOrZeroReturnVacant!0 (x!65824 lt!352675) (index!34882 lt!352675) (index!34882 lt!352675) (select (arr!20531 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102779 c!87800) b!790264))

(assert (= (and d!102779 (not c!87800)) b!790265))

(assert (= (and b!790265 c!87799) b!790262))

(assert (= (and b!790265 (not c!87799)) b!790260))

(assert (= (and b!790260 c!87801) b!790263))

(assert (= (and b!790260 (not c!87801)) b!790261))

(declare-fun m!730703 () Bool)

(assert (=> b!790265 m!730703))

(declare-fun m!730705 () Bool)

(assert (=> d!102779 m!730705))

(assert (=> d!102779 m!730553))

(assert (=> d!102779 m!730557))

(assert (=> d!102779 m!730557))

(assert (=> d!102779 m!730553))

(assert (=> d!102779 m!730559))

(assert (=> d!102779 m!730593))

(declare-fun m!730707 () Bool)

(assert (=> d!102779 m!730707))

(declare-fun m!730709 () Bool)

(assert (=> d!102779 m!730709))

(assert (=> b!790261 m!730553))

(declare-fun m!730711 () Bool)

(assert (=> b!790261 m!730711))

(assert (=> b!790129 d!102779))

(declare-fun d!102781 () Bool)

(assert (=> d!102781 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67892 d!102781))

(declare-fun d!102785 () Bool)

(assert (=> d!102785 (= (array_inv!16414 a!3186) (bvsge (size!20952 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67892 d!102785))

(declare-fun b!790276 () Bool)

(declare-fun e!439203 () Bool)

(declare-fun contains!4092 (List!14572 (_ BitVec 64)) Bool)

(assert (=> b!790276 (= e!439203 (contains!4092 Nil!14569 (select (arr!20531 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!790277 () Bool)

(declare-fun e!439204 () Bool)

(declare-fun call!35275 () Bool)

(assert (=> b!790277 (= e!439204 call!35275)))

(declare-fun b!790278 () Bool)

(declare-fun e!439202 () Bool)

(assert (=> b!790278 (= e!439202 e!439204)))

(declare-fun c!87804 () Bool)

(assert (=> b!790278 (= c!87804 (validKeyInArray!0 (select (arr!20531 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!790279 () Bool)

(assert (=> b!790279 (= e!439204 call!35275)))

(declare-fun b!790280 () Bool)

(declare-fun e!439201 () Bool)

(assert (=> b!790280 (= e!439201 e!439202)))

(declare-fun res!535486 () Bool)

(assert (=> b!790280 (=> (not res!535486) (not e!439202))))

(assert (=> b!790280 (= res!535486 (not e!439203))))

(declare-fun res!535488 () Bool)

(assert (=> b!790280 (=> (not res!535488) (not e!439203))))

(assert (=> b!790280 (= res!535488 (validKeyInArray!0 (select (arr!20531 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35272 () Bool)

(assert (=> bm!35272 (= call!35275 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!87804 (Cons!14568 (select (arr!20531 a!3186) #b00000000000000000000000000000000) Nil!14569) Nil!14569)))))

(declare-fun d!102787 () Bool)

(declare-fun res!535487 () Bool)

(assert (=> d!102787 (=> res!535487 e!439201)))

(assert (=> d!102787 (= res!535487 (bvsge #b00000000000000000000000000000000 (size!20952 a!3186)))))

(assert (=> d!102787 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14569) e!439201)))

(assert (= (and d!102787 (not res!535487)) b!790280))

(assert (= (and b!790280 res!535488) b!790276))

(assert (= (and b!790280 res!535486) b!790278))

(assert (= (and b!790278 c!87804) b!790279))

(assert (= (and b!790278 (not c!87804)) b!790277))

(assert (= (or b!790279 b!790277) bm!35272))

(declare-fun m!730713 () Bool)

(assert (=> b!790276 m!730713))

(assert (=> b!790276 m!730713))

(declare-fun m!730715 () Bool)

(assert (=> b!790276 m!730715))

(assert (=> b!790278 m!730713))

(assert (=> b!790278 m!730713))

(declare-fun m!730717 () Bool)

(assert (=> b!790278 m!730717))

(assert (=> b!790280 m!730713))

(assert (=> b!790280 m!730713))

(assert (=> b!790280 m!730717))

(assert (=> bm!35272 m!730713))

(declare-fun m!730719 () Bool)

(assert (=> bm!35272 m!730719))

(assert (=> b!790132 d!102787))

(declare-fun b!790329 () Bool)

(declare-fun e!439230 () SeekEntryResult!8128)

(assert (=> b!790329 (= e!439230 (Found!8128 resIntermediateIndex!5))))

(declare-fun b!790330 () Bool)

(declare-fun e!439229 () SeekEntryResult!8128)

(assert (=> b!790330 (= e!439229 (MissingVacant!8128 resIntermediateIndex!5))))

(declare-fun b!790331 () Bool)

(declare-fun c!87830 () Bool)

(declare-fun lt!352694 () (_ BitVec 64))

(assert (=> b!790331 (= c!87830 (= lt!352694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790331 (= e!439230 e!439229)))

(declare-fun b!790332 () Bool)

(declare-fun e!439231 () SeekEntryResult!8128)

(assert (=> b!790332 (= e!439231 e!439230)))

(declare-fun c!87829 () Bool)

(assert (=> b!790332 (= c!87829 (= lt!352694 (select (arr!20531 a!3186) j!159)))))

(declare-fun b!790333 () Bool)

(assert (=> b!790333 (= e!439231 Undefined!8128)))

(declare-fun lt!352693 () SeekEntryResult!8128)

(declare-fun d!102791 () Bool)

(assert (=> d!102791 (and (or ((_ is Undefined!8128) lt!352693) (not ((_ is Found!8128) lt!352693)) (and (bvsge (index!34881 lt!352693) #b00000000000000000000000000000000) (bvslt (index!34881 lt!352693) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352693) ((_ is Found!8128) lt!352693) (not ((_ is MissingVacant!8128) lt!352693)) (not (= (index!34883 lt!352693) resIntermediateIndex!5)) (and (bvsge (index!34883 lt!352693) #b00000000000000000000000000000000) (bvslt (index!34883 lt!352693) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352693) (ite ((_ is Found!8128) lt!352693) (= (select (arr!20531 a!3186) (index!34881 lt!352693)) (select (arr!20531 a!3186) j!159)) (and ((_ is MissingVacant!8128) lt!352693) (= (index!34883 lt!352693) resIntermediateIndex!5) (= (select (arr!20531 a!3186) (index!34883 lt!352693)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102791 (= lt!352693 e!439231)))

(declare-fun c!87831 () Bool)

(assert (=> d!102791 (= c!87831 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102791 (= lt!352694 (select (arr!20531 a!3186) resIntermediateIndex!5))))

(assert (=> d!102791 (validMask!0 mask!3328)))

(assert (=> d!102791 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352693)))

(declare-fun b!790334 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790334 (= e!439229 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20531 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102791 c!87831) b!790333))

(assert (= (and d!102791 (not c!87831)) b!790332))

(assert (= (and b!790332 c!87829) b!790329))

(assert (= (and b!790332 (not c!87829)) b!790331))

(assert (= (and b!790331 c!87830) b!790330))

(assert (= (and b!790331 (not c!87830)) b!790334))

(declare-fun m!730739 () Bool)

(assert (=> d!102791 m!730739))

(declare-fun m!730741 () Bool)

(assert (=> d!102791 m!730741))

(assert (=> d!102791 m!730565))

(assert (=> d!102791 m!730593))

(declare-fun m!730743 () Bool)

(assert (=> b!790334 m!730743))

(assert (=> b!790334 m!730743))

(assert (=> b!790334 m!730553))

(declare-fun m!730745 () Bool)

(assert (=> b!790334 m!730745))

(assert (=> b!790133 d!102791))

(declare-fun d!102797 () Bool)

(declare-fun res!535493 () Bool)

(declare-fun e!439236 () Bool)

(assert (=> d!102797 (=> res!535493 e!439236)))

(assert (=> d!102797 (= res!535493 (= (select (arr!20531 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102797 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!439236)))

(declare-fun b!790339 () Bool)

(declare-fun e!439237 () Bool)

(assert (=> b!790339 (= e!439236 e!439237)))

(declare-fun res!535494 () Bool)

(assert (=> b!790339 (=> (not res!535494) (not e!439237))))

(assert (=> b!790339 (= res!535494 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20952 a!3186)))))

(declare-fun b!790340 () Bool)

(assert (=> b!790340 (= e!439237 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102797 (not res!535493)) b!790339))

(assert (= (and b!790339 res!535494) b!790340))

(assert (=> d!102797 m!730713))

(declare-fun m!730747 () Bool)

(assert (=> b!790340 m!730747))

(assert (=> b!790123 d!102797))

(declare-fun d!102799 () Bool)

(assert (=> d!102799 (= (validKeyInArray!0 (select (arr!20531 a!3186) j!159)) (and (not (= (select (arr!20531 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20531 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!790124 d!102799))

(declare-fun b!790341 () Bool)

(declare-fun e!439239 () SeekEntryResult!8128)

(assert (=> b!790341 (= e!439239 (Found!8128 index!1321))))

(declare-fun b!790342 () Bool)

(declare-fun e!439238 () SeekEntryResult!8128)

(assert (=> b!790342 (= e!439238 (MissingVacant!8128 resIntermediateIndex!5))))

(declare-fun b!790343 () Bool)

(declare-fun c!87833 () Bool)

(declare-fun lt!352696 () (_ BitVec 64))

(assert (=> b!790343 (= c!87833 (= lt!352696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!790343 (= e!439239 e!439238)))

(declare-fun b!790344 () Bool)

(declare-fun e!439240 () SeekEntryResult!8128)

(assert (=> b!790344 (= e!439240 e!439239)))

(declare-fun c!87832 () Bool)

(assert (=> b!790344 (= c!87832 (= lt!352696 (select (arr!20531 a!3186) j!159)))))

(declare-fun b!790345 () Bool)

(assert (=> b!790345 (= e!439240 Undefined!8128)))

(declare-fun d!102801 () Bool)

(declare-fun lt!352695 () SeekEntryResult!8128)

(assert (=> d!102801 (and (or ((_ is Undefined!8128) lt!352695) (not ((_ is Found!8128) lt!352695)) (and (bvsge (index!34881 lt!352695) #b00000000000000000000000000000000) (bvslt (index!34881 lt!352695) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352695) ((_ is Found!8128) lt!352695) (not ((_ is MissingVacant!8128) lt!352695)) (not (= (index!34883 lt!352695) resIntermediateIndex!5)) (and (bvsge (index!34883 lt!352695) #b00000000000000000000000000000000) (bvslt (index!34883 lt!352695) (size!20952 a!3186)))) (or ((_ is Undefined!8128) lt!352695) (ite ((_ is Found!8128) lt!352695) (= (select (arr!20531 a!3186) (index!34881 lt!352695)) (select (arr!20531 a!3186) j!159)) (and ((_ is MissingVacant!8128) lt!352695) (= (index!34883 lt!352695) resIntermediateIndex!5) (= (select (arr!20531 a!3186) (index!34883 lt!352695)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102801 (= lt!352695 e!439240)))

(declare-fun c!87834 () Bool)

(assert (=> d!102801 (= c!87834 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102801 (= lt!352696 (select (arr!20531 a!3186) index!1321))))

(assert (=> d!102801 (validMask!0 mask!3328)))

(assert (=> d!102801 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352695)))

(declare-fun b!790346 () Bool)

(assert (=> b!790346 (= e!439238 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20531 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102801 c!87834) b!790345))

(assert (= (and d!102801 (not c!87834)) b!790344))

(assert (= (and b!790344 c!87832) b!790341))

(assert (= (and b!790344 (not c!87832)) b!790343))

(assert (= (and b!790343 c!87833) b!790342))

(assert (= (and b!790343 (not c!87833)) b!790346))

(declare-fun m!730749 () Bool)

(assert (=> d!102801 m!730749))

(declare-fun m!730751 () Bool)

(assert (=> d!102801 m!730751))

(declare-fun m!730753 () Bool)

(assert (=> d!102801 m!730753))

(assert (=> d!102801 m!730593))

(declare-fun m!730755 () Bool)

(assert (=> b!790346 m!730755))

(assert (=> b!790346 m!730755))

(assert (=> b!790346 m!730553))

(declare-fun m!730757 () Bool)

(assert (=> b!790346 m!730757))

(assert (=> b!790135 d!102801))

(declare-fun b!790419 () Bool)

(declare-fun e!439281 () SeekEntryResult!8128)

(assert (=> b!790419 (= e!439281 (Intermediate!8128 false index!1321 x!1131))))

(declare-fun b!790420 () Bool)

(assert (=> b!790420 (= e!439281 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20531 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790421 () Bool)

(declare-fun e!439284 () Bool)

(declare-fun lt!352713 () SeekEntryResult!8128)

(assert (=> b!790421 (= e!439284 (bvsge (x!65824 lt!352713) #b01111111111111111111111111111110))))

(declare-fun b!790422 () Bool)

(declare-fun e!439283 () SeekEntryResult!8128)

(assert (=> b!790422 (= e!439283 (Intermediate!8128 true index!1321 x!1131))))

(declare-fun b!790423 () Bool)

(assert (=> b!790423 (and (bvsge (index!34882 lt!352713) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352713) (size!20952 a!3186)))))

(declare-fun res!535522 () Bool)

(assert (=> b!790423 (= res!535522 (= (select (arr!20531 a!3186) (index!34882 lt!352713)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439282 () Bool)

(assert (=> b!790423 (=> res!535522 e!439282)))

(declare-fun d!102803 () Bool)

(assert (=> d!102803 e!439284))

(declare-fun c!87859 () Bool)

(assert (=> d!102803 (= c!87859 (and ((_ is Intermediate!8128) lt!352713) (undefined!8940 lt!352713)))))

(assert (=> d!102803 (= lt!352713 e!439283)))

(declare-fun c!87861 () Bool)

(assert (=> d!102803 (= c!87861 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!352714 () (_ BitVec 64))

(assert (=> d!102803 (= lt!352714 (select (arr!20531 a!3186) index!1321))))

(assert (=> d!102803 (validMask!0 mask!3328)))

(assert (=> d!102803 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352713)))

(declare-fun b!790424 () Bool)

(assert (=> b!790424 (and (bvsge (index!34882 lt!352713) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352713) (size!20952 a!3186)))))

(assert (=> b!790424 (= e!439282 (= (select (arr!20531 a!3186) (index!34882 lt!352713)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790425 () Bool)

(assert (=> b!790425 (and (bvsge (index!34882 lt!352713) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352713) (size!20952 a!3186)))))

(declare-fun res!535521 () Bool)

(assert (=> b!790425 (= res!535521 (= (select (arr!20531 a!3186) (index!34882 lt!352713)) (select (arr!20531 a!3186) j!159)))))

(assert (=> b!790425 (=> res!535521 e!439282)))

(declare-fun e!439285 () Bool)

(assert (=> b!790425 (= e!439285 e!439282)))

(declare-fun b!790426 () Bool)

(assert (=> b!790426 (= e!439283 e!439281)))

(declare-fun c!87860 () Bool)

(assert (=> b!790426 (= c!87860 (or (= lt!352714 (select (arr!20531 a!3186) j!159)) (= (bvadd lt!352714 lt!352714) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790427 () Bool)

(assert (=> b!790427 (= e!439284 e!439285)))

(declare-fun res!535520 () Bool)

(assert (=> b!790427 (= res!535520 (and ((_ is Intermediate!8128) lt!352713) (not (undefined!8940 lt!352713)) (bvslt (x!65824 lt!352713) #b01111111111111111111111111111110) (bvsge (x!65824 lt!352713) #b00000000000000000000000000000000) (bvsge (x!65824 lt!352713) x!1131)))))

(assert (=> b!790427 (=> (not res!535520) (not e!439285))))

(assert (= (and d!102803 c!87861) b!790422))

(assert (= (and d!102803 (not c!87861)) b!790426))

(assert (= (and b!790426 c!87860) b!790419))

(assert (= (and b!790426 (not c!87860)) b!790420))

(assert (= (and d!102803 c!87859) b!790421))

(assert (= (and d!102803 (not c!87859)) b!790427))

(assert (= (and b!790427 res!535520) b!790425))

(assert (= (and b!790425 (not res!535521)) b!790423))

(assert (= (and b!790423 (not res!535522)) b!790424))

(assert (=> b!790420 m!730755))

(assert (=> b!790420 m!730755))

(assert (=> b!790420 m!730553))

(declare-fun m!730775 () Bool)

(assert (=> b!790420 m!730775))

(declare-fun m!730777 () Bool)

(assert (=> b!790423 m!730777))

(assert (=> b!790424 m!730777))

(assert (=> d!102803 m!730753))

(assert (=> d!102803 m!730593))

(assert (=> b!790425 m!730777))

(assert (=> b!790125 d!102803))

(declare-fun b!790428 () Bool)

(declare-fun e!439286 () SeekEntryResult!8128)

(assert (=> b!790428 (= e!439286 (Intermediate!8128 false index!1321 x!1131))))

(declare-fun b!790429 () Bool)

(assert (=> b!790429 (= e!439286 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!352615 lt!352610 mask!3328))))

(declare-fun b!790430 () Bool)

(declare-fun e!439289 () Bool)

(declare-fun lt!352715 () SeekEntryResult!8128)

(assert (=> b!790430 (= e!439289 (bvsge (x!65824 lt!352715) #b01111111111111111111111111111110))))

(declare-fun b!790431 () Bool)

(declare-fun e!439288 () SeekEntryResult!8128)

(assert (=> b!790431 (= e!439288 (Intermediate!8128 true index!1321 x!1131))))

(declare-fun b!790432 () Bool)

(assert (=> b!790432 (and (bvsge (index!34882 lt!352715) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352715) (size!20952 lt!352610)))))

(declare-fun res!535525 () Bool)

(assert (=> b!790432 (= res!535525 (= (select (arr!20531 lt!352610) (index!34882 lt!352715)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439287 () Bool)

(assert (=> b!790432 (=> res!535525 e!439287)))

(declare-fun d!102809 () Bool)

(assert (=> d!102809 e!439289))

(declare-fun c!87862 () Bool)

(assert (=> d!102809 (= c!87862 (and ((_ is Intermediate!8128) lt!352715) (undefined!8940 lt!352715)))))

(assert (=> d!102809 (= lt!352715 e!439288)))

(declare-fun c!87864 () Bool)

(assert (=> d!102809 (= c!87864 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!352716 () (_ BitVec 64))

(assert (=> d!102809 (= lt!352716 (select (arr!20531 lt!352610) index!1321))))

(assert (=> d!102809 (validMask!0 mask!3328)))

(assert (=> d!102809 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352615 lt!352610 mask!3328) lt!352715)))

(declare-fun b!790433 () Bool)

(assert (=> b!790433 (and (bvsge (index!34882 lt!352715) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352715) (size!20952 lt!352610)))))

(assert (=> b!790433 (= e!439287 (= (select (arr!20531 lt!352610) (index!34882 lt!352715)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790434 () Bool)

(assert (=> b!790434 (and (bvsge (index!34882 lt!352715) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352715) (size!20952 lt!352610)))))

(declare-fun res!535524 () Bool)

(assert (=> b!790434 (= res!535524 (= (select (arr!20531 lt!352610) (index!34882 lt!352715)) lt!352615))))

(assert (=> b!790434 (=> res!535524 e!439287)))

(declare-fun e!439290 () Bool)

(assert (=> b!790434 (= e!439290 e!439287)))

(declare-fun b!790435 () Bool)

(assert (=> b!790435 (= e!439288 e!439286)))

(declare-fun c!87863 () Bool)

(assert (=> b!790435 (= c!87863 (or (= lt!352716 lt!352615) (= (bvadd lt!352716 lt!352716) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790436 () Bool)

(assert (=> b!790436 (= e!439289 e!439290)))

(declare-fun res!535523 () Bool)

(assert (=> b!790436 (= res!535523 (and ((_ is Intermediate!8128) lt!352715) (not (undefined!8940 lt!352715)) (bvslt (x!65824 lt!352715) #b01111111111111111111111111111110) (bvsge (x!65824 lt!352715) #b00000000000000000000000000000000) (bvsge (x!65824 lt!352715) x!1131)))))

(assert (=> b!790436 (=> (not res!535523) (not e!439290))))

(assert (= (and d!102809 c!87864) b!790431))

(assert (= (and d!102809 (not c!87864)) b!790435))

(assert (= (and b!790435 c!87863) b!790428))

(assert (= (and b!790435 (not c!87863)) b!790429))

(assert (= (and d!102809 c!87862) b!790430))

(assert (= (and d!102809 (not c!87862)) b!790436))

(assert (= (and b!790436 res!535523) b!790434))

(assert (= (and b!790434 (not res!535524)) b!790432))

(assert (= (and b!790432 (not res!535525)) b!790433))

(assert (=> b!790429 m!730755))

(assert (=> b!790429 m!730755))

(declare-fun m!730779 () Bool)

(assert (=> b!790429 m!730779))

(declare-fun m!730781 () Bool)

(assert (=> b!790432 m!730781))

(assert (=> b!790433 m!730781))

(declare-fun m!730783 () Bool)

(assert (=> d!102809 m!730783))

(assert (=> d!102809 m!730593))

(assert (=> b!790434 m!730781))

(assert (=> b!790136 d!102809))

(declare-fun b!790437 () Bool)

(declare-fun e!439291 () SeekEntryResult!8128)

(assert (=> b!790437 (= e!439291 (Intermediate!8128 false (toIndex!0 lt!352615 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!790438 () Bool)

(assert (=> b!790438 (= e!439291 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!352615 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!352615 lt!352610 mask!3328))))

(declare-fun b!790439 () Bool)

(declare-fun e!439294 () Bool)

(declare-fun lt!352717 () SeekEntryResult!8128)

(assert (=> b!790439 (= e!439294 (bvsge (x!65824 lt!352717) #b01111111111111111111111111111110))))

(declare-fun b!790440 () Bool)

(declare-fun e!439293 () SeekEntryResult!8128)

(assert (=> b!790440 (= e!439293 (Intermediate!8128 true (toIndex!0 lt!352615 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!790441 () Bool)

(assert (=> b!790441 (and (bvsge (index!34882 lt!352717) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352717) (size!20952 lt!352610)))))

(declare-fun res!535528 () Bool)

(assert (=> b!790441 (= res!535528 (= (select (arr!20531 lt!352610) (index!34882 lt!352717)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439292 () Bool)

(assert (=> b!790441 (=> res!535528 e!439292)))

(declare-fun d!102811 () Bool)

(assert (=> d!102811 e!439294))

(declare-fun c!87865 () Bool)

(assert (=> d!102811 (= c!87865 (and ((_ is Intermediate!8128) lt!352717) (undefined!8940 lt!352717)))))

(assert (=> d!102811 (= lt!352717 e!439293)))

(declare-fun c!87867 () Bool)

(assert (=> d!102811 (= c!87867 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!352718 () (_ BitVec 64))

(assert (=> d!102811 (= lt!352718 (select (arr!20531 lt!352610) (toIndex!0 lt!352615 mask!3328)))))

(assert (=> d!102811 (validMask!0 mask!3328)))

(assert (=> d!102811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352615 mask!3328) lt!352615 lt!352610 mask!3328) lt!352717)))

(declare-fun b!790442 () Bool)

(assert (=> b!790442 (and (bvsge (index!34882 lt!352717) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352717) (size!20952 lt!352610)))))

(assert (=> b!790442 (= e!439292 (= (select (arr!20531 lt!352610) (index!34882 lt!352717)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790443 () Bool)

(assert (=> b!790443 (and (bvsge (index!34882 lt!352717) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352717) (size!20952 lt!352610)))))

(declare-fun res!535527 () Bool)

(assert (=> b!790443 (= res!535527 (= (select (arr!20531 lt!352610) (index!34882 lt!352717)) lt!352615))))

(assert (=> b!790443 (=> res!535527 e!439292)))

(declare-fun e!439295 () Bool)

(assert (=> b!790443 (= e!439295 e!439292)))

(declare-fun b!790444 () Bool)

(assert (=> b!790444 (= e!439293 e!439291)))

(declare-fun c!87866 () Bool)

(assert (=> b!790444 (= c!87866 (or (= lt!352718 lt!352615) (= (bvadd lt!352718 lt!352718) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790445 () Bool)

(assert (=> b!790445 (= e!439294 e!439295)))

(declare-fun res!535526 () Bool)

(assert (=> b!790445 (= res!535526 (and ((_ is Intermediate!8128) lt!352717) (not (undefined!8940 lt!352717)) (bvslt (x!65824 lt!352717) #b01111111111111111111111111111110) (bvsge (x!65824 lt!352717) #b00000000000000000000000000000000) (bvsge (x!65824 lt!352717) #b00000000000000000000000000000000)))))

(assert (=> b!790445 (=> (not res!535526) (not e!439295))))

(assert (= (and d!102811 c!87867) b!790440))

(assert (= (and d!102811 (not c!87867)) b!790444))

(assert (= (and b!790444 c!87866) b!790437))

(assert (= (and b!790444 (not c!87866)) b!790438))

(assert (= (and d!102811 c!87865) b!790439))

(assert (= (and d!102811 (not c!87865)) b!790445))

(assert (= (and b!790445 res!535526) b!790443))

(assert (= (and b!790443 (not res!535527)) b!790441))

(assert (= (and b!790441 (not res!535528)) b!790442))

(assert (=> b!790438 m!730567))

(declare-fun m!730785 () Bool)

(assert (=> b!790438 m!730785))

(assert (=> b!790438 m!730785))

(declare-fun m!730787 () Bool)

(assert (=> b!790438 m!730787))

(declare-fun m!730789 () Bool)

(assert (=> b!790441 m!730789))

(assert (=> b!790442 m!730789))

(assert (=> d!102811 m!730567))

(declare-fun m!730791 () Bool)

(assert (=> d!102811 m!730791))

(assert (=> d!102811 m!730593))

(assert (=> b!790443 m!730789))

(assert (=> b!790136 d!102811))

(declare-fun d!102813 () Bool)

(declare-fun lt!352734 () (_ BitVec 32))

(declare-fun lt!352733 () (_ BitVec 32))

(assert (=> d!102813 (= lt!352734 (bvmul (bvxor lt!352733 (bvlshr lt!352733 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102813 (= lt!352733 ((_ extract 31 0) (bvand (bvxor lt!352615 (bvlshr lt!352615 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102813 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!535529 (let ((h!15698 ((_ extract 31 0) (bvand (bvxor lt!352615 (bvlshr lt!352615 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65834 (bvmul (bvxor h!15698 (bvlshr h!15698 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65834 (bvlshr x!65834 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!535529 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!535529 #b00000000000000000000000000000000))))))

(assert (=> d!102813 (= (toIndex!0 lt!352615 mask!3328) (bvand (bvxor lt!352734 (bvlshr lt!352734 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!790136 d!102813))

(declare-fun e!439306 () SeekEntryResult!8128)

(declare-fun b!790464 () Bool)

(assert (=> b!790464 (= e!439306 (Intermediate!8128 false (toIndex!0 (select (arr!20531 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!790465 () Bool)

(assert (=> b!790465 (= e!439306 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20531 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20531 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790466 () Bool)

(declare-fun e!439309 () Bool)

(declare-fun lt!352735 () SeekEntryResult!8128)

(assert (=> b!790466 (= e!439309 (bvsge (x!65824 lt!352735) #b01111111111111111111111111111110))))

(declare-fun b!790467 () Bool)

(declare-fun e!439308 () SeekEntryResult!8128)

(assert (=> b!790467 (= e!439308 (Intermediate!8128 true (toIndex!0 (select (arr!20531 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!790468 () Bool)

(assert (=> b!790468 (and (bvsge (index!34882 lt!352735) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352735) (size!20952 a!3186)))))

(declare-fun res!535538 () Bool)

(assert (=> b!790468 (= res!535538 (= (select (arr!20531 a!3186) (index!34882 lt!352735)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!439307 () Bool)

(assert (=> b!790468 (=> res!535538 e!439307)))

(declare-fun d!102819 () Bool)

(assert (=> d!102819 e!439309))

(declare-fun c!87874 () Bool)

(assert (=> d!102819 (= c!87874 (and ((_ is Intermediate!8128) lt!352735) (undefined!8940 lt!352735)))))

(assert (=> d!102819 (= lt!352735 e!439308)))

(declare-fun c!87876 () Bool)

(assert (=> d!102819 (= c!87876 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!352736 () (_ BitVec 64))

(assert (=> d!102819 (= lt!352736 (select (arr!20531 a!3186) (toIndex!0 (select (arr!20531 a!3186) j!159) mask!3328)))))

(assert (=> d!102819 (validMask!0 mask!3328)))

(assert (=> d!102819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20531 a!3186) j!159) mask!3328) (select (arr!20531 a!3186) j!159) a!3186 mask!3328) lt!352735)))

(declare-fun b!790469 () Bool)

(assert (=> b!790469 (and (bvsge (index!34882 lt!352735) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352735) (size!20952 a!3186)))))

(assert (=> b!790469 (= e!439307 (= (select (arr!20531 a!3186) (index!34882 lt!352735)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790470 () Bool)

(assert (=> b!790470 (and (bvsge (index!34882 lt!352735) #b00000000000000000000000000000000) (bvslt (index!34882 lt!352735) (size!20952 a!3186)))))

(declare-fun res!535537 () Bool)

(assert (=> b!790470 (= res!535537 (= (select (arr!20531 a!3186) (index!34882 lt!352735)) (select (arr!20531 a!3186) j!159)))))

(assert (=> b!790470 (=> res!535537 e!439307)))

(declare-fun e!439310 () Bool)

(assert (=> b!790470 (= e!439310 e!439307)))

(declare-fun b!790471 () Bool)

(assert (=> b!790471 (= e!439308 e!439306)))

(declare-fun c!87875 () Bool)

(assert (=> b!790471 (= c!87875 (or (= lt!352736 (select (arr!20531 a!3186) j!159)) (= (bvadd lt!352736 lt!352736) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790472 () Bool)

(assert (=> b!790472 (= e!439309 e!439310)))

(declare-fun res!535536 () Bool)

(assert (=> b!790472 (= res!535536 (and ((_ is Intermediate!8128) lt!352735) (not (undefined!8940 lt!352735)) (bvslt (x!65824 lt!352735) #b01111111111111111111111111111110) (bvsge (x!65824 lt!352735) #b00000000000000000000000000000000) (bvsge (x!65824 lt!352735) #b00000000000000000000000000000000)))))

(assert (=> b!790472 (=> (not res!535536) (not e!439310))))

(assert (= (and d!102819 c!87876) b!790467))

(assert (= (and d!102819 (not c!87876)) b!790471))

(assert (= (and b!790471 c!87875) b!790464))

(assert (= (and b!790471 (not c!87875)) b!790465))

(assert (= (and d!102819 c!87874) b!790466))

(assert (= (and d!102819 (not c!87874)) b!790472))

(assert (= (and b!790472 res!535536) b!790470))

(assert (= (and b!790470 (not res!535537)) b!790468))

(assert (= (and b!790468 (not res!535538)) b!790469))

(assert (=> b!790465 m!730557))

(declare-fun m!730807 () Bool)

(assert (=> b!790465 m!730807))

(assert (=> b!790465 m!730807))

(assert (=> b!790465 m!730553))

(declare-fun m!730809 () Bool)

(assert (=> b!790465 m!730809))

(declare-fun m!730811 () Bool)

(assert (=> b!790468 m!730811))

(assert (=> b!790469 m!730811))

(assert (=> d!102819 m!730557))

(declare-fun m!730813 () Bool)

(assert (=> d!102819 m!730813))

(assert (=> d!102819 m!730593))

(assert (=> b!790470 m!730811))

(assert (=> b!790137 d!102819))

(declare-fun d!102823 () Bool)

(declare-fun lt!352738 () (_ BitVec 32))

(declare-fun lt!352737 () (_ BitVec 32))

(assert (=> d!102823 (= lt!352738 (bvmul (bvxor lt!352737 (bvlshr lt!352737 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102823 (= lt!352737 ((_ extract 31 0) (bvand (bvxor (select (arr!20531 a!3186) j!159) (bvlshr (select (arr!20531 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102823 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!535529 (let ((h!15698 ((_ extract 31 0) (bvand (bvxor (select (arr!20531 a!3186) j!159) (bvlshr (select (arr!20531 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65834 (bvmul (bvxor h!15698 (bvlshr h!15698 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65834 (bvlshr x!65834 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!535529 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!535529 #b00000000000000000000000000000000))))))

(assert (=> d!102823 (= (toIndex!0 (select (arr!20531 a!3186) j!159) mask!3328) (bvand (bvxor lt!352738 (bvlshr lt!352738 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!790137 d!102823))

(declare-fun bm!35278 () Bool)

(declare-fun call!35281 () Bool)

(assert (=> bm!35278 (= call!35281 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102825 () Bool)

(declare-fun res!535558 () Bool)

(declare-fun e!439334 () Bool)

(assert (=> d!102825 (=> res!535558 e!439334)))

(assert (=> d!102825 (= res!535558 (bvsge #b00000000000000000000000000000000 (size!20952 a!3186)))))

(assert (=> d!102825 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!439334)))

(declare-fun b!790500 () Bool)

(declare-fun e!439335 () Bool)

(declare-fun e!439333 () Bool)

(assert (=> b!790500 (= e!439335 e!439333)))

(declare-fun lt!352752 () (_ BitVec 64))

(assert (=> b!790500 (= lt!352752 (select (arr!20531 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!352751 () Unit!27380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42888 (_ BitVec 64) (_ BitVec 32)) Unit!27380)

(assert (=> b!790500 (= lt!352751 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!352752 #b00000000000000000000000000000000))))

(assert (=> b!790500 (arrayContainsKey!0 a!3186 lt!352752 #b00000000000000000000000000000000)))

(declare-fun lt!352753 () Unit!27380)

(assert (=> b!790500 (= lt!352753 lt!352751)))

(declare-fun res!535557 () Bool)

(assert (=> b!790500 (= res!535557 (= (seekEntryOrOpen!0 (select (arr!20531 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8128 #b00000000000000000000000000000000)))))

(assert (=> b!790500 (=> (not res!535557) (not e!439333))))

(declare-fun b!790501 () Bool)

(assert (=> b!790501 (= e!439333 call!35281)))

(declare-fun b!790502 () Bool)

(assert (=> b!790502 (= e!439335 call!35281)))

(declare-fun b!790503 () Bool)

(assert (=> b!790503 (= e!439334 e!439335)))

(declare-fun c!87882 () Bool)

(assert (=> b!790503 (= c!87882 (validKeyInArray!0 (select (arr!20531 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102825 (not res!535558)) b!790503))

(assert (= (and b!790503 c!87882) b!790500))

(assert (= (and b!790503 (not c!87882)) b!790502))

(assert (= (and b!790500 res!535557) b!790501))

(assert (= (or b!790501 b!790502) bm!35278))

(declare-fun m!730823 () Bool)

(assert (=> bm!35278 m!730823))

(assert (=> b!790500 m!730713))

(declare-fun m!730825 () Bool)

(assert (=> b!790500 m!730825))

(declare-fun m!730827 () Bool)

(assert (=> b!790500 m!730827))

(assert (=> b!790500 m!730713))

(declare-fun m!730829 () Bool)

(assert (=> b!790500 m!730829))

(assert (=> b!790503 m!730713))

(assert (=> b!790503 m!730713))

(assert (=> b!790503 m!730717))

(assert (=> b!790127 d!102825))

(declare-fun call!35282 () Bool)

(declare-fun bm!35279 () Bool)

(assert (=> bm!35279 (= call!35282 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!102831 () Bool)

(declare-fun res!535560 () Bool)

(declare-fun e!439337 () Bool)

(assert (=> d!102831 (=> res!535560 e!439337)))

(assert (=> d!102831 (= res!535560 (bvsge j!159 (size!20952 a!3186)))))

(assert (=> d!102831 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!439337)))

(declare-fun b!790504 () Bool)

(declare-fun e!439338 () Bool)

(declare-fun e!439336 () Bool)

(assert (=> b!790504 (= e!439338 e!439336)))

(declare-fun lt!352755 () (_ BitVec 64))

(assert (=> b!790504 (= lt!352755 (select (arr!20531 a!3186) j!159))))

(declare-fun lt!352754 () Unit!27380)

(assert (=> b!790504 (= lt!352754 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!352755 j!159))))

(assert (=> b!790504 (arrayContainsKey!0 a!3186 lt!352755 #b00000000000000000000000000000000)))

(declare-fun lt!352756 () Unit!27380)

(assert (=> b!790504 (= lt!352756 lt!352754)))

(declare-fun res!535559 () Bool)

(assert (=> b!790504 (= res!535559 (= (seekEntryOrOpen!0 (select (arr!20531 a!3186) j!159) a!3186 mask!3328) (Found!8128 j!159)))))

(assert (=> b!790504 (=> (not res!535559) (not e!439336))))

(declare-fun b!790505 () Bool)

(assert (=> b!790505 (= e!439336 call!35282)))

(declare-fun b!790506 () Bool)

(assert (=> b!790506 (= e!439338 call!35282)))

(declare-fun b!790507 () Bool)

(assert (=> b!790507 (= e!439337 e!439338)))

(declare-fun c!87883 () Bool)

(assert (=> b!790507 (= c!87883 (validKeyInArray!0 (select (arr!20531 a!3186) j!159)))))

(assert (= (and d!102831 (not res!535560)) b!790507))

(assert (= (and b!790507 c!87883) b!790504))

(assert (= (and b!790507 (not c!87883)) b!790506))

(assert (= (and b!790504 res!535559) b!790505))

(assert (= (or b!790505 b!790506) bm!35279))

(declare-fun m!730831 () Bool)

(assert (=> bm!35279 m!730831))

(assert (=> b!790504 m!730553))

(declare-fun m!730833 () Bool)

(assert (=> b!790504 m!730833))

(declare-fun m!730835 () Bool)

(assert (=> b!790504 m!730835))

(assert (=> b!790504 m!730553))

(assert (=> b!790504 m!730555))

(assert (=> b!790507 m!730553))

(assert (=> b!790507 m!730553))

(assert (=> b!790507 m!730579))

(assert (=> b!790138 d!102831))

(declare-fun d!102835 () Bool)

(assert (=> d!102835 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352759 () Unit!27380)

(declare-fun choose!38 (array!42888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27380)

(assert (=> d!102835 (= lt!352759 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102835 (validMask!0 mask!3328)))

(assert (=> d!102835 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!352759)))

(declare-fun bs!21831 () Bool)

(assert (= bs!21831 d!102835))

(assert (=> bs!21831 m!730561))

(declare-fun m!730841 () Bool)

(assert (=> bs!21831 m!730841))

(assert (=> bs!21831 m!730593))

(assert (=> b!790138 d!102835))

(check-sat (not b!790500) (not b!790504) (not b!790507) (not bm!35279) (not d!102775) (not d!102819) (not b!790334) (not d!102811) (not b!790276) (not b!790429) (not d!102835) (not d!102779) (not bm!35272) (not d!102809) (not b!790503) (not b!790280) (not b!790340) (not b!790438) (not b!790346) (not b!790261) (not b!790255) (not bm!35278) (not d!102801) (not b!790278) (not d!102803) (not d!102791) (not b!790420) (not b!790465))
(check-sat)
