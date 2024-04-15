; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65192 () Bool)

(assert start!65192)

(declare-fun b!738162 () Bool)

(declare-fun e!412807 () Bool)

(declare-fun e!412814 () Bool)

(assert (=> b!738162 (= e!412807 e!412814)))

(declare-fun res!496312 () Bool)

(assert (=> b!738162 (=> (not res!496312) (not e!412814))))

(declare-datatypes ((array!41382 0))(
  ( (array!41383 (arr!19805 (Array (_ BitVec 32) (_ BitVec 64))) (size!20226 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41382)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7402 0))(
  ( (MissingZero!7402 (index!31976 (_ BitVec 32))) (Found!7402 (index!31977 (_ BitVec 32))) (Intermediate!7402 (undefined!8214 Bool) (index!31978 (_ BitVec 32)) (x!62979 (_ BitVec 32))) (Undefined!7402) (MissingVacant!7402 (index!31979 (_ BitVec 32))) )
))
(declare-fun lt!327521 () SeekEntryResult!7402)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41382 (_ BitVec 32)) SeekEntryResult!7402)

(assert (=> b!738162 (= res!496312 (= (seekEntryOrOpen!0 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327521))))

(assert (=> b!738162 (= lt!327521 (Found!7402 j!159))))

(declare-fun b!738163 () Bool)

(declare-fun e!412805 () Bool)

(declare-fun e!412806 () Bool)

(assert (=> b!738163 (= e!412805 (not e!412806))))

(declare-fun res!496303 () Bool)

(assert (=> b!738163 (=> res!496303 e!412806)))

(declare-fun lt!327519 () SeekEntryResult!7402)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!738163 (= res!496303 (or (not ((_ is Intermediate!7402) lt!327519)) (bvsge x!1131 (x!62979 lt!327519))))))

(declare-fun lt!327518 () SeekEntryResult!7402)

(assert (=> b!738163 (= lt!327518 (Found!7402 j!159))))

(assert (=> b!738163 e!412807))

(declare-fun res!496305 () Bool)

(assert (=> b!738163 (=> (not res!496305) (not e!412807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41382 (_ BitVec 32)) Bool)

(assert (=> b!738163 (= res!496305 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25184 0))(
  ( (Unit!25185) )
))
(declare-fun lt!327511 () Unit!25184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25184)

(assert (=> b!738163 (= lt!327511 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738164 () Bool)

(declare-fun e!412809 () Unit!25184)

(declare-fun Unit!25186 () Unit!25184)

(assert (=> b!738164 (= e!412809 Unit!25186)))

(declare-fun lt!327513 () (_ BitVec 32))

(declare-fun lt!327509 () SeekEntryResult!7402)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41382 (_ BitVec 32)) SeekEntryResult!7402)

(assert (=> b!738164 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327513 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327509)))

(declare-fun b!738165 () Bool)

(declare-fun res!496313 () Bool)

(declare-fun e!412808 () Bool)

(assert (=> b!738165 (=> (not res!496313) (not e!412808))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738165 (= res!496313 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19805 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738166 () Bool)

(declare-fun res!496311 () Bool)

(declare-fun e!412810 () Bool)

(assert (=> b!738166 (=> (not res!496311) (not e!412810))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738166 (= res!496311 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738167 () Bool)

(declare-fun res!496301 () Bool)

(declare-fun e!412812 () Bool)

(assert (=> b!738167 (=> (not res!496301) (not e!412812))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738167 (= res!496301 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20226 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20226 a!3186))))))

(declare-fun b!738168 () Bool)

(declare-fun e!412815 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41382 (_ BitVec 32)) SeekEntryResult!7402)

(assert (=> b!738168 (= e!412815 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327513 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327518)))))

(declare-fun b!738169 () Bool)

(declare-fun e!412816 () Bool)

(assert (=> b!738169 (= e!412816 true)))

(declare-fun lt!327516 () (_ BitVec 64))

(declare-fun lt!327517 () SeekEntryResult!7402)

(declare-fun lt!327514 () array!41382)

(assert (=> b!738169 (= lt!327517 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327513 lt!327516 lt!327514 mask!3328))))

(declare-fun b!738170 () Bool)

(declare-fun res!496306 () Bool)

(assert (=> b!738170 (=> (not res!496306) (not e!412812))))

