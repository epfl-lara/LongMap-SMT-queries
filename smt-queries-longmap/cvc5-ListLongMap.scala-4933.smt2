; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67908 () Bool)

(assert start!67908)

(declare-fun b!790185 () Bool)

(declare-fun e!439188 () Bool)

(declare-fun e!439190 () Bool)

(assert (=> b!790185 (= e!439188 e!439190)))

(declare-fun res!535339 () Bool)

(assert (=> b!790185 (=> res!535339 e!439190)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42885 0))(
  ( (array!42886 (arr!20529 (Array (_ BitVec 32) (_ BitVec 64))) (size!20950 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42885)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!790185 (= res!535339 (or (not (= (select (arr!20529 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-datatypes ((SeekEntryResult!8129 0))(
  ( (MissingZero!8129 (index!34884 (_ BitVec 32))) (Found!8129 (index!34885 (_ BitVec 32))) (Intermediate!8129 (undefined!8941 Bool) (index!34886 (_ BitVec 32)) (x!65822 (_ BitVec 32))) (Undefined!8129) (MissingVacant!8129 (index!34887 (_ BitVec 32))) )
))
(declare-fun lt!352735 () SeekEntryResult!8129)

(declare-fun lt!352737 () SeekEntryResult!8129)

(declare-fun lt!352738 () SeekEntryResult!8129)

(declare-fun lt!352733 () SeekEntryResult!8129)

(assert (=> b!790185 (and (= lt!352738 lt!352737) (= lt!352733 lt!352735))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!352729 () (_ BitVec 64))

(declare-fun lt!352741 () array!42885)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42885 (_ BitVec 32)) SeekEntryResult!8129)

(assert (=> b!790185 (= lt!352737 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352729 lt!352741 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42885 (_ BitVec 32)) SeekEntryResult!8129)

(assert (=> b!790185 (= lt!352738 (seekEntryOrOpen!0 lt!352729 lt!352741 mask!3328))))

(declare-fun lt!352734 () (_ BitVec 64))

(assert (=> b!790185 (= lt!352734 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!27404 0))(
  ( (Unit!27405) )
))
(declare-fun lt!352736 () Unit!27404)

(declare-fun e!439182 () Unit!27404)

(assert (=> b!790185 (= lt!352736 e!439182)))

(declare-fun c!87838 () Bool)

(assert (=> b!790185 (= c!87838 (= lt!352734 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790186 () Bool)

(declare-fun res!535344 () Bool)

(declare-fun e!439179 () Bool)

(assert (=> b!790186 (=> (not res!535344) (not e!439179))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790186 (= res!535344 (validKeyInArray!0 k!2102))))

(declare-fun e!439184 () Bool)

(declare-fun b!790187 () Bool)

(declare-fun lt!352728 () SeekEntryResult!8129)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42885 (_ BitVec 32)) SeekEntryResult!8129)

(assert (=> b!790187 (= e!439184 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20529 a!3186) j!159) a!3186 mask!3328) lt!352728))))

(declare-fun lt!352731 () SeekEntryResult!8129)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!790188 () Bool)

(declare-fun e!439181 () Bool)

(assert (=> b!790188 (= e!439181 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20529 a!3186) j!159) a!3186 mask!3328) lt!352731))))

(declare-fun b!790189 () Bool)

(declare-fun res!535331 () Bool)

(declare-fun e!439189 () Bool)

(assert (=> b!790189 (=> (not res!535331) (not e!439189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42885 (_ BitVec 32)) Bool)

(assert (=> b!790189 (= res!535331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790191 () Bool)

(assert (=> b!790191 (= e!439190 (= lt!352738 lt!352731))))

(assert (=> b!790191 (= lt!352737 lt!352735)))

(declare-fun lt!352739 () Unit!27404)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42885 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27404)

(assert (=> b!790191 (= lt!352739 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!790192 () Bool)

(declare-fun e!439187 () Bool)

(assert (=> b!790192 (= e!439189 e!439187)))

(declare-fun res!535330 () Bool)

(assert (=> b!790192 (=> (not res!535330) (not e!439187))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790192 (= res!535330 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20529 a!3186) j!159) mask!3328) (select (arr!20529 a!3186) j!159) a!3186 mask!3328) lt!352728))))

