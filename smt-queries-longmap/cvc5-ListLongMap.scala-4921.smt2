; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67770 () Bool)

(assert start!67770)

(declare-fun b!787277 () Bool)

(declare-fun res!533198 () Bool)

(declare-fun e!437618 () Bool)

(assert (=> b!787277 (=> (not res!533198) (not e!437618))))

(declare-datatypes ((array!42810 0))(
  ( (array!42811 (arr!20493 (Array (_ BitVec 32) (_ BitVec 64))) (size!20914 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42810)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787277 (= res!533198 (and (= (size!20914 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20914 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20914 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787278 () Bool)

(declare-fun e!437613 () Bool)

(declare-fun e!437614 () Bool)

(assert (=> b!787278 (= e!437613 e!437614)))

(declare-fun res!533193 () Bool)

(assert (=> b!787278 (=> res!533193 e!437614)))

(declare-fun lt!351168 () (_ BitVec 64))

(declare-fun lt!351170 () (_ BitVec 64))

(assert (=> b!787278 (= res!533193 (= lt!351168 lt!351170))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!787278 (= lt!351168 (select (store (arr!20493 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!787279 () Bool)

(assert (=> b!787279 (= e!437614 true)))

(declare-fun e!437615 () Bool)

(assert (=> b!787279 e!437615))

(declare-fun res!533195 () Bool)

(assert (=> b!787279 (=> (not res!533195) (not e!437615))))

(assert (=> b!787279 (= res!533195 (= lt!351168 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27260 0))(
  ( (Unit!27261) )
))
(declare-fun lt!351175 () Unit!27260)

(declare-fun e!437622 () Unit!27260)

(assert (=> b!787279 (= lt!351175 e!437622)))

(declare-fun c!87457 () Bool)

(assert (=> b!787279 (= c!87457 (= lt!351168 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787280 () Bool)

(declare-fun Unit!27262 () Unit!27260)

(assert (=> b!787280 (= e!437622 Unit!27262)))

(assert (=> b!787280 false))

(declare-fun b!787281 () Bool)

(declare-fun res!533191 () Bool)

(assert (=> b!787281 (=> (not res!533191) (not e!437618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787281 (= res!533191 (validKeyInArray!0 (select (arr!20493 a!3186) j!159)))))

(declare-fun b!787282 () Bool)

(declare-fun e!437620 () Bool)

(assert (=> b!787282 (= e!437620 e!437613)))

(declare-fun res!533196 () Bool)

(assert (=> b!787282 (=> res!533196 e!437613)))

(declare-datatypes ((SeekEntryResult!8093 0))(
  ( (MissingZero!8093 (index!34740 (_ BitVec 32))) (Found!8093 (index!34741 (_ BitVec 32))) (Intermediate!8093 (undefined!8905 Bool) (index!34742 (_ BitVec 32)) (x!65681 (_ BitVec 32))) (Undefined!8093) (MissingVacant!8093 (index!34743 (_ BitVec 32))) )
))
(declare-fun lt!351165 () SeekEntryResult!8093)

(declare-fun lt!351172 () SeekEntryResult!8093)

(assert (=> b!787282 (= res!533196 (not (= lt!351165 lt!351172)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42810 (_ BitVec 32)) SeekEntryResult!8093)

(assert (=> b!787282 (= lt!351165 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20493 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!437621 () Bool)

(declare-fun lt!351174 () SeekEntryResult!8093)

(declare-fun b!787283 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42810 (_ BitVec 32)) SeekEntryResult!8093)

(assert (=> b!787283 (= e!437621 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20493 a!3186) j!159) a!3186 mask!3328) lt!351174))))

(declare-fun b!787284 () Bool)

(declare-fun e!437617 () Bool)

(assert (=> b!787284 (= e!437618 e!437617)))

(declare-fun res!533188 () Bool)

(assert (=> b!787284 (=> (not res!533188) (not e!437617))))

(declare-fun lt!351171 () SeekEntryResult!8093)

(assert (=> b!787284 (= res!533188 (or (= lt!351171 (MissingZero!8093 i!1173)) (= lt!351171 (MissingVacant!8093 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42810 (_ BitVec 32)) SeekEntryResult!8093)

(assert (=> b!787284 (= lt!351171 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787285 () Bool)

(declare-fun e!437616 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787285 (= e!437616 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20493 a!3186) j!159) a!3186 mask!3328) lt!351172))))

(declare-fun b!787286 () Bool)

(declare-fun res!533185 () Bool)

(assert (=> b!787286 (=> (not res!533185) (not e!437618))))

(declare-fun arrayContainsKey!0 (array!42810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787286 (= res!533185 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787287 () Bool)

(declare-fun res!533183 () Bool)

(assert (=> b!787287 (=> (not res!533183) (not e!437617))))

(declare-datatypes ((List!14495 0))(
  ( (Nil!14492) (Cons!14491 (h!15614 (_ BitVec 64)) (t!20810 List!14495)) )
))
(declare-fun arrayNoDuplicates!0 (array!42810 (_ BitVec 32) List!14495) Bool)

(assert (=> b!787287 (= res!533183 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14492))))

(declare-fun b!787288 () Bool)

(declare-fun e!437623 () Bool)

(assert (=> b!787288 (= e!437617 e!437623)))

(declare-fun res!533181 () Bool)

(assert (=> b!787288 (=> (not res!533181) (not e!437623))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787288 (= res!533181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20493 a!3186) j!159) mask!3328) (select (arr!20493 a!3186) j!159) a!3186 mask!3328) lt!351174))))

(assert (=> b!787288 (= lt!351174 (Intermediate!8093 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787289 () Bool)

(assert (=> b!787289 (= e!437621 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20493 a!3186) j!159) a!3186 mask!3328) (Found!8093 j!159)))))

(declare-fun b!787290 () Bool)

(declare-fun res!533194 () Bool)

(assert (=> b!787290 (=> (not res!533194) (not e!437617))))

(assert (=> b!787290 (= res!533194 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20914 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20914 a!3186))))))

(declare-fun res!533180 () Bool)

(assert (=> start!67770 (=> (not res!533180) (not e!437618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67770 (= res!533180 (validMask!0 mask!3328))))

(assert (=> start!67770 e!437618))

(assert (=> start!67770 true))

(declare-fun array_inv!16289 (array!42810) Bool)

(assert (=> start!67770 (array_inv!16289 a!3186)))

(declare-fun b!787291 () Bool)

(declare-fun lt!351167 () SeekEntryResult!8093)

(assert (=> b!787291 (= e!437615 (= lt!351167 lt!351165))))

(declare-fun b!787292 () Bool)

(declare-fun e!437619 () Bool)

(assert (=> b!787292 (= e!437619 (not e!437620))))

(declare-fun res!533192 () Bool)

(assert (=> b!787292 (=> res!533192 e!437620)))

(declare-fun lt!351173 () SeekEntryResult!8093)

(assert (=> b!787292 (= res!533192 (or (not (is-Intermediate!8093 lt!351173)) (bvslt x!1131 (x!65681 lt!351173)) (not (= x!1131 (x!65681 lt!351173))) (not (= index!1321 (index!34742 lt!351173)))))))

(assert (=> b!787292 e!437616))

(declare-fun res!533187 () Bool)

(assert (=> b!787292 (=> (not res!533187) (not e!437616))))

(assert (=> b!787292 (= res!533187 (= lt!351167 lt!351172))))

(assert (=> b!787292 (= lt!351172 (Found!8093 j!159))))

(assert (=> b!787292 (= lt!351167 (seekEntryOrOpen!0 (select (arr!20493 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42810 (_ BitVec 32)) Bool)

(assert (=> b!787292 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351176 () Unit!27260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27260)

(assert (=> b!787292 (= lt!351176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787293 () Bool)

(declare-fun res!533190 () Bool)

(assert (=> b!787293 (=> (not res!533190) (not e!437623))))

(assert (=> b!787293 (= res!533190 e!437621)))

(declare-fun c!87456 () Bool)

(assert (=> b!787293 (= c!87456 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787294 () Bool)

(declare-fun res!533184 () Bool)

(assert (=> b!787294 (=> (not res!533184) (not e!437615))))

(declare-fun lt!351166 () array!42810)

(assert (=> b!787294 (= res!533184 (= (seekEntryOrOpen!0 lt!351170 lt!351166 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351170 lt!351166 mask!3328)))))

(declare-fun b!787295 () Bool)

(assert (=> b!787295 (= e!437623 e!437619)))

(declare-fun res!533182 () Bool)

(assert (=> b!787295 (=> (not res!533182) (not e!437619))))

(declare-fun lt!351169 () SeekEntryResult!8093)

(assert (=> b!787295 (= res!533182 (= lt!351169 lt!351173))))

(assert (=> b!787295 (= lt!351173 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351170 lt!351166 mask!3328))))

(assert (=> b!787295 (= lt!351169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351170 mask!3328) lt!351170 lt!351166 mask!3328))))

(assert (=> b!787295 (= lt!351170 (select (store (arr!20493 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787295 (= lt!351166 (array!42811 (store (arr!20493 a!3186) i!1173 k!2102) (size!20914 a!3186)))))

(declare-fun b!787296 () Bool)

(declare-fun res!533197 () Bool)

(assert (=> b!787296 (=> (not res!533197) (not e!437623))))

(assert (=> b!787296 (= res!533197 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20493 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787297 () Bool)

(declare-fun res!533186 () Bool)

(assert (=> b!787297 (=> (not res!533186) (not e!437617))))

(assert (=> b!787297 (= res!533186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787298 () Bool)

(declare-fun Unit!27263 () Unit!27260)

(assert (=> b!787298 (= e!437622 Unit!27263)))

(declare-fun b!787299 () Bool)

(declare-fun res!533189 () Bool)

(assert (=> b!787299 (=> (not res!533189) (not e!437618))))

(assert (=> b!787299 (= res!533189 (validKeyInArray!0 k!2102))))

(assert (= (and start!67770 res!533180) b!787277))

(assert (= (and b!787277 res!533198) b!787281))

(assert (= (and b!787281 res!533191) b!787299))

(assert (= (and b!787299 res!533189) b!787286))

(assert (= (and b!787286 res!533185) b!787284))

(assert (= (and b!787284 res!533188) b!787297))

(assert (= (and b!787297 res!533186) b!787287))

(assert (= (and b!787287 res!533183) b!787290))

(assert (= (and b!787290 res!533194) b!787288))

(assert (= (and b!787288 res!533181) b!787296))

(assert (= (and b!787296 res!533197) b!787293))

(assert (= (and b!787293 c!87456) b!787283))

(assert (= (and b!787293 (not c!87456)) b!787289))

(assert (= (and b!787293 res!533190) b!787295))

(assert (= (and b!787295 res!533182) b!787292))

(assert (= (and b!787292 res!533187) b!787285))

(assert (= (and b!787292 (not res!533192)) b!787282))

(assert (= (and b!787282 (not res!533196)) b!787278))

(assert (= (and b!787278 (not res!533193)) b!787279))

(assert (= (and b!787279 c!87457) b!787280))

(assert (= (and b!787279 (not c!87457)) b!787298))

(assert (= (and b!787279 res!533195) b!787294))

(assert (= (and b!787294 res!533184) b!787291))

(declare-fun m!728897 () Bool)

(assert (=> b!787294 m!728897))

(declare-fun m!728899 () Bool)

(assert (=> b!787294 m!728899))

(declare-fun m!728901 () Bool)

(assert (=> b!787278 m!728901))

(declare-fun m!728903 () Bool)

(assert (=> b!787278 m!728903))

(declare-fun m!728905 () Bool)

(assert (=> b!787282 m!728905))

(assert (=> b!787282 m!728905))

(declare-fun m!728907 () Bool)

(assert (=> b!787282 m!728907))

(assert (=> b!787289 m!728905))

(assert (=> b!787289 m!728905))

(assert (=> b!787289 m!728907))

(assert (=> b!787283 m!728905))

(assert (=> b!787283 m!728905))

(declare-fun m!728909 () Bool)

(assert (=> b!787283 m!728909))

(declare-fun m!728911 () Bool)

(assert (=> start!67770 m!728911))

(declare-fun m!728913 () Bool)

(assert (=> start!67770 m!728913))

(assert (=> b!787285 m!728905))

(assert (=> b!787285 m!728905))

(declare-fun m!728915 () Bool)

(assert (=> b!787285 m!728915))

(assert (=> b!787292 m!728905))

(assert (=> b!787292 m!728905))

(declare-fun m!728917 () Bool)

(assert (=> b!787292 m!728917))

(declare-fun m!728919 () Bool)

(assert (=> b!787292 m!728919))

(declare-fun m!728921 () Bool)

(assert (=> b!787292 m!728921))

(declare-fun m!728923 () Bool)

(assert (=> b!787284 m!728923))

(declare-fun m!728925 () Bool)

(assert (=> b!787296 m!728925))

(declare-fun m!728927 () Bool)

(assert (=> b!787286 m!728927))

(declare-fun m!728929 () Bool)

(assert (=> b!787287 m!728929))

(assert (=> b!787281 m!728905))

(assert (=> b!787281 m!728905))

(declare-fun m!728931 () Bool)

(assert (=> b!787281 m!728931))

(declare-fun m!728933 () Bool)

(assert (=> b!787297 m!728933))

(declare-fun m!728935 () Bool)

(assert (=> b!787295 m!728935))

(declare-fun m!728937 () Bool)

(assert (=> b!787295 m!728937))

(assert (=> b!787295 m!728901))

(declare-fun m!728939 () Bool)

(assert (=> b!787295 m!728939))

(assert (=> b!787295 m!728937))

(declare-fun m!728941 () Bool)

(assert (=> b!787295 m!728941))

(declare-fun m!728943 () Bool)

(assert (=> b!787299 m!728943))

(assert (=> b!787288 m!728905))

(assert (=> b!787288 m!728905))

(declare-fun m!728945 () Bool)

(assert (=> b!787288 m!728945))

(assert (=> b!787288 m!728945))

(assert (=> b!787288 m!728905))

(declare-fun m!728947 () Bool)

(assert (=> b!787288 m!728947))

(push 1)

