; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65428 () Bool)

(assert start!65428)

(declare-fun res!501940 () Bool)

(declare-fun e!416138 () Bool)

(assert (=> start!65428 (=> (not res!501940) (not e!416138))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65428 (= res!501940 (validMask!0 mask!3328))))

(assert (=> start!65428 e!416138))

(assert (=> start!65428 true))

(declare-datatypes ((array!41601 0))(
  ( (array!41602 (arr!19914 (Array (_ BitVec 32) (_ BitVec 64))) (size!20335 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41601)

(declare-fun array_inv!15710 (array!41601) Bool)

(assert (=> start!65428 (array_inv!15710 a!3186)))

(declare-fun b!745006 () Bool)

(declare-fun res!501932 () Bool)

(declare-fun e!416131 () Bool)

(assert (=> b!745006 (=> (not res!501932) (not e!416131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41601 (_ BitVec 32)) Bool)

(assert (=> b!745006 (= res!501932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745007 () Bool)

(declare-fun res!501934 () Bool)

(assert (=> b!745007 (=> (not res!501934) (not e!416138))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745007 (= res!501934 (and (= (size!20335 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20335 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20335 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745008 () Bool)

(declare-fun res!501931 () Bool)

(assert (=> b!745008 (=> (not res!501931) (not e!416138))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745008 (= res!501931 (validKeyInArray!0 k!2102))))

(declare-fun b!745009 () Bool)

(declare-fun res!501943 () Bool)

(assert (=> b!745009 (=> (not res!501943) (not e!416131))))

(declare-datatypes ((List!13916 0))(
  ( (Nil!13913) (Cons!13912 (h!14984 (_ BitVec 64)) (t!20231 List!13916)) )
))
(declare-fun arrayNoDuplicates!0 (array!41601 (_ BitVec 32) List!13916) Bool)

(assert (=> b!745009 (= res!501943 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13913))))

(declare-fun b!745010 () Bool)

(declare-fun e!416136 () Bool)

(declare-fun e!416132 () Bool)

(assert (=> b!745010 (= e!416136 (not e!416132))))

(declare-fun res!501938 () Bool)

(assert (=> b!745010 (=> res!501938 e!416132)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7514 0))(
  ( (MissingZero!7514 (index!32424 (_ BitVec 32))) (Found!7514 (index!32425 (_ BitVec 32))) (Intermediate!7514 (undefined!8326 Bool) (index!32426 (_ BitVec 32)) (x!63384 (_ BitVec 32))) (Undefined!7514) (MissingVacant!7514 (index!32427 (_ BitVec 32))) )
))
(declare-fun lt!330977 () SeekEntryResult!7514)

(assert (=> b!745010 (= res!501938 (or (not (is-Intermediate!7514 lt!330977)) (bvslt x!1131 (x!63384 lt!330977)) (not (= x!1131 (x!63384 lt!330977))) (not (= index!1321 (index!32426 lt!330977)))))))

(declare-fun e!416135 () Bool)

(assert (=> b!745010 e!416135))

(declare-fun res!501941 () Bool)

(assert (=> b!745010 (=> (not res!501941) (not e!416135))))

(assert (=> b!745010 (= res!501941 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25508 0))(
  ( (Unit!25509) )
))
(declare-fun lt!330976 () Unit!25508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25508)

(assert (=> b!745010 (= lt!330976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!745011 () Bool)

(declare-fun e!416134 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41601 (_ BitVec 32)) SeekEntryResult!7514)

(assert (=> b!745011 (= e!416134 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19914 a!3186) j!159) a!3186 mask!3328) (Found!7514 j!159)))))

(declare-fun b!745012 () Bool)

(declare-fun res!501936 () Bool)

(declare-fun e!416133 () Bool)

(assert (=> b!745012 (=> (not res!501936) (not e!416133))))

(assert (=> b!745012 (= res!501936 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19914 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745013 () Bool)

(declare-fun lt!330973 () SeekEntryResult!7514)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41601 (_ BitVec 32)) SeekEntryResult!7514)

(assert (=> b!745013 (= e!416134 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19914 a!3186) j!159) a!3186 mask!3328) lt!330973))))

(declare-fun b!745014 () Bool)

(declare-fun e!416130 () Bool)

(assert (=> b!745014 (= e!416135 e!416130)))

(declare-fun res!501944 () Bool)

(assert (=> b!745014 (=> (not res!501944) (not e!416130))))

(declare-fun lt!330970 () SeekEntryResult!7514)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41601 (_ BitVec 32)) SeekEntryResult!7514)

(assert (=> b!745014 (= res!501944 (= (seekEntryOrOpen!0 (select (arr!19914 a!3186) j!159) a!3186 mask!3328) lt!330970))))

(assert (=> b!745014 (= lt!330970 (Found!7514 j!159))))

(declare-fun b!745015 () Bool)

(assert (=> b!745015 (= e!416138 e!416131)))

(declare-fun res!501933 () Bool)

(assert (=> b!745015 (=> (not res!501933) (not e!416131))))

(declare-fun lt!330969 () SeekEntryResult!7514)

(assert (=> b!745015 (= res!501933 (or (= lt!330969 (MissingZero!7514 i!1173)) (= lt!330969 (MissingVacant!7514 i!1173))))))

(assert (=> b!745015 (= lt!330969 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!745016 () Bool)

(declare-fun res!501937 () Bool)

(assert (=> b!745016 (=> (not res!501937) (not e!416138))))

(assert (=> b!745016 (= res!501937 (validKeyInArray!0 (select (arr!19914 a!3186) j!159)))))

(declare-fun b!745017 () Bool)

(assert (=> b!745017 (= e!416133 e!416136)))

(declare-fun res!501939 () Bool)

(assert (=> b!745017 (=> (not res!501939) (not e!416136))))

(declare-fun lt!330972 () SeekEntryResult!7514)

(assert (=> b!745017 (= res!501939 (= lt!330972 lt!330977))))

(declare-fun lt!330974 () (_ BitVec 64))

(declare-fun lt!330975 () array!41601)

(assert (=> b!745017 (= lt!330977 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330974 lt!330975 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745017 (= lt!330972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330974 mask!3328) lt!330974 lt!330975 mask!3328))))

(assert (=> b!745017 (= lt!330974 (select (store (arr!19914 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!745017 (= lt!330975 (array!41602 (store (arr!19914 a!3186) i!1173 k!2102) (size!20335 a!3186)))))

(declare-fun b!745018 () Bool)

(assert (=> b!745018 (= e!416131 e!416133)))

(declare-fun res!501929 () Bool)

(assert (=> b!745018 (=> (not res!501929) (not e!416133))))

(assert (=> b!745018 (= res!501929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19914 a!3186) j!159) mask!3328) (select (arr!19914 a!3186) j!159) a!3186 mask!3328) lt!330973))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745018 (= lt!330973 (Intermediate!7514 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745019 () Bool)

(declare-fun res!501930 () Bool)

(assert (=> b!745019 (=> (not res!501930) (not e!416138))))

(declare-fun arrayContainsKey!0 (array!41601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745019 (= res!501930 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745020 () Bool)

(assert (=> b!745020 (= e!416130 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19914 a!3186) j!159) a!3186 mask!3328) lt!330970))))

(declare-fun b!745021 () Bool)

(assert (=> b!745021 (= e!416132 true)))

(declare-fun lt!330971 () SeekEntryResult!7514)

(assert (=> b!745021 (= lt!330971 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19914 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745022 () Bool)

(declare-fun res!501942 () Bool)

(assert (=> b!745022 (=> (not res!501942) (not e!416133))))

(assert (=> b!745022 (= res!501942 e!416134)))

(declare-fun c!81919 () Bool)

(assert (=> b!745022 (= c!81919 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745023 () Bool)

(declare-fun res!501935 () Bool)

(assert (=> b!745023 (=> (not res!501935) (not e!416131))))

(assert (=> b!745023 (= res!501935 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20335 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20335 a!3186))))))

(assert (= (and start!65428 res!501940) b!745007))

(assert (= (and b!745007 res!501934) b!745016))

(assert (= (and b!745016 res!501937) b!745008))

(assert (= (and b!745008 res!501931) b!745019))

(assert (= (and b!745019 res!501930) b!745015))

(assert (= (and b!745015 res!501933) b!745006))

(assert (= (and b!745006 res!501932) b!745009))

(assert (= (and b!745009 res!501943) b!745023))

(assert (= (and b!745023 res!501935) b!745018))

(assert (= (and b!745018 res!501929) b!745012))

(assert (= (and b!745012 res!501936) b!745022))

(assert (= (and b!745022 c!81919) b!745013))

(assert (= (and b!745022 (not c!81919)) b!745011))

(assert (= (and b!745022 res!501942) b!745017))

(assert (= (and b!745017 res!501939) b!745010))

(assert (= (and b!745010 res!501941) b!745014))

(assert (= (and b!745014 res!501944) b!745020))

(assert (= (and b!745010 (not res!501938)) b!745021))

(declare-fun m!695449 () Bool)

(assert (=> b!745006 m!695449))

(declare-fun m!695451 () Bool)

(assert (=> b!745011 m!695451))

(assert (=> b!745011 m!695451))

(declare-fun m!695453 () Bool)

(assert (=> b!745011 m!695453))

(declare-fun m!695455 () Bool)

(assert (=> start!65428 m!695455))

(declare-fun m!695457 () Bool)

(assert (=> start!65428 m!695457))

(declare-fun m!695459 () Bool)

(assert (=> b!745010 m!695459))

(declare-fun m!695461 () Bool)

(assert (=> b!745010 m!695461))

(declare-fun m!695463 () Bool)

(assert (=> b!745009 m!695463))

(assert (=> b!745013 m!695451))

(assert (=> b!745013 m!695451))

(declare-fun m!695465 () Bool)

(assert (=> b!745013 m!695465))

(assert (=> b!745021 m!695451))

(assert (=> b!745021 m!695451))

(assert (=> b!745021 m!695453))

(declare-fun m!695467 () Bool)

(assert (=> b!745017 m!695467))

(declare-fun m!695469 () Bool)

(assert (=> b!745017 m!695469))

(declare-fun m!695471 () Bool)

(assert (=> b!745017 m!695471))

(declare-fun m!695473 () Bool)

(assert (=> b!745017 m!695473))

(declare-fun m!695475 () Bool)

(assert (=> b!745017 m!695475))

(assert (=> b!745017 m!695467))

(declare-fun m!695477 () Bool)

(assert (=> b!745012 m!695477))

(assert (=> b!745014 m!695451))

(assert (=> b!745014 m!695451))

(declare-fun m!695479 () Bool)

(assert (=> b!745014 m!695479))

(assert (=> b!745020 m!695451))

(assert (=> b!745020 m!695451))

(declare-fun m!695481 () Bool)

(assert (=> b!745020 m!695481))

(declare-fun m!695483 () Bool)

(assert (=> b!745015 m!695483))

(declare-fun m!695485 () Bool)

(assert (=> b!745019 m!695485))

(assert (=> b!745018 m!695451))

(assert (=> b!745018 m!695451))

(declare-fun m!695487 () Bool)

(assert (=> b!745018 m!695487))

(assert (=> b!745018 m!695487))

(assert (=> b!745018 m!695451))

(declare-fun m!695489 () Bool)

(assert (=> b!745018 m!695489))

(declare-fun m!695491 () Bool)

(assert (=> b!745008 m!695491))

(assert (=> b!745016 m!695451))

(assert (=> b!745016 m!695451))

(declare-fun m!695493 () Bool)

(assert (=> b!745016 m!695493))

(push 1)

