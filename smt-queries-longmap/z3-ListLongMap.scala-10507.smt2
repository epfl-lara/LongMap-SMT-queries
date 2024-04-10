; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123800 () Bool)

(assert start!123800)

(declare-fun b!1434846 () Bool)

(declare-fun res!968096 () Bool)

(declare-fun e!809816 () Bool)

(assert (=> b!1434846 (=> (not res!968096) (not e!809816))))

(declare-datatypes ((array!97601 0))(
  ( (array!97602 (arr!47103 (Array (_ BitVec 32) (_ BitVec 64))) (size!47653 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97601)

(declare-datatypes ((List!33613 0))(
  ( (Nil!33610) (Cons!33609 (h!34941 (_ BitVec 64)) (t!48307 List!33613)) )
))
(declare-fun arrayNoDuplicates!0 (array!97601 (_ BitVec 32) List!33613) Bool)

(assert (=> b!1434846 (= res!968096 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33610))))

(declare-fun b!1434847 () Bool)

(declare-fun res!968101 () Bool)

(declare-fun e!809815 () Bool)

(assert (=> b!1434847 (=> (not res!968101) (not e!809815))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!631636 () array!97601)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11382 0))(
  ( (MissingZero!11382 (index!47920 (_ BitVec 32))) (Found!11382 (index!47921 (_ BitVec 32))) (Intermediate!11382 (undefined!12194 Bool) (index!47922 (_ BitVec 32)) (x!129579 (_ BitVec 32))) (Undefined!11382) (MissingVacant!11382 (index!47923 (_ BitVec 32))) )
))
(declare-fun lt!631638 () SeekEntryResult!11382)

(declare-fun lt!631641 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97601 (_ BitVec 32)) SeekEntryResult!11382)

(assert (=> b!1434847 (= res!968101 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631641 lt!631636 mask!2608) lt!631638))))

(declare-fun b!1434848 () Bool)

(declare-fun res!968099 () Bool)

(declare-fun e!809810 () Bool)

(assert (=> b!1434848 (=> res!968099 e!809810)))

(declare-fun lt!631640 () SeekEntryResult!11382)

(declare-fun lt!631637 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1434848 (= res!968099 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631637 (select (arr!47103 a!2831) j!81) a!2831 mask!2608) lt!631640)))))

(declare-fun b!1434849 () Bool)

(declare-fun e!809812 () Bool)

(assert (=> b!1434849 (= e!809812 e!809815)))

(declare-fun res!968094 () Bool)

