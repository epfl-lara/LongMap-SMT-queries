; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65400 () Bool)

(assert start!65400)

(declare-fun b!744232 () Bool)

(declare-fun e!415756 () Bool)

(declare-fun e!415757 () Bool)

(assert (=> b!744232 (= e!415756 e!415757)))

(declare-fun res!501251 () Bool)

(assert (=> b!744232 (=> (not res!501251) (not e!415757))))

(declare-datatypes ((array!41573 0))(
  ( (array!41574 (arr!19900 (Array (_ BitVec 32) (_ BitVec 64))) (size!20321 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41573)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7500 0))(
  ( (MissingZero!7500 (index!32368 (_ BitVec 32))) (Found!7500 (index!32369 (_ BitVec 32))) (Intermediate!7500 (undefined!8312 Bool) (index!32370 (_ BitVec 32)) (x!63330 (_ BitVec 32))) (Undefined!7500) (MissingVacant!7500 (index!32371 (_ BitVec 32))) )
))
(declare-fun lt!330611 () SeekEntryResult!7500)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41573 (_ BitVec 32)) SeekEntryResult!7500)

(assert (=> b!744232 (= res!501251 (= (seekEntryOrOpen!0 (select (arr!19900 a!3186) j!159) a!3186 mask!3328) lt!330611))))

(assert (=> b!744232 (= lt!330611 (Found!7500 j!159))))

(declare-fun b!744233 () Bool)

(declare-fun e!415753 () Bool)

(declare-fun e!415755 () Bool)

(assert (=> b!744233 (= e!415753 e!415755)))

(declare-fun res!501239 () Bool)

(assert (=> b!744233 (=> (not res!501239) (not e!415755))))

(declare-fun lt!330612 () SeekEntryResult!7500)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744233 (= res!501239 (or (= lt!330612 (MissingZero!7500 i!1173)) (= lt!330612 (MissingVacant!7500 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!744233 (= lt!330612 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744234 () Bool)

(declare-fun e!415758 () Bool)

(declare-fun e!415754 () Bool)

(assert (=> b!744234 (= e!415758 (not e!415754))))

(declare-fun res!501243 () Bool)

(assert (=> b!744234 (=> res!501243 e!415754)))

(declare-fun lt!330610 () SeekEntryResult!7500)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!744234 (= res!501243 (or (not ((_ is Intermediate!7500) lt!330610)) (bvslt x!1131 (x!63330 lt!330610)) (not (= x!1131 (x!63330 lt!330610))) (not (= index!1321 (index!32370 lt!330610)))))))

(assert (=> b!744234 e!415756))

(declare-fun res!501246 () Bool)

(assert (=> b!744234 (=> (not res!501246) (not e!415756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41573 (_ BitVec 32)) Bool)

(assert (=> b!744234 (= res!501246 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25480 0))(
  ( (Unit!25481) )
))
(declare-fun lt!330615 () Unit!25480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25480)

(assert (=> b!744234 (= lt!330615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744235 () Bool)

(declare-fun res!501244 () Bool)

(declare-fun e!415760 () Bool)

(assert (=> b!744235 (=> (not res!501244) (not e!415760))))

(declare-fun e!415759 () Bool)

(assert (=> b!744235 (= res!501244 e!415759)))

(declare-fun c!81877 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744235 (= c!81877 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744236 () Bool)

(declare-fun res!501247 () Bool)

(assert (=> b!744236 (=> (not res!501247) (not e!415755))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!744236 (= res!501247 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20321 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20321 a!3186))))))

(declare-fun b!744237 () Bool)

(declare-fun lt!330617 () SeekEntryResult!7500)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41573 (_ BitVec 32)) SeekEntryResult!7500)

(assert (=> b!744237 (= e!415759 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19900 a!3186) j!159) a!3186 mask!3328) lt!330617))))

(declare-fun b!744238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41573 (_ BitVec 32)) SeekEntryResult!7500)

(assert (=> b!744238 (= e!415757 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19900 a!3186) j!159) a!3186 mask!3328) lt!330611))))

