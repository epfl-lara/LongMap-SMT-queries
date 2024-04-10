; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64512 () Bool)

(assert start!64512)

(declare-fun b!726140 () Bool)

(declare-fun res!487160 () Bool)

(declare-fun e!406588 () Bool)

(assert (=> b!726140 (=> (not res!487160) (not e!406588))))

(declare-datatypes ((array!41030 0))(
  ( (array!41031 (arr!19636 (Array (_ BitVec 32) (_ BitVec 64))) (size!20057 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41030)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!726140 (= res!487160 (and (= (size!20057 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20057 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20057 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!726141 () Bool)

(declare-datatypes ((SeekEntryResult!7236 0))(
  ( (MissingZero!7236 (index!31312 (_ BitVec 32))) (Found!7236 (index!31313 (_ BitVec 32))) (Intermediate!7236 (undefined!8048 Bool) (index!31314 (_ BitVec 32)) (x!62302 (_ BitVec 32))) (Undefined!7236) (MissingVacant!7236 (index!31315 (_ BitVec 32))) )
))
(declare-fun lt!321592 () SeekEntryResult!7236)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!406587 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41030 (_ BitVec 32)) SeekEntryResult!7236)

(assert (=> b!726141 (= e!406587 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19636 a!3186) j!159) a!3186 mask!3328) lt!321592))))

(declare-fun b!726142 () Bool)

(declare-fun res!487158 () Bool)

(assert (=> b!726142 (=> (not res!487158) (not e!406588))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726142 (= res!487158 (validKeyInArray!0 k0!2102))))

(declare-fun res!487170 () Bool)

(assert (=> start!64512 (=> (not res!487170) (not e!406588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64512 (= res!487170 (validMask!0 mask!3328))))

(assert (=> start!64512 e!406588))

(assert (=> start!64512 true))

(declare-fun array_inv!15432 (array!41030) Bool)

(assert (=> start!64512 (array_inv!15432 a!3186)))

(declare-fun b!726143 () Bool)

(declare-fun res!487162 () Bool)

(declare-fun e!406586 () Bool)

(assert (=> b!726143 (=> (not res!487162) (not e!406586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41030 (_ BitVec 32)) Bool)

(assert (=> b!726143 (= res!487162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726144 () Bool)

(declare-fun e!406590 () Bool)

(assert (=> b!726144 (= e!406590 e!406587)))

(declare-fun res!487165 () Bool)

(assert (=> b!726144 (=> (not res!487165) (not e!406587))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41030 (_ BitVec 32)) SeekEntryResult!7236)

(assert (=> b!726144 (= res!487165 (= (seekEntryOrOpen!0 (select (arr!19636 a!3186) j!159) a!3186 mask!3328) lt!321592))))

(assert (=> b!726144 (= lt!321592 (Found!7236 j!159))))

(declare-fun b!726145 () Bool)

(assert (=> b!726145 (= e!406588 e!406586)))

(declare-fun res!487161 () Bool)

(assert (=> b!726145 (=> (not res!487161) (not e!406586))))

(declare-fun lt!321588 () SeekEntryResult!7236)

(assert (=> b!726145 (= res!487161 (or (= lt!321588 (MissingZero!7236 i!1173)) (= lt!321588 (MissingVacant!7236 i!1173))))))

(assert (=> b!726145 (= lt!321588 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726146 () Bool)

(declare-fun e!406592 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!726146 (= e!406592 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19636 a!3186) j!159) a!3186 mask!3328) (Found!7236 j!159)))))

(declare-fun b!726147 () Bool)

(declare-fun e!406589 () Bool)

(declare-fun e!406591 () Bool)

(assert (=> b!726147 (= e!406589 e!406591)))

(declare-fun res!487169 () Bool)

(assert (=> b!726147 (=> (not res!487169) (not e!406591))))

(declare-fun lt!321590 () array!41030)

(declare-fun lt!321591 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41030 (_ BitVec 32)) SeekEntryResult!7236)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726147 (= res!487169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321591 mask!3328) lt!321591 lt!321590 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321591 lt!321590 mask!3328)))))

(assert (=> b!726147 (= lt!321591 (select (store (arr!19636 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726147 (= lt!321590 (array!41031 (store (arr!19636 a!3186) i!1173 k0!2102) (size!20057 a!3186)))))

(declare-fun b!726148 () Bool)

(declare-fun res!487163 () Bool)

(assert (=> b!726148 (=> (not res!487163) (not e!406589))))

(assert (=> b!726148 (= res!487163 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19636 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726149 () Bool)

(declare-fun res!487166 () Bool)

(assert (=> b!726149 (=> (not res!487166) (not e!406586))))

(declare-datatypes ((List!13638 0))(
  ( (Nil!13635) (Cons!13634 (h!14691 (_ BitVec 64)) (t!19953 List!13638)) )
))
(declare-fun arrayNoDuplicates!0 (array!41030 (_ BitVec 32) List!13638) Bool)

(assert (=> b!726149 (= res!487166 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13635))))

(declare-fun b!726150 () Bool)

(assert (=> b!726150 (= e!406586 e!406589)))

(declare-fun res!487168 () Bool)

(assert (=> b!726150 (=> (not res!487168) (not e!406589))))

(declare-fun lt!321589 () SeekEntryResult!7236)

(assert (=> b!726150 (= res!487168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19636 a!3186) j!159) mask!3328) (select (arr!19636 a!3186) j!159) a!3186 mask!3328) lt!321589))))

