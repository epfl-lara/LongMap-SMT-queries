; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65588 () Bool)

(assert start!65588)

(declare-fun b!750191 () Bool)

(declare-fun e!418545 () Bool)

(declare-fun e!418538 () Bool)

(assert (=> b!750191 (= e!418545 e!418538)))

(declare-fun res!506389 () Bool)

(assert (=> b!750191 (=> (not res!506389) (not e!418538))))

(declare-datatypes ((SeekEntryResult!7600 0))(
  ( (MissingZero!7600 (index!32768 (_ BitVec 32))) (Found!7600 (index!32769 (_ BitVec 32))) (Intermediate!7600 (undefined!8412 Bool) (index!32770 (_ BitVec 32)) (x!63705 (_ BitVec 32))) (Undefined!7600) (MissingVacant!7600 (index!32771 (_ BitVec 32))) )
))
(declare-fun lt!333447 () SeekEntryResult!7600)

(declare-fun lt!333446 () SeekEntryResult!7600)

(assert (=> b!750191 (= res!506389 (= lt!333447 lt!333446))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!333449 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41778 0))(
  ( (array!41779 (arr!20003 (Array (_ BitVec 32) (_ BitVec 64))) (size!20424 (_ BitVec 32))) )
))
(declare-fun lt!333443 () array!41778)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41778 (_ BitVec 32)) SeekEntryResult!7600)

