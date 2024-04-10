; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65128 () Bool)

(assert start!65128)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41301 0))(
  ( (array!41302 (arr!19764 (Array (_ BitVec 32) (_ BitVec 64))) (size!20185 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41301)

(declare-fun e!411449 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!735388 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7364 0))(
  ( (MissingZero!7364 (index!31824 (_ BitVec 32))) (Found!7364 (index!31825 (_ BitVec 32))) (Intermediate!7364 (undefined!8176 Bool) (index!31826 (_ BitVec 32)) (x!62834 (_ BitVec 32))) (Undefined!7364) (MissingVacant!7364 (index!31827 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41301 (_ BitVec 32)) SeekEntryResult!7364)

(assert (=> b!735388 (= e!411449 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19764 a!3186) j!159) a!3186 mask!3328) (Found!7364 j!159)))))

(declare-fun b!735389 () Bool)

(declare-fun e!411451 () Bool)

(declare-fun e!411447 () Bool)

(assert (=> b!735389 (= e!411451 e!411447)))

(declare-fun res!494154 () Bool)

(assert (=> b!735389 (=> (not res!494154) (not e!411447))))

(declare-fun lt!325988 () SeekEntryResult!7364)

(declare-fun lt!325996 () SeekEntryResult!7364)

(assert (=> b!735389 (= res!494154 (= lt!325988 lt!325996))))

(declare-fun lt!325994 () array!41301)

(declare-fun lt!325987 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41301 (_ BitVec 32)) SeekEntryResult!7364)

