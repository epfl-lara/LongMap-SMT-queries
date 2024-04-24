; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65430 () Bool)

(assert start!65430)

(declare-fun b!742239 () Bool)

(declare-fun res!499109 () Bool)

(declare-fun e!414953 () Bool)

(assert (=> b!742239 (=> (not res!499109) (not e!414953))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41473 0))(
  ( (array!41474 (arr!19846 (Array (_ BitVec 32) (_ BitVec 64))) (size!20266 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41473)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742239 (= res!499109 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19846 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!414950 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!742240 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7402 0))(
  ( (MissingZero!7402 (index!31976 (_ BitVec 32))) (Found!7402 (index!31977 (_ BitVec 32))) (Intermediate!7402 (undefined!8214 Bool) (index!31978 (_ BitVec 32)) (x!63116 (_ BitVec 32))) (Undefined!7402) (MissingVacant!7402 (index!31979 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41473 (_ BitVec 32)) SeekEntryResult!7402)

(assert (=> b!742240 (= e!414950 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19846 a!3186) j!159) a!3186 mask!3328) (Found!7402 j!159)))))

(declare-fun b!742241 () Bool)

(declare-fun res!499110 () Bool)

(declare-fun e!414957 () Bool)

(assert (=> b!742241 (=> (not res!499110) (not e!414957))))

(declare-datatypes ((List!13755 0))(
  ( (Nil!13752) (Cons!13751 (h!14829 (_ BitVec 64)) (t!20062 List!13755)) )
))
(declare-fun arrayNoDuplicates!0 (array!41473 (_ BitVec 32) List!13755) Bool)

(assert (=> b!742241 (= res!499110 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13752))))

(declare-fun b!742242 () Bool)

(declare-fun res!499103 () Bool)

(declare-fun e!414954 () Bool)

(assert (=> b!742242 (=> (not res!499103) (not e!414954))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742242 (= res!499103 (validKeyInArray!0 k0!2102))))

(declare-fun b!742243 () Bool)

(declare-fun res!499114 () Bool)

(assert (=> b!742243 (=> (not res!499114) (not e!414954))))

(assert (=> b!742243 (= res!499114 (validKeyInArray!0 (select (arr!19846 a!3186) j!159)))))

(declare-fun b!742244 () Bool)

(declare-fun res!499102 () Bool)

(assert (=> b!742244 (=> (not res!499102) (not e!414954))))

