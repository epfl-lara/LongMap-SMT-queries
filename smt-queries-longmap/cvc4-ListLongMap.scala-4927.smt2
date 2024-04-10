; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67876 () Bool)

(assert start!67876)

(declare-fun b!789110 () Bool)

(declare-fun e!438610 () Bool)

(assert (=> b!789110 (= e!438610 true)))

(declare-fun e!438604 () Bool)

(assert (=> b!789110 e!438604))

(declare-fun res!534454 () Bool)

(assert (=> b!789110 (=> (not res!534454) (not e!438604))))

(declare-fun lt!352067 () (_ BitVec 64))

(assert (=> b!789110 (= res!534454 (= lt!352067 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27340 0))(
  ( (Unit!27341) )
))
(declare-fun lt!352073 () Unit!27340)

(declare-fun e!438609 () Unit!27340)

(assert (=> b!789110 (= lt!352073 e!438609)))

(declare-fun c!87741 () Bool)

(assert (=> b!789110 (= c!87741 (= lt!352067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789111 () Bool)

(declare-fun e!438612 () Bool)

(declare-fun e!438611 () Bool)

(assert (=> b!789111 (= e!438612 (not e!438611))))

(declare-fun res!534447 () Bool)

(assert (=> b!789111 (=> res!534447 e!438611)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8113 0))(
  ( (MissingZero!8113 (index!34820 (_ BitVec 32))) (Found!8113 (index!34821 (_ BitVec 32))) (Intermediate!8113 (undefined!8925 Bool) (index!34822 (_ BitVec 32)) (x!65758 (_ BitVec 32))) (Undefined!8113) (MissingVacant!8113 (index!34823 (_ BitVec 32))) )
))
(declare-fun lt!352069 () SeekEntryResult!8113)

(assert (=> b!789111 (= res!534447 (or (not (is-Intermediate!8113 lt!352069)) (bvslt x!1131 (x!65758 lt!352069)) (not (= x!1131 (x!65758 lt!352069))) (not (= index!1321 (index!34822 lt!352069)))))))

(declare-fun e!438608 () Bool)

(assert (=> b!789111 e!438608))

(declare-fun res!534448 () Bool)

(assert (=> b!789111 (=> (not res!534448) (not e!438608))))

(declare-fun lt!352070 () SeekEntryResult!8113)

(declare-fun lt!352066 () SeekEntryResult!8113)

(assert (=> b!789111 (= res!534448 (= lt!352070 lt!352066))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!789111 (= lt!352066 (Found!8113 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42853 0))(
  ( (array!42854 (arr!20513 (Array (_ BitVec 32) (_ BitVec 64))) (size!20934 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42853)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42853 (_ BitVec 32)) SeekEntryResult!8113)

(assert (=> b!789111 (= lt!352070 (seekEntryOrOpen!0 (select (arr!20513 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42853 (_ BitVec 32)) Bool)

(assert (=> b!789111 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352065 () Unit!27340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27340)

(assert (=> b!789111 (= lt!352065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789113 () Bool)

(declare-fun e!438603 () Bool)

(assert (=> b!789113 (= e!438611 e!438603)))

(declare-fun res!534463 () Bool)

(assert (=> b!789113 (=> res!534463 e!438603)))

(declare-fun lt!352076 () SeekEntryResult!8113)

(assert (=> b!789113 (= res!534463 (not (= lt!352076 lt!352066)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42853 (_ BitVec 32)) SeekEntryResult!8113)

(assert (=> b!789113 (= lt!352076 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20513 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789114 () Bool)

(declare-fun res!534456 () Bool)

(declare-fun e!438607 () Bool)

(assert (=> b!789114 (=> (not res!534456) (not e!438607))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789114 (= res!534456 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20513 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!438605 () Bool)

(declare-fun b!789115 () Bool)

(declare-fun lt!352074 () SeekEntryResult!8113)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42853 (_ BitVec 32)) SeekEntryResult!8113)

(assert (=> b!789115 (= e!438605 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20513 a!3186) j!159) a!3186 mask!3328) lt!352074))))

(declare-fun b!789116 () Bool)

(declare-fun res!534455 () Bool)

(declare-fun e!438614 () Bool)

(assert (=> b!789116 (=> (not res!534455) (not e!438614))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789116 (= res!534455 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789117 () Bool)

(declare-fun res!534450 () Bool)

(assert (=> b!789117 (=> (not res!534450) (not e!438614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789117 (= res!534450 (validKeyInArray!0 k!2102))))

(declare-fun b!789118 () Bool)

(declare-fun res!534449 () Bool)

(assert (=> b!789118 (=> (not res!534449) (not e!438604))))

(declare-fun lt!352068 () (_ BitVec 64))

(declare-fun lt!352071 () array!42853)

(assert (=> b!789118 (= res!534449 (= (seekEntryOrOpen!0 lt!352068 lt!352071 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352068 lt!352071 mask!3328)))))

(declare-fun b!789119 () Bool)

(declare-fun Unit!27342 () Unit!27340)

(assert (=> b!789119 (= e!438609 Unit!27342)))

(assert (=> b!789119 false))

(declare-fun b!789120 () Bool)

(declare-fun res!534459 () Bool)

(assert (=> b!789120 (=> (not res!534459) (not e!438614))))

(assert (=> b!789120 (= res!534459 (and (= (size!20934 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20934 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20934 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789121 () Bool)

(declare-fun res!534453 () Bool)

(declare-fun e!438606 () Bool)

(assert (=> b!789121 (=> (not res!534453) (not e!438606))))

(assert (=> b!789121 (= res!534453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789122 () Bool)

(assert (=> b!789122 (= e!438604 (= lt!352070 lt!352076))))

(declare-fun b!789123 () Bool)

(declare-fun res!534462 () Bool)

(assert (=> b!789123 (=> (not res!534462) (not e!438607))))

(assert (=> b!789123 (= res!534462 e!438605)))

(declare-fun c!87742 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789123 (= c!87742 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789124 () Bool)

(assert (=> b!789124 (= e!438607 e!438612)))

(declare-fun res!534457 () Bool)

(assert (=> b!789124 (=> (not res!534457) (not e!438612))))

(declare-fun lt!352075 () SeekEntryResult!8113)

(assert (=> b!789124 (= res!534457 (= lt!352075 lt!352069))))

(assert (=> b!789124 (= lt!352069 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352068 lt!352071 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789124 (= lt!352075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352068 mask!3328) lt!352068 lt!352071 mask!3328))))

(assert (=> b!789124 (= lt!352068 (select (store (arr!20513 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789124 (= lt!352071 (array!42854 (store (arr!20513 a!3186) i!1173 k!2102) (size!20934 a!3186)))))

(declare-fun b!789112 () Bool)

(assert (=> b!789112 (= e!438614 e!438606)))

(declare-fun res!534452 () Bool)

(assert (=> b!789112 (=> (not res!534452) (not e!438606))))

(declare-fun lt!352072 () SeekEntryResult!8113)

(assert (=> b!789112 (= res!534452 (or (= lt!352072 (MissingZero!8113 i!1173)) (= lt!352072 (MissingVacant!8113 i!1173))))))

(assert (=> b!789112 (= lt!352072 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!534458 () Bool)

(assert (=> start!67876 (=> (not res!534458) (not e!438614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67876 (= res!534458 (validMask!0 mask!3328))))

(assert (=> start!67876 e!438614))

(assert (=> start!67876 true))

(declare-fun array_inv!16309 (array!42853) Bool)

(assert (=> start!67876 (array_inv!16309 a!3186)))

(declare-fun b!789125 () Bool)

(assert (=> b!789125 (= e!438605 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20513 a!3186) j!159) a!3186 mask!3328) (Found!8113 j!159)))))

(declare-fun b!789126 () Bool)

(declare-fun Unit!27343 () Unit!27340)

(assert (=> b!789126 (= e!438609 Unit!27343)))

(declare-fun b!789127 () Bool)

(assert (=> b!789127 (= e!438606 e!438607)))

(declare-fun res!534464 () Bool)

(assert (=> b!789127 (=> (not res!534464) (not e!438607))))

(assert (=> b!789127 (= res!534464 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20513 a!3186) j!159) mask!3328) (select (arr!20513 a!3186) j!159) a!3186 mask!3328) lt!352074))))

(assert (=> b!789127 (= lt!352074 (Intermediate!8113 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789128 () Bool)

(assert (=> b!789128 (= e!438603 e!438610)))

(declare-fun res!534460 () Bool)

(assert (=> b!789128 (=> res!534460 e!438610)))

(assert (=> b!789128 (= res!534460 (= lt!352067 lt!352068))))

(assert (=> b!789128 (= lt!352067 (select (store (arr!20513 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!789129 () Bool)

(declare-fun res!534451 () Bool)

(assert (=> b!789129 (=> (not res!534451) (not e!438606))))

(declare-datatypes ((List!14515 0))(
  ( (Nil!14512) (Cons!14511 (h!15637 (_ BitVec 64)) (t!20830 List!14515)) )
))
(declare-fun arrayNoDuplicates!0 (array!42853 (_ BitVec 32) List!14515) Bool)

(assert (=> b!789129 (= res!534451 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14512))))

(declare-fun b!789130 () Bool)

(assert (=> b!789130 (= e!438608 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20513 a!3186) j!159) a!3186 mask!3328) lt!352066))))

(declare-fun b!789131 () Bool)

(declare-fun res!534446 () Bool)

(assert (=> b!789131 (=> (not res!534446) (not e!438614))))

(assert (=> b!789131 (= res!534446 (validKeyInArray!0 (select (arr!20513 a!3186) j!159)))))

(declare-fun b!789132 () Bool)

(declare-fun res!534461 () Bool)

(assert (=> b!789132 (=> (not res!534461) (not e!438606))))

(assert (=> b!789132 (= res!534461 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20934 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20934 a!3186))))))

(assert (= (and start!67876 res!534458) b!789120))

(assert (= (and b!789120 res!534459) b!789131))

(assert (= (and b!789131 res!534446) b!789117))

(assert (= (and b!789117 res!534450) b!789116))

(assert (= (and b!789116 res!534455) b!789112))

(assert (= (and b!789112 res!534452) b!789121))

(assert (= (and b!789121 res!534453) b!789129))

(assert (= (and b!789129 res!534451) b!789132))

(assert (= (and b!789132 res!534461) b!789127))

(assert (= (and b!789127 res!534464) b!789114))

(assert (= (and b!789114 res!534456) b!789123))

(assert (= (and b!789123 c!87742) b!789115))

(assert (= (and b!789123 (not c!87742)) b!789125))

(assert (= (and b!789123 res!534462) b!789124))

(assert (= (and b!789124 res!534457) b!789111))

(assert (= (and b!789111 res!534448) b!789130))

(assert (= (and b!789111 (not res!534447)) b!789113))

(assert (= (and b!789113 (not res!534463)) b!789128))

(assert (= (and b!789128 (not res!534460)) b!789110))

(assert (= (and b!789110 c!87741) b!789119))

(assert (= (and b!789110 (not c!87741)) b!789126))

(assert (= (and b!789110 res!534454) b!789118))

(assert (= (and b!789118 res!534449) b!789122))

(declare-fun m!730273 () Bool)

(assert (=> b!789112 m!730273))

(declare-fun m!730275 () Bool)

(assert (=> b!789113 m!730275))

(assert (=> b!789113 m!730275))

(declare-fun m!730277 () Bool)

(assert (=> b!789113 m!730277))

(declare-fun m!730279 () Bool)

(assert (=> b!789129 m!730279))

(assert (=> b!789125 m!730275))

(assert (=> b!789125 m!730275))

(assert (=> b!789125 m!730277))

(assert (=> b!789115 m!730275))

(assert (=> b!789115 m!730275))

(declare-fun m!730281 () Bool)

(assert (=> b!789115 m!730281))

(assert (=> b!789131 m!730275))

(assert (=> b!789131 m!730275))

(declare-fun m!730283 () Bool)

(assert (=> b!789131 m!730283))

(assert (=> b!789111 m!730275))

(assert (=> b!789111 m!730275))

(declare-fun m!730285 () Bool)

(assert (=> b!789111 m!730285))

(declare-fun m!730287 () Bool)

(assert (=> b!789111 m!730287))

(declare-fun m!730289 () Bool)

(assert (=> b!789111 m!730289))

(declare-fun m!730291 () Bool)

(assert (=> b!789118 m!730291))

(declare-fun m!730293 () Bool)

(assert (=> b!789118 m!730293))

(declare-fun m!730295 () Bool)

(assert (=> b!789121 m!730295))

(assert (=> b!789127 m!730275))

(assert (=> b!789127 m!730275))

(declare-fun m!730297 () Bool)

(assert (=> b!789127 m!730297))

(assert (=> b!789127 m!730297))

(assert (=> b!789127 m!730275))

(declare-fun m!730299 () Bool)

(assert (=> b!789127 m!730299))

(declare-fun m!730301 () Bool)

(assert (=> b!789114 m!730301))

(declare-fun m!730303 () Bool)

(assert (=> b!789117 m!730303))

(declare-fun m!730305 () Bool)

(assert (=> b!789128 m!730305))

(declare-fun m!730307 () Bool)

(assert (=> b!789128 m!730307))

(declare-fun m!730309 () Bool)

(assert (=> b!789116 m!730309))

(declare-fun m!730311 () Bool)

(assert (=> b!789124 m!730311))

(declare-fun m!730313 () Bool)

(assert (=> b!789124 m!730313))

(assert (=> b!789124 m!730311))

(assert (=> b!789124 m!730305))

(declare-fun m!730315 () Bool)

(assert (=> b!789124 m!730315))

(declare-fun m!730317 () Bool)

(assert (=> b!789124 m!730317))

(declare-fun m!730319 () Bool)

(assert (=> start!67876 m!730319))

(declare-fun m!730321 () Bool)

(assert (=> start!67876 m!730321))

(assert (=> b!789130 m!730275))

(assert (=> b!789130 m!730275))

(declare-fun m!730323 () Bool)

(assert (=> b!789130 m!730323))

(push 1)

