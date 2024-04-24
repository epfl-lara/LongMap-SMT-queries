; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65040 () Bool)

(assert start!65040)

(declare-fun b!733150 () Bool)

(declare-fun res!492306 () Bool)

(declare-fun e!410321 () Bool)

(assert (=> b!733150 (=> res!492306 e!410321)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41221 0))(
  ( (array!41222 (arr!19723 (Array (_ BitVec 32) (_ BitVec 64))) (size!20143 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41221)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7279 0))(
  ( (MissingZero!7279 (index!31484 (_ BitVec 32))) (Found!7279 (index!31485 (_ BitVec 32))) (Intermediate!7279 (undefined!8091 Bool) (index!31486 (_ BitVec 32)) (x!62641 (_ BitVec 32))) (Undefined!7279) (MissingVacant!7279 (index!31487 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41221 (_ BitVec 32)) SeekEntryResult!7279)

(assert (=> b!733150 (= res!492306 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) (Found!7279 j!159))))))

(declare-fun b!733151 () Bool)

(declare-fun res!492303 () Bool)

(declare-fun e!410325 () Bool)

(assert (=> b!733151 (=> (not res!492303) (not e!410325))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733151 (= res!492303 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20143 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20143 a!3186))))))

(declare-fun b!733152 () Bool)

(declare-fun res!492308 () Bool)

(declare-fun e!410328 () Bool)

(assert (=> b!733152 (=> (not res!492308) (not e!410328))))

(declare-fun e!410322 () Bool)

(assert (=> b!733152 (= res!492308 e!410322)))

(declare-fun c!80804 () Bool)