(declare-fun b!744239 () Bool)

(declare-fun res!501245 () Bool)

(assert (=> b!744239 (=> (not res!501245) (not e!415753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744239 (= res!501245 (validKeyInArray!0 k0!2102))))

(declare-fun b!744240 () Bool)

(declare-fun res!501240 () Bool)

(assert (=> b!744240 (=> (not res!501240) (not e!415753))))

(assert (=> b!744240 (= res!501240 (validKeyInArray!0 (select (arr!19900 a!3186) j!159)))))

(declare-fun b!744241 () Bool)

(assert (=> b!744241 (= e!415759 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19900 a!3186) j!159) a!3186 mask!3328) (Found!7500 j!159)))))

(declare-fun res!501241 () Bool)

(assert (=> start!65400 (=> (not res!501241) (not e!415753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65400 (= res!501241 (validMask!0 mask!3328))))

(assert (=> start!65400 e!415753))

(assert (=> start!65400 true))

(declare-fun array_inv!15696 (array!41573) Bool)

(assert (=> start!65400 (array_inv!15696 a!3186)))

(declare-fun b!744242 () Bool)

(declare-fun res!501252 () Bool)

(assert (=> b!744242 (=> (not res!501252) (not e!415760))))

(assert (=> b!744242 (= res!501252 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19900 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744243 () Bool)

(declare-fun res!501250 () Bool)

(assert (=> b!744243 (=> (not res!501250) (not e!415753))))

(assert (=> b!744243 (= res!501250 (and (= (size!20321 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20321 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20321 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744244 () Bool)

(assert (=> b!744244 (= e!415754 true)))

(declare-fun lt!330613 () SeekEntryResult!7500)

(assert (=> b!744244 (= lt!330613 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19900 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744245 () Bool)

(assert (=> b!744245 (= e!415755 e!415760)))

(declare-fun res!501248 () Bool)

(assert (=> b!744245 (=> (not res!501248) (not e!415760))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744245 (= res!501248 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19900 a!3186) j!159) mask!3328) (select (arr!19900 a!3186) j!159) a!3186 mask!3328) lt!330617))))

(assert (=> b!744245 (= lt!330617 (Intermediate!7500 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744246 () Bool)

(assert (=> b!744246 (= e!415760 e!415758)))

(declare-fun res!501253 () Bool)

(assert (=> b!744246 (=> (not res!501253) (not e!415758))))

(declare-fun lt!330614 () SeekEntryResult!7500)

(assert (=> b!744246 (= res!501253 (= lt!330614 lt!330610))))

(declare-fun lt!330609 () array!41573)

(declare-fun lt!330616 () (_ BitVec 64))

(assert (=> b!744246 (= lt!330610 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330616 lt!330609 mask!3328))))

(assert (=> b!744246 (= lt!330614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330616 mask!3328) lt!330616 lt!330609 mask!3328))))

(assert (=> b!744246 (= lt!330616 (select (store (arr!19900 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744246 (= lt!330609 (array!41574 (store (arr!19900 a!3186) i!1173 k0!2102) (size!20321 a!3186)))))

(declare-fun b!744247 () Bool)

(declare-fun res!501249 () Bool)

(assert (=> b!744247 (=> (not res!501249) (not e!415755))))

(assert (=> b!744247 (= res!501249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744248 () Bool)

(declare-fun res!501242 () Bool)

(assert (=> b!744248 (=> (not res!501242) (not e!415755))))

(declare-datatypes ((List!13902 0))(
  ( (Nil!13899) (Cons!13898 (h!14970 (_ BitVec 64)) (t!20217 List!13902)) )
))
(declare-fun arrayNoDuplicates!0 (array!41573 (_ BitVec 32) List!13902) Bool)

(assert (=> b!744248 (= res!501242 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13899))))

(declare-fun b!744249 () Bool)

(declare-fun res!501254 () Bool)

(assert (=> b!744249 (=> (not res!501254) (not e!415753))))

(declare-fun arrayContainsKey!0 (array!41573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744249 (= res!501254 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65400 res!501241) b!744243))

(assert (= (and b!744243 res!501250) b!744240))

(assert (= (and b!744240 res!501240) b!744239))

(assert (= (and b!744239 res!501245) b!744249))

(assert (= (and b!744249 res!501254) b!744233))

(assert (= (and b!744233 res!501239) b!744247))

(assert (= (and b!744247 res!501249) b!744248))

(assert (= (and b!744248 res!501242) b!744236))

(assert (= (and b!744236 res!501247) b!744245))

(assert (= (and b!744245 res!501248) b!744242))

(assert (= (and b!744242 res!501252) b!744235))

(assert (= (and b!744235 c!81877) b!744237))

(assert (= (and b!744235 (not c!81877)) b!744241))

(assert (= (and b!744235 res!501244) b!744246))

(assert (= (and b!744246 res!501253) b!744234))

(assert (= (and b!744234 res!501246) b!744232))

(assert (= (and b!744232 res!501251) b!744238))

(assert (= (and b!744234 (not res!501243)) b!744244))

(declare-fun m!694793 () Bool)

(assert (=> b!744237 m!694793))

(assert (=> b!744237 m!694793))

(declare-fun m!694795 () Bool)

(assert (=> b!744237 m!694795))

(declare-fun m!694797 () Bool)

(assert (=> start!65400 m!694797))

(declare-fun m!694799 () Bool)

(assert (=> start!65400 m!694799))

(assert (=> b!744232 m!694793))

(assert (=> b!744232 m!694793))

(declare-fun m!694801 () Bool)

(assert (=> b!744232 m!694801))

(declare-fun m!694803 () Bool)

(assert (=> b!744246 m!694803))

(declare-fun m!694805 () Bool)

(assert (=> b!744246 m!694805))

(declare-fun m!694807 () Bool)

(assert (=> b!744246 m!694807))

(declare-fun m!694809 () Bool)

(assert (=> b!744246 m!694809))

(assert (=> b!744246 m!694803))

(declare-fun m!694811 () Bool)

(assert (=> b!744246 m!694811))

(declare-fun m!694813 () Bool)

(assert (=> b!744239 m!694813))

(declare-fun m!694815 () Bool)

(assert (=> b!744242 m!694815))

(assert (=> b!744240 m!694793))

(assert (=> b!744240 m!694793))

(declare-fun m!694817 () Bool)

(assert (=> b!744240 m!694817))

(assert (=> b!744244 m!694793))

(assert (=> b!744244 m!694793))

(declare-fun m!694819 () Bool)

(assert (=> b!744244 m!694819))

(declare-fun m!694821 () Bool)

(assert (=> b!744248 m!694821))

(assert (=> b!744238 m!694793))

(assert (=> b!744238 m!694793))

(declare-fun m!694823 () Bool)

(assert (=> b!744238 m!694823))

(declare-fun m!694825 () Bool)

(assert (=> b!744233 m!694825))

(declare-fun m!694827 () Bool)

(assert (=> b!744249 m!694827))

(declare-fun m!694829 () Bool)

(assert (=> b!744247 m!694829))

(declare-fun m!694831 () Bool)

(assert (=> b!744234 m!694831))

(declare-fun m!694833 () Bool)

(assert (=> b!744234 m!694833))

(assert (=> b!744241 m!694793))

(assert (=> b!744241 m!694793))

(assert (=> b!744241 m!694819))

(assert (=> b!744245 m!694793))

(assert (=> b!744245 m!694793))

(declare-fun m!694835 () Bool)

(assert (=> b!744245 m!694835))

(assert (=> b!744245 m!694835))

(assert (=> b!744245 m!694793))

(declare-fun m!694837 () Bool)

(assert (=> b!744245 m!694837))

(check-sat (not b!744248) (not start!65400) (not b!744241) (not b!744237) (not b!744234) (not b!744232) (not b!744245) (not b!744239) (not b!744247) (not b!744238) (not b!744246) (not b!744249) (not b!744244) (not b!744240) (not b!744233))
(check-sat)
