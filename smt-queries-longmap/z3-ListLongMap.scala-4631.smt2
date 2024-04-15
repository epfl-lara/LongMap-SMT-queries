; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64466 () Bool)

(assert start!64466)

(declare-fun b!725219 () Bool)

(declare-fun e!406115 () Bool)

(declare-fun e!406117 () Bool)

(assert (=> b!725219 (= e!406115 e!406117)))

(declare-fun res!486464 () Bool)

(assert (=> b!725219 (=> (not res!486464) (not e!406117))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321118 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41001 0))(
  ( (array!41002 (arr!19622 (Array (_ BitVec 32) (_ BitVec 64))) (size!20043 (_ BitVec 32))) )
))
(declare-fun lt!321116 () array!41001)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7219 0))(
  ( (MissingZero!7219 (index!31244 (_ BitVec 32))) (Found!7219 (index!31245 (_ BitVec 32))) (Intermediate!7219 (undefined!8031 Bool) (index!31246 (_ BitVec 32)) (x!62248 (_ BitVec 32))) (Undefined!7219) (MissingVacant!7219 (index!31247 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41001 (_ BitVec 32)) SeekEntryResult!7219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725219 (= res!486464 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321118 mask!3328) lt!321118 lt!321116 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321118 lt!321116 mask!3328)))))

(declare-fun a!3186 () array!41001)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725219 (= lt!321118 (select (store (arr!19622 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725219 (= lt!321116 (array!41002 (store (arr!19622 a!3186) i!1173 k0!2102) (size!20043 a!3186)))))

(declare-fun b!725220 () Bool)

(declare-fun res!486458 () Bool)

(declare-fun e!406112 () Bool)

(assert (=> b!725220 (=> (not res!486458) (not e!406112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725220 (= res!486458 (validKeyInArray!0 (select (arr!19622 a!3186) j!159)))))

(declare-fun e!406110 () Bool)

(declare-fun lt!321114 () SeekEntryResult!7219)

(declare-fun b!725221 () Bool)

(assert (=> b!725221 (= e!406110 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19622 a!3186) j!159) a!3186 mask!3328) lt!321114))))

(declare-fun b!725222 () Bool)

(declare-fun res!486467 () Bool)

(assert (=> b!725222 (=> (not res!486467) (not e!406112))))

(assert (=> b!725222 (= res!486467 (validKeyInArray!0 k0!2102))))

(declare-fun b!725223 () Bool)

(declare-fun e!406116 () Bool)

(declare-fun e!406113 () Bool)

(assert (=> b!725223 (= e!406116 e!406113)))

(declare-fun res!486454 () Bool)

(assert (=> b!725223 (=> (not res!486454) (not e!406113))))

(declare-fun lt!321119 () SeekEntryResult!7219)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41001 (_ BitVec 32)) SeekEntryResult!7219)

(assert (=> b!725223 (= res!486454 (= (seekEntryOrOpen!0 (select (arr!19622 a!3186) j!159) a!3186 mask!3328) lt!321119))))

(assert (=> b!725223 (= lt!321119 (Found!7219 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!725224 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41001 (_ BitVec 32)) SeekEntryResult!7219)

(assert (=> b!725224 (= e!406113 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19622 a!3186) j!159) a!3186 mask!3328) lt!321119))))

(declare-fun b!725225 () Bool)

(declare-fun res!486459 () Bool)

(assert (=> b!725225 (=> (not res!486459) (not e!406115))))

(assert (=> b!725225 (= res!486459 e!406110)))

(declare-fun c!79755 () Bool)

(assert (=> b!725225 (= c!79755 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725226 () Bool)

(assert (=> b!725226 (= e!406117 (not true))))

(assert (=> b!725226 e!406116))

(declare-fun res!486465 () Bool)

(assert (=> b!725226 (=> (not res!486465) (not e!406116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41001 (_ BitVec 32)) Bool)

(assert (=> b!725226 (= res!486465 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24728 0))(
  ( (Unit!24729) )
))
(declare-fun lt!321117 () Unit!24728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24728)

(assert (=> b!725226 (= lt!321117 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725227 () Bool)

(declare-fun e!406111 () Bool)

(assert (=> b!725227 (= e!406111 e!406115)))

(declare-fun res!486463 () Bool)

(assert (=> b!725227 (=> (not res!486463) (not e!406115))))

(assert (=> b!725227 (= res!486463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19622 a!3186) j!159) mask!3328) (select (arr!19622 a!3186) j!159) a!3186 mask!3328) lt!321114))))

(assert (=> b!725227 (= lt!321114 (Intermediate!7219 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725228 () Bool)

(assert (=> b!725228 (= e!406110 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19622 a!3186) j!159) a!3186 mask!3328) (Found!7219 j!159)))))

(declare-fun b!725229 () Bool)

(declare-fun res!486462 () Bool)

(assert (=> b!725229 (=> (not res!486462) (not e!406115))))

