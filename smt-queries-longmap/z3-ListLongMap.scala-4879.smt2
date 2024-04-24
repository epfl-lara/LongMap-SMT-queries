; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67372 () Bool)

(assert start!67372)

(declare-datatypes ((array!42544 0))(
  ( (array!42545 (arr!20362 (Array (_ BitVec 32) (_ BitVec 64))) (size!20782 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42544)

(declare-datatypes ((SeekEntryResult!7918 0))(
  ( (MissingZero!7918 (index!34040 (_ BitVec 32))) (Found!7918 (index!34041 (_ BitVec 32))) (Intermediate!7918 (undefined!8730 Bool) (index!34042 (_ BitVec 32)) (x!65145 (_ BitVec 32))) (Undefined!7918) (MissingVacant!7918 (index!34043 (_ BitVec 32))) )
))
(declare-fun lt!346687 () SeekEntryResult!7918)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!433068 () Bool)

(declare-fun b!778184 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42544 (_ BitVec 32)) SeekEntryResult!7918)

(assert (=> b!778184 (= e!433068 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20362 a!3186) j!159) a!3186 mask!3328) lt!346687))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!346686 () SeekEntryResult!7918)

(declare-fun b!778185 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!433065 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42544 (_ BitVec 32)) SeekEntryResult!7918)

(assert (=> b!778185 (= e!433065 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20362 a!3186) j!159) a!3186 mask!3328) lt!346686))))

(declare-fun b!778186 () Bool)

(declare-fun res!526247 () Bool)

(declare-fun e!433069 () Bool)

(assert (=> b!778186 (=> (not res!526247) (not e!433069))))

(assert (=> b!778186 (= res!526247 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20782 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20782 a!3186))))))

(declare-fun b!778187 () Bool)

(declare-fun e!433070 () Bool)

(assert (=> b!778187 (= e!433070 e!433069)))

(declare-fun res!526241 () Bool)

(assert (=> b!778187 (=> (not res!526241) (not e!433069))))

