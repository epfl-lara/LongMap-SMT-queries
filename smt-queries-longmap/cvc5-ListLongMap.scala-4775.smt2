; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65710 () Bool)

(assert start!65710)

(declare-fun b!753908 () Bool)

(declare-fun e!420477 () Bool)

(declare-fun e!420481 () Bool)

(assert (=> b!753908 (= e!420477 e!420481)))

(declare-fun res!509356 () Bool)

(assert (=> b!753908 (=> (not res!509356) (not e!420481))))

(declare-datatypes ((array!41883 0))(
  ( (array!41884 (arr!20055 (Array (_ BitVec 32) (_ BitVec 64))) (size!20476 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41883)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7655 0))(
  ( (MissingZero!7655 (index!32988 (_ BitVec 32))) (Found!7655 (index!32989 (_ BitVec 32))) (Intermediate!7655 (undefined!8467 Bool) (index!32990 (_ BitVec 32)) (x!63901 (_ BitVec 32))) (Undefined!7655) (MissingVacant!7655 (index!32991 (_ BitVec 32))) )
))
(declare-fun lt!335467 () SeekEntryResult!7655)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41883 (_ BitVec 32)) SeekEntryResult!7655)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753908 (= res!509356 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20055 a!3186) j!159) mask!3328) (select (arr!20055 a!3186) j!159) a!3186 mask!3328) lt!335467))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753908 (= lt!335467 (Intermediate!7655 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753909 () Bool)

(declare-datatypes ((Unit!26000 0))(
  ( (Unit!26001) )
))
(declare-fun e!420485 () Unit!26000)

(declare-fun Unit!26002 () Unit!26000)

(assert (=> b!753909 (= e!420485 Unit!26002)))

(declare-fun res!509360 () Bool)

(declare-fun e!420476 () Bool)

(assert (=> start!65710 (=> (not res!509360) (not e!420476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65710 (= res!509360 (validMask!0 mask!3328))))

(assert (=> start!65710 e!420476))

(assert (=> start!65710 true))

(declare-fun array_inv!15851 (array!41883) Bool)

(assert (=> start!65710 (array_inv!15851 a!3186)))

(declare-fun b!753910 () Bool)

(declare-fun res!509367 () Bool)

(assert (=> b!753910 (=> (not res!509367) (not e!420477))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!753910 (= res!509367 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20476 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20476 a!3186))))))

(declare-fun b!753911 () Bool)

(declare-fun res!509364 () Bool)

