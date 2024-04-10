; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120392 () Bool)

(assert start!120392)

(declare-fun b!1401477 () Bool)

(declare-fun e!793560 () Bool)

(assert (=> b!1401477 (= e!793560 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10568 0))(
  ( (MissingZero!10568 (index!44649 (_ BitVec 32))) (Found!10568 (index!44650 (_ BitVec 32))) (Intermediate!10568 (undefined!11380 Bool) (index!44651 (_ BitVec 32)) (x!126283 (_ BitVec 32))) (Undefined!10568) (MissingVacant!10568 (index!44652 (_ BitVec 32))) )
))
(declare-fun lt!616964 () SeekEntryResult!10568)

(declare-fun lt!616958 () (_ BitVec 32))

(declare-datatypes ((array!95801 0))(
  ( (array!95802 (arr!46251 (Array (_ BitVec 32) (_ BitVec 64))) (size!46801 (_ BitVec 32))) )
))
(declare-fun lt!616963 () array!95801)

(declare-fun lt!616961 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95801 (_ BitVec 32)) SeekEntryResult!10568)

(assert (=> b!1401477 (= lt!616964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616958 lt!616961 lt!616963 mask!2840))))

(declare-fun b!1401478 () Bool)

(declare-fun res!939995 () Bool)

(declare-fun e!793559 () Bool)

(assert (=> b!1401478 (=> (not res!939995) (not e!793559))))

