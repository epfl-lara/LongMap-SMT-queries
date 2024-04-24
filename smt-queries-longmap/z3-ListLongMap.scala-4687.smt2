; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65310 () Bool)

(assert start!65310)

(declare-fun lt!327434 () (_ BitVec 32))

(declare-datatypes ((array!41353 0))(
  ( (array!41354 (arr!19786 (Array (_ BitVec 32) (_ BitVec 64))) (size!20206 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41353)

(declare-datatypes ((SeekEntryResult!7342 0))(
  ( (MissingZero!7342 (index!31736 (_ BitVec 32))) (Found!7342 (index!31737 (_ BitVec 32))) (Intermediate!7342 (undefined!8154 Bool) (index!31738 (_ BitVec 32)) (x!62896 (_ BitVec 32))) (Undefined!7342) (MissingVacant!7342 (index!31739 (_ BitVec 32))) )
))
(declare-fun lt!327435 () SeekEntryResult!7342)

(declare-fun e!412898 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!738077 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41353 (_ BitVec 32)) SeekEntryResult!7342)

(assert (=> b!738077 (= e!412898 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327434 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!327435)))))

(declare-fun b!738078 () Bool)

(declare-fun res!495905 () Bool)

(declare-fun e!412906 () Bool)

(assert (=> b!738078 (=> (not res!495905) (not e!412906))))

(declare-datatypes ((List!13695 0))(
  ( (Nil!13692) (Cons!13691 (h!14769 (_ BitVec 64)) (t!20002 List!13695)) )
))
(declare-fun arrayNoDuplicates!0 (array!41353 (_ BitVec 32) List!13695) Bool)

(assert (=> b!738078 (= res!495905 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13692))))

(declare-fun b!738079 () Bool)

(declare-datatypes ((Unit!25141 0))(
  ( (Unit!25142) )
))
(declare-fun e!412899 () Unit!25141)

(declare-fun Unit!25143 () Unit!25141)

(assert (=> b!738079 (= e!412899 Unit!25143)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!327433 () SeekEntryResult!7342)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41353 (_ BitVec 32)) SeekEntryResult!7342)