(assert (=> b!1434849 (=> (not res!968094) (not e!809815))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434849 (= res!968094 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631641 mask!2608) lt!631641 lt!631636 mask!2608) lt!631638))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434849 (= lt!631638 (Intermediate!11382 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434849 (= lt!631641 (select (store (arr!47103 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434849 (= lt!631636 (array!97602 (store (arr!47103 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47653 a!2831)))))

(declare-fun b!1434850 () Bool)

(declare-fun e!809814 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97601 (_ BitVec 32)) SeekEntryResult!11382)

(assert (=> b!1434850 (= e!809814 (= (seekEntryOrOpen!0 (select (arr!47103 a!2831) j!81) a!2831 mask!2608) (Found!11382 j!81)))))

(declare-fun b!1434851 () Bool)

(declare-fun e!809811 () Bool)

(assert (=> b!1434851 (= e!809811 e!809810)))

(declare-fun res!968102 () Bool)

(assert (=> b!1434851 (=> res!968102 e!809810)))

(assert (=> b!1434851 (= res!968102 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631637 #b00000000000000000000000000000000) (bvsge lt!631637 (size!47653 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434851 (= lt!631637 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1434852 () Bool)

(declare-fun res!968104 () Bool)

(assert (=> b!1434852 (=> (not res!968104) (not e!809816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434852 (= res!968104 (validKeyInArray!0 (select (arr!47103 a!2831) j!81)))))

(declare-fun res!968089 () Bool)

(assert (=> start!123800 (=> (not res!968089) (not e!809816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123800 (= res!968089 (validMask!0 mask!2608))))

(assert (=> start!123800 e!809816))

(assert (=> start!123800 true))

(declare-fun array_inv!36131 (array!97601) Bool)

(assert (=> start!123800 (array_inv!36131 a!2831)))

(declare-fun b!1434853 () Bool)

(declare-fun res!968100 () Bool)

(assert (=> b!1434853 (=> (not res!968100) (not e!809816))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1434853 (= res!968100 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47653 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47653 a!2831))))))

(declare-fun b!1434854 () Bool)

(assert (=> b!1434854 (= e!809810 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631637 lt!631641 lt!631636 mask!2608) lt!631638))))

(declare-fun b!1434855 () Bool)

(declare-fun res!968090 () Bool)

(assert (=> b!1434855 (=> (not res!968090) (not e!809815))))

(assert (=> b!1434855 (= res!968090 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434856 () Bool)

(declare-fun res!968091 () Bool)

(assert (=> b!1434856 (=> (not res!968091) (not e!809816))))

(assert (=> b!1434856 (= res!968091 (and (= (size!47653 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47653 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47653 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434857 () Bool)

(assert (=> b!1434857 (= e!809815 (not e!809811))))

(declare-fun res!968103 () Bool)

(assert (=> b!1434857 (=> res!968103 e!809811)))

(assert (=> b!1434857 (= res!968103 (or (= (select (arr!47103 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47103 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47103 a!2831) index!585) (select (arr!47103 a!2831) j!81)) (= (select (store (arr!47103 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434857 e!809814))

(declare-fun res!968095 () Bool)

(assert (=> b!1434857 (=> (not res!968095) (not e!809814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97601 (_ BitVec 32)) Bool)

(assert (=> b!1434857 (= res!968095 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48510 0))(
  ( (Unit!48511) )
))
(declare-fun lt!631639 () Unit!48510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48510)

(assert (=> b!1434857 (= lt!631639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434858 () Bool)

(declare-fun res!968098 () Bool)

(assert (=> b!1434858 (=> (not res!968098) (not e!809816))))

(assert (=> b!1434858 (= res!968098 (validKeyInArray!0 (select (arr!47103 a!2831) i!982)))))

(declare-fun b!1434859 () Bool)

(declare-fun res!968092 () Bool)

(assert (=> b!1434859 (=> (not res!968092) (not e!809816))))

(assert (=> b!1434859 (= res!968092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434860 () Bool)

(declare-fun res!968093 () Bool)

(assert (=> b!1434860 (=> (not res!968093) (not e!809815))))

(assert (=> b!1434860 (= res!968093 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47103 a!2831) j!81) a!2831 mask!2608) lt!631640))))

(declare-fun b!1434861 () Bool)

(assert (=> b!1434861 (= e!809816 e!809812)))

(declare-fun res!968097 () Bool)

(assert (=> b!1434861 (=> (not res!968097) (not e!809812))))

(assert (=> b!1434861 (= res!968097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47103 a!2831) j!81) mask!2608) (select (arr!47103 a!2831) j!81) a!2831 mask!2608) lt!631640))))

(assert (=> b!1434861 (= lt!631640 (Intermediate!11382 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123800 res!968089) b!1434856))

(assert (= (and b!1434856 res!968091) b!1434858))

(assert (= (and b!1434858 res!968098) b!1434852))

(assert (= (and b!1434852 res!968104) b!1434859))

(assert (= (and b!1434859 res!968092) b!1434846))

(assert (= (and b!1434846 res!968096) b!1434853))

(assert (= (and b!1434853 res!968100) b!1434861))

(assert (= (and b!1434861 res!968097) b!1434849))

(assert (= (and b!1434849 res!968094) b!1434860))

(assert (= (and b!1434860 res!968093) b!1434847))

(assert (= (and b!1434847 res!968101) b!1434855))

(assert (= (and b!1434855 res!968090) b!1434857))

(assert (= (and b!1434857 res!968095) b!1434850))

(assert (= (and b!1434857 (not res!968103)) b!1434851))

(assert (= (and b!1434851 (not res!968102)) b!1434848))

(assert (= (and b!1434848 (not res!968099)) b!1434854))

(declare-fun m!1324341 () Bool)

(assert (=> b!1434858 m!1324341))

(assert (=> b!1434858 m!1324341))

(declare-fun m!1324343 () Bool)

(assert (=> b!1434858 m!1324343))

(declare-fun m!1324345 () Bool)

(assert (=> b!1434861 m!1324345))

(assert (=> b!1434861 m!1324345))

(declare-fun m!1324347 () Bool)

(assert (=> b!1434861 m!1324347))

(assert (=> b!1434861 m!1324347))

(assert (=> b!1434861 m!1324345))

(declare-fun m!1324349 () Bool)

(assert (=> b!1434861 m!1324349))

(assert (=> b!1434860 m!1324345))

(assert (=> b!1434860 m!1324345))

(declare-fun m!1324351 () Bool)

(assert (=> b!1434860 m!1324351))

(declare-fun m!1324353 () Bool)

(assert (=> start!123800 m!1324353))

(declare-fun m!1324355 () Bool)

(assert (=> start!123800 m!1324355))

(declare-fun m!1324357 () Bool)

(assert (=> b!1434851 m!1324357))

(assert (=> b!1434848 m!1324345))

(assert (=> b!1434848 m!1324345))

(declare-fun m!1324359 () Bool)

(assert (=> b!1434848 m!1324359))

(declare-fun m!1324361 () Bool)

(assert (=> b!1434854 m!1324361))

(declare-fun m!1324363 () Bool)

(assert (=> b!1434847 m!1324363))

(declare-fun m!1324365 () Bool)

(assert (=> b!1434846 m!1324365))

(assert (=> b!1434852 m!1324345))

(assert (=> b!1434852 m!1324345))

(declare-fun m!1324367 () Bool)

(assert (=> b!1434852 m!1324367))

(declare-fun m!1324369 () Bool)

(assert (=> b!1434849 m!1324369))

(assert (=> b!1434849 m!1324369))

(declare-fun m!1324371 () Bool)

(assert (=> b!1434849 m!1324371))

(declare-fun m!1324373 () Bool)

(assert (=> b!1434849 m!1324373))

(declare-fun m!1324375 () Bool)

(assert (=> b!1434849 m!1324375))

(assert (=> b!1434850 m!1324345))

(assert (=> b!1434850 m!1324345))

(declare-fun m!1324377 () Bool)

(assert (=> b!1434850 m!1324377))

(assert (=> b!1434857 m!1324373))

(declare-fun m!1324379 () Bool)

(assert (=> b!1434857 m!1324379))

(declare-fun m!1324381 () Bool)

(assert (=> b!1434857 m!1324381))

(declare-fun m!1324383 () Bool)

(assert (=> b!1434857 m!1324383))

(assert (=> b!1434857 m!1324345))

(declare-fun m!1324385 () Bool)

(assert (=> b!1434857 m!1324385))

(declare-fun m!1324387 () Bool)

(assert (=> b!1434859 m!1324387))

(check-sat (not b!1434848) (not b!1434861) (not b!1434860) (not b!1434850) (not b!1434857) (not b!1434847) (not b!1434851) (not b!1434852) (not start!123800) (not b!1434846) (not b!1434859) (not b!1434858) (not b!1434854) (not b!1434849))
(check-sat)
(get-model)

(declare-fun d!154293 () Bool)

(assert (=> d!154293 (= (validKeyInArray!0 (select (arr!47103 a!2831) i!982)) (and (not (= (select (arr!47103 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47103 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434858 d!154293))

(declare-fun b!1434928 () Bool)

(declare-fun e!809848 () Bool)

(declare-fun e!809851 () Bool)

(assert (=> b!1434928 (= e!809848 e!809851)))

(declare-fun res!968161 () Bool)

(declare-fun lt!631665 () SeekEntryResult!11382)

(get-info :version)

(assert (=> b!1434928 (= res!968161 (and ((_ is Intermediate!11382) lt!631665) (not (undefined!12194 lt!631665)) (bvslt (x!129579 lt!631665) #b01111111111111111111111111111110) (bvsge (x!129579 lt!631665) #b00000000000000000000000000000000) (bvsge (x!129579 lt!631665) x!605)))))

(assert (=> b!1434928 (=> (not res!968161) (not e!809851))))

(declare-fun b!1434929 () Bool)

(declare-fun e!809849 () SeekEntryResult!11382)

(declare-fun e!809852 () SeekEntryResult!11382)

(assert (=> b!1434929 (= e!809849 e!809852)))

(declare-fun c!132888 () Bool)

(declare-fun lt!631664 () (_ BitVec 64))

(assert (=> b!1434929 (= c!132888 (or (= lt!631664 lt!631641) (= (bvadd lt!631664 lt!631664) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434931 () Bool)

(assert (=> b!1434931 (and (bvsge (index!47922 lt!631665) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631665) (size!47653 lt!631636)))))

(declare-fun e!809850 () Bool)

(assert (=> b!1434931 (= e!809850 (= (select (arr!47103 lt!631636) (index!47922 lt!631665)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434932 () Bool)

(assert (=> b!1434932 (= e!809852 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631641 lt!631636 mask!2608))))

(declare-fun b!1434933 () Bool)

(assert (=> b!1434933 (= e!809849 (Intermediate!11382 true index!585 x!605))))

(declare-fun b!1434934 () Bool)

(assert (=> b!1434934 (and (bvsge (index!47922 lt!631665) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631665) (size!47653 lt!631636)))))

(declare-fun res!968159 () Bool)

(assert (=> b!1434934 (= res!968159 (= (select (arr!47103 lt!631636) (index!47922 lt!631665)) lt!631641))))

(assert (=> b!1434934 (=> res!968159 e!809850)))

(assert (=> b!1434934 (= e!809851 e!809850)))

(declare-fun b!1434935 () Bool)

(assert (=> b!1434935 (and (bvsge (index!47922 lt!631665) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631665) (size!47653 lt!631636)))))

(declare-fun res!968160 () Bool)

(assert (=> b!1434935 (= res!968160 (= (select (arr!47103 lt!631636) (index!47922 lt!631665)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434935 (=> res!968160 e!809850)))

(declare-fun b!1434936 () Bool)

(assert (=> b!1434936 (= e!809848 (bvsge (x!129579 lt!631665) #b01111111111111111111111111111110))))

(declare-fun d!154295 () Bool)

(assert (=> d!154295 e!809848))

(declare-fun c!132887 () Bool)

(assert (=> d!154295 (= c!132887 (and ((_ is Intermediate!11382) lt!631665) (undefined!12194 lt!631665)))))

(assert (=> d!154295 (= lt!631665 e!809849)))

(declare-fun c!132886 () Bool)

(assert (=> d!154295 (= c!132886 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154295 (= lt!631664 (select (arr!47103 lt!631636) index!585))))

(assert (=> d!154295 (validMask!0 mask!2608)))

(assert (=> d!154295 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631641 lt!631636 mask!2608) lt!631665)))

(declare-fun b!1434930 () Bool)

(assert (=> b!1434930 (= e!809852 (Intermediate!11382 false index!585 x!605))))

(assert (= (and d!154295 c!132886) b!1434933))

(assert (= (and d!154295 (not c!132886)) b!1434929))

(assert (= (and b!1434929 c!132888) b!1434930))

(assert (= (and b!1434929 (not c!132888)) b!1434932))

(assert (= (and d!154295 c!132887) b!1434936))

(assert (= (and d!154295 (not c!132887)) b!1434928))

(assert (= (and b!1434928 res!968161) b!1434934))

(assert (= (and b!1434934 (not res!968159)) b!1434935))

(assert (= (and b!1434935 (not res!968160)) b!1434931))

(declare-fun m!1324437 () Bool)

(assert (=> b!1434934 m!1324437))

(assert (=> b!1434935 m!1324437))

(assert (=> b!1434932 m!1324357))

(assert (=> b!1434932 m!1324357))

(declare-fun m!1324439 () Bool)

(assert (=> b!1434932 m!1324439))

(declare-fun m!1324441 () Bool)

(assert (=> d!154295 m!1324441))

(assert (=> d!154295 m!1324353))

(assert (=> b!1434931 m!1324437))

(assert (=> b!1434847 d!154295))

(declare-fun b!1434937 () Bool)

(declare-fun e!809853 () Bool)

(declare-fun e!809856 () Bool)

(assert (=> b!1434937 (= e!809853 e!809856)))

(declare-fun res!968164 () Bool)

(declare-fun lt!631667 () SeekEntryResult!11382)

(assert (=> b!1434937 (= res!968164 (and ((_ is Intermediate!11382) lt!631667) (not (undefined!12194 lt!631667)) (bvslt (x!129579 lt!631667) #b01111111111111111111111111111110) (bvsge (x!129579 lt!631667) #b00000000000000000000000000000000) (bvsge (x!129579 lt!631667) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1434937 (=> (not res!968164) (not e!809856))))

(declare-fun b!1434938 () Bool)

(declare-fun e!809854 () SeekEntryResult!11382)

(declare-fun e!809857 () SeekEntryResult!11382)

(assert (=> b!1434938 (= e!809854 e!809857)))

(declare-fun c!132891 () Bool)

(declare-fun lt!631666 () (_ BitVec 64))

(assert (=> b!1434938 (= c!132891 (or (= lt!631666 (select (arr!47103 a!2831) j!81)) (= (bvadd lt!631666 lt!631666) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434940 () Bool)

(assert (=> b!1434940 (and (bvsge (index!47922 lt!631667) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631667) (size!47653 a!2831)))))

(declare-fun e!809855 () Bool)

(assert (=> b!1434940 (= e!809855 (= (select (arr!47103 a!2831) (index!47922 lt!631667)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1434941 () Bool)

(assert (=> b!1434941 (= e!809857 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631637 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) (select (arr!47103 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434942 () Bool)

(assert (=> b!1434942 (= e!809854 (Intermediate!11382 true lt!631637 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1434943 () Bool)

(assert (=> b!1434943 (and (bvsge (index!47922 lt!631667) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631667) (size!47653 a!2831)))))

(declare-fun res!968162 () Bool)

(assert (=> b!1434943 (= res!968162 (= (select (arr!47103 a!2831) (index!47922 lt!631667)) (select (arr!47103 a!2831) j!81)))))

(assert (=> b!1434943 (=> res!968162 e!809855)))

(assert (=> b!1434943 (= e!809856 e!809855)))

(declare-fun b!1434944 () Bool)

(assert (=> b!1434944 (and (bvsge (index!47922 lt!631667) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631667) (size!47653 a!2831)))))

(declare-fun res!968163 () Bool)

(assert (=> b!1434944 (= res!968163 (= (select (arr!47103 a!2831) (index!47922 lt!631667)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434944 (=> res!968163 e!809855)))

(declare-fun b!1434945 () Bool)

(assert (=> b!1434945 (= e!809853 (bvsge (x!129579 lt!631667) #b01111111111111111111111111111110))))

(declare-fun d!154299 () Bool)

(assert (=> d!154299 e!809853))

(declare-fun c!132890 () Bool)

(assert (=> d!154299 (= c!132890 (and ((_ is Intermediate!11382) lt!631667) (undefined!12194 lt!631667)))))

(assert (=> d!154299 (= lt!631667 e!809854)))

(declare-fun c!132889 () Bool)

(assert (=> d!154299 (= c!132889 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154299 (= lt!631666 (select (arr!47103 a!2831) lt!631637))))

(assert (=> d!154299 (validMask!0 mask!2608)))

(assert (=> d!154299 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631637 (select (arr!47103 a!2831) j!81) a!2831 mask!2608) lt!631667)))

(declare-fun b!1434939 () Bool)

(assert (=> b!1434939 (= e!809857 (Intermediate!11382 false lt!631637 (bvadd #b00000000000000000000000000000001 x!605)))))

(assert (= (and d!154299 c!132889) b!1434942))

(assert (= (and d!154299 (not c!132889)) b!1434938))

(assert (= (and b!1434938 c!132891) b!1434939))

(assert (= (and b!1434938 (not c!132891)) b!1434941))

(assert (= (and d!154299 c!132890) b!1434945))

(assert (= (and d!154299 (not c!132890)) b!1434937))

(assert (= (and b!1434937 res!968164) b!1434943))

(assert (= (and b!1434943 (not res!968162)) b!1434944))

(assert (= (and b!1434944 (not res!968163)) b!1434940))

(declare-fun m!1324443 () Bool)

(assert (=> b!1434943 m!1324443))

(assert (=> b!1434944 m!1324443))

(declare-fun m!1324445 () Bool)

(assert (=> b!1434941 m!1324445))

(assert (=> b!1434941 m!1324445))

(assert (=> b!1434941 m!1324345))

(declare-fun m!1324447 () Bool)

(assert (=> b!1434941 m!1324447))

(declare-fun m!1324449 () Bool)

(assert (=> d!154299 m!1324449))

(assert (=> d!154299 m!1324353))

(assert (=> b!1434940 m!1324443))

(assert (=> b!1434848 d!154299))

(declare-fun b!1434956 () Bool)

(declare-fun e!809866 () Bool)

(declare-fun e!809867 () Bool)

(assert (=> b!1434956 (= e!809866 e!809867)))

(declare-fun res!968173 () Bool)

(assert (=> b!1434956 (=> (not res!968173) (not e!809867))))

(declare-fun e!809869 () Bool)

(assert (=> b!1434956 (= res!968173 (not e!809869))))

(declare-fun res!968171 () Bool)

(assert (=> b!1434956 (=> (not res!968171) (not e!809869))))

(assert (=> b!1434956 (= res!968171 (validKeyInArray!0 (select (arr!47103 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434957 () Bool)

(declare-fun e!809868 () Bool)

(declare-fun call!67543 () Bool)

(assert (=> b!1434957 (= e!809868 call!67543)))

(declare-fun b!1434958 () Bool)

(assert (=> b!1434958 (= e!809867 e!809868)))

(declare-fun c!132894 () Bool)

(assert (=> b!1434958 (= c!132894 (validKeyInArray!0 (select (arr!47103 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67540 () Bool)

(assert (=> bm!67540 (= call!67543 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132894 (Cons!33609 (select (arr!47103 a!2831) #b00000000000000000000000000000000) Nil!33610) Nil!33610)))))

(declare-fun d!154301 () Bool)

(declare-fun res!968172 () Bool)

(assert (=> d!154301 (=> res!968172 e!809866)))

(assert (=> d!154301 (= res!968172 (bvsge #b00000000000000000000000000000000 (size!47653 a!2831)))))

(assert (=> d!154301 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33610) e!809866)))

(declare-fun b!1434959 () Bool)

(declare-fun contains!9874 (List!33613 (_ BitVec 64)) Bool)

(assert (=> b!1434959 (= e!809869 (contains!9874 Nil!33610 (select (arr!47103 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1434960 () Bool)

(assert (=> b!1434960 (= e!809868 call!67543)))

(assert (= (and d!154301 (not res!968172)) b!1434956))

(assert (= (and b!1434956 res!968171) b!1434959))

(assert (= (and b!1434956 res!968173) b!1434958))

(assert (= (and b!1434958 c!132894) b!1434957))

(assert (= (and b!1434958 (not c!132894)) b!1434960))

(assert (= (or b!1434957 b!1434960) bm!67540))

(declare-fun m!1324451 () Bool)

(assert (=> b!1434956 m!1324451))

(assert (=> b!1434956 m!1324451))

(declare-fun m!1324453 () Bool)

(assert (=> b!1434956 m!1324453))

(assert (=> b!1434958 m!1324451))

(assert (=> b!1434958 m!1324451))

(assert (=> b!1434958 m!1324453))

(assert (=> bm!67540 m!1324451))

(declare-fun m!1324455 () Bool)

(assert (=> bm!67540 m!1324455))

(assert (=> b!1434959 m!1324451))

(assert (=> b!1434959 m!1324451))

(declare-fun m!1324457 () Bool)

(assert (=> b!1434959 m!1324457))

(assert (=> b!1434846 d!154301))

(declare-fun b!1434987 () Bool)

(declare-fun e!809885 () Bool)

(declare-fun call!67546 () Bool)

(assert (=> b!1434987 (= e!809885 call!67546)))

(declare-fun b!1434988 () Bool)

(declare-fun e!809886 () Bool)

(assert (=> b!1434988 (= e!809885 e!809886)))

(declare-fun lt!631683 () (_ BitVec 64))

(assert (=> b!1434988 (= lt!631683 (select (arr!47103 a!2831) j!81))))

(declare-fun lt!631685 () Unit!48510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97601 (_ BitVec 64) (_ BitVec 32)) Unit!48510)

(assert (=> b!1434988 (= lt!631685 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631683 j!81))))

(declare-fun arrayContainsKey!0 (array!97601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1434988 (arrayContainsKey!0 a!2831 lt!631683 #b00000000000000000000000000000000)))

(declare-fun lt!631684 () Unit!48510)

(assert (=> b!1434988 (= lt!631684 lt!631685)))

(declare-fun res!968179 () Bool)

(assert (=> b!1434988 (= res!968179 (= (seekEntryOrOpen!0 (select (arr!47103 a!2831) j!81) a!2831 mask!2608) (Found!11382 j!81)))))

(assert (=> b!1434988 (=> (not res!968179) (not e!809886))))

(declare-fun b!1434989 () Bool)

(assert (=> b!1434989 (= e!809886 call!67546)))

(declare-fun d!154303 () Bool)

(declare-fun res!968178 () Bool)

(declare-fun e!809887 () Bool)

(assert (=> d!154303 (=> res!968178 e!809887)))

(assert (=> d!154303 (= res!968178 (bvsge j!81 (size!47653 a!2831)))))

(assert (=> d!154303 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809887)))

(declare-fun bm!67543 () Bool)

(assert (=> bm!67543 (= call!67546 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1434990 () Bool)

(assert (=> b!1434990 (= e!809887 e!809885)))

(declare-fun c!132906 () Bool)

(assert (=> b!1434990 (= c!132906 (validKeyInArray!0 (select (arr!47103 a!2831) j!81)))))

(assert (= (and d!154303 (not res!968178)) b!1434990))

(assert (= (and b!1434990 c!132906) b!1434988))

(assert (= (and b!1434990 (not c!132906)) b!1434987))

(assert (= (and b!1434988 res!968179) b!1434989))

(assert (= (or b!1434989 b!1434987) bm!67543))

(assert (=> b!1434988 m!1324345))

(declare-fun m!1324469 () Bool)

(assert (=> b!1434988 m!1324469))

(declare-fun m!1324471 () Bool)

(assert (=> b!1434988 m!1324471))

(assert (=> b!1434988 m!1324345))

(assert (=> b!1434988 m!1324377))

(declare-fun m!1324473 () Bool)

(assert (=> bm!67543 m!1324473))

(assert (=> b!1434990 m!1324345))

(assert (=> b!1434990 m!1324345))

(assert (=> b!1434990 m!1324367))

(assert (=> b!1434857 d!154303))

(declare-fun d!154307 () Bool)

(assert (=> d!154307 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631694 () Unit!48510)

(declare-fun choose!38 (array!97601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48510)

(assert (=> d!154307 (= lt!631694 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154307 (validMask!0 mask!2608)))

(assert (=> d!154307 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631694)))

(declare-fun bs!41771 () Bool)

(assert (= bs!41771 d!154307))

(assert (=> bs!41771 m!1324383))

(declare-fun m!1324475 () Bool)

(assert (=> bs!41771 m!1324475))

(assert (=> bs!41771 m!1324353))

(assert (=> b!1434857 d!154307))

(declare-fun d!154311 () Bool)

(assert (=> d!154311 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123800 d!154311))

(declare-fun d!154323 () Bool)

(assert (=> d!154323 (= (array_inv!36131 a!2831) (bvsge (size!47653 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123800 d!154323))

(declare-fun b!1435003 () Bool)

(declare-fun e!809897 () Bool)

(declare-fun e!809900 () Bool)

(assert (=> b!1435003 (= e!809897 e!809900)))

(declare-fun res!968188 () Bool)

(declare-fun lt!631702 () SeekEntryResult!11382)

(assert (=> b!1435003 (= res!968188 (and ((_ is Intermediate!11382) lt!631702) (not (undefined!12194 lt!631702)) (bvslt (x!129579 lt!631702) #b01111111111111111111111111111110) (bvsge (x!129579 lt!631702) #b00000000000000000000000000000000) (bvsge (x!129579 lt!631702) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1435003 (=> (not res!968188) (not e!809900))))

(declare-fun b!1435004 () Bool)

(declare-fun e!809898 () SeekEntryResult!11382)

(declare-fun e!809901 () SeekEntryResult!11382)

(assert (=> b!1435004 (= e!809898 e!809901)))

(declare-fun c!132912 () Bool)

(declare-fun lt!631701 () (_ BitVec 64))

(assert (=> b!1435004 (= c!132912 (or (= lt!631701 lt!631641) (= (bvadd lt!631701 lt!631701) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435006 () Bool)

(assert (=> b!1435006 (and (bvsge (index!47922 lt!631702) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631702) (size!47653 lt!631636)))))

(declare-fun e!809899 () Bool)

(assert (=> b!1435006 (= e!809899 (= (select (arr!47103 lt!631636) (index!47922 lt!631702)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435007 () Bool)

(assert (=> b!1435007 (= e!809901 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631637 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) lt!631641 lt!631636 mask!2608))))

(declare-fun b!1435008 () Bool)

(assert (=> b!1435008 (= e!809898 (Intermediate!11382 true lt!631637 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435009 () Bool)

(assert (=> b!1435009 (and (bvsge (index!47922 lt!631702) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631702) (size!47653 lt!631636)))))

(declare-fun res!968186 () Bool)

(assert (=> b!1435009 (= res!968186 (= (select (arr!47103 lt!631636) (index!47922 lt!631702)) lt!631641))))

(assert (=> b!1435009 (=> res!968186 e!809899)))

(assert (=> b!1435009 (= e!809900 e!809899)))

(declare-fun b!1435010 () Bool)

(assert (=> b!1435010 (and (bvsge (index!47922 lt!631702) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631702) (size!47653 lt!631636)))))

(declare-fun res!968187 () Bool)

(assert (=> b!1435010 (= res!968187 (= (select (arr!47103 lt!631636) (index!47922 lt!631702)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435010 (=> res!968187 e!809899)))

(declare-fun b!1435011 () Bool)

(assert (=> b!1435011 (= e!809897 (bvsge (x!129579 lt!631702) #b01111111111111111111111111111110))))

(declare-fun d!154327 () Bool)

(assert (=> d!154327 e!809897))

(declare-fun c!132911 () Bool)

(assert (=> d!154327 (= c!132911 (and ((_ is Intermediate!11382) lt!631702) (undefined!12194 lt!631702)))))

(assert (=> d!154327 (= lt!631702 e!809898)))

(declare-fun c!132910 () Bool)

(assert (=> d!154327 (= c!132910 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154327 (= lt!631701 (select (arr!47103 lt!631636) lt!631637))))

(assert (=> d!154327 (validMask!0 mask!2608)))

(assert (=> d!154327 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631637 lt!631641 lt!631636 mask!2608) lt!631702)))

(declare-fun b!1435005 () Bool)

(assert (=> b!1435005 (= e!809901 (Intermediate!11382 false lt!631637 (bvadd #b00000000000000000000000000000001 x!605)))))

(assert (= (and d!154327 c!132910) b!1435008))

(assert (= (and d!154327 (not c!132910)) b!1435004))

(assert (= (and b!1435004 c!132912) b!1435005))

(assert (= (and b!1435004 (not c!132912)) b!1435007))

(assert (= (and d!154327 c!132911) b!1435011))

(assert (= (and d!154327 (not c!132911)) b!1435003))

(assert (= (and b!1435003 res!968188) b!1435009))

(assert (= (and b!1435009 (not res!968186)) b!1435010))

(assert (= (and b!1435010 (not res!968187)) b!1435006))

(declare-fun m!1324485 () Bool)

(assert (=> b!1435009 m!1324485))

(assert (=> b!1435010 m!1324485))

(assert (=> b!1435007 m!1324445))

(assert (=> b!1435007 m!1324445))

(declare-fun m!1324487 () Bool)

(assert (=> b!1435007 m!1324487))

(declare-fun m!1324489 () Bool)

(assert (=> d!154327 m!1324489))

(assert (=> d!154327 m!1324353))

(assert (=> b!1435006 m!1324485))

(assert (=> b!1434854 d!154327))

(declare-fun d!154329 () Bool)

(declare-fun lt!631705 () (_ BitVec 32))

(assert (=> d!154329 (and (bvsge lt!631705 #b00000000000000000000000000000000) (bvslt lt!631705 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154329 (= lt!631705 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154329 (validMask!0 mask!2608)))

(assert (=> d!154329 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631705)))

(declare-fun bs!41773 () Bool)

(assert (= bs!41773 d!154329))

(declare-fun m!1324491 () Bool)

(assert (=> bs!41773 m!1324491))

(assert (=> bs!41773 m!1324353))

(assert (=> b!1434851 d!154329))

(declare-fun d!154331 () Bool)

(assert (=> d!154331 (= (validKeyInArray!0 (select (arr!47103 a!2831) j!81)) (and (not (= (select (arr!47103 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47103 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434852 d!154331))

(declare-fun b!1435063 () Bool)

(declare-fun e!809933 () SeekEntryResult!11382)

(declare-fun lt!631734 () SeekEntryResult!11382)

(assert (=> b!1435063 (= e!809933 (MissingZero!11382 (index!47922 lt!631734)))))

(declare-fun b!1435064 () Bool)

(declare-fun e!809934 () SeekEntryResult!11382)

(declare-fun e!809932 () SeekEntryResult!11382)

(assert (=> b!1435064 (= e!809934 e!809932)))

(declare-fun lt!631736 () (_ BitVec 64))

(assert (=> b!1435064 (= lt!631736 (select (arr!47103 a!2831) (index!47922 lt!631734)))))

(declare-fun c!132932 () Bool)

(assert (=> b!1435064 (= c!132932 (= lt!631736 (select (arr!47103 a!2831) j!81)))))

(declare-fun b!1435065 () Bool)

(declare-fun c!132933 () Bool)

(assert (=> b!1435065 (= c!132933 (= lt!631736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435065 (= e!809932 e!809933)))

(declare-fun b!1435066 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97601 (_ BitVec 32)) SeekEntryResult!11382)

(assert (=> b!1435066 (= e!809933 (seekKeyOrZeroReturnVacant!0 (x!129579 lt!631734) (index!47922 lt!631734) (index!47922 lt!631734) (select (arr!47103 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1435067 () Bool)

(assert (=> b!1435067 (= e!809932 (Found!11382 (index!47922 lt!631734)))))

(declare-fun b!1435068 () Bool)

(assert (=> b!1435068 (= e!809934 Undefined!11382)))

(declare-fun d!154333 () Bool)

(declare-fun lt!631735 () SeekEntryResult!11382)

(assert (=> d!154333 (and (or ((_ is Undefined!11382) lt!631735) (not ((_ is Found!11382) lt!631735)) (and (bvsge (index!47921 lt!631735) #b00000000000000000000000000000000) (bvslt (index!47921 lt!631735) (size!47653 a!2831)))) (or ((_ is Undefined!11382) lt!631735) ((_ is Found!11382) lt!631735) (not ((_ is MissingZero!11382) lt!631735)) (and (bvsge (index!47920 lt!631735) #b00000000000000000000000000000000) (bvslt (index!47920 lt!631735) (size!47653 a!2831)))) (or ((_ is Undefined!11382) lt!631735) ((_ is Found!11382) lt!631735) ((_ is MissingZero!11382) lt!631735) (not ((_ is MissingVacant!11382) lt!631735)) (and (bvsge (index!47923 lt!631735) #b00000000000000000000000000000000) (bvslt (index!47923 lt!631735) (size!47653 a!2831)))) (or ((_ is Undefined!11382) lt!631735) (ite ((_ is Found!11382) lt!631735) (= (select (arr!47103 a!2831) (index!47921 lt!631735)) (select (arr!47103 a!2831) j!81)) (ite ((_ is MissingZero!11382) lt!631735) (= (select (arr!47103 a!2831) (index!47920 lt!631735)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11382) lt!631735) (= (select (arr!47103 a!2831) (index!47923 lt!631735)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!154333 (= lt!631735 e!809934)))

(declare-fun c!132931 () Bool)

(assert (=> d!154333 (= c!132931 (and ((_ is Intermediate!11382) lt!631734) (undefined!12194 lt!631734)))))

(assert (=> d!154333 (= lt!631734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47103 a!2831) j!81) mask!2608) (select (arr!47103 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154333 (validMask!0 mask!2608)))

(assert (=> d!154333 (= (seekEntryOrOpen!0 (select (arr!47103 a!2831) j!81) a!2831 mask!2608) lt!631735)))

(assert (= (and d!154333 c!132931) b!1435068))

(assert (= (and d!154333 (not c!132931)) b!1435064))

(assert (= (and b!1435064 c!132932) b!1435067))

(assert (= (and b!1435064 (not c!132932)) b!1435065))

(assert (= (and b!1435065 c!132933) b!1435063))

(assert (= (and b!1435065 (not c!132933)) b!1435066))

(declare-fun m!1324509 () Bool)

(assert (=> b!1435064 m!1324509))

(assert (=> b!1435066 m!1324345))

(declare-fun m!1324511 () Bool)

(assert (=> b!1435066 m!1324511))

(assert (=> d!154333 m!1324353))

(declare-fun m!1324513 () Bool)

(assert (=> d!154333 m!1324513))

(assert (=> d!154333 m!1324347))

(assert (=> d!154333 m!1324345))

(assert (=> d!154333 m!1324349))

(declare-fun m!1324515 () Bool)

(assert (=> d!154333 m!1324515))

(declare-fun m!1324517 () Bool)

(assert (=> d!154333 m!1324517))

(assert (=> d!154333 m!1324345))

(assert (=> d!154333 m!1324347))

(assert (=> b!1434850 d!154333))

(declare-fun b!1435073 () Bool)

(declare-fun e!809938 () Bool)

(declare-fun e!809941 () Bool)

(assert (=> b!1435073 (= e!809938 e!809941)))

(declare-fun res!968209 () Bool)

(declare-fun lt!631743 () SeekEntryResult!11382)

(assert (=> b!1435073 (= res!968209 (and ((_ is Intermediate!11382) lt!631743) (not (undefined!12194 lt!631743)) (bvslt (x!129579 lt!631743) #b01111111111111111111111111111110) (bvsge (x!129579 lt!631743) #b00000000000000000000000000000000) (bvsge (x!129579 lt!631743) #b00000000000000000000000000000000)))))

(assert (=> b!1435073 (=> (not res!968209) (not e!809941))))

(declare-fun b!1435074 () Bool)

(declare-fun e!809939 () SeekEntryResult!11382)

(declare-fun e!809942 () SeekEntryResult!11382)

(assert (=> b!1435074 (= e!809939 e!809942)))

(declare-fun lt!631742 () (_ BitVec 64))

(declare-fun c!132937 () Bool)

(assert (=> b!1435074 (= c!132937 (or (= lt!631742 (select (arr!47103 a!2831) j!81)) (= (bvadd lt!631742 lt!631742) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435076 () Bool)

(assert (=> b!1435076 (and (bvsge (index!47922 lt!631743) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631743) (size!47653 a!2831)))))

(declare-fun e!809940 () Bool)

(assert (=> b!1435076 (= e!809940 (= (select (arr!47103 a!2831) (index!47922 lt!631743)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435077 () Bool)

(assert (=> b!1435077 (= e!809942 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47103 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47103 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1435078 () Bool)

(assert (=> b!1435078 (= e!809939 (Intermediate!11382 true (toIndex!0 (select (arr!47103 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435079 () Bool)

(assert (=> b!1435079 (and (bvsge (index!47922 lt!631743) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631743) (size!47653 a!2831)))))

(declare-fun res!968207 () Bool)

(assert (=> b!1435079 (= res!968207 (= (select (arr!47103 a!2831) (index!47922 lt!631743)) (select (arr!47103 a!2831) j!81)))))

(assert (=> b!1435079 (=> res!968207 e!809940)))

(assert (=> b!1435079 (= e!809941 e!809940)))

(declare-fun b!1435080 () Bool)

(assert (=> b!1435080 (and (bvsge (index!47922 lt!631743) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631743) (size!47653 a!2831)))))

(declare-fun res!968208 () Bool)

(assert (=> b!1435080 (= res!968208 (= (select (arr!47103 a!2831) (index!47922 lt!631743)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435080 (=> res!968208 e!809940)))

(declare-fun b!1435081 () Bool)

(assert (=> b!1435081 (= e!809938 (bvsge (x!129579 lt!631743) #b01111111111111111111111111111110))))

(declare-fun d!154343 () Bool)

(assert (=> d!154343 e!809938))

(declare-fun c!132936 () Bool)

(assert (=> d!154343 (= c!132936 (and ((_ is Intermediate!11382) lt!631743) (undefined!12194 lt!631743)))))

(assert (=> d!154343 (= lt!631743 e!809939)))

(declare-fun c!132935 () Bool)

(assert (=> d!154343 (= c!132935 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154343 (= lt!631742 (select (arr!47103 a!2831) (toIndex!0 (select (arr!47103 a!2831) j!81) mask!2608)))))

(assert (=> d!154343 (validMask!0 mask!2608)))

(assert (=> d!154343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47103 a!2831) j!81) mask!2608) (select (arr!47103 a!2831) j!81) a!2831 mask!2608) lt!631743)))

(declare-fun b!1435075 () Bool)

(assert (=> b!1435075 (= e!809942 (Intermediate!11382 false (toIndex!0 (select (arr!47103 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!154343 c!132935) b!1435078))

(assert (= (and d!154343 (not c!132935)) b!1435074))

(assert (= (and b!1435074 c!132937) b!1435075))

(assert (= (and b!1435074 (not c!132937)) b!1435077))

(assert (= (and d!154343 c!132936) b!1435081))

(assert (= (and d!154343 (not c!132936)) b!1435073))

(assert (= (and b!1435073 res!968209) b!1435079))

(assert (= (and b!1435079 (not res!968207)) b!1435080))

(assert (= (and b!1435080 (not res!968208)) b!1435076))

(declare-fun m!1324531 () Bool)

(assert (=> b!1435079 m!1324531))

(assert (=> b!1435080 m!1324531))

(assert (=> b!1435077 m!1324347))

(declare-fun m!1324533 () Bool)

(assert (=> b!1435077 m!1324533))

(assert (=> b!1435077 m!1324533))

(assert (=> b!1435077 m!1324345))

(declare-fun m!1324535 () Bool)

(assert (=> b!1435077 m!1324535))

(assert (=> d!154343 m!1324347))

(declare-fun m!1324537 () Bool)

(assert (=> d!154343 m!1324537))

(assert (=> d!154343 m!1324353))

(assert (=> b!1435076 m!1324531))

(assert (=> b!1434861 d!154343))

(declare-fun d!154347 () Bool)

(declare-fun lt!631762 () (_ BitVec 32))

(declare-fun lt!631761 () (_ BitVec 32))

(assert (=> d!154347 (= lt!631762 (bvmul (bvxor lt!631761 (bvlshr lt!631761 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154347 (= lt!631761 ((_ extract 31 0) (bvand (bvxor (select (arr!47103 a!2831) j!81) (bvlshr (select (arr!47103 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154347 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968210 (let ((h!34944 ((_ extract 31 0) (bvand (bvxor (select (arr!47103 a!2831) j!81) (bvlshr (select (arr!47103 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129585 (bvmul (bvxor h!34944 (bvlshr h!34944 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129585 (bvlshr x!129585 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968210 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968210 #b00000000000000000000000000000000))))))

(assert (=> d!154347 (= (toIndex!0 (select (arr!47103 a!2831) j!81) mask!2608) (bvand (bvxor lt!631762 (bvlshr lt!631762 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434861 d!154347))

(declare-fun b!1435127 () Bool)

(declare-fun e!809968 () Bool)

(declare-fun call!67554 () Bool)

(assert (=> b!1435127 (= e!809968 call!67554)))

(declare-fun b!1435128 () Bool)

(declare-fun e!809969 () Bool)

(assert (=> b!1435128 (= e!809968 e!809969)))

(declare-fun lt!631763 () (_ BitVec 64))

(assert (=> b!1435128 (= lt!631763 (select (arr!47103 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631765 () Unit!48510)

(assert (=> b!1435128 (= lt!631765 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631763 #b00000000000000000000000000000000))))

(assert (=> b!1435128 (arrayContainsKey!0 a!2831 lt!631763 #b00000000000000000000000000000000)))

(declare-fun lt!631764 () Unit!48510)

(assert (=> b!1435128 (= lt!631764 lt!631765)))

(declare-fun res!968227 () Bool)

(assert (=> b!1435128 (= res!968227 (= (seekEntryOrOpen!0 (select (arr!47103 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11382 #b00000000000000000000000000000000)))))

(assert (=> b!1435128 (=> (not res!968227) (not e!809969))))

(declare-fun b!1435129 () Bool)

(assert (=> b!1435129 (= e!809969 call!67554)))

(declare-fun d!154355 () Bool)

(declare-fun res!968226 () Bool)

(declare-fun e!809970 () Bool)

(assert (=> d!154355 (=> res!968226 e!809970)))

(assert (=> d!154355 (= res!968226 (bvsge #b00000000000000000000000000000000 (size!47653 a!2831)))))

(assert (=> d!154355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809970)))

(declare-fun bm!67551 () Bool)

(assert (=> bm!67551 (= call!67554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1435130 () Bool)

(assert (=> b!1435130 (= e!809970 e!809968)))

(declare-fun c!132953 () Bool)

(assert (=> b!1435130 (= c!132953 (validKeyInArray!0 (select (arr!47103 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!154355 (not res!968226)) b!1435130))

(assert (= (and b!1435130 c!132953) b!1435128))

(assert (= (and b!1435130 (not c!132953)) b!1435127))

(assert (= (and b!1435128 res!968227) b!1435129))

(assert (= (or b!1435129 b!1435127) bm!67551))

(assert (=> b!1435128 m!1324451))

(declare-fun m!1324561 () Bool)

(assert (=> b!1435128 m!1324561))

(declare-fun m!1324563 () Bool)

(assert (=> b!1435128 m!1324563))

(assert (=> b!1435128 m!1324451))

(declare-fun m!1324565 () Bool)

(assert (=> b!1435128 m!1324565))

(declare-fun m!1324567 () Bool)

(assert (=> bm!67551 m!1324567))

(assert (=> b!1435130 m!1324451))

(assert (=> b!1435130 m!1324451))

(assert (=> b!1435130 m!1324453))

(assert (=> b!1434859 d!154355))

(declare-fun b!1435140 () Bool)

(declare-fun e!809976 () Bool)

(declare-fun e!809979 () Bool)

(assert (=> b!1435140 (= e!809976 e!809979)))

(declare-fun res!968233 () Bool)

(declare-fun lt!631769 () SeekEntryResult!11382)

(assert (=> b!1435140 (= res!968233 (and ((_ is Intermediate!11382) lt!631769) (not (undefined!12194 lt!631769)) (bvslt (x!129579 lt!631769) #b01111111111111111111111111111110) (bvsge (x!129579 lt!631769) #b00000000000000000000000000000000) (bvsge (x!129579 lt!631769) x!605)))))

(assert (=> b!1435140 (=> (not res!968233) (not e!809979))))

(declare-fun b!1435141 () Bool)

(declare-fun e!809977 () SeekEntryResult!11382)

(declare-fun e!809980 () SeekEntryResult!11382)

(assert (=> b!1435141 (= e!809977 e!809980)))

(declare-fun c!132959 () Bool)

(declare-fun lt!631768 () (_ BitVec 64))

(assert (=> b!1435141 (= c!132959 (or (= lt!631768 (select (arr!47103 a!2831) j!81)) (= (bvadd lt!631768 lt!631768) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435143 () Bool)

(assert (=> b!1435143 (and (bvsge (index!47922 lt!631769) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631769) (size!47653 a!2831)))))

(declare-fun e!809978 () Bool)

(assert (=> b!1435143 (= e!809978 (= (select (arr!47103 a!2831) (index!47922 lt!631769)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435144 () Bool)

(assert (=> b!1435144 (= e!809980 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47103 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1435145 () Bool)

(assert (=> b!1435145 (= e!809977 (Intermediate!11382 true index!585 x!605))))

(declare-fun b!1435146 () Bool)

(assert (=> b!1435146 (and (bvsge (index!47922 lt!631769) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631769) (size!47653 a!2831)))))

(declare-fun res!968231 () Bool)

(assert (=> b!1435146 (= res!968231 (= (select (arr!47103 a!2831) (index!47922 lt!631769)) (select (arr!47103 a!2831) j!81)))))

(assert (=> b!1435146 (=> res!968231 e!809978)))

(assert (=> b!1435146 (= e!809979 e!809978)))

(declare-fun b!1435147 () Bool)

(assert (=> b!1435147 (and (bvsge (index!47922 lt!631769) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631769) (size!47653 a!2831)))))

(declare-fun res!968232 () Bool)

(assert (=> b!1435147 (= res!968232 (= (select (arr!47103 a!2831) (index!47922 lt!631769)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435147 (=> res!968232 e!809978)))

(declare-fun b!1435148 () Bool)

(assert (=> b!1435148 (= e!809976 (bvsge (x!129579 lt!631769) #b01111111111111111111111111111110))))

(declare-fun d!154359 () Bool)

(assert (=> d!154359 e!809976))

(declare-fun c!132958 () Bool)

(assert (=> d!154359 (= c!132958 (and ((_ is Intermediate!11382) lt!631769) (undefined!12194 lt!631769)))))

(assert (=> d!154359 (= lt!631769 e!809977)))

(declare-fun c!132957 () Bool)

(assert (=> d!154359 (= c!132957 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154359 (= lt!631768 (select (arr!47103 a!2831) index!585))))

(assert (=> d!154359 (validMask!0 mask!2608)))

(assert (=> d!154359 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47103 a!2831) j!81) a!2831 mask!2608) lt!631769)))

(declare-fun b!1435142 () Bool)

(assert (=> b!1435142 (= e!809980 (Intermediate!11382 false index!585 x!605))))

(assert (= (and d!154359 c!132957) b!1435145))

(assert (= (and d!154359 (not c!132957)) b!1435141))

(assert (= (and b!1435141 c!132959) b!1435142))

(assert (= (and b!1435141 (not c!132959)) b!1435144))

(assert (= (and d!154359 c!132958) b!1435148))

(assert (= (and d!154359 (not c!132958)) b!1435140))

(assert (= (and b!1435140 res!968233) b!1435146))

(assert (= (and b!1435146 (not res!968231)) b!1435147))

(assert (= (and b!1435147 (not res!968232)) b!1435143))

(declare-fun m!1324577 () Bool)

(assert (=> b!1435146 m!1324577))

(assert (=> b!1435147 m!1324577))

(assert (=> b!1435144 m!1324357))

(assert (=> b!1435144 m!1324357))

(assert (=> b!1435144 m!1324345))

(declare-fun m!1324579 () Bool)

(assert (=> b!1435144 m!1324579))

(assert (=> d!154359 m!1324381))

(assert (=> d!154359 m!1324353))

(assert (=> b!1435143 m!1324577))

(assert (=> b!1434860 d!154359))

(declare-fun b!1435149 () Bool)

(declare-fun e!809981 () Bool)

(declare-fun e!809984 () Bool)

(assert (=> b!1435149 (= e!809981 e!809984)))

(declare-fun res!968236 () Bool)

(declare-fun lt!631773 () SeekEntryResult!11382)

(assert (=> b!1435149 (= res!968236 (and ((_ is Intermediate!11382) lt!631773) (not (undefined!12194 lt!631773)) (bvslt (x!129579 lt!631773) #b01111111111111111111111111111110) (bvsge (x!129579 lt!631773) #b00000000000000000000000000000000) (bvsge (x!129579 lt!631773) #b00000000000000000000000000000000)))))

(assert (=> b!1435149 (=> (not res!968236) (not e!809984))))

(declare-fun b!1435150 () Bool)

(declare-fun e!809982 () SeekEntryResult!11382)

(declare-fun e!809985 () SeekEntryResult!11382)

(assert (=> b!1435150 (= e!809982 e!809985)))

(declare-fun c!132962 () Bool)

(declare-fun lt!631772 () (_ BitVec 64))

(assert (=> b!1435150 (= c!132962 (or (= lt!631772 lt!631641) (= (bvadd lt!631772 lt!631772) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435152 () Bool)

(assert (=> b!1435152 (and (bvsge (index!47922 lt!631773) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631773) (size!47653 lt!631636)))))

(declare-fun e!809983 () Bool)

(assert (=> b!1435152 (= e!809983 (= (select (arr!47103 lt!631636) (index!47922 lt!631773)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435153 () Bool)

(assert (=> b!1435153 (= e!809985 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631641 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631641 lt!631636 mask!2608))))

(declare-fun b!1435154 () Bool)

(assert (=> b!1435154 (= e!809982 (Intermediate!11382 true (toIndex!0 lt!631641 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435155 () Bool)

(assert (=> b!1435155 (and (bvsge (index!47922 lt!631773) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631773) (size!47653 lt!631636)))))

(declare-fun res!968234 () Bool)

(assert (=> b!1435155 (= res!968234 (= (select (arr!47103 lt!631636) (index!47922 lt!631773)) lt!631641))))

(assert (=> b!1435155 (=> res!968234 e!809983)))

(assert (=> b!1435155 (= e!809984 e!809983)))

(declare-fun b!1435156 () Bool)

(assert (=> b!1435156 (and (bvsge (index!47922 lt!631773) #b00000000000000000000000000000000) (bvslt (index!47922 lt!631773) (size!47653 lt!631636)))))

(declare-fun res!968235 () Bool)

(assert (=> b!1435156 (= res!968235 (= (select (arr!47103 lt!631636) (index!47922 lt!631773)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1435156 (=> res!968235 e!809983)))

(declare-fun b!1435157 () Bool)

(assert (=> b!1435157 (= e!809981 (bvsge (x!129579 lt!631773) #b01111111111111111111111111111110))))

(declare-fun d!154365 () Bool)

(assert (=> d!154365 e!809981))

(declare-fun c!132961 () Bool)

(assert (=> d!154365 (= c!132961 (and ((_ is Intermediate!11382) lt!631773) (undefined!12194 lt!631773)))))

(assert (=> d!154365 (= lt!631773 e!809982)))

(declare-fun c!132960 () Bool)

(assert (=> d!154365 (= c!132960 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154365 (= lt!631772 (select (arr!47103 lt!631636) (toIndex!0 lt!631641 mask!2608)))))

(assert (=> d!154365 (validMask!0 mask!2608)))

(assert (=> d!154365 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631641 mask!2608) lt!631641 lt!631636 mask!2608) lt!631773)))

(declare-fun b!1435151 () Bool)

(assert (=> b!1435151 (= e!809985 (Intermediate!11382 false (toIndex!0 lt!631641 mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!154365 c!132960) b!1435154))

(assert (= (and d!154365 (not c!132960)) b!1435150))

(assert (= (and b!1435150 c!132962) b!1435151))

(assert (= (and b!1435150 (not c!132962)) b!1435153))

(assert (= (and d!154365 c!132961) b!1435157))

(assert (= (and d!154365 (not c!132961)) b!1435149))

(assert (= (and b!1435149 res!968236) b!1435155))

(assert (= (and b!1435155 (not res!968234)) b!1435156))

(assert (= (and b!1435156 (not res!968235)) b!1435152))

(declare-fun m!1324581 () Bool)

(assert (=> b!1435155 m!1324581))

(assert (=> b!1435156 m!1324581))

(assert (=> b!1435153 m!1324369))

(declare-fun m!1324583 () Bool)

(assert (=> b!1435153 m!1324583))

(assert (=> b!1435153 m!1324583))

(declare-fun m!1324585 () Bool)

(assert (=> b!1435153 m!1324585))

(assert (=> d!154365 m!1324369))

(declare-fun m!1324587 () Bool)

(assert (=> d!154365 m!1324587))

(assert (=> d!154365 m!1324353))

(assert (=> b!1435152 m!1324581))

(assert (=> b!1434849 d!154365))

(declare-fun d!154367 () Bool)

(declare-fun lt!631777 () (_ BitVec 32))

(declare-fun lt!631776 () (_ BitVec 32))

(assert (=> d!154367 (= lt!631777 (bvmul (bvxor lt!631776 (bvlshr lt!631776 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154367 (= lt!631776 ((_ extract 31 0) (bvand (bvxor lt!631641 (bvlshr lt!631641 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154367 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968210 (let ((h!34944 ((_ extract 31 0) (bvand (bvxor lt!631641 (bvlshr lt!631641 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129585 (bvmul (bvxor h!34944 (bvlshr h!34944 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129585 (bvlshr x!129585 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968210 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968210 #b00000000000000000000000000000000))))))

(assert (=> d!154367 (= (toIndex!0 lt!631641 mask!2608) (bvand (bvxor lt!631777 (bvlshr lt!631777 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434849 d!154367))

(check-sat (not bm!67551) (not b!1434990) (not b!1434959) (not b!1435153) (not b!1435128) (not b!1435007) (not d!154299) (not b!1434932) (not d!154295) (not b!1434941) (not b!1434958) (not d!154329) (not bm!67540) (not b!1435144) (not b!1434956) (not d!154343) (not b!1434988) (not d!154327) (not b!1435077) (not d!154307) (not d!154333) (not bm!67543) (not d!154359) (not d!154365) (not b!1435130) (not b!1435066))
(check-sat)
