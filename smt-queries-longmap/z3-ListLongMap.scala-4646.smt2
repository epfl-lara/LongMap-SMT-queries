; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64650 () Bool)

(assert start!64650)

(declare-fun b!728308 () Bool)

(declare-fun e!407698 () Bool)

(declare-fun e!407702 () Bool)

(assert (=> b!728308 (= e!407698 e!407702)))

(declare-fun res!488838 () Bool)

(assert (=> b!728308 (=> (not res!488838) (not e!407702))))

(declare-datatypes ((array!41099 0))(
  ( (array!41100 (arr!19669 (Array (_ BitVec 32) (_ BitVec 64))) (size!20090 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41099)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7269 0))(
  ( (MissingZero!7269 (index!31444 (_ BitVec 32))) (Found!7269 (index!31445 (_ BitVec 32))) (Intermediate!7269 (undefined!8081 Bool) (index!31446 (_ BitVec 32)) (x!62435 (_ BitVec 32))) (Undefined!7269) (MissingVacant!7269 (index!31447 (_ BitVec 32))) )
))
(declare-fun lt!322601 () SeekEntryResult!7269)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41099 (_ BitVec 32)) SeekEntryResult!7269)

(assert (=> b!728308 (= res!488838 (= (seekEntryOrOpen!0 (select (arr!19669 a!3186) j!159) a!3186 mask!3328) lt!322601))))

(assert (=> b!728308 (= lt!322601 (Found!7269 j!159))))

(declare-fun b!728309 () Bool)

(declare-fun res!488849 () Bool)

(declare-fun e!407700 () Bool)

(assert (=> b!728309 (=> (not res!488849) (not e!407700))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728309 (= res!488849 (and (= (size!20090 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20090 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20090 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728310 () Bool)

(declare-fun res!488839 () Bool)

(declare-fun e!407705 () Bool)

(assert (=> b!728310 (=> (not res!488839) (not e!407705))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728310 (= res!488839 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20090 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20090 a!3186))))))

(declare-fun b!728311 () Bool)

(declare-fun e!407697 () Bool)

(declare-fun e!407699 () Bool)

(assert (=> b!728311 (= e!407697 e!407699)))

(declare-fun res!488845 () Bool)

(assert (=> b!728311 (=> (not res!488845) (not e!407699))))

(declare-fun lt!322597 () SeekEntryResult!7269)

(declare-fun lt!322604 () SeekEntryResult!7269)

(assert (=> b!728311 (= res!488845 (= lt!322597 lt!322604))))

(declare-fun lt!322600 () (_ BitVec 64))

(declare-fun lt!322598 () array!41099)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41099 (_ BitVec 32)) SeekEntryResult!7269)