(assert (=> b!790192 (= lt!352728 (Intermediate!8129 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790193 () Bool)

(declare-fun Unit!27406 () Unit!27404)

(assert (=> b!790193 (= e!439182 Unit!27406)))

(assert (=> b!790193 false))

(declare-fun b!790194 () Bool)

(assert (=> b!790194 (= e!439179 e!439189)))

(declare-fun res!535346 () Bool)

(assert (=> b!790194 (=> (not res!535346) (not e!439189))))

(declare-fun lt!352740 () SeekEntryResult!8129)

(assert (=> b!790194 (= res!535346 (or (= lt!352740 (MissingZero!8129 i!1173)) (= lt!352740 (MissingVacant!8129 i!1173))))))

(assert (=> b!790194 (= lt!352740 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!790195 () Bool)

(declare-fun res!535341 () Bool)

(assert (=> b!790195 (=> (not res!535341) (not e!439179))))

(assert (=> b!790195 (= res!535341 (validKeyInArray!0 (select (arr!20529 a!3186) j!159)))))

(declare-fun b!790196 () Bool)

(declare-fun res!535332 () Bool)

(assert (=> b!790196 (=> (not res!535332) (not e!439179))))

(declare-fun arrayContainsKey!0 (array!42885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790196 (= res!535332 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790197 () Bool)

(declare-fun res!535343 () Bool)

(assert (=> b!790197 (=> (not res!535343) (not e!439179))))

(assert (=> b!790197 (= res!535343 (and (= (size!20950 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20950 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20950 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790198 () Bool)

(assert (=> b!790198 (= e!439184 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20529 a!3186) j!159) a!3186 mask!3328) (Found!8129 j!159)))))

(declare-fun b!790199 () Bool)

(declare-fun res!535337 () Bool)

(assert (=> b!790199 (=> (not res!535337) (not e!439187))))

(assert (=> b!790199 (= res!535337 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20529 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790200 () Bool)

(declare-fun e!439180 () Bool)

(declare-fun e!439186 () Bool)

(assert (=> b!790200 (= e!439180 e!439186)))

(declare-fun res!535336 () Bool)

(assert (=> b!790200 (=> res!535336 e!439186)))

(assert (=> b!790200 (= res!535336 (not (= lt!352735 lt!352731)))))

(assert (=> b!790200 (= lt!352735 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20529 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790201 () Bool)

(declare-fun res!535335 () Bool)

(assert (=> b!790201 (=> (not res!535335) (not e!439189))))

(assert (=> b!790201 (= res!535335 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20950 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20950 a!3186))))))

(declare-fun b!790202 () Bool)

(declare-fun res!535345 () Bool)

(assert (=> b!790202 (=> (not res!535345) (not e!439187))))

(assert (=> b!790202 (= res!535345 e!439184)))

(declare-fun c!87837 () Bool)

(assert (=> b!790202 (= c!87837 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790203 () Bool)

(declare-fun res!535338 () Bool)

(assert (=> b!790203 (=> (not res!535338) (not e!439189))))

(declare-datatypes ((List!14531 0))(
  ( (Nil!14528) (Cons!14527 (h!15653 (_ BitVec 64)) (t!20846 List!14531)) )
))
(declare-fun arrayNoDuplicates!0 (array!42885 (_ BitVec 32) List!14531) Bool)

(assert (=> b!790203 (= res!535338 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14528))))

(declare-fun b!790204 () Bool)

(declare-fun Unit!27407 () Unit!27404)

(assert (=> b!790204 (= e!439182 Unit!27407)))

(declare-fun b!790205 () Bool)

(declare-fun e!439183 () Bool)

(assert (=> b!790205 (= e!439187 e!439183)))

(declare-fun res!535340 () Bool)

(assert (=> b!790205 (=> (not res!535340) (not e!439183))))

(declare-fun lt!352730 () SeekEntryResult!8129)

(declare-fun lt!352732 () SeekEntryResult!8129)

(assert (=> b!790205 (= res!535340 (= lt!352730 lt!352732))))

(assert (=> b!790205 (= lt!352732 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352729 lt!352741 mask!3328))))

(assert (=> b!790205 (= lt!352730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352729 mask!3328) lt!352729 lt!352741 mask!3328))))

(assert (=> b!790205 (= lt!352729 (select (store (arr!20529 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!790205 (= lt!352741 (array!42886 (store (arr!20529 a!3186) i!1173 k!2102) (size!20950 a!3186)))))

(declare-fun b!790206 () Bool)

(assert (=> b!790206 (= e!439183 (not e!439180))))

(declare-fun res!535333 () Bool)

(assert (=> b!790206 (=> res!535333 e!439180)))

(assert (=> b!790206 (= res!535333 (or (not (is-Intermediate!8129 lt!352732)) (bvslt x!1131 (x!65822 lt!352732)) (not (= x!1131 (x!65822 lt!352732))) (not (= index!1321 (index!34886 lt!352732)))))))

(assert (=> b!790206 e!439181))

(declare-fun res!535342 () Bool)

(assert (=> b!790206 (=> (not res!535342) (not e!439181))))

(assert (=> b!790206 (= res!535342 (= lt!352733 lt!352731))))

(assert (=> b!790206 (= lt!352731 (Found!8129 j!159))))

(assert (=> b!790206 (= lt!352733 (seekEntryOrOpen!0 (select (arr!20529 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!790206 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352742 () Unit!27404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27404)

(assert (=> b!790206 (= lt!352742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790190 () Bool)

(assert (=> b!790190 (= e!439186 e!439188)))

(declare-fun res!535329 () Bool)

(assert (=> b!790190 (=> res!535329 e!439188)))

(assert (=> b!790190 (= res!535329 (= lt!352734 lt!352729))))

(assert (=> b!790190 (= lt!352734 (select (store (arr!20529 a!3186) i!1173 k!2102) index!1321))))

(declare-fun res!535334 () Bool)

(assert (=> start!67908 (=> (not res!535334) (not e!439179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67908 (= res!535334 (validMask!0 mask!3328))))

(assert (=> start!67908 e!439179))

(assert (=> start!67908 true))

(declare-fun array_inv!16325 (array!42885) Bool)

(assert (=> start!67908 (array_inv!16325 a!3186)))

(assert (= (and start!67908 res!535334) b!790197))

(assert (= (and b!790197 res!535343) b!790195))

(assert (= (and b!790195 res!535341) b!790186))

(assert (= (and b!790186 res!535344) b!790196))

(assert (= (and b!790196 res!535332) b!790194))

(assert (= (and b!790194 res!535346) b!790189))

(assert (= (and b!790189 res!535331) b!790203))

(assert (= (and b!790203 res!535338) b!790201))

(assert (= (and b!790201 res!535335) b!790192))

(assert (= (and b!790192 res!535330) b!790199))

(assert (= (and b!790199 res!535337) b!790202))

(assert (= (and b!790202 c!87837) b!790187))

(assert (= (and b!790202 (not c!87837)) b!790198))

(assert (= (and b!790202 res!535345) b!790205))

(assert (= (and b!790205 res!535340) b!790206))

(assert (= (and b!790206 res!535342) b!790188))

(assert (= (and b!790206 (not res!535333)) b!790200))

(assert (= (and b!790200 (not res!535336)) b!790190))

(assert (= (and b!790190 (not res!535329)) b!790185))

(assert (= (and b!790185 c!87838) b!790193))

(assert (= (and b!790185 (not c!87838)) b!790204))

(assert (= (and b!790185 (not res!535339)) b!790191))

(declare-fun m!731141 () Bool)

(assert (=> b!790196 m!731141))

(declare-fun m!731143 () Bool)

(assert (=> b!790195 m!731143))

(assert (=> b!790195 m!731143))

(declare-fun m!731145 () Bool)

(assert (=> b!790195 m!731145))

(assert (=> b!790188 m!731143))

(assert (=> b!790188 m!731143))

(declare-fun m!731147 () Bool)

(assert (=> b!790188 m!731147))

(assert (=> b!790206 m!731143))

(assert (=> b!790206 m!731143))

(declare-fun m!731149 () Bool)

(assert (=> b!790206 m!731149))

(declare-fun m!731151 () Bool)

(assert (=> b!790206 m!731151))

(declare-fun m!731153 () Bool)

(assert (=> b!790206 m!731153))

(declare-fun m!731155 () Bool)

(assert (=> b!790189 m!731155))

(assert (=> b!790192 m!731143))

(assert (=> b!790192 m!731143))

(declare-fun m!731157 () Bool)

(assert (=> b!790192 m!731157))

(assert (=> b!790192 m!731157))

(assert (=> b!790192 m!731143))

(declare-fun m!731159 () Bool)

(assert (=> b!790192 m!731159))

(declare-fun m!731161 () Bool)

(assert (=> b!790203 m!731161))

(assert (=> b!790200 m!731143))

(assert (=> b!790200 m!731143))

(declare-fun m!731163 () Bool)

(assert (=> b!790200 m!731163))

(declare-fun m!731165 () Bool)

(assert (=> b!790191 m!731165))

(assert (=> b!790187 m!731143))

(assert (=> b!790187 m!731143))

(declare-fun m!731167 () Bool)

(assert (=> b!790187 m!731167))

(declare-fun m!731169 () Bool)

(assert (=> b!790186 m!731169))

(assert (=> b!790198 m!731143))

(assert (=> b!790198 m!731143))

(assert (=> b!790198 m!731163))

(declare-fun m!731171 () Bool)

(assert (=> start!67908 m!731171))

(declare-fun m!731173 () Bool)

(assert (=> start!67908 m!731173))

(declare-fun m!731175 () Bool)

(assert (=> b!790194 m!731175))

(declare-fun m!731177 () Bool)

(assert (=> b!790185 m!731177))

(declare-fun m!731179 () Bool)

(assert (=> b!790185 m!731179))

(declare-fun m!731181 () Bool)

(assert (=> b!790185 m!731181))

(declare-fun m!731183 () Bool)

(assert (=> b!790199 m!731183))

(declare-fun m!731185 () Bool)

(assert (=> b!790205 m!731185))

(declare-fun m!731187 () Bool)

(assert (=> b!790205 m!731187))

(declare-fun m!731189 () Bool)

(assert (=> b!790205 m!731189))

(assert (=> b!790205 m!731185))

(declare-fun m!731191 () Bool)

(assert (=> b!790205 m!731191))

(declare-fun m!731193 () Bool)

(assert (=> b!790205 m!731193))

(assert (=> b!790190 m!731187))

(declare-fun m!731195 () Bool)

(assert (=> b!790190 m!731195))

(push 1)