(assert (=> b!735389 (= lt!325996 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325987 lt!325994 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735389 (= lt!325988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325987 mask!3328) lt!325987 lt!325994 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!735389 (= lt!325987 (select (store (arr!19764 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735389 (= lt!325994 (array!41302 (store (arr!19764 a!3186) i!1173 k!2102) (size!20185 a!3186)))))

(declare-fun b!735390 () Bool)

(declare-fun res!494156 () Bool)

(declare-fun e!411454 () Bool)

(assert (=> b!735390 (=> (not res!494156) (not e!411454))))

(assert (=> b!735390 (= res!494156 (and (= (size!20185 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20185 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20185 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735391 () Bool)

(declare-fun res!494151 () Bool)

(declare-fun e!411448 () Bool)

(assert (=> b!735391 (=> (not res!494151) (not e!411448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41301 (_ BitVec 32)) Bool)

(assert (=> b!735391 (= res!494151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735392 () Bool)

(declare-fun lt!325984 () SeekEntryResult!7364)

(assert (=> b!735392 (= e!411449 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19764 a!3186) j!159) a!3186 mask!3328) lt!325984))))

(declare-fun b!735393 () Bool)

(declare-fun res!494145 () Bool)

(assert (=> b!735393 (=> (not res!494145) (not e!411448))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735393 (= res!494145 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20185 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20185 a!3186))))))

(declare-fun b!735394 () Bool)

(declare-fun res!494153 () Bool)

(assert (=> b!735394 (=> (not res!494153) (not e!411451))))

(assert (=> b!735394 (= res!494153 e!411449)))

(declare-fun c!81006 () Bool)

(assert (=> b!735394 (= c!81006 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735395 () Bool)

(declare-fun res!494150 () Bool)

(assert (=> b!735395 (=> (not res!494150) (not e!411454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735395 (= res!494150 (validKeyInArray!0 k!2102))))

(declare-fun res!494155 () Bool)

(assert (=> start!65128 (=> (not res!494155) (not e!411454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65128 (= res!494155 (validMask!0 mask!3328))))

(assert (=> start!65128 e!411454))

(assert (=> start!65128 true))

(declare-fun array_inv!15560 (array!41301) Bool)

(assert (=> start!65128 (array_inv!15560 a!3186)))

(declare-fun b!735396 () Bool)

(declare-datatypes ((Unit!25052 0))(
  ( (Unit!25053) )
))
(declare-fun e!411455 () Unit!25052)

(declare-fun Unit!25054 () Unit!25052)

(assert (=> b!735396 (= e!411455 Unit!25054)))

(declare-fun lt!325997 () (_ BitVec 32))

(assert (=> b!735396 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325997 (select (arr!19764 a!3186) j!159) a!3186 mask!3328) lt!325984)))

(declare-fun b!735397 () Bool)

(assert (=> b!735397 (= e!411454 e!411448)))

(declare-fun res!494147 () Bool)

(assert (=> b!735397 (=> (not res!494147) (not e!411448))))

(declare-fun lt!325986 () SeekEntryResult!7364)

(assert (=> b!735397 (= res!494147 (or (= lt!325986 (MissingZero!7364 i!1173)) (= lt!325986 (MissingVacant!7364 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41301 (_ BitVec 32)) SeekEntryResult!7364)

(assert (=> b!735397 (= lt!325986 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!735398 () Bool)

(declare-fun e!411457 () Bool)

(assert (=> b!735398 (= e!411447 (not e!411457))))

(declare-fun res!494143 () Bool)

(assert (=> b!735398 (=> res!494143 e!411457)))

(assert (=> b!735398 (= res!494143 (or (not (is-Intermediate!7364 lt!325996)) (bvsge x!1131 (x!62834 lt!325996))))))

(declare-fun lt!325992 () SeekEntryResult!7364)

(assert (=> b!735398 (= lt!325992 (Found!7364 j!159))))

(declare-fun e!411456 () Bool)

(assert (=> b!735398 e!411456))

(declare-fun res!494148 () Bool)

(assert (=> b!735398 (=> (not res!494148) (not e!411456))))

(assert (=> b!735398 (= res!494148 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!325989 () Unit!25052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25052)

(assert (=> b!735398 (= lt!325989 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735399 () Bool)

(declare-fun e!411450 () Bool)

(assert (=> b!735399 (= e!411450 true)))

(declare-fun lt!325995 () SeekEntryResult!7364)

(assert (=> b!735399 (= lt!325995 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325997 lt!325987 lt!325994 mask!3328))))

(declare-fun b!735400 () Bool)

(declare-fun res!494152 () Bool)

(assert (=> b!735400 (=> (not res!494152) (not e!411451))))

(assert (=> b!735400 (= res!494152 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19764 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!411458 () Bool)

(declare-fun b!735401 () Bool)

(assert (=> b!735401 (= e!411458 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325997 (select (arr!19764 a!3186) j!159) a!3186 mask!3328) lt!325984)))))

(declare-fun b!735402 () Bool)

(declare-fun Unit!25055 () Unit!25052)

(assert (=> b!735402 (= e!411455 Unit!25055)))

(declare-fun lt!325993 () SeekEntryResult!7364)

(assert (=> b!735402 (= lt!325993 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19764 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735402 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325997 resIntermediateIndex!5 (select (arr!19764 a!3186) j!159) a!3186 mask!3328) lt!325992)))

(declare-fun b!735403 () Bool)

(declare-fun res!494149 () Bool)

(assert (=> b!735403 (=> (not res!494149) (not e!411454))))

(declare-fun arrayContainsKey!0 (array!41301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735403 (= res!494149 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735404 () Bool)

(declare-fun res!494140 () Bool)

(assert (=> b!735404 (=> (not res!494140) (not e!411448))))

(declare-datatypes ((List!13766 0))(
  ( (Nil!13763) (Cons!13762 (h!14834 (_ BitVec 64)) (t!20081 List!13766)) )
))
(declare-fun arrayNoDuplicates!0 (array!41301 (_ BitVec 32) List!13766) Bool)

(assert (=> b!735404 (= res!494140 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13763))))

(declare-fun b!735405 () Bool)

(assert (=> b!735405 (= e!411457 e!411450)))

(declare-fun res!494141 () Bool)

(assert (=> b!735405 (=> res!494141 e!411450)))

(assert (=> b!735405 (= res!494141 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!325997 #b00000000000000000000000000000000) (bvsge lt!325997 (size!20185 a!3186))))))

(declare-fun lt!325985 () Unit!25052)

(assert (=> b!735405 (= lt!325985 e!411455)))

(declare-fun c!81005 () Bool)

(declare-fun lt!325991 () Bool)

(assert (=> b!735405 (= c!81005 lt!325991)))

(assert (=> b!735405 (= lt!325991 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735405 (= lt!325997 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735406 () Bool)

(assert (=> b!735406 (= e!411458 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325997 resIntermediateIndex!5 (select (arr!19764 a!3186) j!159) a!3186 mask!3328) lt!325992)))))

(declare-fun b!735407 () Bool)

(declare-fun e!411453 () Bool)

(assert (=> b!735407 (= e!411456 e!411453)))

(declare-fun res!494144 () Bool)

(assert (=> b!735407 (=> (not res!494144) (not e!411453))))

(declare-fun lt!325990 () SeekEntryResult!7364)

(assert (=> b!735407 (= res!494144 (= (seekEntryOrOpen!0 (select (arr!19764 a!3186) j!159) a!3186 mask!3328) lt!325990))))

(assert (=> b!735407 (= lt!325990 (Found!7364 j!159))))

(declare-fun b!735408 () Bool)

(assert (=> b!735408 (= e!411448 e!411451)))

(declare-fun res!494139 () Bool)

(assert (=> b!735408 (=> (not res!494139) (not e!411451))))

(assert (=> b!735408 (= res!494139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19764 a!3186) j!159) mask!3328) (select (arr!19764 a!3186) j!159) a!3186 mask!3328) lt!325984))))

(assert (=> b!735408 (= lt!325984 (Intermediate!7364 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735409 () Bool)

(assert (=> b!735409 (= e!411453 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19764 a!3186) j!159) a!3186 mask!3328) lt!325990))))

(declare-fun b!735410 () Bool)

(declare-fun res!494142 () Bool)

(assert (=> b!735410 (=> res!494142 e!411450)))

(assert (=> b!735410 (= res!494142 e!411458)))

(declare-fun c!81007 () Bool)

(assert (=> b!735410 (= c!81007 lt!325991)))

(declare-fun b!735411 () Bool)

(declare-fun res!494146 () Bool)

(assert (=> b!735411 (=> (not res!494146) (not e!411454))))

(assert (=> b!735411 (= res!494146 (validKeyInArray!0 (select (arr!19764 a!3186) j!159)))))

(assert (= (and start!65128 res!494155) b!735390))

(assert (= (and b!735390 res!494156) b!735411))

(assert (= (and b!735411 res!494146) b!735395))

(assert (= (and b!735395 res!494150) b!735403))

(assert (= (and b!735403 res!494149) b!735397))

(assert (= (and b!735397 res!494147) b!735391))

(assert (= (and b!735391 res!494151) b!735404))

(assert (= (and b!735404 res!494140) b!735393))

(assert (= (and b!735393 res!494145) b!735408))

(assert (= (and b!735408 res!494139) b!735400))

(assert (= (and b!735400 res!494152) b!735394))

(assert (= (and b!735394 c!81006) b!735392))

(assert (= (and b!735394 (not c!81006)) b!735388))

(assert (= (and b!735394 res!494153) b!735389))

(assert (= (and b!735389 res!494154) b!735398))

(assert (= (and b!735398 res!494148) b!735407))

(assert (= (and b!735407 res!494144) b!735409))

(assert (= (and b!735398 (not res!494143)) b!735405))

(assert (= (and b!735405 c!81005) b!735396))

(assert (= (and b!735405 (not c!81005)) b!735402))

(assert (= (and b!735405 (not res!494141)) b!735410))

(assert (= (and b!735410 c!81007) b!735401))

(assert (= (and b!735410 (not c!81007)) b!735406))

(assert (= (and b!735410 (not res!494142)) b!735399))

(declare-fun m!687781 () Bool)

(assert (=> b!735395 m!687781))

(declare-fun m!687783 () Bool)

(assert (=> b!735399 m!687783))

(declare-fun m!687785 () Bool)

(assert (=> b!735406 m!687785))

(assert (=> b!735406 m!687785))

(declare-fun m!687787 () Bool)

(assert (=> b!735406 m!687787))

(declare-fun m!687789 () Bool)

(assert (=> b!735403 m!687789))

(assert (=> b!735388 m!687785))

(assert (=> b!735388 m!687785))

(declare-fun m!687791 () Bool)

(assert (=> b!735388 m!687791))

(assert (=> b!735408 m!687785))

(assert (=> b!735408 m!687785))

(declare-fun m!687793 () Bool)

(assert (=> b!735408 m!687793))

(assert (=> b!735408 m!687793))

(assert (=> b!735408 m!687785))

(declare-fun m!687795 () Bool)

(assert (=> b!735408 m!687795))

(assert (=> b!735409 m!687785))

(assert (=> b!735409 m!687785))

(declare-fun m!687797 () Bool)

(assert (=> b!735409 m!687797))

(assert (=> b!735401 m!687785))

(assert (=> b!735401 m!687785))

(declare-fun m!687799 () Bool)

(assert (=> b!735401 m!687799))

(declare-fun m!687801 () Bool)

(assert (=> b!735389 m!687801))

(declare-fun m!687803 () Bool)

(assert (=> b!735389 m!687803))

(assert (=> b!735389 m!687803))

(declare-fun m!687805 () Bool)

(assert (=> b!735389 m!687805))

(declare-fun m!687807 () Bool)

(assert (=> b!735389 m!687807))

(declare-fun m!687809 () Bool)

(assert (=> b!735389 m!687809))

(assert (=> b!735392 m!687785))

(assert (=> b!735392 m!687785))

(declare-fun m!687811 () Bool)

(assert (=> b!735392 m!687811))

(declare-fun m!687813 () Bool)

(assert (=> b!735405 m!687813))

(assert (=> b!735396 m!687785))

(assert (=> b!735396 m!687785))

(assert (=> b!735396 m!687799))

(assert (=> b!735402 m!687785))

(assert (=> b!735402 m!687785))

(assert (=> b!735402 m!687791))

(assert (=> b!735402 m!687785))

(assert (=> b!735402 m!687787))

(assert (=> b!735411 m!687785))

(assert (=> b!735411 m!687785))

(declare-fun m!687815 () Bool)

(assert (=> b!735411 m!687815))

(declare-fun m!687817 () Bool)

(assert (=> start!65128 m!687817))

(declare-fun m!687819 () Bool)

(assert (=> start!65128 m!687819))

(declare-fun m!687821 () Bool)

(assert (=> b!735400 m!687821))

(declare-fun m!687823 () Bool)

(assert (=> b!735397 m!687823))

(declare-fun m!687825 () Bool)

(assert (=> b!735391 m!687825))

(declare-fun m!687827 () Bool)

(assert (=> b!735404 m!687827))

(assert (=> b!735407 m!687785))

(assert (=> b!735407 m!687785))

(declare-fun m!687829 () Bool)

(assert (=> b!735407 m!687829))

(declare-fun m!687831 () Bool)

(assert (=> b!735398 m!687831))

(declare-fun m!687833 () Bool)

(assert (=> b!735398 m!687833))

(push 1)

