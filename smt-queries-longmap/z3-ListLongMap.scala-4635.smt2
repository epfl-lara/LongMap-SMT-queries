; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64572 () Bool)

(assert start!64572)

(declare-fun b!726417 () Bool)

(declare-fun e!406794 () Bool)

(assert (=> b!726417 (= e!406794 (not true))))

(declare-fun e!406789 () Bool)

(assert (=> b!726417 e!406789))

(declare-fun res!487294 () Bool)

(assert (=> b!726417 (=> (not res!487294) (not e!406789))))

(declare-datatypes ((array!41023 0))(
  ( (array!41024 (arr!19630 (Array (_ BitVec 32) (_ BitVec 64))) (size!20050 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41023)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41023 (_ BitVec 32)) Bool)

(assert (=> b!726417 (= res!487294 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24769 0))(
  ( (Unit!24770) )
))
(declare-fun lt!321705 () Unit!24769)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41023 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24769)

(assert (=> b!726417 (= lt!321705 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726418 () Bool)

(declare-fun e!406791 () Bool)

(assert (=> b!726418 (= e!406791 e!406794)))

(declare-fun res!487296 () Bool)

(assert (=> b!726418 (=> (not res!487296) (not e!406794))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321700 () (_ BitVec 64))

(declare-fun lt!321703 () array!41023)

(declare-datatypes ((SeekEntryResult!7186 0))(
  ( (MissingZero!7186 (index!31112 (_ BitVec 32))) (Found!7186 (index!31113 (_ BitVec 32))) (Intermediate!7186 (undefined!7998 Bool) (index!31114 (_ BitVec 32)) (x!62255 (_ BitVec 32))) (Undefined!7186) (MissingVacant!7186 (index!31115 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41023 (_ BitVec 32)) SeekEntryResult!7186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726418 (= res!487296 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321700 mask!3328) lt!321700 lt!321703 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321700 lt!321703 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!726418 (= lt!321700 (select (store (arr!19630 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726418 (= lt!321703 (array!41024 (store (arr!19630 a!3186) i!1173 k0!2102) (size!20050 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!406793 () Bool)

(declare-fun b!726419 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41023 (_ BitVec 32)) SeekEntryResult!7186)

(assert (=> b!726419 (= e!406793 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19630 a!3186) j!159) a!3186 mask!3328) (Found!7186 j!159)))))

(declare-fun lt!321704 () SeekEntryResult!7186)

(declare-fun b!726420 () Bool)

(assert (=> b!726420 (= e!406793 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19630 a!3186) j!159) a!3186 mask!3328) lt!321704))))

(declare-fun lt!321701 () SeekEntryResult!7186)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!726421 () Bool)

(declare-fun e!406787 () Bool)

(assert (=> b!726421 (= e!406787 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19630 a!3186) j!159) a!3186 mask!3328) lt!321701))))

(declare-fun b!726422 () Bool)

(declare-fun res!487300 () Bool)

(declare-fun e!406788 () Bool)

