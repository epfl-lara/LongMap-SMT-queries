; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65846 () Bool)

(assert start!65846)

(declare-fun res!513216 () Bool)

(declare-fun e!422923 () Bool)

(assert (=> start!65846 (=> (not res!513216) (not e!422923))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65846 (= res!513216 (validMask!0 mask!3328))))

(assert (=> start!65846 e!422923))

(assert (=> start!65846 true))

(declare-datatypes ((array!42019 0))(
  ( (array!42020 (arr!20123 (Array (_ BitVec 32) (_ BitVec 64))) (size!20544 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42019)

(declare-fun array_inv!15919 (array!42019) Bool)

(assert (=> start!65846 (array_inv!15919 a!3186)))

(declare-fun b!758583 () Bool)

(declare-fun e!422925 () Bool)

(declare-fun e!422927 () Bool)

(assert (=> b!758583 (= e!422925 e!422927)))

(declare-fun res!513223 () Bool)

(assert (=> b!758583 (=> res!513223 e!422927)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!758583 (= res!513223 (or (not (= (select (arr!20123 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-datatypes ((SeekEntryResult!7723 0))(
  ( (MissingZero!7723 (index!33260 (_ BitVec 32))) (Found!7723 (index!33261 (_ BitVec 32))) (Intermediate!7723 (undefined!8535 Bool) (index!33262 (_ BitVec 32)) (x!64145 (_ BitVec 32))) (Undefined!7723) (MissingVacant!7723 (index!33263 (_ BitVec 32))) )
))
(declare-fun lt!337968 () SeekEntryResult!7723)

(declare-fun lt!337970 () SeekEntryResult!7723)

(declare-fun lt!337978 () SeekEntryResult!7723)

(declare-fun lt!337969 () SeekEntryResult!7723)

(assert (=> b!758583 (and (= lt!337968 lt!337978) (= lt!337970 lt!337969))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!337966 () array!42019)

(declare-fun lt!337974 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42019 (_ BitVec 32)) SeekEntryResult!7723)

(assert (=> b!758583 (= lt!337978 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337974 lt!337966 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42019 (_ BitVec 32)) SeekEntryResult!7723)

(assert (=> b!758583 (= lt!337968 (seekEntryOrOpen!0 lt!337974 lt!337966 mask!3328))))

(declare-fun lt!337967 () (_ BitVec 64))

(assert (=> b!758583 (= lt!337967 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!26272 0))(
  ( (Unit!26273) )
))
(declare-fun lt!337971 () Unit!26272)

(declare-fun e!422928 () Unit!26272)

(assert (=> b!758583 (= lt!337971 e!422928)))

(declare-fun c!83068 () Bool)

(assert (=> b!758583 (= c!83068 (= lt!337967 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758584 () Bool)

(declare-fun res!513215 () Bool)

(assert (=> b!758584 (=> (not res!513215) (not e!422923))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758584 (= res!513215 (and (= (size!20544 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20544 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20544 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758585 () Bool)

(declare-fun res!513210 () Bool)

(declare-fun e!422930 () Bool)

(assert (=> b!758585 (=> (not res!513210) (not e!422930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42019 (_ BitVec 32)) Bool)

(assert (=> b!758585 (= res!513210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758586 () Bool)

(declare-fun res!513222 () Bool)

(assert (=> b!758586 (=> (not res!513222) (not e!422930))))

(declare-datatypes ((List!14125 0))(
  ( (Nil!14122) (Cons!14121 (h!15193 (_ BitVec 64)) (t!20440 List!14125)) )
))
(declare-fun arrayNoDuplicates!0 (array!42019 (_ BitVec 32) List!14125) Bool)

(assert (=> b!758586 (= res!513222 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14122))))

(declare-fun b!758587 () Bool)

(declare-fun e!422929 () Bool)

(assert (=> b!758587 (= e!422930 e!422929)))

(declare-fun res!513217 () Bool)

(assert (=> b!758587 (=> (not res!513217) (not e!422929))))

(declare-fun lt!337965 () SeekEntryResult!7723)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42019 (_ BitVec 32)) SeekEntryResult!7723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758587 (= res!513217 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20123 a!3186) j!159) mask!3328) (select (arr!20123 a!3186) j!159) a!3186 mask!3328) lt!337965))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758587 (= lt!337965 (Intermediate!7723 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758588 () Bool)

(declare-fun res!513220 () Bool)

(assert (=> b!758588 (=> (not res!513220) (not e!422923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758588 (= res!513220 (validKeyInArray!0 (select (arr!20123 a!3186) j!159)))))

(declare-fun b!758589 () Bool)

(declare-fun Unit!26274 () Unit!26272)

(assert (=> b!758589 (= e!422928 Unit!26274)))

(assert (=> b!758589 false))

(declare-fun b!758590 () Bool)

(declare-fun Unit!26275 () Unit!26272)

(assert (=> b!758590 (= e!422928 Unit!26275)))

(declare-fun b!758591 () Bool)

(assert (=> b!758591 (= e!422923 e!422930)))

(declare-fun res!513211 () Bool)

(assert (=> b!758591 (=> (not res!513211) (not e!422930))))

(declare-fun lt!337979 () SeekEntryResult!7723)

(assert (=> b!758591 (= res!513211 (or (= lt!337979 (MissingZero!7723 i!1173)) (= lt!337979 (MissingVacant!7723 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!758591 (= lt!337979 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758592 () Bool)

(assert (=> b!758592 (= e!422927 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!758592 (= lt!337978 lt!337969)))

(declare-fun lt!337975 () Unit!26272)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26272)

(assert (=> b!758592 (= lt!337975 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun lt!337976 () SeekEntryResult!7723)

(declare-fun b!758593 () Bool)

(declare-fun e!422932 () Bool)

(assert (=> b!758593 (= e!422932 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20123 a!3186) j!159) a!3186 mask!3328) lt!337976))))

(declare-fun b!758594 () Bool)

(declare-fun res!513214 () Bool)

(assert (=> b!758594 (=> (not res!513214) (not e!422923))))

(declare-fun arrayContainsKey!0 (array!42019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758594 (= res!513214 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758595 () Bool)

(declare-fun res!513227 () Bool)

(assert (=> b!758595 (=> (not res!513227) (not e!422929))))

(assert (=> b!758595 (= res!513227 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20123 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758596 () Bool)

(declare-fun e!422922 () Bool)

(assert (=> b!758596 (= e!422922 e!422925)))

(declare-fun res!513221 () Bool)

(assert (=> b!758596 (=> res!513221 e!422925)))

(assert (=> b!758596 (= res!513221 (= lt!337967 lt!337974))))

(assert (=> b!758596 (= lt!337967 (select (store (arr!20123 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!758597 () Bool)

(declare-fun res!513213 () Bool)

(assert (=> b!758597 (=> (not res!513213) (not e!422923))))

(assert (=> b!758597 (= res!513213 (validKeyInArray!0 k!2102))))

(declare-fun b!758598 () Bool)

(declare-fun e!422924 () Bool)

(declare-fun e!422933 () Bool)

(assert (=> b!758598 (= e!422924 (not e!422933))))

(declare-fun res!513219 () Bool)

(assert (=> b!758598 (=> res!513219 e!422933)))

(declare-fun lt!337977 () SeekEntryResult!7723)

(assert (=> b!758598 (= res!513219 (or (not (is-Intermediate!7723 lt!337977)) (bvslt x!1131 (x!64145 lt!337977)) (not (= x!1131 (x!64145 lt!337977))) (not (= index!1321 (index!33262 lt!337977)))))))

(assert (=> b!758598 e!422932))

(declare-fun res!513212 () Bool)

(assert (=> b!758598 (=> (not res!513212) (not e!422932))))

(assert (=> b!758598 (= res!513212 (= lt!337970 lt!337976))))

(assert (=> b!758598 (= lt!337976 (Found!7723 j!159))))

(assert (=> b!758598 (= lt!337970 (seekEntryOrOpen!0 (select (arr!20123 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758598 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337972 () Unit!26272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26272)

(assert (=> b!758598 (= lt!337972 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!422926 () Bool)

(declare-fun b!758599 () Bool)

(assert (=> b!758599 (= e!422926 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20123 a!3186) j!159) a!3186 mask!3328) lt!337965))))

(declare-fun b!758600 () Bool)

(assert (=> b!758600 (= e!422926 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20123 a!3186) j!159) a!3186 mask!3328) (Found!7723 j!159)))))

(declare-fun b!758601 () Bool)

(declare-fun res!513225 () Bool)

(assert (=> b!758601 (=> (not res!513225) (not e!422930))))

(assert (=> b!758601 (= res!513225 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20544 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20544 a!3186))))))

(declare-fun b!758602 () Bool)

(declare-fun res!513218 () Bool)

(assert (=> b!758602 (=> (not res!513218) (not e!422929))))

(assert (=> b!758602 (= res!513218 e!422926)))

(declare-fun c!83067 () Bool)

(assert (=> b!758602 (= c!83067 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758603 () Bool)

(assert (=> b!758603 (= e!422933 e!422922)))

(declare-fun res!513226 () Bool)

(assert (=> b!758603 (=> res!513226 e!422922)))

(assert (=> b!758603 (= res!513226 (not (= lt!337969 lt!337976)))))

(assert (=> b!758603 (= lt!337969 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20123 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758604 () Bool)

(assert (=> b!758604 (= e!422929 e!422924)))

(declare-fun res!513224 () Bool)

(assert (=> b!758604 (=> (not res!513224) (not e!422924))))

(declare-fun lt!337973 () SeekEntryResult!7723)

(assert (=> b!758604 (= res!513224 (= lt!337973 lt!337977))))

(assert (=> b!758604 (= lt!337977 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337974 lt!337966 mask!3328))))

(assert (=> b!758604 (= lt!337973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337974 mask!3328) lt!337974 lt!337966 mask!3328))))

(assert (=> b!758604 (= lt!337974 (select (store (arr!20123 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!758604 (= lt!337966 (array!42020 (store (arr!20123 a!3186) i!1173 k!2102) (size!20544 a!3186)))))

(assert (= (and start!65846 res!513216) b!758584))

(assert (= (and b!758584 res!513215) b!758588))

(assert (= (and b!758588 res!513220) b!758597))

(assert (= (and b!758597 res!513213) b!758594))

(assert (= (and b!758594 res!513214) b!758591))

(assert (= (and b!758591 res!513211) b!758585))

(assert (= (and b!758585 res!513210) b!758586))

(assert (= (and b!758586 res!513222) b!758601))

(assert (= (and b!758601 res!513225) b!758587))

(assert (= (and b!758587 res!513217) b!758595))

(assert (= (and b!758595 res!513227) b!758602))

(assert (= (and b!758602 c!83067) b!758599))

(assert (= (and b!758602 (not c!83067)) b!758600))

(assert (= (and b!758602 res!513218) b!758604))

(assert (= (and b!758604 res!513224) b!758598))

(assert (= (and b!758598 res!513212) b!758593))

(assert (= (and b!758598 (not res!513219)) b!758603))

(assert (= (and b!758603 (not res!513226)) b!758596))

(assert (= (and b!758596 (not res!513221)) b!758583))

(assert (= (and b!758583 c!83068) b!758589))

(assert (= (and b!758583 (not c!83068)) b!758590))

(assert (= (and b!758583 (not res!513223)) b!758592))

(declare-fun m!706043 () Bool)

(assert (=> b!758600 m!706043))

(assert (=> b!758600 m!706043))

(declare-fun m!706045 () Bool)

(assert (=> b!758600 m!706045))

(assert (=> b!758603 m!706043))

(assert (=> b!758603 m!706043))

(assert (=> b!758603 m!706045))

(declare-fun m!706047 () Bool)

(assert (=> b!758586 m!706047))

(declare-fun m!706049 () Bool)

(assert (=> b!758596 m!706049))

(declare-fun m!706051 () Bool)

(assert (=> b!758596 m!706051))

(declare-fun m!706053 () Bool)

(assert (=> b!758585 m!706053))

(assert (=> b!758599 m!706043))

(assert (=> b!758599 m!706043))

(declare-fun m!706055 () Bool)

(assert (=> b!758599 m!706055))

(declare-fun m!706057 () Bool)

(assert (=> b!758583 m!706057))

(declare-fun m!706059 () Bool)

(assert (=> b!758583 m!706059))

(declare-fun m!706061 () Bool)

(assert (=> b!758583 m!706061))

(declare-fun m!706063 () Bool)

(assert (=> start!65846 m!706063))

(declare-fun m!706065 () Bool)

(assert (=> start!65846 m!706065))

(declare-fun m!706067 () Bool)

(assert (=> b!758592 m!706067))

(declare-fun m!706069 () Bool)

(assert (=> b!758597 m!706069))

(assert (=> b!758587 m!706043))

(assert (=> b!758587 m!706043))

(declare-fun m!706071 () Bool)

(assert (=> b!758587 m!706071))

(assert (=> b!758587 m!706071))

(assert (=> b!758587 m!706043))

(declare-fun m!706073 () Bool)

(assert (=> b!758587 m!706073))

(assert (=> b!758593 m!706043))

(assert (=> b!758593 m!706043))

(declare-fun m!706075 () Bool)

(assert (=> b!758593 m!706075))

(assert (=> b!758598 m!706043))

(assert (=> b!758598 m!706043))

(declare-fun m!706077 () Bool)

(assert (=> b!758598 m!706077))

(declare-fun m!706079 () Bool)

(assert (=> b!758598 m!706079))

(declare-fun m!706081 () Bool)

(assert (=> b!758598 m!706081))

(assert (=> b!758588 m!706043))

(assert (=> b!758588 m!706043))

(declare-fun m!706083 () Bool)

(assert (=> b!758588 m!706083))

(declare-fun m!706085 () Bool)

(assert (=> b!758594 m!706085))

(declare-fun m!706087 () Bool)

(assert (=> b!758595 m!706087))

(declare-fun m!706089 () Bool)

(assert (=> b!758591 m!706089))

(declare-fun m!706091 () Bool)

(assert (=> b!758604 m!706091))

(declare-fun m!706093 () Bool)

(assert (=> b!758604 m!706093))

(declare-fun m!706095 () Bool)

(assert (=> b!758604 m!706095))

(assert (=> b!758604 m!706093))

(assert (=> b!758604 m!706049))

(declare-fun m!706097 () Bool)

(assert (=> b!758604 m!706097))

(push 1)