(assert (=> b!750191 (= lt!333446 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333449 lt!333443 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750191 (= lt!333447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333449 mask!3328) lt!333449 lt!333443 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!41778)

(assert (=> b!750191 (= lt!333449 (select (store (arr!20003 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750191 (= lt!333443 (array!41779 (store (arr!20003 a!3186) i!1173 k0!2102) (size!20424 a!3186)))))

(declare-fun b!750192 () Bool)

(declare-fun e!418542 () Bool)

(assert (=> b!750192 (= e!418538 (not e!418542))))

(declare-fun res!506403 () Bool)

(assert (=> b!750192 (=> res!506403 e!418542)))

(get-info :version)

(assert (=> b!750192 (= res!506403 (or (not ((_ is Intermediate!7600) lt!333446)) (bvslt x!1131 (x!63705 lt!333446)) (not (= x!1131 (x!63705 lt!333446))) (not (= index!1321 (index!32770 lt!333446)))))))

(declare-fun e!418537 () Bool)

(assert (=> b!750192 e!418537))

(declare-fun res!506396 () Bool)

(assert (=> b!750192 (=> (not res!506396) (not e!418537))))

(declare-fun lt!333450 () SeekEntryResult!7600)

(declare-fun lt!333451 () SeekEntryResult!7600)

(assert (=> b!750192 (= res!506396 (= lt!333450 lt!333451))))

(assert (=> b!750192 (= lt!333451 (Found!7600 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41778 (_ BitVec 32)) SeekEntryResult!7600)

(assert (=> b!750192 (= lt!333450 (seekEntryOrOpen!0 (select (arr!20003 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41778 (_ BitVec 32)) Bool)

(assert (=> b!750192 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25760 0))(
  ( (Unit!25761) )
))
(declare-fun lt!333448 () Unit!25760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25760)

(assert (=> b!750192 (= lt!333448 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750193 () Bool)

(declare-fun e!418536 () Bool)

(declare-fun lt!333452 () SeekEntryResult!7600)

(assert (=> b!750193 (= e!418536 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20003 a!3186) j!159) a!3186 mask!3328) lt!333452))))

(declare-fun b!750194 () Bool)

(declare-fun res!506400 () Bool)

(declare-fun e!418541 () Bool)

(assert (=> b!750194 (=> (not res!506400) (not e!418541))))

(declare-datatypes ((List!14044 0))(
  ( (Nil!14041) (Cons!14040 (h!15112 (_ BitVec 64)) (t!20350 List!14044)) )
))
(declare-fun arrayNoDuplicates!0 (array!41778 (_ BitVec 32) List!14044) Bool)

(assert (=> b!750194 (= res!506400 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14041))))

(declare-fun b!750195 () Bool)

(declare-fun res!506395 () Bool)

(assert (=> b!750195 (=> (not res!506395) (not e!418545))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!750195 (= res!506395 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20003 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750197 () Bool)

(declare-fun e!418544 () Unit!25760)

(declare-fun Unit!25762 () Unit!25760)

(assert (=> b!750197 (= e!418544 Unit!25762)))

(declare-fun b!750198 () Bool)

(declare-fun res!506391 () Bool)

(declare-fun e!418539 () Bool)

(assert (=> b!750198 (=> (not res!506391) (not e!418539))))

(assert (=> b!750198 (= res!506391 (and (= (size!20424 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20424 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20424 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750199 () Bool)

(declare-fun Unit!25763 () Unit!25760)

(assert (=> b!750199 (= e!418544 Unit!25763)))

(assert (=> b!750199 false))

(declare-fun b!750200 () Bool)

(declare-fun res!506388 () Bool)

(assert (=> b!750200 (=> (not res!506388) (not e!418541))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750200 (= res!506388 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20424 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20424 a!3186))))))

(declare-fun b!750201 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41778 (_ BitVec 32)) SeekEntryResult!7600)

(assert (=> b!750201 (= e!418536 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20003 a!3186) j!159) a!3186 mask!3328) (Found!7600 j!159)))))

(declare-fun b!750202 () Bool)

(declare-fun res!506390 () Bool)

(assert (=> b!750202 (=> res!506390 e!418542)))

(assert (=> b!750202 (= res!506390 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20003 a!3186) j!159) a!3186 mask!3328) lt!333451)))))

(declare-fun b!750203 () Bool)

(declare-fun e!418540 () Bool)

(assert (=> b!750203 (= e!418540 true)))

(declare-fun e!418546 () Bool)

(assert (=> b!750203 e!418546))

(declare-fun res!506387 () Bool)

(assert (=> b!750203 (=> (not res!506387) (not e!418546))))

(declare-fun lt!333444 () (_ BitVec 64))

(assert (=> b!750203 (= res!506387 (= lt!333444 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333442 () Unit!25760)

(assert (=> b!750203 (= lt!333442 e!418544)))

(declare-fun c!82283 () Bool)

(assert (=> b!750203 (= c!82283 (= lt!333444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750204 () Bool)

(declare-fun res!506393 () Bool)

(assert (=> b!750204 (=> (not res!506393) (not e!418539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750204 (= res!506393 (validKeyInArray!0 k0!2102))))

(declare-fun b!750205 () Bool)

(declare-fun res!506398 () Bool)

(assert (=> b!750205 (=> (not res!506398) (not e!418541))))

(assert (=> b!750205 (= res!506398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750206 () Bool)

(declare-fun res!506392 () Bool)

(assert (=> b!750206 (=> (not res!506392) (not e!418539))))

(assert (=> b!750206 (= res!506392 (validKeyInArray!0 (select (arr!20003 a!3186) j!159)))))

(declare-fun b!750207 () Bool)

(assert (=> b!750207 (= e!418541 e!418545)))

(declare-fun res!506402 () Bool)

(assert (=> b!750207 (=> (not res!506402) (not e!418545))))

(assert (=> b!750207 (= res!506402 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20003 a!3186) j!159) mask!3328) (select (arr!20003 a!3186) j!159) a!3186 mask!3328) lt!333452))))

(assert (=> b!750207 (= lt!333452 (Intermediate!7600 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750196 () Bool)

(assert (=> b!750196 (= e!418539 e!418541)))

(declare-fun res!506399 () Bool)

(assert (=> b!750196 (=> (not res!506399) (not e!418541))))

(declare-fun lt!333445 () SeekEntryResult!7600)

(assert (=> b!750196 (= res!506399 (or (= lt!333445 (MissingZero!7600 i!1173)) (= lt!333445 (MissingVacant!7600 i!1173))))))

(assert (=> b!750196 (= lt!333445 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!506386 () Bool)

(assert (=> start!65588 (=> (not res!506386) (not e!418539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65588 (= res!506386 (validMask!0 mask!3328))))

(assert (=> start!65588 e!418539))

(assert (=> start!65588 true))

(declare-fun array_inv!15886 (array!41778) Bool)

(assert (=> start!65588 (array_inv!15886 a!3186)))

(declare-fun b!750208 () Bool)

(assert (=> b!750208 (= e!418542 e!418540)))

(declare-fun res!506397 () Bool)

(assert (=> b!750208 (=> res!506397 e!418540)))

(assert (=> b!750208 (= res!506397 (= lt!333444 lt!333449))))

(assert (=> b!750208 (= lt!333444 (select (store (arr!20003 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750209 () Bool)

(declare-fun res!506394 () Bool)

(assert (=> b!750209 (=> (not res!506394) (not e!418539))))

(declare-fun arrayContainsKey!0 (array!41778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750209 (= res!506394 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750210 () Bool)

(declare-fun res!506401 () Bool)

(assert (=> b!750210 (=> (not res!506401) (not e!418545))))

(assert (=> b!750210 (= res!506401 e!418536)))

(declare-fun c!82284 () Bool)

(assert (=> b!750210 (= c!82284 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750211 () Bool)

(assert (=> b!750211 (= e!418537 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20003 a!3186) j!159) a!3186 mask!3328) lt!333451))))

(declare-fun b!750212 () Bool)

(assert (=> b!750212 (= e!418546 (= (seekEntryOrOpen!0 lt!333449 lt!333443 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333449 lt!333443 mask!3328)))))

(assert (= (and start!65588 res!506386) b!750198))

(assert (= (and b!750198 res!506391) b!750206))

(assert (= (and b!750206 res!506392) b!750204))

(assert (= (and b!750204 res!506393) b!750209))

(assert (= (and b!750209 res!506394) b!750196))

(assert (= (and b!750196 res!506399) b!750205))

(assert (= (and b!750205 res!506398) b!750194))

(assert (= (and b!750194 res!506400) b!750200))

(assert (= (and b!750200 res!506388) b!750207))

(assert (= (and b!750207 res!506402) b!750195))

(assert (= (and b!750195 res!506395) b!750210))

(assert (= (and b!750210 c!82284) b!750193))

(assert (= (and b!750210 (not c!82284)) b!750201))

(assert (= (and b!750210 res!506401) b!750191))

(assert (= (and b!750191 res!506389) b!750192))

(assert (= (and b!750192 res!506396) b!750211))

(assert (= (and b!750192 (not res!506403)) b!750202))

(assert (= (and b!750202 (not res!506390)) b!750208))

(assert (= (and b!750208 (not res!506397)) b!750203))

(assert (= (and b!750203 c!82283) b!750199))

(assert (= (and b!750203 (not c!82283)) b!750197))

(assert (= (and b!750203 res!506387) b!750212))

(declare-fun m!699077 () Bool)

(assert (=> start!65588 m!699077))

(declare-fun m!699079 () Bool)

(assert (=> start!65588 m!699079))

(declare-fun m!699081 () Bool)

(assert (=> b!750205 m!699081))

(declare-fun m!699083 () Bool)

(assert (=> b!750191 m!699083))

(declare-fun m!699085 () Bool)

(assert (=> b!750191 m!699085))

(declare-fun m!699087 () Bool)

(assert (=> b!750191 m!699087))

(declare-fun m!699089 () Bool)

(assert (=> b!750191 m!699089))

(assert (=> b!750191 m!699085))

(declare-fun m!699091 () Bool)

(assert (=> b!750191 m!699091))

(declare-fun m!699093 () Bool)

(assert (=> b!750209 m!699093))

(declare-fun m!699095 () Bool)

(assert (=> b!750207 m!699095))

(assert (=> b!750207 m!699095))

(declare-fun m!699097 () Bool)

(assert (=> b!750207 m!699097))

(assert (=> b!750207 m!699097))

(assert (=> b!750207 m!699095))

(declare-fun m!699099 () Bool)

(assert (=> b!750207 m!699099))

(assert (=> b!750208 m!699089))

(declare-fun m!699101 () Bool)

(assert (=> b!750208 m!699101))

(declare-fun m!699103 () Bool)

(assert (=> b!750196 m!699103))

(declare-fun m!699105 () Bool)

(assert (=> b!750212 m!699105))

(declare-fun m!699107 () Bool)

(assert (=> b!750212 m!699107))

(declare-fun m!699109 () Bool)

(assert (=> b!750194 m!699109))

(assert (=> b!750201 m!699095))

(assert (=> b!750201 m!699095))

(declare-fun m!699111 () Bool)

(assert (=> b!750201 m!699111))

(assert (=> b!750192 m!699095))

(assert (=> b!750192 m!699095))

(declare-fun m!699113 () Bool)

(assert (=> b!750192 m!699113))

(declare-fun m!699115 () Bool)

(assert (=> b!750192 m!699115))

(declare-fun m!699117 () Bool)

(assert (=> b!750192 m!699117))

(declare-fun m!699119 () Bool)

(assert (=> b!750204 m!699119))

(assert (=> b!750206 m!699095))

(assert (=> b!750206 m!699095))

(declare-fun m!699121 () Bool)

(assert (=> b!750206 m!699121))

(assert (=> b!750202 m!699095))

(assert (=> b!750202 m!699095))

(assert (=> b!750202 m!699111))

(assert (=> b!750193 m!699095))

(assert (=> b!750193 m!699095))

(declare-fun m!699123 () Bool)

(assert (=> b!750193 m!699123))

(declare-fun m!699125 () Bool)

(assert (=> b!750195 m!699125))

(assert (=> b!750211 m!699095))

(assert (=> b!750211 m!699095))

(declare-fun m!699127 () Bool)

(assert (=> b!750211 m!699127))

(check-sat (not b!750201) (not b!750204) (not b!750202) (not b!750205) (not start!65588) (not b!750196) (not b!750193) (not b!750212) (not b!750206) (not b!750207) (not b!750194) (not b!750191) (not b!750192) (not b!750211) (not b!750209))
(check-sat)
