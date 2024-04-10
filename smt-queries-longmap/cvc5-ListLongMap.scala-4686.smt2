; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65176 () Bool)

(assert start!65176)

(declare-fun b!737116 () Bool)

(declare-fun res!495444 () Bool)

(declare-fun e!412311 () Bool)

(assert (=> b!737116 (=> (not res!495444) (not e!412311))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41349 0))(
  ( (array!41350 (arr!19788 (Array (_ BitVec 32) (_ BitVec 64))) (size!20209 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41349)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737116 (= res!495444 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19788 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737117 () Bool)

(declare-fun e!412313 () Bool)

(declare-fun e!412317 () Bool)

(assert (=> b!737117 (= e!412313 e!412317)))

(declare-fun res!495452 () Bool)

(assert (=> b!737117 (=> (not res!495452) (not e!412317))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7388 0))(
  ( (MissingZero!7388 (index!31920 (_ BitVec 32))) (Found!7388 (index!31921 (_ BitVec 32))) (Intermediate!7388 (undefined!8200 Bool) (index!31922 (_ BitVec 32)) (x!62922 (_ BitVec 32))) (Undefined!7388) (MissingVacant!7388 (index!31923 (_ BitVec 32))) )
))
(declare-fun lt!326997 () SeekEntryResult!7388)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41349 (_ BitVec 32)) SeekEntryResult!7388)

(assert (=> b!737117 (= res!495452 (= (seekEntryOrOpen!0 (select (arr!19788 a!3186) j!159) a!3186 mask!3328) lt!326997))))

(assert (=> b!737117 (= lt!326997 (Found!7388 j!159))))

(declare-fun b!737118 () Bool)

(declare-fun res!495447 () Bool)

(declare-fun e!412322 () Bool)