(assert (=> b!726150 (= lt!321589 (Intermediate!7236 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726151 () Bool)

(declare-fun res!487164 () Bool)

(assert (=> b!726151 (=> (not res!487164) (not e!406588))))

(assert (=> b!726151 (= res!487164 (validKeyInArray!0 (select (arr!19636 a!3186) j!159)))))

(declare-fun b!726152 () Bool)

(declare-fun res!487167 () Bool)

(assert (=> b!726152 (=> (not res!487167) (not e!406589))))

(assert (=> b!726152 (= res!487167 e!406592)))

(declare-fun c!79864 () Bool)

(assert (=> b!726152 (= c!79864 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726153 () Bool)

(declare-fun res!487171 () Bool)

(assert (=> b!726153 (=> (not res!487171) (not e!406588))))

(declare-fun arrayContainsKey!0 (array!41030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726153 (= res!487171 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726154 () Bool)

(assert (=> b!726154 (= e!406592 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19636 a!3186) j!159) a!3186 mask!3328) lt!321589))))

(declare-fun b!726155 () Bool)

(declare-fun res!487159 () Bool)

(assert (=> b!726155 (=> (not res!487159) (not e!406586))))

(assert (=> b!726155 (= res!487159 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20057 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20057 a!3186))))))

(declare-fun b!726156 () Bool)

(assert (=> b!726156 (= e!406591 (not true))))

(assert (=> b!726156 e!406590))

(declare-fun res!487172 () Bool)

(assert (=> b!726156 (=> (not res!487172) (not e!406590))))

(assert (=> b!726156 (= res!487172 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24790 0))(
  ( (Unit!24791) )
))
(declare-fun lt!321593 () Unit!24790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24790)

(assert (=> b!726156 (= lt!321593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64512 res!487170) b!726140))

(assert (= (and b!726140 res!487160) b!726151))

(assert (= (and b!726151 res!487164) b!726142))

(assert (= (and b!726142 res!487158) b!726153))

(assert (= (and b!726153 res!487171) b!726145))

(assert (= (and b!726145 res!487161) b!726143))

(assert (= (and b!726143 res!487162) b!726149))

(assert (= (and b!726149 res!487166) b!726155))

(assert (= (and b!726155 res!487159) b!726150))

(assert (= (and b!726150 res!487168) b!726148))

(assert (= (and b!726148 res!487163) b!726152))

(assert (= (and b!726152 c!79864) b!726154))

(assert (= (and b!726152 (not c!79864)) b!726146))

(assert (= (and b!726152 res!487167) b!726147))

(assert (= (and b!726147 res!487169) b!726156))

(assert (= (and b!726156 res!487172) b!726144))

(assert (= (and b!726144 res!487165) b!726141))

(declare-fun m!680231 () Bool)

(assert (=> b!726150 m!680231))

(assert (=> b!726150 m!680231))

(declare-fun m!680233 () Bool)

(assert (=> b!726150 m!680233))

(assert (=> b!726150 m!680233))

(assert (=> b!726150 m!680231))

(declare-fun m!680235 () Bool)

(assert (=> b!726150 m!680235))

(declare-fun m!680237 () Bool)

(assert (=> b!726149 m!680237))

(declare-fun m!680239 () Bool)

(assert (=> b!726153 m!680239))

(assert (=> b!726151 m!680231))

(assert (=> b!726151 m!680231))

(declare-fun m!680241 () Bool)

(assert (=> b!726151 m!680241))

(declare-fun m!680243 () Bool)

(assert (=> start!64512 m!680243))

(declare-fun m!680245 () Bool)

(assert (=> start!64512 m!680245))

(assert (=> b!726144 m!680231))

(assert (=> b!726144 m!680231))

(declare-fun m!680247 () Bool)

(assert (=> b!726144 m!680247))

(declare-fun m!680249 () Bool)

(assert (=> b!726143 m!680249))

(assert (=> b!726146 m!680231))

(assert (=> b!726146 m!680231))

(declare-fun m!680251 () Bool)

(assert (=> b!726146 m!680251))

(assert (=> b!726154 m!680231))

(assert (=> b!726154 m!680231))

(declare-fun m!680253 () Bool)

(assert (=> b!726154 m!680253))

(declare-fun m!680255 () Bool)

(assert (=> b!726145 m!680255))

(assert (=> b!726141 m!680231))

(assert (=> b!726141 m!680231))

(declare-fun m!680257 () Bool)

(assert (=> b!726141 m!680257))

(declare-fun m!680259 () Bool)

(assert (=> b!726142 m!680259))

(declare-fun m!680261 () Bool)

(assert (=> b!726148 m!680261))

(declare-fun m!680263 () Bool)

(assert (=> b!726156 m!680263))

(declare-fun m!680265 () Bool)

(assert (=> b!726156 m!680265))

(declare-fun m!680267 () Bool)

(assert (=> b!726147 m!680267))

(declare-fun m!680269 () Bool)

(assert (=> b!726147 m!680269))

(declare-fun m!680271 () Bool)

(assert (=> b!726147 m!680271))

(declare-fun m!680273 () Bool)

(assert (=> b!726147 m!680273))

(assert (=> b!726147 m!680267))

(declare-fun m!680275 () Bool)

(assert (=> b!726147 m!680275))

(check-sat (not b!726143) (not b!726145) (not b!726144) (not b!726141) (not b!726156) (not b!726153) (not b!726151) (not b!726150) (not b!726149) (not b!726147) (not start!64512) (not b!726146) (not b!726154) (not b!726142))
(check-sat)
