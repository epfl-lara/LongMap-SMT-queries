; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65444 () Bool)

(assert start!65444)

(declare-fun b!745447 () Bool)

(declare-fun res!502323 () Bool)

(declare-fun e!416346 () Bool)

(assert (=> b!745447 (=> (not res!502323) (not e!416346))))

(declare-datatypes ((array!41617 0))(
  ( (array!41618 (arr!19922 (Array (_ BitVec 32) (_ BitVec 64))) (size!20343 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41617)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745447 (= res!502323 (validKeyInArray!0 (select (arr!19922 a!3186) j!159)))))

(declare-fun b!745448 () Bool)

(declare-fun res!502324 () Bool)

(assert (=> b!745448 (=> (not res!502324) (not e!416346))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!745448 (= res!502324 (validKeyInArray!0 k!2102))))

(declare-fun b!745449 () Bool)

(declare-fun e!416353 () Bool)

(declare-fun e!416349 () Bool)

(assert (=> b!745449 (= e!416353 e!416349)))

(declare-fun res!502329 () Bool)

(assert (=> b!745449 (=> (not res!502329) (not e!416349))))

(declare-datatypes ((SeekEntryResult!7522 0))(
  ( (MissingZero!7522 (index!32456 (_ BitVec 32))) (Found!7522 (index!32457 (_ BitVec 32))) (Intermediate!7522 (undefined!8334 Bool) (index!32458 (_ BitVec 32)) (x!63408 (_ BitVec 32))) (Undefined!7522) (MissingVacant!7522 (index!32459 (_ BitVec 32))) )
))
(declare-fun lt!331178 () SeekEntryResult!7522)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41617 (_ BitVec 32)) SeekEntryResult!7522)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745449 (= res!502329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19922 a!3186) j!159) mask!3328) (select (arr!19922 a!3186) j!159) a!3186 mask!3328) lt!331178))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745449 (= lt!331178 (Intermediate!7522 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745450 () Bool)

(declare-fun res!502331 () Bool)

(assert (=> b!745450 (=> (not res!502331) (not e!416353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41617 (_ BitVec 32)) Bool)

(assert (=> b!745450 (= res!502331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745451 () Bool)

(declare-fun e!416352 () Bool)

(declare-fun e!416348 () Bool)

(assert (=> b!745451 (= e!416352 e!416348)))

(declare-fun res!502327 () Bool)

(assert (=> b!745451 (=> (not res!502327) (not e!416348))))

(declare-fun lt!331179 () SeekEntryResult!7522)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41617 (_ BitVec 32)) SeekEntryResult!7522)

(assert (=> b!745451 (= res!502327 (= (seekEntryOrOpen!0 (select (arr!19922 a!3186) j!159) a!3186 mask!3328) lt!331179))))

(assert (=> b!745451 (= lt!331179 (Found!7522 j!159))))

(declare-fun b!745452 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41617 (_ BitVec 32)) SeekEntryResult!7522)

(assert (=> b!745452 (= e!416348 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19922 a!3186) j!159) a!3186 mask!3328) lt!331179))))

(declare-fun b!745453 () Bool)

(assert (=> b!745453 (= e!416346 e!416353)))

(declare-fun res!502336 () Bool)

(assert (=> b!745453 (=> (not res!502336) (not e!416353))))

(declare-fun lt!331181 () SeekEntryResult!7522)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745453 (= res!502336 (or (= lt!331181 (MissingZero!7522 i!1173)) (= lt!331181 (MissingVacant!7522 i!1173))))))

(assert (=> b!745453 (= lt!331181 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745454 () Bool)

(declare-fun res!502334 () Bool)

(assert (=> b!745454 (=> (not res!502334) (not e!416353))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!745454 (= res!502334 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20343 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20343 a!3186))))))

(declare-fun b!745455 () Bool)

(declare-fun res!502332 () Bool)

(assert (=> b!745455 (=> (not res!502332) (not e!416349))))

(declare-fun e!416347 () Bool)

