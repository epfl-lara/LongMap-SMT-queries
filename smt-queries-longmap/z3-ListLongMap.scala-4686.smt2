; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65178 () Bool)

(assert start!65178)

(declare-fun b!737188 () Bool)

(declare-fun res!495506 () Bool)

(declare-fun e!412347 () Bool)

(assert (=> b!737188 (=> (not res!495506) (not e!412347))))

(declare-datatypes ((array!41351 0))(
  ( (array!41352 (arr!19789 (Array (_ BitVec 32) (_ BitVec 64))) (size!20210 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41351)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737188 (= res!495506 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737189 () Bool)

(declare-fun e!412358 () Bool)

(declare-fun e!412351 () Bool)

(assert (=> b!737189 (= e!412358 e!412351)))

(declare-fun res!495501 () Bool)

(assert (=> b!737189 (=> (not res!495501) (not e!412351))))

(declare-datatypes ((SeekEntryResult!7389 0))(
  ( (MissingZero!7389 (index!31924 (_ BitVec 32))) (Found!7389 (index!31925 (_ BitVec 32))) (Intermediate!7389 (undefined!8201 Bool) (index!31926 (_ BitVec 32)) (x!62923 (_ BitVec 32))) (Undefined!7389) (MissingVacant!7389 (index!31927 (_ BitVec 32))) )
))
(declare-fun lt!327042 () SeekEntryResult!7389)

(declare-fun lt!327035 () SeekEntryResult!7389)

(assert (=> b!737189 (= res!495501 (= lt!327042 lt!327035))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!327038 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!327047 () array!41351)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41351 (_ BitVec 32)) SeekEntryResult!7389)

(assert (=> b!737189 (= lt!327035 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327038 lt!327047 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737189 (= lt!327042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327038 mask!3328) lt!327038 lt!327047 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737189 (= lt!327038 (select (store (arr!19789 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737189 (= lt!327047 (array!41352 (store (arr!19789 a!3186) i!1173 k0!2102) (size!20210 a!3186)))))

(declare-fun b!737190 () Bool)

(declare-fun res!495500 () Bool)

(assert (=> b!737190 (=> (not res!495500) (not e!412358))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!737190 (= res!495500 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19789 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737191 () Bool)

(declare-fun res!495499 () Bool)

(declare-fun e!412353 () Bool)

(assert (=> b!737191 (=> (not res!495499) (not e!412353))))

(declare-datatypes ((List!13791 0))(
  ( (Nil!13788) (Cons!13787 (h!14859 (_ BitVec 64)) (t!20106 List!13791)) )
))
(declare-fun arrayNoDuplicates!0 (array!41351 (_ BitVec 32) List!13791) Bool)

(assert (=> b!737191 (= res!495499 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13788))))

(declare-fun b!737192 () Bool)

(declare-fun e!412357 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41351 (_ BitVec 32)) SeekEntryResult!7389)

(assert (=> b!737192 (= e!412357 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) (Found!7389 j!159)))))

(declare-fun b!737193 () Bool)

(declare-fun res!495492 () Bool)

(assert (=> b!737193 (=> (not res!495492) (not e!412347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737193 (= res!495492 (validKeyInArray!0 (select (arr!19789 a!3186) j!159)))))

(declare-fun b!737194 () Bool)

(declare-fun lt!327039 () SeekEntryResult!7389)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!412348 () Bool)

(assert (=> b!737194 (= e!412348 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327039))))

(declare-fun b!737195 () Bool)

(declare-fun res!495497 () Bool)

(assert (=> b!737195 (=> (not res!495497) (not e!412347))))

(assert (=> b!737195 (= res!495497 (validKeyInArray!0 k0!2102))))

(declare-fun b!737196 () Bool)

(declare-fun e!412355 () Bool)

(assert (=> b!737196 (= e!412355 e!412348)))

(declare-fun res!495502 () Bool)

(assert (=> b!737196 (=> (not res!495502) (not e!412348))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41351 (_ BitVec 32)) SeekEntryResult!7389)

(assert (=> b!737196 (= res!495502 (= (seekEntryOrOpen!0 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327039))))

(assert (=> b!737196 (= lt!327039 (Found!7389 j!159))))

(declare-fun b!737197 () Bool)

(declare-fun res!495498 () Bool)

(assert (=> b!737197 (=> (not res!495498) (not e!412358))))

(assert (=> b!737197 (= res!495498 e!412357)))

(declare-fun c!81232 () Bool)

(assert (=> b!737197 (= c!81232 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737198 () Bool)

(declare-datatypes ((Unit!25152 0))(
  ( (Unit!25153) )
))
(declare-fun e!412352 () Unit!25152)

(declare-fun Unit!25154 () Unit!25152)

(assert (=> b!737198 (= e!412352 Unit!25154)))

(declare-fun lt!327041 () SeekEntryResult!7389)

(assert (=> b!737198 (= lt!327041 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327037 () SeekEntryResult!7389)

(declare-fun lt!327046 () (_ BitVec 32))

(assert (=> b!737198 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327046 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327037)))

(declare-fun b!737199 () Bool)

(declare-fun lt!327036 () SeekEntryResult!7389)

(assert (=> b!737199 (= e!412357 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327036))))

(declare-fun b!737200 () Bool)

(assert (=> b!737200 (= e!412353 e!412358)))

(declare-fun res!495490 () Bool)

(assert (=> b!737200 (=> (not res!495490) (not e!412358))))

(assert (=> b!737200 (= res!495490 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19789 a!3186) j!159) mask!3328) (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327036))))

(assert (=> b!737200 (= lt!327036 (Intermediate!7389 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737201 () Bool)

(declare-fun e!412349 () Bool)

(assert (=> b!737201 (= e!412351 (not e!412349))))

(declare-fun res!495495 () Bool)

(assert (=> b!737201 (=> res!495495 e!412349)))

(get-info :version)

(assert (=> b!737201 (= res!495495 (or (not ((_ is Intermediate!7389) lt!327035)) (bvsge x!1131 (x!62923 lt!327035))))))

(assert (=> b!737201 (= lt!327037 (Found!7389 j!159))))

(assert (=> b!737201 e!412355))

(declare-fun res!495504 () Bool)

(assert (=> b!737201 (=> (not res!495504) (not e!412355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41351 (_ BitVec 32)) Bool)

(assert (=> b!737201 (= res!495504 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327045 () Unit!25152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41351 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25152)

(assert (=> b!737201 (= lt!327045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737202 () Bool)

(declare-fun e!412350 () Bool)

(assert (=> b!737202 (= e!412349 e!412350)))

(declare-fun res!495491 () Bool)

(assert (=> b!737202 (=> res!495491 e!412350)))

(assert (=> b!737202 (= res!495491 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327046 #b00000000000000000000000000000000) (bvsge lt!327046 (size!20210 a!3186))))))

(declare-fun lt!327043 () Unit!25152)

(assert (=> b!737202 (= lt!327043 e!412352)))

(declare-fun c!81230 () Bool)

(declare-fun lt!327034 () Bool)

(assert (=> b!737202 (= c!81230 lt!327034)))

(assert (=> b!737202 (= lt!327034 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737202 (= lt!327046 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!495493 () Bool)

(assert (=> start!65178 (=> (not res!495493) (not e!412347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65178 (= res!495493 (validMask!0 mask!3328))))

(assert (=> start!65178 e!412347))

(assert (=> start!65178 true))

(declare-fun array_inv!15585 (array!41351) Bool)

(assert (=> start!65178 (array_inv!15585 a!3186)))

(declare-fun b!737203 () Bool)

(declare-fun Unit!25155 () Unit!25152)

(assert (=> b!737203 (= e!412352 Unit!25155)))

(assert (=> b!737203 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327046 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327036)))

(declare-fun b!737204 () Bool)

(declare-fun res!495496 () Bool)

(assert (=> b!737204 (=> res!495496 e!412350)))

(declare-fun e!412356 () Bool)

(assert (=> b!737204 (= res!495496 e!412356)))

(declare-fun c!81231 () Bool)

(assert (=> b!737204 (= c!81231 lt!327034)))

(declare-fun b!737205 () Bool)

(assert (=> b!737205 (= e!412356 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327046 resIntermediateIndex!5 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327037)))))

(declare-fun b!737206 () Bool)

(declare-fun res!495503 () Bool)

(assert (=> b!737206 (=> (not res!495503) (not e!412353))))

(assert (=> b!737206 (= res!495503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737207 () Bool)

(assert (=> b!737207 (= e!412350 true)))

(declare-fun lt!327040 () SeekEntryResult!7389)

(assert (=> b!737207 (= lt!327040 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327046 lt!327038 lt!327047 mask!3328))))

(declare-fun b!737208 () Bool)

(assert (=> b!737208 (= e!412347 e!412353)))

(declare-fun res!495505 () Bool)

(assert (=> b!737208 (=> (not res!495505) (not e!412353))))

(declare-fun lt!327044 () SeekEntryResult!7389)

(assert (=> b!737208 (= res!495505 (or (= lt!327044 (MissingZero!7389 i!1173)) (= lt!327044 (MissingVacant!7389 i!1173))))))

(assert (=> b!737208 (= lt!327044 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737209 () Bool)

(declare-fun res!495489 () Bool)

(assert (=> b!737209 (=> (not res!495489) (not e!412347))))

(assert (=> b!737209 (= res!495489 (and (= (size!20210 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20210 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20210 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737210 () Bool)

(assert (=> b!737210 (= e!412356 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327046 (select (arr!19789 a!3186) j!159) a!3186 mask!3328) lt!327036)))))

(declare-fun b!737211 () Bool)

(declare-fun res!495494 () Bool)

(assert (=> b!737211 (=> (not res!495494) (not e!412353))))

(assert (=> b!737211 (= res!495494 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20210 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20210 a!3186))))))

(assert (= (and start!65178 res!495493) b!737209))

(assert (= (and b!737209 res!495489) b!737193))

(assert (= (and b!737193 res!495492) b!737195))

(assert (= (and b!737195 res!495497) b!737188))

(assert (= (and b!737188 res!495506) b!737208))

(assert (= (and b!737208 res!495505) b!737206))

(assert (= (and b!737206 res!495503) b!737191))

(assert (= (and b!737191 res!495499) b!737211))

(assert (= (and b!737211 res!495494) b!737200))

(assert (= (and b!737200 res!495490) b!737190))

(assert (= (and b!737190 res!495500) b!737197))

(assert (= (and b!737197 c!81232) b!737199))

(assert (= (and b!737197 (not c!81232)) b!737192))

(assert (= (and b!737197 res!495498) b!737189))

(assert (= (and b!737189 res!495501) b!737201))

(assert (= (and b!737201 res!495504) b!737196))

(assert (= (and b!737196 res!495502) b!737194))

(assert (= (and b!737201 (not res!495495)) b!737202))

(assert (= (and b!737202 c!81230) b!737203))

(assert (= (and b!737202 (not c!81230)) b!737198))

(assert (= (and b!737202 (not res!495491)) b!737204))

(assert (= (and b!737204 c!81231) b!737210))

(assert (= (and b!737204 (not c!81231)) b!737205))

(assert (= (and b!737204 (not res!495496)) b!737207))

(declare-fun m!689131 () Bool)

(assert (=> b!737193 m!689131))

(assert (=> b!737193 m!689131))

(declare-fun m!689133 () Bool)

(assert (=> b!737193 m!689133))

(declare-fun m!689135 () Bool)

(assert (=> b!737201 m!689135))

(declare-fun m!689137 () Bool)

(assert (=> b!737201 m!689137))

(declare-fun m!689139 () Bool)

(assert (=> b!737188 m!689139))

(assert (=> b!737200 m!689131))

(assert (=> b!737200 m!689131))

(declare-fun m!689141 () Bool)

(assert (=> b!737200 m!689141))

(assert (=> b!737200 m!689141))

(assert (=> b!737200 m!689131))

(declare-fun m!689143 () Bool)

(assert (=> b!737200 m!689143))

(declare-fun m!689145 () Bool)

(assert (=> b!737207 m!689145))

(assert (=> b!737199 m!689131))

(assert (=> b!737199 m!689131))

(declare-fun m!689147 () Bool)

(assert (=> b!737199 m!689147))

(assert (=> b!737210 m!689131))

(assert (=> b!737210 m!689131))

(declare-fun m!689149 () Bool)

(assert (=> b!737210 m!689149))

(declare-fun m!689151 () Bool)

(assert (=> b!737208 m!689151))

(declare-fun m!689153 () Bool)

(assert (=> b!737202 m!689153))

(declare-fun m!689155 () Bool)

(assert (=> b!737206 m!689155))

(assert (=> b!737192 m!689131))

(assert (=> b!737192 m!689131))

(declare-fun m!689157 () Bool)

(assert (=> b!737192 m!689157))

(assert (=> b!737203 m!689131))

(assert (=> b!737203 m!689131))

(assert (=> b!737203 m!689149))

(declare-fun m!689159 () Bool)

(assert (=> b!737189 m!689159))

(declare-fun m!689161 () Bool)

(assert (=> b!737189 m!689161))

(declare-fun m!689163 () Bool)

(assert (=> b!737189 m!689163))

(declare-fun m!689165 () Bool)

(assert (=> b!737189 m!689165))

(declare-fun m!689167 () Bool)

(assert (=> b!737189 m!689167))

(assert (=> b!737189 m!689163))

(declare-fun m!689169 () Bool)

(assert (=> b!737190 m!689169))

(declare-fun m!689171 () Bool)

(assert (=> b!737191 m!689171))

(declare-fun m!689173 () Bool)

(assert (=> b!737195 m!689173))

(assert (=> b!737198 m!689131))

(assert (=> b!737198 m!689131))

(assert (=> b!737198 m!689157))

(assert (=> b!737198 m!689131))

(declare-fun m!689175 () Bool)

(assert (=> b!737198 m!689175))

(assert (=> b!737205 m!689131))

(assert (=> b!737205 m!689131))

(assert (=> b!737205 m!689175))

(declare-fun m!689177 () Bool)

(assert (=> start!65178 m!689177))

(declare-fun m!689179 () Bool)

(assert (=> start!65178 m!689179))

(assert (=> b!737196 m!689131))

(assert (=> b!737196 m!689131))

(declare-fun m!689181 () Bool)

(assert (=> b!737196 m!689181))

(assert (=> b!737194 m!689131))

(assert (=> b!737194 m!689131))

(declare-fun m!689183 () Bool)

(assert (=> b!737194 m!689183))

(check-sat (not b!737192) (not b!737210) (not b!737199) (not b!737205) (not b!737189) (not b!737193) (not b!737188) (not start!65178) (not b!737196) (not b!737191) (not b!737202) (not b!737194) (not b!737198) (not b!737208) (not b!737200) (not b!737203) (not b!737206) (not b!737201) (not b!737207) (not b!737195))
(check-sat)
