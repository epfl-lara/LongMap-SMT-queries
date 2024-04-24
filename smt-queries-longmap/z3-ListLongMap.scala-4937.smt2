; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68116 () Bool)

(assert start!68116)

(declare-fun b!791894 () Bool)

(declare-fun res!536294 () Bool)

(declare-fun e!440163 () Bool)

(assert (=> b!791894 (=> (not res!536294) (not e!440163))))

(declare-datatypes ((array!42910 0))(
  ( (array!42911 (arr!20536 (Array (_ BitVec 32) (_ BitVec 64))) (size!20956 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42910)

(declare-datatypes ((List!14445 0))(
  ( (Nil!14442) (Cons!14441 (h!15576 (_ BitVec 64)) (t!20752 List!14445)) )
))
(declare-fun arrayNoDuplicates!0 (array!42910 (_ BitVec 32) List!14445) Bool)

(assert (=> b!791894 (= res!536294 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14442))))

(declare-fun b!791895 () Bool)

(declare-fun e!440170 () Bool)

(declare-fun e!440169 () Bool)

(assert (=> b!791895 (= e!440170 e!440169)))

(declare-fun res!536300 () Bool)

(assert (=> b!791895 (=> (not res!536300) (not e!440169))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8092 0))(
  ( (MissingZero!8092 (index!34736 (_ BitVec 32))) (Found!8092 (index!34737 (_ BitVec 32))) (Intermediate!8092 (undefined!8904 Bool) (index!34738 (_ BitVec 32)) (x!65837 (_ BitVec 32))) (Undefined!8092) (MissingVacant!8092 (index!34739 (_ BitVec 32))) )
))
(declare-fun lt!353462 () SeekEntryResult!8092)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42910 (_ BitVec 32)) SeekEntryResult!8092)

(assert (=> b!791895 (= res!536300 (= (seekEntryOrOpen!0 (select (arr!20536 a!3186) j!159) a!3186 mask!3328) lt!353462))))

(assert (=> b!791895 (= lt!353462 (Found!8092 j!159))))

(declare-fun res!536288 () Bool)

(declare-fun e!440165 () Bool)

(assert (=> start!68116 (=> (not res!536288) (not e!440165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68116 (= res!536288 (validMask!0 mask!3328))))

(assert (=> start!68116 e!440165))

(assert (=> start!68116 true))

(declare-fun array_inv!16395 (array!42910) Bool)

(assert (=> start!68116 (array_inv!16395 a!3186)))

(declare-fun b!791896 () Bool)

(declare-fun res!536296 () Bool)

(assert (=> b!791896 (=> (not res!536296) (not e!440163))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!791896 (= res!536296 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20956 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20956 a!3186))))))

(declare-fun b!791897 () Bool)

(declare-fun e!440166 () Bool)

(declare-fun e!440164 () Bool)

(assert (=> b!791897 (= e!440166 e!440164)))

(declare-fun res!536290 () Bool)

(assert (=> b!791897 (=> (not res!536290) (not e!440164))))

(declare-fun lt!353466 () array!42910)

