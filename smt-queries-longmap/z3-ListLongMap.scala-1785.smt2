; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32396 () Bool)

(assert start!32396)

(declare-fun b!323391 () Bool)

(declare-fun e!199902 () Bool)

(assert (=> b!323391 (= e!199902 (not true))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323391 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!9966 0))(
  ( (Unit!9967) )
))
(declare-fun lt!156655 () Unit!9966)

(declare-fun e!199904 () Unit!9966)

(assert (=> b!323391 (= lt!156655 e!199904)))

(declare-fun c!50837 () Bool)

(assert (=> b!323391 (= c!50837 (not (= resIndex!58 index!1840)))))

(declare-fun b!323392 () Bool)

(declare-fun Unit!9968 () Unit!9966)

(assert (=> b!323392 (= e!199904 Unit!9968)))

(declare-fun b!323393 () Bool)

(declare-fun res!176984 () Bool)

(assert (=> b!323393 (=> (not res!176984) (not e!199902))))

(declare-datatypes ((array!16548 0))(
  ( (array!16549 (arr!7831 (Array (_ BitVec 32) (_ BitVec 64))) (size!8183 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16548)

(declare-datatypes ((SeekEntryResult!2927 0))(
  ( (MissingZero!2927 (index!13884 (_ BitVec 32))) (Found!2927 (index!13885 (_ BitVec 32))) (Intermediate!2927 (undefined!3739 Bool) (index!13886 (_ BitVec 32)) (x!32248 (_ BitVec 32))) (Undefined!2927) (MissingVacant!2927 (index!13887 (_ BitVec 32))) )
))
(declare-fun lt!156656 () SeekEntryResult!2927)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16548 (_ BitVec 32)) SeekEntryResult!2927)

(assert (=> b!323393 (= res!176984 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156656))))

(declare-fun b!323394 () Bool)

(declare-fun res!176980 () Bool)

(declare-fun e!199903 () Bool)

(assert (=> b!323394 (=> (not res!176980) (not e!199903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323394 (= res!176980 (validKeyInArray!0 k0!2497))))

(declare-fun res!176977 () Bool)

(assert (=> start!32396 (=> (not res!176977) (not e!199903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32396 (= res!176977 (validMask!0 mask!3777))))

(assert (=> start!32396 e!199903))

(declare-fun array_inv!5781 (array!16548) Bool)

(assert (=> start!32396 (array_inv!5781 a!3305)))

(assert (=> start!32396 true))

(declare-fun b!323395 () Bool)

(declare-fun res!176981 () Bool)

(assert (=> b!323395 (=> (not res!176981) (not e!199902))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323395 (= res!176981 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7831 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323396 () Bool)

(declare-fun res!176985 () Bool)

(assert (=> b!323396 (=> (not res!176985) (not e!199902))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323396 (= res!176985 (and (= (select (arr!7831 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8183 a!3305))))))

(declare-fun b!323397 () Bool)

(declare-fun res!176976 () Bool)

(assert (=> b!323397 (=> (not res!176976) (not e!199903))))

(declare-fun arrayContainsKey!0 (array!16548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323397 (= res!176976 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323398 () Bool)

(declare-fun res!176978 () Bool)

(assert (=> b!323398 (=> (not res!176978) (not e!199903))))

(assert (=> b!323398 (= res!176978 (and (= (size!8183 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8183 a!3305))))))

(declare-fun b!323399 () Bool)

(declare-fun e!199905 () Unit!9966)

(assert (=> b!323399 (= e!199904 e!199905)))

(declare-fun c!50836 () Bool)

(assert (=> b!323399 (= c!50836 (or (= (select (arr!7831 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7831 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323400 () Bool)

(declare-fun res!176979 () Bool)

(assert (=> b!323400 (=> (not res!176979) (not e!199903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16548 (_ BitVec 32)) Bool)

(assert (=> b!323400 (= res!176979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323401 () Bool)

(assert (=> b!323401 (= e!199903 e!199902)))

(declare-fun res!176983 () Bool)

(assert (=> b!323401 (=> (not res!176983) (not e!199902))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323401 (= res!176983 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156656))))

(assert (=> b!323401 (= lt!156656 (Intermediate!2927 false resIndex!58 resX!58))))

(declare-fun b!323402 () Bool)

(assert (=> b!323402 false))

(declare-fun Unit!9969 () Unit!9966)

(assert (=> b!323402 (= e!199905 Unit!9969)))

(declare-fun b!323403 () Bool)

(assert (=> b!323403 false))

(declare-fun lt!156657 () Unit!9966)

(declare-fun e!199900 () Unit!9966)

(assert (=> b!323403 (= lt!156657 e!199900)))

(declare-fun c!50835 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323403 (= c!50835 ((_ is Intermediate!2927) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9970 () Unit!9966)

(assert (=> b!323403 (= e!199905 Unit!9970)))

(declare-fun b!323404 () Bool)

(declare-fun Unit!9971 () Unit!9966)

(assert (=> b!323404 (= e!199900 Unit!9971)))

(declare-fun b!323405 () Bool)

(declare-fun Unit!9972 () Unit!9966)

(assert (=> b!323405 (= e!199900 Unit!9972)))

(assert (=> b!323405 false))

(declare-fun b!323406 () Bool)

(declare-fun res!176982 () Bool)

(assert (=> b!323406 (=> (not res!176982) (not e!199903))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16548 (_ BitVec 32)) SeekEntryResult!2927)

(assert (=> b!323406 (= res!176982 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2927 i!1250)))))

(assert (= (and start!32396 res!176977) b!323398))

(assert (= (and b!323398 res!176978) b!323394))

(assert (= (and b!323394 res!176980) b!323397))

(assert (= (and b!323397 res!176976) b!323406))

(assert (= (and b!323406 res!176982) b!323400))

(assert (= (and b!323400 res!176979) b!323401))

(assert (= (and b!323401 res!176983) b!323396))

(assert (= (and b!323396 res!176985) b!323393))

(assert (= (and b!323393 res!176984) b!323395))

(assert (= (and b!323395 res!176981) b!323391))

(assert (= (and b!323391 c!50837) b!323399))

(assert (= (and b!323391 (not c!50837)) b!323392))

(assert (= (and b!323399 c!50836) b!323402))

(assert (= (and b!323399 (not c!50836)) b!323403))

(assert (= (and b!323403 c!50835) b!323404))

(assert (= (and b!323403 (not c!50835)) b!323405))

(declare-fun m!331003 () Bool)

(assert (=> b!323399 m!331003))

(declare-fun m!331005 () Bool)

(assert (=> b!323397 m!331005))

(declare-fun m!331007 () Bool)

(assert (=> b!323403 m!331007))

(assert (=> b!323403 m!331007))

(declare-fun m!331009 () Bool)

(assert (=> b!323403 m!331009))

(declare-fun m!331011 () Bool)

(assert (=> b!323401 m!331011))

(assert (=> b!323401 m!331011))

(declare-fun m!331013 () Bool)

(assert (=> b!323401 m!331013))

(declare-fun m!331015 () Bool)

(assert (=> b!323393 m!331015))

(declare-fun m!331017 () Bool)

(assert (=> b!323406 m!331017))

(declare-fun m!331019 () Bool)

(assert (=> start!32396 m!331019))

(declare-fun m!331021 () Bool)

(assert (=> start!32396 m!331021))

(declare-fun m!331023 () Bool)

(assert (=> b!323400 m!331023))

(declare-fun m!331025 () Bool)

(assert (=> b!323396 m!331025))

(declare-fun m!331027 () Bool)

(assert (=> b!323394 m!331027))

(assert (=> b!323395 m!331003))

(check-sat (not b!323401) (not start!32396) (not b!323406) (not b!323403) (not b!323397) (not b!323394) (not b!323400) (not b!323393))
(check-sat)
