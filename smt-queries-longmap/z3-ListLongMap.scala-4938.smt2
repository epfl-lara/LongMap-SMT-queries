; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68006 () Bool)

(assert start!68006)

(declare-fun b!791453 () Bool)

(declare-fun res!536198 () Bool)

(declare-fun e!439850 () Bool)

(assert (=> b!791453 (=> (not res!536198) (not e!439850))))

(declare-datatypes ((array!42920 0))(
  ( (array!42921 (arr!20545 (Array (_ BitVec 32) (_ BitVec 64))) (size!20966 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42920)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791453 (= res!536198 (validKeyInArray!0 (select (arr!20545 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!791454 () Bool)

(declare-datatypes ((SeekEntryResult!8145 0))(
  ( (MissingZero!8145 (index!34948 (_ BitVec 32))) (Found!8145 (index!34949 (_ BitVec 32))) (Intermediate!8145 (undefined!8957 Bool) (index!34950 (_ BitVec 32)) (x!65887 (_ BitVec 32))) (Undefined!8145) (MissingVacant!8145 (index!34951 (_ BitVec 32))) )
))
(declare-fun lt!353264 () SeekEntryResult!8145)

(declare-fun e!439843 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42920 (_ BitVec 32)) SeekEntryResult!8145)

(assert (=> b!791454 (= e!439843 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20545 a!3186) j!159) a!3186 mask!3328) lt!353264))))

(declare-fun b!791455 () Bool)

(declare-fun e!439846 () Bool)

(assert (=> b!791455 (= e!439846 (not true))))

(declare-fun e!439849 () Bool)

(assert (=> b!791455 e!439849))

(declare-fun res!536202 () Bool)

(assert (=> b!791455 (=> (not res!536202) (not e!439849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42920 (_ BitVec 32)) Bool)

(assert (=> b!791455 (= res!536202 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27442 0))(
  ( (Unit!27443) )
))
(declare-fun lt!353263 () Unit!27442)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27442)

(assert (=> b!791455 (= lt!353263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791456 () Bool)

(declare-fun res!536207 () Bool)

(declare-fun e!439845 () Bool)

(assert (=> b!791456 (=> (not res!536207) (not e!439845))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791456 (= res!536207 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20545 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791457 () Bool)

(declare-fun res!536208 () Bool)

(declare-fun e!439848 () Bool)

(assert (=> b!791457 (=> (not res!536208) (not e!439848))))

(assert (=> b!791457 (= res!536208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791458 () Bool)

(assert (=> b!791458 (= e!439850 e!439848)))

(declare-fun res!536200 () Bool)

(assert (=> b!791458 (=> (not res!536200) (not e!439848))))

(declare-fun lt!353262 () SeekEntryResult!8145)

(assert (=> b!791458 (= res!536200 (or (= lt!353262 (MissingZero!8145 i!1173)) (= lt!353262 (MissingVacant!8145 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42920 (_ BitVec 32)) SeekEntryResult!8145)

(assert (=> b!791458 (= lt!353262 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791459 () Bool)

(assert (=> b!791459 (= e!439848 e!439845)))

(declare-fun res!536197 () Bool)

(assert (=> b!791459 (=> (not res!536197) (not e!439845))))

(declare-fun lt!353265 () SeekEntryResult!8145)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42920 (_ BitVec 32)) SeekEntryResult!8145)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791459 (= res!536197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20545 a!3186) j!159) mask!3328) (select (arr!20545 a!3186) j!159) a!3186 mask!3328) lt!353265))))

(assert (=> b!791459 (= lt!353265 (Intermediate!8145 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791460 () Bool)

(assert (=> b!791460 (= e!439845 e!439846)))

(declare-fun res!536210 () Bool)

(assert (=> b!791460 (=> (not res!536210) (not e!439846))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!353266 () array!42920)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!353267 () (_ BitVec 64))

(assert (=> b!791460 (= res!536210 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353267 mask!3328) lt!353267 lt!353266 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353267 lt!353266 mask!3328)))))

(assert (=> b!791460 (= lt!353267 (select (store (arr!20545 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791460 (= lt!353266 (array!42921 (store (arr!20545 a!3186) i!1173 k0!2102) (size!20966 a!3186)))))

(declare-fun b!791461 () Bool)

(declare-fun res!536205 () Bool)

(assert (=> b!791461 (=> (not res!536205) (not e!439850))))

(assert (=> b!791461 (= res!536205 (validKeyInArray!0 k0!2102))))

(declare-fun b!791462 () Bool)

(declare-fun res!536203 () Bool)

(assert (=> b!791462 (=> (not res!536203) (not e!439848))))

(assert (=> b!791462 (= res!536203 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20966 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20966 a!3186))))))

(declare-fun b!791463 () Bool)

(declare-fun res!536199 () Bool)

(assert (=> b!791463 (=> (not res!536199) (not e!439848))))

(declare-datatypes ((List!14547 0))(
  ( (Nil!14544) (Cons!14543 (h!15672 (_ BitVec 64)) (t!20862 List!14547)) )
))
(declare-fun arrayNoDuplicates!0 (array!42920 (_ BitVec 32) List!14547) Bool)

(assert (=> b!791463 (= res!536199 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14544))))

(declare-fun res!536209 () Bool)

(assert (=> start!68006 (=> (not res!536209) (not e!439850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68006 (= res!536209 (validMask!0 mask!3328))))

(assert (=> start!68006 e!439850))

(assert (=> start!68006 true))

(declare-fun array_inv!16341 (array!42920) Bool)

(assert (=> start!68006 (array_inv!16341 a!3186)))

(declare-fun b!791464 () Bool)

(assert (=> b!791464 (= e!439849 e!439843)))

(declare-fun res!536204 () Bool)

(assert (=> b!791464 (=> (not res!536204) (not e!439843))))

(assert (=> b!791464 (= res!536204 (= (seekEntryOrOpen!0 (select (arr!20545 a!3186) j!159) a!3186 mask!3328) lt!353264))))

(assert (=> b!791464 (= lt!353264 (Found!8145 j!159))))

(declare-fun e!439844 () Bool)

(declare-fun b!791465 () Bool)

(assert (=> b!791465 (= e!439844 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20545 a!3186) j!159) a!3186 mask!3328) lt!353265))))

(declare-fun b!791466 () Bool)

(declare-fun res!536201 () Bool)

(assert (=> b!791466 (=> (not res!536201) (not e!439845))))

(assert (=> b!791466 (= res!536201 e!439844)))

(declare-fun c!88039 () Bool)

(assert (=> b!791466 (= c!88039 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791467 () Bool)

(assert (=> b!791467 (= e!439844 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20545 a!3186) j!159) a!3186 mask!3328) (Found!8145 j!159)))))

(declare-fun b!791468 () Bool)

(declare-fun res!536206 () Bool)

(assert (=> b!791468 (=> (not res!536206) (not e!439850))))

(assert (=> b!791468 (= res!536206 (and (= (size!20966 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20966 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20966 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791469 () Bool)

(declare-fun res!536196 () Bool)

(assert (=> b!791469 (=> (not res!536196) (not e!439850))))

(declare-fun arrayContainsKey!0 (array!42920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791469 (= res!536196 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!68006 res!536209) b!791468))

(assert (= (and b!791468 res!536206) b!791453))

(assert (= (and b!791453 res!536198) b!791461))

(assert (= (and b!791461 res!536205) b!791469))

(assert (= (and b!791469 res!536196) b!791458))

(assert (= (and b!791458 res!536200) b!791457))

(assert (= (and b!791457 res!536208) b!791463))

(assert (= (and b!791463 res!536199) b!791462))

(assert (= (and b!791462 res!536203) b!791459))

(assert (= (and b!791459 res!536197) b!791456))

(assert (= (and b!791456 res!536207) b!791466))

(assert (= (and b!791466 c!88039) b!791465))

(assert (= (and b!791466 (not c!88039)) b!791467))

(assert (= (and b!791466 res!536201) b!791460))

(assert (= (and b!791460 res!536210) b!791455))

(assert (= (and b!791455 res!536202) b!791464))

(assert (= (and b!791464 res!536204) b!791454))

(declare-fun m!732189 () Bool)

(assert (=> b!791453 m!732189))

(assert (=> b!791453 m!732189))

(declare-fun m!732191 () Bool)

(assert (=> b!791453 m!732191))

(declare-fun m!732193 () Bool)

(assert (=> b!791469 m!732193))

(assert (=> b!791465 m!732189))

(assert (=> b!791465 m!732189))

(declare-fun m!732195 () Bool)

(assert (=> b!791465 m!732195))

(assert (=> b!791467 m!732189))

(assert (=> b!791467 m!732189))

(declare-fun m!732197 () Bool)

(assert (=> b!791467 m!732197))

(declare-fun m!732199 () Bool)

(assert (=> b!791458 m!732199))

(declare-fun m!732201 () Bool)

(assert (=> b!791457 m!732201))

(declare-fun m!732203 () Bool)

(assert (=> start!68006 m!732203))

(declare-fun m!732205 () Bool)

(assert (=> start!68006 m!732205))

(declare-fun m!732207 () Bool)

(assert (=> b!791463 m!732207))

(declare-fun m!732209 () Bool)

(assert (=> b!791456 m!732209))

(declare-fun m!732211 () Bool)

(assert (=> b!791455 m!732211))

(declare-fun m!732213 () Bool)

(assert (=> b!791455 m!732213))

(declare-fun m!732215 () Bool)

(assert (=> b!791461 m!732215))

(declare-fun m!732217 () Bool)

(assert (=> b!791460 m!732217))

(declare-fun m!732219 () Bool)

(assert (=> b!791460 m!732219))

(declare-fun m!732221 () Bool)

(assert (=> b!791460 m!732221))

(declare-fun m!732223 () Bool)

(assert (=> b!791460 m!732223))

(assert (=> b!791460 m!732219))

(declare-fun m!732225 () Bool)

(assert (=> b!791460 m!732225))

(assert (=> b!791464 m!732189))

(assert (=> b!791464 m!732189))

(declare-fun m!732227 () Bool)

(assert (=> b!791464 m!732227))

(assert (=> b!791459 m!732189))

(assert (=> b!791459 m!732189))

(declare-fun m!732229 () Bool)

(assert (=> b!791459 m!732229))

(assert (=> b!791459 m!732229))

(assert (=> b!791459 m!732189))

(declare-fun m!732231 () Bool)

(assert (=> b!791459 m!732231))

(assert (=> b!791454 m!732189))

(assert (=> b!791454 m!732189))

(declare-fun m!732233 () Bool)

(assert (=> b!791454 m!732233))

(check-sat (not b!791465) (not b!791464) (not b!791458) (not b!791467) (not b!791461) (not b!791453) (not b!791460) (not b!791459) (not b!791455) (not start!68006) (not b!791463) (not b!791469) (not b!791457) (not b!791454))
(check-sat)