(declare-fun lt!353464 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42910 (_ BitVec 32)) SeekEntryResult!8092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791897 (= res!536290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353464 mask!3328) lt!353464 lt!353466 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353464 lt!353466 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!791897 (= lt!353464 (select (store (arr!20536 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791897 (= lt!353466 (array!42911 (store (arr!20536 a!3186) i!1173 k0!2102) (size!20956 a!3186)))))

(declare-fun b!791898 () Bool)

(assert (=> b!791898 (= e!440165 e!440163)))

(declare-fun res!536287 () Bool)

(assert (=> b!791898 (=> (not res!536287) (not e!440163))))

(declare-fun lt!353465 () SeekEntryResult!8092)

(assert (=> b!791898 (= res!536287 (or (= lt!353465 (MissingZero!8092 i!1173)) (= lt!353465 (MissingVacant!8092 i!1173))))))

(assert (=> b!791898 (= lt!353465 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791899 () Bool)

(declare-fun res!536301 () Bool)

(assert (=> b!791899 (=> (not res!536301) (not e!440165))))

(declare-fun arrayContainsKey!0 (array!42910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791899 (= res!536301 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791900 () Bool)

(declare-fun res!536289 () Bool)

(assert (=> b!791900 (=> (not res!536289) (not e!440166))))

(assert (=> b!791900 (= res!536289 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20536 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!440168 () Bool)

(declare-fun b!791901 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42910 (_ BitVec 32)) SeekEntryResult!8092)

(assert (=> b!791901 (= e!440168 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20536 a!3186) j!159) a!3186 mask!3328) (Found!8092 j!159)))))

(declare-fun b!791902 () Bool)

(declare-fun res!536293 () Bool)

(assert (=> b!791902 (=> (not res!536293) (not e!440165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791902 (= res!536293 (validKeyInArray!0 (select (arr!20536 a!3186) j!159)))))

(declare-fun b!791903 () Bool)

(declare-fun res!536297 () Bool)

(assert (=> b!791903 (=> (not res!536297) (not e!440165))))

(assert (=> b!791903 (= res!536297 (and (= (size!20956 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20956 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20956 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791904 () Bool)

(assert (=> b!791904 (= e!440163 e!440166)))

(declare-fun res!536299 () Bool)

(assert (=> b!791904 (=> (not res!536299) (not e!440166))))

(declare-fun lt!353467 () SeekEntryResult!8092)

(assert (=> b!791904 (= res!536299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20536 a!3186) j!159) mask!3328) (select (arr!20536 a!3186) j!159) a!3186 mask!3328) lt!353467))))

(assert (=> b!791904 (= lt!353467 (Intermediate!8092 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791905 () Bool)

(declare-fun res!536298 () Bool)

(assert (=> b!791905 (=> (not res!536298) (not e!440166))))

(assert (=> b!791905 (= res!536298 e!440168)))

(declare-fun c!88217 () Bool)

(assert (=> b!791905 (= c!88217 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791906 () Bool)

(declare-fun res!536295 () Bool)

(assert (=> b!791906 (=> (not res!536295) (not e!440165))))

(assert (=> b!791906 (= res!536295 (validKeyInArray!0 k0!2102))))

(declare-fun b!791907 () Bool)

(assert (=> b!791907 (= e!440168 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20536 a!3186) j!159) a!3186 mask!3328) lt!353467))))

(declare-fun b!791908 () Bool)

(assert (=> b!791908 (= e!440169 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20536 a!3186) j!159) a!3186 mask!3328) lt!353462))))

(declare-fun b!791909 () Bool)

(declare-fun res!536291 () Bool)

(assert (=> b!791909 (=> (not res!536291) (not e!440163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42910 (_ BitVec 32)) Bool)

(assert (=> b!791909 (= res!536291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791910 () Bool)

(assert (=> b!791910 (= e!440164 (not true))))

(assert (=> b!791910 e!440170))

(declare-fun res!536292 () Bool)

(assert (=> b!791910 (=> (not res!536292) (not e!440170))))

(assert (=> b!791910 (= res!536292 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27415 0))(
  ( (Unit!27416) )
))
(declare-fun lt!353463 () Unit!27415)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27415)

(assert (=> b!791910 (= lt!353463 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!68116 res!536288) b!791903))

(assert (= (and b!791903 res!536297) b!791902))

(assert (= (and b!791902 res!536293) b!791906))

(assert (= (and b!791906 res!536295) b!791899))

(assert (= (and b!791899 res!536301) b!791898))

(assert (= (and b!791898 res!536287) b!791909))

(assert (= (and b!791909 res!536291) b!791894))

(assert (= (and b!791894 res!536294) b!791896))

(assert (= (and b!791896 res!536296) b!791904))

(assert (= (and b!791904 res!536299) b!791900))

(assert (= (and b!791900 res!536289) b!791905))

(assert (= (and b!791905 c!88217) b!791907))

(assert (= (and b!791905 (not c!88217)) b!791901))

(assert (= (and b!791905 res!536298) b!791897))

(assert (= (and b!791897 res!536290) b!791910))

(assert (= (and b!791910 res!536292) b!791895))

(assert (= (and b!791895 res!536300) b!791908))

(declare-fun m!733067 () Bool)

(assert (=> b!791900 m!733067))

(declare-fun m!733069 () Bool)

(assert (=> b!791908 m!733069))

(assert (=> b!791908 m!733069))

(declare-fun m!733071 () Bool)

(assert (=> b!791908 m!733071))

(declare-fun m!733073 () Bool)

(assert (=> b!791898 m!733073))

(declare-fun m!733075 () Bool)

(assert (=> b!791910 m!733075))

(declare-fun m!733077 () Bool)

(assert (=> b!791910 m!733077))

(declare-fun m!733079 () Bool)

(assert (=> b!791899 m!733079))

(declare-fun m!733081 () Bool)

(assert (=> start!68116 m!733081))

(declare-fun m!733083 () Bool)

(assert (=> start!68116 m!733083))

(declare-fun m!733085 () Bool)

(assert (=> b!791906 m!733085))

(assert (=> b!791895 m!733069))

(assert (=> b!791895 m!733069))

(declare-fun m!733087 () Bool)

(assert (=> b!791895 m!733087))

(declare-fun m!733089 () Bool)

(assert (=> b!791894 m!733089))

(assert (=> b!791901 m!733069))

(assert (=> b!791901 m!733069))

(declare-fun m!733091 () Bool)

(assert (=> b!791901 m!733091))

(declare-fun m!733093 () Bool)

(assert (=> b!791909 m!733093))

(declare-fun m!733095 () Bool)

(assert (=> b!791897 m!733095))

(declare-fun m!733097 () Bool)

(assert (=> b!791897 m!733097))

(assert (=> b!791897 m!733095))

(declare-fun m!733099 () Bool)

(assert (=> b!791897 m!733099))

(declare-fun m!733101 () Bool)

(assert (=> b!791897 m!733101))

(declare-fun m!733103 () Bool)

(assert (=> b!791897 m!733103))

(assert (=> b!791904 m!733069))

(assert (=> b!791904 m!733069))

(declare-fun m!733105 () Bool)

(assert (=> b!791904 m!733105))

(assert (=> b!791904 m!733105))

(assert (=> b!791904 m!733069))

(declare-fun m!733107 () Bool)

(assert (=> b!791904 m!733107))

(assert (=> b!791902 m!733069))

(assert (=> b!791902 m!733069))

(declare-fun m!733109 () Bool)

(assert (=> b!791902 m!733109))

(assert (=> b!791907 m!733069))

(assert (=> b!791907 m!733069))

(declare-fun m!733111 () Bool)

(assert (=> b!791907 m!733111))

(check-sat (not b!791897) (not b!791898) (not b!791907) (not b!791906) (not b!791902) (not b!791910) (not b!791899) (not b!791908) (not b!791894) (not b!791901) (not start!68116) (not b!791909) (not b!791904) (not b!791895))
(check-sat)