(assert (=> b!726422 (=> (not res!487300) (not e!406788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726422 (= res!487300 (validKeyInArray!0 k0!2102))))

(declare-fun b!726423 () Bool)

(declare-fun res!487297 () Bool)

(assert (=> b!726423 (=> (not res!487297) (not e!406791))))

(assert (=> b!726423 (= res!487297 e!406793)))

(declare-fun c!79937 () Bool)

(assert (=> b!726423 (= c!79937 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726424 () Bool)

(declare-fun res!487299 () Bool)

(assert (=> b!726424 (=> (not res!487299) (not e!406788))))

(assert (=> b!726424 (= res!487299 (and (= (size!20050 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20050 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20050 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726426 () Bool)

(declare-fun res!487304 () Bool)

(declare-fun e!406792 () Bool)

(assert (=> b!726426 (=> (not res!487304) (not e!406792))))

(assert (=> b!726426 (= res!487304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726427 () Bool)

(declare-fun res!487295 () Bool)

(assert (=> b!726427 (=> (not res!487295) (not e!406788))))

(declare-fun arrayContainsKey!0 (array!41023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726427 (= res!487295 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726428 () Bool)

(declare-fun res!487292 () Bool)

(assert (=> b!726428 (=> (not res!487292) (not e!406792))))

(declare-datatypes ((List!13539 0))(
  ( (Nil!13536) (Cons!13535 (h!14595 (_ BitVec 64)) (t!19846 List!13539)) )
))
(declare-fun arrayNoDuplicates!0 (array!41023 (_ BitVec 32) List!13539) Bool)

(assert (=> b!726428 (= res!487292 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13536))))

(declare-fun b!726429 () Bool)

(declare-fun res!487302 () Bool)

(assert (=> b!726429 (=> (not res!487302) (not e!406788))))

(assert (=> b!726429 (= res!487302 (validKeyInArray!0 (select (arr!19630 a!3186) j!159)))))

(declare-fun b!726430 () Bool)

(declare-fun res!487305 () Bool)

(assert (=> b!726430 (=> (not res!487305) (not e!406791))))

(assert (=> b!726430 (= res!487305 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19630 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726431 () Bool)

(declare-fun res!487293 () Bool)

(assert (=> b!726431 (=> (not res!487293) (not e!406792))))

(assert (=> b!726431 (= res!487293 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20050 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20050 a!3186))))))

(declare-fun b!726432 () Bool)

(assert (=> b!726432 (= e!406792 e!406791)))

(declare-fun res!487303 () Bool)

(assert (=> b!726432 (=> (not res!487303) (not e!406791))))

(assert (=> b!726432 (= res!487303 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19630 a!3186) j!159) mask!3328) (select (arr!19630 a!3186) j!159) a!3186 mask!3328) lt!321704))))

(assert (=> b!726432 (= lt!321704 (Intermediate!7186 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726433 () Bool)

(assert (=> b!726433 (= e!406789 e!406787)))

(declare-fun res!487306 () Bool)

(assert (=> b!726433 (=> (not res!487306) (not e!406787))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41023 (_ BitVec 32)) SeekEntryResult!7186)

(assert (=> b!726433 (= res!487306 (= (seekEntryOrOpen!0 (select (arr!19630 a!3186) j!159) a!3186 mask!3328) lt!321701))))

(assert (=> b!726433 (= lt!321701 (Found!7186 j!159))))

(declare-fun res!487301 () Bool)

(assert (=> start!64572 (=> (not res!487301) (not e!406788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64572 (= res!487301 (validMask!0 mask!3328))))

(assert (=> start!64572 e!406788))

(assert (=> start!64572 true))

(declare-fun array_inv!15489 (array!41023) Bool)

(assert (=> start!64572 (array_inv!15489 a!3186)))

(declare-fun b!726425 () Bool)

(assert (=> b!726425 (= e!406788 e!406792)))

(declare-fun res!487298 () Bool)

(assert (=> b!726425 (=> (not res!487298) (not e!406792))))

(declare-fun lt!321702 () SeekEntryResult!7186)

(assert (=> b!726425 (= res!487298 (or (= lt!321702 (MissingZero!7186 i!1173)) (= lt!321702 (MissingVacant!7186 i!1173))))))

(assert (=> b!726425 (= lt!321702 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64572 res!487301) b!726424))

(assert (= (and b!726424 res!487299) b!726429))

(assert (= (and b!726429 res!487302) b!726422))

(assert (= (and b!726422 res!487300) b!726427))

(assert (= (and b!726427 res!487295) b!726425))

(assert (= (and b!726425 res!487298) b!726426))

(assert (= (and b!726426 res!487304) b!726428))

(assert (= (and b!726428 res!487292) b!726431))

(assert (= (and b!726431 res!487293) b!726432))

(assert (= (and b!726432 res!487303) b!726430))

(assert (= (and b!726430 res!487305) b!726423))

(assert (= (and b!726423 c!79937) b!726420))

(assert (= (and b!726423 (not c!79937)) b!726419))

(assert (= (and b!726423 res!487297) b!726418))

(assert (= (and b!726418 res!487296) b!726417))

(assert (= (and b!726417 res!487294) b!726433))

(assert (= (and b!726433 res!487306) b!726421))

(declare-fun m!681033 () Bool)

(assert (=> b!726428 m!681033))

(declare-fun m!681035 () Bool)

(assert (=> b!726419 m!681035))

(assert (=> b!726419 m!681035))

(declare-fun m!681037 () Bool)

(assert (=> b!726419 m!681037))

(assert (=> b!726433 m!681035))

(assert (=> b!726433 m!681035))

(declare-fun m!681039 () Bool)

(assert (=> b!726433 m!681039))

(assert (=> b!726429 m!681035))

(assert (=> b!726429 m!681035))

(declare-fun m!681041 () Bool)

(assert (=> b!726429 m!681041))

(declare-fun m!681043 () Bool)

(assert (=> b!726422 m!681043))

(assert (=> b!726432 m!681035))

(assert (=> b!726432 m!681035))

(declare-fun m!681045 () Bool)

(assert (=> b!726432 m!681045))

(assert (=> b!726432 m!681045))

(assert (=> b!726432 m!681035))

(declare-fun m!681047 () Bool)

(assert (=> b!726432 m!681047))

(declare-fun m!681049 () Bool)

(assert (=> start!64572 m!681049))

(declare-fun m!681051 () Bool)

(assert (=> start!64572 m!681051))

(declare-fun m!681053 () Bool)

(assert (=> b!726430 m!681053))

(declare-fun m!681055 () Bool)

(assert (=> b!726425 m!681055))

(assert (=> b!726421 m!681035))

(assert (=> b!726421 m!681035))

(declare-fun m!681057 () Bool)

(assert (=> b!726421 m!681057))

(declare-fun m!681059 () Bool)

(assert (=> b!726427 m!681059))

(declare-fun m!681061 () Bool)

(assert (=> b!726418 m!681061))

(declare-fun m!681063 () Bool)

(assert (=> b!726418 m!681063))

(assert (=> b!726418 m!681061))

(declare-fun m!681065 () Bool)

(assert (=> b!726418 m!681065))

(declare-fun m!681067 () Bool)

(assert (=> b!726418 m!681067))

(declare-fun m!681069 () Bool)

(assert (=> b!726418 m!681069))

(declare-fun m!681071 () Bool)

(assert (=> b!726417 m!681071))

(declare-fun m!681073 () Bool)

(assert (=> b!726417 m!681073))

(declare-fun m!681075 () Bool)

(assert (=> b!726426 m!681075))

(assert (=> b!726420 m!681035))

(assert (=> b!726420 m!681035))

(declare-fun m!681077 () Bool)

(assert (=> b!726420 m!681077))

(check-sat (not b!726433) (not b!726421) (not b!726425) (not b!726432) (not b!726429) (not b!726417) (not b!726427) (not b!726418) (not b!726422) (not b!726419) (not b!726428) (not b!726426) (not b!726420) (not start!64572))
(check-sat)
