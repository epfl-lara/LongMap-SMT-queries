; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64672 () Bool)

(assert start!64672)

(declare-fun res!489376 () Bool)

(declare-fun e!407999 () Bool)

(assert (=> start!64672 (=> (not res!489376) (not e!407999))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64672 (= res!489376 (validMask!0 mask!3328))))

(assert (=> start!64672 e!407999))

(assert (=> start!64672 true))

(declare-datatypes ((array!41121 0))(
  ( (array!41122 (arr!19680 (Array (_ BitVec 32) (_ BitVec 64))) (size!20101 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41121)

(declare-fun array_inv!15476 (array!41121) Bool)

(assert (=> start!64672 (array_inv!15476 a!3186)))

(declare-fun b!728902 () Bool)

(declare-fun res!489379 () Bool)

(declare-fun e!407995 () Bool)

(assert (=> b!728902 (=> (not res!489379) (not e!407995))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728902 (= res!489379 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19680 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728903 () Bool)

(declare-fun e!407997 () Bool)

(assert (=> b!728903 (= e!407997 e!407995)))

(declare-fun res!489373 () Bool)

(assert (=> b!728903 (=> (not res!489373) (not e!407995))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7280 0))(
  ( (MissingZero!7280 (index!31488 (_ BitVec 32))) (Found!7280 (index!31489 (_ BitVec 32))) (Intermediate!7280 (undefined!8092 Bool) (index!31490 (_ BitVec 32)) (x!62478 (_ BitVec 32))) (Undefined!7280) (MissingVacant!7280 (index!31491 (_ BitVec 32))) )
))
(declare-fun lt!322895 () SeekEntryResult!7280)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41121 (_ BitVec 32)) SeekEntryResult!7280)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728903 (= res!489373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19680 a!3186) j!159) mask!3328) (select (arr!19680 a!3186) j!159) a!3186 mask!3328) lt!322895))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728903 (= lt!322895 (Intermediate!7280 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!728904 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!408001 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41121 (_ BitVec 32)) SeekEntryResult!7280)

(assert (=> b!728904 (= e!408001 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19680 a!3186) j!159) a!3186 mask!3328) (Found!7280 j!159)))))

(declare-fun b!728905 () Bool)

(declare-fun res!489372 () Bool)

(assert (=> b!728905 (=> (not res!489372) (not e!407999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728905 (= res!489372 (validKeyInArray!0 (select (arr!19680 a!3186) j!159)))))

(declare-fun b!728906 () Bool)

(declare-fun res!489380 () Bool)

(assert (=> b!728906 (=> (not res!489380) (not e!407997))))

(assert (=> b!728906 (= res!489380 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20101 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20101 a!3186))))))

(declare-fun b!728907 () Bool)

(declare-fun res!489369 () Bool)

(assert (=> b!728907 (=> (not res!489369) (not e!407997))))

(declare-datatypes ((List!13682 0))(
  ( (Nil!13679) (Cons!13678 (h!14738 (_ BitVec 64)) (t!19997 List!13682)) )
))
(declare-fun arrayNoDuplicates!0 (array!41121 (_ BitVec 32) List!13682) Bool)

(assert (=> b!728907 (= res!489369 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13679))))

(declare-fun b!728908 () Bool)

(declare-fun res!489375 () Bool)