(assert (=> b!742244 (= res!499102 (and (= (size!20266 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20266 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20266 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742245 () Bool)

(declare-fun res!499111 () Bool)

(assert (=> b!742245 (=> (not res!499111) (not e!414957))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742245 (= res!499111 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20266 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20266 a!3186))))))

(declare-fun b!742246 () Bool)

(declare-fun res!499107 () Bool)

(assert (=> b!742246 (=> (not res!499107) (not e!414957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41473 (_ BitVec 32)) Bool)

(assert (=> b!742246 (= res!499107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742247 () Bool)

(declare-fun e!414955 () Bool)

(assert (=> b!742247 (= e!414953 e!414955)))

(declare-fun res!499101 () Bool)

(assert (=> b!742247 (=> (not res!499101) (not e!414955))))

(declare-fun lt!329746 () SeekEntryResult!7402)

(declare-fun lt!329743 () SeekEntryResult!7402)

(assert (=> b!742247 (= res!499101 (= lt!329746 lt!329743))))

(declare-fun lt!329741 () array!41473)

(declare-fun lt!329742 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41473 (_ BitVec 32)) SeekEntryResult!7402)

(assert (=> b!742247 (= lt!329743 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329742 lt!329741 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742247 (= lt!329746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329742 mask!3328) lt!329742 lt!329741 mask!3328))))

(assert (=> b!742247 (= lt!329742 (select (store (arr!19846 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742247 (= lt!329741 (array!41474 (store (arr!19846 a!3186) i!1173 k0!2102) (size!20266 a!3186)))))

(declare-fun res!499106 () Bool)

(assert (=> start!65430 (=> (not res!499106) (not e!414954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65430 (= res!499106 (validMask!0 mask!3328))))

(assert (=> start!65430 e!414954))

(assert (=> start!65430 true))

(declare-fun array_inv!15705 (array!41473) Bool)

(assert (=> start!65430 (array_inv!15705 a!3186)))

(declare-fun lt!329747 () SeekEntryResult!7402)

(declare-fun b!742248 () Bool)

(assert (=> b!742248 (= e!414950 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19846 a!3186) j!159) a!3186 mask!3328) lt!329747))))

(declare-fun b!742249 () Bool)

(assert (=> b!742249 (= e!414954 e!414957)))

(declare-fun res!499112 () Bool)

(assert (=> b!742249 (=> (not res!499112) (not e!414957))))

(declare-fun lt!329744 () SeekEntryResult!7402)

(assert (=> b!742249 (= res!499112 (or (= lt!329744 (MissingZero!7402 i!1173)) (= lt!329744 (MissingVacant!7402 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41473 (_ BitVec 32)) SeekEntryResult!7402)

(assert (=> b!742249 (= lt!329744 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742250 () Bool)

(declare-fun e!414952 () Bool)

(declare-fun e!414951 () Bool)

(assert (=> b!742250 (= e!414952 e!414951)))

(declare-fun res!499108 () Bool)

(assert (=> b!742250 (=> (not res!499108) (not e!414951))))

(declare-fun lt!329748 () SeekEntryResult!7402)

(assert (=> b!742250 (= res!499108 (= (seekEntryOrOpen!0 (select (arr!19846 a!3186) j!159) a!3186 mask!3328) lt!329748))))

(assert (=> b!742250 (= lt!329748 (Found!7402 j!159))))

(declare-fun b!742251 () Bool)

(get-info :version)

(assert (=> b!742251 (= e!414955 (not (or (not ((_ is Intermediate!7402) lt!329743)) (not (= x!1131 (x!63116 lt!329743))) (not (= index!1321 (index!31978 lt!329743))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!742251 e!414952))

(declare-fun res!499105 () Bool)

(assert (=> b!742251 (=> (not res!499105) (not e!414952))))

(assert (=> b!742251 (= res!499105 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25363 0))(
  ( (Unit!25364) )
))
(declare-fun lt!329745 () Unit!25363)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25363)

(assert (=> b!742251 (= lt!329745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742252 () Bool)

(assert (=> b!742252 (= e!414957 e!414953)))

(declare-fun res!499113 () Bool)

(assert (=> b!742252 (=> (not res!499113) (not e!414953))))

(assert (=> b!742252 (= res!499113 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19846 a!3186) j!159) mask!3328) (select (arr!19846 a!3186) j!159) a!3186 mask!3328) lt!329747))))

(assert (=> b!742252 (= lt!329747 (Intermediate!7402 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742253 () Bool)

(declare-fun res!499104 () Bool)

(assert (=> b!742253 (=> (not res!499104) (not e!414953))))

(assert (=> b!742253 (= res!499104 e!414950)))

(declare-fun c!81953 () Bool)

(assert (=> b!742253 (= c!81953 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742254 () Bool)

(assert (=> b!742254 (= e!414951 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19846 a!3186) j!159) a!3186 mask!3328) lt!329748))))

(declare-fun b!742255 () Bool)

(declare-fun res!499100 () Bool)

(assert (=> b!742255 (=> (not res!499100) (not e!414954))))

(declare-fun arrayContainsKey!0 (array!41473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742255 (= res!499100 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65430 res!499106) b!742244))

(assert (= (and b!742244 res!499102) b!742243))

(assert (= (and b!742243 res!499114) b!742242))

(assert (= (and b!742242 res!499103) b!742255))

(assert (= (and b!742255 res!499100) b!742249))

(assert (= (and b!742249 res!499112) b!742246))

(assert (= (and b!742246 res!499107) b!742241))

(assert (= (and b!742241 res!499110) b!742245))

(assert (= (and b!742245 res!499111) b!742252))

(assert (= (and b!742252 res!499113) b!742239))

(assert (= (and b!742239 res!499109) b!742253))

(assert (= (and b!742253 c!81953) b!742248))

(assert (= (and b!742253 (not c!81953)) b!742240))

(assert (= (and b!742253 res!499104) b!742247))

(assert (= (and b!742247 res!499101) b!742251))

(assert (= (and b!742251 res!499105) b!742250))

(assert (= (and b!742250 res!499108) b!742254))

(declare-fun m!693621 () Bool)

(assert (=> b!742247 m!693621))

(declare-fun m!693623 () Bool)

(assert (=> b!742247 m!693623))

(assert (=> b!742247 m!693621))

(declare-fun m!693625 () Bool)

(assert (=> b!742247 m!693625))

(declare-fun m!693627 () Bool)

(assert (=> b!742247 m!693627))

(declare-fun m!693629 () Bool)

(assert (=> b!742247 m!693629))

(declare-fun m!693631 () Bool)

(assert (=> b!742246 m!693631))

(declare-fun m!693633 () Bool)

(assert (=> start!65430 m!693633))

(declare-fun m!693635 () Bool)

(assert (=> start!65430 m!693635))

(declare-fun m!693637 () Bool)

(assert (=> b!742241 m!693637))

(declare-fun m!693639 () Bool)

(assert (=> b!742252 m!693639))

(assert (=> b!742252 m!693639))

(declare-fun m!693641 () Bool)

(assert (=> b!742252 m!693641))

(assert (=> b!742252 m!693641))

(assert (=> b!742252 m!693639))

(declare-fun m!693643 () Bool)

(assert (=> b!742252 m!693643))

(declare-fun m!693645 () Bool)

(assert (=> b!742239 m!693645))

(assert (=> b!742254 m!693639))

(assert (=> b!742254 m!693639))

(declare-fun m!693647 () Bool)

(assert (=> b!742254 m!693647))

(declare-fun m!693649 () Bool)

(assert (=> b!742251 m!693649))

(declare-fun m!693651 () Bool)

(assert (=> b!742251 m!693651))

(assert (=> b!742243 m!693639))

(assert (=> b!742243 m!693639))

(declare-fun m!693653 () Bool)

(assert (=> b!742243 m!693653))

(assert (=> b!742248 m!693639))

(assert (=> b!742248 m!693639))

(declare-fun m!693655 () Bool)

(assert (=> b!742248 m!693655))

(declare-fun m!693657 () Bool)

(assert (=> b!742249 m!693657))

(assert (=> b!742250 m!693639))

(assert (=> b!742250 m!693639))

(declare-fun m!693659 () Bool)

(assert (=> b!742250 m!693659))

(assert (=> b!742240 m!693639))

(assert (=> b!742240 m!693639))

(declare-fun m!693661 () Bool)

(assert (=> b!742240 m!693661))

(declare-fun m!693663 () Bool)

(assert (=> b!742255 m!693663))

(declare-fun m!693665 () Bool)

(assert (=> b!742242 m!693665))

(check-sat (not b!742242) (not b!742240) (not start!65430) (not b!742246) (not b!742250) (not b!742248) (not b!742241) (not b!742249) (not b!742252) (not b!742255) (not b!742251) (not b!742247) (not b!742254) (not b!742243))
(check-sat)
