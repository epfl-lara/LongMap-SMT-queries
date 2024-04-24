; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67234 () Bool)

(assert start!67234)

(declare-datatypes ((array!42469 0))(
  ( (array!42470 (arr!20326 (Array (_ BitVec 32) (_ BitVec 64))) (size!20746 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42469)

(declare-fun e!431776 () Bool)

(declare-fun lt!345449 () (_ BitVec 32))

(declare-fun b!775617 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7882 0))(
  ( (MissingZero!7882 (index!33896 (_ BitVec 32))) (Found!7882 (index!33897 (_ BitVec 32))) (Intermediate!7882 (undefined!8694 Bool) (index!33898 (_ BitVec 32)) (x!65004 (_ BitVec 32))) (Undefined!7882) (MissingVacant!7882 (index!33899 (_ BitVec 32))) )
))
(declare-fun lt!345451 () SeekEntryResult!7882)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42469 (_ BitVec 32)) SeekEntryResult!7882)

(assert (=> b!775617 (= e!431776 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345449 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!345451)))))

(declare-fun b!775618 () Bool)

(declare-fun res!524294 () Bool)

(declare-fun e!431769 () Bool)

(assert (=> b!775618 (=> (not res!524294) (not e!431769))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775618 (= res!524294 (and (= (size!20746 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20746 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20746 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!431765 () Bool)

(declare-fun b!775619 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42469 (_ BitVec 32)) SeekEntryResult!7882)

(assert (=> b!775619 (= e!431765 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) (Found!7882 j!159)))))

(declare-fun res!524302 () Bool)

(assert (=> start!67234 (=> (not res!524302) (not e!431769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67234 (= res!524302 (validMask!0 mask!3328))))

(assert (=> start!67234 e!431769))

(assert (=> start!67234 true))

(declare-fun array_inv!16185 (array!42469) Bool)

(assert (=> start!67234 (array_inv!16185 a!3186)))

(declare-fun b!775620 () Bool)

(declare-fun e!431767 () Bool)

(declare-fun e!431773 () Bool)

(assert (=> b!775620 (= e!431767 e!431773)))

(declare-fun res!524298 () Bool)

(assert (=> b!775620 (=> (not res!524298) (not e!431773))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775620 (= res!524298 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20326 a!3186) j!159) mask!3328) (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!345451))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775620 (= lt!345451 (Intermediate!7882 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775621 () Bool)

(declare-fun res!524307 () Bool)

(assert (=> b!775621 (=> (not res!524307) (not e!431773))))

(assert (=> b!775621 (= res!524307 e!431765)))

(declare-fun c!86069 () Bool)

(assert (=> b!775621 (= c!86069 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!431766 () Bool)

(declare-fun b!775622 () Bool)

(declare-fun lt!345455 () SeekEntryResult!7882)

(assert (=> b!775622 (= e!431766 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!345455))))

(declare-fun b!775623 () Bool)

(declare-fun e!431770 () Bool)

(assert (=> b!775623 (= e!431770 true)))

(declare-fun lt!345457 () SeekEntryResult!7882)

(declare-fun lt!345445 () (_ BitVec 64))

(declare-fun lt!345444 () array!42469)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42469 (_ BitVec 32)) SeekEntryResult!7882)

(assert (=> b!775623 (= (seekEntryOrOpen!0 lt!345445 lt!345444 mask!3328) lt!345457)))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-datatypes ((Unit!26719 0))(
  ( (Unit!26720) )
))
(declare-fun lt!345450 () Unit!26719)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26719)

(assert (=> b!775623 (= lt!345450 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345449 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!775624 () Bool)

(declare-fun res!524306 () Bool)

(assert (=> b!775624 (=> (not res!524306) (not e!431769))))

(declare-fun arrayContainsKey!0 (array!42469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775624 (= res!524306 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775625 () Bool)

(declare-fun e!431774 () Unit!26719)

(declare-fun Unit!26721 () Unit!26719)

(assert (=> b!775625 (= e!431774 Unit!26721)))

(declare-fun lt!345447 () SeekEntryResult!7882)

(assert (=> b!775625 (= lt!345447 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!775625 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345449 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!345457)))

(declare-fun b!775626 () Bool)

(declare-fun res!524289 () Bool)

(assert (=> b!775626 (=> (not res!524289) (not e!431767))))

(assert (=> b!775626 (= res!524289 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20746 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20746 a!3186))))))

(declare-fun b!775627 () Bool)

(declare-fun res!524297 () Bool)

(assert (=> b!775627 (=> (not res!524297) (not e!431769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775627 (= res!524297 (validKeyInArray!0 (select (arr!20326 a!3186) j!159)))))

(declare-fun b!775628 () Bool)

(declare-fun e!431772 () Bool)

(assert (=> b!775628 (= e!431772 e!431766)))

(declare-fun res!524293 () Bool)

(assert (=> b!775628 (=> (not res!524293) (not e!431766))))

(assert (=> b!775628 (= res!524293 (= (seekEntryOrOpen!0 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!345455))))

(assert (=> b!775628 (= lt!345455 (Found!7882 j!159))))

(declare-fun b!775629 () Bool)

(declare-fun Unit!26722 () Unit!26719)

(assert (=> b!775629 (= e!431774 Unit!26722)))

(assert (=> b!775629 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345449 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!345451)))

(declare-fun b!775630 () Bool)

(declare-fun res!524292 () Bool)

(assert (=> b!775630 (=> (not res!524292) (not e!431767))))

(declare-datatypes ((List!14235 0))(
  ( (Nil!14232) (Cons!14231 (h!15345 (_ BitVec 64)) (t!20542 List!14235)) )
))
(declare-fun arrayNoDuplicates!0 (array!42469 (_ BitVec 32) List!14235) Bool)

(assert (=> b!775630 (= res!524292 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14232))))

(declare-fun b!775631 () Bool)

(declare-fun e!431771 () Bool)

(declare-fun e!431775 () Bool)

(assert (=> b!775631 (= e!431771 (not e!431775))))

(declare-fun res!524299 () Bool)

(assert (=> b!775631 (=> res!524299 e!431775)))

(declare-fun lt!345456 () SeekEntryResult!7882)

(get-info :version)

(assert (=> b!775631 (= res!524299 (or (not ((_ is Intermediate!7882) lt!345456)) (bvsge x!1131 (x!65004 lt!345456))))))

(assert (=> b!775631 (= lt!345457 (Found!7882 j!159))))

(assert (=> b!775631 e!431772))

(declare-fun res!524295 () Bool)

(assert (=> b!775631 (=> (not res!524295) (not e!431772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42469 (_ BitVec 32)) Bool)

(assert (=> b!775631 (= res!524295 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345452 () Unit!26719)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26719)

(assert (=> b!775631 (= lt!345452 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775632 () Bool)

(assert (=> b!775632 (= e!431773 e!431771)))

(declare-fun res!524290 () Bool)

(assert (=> b!775632 (=> (not res!524290) (not e!431771))))

(declare-fun lt!345454 () SeekEntryResult!7882)

(assert (=> b!775632 (= res!524290 (= lt!345454 lt!345456))))

(assert (=> b!775632 (= lt!345456 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345445 lt!345444 mask!3328))))

(assert (=> b!775632 (= lt!345454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345445 mask!3328) lt!345445 lt!345444 mask!3328))))

(assert (=> b!775632 (= lt!345445 (select (store (arr!20326 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775632 (= lt!345444 (array!42470 (store (arr!20326 a!3186) i!1173 k0!2102) (size!20746 a!3186)))))

(declare-fun b!775633 () Bool)

(assert (=> b!775633 (= e!431769 e!431767)))

(declare-fun res!524301 () Bool)

(assert (=> b!775633 (=> (not res!524301) (not e!431767))))

(declare-fun lt!345446 () SeekEntryResult!7882)

(assert (=> b!775633 (= res!524301 (or (= lt!345446 (MissingZero!7882 i!1173)) (= lt!345446 (MissingVacant!7882 i!1173))))))

(assert (=> b!775633 (= lt!345446 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775634 () Bool)

(declare-fun res!524296 () Bool)

(assert (=> b!775634 (=> (not res!524296) (not e!431773))))

(assert (=> b!775634 (= res!524296 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20326 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775635 () Bool)

(assert (=> b!775635 (= e!431765 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!345451))))

(declare-fun b!775636 () Bool)

(assert (=> b!775636 (= e!431776 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345449 resIntermediateIndex!5 (select (arr!20326 a!3186) j!159) a!3186 mask!3328) lt!345457)))))

(declare-fun b!775637 () Bool)

(declare-fun res!524291 () Bool)

(assert (=> b!775637 (=> res!524291 e!431770)))

(assert (=> b!775637 (= res!524291 (not (= lt!345454 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345449 lt!345445 lt!345444 mask!3328))))))

(declare-fun b!775638 () Bool)

(declare-fun res!524303 () Bool)

(assert (=> b!775638 (=> res!524303 e!431770)))

(assert (=> b!775638 (= res!524303 e!431776)))

(declare-fun c!86067 () Bool)

(declare-fun lt!345448 () Bool)

(assert (=> b!775638 (= c!86067 lt!345448)))

(declare-fun b!775639 () Bool)

(assert (=> b!775639 (= e!431775 e!431770)))

(declare-fun res!524300 () Bool)

(assert (=> b!775639 (=> res!524300 e!431770)))

(assert (=> b!775639 (= res!524300 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345449 #b00000000000000000000000000000000) (bvsge lt!345449 (size!20746 a!3186))))))

(declare-fun lt!345453 () Unit!26719)

(assert (=> b!775639 (= lt!345453 e!431774)))

(declare-fun c!86068 () Bool)

(assert (=> b!775639 (= c!86068 lt!345448)))

(assert (=> b!775639 (= lt!345448 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775639 (= lt!345449 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!775640 () Bool)

(declare-fun res!524304 () Bool)

(assert (=> b!775640 (=> (not res!524304) (not e!431767))))

(assert (=> b!775640 (= res!524304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775641 () Bool)

(declare-fun res!524305 () Bool)

(assert (=> b!775641 (=> (not res!524305) (not e!431769))))

(assert (=> b!775641 (= res!524305 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67234 res!524302) b!775618))

(assert (= (and b!775618 res!524294) b!775627))

(assert (= (and b!775627 res!524297) b!775641))

(assert (= (and b!775641 res!524305) b!775624))

(assert (= (and b!775624 res!524306) b!775633))

(assert (= (and b!775633 res!524301) b!775640))

(assert (= (and b!775640 res!524304) b!775630))

(assert (= (and b!775630 res!524292) b!775626))

(assert (= (and b!775626 res!524289) b!775620))

(assert (= (and b!775620 res!524298) b!775634))

(assert (= (and b!775634 res!524296) b!775621))

(assert (= (and b!775621 c!86069) b!775635))

(assert (= (and b!775621 (not c!86069)) b!775619))

(assert (= (and b!775621 res!524307) b!775632))

(assert (= (and b!775632 res!524290) b!775631))

(assert (= (and b!775631 res!524295) b!775628))

(assert (= (and b!775628 res!524293) b!775622))

(assert (= (and b!775631 (not res!524299)) b!775639))

(assert (= (and b!775639 c!86068) b!775629))

(assert (= (and b!775639 (not c!86068)) b!775625))

(assert (= (and b!775639 (not res!524300)) b!775638))

(assert (= (and b!775638 c!86067) b!775617))

(assert (= (and b!775638 (not c!86067)) b!775636))

(assert (= (and b!775638 (not res!524303)) b!775637))

(assert (= (and b!775637 (not res!524291)) b!775623))

(declare-fun m!720365 () Bool)

(assert (=> b!775631 m!720365))

(declare-fun m!720367 () Bool)

(assert (=> b!775631 m!720367))

(declare-fun m!720369 () Bool)

(assert (=> b!775619 m!720369))

(assert (=> b!775619 m!720369))

(declare-fun m!720371 () Bool)

(assert (=> b!775619 m!720371))

(declare-fun m!720373 () Bool)

(assert (=> b!775639 m!720373))

(assert (=> b!775620 m!720369))

(assert (=> b!775620 m!720369))

(declare-fun m!720375 () Bool)

(assert (=> b!775620 m!720375))

(assert (=> b!775620 m!720375))

(assert (=> b!775620 m!720369))

(declare-fun m!720377 () Bool)

(assert (=> b!775620 m!720377))

(declare-fun m!720379 () Bool)

(assert (=> start!67234 m!720379))

(declare-fun m!720381 () Bool)

(assert (=> start!67234 m!720381))

(declare-fun m!720383 () Bool)

(assert (=> b!775641 m!720383))

(declare-fun m!720385 () Bool)

(assert (=> b!775633 m!720385))

(assert (=> b!775635 m!720369))

(assert (=> b!775635 m!720369))

(declare-fun m!720387 () Bool)

(assert (=> b!775635 m!720387))

(declare-fun m!720389 () Bool)

(assert (=> b!775624 m!720389))

(declare-fun m!720391 () Bool)

(assert (=> b!775632 m!720391))

(declare-fun m!720393 () Bool)

(assert (=> b!775632 m!720393))

(declare-fun m!720395 () Bool)

(assert (=> b!775632 m!720395))

(declare-fun m!720397 () Bool)

(assert (=> b!775632 m!720397))

(declare-fun m!720399 () Bool)

(assert (=> b!775632 m!720399))

(assert (=> b!775632 m!720393))

(declare-fun m!720401 () Bool)

(assert (=> b!775634 m!720401))

(assert (=> b!775617 m!720369))

(assert (=> b!775617 m!720369))

(declare-fun m!720403 () Bool)

(assert (=> b!775617 m!720403))

(assert (=> b!775622 m!720369))

(assert (=> b!775622 m!720369))

(declare-fun m!720405 () Bool)

(assert (=> b!775622 m!720405))

(assert (=> b!775628 m!720369))

(assert (=> b!775628 m!720369))

(declare-fun m!720407 () Bool)

(assert (=> b!775628 m!720407))

(assert (=> b!775625 m!720369))

(assert (=> b!775625 m!720369))

(assert (=> b!775625 m!720371))

(assert (=> b!775625 m!720369))

(declare-fun m!720409 () Bool)

(assert (=> b!775625 m!720409))

(assert (=> b!775627 m!720369))

(assert (=> b!775627 m!720369))

(declare-fun m!720411 () Bool)

(assert (=> b!775627 m!720411))

(declare-fun m!720413 () Bool)

(assert (=> b!775623 m!720413))

(declare-fun m!720415 () Bool)

(assert (=> b!775623 m!720415))

(declare-fun m!720417 () Bool)

(assert (=> b!775630 m!720417))

(declare-fun m!720419 () Bool)

(assert (=> b!775640 m!720419))

(declare-fun m!720421 () Bool)

(assert (=> b!775637 m!720421))

(assert (=> b!775629 m!720369))

(assert (=> b!775629 m!720369))

(assert (=> b!775629 m!720403))

(assert (=> b!775636 m!720369))

(assert (=> b!775636 m!720369))

(assert (=> b!775636 m!720409))

(check-sat (not b!775632) (not b!775619) (not b!775639) (not start!67234) (not b!775624) (not b!775636) (not b!775640) (not b!775627) (not b!775625) (not b!775617) (not b!775633) (not b!775629) (not b!775635) (not b!775622) (not b!775623) (not b!775631) (not b!775628) (not b!775637) (not b!775630) (not b!775641) (not b!775620))
(check-sat)
