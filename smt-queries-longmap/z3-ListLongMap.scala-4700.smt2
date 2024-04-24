; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65388 () Bool)

(assert start!65388)

(declare-fun b!740887 () Bool)

(declare-fun res!498023 () Bool)

(declare-fun e!414311 () Bool)

(assert (=> b!740887 (=> res!498023 e!414311)))

(declare-fun e!414302 () Bool)

(assert (=> b!740887 (= res!498023 e!414302)))

(declare-fun c!81822 () Bool)

(declare-fun lt!329069 () Bool)

(assert (=> b!740887 (= c!81822 lt!329069)))

(declare-fun b!740888 () Bool)

(declare-fun e!414301 () Bool)

(declare-fun e!414304 () Bool)

(assert (=> b!740888 (= e!414301 e!414304)))

(declare-fun res!498024 () Bool)

(assert (=> b!740888 (=> (not res!498024) (not e!414304))))

(declare-datatypes ((SeekEntryResult!7381 0))(
  ( (MissingZero!7381 (index!31892 (_ BitVec 32))) (Found!7381 (index!31893 (_ BitVec 32))) (Intermediate!7381 (undefined!8193 Bool) (index!31894 (_ BitVec 32)) (x!63039 (_ BitVec 32))) (Undefined!7381) (MissingVacant!7381 (index!31895 (_ BitVec 32))) )
))
(declare-fun lt!329079 () SeekEntryResult!7381)

(declare-fun lt!329080 () SeekEntryResult!7381)

(assert (=> b!740888 (= res!498024 (= lt!329079 lt!329080))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41431 0))(
  ( (array!41432 (arr!19825 (Array (_ BitVec 32) (_ BitVec 64))) (size!20245 (_ BitVec 32))) )
))
(declare-fun lt!329081 () array!41431)

(declare-fun lt!329072 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41431 (_ BitVec 32)) SeekEntryResult!7381)

(assert (=> b!740888 (= lt!329080 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329072 lt!329081 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740888 (= lt!329079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329072 mask!3328) lt!329072 lt!329081 mask!3328))))