(assert (=> b!728908 (=> (not res!489375) (not e!407997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41121 (_ BitVec 32)) Bool)

(assert (=> b!728908 (= res!489375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728909 () Bool)

(declare-fun res!489366 () Bool)

(assert (=> b!728909 (=> (not res!489366) (not e!407995))))

(assert (=> b!728909 (= res!489366 e!408001)))

(declare-fun c!80143 () Bool)

(assert (=> b!728909 (= c!80143 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728910 () Bool)

(assert (=> b!728910 (= e!407999 e!407997)))

(declare-fun res!489368 () Bool)

(assert (=> b!728910 (=> (not res!489368) (not e!407997))))

(declare-fun lt!322901 () SeekEntryResult!7280)

(assert (=> b!728910 (= res!489368 (or (= lt!322901 (MissingZero!7280 i!1173)) (= lt!322901 (MissingVacant!7280 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41121 (_ BitVec 32)) SeekEntryResult!7280)

(assert (=> b!728910 (= lt!322901 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728911 () Bool)

(declare-fun e!407994 () Bool)

(declare-fun e!408000 () Bool)

(assert (=> b!728911 (= e!407994 (not e!408000))))

(declare-fun res!489378 () Bool)

(assert (=> b!728911 (=> res!489378 e!408000)))

(declare-fun lt!322896 () SeekEntryResult!7280)

(assert (=> b!728911 (= res!489378 (or (not (is-Intermediate!7280 lt!322896)) (bvsge x!1131 (x!62478 lt!322896))))))

(declare-fun e!408002 () Bool)

(assert (=> b!728911 e!408002))

(declare-fun res!489374 () Bool)

(assert (=> b!728911 (=> (not res!489374) (not e!408002))))

(assert (=> b!728911 (= res!489374 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24878 0))(
  ( (Unit!24879) )
))
(declare-fun lt!322894 () Unit!24878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24878)

(assert (=> b!728911 (= lt!322894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728912 () Bool)

(declare-fun res!489377 () Bool)

(assert (=> b!728912 (=> (not res!489377) (not e!407999))))

(assert (=> b!728912 (= res!489377 (validKeyInArray!0 k!2102))))

(declare-fun b!728913 () Bool)

(declare-fun e!407998 () Bool)

(assert (=> b!728913 (= e!408002 e!407998)))

(declare-fun res!489365 () Bool)

(assert (=> b!728913 (=> (not res!489365) (not e!407998))))

(declare-fun lt!322893 () SeekEntryResult!7280)

(assert (=> b!728913 (= res!489365 (= (seekEntryOrOpen!0 (select (arr!19680 a!3186) j!159) a!3186 mask!3328) lt!322893))))

(assert (=> b!728913 (= lt!322893 (Found!7280 j!159))))

(declare-fun b!728914 () Bool)

(declare-fun res!489371 () Bool)

(assert (=> b!728914 (=> (not res!489371) (not e!407999))))

(assert (=> b!728914 (= res!489371 (and (= (size!20101 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20101 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20101 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728915 () Bool)

(assert (=> b!728915 (= e!407995 e!407994)))

(declare-fun res!489370 () Bool)

(assert (=> b!728915 (=> (not res!489370) (not e!407994))))

(declare-fun lt!322898 () SeekEntryResult!7280)

(assert (=> b!728915 (= res!489370 (= lt!322898 lt!322896))))

(declare-fun lt!322900 () (_ BitVec 64))

(declare-fun lt!322897 () array!41121)

(assert (=> b!728915 (= lt!322896 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322900 lt!322897 mask!3328))))

(assert (=> b!728915 (= lt!322898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322900 mask!3328) lt!322900 lt!322897 mask!3328))))

(assert (=> b!728915 (= lt!322900 (select (store (arr!19680 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728915 (= lt!322897 (array!41122 (store (arr!19680 a!3186) i!1173 k!2102) (size!20101 a!3186)))))

(declare-fun b!728916 () Bool)

(assert (=> b!728916 (= e!407998 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19680 a!3186) j!159) a!3186 mask!3328) lt!322893))))

(declare-fun b!728917 () Bool)

(assert (=> b!728917 (= e!408001 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19680 a!3186) j!159) a!3186 mask!3328) lt!322895))))

(declare-fun b!728918 () Bool)

(declare-fun res!489367 () Bool)

(assert (=> b!728918 (=> (not res!489367) (not e!407999))))

(declare-fun arrayContainsKey!0 (array!41121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728918 (= res!489367 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728919 () Bool)

(assert (=> b!728919 (= e!408000 true)))

(declare-fun lt!322899 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728919 (= lt!322899 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!64672 res!489376) b!728914))

(assert (= (and b!728914 res!489371) b!728905))

(assert (= (and b!728905 res!489372) b!728912))

(assert (= (and b!728912 res!489377) b!728918))

(assert (= (and b!728918 res!489367) b!728910))

(assert (= (and b!728910 res!489368) b!728908))

(assert (= (and b!728908 res!489375) b!728907))

(assert (= (and b!728907 res!489369) b!728906))

(assert (= (and b!728906 res!489380) b!728903))

(assert (= (and b!728903 res!489373) b!728902))

(assert (= (and b!728902 res!489379) b!728909))

(assert (= (and b!728909 c!80143) b!728917))

(assert (= (and b!728909 (not c!80143)) b!728904))

(assert (= (and b!728909 res!489366) b!728915))

(assert (= (and b!728915 res!489370) b!728911))

(assert (= (and b!728911 res!489374) b!728913))

(assert (= (and b!728913 res!489365) b!728916))

(assert (= (and b!728911 (not res!489378)) b!728919))

(declare-fun m!682603 () Bool)

(assert (=> b!728918 m!682603))

(declare-fun m!682605 () Bool)

(assert (=> b!728915 m!682605))

(declare-fun m!682607 () Bool)

(assert (=> b!728915 m!682607))

(declare-fun m!682609 () Bool)

(assert (=> b!728915 m!682609))

(assert (=> b!728915 m!682607))

(declare-fun m!682611 () Bool)

(assert (=> b!728915 m!682611))

(declare-fun m!682613 () Bool)

(assert (=> b!728915 m!682613))

(declare-fun m!682615 () Bool)

(assert (=> b!728908 m!682615))

(declare-fun m!682617 () Bool)

(assert (=> b!728905 m!682617))

(assert (=> b!728905 m!682617))

(declare-fun m!682619 () Bool)

(assert (=> b!728905 m!682619))

(declare-fun m!682621 () Bool)

(assert (=> b!728907 m!682621))

(declare-fun m!682623 () Bool)

(assert (=> b!728910 m!682623))

(assert (=> b!728904 m!682617))

(assert (=> b!728904 m!682617))

(declare-fun m!682625 () Bool)

(assert (=> b!728904 m!682625))

(declare-fun m!682627 () Bool)

(assert (=> b!728919 m!682627))

(assert (=> b!728903 m!682617))

(assert (=> b!728903 m!682617))

(declare-fun m!682629 () Bool)

(assert (=> b!728903 m!682629))

(assert (=> b!728903 m!682629))

(assert (=> b!728903 m!682617))

(declare-fun m!682631 () Bool)

(assert (=> b!728903 m!682631))

(declare-fun m!682633 () Bool)

(assert (=> b!728912 m!682633))

(assert (=> b!728917 m!682617))

(assert (=> b!728917 m!682617))

(declare-fun m!682635 () Bool)

(assert (=> b!728917 m!682635))

(declare-fun m!682637 () Bool)

(assert (=> b!728902 m!682637))

(assert (=> b!728913 m!682617))

(assert (=> b!728913 m!682617))

(declare-fun m!682639 () Bool)

(assert (=> b!728913 m!682639))

(declare-fun m!682641 () Bool)

(assert (=> start!64672 m!682641))

(declare-fun m!682643 () Bool)

(assert (=> start!64672 m!682643))

(assert (=> b!728916 m!682617))

(assert (=> b!728916 m!682617))

(declare-fun m!682645 () Bool)

(assert (=> b!728916 m!682645))

(declare-fun m!682647 () Bool)

(assert (=> b!728911 m!682647))

(declare-fun m!682649 () Bool)

(assert (=> b!728911 m!682649))

(push 1)