(assert (=> b!725229 (= res!486462 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19622 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725230 () Bool)

(declare-fun res!486468 () Bool)

(assert (=> b!725230 (=> (not res!486468) (not e!406112))))

(assert (=> b!725230 (= res!486468 (and (= (size!20043 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20043 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20043 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725218 () Bool)

(assert (=> b!725218 (= e!406112 e!406111)))

(declare-fun res!486466 () Bool)

(assert (=> b!725218 (=> (not res!486466) (not e!406111))))

(declare-fun lt!321115 () SeekEntryResult!7219)

(assert (=> b!725218 (= res!486466 (or (= lt!321115 (MissingZero!7219 i!1173)) (= lt!321115 (MissingVacant!7219 i!1173))))))

(assert (=> b!725218 (= lt!321115 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!486460 () Bool)

(assert (=> start!64466 (=> (not res!486460) (not e!406112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64466 (= res!486460 (validMask!0 mask!3328))))

(assert (=> start!64466 e!406112))

(assert (=> start!64466 true))

(declare-fun array_inv!15505 (array!41001) Bool)

(assert (=> start!64466 (array_inv!15505 a!3186)))

(declare-fun b!725231 () Bool)

(declare-fun res!486455 () Bool)

(assert (=> b!725231 (=> (not res!486455) (not e!406111))))

(assert (=> b!725231 (= res!486455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725232 () Bool)

(declare-fun res!486461 () Bool)

(assert (=> b!725232 (=> (not res!486461) (not e!406111))))

(declare-datatypes ((List!13663 0))(
  ( (Nil!13660) (Cons!13659 (h!14716 (_ BitVec 64)) (t!19969 List!13663)) )
))
(declare-fun arrayNoDuplicates!0 (array!41001 (_ BitVec 32) List!13663) Bool)

(assert (=> b!725232 (= res!486461 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13660))))

(declare-fun b!725233 () Bool)

(declare-fun res!486457 () Bool)

(assert (=> b!725233 (=> (not res!486457) (not e!406111))))

(assert (=> b!725233 (= res!486457 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20043 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20043 a!3186))))))

(declare-fun b!725234 () Bool)

(declare-fun res!486456 () Bool)

(assert (=> b!725234 (=> (not res!486456) (not e!406112))))

(declare-fun arrayContainsKey!0 (array!41001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725234 (= res!486456 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64466 res!486460) b!725230))

(assert (= (and b!725230 res!486468) b!725220))

(assert (= (and b!725220 res!486458) b!725222))

(assert (= (and b!725222 res!486467) b!725234))

(assert (= (and b!725234 res!486456) b!725218))

(assert (= (and b!725218 res!486466) b!725231))

(assert (= (and b!725231 res!486455) b!725232))

(assert (= (and b!725232 res!486461) b!725233))

(assert (= (and b!725233 res!486457) b!725227))

(assert (= (and b!725227 res!486463) b!725229))

(assert (= (and b!725229 res!486462) b!725225))

(assert (= (and b!725225 c!79755) b!725221))

(assert (= (and b!725225 (not c!79755)) b!725228))

(assert (= (and b!725225 res!486459) b!725219))

(assert (= (and b!725219 res!486464) b!725226))

(assert (= (and b!725226 res!486465) b!725223))

(assert (= (and b!725223 res!486454) b!725224))

(declare-fun m!678869 () Bool)

(assert (=> b!725222 m!678869))

(declare-fun m!678871 () Bool)

(assert (=> start!64466 m!678871))

(declare-fun m!678873 () Bool)

(assert (=> start!64466 m!678873))

(declare-fun m!678875 () Bool)

(assert (=> b!725234 m!678875))

(declare-fun m!678877 () Bool)

(assert (=> b!725229 m!678877))

(declare-fun m!678879 () Bool)

(assert (=> b!725220 m!678879))

(assert (=> b!725220 m!678879))

(declare-fun m!678881 () Bool)

(assert (=> b!725220 m!678881))

(assert (=> b!725228 m!678879))

(assert (=> b!725228 m!678879))

(declare-fun m!678883 () Bool)

(assert (=> b!725228 m!678883))

(declare-fun m!678885 () Bool)

(assert (=> b!725219 m!678885))

(declare-fun m!678887 () Bool)

(assert (=> b!725219 m!678887))

(declare-fun m!678889 () Bool)

(assert (=> b!725219 m!678889))

(declare-fun m!678891 () Bool)

(assert (=> b!725219 m!678891))

(assert (=> b!725219 m!678885))

(declare-fun m!678893 () Bool)

(assert (=> b!725219 m!678893))

(declare-fun m!678895 () Bool)

(assert (=> b!725226 m!678895))

(declare-fun m!678897 () Bool)

(assert (=> b!725226 m!678897))

(assert (=> b!725224 m!678879))

(assert (=> b!725224 m!678879))

(declare-fun m!678899 () Bool)

(assert (=> b!725224 m!678899))

(declare-fun m!678901 () Bool)

(assert (=> b!725231 m!678901))

(declare-fun m!678903 () Bool)

(assert (=> b!725218 m!678903))

(assert (=> b!725221 m!678879))

(assert (=> b!725221 m!678879))

(declare-fun m!678905 () Bool)

(assert (=> b!725221 m!678905))

(assert (=> b!725223 m!678879))

(assert (=> b!725223 m!678879))

(declare-fun m!678907 () Bool)

(assert (=> b!725223 m!678907))

(assert (=> b!725227 m!678879))

(assert (=> b!725227 m!678879))

(declare-fun m!678909 () Bool)

(assert (=> b!725227 m!678909))

(assert (=> b!725227 m!678909))

(assert (=> b!725227 m!678879))

(declare-fun m!678911 () Bool)

(assert (=> b!725227 m!678911))

(declare-fun m!678913 () Bool)

(assert (=> b!725232 m!678913))

(check-sat (not b!725223) (not b!725234) (not b!725224) (not b!725228) (not b!725222) (not b!725221) (not b!725220) (not start!64466) (not b!725226) (not b!725232) (not b!725227) (not b!725231) (not b!725218) (not b!725219))
(check-sat)