(declare-fun a!3186 () array!41431)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!740888 (= lt!329072 (select (store (arr!19825 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740888 (= lt!329081 (array!41432 (store (arr!19825 a!3186) i!1173 k0!2102) (size!20245 a!3186)))))

(declare-fun b!740889 () Bool)

(declare-fun e!414310 () Bool)

(assert (=> b!740889 (= e!414304 (not e!414310))))

(declare-fun res!498019 () Bool)

(assert (=> b!740889 (=> res!498019 e!414310)))

(get-info :version)

(assert (=> b!740889 (= res!498019 (or (not ((_ is Intermediate!7381) lt!329080)) (bvsge x!1131 (x!63039 lt!329080))))))

(declare-fun lt!329076 () SeekEntryResult!7381)

(assert (=> b!740889 (= lt!329076 (Found!7381 j!159))))

(declare-fun e!414309 () Bool)

(assert (=> b!740889 e!414309))

(declare-fun res!498028 () Bool)

(assert (=> b!740889 (=> (not res!498028) (not e!414309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41431 (_ BitVec 32)) Bool)

(assert (=> b!740889 (= res!498028 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25297 0))(
  ( (Unit!25298) )
))
(declare-fun lt!329074 () Unit!25297)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25297)

(assert (=> b!740889 (= lt!329074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740890 () Bool)

(declare-fun res!498016 () Bool)

(assert (=> b!740890 (=> res!498016 e!414311)))

(declare-fun lt!329075 () (_ BitVec 32))

(assert (=> b!740890 (= res!498016 (not (= lt!329079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329075 lt!329072 lt!329081 mask!3328))))))

(declare-fun b!740891 () Bool)

(assert (=> b!740891 (= e!414311 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41431 (_ BitVec 32)) SeekEntryResult!7381)

(assert (=> b!740891 (= (seekEntryOrOpen!0 lt!329072 lt!329081 mask!3328) lt!329076)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!329078 () Unit!25297)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25297)

(assert (=> b!740891 (= lt!329078 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!329075 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun e!414303 () Bool)

(declare-fun b!740892 () Bool)

(declare-fun lt!329073 () SeekEntryResult!7381)

(assert (=> b!740892 (= e!414303 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!329073))))

(declare-fun b!740893 () Bool)

(declare-fun res!498014 () Bool)

(declare-fun e!414306 () Bool)

(assert (=> b!740893 (=> (not res!498014) (not e!414306))))

(assert (=> b!740893 (= res!498014 (and (= (size!20245 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20245 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20245 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740894 () Bool)

(declare-fun e!414312 () Bool)

(assert (=> b!740894 (= e!414306 e!414312)))

(declare-fun res!498027 () Bool)

(assert (=> b!740894 (=> (not res!498027) (not e!414312))))

(declare-fun lt!329082 () SeekEntryResult!7381)

(assert (=> b!740894 (= res!498027 (or (= lt!329082 (MissingZero!7381 i!1173)) (= lt!329082 (MissingVacant!7381 i!1173))))))

(assert (=> b!740894 (= lt!329082 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740895 () Bool)

(declare-fun res!498010 () Bool)

(assert (=> b!740895 (=> (not res!498010) (not e!414306))))

(declare-fun arrayContainsKey!0 (array!41431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740895 (= res!498010 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740896 () Bool)

(declare-fun e!414307 () Unit!25297)

(declare-fun Unit!25299 () Unit!25297)

(assert (=> b!740896 (= e!414307 Unit!25299)))

(declare-fun lt!329077 () SeekEntryResult!7381)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41431 (_ BitVec 32)) SeekEntryResult!7381)

(assert (=> b!740896 (= lt!329077 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740896 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329075 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!329076)))

(declare-fun b!740897 () Bool)

(declare-fun res!498026 () Bool)

(assert (=> b!740897 (=> (not res!498026) (not e!414301))))

(assert (=> b!740897 (= res!498026 e!414303)))

(declare-fun c!81824 () Bool)

(assert (=> b!740897 (= c!81824 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740898 () Bool)

(declare-fun res!498017 () Bool)

(assert (=> b!740898 (=> (not res!498017) (not e!414301))))

(assert (=> b!740898 (= res!498017 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19825 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740899 () Bool)

(declare-fun res!498020 () Bool)

(assert (=> b!740899 (=> (not res!498020) (not e!414312))))

(declare-datatypes ((List!13734 0))(
  ( (Nil!13731) (Cons!13730 (h!14808 (_ BitVec 64)) (t!20041 List!13734)) )
))
(declare-fun arrayNoDuplicates!0 (array!41431 (_ BitVec 32) List!13734) Bool)

(assert (=> b!740899 (= res!498020 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13731))))

(declare-fun b!740900 () Bool)

(declare-fun Unit!25300 () Unit!25297)

(assert (=> b!740900 (= e!414307 Unit!25300)))

(assert (=> b!740900 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329075 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!329073)))

(declare-fun b!740901 () Bool)

(assert (=> b!740901 (= e!414303 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) (Found!7381 j!159)))))

(declare-fun b!740902 () Bool)

(assert (=> b!740902 (= e!414312 e!414301)))

(declare-fun res!498015 () Bool)

(assert (=> b!740902 (=> (not res!498015) (not e!414301))))

(assert (=> b!740902 (= res!498015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19825 a!3186) j!159) mask!3328) (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!329073))))

(assert (=> b!740902 (= lt!329073 (Intermediate!7381 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740903 () Bool)

(assert (=> b!740903 (= e!414310 e!414311)))

(declare-fun res!498021 () Bool)

(assert (=> b!740903 (=> res!498021 e!414311)))

(assert (=> b!740903 (= res!498021 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!329075 #b00000000000000000000000000000000) (bvsge lt!329075 (size!20245 a!3186))))))

(declare-fun lt!329070 () Unit!25297)

(assert (=> b!740903 (= lt!329070 e!414307)))

(declare-fun c!81823 () Bool)

(assert (=> b!740903 (= c!81823 lt!329069)))

(assert (=> b!740903 (= lt!329069 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740903 (= lt!329075 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!740904 () Bool)

(declare-fun e!414308 () Bool)

(assert (=> b!740904 (= e!414309 e!414308)))

(declare-fun res!498012 () Bool)

(assert (=> b!740904 (=> (not res!498012) (not e!414308))))

(declare-fun lt!329071 () SeekEntryResult!7381)

(assert (=> b!740904 (= res!498012 (= (seekEntryOrOpen!0 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!329071))))

(assert (=> b!740904 (= lt!329071 (Found!7381 j!159))))

(declare-fun b!740905 () Bool)

(declare-fun res!498025 () Bool)

(assert (=> b!740905 (=> (not res!498025) (not e!414306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740905 (= res!498025 (validKeyInArray!0 k0!2102))))

(declare-fun b!740906 () Bool)

(declare-fun res!498022 () Bool)

(assert (=> b!740906 (=> (not res!498022) (not e!414306))))

(assert (=> b!740906 (= res!498022 (validKeyInArray!0 (select (arr!19825 a!3186) j!159)))))

(declare-fun b!740907 () Bool)

(declare-fun res!498013 () Bool)

(assert (=> b!740907 (=> (not res!498013) (not e!414312))))

(assert (=> b!740907 (= res!498013 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20245 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20245 a!3186))))))

(declare-fun b!740908 () Bool)

(assert (=> b!740908 (= e!414308 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!329071))))

(declare-fun b!740909 () Bool)

(assert (=> b!740909 (= e!414302 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329075 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!329073)))))

(declare-fun res!498018 () Bool)

(assert (=> start!65388 (=> (not res!498018) (not e!414306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65388 (= res!498018 (validMask!0 mask!3328))))

(assert (=> start!65388 e!414306))

(assert (=> start!65388 true))

(declare-fun array_inv!15684 (array!41431) Bool)

(assert (=> start!65388 (array_inv!15684 a!3186)))

(declare-fun b!740910 () Bool)

(declare-fun res!498011 () Bool)

(assert (=> b!740910 (=> (not res!498011) (not e!414312))))

(assert (=> b!740910 (= res!498011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740911 () Bool)

(assert (=> b!740911 (= e!414302 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!329075 resIntermediateIndex!5 (select (arr!19825 a!3186) j!159) a!3186 mask!3328) lt!329076)))))

(assert (= (and start!65388 res!498018) b!740893))

(assert (= (and b!740893 res!498014) b!740906))

(assert (= (and b!740906 res!498022) b!740905))

(assert (= (and b!740905 res!498025) b!740895))

(assert (= (and b!740895 res!498010) b!740894))

(assert (= (and b!740894 res!498027) b!740910))

(assert (= (and b!740910 res!498011) b!740899))

(assert (= (and b!740899 res!498020) b!740907))

(assert (= (and b!740907 res!498013) b!740902))

(assert (= (and b!740902 res!498015) b!740898))

(assert (= (and b!740898 res!498017) b!740897))

(assert (= (and b!740897 c!81824) b!740892))

(assert (= (and b!740897 (not c!81824)) b!740901))

(assert (= (and b!740897 res!498026) b!740888))

(assert (= (and b!740888 res!498024) b!740889))

(assert (= (and b!740889 res!498028) b!740904))

(assert (= (and b!740904 res!498012) b!740908))

(assert (= (and b!740889 (not res!498019)) b!740903))

(assert (= (and b!740903 c!81823) b!740900))

(assert (= (and b!740903 (not c!81823)) b!740896))

(assert (= (and b!740903 (not res!498021)) b!740887))

(assert (= (and b!740887 c!81822) b!740909))

(assert (= (and b!740887 (not c!81822)) b!740911))

(assert (= (and b!740887 (not res!498023)) b!740890))

(assert (= (and b!740890 (not res!498016)) b!740891))

(declare-fun m!692505 () Bool)

(assert (=> b!740911 m!692505))

(assert (=> b!740911 m!692505))

(declare-fun m!692507 () Bool)

(assert (=> b!740911 m!692507))

(declare-fun m!692509 () Bool)

(assert (=> b!740910 m!692509))

(declare-fun m!692511 () Bool)

(assert (=> b!740891 m!692511))

(declare-fun m!692513 () Bool)

(assert (=> b!740891 m!692513))

(assert (=> b!740902 m!692505))

(assert (=> b!740902 m!692505))

(declare-fun m!692515 () Bool)

(assert (=> b!740902 m!692515))

(assert (=> b!740902 m!692515))

(assert (=> b!740902 m!692505))

(declare-fun m!692517 () Bool)

(assert (=> b!740902 m!692517))

(declare-fun m!692519 () Bool)

(assert (=> b!740888 m!692519))

(declare-fun m!692521 () Bool)

(assert (=> b!740888 m!692521))

(declare-fun m!692523 () Bool)

(assert (=> b!740888 m!692523))

(declare-fun m!692525 () Bool)

(assert (=> b!740888 m!692525))

(declare-fun m!692527 () Bool)

(assert (=> b!740888 m!692527))

(assert (=> b!740888 m!692519))

(declare-fun m!692529 () Bool)

(assert (=> b!740903 m!692529))

(assert (=> b!740904 m!692505))

(assert (=> b!740904 m!692505))

(declare-fun m!692531 () Bool)

(assert (=> b!740904 m!692531))

(assert (=> b!740900 m!692505))

(assert (=> b!740900 m!692505))

(declare-fun m!692533 () Bool)

(assert (=> b!740900 m!692533))

(declare-fun m!692535 () Bool)

(assert (=> b!740889 m!692535))

(declare-fun m!692537 () Bool)

(assert (=> b!740889 m!692537))

(declare-fun m!692539 () Bool)

(assert (=> b!740895 m!692539))

(declare-fun m!692541 () Bool)

(assert (=> b!740899 m!692541))

(declare-fun m!692543 () Bool)

(assert (=> b!740894 m!692543))

(declare-fun m!692545 () Bool)

(assert (=> b!740890 m!692545))

(assert (=> b!740896 m!692505))

(assert (=> b!740896 m!692505))

(declare-fun m!692547 () Bool)

(assert (=> b!740896 m!692547))

(assert (=> b!740896 m!692505))

(assert (=> b!740896 m!692507))

(assert (=> b!740901 m!692505))

(assert (=> b!740901 m!692505))

(assert (=> b!740901 m!692547))

(assert (=> b!740892 m!692505))

(assert (=> b!740892 m!692505))

(declare-fun m!692549 () Bool)

(assert (=> b!740892 m!692549))

(declare-fun m!692551 () Bool)

(assert (=> start!65388 m!692551))

(declare-fun m!692553 () Bool)

(assert (=> start!65388 m!692553))

(assert (=> b!740906 m!692505))

(assert (=> b!740906 m!692505))

(declare-fun m!692555 () Bool)

(assert (=> b!740906 m!692555))

(declare-fun m!692557 () Bool)

(assert (=> b!740898 m!692557))

(declare-fun m!692559 () Bool)

(assert (=> b!740905 m!692559))

(assert (=> b!740908 m!692505))

(assert (=> b!740908 m!692505))

(declare-fun m!692561 () Bool)

(assert (=> b!740908 m!692561))

(assert (=> b!740909 m!692505))

(assert (=> b!740909 m!692505))

(assert (=> b!740909 m!692533))

(check-sat (not b!740889) (not b!740906) (not b!740905) (not b!740901) (not b!740900) (not b!740902) (not b!740888) (not b!740903) (not b!740890) (not b!740910) (not b!740904) (not b!740899) (not b!740894) (not b!740895) (not b!740891) (not b!740896) (not b!740911) (not b!740908) (not start!65388) (not b!740909) (not b!740892))
(check-sat)
