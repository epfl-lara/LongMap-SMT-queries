; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67004 () Bool)

(assert start!67004)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42447 0))(
  ( (array!42448 (arr!20321 (Array (_ BitVec 32) (_ BitVec 64))) (size!20742 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42447)

(declare-fun b!773565 () Bool)

(declare-fun lt!344383 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7918 0))(
  ( (MissingZero!7918 (index!34040 (_ BitVec 32))) (Found!7918 (index!34041 (_ BitVec 32))) (Intermediate!7918 (undefined!8730 Bool) (index!34042 (_ BitVec 32)) (x!64988 (_ BitVec 32))) (Undefined!7918) (MissingVacant!7918 (index!34043 (_ BitVec 32))) )
))
(declare-fun lt!344387 () SeekEntryResult!7918)

(declare-fun e!430585 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42447 (_ BitVec 32)) SeekEntryResult!7918)

(assert (=> b!773565 (= e!430585 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344383 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344387)))))

(declare-fun b!773566 () Bool)

(declare-fun e!430582 () Bool)

(declare-fun e!430581 () Bool)

(assert (=> b!773566 (= e!430582 e!430581)))

(declare-fun res!523273 () Bool)

(assert (=> b!773566 (=> res!523273 e!430581)))

(assert (=> b!773566 (= res!523273 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344383 #b00000000000000000000000000000000) (bvsge lt!344383 (size!20742 a!3186))))))

(declare-datatypes ((Unit!26666 0))(
  ( (Unit!26667) )
))
(declare-fun lt!344389 () Unit!26666)

(declare-fun e!430583 () Unit!26666)

(assert (=> b!773566 (= lt!344389 e!430583)))

(declare-fun c!85552 () Bool)

(declare-fun lt!344388 () Bool)

(assert (=> b!773566 (= c!85552 lt!344388)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773566 (= lt!344388 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773566 (= lt!344383 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun e!430591 () Bool)

(declare-fun b!773567 () Bool)

(declare-fun lt!344381 () SeekEntryResult!7918)

(assert (=> b!773567 (= e!430591 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344381))))

(declare-fun b!773568 () Bool)

(declare-fun e!430588 () Bool)

(declare-fun e!430589 () Bool)

(assert (=> b!773568 (= e!430588 e!430589)))

(declare-fun res!523268 () Bool)

(assert (=> b!773568 (=> (not res!523268) (not e!430589))))

(declare-fun lt!344390 () SeekEntryResult!7918)

(declare-fun lt!344379 () SeekEntryResult!7918)

(assert (=> b!773568 (= res!523268 (= lt!344390 lt!344379))))

(declare-fun lt!344384 () array!42447)

(declare-fun lt!344386 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42447 (_ BitVec 32)) SeekEntryResult!7918)

(assert (=> b!773568 (= lt!344379 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344386 lt!344384 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773568 (= lt!344390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344386 mask!3328) lt!344386 lt!344384 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!773568 (= lt!344386 (select (store (arr!20321 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773568 (= lt!344384 (array!42448 (store (arr!20321 a!3186) i!1173 k0!2102) (size!20742 a!3186)))))

(declare-fun b!773569 () Bool)

(declare-fun e!430580 () Bool)

(assert (=> b!773569 (= e!430580 e!430591)))

(declare-fun res!523272 () Bool)

(assert (=> b!773569 (=> (not res!523272) (not e!430591))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42447 (_ BitVec 32)) SeekEntryResult!7918)

(assert (=> b!773569 (= res!523272 (= (seekEntryOrOpen!0 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344381))))

(assert (=> b!773569 (= lt!344381 (Found!7918 j!159))))

(declare-fun b!773570 () Bool)

(declare-fun res!523269 () Bool)

(declare-fun e!430587 () Bool)

(assert (=> b!773570 (=> (not res!523269) (not e!430587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773570 (= res!523269 (validKeyInArray!0 k0!2102))))

(declare-fun b!773571 () Bool)

(assert (=> b!773571 (= e!430589 (not e!430582))))

(declare-fun res!523275 () Bool)

(assert (=> b!773571 (=> res!523275 e!430582)))

(get-info :version)

(assert (=> b!773571 (= res!523275 (or (not ((_ is Intermediate!7918) lt!344379)) (bvsge x!1131 (x!64988 lt!344379))))))

(assert (=> b!773571 (= lt!344387 (Found!7918 j!159))))

(assert (=> b!773571 e!430580))

(declare-fun res!523271 () Bool)

(assert (=> b!773571 (=> (not res!523271) (not e!430580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42447 (_ BitVec 32)) Bool)

(assert (=> b!773571 (= res!523271 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344382 () Unit!26666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26666)

(assert (=> b!773571 (= lt!344382 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773572 () Bool)

(declare-fun res!523270 () Bool)

(assert (=> b!773572 (=> (not res!523270) (not e!430588))))

(assert (=> b!773572 (= res!523270 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20321 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773573 () Bool)

(declare-fun lt!344380 () SeekEntryResult!7918)

(assert (=> b!773573 (= e!430585 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344383 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344380)))))

(declare-fun e!430584 () Bool)

(declare-fun b!773574 () Bool)

(assert (=> b!773574 (= e!430584 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344380))))

(declare-fun b!773575 () Bool)

(assert (=> b!773575 (= e!430581 (= lt!344390 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344383 lt!344386 lt!344384 mask!3328)))))

(declare-fun b!773576 () Bool)

(declare-fun res!523258 () Bool)

(assert (=> b!773576 (=> (not res!523258) (not e!430588))))

(assert (=> b!773576 (= res!523258 e!430584)))

(declare-fun c!85553 () Bool)

(assert (=> b!773576 (= c!85553 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773577 () Bool)

(declare-fun e!430586 () Bool)

(assert (=> b!773577 (= e!430586 e!430588)))

(declare-fun res!523260 () Bool)

(assert (=> b!773577 (=> (not res!523260) (not e!430588))))

(assert (=> b!773577 (= res!523260 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20321 a!3186) j!159) mask!3328) (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344380))))

(assert (=> b!773577 (= lt!344380 (Intermediate!7918 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773578 () Bool)

(declare-fun res!523264 () Bool)

(assert (=> b!773578 (=> (not res!523264) (not e!430586))))

(assert (=> b!773578 (= res!523264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773579 () Bool)

(assert (=> b!773579 (= e!430587 e!430586)))

(declare-fun res!523261 () Bool)

(assert (=> b!773579 (=> (not res!523261) (not e!430586))))

(declare-fun lt!344378 () SeekEntryResult!7918)

(assert (=> b!773579 (= res!523261 (or (= lt!344378 (MissingZero!7918 i!1173)) (= lt!344378 (MissingVacant!7918 i!1173))))))

(assert (=> b!773579 (= lt!344378 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!773580 () Bool)

(declare-fun res!523262 () Bool)

(assert (=> b!773580 (=> (not res!523262) (not e!430587))))

(assert (=> b!773580 (= res!523262 (validKeyInArray!0 (select (arr!20321 a!3186) j!159)))))

(declare-fun b!773581 () Bool)

(declare-fun res!523263 () Bool)

(assert (=> b!773581 (=> (not res!523263) (not e!430587))))

(assert (=> b!773581 (= res!523263 (and (= (size!20742 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20742 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20742 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773582 () Bool)

(declare-fun Unit!26668 () Unit!26666)

(assert (=> b!773582 (= e!430583 Unit!26668)))

(assert (=> b!773582 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344383 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344380)))

(declare-fun b!773583 () Bool)

(declare-fun res!523274 () Bool)

(assert (=> b!773583 (=> res!523274 e!430581)))

(assert (=> b!773583 (= res!523274 e!430585)))

(declare-fun c!85554 () Bool)

(assert (=> b!773583 (= c!85554 lt!344388)))

(declare-fun b!773584 () Bool)

(declare-fun res!523267 () Bool)

(assert (=> b!773584 (=> (not res!523267) (not e!430586))))

(assert (=> b!773584 (= res!523267 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20742 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20742 a!3186))))))

(declare-fun res!523266 () Bool)

(assert (=> start!67004 (=> (not res!523266) (not e!430587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67004 (= res!523266 (validMask!0 mask!3328))))

(assert (=> start!67004 e!430587))

(assert (=> start!67004 true))

(declare-fun array_inv!16204 (array!42447) Bool)

(assert (=> start!67004 (array_inv!16204 a!3186)))

(declare-fun b!773585 () Bool)

(declare-fun res!523265 () Bool)

(assert (=> b!773585 (=> (not res!523265) (not e!430587))))

(declare-fun arrayContainsKey!0 (array!42447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773585 (= res!523265 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773586 () Bool)

(assert (=> b!773586 (= e!430584 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) (Found!7918 j!159)))))

(declare-fun b!773587 () Bool)

(declare-fun res!523259 () Bool)

(assert (=> b!773587 (=> (not res!523259) (not e!430586))))

(declare-datatypes ((List!14362 0))(
  ( (Nil!14359) (Cons!14358 (h!15463 (_ BitVec 64)) (t!20668 List!14362)) )
))
(declare-fun arrayNoDuplicates!0 (array!42447 (_ BitVec 32) List!14362) Bool)

(assert (=> b!773587 (= res!523259 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14359))))

(declare-fun b!773588 () Bool)

(declare-fun Unit!26669 () Unit!26666)

(assert (=> b!773588 (= e!430583 Unit!26669)))

(declare-fun lt!344385 () SeekEntryResult!7918)

(assert (=> b!773588 (= lt!344385 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773588 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344383 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344387)))

(assert (= (and start!67004 res!523266) b!773581))

(assert (= (and b!773581 res!523263) b!773580))

(assert (= (and b!773580 res!523262) b!773570))

(assert (= (and b!773570 res!523269) b!773585))

(assert (= (and b!773585 res!523265) b!773579))

(assert (= (and b!773579 res!523261) b!773578))

(assert (= (and b!773578 res!523264) b!773587))

(assert (= (and b!773587 res!523259) b!773584))

(assert (= (and b!773584 res!523267) b!773577))

(assert (= (and b!773577 res!523260) b!773572))

(assert (= (and b!773572 res!523270) b!773576))

(assert (= (and b!773576 c!85553) b!773574))

(assert (= (and b!773576 (not c!85553)) b!773586))

(assert (= (and b!773576 res!523258) b!773568))

(assert (= (and b!773568 res!523268) b!773571))

(assert (= (and b!773571 res!523271) b!773569))

(assert (= (and b!773569 res!523272) b!773567))

(assert (= (and b!773571 (not res!523275)) b!773566))

(assert (= (and b!773566 c!85552) b!773582))

(assert (= (and b!773566 (not c!85552)) b!773588))

(assert (= (and b!773566 (not res!523273)) b!773583))

(assert (= (and b!773583 c!85554) b!773573))

(assert (= (and b!773583 (not c!85554)) b!773565))

(assert (= (and b!773583 (not res!523274)) b!773575))

(declare-fun m!717705 () Bool)

(assert (=> b!773587 m!717705))

(declare-fun m!717707 () Bool)

(assert (=> b!773578 m!717707))

(declare-fun m!717709 () Bool)

(assert (=> start!67004 m!717709))

(declare-fun m!717711 () Bool)

(assert (=> start!67004 m!717711))

(declare-fun m!717713 () Bool)

(assert (=> b!773586 m!717713))

(assert (=> b!773586 m!717713))

(declare-fun m!717715 () Bool)

(assert (=> b!773586 m!717715))

(declare-fun m!717717 () Bool)

(assert (=> b!773575 m!717717))

(declare-fun m!717719 () Bool)

(assert (=> b!773572 m!717719))

(declare-fun m!717721 () Bool)

(assert (=> b!773570 m!717721))

(declare-fun m!717723 () Bool)

(assert (=> b!773571 m!717723))

(declare-fun m!717725 () Bool)

(assert (=> b!773571 m!717725))

(assert (=> b!773588 m!717713))

(assert (=> b!773588 m!717713))

(assert (=> b!773588 m!717715))

(assert (=> b!773588 m!717713))

(declare-fun m!717727 () Bool)

(assert (=> b!773588 m!717727))

(declare-fun m!717729 () Bool)

(assert (=> b!773579 m!717729))

(assert (=> b!773567 m!717713))

(assert (=> b!773567 m!717713))

(declare-fun m!717731 () Bool)

(assert (=> b!773567 m!717731))

(declare-fun m!717733 () Bool)

(assert (=> b!773585 m!717733))

(declare-fun m!717735 () Bool)

(assert (=> b!773568 m!717735))

(declare-fun m!717737 () Bool)

(assert (=> b!773568 m!717737))

(declare-fun m!717739 () Bool)

(assert (=> b!773568 m!717739))

(assert (=> b!773568 m!717735))

(declare-fun m!717741 () Bool)

(assert (=> b!773568 m!717741))

(declare-fun m!717743 () Bool)

(assert (=> b!773568 m!717743))

(declare-fun m!717745 () Bool)

(assert (=> b!773566 m!717745))

(assert (=> b!773577 m!717713))

(assert (=> b!773577 m!717713))

(declare-fun m!717747 () Bool)

(assert (=> b!773577 m!717747))

(assert (=> b!773577 m!717747))

(assert (=> b!773577 m!717713))

(declare-fun m!717749 () Bool)

(assert (=> b!773577 m!717749))

(assert (=> b!773574 m!717713))

(assert (=> b!773574 m!717713))

(declare-fun m!717751 () Bool)

(assert (=> b!773574 m!717751))

(assert (=> b!773582 m!717713))

(assert (=> b!773582 m!717713))

(declare-fun m!717753 () Bool)

(assert (=> b!773582 m!717753))

(assert (=> b!773569 m!717713))

(assert (=> b!773569 m!717713))

(declare-fun m!717755 () Bool)

(assert (=> b!773569 m!717755))

(assert (=> b!773573 m!717713))

(assert (=> b!773573 m!717713))

(assert (=> b!773573 m!717753))

(assert (=> b!773580 m!717713))

(assert (=> b!773580 m!717713))

(declare-fun m!717757 () Bool)

(assert (=> b!773580 m!717757))

(assert (=> b!773565 m!717713))

(assert (=> b!773565 m!717713))

(assert (=> b!773565 m!717727))

(check-sat (not b!773573) (not b!773586) (not b!773580) (not b!773565) (not b!773588) (not b!773577) (not b!773571) (not start!67004) (not b!773566) (not b!773568) (not b!773574) (not b!773582) (not b!773578) (not b!773570) (not b!773585) (not b!773587) (not b!773569) (not b!773579) (not b!773575) (not b!773567))
(check-sat)
(get-model)

(declare-fun d!101777 () Bool)

(assert (=> d!101777 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!773570 d!101777))

(declare-fun b!773745 () Bool)

(declare-fun e!430671 () SeekEntryResult!7918)

(declare-fun e!430670 () SeekEntryResult!7918)

(assert (=> b!773745 (= e!430671 e!430670)))

(declare-fun lt!344475 () (_ BitVec 64))

(declare-fun lt!344477 () SeekEntryResult!7918)

(assert (=> b!773745 (= lt!344475 (select (arr!20321 a!3186) (index!34042 lt!344477)))))

(declare-fun c!85579 () Bool)

(assert (=> b!773745 (= c!85579 (= lt!344475 (select (arr!20321 a!3186) j!159)))))

(declare-fun b!773746 () Bool)

(declare-fun c!85580 () Bool)

(assert (=> b!773746 (= c!85580 (= lt!344475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430672 () SeekEntryResult!7918)

(assert (=> b!773746 (= e!430670 e!430672)))

(declare-fun b!773747 () Bool)

(assert (=> b!773747 (= e!430672 (MissingZero!7918 (index!34042 lt!344477)))))

(declare-fun d!101779 () Bool)

(declare-fun lt!344476 () SeekEntryResult!7918)

(assert (=> d!101779 (and (or ((_ is Undefined!7918) lt!344476) (not ((_ is Found!7918) lt!344476)) (and (bvsge (index!34041 lt!344476) #b00000000000000000000000000000000) (bvslt (index!34041 lt!344476) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344476) ((_ is Found!7918) lt!344476) (not ((_ is MissingZero!7918) lt!344476)) (and (bvsge (index!34040 lt!344476) #b00000000000000000000000000000000) (bvslt (index!34040 lt!344476) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344476) ((_ is Found!7918) lt!344476) ((_ is MissingZero!7918) lt!344476) (not ((_ is MissingVacant!7918) lt!344476)) (and (bvsge (index!34043 lt!344476) #b00000000000000000000000000000000) (bvslt (index!34043 lt!344476) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344476) (ite ((_ is Found!7918) lt!344476) (= (select (arr!20321 a!3186) (index!34041 lt!344476)) (select (arr!20321 a!3186) j!159)) (ite ((_ is MissingZero!7918) lt!344476) (= (select (arr!20321 a!3186) (index!34040 lt!344476)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7918) lt!344476) (= (select (arr!20321 a!3186) (index!34043 lt!344476)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101779 (= lt!344476 e!430671)))

(declare-fun c!85581 () Bool)

(assert (=> d!101779 (= c!85581 (and ((_ is Intermediate!7918) lt!344477) (undefined!8730 lt!344477)))))

(assert (=> d!101779 (= lt!344477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20321 a!3186) j!159) mask!3328) (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101779 (validMask!0 mask!3328)))

(assert (=> d!101779 (= (seekEntryOrOpen!0 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344476)))

(declare-fun b!773748 () Bool)

(assert (=> b!773748 (= e!430671 Undefined!7918)))

(declare-fun b!773749 () Bool)

(assert (=> b!773749 (= e!430672 (seekKeyOrZeroReturnVacant!0 (x!64988 lt!344477) (index!34042 lt!344477) (index!34042 lt!344477) (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!773750 () Bool)

(assert (=> b!773750 (= e!430670 (Found!7918 (index!34042 lt!344477)))))

(assert (= (and d!101779 c!85581) b!773748))

(assert (= (and d!101779 (not c!85581)) b!773745))

(assert (= (and b!773745 c!85579) b!773750))

(assert (= (and b!773745 (not c!85579)) b!773746))

(assert (= (and b!773746 c!85580) b!773747))

(assert (= (and b!773746 (not c!85580)) b!773749))

(declare-fun m!717867 () Bool)

(assert (=> b!773745 m!717867))

(assert (=> d!101779 m!717709))

(declare-fun m!717869 () Bool)

(assert (=> d!101779 m!717869))

(assert (=> d!101779 m!717713))

(assert (=> d!101779 m!717747))

(declare-fun m!717871 () Bool)

(assert (=> d!101779 m!717871))

(assert (=> d!101779 m!717747))

(assert (=> d!101779 m!717713))

(assert (=> d!101779 m!717749))

(declare-fun m!717873 () Bool)

(assert (=> d!101779 m!717873))

(assert (=> b!773749 m!717713))

(declare-fun m!717875 () Bool)

(assert (=> b!773749 m!717875))

(assert (=> b!773569 d!101779))

(declare-fun d!101781 () Bool)

(assert (=> d!101781 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67004 d!101781))

(declare-fun d!101783 () Bool)

(assert (=> d!101783 (= (array_inv!16204 a!3186) (bvsge (size!20742 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67004 d!101783))

(declare-fun d!101785 () Bool)

(assert (=> d!101785 (= (validKeyInArray!0 (select (arr!20321 a!3186) j!159)) (and (not (= (select (arr!20321 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20321 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!773580 d!101785))

(declare-fun b!773759 () Bool)

(declare-fun e!430681 () Bool)

(declare-fun e!430679 () Bool)

(assert (=> b!773759 (= e!430681 e!430679)))

(declare-fun lt!344484 () (_ BitVec 64))

(assert (=> b!773759 (= lt!344484 (select (arr!20321 a!3186) j!159))))

(declare-fun lt!344485 () Unit!26666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42447 (_ BitVec 64) (_ BitVec 32)) Unit!26666)

(assert (=> b!773759 (= lt!344485 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344484 j!159))))

(assert (=> b!773759 (arrayContainsKey!0 a!3186 lt!344484 #b00000000000000000000000000000000)))

(declare-fun lt!344486 () Unit!26666)

(assert (=> b!773759 (= lt!344486 lt!344485)))

(declare-fun res!523389 () Bool)

(assert (=> b!773759 (= res!523389 (= (seekEntryOrOpen!0 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) (Found!7918 j!159)))))

(assert (=> b!773759 (=> (not res!523389) (not e!430679))))

(declare-fun b!773760 () Bool)

(declare-fun e!430680 () Bool)

(assert (=> b!773760 (= e!430680 e!430681)))

(declare-fun c!85584 () Bool)

(assert (=> b!773760 (= c!85584 (validKeyInArray!0 (select (arr!20321 a!3186) j!159)))))

(declare-fun bm!35125 () Bool)

(declare-fun call!35128 () Bool)

(assert (=> bm!35125 (= call!35128 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!773761 () Bool)

(assert (=> b!773761 (= e!430681 call!35128)))

(declare-fun b!773762 () Bool)

(assert (=> b!773762 (= e!430679 call!35128)))

(declare-fun d!101787 () Bool)

(declare-fun res!523388 () Bool)

(assert (=> d!101787 (=> res!523388 e!430680)))

(assert (=> d!101787 (= res!523388 (bvsge j!159 (size!20742 a!3186)))))

(assert (=> d!101787 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!430680)))

(assert (= (and d!101787 (not res!523388)) b!773760))

(assert (= (and b!773760 c!85584) b!773759))

(assert (= (and b!773760 (not c!85584)) b!773761))

(assert (= (and b!773759 res!523389) b!773762))

(assert (= (or b!773762 b!773761) bm!35125))

(assert (=> b!773759 m!717713))

(declare-fun m!717877 () Bool)

(assert (=> b!773759 m!717877))

(declare-fun m!717879 () Bool)

(assert (=> b!773759 m!717879))

(assert (=> b!773759 m!717713))

(assert (=> b!773759 m!717755))

(assert (=> b!773760 m!717713))

(assert (=> b!773760 m!717713))

(assert (=> b!773760 m!717757))

(declare-fun m!717881 () Bool)

(assert (=> bm!35125 m!717881))

(assert (=> b!773571 d!101787))

(declare-fun d!101793 () Bool)

(assert (=> d!101793 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!344489 () Unit!26666)

(declare-fun choose!38 (array!42447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26666)

(assert (=> d!101793 (= lt!344489 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101793 (validMask!0 mask!3328)))

(assert (=> d!101793 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!344489)))

(declare-fun bs!21597 () Bool)

(assert (= bs!21597 d!101793))

(assert (=> bs!21597 m!717723))

(declare-fun m!717883 () Bool)

(assert (=> bs!21597 m!717883))

(assert (=> bs!21597 m!717709))

(assert (=> b!773571 d!101793))

(declare-fun b!773878 () Bool)

(declare-fun e!430751 () SeekEntryResult!7918)

(declare-fun e!430752 () SeekEntryResult!7918)

(assert (=> b!773878 (= e!430751 e!430752)))

(declare-fun c!85625 () Bool)

(declare-fun lt!344539 () (_ BitVec 64))

(assert (=> b!773878 (= c!85625 (or (= lt!344539 (select (arr!20321 a!3186) j!159)) (= (bvadd lt!344539 lt!344539) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773879 () Bool)

(declare-fun lt!344538 () SeekEntryResult!7918)

(assert (=> b!773879 (and (bvsge (index!34042 lt!344538) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344538) (size!20742 a!3186)))))

(declare-fun res!523428 () Bool)

(assert (=> b!773879 (= res!523428 (= (select (arr!20321 a!3186) (index!34042 lt!344538)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430749 () Bool)

(assert (=> b!773879 (=> res!523428 e!430749)))

(declare-fun b!773880 () Bool)

(assert (=> b!773880 (= e!430751 (Intermediate!7918 true lt!344383 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!773881 () Bool)

(assert (=> b!773881 (= e!430752 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344383 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!773882 () Bool)

(declare-fun e!430748 () Bool)

(assert (=> b!773882 (= e!430748 (bvsge (x!64988 lt!344538) #b01111111111111111111111111111110))))

(declare-fun b!773883 () Bool)

(assert (=> b!773883 (= e!430752 (Intermediate!7918 false lt!344383 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!773884 () Bool)

(assert (=> b!773884 (and (bvsge (index!34042 lt!344538) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344538) (size!20742 a!3186)))))

(declare-fun res!523427 () Bool)

(assert (=> b!773884 (= res!523427 (= (select (arr!20321 a!3186) (index!34042 lt!344538)) (select (arr!20321 a!3186) j!159)))))

(assert (=> b!773884 (=> res!523427 e!430749)))

(declare-fun e!430750 () Bool)

(assert (=> b!773884 (= e!430750 e!430749)))

(declare-fun d!101795 () Bool)

(assert (=> d!101795 e!430748))

(declare-fun c!85627 () Bool)

(assert (=> d!101795 (= c!85627 (and ((_ is Intermediate!7918) lt!344538) (undefined!8730 lt!344538)))))

(assert (=> d!101795 (= lt!344538 e!430751)))

(declare-fun c!85626 () Bool)

(assert (=> d!101795 (= c!85626 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101795 (= lt!344539 (select (arr!20321 a!3186) lt!344383))))

(assert (=> d!101795 (validMask!0 mask!3328)))

(assert (=> d!101795 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344383 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344538)))

(declare-fun b!773885 () Bool)

(assert (=> b!773885 (= e!430748 e!430750)))

(declare-fun res!523426 () Bool)

(assert (=> b!773885 (= res!523426 (and ((_ is Intermediate!7918) lt!344538) (not (undefined!8730 lt!344538)) (bvslt (x!64988 lt!344538) #b01111111111111111111111111111110) (bvsge (x!64988 lt!344538) #b00000000000000000000000000000000) (bvsge (x!64988 lt!344538) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!773885 (=> (not res!523426) (not e!430750))))

(declare-fun b!773886 () Bool)

(assert (=> b!773886 (and (bvsge (index!34042 lt!344538) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344538) (size!20742 a!3186)))))

(assert (=> b!773886 (= e!430749 (= (select (arr!20321 a!3186) (index!34042 lt!344538)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101795 c!85626) b!773880))

(assert (= (and d!101795 (not c!85626)) b!773878))

(assert (= (and b!773878 c!85625) b!773883))

(assert (= (and b!773878 (not c!85625)) b!773881))

(assert (= (and d!101795 c!85627) b!773882))

(assert (= (and d!101795 (not c!85627)) b!773885))

(assert (= (and b!773885 res!523426) b!773884))

(assert (= (and b!773884 (not res!523427)) b!773879))

(assert (= (and b!773879 (not res!523428)) b!773886))

(declare-fun m!717949 () Bool)

(assert (=> b!773879 m!717949))

(declare-fun m!717951 () Bool)

(assert (=> d!101795 m!717951))

(assert (=> d!101795 m!717709))

(assert (=> b!773884 m!717949))

(declare-fun m!717953 () Bool)

(assert (=> b!773881 m!717953))

(assert (=> b!773881 m!717953))

(assert (=> b!773881 m!717713))

(declare-fun m!717955 () Bool)

(assert (=> b!773881 m!717955))

(assert (=> b!773886 m!717949))

(assert (=> b!773582 d!101795))

(declare-fun b!773932 () Bool)

(declare-fun e!430785 () SeekEntryResult!7918)

(assert (=> b!773932 (= e!430785 (Found!7918 resIntermediateIndex!5))))

(declare-fun b!773933 () Bool)

(declare-fun e!430784 () SeekEntryResult!7918)

(assert (=> b!773933 (= e!430784 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344562 () SeekEntryResult!7918)

(declare-fun d!101821 () Bool)

(assert (=> d!101821 (and (or ((_ is Undefined!7918) lt!344562) (not ((_ is Found!7918) lt!344562)) (and (bvsge (index!34041 lt!344562) #b00000000000000000000000000000000) (bvslt (index!34041 lt!344562) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344562) ((_ is Found!7918) lt!344562) (not ((_ is MissingVacant!7918) lt!344562)) (not (= (index!34043 lt!344562) resIntermediateIndex!5)) (and (bvsge (index!34043 lt!344562) #b00000000000000000000000000000000) (bvslt (index!34043 lt!344562) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344562) (ite ((_ is Found!7918) lt!344562) (= (select (arr!20321 a!3186) (index!34041 lt!344562)) (select (arr!20321 a!3186) j!159)) (and ((_ is MissingVacant!7918) lt!344562) (= (index!34043 lt!344562) resIntermediateIndex!5) (= (select (arr!20321 a!3186) (index!34043 lt!344562)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430783 () SeekEntryResult!7918)

(assert (=> d!101821 (= lt!344562 e!430783)))

(declare-fun c!85644 () Bool)

(assert (=> d!101821 (= c!85644 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!344561 () (_ BitVec 64))

(assert (=> d!101821 (= lt!344561 (select (arr!20321 a!3186) resIntermediateIndex!5))))

(assert (=> d!101821 (validMask!0 mask!3328)))

(assert (=> d!101821 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344562)))

(declare-fun b!773934 () Bool)

(assert (=> b!773934 (= e!430783 e!430785)))

(declare-fun c!85645 () Bool)

(assert (=> b!773934 (= c!85645 (= lt!344561 (select (arr!20321 a!3186) j!159)))))

(declare-fun b!773935 () Bool)

(assert (=> b!773935 (= e!430784 (MissingVacant!7918 resIntermediateIndex!5))))

(declare-fun b!773936 () Bool)

(declare-fun c!85643 () Bool)

(assert (=> b!773936 (= c!85643 (= lt!344561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773936 (= e!430785 e!430784)))

(declare-fun b!773937 () Bool)

(assert (=> b!773937 (= e!430783 Undefined!7918)))

(assert (= (and d!101821 c!85644) b!773937))

(assert (= (and d!101821 (not c!85644)) b!773934))

(assert (= (and b!773934 c!85645) b!773932))

(assert (= (and b!773934 (not c!85645)) b!773936))

(assert (= (and b!773936 c!85643) b!773935))

(assert (= (and b!773936 (not c!85643)) b!773933))

(declare-fun m!717981 () Bool)

(assert (=> b!773933 m!717981))

(assert (=> b!773933 m!717981))

(assert (=> b!773933 m!717713))

(declare-fun m!717983 () Bool)

(assert (=> b!773933 m!717983))

(declare-fun m!717985 () Bool)

(assert (=> d!101821 m!717985))

(declare-fun m!717987 () Bool)

(assert (=> d!101821 m!717987))

(assert (=> d!101821 m!717719))

(assert (=> d!101821 m!717709))

(assert (=> b!773567 d!101821))

(declare-fun b!773938 () Bool)

(declare-fun e!430788 () Bool)

(declare-fun e!430786 () Bool)

(assert (=> b!773938 (= e!430788 e!430786)))

(declare-fun lt!344563 () (_ BitVec 64))

(assert (=> b!773938 (= lt!344563 (select (arr!20321 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!344564 () Unit!26666)

(assert (=> b!773938 (= lt!344564 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344563 #b00000000000000000000000000000000))))

(assert (=> b!773938 (arrayContainsKey!0 a!3186 lt!344563 #b00000000000000000000000000000000)))

(declare-fun lt!344565 () Unit!26666)

(assert (=> b!773938 (= lt!344565 lt!344564)))

(declare-fun res!523445 () Bool)

(assert (=> b!773938 (= res!523445 (= (seekEntryOrOpen!0 (select (arr!20321 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7918 #b00000000000000000000000000000000)))))

(assert (=> b!773938 (=> (not res!523445) (not e!430786))))

(declare-fun b!773939 () Bool)

(declare-fun e!430787 () Bool)

(assert (=> b!773939 (= e!430787 e!430788)))

(declare-fun c!85646 () Bool)

(assert (=> b!773939 (= c!85646 (validKeyInArray!0 (select (arr!20321 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35136 () Bool)

(declare-fun call!35139 () Bool)

(assert (=> bm!35136 (= call!35139 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!773940 () Bool)

(assert (=> b!773940 (= e!430788 call!35139)))

(declare-fun b!773941 () Bool)

(assert (=> b!773941 (= e!430786 call!35139)))

(declare-fun d!101833 () Bool)

(declare-fun res!523444 () Bool)

(assert (=> d!101833 (=> res!523444 e!430787)))

(assert (=> d!101833 (= res!523444 (bvsge #b00000000000000000000000000000000 (size!20742 a!3186)))))

(assert (=> d!101833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!430787)))

(assert (= (and d!101833 (not res!523444)) b!773939))

(assert (= (and b!773939 c!85646) b!773938))

(assert (= (and b!773939 (not c!85646)) b!773940))

(assert (= (and b!773938 res!523445) b!773941))

(assert (= (or b!773941 b!773940) bm!35136))

(declare-fun m!717989 () Bool)

(assert (=> b!773938 m!717989))

(declare-fun m!717991 () Bool)

(assert (=> b!773938 m!717991))

(declare-fun m!717993 () Bool)

(assert (=> b!773938 m!717993))

(assert (=> b!773938 m!717989))

(declare-fun m!717995 () Bool)

(assert (=> b!773938 m!717995))

(assert (=> b!773939 m!717989))

(assert (=> b!773939 m!717989))

(declare-fun m!717997 () Bool)

(assert (=> b!773939 m!717997))

(declare-fun m!717999 () Bool)

(assert (=> bm!35136 m!717999))

(assert (=> b!773578 d!101833))

(declare-fun b!773942 () Bool)

(declare-fun e!430792 () SeekEntryResult!7918)

(declare-fun e!430793 () SeekEntryResult!7918)

(assert (=> b!773942 (= e!430792 e!430793)))

(declare-fun c!85647 () Bool)

(declare-fun lt!344567 () (_ BitVec 64))

(assert (=> b!773942 (= c!85647 (or (= lt!344567 (select (arr!20321 a!3186) j!159)) (= (bvadd lt!344567 lt!344567) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773943 () Bool)

(declare-fun lt!344566 () SeekEntryResult!7918)

(assert (=> b!773943 (and (bvsge (index!34042 lt!344566) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344566) (size!20742 a!3186)))))

(declare-fun res!523448 () Bool)

(assert (=> b!773943 (= res!523448 (= (select (arr!20321 a!3186) (index!34042 lt!344566)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430790 () Bool)

(assert (=> b!773943 (=> res!523448 e!430790)))

(declare-fun b!773944 () Bool)

(assert (=> b!773944 (= e!430792 (Intermediate!7918 true (toIndex!0 (select (arr!20321 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!773945 () Bool)

(assert (=> b!773945 (= e!430793 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20321 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!773946 () Bool)

(declare-fun e!430789 () Bool)

(assert (=> b!773946 (= e!430789 (bvsge (x!64988 lt!344566) #b01111111111111111111111111111110))))

(declare-fun b!773947 () Bool)

(assert (=> b!773947 (= e!430793 (Intermediate!7918 false (toIndex!0 (select (arr!20321 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!773948 () Bool)

(assert (=> b!773948 (and (bvsge (index!34042 lt!344566) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344566) (size!20742 a!3186)))))

(declare-fun res!523447 () Bool)

(assert (=> b!773948 (= res!523447 (= (select (arr!20321 a!3186) (index!34042 lt!344566)) (select (arr!20321 a!3186) j!159)))))

(assert (=> b!773948 (=> res!523447 e!430790)))

(declare-fun e!430791 () Bool)

(assert (=> b!773948 (= e!430791 e!430790)))

(declare-fun d!101835 () Bool)

(assert (=> d!101835 e!430789))

(declare-fun c!85649 () Bool)

(assert (=> d!101835 (= c!85649 (and ((_ is Intermediate!7918) lt!344566) (undefined!8730 lt!344566)))))

(assert (=> d!101835 (= lt!344566 e!430792)))

(declare-fun c!85648 () Bool)

(assert (=> d!101835 (= c!85648 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101835 (= lt!344567 (select (arr!20321 a!3186) (toIndex!0 (select (arr!20321 a!3186) j!159) mask!3328)))))

(assert (=> d!101835 (validMask!0 mask!3328)))

(assert (=> d!101835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20321 a!3186) j!159) mask!3328) (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344566)))

(declare-fun b!773949 () Bool)

(assert (=> b!773949 (= e!430789 e!430791)))

(declare-fun res!523446 () Bool)

(assert (=> b!773949 (= res!523446 (and ((_ is Intermediate!7918) lt!344566) (not (undefined!8730 lt!344566)) (bvslt (x!64988 lt!344566) #b01111111111111111111111111111110) (bvsge (x!64988 lt!344566) #b00000000000000000000000000000000) (bvsge (x!64988 lt!344566) #b00000000000000000000000000000000)))))

(assert (=> b!773949 (=> (not res!523446) (not e!430791))))

(declare-fun b!773950 () Bool)

(assert (=> b!773950 (and (bvsge (index!34042 lt!344566) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344566) (size!20742 a!3186)))))

(assert (=> b!773950 (= e!430790 (= (select (arr!20321 a!3186) (index!34042 lt!344566)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101835 c!85648) b!773944))

(assert (= (and d!101835 (not c!85648)) b!773942))

(assert (= (and b!773942 c!85647) b!773947))

(assert (= (and b!773942 (not c!85647)) b!773945))

(assert (= (and d!101835 c!85649) b!773946))

(assert (= (and d!101835 (not c!85649)) b!773949))

(assert (= (and b!773949 res!523446) b!773948))

(assert (= (and b!773948 (not res!523447)) b!773943))

(assert (= (and b!773943 (not res!523448)) b!773950))

(declare-fun m!718001 () Bool)

(assert (=> b!773943 m!718001))

(assert (=> d!101835 m!717747))

(declare-fun m!718003 () Bool)

(assert (=> d!101835 m!718003))

(assert (=> d!101835 m!717709))

(assert (=> b!773948 m!718001))

(assert (=> b!773945 m!717747))

(declare-fun m!718005 () Bool)

(assert (=> b!773945 m!718005))

(assert (=> b!773945 m!718005))

(assert (=> b!773945 m!717713))

(declare-fun m!718007 () Bool)

(assert (=> b!773945 m!718007))

(assert (=> b!773950 m!718001))

(assert (=> b!773577 d!101835))

(declare-fun d!101841 () Bool)

(declare-fun lt!344579 () (_ BitVec 32))

(declare-fun lt!344578 () (_ BitVec 32))

(assert (=> d!101841 (= lt!344579 (bvmul (bvxor lt!344578 (bvlshr lt!344578 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101841 (= lt!344578 ((_ extract 31 0) (bvand (bvxor (select (arr!20321 a!3186) j!159) (bvlshr (select (arr!20321 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101841 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523449 (let ((h!15467 ((_ extract 31 0) (bvand (bvxor (select (arr!20321 a!3186) j!159) (bvlshr (select (arr!20321 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64999 (bvmul (bvxor h!15467 (bvlshr h!15467 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64999 (bvlshr x!64999 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523449 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523449 #b00000000000000000000000000000000))))))

(assert (=> d!101841 (= (toIndex!0 (select (arr!20321 a!3186) j!159) mask!3328) (bvand (bvxor lt!344579 (bvlshr lt!344579 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!773577 d!101841))

(declare-fun b!773978 () Bool)

(declare-fun e!430811 () SeekEntryResult!7918)

(assert (=> b!773978 (= e!430811 (Found!7918 index!1321))))

(declare-fun b!773979 () Bool)

(declare-fun e!430810 () SeekEntryResult!7918)

(assert (=> b!773979 (= e!430810 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344581 () SeekEntryResult!7918)

(declare-fun d!101843 () Bool)

(assert (=> d!101843 (and (or ((_ is Undefined!7918) lt!344581) (not ((_ is Found!7918) lt!344581)) (and (bvsge (index!34041 lt!344581) #b00000000000000000000000000000000) (bvslt (index!34041 lt!344581) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344581) ((_ is Found!7918) lt!344581) (not ((_ is MissingVacant!7918) lt!344581)) (not (= (index!34043 lt!344581) resIntermediateIndex!5)) (and (bvsge (index!34043 lt!344581) #b00000000000000000000000000000000) (bvslt (index!34043 lt!344581) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344581) (ite ((_ is Found!7918) lt!344581) (= (select (arr!20321 a!3186) (index!34041 lt!344581)) (select (arr!20321 a!3186) j!159)) (and ((_ is MissingVacant!7918) lt!344581) (= (index!34043 lt!344581) resIntermediateIndex!5) (= (select (arr!20321 a!3186) (index!34043 lt!344581)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430809 () SeekEntryResult!7918)

(assert (=> d!101843 (= lt!344581 e!430809)))

(declare-fun c!85660 () Bool)

(assert (=> d!101843 (= c!85660 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344580 () (_ BitVec 64))

(assert (=> d!101843 (= lt!344580 (select (arr!20321 a!3186) index!1321))))

(assert (=> d!101843 (validMask!0 mask!3328)))

(assert (=> d!101843 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344581)))

(declare-fun b!773980 () Bool)

(assert (=> b!773980 (= e!430809 e!430811)))

(declare-fun c!85661 () Bool)

(assert (=> b!773980 (= c!85661 (= lt!344580 (select (arr!20321 a!3186) j!159)))))

(declare-fun b!773981 () Bool)

(assert (=> b!773981 (= e!430810 (MissingVacant!7918 resIntermediateIndex!5))))

(declare-fun b!773982 () Bool)

(declare-fun c!85659 () Bool)

(assert (=> b!773982 (= c!85659 (= lt!344580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773982 (= e!430811 e!430810)))

(declare-fun b!773983 () Bool)

(assert (=> b!773983 (= e!430809 Undefined!7918)))

(assert (= (and d!101843 c!85660) b!773983))

(assert (= (and d!101843 (not c!85660)) b!773980))

(assert (= (and b!773980 c!85661) b!773978))

(assert (= (and b!773980 (not c!85661)) b!773982))

(assert (= (and b!773982 c!85659) b!773981))

(assert (= (and b!773982 (not c!85659)) b!773979))

(assert (=> b!773979 m!717745))

(assert (=> b!773979 m!717745))

(assert (=> b!773979 m!717713))

(declare-fun m!718015 () Bool)

(assert (=> b!773979 m!718015))

(declare-fun m!718017 () Bool)

(assert (=> d!101843 m!718017))

(declare-fun m!718019 () Bool)

(assert (=> d!101843 m!718019))

(declare-fun m!718021 () Bool)

(assert (=> d!101843 m!718021))

(assert (=> d!101843 m!717709))

(assert (=> b!773588 d!101843))

(declare-fun b!773984 () Bool)

(declare-fun e!430814 () SeekEntryResult!7918)

(assert (=> b!773984 (= e!430814 (Found!7918 lt!344383))))

(declare-fun b!773985 () Bool)

(declare-fun e!430813 () SeekEntryResult!7918)

(assert (=> b!773985 (= e!430813 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344383 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101847 () Bool)

(declare-fun lt!344583 () SeekEntryResult!7918)

(assert (=> d!101847 (and (or ((_ is Undefined!7918) lt!344583) (not ((_ is Found!7918) lt!344583)) (and (bvsge (index!34041 lt!344583) #b00000000000000000000000000000000) (bvslt (index!34041 lt!344583) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344583) ((_ is Found!7918) lt!344583) (not ((_ is MissingVacant!7918) lt!344583)) (not (= (index!34043 lt!344583) resIntermediateIndex!5)) (and (bvsge (index!34043 lt!344583) #b00000000000000000000000000000000) (bvslt (index!34043 lt!344583) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344583) (ite ((_ is Found!7918) lt!344583) (= (select (arr!20321 a!3186) (index!34041 lt!344583)) (select (arr!20321 a!3186) j!159)) (and ((_ is MissingVacant!7918) lt!344583) (= (index!34043 lt!344583) resIntermediateIndex!5) (= (select (arr!20321 a!3186) (index!34043 lt!344583)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430812 () SeekEntryResult!7918)

(assert (=> d!101847 (= lt!344583 e!430812)))

(declare-fun c!85663 () Bool)

(assert (=> d!101847 (= c!85663 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!344582 () (_ BitVec 64))

(assert (=> d!101847 (= lt!344582 (select (arr!20321 a!3186) lt!344383))))

(assert (=> d!101847 (validMask!0 mask!3328)))

(assert (=> d!101847 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344383 resIntermediateIndex!5 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344583)))

(declare-fun b!773986 () Bool)

(assert (=> b!773986 (= e!430812 e!430814)))

(declare-fun c!85664 () Bool)

(assert (=> b!773986 (= c!85664 (= lt!344582 (select (arr!20321 a!3186) j!159)))))

(declare-fun b!773987 () Bool)

(assert (=> b!773987 (= e!430813 (MissingVacant!7918 resIntermediateIndex!5))))

(declare-fun b!773988 () Bool)

(declare-fun c!85662 () Bool)

(assert (=> b!773988 (= c!85662 (= lt!344582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773988 (= e!430814 e!430813)))

(declare-fun b!773989 () Bool)

(assert (=> b!773989 (= e!430812 Undefined!7918)))

(assert (= (and d!101847 c!85663) b!773989))

(assert (= (and d!101847 (not c!85663)) b!773986))

(assert (= (and b!773986 c!85664) b!773984))

(assert (= (and b!773986 (not c!85664)) b!773988))

(assert (= (and b!773988 c!85662) b!773987))

(assert (= (and b!773988 (not c!85662)) b!773985))

(assert (=> b!773985 m!717953))

(assert (=> b!773985 m!717953))

(assert (=> b!773985 m!717713))

(declare-fun m!718023 () Bool)

(assert (=> b!773985 m!718023))

(declare-fun m!718025 () Bool)

(assert (=> d!101847 m!718025))

(declare-fun m!718029 () Bool)

(assert (=> d!101847 m!718029))

(assert (=> d!101847 m!717951))

(assert (=> d!101847 m!717709))

(assert (=> b!773588 d!101847))

(declare-fun b!773999 () Bool)

(declare-fun e!430821 () SeekEntryResult!7918)

(declare-fun e!430820 () SeekEntryResult!7918)

(assert (=> b!773999 (= e!430821 e!430820)))

(declare-fun lt!344586 () (_ BitVec 64))

(declare-fun lt!344588 () SeekEntryResult!7918)

(assert (=> b!773999 (= lt!344586 (select (arr!20321 a!3186) (index!34042 lt!344588)))))

(declare-fun c!85668 () Bool)

(assert (=> b!773999 (= c!85668 (= lt!344586 k0!2102))))

(declare-fun b!774000 () Bool)

(declare-fun c!85669 () Bool)

(assert (=> b!774000 (= c!85669 (= lt!344586 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430822 () SeekEntryResult!7918)

(assert (=> b!774000 (= e!430820 e!430822)))

(declare-fun b!774001 () Bool)

(assert (=> b!774001 (= e!430822 (MissingZero!7918 (index!34042 lt!344588)))))

(declare-fun d!101851 () Bool)

(declare-fun lt!344587 () SeekEntryResult!7918)

(assert (=> d!101851 (and (or ((_ is Undefined!7918) lt!344587) (not ((_ is Found!7918) lt!344587)) (and (bvsge (index!34041 lt!344587) #b00000000000000000000000000000000) (bvslt (index!34041 lt!344587) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344587) ((_ is Found!7918) lt!344587) (not ((_ is MissingZero!7918) lt!344587)) (and (bvsge (index!34040 lt!344587) #b00000000000000000000000000000000) (bvslt (index!34040 lt!344587) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344587) ((_ is Found!7918) lt!344587) ((_ is MissingZero!7918) lt!344587) (not ((_ is MissingVacant!7918) lt!344587)) (and (bvsge (index!34043 lt!344587) #b00000000000000000000000000000000) (bvslt (index!34043 lt!344587) (size!20742 a!3186)))) (or ((_ is Undefined!7918) lt!344587) (ite ((_ is Found!7918) lt!344587) (= (select (arr!20321 a!3186) (index!34041 lt!344587)) k0!2102) (ite ((_ is MissingZero!7918) lt!344587) (= (select (arr!20321 a!3186) (index!34040 lt!344587)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7918) lt!344587) (= (select (arr!20321 a!3186) (index!34043 lt!344587)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101851 (= lt!344587 e!430821)))

(declare-fun c!85670 () Bool)

(assert (=> d!101851 (= c!85670 (and ((_ is Intermediate!7918) lt!344588) (undefined!8730 lt!344588)))))

(assert (=> d!101851 (= lt!344588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101851 (validMask!0 mask!3328)))

(assert (=> d!101851 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!344587)))

(declare-fun b!774002 () Bool)

(assert (=> b!774002 (= e!430821 Undefined!7918)))

(declare-fun b!774003 () Bool)

(assert (=> b!774003 (= e!430822 (seekKeyOrZeroReturnVacant!0 (x!64988 lt!344588) (index!34042 lt!344588) (index!34042 lt!344588) k0!2102 a!3186 mask!3328))))

(declare-fun b!774004 () Bool)

(assert (=> b!774004 (= e!430820 (Found!7918 (index!34042 lt!344588)))))

(assert (= (and d!101851 c!85670) b!774002))

(assert (= (and d!101851 (not c!85670)) b!773999))

(assert (= (and b!773999 c!85668) b!774004))

(assert (= (and b!773999 (not c!85668)) b!774000))

(assert (= (and b!774000 c!85669) b!774001))

(assert (= (and b!774000 (not c!85669)) b!774003))

(declare-fun m!718035 () Bool)

(assert (=> b!773999 m!718035))

(assert (=> d!101851 m!717709))

(declare-fun m!718039 () Bool)

(assert (=> d!101851 m!718039))

(declare-fun m!718041 () Bool)

(assert (=> d!101851 m!718041))

(declare-fun m!718045 () Bool)

(assert (=> d!101851 m!718045))

(assert (=> d!101851 m!718041))

(declare-fun m!718049 () Bool)

(assert (=> d!101851 m!718049))

(declare-fun m!718051 () Bool)

(assert (=> d!101851 m!718051))

(declare-fun m!718053 () Bool)

(assert (=> b!774003 m!718053))

(assert (=> b!773579 d!101851))

(declare-fun b!774011 () Bool)

(declare-fun e!430829 () SeekEntryResult!7918)

(declare-fun e!430830 () SeekEntryResult!7918)

(assert (=> b!774011 (= e!430829 e!430830)))

(declare-fun c!85674 () Bool)

(declare-fun lt!344592 () (_ BitVec 64))

(assert (=> b!774011 (= c!85674 (or (= lt!344592 lt!344386) (= (bvadd lt!344592 lt!344592) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774012 () Bool)

(declare-fun lt!344591 () SeekEntryResult!7918)

(assert (=> b!774012 (and (bvsge (index!34042 lt!344591) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344591) (size!20742 lt!344384)))))

(declare-fun res!523464 () Bool)

(assert (=> b!774012 (= res!523464 (= (select (arr!20321 lt!344384) (index!34042 lt!344591)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430827 () Bool)

(assert (=> b!774012 (=> res!523464 e!430827)))

(declare-fun b!774013 () Bool)

(assert (=> b!774013 (= e!430829 (Intermediate!7918 true index!1321 x!1131))))

(declare-fun b!774014 () Bool)

(assert (=> b!774014 (= e!430830 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!344386 lt!344384 mask!3328))))

(declare-fun b!774015 () Bool)

(declare-fun e!430826 () Bool)

(assert (=> b!774015 (= e!430826 (bvsge (x!64988 lt!344591) #b01111111111111111111111111111110))))

(declare-fun b!774016 () Bool)

(assert (=> b!774016 (= e!430830 (Intermediate!7918 false index!1321 x!1131))))

(declare-fun b!774017 () Bool)

(assert (=> b!774017 (and (bvsge (index!34042 lt!344591) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344591) (size!20742 lt!344384)))))

(declare-fun res!523463 () Bool)

(assert (=> b!774017 (= res!523463 (= (select (arr!20321 lt!344384) (index!34042 lt!344591)) lt!344386))))

(assert (=> b!774017 (=> res!523463 e!430827)))

(declare-fun e!430828 () Bool)

(assert (=> b!774017 (= e!430828 e!430827)))

(declare-fun d!101859 () Bool)

(assert (=> d!101859 e!430826))

(declare-fun c!85676 () Bool)

(assert (=> d!101859 (= c!85676 (and ((_ is Intermediate!7918) lt!344591) (undefined!8730 lt!344591)))))

(assert (=> d!101859 (= lt!344591 e!430829)))

(declare-fun c!85675 () Bool)

(assert (=> d!101859 (= c!85675 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101859 (= lt!344592 (select (arr!20321 lt!344384) index!1321))))

(assert (=> d!101859 (validMask!0 mask!3328)))

(assert (=> d!101859 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344386 lt!344384 mask!3328) lt!344591)))

(declare-fun b!774018 () Bool)

(assert (=> b!774018 (= e!430826 e!430828)))

(declare-fun res!523462 () Bool)

(assert (=> b!774018 (= res!523462 (and ((_ is Intermediate!7918) lt!344591) (not (undefined!8730 lt!344591)) (bvslt (x!64988 lt!344591) #b01111111111111111111111111111110) (bvsge (x!64988 lt!344591) #b00000000000000000000000000000000) (bvsge (x!64988 lt!344591) x!1131)))))

(assert (=> b!774018 (=> (not res!523462) (not e!430828))))

(declare-fun b!774019 () Bool)

(assert (=> b!774019 (and (bvsge (index!34042 lt!344591) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344591) (size!20742 lt!344384)))))

(assert (=> b!774019 (= e!430827 (= (select (arr!20321 lt!344384) (index!34042 lt!344591)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101859 c!85675) b!774013))

(assert (= (and d!101859 (not c!85675)) b!774011))

(assert (= (and b!774011 c!85674) b!774016))

(assert (= (and b!774011 (not c!85674)) b!774014))

(assert (= (and d!101859 c!85676) b!774015))

(assert (= (and d!101859 (not c!85676)) b!774018))

(assert (= (and b!774018 res!523462) b!774017))

(assert (= (and b!774017 (not res!523463)) b!774012))

(assert (= (and b!774012 (not res!523464)) b!774019))

(declare-fun m!718055 () Bool)

(assert (=> b!774012 m!718055))

(declare-fun m!718057 () Bool)

(assert (=> d!101859 m!718057))

(assert (=> d!101859 m!717709))

(assert (=> b!774017 m!718055))

(assert (=> b!774014 m!717745))

(assert (=> b!774014 m!717745))

(declare-fun m!718059 () Bool)

(assert (=> b!774014 m!718059))

(assert (=> b!774019 m!718055))

(assert (=> b!773568 d!101859))

(declare-fun b!774026 () Bool)

(declare-fun e!430840 () SeekEntryResult!7918)

(declare-fun e!430841 () SeekEntryResult!7918)

(assert (=> b!774026 (= e!430840 e!430841)))

(declare-fun c!85679 () Bool)

(declare-fun lt!344598 () (_ BitVec 64))

(assert (=> b!774026 (= c!85679 (or (= lt!344598 lt!344386) (= (bvadd lt!344598 lt!344598) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774027 () Bool)

(declare-fun lt!344597 () SeekEntryResult!7918)

(assert (=> b!774027 (and (bvsge (index!34042 lt!344597) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344597) (size!20742 lt!344384)))))

(declare-fun res!523471 () Bool)

(assert (=> b!774027 (= res!523471 (= (select (arr!20321 lt!344384) (index!34042 lt!344597)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430836 () Bool)

(assert (=> b!774027 (=> res!523471 e!430836)))

(declare-fun b!774028 () Bool)

(assert (=> b!774028 (= e!430840 (Intermediate!7918 true (toIndex!0 lt!344386 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774029 () Bool)

(assert (=> b!774029 (= e!430841 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!344386 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!344386 lt!344384 mask!3328))))

(declare-fun b!774030 () Bool)

(declare-fun e!430835 () Bool)

(assert (=> b!774030 (= e!430835 (bvsge (x!64988 lt!344597) #b01111111111111111111111111111110))))

(declare-fun b!774031 () Bool)

(assert (=> b!774031 (= e!430841 (Intermediate!7918 false (toIndex!0 lt!344386 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774032 () Bool)

(assert (=> b!774032 (and (bvsge (index!34042 lt!344597) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344597) (size!20742 lt!344384)))))

(declare-fun res!523470 () Bool)

(assert (=> b!774032 (= res!523470 (= (select (arr!20321 lt!344384) (index!34042 lt!344597)) lt!344386))))

(assert (=> b!774032 (=> res!523470 e!430836)))

(declare-fun e!430839 () Bool)

(assert (=> b!774032 (= e!430839 e!430836)))

(declare-fun d!101861 () Bool)

(assert (=> d!101861 e!430835))

(declare-fun c!85681 () Bool)

(assert (=> d!101861 (= c!85681 (and ((_ is Intermediate!7918) lt!344597) (undefined!8730 lt!344597)))))

(assert (=> d!101861 (= lt!344597 e!430840)))

(declare-fun c!85680 () Bool)

(assert (=> d!101861 (= c!85680 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101861 (= lt!344598 (select (arr!20321 lt!344384) (toIndex!0 lt!344386 mask!3328)))))

(assert (=> d!101861 (validMask!0 mask!3328)))

(assert (=> d!101861 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344386 mask!3328) lt!344386 lt!344384 mask!3328) lt!344597)))

(declare-fun b!774033 () Bool)

(assert (=> b!774033 (= e!430835 e!430839)))

(declare-fun res!523467 () Bool)

(assert (=> b!774033 (= res!523467 (and ((_ is Intermediate!7918) lt!344597) (not (undefined!8730 lt!344597)) (bvslt (x!64988 lt!344597) #b01111111111111111111111111111110) (bvsge (x!64988 lt!344597) #b00000000000000000000000000000000) (bvsge (x!64988 lt!344597) #b00000000000000000000000000000000)))))

(assert (=> b!774033 (=> (not res!523467) (not e!430839))))

(declare-fun b!774034 () Bool)

(assert (=> b!774034 (and (bvsge (index!34042 lt!344597) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344597) (size!20742 lt!344384)))))

(assert (=> b!774034 (= e!430836 (= (select (arr!20321 lt!344384) (index!34042 lt!344597)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101861 c!85680) b!774028))

(assert (= (and d!101861 (not c!85680)) b!774026))

(assert (= (and b!774026 c!85679) b!774031))

(assert (= (and b!774026 (not c!85679)) b!774029))

(assert (= (and d!101861 c!85681) b!774030))

(assert (= (and d!101861 (not c!85681)) b!774033))

(assert (= (and b!774033 res!523467) b!774032))

(assert (= (and b!774032 (not res!523470)) b!774027))

(assert (= (and b!774027 (not res!523471)) b!774034))

(declare-fun m!718061 () Bool)

(assert (=> b!774027 m!718061))

(assert (=> d!101861 m!717735))

(declare-fun m!718063 () Bool)

(assert (=> d!101861 m!718063))

(assert (=> d!101861 m!717709))

(assert (=> b!774032 m!718061))

(assert (=> b!774029 m!717735))

(declare-fun m!718065 () Bool)

(assert (=> b!774029 m!718065))

(assert (=> b!774029 m!718065))

(declare-fun m!718067 () Bool)

(assert (=> b!774029 m!718067))

(assert (=> b!774034 m!718061))

(assert (=> b!773568 d!101861))

(declare-fun d!101863 () Bool)

(declare-fun lt!344600 () (_ BitVec 32))

(declare-fun lt!344599 () (_ BitVec 32))

(assert (=> d!101863 (= lt!344600 (bvmul (bvxor lt!344599 (bvlshr lt!344599 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101863 (= lt!344599 ((_ extract 31 0) (bvand (bvxor lt!344386 (bvlshr lt!344386 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101863 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523449 (let ((h!15467 ((_ extract 31 0) (bvand (bvxor lt!344386 (bvlshr lt!344386 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64999 (bvmul (bvxor h!15467 (bvlshr h!15467 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64999 (bvlshr x!64999 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523449 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523449 #b00000000000000000000000000000000))))))

(assert (=> d!101863 (= (toIndex!0 lt!344386 mask!3328) (bvand (bvxor lt!344600 (bvlshr lt!344600 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!773568 d!101863))

(declare-fun b!774056 () Bool)

(declare-fun e!430856 () SeekEntryResult!7918)

(declare-fun e!430857 () SeekEntryResult!7918)

(assert (=> b!774056 (= e!430856 e!430857)))

(declare-fun c!85689 () Bool)

(declare-fun lt!344604 () (_ BitVec 64))

(assert (=> b!774056 (= c!85689 (or (= lt!344604 lt!344386) (= (bvadd lt!344604 lt!344604) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774057 () Bool)

(declare-fun lt!344603 () SeekEntryResult!7918)

(assert (=> b!774057 (and (bvsge (index!34042 lt!344603) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344603) (size!20742 lt!344384)))))

(declare-fun res!523479 () Bool)

(assert (=> b!774057 (= res!523479 (= (select (arr!20321 lt!344384) (index!34042 lt!344603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430854 () Bool)

(assert (=> b!774057 (=> res!523479 e!430854)))

(declare-fun b!774058 () Bool)

(assert (=> b!774058 (= e!430856 (Intermediate!7918 true lt!344383 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774059 () Bool)

(assert (=> b!774059 (= e!430857 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344383 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!344386 lt!344384 mask!3328))))

(declare-fun b!774060 () Bool)

(declare-fun e!430853 () Bool)

(assert (=> b!774060 (= e!430853 (bvsge (x!64988 lt!344603) #b01111111111111111111111111111110))))

(declare-fun b!774061 () Bool)

(assert (=> b!774061 (= e!430857 (Intermediate!7918 false lt!344383 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774062 () Bool)

(assert (=> b!774062 (and (bvsge (index!34042 lt!344603) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344603) (size!20742 lt!344384)))))

(declare-fun res!523478 () Bool)

(assert (=> b!774062 (= res!523478 (= (select (arr!20321 lt!344384) (index!34042 lt!344603)) lt!344386))))

(assert (=> b!774062 (=> res!523478 e!430854)))

(declare-fun e!430855 () Bool)

(assert (=> b!774062 (= e!430855 e!430854)))

(declare-fun d!101867 () Bool)

(assert (=> d!101867 e!430853))

(declare-fun c!85691 () Bool)

(assert (=> d!101867 (= c!85691 (and ((_ is Intermediate!7918) lt!344603) (undefined!8730 lt!344603)))))

(assert (=> d!101867 (= lt!344603 e!430856)))

(declare-fun c!85690 () Bool)

(assert (=> d!101867 (= c!85690 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101867 (= lt!344604 (select (arr!20321 lt!344384) lt!344383))))

(assert (=> d!101867 (validMask!0 mask!3328)))

(assert (=> d!101867 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344383 lt!344386 lt!344384 mask!3328) lt!344603)))

(declare-fun b!774063 () Bool)

(assert (=> b!774063 (= e!430853 e!430855)))

(declare-fun res!523477 () Bool)

(assert (=> b!774063 (= res!523477 (and ((_ is Intermediate!7918) lt!344603) (not (undefined!8730 lt!344603)) (bvslt (x!64988 lt!344603) #b01111111111111111111111111111110) (bvsge (x!64988 lt!344603) #b00000000000000000000000000000000) (bvsge (x!64988 lt!344603) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!774063 (=> (not res!523477) (not e!430855))))

(declare-fun b!774064 () Bool)

(assert (=> b!774064 (and (bvsge (index!34042 lt!344603) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344603) (size!20742 lt!344384)))))

(assert (=> b!774064 (= e!430854 (= (select (arr!20321 lt!344384) (index!34042 lt!344603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101867 c!85690) b!774058))

(assert (= (and d!101867 (not c!85690)) b!774056))

(assert (= (and b!774056 c!85689) b!774061))

(assert (= (and b!774056 (not c!85689)) b!774059))

(assert (= (and d!101867 c!85691) b!774060))

(assert (= (and d!101867 (not c!85691)) b!774063))

(assert (= (and b!774063 res!523477) b!774062))

(assert (= (and b!774062 (not res!523478)) b!774057))

(assert (= (and b!774057 (not res!523479)) b!774064))

(declare-fun m!718079 () Bool)

(assert (=> b!774057 m!718079))

(declare-fun m!718081 () Bool)

(assert (=> d!101867 m!718081))

(assert (=> d!101867 m!717709))

(assert (=> b!774062 m!718079))

(assert (=> b!774059 m!717953))

(assert (=> b!774059 m!717953))

(declare-fun m!718083 () Bool)

(assert (=> b!774059 m!718083))

(assert (=> b!774064 m!718079))

(assert (=> b!773575 d!101867))

(assert (=> b!773586 d!101843))

(declare-fun d!101871 () Bool)

(declare-fun res!523485 () Bool)

(declare-fun e!430868 () Bool)

(assert (=> d!101871 (=> res!523485 e!430868)))

(assert (=> d!101871 (= res!523485 (= (select (arr!20321 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101871 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!430868)))

(declare-fun b!774081 () Bool)

(declare-fun e!430869 () Bool)

(assert (=> b!774081 (= e!430868 e!430869)))

(declare-fun res!523486 () Bool)

(assert (=> b!774081 (=> (not res!523486) (not e!430869))))

(assert (=> b!774081 (= res!523486 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20742 a!3186)))))

(declare-fun b!774082 () Bool)

(assert (=> b!774082 (= e!430869 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101871 (not res!523485)) b!774081))

(assert (= (and b!774081 res!523486) b!774082))

(assert (=> d!101871 m!717989))

(declare-fun m!718097 () Bool)

(assert (=> b!774082 m!718097))

(assert (=> b!773585 d!101871))

(declare-fun bm!35139 () Bool)

(declare-fun call!35142 () Bool)

(declare-fun c!85700 () Bool)

(assert (=> bm!35139 (= call!35142 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85700 (Cons!14358 (select (arr!20321 a!3186) #b00000000000000000000000000000000) Nil!14359) Nil!14359)))))

(declare-fun b!774093 () Bool)

(declare-fun e!430878 () Bool)

(declare-fun e!430879 () Bool)

(assert (=> b!774093 (= e!430878 e!430879)))

(assert (=> b!774093 (= c!85700 (validKeyInArray!0 (select (arr!20321 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101877 () Bool)

(declare-fun res!523495 () Bool)

(declare-fun e!430881 () Bool)

(assert (=> d!101877 (=> res!523495 e!430881)))

(assert (=> d!101877 (= res!523495 (bvsge #b00000000000000000000000000000000 (size!20742 a!3186)))))

(assert (=> d!101877 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14359) e!430881)))

(declare-fun b!774094 () Bool)

(assert (=> b!774094 (= e!430879 call!35142)))

(declare-fun b!774095 () Bool)

(assert (=> b!774095 (= e!430881 e!430878)))

(declare-fun res!523494 () Bool)

(assert (=> b!774095 (=> (not res!523494) (not e!430878))))

(declare-fun e!430880 () Bool)

(assert (=> b!774095 (= res!523494 (not e!430880))))

(declare-fun res!523493 () Bool)

(assert (=> b!774095 (=> (not res!523493) (not e!430880))))

(assert (=> b!774095 (= res!523493 (validKeyInArray!0 (select (arr!20321 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774096 () Bool)

(assert (=> b!774096 (= e!430879 call!35142)))

(declare-fun b!774097 () Bool)

(declare-fun contains!4076 (List!14362 (_ BitVec 64)) Bool)

(assert (=> b!774097 (= e!430880 (contains!4076 Nil!14359 (select (arr!20321 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101877 (not res!523495)) b!774095))

(assert (= (and b!774095 res!523493) b!774097))

(assert (= (and b!774095 res!523494) b!774093))

(assert (= (and b!774093 c!85700) b!774096))

(assert (= (and b!774093 (not c!85700)) b!774094))

(assert (= (or b!774096 b!774094) bm!35139))

(assert (=> bm!35139 m!717989))

(declare-fun m!718099 () Bool)

(assert (=> bm!35139 m!718099))

(assert (=> b!774093 m!717989))

(assert (=> b!774093 m!717989))

(assert (=> b!774093 m!717997))

(assert (=> b!774095 m!717989))

(assert (=> b!774095 m!717989))

(assert (=> b!774095 m!717997))

(assert (=> b!774097 m!717989))

(assert (=> b!774097 m!717989))

(declare-fun m!718101 () Bool)

(assert (=> b!774097 m!718101))

(assert (=> b!773587 d!101877))

(declare-fun d!101881 () Bool)

(declare-fun lt!344617 () (_ BitVec 32))

(assert (=> d!101881 (and (bvsge lt!344617 #b00000000000000000000000000000000) (bvslt lt!344617 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101881 (= lt!344617 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101881 (validMask!0 mask!3328)))

(assert (=> d!101881 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!344617)))

(declare-fun bs!21602 () Bool)

(assert (= bs!21602 d!101881))

(declare-fun m!718103 () Bool)

(assert (=> bs!21602 m!718103))

(assert (=> bs!21602 m!717709))

(assert (=> b!773566 d!101881))

(assert (=> b!773565 d!101847))

(declare-fun b!774098 () Bool)

(declare-fun e!430885 () SeekEntryResult!7918)

(declare-fun e!430886 () SeekEntryResult!7918)

(assert (=> b!774098 (= e!430885 e!430886)))

(declare-fun c!85701 () Bool)

(declare-fun lt!344619 () (_ BitVec 64))

(assert (=> b!774098 (= c!85701 (or (= lt!344619 (select (arr!20321 a!3186) j!159)) (= (bvadd lt!344619 lt!344619) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774099 () Bool)

(declare-fun lt!344618 () SeekEntryResult!7918)

(assert (=> b!774099 (and (bvsge (index!34042 lt!344618) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344618) (size!20742 a!3186)))))

(declare-fun res!523498 () Bool)

(assert (=> b!774099 (= res!523498 (= (select (arr!20321 a!3186) (index!34042 lt!344618)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430883 () Bool)

(assert (=> b!774099 (=> res!523498 e!430883)))

(declare-fun b!774100 () Bool)

(assert (=> b!774100 (= e!430885 (Intermediate!7918 true index!1321 x!1131))))

(declare-fun b!774101 () Bool)

(assert (=> b!774101 (= e!430886 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20321 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774102 () Bool)

(declare-fun e!430882 () Bool)

(assert (=> b!774102 (= e!430882 (bvsge (x!64988 lt!344618) #b01111111111111111111111111111110))))

(declare-fun b!774103 () Bool)

(assert (=> b!774103 (= e!430886 (Intermediate!7918 false index!1321 x!1131))))

(declare-fun b!774104 () Bool)

(assert (=> b!774104 (and (bvsge (index!34042 lt!344618) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344618) (size!20742 a!3186)))))

(declare-fun res!523497 () Bool)

(assert (=> b!774104 (= res!523497 (= (select (arr!20321 a!3186) (index!34042 lt!344618)) (select (arr!20321 a!3186) j!159)))))

(assert (=> b!774104 (=> res!523497 e!430883)))

(declare-fun e!430884 () Bool)

(assert (=> b!774104 (= e!430884 e!430883)))

(declare-fun d!101883 () Bool)

(assert (=> d!101883 e!430882))

(declare-fun c!85703 () Bool)

(assert (=> d!101883 (= c!85703 (and ((_ is Intermediate!7918) lt!344618) (undefined!8730 lt!344618)))))

(assert (=> d!101883 (= lt!344618 e!430885)))

(declare-fun c!85702 () Bool)

(assert (=> d!101883 (= c!85702 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101883 (= lt!344619 (select (arr!20321 a!3186) index!1321))))

(assert (=> d!101883 (validMask!0 mask!3328)))

(assert (=> d!101883 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20321 a!3186) j!159) a!3186 mask!3328) lt!344618)))

(declare-fun b!774105 () Bool)

(assert (=> b!774105 (= e!430882 e!430884)))

(declare-fun res!523496 () Bool)

(assert (=> b!774105 (= res!523496 (and ((_ is Intermediate!7918) lt!344618) (not (undefined!8730 lt!344618)) (bvslt (x!64988 lt!344618) #b01111111111111111111111111111110) (bvsge (x!64988 lt!344618) #b00000000000000000000000000000000) (bvsge (x!64988 lt!344618) x!1131)))))

(assert (=> b!774105 (=> (not res!523496) (not e!430884))))

(declare-fun b!774106 () Bool)

(assert (=> b!774106 (and (bvsge (index!34042 lt!344618) #b00000000000000000000000000000000) (bvslt (index!34042 lt!344618) (size!20742 a!3186)))))

(assert (=> b!774106 (= e!430883 (= (select (arr!20321 a!3186) (index!34042 lt!344618)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101883 c!85702) b!774100))

(assert (= (and d!101883 (not c!85702)) b!774098))

(assert (= (and b!774098 c!85701) b!774103))

(assert (= (and b!774098 (not c!85701)) b!774101))

(assert (= (and d!101883 c!85703) b!774102))

(assert (= (and d!101883 (not c!85703)) b!774105))

(assert (= (and b!774105 res!523496) b!774104))

(assert (= (and b!774104 (not res!523497)) b!774099))

(assert (= (and b!774099 (not res!523498)) b!774106))

(declare-fun m!718105 () Bool)

(assert (=> b!774099 m!718105))

(assert (=> d!101883 m!718021))

(assert (=> d!101883 m!717709))

(assert (=> b!774104 m!718105))

(assert (=> b!774101 m!717745))

(assert (=> b!774101 m!717745))

(assert (=> b!774101 m!717713))

(declare-fun m!718107 () Bool)

(assert (=> b!774101 m!718107))

(assert (=> b!774106 m!718105))

(assert (=> b!773574 d!101883))

(assert (=> b!773573 d!101795))

(check-sat (not d!101859) (not d!101881) (not b!774095) (not b!773938) (not d!101851) (not b!773760) (not d!101847) (not b!774082) (not b!773979) (not b!773985) (not b!773933) (not d!101843) (not d!101793) (not b!774097) (not d!101883) (not d!101861) (not b!774093) (not b!773749) (not b!773759) (not b!774059) (not bm!35125) (not b!774101) (not d!101795) (not d!101867) (not b!773881) (not d!101821) (not b!774029) (not b!774003) (not b!774014) (not bm!35136) (not bm!35139) (not b!773945) (not d!101835) (not d!101779) (not b!773939))
(check-sat)