(assert (=> b!753911 (=> (not res!509364) (not e!420476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753911 (= res!509364 (validKeyInArray!0 (select (arr!20055 a!3186) j!159)))))

(declare-fun b!753912 () Bool)

(declare-fun Unit!26003 () Unit!26000)

(assert (=> b!753912 (= e!420485 Unit!26003)))

(assert (=> b!753912 false))

(declare-fun b!753913 () Bool)

(declare-fun e!420474 () Bool)

(assert (=> b!753913 (= e!420474 true)))

(declare-fun e!420475 () Bool)

(assert (=> b!753913 e!420475))

(declare-fun res!509352 () Bool)

(assert (=> b!753913 (=> (not res!509352) (not e!420475))))

(declare-fun lt!335475 () (_ BitVec 64))

(assert (=> b!753913 (= res!509352 (= lt!335475 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335471 () Unit!26000)

(assert (=> b!753913 (= lt!335471 e!420485)))

(declare-fun c!82659 () Bool)

(assert (=> b!753913 (= c!82659 (= lt!335475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753914 () Bool)

(declare-fun e!420480 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41883 (_ BitVec 32)) SeekEntryResult!7655)

(assert (=> b!753914 (= e!420480 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20055 a!3186) j!159) a!3186 mask!3328) (Found!7655 j!159)))))

(declare-fun b!753915 () Bool)

(declare-fun e!420484 () Bool)

(assert (=> b!753915 (= e!420484 e!420474)))

(declare-fun res!509353 () Bool)

(assert (=> b!753915 (=> res!509353 e!420474)))

(declare-fun lt!335473 () (_ BitVec 64))

(assert (=> b!753915 (= res!509353 (= lt!335475 lt!335473))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!753915 (= lt!335475 (select (store (arr!20055 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!753916 () Bool)

(declare-fun res!509359 () Bool)

(assert (=> b!753916 (=> (not res!509359) (not e!420476))))

(assert (=> b!753916 (= res!509359 (validKeyInArray!0 k!2102))))

(declare-fun b!753917 () Bool)

(declare-fun lt!335468 () SeekEntryResult!7655)

(declare-fun lt!335472 () SeekEntryResult!7655)

(assert (=> b!753917 (= e!420475 (= lt!335468 lt!335472))))

(declare-fun b!753918 () Bool)

(assert (=> b!753918 (= e!420480 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20055 a!3186) j!159) a!3186 mask!3328) lt!335467))))

(declare-fun b!753919 () Bool)

(assert (=> b!753919 (= e!420476 e!420477)))

(declare-fun res!509363 () Bool)

(assert (=> b!753919 (=> (not res!509363) (not e!420477))))

(declare-fun lt!335477 () SeekEntryResult!7655)

(assert (=> b!753919 (= res!509363 (or (= lt!335477 (MissingZero!7655 i!1173)) (= lt!335477 (MissingVacant!7655 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41883 (_ BitVec 32)) SeekEntryResult!7655)

(assert (=> b!753919 (= lt!335477 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!753920 () Bool)

(declare-fun res!509362 () Bool)

(assert (=> b!753920 (=> (not res!509362) (not e!420475))))

(declare-fun lt!335469 () array!41883)

(assert (=> b!753920 (= res!509362 (= (seekEntryOrOpen!0 lt!335473 lt!335469 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335473 lt!335469 mask!3328)))))

(declare-fun b!753921 () Bool)

(declare-fun res!509351 () Bool)

(assert (=> b!753921 (=> (not res!509351) (not e!420476))))

(assert (=> b!753921 (= res!509351 (and (= (size!20476 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20476 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20476 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753922 () Bool)

(declare-fun e!420478 () Bool)

(declare-fun e!420482 () Bool)

(assert (=> b!753922 (= e!420478 (not e!420482))))

(declare-fun res!509354 () Bool)

(assert (=> b!753922 (=> res!509354 e!420482)))

(declare-fun lt!335470 () SeekEntryResult!7655)

(assert (=> b!753922 (= res!509354 (or (not (is-Intermediate!7655 lt!335470)) (bvslt x!1131 (x!63901 lt!335470)) (not (= x!1131 (x!63901 lt!335470))) (not (= index!1321 (index!32990 lt!335470)))))))

(declare-fun e!420479 () Bool)

(assert (=> b!753922 e!420479))

(declare-fun res!509355 () Bool)

(assert (=> b!753922 (=> (not res!509355) (not e!420479))))

(declare-fun lt!335466 () SeekEntryResult!7655)

(assert (=> b!753922 (= res!509355 (= lt!335468 lt!335466))))

(assert (=> b!753922 (= lt!335466 (Found!7655 j!159))))

(assert (=> b!753922 (= lt!335468 (seekEntryOrOpen!0 (select (arr!20055 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41883 (_ BitVec 32)) Bool)

(assert (=> b!753922 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335474 () Unit!26000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26000)

(assert (=> b!753922 (= lt!335474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753923 () Bool)

(assert (=> b!753923 (= e!420481 e!420478)))

(declare-fun res!509369 () Bool)

(assert (=> b!753923 (=> (not res!509369) (not e!420478))))

(declare-fun lt!335476 () SeekEntryResult!7655)

(assert (=> b!753923 (= res!509369 (= lt!335476 lt!335470))))

(assert (=> b!753923 (= lt!335470 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335473 lt!335469 mask!3328))))

(assert (=> b!753923 (= lt!335476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335473 mask!3328) lt!335473 lt!335469 mask!3328))))

(assert (=> b!753923 (= lt!335473 (select (store (arr!20055 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753923 (= lt!335469 (array!41884 (store (arr!20055 a!3186) i!1173 k!2102) (size!20476 a!3186)))))

(declare-fun b!753924 () Bool)

(declare-fun res!509361 () Bool)

(assert (=> b!753924 (=> (not res!509361) (not e!420481))))

(assert (=> b!753924 (= res!509361 e!420480)))

(declare-fun c!82660 () Bool)

(assert (=> b!753924 (= c!82660 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753925 () Bool)

(assert (=> b!753925 (= e!420479 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20055 a!3186) j!159) a!3186 mask!3328) lt!335466))))

(declare-fun b!753926 () Bool)

(declare-fun res!509358 () Bool)

(assert (=> b!753926 (=> (not res!509358) (not e!420477))))

(declare-datatypes ((List!14057 0))(
  ( (Nil!14054) (Cons!14053 (h!15125 (_ BitVec 64)) (t!20372 List!14057)) )
))
(declare-fun arrayNoDuplicates!0 (array!41883 (_ BitVec 32) List!14057) Bool)

(assert (=> b!753926 (= res!509358 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14054))))

(declare-fun b!753927 () Bool)

(declare-fun res!509357 () Bool)

(assert (=> b!753927 (=> (not res!509357) (not e!420476))))

(declare-fun arrayContainsKey!0 (array!41883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753927 (= res!509357 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753928 () Bool)

(assert (=> b!753928 (= e!420482 e!420484)))

(declare-fun res!509368 () Bool)

(assert (=> b!753928 (=> res!509368 e!420484)))

(assert (=> b!753928 (= res!509368 (not (= lt!335472 lt!335466)))))

(assert (=> b!753928 (= lt!335472 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20055 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753929 () Bool)

(declare-fun res!509365 () Bool)

(assert (=> b!753929 (=> (not res!509365) (not e!420481))))

(assert (=> b!753929 (= res!509365 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20055 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753930 () Bool)

(declare-fun res!509366 () Bool)

(assert (=> b!753930 (=> (not res!509366) (not e!420477))))

(assert (=> b!753930 (= res!509366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65710 res!509360) b!753921))

(assert (= (and b!753921 res!509351) b!753911))

(assert (= (and b!753911 res!509364) b!753916))

(assert (= (and b!753916 res!509359) b!753927))

(assert (= (and b!753927 res!509357) b!753919))

(assert (= (and b!753919 res!509363) b!753930))

(assert (= (and b!753930 res!509366) b!753926))

(assert (= (and b!753926 res!509358) b!753910))

(assert (= (and b!753910 res!509367) b!753908))

(assert (= (and b!753908 res!509356) b!753929))

(assert (= (and b!753929 res!509365) b!753924))

(assert (= (and b!753924 c!82660) b!753918))

(assert (= (and b!753924 (not c!82660)) b!753914))

(assert (= (and b!753924 res!509361) b!753923))

(assert (= (and b!753923 res!509369) b!753922))

(assert (= (and b!753922 res!509355) b!753925))

(assert (= (and b!753922 (not res!509354)) b!753928))

(assert (= (and b!753928 (not res!509368)) b!753915))

(assert (= (and b!753915 (not res!509353)) b!753913))

(assert (= (and b!753913 c!82659) b!753912))

(assert (= (and b!753913 (not c!82659)) b!753909))

(assert (= (and b!753913 res!509352) b!753920))

(assert (= (and b!753920 res!509362) b!753917))

(declare-fun m!702487 () Bool)

(assert (=> b!753914 m!702487))

(assert (=> b!753914 m!702487))

(declare-fun m!702489 () Bool)

(assert (=> b!753914 m!702489))

(declare-fun m!702491 () Bool)

(assert (=> start!65710 m!702491))

(declare-fun m!702493 () Bool)

(assert (=> start!65710 m!702493))

(declare-fun m!702495 () Bool)

(assert (=> b!753923 m!702495))

(declare-fun m!702497 () Bool)

(assert (=> b!753923 m!702497))

(declare-fun m!702499 () Bool)

(assert (=> b!753923 m!702499))

(declare-fun m!702501 () Bool)

(assert (=> b!753923 m!702501))

(assert (=> b!753923 m!702501))

(declare-fun m!702503 () Bool)

(assert (=> b!753923 m!702503))

(declare-fun m!702505 () Bool)

(assert (=> b!753919 m!702505))

(assert (=> b!753918 m!702487))

(assert (=> b!753918 m!702487))

(declare-fun m!702507 () Bool)

(assert (=> b!753918 m!702507))

(assert (=> b!753915 m!702495))

(declare-fun m!702509 () Bool)

(assert (=> b!753915 m!702509))

(declare-fun m!702511 () Bool)

(assert (=> b!753920 m!702511))

(declare-fun m!702513 () Bool)

(assert (=> b!753920 m!702513))

(assert (=> b!753922 m!702487))

(assert (=> b!753922 m!702487))

(declare-fun m!702515 () Bool)

(assert (=> b!753922 m!702515))

(declare-fun m!702517 () Bool)

(assert (=> b!753922 m!702517))

(declare-fun m!702519 () Bool)

(assert (=> b!753922 m!702519))

(declare-fun m!702521 () Bool)

(assert (=> b!753926 m!702521))

(assert (=> b!753911 m!702487))

(assert (=> b!753911 m!702487))

(declare-fun m!702523 () Bool)

(assert (=> b!753911 m!702523))

(assert (=> b!753908 m!702487))

(assert (=> b!753908 m!702487))

(declare-fun m!702525 () Bool)

(assert (=> b!753908 m!702525))

(assert (=> b!753908 m!702525))

(assert (=> b!753908 m!702487))

(declare-fun m!702527 () Bool)

(assert (=> b!753908 m!702527))

(declare-fun m!702529 () Bool)

(assert (=> b!753916 m!702529))

(assert (=> b!753925 m!702487))

(assert (=> b!753925 m!702487))

(declare-fun m!702531 () Bool)

(assert (=> b!753925 m!702531))

(declare-fun m!702533 () Bool)

(assert (=> b!753927 m!702533))

(declare-fun m!702535 () Bool)

(assert (=> b!753930 m!702535))

(assert (=> b!753928 m!702487))

(assert (=> b!753928 m!702487))

(assert (=> b!753928 m!702489))

(declare-fun m!702537 () Bool)

(assert (=> b!753929 m!702537))

(push 1)