(assert (=> b!745455 (= res!502332 e!416347)))

(declare-fun c!81943 () Bool)

(assert (=> b!745455 (= c!81943 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745456 () Bool)

(declare-fun e!416354 () Bool)

(assert (=> b!745456 (= e!416354 true)))

(declare-fun lt!331176 () SeekEntryResult!7522)

(assert (=> b!745456 (= lt!331176 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19922 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!502322 () Bool)

(assert (=> start!65444 (=> (not res!502322) (not e!416346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65444 (= res!502322 (validMask!0 mask!3328))))

(assert (=> start!65444 e!416346))

(assert (=> start!65444 true))

(declare-fun array_inv!15718 (array!41617) Bool)

(assert (=> start!65444 (array_inv!15718 a!3186)))

(declare-fun b!745457 () Bool)

(declare-fun res!502335 () Bool)

(assert (=> b!745457 (=> (not res!502335) (not e!416346))))

(assert (=> b!745457 (= res!502335 (and (= (size!20343 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20343 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20343 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745458 () Bool)

(assert (=> b!745458 (= e!416347 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19922 a!3186) j!159) a!3186 mask!3328) lt!331178))))

(declare-fun b!745459 () Bool)

(declare-fun res!502337 () Bool)

(assert (=> b!745459 (=> (not res!502337) (not e!416349))))

(assert (=> b!745459 (= res!502337 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19922 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745460 () Bool)

(declare-fun res!502325 () Bool)

(assert (=> b!745460 (=> (not res!502325) (not e!416346))))

(declare-fun arrayContainsKey!0 (array!41617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745460 (= res!502325 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745461 () Bool)

(declare-fun e!416351 () Bool)

(assert (=> b!745461 (= e!416351 (not e!416354))))

(declare-fun res!502328 () Bool)

(assert (=> b!745461 (=> res!502328 e!416354)))

(declare-fun lt!331177 () SeekEntryResult!7522)

(assert (=> b!745461 (= res!502328 (or (not (is-Intermediate!7522 lt!331177)) (bvslt x!1131 (x!63408 lt!331177)) (not (= x!1131 (x!63408 lt!331177))) (not (= index!1321 (index!32458 lt!331177)))))))

(assert (=> b!745461 e!416352))

(declare-fun res!502326 () Bool)

(assert (=> b!745461 (=> (not res!502326) (not e!416352))))

(assert (=> b!745461 (= res!502326 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25524 0))(
  ( (Unit!25525) )
))
(declare-fun lt!331182 () Unit!25524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25524)

(assert (=> b!745461 (= lt!331182 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745462 () Bool)

(declare-fun res!502333 () Bool)

(assert (=> b!745462 (=> (not res!502333) (not e!416353))))

(declare-datatypes ((List!13924 0))(
  ( (Nil!13921) (Cons!13920 (h!14992 (_ BitVec 64)) (t!20239 List!13924)) )
))
(declare-fun arrayNoDuplicates!0 (array!41617 (_ BitVec 32) List!13924) Bool)

(assert (=> b!745462 (= res!502333 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13921))))

(declare-fun b!745463 () Bool)

(assert (=> b!745463 (= e!416347 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19922 a!3186) j!159) a!3186 mask!3328) (Found!7522 j!159)))))

(declare-fun b!745464 () Bool)

(assert (=> b!745464 (= e!416349 e!416351)))

(declare-fun res!502330 () Bool)

(assert (=> b!745464 (=> (not res!502330) (not e!416351))))

(declare-fun lt!331180 () SeekEntryResult!7522)

(assert (=> b!745464 (= res!502330 (= lt!331180 lt!331177))))

(declare-fun lt!331184 () array!41617)

(declare-fun lt!331183 () (_ BitVec 64))

(assert (=> b!745464 (= lt!331177 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331183 lt!331184 mask!3328))))

(assert (=> b!745464 (= lt!331180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331183 mask!3328) lt!331183 lt!331184 mask!3328))))

(assert (=> b!745464 (= lt!331183 (select (store (arr!19922 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745464 (= lt!331184 (array!41618 (store (arr!19922 a!3186) i!1173 k!2102) (size!20343 a!3186)))))

(assert (= (and start!65444 res!502322) b!745457))

(assert (= (and b!745457 res!502335) b!745447))

(assert (= (and b!745447 res!502323) b!745448))

(assert (= (and b!745448 res!502324) b!745460))

(assert (= (and b!745460 res!502325) b!745453))

(assert (= (and b!745453 res!502336) b!745450))

(assert (= (and b!745450 res!502331) b!745462))

(assert (= (and b!745462 res!502333) b!745454))

(assert (= (and b!745454 res!502334) b!745449))

(assert (= (and b!745449 res!502329) b!745459))

(assert (= (and b!745459 res!502337) b!745455))

(assert (= (and b!745455 c!81943) b!745458))

(assert (= (and b!745455 (not c!81943)) b!745463))

(assert (= (and b!745455 res!502332) b!745464))

(assert (= (and b!745464 res!502330) b!745461))

(assert (= (and b!745461 res!502326) b!745451))

(assert (= (and b!745451 res!502327) b!745452))

(assert (= (and b!745461 (not res!502328)) b!745456))

(declare-fun m!695823 () Bool)

(assert (=> b!745460 m!695823))

(declare-fun m!695825 () Bool)

(assert (=> b!745450 m!695825))

(declare-fun m!695827 () Bool)

(assert (=> b!745462 m!695827))

(declare-fun m!695829 () Bool)

(assert (=> b!745451 m!695829))

(assert (=> b!745451 m!695829))

(declare-fun m!695831 () Bool)

(assert (=> b!745451 m!695831))

(declare-fun m!695833 () Bool)

(assert (=> b!745461 m!695833))

(declare-fun m!695835 () Bool)

(assert (=> b!745461 m!695835))

(assert (=> b!745452 m!695829))

(assert (=> b!745452 m!695829))

(declare-fun m!695837 () Bool)

(assert (=> b!745452 m!695837))

(declare-fun m!695839 () Bool)

(assert (=> b!745453 m!695839))

(declare-fun m!695841 () Bool)

(assert (=> b!745459 m!695841))

(assert (=> b!745456 m!695829))

(assert (=> b!745456 m!695829))

(declare-fun m!695843 () Bool)

(assert (=> b!745456 m!695843))

(declare-fun m!695845 () Bool)

(assert (=> b!745448 m!695845))

(declare-fun m!695847 () Bool)

(assert (=> b!745464 m!695847))

(declare-fun m!695849 () Bool)

(assert (=> b!745464 m!695849))

(assert (=> b!745464 m!695847))

(declare-fun m!695851 () Bool)

(assert (=> b!745464 m!695851))

(declare-fun m!695853 () Bool)

(assert (=> b!745464 m!695853))

(declare-fun m!695855 () Bool)

(assert (=> b!745464 m!695855))

(assert (=> b!745449 m!695829))

(assert (=> b!745449 m!695829))

(declare-fun m!695857 () Bool)

(assert (=> b!745449 m!695857))

(assert (=> b!745449 m!695857))

(assert (=> b!745449 m!695829))

(declare-fun m!695859 () Bool)

(assert (=> b!745449 m!695859))

(assert (=> b!745447 m!695829))

(assert (=> b!745447 m!695829))

(declare-fun m!695861 () Bool)

(assert (=> b!745447 m!695861))

(declare-fun m!695863 () Bool)

(assert (=> start!65444 m!695863))

(declare-fun m!695865 () Bool)

(assert (=> start!65444 m!695865))

(assert (=> b!745458 m!695829))

(assert (=> b!745458 m!695829))

(declare-fun m!695867 () Bool)

(assert (=> b!745458 m!695867))

(assert (=> b!745463 m!695829))

(assert (=> b!745463 m!695829))

(assert (=> b!745463 m!695843))

(push 1)

