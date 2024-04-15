; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64454 () Bool)

(assert start!64454)

(declare-fun b!724912 () Bool)

(declare-fun res!486186 () Bool)

(declare-fun e!405968 () Bool)

(assert (=> b!724912 (=> (not res!486186) (not e!405968))))

(declare-datatypes ((array!40989 0))(
  ( (array!40990 (arr!19616 (Array (_ BitVec 32) (_ BitVec 64))) (size!20037 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40989)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!724912 (= res!486186 (and (= (size!20037 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20037 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20037 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724913 () Bool)

(declare-fun res!486190 () Bool)

(declare-fun e!405967 () Bool)

(assert (=> b!724913 (=> (not res!486190) (not e!405967))))

(declare-fun e!405973 () Bool)

(assert (=> b!724913 (= res!486190 e!405973)))

(declare-fun c!79737 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724913 (= c!79737 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724914 () Bool)

(declare-fun e!405971 () Bool)

(assert (=> b!724914 (= e!405971 e!405967)))

(declare-fun res!486195 () Bool)

(assert (=> b!724914 (=> (not res!486195) (not e!405967))))

(declare-datatypes ((SeekEntryResult!7213 0))(
  ( (MissingZero!7213 (index!31220 (_ BitVec 32))) (Found!7213 (index!31221 (_ BitVec 32))) (Intermediate!7213 (undefined!8025 Bool) (index!31222 (_ BitVec 32)) (x!62226 (_ BitVec 32))) (Undefined!7213) (MissingVacant!7213 (index!31223 (_ BitVec 32))) )
))
(declare-fun lt!321010 () SeekEntryResult!7213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40989 (_ BitVec 32)) SeekEntryResult!7213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724914 (= res!486195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19616 a!3186) j!159) mask!3328) (select (arr!19616 a!3186) j!159) a!3186 mask!3328) lt!321010))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!724914 (= lt!321010 (Intermediate!7213 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724915 () Bool)

(declare-fun res!486185 () Bool)

(assert (=> b!724915 (=> (not res!486185) (not e!405968))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724915 (= res!486185 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724916 () Bool)

(declare-fun res!486197 () Bool)

(assert (=> b!724916 (=> (not res!486197) (not e!405971))))

(declare-datatypes ((List!13657 0))(
  ( (Nil!13654) (Cons!13653 (h!14710 (_ BitVec 64)) (t!19963 List!13657)) )
))
(declare-fun arrayNoDuplicates!0 (array!40989 (_ BitVec 32) List!13657) Bool)

(assert (=> b!724916 (= res!486197 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13654))))

(declare-fun b!724917 () Bool)

(declare-fun e!405969 () Bool)

(assert (=> b!724917 (= e!405967 e!405969)))

(declare-fun res!486196 () Bool)

(assert (=> b!724917 (=> (not res!486196) (not e!405969))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321009 () (_ BitVec 64))

(declare-fun lt!321008 () array!40989)

(assert (=> b!724917 (= res!486196 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321009 mask!3328) lt!321009 lt!321008 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321009 lt!321008 mask!3328)))))

(assert (=> b!724917 (= lt!321009 (select (store (arr!19616 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724917 (= lt!321008 (array!40990 (store (arr!19616 a!3186) i!1173 k0!2102) (size!20037 a!3186)))))

(declare-fun b!724918 () Bool)

(assert (=> b!724918 (= e!405968 e!405971)))

(declare-fun res!486198 () Bool)

(assert (=> b!724918 (=> (not res!486198) (not e!405971))))

(declare-fun lt!321011 () SeekEntryResult!7213)

(assert (=> b!724918 (= res!486198 (or (= lt!321011 (MissingZero!7213 i!1173)) (= lt!321011 (MissingVacant!7213 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40989 (_ BitVec 32)) SeekEntryResult!7213)

(assert (=> b!724918 (= lt!321011 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!405970 () Bool)

(declare-fun lt!321006 () SeekEntryResult!7213)

(declare-fun b!724919 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40989 (_ BitVec 32)) SeekEntryResult!7213)

(assert (=> b!724919 (= e!405970 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19616 a!3186) j!159) a!3186 mask!3328) lt!321006))))

(declare-fun b!724920 () Bool)

(declare-fun res!486184 () Bool)

(assert (=> b!724920 (=> (not res!486184) (not e!405968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724920 (= res!486184 (validKeyInArray!0 k0!2102))))

(declare-fun res!486194 () Bool)

(assert (=> start!64454 (=> (not res!486194) (not e!405968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64454 (= res!486194 (validMask!0 mask!3328))))

(assert (=> start!64454 e!405968))

(assert (=> start!64454 true))

(declare-fun array_inv!15499 (array!40989) Bool)

(assert (=> start!64454 (array_inv!15499 a!3186)))

(declare-fun b!724921 () Bool)

(declare-fun res!486193 () Bool)

(assert (=> b!724921 (=> (not res!486193) (not e!405967))))

(assert (=> b!724921 (= res!486193 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19616 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724922 () Bool)

(assert (=> b!724922 (= e!405973 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19616 a!3186) j!159) a!3186 mask!3328) (Found!7213 j!159)))))

(declare-fun b!724923 () Bool)

(assert (=> b!724923 (= e!405973 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19616 a!3186) j!159) a!3186 mask!3328) lt!321010))))

(declare-fun b!724924 () Bool)

(declare-fun res!486187 () Bool)

(assert (=> b!724924 (=> (not res!486187) (not e!405968))))

(assert (=> b!724924 (= res!486187 (validKeyInArray!0 (select (arr!19616 a!3186) j!159)))))

(declare-fun b!724925 () Bool)

(declare-fun res!486192 () Bool)

(assert (=> b!724925 (=> (not res!486192) (not e!405971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40989 (_ BitVec 32)) Bool)

(assert (=> b!724925 (= res!486192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724926 () Bool)

(declare-fun res!486188 () Bool)

(assert (=> b!724926 (=> (not res!486188) (not e!405971))))

(assert (=> b!724926 (= res!486188 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20037 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20037 a!3186))))))

(declare-fun b!724927 () Bool)

(assert (=> b!724927 (= e!405969 (not true))))

(declare-fun e!405972 () Bool)

(assert (=> b!724927 e!405972))

(declare-fun res!486189 () Bool)

(assert (=> b!724927 (=> (not res!486189) (not e!405972))))

(assert (=> b!724927 (= res!486189 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24716 0))(
  ( (Unit!24717) )
))
(declare-fun lt!321007 () Unit!24716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24716)

(assert (=> b!724927 (= lt!321007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724928 () Bool)

(assert (=> b!724928 (= e!405972 e!405970)))

(declare-fun res!486191 () Bool)

(assert (=> b!724928 (=> (not res!486191) (not e!405970))))

(assert (=> b!724928 (= res!486191 (= (seekEntryOrOpen!0 (select (arr!19616 a!3186) j!159) a!3186 mask!3328) lt!321006))))

(assert (=> b!724928 (= lt!321006 (Found!7213 j!159))))

(assert (= (and start!64454 res!486194) b!724912))

(assert (= (and b!724912 res!486186) b!724924))

(assert (= (and b!724924 res!486187) b!724920))

(assert (= (and b!724920 res!486184) b!724915))

(assert (= (and b!724915 res!486185) b!724918))

(assert (= (and b!724918 res!486198) b!724925))

(assert (= (and b!724925 res!486192) b!724916))

(assert (= (and b!724916 res!486197) b!724926))

(assert (= (and b!724926 res!486188) b!724914))

(assert (= (and b!724914 res!486195) b!724921))

(assert (= (and b!724921 res!486193) b!724913))

(assert (= (and b!724913 c!79737) b!724923))

(assert (= (and b!724913 (not c!79737)) b!724922))

(assert (= (and b!724913 res!486190) b!724917))

(assert (= (and b!724917 res!486196) b!724927))

(assert (= (and b!724927 res!486189) b!724928))

(assert (= (and b!724928 res!486191) b!724919))

(declare-fun m!678593 () Bool)

(assert (=> b!724924 m!678593))

(assert (=> b!724924 m!678593))

(declare-fun m!678595 () Bool)

(assert (=> b!724924 m!678595))

(declare-fun m!678597 () Bool)

(assert (=> b!724915 m!678597))

(declare-fun m!678599 () Bool)

(assert (=> b!724927 m!678599))

(declare-fun m!678601 () Bool)

(assert (=> b!724927 m!678601))

(declare-fun m!678603 () Bool)

(assert (=> b!724920 m!678603))

(assert (=> b!724923 m!678593))

(assert (=> b!724923 m!678593))

(declare-fun m!678605 () Bool)

(assert (=> b!724923 m!678605))

(declare-fun m!678607 () Bool)

(assert (=> b!724925 m!678607))

(declare-fun m!678609 () Bool)

(assert (=> b!724921 m!678609))

(assert (=> b!724922 m!678593))

(assert (=> b!724922 m!678593))

(declare-fun m!678611 () Bool)

(assert (=> b!724922 m!678611))

(assert (=> b!724928 m!678593))

(assert (=> b!724928 m!678593))

(declare-fun m!678613 () Bool)

(assert (=> b!724928 m!678613))

(declare-fun m!678615 () Bool)

(assert (=> b!724917 m!678615))

(declare-fun m!678617 () Bool)

(assert (=> b!724917 m!678617))

(declare-fun m!678619 () Bool)

(assert (=> b!724917 m!678619))

(declare-fun m!678621 () Bool)

(assert (=> b!724917 m!678621))

(assert (=> b!724917 m!678617))

(declare-fun m!678623 () Bool)

(assert (=> b!724917 m!678623))

(declare-fun m!678625 () Bool)

(assert (=> b!724918 m!678625))

(assert (=> b!724919 m!678593))

(assert (=> b!724919 m!678593))

(declare-fun m!678627 () Bool)

(assert (=> b!724919 m!678627))

(declare-fun m!678629 () Bool)

(assert (=> b!724916 m!678629))

(assert (=> b!724914 m!678593))

(assert (=> b!724914 m!678593))

(declare-fun m!678631 () Bool)

(assert (=> b!724914 m!678631))

(assert (=> b!724914 m!678631))

(assert (=> b!724914 m!678593))

(declare-fun m!678633 () Bool)

(assert (=> b!724914 m!678633))

(declare-fun m!678635 () Bool)

(assert (=> start!64454 m!678635))

(declare-fun m!678637 () Bool)

(assert (=> start!64454 m!678637))

(check-sat (not b!724920) (not b!724915) (not b!724917) (not b!724928) (not b!724922) (not b!724927) (not b!724916) (not b!724919) (not b!724914) (not b!724925) (not b!724923) (not b!724918) (not b!724924) (not start!64454))
(check-sat)
