; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67662 () Bool)

(assert start!67662)

(declare-fun b!783558 () Bool)

(declare-fun e!435672 () Bool)

(declare-fun e!435670 () Bool)

(assert (=> b!783558 (= e!435672 e!435670)))

(declare-fun res!530114 () Bool)

(assert (=> b!783558 (=> res!530114 e!435670)))

(declare-datatypes ((SeekEntryResult!8039 0))(
  ( (MissingZero!8039 (index!34524 (_ BitVec 32))) (Found!8039 (index!34525 (_ BitVec 32))) (Intermediate!8039 (undefined!8851 Bool) (index!34526 (_ BitVec 32)) (x!65483 (_ BitVec 32))) (Undefined!8039) (MissingVacant!8039 (index!34527 (_ BitVec 32))) )
))
(declare-fun lt!349230 () SeekEntryResult!8039)

(declare-fun lt!349224 () SeekEntryResult!8039)

(assert (=> b!783558 (= res!530114 (not (= lt!349230 lt!349224)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42702 0))(
  ( (array!42703 (arr!20439 (Array (_ BitVec 32) (_ BitVec 64))) (size!20860 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42702)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42702 (_ BitVec 32)) SeekEntryResult!8039)

(assert (=> b!783558 (= lt!349230 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20439 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783559 () Bool)

(declare-fun res!530126 () Bool)

(declare-fun e!435677 () Bool)

(assert (=> b!783559 (=> (not res!530126) (not e!435677))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783559 (= res!530126 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783560 () Bool)

(declare-fun res!530112 () Bool)

(assert (=> b!783560 (=> (not res!530112) (not e!435677))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783560 (= res!530112 (validKeyInArray!0 k!2102))))

(declare-fun b!783561 () Bool)

(declare-fun e!435676 () Bool)

(assert (=> b!783561 (= e!435676 (not e!435672))))

(declare-fun res!530117 () Bool)

(assert (=> b!783561 (=> res!530117 e!435672)))

(declare-fun lt!349229 () SeekEntryResult!8039)

(assert (=> b!783561 (= res!530117 (or (not (is-Intermediate!8039 lt!349229)) (bvslt x!1131 (x!65483 lt!349229)) (not (= x!1131 (x!65483 lt!349229))) (not (= index!1321 (index!34526 lt!349229)))))))

(declare-fun e!435680 () Bool)

(assert (=> b!783561 e!435680))

(declare-fun res!530115 () Bool)

(assert (=> b!783561 (=> (not res!530115) (not e!435680))))

(declare-fun lt!349222 () SeekEntryResult!8039)

(assert (=> b!783561 (= res!530115 (= lt!349222 lt!349224))))

(assert (=> b!783561 (= lt!349224 (Found!8039 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42702 (_ BitVec 32)) SeekEntryResult!8039)

(assert (=> b!783561 (= lt!349222 (seekEntryOrOpen!0 (select (arr!20439 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42702 (_ BitVec 32)) Bool)

(assert (=> b!783561 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27044 0))(
  ( (Unit!27045) )
))
(declare-fun lt!349228 () Unit!27044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27044)

(assert (=> b!783561 (= lt!349228 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!349232 () (_ BitVec 64))

(declare-fun lt!349221 () array!42702)

(declare-fun b!783562 () Bool)

(declare-fun e!435669 () Bool)

(assert (=> b!783562 (= e!435669 (= (seekEntryOrOpen!0 lt!349232 lt!349221 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349232 lt!349221 mask!3328)))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!783564 () Bool)

(assert (=> b!783564 (= e!435680 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20439 a!3186) j!159) a!3186 mask!3328) lt!349224))))

(declare-fun b!783565 () Bool)

(declare-fun res!530123 () Bool)

(declare-fun e!435675 () Bool)

(assert (=> b!783565 (=> (not res!530123) (not e!435675))))

(declare-fun e!435673 () Bool)

(assert (=> b!783565 (= res!530123 e!435673)))

(declare-fun c!87132 () Bool)

(assert (=> b!783565 (= c!87132 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783566 () Bool)

(assert (=> b!783566 (= e!435675 e!435676)))

(declare-fun res!530122 () Bool)

(assert (=> b!783566 (=> (not res!530122) (not e!435676))))

(declare-fun lt!349226 () SeekEntryResult!8039)

(assert (=> b!783566 (= res!530122 (= lt!349226 lt!349229))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42702 (_ BitVec 32)) SeekEntryResult!8039)

(assert (=> b!783566 (= lt!349229 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349232 lt!349221 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783566 (= lt!349226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349232 mask!3328) lt!349232 lt!349221 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783566 (= lt!349232 (select (store (arr!20439 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!783566 (= lt!349221 (array!42703 (store (arr!20439 a!3186) i!1173 k!2102) (size!20860 a!3186)))))

(declare-fun b!783567 () Bool)

(declare-fun e!435679 () Bool)

(assert (=> b!783567 (= e!435679 e!435675)))

(declare-fun res!530124 () Bool)

(assert (=> b!783567 (=> (not res!530124) (not e!435675))))

(declare-fun lt!349231 () SeekEntryResult!8039)

(assert (=> b!783567 (= res!530124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20439 a!3186) j!159) mask!3328) (select (arr!20439 a!3186) j!159) a!3186 mask!3328) lt!349231))))

(assert (=> b!783567 (= lt!349231 (Intermediate!8039 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783568 () Bool)

(declare-fun e!435678 () Bool)

(assert (=> b!783568 (= e!435670 e!435678)))

(declare-fun res!530116 () Bool)

(assert (=> b!783568 (=> res!530116 e!435678)))

(declare-fun lt!349227 () (_ BitVec 64))

(assert (=> b!783568 (= res!530116 (= lt!349227 lt!349232))))

(assert (=> b!783568 (= lt!349227 (select (store (arr!20439 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!783569 () Bool)

(declare-fun res!530120 () Bool)

(assert (=> b!783569 (=> (not res!530120) (not e!435677))))

(assert (=> b!783569 (= res!530120 (validKeyInArray!0 (select (arr!20439 a!3186) j!159)))))

(declare-fun b!783570 () Bool)

(assert (=> b!783570 (= e!435673 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20439 a!3186) j!159) a!3186 mask!3328) lt!349231))))

(declare-fun b!783571 () Bool)

(declare-fun e!435671 () Unit!27044)

(declare-fun Unit!27046 () Unit!27044)

(assert (=> b!783571 (= e!435671 Unit!27046)))

(declare-fun res!530111 () Bool)

(assert (=> start!67662 (=> (not res!530111) (not e!435677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67662 (= res!530111 (validMask!0 mask!3328))))

(assert (=> start!67662 e!435677))

(assert (=> start!67662 true))

(declare-fun array_inv!16235 (array!42702) Bool)

(assert (=> start!67662 (array_inv!16235 a!3186)))

(declare-fun b!783563 () Bool)

(assert (=> b!783563 (= e!435673 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20439 a!3186) j!159) a!3186 mask!3328) (Found!8039 j!159)))))

(declare-fun b!783572 () Bool)

(assert (=> b!783572 (= e!435677 e!435679)))

(declare-fun res!530119 () Bool)

(assert (=> b!783572 (=> (not res!530119) (not e!435679))))

(declare-fun lt!349223 () SeekEntryResult!8039)

(assert (=> b!783572 (= res!530119 (or (= lt!349223 (MissingZero!8039 i!1173)) (= lt!349223 (MissingVacant!8039 i!1173))))))

(assert (=> b!783572 (= lt!349223 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!783573 () Bool)

(assert (=> b!783573 (= e!435678 (= lt!349222 lt!349230))))

(assert (=> b!783573 e!435669))

(declare-fun res!530118 () Bool)

(assert (=> b!783573 (=> (not res!530118) (not e!435669))))

(assert (=> b!783573 (= res!530118 (= lt!349227 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349225 () Unit!27044)

(assert (=> b!783573 (= lt!349225 e!435671)))

(declare-fun c!87133 () Bool)

(assert (=> b!783573 (= c!87133 (= lt!349227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783574 () Bool)

(declare-fun res!530110 () Bool)

(assert (=> b!783574 (=> (not res!530110) (not e!435679))))

(assert (=> b!783574 (= res!530110 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20860 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20860 a!3186))))))

(declare-fun b!783575 () Bool)

(declare-fun res!530109 () Bool)

(assert (=> b!783575 (=> (not res!530109) (not e!435677))))

(assert (=> b!783575 (= res!530109 (and (= (size!20860 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20860 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20860 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783576 () Bool)

(declare-fun Unit!27047 () Unit!27044)

(assert (=> b!783576 (= e!435671 Unit!27047)))

(assert (=> b!783576 false))

(declare-fun b!783577 () Bool)

(declare-fun res!530121 () Bool)

(assert (=> b!783577 (=> (not res!530121) (not e!435675))))

(assert (=> b!783577 (= res!530121 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20439 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783578 () Bool)

(declare-fun res!530125 () Bool)

(assert (=> b!783578 (=> (not res!530125) (not e!435679))))

(assert (=> b!783578 (= res!530125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783579 () Bool)

(declare-fun res!530113 () Bool)

(assert (=> b!783579 (=> (not res!530113) (not e!435679))))

(declare-datatypes ((List!14441 0))(
  ( (Nil!14438) (Cons!14437 (h!15560 (_ BitVec 64)) (t!20756 List!14441)) )
))
(declare-fun arrayNoDuplicates!0 (array!42702 (_ BitVec 32) List!14441) Bool)

(assert (=> b!783579 (= res!530113 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14438))))

(assert (= (and start!67662 res!530111) b!783575))

(assert (= (and b!783575 res!530109) b!783569))

(assert (= (and b!783569 res!530120) b!783560))

(assert (= (and b!783560 res!530112) b!783559))

(assert (= (and b!783559 res!530126) b!783572))

(assert (= (and b!783572 res!530119) b!783578))

(assert (= (and b!783578 res!530125) b!783579))

(assert (= (and b!783579 res!530113) b!783574))

(assert (= (and b!783574 res!530110) b!783567))

(assert (= (and b!783567 res!530124) b!783577))

(assert (= (and b!783577 res!530121) b!783565))

(assert (= (and b!783565 c!87132) b!783570))

(assert (= (and b!783565 (not c!87132)) b!783563))

(assert (= (and b!783565 res!530123) b!783566))

(assert (= (and b!783566 res!530122) b!783561))

(assert (= (and b!783561 res!530115) b!783564))

(assert (= (and b!783561 (not res!530117)) b!783558))

(assert (= (and b!783558 (not res!530114)) b!783568))

(assert (= (and b!783568 (not res!530116)) b!783573))

(assert (= (and b!783573 c!87133) b!783576))

(assert (= (and b!783573 (not c!87133)) b!783571))

(assert (= (and b!783573 res!530118) b!783562))

(declare-fun m!726089 () Bool)

(assert (=> b!783566 m!726089))

(declare-fun m!726091 () Bool)

(assert (=> b!783566 m!726091))

(assert (=> b!783566 m!726089))

(declare-fun m!726093 () Bool)

(assert (=> b!783566 m!726093))

(declare-fun m!726095 () Bool)

(assert (=> b!783566 m!726095))

(declare-fun m!726097 () Bool)

(assert (=> b!783566 m!726097))

(declare-fun m!726099 () Bool)

(assert (=> b!783563 m!726099))

(assert (=> b!783563 m!726099))

(declare-fun m!726101 () Bool)

(assert (=> b!783563 m!726101))

(assert (=> b!783569 m!726099))

(assert (=> b!783569 m!726099))

(declare-fun m!726103 () Bool)

(assert (=> b!783569 m!726103))

(assert (=> b!783558 m!726099))

(assert (=> b!783558 m!726099))

(assert (=> b!783558 m!726101))

(declare-fun m!726105 () Bool)

(assert (=> b!783560 m!726105))

(assert (=> b!783570 m!726099))

(assert (=> b!783570 m!726099))

(declare-fun m!726107 () Bool)

(assert (=> b!783570 m!726107))

(assert (=> b!783567 m!726099))

(assert (=> b!783567 m!726099))

(declare-fun m!726109 () Bool)

(assert (=> b!783567 m!726109))

(assert (=> b!783567 m!726109))

(assert (=> b!783567 m!726099))

(declare-fun m!726111 () Bool)

(assert (=> b!783567 m!726111))

(declare-fun m!726113 () Bool)

(assert (=> b!783559 m!726113))

(assert (=> b!783561 m!726099))

(assert (=> b!783561 m!726099))

(declare-fun m!726115 () Bool)

(assert (=> b!783561 m!726115))

(declare-fun m!726117 () Bool)

(assert (=> b!783561 m!726117))

(declare-fun m!726119 () Bool)

(assert (=> b!783561 m!726119))

(declare-fun m!726121 () Bool)

(assert (=> b!783578 m!726121))

(declare-fun m!726123 () Bool)

(assert (=> b!783579 m!726123))

(declare-fun m!726125 () Bool)

(assert (=> b!783577 m!726125))

(declare-fun m!726127 () Bool)

(assert (=> b!783562 m!726127))

(declare-fun m!726129 () Bool)

(assert (=> b!783562 m!726129))

(assert (=> b!783568 m!726095))

(declare-fun m!726131 () Bool)

(assert (=> b!783568 m!726131))

(declare-fun m!726133 () Bool)

(assert (=> start!67662 m!726133))

(declare-fun m!726135 () Bool)

(assert (=> start!67662 m!726135))

(assert (=> b!783564 m!726099))

(assert (=> b!783564 m!726099))

(declare-fun m!726137 () Bool)

(assert (=> b!783564 m!726137))

(declare-fun m!726139 () Bool)

(assert (=> b!783572 m!726139))

(push 1)