(assert (=> b!738079 (= lt!327433 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327443 () SeekEntryResult!7342)

(assert (=> b!738079 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327434 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!327443)))

(declare-fun b!738080 () Bool)

(declare-fun res!495909 () Bool)

(declare-fun e!412904 () Bool)

(assert (=> b!738080 (=> (not res!495909) (not e!412904))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738080 (= res!495909 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19786 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738082 () Bool)

(declare-fun res!495914 () Bool)

(declare-fun e!412903 () Bool)

(assert (=> b!738082 (=> res!495914 e!412903)))

(assert (=> b!738082 (= res!495914 e!412898)))

(declare-fun c!81473 () Bool)

(declare-fun lt!327439 () Bool)

(assert (=> b!738082 (= c!81473 lt!327439)))

(declare-fun b!738083 () Bool)

(declare-fun e!412901 () Bool)

(declare-fun e!412907 () Bool)

(assert (=> b!738083 (= e!412901 (not e!412907))))

(declare-fun res!495916 () Bool)

(assert (=> b!738083 (=> res!495916 e!412907)))

(declare-fun lt!327431 () SeekEntryResult!7342)

(get-info :version)

(assert (=> b!738083 (= res!495916 (or (not ((_ is Intermediate!7342) lt!327431)) (bvsge x!1131 (x!62896 lt!327431))))))

(assert (=> b!738083 (= lt!327443 (Found!7342 j!159))))

(declare-fun e!412900 () Bool)

(assert (=> b!738083 e!412900))

(declare-fun res!495903 () Bool)

(assert (=> b!738083 (=> (not res!495903) (not e!412900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41353 (_ BitVec 32)) Bool)

(assert (=> b!738083 (= res!495903 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327442 () Unit!25141)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25141)

(assert (=> b!738083 (= lt!327442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738084 () Bool)

(declare-fun res!495912 () Bool)

(declare-fun e!412908 () Bool)

(assert (=> b!738084 (=> (not res!495912) (not e!412908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738084 (= res!495912 (validKeyInArray!0 (select (arr!19786 a!3186) j!159)))))

(declare-fun b!738085 () Bool)

(declare-fun res!495902 () Bool)

(assert (=> b!738085 (=> (not res!495902) (not e!412908))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738085 (= res!495902 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738086 () Bool)

(assert (=> b!738086 (= e!412903 true)))

(declare-fun lt!327444 () (_ BitVec 64))

(declare-fun lt!327436 () SeekEntryResult!7342)

(declare-fun lt!327432 () array!41353)

(assert (=> b!738086 (= lt!327436 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327434 lt!327444 lt!327432 mask!3328))))

(declare-fun b!738087 () Bool)

(declare-fun e!412897 () Bool)

(assert (=> b!738087 (= e!412897 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!327435))))

(declare-fun b!738088 () Bool)

(assert (=> b!738088 (= e!412906 e!412904)))

(declare-fun res!495904 () Bool)

(assert (=> b!738088 (=> (not res!495904) (not e!412904))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738088 (= res!495904 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19786 a!3186) j!159) mask!3328) (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!327435))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738088 (= lt!327435 (Intermediate!7342 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738089 () Bool)

(declare-fun res!495919 () Bool)

(assert (=> b!738089 (=> (not res!495919) (not e!412904))))

(assert (=> b!738089 (= res!495919 e!412897)))

(declare-fun c!81471 () Bool)

(assert (=> b!738089 (= c!81471 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738090 () Bool)

(assert (=> b!738090 (= e!412897 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) (Found!7342 j!159)))))

(declare-fun b!738091 () Bool)

(declare-fun res!495915 () Bool)

(assert (=> b!738091 (=> (not res!495915) (not e!412908))))

(assert (=> b!738091 (= res!495915 (and (= (size!20206 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20206 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20206 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738092 () Bool)

(declare-fun Unit!25144 () Unit!25141)

(assert (=> b!738092 (= e!412899 Unit!25144)))

(assert (=> b!738092 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327434 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!327435)))

(declare-fun b!738093 () Bool)

(assert (=> b!738093 (= e!412904 e!412901)))

(declare-fun res!495910 () Bool)

(assert (=> b!738093 (=> (not res!495910) (not e!412901))))

(declare-fun lt!327441 () SeekEntryResult!7342)

(assert (=> b!738093 (= res!495910 (= lt!327441 lt!327431))))

(assert (=> b!738093 (= lt!327431 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327444 lt!327432 mask!3328))))

(assert (=> b!738093 (= lt!327441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327444 mask!3328) lt!327444 lt!327432 mask!3328))))

(assert (=> b!738093 (= lt!327444 (select (store (arr!19786 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738093 (= lt!327432 (array!41354 (store (arr!19786 a!3186) i!1173 k0!2102) (size!20206 a!3186)))))

(declare-fun res!495908 () Bool)

(assert (=> start!65310 (=> (not res!495908) (not e!412908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65310 (= res!495908 (validMask!0 mask!3328))))

(assert (=> start!65310 e!412908))

(assert (=> start!65310 true))

(declare-fun array_inv!15645 (array!41353) Bool)

(assert (=> start!65310 (array_inv!15645 a!3186)))

(declare-fun b!738081 () Bool)

(assert (=> b!738081 (= e!412908 e!412906)))

(declare-fun res!495918 () Bool)

(assert (=> b!738081 (=> (not res!495918) (not e!412906))))

(declare-fun lt!327440 () SeekEntryResult!7342)

(assert (=> b!738081 (= res!495918 (or (= lt!327440 (MissingZero!7342 i!1173)) (= lt!327440 (MissingVacant!7342 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41353 (_ BitVec 32)) SeekEntryResult!7342)

(assert (=> b!738081 (= lt!327440 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738094 () Bool)

(declare-fun res!495906 () Bool)

(assert (=> b!738094 (=> (not res!495906) (not e!412906))))

(assert (=> b!738094 (= res!495906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738095 () Bool)

(assert (=> b!738095 (= e!412898 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327434 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!327443)))))

(declare-fun b!738096 () Bool)

(declare-fun res!495911 () Bool)

(assert (=> b!738096 (=> (not res!495911) (not e!412908))))

(assert (=> b!738096 (= res!495911 (validKeyInArray!0 k0!2102))))

(declare-fun b!738097 () Bool)

(declare-fun res!495913 () Bool)

(assert (=> b!738097 (=> (not res!495913) (not e!412906))))

(assert (=> b!738097 (= res!495913 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20206 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20206 a!3186))))))

(declare-fun b!738098 () Bool)

(declare-fun e!412905 () Bool)

(assert (=> b!738098 (= e!412900 e!412905)))

(declare-fun res!495907 () Bool)

(assert (=> b!738098 (=> (not res!495907) (not e!412905))))

(declare-fun lt!327438 () SeekEntryResult!7342)

(assert (=> b!738098 (= res!495907 (= (seekEntryOrOpen!0 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!327438))))

(assert (=> b!738098 (= lt!327438 (Found!7342 j!159))))

(declare-fun b!738099 () Bool)

(assert (=> b!738099 (= e!412907 e!412903)))

(declare-fun res!495917 () Bool)

(assert (=> b!738099 (=> res!495917 e!412903)))

(assert (=> b!738099 (= res!495917 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327434 #b00000000000000000000000000000000) (bvsge lt!327434 (size!20206 a!3186))))))

(declare-fun lt!327437 () Unit!25141)

(assert (=> b!738099 (= lt!327437 e!412899)))

(declare-fun c!81472 () Bool)

(assert (=> b!738099 (= c!81472 lt!327439)))

(assert (=> b!738099 (= lt!327439 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738099 (= lt!327434 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!738100 () Bool)

(assert (=> b!738100 (= e!412905 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19786 a!3186) j!159) a!3186 mask!3328) lt!327438))))

(assert (= (and start!65310 res!495908) b!738091))

(assert (= (and b!738091 res!495915) b!738084))

(assert (= (and b!738084 res!495912) b!738096))

(assert (= (and b!738096 res!495911) b!738085))

(assert (= (and b!738085 res!495902) b!738081))

(assert (= (and b!738081 res!495918) b!738094))

(assert (= (and b!738094 res!495906) b!738078))

(assert (= (and b!738078 res!495905) b!738097))

(assert (= (and b!738097 res!495913) b!738088))

(assert (= (and b!738088 res!495904) b!738080))

(assert (= (and b!738080 res!495909) b!738089))

(assert (= (and b!738089 c!81471) b!738087))

(assert (= (and b!738089 (not c!81471)) b!738090))

(assert (= (and b!738089 res!495919) b!738093))

(assert (= (and b!738093 res!495910) b!738083))

(assert (= (and b!738083 res!495903) b!738098))

(assert (= (and b!738098 res!495907) b!738100))

(assert (= (and b!738083 (not res!495916)) b!738099))

(assert (= (and b!738099 c!81472) b!738092))

(assert (= (and b!738099 (not c!81472)) b!738079))

(assert (= (and b!738099 (not res!495917)) b!738082))

(assert (= (and b!738082 c!81473) b!738077))

(assert (= (and b!738082 (not c!81473)) b!738095))

(assert (= (and b!738082 (not res!495914)) b!738086))

(declare-fun m!690399 () Bool)

(assert (=> b!738088 m!690399))

(assert (=> b!738088 m!690399))

(declare-fun m!690401 () Bool)

(assert (=> b!738088 m!690401))

(assert (=> b!738088 m!690401))

(assert (=> b!738088 m!690399))

(declare-fun m!690403 () Bool)

(assert (=> b!738088 m!690403))

(assert (=> b!738092 m!690399))

(assert (=> b!738092 m!690399))

(declare-fun m!690405 () Bool)

(assert (=> b!738092 m!690405))

(assert (=> b!738084 m!690399))

(assert (=> b!738084 m!690399))

(declare-fun m!690407 () Bool)

(assert (=> b!738084 m!690407))

(declare-fun m!690409 () Bool)

(assert (=> b!738078 m!690409))

(declare-fun m!690411 () Bool)

(assert (=> b!738099 m!690411))

(declare-fun m!690413 () Bool)

(assert (=> b!738094 m!690413))

(declare-fun m!690415 () Bool)

(assert (=> b!738085 m!690415))

(declare-fun m!690417 () Bool)

(assert (=> start!65310 m!690417))

(declare-fun m!690419 () Bool)

(assert (=> start!65310 m!690419))

(assert (=> b!738079 m!690399))

(assert (=> b!738079 m!690399))

(declare-fun m!690421 () Bool)

(assert (=> b!738079 m!690421))

(assert (=> b!738079 m!690399))

(declare-fun m!690423 () Bool)

(assert (=> b!738079 m!690423))

(assert (=> b!738090 m!690399))

(assert (=> b!738090 m!690399))

(assert (=> b!738090 m!690421))

(declare-fun m!690425 () Bool)

(assert (=> b!738081 m!690425))

(assert (=> b!738098 m!690399))

(assert (=> b!738098 m!690399))

(declare-fun m!690427 () Bool)

(assert (=> b!738098 m!690427))

(assert (=> b!738077 m!690399))

(assert (=> b!738077 m!690399))

(assert (=> b!738077 m!690405))

(assert (=> b!738100 m!690399))

(assert (=> b!738100 m!690399))

(declare-fun m!690429 () Bool)

(assert (=> b!738100 m!690429))

(declare-fun m!690431 () Bool)

(assert (=> b!738080 m!690431))

(assert (=> b!738087 m!690399))

(assert (=> b!738087 m!690399))

(declare-fun m!690433 () Bool)

(assert (=> b!738087 m!690433))

(declare-fun m!690435 () Bool)

(assert (=> b!738083 m!690435))

(declare-fun m!690437 () Bool)

(assert (=> b!738083 m!690437))

(declare-fun m!690439 () Bool)

(assert (=> b!738096 m!690439))

(declare-fun m!690441 () Bool)

(assert (=> b!738086 m!690441))

(assert (=> b!738095 m!690399))

(assert (=> b!738095 m!690399))

(assert (=> b!738095 m!690423))

(declare-fun m!690443 () Bool)

(assert (=> b!738093 m!690443))

(declare-fun m!690445 () Bool)

(assert (=> b!738093 m!690445))

(declare-fun m!690447 () Bool)

(assert (=> b!738093 m!690447))

(declare-fun m!690449 () Bool)

(assert (=> b!738093 m!690449))

(declare-fun m!690451 () Bool)

(assert (=> b!738093 m!690451))

(assert (=> b!738093 m!690449))

(check-sat (not b!738090) (not b!738081) (not b!738083) (not b!738087) (not b!738095) (not b!738098) (not b!738086) (not b!738084) (not b!738093) (not b!738096) (not b!738077) (not b!738079) (not b!738088) (not b!738092) (not b!738094) (not b!738100) (not b!738078) (not start!65310) (not b!738085) (not b!738099))
(check-sat)
