; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66228 () Bool)

(assert start!66228)

(declare-fun b!762888 () Bool)

(declare-fun res!516056 () Bool)

(declare-fun e!425104 () Bool)

(assert (=> b!762888 (=> (not res!516056) (not e!425104))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((array!42150 0))(
  ( (array!42151 (arr!20183 (Array (_ BitVec 32) (_ BitVec 64))) (size!20604 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42150)

(assert (=> b!762888 (= res!516056 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20604 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20604 a!3186))))))

(declare-fun b!762889 () Bool)

(declare-fun res!516047 () Bool)

(declare-fun e!425103 () Bool)

(assert (=> b!762889 (=> (not res!516047) (not e!425103))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762889 (= res!516047 (validKeyInArray!0 k0!2102))))

(declare-fun b!762890 () Bool)

(declare-fun res!516050 () Bool)

(assert (=> b!762890 (=> (not res!516050) (not e!425104))))

(declare-datatypes ((List!14224 0))(
  ( (Nil!14221) (Cons!14220 (h!15304 (_ BitVec 64)) (t!20530 List!14224)) )
))
(declare-fun arrayNoDuplicates!0 (array!42150 (_ BitVec 32) List!14224) Bool)

(assert (=> b!762890 (= res!516050 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14221))))

(declare-fun b!762891 () Bool)

(declare-fun e!425102 () Bool)

(assert (=> b!762891 (= e!425102 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!339491 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762891 (= lt!339491 (toIndex!0 (select (store (arr!20183 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!762892 () Bool)

(declare-fun res!516048 () Bool)

(assert (=> b!762892 (=> (not res!516048) (not e!425103))))

(assert (=> b!762892 (= res!516048 (and (= (size!20604 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20604 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20604 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762893 () Bool)

(declare-fun res!516054 () Bool)

(assert (=> b!762893 (=> (not res!516054) (not e!425103))))

(declare-fun arrayContainsKey!0 (array!42150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762893 (= res!516054 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762894 () Bool)

(assert (=> b!762894 (= e!425103 e!425104)))

(declare-fun res!516055 () Bool)

(assert (=> b!762894 (=> (not res!516055) (not e!425104))))

(declare-datatypes ((SeekEntryResult!7780 0))(
  ( (MissingZero!7780 (index!33488 (_ BitVec 32))) (Found!7780 (index!33489 (_ BitVec 32))) (Intermediate!7780 (undefined!8592 Bool) (index!33490 (_ BitVec 32)) (x!64403 (_ BitVec 32))) (Undefined!7780) (MissingVacant!7780 (index!33491 (_ BitVec 32))) )
))
(declare-fun lt!339490 () SeekEntryResult!7780)

(assert (=> b!762894 (= res!516055 (or (= lt!339490 (MissingZero!7780 i!1173)) (= lt!339490 (MissingVacant!7780 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42150 (_ BitVec 32)) SeekEntryResult!7780)

(assert (=> b!762894 (= lt!339490 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!425105 () Bool)

(declare-fun b!762895 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42150 (_ BitVec 32)) SeekEntryResult!7780)

(assert (=> b!762895 (= e!425105 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20183 a!3186) j!159) a!3186 mask!3328) (Found!7780 j!159)))))

(declare-fun b!762896 () Bool)

(declare-fun res!516049 () Bool)

(assert (=> b!762896 (=> (not res!516049) (not e!425104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42150 (_ BitVec 32)) Bool)

(assert (=> b!762896 (= res!516049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!516046 () Bool)

(assert (=> start!66228 (=> (not res!516046) (not e!425103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66228 (= res!516046 (validMask!0 mask!3328))))

(assert (=> start!66228 e!425103))

(assert (=> start!66228 true))

(declare-fun array_inv!16066 (array!42150) Bool)

(assert (=> start!66228 (array_inv!16066 a!3186)))

(declare-fun b!762897 () Bool)

(declare-fun lt!339489 () SeekEntryResult!7780)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42150 (_ BitVec 32)) SeekEntryResult!7780)

(assert (=> b!762897 (= e!425105 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20183 a!3186) j!159) a!3186 mask!3328) lt!339489))))

(declare-fun b!762898 () Bool)

(declare-fun res!516051 () Bool)

(assert (=> b!762898 (=> (not res!516051) (not e!425103))))

(assert (=> b!762898 (= res!516051 (validKeyInArray!0 (select (arr!20183 a!3186) j!159)))))

(declare-fun b!762899 () Bool)

(assert (=> b!762899 (= e!425104 e!425102)))

(declare-fun res!516052 () Bool)

(assert (=> b!762899 (=> (not res!516052) (not e!425102))))

(assert (=> b!762899 (= res!516052 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20183 a!3186) j!159) mask!3328) (select (arr!20183 a!3186) j!159) a!3186 mask!3328) lt!339489))))

(assert (=> b!762899 (= lt!339489 (Intermediate!7780 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762900 () Bool)

(declare-fun res!516053 () Bool)

(assert (=> b!762900 (=> (not res!516053) (not e!425102))))

(assert (=> b!762900 (= res!516053 e!425105)))

(declare-fun c!83808 () Bool)

(assert (=> b!762900 (= c!83808 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762901 () Bool)

(declare-fun res!516045 () Bool)

(assert (=> b!762901 (=> (not res!516045) (not e!425102))))

(assert (=> b!762901 (= res!516045 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20183 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66228 res!516046) b!762892))

(assert (= (and b!762892 res!516048) b!762898))

(assert (= (and b!762898 res!516051) b!762889))

(assert (= (and b!762889 res!516047) b!762893))

(assert (= (and b!762893 res!516054) b!762894))

(assert (= (and b!762894 res!516055) b!762896))

(assert (= (and b!762896 res!516049) b!762890))

(assert (= (and b!762890 res!516050) b!762888))

(assert (= (and b!762888 res!516056) b!762899))

(assert (= (and b!762899 res!516052) b!762901))

(assert (= (and b!762901 res!516045) b!762900))

(assert (= (and b!762900 c!83808) b!762897))

(assert (= (and b!762900 (not c!83808)) b!762895))

(assert (= (and b!762900 res!516053) b!762891))

(declare-fun m!708943 () Bool)

(assert (=> b!762899 m!708943))

(assert (=> b!762899 m!708943))

(declare-fun m!708945 () Bool)

(assert (=> b!762899 m!708945))

(assert (=> b!762899 m!708945))

(assert (=> b!762899 m!708943))

(declare-fun m!708947 () Bool)

(assert (=> b!762899 m!708947))

(assert (=> b!762898 m!708943))

(assert (=> b!762898 m!708943))

(declare-fun m!708949 () Bool)

(assert (=> b!762898 m!708949))

(declare-fun m!708951 () Bool)

(assert (=> start!66228 m!708951))

(declare-fun m!708953 () Bool)

(assert (=> start!66228 m!708953))

(declare-fun m!708955 () Bool)

(assert (=> b!762889 m!708955))

(assert (=> b!762895 m!708943))

(assert (=> b!762895 m!708943))

(declare-fun m!708957 () Bool)

(assert (=> b!762895 m!708957))

(declare-fun m!708959 () Bool)

(assert (=> b!762901 m!708959))

(declare-fun m!708961 () Bool)

(assert (=> b!762896 m!708961))

(declare-fun m!708963 () Bool)

(assert (=> b!762893 m!708963))

(declare-fun m!708965 () Bool)

(assert (=> b!762891 m!708965))

(declare-fun m!708967 () Bool)

(assert (=> b!762891 m!708967))

(assert (=> b!762891 m!708967))

(declare-fun m!708969 () Bool)

(assert (=> b!762891 m!708969))

(assert (=> b!762897 m!708943))

(assert (=> b!762897 m!708943))

(declare-fun m!708971 () Bool)

(assert (=> b!762897 m!708971))

(declare-fun m!708973 () Bool)

(assert (=> b!762894 m!708973))

(declare-fun m!708975 () Bool)

(assert (=> b!762890 m!708975))

(check-sat (not b!762889) (not b!762893) (not b!762896) (not b!762895) (not b!762891) (not b!762897) (not start!66228) (not b!762890) (not b!762898) (not b!762899) (not b!762894))
(check-sat)
