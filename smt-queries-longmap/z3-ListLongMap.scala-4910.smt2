; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67706 () Bool)

(assert start!67706)

(declare-fun b!785069 () Bool)

(declare-fun e!436461 () Bool)

(declare-fun e!436468 () Bool)

(assert (=> b!785069 (= e!436461 (not e!436468))))

(declare-fun res!531368 () Bool)

(assert (=> b!785069 (=> res!531368 e!436468)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8061 0))(
  ( (MissingZero!8061 (index!34612 (_ BitVec 32))) (Found!8061 (index!34613 (_ BitVec 32))) (Intermediate!8061 (undefined!8873 Bool) (index!34614 (_ BitVec 32)) (x!65561 (_ BitVec 32))) (Undefined!8061) (MissingVacant!8061 (index!34615 (_ BitVec 32))) )
))
(declare-fun lt!350021 () SeekEntryResult!8061)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!785069 (= res!531368 (or (not ((_ is Intermediate!8061) lt!350021)) (bvslt x!1131 (x!65561 lt!350021)) (not (= x!1131 (x!65561 lt!350021))) (not (= index!1321 (index!34614 lt!350021)))))))

(declare-fun e!436463 () Bool)

(assert (=> b!785069 e!436463))

(declare-fun res!531362 () Bool)

(assert (=> b!785069 (=> (not res!531362) (not e!436463))))

(declare-fun lt!350015 () SeekEntryResult!8061)

(declare-fun lt!350014 () SeekEntryResult!8061)

(assert (=> b!785069 (= res!531362 (= lt!350015 lt!350014))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!785069 (= lt!350014 (Found!8061 j!159))))

(declare-datatypes ((array!42746 0))(
  ( (array!42747 (arr!20461 (Array (_ BitVec 32) (_ BitVec 64))) (size!20882 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42746)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42746 (_ BitVec 32)) SeekEntryResult!8061)

(assert (=> b!785069 (= lt!350015 (seekEntryOrOpen!0 (select (arr!20461 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42746 (_ BitVec 32)) Bool)

(assert (=> b!785069 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27132 0))(
  ( (Unit!27133) )
))
(declare-fun lt!350019 () Unit!27132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27132)

(assert (=> b!785069 (= lt!350019 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785070 () Bool)

(declare-fun res!531359 () Bool)

(declare-fun e!436469 () Bool)

(assert (=> b!785070 (=> (not res!531359) (not e!436469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785070 (= res!531359 (validKeyInArray!0 (select (arr!20461 a!3186) j!159)))))

(declare-fun b!785071 () Bool)

(declare-fun res!531373 () Bool)

(assert (=> b!785071 (=> (not res!531373) (not e!436469))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785071 (= res!531373 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!785072 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42746 (_ BitVec 32)) SeekEntryResult!8061)

(assert (=> b!785072 (= e!436463 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20461 a!3186) j!159) a!3186 mask!3328) lt!350014))))

(declare-fun e!436466 () Bool)

(declare-fun b!785073 () Bool)

(declare-fun lt!350018 () SeekEntryResult!8061)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42746 (_ BitVec 32)) SeekEntryResult!8061)

(assert (=> b!785073 (= e!436466 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20461 a!3186) j!159) a!3186 mask!3328) lt!350018))))

(declare-fun b!785074 () Bool)

(declare-fun res!531369 () Bool)

(declare-fun e!436464 () Bool)

(assert (=> b!785074 (=> (not res!531369) (not e!436464))))