(assert (=> b!738170 (= res!496306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738171 () Bool)

(declare-fun Unit!25187 () Unit!25184)

(assert (=> b!738171 (= e!412809 Unit!25187)))

(declare-fun lt!327512 () SeekEntryResult!7402)

(assert (=> b!738171 (= lt!327512 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738171 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327513 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327518)))

(declare-fun b!738173 () Bool)

(declare-fun res!496298 () Bool)

(assert (=> b!738173 (=> (not res!496298) (not e!412810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738173 (= res!496298 (validKeyInArray!0 k0!2102))))

(declare-fun b!738174 () Bool)

(assert (=> b!738174 (= e!412812 e!412808)))

(declare-fun res!496302 () Bool)

(assert (=> b!738174 (=> (not res!496302) (not e!412808))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738174 (= res!496302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19805 a!3186) j!159) mask!3328) (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327509))))

(assert (=> b!738174 (= lt!327509 (Intermediate!7402 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738175 () Bool)

(declare-fun res!496309 () Bool)

(assert (=> b!738175 (=> (not res!496309) (not e!412810))))

(assert (=> b!738175 (= res!496309 (validKeyInArray!0 (select (arr!19805 a!3186) j!159)))))

(declare-fun b!738176 () Bool)

(assert (=> b!738176 (= e!412806 e!412816)))

(declare-fun res!496300 () Bool)

(assert (=> b!738176 (=> res!496300 e!412816)))

(assert (=> b!738176 (= res!496300 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327513 #b00000000000000000000000000000000) (bvsge lt!327513 (size!20226 a!3186))))))

(declare-fun lt!327515 () Unit!25184)

(assert (=> b!738176 (= lt!327515 e!412809)))

(declare-fun c!81313 () Bool)

(declare-fun lt!327510 () Bool)

(assert (=> b!738176 (= c!81313 lt!327510)))

(assert (=> b!738176 (= lt!327510 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738176 (= lt!327513 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738177 () Bool)

(declare-fun res!496310 () Bool)

(assert (=> b!738177 (=> (not res!496310) (not e!412810))))

(assert (=> b!738177 (= res!496310 (and (= (size!20226 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20226 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20226 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738178 () Bool)

(declare-fun e!412813 () Bool)

(assert (=> b!738178 (= e!412813 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327509))))

(declare-fun b!738179 () Bool)

(assert (=> b!738179 (= e!412815 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327513 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327509)))))

(declare-fun b!738180 () Bool)

(assert (=> b!738180 (= e!412813 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) (Found!7402 j!159)))))

(declare-fun b!738181 () Bool)

(assert (=> b!738181 (= e!412808 e!412805)))

(declare-fun res!496299 () Bool)

(assert (=> b!738181 (=> (not res!496299) (not e!412805))))

(declare-fun lt!327520 () SeekEntryResult!7402)

(assert (=> b!738181 (= res!496299 (= lt!327520 lt!327519))))

(assert (=> b!738181 (= lt!327519 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327516 lt!327514 mask!3328))))

(assert (=> b!738181 (= lt!327520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327516 mask!3328) lt!327516 lt!327514 mask!3328))))

(assert (=> b!738181 (= lt!327516 (select (store (arr!19805 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738181 (= lt!327514 (array!41383 (store (arr!19805 a!3186) i!1173 k0!2102) (size!20226 a!3186)))))

(declare-fun b!738182 () Bool)

(declare-fun res!496304 () Bool)

(assert (=> b!738182 (=> (not res!496304) (not e!412808))))

(assert (=> b!738182 (= res!496304 e!412813)))

(declare-fun c!81315 () Bool)

(assert (=> b!738182 (= c!81315 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738183 () Bool)

(declare-fun res!496308 () Bool)

(assert (=> b!738183 (=> res!496308 e!412816)))

(assert (=> b!738183 (= res!496308 e!412815)))

(declare-fun c!81314 () Bool)

(assert (=> b!738183 (= c!81314 lt!327510)))

(declare-fun b!738184 () Bool)

(assert (=> b!738184 (= e!412810 e!412812)))

(declare-fun res!496297 () Bool)

(assert (=> b!738184 (=> (not res!496297) (not e!412812))))

(declare-fun lt!327508 () SeekEntryResult!7402)

(assert (=> b!738184 (= res!496297 (or (= lt!327508 (MissingZero!7402 i!1173)) (= lt!327508 (MissingVacant!7402 i!1173))))))

(assert (=> b!738184 (= lt!327508 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738185 () Bool)

(declare-fun res!496307 () Bool)

(assert (=> b!738185 (=> (not res!496307) (not e!412812))))

(declare-datatypes ((List!13846 0))(
  ( (Nil!13843) (Cons!13842 (h!14914 (_ BitVec 64)) (t!20152 List!13846)) )
))
(declare-fun arrayNoDuplicates!0 (array!41382 (_ BitVec 32) List!13846) Bool)

(assert (=> b!738185 (= res!496307 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13843))))

(declare-fun b!738172 () Bool)

(assert (=> b!738172 (= e!412814 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19805 a!3186) j!159) a!3186 mask!3328) lt!327521))))

(declare-fun res!496314 () Bool)

(assert (=> start!65192 (=> (not res!496314) (not e!412810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65192 (= res!496314 (validMask!0 mask!3328))))

(assert (=> start!65192 e!412810))

(assert (=> start!65192 true))

(declare-fun array_inv!15688 (array!41382) Bool)

(assert (=> start!65192 (array_inv!15688 a!3186)))

(assert (= (and start!65192 res!496314) b!738177))

(assert (= (and b!738177 res!496310) b!738175))

(assert (= (and b!738175 res!496309) b!738173))

(assert (= (and b!738173 res!496298) b!738166))

(assert (= (and b!738166 res!496311) b!738184))

(assert (= (and b!738184 res!496297) b!738170))

(assert (= (and b!738170 res!496306) b!738185))

(assert (= (and b!738185 res!496307) b!738167))

(assert (= (and b!738167 res!496301) b!738174))

(assert (= (and b!738174 res!496302) b!738165))

(assert (= (and b!738165 res!496313) b!738182))

(assert (= (and b!738182 c!81315) b!738178))

(assert (= (and b!738182 (not c!81315)) b!738180))

(assert (= (and b!738182 res!496304) b!738181))

(assert (= (and b!738181 res!496299) b!738163))

(assert (= (and b!738163 res!496305) b!738162))

(assert (= (and b!738162 res!496312) b!738172))

(assert (= (and b!738163 (not res!496303)) b!738176))

(assert (= (and b!738176 c!81313) b!738164))

(assert (= (and b!738176 (not c!81313)) b!738171))

(assert (= (and b!738176 (not res!496300)) b!738183))

(assert (= (and b!738183 c!81314) b!738179))

(assert (= (and b!738183 (not c!81314)) b!738168))

(assert (= (and b!738183 (not res!496308)) b!738169))

(declare-fun m!689291 () Bool)

(assert (=> b!738172 m!689291))

(assert (=> b!738172 m!689291))

(declare-fun m!689293 () Bool)

(assert (=> b!738172 m!689293))

(declare-fun m!689295 () Bool)

(assert (=> b!738170 m!689295))

(declare-fun m!689297 () Bool)

(assert (=> b!738169 m!689297))

(declare-fun m!689299 () Bool)

(assert (=> b!738185 m!689299))

(declare-fun m!689301 () Bool)

(assert (=> b!738166 m!689301))

(assert (=> b!738162 m!689291))

(assert (=> b!738162 m!689291))

(declare-fun m!689303 () Bool)

(assert (=> b!738162 m!689303))

(assert (=> b!738179 m!689291))

(assert (=> b!738179 m!689291))

(declare-fun m!689305 () Bool)

(assert (=> b!738179 m!689305))

(assert (=> b!738164 m!689291))

(assert (=> b!738164 m!689291))

(assert (=> b!738164 m!689305))

(assert (=> b!738168 m!689291))

(assert (=> b!738168 m!689291))

(declare-fun m!689307 () Bool)

(assert (=> b!738168 m!689307))

(assert (=> b!738180 m!689291))

(assert (=> b!738180 m!689291))

(declare-fun m!689309 () Bool)

(assert (=> b!738180 m!689309))

(declare-fun m!689311 () Bool)

(assert (=> b!738173 m!689311))

(declare-fun m!689313 () Bool)

(assert (=> b!738184 m!689313))

(declare-fun m!689315 () Bool)

(assert (=> b!738181 m!689315))

(declare-fun m!689317 () Bool)

(assert (=> b!738181 m!689317))

(declare-fun m!689319 () Bool)

(assert (=> b!738181 m!689319))

(declare-fun m!689321 () Bool)

(assert (=> b!738181 m!689321))

(assert (=> b!738181 m!689315))

(declare-fun m!689323 () Bool)

(assert (=> b!738181 m!689323))

(assert (=> b!738171 m!689291))

(assert (=> b!738171 m!689291))

(assert (=> b!738171 m!689309))

(assert (=> b!738171 m!689291))

(assert (=> b!738171 m!689307))

(assert (=> b!738174 m!689291))

(assert (=> b!738174 m!689291))

(declare-fun m!689325 () Bool)

(assert (=> b!738174 m!689325))

(assert (=> b!738174 m!689325))

(assert (=> b!738174 m!689291))

(declare-fun m!689327 () Bool)

(assert (=> b!738174 m!689327))

(declare-fun m!689329 () Bool)

(assert (=> start!65192 m!689329))

(declare-fun m!689331 () Bool)

(assert (=> start!65192 m!689331))

(declare-fun m!689333 () Bool)

(assert (=> b!738165 m!689333))

(declare-fun m!689335 () Bool)

(assert (=> b!738176 m!689335))

(declare-fun m!689337 () Bool)

(assert (=> b!738163 m!689337))

(declare-fun m!689339 () Bool)

(assert (=> b!738163 m!689339))

(assert (=> b!738175 m!689291))

(assert (=> b!738175 m!689291))

(declare-fun m!689341 () Bool)

(assert (=> b!738175 m!689341))

(assert (=> b!738178 m!689291))

(assert (=> b!738178 m!689291))

(declare-fun m!689343 () Bool)

(assert (=> b!738178 m!689343))

(check-sat (not b!738168) (not b!738172) (not b!738162) (not b!738163) (not b!738174) (not b!738170) (not b!738184) (not b!738173) (not start!65192) (not b!738166) (not b!738164) (not b!738176) (not b!738180) (not b!738169) (not b!738175) (not b!738178) (not b!738179) (not b!738181) (not b!738171) (not b!738185))
(check-sat)
