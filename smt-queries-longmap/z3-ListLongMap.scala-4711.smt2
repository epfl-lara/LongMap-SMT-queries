; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65328 () Bool)

(assert start!65328)

(declare-fun b!742157 () Bool)

(declare-fun res!499382 () Bool)

(declare-fun e!414787 () Bool)

(assert (=> b!742157 (=> (not res!499382) (not e!414787))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41501 0))(
  ( (array!41502 (arr!19864 (Array (_ BitVec 32) (_ BitVec 64))) (size!20285 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41501)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742157 (= res!499382 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20285 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20285 a!3186))))))

(declare-fun b!742159 () Bool)

(declare-fun res!499391 () Bool)

(assert (=> b!742159 (=> (not res!499391) (not e!414787))))

(declare-datatypes ((List!13866 0))(
  ( (Nil!13863) (Cons!13862 (h!14934 (_ BitVec 64)) (t!20181 List!13866)) )
))
(declare-fun arrayNoDuplicates!0 (array!41501 (_ BitVec 32) List!13866) Bool)

(assert (=> b!742159 (= res!499391 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13863))))

(declare-fun b!742160 () Bool)

(declare-fun e!414788 () Bool)

(assert (=> b!742160 (= e!414787 e!414788)))

(declare-fun res!499388 () Bool)

(assert (=> b!742160 (=> (not res!499388) (not e!414788))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7464 0))(
  ( (MissingZero!7464 (index!32224 (_ BitVec 32))) (Found!7464 (index!32225 (_ BitVec 32))) (Intermediate!7464 (undefined!8276 Bool) (index!32226 (_ BitVec 32)) (x!63198 (_ BitVec 32))) (Undefined!7464) (MissingVacant!7464 (index!32227 (_ BitVec 32))) )
))
(declare-fun lt!329698 () SeekEntryResult!7464)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41501 (_ BitVec 32)) SeekEntryResult!7464)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742160 (= res!499388 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19864 a!3186) j!159) mask!3328) (select (arr!19864 a!3186) j!159) a!3186 mask!3328) lt!329698))))

(assert (=> b!742160 (= lt!329698 (Intermediate!7464 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742161 () Bool)

(declare-fun e!414791 () Bool)

(declare-fun e!414784 () Bool)

(assert (=> b!742161 (= e!414791 e!414784)))

(declare-fun res!499381 () Bool)

(assert (=> b!742161 (=> (not res!499381) (not e!414784))))

(declare-fun lt!329697 () SeekEntryResult!7464)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41501 (_ BitVec 32)) SeekEntryResult!7464)

(assert (=> b!742161 (= res!499381 (= (seekEntryOrOpen!0 (select (arr!19864 a!3186) j!159) a!3186 mask!3328) lt!329697))))

(assert (=> b!742161 (= lt!329697 (Found!7464 j!159))))

(declare-fun e!414786 () Bool)

(declare-fun b!742162 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41501 (_ BitVec 32)) SeekEntryResult!7464)

(assert (=> b!742162 (= e!414786 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19864 a!3186) j!159) a!3186 mask!3328) (Found!7464 j!159)))))

(declare-fun b!742163 () Bool)

(declare-fun e!414785 () Bool)

(assert (=> b!742163 (= e!414785 (not true))))

(assert (=> b!742163 e!414791))

(declare-fun res!499393 () Bool)

(assert (=> b!742163 (=> (not res!499393) (not e!414791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41501 (_ BitVec 32)) Bool)

(assert (=> b!742163 (= res!499393 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25408 0))(
  ( (Unit!25409) )
))
(declare-fun lt!329699 () Unit!25408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25408)

(assert (=> b!742163 (= lt!329699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742164 () Bool)

(assert (=> b!742164 (= e!414784 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19864 a!3186) j!159) a!3186 mask!3328) lt!329697))))

(declare-fun b!742165 () Bool)

(declare-fun res!499394 () Bool)

(assert (=> b!742165 (=> (not res!499394) (not e!414788))))

(assert (=> b!742165 (= res!499394 e!414786)))

(declare-fun c!81769 () Bool)

(assert (=> b!742165 (= c!81769 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742166 () Bool)

(declare-fun res!499384 () Bool)

(declare-fun e!414790 () Bool)

(assert (=> b!742166 (=> (not res!499384) (not e!414790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742166 (= res!499384 (validKeyInArray!0 (select (arr!19864 a!3186) j!159)))))

(declare-fun b!742167 () Bool)

(declare-fun res!499383 () Bool)

(assert (=> b!742167 (=> (not res!499383) (not e!414790))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!742167 (= res!499383 (validKeyInArray!0 k0!2102))))

(declare-fun b!742168 () Bool)

(assert (=> b!742168 (= e!414786 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19864 a!3186) j!159) a!3186 mask!3328) lt!329698))))

(declare-fun b!742158 () Bool)

(declare-fun res!499389 () Bool)

(assert (=> b!742158 (=> (not res!499389) (not e!414790))))

