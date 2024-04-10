; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65388 () Bool)

(assert start!65388)

(declare-fun b!743904 () Bool)

(declare-fun res!500955 () Bool)

(declare-fun e!415593 () Bool)

(assert (=> b!743904 (=> (not res!500955) (not e!415593))))

(declare-datatypes ((array!41561 0))(
  ( (array!41562 (arr!19894 (Array (_ BitVec 32) (_ BitVec 64))) (size!20315 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41561)

(declare-datatypes ((List!13896 0))(
  ( (Nil!13893) (Cons!13892 (h!14964 (_ BitVec 64)) (t!20211 List!13896)) )
))
(declare-fun arrayNoDuplicates!0 (array!41561 (_ BitVec 32) List!13896) Bool)

(assert (=> b!743904 (= res!500955 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13893))))

(declare-fun b!743905 () Bool)

(declare-fun res!500947 () Bool)

(declare-fun e!415595 () Bool)

(assert (=> b!743905 (=> (not res!500947) (not e!415595))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!743905 (= res!500947 (and (= (size!20315 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20315 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20315 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743906 () Bool)

(declare-fun e!415594 () Bool)

(declare-fun e!415597 () Bool)

(assert (=> b!743906 (= e!415594 (not e!415597))))

(declare-fun res!500952 () Bool)

(assert (=> b!743906 (=> res!500952 e!415597)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7494 0))(
  ( (MissingZero!7494 (index!32344 (_ BitVec 32))) (Found!7494 (index!32345 (_ BitVec 32))) (Intermediate!7494 (undefined!8306 Bool) (index!32346 (_ BitVec 32)) (x!63308 (_ BitVec 32))) (Undefined!7494) (MissingVacant!7494 (index!32347 (_ BitVec 32))) )
))
(declare-fun lt!330458 () SeekEntryResult!7494)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!743906 (= res!500952 (or (not ((_ is Intermediate!7494) lt!330458)) (bvslt x!1131 (x!63308 lt!330458)) (not (= x!1131 (x!63308 lt!330458))) (not (= index!1321 (index!32346 lt!330458)))))))

(declare-fun e!415596 () Bool)

(assert (=> b!743906 e!415596))

(declare-fun res!500951 () Bool)

(assert (=> b!743906 (=> (not res!500951) (not e!415596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41561 (_ BitVec 32)) Bool)

(assert (=> b!743906 (= res!500951 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25468 0))(
  ( (Unit!25469) )
))
(declare-fun lt!330452 () Unit!25468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25468)

(assert (=> b!743906 (= lt!330452 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743907 () Bool)

(declare-fun e!415598 () Bool)

(assert (=> b!743907 (= e!415598 e!415594)))

(declare-fun res!500948 () Bool)

(assert (=> b!743907 (=> (not res!500948) (not e!415594))))

(declare-fun lt!330453 () SeekEntryResult!7494)

(assert (=> b!743907 (= res!500948 (= lt!330453 lt!330458))))

(declare-fun lt!330451 () array!41561)

(declare-fun lt!330457 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41561 (_ BitVec 32)) SeekEntryResult!7494)

(assert (=> b!743907 (= lt!330458 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330457 lt!330451 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743907 (= lt!330453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330457 mask!3328) lt!330457 lt!330451 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!743907 (= lt!330457 (select (store (arr!19894 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743907 (= lt!330451 (array!41562 (store (arr!19894 a!3186) i!1173 k0!2102) (size!20315 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!330455 () SeekEntryResult!7494)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!415592 () Bool)

(declare-fun b!743908 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41561 (_ BitVec 32)) SeekEntryResult!7494)

(assert (=> b!743908 (= e!415592 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19894 a!3186) j!159) a!3186 mask!3328) lt!330455))))

(declare-fun res!500962 () Bool)

(assert (=> start!65388 (=> (not res!500962) (not e!415595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65388 (= res!500962 (validMask!0 mask!3328))))

(assert (=> start!65388 e!415595))

(assert (=> start!65388 true))

(declare-fun array_inv!15690 (array!41561) Bool)

(assert (=> start!65388 (array_inv!15690 a!3186)))

(declare-fun b!743909 () Bool)

(declare-fun res!500956 () Bool)

(assert (=> b!743909 (=> (not res!500956) (not e!415598))))

(declare-fun e!415591 () Bool)

(assert (=> b!743909 (= res!500956 e!415591)))

(declare-fun c!81859 () Bool)

(assert (=> b!743909 (= c!81859 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743910 () Bool)

(declare-fun res!500949 () Bool)

(assert (=> b!743910 (=> (not res!500949) (not e!415595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743910 (= res!500949 (validKeyInArray!0 k0!2102))))

(declare-fun b!743911 () Bool)

(declare-fun res!500954 () Bool)

(assert (=> b!743911 (=> res!500954 e!415597)))

(assert (=> b!743911 (= res!500954 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19894 a!3186) j!159) a!3186 mask!3328) (Found!7494 j!159))))))

(declare-fun b!743912 () Bool)

(assert (=> b!743912 (= e!415596 e!415592)))

(declare-fun res!500963 () Bool)

(assert (=> b!743912 (=> (not res!500963) (not e!415592))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41561 (_ BitVec 32)) SeekEntryResult!7494)

(assert (=> b!743912 (= res!500963 (= (seekEntryOrOpen!0 (select (arr!19894 a!3186) j!159) a!3186 mask!3328) lt!330455))))

(assert (=> b!743912 (= lt!330455 (Found!7494 j!159))))

(declare-fun b!743913 () Bool)

(declare-fun res!500960 () Bool)

(assert (=> b!743913 (=> (not res!500960) (not e!415593))))

(assert (=> b!743913 (= res!500960 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20315 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20315 a!3186))))))

(declare-fun b!743914 () Bool)

(declare-fun lt!330456 () SeekEntryResult!7494)

(assert (=> b!743914 (= e!415591 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19894 a!3186) j!159) a!3186 mask!3328) lt!330456))))

(declare-fun b!743915 () Bool)

(assert (=> b!743915 (= e!415591 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19894 a!3186) j!159) a!3186 mask!3328) (Found!7494 j!159)))))

(declare-fun b!743916 () Bool)

(declare-fun res!500957 () Bool)

(assert (=> b!743916 (=> (not res!500957) (not e!415595))))

(declare-fun arrayContainsKey!0 (array!41561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743916 (= res!500957 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743917 () Bool)

(assert (=> b!743917 (= e!415595 e!415593)))

(declare-fun res!500959 () Bool)

(assert (=> b!743917 (=> (not res!500959) (not e!415593))))

(declare-fun lt!330454 () SeekEntryResult!7494)

(assert (=> b!743917 (= res!500959 (or (= lt!330454 (MissingZero!7494 i!1173)) (= lt!330454 (MissingVacant!7494 i!1173))))))

(assert (=> b!743917 (= lt!330454 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743918 () Bool)

(declare-fun res!500953 () Bool)

(assert (=> b!743918 (=> (not res!500953) (not e!415595))))

(assert (=> b!743918 (= res!500953 (validKeyInArray!0 (select (arr!19894 a!3186) j!159)))))

(declare-fun b!743919 () Bool)

(assert (=> b!743919 (= e!415597 (or (= (select (store (arr!19894 a!3186) i!1173 k0!2102) index!1321) lt!330457) (not (= (select (store (arr!19894 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!743920 () Bool)

(declare-fun res!500950 () Bool)

(assert (=> b!743920 (=> (not res!500950) (not e!415598))))

(assert (=> b!743920 (= res!500950 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19894 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743921 () Bool)

(assert (=> b!743921 (= e!415593 e!415598)))

(declare-fun res!500958 () Bool)

(assert (=> b!743921 (=> (not res!500958) (not e!415598))))

(assert (=> b!743921 (= res!500958 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19894 a!3186) j!159) mask!3328) (select (arr!19894 a!3186) j!159) a!3186 mask!3328) lt!330456))))

(assert (=> b!743921 (= lt!330456 (Intermediate!7494 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743922 () Bool)

(declare-fun res!500961 () Bool)

(assert (=> b!743922 (=> (not res!500961) (not e!415593))))

(assert (=> b!743922 (= res!500961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65388 res!500962) b!743905))

(assert (= (and b!743905 res!500947) b!743918))

(assert (= (and b!743918 res!500953) b!743910))

(assert (= (and b!743910 res!500949) b!743916))

(assert (= (and b!743916 res!500957) b!743917))

(assert (= (and b!743917 res!500959) b!743922))

(assert (= (and b!743922 res!500961) b!743904))

(assert (= (and b!743904 res!500955) b!743913))

(assert (= (and b!743913 res!500960) b!743921))

(assert (= (and b!743921 res!500958) b!743920))

(assert (= (and b!743920 res!500950) b!743909))

(assert (= (and b!743909 c!81859) b!743914))

(assert (= (and b!743909 (not c!81859)) b!743915))

(assert (= (and b!743909 res!500956) b!743907))

(assert (= (and b!743907 res!500948) b!743906))

(assert (= (and b!743906 res!500951) b!743912))

(assert (= (and b!743912 res!500963) b!743908))

(assert (= (and b!743906 (not res!500952)) b!743911))

(assert (= (and b!743911 (not res!500954)) b!743919))

(declare-fun m!694513 () Bool)

(assert (=> b!743920 m!694513))

(declare-fun m!694515 () Bool)

(assert (=> b!743916 m!694515))

(declare-fun m!694517 () Bool)

(assert (=> b!743904 m!694517))

(declare-fun m!694519 () Bool)

(assert (=> b!743908 m!694519))

(assert (=> b!743908 m!694519))

(declare-fun m!694521 () Bool)

(assert (=> b!743908 m!694521))

(declare-fun m!694523 () Bool)

(assert (=> b!743906 m!694523))

(declare-fun m!694525 () Bool)

(assert (=> b!743906 m!694525))

(assert (=> b!743914 m!694519))

(assert (=> b!743914 m!694519))

(declare-fun m!694527 () Bool)

(assert (=> b!743914 m!694527))

(assert (=> b!743918 m!694519))

(assert (=> b!743918 m!694519))

(declare-fun m!694529 () Bool)

(assert (=> b!743918 m!694529))

(assert (=> b!743915 m!694519))

(assert (=> b!743915 m!694519))

(declare-fun m!694531 () Bool)

(assert (=> b!743915 m!694531))

(assert (=> b!743911 m!694519))

(assert (=> b!743911 m!694519))

(assert (=> b!743911 m!694531))

(assert (=> b!743921 m!694519))

(assert (=> b!743921 m!694519))

(declare-fun m!694533 () Bool)

(assert (=> b!743921 m!694533))

(assert (=> b!743921 m!694533))

(assert (=> b!743921 m!694519))

(declare-fun m!694535 () Bool)

(assert (=> b!743921 m!694535))

(declare-fun m!694537 () Bool)

(assert (=> b!743910 m!694537))

(declare-fun m!694539 () Bool)

(assert (=> start!65388 m!694539))

(declare-fun m!694541 () Bool)

(assert (=> start!65388 m!694541))

(declare-fun m!694543 () Bool)

(assert (=> b!743922 m!694543))

(declare-fun m!694545 () Bool)

(assert (=> b!743907 m!694545))

(declare-fun m!694547 () Bool)

(assert (=> b!743907 m!694547))

(assert (=> b!743907 m!694545))

(declare-fun m!694549 () Bool)

(assert (=> b!743907 m!694549))

(declare-fun m!694551 () Bool)

(assert (=> b!743907 m!694551))

(declare-fun m!694553 () Bool)

(assert (=> b!743907 m!694553))

(declare-fun m!694555 () Bool)

(assert (=> b!743917 m!694555))

(assert (=> b!743912 m!694519))

(assert (=> b!743912 m!694519))

(declare-fun m!694557 () Bool)

(assert (=> b!743912 m!694557))

(assert (=> b!743919 m!694547))

(declare-fun m!694559 () Bool)

(assert (=> b!743919 m!694559))

(check-sat (not b!743922) (not b!743916) (not b!743917) (not b!743907) (not b!743912) (not b!743918) (not b!743910) (not b!743911) (not start!65388) (not b!743921) (not b!743906) (not b!743914) (not b!743904) (not b!743908) (not b!743915))
(check-sat)