(declare-fun lt!346685 () SeekEntryResult!7918)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778187 (= res!526241 (or (= lt!346685 (MissingZero!7918 i!1173)) (= lt!346685 (MissingVacant!7918 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42544 (_ BitVec 32)) SeekEntryResult!7918)

(assert (=> b!778187 (= lt!346685 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!778188 () Bool)

(declare-fun res!526235 () Bool)

(declare-fun e!433071 () Bool)

(assert (=> b!778188 (=> res!526235 e!433071)))

(declare-fun lt!346680 () SeekEntryResult!7918)

(declare-fun lt!346679 () (_ BitVec 64))

(assert (=> b!778188 (= res!526235 (or (not (= (select (store (arr!20362 a!3186) i!1173 k0!2102) index!1321) lt!346679)) (undefined!8730 lt!346680)))))

(declare-fun b!778189 () Bool)

(declare-fun res!526248 () Bool)

(assert (=> b!778189 (=> (not res!526248) (not e!433069))))

(declare-datatypes ((List!14271 0))(
  ( (Nil!14268) (Cons!14267 (h!15384 (_ BitVec 64)) (t!20578 List!14271)) )
))
(declare-fun arrayNoDuplicates!0 (array!42544 (_ BitVec 32) List!14271) Bool)

(assert (=> b!778189 (= res!526248 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14268))))

(declare-fun b!778190 () Bool)

(declare-fun res!526237 () Bool)

(declare-fun e!433072 () Bool)

(assert (=> b!778190 (=> (not res!526237) (not e!433072))))

(assert (=> b!778190 (= res!526237 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20362 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778191 () Bool)

(declare-fun e!433064 () Bool)

(assert (=> b!778191 (= e!433064 (not e!433071))))

(declare-fun res!526243 () Bool)

(assert (=> b!778191 (=> res!526243 e!433071)))

(get-info :version)

(assert (=> b!778191 (= res!526243 (or (not ((_ is Intermediate!7918) lt!346680)) (bvslt x!1131 (x!65145 lt!346680)) (not (= x!1131 (x!65145 lt!346680))) (not (= index!1321 (index!34042 lt!346680)))))))

(declare-fun e!433066 () Bool)

(assert (=> b!778191 e!433066))

(declare-fun res!526244 () Bool)

(assert (=> b!778191 (=> (not res!526244) (not e!433066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42544 (_ BitVec 32)) Bool)

(assert (=> b!778191 (= res!526244 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26809 0))(
  ( (Unit!26810) )
))
(declare-fun lt!346681 () Unit!26809)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26809)

(assert (=> b!778191 (= lt!346681 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778192 () Bool)

(assert (=> b!778192 (= e!433069 e!433072)))

(declare-fun res!526231 () Bool)

(assert (=> b!778192 (=> (not res!526231) (not e!433072))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778192 (= res!526231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20362 a!3186) j!159) mask!3328) (select (arr!20362 a!3186) j!159) a!3186 mask!3328) lt!346687))))

(assert (=> b!778192 (= lt!346687 (Intermediate!7918 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778194 () Bool)

(declare-fun res!526238 () Bool)

(assert (=> b!778194 (=> (not res!526238) (not e!433070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778194 (= res!526238 (validKeyInArray!0 (select (arr!20362 a!3186) j!159)))))

(declare-fun b!778195 () Bool)

(declare-fun res!526239 () Bool)

(assert (=> b!778195 (=> (not res!526239) (not e!433070))))

(assert (=> b!778195 (= res!526239 (and (= (size!20782 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20782 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20782 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778196 () Bool)

(assert (=> b!778196 (= e!433068 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20362 a!3186) j!159) a!3186 mask!3328) (Found!7918 j!159)))))

(declare-fun b!778197 () Bool)

(declare-fun res!526242 () Bool)

(assert (=> b!778197 (=> (not res!526242) (not e!433072))))

(assert (=> b!778197 (= res!526242 e!433068)))

(declare-fun c!86381 () Bool)

(assert (=> b!778197 (= c!86381 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778198 () Bool)

(declare-fun res!526232 () Bool)

(assert (=> b!778198 (=> (not res!526232) (not e!433070))))

(declare-fun arrayContainsKey!0 (array!42544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778198 (= res!526232 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778199 () Bool)

(declare-fun res!526246 () Bool)

(assert (=> b!778199 (=> res!526246 e!433071)))

(assert (=> b!778199 (= res!526246 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20362 a!3186) j!159) a!3186 mask!3328) (Found!7918 j!159))))))

(declare-fun b!778200 () Bool)

(declare-fun res!526240 () Bool)

(assert (=> b!778200 (=> (not res!526240) (not e!433069))))

(assert (=> b!778200 (= res!526240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778201 () Bool)

(assert (=> b!778201 (= e!433072 e!433064)))

(declare-fun res!526236 () Bool)

(assert (=> b!778201 (=> (not res!526236) (not e!433064))))

(declare-fun lt!346682 () SeekEntryResult!7918)

(assert (=> b!778201 (= res!526236 (= lt!346682 lt!346680))))

(declare-fun lt!346684 () array!42544)

(assert (=> b!778201 (= lt!346680 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346679 lt!346684 mask!3328))))

(assert (=> b!778201 (= lt!346682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346679 mask!3328) lt!346679 lt!346684 mask!3328))))

(assert (=> b!778201 (= lt!346679 (select (store (arr!20362 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778201 (= lt!346684 (array!42545 (store (arr!20362 a!3186) i!1173 k0!2102) (size!20782 a!3186)))))

(declare-fun b!778202 () Bool)

(assert (=> b!778202 (= e!433071 true)))

(declare-fun lt!346683 () SeekEntryResult!7918)

(assert (=> b!778202 (= lt!346683 (seekEntryOrOpen!0 lt!346679 lt!346684 mask!3328))))

(declare-fun b!778203 () Bool)

(declare-fun res!526245 () Bool)

(assert (=> b!778203 (=> (not res!526245) (not e!433070))))

(assert (=> b!778203 (= res!526245 (validKeyInArray!0 k0!2102))))

(declare-fun res!526233 () Bool)

(assert (=> start!67372 (=> (not res!526233) (not e!433070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67372 (= res!526233 (validMask!0 mask!3328))))

(assert (=> start!67372 e!433070))

(assert (=> start!67372 true))

(declare-fun array_inv!16221 (array!42544) Bool)

(assert (=> start!67372 (array_inv!16221 a!3186)))

(declare-fun b!778193 () Bool)

(assert (=> b!778193 (= e!433066 e!433065)))

(declare-fun res!526234 () Bool)

(assert (=> b!778193 (=> (not res!526234) (not e!433065))))

(assert (=> b!778193 (= res!526234 (= (seekEntryOrOpen!0 (select (arr!20362 a!3186) j!159) a!3186 mask!3328) lt!346686))))

(assert (=> b!778193 (= lt!346686 (Found!7918 j!159))))

(assert (= (and start!67372 res!526233) b!778195))

(assert (= (and b!778195 res!526239) b!778194))

(assert (= (and b!778194 res!526238) b!778203))

(assert (= (and b!778203 res!526245) b!778198))

(assert (= (and b!778198 res!526232) b!778187))

(assert (= (and b!778187 res!526241) b!778200))

(assert (= (and b!778200 res!526240) b!778189))

(assert (= (and b!778189 res!526248) b!778186))

(assert (= (and b!778186 res!526247) b!778192))

(assert (= (and b!778192 res!526231) b!778190))

(assert (= (and b!778190 res!526237) b!778197))

(assert (= (and b!778197 c!86381) b!778184))

(assert (= (and b!778197 (not c!86381)) b!778196))

(assert (= (and b!778197 res!526242) b!778201))

(assert (= (and b!778201 res!526236) b!778191))

(assert (= (and b!778191 res!526244) b!778193))

(assert (= (and b!778193 res!526234) b!778185))

(assert (= (and b!778191 (not res!526243)) b!778199))

(assert (= (and b!778199 (not res!526246)) b!778188))

(assert (= (and b!778188 (not res!526235)) b!778202))

(declare-fun m!722453 () Bool)

(assert (=> b!778187 m!722453))

(declare-fun m!722455 () Bool)

(assert (=> b!778202 m!722455))

(declare-fun m!722457 () Bool)

(assert (=> b!778200 m!722457))

(declare-fun m!722459 () Bool)

(assert (=> b!778185 m!722459))

(assert (=> b!778185 m!722459))

(declare-fun m!722461 () Bool)

(assert (=> b!778185 m!722461))

(assert (=> b!778199 m!722459))

(assert (=> b!778199 m!722459))

(declare-fun m!722463 () Bool)

(assert (=> b!778199 m!722463))

(declare-fun m!722465 () Bool)

(assert (=> b!778201 m!722465))

(declare-fun m!722467 () Bool)

(assert (=> b!778201 m!722467))

(declare-fun m!722469 () Bool)

(assert (=> b!778201 m!722469))

(declare-fun m!722471 () Bool)

(assert (=> b!778201 m!722471))

(assert (=> b!778201 m!722469))

(declare-fun m!722473 () Bool)

(assert (=> b!778201 m!722473))

(assert (=> b!778196 m!722459))

(assert (=> b!778196 m!722459))

(assert (=> b!778196 m!722463))

(assert (=> b!778194 m!722459))

(assert (=> b!778194 m!722459))

(declare-fun m!722475 () Bool)

(assert (=> b!778194 m!722475))

(assert (=> b!778192 m!722459))

(assert (=> b!778192 m!722459))

(declare-fun m!722477 () Bool)

(assert (=> b!778192 m!722477))

(assert (=> b!778192 m!722477))

(assert (=> b!778192 m!722459))

(declare-fun m!722479 () Bool)

(assert (=> b!778192 m!722479))

(assert (=> b!778193 m!722459))

(assert (=> b!778193 m!722459))

(declare-fun m!722481 () Bool)

(assert (=> b!778193 m!722481))

(declare-fun m!722483 () Bool)

(assert (=> b!778203 m!722483))

(assert (=> b!778184 m!722459))

(assert (=> b!778184 m!722459))

(declare-fun m!722485 () Bool)

(assert (=> b!778184 m!722485))

(declare-fun m!722487 () Bool)

(assert (=> b!778189 m!722487))

(declare-fun m!722489 () Bool)

(assert (=> b!778198 m!722489))

(declare-fun m!722491 () Bool)

(assert (=> start!67372 m!722491))

(declare-fun m!722493 () Bool)

(assert (=> start!67372 m!722493))

(assert (=> b!778188 m!722465))

(declare-fun m!722495 () Bool)

(assert (=> b!778188 m!722495))

(declare-fun m!722497 () Bool)

(assert (=> b!778191 m!722497))

(declare-fun m!722499 () Bool)

(assert (=> b!778191 m!722499))

(declare-fun m!722501 () Bool)

(assert (=> b!778190 m!722501))

(check-sat (not b!778189) (not b!778201) (not b!778196) (not b!778192) (not b!778200) (not b!778198) (not b!778191) (not start!67372) (not b!778194) (not b!778193) (not b!778185) (not b!778199) (not b!778187) (not b!778184) (not b!778202) (not b!778203))
(check-sat)
