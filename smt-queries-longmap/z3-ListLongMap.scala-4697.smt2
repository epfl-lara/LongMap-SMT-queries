; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65244 () Bool)

(assert start!65244)

(declare-fun b!739564 () Bool)

(declare-fun e!413539 () Bool)

(declare-fun e!413540 () Bool)

(assert (=> b!739564 (= e!413539 e!413540)))

(declare-fun res!497271 () Bool)

(assert (=> b!739564 (=> (not res!497271) (not e!413540))))

(declare-datatypes ((array!41417 0))(
  ( (array!41418 (arr!19822 (Array (_ BitVec 32) (_ BitVec 64))) (size!20243 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41417)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7422 0))(
  ( (MissingZero!7422 (index!32056 (_ BitVec 32))) (Found!7422 (index!32057 (_ BitVec 32))) (Intermediate!7422 (undefined!8234 Bool) (index!32058 (_ BitVec 32)) (x!63044 (_ BitVec 32))) (Undefined!7422) (MissingVacant!7422 (index!32059 (_ BitVec 32))) )
))
(declare-fun lt!328429 () SeekEntryResult!7422)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41417 (_ BitVec 32)) SeekEntryResult!7422)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739564 (= res!497271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19822 a!3186) j!159) mask!3328) (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328429))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739564 (= lt!328429 (Intermediate!7422 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739565 () Bool)

(declare-fun e!413543 () Bool)

(declare-fun e!413538 () Bool)

(assert (=> b!739565 (= e!413543 (not e!413538))))

(declare-fun res!497285 () Bool)

(assert (=> b!739565 (=> res!497285 e!413538)))

(declare-fun lt!328430 () SeekEntryResult!7422)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!739565 (= res!497285 (or (not ((_ is Intermediate!7422) lt!328430)) (bvsge x!1131 (x!63044 lt!328430))))))

(declare-fun lt!328432 () SeekEntryResult!7422)

(assert (=> b!739565 (= lt!328432 (Found!7422 j!159))))

(declare-fun e!413546 () Bool)

(assert (=> b!739565 e!413546))

(declare-fun res!497278 () Bool)