(assert (=> b!737118 (=> (not res!495447) (not e!412322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41349 (_ BitVec 32)) Bool)

(assert (=> b!737118 (= res!495447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!495437 () Bool)

(declare-fun e!412321 () Bool)

(assert (=> start!65176 (=> (not res!495437) (not e!412321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65176 (= res!495437 (validMask!0 mask!3328))))

(assert (=> start!65176 e!412321))

(assert (=> start!65176 true))

(declare-fun array_inv!15584 (array!41349) Bool)

(assert (=> start!65176 (array_inv!15584 a!3186)))

(declare-fun b!737119 () Bool)

(declare-fun res!495442 () Bool)

(assert (=> b!737119 (=> (not res!495442) (not e!412311))))

(declare-fun e!412315 () Bool)

(assert (=> b!737119 (= res!495442 e!412315)))

(declare-fun c!81222 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737119 (= c!81222 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737120 () Bool)

(declare-fun e!412318 () Bool)

(assert (=> b!737120 (= e!412311 e!412318)))

(declare-fun res!495435 () Bool)

(assert (=> b!737120 (=> (not res!495435) (not e!412318))))

(declare-fun lt!327005 () SeekEntryResult!7388)

(declare-fun lt!327000 () SeekEntryResult!7388)

(assert (=> b!737120 (= res!495435 (= lt!327005 lt!327000))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!326994 () array!41349)

(declare-fun lt!326999 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41349 (_ BitVec 32)) SeekEntryResult!7388)

(assert (=> b!737120 (= lt!327000 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326999 lt!326994 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737120 (= lt!327005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326999 mask!3328) lt!326999 lt!326994 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!737120 (= lt!326999 (select (store (arr!19788 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737120 (= lt!326994 (array!41350 (store (arr!19788 a!3186) i!1173 k!2102) (size!20209 a!3186)))))

(declare-fun b!737121 () Bool)

(declare-fun res!495439 () Bool)

(assert (=> b!737121 (=> (not res!495439) (not e!412321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737121 (= res!495439 (validKeyInArray!0 (select (arr!19788 a!3186) j!159)))))

(declare-fun b!737122 () Bool)

(declare-fun lt!327001 () SeekEntryResult!7388)

(declare-fun lt!327004 () (_ BitVec 32))

(declare-fun e!412312 () Bool)

(assert (=> b!737122 (= e!412312 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 (select (arr!19788 a!3186) j!159) a!3186 mask!3328) lt!327001)))))

(declare-fun b!737123 () Bool)

(declare-fun res!495451 () Bool)

(declare-fun e!412319 () Bool)

(assert (=> b!737123 (=> res!495451 e!412319)))

(assert (=> b!737123 (= res!495451 e!412312)))

(declare-fun c!81221 () Bool)

(declare-fun lt!326998 () Bool)

(assert (=> b!737123 (= c!81221 lt!326998)))

(declare-fun b!737124 () Bool)

(declare-fun res!495441 () Bool)

(assert (=> b!737124 (=> (not res!495441) (not e!412321))))

(assert (=> b!737124 (= res!495441 (and (= (size!20209 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20209 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20209 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737125 () Bool)

(declare-fun res!495436 () Bool)

(assert (=> b!737125 (=> (not res!495436) (not e!412322))))

(declare-datatypes ((List!13790 0))(
  ( (Nil!13787) (Cons!13786 (h!14858 (_ BitVec 64)) (t!20105 List!13790)) )
))
(declare-fun arrayNoDuplicates!0 (array!41349 (_ BitVec 32) List!13790) Bool)

(assert (=> b!737125 (= res!495436 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13787))))

(declare-fun b!737126 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41349 (_ BitVec 32)) SeekEntryResult!7388)

(assert (=> b!737126 (= e!412315 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19788 a!3186) j!159) a!3186 mask!3328) (Found!7388 j!159)))))

(declare-fun b!737127 () Bool)

(declare-fun res!495440 () Bool)

(assert (=> b!737127 (=> (not res!495440) (not e!412322))))

(assert (=> b!737127 (= res!495440 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20209 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20209 a!3186))))))

(declare-fun b!737128 () Bool)

(declare-fun res!495443 () Bool)

(assert (=> b!737128 (=> (not res!495443) (not e!412321))))

(assert (=> b!737128 (= res!495443 (validKeyInArray!0 k!2102))))

(declare-fun b!737129 () Bool)

(declare-fun e!412316 () Bool)

(assert (=> b!737129 (= e!412316 e!412319)))

(declare-fun res!495446 () Bool)

(assert (=> b!737129 (=> res!495446 e!412319)))

(assert (=> b!737129 (= res!495446 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327004 #b00000000000000000000000000000000) (bvsge lt!327004 (size!20209 a!3186))))))

(declare-datatypes ((Unit!25148 0))(
  ( (Unit!25149) )
))
(declare-fun lt!326995 () Unit!25148)

(declare-fun e!412320 () Unit!25148)

(assert (=> b!737129 (= lt!326995 e!412320)))

(declare-fun c!81223 () Bool)

(assert (=> b!737129 (= c!81223 lt!326998)))

(assert (=> b!737129 (= lt!326998 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737129 (= lt!327004 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737130 () Bool)

(assert (=> b!737130 (= e!412322 e!412311)))

(declare-fun res!495445 () Bool)

(assert (=> b!737130 (=> (not res!495445) (not e!412311))))

(assert (=> b!737130 (= res!495445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19788 a!3186) j!159) mask!3328) (select (arr!19788 a!3186) j!159) a!3186 mask!3328) lt!327001))))

(assert (=> b!737130 (= lt!327001 (Intermediate!7388 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737131 () Bool)

(assert (=> b!737131 (= e!412317 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19788 a!3186) j!159) a!3186 mask!3328) lt!326997))))

(declare-fun b!737132 () Bool)

(assert (=> b!737132 (= e!412315 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19788 a!3186) j!159) a!3186 mask!3328) lt!327001))))

(declare-fun b!737133 () Bool)

(declare-fun Unit!25150 () Unit!25148)

(assert (=> b!737133 (= e!412320 Unit!25150)))

(declare-fun lt!327003 () SeekEntryResult!7388)

(assert (=> b!737133 (= lt!327003 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19788 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327002 () SeekEntryResult!7388)

(assert (=> b!737133 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 resIntermediateIndex!5 (select (arr!19788 a!3186) j!159) a!3186 mask!3328) lt!327002)))

(declare-fun b!737134 () Bool)

(declare-fun Unit!25151 () Unit!25148)

(assert (=> b!737134 (= e!412320 Unit!25151)))

(assert (=> b!737134 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 (select (arr!19788 a!3186) j!159) a!3186 mask!3328) lt!327001)))

(declare-fun b!737135 () Bool)

(assert (=> b!737135 (= e!412319 true)))

(declare-fun lt!326996 () SeekEntryResult!7388)

(assert (=> b!737135 (= lt!326996 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 lt!326999 lt!326994 mask!3328))))

(declare-fun b!737136 () Bool)

(assert (=> b!737136 (= e!412318 (not e!412316))))

(declare-fun res!495448 () Bool)

(assert (=> b!737136 (=> res!495448 e!412316)))

(assert (=> b!737136 (= res!495448 (or (not (is-Intermediate!7388 lt!327000)) (bvsge x!1131 (x!62922 lt!327000))))))

(assert (=> b!737136 (= lt!327002 (Found!7388 j!159))))

(assert (=> b!737136 e!412313))

(declare-fun res!495438 () Bool)

(assert (=> b!737136 (=> (not res!495438) (not e!412313))))

