; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65288 () Bool)

(assert start!65288)

(declare-fun b!741397 () Bool)

(declare-fun e!414393 () Bool)

(declare-fun e!414392 () Bool)

(assert (=> b!741397 (= e!414393 e!414392)))

(declare-fun res!498834 () Bool)

(assert (=> b!741397 (=> (not res!498834) (not e!414392))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41478 0))(
  ( (array!41479 (arr!19853 (Array (_ BitVec 32) (_ BitVec 64))) (size!20274 (_ BitVec 32))) )
))
(declare-fun lt!329260 () array!41478)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!329258 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7450 0))(
  ( (MissingZero!7450 (index!32168 (_ BitVec 32))) (Found!7450 (index!32169 (_ BitVec 32))) (Intermediate!7450 (undefined!8262 Bool) (index!32170 (_ BitVec 32)) (x!63155 (_ BitVec 32))) (Undefined!7450) (MissingVacant!7450 (index!32171 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41478 (_ BitVec 32)) SeekEntryResult!7450)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741397 (= res!498834 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329258 mask!3328) lt!329258 lt!329260 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329258 lt!329260 mask!3328)))))

(declare-fun a!3186 () array!41478)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!741397 (= lt!329258 (select (store (arr!19853 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741397 (= lt!329260 (array!41479 (store (arr!19853 a!3186) i!1173 k0!2102) (size!20274 a!3186)))))

(declare-fun b!741398 () Bool)

(declare-fun res!498823 () Bool)

(declare-fun e!414394 () Bool)

(assert (=> b!741398 (=> (not res!498823) (not e!414394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41478 (_ BitVec 32)) Bool)

(assert (=> b!741398 (= res!498823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!329256 () SeekEntryResult!7450)

(declare-fun b!741399 () Bool)

(declare-fun e!414395 () Bool)

(assert (=> b!741399 (= e!414395 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19853 a!3186) j!159) a!3186 mask!3328) lt!329256))))

(declare-fun b!741400 () Bool)

(declare-fun res!498827 () Bool)

(assert (=> b!741400 (=> (not res!498827) (not e!414393))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!741400 (= res!498827 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19853 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741401 () Bool)

(declare-fun res!498820 () Bool)

(declare-fun e!414391 () Bool)

(assert (=> b!741401 (=> (not res!498820) (not e!414391))))

(declare-fun arrayContainsKey!0 (array!41478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741401 (= res!498820 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741402 () Bool)

(declare-fun res!498832 () Bool)

(assert (=> b!741402 (=> (not res!498832) (not e!414391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741402 (= res!498832 (validKeyInArray!0 k0!2102))))

(declare-fun b!741403 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41478 (_ BitVec 32)) SeekEntryResult!7450)

(assert (=> b!741403 (= e!414395 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19853 a!3186) j!159) a!3186 mask!3328) (Found!7450 j!159)))))

(declare-fun b!741404 () Bool)

(assert (=> b!741404 (= e!414394 e!414393)))

(declare-fun res!498833 () Bool)

(assert (=> b!741404 (=> (not res!498833) (not e!414393))))

(assert (=> b!741404 (= res!498833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19853 a!3186) j!159) mask!3328) (select (arr!19853 a!3186) j!159) a!3186 mask!3328) lt!329256))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741404 (= lt!329256 (Intermediate!7450 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741405 () Bool)

(declare-fun res!498824 () Bool)

(assert (=> b!741405 (=> (not res!498824) (not e!414391))))

(assert (=> b!741405 (= res!498824 (and (= (size!20274 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20274 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20274 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741406 () Bool)

(declare-fun e!414397 () Bool)

(declare-fun e!414390 () Bool)

(assert (=> b!741406 (= e!414397 e!414390)))

(declare-fun res!498830 () Bool)

(assert (=> b!741406 (=> (not res!498830) (not e!414390))))

(declare-fun lt!329259 () SeekEntryResult!7450)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41478 (_ BitVec 32)) SeekEntryResult!7450)

(assert (=> b!741406 (= res!498830 (= (seekEntryOrOpen!0 (select (arr!19853 a!3186) j!159) a!3186 mask!3328) lt!329259))))

(assert (=> b!741406 (= lt!329259 (Found!7450 j!159))))

(declare-fun b!741407 () Bool)

(assert (=> b!741407 (= e!414392 (not true))))

(assert (=> b!741407 e!414397))

(declare-fun res!498829 () Bool)

(assert (=> b!741407 (=> (not res!498829) (not e!414397))))

(assert (=> b!741407 (= res!498829 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25352 0))(
  ( (Unit!25353) )
))
(declare-fun lt!329257 () Unit!25352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25352)

(assert (=> b!741407 (= lt!329257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!498822 () Bool)

(assert (=> start!65288 (=> (not res!498822) (not e!414391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65288 (= res!498822 (validMask!0 mask!3328))))

(assert (=> start!65288 e!414391))

(assert (=> start!65288 true))

(declare-fun array_inv!15736 (array!41478) Bool)

(assert (=> start!65288 (array_inv!15736 a!3186)))

(declare-fun b!741408 () Bool)

(declare-fun res!498821 () Bool)

(assert (=> b!741408 (=> (not res!498821) (not e!414394))))

(declare-datatypes ((List!13894 0))(
  ( (Nil!13891) (Cons!13890 (h!14962 (_ BitVec 64)) (t!20200 List!13894)) )
))
(declare-fun arrayNoDuplicates!0 (array!41478 (_ BitVec 32) List!13894) Bool)

(assert (=> b!741408 (= res!498821 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13891))))

(declare-fun b!741409 () Bool)

(declare-fun res!498826 () Bool)

(assert (=> b!741409 (=> (not res!498826) (not e!414394))))

(assert (=> b!741409 (= res!498826 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20274 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20274 a!3186))))))

(declare-fun b!741410 () Bool)

(declare-fun res!498825 () Bool)

(assert (=> b!741410 (=> (not res!498825) (not e!414393))))

(assert (=> b!741410 (= res!498825 e!414395)))

(declare-fun c!81669 () Bool)

(assert (=> b!741410 (= c!81669 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741411 () Bool)

(declare-fun res!498828 () Bool)

(assert (=> b!741411 (=> (not res!498828) (not e!414391))))

(assert (=> b!741411 (= res!498828 (validKeyInArray!0 (select (arr!19853 a!3186) j!159)))))

(declare-fun b!741412 () Bool)

(assert (=> b!741412 (= e!414391 e!414394)))

(declare-fun res!498831 () Bool)

(assert (=> b!741412 (=> (not res!498831) (not e!414394))))

(declare-fun lt!329261 () SeekEntryResult!7450)

(assert (=> b!741412 (= res!498831 (or (= lt!329261 (MissingZero!7450 i!1173)) (= lt!329261 (MissingVacant!7450 i!1173))))))

(assert (=> b!741412 (= lt!329261 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741413 () Bool)

(assert (=> b!741413 (= e!414390 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19853 a!3186) j!159) a!3186 mask!3328) lt!329259))))

(assert (= (and start!65288 res!498822) b!741405))

(assert (= (and b!741405 res!498824) b!741411))

(assert (= (and b!741411 res!498828) b!741402))

(assert (= (and b!741402 res!498832) b!741401))

(assert (= (and b!741401 res!498820) b!741412))

(assert (= (and b!741412 res!498831) b!741398))

(assert (= (and b!741398 res!498823) b!741408))

(assert (= (and b!741408 res!498821) b!741409))

(assert (= (and b!741409 res!498826) b!741404))

(assert (= (and b!741404 res!498833) b!741400))

(assert (= (and b!741400 res!498827) b!741410))

(assert (= (and b!741410 c!81669) b!741399))

(assert (= (and b!741410 (not c!81669)) b!741403))

(assert (= (and b!741410 res!498825) b!741397))

(assert (= (and b!741397 res!498834) b!741407))

(assert (= (and b!741407 res!498829) b!741406))

(assert (= (and b!741406 res!498830) b!741413))

(declare-fun m!691841 () Bool)

(assert (=> start!65288 m!691841))

(declare-fun m!691843 () Bool)

(assert (=> start!65288 m!691843))

(declare-fun m!691845 () Bool)

(assert (=> b!741401 m!691845))

(declare-fun m!691847 () Bool)

(assert (=> b!741399 m!691847))

(assert (=> b!741399 m!691847))

(declare-fun m!691849 () Bool)

(assert (=> b!741399 m!691849))

(assert (=> b!741406 m!691847))

(assert (=> b!741406 m!691847))

(declare-fun m!691851 () Bool)

(assert (=> b!741406 m!691851))

(declare-fun m!691853 () Bool)

(assert (=> b!741397 m!691853))

(declare-fun m!691855 () Bool)

(assert (=> b!741397 m!691855))

(declare-fun m!691857 () Bool)

(assert (=> b!741397 m!691857))

(assert (=> b!741397 m!691855))

(declare-fun m!691859 () Bool)

(assert (=> b!741397 m!691859))

(declare-fun m!691861 () Bool)

(assert (=> b!741397 m!691861))

(declare-fun m!691863 () Bool)

(assert (=> b!741407 m!691863))

(declare-fun m!691865 () Bool)

(assert (=> b!741407 m!691865))

(declare-fun m!691867 () Bool)

(assert (=> b!741398 m!691867))

(declare-fun m!691869 () Bool)

(assert (=> b!741402 m!691869))

(assert (=> b!741411 m!691847))

(assert (=> b!741411 m!691847))

(declare-fun m!691871 () Bool)

(assert (=> b!741411 m!691871))

(assert (=> b!741403 m!691847))

(assert (=> b!741403 m!691847))

(declare-fun m!691873 () Bool)

(assert (=> b!741403 m!691873))

(declare-fun m!691875 () Bool)

(assert (=> b!741412 m!691875))

(declare-fun m!691877 () Bool)

(assert (=> b!741400 m!691877))

(assert (=> b!741413 m!691847))

(assert (=> b!741413 m!691847))

(declare-fun m!691879 () Bool)

(assert (=> b!741413 m!691879))

(assert (=> b!741404 m!691847))

(assert (=> b!741404 m!691847))

(declare-fun m!691881 () Bool)

(assert (=> b!741404 m!691881))

(assert (=> b!741404 m!691881))

(assert (=> b!741404 m!691847))

(declare-fun m!691883 () Bool)

(assert (=> b!741404 m!691883))

(declare-fun m!691885 () Bool)

(assert (=> b!741408 m!691885))

(check-sat (not b!741403) (not b!741402) (not b!741399) (not b!741408) (not b!741413) (not b!741397) (not b!741412) (not b!741406) (not b!741398) (not b!741404) (not start!65288) (not b!741401) (not b!741407) (not b!741411))
(check-sat)
