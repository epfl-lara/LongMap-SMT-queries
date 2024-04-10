; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65460 () Bool)

(assert start!65460)

(declare-fun b!745879 () Bool)

(declare-fun res!502707 () Bool)

(declare-fun e!416569 () Bool)

(assert (=> b!745879 (=> (not res!502707) (not e!416569))))

(declare-datatypes ((array!41633 0))(
  ( (array!41634 (arr!19930 (Array (_ BitVec 32) (_ BitVec 64))) (size!20351 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41633)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41633 (_ BitVec 32)) Bool)

(assert (=> b!745879 (= res!502707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745880 () Bool)

(declare-fun e!416570 () Bool)

(assert (=> b!745880 (= e!416569 e!416570)))

(declare-fun res!502711 () Bool)

(assert (=> b!745880 (=> (not res!502711) (not e!416570))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7530 0))(
  ( (MissingZero!7530 (index!32488 (_ BitVec 32))) (Found!7530 (index!32489 (_ BitVec 32))) (Intermediate!7530 (undefined!8342 Bool) (index!32490 (_ BitVec 32)) (x!63440 (_ BitVec 32))) (Undefined!7530) (MissingVacant!7530 (index!32491 (_ BitVec 32))) )
))
(declare-fun lt!331409 () SeekEntryResult!7530)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41633 (_ BitVec 32)) SeekEntryResult!7530)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745880 (= res!502711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19930 a!3186) j!159) mask!3328) (select (arr!19930 a!3186) j!159) a!3186 mask!3328) lt!331409))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745880 (= lt!331409 (Intermediate!7530 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745881 () Bool)

(declare-fun e!416568 () Bool)

(declare-fun e!416565 () Bool)

(assert (=> b!745881 (= e!416568 (not e!416565))))

(declare-fun res!502717 () Bool)

(assert (=> b!745881 (=> res!502717 e!416565)))

(declare-fun lt!331414 () SeekEntryResult!7530)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!745881 (= res!502717 (or (not ((_ is Intermediate!7530) lt!331414)) (bvslt x!1131 (x!63440 lt!331414)) (not (= x!1131 (x!63440 lt!331414))) (not (= index!1321 (index!32490 lt!331414)))))))

(declare-fun e!416567 () Bool)

(assert (=> b!745881 e!416567))

(declare-fun res!502713 () Bool)

(assert (=> b!745881 (=> (not res!502713) (not e!416567))))

(declare-fun lt!331413 () SeekEntryResult!7530)

(declare-fun lt!331408 () SeekEntryResult!7530)

(assert (=> b!745881 (= res!502713 (= lt!331413 lt!331408))))

