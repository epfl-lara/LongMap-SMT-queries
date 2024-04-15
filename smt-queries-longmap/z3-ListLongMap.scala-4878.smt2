; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67160 () Bool)

(assert start!67160)

(declare-fun b!776674 () Bool)

(declare-fun res!525574 () Bool)

(declare-fun e!432158 () Bool)

(assert (=> b!776674 (=> (not res!525574) (not e!432158))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776674 (= res!525574 (validKeyInArray!0 k0!2102))))

(declare-fun b!776675 () Bool)

(declare-fun e!432154 () Bool)

(assert (=> b!776675 (= e!432158 e!432154)))

(declare-fun res!525570 () Bool)

(assert (=> b!776675 (=> (not res!525570) (not e!432154))))

(declare-datatypes ((SeekEntryResult!7960 0))(
  ( (MissingZero!7960 (index!34208 (_ BitVec 32))) (Found!7960 (index!34209 (_ BitVec 32))) (Intermediate!7960 (undefined!8772 Bool) (index!34210 (_ BitVec 32)) (x!65154 (_ BitVec 32))) (Undefined!7960) (MissingVacant!7960 (index!34211 (_ BitVec 32))) )
))
(declare-fun lt!345920 () SeekEntryResult!7960)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776675 (= res!525570 (or (= lt!345920 (MissingZero!7960 i!1173)) (= lt!345920 (MissingVacant!7960 i!1173))))))

(declare-datatypes ((array!42534 0))(
  ( (array!42535 (arr!20363 (Array (_ BitVec 32) (_ BitVec 64))) (size!20784 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42534)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42534 (_ BitVec 32)) SeekEntryResult!7960)

(assert (=> b!776675 (= lt!345920 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776676 () Bool)

(declare-fun res!525577 () Bool)

(assert (=> b!776676 (=> (not res!525577) (not e!432154))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776676 (= res!525577 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20784 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20784 a!3186))))))

(declare-fun b!776677 () Bool)

(declare-fun res!525566 () Bool)

(declare-fun e!432160 () Bool)

(assert (=> b!776677 (=> res!525566 e!432160)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42534 (_ BitVec 32)) SeekEntryResult!7960)

(assert (=> b!776677 (= res!525566 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) (Found!7960 j!159))))))

(declare-fun e!432155 () Bool)

(declare-fun b!776678 () Bool)

(assert (=> b!776678 (= e!432155 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) (Found!7960 j!159)))))

(declare-fun res!525573 () Bool)

