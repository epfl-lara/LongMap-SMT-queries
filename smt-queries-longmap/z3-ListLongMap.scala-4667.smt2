; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64898 () Bool)

(assert start!64898)

(declare-fun b!732332 () Bool)

(declare-fun e!409777 () Bool)

(declare-fun e!409783 () Bool)

(assert (=> b!732332 (= e!409777 e!409783)))

(declare-fun res!492052 () Bool)

(assert (=> b!732332 (=> (not res!492052) (not e!409783))))

(declare-datatypes ((array!41226 0))(
  ( (array!41227 (arr!19730 (Array (_ BitVec 32) (_ BitVec 64))) (size!20151 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41226)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7327 0))(
  ( (MissingZero!7327 (index!31676 (_ BitVec 32))) (Found!7327 (index!31677 (_ BitVec 32))) (Intermediate!7327 (undefined!8139 Bool) (index!31678 (_ BitVec 32)) (x!62680 (_ BitVec 32))) (Undefined!7327) (MissingVacant!7327 (index!31679 (_ BitVec 32))) )
))
(declare-fun lt!324407 () SeekEntryResult!7327)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41226 (_ BitVec 32)) SeekEntryResult!7327)

(assert (=> b!732332 (= res!492052 (= (seekEntryOrOpen!0 (select (arr!19730 a!3186) j!159) a!3186 mask!3328) lt!324407))))

(assert (=> b!732332 (= lt!324407 (Found!7327 j!159))))

(declare-fun b!732333 () Bool)

(declare-fun res!492060 () Bool)

(declare-fun e!409779 () Bool)

(assert (=> b!732333 (=> (not res!492060) (not e!409779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732333 (= res!492060 (validKeyInArray!0 (select (arr!19730 a!3186) j!159)))))

(declare-fun b!732334 () Bool)

(declare-fun res!492056 () Bool)

(assert (=> b!732334 (=> (not res!492056) (not e!409779))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732334 (= res!492056 (and (= (size!20151 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20151 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20151 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!324399 () SeekEntryResult!7327)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!409781 () Bool)

(declare-fun b!732335 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41226 (_ BitVec 32)) SeekEntryResult!7327)

(assert (=> b!732335 (= e!409781 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19730 a!3186) j!159) a!3186 mask!3328) lt!324399))))

(declare-fun b!732336 () Bool)

(declare-fun e!409785 () Bool)

(assert (=> b!732336 (= e!409785 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!324402 () SeekEntryResult!7327)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41226 (_ BitVec 32)) SeekEntryResult!7327)

(assert (=> b!732336 (= lt!324402 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19730 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732337 () Bool)

(declare-fun res!492055 () Bool)

(declare-fun e!409786 () Bool)

(assert (=> b!732337 (=> (not res!492055) (not e!409786))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732337 (= res!492055 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20151 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20151 a!3186))))))

(declare-fun b!732338 () Bool)

(declare-fun e!409780 () Bool)

(assert (=> b!732338 (= e!409780 e!409785)))

(declare-fun res!492050 () Bool)

(assert (=> b!732338 (=> res!492050 e!409785)))