(assert (=> b!745881 (= lt!331408 (Found!7530 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41633 (_ BitVec 32)) SeekEntryResult!7530)

(assert (=> b!745881 (= lt!331413 (seekEntryOrOpen!0 (select (arr!19930 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!745881 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25540 0))(
  ( (Unit!25541) )
))
(declare-fun lt!331406 () Unit!25540)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25540)

(assert (=> b!745881 (= lt!331406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745882 () Bool)

(declare-fun res!502718 () Bool)

(assert (=> b!745882 (=> (not res!502718) (not e!416570))))

(declare-fun e!416566 () Bool)

(assert (=> b!745882 (= res!502718 e!416566)))

(declare-fun c!81967 () Bool)

(assert (=> b!745882 (= c!81967 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745883 () Bool)

(declare-fun res!502714 () Bool)

(declare-fun e!416563 () Bool)

(assert (=> b!745883 (=> (not res!502714) (not e!416563))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745883 (= res!502714 (validKeyInArray!0 k0!2102))))

(declare-fun b!745884 () Bool)

(declare-fun res!502719 () Bool)

(assert (=> b!745884 (=> (not res!502719) (not e!416563))))

(assert (=> b!745884 (= res!502719 (validKeyInArray!0 (select (arr!19930 a!3186) j!159)))))

(declare-fun b!745885 () Bool)

(declare-fun res!502720 () Bool)

(assert (=> b!745885 (=> (not res!502720) (not e!416569))))

(declare-datatypes ((List!13932 0))(
  ( (Nil!13929) (Cons!13928 (h!15000 (_ BitVec 64)) (t!20247 List!13932)) )
))
(declare-fun arrayNoDuplicates!0 (array!41633 (_ BitVec 32) List!13932) Bool)

(assert (=> b!745885 (= res!502720 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13929))))

(declare-fun b!745886 () Bool)

(declare-fun res!502715 () Bool)

(assert (=> b!745886 (=> (not res!502715) (not e!416569))))

(assert (=> b!745886 (= res!502715 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20351 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20351 a!3186))))))

(declare-fun b!745887 () Bool)

(declare-fun res!502709 () Bool)

(assert (=> b!745887 (=> (not res!502709) (not e!416570))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745887 (= res!502709 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19930 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745888 () Bool)

(declare-fun e!416564 () Bool)

(assert (=> b!745888 (= e!416564 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!331410 () SeekEntryResult!7530)

(assert (=> b!745888 (= lt!331413 lt!331410)))

(declare-fun b!745889 () Bool)

(assert (=> b!745889 (= e!416570 e!416568)))

(declare-fun res!502710 () Bool)

(assert (=> b!745889 (=> (not res!502710) (not e!416568))))

(declare-fun lt!331412 () SeekEntryResult!7530)

(assert (=> b!745889 (= res!502710 (= lt!331412 lt!331414))))

(declare-fun lt!331411 () (_ BitVec 64))

(declare-fun lt!331407 () array!41633)

(assert (=> b!745889 (= lt!331414 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331411 lt!331407 mask!3328))))

(assert (=> b!745889 (= lt!331412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331411 mask!3328) lt!331411 lt!331407 mask!3328))))

(assert (=> b!745889 (= lt!331411 (select (store (arr!19930 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745889 (= lt!331407 (array!41634 (store (arr!19930 a!3186) i!1173 k0!2102) (size!20351 a!3186)))))

(declare-fun b!745890 () Bool)

(assert (=> b!745890 (= e!416565 e!416564)))

(declare-fun res!502712 () Bool)

(assert (=> b!745890 (=> res!502712 e!416564)))

(assert (=> b!745890 (= res!502712 (or (not (= lt!331410 lt!331408)) (= (select (store (arr!19930 a!3186) i!1173 k0!2102) index!1321) lt!331411) (not (= (select (store (arr!19930 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41633 (_ BitVec 32)) SeekEntryResult!7530)

(assert (=> b!745890 (= lt!331410 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19930 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!502716 () Bool)

(assert (=> start!65460 (=> (not res!502716) (not e!416563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65460 (= res!502716 (validMask!0 mask!3328))))

(assert (=> start!65460 e!416563))

(assert (=> start!65460 true))

(declare-fun array_inv!15726 (array!41633) Bool)

(assert (=> start!65460 (array_inv!15726 a!3186)))

(declare-fun b!745891 () Bool)

(declare-fun res!502706 () Bool)

(assert (=> b!745891 (=> (not res!502706) (not e!416563))))

(assert (=> b!745891 (= res!502706 (and (= (size!20351 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20351 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20351 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745892 () Bool)

(assert (=> b!745892 (= e!416563 e!416569)))

(declare-fun res!502721 () Bool)

(assert (=> b!745892 (=> (not res!502721) (not e!416569))))

(declare-fun lt!331415 () SeekEntryResult!7530)

(assert (=> b!745892 (= res!502721 (or (= lt!331415 (MissingZero!7530 i!1173)) (= lt!331415 (MissingVacant!7530 i!1173))))))

(assert (=> b!745892 (= lt!331415 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745893 () Bool)

(assert (=> b!745893 (= e!416566 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19930 a!3186) j!159) a!3186 mask!3328) lt!331409))))

(declare-fun b!745894 () Bool)

(assert (=> b!745894 (= e!416567 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19930 a!3186) j!159) a!3186 mask!3328) lt!331408))))

(declare-fun b!745895 () Bool)

(declare-fun res!502708 () Bool)

(assert (=> b!745895 (=> (not res!502708) (not e!416563))))

(declare-fun arrayContainsKey!0 (array!41633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745895 (= res!502708 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745896 () Bool)

(assert (=> b!745896 (= e!416566 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19930 a!3186) j!159) a!3186 mask!3328) (Found!7530 j!159)))))

(assert (= (and start!65460 res!502716) b!745891))

(assert (= (and b!745891 res!502706) b!745884))

(assert (= (and b!745884 res!502719) b!745883))

(assert (= (and b!745883 res!502714) b!745895))

(assert (= (and b!745895 res!502708) b!745892))

(assert (= (and b!745892 res!502721) b!745879))

(assert (= (and b!745879 res!502707) b!745885))

(assert (= (and b!745885 res!502720) b!745886))

(assert (= (and b!745886 res!502715) b!745880))

(assert (= (and b!745880 res!502711) b!745887))

(assert (= (and b!745887 res!502709) b!745882))

(assert (= (and b!745882 c!81967) b!745893))

(assert (= (and b!745882 (not c!81967)) b!745896))

(assert (= (and b!745882 res!502718) b!745889))

(assert (= (and b!745889 res!502710) b!745881))

(assert (= (and b!745881 res!502713) b!745894))

(assert (= (and b!745881 (not res!502717)) b!745890))

(assert (= (and b!745890 (not res!502712)) b!745888))

(declare-fun m!696199 () Bool)

(assert (=> b!745880 m!696199))

(assert (=> b!745880 m!696199))

(declare-fun m!696201 () Bool)

(assert (=> b!745880 m!696201))

(assert (=> b!745880 m!696201))

(assert (=> b!745880 m!696199))

(declare-fun m!696203 () Bool)

(assert (=> b!745880 m!696203))

(declare-fun m!696205 () Bool)

(assert (=> b!745895 m!696205))

(assert (=> b!745884 m!696199))

(assert (=> b!745884 m!696199))

(declare-fun m!696207 () Bool)

(assert (=> b!745884 m!696207))

(assert (=> b!745893 m!696199))

(assert (=> b!745893 m!696199))

(declare-fun m!696209 () Bool)

(assert (=> b!745893 m!696209))

(declare-fun m!696211 () Bool)

(assert (=> b!745885 m!696211))

(assert (=> b!745894 m!696199))

(assert (=> b!745894 m!696199))

(declare-fun m!696213 () Bool)

(assert (=> b!745894 m!696213))

(declare-fun m!696215 () Bool)

(assert (=> b!745892 m!696215))

(declare-fun m!696217 () Bool)

(assert (=> b!745879 m!696217))

(declare-fun m!696219 () Bool)

(assert (=> b!745887 m!696219))

(declare-fun m!696221 () Bool)

(assert (=> b!745890 m!696221))

(declare-fun m!696223 () Bool)

(assert (=> b!745890 m!696223))

(assert (=> b!745890 m!696199))

(assert (=> b!745890 m!696199))

(declare-fun m!696225 () Bool)

(assert (=> b!745890 m!696225))

(declare-fun m!696227 () Bool)

(assert (=> b!745883 m!696227))

(assert (=> b!745881 m!696199))

(assert (=> b!745881 m!696199))

(declare-fun m!696229 () Bool)

(assert (=> b!745881 m!696229))

(declare-fun m!696231 () Bool)

(assert (=> b!745881 m!696231))

(declare-fun m!696233 () Bool)

(assert (=> b!745881 m!696233))

(declare-fun m!696235 () Bool)

(assert (=> start!65460 m!696235))

(declare-fun m!696237 () Bool)

(assert (=> start!65460 m!696237))

(declare-fun m!696239 () Bool)

(assert (=> b!745889 m!696239))

(declare-fun m!696241 () Bool)

(assert (=> b!745889 m!696241))

(assert (=> b!745889 m!696221))

(declare-fun m!696243 () Bool)

(assert (=> b!745889 m!696243))

(assert (=> b!745889 m!696241))

(declare-fun m!696245 () Bool)

(assert (=> b!745889 m!696245))

(assert (=> b!745896 m!696199))

(assert (=> b!745896 m!696199))

(assert (=> b!745896 m!696225))

(check-sat (not b!745893) (not b!745885) (not start!65460) (not b!745895) (not b!745881) (not b!745894) (not b!745890) (not b!745883) (not b!745896) (not b!745889) (not b!745879) (not b!745884) (not b!745892) (not b!745880))
(check-sat)