(declare-fun arrayContainsKey!0 (array!41501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742158 (= res!499389 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!499385 () Bool)

(assert (=> start!65328 (=> (not res!499385) (not e!414790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65328 (= res!499385 (validMask!0 mask!3328))))

(assert (=> start!65328 e!414790))

(assert (=> start!65328 true))

(declare-fun array_inv!15660 (array!41501) Bool)

(assert (=> start!65328 (array_inv!15660 a!3186)))

(declare-fun b!742169 () Bool)

(assert (=> b!742169 (= e!414790 e!414787)))

(declare-fun res!499387 () Bool)

(assert (=> b!742169 (=> (not res!499387) (not e!414787))))

(declare-fun lt!329694 () SeekEntryResult!7464)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742169 (= res!499387 (or (= lt!329694 (MissingZero!7464 i!1173)) (= lt!329694 (MissingVacant!7464 i!1173))))))

(assert (=> b!742169 (= lt!329694 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742170 () Bool)

(assert (=> b!742170 (= e!414788 e!414785)))

(declare-fun res!499386 () Bool)

(assert (=> b!742170 (=> (not res!499386) (not e!414785))))

(declare-fun lt!329696 () array!41501)

(declare-fun lt!329695 () (_ BitVec 64))

(assert (=> b!742170 (= res!499386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329695 mask!3328) lt!329695 lt!329696 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329695 lt!329696 mask!3328)))))

(assert (=> b!742170 (= lt!329695 (select (store (arr!19864 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742170 (= lt!329696 (array!41502 (store (arr!19864 a!3186) i!1173 k0!2102) (size!20285 a!3186)))))

(declare-fun b!742171 () Bool)

(declare-fun res!499392 () Bool)

(assert (=> b!742171 (=> (not res!499392) (not e!414788))))

(assert (=> b!742171 (= res!499392 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19864 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742172 () Bool)

(declare-fun res!499390 () Bool)

(assert (=> b!742172 (=> (not res!499390) (not e!414790))))

(assert (=> b!742172 (= res!499390 (and (= (size!20285 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20285 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20285 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742173 () Bool)

(declare-fun res!499380 () Bool)

(assert (=> b!742173 (=> (not res!499380) (not e!414787))))

(assert (=> b!742173 (= res!499380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65328 res!499385) b!742172))

(assert (= (and b!742172 res!499390) b!742166))

(assert (= (and b!742166 res!499384) b!742167))

(assert (= (and b!742167 res!499383) b!742158))

(assert (= (and b!742158 res!499389) b!742169))

(assert (= (and b!742169 res!499387) b!742173))

(assert (= (and b!742173 res!499380) b!742159))

(assert (= (and b!742159 res!499391) b!742157))

(assert (= (and b!742157 res!499382) b!742160))

(assert (= (and b!742160 res!499388) b!742171))

(assert (= (and b!742171 res!499392) b!742165))

(assert (= (and b!742165 c!81769) b!742168))

(assert (= (and b!742165 (not c!81769)) b!742162))

(assert (= (and b!742165 res!499394) b!742170))

(assert (= (and b!742170 res!499386) b!742163))

(assert (= (and b!742163 res!499393) b!742161))

(assert (= (and b!742161 res!499381) b!742164))

(declare-fun m!693059 () Bool)

(assert (=> start!65328 m!693059))

(declare-fun m!693061 () Bool)

(assert (=> start!65328 m!693061))

(declare-fun m!693063 () Bool)

(assert (=> b!742164 m!693063))

(assert (=> b!742164 m!693063))

(declare-fun m!693065 () Bool)

(assert (=> b!742164 m!693065))

(declare-fun m!693067 () Bool)

(assert (=> b!742169 m!693067))

(declare-fun m!693069 () Bool)

(assert (=> b!742173 m!693069))

(assert (=> b!742168 m!693063))

(assert (=> b!742168 m!693063))

(declare-fun m!693071 () Bool)

(assert (=> b!742168 m!693071))

(declare-fun m!693073 () Bool)

(assert (=> b!742163 m!693073))

(declare-fun m!693075 () Bool)

(assert (=> b!742163 m!693075))

(declare-fun m!693077 () Bool)

(assert (=> b!742171 m!693077))

(declare-fun m!693079 () Bool)

(assert (=> b!742170 m!693079))

(declare-fun m!693081 () Bool)

(assert (=> b!742170 m!693081))

(declare-fun m!693083 () Bool)

(assert (=> b!742170 m!693083))

(declare-fun m!693085 () Bool)

(assert (=> b!742170 m!693085))

(declare-fun m!693087 () Bool)

(assert (=> b!742170 m!693087))

(assert (=> b!742170 m!693085))

(assert (=> b!742166 m!693063))

(assert (=> b!742166 m!693063))

(declare-fun m!693089 () Bool)

(assert (=> b!742166 m!693089))

(declare-fun m!693091 () Bool)

(assert (=> b!742158 m!693091))

(assert (=> b!742161 m!693063))

(assert (=> b!742161 m!693063))

(declare-fun m!693093 () Bool)

(assert (=> b!742161 m!693093))

(declare-fun m!693095 () Bool)

(assert (=> b!742159 m!693095))

(assert (=> b!742162 m!693063))

(assert (=> b!742162 m!693063))

(declare-fun m!693097 () Bool)

(assert (=> b!742162 m!693097))

(assert (=> b!742160 m!693063))

(assert (=> b!742160 m!693063))

(declare-fun m!693099 () Bool)

(assert (=> b!742160 m!693099))

(assert (=> b!742160 m!693099))

(assert (=> b!742160 m!693063))

(declare-fun m!693101 () Bool)

(assert (=> b!742160 m!693101))

(declare-fun m!693103 () Bool)

(assert (=> b!742167 m!693103))

(check-sat (not b!742163) (not b!742170) (not b!742166) (not b!742168) (not start!65328) (not b!742160) (not b!742161) (not b!742169) (not b!742162) (not b!742158) (not b!742173) (not b!742164) (not b!742159) (not b!742167))
(check-sat)
