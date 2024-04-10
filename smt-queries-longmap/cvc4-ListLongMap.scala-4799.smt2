; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65858 () Bool)

(assert start!65858)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42031 0))(
  ( (array!42032 (arr!20129 (Array (_ BitVec 32) (_ BitVec 64))) (size!20550 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42031)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!423151 () Bool)

(declare-fun b!758987 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7729 0))(
  ( (MissingZero!7729 (index!33284 (_ BitVec 32))) (Found!7729 (index!33285 (_ BitVec 32))) (Intermediate!7729 (undefined!8541 Bool) (index!33286 (_ BitVec 32)) (x!64167 (_ BitVec 32))) (Undefined!7729) (MissingVacant!7729 (index!33287 (_ BitVec 32))) )
))
(declare-fun lt!338246 () SeekEntryResult!7729)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42031 (_ BitVec 32)) SeekEntryResult!7729)

(assert (=> b!758987 (= e!423151 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20129 a!3186) j!159) a!3186 mask!3328) lt!338246))))

(declare-fun b!758988 () Bool)

(declare-fun e!423158 () Bool)

(declare-fun lt!338249 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758988 (= e!423158 (validKeyInArray!0 lt!338249))))

(declare-fun b!758989 () Bool)

(declare-fun res!513546 () Bool)

(declare-fun e!423157 () Bool)