(assert (=> start!67160 (=> (not res!525573) (not e!432158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67160 (= res!525573 (validMask!0 mask!3328))))

(assert (=> start!67160 e!432158))

(assert (=> start!67160 true))

(declare-fun array_inv!16246 (array!42534) Bool)

(assert (=> start!67160 (array_inv!16246 a!3186)))

(declare-fun b!776679 () Bool)

(declare-fun res!525569 () Bool)

(declare-fun e!432157 () Bool)

(assert (=> b!776679 (=> (not res!525569) (not e!432157))))

(assert (=> b!776679 (= res!525569 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20363 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!432153 () Bool)

(declare-fun lt!345924 () SeekEntryResult!7960)

(declare-fun b!776680 () Bool)

(assert (=> b!776680 (= e!432153 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!345924))))

(declare-fun b!776681 () Bool)

(declare-fun res!525562 () Bool)

(assert (=> b!776681 (=> (not res!525562) (not e!432158))))

(assert (=> b!776681 (= res!525562 (and (= (size!20784 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20784 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20784 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776682 () Bool)

(declare-fun res!525578 () Bool)

(assert (=> b!776682 (=> (not res!525578) (not e!432158))))

(declare-fun arrayContainsKey!0 (array!42534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776682 (= res!525578 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!345926 () SeekEntryResult!7960)

(declare-fun b!776683 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42534 (_ BitVec 32)) SeekEntryResult!7960)

(assert (=> b!776683 (= e!432155 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!345926))))

(declare-fun b!776684 () Bool)

(declare-fun e!432152 () Bool)

(assert (=> b!776684 (= e!432152 (not e!432160))))

(declare-fun res!525565 () Bool)

(assert (=> b!776684 (=> res!525565 e!432160)))

(declare-fun lt!345923 () SeekEntryResult!7960)

(get-info :version)

(assert (=> b!776684 (= res!525565 (or (not ((_ is Intermediate!7960) lt!345923)) (bvslt x!1131 (x!65154 lt!345923)) (not (= x!1131 (x!65154 lt!345923))) (not (= index!1321 (index!34210 lt!345923)))))))

(declare-fun e!432159 () Bool)

(assert (=> b!776684 e!432159))

(declare-fun res!525567 () Bool)

(assert (=> b!776684 (=> (not res!525567) (not e!432159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42534 (_ BitVec 32)) Bool)

(assert (=> b!776684 (= res!525567 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26786 0))(
  ( (Unit!26787) )
))
(declare-fun lt!345921 () Unit!26786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26786)

(assert (=> b!776684 (= lt!345921 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!345925 () array!42534)

(declare-fun b!776685 () Bool)

(declare-fun lt!345919 () (_ BitVec 64))

(assert (=> b!776685 (= e!432160 (= (seekEntryOrOpen!0 lt!345919 lt!345925 mask!3328) (Found!7960 index!1321)))))

(declare-fun b!776686 () Bool)

(assert (=> b!776686 (= e!432159 e!432153)))

(declare-fun res!525572 () Bool)

(assert (=> b!776686 (=> (not res!525572) (not e!432153))))

(assert (=> b!776686 (= res!525572 (= (seekEntryOrOpen!0 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!345924))))

(assert (=> b!776686 (= lt!345924 (Found!7960 j!159))))

(declare-fun b!776687 () Bool)

(assert (=> b!776687 (= e!432154 e!432157)))

(declare-fun res!525576 () Bool)

(assert (=> b!776687 (=> (not res!525576) (not e!432157))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776687 (= res!525576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20363 a!3186) j!159) mask!3328) (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!345926))))

(assert (=> b!776687 (= lt!345926 (Intermediate!7960 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776688 () Bool)

(declare-fun res!525564 () Bool)

(assert (=> b!776688 (=> (not res!525564) (not e!432154))))

(declare-datatypes ((List!14404 0))(
  ( (Nil!14401) (Cons!14400 (h!15508 (_ BitVec 64)) (t!20710 List!14404)) )
))
(declare-fun arrayNoDuplicates!0 (array!42534 (_ BitVec 32) List!14404) Bool)

(assert (=> b!776688 (= res!525564 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14401))))

(declare-fun b!776689 () Bool)

(declare-fun res!525579 () Bool)

(assert (=> b!776689 (=> (not res!525579) (not e!432154))))

(assert (=> b!776689 (= res!525579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776690 () Bool)

(declare-fun res!525571 () Bool)

(assert (=> b!776690 (=> (not res!525571) (not e!432157))))

(assert (=> b!776690 (= res!525571 e!432155)))

(declare-fun c!85956 () Bool)

(assert (=> b!776690 (= c!85956 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776691 () Bool)

(declare-fun res!525575 () Bool)

(assert (=> b!776691 (=> (not res!525575) (not e!432158))))

(assert (=> b!776691 (= res!525575 (validKeyInArray!0 (select (arr!20363 a!3186) j!159)))))

(declare-fun b!776692 () Bool)

(declare-fun res!525568 () Bool)

(assert (=> b!776692 (=> res!525568 e!432160)))

(assert (=> b!776692 (= res!525568 (or (not (= (select (store (arr!20363 a!3186) i!1173 k0!2102) index!1321) lt!345919)) (undefined!8772 lt!345923)))))

(declare-fun b!776693 () Bool)

(assert (=> b!776693 (= e!432157 e!432152)))

(declare-fun res!525563 () Bool)

(assert (=> b!776693 (=> (not res!525563) (not e!432152))))

(declare-fun lt!345922 () SeekEntryResult!7960)

(assert (=> b!776693 (= res!525563 (= lt!345922 lt!345923))))

(assert (=> b!776693 (= lt!345923 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345919 lt!345925 mask!3328))))

(assert (=> b!776693 (= lt!345922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345919 mask!3328) lt!345919 lt!345925 mask!3328))))

(assert (=> b!776693 (= lt!345919 (select (store (arr!20363 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776693 (= lt!345925 (array!42535 (store (arr!20363 a!3186) i!1173 k0!2102) (size!20784 a!3186)))))

(assert (= (and start!67160 res!525573) b!776681))

(assert (= (and b!776681 res!525562) b!776691))

(assert (= (and b!776691 res!525575) b!776674))

(assert (= (and b!776674 res!525574) b!776682))

(assert (= (and b!776682 res!525578) b!776675))

(assert (= (and b!776675 res!525570) b!776689))

(assert (= (and b!776689 res!525579) b!776688))

(assert (= (and b!776688 res!525564) b!776676))

(assert (= (and b!776676 res!525577) b!776687))

(assert (= (and b!776687 res!525576) b!776679))

(assert (= (and b!776679 res!525569) b!776690))

(assert (= (and b!776690 c!85956) b!776683))

(assert (= (and b!776690 (not c!85956)) b!776678))

(assert (= (and b!776690 res!525571) b!776693))

(assert (= (and b!776693 res!525563) b!776684))

(assert (= (and b!776684 res!525567) b!776686))

(assert (= (and b!776686 res!525572) b!776680))

(assert (= (and b!776684 (not res!525565)) b!776677))

(assert (= (and b!776677 (not res!525566)) b!776692))

(assert (= (and b!776692 (not res!525568)) b!776685))

(declare-fun m!720171 () Bool)

(assert (=> b!776689 m!720171))

(declare-fun m!720173 () Bool)

(assert (=> b!776688 m!720173))

(declare-fun m!720175 () Bool)

(assert (=> b!776680 m!720175))

(assert (=> b!776680 m!720175))

(declare-fun m!720177 () Bool)

(assert (=> b!776680 m!720177))

(declare-fun m!720179 () Bool)

(assert (=> b!776682 m!720179))

(declare-fun m!720181 () Bool)

(assert (=> b!776674 m!720181))

(assert (=> b!776686 m!720175))

(assert (=> b!776686 m!720175))

(declare-fun m!720183 () Bool)

(assert (=> b!776686 m!720183))

(declare-fun m!720185 () Bool)

(assert (=> b!776685 m!720185))

(assert (=> b!776687 m!720175))

(assert (=> b!776687 m!720175))

(declare-fun m!720187 () Bool)

(assert (=> b!776687 m!720187))

(assert (=> b!776687 m!720187))

(assert (=> b!776687 m!720175))

(declare-fun m!720189 () Bool)

(assert (=> b!776687 m!720189))

(assert (=> b!776677 m!720175))

(assert (=> b!776677 m!720175))

(declare-fun m!720191 () Bool)

(assert (=> b!776677 m!720191))

(declare-fun m!720193 () Bool)

(assert (=> start!67160 m!720193))

(declare-fun m!720195 () Bool)

(assert (=> start!67160 m!720195))

(declare-fun m!720197 () Bool)

(assert (=> b!776679 m!720197))

(assert (=> b!776678 m!720175))

(assert (=> b!776678 m!720175))

(assert (=> b!776678 m!720191))

(assert (=> b!776691 m!720175))

(assert (=> b!776691 m!720175))

(declare-fun m!720199 () Bool)

(assert (=> b!776691 m!720199))

(declare-fun m!720201 () Bool)

(assert (=> b!776693 m!720201))

(declare-fun m!720203 () Bool)

(assert (=> b!776693 m!720203))

(declare-fun m!720205 () Bool)

(assert (=> b!776693 m!720205))

(assert (=> b!776693 m!720201))

(declare-fun m!720207 () Bool)

(assert (=> b!776693 m!720207))

(declare-fun m!720209 () Bool)

(assert (=> b!776693 m!720209))

(assert (=> b!776683 m!720175))

(assert (=> b!776683 m!720175))

(declare-fun m!720211 () Bool)

(assert (=> b!776683 m!720211))

(assert (=> b!776692 m!720203))

(declare-fun m!720213 () Bool)

(assert (=> b!776692 m!720213))

(declare-fun m!720215 () Bool)

(assert (=> b!776684 m!720215))

(declare-fun m!720217 () Bool)

(assert (=> b!776684 m!720217))

(declare-fun m!720219 () Bool)

(assert (=> b!776675 m!720219))

(check-sat (not b!776685) (not b!776683) (not b!776677) (not b!776693) (not b!776680) (not b!776687) (not b!776678) (not b!776684) (not start!67160) (not b!776686) (not b!776691) (not b!776682) (not b!776674) (not b!776688) (not b!776675) (not b!776689))
(check-sat)
(get-model)

(declare-fun e!432228 () SeekEntryResult!7960)

(declare-fun b!776832 () Bool)

(assert (=> b!776832 (= e!432228 (Intermediate!7960 true (toIndex!0 (select (arr!20363 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!776833 () Bool)

(declare-fun lt!345980 () SeekEntryResult!7960)

(assert (=> b!776833 (and (bvsge (index!34210 lt!345980) #b00000000000000000000000000000000) (bvslt (index!34210 lt!345980) (size!20784 a!3186)))))

(declare-fun e!432226 () Bool)

(assert (=> b!776833 (= e!432226 (= (select (arr!20363 a!3186) (index!34210 lt!345980)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!776834 () Bool)

(declare-fun e!432229 () SeekEntryResult!7960)

(assert (=> b!776834 (= e!432228 e!432229)))

(declare-fun c!85970 () Bool)

(declare-fun lt!345979 () (_ BitVec 64))

(assert (=> b!776834 (= c!85970 (or (= lt!345979 (select (arr!20363 a!3186) j!159)) (= (bvadd lt!345979 lt!345979) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776835 () Bool)

(assert (=> b!776835 (= e!432229 (Intermediate!7960 false (toIndex!0 (select (arr!20363 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!776836 () Bool)

(declare-fun e!432227 () Bool)

(declare-fun e!432225 () Bool)

(assert (=> b!776836 (= e!432227 e!432225)))

(declare-fun res!525695 () Bool)

(assert (=> b!776836 (= res!525695 (and ((_ is Intermediate!7960) lt!345980) (not (undefined!8772 lt!345980)) (bvslt (x!65154 lt!345980) #b01111111111111111111111111111110) (bvsge (x!65154 lt!345980) #b00000000000000000000000000000000) (bvsge (x!65154 lt!345980) #b00000000000000000000000000000000)))))

(assert (=> b!776836 (=> (not res!525695) (not e!432225))))

(declare-fun d!101943 () Bool)

(assert (=> d!101943 e!432227))

(declare-fun c!85969 () Bool)

(assert (=> d!101943 (= c!85969 (and ((_ is Intermediate!7960) lt!345980) (undefined!8772 lt!345980)))))

(assert (=> d!101943 (= lt!345980 e!432228)))

(declare-fun c!85971 () Bool)

(assert (=> d!101943 (= c!85971 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101943 (= lt!345979 (select (arr!20363 a!3186) (toIndex!0 (select (arr!20363 a!3186) j!159) mask!3328)))))

(assert (=> d!101943 (validMask!0 mask!3328)))

(assert (=> d!101943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20363 a!3186) j!159) mask!3328) (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!345980)))

(declare-fun b!776837 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776837 (= e!432229 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20363 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20363 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776838 () Bool)

(assert (=> b!776838 (and (bvsge (index!34210 lt!345980) #b00000000000000000000000000000000) (bvslt (index!34210 lt!345980) (size!20784 a!3186)))))

(declare-fun res!525696 () Bool)

(assert (=> b!776838 (= res!525696 (= (select (arr!20363 a!3186) (index!34210 lt!345980)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!776838 (=> res!525696 e!432226)))

(declare-fun b!776839 () Bool)

(assert (=> b!776839 (and (bvsge (index!34210 lt!345980) #b00000000000000000000000000000000) (bvslt (index!34210 lt!345980) (size!20784 a!3186)))))

(declare-fun res!525694 () Bool)

(assert (=> b!776839 (= res!525694 (= (select (arr!20363 a!3186) (index!34210 lt!345980)) (select (arr!20363 a!3186) j!159)))))

(assert (=> b!776839 (=> res!525694 e!432226)))

(assert (=> b!776839 (= e!432225 e!432226)))

(declare-fun b!776840 () Bool)

(assert (=> b!776840 (= e!432227 (bvsge (x!65154 lt!345980) #b01111111111111111111111111111110))))

(assert (= (and d!101943 c!85971) b!776832))

(assert (= (and d!101943 (not c!85971)) b!776834))

(assert (= (and b!776834 c!85970) b!776835))

(assert (= (and b!776834 (not c!85970)) b!776837))

(assert (= (and d!101943 c!85969) b!776840))

(assert (= (and d!101943 (not c!85969)) b!776836))

(assert (= (and b!776836 res!525695) b!776839))

(assert (= (and b!776839 (not res!525694)) b!776838))

(assert (= (and b!776838 (not res!525696)) b!776833))

(declare-fun m!720321 () Bool)

(assert (=> b!776838 m!720321))

(assert (=> b!776839 m!720321))

(assert (=> b!776833 m!720321))

(assert (=> b!776837 m!720187))

(declare-fun m!720323 () Bool)

(assert (=> b!776837 m!720323))

(assert (=> b!776837 m!720323))

(assert (=> b!776837 m!720175))

(declare-fun m!720325 () Bool)

(assert (=> b!776837 m!720325))

(assert (=> d!101943 m!720187))

(declare-fun m!720327 () Bool)

(assert (=> d!101943 m!720327))

(assert (=> d!101943 m!720193))

(assert (=> b!776687 d!101943))

(declare-fun d!101945 () Bool)

(declare-fun lt!345986 () (_ BitVec 32))

(declare-fun lt!345985 () (_ BitVec 32))

(assert (=> d!101945 (= lt!345986 (bvmul (bvxor lt!345985 (bvlshr lt!345985 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101945 (= lt!345985 ((_ extract 31 0) (bvand (bvxor (select (arr!20363 a!3186) j!159) (bvlshr (select (arr!20363 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101945 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!525697 (let ((h!15511 ((_ extract 31 0) (bvand (bvxor (select (arr!20363 a!3186) j!159) (bvlshr (select (arr!20363 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65158 (bvmul (bvxor h!15511 (bvlshr h!15511 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65158 (bvlshr x!65158 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!525697 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!525697 #b00000000000000000000000000000000))))))

(assert (=> d!101945 (= (toIndex!0 (select (arr!20363 a!3186) j!159) mask!3328) (bvand (bvxor lt!345986 (bvlshr lt!345986 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!776687 d!101945))

(declare-fun b!776853 () Bool)

(declare-fun e!432238 () SeekEntryResult!7960)

(declare-fun lt!345994 () SeekEntryResult!7960)

(assert (=> b!776853 (= e!432238 (MissingZero!7960 (index!34210 lt!345994)))))

(declare-fun d!101947 () Bool)

(declare-fun lt!345993 () SeekEntryResult!7960)

(assert (=> d!101947 (and (or ((_ is Undefined!7960) lt!345993) (not ((_ is Found!7960) lt!345993)) (and (bvsge (index!34209 lt!345993) #b00000000000000000000000000000000) (bvslt (index!34209 lt!345993) (size!20784 lt!345925)))) (or ((_ is Undefined!7960) lt!345993) ((_ is Found!7960) lt!345993) (not ((_ is MissingZero!7960) lt!345993)) (and (bvsge (index!34208 lt!345993) #b00000000000000000000000000000000) (bvslt (index!34208 lt!345993) (size!20784 lt!345925)))) (or ((_ is Undefined!7960) lt!345993) ((_ is Found!7960) lt!345993) ((_ is MissingZero!7960) lt!345993) (not ((_ is MissingVacant!7960) lt!345993)) (and (bvsge (index!34211 lt!345993) #b00000000000000000000000000000000) (bvslt (index!34211 lt!345993) (size!20784 lt!345925)))) (or ((_ is Undefined!7960) lt!345993) (ite ((_ is Found!7960) lt!345993) (= (select (arr!20363 lt!345925) (index!34209 lt!345993)) lt!345919) (ite ((_ is MissingZero!7960) lt!345993) (= (select (arr!20363 lt!345925) (index!34208 lt!345993)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7960) lt!345993) (= (select (arr!20363 lt!345925) (index!34211 lt!345993)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!432237 () SeekEntryResult!7960)

(assert (=> d!101947 (= lt!345993 e!432237)))

(declare-fun c!85978 () Bool)

(assert (=> d!101947 (= c!85978 (and ((_ is Intermediate!7960) lt!345994) (undefined!8772 lt!345994)))))

(assert (=> d!101947 (= lt!345994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345919 mask!3328) lt!345919 lt!345925 mask!3328))))

(assert (=> d!101947 (validMask!0 mask!3328)))

(assert (=> d!101947 (= (seekEntryOrOpen!0 lt!345919 lt!345925 mask!3328) lt!345993)))

(declare-fun b!776854 () Bool)

(assert (=> b!776854 (= e!432237 Undefined!7960)))

(declare-fun b!776855 () Bool)

(declare-fun e!432236 () SeekEntryResult!7960)

(assert (=> b!776855 (= e!432236 (Found!7960 (index!34210 lt!345994)))))

(declare-fun b!776856 () Bool)

(assert (=> b!776856 (= e!432237 e!432236)))

(declare-fun lt!345995 () (_ BitVec 64))

(assert (=> b!776856 (= lt!345995 (select (arr!20363 lt!345925) (index!34210 lt!345994)))))

(declare-fun c!85979 () Bool)

(assert (=> b!776856 (= c!85979 (= lt!345995 lt!345919))))

(declare-fun b!776857 () Bool)

(declare-fun c!85980 () Bool)

(assert (=> b!776857 (= c!85980 (= lt!345995 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!776857 (= e!432236 e!432238)))

(declare-fun b!776858 () Bool)

(assert (=> b!776858 (= e!432238 (seekKeyOrZeroReturnVacant!0 (x!65154 lt!345994) (index!34210 lt!345994) (index!34210 lt!345994) lt!345919 lt!345925 mask!3328))))

(assert (= (and d!101947 c!85978) b!776854))

(assert (= (and d!101947 (not c!85978)) b!776856))

(assert (= (and b!776856 c!85979) b!776855))

(assert (= (and b!776856 (not c!85979)) b!776857))

(assert (= (and b!776857 c!85980) b!776853))

(assert (= (and b!776857 (not c!85980)) b!776858))

(assert (=> d!101947 m!720193))

(declare-fun m!720329 () Bool)

(assert (=> d!101947 m!720329))

(assert (=> d!101947 m!720201))

(assert (=> d!101947 m!720201))

(assert (=> d!101947 m!720207))

(declare-fun m!720331 () Bool)

(assert (=> d!101947 m!720331))

(declare-fun m!720333 () Bool)

(assert (=> d!101947 m!720333))

(declare-fun m!720335 () Bool)

(assert (=> b!776856 m!720335))

(declare-fun m!720337 () Bool)

(assert (=> b!776858 m!720337))

(assert (=> b!776685 d!101947))

(declare-fun b!776859 () Bool)

(declare-fun e!432241 () SeekEntryResult!7960)

(declare-fun lt!345997 () SeekEntryResult!7960)

(assert (=> b!776859 (= e!432241 (MissingZero!7960 (index!34210 lt!345997)))))

(declare-fun d!101951 () Bool)

(declare-fun lt!345996 () SeekEntryResult!7960)

(assert (=> d!101951 (and (or ((_ is Undefined!7960) lt!345996) (not ((_ is Found!7960) lt!345996)) (and (bvsge (index!34209 lt!345996) #b00000000000000000000000000000000) (bvslt (index!34209 lt!345996) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!345996) ((_ is Found!7960) lt!345996) (not ((_ is MissingZero!7960) lt!345996)) (and (bvsge (index!34208 lt!345996) #b00000000000000000000000000000000) (bvslt (index!34208 lt!345996) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!345996) ((_ is Found!7960) lt!345996) ((_ is MissingZero!7960) lt!345996) (not ((_ is MissingVacant!7960) lt!345996)) (and (bvsge (index!34211 lt!345996) #b00000000000000000000000000000000) (bvslt (index!34211 lt!345996) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!345996) (ite ((_ is Found!7960) lt!345996) (= (select (arr!20363 a!3186) (index!34209 lt!345996)) k0!2102) (ite ((_ is MissingZero!7960) lt!345996) (= (select (arr!20363 a!3186) (index!34208 lt!345996)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7960) lt!345996) (= (select (arr!20363 a!3186) (index!34211 lt!345996)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!432240 () SeekEntryResult!7960)

(assert (=> d!101951 (= lt!345996 e!432240)))

(declare-fun c!85981 () Bool)

(assert (=> d!101951 (= c!85981 (and ((_ is Intermediate!7960) lt!345997) (undefined!8772 lt!345997)))))

(assert (=> d!101951 (= lt!345997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101951 (validMask!0 mask!3328)))

(assert (=> d!101951 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!345996)))

(declare-fun b!776860 () Bool)

(assert (=> b!776860 (= e!432240 Undefined!7960)))

(declare-fun b!776861 () Bool)

(declare-fun e!432239 () SeekEntryResult!7960)

(assert (=> b!776861 (= e!432239 (Found!7960 (index!34210 lt!345997)))))

(declare-fun b!776862 () Bool)

(assert (=> b!776862 (= e!432240 e!432239)))

(declare-fun lt!345998 () (_ BitVec 64))

(assert (=> b!776862 (= lt!345998 (select (arr!20363 a!3186) (index!34210 lt!345997)))))

(declare-fun c!85982 () Bool)

(assert (=> b!776862 (= c!85982 (= lt!345998 k0!2102))))

(declare-fun b!776863 () Bool)

(declare-fun c!85983 () Bool)

(assert (=> b!776863 (= c!85983 (= lt!345998 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!776863 (= e!432239 e!432241)))

(declare-fun b!776864 () Bool)

(assert (=> b!776864 (= e!432241 (seekKeyOrZeroReturnVacant!0 (x!65154 lt!345997) (index!34210 lt!345997) (index!34210 lt!345997) k0!2102 a!3186 mask!3328))))

(assert (= (and d!101951 c!85981) b!776860))

(assert (= (and d!101951 (not c!85981)) b!776862))

(assert (= (and b!776862 c!85982) b!776861))

(assert (= (and b!776862 (not c!85982)) b!776863))

(assert (= (and b!776863 c!85983) b!776859))

(assert (= (and b!776863 (not c!85983)) b!776864))

(assert (=> d!101951 m!720193))

(declare-fun m!720339 () Bool)

(assert (=> d!101951 m!720339))

(declare-fun m!720341 () Bool)

(assert (=> d!101951 m!720341))

(assert (=> d!101951 m!720341))

(declare-fun m!720343 () Bool)

(assert (=> d!101951 m!720343))

(declare-fun m!720345 () Bool)

(assert (=> d!101951 m!720345))

(declare-fun m!720347 () Bool)

(assert (=> d!101951 m!720347))

(declare-fun m!720349 () Bool)

(assert (=> b!776862 m!720349))

(declare-fun m!720351 () Bool)

(assert (=> b!776864 m!720351))

(assert (=> b!776675 d!101951))

(declare-fun b!776865 () Bool)

(declare-fun e!432244 () SeekEntryResult!7960)

(declare-fun lt!346000 () SeekEntryResult!7960)

(assert (=> b!776865 (= e!432244 (MissingZero!7960 (index!34210 lt!346000)))))

(declare-fun d!101953 () Bool)

(declare-fun lt!345999 () SeekEntryResult!7960)

(assert (=> d!101953 (and (or ((_ is Undefined!7960) lt!345999) (not ((_ is Found!7960) lt!345999)) (and (bvsge (index!34209 lt!345999) #b00000000000000000000000000000000) (bvslt (index!34209 lt!345999) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!345999) ((_ is Found!7960) lt!345999) (not ((_ is MissingZero!7960) lt!345999)) (and (bvsge (index!34208 lt!345999) #b00000000000000000000000000000000) (bvslt (index!34208 lt!345999) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!345999) ((_ is Found!7960) lt!345999) ((_ is MissingZero!7960) lt!345999) (not ((_ is MissingVacant!7960) lt!345999)) (and (bvsge (index!34211 lt!345999) #b00000000000000000000000000000000) (bvslt (index!34211 lt!345999) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!345999) (ite ((_ is Found!7960) lt!345999) (= (select (arr!20363 a!3186) (index!34209 lt!345999)) (select (arr!20363 a!3186) j!159)) (ite ((_ is MissingZero!7960) lt!345999) (= (select (arr!20363 a!3186) (index!34208 lt!345999)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7960) lt!345999) (= (select (arr!20363 a!3186) (index!34211 lt!345999)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!432243 () SeekEntryResult!7960)

(assert (=> d!101953 (= lt!345999 e!432243)))

(declare-fun c!85984 () Bool)

(assert (=> d!101953 (= c!85984 (and ((_ is Intermediate!7960) lt!346000) (undefined!8772 lt!346000)))))

(assert (=> d!101953 (= lt!346000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20363 a!3186) j!159) mask!3328) (select (arr!20363 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101953 (validMask!0 mask!3328)))

(assert (=> d!101953 (= (seekEntryOrOpen!0 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!345999)))

(declare-fun b!776866 () Bool)

(assert (=> b!776866 (= e!432243 Undefined!7960)))

(declare-fun b!776867 () Bool)

(declare-fun e!432242 () SeekEntryResult!7960)

(assert (=> b!776867 (= e!432242 (Found!7960 (index!34210 lt!346000)))))

(declare-fun b!776868 () Bool)

(assert (=> b!776868 (= e!432243 e!432242)))

(declare-fun lt!346001 () (_ BitVec 64))

(assert (=> b!776868 (= lt!346001 (select (arr!20363 a!3186) (index!34210 lt!346000)))))

(declare-fun c!85985 () Bool)

(assert (=> b!776868 (= c!85985 (= lt!346001 (select (arr!20363 a!3186) j!159)))))

(declare-fun b!776869 () Bool)

(declare-fun c!85986 () Bool)

(assert (=> b!776869 (= c!85986 (= lt!346001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!776869 (= e!432242 e!432244)))

(declare-fun b!776870 () Bool)

(assert (=> b!776870 (= e!432244 (seekKeyOrZeroReturnVacant!0 (x!65154 lt!346000) (index!34210 lt!346000) (index!34210 lt!346000) (select (arr!20363 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101953 c!85984) b!776866))

(assert (= (and d!101953 (not c!85984)) b!776868))

(assert (= (and b!776868 c!85985) b!776867))

(assert (= (and b!776868 (not c!85985)) b!776869))

(assert (= (and b!776869 c!85986) b!776865))

(assert (= (and b!776869 (not c!85986)) b!776870))

(assert (=> d!101953 m!720193))

(declare-fun m!720353 () Bool)

(assert (=> d!101953 m!720353))

(assert (=> d!101953 m!720175))

(assert (=> d!101953 m!720187))

(assert (=> d!101953 m!720187))

(assert (=> d!101953 m!720175))

(assert (=> d!101953 m!720189))

(declare-fun m!720355 () Bool)

(assert (=> d!101953 m!720355))

(declare-fun m!720357 () Bool)

(assert (=> d!101953 m!720357))

(declare-fun m!720359 () Bool)

(assert (=> b!776868 m!720359))

(assert (=> b!776870 m!720175))

(declare-fun m!720361 () Bool)

(assert (=> b!776870 m!720361))

(assert (=> b!776686 d!101953))

(declare-fun call!35149 () Bool)

(declare-fun bm!35146 () Bool)

(assert (=> bm!35146 (= call!35149 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!776898 () Bool)

(declare-fun e!432260 () Bool)

(declare-fun e!432261 () Bool)

(assert (=> b!776898 (= e!432260 e!432261)))

(declare-fun c!85998 () Bool)

(assert (=> b!776898 (= c!85998 (validKeyInArray!0 (select (arr!20363 a!3186) j!159)))))

(declare-fun b!776899 () Bool)

(assert (=> b!776899 (= e!432261 call!35149)))

(declare-fun b!776900 () Bool)

(declare-fun e!432262 () Bool)

(assert (=> b!776900 (= e!432261 e!432262)))

(declare-fun lt!346015 () (_ BitVec 64))

(assert (=> b!776900 (= lt!346015 (select (arr!20363 a!3186) j!159))))

(declare-fun lt!346014 () Unit!26786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42534 (_ BitVec 64) (_ BitVec 32)) Unit!26786)

(assert (=> b!776900 (= lt!346014 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346015 j!159))))

(assert (=> b!776900 (arrayContainsKey!0 a!3186 lt!346015 #b00000000000000000000000000000000)))

(declare-fun lt!346016 () Unit!26786)

(assert (=> b!776900 (= lt!346016 lt!346014)))

(declare-fun res!525702 () Bool)

(assert (=> b!776900 (= res!525702 (= (seekEntryOrOpen!0 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) (Found!7960 j!159)))))

(assert (=> b!776900 (=> (not res!525702) (not e!432262))))

(declare-fun b!776897 () Bool)

(assert (=> b!776897 (= e!432262 call!35149)))

(declare-fun d!101955 () Bool)

(declare-fun res!525703 () Bool)

(assert (=> d!101955 (=> res!525703 e!432260)))

(assert (=> d!101955 (= res!525703 (bvsge j!159 (size!20784 a!3186)))))

(assert (=> d!101955 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!432260)))

(assert (= (and d!101955 (not res!525703)) b!776898))

(assert (= (and b!776898 c!85998) b!776900))

(assert (= (and b!776898 (not c!85998)) b!776899))

(assert (= (and b!776900 res!525702) b!776897))

(assert (= (or b!776897 b!776899) bm!35146))

(declare-fun m!720373 () Bool)

(assert (=> bm!35146 m!720373))

(assert (=> b!776898 m!720175))

(assert (=> b!776898 m!720175))

(assert (=> b!776898 m!720199))

(assert (=> b!776900 m!720175))

(declare-fun m!720375 () Bool)

(assert (=> b!776900 m!720375))

(declare-fun m!720377 () Bool)

(assert (=> b!776900 m!720377))

(assert (=> b!776900 m!720175))

(assert (=> b!776900 m!720183))

(assert (=> b!776684 d!101955))

(declare-fun d!101959 () Bool)

(assert (=> d!101959 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!346019 () Unit!26786)

(declare-fun choose!38 (array!42534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26786)

(assert (=> d!101959 (= lt!346019 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101959 (validMask!0 mask!3328)))

(assert (=> d!101959 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!346019)))

(declare-fun bs!21645 () Bool)

(assert (= bs!21645 d!101959))

(assert (=> bs!21645 m!720215))

(declare-fun m!720379 () Bool)

(assert (=> bs!21645 m!720379))

(assert (=> bs!21645 m!720193))

(assert (=> b!776684 d!101959))

(declare-fun d!101961 () Bool)

(assert (=> d!101961 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67160 d!101961))

(declare-fun d!101965 () Bool)

(assert (=> d!101965 (= (array_inv!16246 a!3186) (bvsge (size!20784 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67160 d!101965))

(declare-fun d!101967 () Bool)

(assert (=> d!101967 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!776674 d!101967))

(declare-fun b!776919 () Bool)

(declare-fun e!432276 () SeekEntryResult!7960)

(assert (=> b!776919 (= e!432276 (Intermediate!7960 true index!1321 x!1131))))

(declare-fun b!776920 () Bool)

(declare-fun lt!346025 () SeekEntryResult!7960)

(assert (=> b!776920 (and (bvsge (index!34210 lt!346025) #b00000000000000000000000000000000) (bvslt (index!34210 lt!346025) (size!20784 lt!345925)))))

(declare-fun e!432274 () Bool)

(assert (=> b!776920 (= e!432274 (= (select (arr!20363 lt!345925) (index!34210 lt!346025)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!776921 () Bool)

(declare-fun e!432277 () SeekEntryResult!7960)

(assert (=> b!776921 (= e!432276 e!432277)))

(declare-fun c!86006 () Bool)

(declare-fun lt!346024 () (_ BitVec 64))

(assert (=> b!776921 (= c!86006 (or (= lt!346024 lt!345919) (= (bvadd lt!346024 lt!346024) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776922 () Bool)

(assert (=> b!776922 (= e!432277 (Intermediate!7960 false index!1321 x!1131))))

(declare-fun b!776923 () Bool)

(declare-fun e!432275 () Bool)

(declare-fun e!432273 () Bool)

(assert (=> b!776923 (= e!432275 e!432273)))

(declare-fun res!525711 () Bool)

(assert (=> b!776923 (= res!525711 (and ((_ is Intermediate!7960) lt!346025) (not (undefined!8772 lt!346025)) (bvslt (x!65154 lt!346025) #b01111111111111111111111111111110) (bvsge (x!65154 lt!346025) #b00000000000000000000000000000000) (bvsge (x!65154 lt!346025) x!1131)))))

(assert (=> b!776923 (=> (not res!525711) (not e!432273))))

(declare-fun d!101969 () Bool)

(assert (=> d!101969 e!432275))

(declare-fun c!86005 () Bool)

(assert (=> d!101969 (= c!86005 (and ((_ is Intermediate!7960) lt!346025) (undefined!8772 lt!346025)))))

(assert (=> d!101969 (= lt!346025 e!432276)))

(declare-fun c!86007 () Bool)

(assert (=> d!101969 (= c!86007 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101969 (= lt!346024 (select (arr!20363 lt!345925) index!1321))))

(assert (=> d!101969 (validMask!0 mask!3328)))

(assert (=> d!101969 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345919 lt!345925 mask!3328) lt!346025)))

(declare-fun b!776924 () Bool)

(assert (=> b!776924 (= e!432277 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!345919 lt!345925 mask!3328))))

(declare-fun b!776925 () Bool)

(assert (=> b!776925 (and (bvsge (index!34210 lt!346025) #b00000000000000000000000000000000) (bvslt (index!34210 lt!346025) (size!20784 lt!345925)))))

(declare-fun res!525712 () Bool)

(assert (=> b!776925 (= res!525712 (= (select (arr!20363 lt!345925) (index!34210 lt!346025)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!776925 (=> res!525712 e!432274)))

(declare-fun b!776926 () Bool)

(assert (=> b!776926 (and (bvsge (index!34210 lt!346025) #b00000000000000000000000000000000) (bvslt (index!34210 lt!346025) (size!20784 lt!345925)))))

(declare-fun res!525710 () Bool)

(assert (=> b!776926 (= res!525710 (= (select (arr!20363 lt!345925) (index!34210 lt!346025)) lt!345919))))

(assert (=> b!776926 (=> res!525710 e!432274)))

(assert (=> b!776926 (= e!432273 e!432274)))

(declare-fun b!776927 () Bool)

(assert (=> b!776927 (= e!432275 (bvsge (x!65154 lt!346025) #b01111111111111111111111111111110))))

(assert (= (and d!101969 c!86007) b!776919))

(assert (= (and d!101969 (not c!86007)) b!776921))

(assert (= (and b!776921 c!86006) b!776922))

(assert (= (and b!776921 (not c!86006)) b!776924))

(assert (= (and d!101969 c!86005) b!776927))

(assert (= (and d!101969 (not c!86005)) b!776923))

(assert (= (and b!776923 res!525711) b!776926))

(assert (= (and b!776926 (not res!525710)) b!776925))

(assert (= (and b!776925 (not res!525712)) b!776920))

(declare-fun m!720381 () Bool)

(assert (=> b!776925 m!720381))

(assert (=> b!776926 m!720381))

(assert (=> b!776920 m!720381))

(declare-fun m!720383 () Bool)

(assert (=> b!776924 m!720383))

(assert (=> b!776924 m!720383))

(declare-fun m!720385 () Bool)

(assert (=> b!776924 m!720385))

(declare-fun m!720387 () Bool)

(assert (=> d!101969 m!720387))

(assert (=> d!101969 m!720193))

(assert (=> b!776693 d!101969))

(declare-fun b!776943 () Bool)

(declare-fun e!432289 () SeekEntryResult!7960)

(assert (=> b!776943 (= e!432289 (Intermediate!7960 true (toIndex!0 lt!345919 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!776944 () Bool)

(declare-fun lt!346029 () SeekEntryResult!7960)

(assert (=> b!776944 (and (bvsge (index!34210 lt!346029) #b00000000000000000000000000000000) (bvslt (index!34210 lt!346029) (size!20784 lt!345925)))))

(declare-fun e!432287 () Bool)

(assert (=> b!776944 (= e!432287 (= (select (arr!20363 lt!345925) (index!34210 lt!346029)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!776945 () Bool)

(declare-fun e!432291 () SeekEntryResult!7960)

(assert (=> b!776945 (= e!432289 e!432291)))

(declare-fun c!86013 () Bool)

(declare-fun lt!346028 () (_ BitVec 64))

(assert (=> b!776945 (= c!86013 (or (= lt!346028 lt!345919) (= (bvadd lt!346028 lt!346028) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776946 () Bool)

(assert (=> b!776946 (= e!432291 (Intermediate!7960 false (toIndex!0 lt!345919 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!776947 () Bool)

(declare-fun e!432288 () Bool)

(declare-fun e!432285 () Bool)

(assert (=> b!776947 (= e!432288 e!432285)))

(declare-fun res!525719 () Bool)

(assert (=> b!776947 (= res!525719 (and ((_ is Intermediate!7960) lt!346029) (not (undefined!8772 lt!346029)) (bvslt (x!65154 lt!346029) #b01111111111111111111111111111110) (bvsge (x!65154 lt!346029) #b00000000000000000000000000000000) (bvsge (x!65154 lt!346029) #b00000000000000000000000000000000)))))

(assert (=> b!776947 (=> (not res!525719) (not e!432285))))

(declare-fun d!101971 () Bool)

(assert (=> d!101971 e!432288))

(declare-fun c!86011 () Bool)

(assert (=> d!101971 (= c!86011 (and ((_ is Intermediate!7960) lt!346029) (undefined!8772 lt!346029)))))

(assert (=> d!101971 (= lt!346029 e!432289)))

(declare-fun c!86014 () Bool)

(assert (=> d!101971 (= c!86014 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101971 (= lt!346028 (select (arr!20363 lt!345925) (toIndex!0 lt!345919 mask!3328)))))

(assert (=> d!101971 (validMask!0 mask!3328)))

(assert (=> d!101971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345919 mask!3328) lt!345919 lt!345925 mask!3328) lt!346029)))

(declare-fun b!776948 () Bool)

(assert (=> b!776948 (= e!432291 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!345919 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!345919 lt!345925 mask!3328))))

(declare-fun b!776949 () Bool)

(assert (=> b!776949 (and (bvsge (index!34210 lt!346029) #b00000000000000000000000000000000) (bvslt (index!34210 lt!346029) (size!20784 lt!345925)))))

(declare-fun res!525720 () Bool)

(assert (=> b!776949 (= res!525720 (= (select (arr!20363 lt!345925) (index!34210 lt!346029)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!776949 (=> res!525720 e!432287)))

(declare-fun b!776950 () Bool)

(assert (=> b!776950 (and (bvsge (index!34210 lt!346029) #b00000000000000000000000000000000) (bvslt (index!34210 lt!346029) (size!20784 lt!345925)))))

(declare-fun res!525718 () Bool)

(assert (=> b!776950 (= res!525718 (= (select (arr!20363 lt!345925) (index!34210 lt!346029)) lt!345919))))

(assert (=> b!776950 (=> res!525718 e!432287)))

(assert (=> b!776950 (= e!432285 e!432287)))

(declare-fun b!776951 () Bool)

(assert (=> b!776951 (= e!432288 (bvsge (x!65154 lt!346029) #b01111111111111111111111111111110))))

(assert (= (and d!101971 c!86014) b!776943))

(assert (= (and d!101971 (not c!86014)) b!776945))

(assert (= (and b!776945 c!86013) b!776946))

(assert (= (and b!776945 (not c!86013)) b!776948))

(assert (= (and d!101971 c!86011) b!776951))

(assert (= (and d!101971 (not c!86011)) b!776947))

(assert (= (and b!776947 res!525719) b!776950))

(assert (= (and b!776950 (not res!525718)) b!776949))

(assert (= (and b!776949 (not res!525720)) b!776944))

(declare-fun m!720393 () Bool)

(assert (=> b!776949 m!720393))

(assert (=> b!776950 m!720393))

(assert (=> b!776944 m!720393))

(assert (=> b!776948 m!720201))

(declare-fun m!720395 () Bool)

(assert (=> b!776948 m!720395))

(assert (=> b!776948 m!720395))

(declare-fun m!720397 () Bool)

(assert (=> b!776948 m!720397))

(assert (=> d!101971 m!720201))

(declare-fun m!720399 () Bool)

(assert (=> d!101971 m!720399))

(assert (=> d!101971 m!720193))

(assert (=> b!776693 d!101971))

(declare-fun d!101975 () Bool)

(declare-fun lt!346037 () (_ BitVec 32))

(declare-fun lt!346036 () (_ BitVec 32))

(assert (=> d!101975 (= lt!346037 (bvmul (bvxor lt!346036 (bvlshr lt!346036 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101975 (= lt!346036 ((_ extract 31 0) (bvand (bvxor lt!345919 (bvlshr lt!345919 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101975 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!525697 (let ((h!15511 ((_ extract 31 0) (bvand (bvxor lt!345919 (bvlshr lt!345919 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65158 (bvmul (bvxor h!15511 (bvlshr h!15511 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65158 (bvlshr x!65158 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!525697 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!525697 #b00000000000000000000000000000000))))))

(assert (=> d!101975 (= (toIndex!0 lt!345919 mask!3328) (bvand (bvxor lt!346037 (bvlshr lt!346037 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!776693 d!101975))

(declare-fun b!776954 () Bool)

(declare-fun e!432297 () SeekEntryResult!7960)

(assert (=> b!776954 (= e!432297 (Intermediate!7960 true index!1321 x!1131))))

(declare-fun b!776955 () Bool)

(declare-fun lt!346039 () SeekEntryResult!7960)

(assert (=> b!776955 (and (bvsge (index!34210 lt!346039) #b00000000000000000000000000000000) (bvslt (index!34210 lt!346039) (size!20784 a!3186)))))

(declare-fun e!432295 () Bool)

(assert (=> b!776955 (= e!432295 (= (select (arr!20363 a!3186) (index!34210 lt!346039)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!776956 () Bool)

(declare-fun e!432298 () SeekEntryResult!7960)

(assert (=> b!776956 (= e!432297 e!432298)))

(declare-fun c!86017 () Bool)

(declare-fun lt!346038 () (_ BitVec 64))

(assert (=> b!776956 (= c!86017 (or (= lt!346038 (select (arr!20363 a!3186) j!159)) (= (bvadd lt!346038 lt!346038) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776957 () Bool)

(assert (=> b!776957 (= e!432298 (Intermediate!7960 false index!1321 x!1131))))

(declare-fun b!776958 () Bool)

(declare-fun e!432296 () Bool)

(declare-fun e!432294 () Bool)

(assert (=> b!776958 (= e!432296 e!432294)))

(declare-fun res!525724 () Bool)

(assert (=> b!776958 (= res!525724 (and ((_ is Intermediate!7960) lt!346039) (not (undefined!8772 lt!346039)) (bvslt (x!65154 lt!346039) #b01111111111111111111111111111110) (bvsge (x!65154 lt!346039) #b00000000000000000000000000000000) (bvsge (x!65154 lt!346039) x!1131)))))

(assert (=> b!776958 (=> (not res!525724) (not e!432294))))

(declare-fun d!101977 () Bool)

(assert (=> d!101977 e!432296))

(declare-fun c!86016 () Bool)

(assert (=> d!101977 (= c!86016 (and ((_ is Intermediate!7960) lt!346039) (undefined!8772 lt!346039)))))

(assert (=> d!101977 (= lt!346039 e!432297)))

(declare-fun c!86018 () Bool)

(assert (=> d!101977 (= c!86018 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101977 (= lt!346038 (select (arr!20363 a!3186) index!1321))))

(assert (=> d!101977 (validMask!0 mask!3328)))

(assert (=> d!101977 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!346039)))

(declare-fun b!776959 () Bool)

(assert (=> b!776959 (= e!432298 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20363 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776960 () Bool)

(assert (=> b!776960 (and (bvsge (index!34210 lt!346039) #b00000000000000000000000000000000) (bvslt (index!34210 lt!346039) (size!20784 a!3186)))))

(declare-fun res!525725 () Bool)

(assert (=> b!776960 (= res!525725 (= (select (arr!20363 a!3186) (index!34210 lt!346039)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!776960 (=> res!525725 e!432295)))

(declare-fun b!776961 () Bool)

(assert (=> b!776961 (and (bvsge (index!34210 lt!346039) #b00000000000000000000000000000000) (bvslt (index!34210 lt!346039) (size!20784 a!3186)))))

(declare-fun res!525723 () Bool)

(assert (=> b!776961 (= res!525723 (= (select (arr!20363 a!3186) (index!34210 lt!346039)) (select (arr!20363 a!3186) j!159)))))

(assert (=> b!776961 (=> res!525723 e!432295)))

(assert (=> b!776961 (= e!432294 e!432295)))

(declare-fun b!776962 () Bool)

(assert (=> b!776962 (= e!432296 (bvsge (x!65154 lt!346039) #b01111111111111111111111111111110))))

(assert (= (and d!101977 c!86018) b!776954))

(assert (= (and d!101977 (not c!86018)) b!776956))

(assert (= (and b!776956 c!86017) b!776957))

(assert (= (and b!776956 (not c!86017)) b!776959))

(assert (= (and d!101977 c!86016) b!776962))

(assert (= (and d!101977 (not c!86016)) b!776958))

(assert (= (and b!776958 res!525724) b!776961))

(assert (= (and b!776961 (not res!525723)) b!776960))

(assert (= (and b!776960 (not res!525725)) b!776955))

(declare-fun m!720401 () Bool)

(assert (=> b!776960 m!720401))

(assert (=> b!776961 m!720401))

(assert (=> b!776955 m!720401))

(assert (=> b!776959 m!720383))

(assert (=> b!776959 m!720383))

(assert (=> b!776959 m!720175))

(declare-fun m!720403 () Bool)

(assert (=> b!776959 m!720403))

(declare-fun m!720405 () Bool)

(assert (=> d!101977 m!720405))

(assert (=> d!101977 m!720193))

(assert (=> b!776683 d!101977))

(declare-fun d!101979 () Bool)

(declare-fun res!525730 () Bool)

(declare-fun e!432303 () Bool)

(assert (=> d!101979 (=> res!525730 e!432303)))

(assert (=> d!101979 (= res!525730 (= (select (arr!20363 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101979 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!432303)))

(declare-fun b!776967 () Bool)

(declare-fun e!432304 () Bool)

(assert (=> b!776967 (= e!432303 e!432304)))

(declare-fun res!525731 () Bool)

(assert (=> b!776967 (=> (not res!525731) (not e!432304))))

(assert (=> b!776967 (= res!525731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20784 a!3186)))))

(declare-fun b!776968 () Bool)

(assert (=> b!776968 (= e!432304 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101979 (not res!525730)) b!776967))

(assert (= (and b!776967 res!525731) b!776968))

(declare-fun m!720407 () Bool)

(assert (=> d!101979 m!720407))

(declare-fun m!720409 () Bool)

(assert (=> b!776968 m!720409))

(assert (=> b!776682 d!101979))

(declare-fun lt!346056 () SeekEntryResult!7960)

(declare-fun d!101981 () Bool)

(assert (=> d!101981 (and (or ((_ is Undefined!7960) lt!346056) (not ((_ is Found!7960) lt!346056)) (and (bvsge (index!34209 lt!346056) #b00000000000000000000000000000000) (bvslt (index!34209 lt!346056) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!346056) ((_ is Found!7960) lt!346056) (not ((_ is MissingVacant!7960) lt!346056)) (not (= (index!34211 lt!346056) resIntermediateIndex!5)) (and (bvsge (index!34211 lt!346056) #b00000000000000000000000000000000) (bvslt (index!34211 lt!346056) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!346056) (ite ((_ is Found!7960) lt!346056) (= (select (arr!20363 a!3186) (index!34209 lt!346056)) (select (arr!20363 a!3186) j!159)) (and ((_ is MissingVacant!7960) lt!346056) (= (index!34211 lt!346056) resIntermediateIndex!5) (= (select (arr!20363 a!3186) (index!34211 lt!346056)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!432324 () SeekEntryResult!7960)

(assert (=> d!101981 (= lt!346056 e!432324)))

(declare-fun c!86037 () Bool)

(assert (=> d!101981 (= c!86037 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!346057 () (_ BitVec 64))

(assert (=> d!101981 (= lt!346057 (select (arr!20363 a!3186) resIntermediateIndex!5))))

(assert (=> d!101981 (validMask!0 mask!3328)))

(assert (=> d!101981 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!346056)))

(declare-fun b!777003 () Bool)

(declare-fun e!432325 () SeekEntryResult!7960)

(assert (=> b!777003 (= e!432325 (Found!7960 resIntermediateIndex!5))))

(declare-fun b!777004 () Bool)

(assert (=> b!777004 (= e!432324 Undefined!7960)))

(declare-fun b!777005 () Bool)

(declare-fun e!432323 () SeekEntryResult!7960)

(assert (=> b!777005 (= e!432323 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777006 () Bool)

(assert (=> b!777006 (= e!432324 e!432325)))

(declare-fun c!86035 () Bool)

(assert (=> b!777006 (= c!86035 (= lt!346057 (select (arr!20363 a!3186) j!159)))))

(declare-fun b!777007 () Bool)

(assert (=> b!777007 (= e!432323 (MissingVacant!7960 resIntermediateIndex!5))))

(declare-fun b!777008 () Bool)

(declare-fun c!86036 () Bool)

(assert (=> b!777008 (= c!86036 (= lt!346057 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777008 (= e!432325 e!432323)))

(assert (= (and d!101981 c!86037) b!777004))

(assert (= (and d!101981 (not c!86037)) b!777006))

(assert (= (and b!777006 c!86035) b!777003))

(assert (= (and b!777006 (not c!86035)) b!777008))

(assert (= (and b!777008 c!86036) b!777007))

(assert (= (and b!777008 (not c!86036)) b!777005))

(declare-fun m!720433 () Bool)

(assert (=> d!101981 m!720433))

(declare-fun m!720435 () Bool)

(assert (=> d!101981 m!720435))

(assert (=> d!101981 m!720197))

(assert (=> d!101981 m!720193))

(declare-fun m!720437 () Bool)

(assert (=> b!777005 m!720437))

(assert (=> b!777005 m!720437))

(assert (=> b!777005 m!720175))

(declare-fun m!720439 () Bool)

(assert (=> b!777005 m!720439))

(assert (=> b!776680 d!101981))

(declare-fun d!101987 () Bool)

(assert (=> d!101987 (= (validKeyInArray!0 (select (arr!20363 a!3186) j!159)) (and (not (= (select (arr!20363 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20363 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!776691 d!101987))

(declare-fun bm!35150 () Bool)

(declare-fun call!35153 () Bool)

(assert (=> bm!35150 (= call!35153 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!777021 () Bool)

(declare-fun e!432330 () Bool)

(declare-fun e!432331 () Bool)

(assert (=> b!777021 (= e!432330 e!432331)))

(declare-fun c!86042 () Bool)

(assert (=> b!777021 (= c!86042 (validKeyInArray!0 (select (arr!20363 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!777023 () Bool)

(assert (=> b!777023 (= e!432331 call!35153)))

(declare-fun b!777024 () Bool)

(declare-fun e!432332 () Bool)

(assert (=> b!777024 (= e!432331 e!432332)))

(declare-fun lt!346063 () (_ BitVec 64))

(assert (=> b!777024 (= lt!346063 (select (arr!20363 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!346062 () Unit!26786)

(assert (=> b!777024 (= lt!346062 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346063 #b00000000000000000000000000000000))))

(assert (=> b!777024 (arrayContainsKey!0 a!3186 lt!346063 #b00000000000000000000000000000000)))

(declare-fun lt!346064 () Unit!26786)

(assert (=> b!777024 (= lt!346064 lt!346062)))

(declare-fun res!525734 () Bool)

(assert (=> b!777024 (= res!525734 (= (seekEntryOrOpen!0 (select (arr!20363 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7960 #b00000000000000000000000000000000)))))

(assert (=> b!777024 (=> (not res!525734) (not e!432332))))

(declare-fun b!777019 () Bool)

(assert (=> b!777019 (= e!432332 call!35153)))

(declare-fun d!101989 () Bool)

(declare-fun res!525735 () Bool)

(assert (=> d!101989 (=> res!525735 e!432330)))

(assert (=> d!101989 (= res!525735 (bvsge #b00000000000000000000000000000000 (size!20784 a!3186)))))

(assert (=> d!101989 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!432330)))

(assert (= (and d!101989 (not res!525735)) b!777021))

(assert (= (and b!777021 c!86042) b!777024))

(assert (= (and b!777021 (not c!86042)) b!777023))

(assert (= (and b!777024 res!525734) b!777019))

(assert (= (or b!777019 b!777023) bm!35150))

(declare-fun m!720441 () Bool)

(assert (=> bm!35150 m!720441))

(assert (=> b!777021 m!720407))

(assert (=> b!777021 m!720407))

(declare-fun m!720443 () Bool)

(assert (=> b!777021 m!720443))

(assert (=> b!777024 m!720407))

(declare-fun m!720445 () Bool)

(assert (=> b!777024 m!720445))

(declare-fun m!720447 () Bool)

(assert (=> b!777024 m!720447))

(assert (=> b!777024 m!720407))

(declare-fun m!720449 () Bool)

(assert (=> b!777024 m!720449))

(assert (=> b!776689 d!101989))

(declare-fun lt!346065 () SeekEntryResult!7960)

(declare-fun d!101991 () Bool)

(assert (=> d!101991 (and (or ((_ is Undefined!7960) lt!346065) (not ((_ is Found!7960) lt!346065)) (and (bvsge (index!34209 lt!346065) #b00000000000000000000000000000000) (bvslt (index!34209 lt!346065) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!346065) ((_ is Found!7960) lt!346065) (not ((_ is MissingVacant!7960) lt!346065)) (not (= (index!34211 lt!346065) resIntermediateIndex!5)) (and (bvsge (index!34211 lt!346065) #b00000000000000000000000000000000) (bvslt (index!34211 lt!346065) (size!20784 a!3186)))) (or ((_ is Undefined!7960) lt!346065) (ite ((_ is Found!7960) lt!346065) (= (select (arr!20363 a!3186) (index!34209 lt!346065)) (select (arr!20363 a!3186) j!159)) (and ((_ is MissingVacant!7960) lt!346065) (= (index!34211 lt!346065) resIntermediateIndex!5) (= (select (arr!20363 a!3186) (index!34211 lt!346065)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!432336 () SeekEntryResult!7960)

(assert (=> d!101991 (= lt!346065 e!432336)))

(declare-fun c!86047 () Bool)

(assert (=> d!101991 (= c!86047 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!346066 () (_ BitVec 64))

(assert (=> d!101991 (= lt!346066 (select (arr!20363 a!3186) index!1321))))

(assert (=> d!101991 (validMask!0 mask!3328)))

(assert (=> d!101991 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!346065)))

(declare-fun b!777025 () Bool)

(declare-fun e!432337 () SeekEntryResult!7960)

(assert (=> b!777025 (= e!432337 (Found!7960 index!1321))))

(declare-fun b!777026 () Bool)

(assert (=> b!777026 (= e!432336 Undefined!7960)))

(declare-fun b!777027 () Bool)

(declare-fun e!432335 () SeekEntryResult!7960)

(assert (=> b!777027 (= e!432335 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777028 () Bool)

(assert (=> b!777028 (= e!432336 e!432337)))

(declare-fun c!86045 () Bool)

(assert (=> b!777028 (= c!86045 (= lt!346066 (select (arr!20363 a!3186) j!159)))))

(declare-fun b!777029 () Bool)

(assert (=> b!777029 (= e!432335 (MissingVacant!7960 resIntermediateIndex!5))))

(declare-fun b!777030 () Bool)

(declare-fun c!86046 () Bool)

(assert (=> b!777030 (= c!86046 (= lt!346066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777030 (= e!432337 e!432335)))

(assert (= (and d!101991 c!86047) b!777026))

(assert (= (and d!101991 (not c!86047)) b!777028))

(assert (= (and b!777028 c!86045) b!777025))

(assert (= (and b!777028 (not c!86045)) b!777030))

(assert (= (and b!777030 c!86046) b!777029))

(assert (= (and b!777030 (not c!86046)) b!777027))

(declare-fun m!720451 () Bool)

(assert (=> d!101991 m!720451))

(declare-fun m!720453 () Bool)

(assert (=> d!101991 m!720453))

(assert (=> d!101991 m!720405))

(assert (=> d!101991 m!720193))

(assert (=> b!777027 m!720383))

(assert (=> b!777027 m!720383))

(assert (=> b!777027 m!720175))

(declare-fun m!720455 () Bool)

(assert (=> b!777027 m!720455))

(assert (=> b!776677 d!101991))

(declare-fun b!777055 () Bool)

(declare-fun e!432355 () Bool)

(declare-fun call!35158 () Bool)

(assert (=> b!777055 (= e!432355 call!35158)))

(declare-fun b!777056 () Bool)

(declare-fun e!432356 () Bool)

(assert (=> b!777056 (= e!432356 e!432355)))

(declare-fun c!86055 () Bool)

(assert (=> b!777056 (= c!86055 (validKeyInArray!0 (select (arr!20363 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!777057 () Bool)

(declare-fun e!432358 () Bool)

(assert (=> b!777057 (= e!432358 e!432356)))

(declare-fun res!525747 () Bool)

(assert (=> b!777057 (=> (not res!525747) (not e!432356))))

(declare-fun e!432357 () Bool)

(assert (=> b!777057 (= res!525747 (not e!432357))))

(declare-fun res!525746 () Bool)

(assert (=> b!777057 (=> (not res!525746) (not e!432357))))

(assert (=> b!777057 (= res!525746 (validKeyInArray!0 (select (arr!20363 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!777058 () Bool)

(assert (=> b!777058 (= e!432355 call!35158)))

(declare-fun bm!35155 () Bool)

(assert (=> bm!35155 (= call!35158 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86055 (Cons!14400 (select (arr!20363 a!3186) #b00000000000000000000000000000000) Nil!14401) Nil!14401)))))

(declare-fun d!101993 () Bool)

(declare-fun res!525748 () Bool)

(assert (=> d!101993 (=> res!525748 e!432358)))

(assert (=> d!101993 (= res!525748 (bvsge #b00000000000000000000000000000000 (size!20784 a!3186)))))

(assert (=> d!101993 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14401) e!432358)))

(declare-fun b!777059 () Bool)

(declare-fun contains!4079 (List!14404 (_ BitVec 64)) Bool)

(assert (=> b!777059 (= e!432357 (contains!4079 Nil!14401 (select (arr!20363 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101993 (not res!525748)) b!777057))

(assert (= (and b!777057 res!525746) b!777059))

(assert (= (and b!777057 res!525747) b!777056))

(assert (= (and b!777056 c!86055) b!777055))

(assert (= (and b!777056 (not c!86055)) b!777058))

(assert (= (or b!777055 b!777058) bm!35155))

(assert (=> b!777056 m!720407))

(assert (=> b!777056 m!720407))

(assert (=> b!777056 m!720443))

(assert (=> b!777057 m!720407))

(assert (=> b!777057 m!720407))

(assert (=> b!777057 m!720443))

(assert (=> bm!35155 m!720407))

(declare-fun m!720465 () Bool)

(assert (=> bm!35155 m!720465))

(assert (=> b!777059 m!720407))

(assert (=> b!777059 m!720407))

(declare-fun m!720469 () Bool)

(assert (=> b!777059 m!720469))

(assert (=> b!776688 d!101993))

(assert (=> b!776678 d!101991))

(check-sat (not d!101977) (not d!101959) (not d!101991) (not b!777021) (not bm!35150) (not d!101943) (not d!101981) (not b!776924) (not d!101947) (not b!776968) (not b!776900) (not bm!35146) (not b!777005) (not b!777027) (not b!777056) (not b!776870) (not b!776837) (not b!777059) (not bm!35155) (not b!776858) (not b!776898) (not d!101971) (not d!101969) (not d!101953) (not b!776948) (not b!776959) (not b!777057) (not b!776864) (not d!101951) (not b!777024))
(check-sat)