(assert (=> b!732338 (= res!492050 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324400 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732338 (= lt!324400 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732339 () Bool)

(declare-fun e!409784 () Bool)

(assert (=> b!732339 (= e!409784 (not e!409780))))

(declare-fun res!492063 () Bool)

(assert (=> b!732339 (=> res!492063 e!409780)))

(declare-fun lt!324398 () SeekEntryResult!7327)

(get-info :version)

(assert (=> b!732339 (= res!492063 (or (not ((_ is Intermediate!7327) lt!324398)) (bvsge x!1131 (x!62680 lt!324398))))))

(assert (=> b!732339 e!409777))

(declare-fun res!492053 () Bool)

(assert (=> b!732339 (=> (not res!492053) (not e!409777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41226 (_ BitVec 32)) Bool)

(assert (=> b!732339 (= res!492053 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24944 0))(
  ( (Unit!24945) )
))
(declare-fun lt!324406 () Unit!24944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24944)

(assert (=> b!732339 (= lt!324406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732340 () Bool)

(assert (=> b!732340 (= e!409781 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19730 a!3186) j!159) a!3186 mask!3328) (Found!7327 j!159)))))

(declare-fun b!732341 () Bool)

(declare-fun res!492054 () Bool)

(declare-fun e!409782 () Bool)

(assert (=> b!732341 (=> (not res!492054) (not e!409782))))

(assert (=> b!732341 (= res!492054 e!409781)))

(declare-fun c!80520 () Bool)

(assert (=> b!732341 (= c!80520 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732342 () Bool)

(declare-fun res!492061 () Bool)

(assert (=> b!732342 (=> (not res!492061) (not e!409786))))

(assert (=> b!732342 (= res!492061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732343 () Bool)

(assert (=> b!732343 (= e!409782 e!409784)))

(declare-fun res!492058 () Bool)

(assert (=> b!732343 (=> (not res!492058) (not e!409784))))

(declare-fun lt!324405 () SeekEntryResult!7327)

(assert (=> b!732343 (= res!492058 (= lt!324405 lt!324398))))

(declare-fun lt!324404 () array!41226)

(declare-fun lt!324401 () (_ BitVec 64))

(assert (=> b!732343 (= lt!324398 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324401 lt!324404 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732343 (= lt!324405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324401 mask!3328) lt!324401 lt!324404 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!732343 (= lt!324401 (select (store (arr!19730 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732343 (= lt!324404 (array!41227 (store (arr!19730 a!3186) i!1173 k0!2102) (size!20151 a!3186)))))

(declare-fun b!732344 () Bool)

(assert (=> b!732344 (= e!409779 e!409786)))

(declare-fun res!492062 () Bool)

(assert (=> b!732344 (=> (not res!492062) (not e!409786))))

(declare-fun lt!324403 () SeekEntryResult!7327)

(assert (=> b!732344 (= res!492062 (or (= lt!324403 (MissingZero!7327 i!1173)) (= lt!324403 (MissingVacant!7327 i!1173))))))

(assert (=> b!732344 (= lt!324403 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!732345 () Bool)

(declare-fun res!492059 () Bool)

(assert (=> b!732345 (=> (not res!492059) (not e!409779))))

(assert (=> b!732345 (= res!492059 (validKeyInArray!0 k0!2102))))

(declare-fun b!732346 () Bool)

(declare-fun res!492049 () Bool)

(assert (=> b!732346 (=> (not res!492049) (not e!409786))))

(declare-datatypes ((List!13771 0))(
  ( (Nil!13768) (Cons!13767 (h!14833 (_ BitVec 64)) (t!20077 List!13771)) )
))
(declare-fun arrayNoDuplicates!0 (array!41226 (_ BitVec 32) List!13771) Bool)

(assert (=> b!732346 (= res!492049 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13768))))

(declare-fun b!732347 () Bool)

(assert (=> b!732347 (= e!409786 e!409782)))

(declare-fun res!492051 () Bool)

(assert (=> b!732347 (=> (not res!492051) (not e!409782))))

(assert (=> b!732347 (= res!492051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19730 a!3186) j!159) mask!3328) (select (arr!19730 a!3186) j!159) a!3186 mask!3328) lt!324399))))

(assert (=> b!732347 (= lt!324399 (Intermediate!7327 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732348 () Bool)

(assert (=> b!732348 (= e!409783 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19730 a!3186) j!159) a!3186 mask!3328) lt!324407))))

(declare-fun res!492047 () Bool)

(assert (=> start!64898 (=> (not res!492047) (not e!409779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64898 (= res!492047 (validMask!0 mask!3328))))

(assert (=> start!64898 e!409779))

(assert (=> start!64898 true))

(declare-fun array_inv!15613 (array!41226) Bool)

(assert (=> start!64898 (array_inv!15613 a!3186)))

(declare-fun b!732349 () Bool)

(declare-fun res!492048 () Bool)

(assert (=> b!732349 (=> (not res!492048) (not e!409779))))

(declare-fun arrayContainsKey!0 (array!41226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732349 (= res!492048 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732350 () Bool)

(declare-fun res!492057 () Bool)

(assert (=> b!732350 (=> (not res!492057) (not e!409782))))

(assert (=> b!732350 (= res!492057 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19730 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64898 res!492047) b!732334))

(assert (= (and b!732334 res!492056) b!732333))

(assert (= (and b!732333 res!492060) b!732345))

(assert (= (and b!732345 res!492059) b!732349))

(assert (= (and b!732349 res!492048) b!732344))

(assert (= (and b!732344 res!492062) b!732342))

(assert (= (and b!732342 res!492061) b!732346))

(assert (= (and b!732346 res!492049) b!732337))

(assert (= (and b!732337 res!492055) b!732347))

(assert (= (and b!732347 res!492051) b!732350))

(assert (= (and b!732350 res!492057) b!732341))

(assert (= (and b!732341 c!80520) b!732335))

(assert (= (and b!732341 (not c!80520)) b!732340))

(assert (= (and b!732341 res!492054) b!732343))

(assert (= (and b!732343 res!492058) b!732339))

(assert (= (and b!732339 res!492053) b!732332))

(assert (= (and b!732332 res!492052) b!732348))

(assert (= (and b!732339 (not res!492063)) b!732338))

(assert (= (and b!732338 (not res!492050)) b!732336))

(declare-fun m!684857 () Bool)

(assert (=> b!732349 m!684857))

(declare-fun m!684859 () Bool)

(assert (=> b!732345 m!684859))

(declare-fun m!684861 () Bool)

(assert (=> b!732332 m!684861))

(assert (=> b!732332 m!684861))

(declare-fun m!684863 () Bool)

(assert (=> b!732332 m!684863))

(declare-fun m!684865 () Bool)

(assert (=> b!732342 m!684865))

(declare-fun m!684867 () Bool)

(assert (=> b!732339 m!684867))

(declare-fun m!684869 () Bool)

(assert (=> b!732339 m!684869))

(assert (=> b!732348 m!684861))

(assert (=> b!732348 m!684861))

(declare-fun m!684871 () Bool)

(assert (=> b!732348 m!684871))

(declare-fun m!684873 () Bool)

(assert (=> b!732343 m!684873))

(declare-fun m!684875 () Bool)

(assert (=> b!732343 m!684875))

(declare-fun m!684877 () Bool)

(assert (=> b!732343 m!684877))

(declare-fun m!684879 () Bool)

(assert (=> b!732343 m!684879))

(declare-fun m!684881 () Bool)

(assert (=> b!732343 m!684881))

(assert (=> b!732343 m!684875))

(declare-fun m!684883 () Bool)

(assert (=> b!732338 m!684883))

(declare-fun m!684885 () Bool)

(assert (=> b!732344 m!684885))

(assert (=> b!732340 m!684861))

(assert (=> b!732340 m!684861))

(declare-fun m!684887 () Bool)

(assert (=> b!732340 m!684887))

(assert (=> b!732335 m!684861))

(assert (=> b!732335 m!684861))

(declare-fun m!684889 () Bool)

(assert (=> b!732335 m!684889))

(declare-fun m!684891 () Bool)

(assert (=> start!64898 m!684891))

(declare-fun m!684893 () Bool)

(assert (=> start!64898 m!684893))

(assert (=> b!732347 m!684861))

(assert (=> b!732347 m!684861))

(declare-fun m!684895 () Bool)

(assert (=> b!732347 m!684895))

(assert (=> b!732347 m!684895))

(assert (=> b!732347 m!684861))

(declare-fun m!684897 () Bool)

(assert (=> b!732347 m!684897))

(declare-fun m!684899 () Bool)

(assert (=> b!732346 m!684899))

(assert (=> b!732336 m!684861))

(assert (=> b!732336 m!684861))

(assert (=> b!732336 m!684887))

(declare-fun m!684901 () Bool)

(assert (=> b!732350 m!684901))

(assert (=> b!732333 m!684861))

(assert (=> b!732333 m!684861))

(declare-fun m!684903 () Bool)

(assert (=> b!732333 m!684903))

(check-sat (not b!732345) (not b!732335) (not b!732348) (not b!732333) (not start!64898) (not b!732338) (not b!732347) (not b!732339) (not b!732346) (not b!732343) (not b!732344) (not b!732336) (not b!732340) (not b!732332) (not b!732349) (not b!732342))
(check-sat)