(declare-fun a!2901 () array!95801)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401478 (= res!939995 (and (= (size!46801 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46801 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46801 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!793561 () Bool)

(declare-fun b!1401479 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95801 (_ BitVec 32)) SeekEntryResult!10568)

(assert (=> b!1401479 (= e!793561 (= (seekEntryOrOpen!0 (select (arr!46251 a!2901) j!112) a!2901 mask!2840) (Found!10568 j!112)))))

(declare-fun b!1401480 () Bool)

(declare-fun res!939996 () Bool)

(assert (=> b!1401480 (=> (not res!939996) (not e!793559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95801 (_ BitVec 32)) Bool)

(assert (=> b!1401480 (= res!939996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!793556 () Bool)

(declare-fun lt!616960 () SeekEntryResult!10568)

(declare-fun b!1401481 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95801 (_ BitVec 32)) SeekEntryResult!10568)

(assert (=> b!1401481 (= e!793556 (= (seekEntryOrOpen!0 lt!616961 lt!616963 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126283 lt!616960) (index!44651 lt!616960) (index!44651 lt!616960) (select (arr!46251 a!2901) j!112) lt!616963 mask!2840)))))

(declare-fun b!1401482 () Bool)

(declare-fun res!939991 () Bool)

(assert (=> b!1401482 (=> (not res!939991) (not e!793559))))

(declare-datatypes ((List!32770 0))(
  ( (Nil!32767) (Cons!32766 (h!34014 (_ BitVec 64)) (t!47464 List!32770)) )
))
(declare-fun arrayNoDuplicates!0 (array!95801 (_ BitVec 32) List!32770) Bool)

(assert (=> b!1401482 (= res!939991 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32767))))

(declare-fun b!1401483 () Bool)

(declare-fun res!939992 () Bool)

(assert (=> b!1401483 (=> (not res!939992) (not e!793559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401483 (= res!939992 (validKeyInArray!0 (select (arr!46251 a!2901) j!112)))))

(declare-fun b!1401484 () Bool)

(declare-fun res!939993 () Bool)

(assert (=> b!1401484 (=> (not res!939993) (not e!793559))))

(assert (=> b!1401484 (= res!939993 (validKeyInArray!0 (select (arr!46251 a!2901) i!1037)))))

(declare-fun res!939989 () Bool)

(assert (=> start!120392 (=> (not res!939989) (not e!793559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120392 (= res!939989 (validMask!0 mask!2840))))

(assert (=> start!120392 e!793559))

(assert (=> start!120392 true))

(declare-fun array_inv!35279 (array!95801) Bool)

(assert (=> start!120392 (array_inv!35279 a!2901)))

(declare-fun b!1401476 () Bool)

(declare-fun e!793558 () Bool)

(declare-fun e!793557 () Bool)

(assert (=> b!1401476 (= e!793558 e!793557)))

(declare-fun res!939987 () Bool)

(assert (=> b!1401476 (=> res!939987 e!793557)))

(declare-fun lt!616962 () SeekEntryResult!10568)

(get-info :version)

(assert (=> b!1401476 (= res!939987 (or (= lt!616962 lt!616960) (not ((_ is Intermediate!10568) lt!616960))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401476 (= lt!616960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616961 mask!2840) lt!616961 lt!616963 mask!2840))))

(assert (=> b!1401476 (= lt!616961 (select (store (arr!46251 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401476 (= lt!616963 (array!95802 (store (arr!46251 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46801 a!2901)))))

(declare-fun b!1401485 () Bool)

(assert (=> b!1401485 (= e!793559 (not e!793558))))

(declare-fun res!939997 () Bool)

(assert (=> b!1401485 (=> res!939997 e!793558)))

(assert (=> b!1401485 (= res!939997 (or (not ((_ is Intermediate!10568) lt!616962)) (undefined!11380 lt!616962)))))

(assert (=> b!1401485 e!793561))

(declare-fun res!939988 () Bool)

(assert (=> b!1401485 (=> (not res!939988) (not e!793561))))

(assert (=> b!1401485 (= res!939988 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47140 0))(
  ( (Unit!47141) )
))
(declare-fun lt!616959 () Unit!47140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47140)

(assert (=> b!1401485 (= lt!616959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401485 (= lt!616962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616958 (select (arr!46251 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401485 (= lt!616958 (toIndex!0 (select (arr!46251 a!2901) j!112) mask!2840))))

(declare-fun b!1401486 () Bool)

(assert (=> b!1401486 (= e!793557 e!793560)))

(declare-fun res!939994 () Bool)

(assert (=> b!1401486 (=> res!939994 e!793560)))

(assert (=> b!1401486 (= res!939994 (or (bvslt (x!126283 lt!616962) #b00000000000000000000000000000000) (bvsgt (x!126283 lt!616962) #b01111111111111111111111111111110) (bvslt (x!126283 lt!616960) #b00000000000000000000000000000000) (bvsgt (x!126283 lt!616960) #b01111111111111111111111111111110) (bvslt lt!616958 #b00000000000000000000000000000000) (bvsge lt!616958 (size!46801 a!2901)) (bvslt (index!44651 lt!616962) #b00000000000000000000000000000000) (bvsge (index!44651 lt!616962) (size!46801 a!2901)) (bvslt (index!44651 lt!616960) #b00000000000000000000000000000000) (bvsge (index!44651 lt!616960) (size!46801 a!2901)) (not (= lt!616962 (Intermediate!10568 false (index!44651 lt!616962) (x!126283 lt!616962)))) (not (= lt!616960 (Intermediate!10568 false (index!44651 lt!616960) (x!126283 lt!616960))))))))

(assert (=> b!1401486 e!793556))

(declare-fun res!939990 () Bool)

(assert (=> b!1401486 (=> (not res!939990) (not e!793556))))

(assert (=> b!1401486 (= res!939990 (and (not (undefined!11380 lt!616960)) (= (index!44651 lt!616960) i!1037) (bvslt (x!126283 lt!616960) (x!126283 lt!616962)) (= (select (store (arr!46251 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44651 lt!616960)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616965 () Unit!47140)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47140)

(assert (=> b!1401486 (= lt!616965 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616958 (x!126283 lt!616962) (index!44651 lt!616962) (x!126283 lt!616960) (index!44651 lt!616960) (undefined!11380 lt!616960) mask!2840))))

(assert (= (and start!120392 res!939989) b!1401478))

(assert (= (and b!1401478 res!939995) b!1401484))

(assert (= (and b!1401484 res!939993) b!1401483))

(assert (= (and b!1401483 res!939992) b!1401480))

(assert (= (and b!1401480 res!939996) b!1401482))

(assert (= (and b!1401482 res!939991) b!1401485))

(assert (= (and b!1401485 res!939988) b!1401479))

(assert (= (and b!1401485 (not res!939997)) b!1401476))

(assert (= (and b!1401476 (not res!939987)) b!1401486))

(assert (= (and b!1401486 res!939990) b!1401481))

(assert (= (and b!1401486 (not res!939994)) b!1401477))

(declare-fun m!1289273 () Bool)

(assert (=> start!120392 m!1289273))

(declare-fun m!1289275 () Bool)

(assert (=> start!120392 m!1289275))

(declare-fun m!1289277 () Bool)

(assert (=> b!1401476 m!1289277))

(assert (=> b!1401476 m!1289277))

(declare-fun m!1289279 () Bool)

(assert (=> b!1401476 m!1289279))

(declare-fun m!1289281 () Bool)

(assert (=> b!1401476 m!1289281))

(declare-fun m!1289283 () Bool)

(assert (=> b!1401476 m!1289283))

(assert (=> b!1401486 m!1289281))

(declare-fun m!1289285 () Bool)

(assert (=> b!1401486 m!1289285))

(declare-fun m!1289287 () Bool)

(assert (=> b!1401486 m!1289287))

(declare-fun m!1289289 () Bool)

(assert (=> b!1401482 m!1289289))

(declare-fun m!1289291 () Bool)

(assert (=> b!1401477 m!1289291))

(declare-fun m!1289293 () Bool)

(assert (=> b!1401484 m!1289293))

(assert (=> b!1401484 m!1289293))

(declare-fun m!1289295 () Bool)

(assert (=> b!1401484 m!1289295))

(declare-fun m!1289297 () Bool)

(assert (=> b!1401480 m!1289297))

(declare-fun m!1289299 () Bool)

(assert (=> b!1401481 m!1289299))

(declare-fun m!1289301 () Bool)

(assert (=> b!1401481 m!1289301))

(assert (=> b!1401481 m!1289301))

(declare-fun m!1289303 () Bool)

(assert (=> b!1401481 m!1289303))

(assert (=> b!1401479 m!1289301))

(assert (=> b!1401479 m!1289301))

(declare-fun m!1289305 () Bool)

(assert (=> b!1401479 m!1289305))

(assert (=> b!1401483 m!1289301))

(assert (=> b!1401483 m!1289301))

(declare-fun m!1289307 () Bool)

(assert (=> b!1401483 m!1289307))

(assert (=> b!1401485 m!1289301))

(declare-fun m!1289309 () Bool)

(assert (=> b!1401485 m!1289309))

(assert (=> b!1401485 m!1289301))

(declare-fun m!1289311 () Bool)

(assert (=> b!1401485 m!1289311))

(declare-fun m!1289313 () Bool)

(assert (=> b!1401485 m!1289313))

(assert (=> b!1401485 m!1289301))

(declare-fun m!1289315 () Bool)

(assert (=> b!1401485 m!1289315))

(check-sat (not b!1401481) (not b!1401476) (not b!1401479) (not b!1401485) (not b!1401482) (not b!1401484) (not b!1401483) (not b!1401486) (not b!1401480) (not b!1401477) (not start!120392))
(check-sat)