(assert (=> b!733152 (= c!80804 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733153 () Bool)

(declare-fun e!410323 () Bool)

(assert (=> b!733153 (= e!410323 e!410325)))

(declare-fun res!492318 () Bool)

(assert (=> b!733153 (=> (not res!492318) (not e!410325))))

(declare-fun lt!324876 () SeekEntryResult!7279)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733153 (= res!492318 (or (= lt!324876 (MissingZero!7279 i!1173)) (= lt!324876 (MissingVacant!7279 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41221 (_ BitVec 32)) SeekEntryResult!7279)

(assert (=> b!733153 (= lt!324876 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!733154 () Bool)

(declare-fun lt!324874 () SeekEntryResult!7279)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41221 (_ BitVec 32)) SeekEntryResult!7279)

(assert (=> b!733154 (= e!410322 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324874))))

(declare-fun b!733155 () Bool)

(declare-fun res!492316 () Bool)

(assert (=> b!733155 (=> (not res!492316) (not e!410323))))

(declare-fun arrayContainsKey!0 (array!41221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733155 (= res!492316 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733156 () Bool)

(declare-fun e!410320 () Bool)

(assert (=> b!733156 (= e!410320 e!410321)))

(declare-fun res!492312 () Bool)

(assert (=> b!733156 (=> res!492312 e!410321)))

(assert (=> b!733156 (= res!492312 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324873 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733156 (= lt!324873 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!733157 () Bool)

(declare-fun res!492310 () Bool)

(assert (=> b!733157 (=> (not res!492310) (not e!410328))))

(assert (=> b!733157 (= res!492310 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19723 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733158 () Bool)

(declare-fun res!492314 () Bool)

(assert (=> b!733158 (=> (not res!492314) (not e!410323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733158 (= res!492314 (validKeyInArray!0 (select (arr!19723 a!3186) j!159)))))

(declare-fun b!733159 () Bool)

(declare-fun e!410326 () Bool)

(assert (=> b!733159 (= e!410326 (not e!410320))))

(declare-fun res!492317 () Bool)

(assert (=> b!733159 (=> res!492317 e!410320)))

(declare-fun lt!324872 () SeekEntryResult!7279)

(get-info :version)

(assert (=> b!733159 (= res!492317 (or (not ((_ is Intermediate!7279) lt!324872)) (bvsge x!1131 (x!62641 lt!324872))))))

(declare-fun e!410319 () Bool)

(assert (=> b!733159 e!410319))

(declare-fun res!492307 () Bool)

(assert (=> b!733159 (=> (not res!492307) (not e!410319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41221 (_ BitVec 32)) Bool)

(assert (=> b!733159 (= res!492307 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24955 0))(
  ( (Unit!24956) )
))
(declare-fun lt!324869 () Unit!24955)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24955)

(assert (=> b!733159 (= lt!324869 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733160 () Bool)

(declare-fun res!492309 () Bool)

(assert (=> b!733160 (=> (not res!492309) (not e!410323))))

(assert (=> b!733160 (= res!492309 (validKeyInArray!0 k0!2102))))

(declare-fun res!492305 () Bool)

(assert (=> start!65040 (=> (not res!492305) (not e!410323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65040 (= res!492305 (validMask!0 mask!3328))))

(assert (=> start!65040 e!410323))

(assert (=> start!65040 true))

(declare-fun array_inv!15582 (array!41221) Bool)

(assert (=> start!65040 (array_inv!15582 a!3186)))

(declare-fun lt!324875 () SeekEntryResult!7279)

(declare-fun b!733149 () Bool)

(declare-fun e!410324 () Bool)

(assert (=> b!733149 (= e!410324 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324875))))

(declare-fun b!733161 () Bool)

(assert (=> b!733161 (= e!410321 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!324873 #b00000000000000000000000000000000) (bvsge lt!324873 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!733162 () Bool)

(declare-fun res!492315 () Bool)

(assert (=> b!733162 (=> (not res!492315) (not e!410323))))

(assert (=> b!733162 (= res!492315 (and (= (size!20143 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20143 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20143 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733163 () Bool)

(assert (=> b!733163 (= e!410319 e!410324)))

(declare-fun res!492313 () Bool)

(assert (=> b!733163 (=> (not res!492313) (not e!410324))))

(assert (=> b!733163 (= res!492313 (= (seekEntryOrOpen!0 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324875))))

(assert (=> b!733163 (= lt!324875 (Found!7279 j!159))))

(declare-fun b!733164 () Bool)

(declare-fun res!492304 () Bool)

(assert (=> b!733164 (=> (not res!492304) (not e!410325))))

(assert (=> b!733164 (= res!492304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733165 () Bool)

(assert (=> b!733165 (= e!410325 e!410328)))

(declare-fun res!492302 () Bool)

(assert (=> b!733165 (=> (not res!492302) (not e!410328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733165 (= res!492302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19723 a!3186) j!159) mask!3328) (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324874))))

(assert (=> b!733165 (= lt!324874 (Intermediate!7279 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733166 () Bool)

(assert (=> b!733166 (= e!410322 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) (Found!7279 j!159)))))

(declare-fun b!733167 () Bool)

(declare-fun res!492319 () Bool)

(assert (=> b!733167 (=> (not res!492319) (not e!410325))))

(declare-datatypes ((List!13632 0))(
  ( (Nil!13629) (Cons!13628 (h!14700 (_ BitVec 64)) (t!19939 List!13632)) )
))
(declare-fun arrayNoDuplicates!0 (array!41221 (_ BitVec 32) List!13632) Bool)

(assert (=> b!733167 (= res!492319 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13629))))

(declare-fun b!733168 () Bool)

(assert (=> b!733168 (= e!410328 e!410326)))

(declare-fun res!492311 () Bool)

(assert (=> b!733168 (=> (not res!492311) (not e!410326))))

(declare-fun lt!324870 () SeekEntryResult!7279)

(assert (=> b!733168 (= res!492311 (= lt!324870 lt!324872))))

(declare-fun lt!324871 () (_ BitVec 64))

(declare-fun lt!324868 () array!41221)

(assert (=> b!733168 (= lt!324872 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324871 lt!324868 mask!3328))))

(assert (=> b!733168 (= lt!324870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324871 mask!3328) lt!324871 lt!324868 mask!3328))))

(assert (=> b!733168 (= lt!324871 (select (store (arr!19723 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733168 (= lt!324868 (array!41222 (store (arr!19723 a!3186) i!1173 k0!2102) (size!20143 a!3186)))))

(assert (= (and start!65040 res!492305) b!733162))

(assert (= (and b!733162 res!492315) b!733158))

(assert (= (and b!733158 res!492314) b!733160))

(assert (= (and b!733160 res!492309) b!733155))

(assert (= (and b!733155 res!492316) b!733153))

(assert (= (and b!733153 res!492318) b!733164))

(assert (= (and b!733164 res!492304) b!733167))

(assert (= (and b!733167 res!492319) b!733151))

(assert (= (and b!733151 res!492303) b!733165))

(assert (= (and b!733165 res!492302) b!733157))

(assert (= (and b!733157 res!492310) b!733152))

(assert (= (and b!733152 c!80804) b!733154))

(assert (= (and b!733152 (not c!80804)) b!733166))

(assert (= (and b!733152 res!492308) b!733168))

(assert (= (and b!733168 res!492311) b!733159))

(assert (= (and b!733159 res!492307) b!733163))

(assert (= (and b!733163 res!492313) b!733149))

(assert (= (and b!733159 (not res!492317)) b!733156))

(assert (= (and b!733156 (not res!492312)) b!733150))

(assert (= (and b!733150 (not res!492306)) b!733161))

(declare-fun m!686619 () Bool)

(assert (=> b!733164 m!686619))

(declare-fun m!686621 () Bool)

(assert (=> b!733158 m!686621))

(assert (=> b!733158 m!686621))

(declare-fun m!686623 () Bool)

(assert (=> b!733158 m!686623))

(assert (=> b!733166 m!686621))

(assert (=> b!733166 m!686621))

(declare-fun m!686625 () Bool)

(assert (=> b!733166 m!686625))

(declare-fun m!686627 () Bool)

(assert (=> b!733167 m!686627))

(declare-fun m!686629 () Bool)

(assert (=> b!733168 m!686629))

(declare-fun m!686631 () Bool)

(assert (=> b!733168 m!686631))

(declare-fun m!686633 () Bool)

(assert (=> b!733168 m!686633))

(declare-fun m!686635 () Bool)

(assert (=> b!733168 m!686635))

(assert (=> b!733168 m!686631))

(declare-fun m!686637 () Bool)

(assert (=> b!733168 m!686637))

(assert (=> b!733163 m!686621))

(assert (=> b!733163 m!686621))

(declare-fun m!686639 () Bool)

(assert (=> b!733163 m!686639))

(declare-fun m!686641 () Bool)

(assert (=> start!65040 m!686641))

(declare-fun m!686643 () Bool)

(assert (=> start!65040 m!686643))

(declare-fun m!686645 () Bool)

(assert (=> b!733153 m!686645))

(declare-fun m!686647 () Bool)

(assert (=> b!733160 m!686647))

(declare-fun m!686649 () Bool)

(assert (=> b!733157 m!686649))

(declare-fun m!686651 () Bool)

(assert (=> b!733156 m!686651))

(assert (=> b!733165 m!686621))

(assert (=> b!733165 m!686621))

(declare-fun m!686653 () Bool)

(assert (=> b!733165 m!686653))

(assert (=> b!733165 m!686653))

(assert (=> b!733165 m!686621))

(declare-fun m!686655 () Bool)

(assert (=> b!733165 m!686655))

(declare-fun m!686657 () Bool)

(assert (=> b!733159 m!686657))

(declare-fun m!686659 () Bool)

(assert (=> b!733159 m!686659))

(assert (=> b!733154 m!686621))

(assert (=> b!733154 m!686621))

(declare-fun m!686661 () Bool)

(assert (=> b!733154 m!686661))

(assert (=> b!733149 m!686621))

(assert (=> b!733149 m!686621))

(declare-fun m!686663 () Bool)

(assert (=> b!733149 m!686663))

(assert (=> b!733150 m!686621))

(assert (=> b!733150 m!686621))

(assert (=> b!733150 m!686625))

(declare-fun m!686665 () Bool)

(assert (=> b!733155 m!686665))

(check-sat (not b!733166) (not b!733165) (not b!733150) (not b!733163) (not start!65040) (not b!733156) (not b!733168) (not b!733160) (not b!733155) (not b!733153) (not b!733167) (not b!733159) (not b!733164) (not b!733154) (not b!733158) (not b!733149))
(check-sat)