(assert (=> b!758989 (=> (not res!513546) (not e!423157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42031 (_ BitVec 32)) Bool)

(assert (=> b!758989 (= res!513546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758990 () Bool)

(declare-fun res!513547 () Bool)

(assert (=> b!758990 (=> (not res!513547) (not e!423157))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!758990 (= res!513547 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20550 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20550 a!3186))))))

(declare-fun b!758991 () Bool)

(declare-fun e!423156 () Bool)

(assert (=> b!758991 (= e!423156 e!423158)))

(declare-fun res!513556 () Bool)

(assert (=> b!758991 (=> res!513556 e!423158)))

(assert (=> b!758991 (= res!513556 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!338235 () SeekEntryResult!7729)

(declare-fun lt!338238 () SeekEntryResult!7729)

(assert (=> b!758991 (= lt!338235 lt!338238)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-datatypes ((Unit!26296 0))(
  ( (Unit!26297) )
))
(declare-fun lt!338237 () Unit!26296)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42031 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26296)

(assert (=> b!758991 (= lt!338237 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758992 () Bool)

(declare-fun res!513557 () Bool)

(assert (=> b!758992 (=> (not res!513557) (not e!423157))))

(declare-datatypes ((List!14131 0))(
  ( (Nil!14128) (Cons!14127 (h!15199 (_ BitVec 64)) (t!20446 List!14131)) )
))
(declare-fun arrayNoDuplicates!0 (array!42031 (_ BitVec 32) List!14131) Bool)

(assert (=> b!758992 (= res!513557 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14128))))

(declare-fun b!758993 () Bool)

(declare-fun res!513550 () Bool)

(declare-fun e!423147 () Bool)

(assert (=> b!758993 (=> (not res!513550) (not e!423147))))

(declare-fun e!423146 () Bool)

(assert (=> b!758993 (= res!513550 e!423146)))

(declare-fun c!83103 () Bool)

(assert (=> b!758993 (= c!83103 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758994 () Bool)

(declare-fun e!423148 () Unit!26296)

(declare-fun Unit!26298 () Unit!26296)

(assert (=> b!758994 (= e!423148 Unit!26298)))

(declare-fun b!758995 () Bool)

(declare-fun res!513544 () Bool)

(assert (=> b!758995 (=> (not res!513544) (not e!423147))))

(assert (=> b!758995 (= res!513544 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20129 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758996 () Bool)

(declare-fun res!513553 () Bool)

(declare-fun e!423155 () Bool)

(assert (=> b!758996 (=> (not res!513553) (not e!423155))))

(declare-fun arrayContainsKey!0 (array!42031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758996 (= res!513553 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758997 () Bool)

(declare-fun res!513551 () Bool)

(assert (=> b!758997 (=> (not res!513551) (not e!423155))))

(assert (=> b!758997 (= res!513551 (and (= (size!20550 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20550 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20550 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758998 () Bool)

(declare-fun res!513548 () Bool)

(assert (=> b!758998 (=> (not res!513548) (not e!423155))))

(assert (=> b!758998 (= res!513548 (validKeyInArray!0 k!2102))))

(declare-fun b!758999 () Bool)

(declare-fun res!513559 () Bool)

(assert (=> b!758999 (=> (not res!513559) (not e!423155))))

(assert (=> b!758999 (= res!513559 (validKeyInArray!0 (select (arr!20129 a!3186) j!159)))))

(declare-fun b!759000 () Bool)

(declare-fun e!423154 () Bool)

(declare-fun e!423150 () Bool)

(assert (=> b!759000 (= e!423154 (not e!423150))))

(declare-fun res!513552 () Bool)

(assert (=> b!759000 (=> res!513552 e!423150)))

(declare-fun lt!338248 () SeekEntryResult!7729)

(assert (=> b!759000 (= res!513552 (or (not (is-Intermediate!7729 lt!338248)) (bvslt x!1131 (x!64167 lt!338248)) (not (= x!1131 (x!64167 lt!338248))) (not (= index!1321 (index!33286 lt!338248)))))))

(assert (=> b!759000 e!423151))

(declare-fun res!513549 () Bool)

(assert (=> b!759000 (=> (not res!513549) (not e!423151))))

(declare-fun lt!338239 () SeekEntryResult!7729)

(assert (=> b!759000 (= res!513549 (= lt!338239 lt!338246))))

(assert (=> b!759000 (= lt!338246 (Found!7729 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42031 (_ BitVec 32)) SeekEntryResult!7729)

(assert (=> b!759000 (= lt!338239 (seekEntryOrOpen!0 (select (arr!20129 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!759000 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338243 () Unit!26296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26296)

(assert (=> b!759000 (= lt!338243 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759001 () Bool)

(declare-fun e!423153 () Bool)

(assert (=> b!759001 (= e!423153 e!423156)))

(declare-fun res!513560 () Bool)

(assert (=> b!759001 (=> res!513560 e!423156)))

(assert (=> b!759001 (= res!513560 (or (not (= (select (arr!20129 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!338244 () SeekEntryResult!7729)

(assert (=> b!759001 (and (= lt!338244 lt!338235) (= lt!338239 lt!338238))))

(declare-fun lt!338245 () array!42031)

(assert (=> b!759001 (= lt!338235 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338249 lt!338245 mask!3328))))

(assert (=> b!759001 (= lt!338244 (seekEntryOrOpen!0 lt!338249 lt!338245 mask!3328))))

(declare-fun lt!338240 () (_ BitVec 64))

(assert (=> b!759001 (= lt!338240 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338236 () Unit!26296)

(assert (=> b!759001 (= lt!338236 e!423148)))

(declare-fun c!83104 () Bool)

(assert (=> b!759001 (= c!83104 (= lt!338240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!759002 () Bool)

(declare-fun Unit!26299 () Unit!26296)

(assert (=> b!759002 (= e!423148 Unit!26299)))

(assert (=> b!759002 false))

(declare-fun b!759003 () Bool)

(assert (=> b!759003 (= e!423155 e!423157)))

(declare-fun res!513542 () Bool)

(assert (=> b!759003 (=> (not res!513542) (not e!423157))))

(declare-fun lt!338247 () SeekEntryResult!7729)

(assert (=> b!759003 (= res!513542 (or (= lt!338247 (MissingZero!7729 i!1173)) (= lt!338247 (MissingVacant!7729 i!1173))))))

(assert (=> b!759003 (= lt!338247 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!759004 () Bool)

(assert (=> b!759004 (= e!423146 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20129 a!3186) j!159) a!3186 mask!3328) (Found!7729 j!159)))))

(declare-fun b!759005 () Bool)

(assert (=> b!759005 (= e!423147 e!423154)))

(declare-fun res!513554 () Bool)

(assert (=> b!759005 (=> (not res!513554) (not e!423154))))

(declare-fun lt!338242 () SeekEntryResult!7729)

(assert (=> b!759005 (= res!513554 (= lt!338242 lt!338248))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42031 (_ BitVec 32)) SeekEntryResult!7729)

(assert (=> b!759005 (= lt!338248 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338249 lt!338245 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759005 (= lt!338242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338249 mask!3328) lt!338249 lt!338245 mask!3328))))

(assert (=> b!759005 (= lt!338249 (select (store (arr!20129 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759005 (= lt!338245 (array!42032 (store (arr!20129 a!3186) i!1173 k!2102) (size!20550 a!3186)))))

(declare-fun res!513558 () Bool)

(assert (=> start!65858 (=> (not res!513558) (not e!423155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65858 (= res!513558 (validMask!0 mask!3328))))

(assert (=> start!65858 e!423155))

(assert (=> start!65858 true))

(declare-fun array_inv!15925 (array!42031) Bool)

(assert (=> start!65858 (array_inv!15925 a!3186)))

(declare-fun lt!338241 () SeekEntryResult!7729)

(declare-fun b!759006 () Bool)

(assert (=> b!759006 (= e!423146 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20129 a!3186) j!159) a!3186 mask!3328) lt!338241))))

(declare-fun b!759007 () Bool)

(declare-fun e!423149 () Bool)

(assert (=> b!759007 (= e!423149 e!423153)))

(declare-fun res!513545 () Bool)

(assert (=> b!759007 (=> res!513545 e!423153)))

(assert (=> b!759007 (= res!513545 (= lt!338240 lt!338249))))

(assert (=> b!759007 (= lt!338240 (select (store (arr!20129 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!759008 () Bool)

(assert (=> b!759008 (= e!423157 e!423147)))

(declare-fun res!513555 () Bool)

(assert (=> b!759008 (=> (not res!513555) (not e!423147))))

(assert (=> b!759008 (= res!513555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20129 a!3186) j!159) mask!3328) (select (arr!20129 a!3186) j!159) a!3186 mask!3328) lt!338241))))

(assert (=> b!759008 (= lt!338241 (Intermediate!7729 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759009 () Bool)

(assert (=> b!759009 (= e!423150 e!423149)))

(declare-fun res!513543 () Bool)

(assert (=> b!759009 (=> res!513543 e!423149)))

(assert (=> b!759009 (= res!513543 (not (= lt!338238 lt!338246)))))

(assert (=> b!759009 (= lt!338238 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20129 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!65858 res!513558) b!758997))

(assert (= (and b!758997 res!513551) b!758999))

(assert (= (and b!758999 res!513559) b!758998))

(assert (= (and b!758998 res!513548) b!758996))

(assert (= (and b!758996 res!513553) b!759003))

(assert (= (and b!759003 res!513542) b!758989))

(assert (= (and b!758989 res!513546) b!758992))

(assert (= (and b!758992 res!513557) b!758990))

(assert (= (and b!758990 res!513547) b!759008))

(assert (= (and b!759008 res!513555) b!758995))

(assert (= (and b!758995 res!513544) b!758993))

(assert (= (and b!758993 c!83103) b!759006))

(assert (= (and b!758993 (not c!83103)) b!759004))

(assert (= (and b!758993 res!513550) b!759005))

(assert (= (and b!759005 res!513554) b!759000))

(assert (= (and b!759000 res!513549) b!758987))

(assert (= (and b!759000 (not res!513552)) b!759009))

(assert (= (and b!759009 (not res!513543)) b!759007))

(assert (= (and b!759007 (not res!513545)) b!759001))

(assert (= (and b!759001 c!83104) b!759002))

(assert (= (and b!759001 (not c!83104)) b!758994))

(assert (= (and b!759001 (not res!513560)) b!758991))

(assert (= (and b!758991 (not res!513556)) b!758988))

(declare-fun m!706383 () Bool)

(assert (=> b!758995 m!706383))

(declare-fun m!706385 () Bool)

(assert (=> b!759000 m!706385))

(assert (=> b!759000 m!706385))

(declare-fun m!706387 () Bool)

(assert (=> b!759000 m!706387))

(declare-fun m!706389 () Bool)

(assert (=> b!759000 m!706389))

(declare-fun m!706391 () Bool)

(assert (=> b!759000 m!706391))

(declare-fun m!706393 () Bool)

(assert (=> b!759001 m!706393))

(declare-fun m!706395 () Bool)

(assert (=> b!759001 m!706395))

(declare-fun m!706397 () Bool)

(assert (=> b!759001 m!706397))

(declare-fun m!706399 () Bool)

(assert (=> b!758991 m!706399))

(declare-fun m!706401 () Bool)

(assert (=> b!759007 m!706401))

(declare-fun m!706403 () Bool)

(assert (=> b!759007 m!706403))

(declare-fun m!706405 () Bool)

(assert (=> b!759005 m!706405))

(declare-fun m!706407 () Bool)

(assert (=> b!759005 m!706407))

(assert (=> b!759005 m!706401))

(assert (=> b!759005 m!706407))

(declare-fun m!706409 () Bool)

(assert (=> b!759005 m!706409))

(declare-fun m!706411 () Bool)

(assert (=> b!759005 m!706411))

(assert (=> b!758999 m!706385))

(assert (=> b!758999 m!706385))

(declare-fun m!706413 () Bool)

(assert (=> b!758999 m!706413))

(declare-fun m!706415 () Bool)

(assert (=> start!65858 m!706415))

(declare-fun m!706417 () Bool)

(assert (=> start!65858 m!706417))

(declare-fun m!706419 () Bool)

(assert (=> b!758992 m!706419))

(assert (=> b!759008 m!706385))

(assert (=> b!759008 m!706385))

(declare-fun m!706421 () Bool)

(assert (=> b!759008 m!706421))

(assert (=> b!759008 m!706421))

(assert (=> b!759008 m!706385))

(declare-fun m!706423 () Bool)

(assert (=> b!759008 m!706423))

(assert (=> b!758987 m!706385))

(assert (=> b!758987 m!706385))

(declare-fun m!706425 () Bool)

(assert (=> b!758987 m!706425))

(assert (=> b!759004 m!706385))

(assert (=> b!759004 m!706385))

(declare-fun m!706427 () Bool)

(assert (=> b!759004 m!706427))

(declare-fun m!706429 () Bool)

(assert (=> b!758998 m!706429))

(declare-fun m!706431 () Bool)

(assert (=> b!758989 m!706431))

(declare-fun m!706433 () Bool)

(assert (=> b!758996 m!706433))

(declare-fun m!706435 () Bool)

(assert (=> b!758988 m!706435))

(assert (=> b!759009 m!706385))

(assert (=> b!759009 m!706385))

(assert (=> b!759009 m!706427))

(declare-fun m!706437 () Bool)

(assert (=> b!759003 m!706437))

(assert (=> b!759006 m!706385))

(assert (=> b!759006 m!706385))

(declare-fun m!706439 () Bool)

(assert (=> b!759006 m!706439))

(push 1)

