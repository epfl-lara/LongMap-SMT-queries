; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67704 () Bool)

(assert start!67704)

(declare-fun b!785001 () Bool)

(declare-fun res!531309 () Bool)

(declare-fun e!436429 () Bool)

(assert (=> b!785001 (=> (not res!531309) (not e!436429))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42744 0))(
  ( (array!42745 (arr!20460 (Array (_ BitVec 32) (_ BitVec 64))) (size!20881 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42744)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785001 (= res!531309 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20460 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785002 () Bool)

(declare-fun e!436432 () Bool)

(assert (=> b!785002 (= e!436432 true)))

(declare-fun e!436434 () Bool)

(assert (=> b!785002 e!436434))

(declare-fun res!531312 () Bool)

(assert (=> b!785002 (=> (not res!531312) (not e!436434))))

(declare-fun lt!349984 () (_ BitVec 64))

(assert (=> b!785002 (= res!531312 (= lt!349984 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27128 0))(
  ( (Unit!27129) )
))
(declare-fun lt!349978 () Unit!27128)

(declare-fun e!436427 () Unit!27128)

(assert (=> b!785002 (= lt!349978 e!436427)))

(declare-fun c!87258 () Bool)

(assert (=> b!785002 (= c!87258 (= lt!349984 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785003 () Bool)

(declare-fun Unit!27130 () Unit!27128)

(assert (=> b!785003 (= e!436427 Unit!27130)))

(declare-fun b!785004 () Bool)

(declare-fun res!531310 () Bool)

(declare-fun e!436428 () Bool)

(assert (=> b!785004 (=> (not res!531310) (not e!436428))))

(declare-datatypes ((List!14462 0))(
  ( (Nil!14459) (Cons!14458 (h!15581 (_ BitVec 64)) (t!20777 List!14462)) )
))
(declare-fun arrayNoDuplicates!0 (array!42744 (_ BitVec 32) List!14462) Bool)

(assert (=> b!785004 (= res!531310 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14459))))

(declare-fun b!785005 () Bool)

(declare-fun res!531302 () Bool)

(assert (=> b!785005 (=> (not res!531302) (not e!436428))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42744 (_ BitVec 32)) Bool)

(assert (=> b!785005 (= res!531302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785006 () Bool)

(declare-fun res!531305 () Bool)

(declare-fun e!436425 () Bool)

(assert (=> b!785006 (=> (not res!531305) (not e!436425))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785006 (= res!531305 (validKeyInArray!0 k!2102))))

(declare-fun b!785007 () Bool)

(declare-fun res!531306 () Bool)

(assert (=> b!785007 (=> (not res!531306) (not e!436428))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!785007 (= res!531306 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20881 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20881 a!3186))))))

(declare-fun b!785008 () Bool)

(declare-datatypes ((SeekEntryResult!8060 0))(
  ( (MissingZero!8060 (index!34608 (_ BitVec 32))) (Found!8060 (index!34609 (_ BitVec 32))) (Intermediate!8060 (undefined!8872 Bool) (index!34610 (_ BitVec 32)) (x!65560 (_ BitVec 32))) (Undefined!8060) (MissingVacant!8060 (index!34611 (_ BitVec 32))) )
))
(declare-fun lt!349981 () SeekEntryResult!8060)

(declare-fun lt!349979 () SeekEntryResult!8060)

(assert (=> b!785008 (= e!436434 (= lt!349981 lt!349979))))

(declare-fun b!785009 () Bool)

(declare-fun e!436435 () Bool)

(declare-fun e!436430 () Bool)

(assert (=> b!785009 (= e!436435 e!436430)))

(declare-fun res!531301 () Bool)

(assert (=> b!785009 (=> res!531301 e!436430)))

(declare-fun lt!349983 () SeekEntryResult!8060)

(assert (=> b!785009 (= res!531301 (not (= lt!349979 lt!349983)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42744 (_ BitVec 32)) SeekEntryResult!8060)

(assert (=> b!785009 (= lt!349979 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20460 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785010 () Bool)

(declare-fun res!531299 () Bool)

(assert (=> b!785010 (=> (not res!531299) (not e!436434))))

(declare-fun lt!349988 () array!42744)

(declare-fun lt!349982 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42744 (_ BitVec 32)) SeekEntryResult!8060)

(assert (=> b!785010 (= res!531299 (= (seekEntryOrOpen!0 lt!349982 lt!349988 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349982 lt!349988 mask!3328)))))

(declare-fun b!785011 () Bool)

(declare-fun res!531307 () Bool)

(assert (=> b!785011 (=> (not res!531307) (not e!436425))))

(assert (=> b!785011 (= res!531307 (and (= (size!20881 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20881 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20881 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785012 () Bool)

(assert (=> b!785012 (= e!436425 e!436428)))

(declare-fun res!531304 () Bool)

(assert (=> b!785012 (=> (not res!531304) (not e!436428))))

(declare-fun lt!349980 () SeekEntryResult!8060)

(assert (=> b!785012 (= res!531304 (or (= lt!349980 (MissingZero!8060 i!1173)) (= lt!349980 (MissingVacant!8060 i!1173))))))

(assert (=> b!785012 (= lt!349980 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!785000 () Bool)

(declare-fun e!436426 () Bool)

(assert (=> b!785000 (= e!436426 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20460 a!3186) j!159) a!3186 mask!3328) (Found!8060 j!159)))))

(declare-fun res!531313 () Bool)

(assert (=> start!67704 (=> (not res!531313) (not e!436425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67704 (= res!531313 (validMask!0 mask!3328))))

(assert (=> start!67704 e!436425))

(assert (=> start!67704 true))

(declare-fun array_inv!16256 (array!42744) Bool)

(assert (=> start!67704 (array_inv!16256 a!3186)))

(declare-fun b!785013 () Bool)

(assert (=> b!785013 (= e!436430 e!436432)))

(declare-fun res!531316 () Bool)

(assert (=> b!785013 (=> res!531316 e!436432)))

(assert (=> b!785013 (= res!531316 (= lt!349984 lt!349982))))

(assert (=> b!785013 (= lt!349984 (select (store (arr!20460 a!3186) i!1173 k!2102) index!1321))))

(declare-fun lt!349987 () SeekEntryResult!8060)

(declare-fun b!785014 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42744 (_ BitVec 32)) SeekEntryResult!8060)

(assert (=> b!785014 (= e!436426 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20460 a!3186) j!159) a!3186 mask!3328) lt!349987))))

(declare-fun b!785015 () Bool)

(declare-fun e!436436 () Bool)

(assert (=> b!785015 (= e!436436 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20460 a!3186) j!159) a!3186 mask!3328) lt!349983))))

(declare-fun b!785016 () Bool)

(declare-fun e!436431 () Bool)

(assert (=> b!785016 (= e!436429 e!436431)))

(declare-fun res!531303 () Bool)

(assert (=> b!785016 (=> (not res!531303) (not e!436431))))

(declare-fun lt!349977 () SeekEntryResult!8060)

(declare-fun lt!349986 () SeekEntryResult!8060)

(assert (=> b!785016 (= res!531303 (= lt!349977 lt!349986))))

(assert (=> b!785016 (= lt!349986 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349982 lt!349988 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785016 (= lt!349977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349982 mask!3328) lt!349982 lt!349988 mask!3328))))

(assert (=> b!785016 (= lt!349982 (select (store (arr!20460 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785016 (= lt!349988 (array!42745 (store (arr!20460 a!3186) i!1173 k!2102) (size!20881 a!3186)))))

(declare-fun b!785017 () Bool)

(declare-fun res!531317 () Bool)

(assert (=> b!785017 (=> (not res!531317) (not e!436425))))

(assert (=> b!785017 (= res!531317 (validKeyInArray!0 (select (arr!20460 a!3186) j!159)))))

(declare-fun b!785018 () Bool)

(declare-fun res!531300 () Bool)

(assert (=> b!785018 (=> (not res!531300) (not e!436425))))

(declare-fun arrayContainsKey!0 (array!42744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785018 (= res!531300 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785019 () Bool)

(assert (=> b!785019 (= e!436428 e!436429)))

(declare-fun res!531308 () Bool)

(assert (=> b!785019 (=> (not res!531308) (not e!436429))))

(assert (=> b!785019 (= res!531308 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20460 a!3186) j!159) mask!3328) (select (arr!20460 a!3186) j!159) a!3186 mask!3328) lt!349987))))

(assert (=> b!785019 (= lt!349987 (Intermediate!8060 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785020 () Bool)

(declare-fun res!531315 () Bool)

(assert (=> b!785020 (=> (not res!531315) (not e!436429))))

(assert (=> b!785020 (= res!531315 e!436426)))

(declare-fun c!87259 () Bool)

(assert (=> b!785020 (= c!87259 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785021 () Bool)

(declare-fun Unit!27131 () Unit!27128)

(assert (=> b!785021 (= e!436427 Unit!27131)))

(assert (=> b!785021 false))

(declare-fun b!785022 () Bool)

(assert (=> b!785022 (= e!436431 (not e!436435))))

(declare-fun res!531311 () Bool)

(assert (=> b!785022 (=> res!531311 e!436435)))

(assert (=> b!785022 (= res!531311 (or (not (is-Intermediate!8060 lt!349986)) (bvslt x!1131 (x!65560 lt!349986)) (not (= x!1131 (x!65560 lt!349986))) (not (= index!1321 (index!34610 lt!349986)))))))

(assert (=> b!785022 e!436436))

(declare-fun res!531314 () Bool)

(assert (=> b!785022 (=> (not res!531314) (not e!436436))))

(assert (=> b!785022 (= res!531314 (= lt!349981 lt!349983))))

(assert (=> b!785022 (= lt!349983 (Found!8060 j!159))))

(assert (=> b!785022 (= lt!349981 (seekEntryOrOpen!0 (select (arr!20460 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785022 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349985 () Unit!27128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27128)

(assert (=> b!785022 (= lt!349985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67704 res!531313) b!785011))

(assert (= (and b!785011 res!531307) b!785017))

(assert (= (and b!785017 res!531317) b!785006))

(assert (= (and b!785006 res!531305) b!785018))

(assert (= (and b!785018 res!531300) b!785012))

(assert (= (and b!785012 res!531304) b!785005))

(assert (= (and b!785005 res!531302) b!785004))

(assert (= (and b!785004 res!531310) b!785007))

(assert (= (and b!785007 res!531306) b!785019))

(assert (= (and b!785019 res!531308) b!785001))

(assert (= (and b!785001 res!531309) b!785020))

(assert (= (and b!785020 c!87259) b!785014))

(assert (= (and b!785020 (not c!87259)) b!785000))

(assert (= (and b!785020 res!531315) b!785016))

(assert (= (and b!785016 res!531303) b!785022))

(assert (= (and b!785022 res!531314) b!785015))

(assert (= (and b!785022 (not res!531311)) b!785009))

(assert (= (and b!785009 (not res!531301)) b!785013))

(assert (= (and b!785013 (not res!531316)) b!785002))

(assert (= (and b!785002 c!87258) b!785021))

(assert (= (and b!785002 (not c!87258)) b!785003))

(assert (= (and b!785002 res!531312) b!785010))

(assert (= (and b!785010 res!531299) b!785008))

(declare-fun m!727181 () Bool)

(assert (=> b!785019 m!727181))

(assert (=> b!785019 m!727181))

(declare-fun m!727183 () Bool)

(assert (=> b!785019 m!727183))

(assert (=> b!785019 m!727183))

(assert (=> b!785019 m!727181))

(declare-fun m!727185 () Bool)

(assert (=> b!785019 m!727185))

(declare-fun m!727187 () Bool)

(assert (=> b!785013 m!727187))

(declare-fun m!727189 () Bool)

(assert (=> b!785013 m!727189))

(declare-fun m!727191 () Bool)

(assert (=> b!785018 m!727191))

(declare-fun m!727193 () Bool)

(assert (=> b!785005 m!727193))

(declare-fun m!727195 () Bool)

(assert (=> b!785004 m!727195))

(declare-fun m!727197 () Bool)

(assert (=> b!785012 m!727197))

(declare-fun m!727199 () Bool)

(assert (=> b!785010 m!727199))

(declare-fun m!727201 () Bool)

(assert (=> b!785010 m!727201))

(declare-fun m!727203 () Bool)

(assert (=> b!785001 m!727203))

(assert (=> b!785000 m!727181))

(assert (=> b!785000 m!727181))

(declare-fun m!727205 () Bool)

(assert (=> b!785000 m!727205))

(assert (=> b!785009 m!727181))

(assert (=> b!785009 m!727181))

(assert (=> b!785009 m!727205))

(declare-fun m!727207 () Bool)

(assert (=> b!785016 m!727207))

(assert (=> b!785016 m!727187))

(declare-fun m!727209 () Bool)

(assert (=> b!785016 m!727209))

(assert (=> b!785016 m!727207))

(declare-fun m!727211 () Bool)

(assert (=> b!785016 m!727211))

(declare-fun m!727213 () Bool)

(assert (=> b!785016 m!727213))

(assert (=> b!785014 m!727181))

(assert (=> b!785014 m!727181))

(declare-fun m!727215 () Bool)

(assert (=> b!785014 m!727215))

(assert (=> b!785017 m!727181))

(assert (=> b!785017 m!727181))

(declare-fun m!727217 () Bool)

(assert (=> b!785017 m!727217))

(assert (=> b!785022 m!727181))

(assert (=> b!785022 m!727181))

(declare-fun m!727219 () Bool)

(assert (=> b!785022 m!727219))

(declare-fun m!727221 () Bool)

(assert (=> b!785022 m!727221))

(declare-fun m!727223 () Bool)

(assert (=> b!785022 m!727223))

(declare-fun m!727225 () Bool)

(assert (=> b!785006 m!727225))

(assert (=> b!785015 m!727181))

(assert (=> b!785015 m!727181))

(declare-fun m!727227 () Bool)

(assert (=> b!785015 m!727227))

(declare-fun m!727229 () Bool)

(assert (=> start!67704 m!727229))

(declare-fun m!727231 () Bool)

(assert (=> start!67704 m!727231))

(push 1)