(assert (=> b!737136 (= res!495438 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326992 () Unit!25148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41349 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25148)

(assert (=> b!737136 (= lt!326992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737137 () Bool)

(assert (=> b!737137 (= e!412312 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 resIntermediateIndex!5 (select (arr!19788 a!3186) j!159) a!3186 mask!3328) lt!327002)))))

(declare-fun b!737138 () Bool)

(assert (=> b!737138 (= e!412321 e!412322)))

(declare-fun res!495449 () Bool)

(assert (=> b!737138 (=> (not res!495449) (not e!412322))))

(declare-fun lt!326993 () SeekEntryResult!7388)

(assert (=> b!737138 (= res!495449 (or (= lt!326993 (MissingZero!7388 i!1173)) (= lt!326993 (MissingVacant!7388 i!1173))))))

(assert (=> b!737138 (= lt!326993 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!737139 () Bool)

(declare-fun res!495450 () Bool)

(assert (=> b!737139 (=> (not res!495450) (not e!412321))))

(declare-fun arrayContainsKey!0 (array!41349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737139 (= res!495450 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65176 res!495437) b!737124))

(assert (= (and b!737124 res!495441) b!737121))

(assert (= (and b!737121 res!495439) b!737128))

(assert (= (and b!737128 res!495443) b!737139))

(assert (= (and b!737139 res!495450) b!737138))

(assert (= (and b!737138 res!495449) b!737118))

(assert (= (and b!737118 res!495447) b!737125))

(assert (= (and b!737125 res!495436) b!737127))

(assert (= (and b!737127 res!495440) b!737130))

(assert (= (and b!737130 res!495445) b!737116))

(assert (= (and b!737116 res!495444) b!737119))

(assert (= (and b!737119 c!81222) b!737132))

(assert (= (and b!737119 (not c!81222)) b!737126))

(assert (= (and b!737119 res!495442) b!737120))

(assert (= (and b!737120 res!495435) b!737136))

(assert (= (and b!737136 res!495438) b!737117))

(assert (= (and b!737117 res!495452) b!737131))

(assert (= (and b!737136 (not res!495448)) b!737129))

(assert (= (and b!737129 c!81223) b!737134))

(assert (= (and b!737129 (not c!81223)) b!737133))

(assert (= (and b!737129 (not res!495446)) b!737123))

(assert (= (and b!737123 c!81221) b!737122))

(assert (= (and b!737123 (not c!81221)) b!737137))

(assert (= (and b!737123 (not res!495451)) b!737135))

(declare-fun m!689077 () Bool)

(assert (=> b!737122 m!689077))

(assert (=> b!737122 m!689077))

(declare-fun m!689079 () Bool)

(assert (=> b!737122 m!689079))

(declare-fun m!689081 () Bool)

(assert (=> b!737118 m!689081))

(assert (=> b!737133 m!689077))

(assert (=> b!737133 m!689077))

(declare-fun m!689083 () Bool)

(assert (=> b!737133 m!689083))

(assert (=> b!737133 m!689077))

(declare-fun m!689085 () Bool)

(assert (=> b!737133 m!689085))

(assert (=> b!737126 m!689077))

(assert (=> b!737126 m!689077))

(assert (=> b!737126 m!689083))

(declare-fun m!689087 () Bool)

(assert (=> b!737120 m!689087))

(declare-fun m!689089 () Bool)

(assert (=> b!737120 m!689089))

(declare-fun m!689091 () Bool)

(assert (=> b!737120 m!689091))

(declare-fun m!689093 () Bool)

(assert (=> b!737120 m!689093))

(declare-fun m!689095 () Bool)

(assert (=> b!737120 m!689095))

(assert (=> b!737120 m!689089))

(declare-fun m!689097 () Bool)

(assert (=> b!737116 m!689097))

(declare-fun m!689099 () Bool)

(assert (=> start!65176 m!689099))

(declare-fun m!689101 () Bool)

(assert (=> start!65176 m!689101))

(assert (=> b!737134 m!689077))

(assert (=> b!737134 m!689077))

(assert (=> b!737134 m!689079))

(declare-fun m!689103 () Bool)

(assert (=> b!737138 m!689103))

(declare-fun m!689105 () Bool)

(assert (=> b!737139 m!689105))

(assert (=> b!737132 m!689077))

(assert (=> b!737132 m!689077))

(declare-fun m!689107 () Bool)

(assert (=> b!737132 m!689107))

(declare-fun m!689109 () Bool)

(assert (=> b!737136 m!689109))

(declare-fun m!689111 () Bool)

(assert (=> b!737136 m!689111))

(assert (=> b!737137 m!689077))

(assert (=> b!737137 m!689077))

(assert (=> b!737137 m!689085))

(assert (=> b!737130 m!689077))

(assert (=> b!737130 m!689077))

(declare-fun m!689113 () Bool)

(assert (=> b!737130 m!689113))

(assert (=> b!737130 m!689113))

(assert (=> b!737130 m!689077))

(declare-fun m!689115 () Bool)

(assert (=> b!737130 m!689115))

(declare-fun m!689117 () Bool)

(assert (=> b!737129 m!689117))

(assert (=> b!737121 m!689077))

(assert (=> b!737121 m!689077))

(declare-fun m!689119 () Bool)

(assert (=> b!737121 m!689119))

(assert (=> b!737131 m!689077))

(assert (=> b!737131 m!689077))

(declare-fun m!689121 () Bool)

(assert (=> b!737131 m!689121))

(assert (=> b!737117 m!689077))

(assert (=> b!737117 m!689077))

(declare-fun m!689123 () Bool)

(assert (=> b!737117 m!689123))

(declare-fun m!689125 () Bool)

(assert (=> b!737128 m!689125))

(declare-fun m!689127 () Bool)

(assert (=> b!737135 m!689127))

(declare-fun m!689129 () Bool)

(assert (=> b!737125 m!689129))

(push 1)