(assert (=> b!739565 (=> (not res!497278) (not e!413546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41417 (_ BitVec 32)) Bool)

(assert (=> b!739565 (= res!497278 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25284 0))(
  ( (Unit!25285) )
))
(declare-fun lt!328427 () Unit!25284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25284)

(assert (=> b!739565 (= lt!328427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739566 () Bool)

(declare-fun res!497283 () Bool)

(assert (=> b!739566 (=> (not res!497283) (not e!413539))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!739566 (= res!497283 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20243 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20243 a!3186))))))

(declare-fun b!739567 () Bool)

(declare-fun res!497272 () Bool)

(assert (=> b!739567 (=> (not res!497272) (not e!413539))))

(assert (=> b!739567 (= res!497272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739568 () Bool)

(declare-fun res!497277 () Bool)

(declare-fun e!413545 () Bool)

(assert (=> b!739568 (=> (not res!497277) (not e!413545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739568 (= res!497277 (validKeyInArray!0 (select (arr!19822 a!3186) j!159)))))

(declare-fun b!739569 () Bool)

(declare-fun lt!328420 () SeekEntryResult!7422)

(declare-fun e!413541 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41417 (_ BitVec 32)) SeekEntryResult!7422)

(assert (=> b!739569 (= e!413541 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328420))))

(declare-fun b!739570 () Bool)

(declare-fun res!497273 () Bool)

(assert (=> b!739570 (=> (not res!497273) (not e!413539))))

(declare-datatypes ((List!13824 0))(
  ( (Nil!13821) (Cons!13820 (h!14892 (_ BitVec 64)) (t!20139 List!13824)) )
))
(declare-fun arrayNoDuplicates!0 (array!41417 (_ BitVec 32) List!13824) Bool)

(assert (=> b!739570 (= res!497273 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13821))))

(declare-fun b!739571 () Bool)

(declare-fun res!497274 () Bool)

(assert (=> b!739571 (=> (not res!497274) (not e!413540))))

(declare-fun e!413544 () Bool)

(assert (=> b!739571 (= res!497274 e!413544)))

(declare-fun c!81528 () Bool)

(assert (=> b!739571 (= c!81528 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739572 () Bool)

(declare-fun res!497284 () Bool)

(assert (=> b!739572 (=> (not res!497284) (not e!413540))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739572 (= res!497284 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19822 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739574 () Bool)

(declare-fun res!497286 () Bool)

(declare-fun e!413537 () Bool)

(assert (=> b!739574 (=> res!497286 e!413537)))

(declare-fun e!413536 () Bool)

(assert (=> b!739574 (= res!497286 e!413536)))

(declare-fun c!81529 () Bool)

(declare-fun lt!328425 () Bool)

(assert (=> b!739574 (= c!81529 lt!328425)))

(declare-fun b!739575 () Bool)

(assert (=> b!739575 (= e!413538 e!413537)))

(declare-fun res!497275 () Bool)

(assert (=> b!739575 (=> res!497275 e!413537)))

(declare-fun lt!328423 () (_ BitVec 32))

(assert (=> b!739575 (= res!497275 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328423 #b00000000000000000000000000000000) (bvsge lt!328423 (size!20243 a!3186))))))

(declare-fun lt!328424 () Unit!25284)

(declare-fun e!413535 () Unit!25284)

(assert (=> b!739575 (= lt!328424 e!413535)))

(declare-fun c!81527 () Bool)

(assert (=> b!739575 (= c!81527 lt!328425)))

(assert (=> b!739575 (= lt!328425 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739575 (= lt!328423 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739576 () Bool)

(assert (=> b!739576 (= e!413546 e!413541)))

(declare-fun res!497288 () Bool)

(assert (=> b!739576 (=> (not res!497288) (not e!413541))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41417 (_ BitVec 32)) SeekEntryResult!7422)

(assert (=> b!739576 (= res!497288 (= (seekEntryOrOpen!0 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328420))))

(assert (=> b!739576 (= lt!328420 (Found!7422 j!159))))

(declare-fun b!739577 () Bool)

(declare-fun res!497280 () Bool)

(assert (=> b!739577 (=> (not res!497280) (not e!413545))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739577 (= res!497280 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739578 () Bool)

(declare-fun Unit!25286 () Unit!25284)

(assert (=> b!739578 (= e!413535 Unit!25286)))

(assert (=> b!739578 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328423 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328429)))

(declare-fun b!739579 () Bool)

(assert (=> b!739579 (= e!413544 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) (Found!7422 j!159)))))

(declare-fun b!739580 () Bool)

(assert (=> b!739580 (= e!413537 true)))

(declare-fun lt!328422 () SeekEntryResult!7422)

(declare-fun lt!328421 () array!41417)

(declare-fun lt!328433 () (_ BitVec 64))

(assert (=> b!739580 (= lt!328422 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328423 lt!328433 lt!328421 mask!3328))))

(declare-fun b!739581 () Bool)

(declare-fun res!497282 () Bool)

(assert (=> b!739581 (=> (not res!497282) (not e!413545))))

(assert (=> b!739581 (= res!497282 (validKeyInArray!0 k0!2102))))

(declare-fun b!739582 () Bool)

(assert (=> b!739582 (= e!413545 e!413539)))

(declare-fun res!497279 () Bool)

(assert (=> b!739582 (=> (not res!497279) (not e!413539))))

(declare-fun lt!328428 () SeekEntryResult!7422)

(assert (=> b!739582 (= res!497279 (or (= lt!328428 (MissingZero!7422 i!1173)) (= lt!328428 (MissingVacant!7422 i!1173))))))

(assert (=> b!739582 (= lt!328428 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739583 () Bool)

(assert (=> b!739583 (= e!413536 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328423 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328429)))))

(declare-fun b!739584 () Bool)

(declare-fun res!497281 () Bool)

(assert (=> b!739584 (=> (not res!497281) (not e!413545))))

(assert (=> b!739584 (= res!497281 (and (= (size!20243 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20243 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20243 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739585 () Bool)

(declare-fun Unit!25287 () Unit!25284)

(assert (=> b!739585 (= e!413535 Unit!25287)))

(declare-fun lt!328426 () SeekEntryResult!7422)

(assert (=> b!739585 (= lt!328426 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739585 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328423 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328432)))

(declare-fun b!739586 () Bool)

(assert (=> b!739586 (= e!413544 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328429))))

(declare-fun b!739587 () Bool)

(assert (=> b!739587 (= e!413536 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328423 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328432)))))

(declare-fun b!739573 () Bool)

(assert (=> b!739573 (= e!413540 e!413543)))

(declare-fun res!497287 () Bool)

(assert (=> b!739573 (=> (not res!497287) (not e!413543))))

(declare-fun lt!328431 () SeekEntryResult!7422)

(assert (=> b!739573 (= res!497287 (= lt!328431 lt!328430))))

(assert (=> b!739573 (= lt!328430 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328433 lt!328421 mask!3328))))

(assert (=> b!739573 (= lt!328431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328433 mask!3328) lt!328433 lt!328421 mask!3328))))

(assert (=> b!739573 (= lt!328433 (select (store (arr!19822 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739573 (= lt!328421 (array!41418 (store (arr!19822 a!3186) i!1173 k0!2102) (size!20243 a!3186)))))

(declare-fun res!497276 () Bool)

(assert (=> start!65244 (=> (not res!497276) (not e!413545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65244 (= res!497276 (validMask!0 mask!3328))))

(assert (=> start!65244 e!413545))

(assert (=> start!65244 true))

(declare-fun array_inv!15618 (array!41417) Bool)

(assert (=> start!65244 (array_inv!15618 a!3186)))

(assert (= (and start!65244 res!497276) b!739584))

(assert (= (and b!739584 res!497281) b!739568))

(assert (= (and b!739568 res!497277) b!739581))

(assert (= (and b!739581 res!497282) b!739577))

(assert (= (and b!739577 res!497280) b!739582))

(assert (= (and b!739582 res!497279) b!739567))

(assert (= (and b!739567 res!497272) b!739570))

(assert (= (and b!739570 res!497273) b!739566))

(assert (= (and b!739566 res!497283) b!739564))

(assert (= (and b!739564 res!497271) b!739572))

(assert (= (and b!739572 res!497284) b!739571))

(assert (= (and b!739571 c!81528) b!739586))

(assert (= (and b!739571 (not c!81528)) b!739579))

(assert (= (and b!739571 res!497274) b!739573))

(assert (= (and b!739573 res!497287) b!739565))

(assert (= (and b!739565 res!497278) b!739576))

(assert (= (and b!739576 res!497288) b!739569))

(assert (= (and b!739565 (not res!497285)) b!739575))

(assert (= (and b!739575 c!81527) b!739578))

(assert (= (and b!739575 (not c!81527)) b!739585))

(assert (= (and b!739575 (not res!497275)) b!739574))

(assert (= (and b!739574 c!81529) b!739583))

(assert (= (and b!739574 (not c!81529)) b!739587))

(assert (= (and b!739574 (not res!497286)) b!739580))

(declare-fun m!690913 () Bool)

(assert (=> b!739569 m!690913))

(assert (=> b!739569 m!690913))

(declare-fun m!690915 () Bool)

(assert (=> b!739569 m!690915))

(assert (=> b!739579 m!690913))

(assert (=> b!739579 m!690913))

(declare-fun m!690917 () Bool)

(assert (=> b!739579 m!690917))

(assert (=> b!739576 m!690913))

(assert (=> b!739576 m!690913))

(declare-fun m!690919 () Bool)

(assert (=> b!739576 m!690919))

(declare-fun m!690921 () Bool)

(assert (=> b!739573 m!690921))

(declare-fun m!690923 () Bool)

(assert (=> b!739573 m!690923))

(declare-fun m!690925 () Bool)

(assert (=> b!739573 m!690925))

(declare-fun m!690927 () Bool)

(assert (=> b!739573 m!690927))

(declare-fun m!690929 () Bool)

(assert (=> b!739573 m!690929))

(assert (=> b!739573 m!690923))

(assert (=> b!739585 m!690913))

(assert (=> b!739585 m!690913))

(assert (=> b!739585 m!690917))

(assert (=> b!739585 m!690913))

(declare-fun m!690931 () Bool)

(assert (=> b!739585 m!690931))

(declare-fun m!690933 () Bool)

(assert (=> b!739580 m!690933))

(assert (=> b!739586 m!690913))

(assert (=> b!739586 m!690913))

(declare-fun m!690935 () Bool)

(assert (=> b!739586 m!690935))

(assert (=> b!739578 m!690913))

(assert (=> b!739578 m!690913))

(declare-fun m!690937 () Bool)

(assert (=> b!739578 m!690937))

(assert (=> b!739587 m!690913))

(assert (=> b!739587 m!690913))

(assert (=> b!739587 m!690931))

(declare-fun m!690939 () Bool)

(assert (=> start!65244 m!690939))

(declare-fun m!690941 () Bool)

(assert (=> start!65244 m!690941))

(assert (=> b!739568 m!690913))

(assert (=> b!739568 m!690913))

(declare-fun m!690943 () Bool)

(assert (=> b!739568 m!690943))

(declare-fun m!690945 () Bool)

(assert (=> b!739581 m!690945))

(declare-fun m!690947 () Bool)

(assert (=> b!739572 m!690947))

(declare-fun m!690949 () Bool)

(assert (=> b!739567 m!690949))

(declare-fun m!690951 () Bool)

(assert (=> b!739582 m!690951))

(declare-fun m!690953 () Bool)

(assert (=> b!739570 m!690953))

(declare-fun m!690955 () Bool)

(assert (=> b!739575 m!690955))

(assert (=> b!739583 m!690913))

(assert (=> b!739583 m!690913))

(assert (=> b!739583 m!690937))

(declare-fun m!690957 () Bool)

(assert (=> b!739577 m!690957))

(declare-fun m!690959 () Bool)

(assert (=> b!739565 m!690959))

(declare-fun m!690961 () Bool)

(assert (=> b!739565 m!690961))

(assert (=> b!739564 m!690913))

(assert (=> b!739564 m!690913))

(declare-fun m!690963 () Bool)

(assert (=> b!739564 m!690963))

(assert (=> b!739564 m!690963))

(assert (=> b!739564 m!690913))

(declare-fun m!690965 () Bool)

(assert (=> b!739564 m!690965))

(check-sat (not b!739567) (not b!739582) (not b!739578) (not b!739568) (not b!739585) (not b!739580) (not b!739581) (not b!739565) (not b!739586) (not b!739583) (not b!739570) (not b!739564) (not b!739577) (not b!739569) (not b!739573) (not start!65244) (not b!739576) (not b!739579) (not b!739575) (not b!739587))
(check-sat)