(assert (=> b!728311 (= lt!322604 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322600 lt!322598 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728311 (= lt!322597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322600 mask!3328) lt!322600 lt!322598 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!728311 (= lt!322600 (select (store (arr!19669 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728311 (= lt!322598 (array!41100 (store (arr!19669 a!3186) i!1173 k0!2102) (size!20090 a!3186)))))

(declare-fun b!728312 () Bool)

(declare-fun e!407703 () Bool)

(assert (=> b!728312 (= e!407699 (not e!407703))))

(declare-fun res!488840 () Bool)

(assert (=> b!728312 (=> res!488840 e!407703)))

(get-info :version)

(assert (=> b!728312 (= res!488840 (or (not ((_ is Intermediate!7269) lt!322604)) (bvsge x!1131 (x!62435 lt!322604))))))

(assert (=> b!728312 e!407698))

(declare-fun res!488847 () Bool)

(assert (=> b!728312 (=> (not res!488847) (not e!407698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41099 (_ BitVec 32)) Bool)

(assert (=> b!728312 (= res!488847 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24856 0))(
  ( (Unit!24857) )
))
(declare-fun lt!322602 () Unit!24856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24856)

(assert (=> b!728312 (= lt!322602 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728313 () Bool)

(declare-fun res!488848 () Bool)

(assert (=> b!728313 (=> (not res!488848) (not e!407697))))

(assert (=> b!728313 (= res!488848 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19669 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!407704 () Bool)

(declare-fun b!728315 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41099 (_ BitVec 32)) SeekEntryResult!7269)

(assert (=> b!728315 (= e!407704 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19669 a!3186) j!159) a!3186 mask!3328) (Found!7269 j!159)))))

(declare-fun lt!322599 () SeekEntryResult!7269)

(declare-fun b!728316 () Bool)

(assert (=> b!728316 (= e!407704 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19669 a!3186) j!159) a!3186 mask!3328) lt!322599))))

(declare-fun b!728317 () Bool)

(assert (=> b!728317 (= e!407703 true)))

(declare-fun lt!322596 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728317 (= lt!322596 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728318 () Bool)

(declare-fun res!488852 () Bool)

(assert (=> b!728318 (=> (not res!488852) (not e!407700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728318 (= res!488852 (validKeyInArray!0 (select (arr!19669 a!3186) j!159)))))

(declare-fun b!728319 () Bool)

(declare-fun res!488850 () Bool)

(assert (=> b!728319 (=> (not res!488850) (not e!407697))))

(assert (=> b!728319 (= res!488850 e!407704)))

(declare-fun c!80110 () Bool)

(assert (=> b!728319 (= c!80110 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728320 () Bool)

(declare-fun res!488851 () Bool)

(assert (=> b!728320 (=> (not res!488851) (not e!407700))))

(declare-fun arrayContainsKey!0 (array!41099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728320 (= res!488851 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728321 () Bool)

(declare-fun res!488843 () Bool)

(assert (=> b!728321 (=> (not res!488843) (not e!407705))))

(assert (=> b!728321 (= res!488843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!488837 () Bool)

(assert (=> start!64650 (=> (not res!488837) (not e!407700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64650 (= res!488837 (validMask!0 mask!3328))))

(assert (=> start!64650 e!407700))

(assert (=> start!64650 true))

(declare-fun array_inv!15465 (array!41099) Bool)

(assert (=> start!64650 (array_inv!15465 a!3186)))

(declare-fun b!728314 () Bool)

(assert (=> b!728314 (= e!407700 e!407705)))

(declare-fun res!488844 () Bool)

(assert (=> b!728314 (=> (not res!488844) (not e!407705))))

(declare-fun lt!322603 () SeekEntryResult!7269)

(assert (=> b!728314 (= res!488844 (or (= lt!322603 (MissingZero!7269 i!1173)) (= lt!322603 (MissingVacant!7269 i!1173))))))

(assert (=> b!728314 (= lt!322603 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728322 () Bool)

(declare-fun res!488841 () Bool)

(assert (=> b!728322 (=> (not res!488841) (not e!407700))))

(assert (=> b!728322 (= res!488841 (validKeyInArray!0 k0!2102))))

(declare-fun b!728323 () Bool)

(assert (=> b!728323 (= e!407705 e!407697)))

(declare-fun res!488842 () Bool)

(assert (=> b!728323 (=> (not res!488842) (not e!407697))))

(assert (=> b!728323 (= res!488842 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19669 a!3186) j!159) mask!3328) (select (arr!19669 a!3186) j!159) a!3186 mask!3328) lt!322599))))

(assert (=> b!728323 (= lt!322599 (Intermediate!7269 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728324 () Bool)

(declare-fun res!488846 () Bool)

(assert (=> b!728324 (=> (not res!488846) (not e!407705))))

(declare-datatypes ((List!13671 0))(
  ( (Nil!13668) (Cons!13667 (h!14727 (_ BitVec 64)) (t!19986 List!13671)) )
))
(declare-fun arrayNoDuplicates!0 (array!41099 (_ BitVec 32) List!13671) Bool)

(assert (=> b!728324 (= res!488846 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13668))))

(declare-fun b!728325 () Bool)

(assert (=> b!728325 (= e!407702 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19669 a!3186) j!159) a!3186 mask!3328) lt!322601))))

(assert (= (and start!64650 res!488837) b!728309))

(assert (= (and b!728309 res!488849) b!728318))

(assert (= (and b!728318 res!488852) b!728322))

(assert (= (and b!728322 res!488841) b!728320))

(assert (= (and b!728320 res!488851) b!728314))

(assert (= (and b!728314 res!488844) b!728321))

(assert (= (and b!728321 res!488843) b!728324))

(assert (= (and b!728324 res!488846) b!728310))

(assert (= (and b!728310 res!488839) b!728323))

(assert (= (and b!728323 res!488842) b!728313))

(assert (= (and b!728313 res!488848) b!728319))

(assert (= (and b!728319 c!80110) b!728316))

(assert (= (and b!728319 (not c!80110)) b!728315))

(assert (= (and b!728319 res!488850) b!728311))

(assert (= (and b!728311 res!488845) b!728312))

(assert (= (and b!728312 res!488847) b!728308))

(assert (= (and b!728308 res!488838) b!728325))

(assert (= (and b!728312 (not res!488840)) b!728317))

(declare-fun m!682075 () Bool)

(assert (=> b!728324 m!682075))

(declare-fun m!682077 () Bool)

(assert (=> b!728314 m!682077))

(declare-fun m!682079 () Bool)

(assert (=> b!728321 m!682079))

(declare-fun m!682081 () Bool)

(assert (=> b!728323 m!682081))

(assert (=> b!728323 m!682081))

(declare-fun m!682083 () Bool)

(assert (=> b!728323 m!682083))

(assert (=> b!728323 m!682083))

(assert (=> b!728323 m!682081))

(declare-fun m!682085 () Bool)

(assert (=> b!728323 m!682085))

(assert (=> b!728316 m!682081))

(assert (=> b!728316 m!682081))

(declare-fun m!682087 () Bool)

(assert (=> b!728316 m!682087))

(assert (=> b!728318 m!682081))

(assert (=> b!728318 m!682081))

(declare-fun m!682089 () Bool)

(assert (=> b!728318 m!682089))

(declare-fun m!682091 () Bool)

(assert (=> b!728313 m!682091))

(declare-fun m!682093 () Bool)

(assert (=> b!728317 m!682093))

(assert (=> b!728325 m!682081))

(assert (=> b!728325 m!682081))

(declare-fun m!682095 () Bool)

(assert (=> b!728325 m!682095))

(declare-fun m!682097 () Bool)

(assert (=> b!728312 m!682097))

(declare-fun m!682099 () Bool)

(assert (=> b!728312 m!682099))

(declare-fun m!682101 () Bool)

(assert (=> b!728311 m!682101))

(declare-fun m!682103 () Bool)

(assert (=> b!728311 m!682103))

(declare-fun m!682105 () Bool)

(assert (=> b!728311 m!682105))

(declare-fun m!682107 () Bool)

(assert (=> b!728311 m!682107))

(assert (=> b!728311 m!682101))

(declare-fun m!682109 () Bool)

(assert (=> b!728311 m!682109))

(declare-fun m!682111 () Bool)

(assert (=> b!728320 m!682111))

(assert (=> b!728308 m!682081))

(assert (=> b!728308 m!682081))

(declare-fun m!682113 () Bool)

(assert (=> b!728308 m!682113))

(assert (=> b!728315 m!682081))

(assert (=> b!728315 m!682081))

(declare-fun m!682115 () Bool)

(assert (=> b!728315 m!682115))

(declare-fun m!682117 () Bool)

(assert (=> b!728322 m!682117))

(declare-fun m!682119 () Bool)

(assert (=> start!64650 m!682119))

(declare-fun m!682121 () Bool)

(assert (=> start!64650 m!682121))

(check-sat (not b!728308) (not b!728322) (not b!728325) (not b!728316) (not b!728320) (not b!728311) (not b!728312) (not b!728314) (not b!728323) (not b!728318) (not b!728317) (not b!728315) (not b!728321) (not start!64650) (not b!728324))
(check-sat)