(assert (=> b!785074 (= res!531369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785075 () Bool)

(declare-fun res!531360 () Bool)

(declare-fun e!436472 () Bool)

(assert (=> b!785075 (=> (not res!531360) (not e!436472))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785075 (= res!531360 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20461 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785076 () Bool)

(declare-fun res!531358 () Bool)

(assert (=> b!785076 (=> (not res!531358) (not e!436464))))

(assert (=> b!785076 (= res!531358 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20882 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20882 a!3186))))))

(declare-fun res!531364 () Bool)

(assert (=> start!67706 (=> (not res!531364) (not e!436469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67706 (= res!531364 (validMask!0 mask!3328))))

(assert (=> start!67706 e!436469))

(assert (=> start!67706 true))

(declare-fun array_inv!16257 (array!42746) Bool)

(assert (=> start!67706 (array_inv!16257 a!3186)))

(declare-fun b!785077 () Bool)

(declare-fun res!531365 () Bool)

(declare-fun e!436471 () Bool)

(assert (=> b!785077 (=> (not res!531365) (not e!436471))))

(declare-fun lt!350013 () array!42746)

(declare-fun lt!350022 () (_ BitVec 64))

(assert (=> b!785077 (= res!531365 (= (seekEntryOrOpen!0 lt!350022 lt!350013 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350022 lt!350013 mask!3328)))))

(declare-fun b!785078 () Bool)

(declare-fun res!531357 () Bool)

(assert (=> b!785078 (=> (not res!531357) (not e!436472))))

(assert (=> b!785078 (= res!531357 e!436466)))

(declare-fun c!87265 () Bool)

(assert (=> b!785078 (= c!87265 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785079 () Bool)

(declare-fun e!436465 () Bool)

(assert (=> b!785079 (= e!436468 e!436465)))

(declare-fun res!531371 () Bool)

(assert (=> b!785079 (=> res!531371 e!436465)))

(declare-fun lt!350016 () SeekEntryResult!8061)

(assert (=> b!785079 (= res!531371 (not (= lt!350016 lt!350014)))))

(assert (=> b!785079 (= lt!350016 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20461 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785080 () Bool)

(declare-fun res!531363 () Bool)

(assert (=> b!785080 (=> (not res!531363) (not e!436464))))

(declare-datatypes ((List!14463 0))(
  ( (Nil!14460) (Cons!14459 (h!15582 (_ BitVec 64)) (t!20778 List!14463)) )
))
(declare-fun arrayNoDuplicates!0 (array!42746 (_ BitVec 32) List!14463) Bool)

(assert (=> b!785080 (= res!531363 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14460))))

(declare-fun b!785081 () Bool)

(assert (=> b!785081 (= e!436464 e!436472)))

(declare-fun res!531374 () Bool)

(assert (=> b!785081 (=> (not res!531374) (not e!436472))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785081 (= res!531374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20461 a!3186) j!159) mask!3328) (select (arr!20461 a!3186) j!159) a!3186 mask!3328) lt!350018))))

(assert (=> b!785081 (= lt!350018 (Intermediate!8061 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785082 () Bool)

(declare-fun res!531372 () Bool)

(assert (=> b!785082 (=> (not res!531372) (not e!436469))))

(assert (=> b!785082 (= res!531372 (validKeyInArray!0 k0!2102))))

(declare-fun b!785083 () Bool)

(assert (=> b!785083 (= e!436469 e!436464)))

(declare-fun res!531367 () Bool)

(assert (=> b!785083 (=> (not res!531367) (not e!436464))))

(declare-fun lt!350017 () SeekEntryResult!8061)

(assert (=> b!785083 (= res!531367 (or (= lt!350017 (MissingZero!8061 i!1173)) (= lt!350017 (MissingVacant!8061 i!1173))))))

(assert (=> b!785083 (= lt!350017 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785084 () Bool)

(declare-fun e!436467 () Unit!27132)

(declare-fun Unit!27134 () Unit!27132)

(assert (=> b!785084 (= e!436467 Unit!27134)))

(declare-fun b!785085 () Bool)

(assert (=> b!785085 (= e!436472 e!436461)))

(declare-fun res!531356 () Bool)

(assert (=> b!785085 (=> (not res!531356) (not e!436461))))

(declare-fun lt!350020 () SeekEntryResult!8061)

(assert (=> b!785085 (= res!531356 (= lt!350020 lt!350021))))

(assert (=> b!785085 (= lt!350021 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350022 lt!350013 mask!3328))))

(assert (=> b!785085 (= lt!350020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350022 mask!3328) lt!350022 lt!350013 mask!3328))))

(assert (=> b!785085 (= lt!350022 (select (store (arr!20461 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785085 (= lt!350013 (array!42747 (store (arr!20461 a!3186) i!1173 k0!2102) (size!20882 a!3186)))))

(declare-fun b!785086 () Bool)

(declare-fun res!531370 () Bool)

(assert (=> b!785086 (=> (not res!531370) (not e!436469))))

(assert (=> b!785086 (= res!531370 (and (= (size!20882 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20882 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20882 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785087 () Bool)

(assert (=> b!785087 (= e!436471 (= lt!350015 lt!350016))))

(declare-fun b!785088 () Bool)

(declare-fun Unit!27135 () Unit!27132)

(assert (=> b!785088 (= e!436467 Unit!27135)))

(assert (=> b!785088 false))

(declare-fun b!785089 () Bool)

(assert (=> b!785089 (= e!436466 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20461 a!3186) j!159) a!3186 mask!3328) (Found!8061 j!159)))))

(declare-fun b!785090 () Bool)

(declare-fun e!436470 () Bool)

(assert (=> b!785090 (= e!436465 e!436470)))

(declare-fun res!531361 () Bool)

(assert (=> b!785090 (=> res!531361 e!436470)))

(declare-fun lt!350023 () (_ BitVec 64))

(assert (=> b!785090 (= res!531361 (= lt!350023 lt!350022))))

(assert (=> b!785090 (= lt!350023 (select (store (arr!20461 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785091 () Bool)

(assert (=> b!785091 (= e!436470 true)))

(assert (=> b!785091 e!436471))

(declare-fun res!531366 () Bool)

(assert (=> b!785091 (=> (not res!531366) (not e!436471))))

(assert (=> b!785091 (= res!531366 (= lt!350023 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350024 () Unit!27132)

(assert (=> b!785091 (= lt!350024 e!436467)))

(declare-fun c!87264 () Bool)

(assert (=> b!785091 (= c!87264 (= lt!350023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!67706 res!531364) b!785086))

(assert (= (and b!785086 res!531370) b!785070))

(assert (= (and b!785070 res!531359) b!785082))

(assert (= (and b!785082 res!531372) b!785071))

(assert (= (and b!785071 res!531373) b!785083))

(assert (= (and b!785083 res!531367) b!785074))

(assert (= (and b!785074 res!531369) b!785080))

(assert (= (and b!785080 res!531363) b!785076))

(assert (= (and b!785076 res!531358) b!785081))

(assert (= (and b!785081 res!531374) b!785075))

(assert (= (and b!785075 res!531360) b!785078))

(assert (= (and b!785078 c!87265) b!785073))

(assert (= (and b!785078 (not c!87265)) b!785089))

(assert (= (and b!785078 res!531357) b!785085))

(assert (= (and b!785085 res!531356) b!785069))

(assert (= (and b!785069 res!531362) b!785072))

(assert (= (and b!785069 (not res!531368)) b!785079))

(assert (= (and b!785079 (not res!531371)) b!785090))

(assert (= (and b!785090 (not res!531361)) b!785091))

(assert (= (and b!785091 c!87264) b!785088))

(assert (= (and b!785091 (not c!87264)) b!785084))

(assert (= (and b!785091 res!531366) b!785077))

(assert (= (and b!785077 res!531365) b!785087))

(declare-fun m!727233 () Bool)

(assert (=> b!785075 m!727233))

(declare-fun m!727235 () Bool)

(assert (=> b!785077 m!727235))

(declare-fun m!727237 () Bool)

(assert (=> b!785077 m!727237))

(declare-fun m!727239 () Bool)

(assert (=> b!785071 m!727239))

(declare-fun m!727241 () Bool)

(assert (=> b!785072 m!727241))

(assert (=> b!785072 m!727241))

(declare-fun m!727243 () Bool)

(assert (=> b!785072 m!727243))

(declare-fun m!727245 () Bool)

(assert (=> b!785080 m!727245))

(assert (=> b!785079 m!727241))

(assert (=> b!785079 m!727241))

(declare-fun m!727247 () Bool)

(assert (=> b!785079 m!727247))

(declare-fun m!727249 () Bool)

(assert (=> b!785082 m!727249))

(assert (=> b!785073 m!727241))

(assert (=> b!785073 m!727241))

(declare-fun m!727251 () Bool)

(assert (=> b!785073 m!727251))

(assert (=> b!785070 m!727241))

(assert (=> b!785070 m!727241))

(declare-fun m!727253 () Bool)

(assert (=> b!785070 m!727253))

(declare-fun m!727255 () Bool)

(assert (=> b!785074 m!727255))

(declare-fun m!727257 () Bool)

(assert (=> start!67706 m!727257))

(declare-fun m!727259 () Bool)

(assert (=> start!67706 m!727259))

(assert (=> b!785081 m!727241))

(assert (=> b!785081 m!727241))

(declare-fun m!727261 () Bool)

(assert (=> b!785081 m!727261))

(assert (=> b!785081 m!727261))

(assert (=> b!785081 m!727241))

(declare-fun m!727263 () Bool)

(assert (=> b!785081 m!727263))

(declare-fun m!727265 () Bool)

(assert (=> b!785083 m!727265))

(declare-fun m!727267 () Bool)

(assert (=> b!785085 m!727267))

(declare-fun m!727269 () Bool)

(assert (=> b!785085 m!727269))

(assert (=> b!785085 m!727269))

(declare-fun m!727271 () Bool)

(assert (=> b!785085 m!727271))

(declare-fun m!727273 () Bool)

(assert (=> b!785085 m!727273))

(declare-fun m!727275 () Bool)

(assert (=> b!785085 m!727275))

(assert (=> b!785089 m!727241))

(assert (=> b!785089 m!727241))

(assert (=> b!785089 m!727247))

(assert (=> b!785069 m!727241))

(assert (=> b!785069 m!727241))

(declare-fun m!727277 () Bool)

(assert (=> b!785069 m!727277))

(declare-fun m!727279 () Bool)

(assert (=> b!785069 m!727279))

(declare-fun m!727281 () Bool)

(assert (=> b!785069 m!727281))

(assert (=> b!785090 m!727273))

(declare-fun m!727283 () Bool)

(assert (=> b!785090 m!727283))

(check-sat (not b!785073) (not b!785077) (not b!785079) (not b!785069) (not start!67706) (not b!785074) (not b!785089) (not b!785083) (not b!785082) (not b!785070) (not b!785071) (not b!785072) (not b!785080) (not b!785085) (not b!785081))
(check-sat)
