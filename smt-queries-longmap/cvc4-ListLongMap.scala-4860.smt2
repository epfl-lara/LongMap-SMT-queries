; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67006 () Bool)

(assert start!67006)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!430419 () Bool)

(declare-datatypes ((SeekEntryResult!7912 0))(
  ( (MissingZero!7912 (index!34016 (_ BitVec 32))) (Found!7912 (index!34017 (_ BitVec 32))) (Intermediate!7912 (undefined!8724 Bool) (index!34018 (_ BitVec 32)) (x!64955 (_ BitVec 32))) (Undefined!7912) (MissingVacant!7912 (index!34019 (_ BitVec 32))) )
))
(declare-fun lt!344269 () SeekEntryResult!7912)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42430 0))(
  ( (array!42431 (arr!20312 (Array (_ BitVec 32) (_ BitVec 64))) (size!20733 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42430)

(declare-fun b!773180 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42430 (_ BitVec 32)) SeekEntryResult!7912)

(assert (=> b!773180 (= e!430419 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344269))))

(declare-fun b!773181 () Bool)

(declare-fun e!430421 () Bool)

(assert (=> b!773181 (= e!430421 true)))

(declare-datatypes ((Unit!26662 0))(
  ( (Unit!26663) )
))
(declare-fun lt!344267 () Unit!26662)

(declare-fun e!430413 () Unit!26662)

(assert (=> b!773181 (= lt!344267 e!430413)))

(declare-fun c!85552 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773181 (= c!85552 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!344272 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773181 (= lt!344272 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!344271 () SeekEntryResult!7912)

(declare-fun e!430414 () Bool)

(declare-fun b!773182 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42430 (_ BitVec 32)) SeekEntryResult!7912)

(assert (=> b!773182 (= e!430414 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344271))))

(declare-fun b!773183 () Bool)

(declare-fun res!522880 () Bool)

(declare-fun e!430418 () Bool)

(assert (=> b!773183 (=> (not res!522880) (not e!430418))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773183 (= res!522880 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773184 () Bool)

(assert (=> b!773184 (= e!430419 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) (Found!7912 j!159)))))

(declare-fun b!773185 () Bool)

(declare-fun res!522877 () Bool)

(assert (=> b!773185 (=> (not res!522877) (not e!430418))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773185 (= res!522877 (and (= (size!20733 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20733 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20733 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773186 () Bool)

(declare-fun res!522890 () Bool)

(declare-fun e!430416 () Bool)

(assert (=> b!773186 (=> (not res!522890) (not e!430416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42430 (_ BitVec 32)) Bool)

(assert (=> b!773186 (= res!522890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773187 () Bool)

(declare-fun res!522881 () Bool)

(assert (=> b!773187 (=> (not res!522881) (not e!430416))))

(assert (=> b!773187 (= res!522881 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20733 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20733 a!3186))))))

(declare-fun b!773188 () Bool)

(declare-fun e!430412 () Bool)

(declare-fun e!430420 () Bool)

(assert (=> b!773188 (= e!430412 e!430420)))

(declare-fun res!522883 () Bool)

(assert (=> b!773188 (=> (not res!522883) (not e!430420))))

(declare-fun lt!344274 () SeekEntryResult!7912)

(declare-fun lt!344270 () SeekEntryResult!7912)

(assert (=> b!773188 (= res!522883 (= lt!344274 lt!344270))))

(declare-fun lt!344275 () (_ BitVec 64))

(declare-fun lt!344266 () array!42430)

(assert (=> b!773188 (= lt!344270 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344275 lt!344266 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773188 (= lt!344274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344275 mask!3328) lt!344275 lt!344266 mask!3328))))

(assert (=> b!773188 (= lt!344275 (select (store (arr!20312 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773188 (= lt!344266 (array!42431 (store (arr!20312 a!3186) i!1173 k!2102) (size!20733 a!3186)))))

(declare-fun b!773189 () Bool)

(declare-fun res!522875 () Bool)

(assert (=> b!773189 (=> (not res!522875) (not e!430416))))

(declare-datatypes ((List!14314 0))(
  ( (Nil!14311) (Cons!14310 (h!15415 (_ BitVec 64)) (t!20629 List!14314)) )
))
(declare-fun arrayNoDuplicates!0 (array!42430 (_ BitVec 32) List!14314) Bool)

(assert (=> b!773189 (= res!522875 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14311))))

(declare-fun b!773190 () Bool)

(assert (=> b!773190 (= e!430418 e!430416)))

(declare-fun res!522878 () Bool)

(assert (=> b!773190 (=> (not res!522878) (not e!430416))))

(declare-fun lt!344268 () SeekEntryResult!7912)

(assert (=> b!773190 (= res!522878 (or (= lt!344268 (MissingZero!7912 i!1173)) (= lt!344268 (MissingVacant!7912 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42430 (_ BitVec 32)) SeekEntryResult!7912)

(assert (=> b!773190 (= lt!344268 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773191 () Bool)

(declare-fun res!522889 () Bool)

(assert (=> b!773191 (=> (not res!522889) (not e!430412))))

(assert (=> b!773191 (= res!522889 e!430419)))

(declare-fun c!85551 () Bool)

(assert (=> b!773191 (= c!85551 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!522876 () Bool)

(assert (=> start!67006 (=> (not res!522876) (not e!430418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67006 (= res!522876 (validMask!0 mask!3328))))

(assert (=> start!67006 e!430418))

(assert (=> start!67006 true))

(declare-fun array_inv!16108 (array!42430) Bool)

(assert (=> start!67006 (array_inv!16108 a!3186)))

(declare-fun b!773192 () Bool)

(declare-fun Unit!26664 () Unit!26662)

(assert (=> b!773192 (= e!430413 Unit!26664)))

(declare-fun lt!344276 () SeekEntryResult!7912)

(assert (=> b!773192 (= lt!344276 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20312 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773192 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344272 resIntermediateIndex!5 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) (Found!7912 j!159))))

(declare-fun b!773193 () Bool)

(declare-fun Unit!26665 () Unit!26662)

(assert (=> b!773193 (= e!430413 Unit!26665)))

(assert (=> b!773193 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344272 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344269)))

(declare-fun b!773194 () Bool)

(assert (=> b!773194 (= e!430416 e!430412)))

(declare-fun res!522886 () Bool)

(assert (=> b!773194 (=> (not res!522886) (not e!430412))))

(assert (=> b!773194 (= res!522886 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20312 a!3186) j!159) mask!3328) (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344269))))

(assert (=> b!773194 (= lt!344269 (Intermediate!7912 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773195 () Bool)

(declare-fun res!522885 () Bool)

(assert (=> b!773195 (=> (not res!522885) (not e!430412))))

(assert (=> b!773195 (= res!522885 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20312 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773196 () Bool)

(declare-fun res!522882 () Bool)

(assert (=> b!773196 (=> (not res!522882) (not e!430418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773196 (= res!522882 (validKeyInArray!0 (select (arr!20312 a!3186) j!159)))))

(declare-fun b!773197 () Bool)

(declare-fun e!430415 () Bool)

(assert (=> b!773197 (= e!430415 e!430414)))

(declare-fun res!522887 () Bool)

(assert (=> b!773197 (=> (not res!522887) (not e!430414))))

(assert (=> b!773197 (= res!522887 (= (seekEntryOrOpen!0 (select (arr!20312 a!3186) j!159) a!3186 mask!3328) lt!344271))))

(assert (=> b!773197 (= lt!344271 (Found!7912 j!159))))

(declare-fun b!773198 () Bool)

(declare-fun res!522879 () Bool)

(assert (=> b!773198 (=> (not res!522879) (not e!430418))))

(assert (=> b!773198 (= res!522879 (validKeyInArray!0 k!2102))))

(declare-fun b!773199 () Bool)

(assert (=> b!773199 (= e!430420 (not e!430421))))

(declare-fun res!522888 () Bool)

(assert (=> b!773199 (=> res!522888 e!430421)))

(assert (=> b!773199 (= res!522888 (or (not (is-Intermediate!7912 lt!344270)) (bvsge x!1131 (x!64955 lt!344270))))))

(assert (=> b!773199 e!430415))

(declare-fun res!522884 () Bool)

(assert (=> b!773199 (=> (not res!522884) (not e!430415))))

(assert (=> b!773199 (= res!522884 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344273 () Unit!26662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42430 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26662)

(assert (=> b!773199 (= lt!344273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67006 res!522876) b!773185))

(assert (= (and b!773185 res!522877) b!773196))

(assert (= (and b!773196 res!522882) b!773198))

(assert (= (and b!773198 res!522879) b!773183))

(assert (= (and b!773183 res!522880) b!773190))

(assert (= (and b!773190 res!522878) b!773186))

(assert (= (and b!773186 res!522890) b!773189))

(assert (= (and b!773189 res!522875) b!773187))

(assert (= (and b!773187 res!522881) b!773194))

(assert (= (and b!773194 res!522886) b!773195))

(assert (= (and b!773195 res!522885) b!773191))

(assert (= (and b!773191 c!85551) b!773180))

(assert (= (and b!773191 (not c!85551)) b!773184))

(assert (= (and b!773191 res!522889) b!773188))

(assert (= (and b!773188 res!522883) b!773199))

(assert (= (and b!773199 res!522884) b!773197))

(assert (= (and b!773197 res!522887) b!773182))

(assert (= (and b!773199 (not res!522888)) b!773181))

(assert (= (and b!773181 c!85552) b!773193))

(assert (= (and b!773181 (not c!85552)) b!773192))

(declare-fun m!717943 () Bool)

(assert (=> b!773193 m!717943))

(assert (=> b!773193 m!717943))

(declare-fun m!717945 () Bool)

(assert (=> b!773193 m!717945))

(declare-fun m!717947 () Bool)

(assert (=> b!773188 m!717947))

(declare-fun m!717949 () Bool)

(assert (=> b!773188 m!717949))

(declare-fun m!717951 () Bool)

(assert (=> b!773188 m!717951))

(assert (=> b!773188 m!717947))

(declare-fun m!717953 () Bool)

(assert (=> b!773188 m!717953))

(declare-fun m!717955 () Bool)

(assert (=> b!773188 m!717955))

(declare-fun m!717957 () Bool)

(assert (=> b!773183 m!717957))

(declare-fun m!717959 () Bool)

(assert (=> start!67006 m!717959))

(declare-fun m!717961 () Bool)

(assert (=> start!67006 m!717961))

(assert (=> b!773192 m!717943))

(assert (=> b!773192 m!717943))

(declare-fun m!717963 () Bool)

(assert (=> b!773192 m!717963))

(assert (=> b!773192 m!717943))

(declare-fun m!717965 () Bool)

(assert (=> b!773192 m!717965))

(declare-fun m!717967 () Bool)

(assert (=> b!773195 m!717967))

(assert (=> b!773196 m!717943))

(assert (=> b!773196 m!717943))

(declare-fun m!717969 () Bool)

(assert (=> b!773196 m!717969))

(assert (=> b!773182 m!717943))

(assert (=> b!773182 m!717943))

(declare-fun m!717971 () Bool)

(assert (=> b!773182 m!717971))

(declare-fun m!717973 () Bool)

(assert (=> b!773186 m!717973))

(declare-fun m!717975 () Bool)

(assert (=> b!773181 m!717975))

(declare-fun m!717977 () Bool)

(assert (=> b!773189 m!717977))

(declare-fun m!717979 () Bool)

(assert (=> b!773199 m!717979))

(declare-fun m!717981 () Bool)

(assert (=> b!773199 m!717981))

(declare-fun m!717983 () Bool)

(assert (=> b!773190 m!717983))

(assert (=> b!773180 m!717943))

(assert (=> b!773180 m!717943))

(declare-fun m!717985 () Bool)

(assert (=> b!773180 m!717985))

(declare-fun m!717987 () Bool)

(assert (=> b!773198 m!717987))

(assert (=> b!773197 m!717943))

(assert (=> b!773197 m!717943))

(declare-fun m!717989 () Bool)

(assert (=> b!773197 m!717989))

(assert (=> b!773184 m!717943))

(assert (=> b!773184 m!717943))

(assert (=> b!773184 m!717963))

(assert (=> b!773194 m!717943))

(assert (=> b!773194 m!717943))

(declare-fun m!717991 () Bool)

(assert (=> b!773194 m!717991))

(assert (=> b!773194 m!717991))

(assert (=> b!773194 m!717943))

(declare-fun m!717993 () Bool)

(assert (=> b!773194 m!717993))

(push 1)

