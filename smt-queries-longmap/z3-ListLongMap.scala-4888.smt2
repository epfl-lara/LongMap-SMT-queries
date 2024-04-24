; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67492 () Bool)

(assert start!67492)

(declare-fun b!780136 () Bool)

(declare-fun res!527717 () Bool)

(declare-fun e!434051 () Bool)

(assert (=> b!780136 (=> (not res!527717) (not e!434051))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42601 0))(
  ( (array!42602 (arr!20389 (Array (_ BitVec 32) (_ BitVec 64))) (size!20809 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42601)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780136 (= res!527717 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20809 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20809 a!3186))))))

(declare-fun b!780137 () Bool)

(declare-fun res!527714 () Bool)

(declare-fun e!434046 () Bool)

(assert (=> b!780137 (=> (not res!527714) (not e!434046))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!780137 (= res!527714 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20389 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780138 () Bool)

(declare-fun res!527721 () Bool)

(declare-fun e!434045 () Bool)

(assert (=> b!780138 (=> (not res!527721) (not e!434045))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780138 (= res!527721 (validKeyInArray!0 k0!2102))))

(declare-fun b!780139 () Bool)

(declare-fun e!434049 () Bool)

(assert (=> b!780139 (= e!434046 e!434049)))

(declare-fun res!527716 () Bool)

(assert (=> b!780139 (=> (not res!527716) (not e!434049))))

(declare-datatypes ((SeekEntryResult!7945 0))(
  ( (MissingZero!7945 (index!34148 (_ BitVec 32))) (Found!7945 (index!34149 (_ BitVec 32))) (Intermediate!7945 (undefined!8757 Bool) (index!34150 (_ BitVec 32)) (x!65253 (_ BitVec 32))) (Undefined!7945) (MissingVacant!7945 (index!34151 (_ BitVec 32))) )
))
(declare-fun lt!347605 () SeekEntryResult!7945)

(declare-fun lt!347602 () SeekEntryResult!7945)

(assert (=> b!780139 (= res!527716 (= lt!347605 lt!347602))))

(declare-fun lt!347606 () (_ BitVec 64))

(declare-fun lt!347608 () array!42601)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42601 (_ BitVec 32)) SeekEntryResult!7945)

(assert (=> b!780139 (= lt!347602 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347606 lt!347608 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780139 (= lt!347605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347606 mask!3328) lt!347606 lt!347608 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!780139 (= lt!347606 (select (store (arr!20389 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!780139 (= lt!347608 (array!42602 (store (arr!20389 a!3186) i!1173 k0!2102) (size!20809 a!3186)))))

(declare-fun b!780140 () Bool)

(declare-fun e!434047 () Bool)

(assert (=> b!780140 (= e!434047 true)))

(declare-fun lt!347611 () SeekEntryResult!7945)

(declare-fun lt!347603 () SeekEntryResult!7945)

(assert (=> b!780140 (= lt!347611 lt!347603)))

(declare-fun res!527719 () Bool)

(assert (=> start!67492 (=> (not res!527719) (not e!434045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67492 (= res!527719 (validMask!0 mask!3328))))

(assert (=> start!67492 e!434045))

(assert (=> start!67492 true))

(declare-fun array_inv!16248 (array!42601) Bool)

(assert (=> start!67492 (array_inv!16248 a!3186)))

(declare-fun lt!347609 () SeekEntryResult!7945)

(declare-fun b!780141 () Bool)

(declare-fun e!434053 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42601 (_ BitVec 32)) SeekEntryResult!7945)

(assert (=> b!780141 (= e!434053 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20389 a!3186) j!159) a!3186 mask!3328) lt!347609))))

(declare-fun b!780142 () Bool)

(declare-fun res!527712 () Bool)

(assert (=> b!780142 (=> (not res!527712) (not e!434051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42601 (_ BitVec 32)) Bool)

(assert (=> b!780142 (= res!527712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780143 () Bool)

(declare-fun e!434052 () Bool)

(assert (=> b!780143 (= e!434052 e!434047)))

(declare-fun res!527715 () Bool)

(assert (=> b!780143 (=> res!527715 e!434047)))

(assert (=> b!780143 (= res!527715 (or (not (= lt!347603 lt!347609)) (= (select (store (arr!20389 a!3186) i!1173 k0!2102) index!1321) lt!347606) (not (= (select (store (arr!20389 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780143 (= lt!347603 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20389 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780144 () Bool)

(declare-fun res!527724 () Bool)

(assert (=> b!780144 (=> (not res!527724) (not e!434045))))

(declare-fun arrayContainsKey!0 (array!42601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780144 (= res!527724 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780145 () Bool)

(assert (=> b!780145 (= e!434049 (not e!434052))))

(declare-fun res!527726 () Bool)

(assert (=> b!780145 (=> res!527726 e!434052)))

(get-info :version)

(assert (=> b!780145 (= res!527726 (or (not ((_ is Intermediate!7945) lt!347602)) (bvslt x!1131 (x!65253 lt!347602)) (not (= x!1131 (x!65253 lt!347602))) (not (= index!1321 (index!34150 lt!347602)))))))

(assert (=> b!780145 e!434053))

(declare-fun res!527718 () Bool)

(assert (=> b!780145 (=> (not res!527718) (not e!434053))))

(assert (=> b!780145 (= res!527718 (= lt!347611 lt!347609))))

(assert (=> b!780145 (= lt!347609 (Found!7945 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42601 (_ BitVec 32)) SeekEntryResult!7945)

(assert (=> b!780145 (= lt!347611 (seekEntryOrOpen!0 (select (arr!20389 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!780145 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26863 0))(
  ( (Unit!26864) )
))
(declare-fun lt!347604 () Unit!26863)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26863)

(assert (=> b!780145 (= lt!347604 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780146 () Bool)

(declare-fun res!527723 () Bool)

(assert (=> b!780146 (=> (not res!527723) (not e!434046))))

(declare-fun e!434050 () Bool)

(assert (=> b!780146 (= res!527723 e!434050)))

(declare-fun c!86618 () Bool)

(assert (=> b!780146 (= c!86618 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!347607 () SeekEntryResult!7945)

(declare-fun b!780147 () Bool)

(assert (=> b!780147 (= e!434050 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20389 a!3186) j!159) a!3186 mask!3328) lt!347607))))

(declare-fun b!780148 () Bool)

(declare-fun res!527713 () Bool)

(assert (=> b!780148 (=> (not res!527713) (not e!434045))))

(assert (=> b!780148 (= res!527713 (and (= (size!20809 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20809 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20809 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780149 () Bool)

(declare-fun res!527727 () Bool)

(assert (=> b!780149 (=> (not res!527727) (not e!434051))))

(declare-datatypes ((List!14298 0))(
  ( (Nil!14295) (Cons!14294 (h!15414 (_ BitVec 64)) (t!20605 List!14298)) )
))
(declare-fun arrayNoDuplicates!0 (array!42601 (_ BitVec 32) List!14298) Bool)

(assert (=> b!780149 (= res!527727 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14295))))

(declare-fun b!780150 () Bool)

(declare-fun res!527722 () Bool)

(assert (=> b!780150 (=> (not res!527722) (not e!434045))))

(assert (=> b!780150 (= res!527722 (validKeyInArray!0 (select (arr!20389 a!3186) j!159)))))

(declare-fun b!780151 () Bool)

(assert (=> b!780151 (= e!434045 e!434051)))

(declare-fun res!527720 () Bool)

(assert (=> b!780151 (=> (not res!527720) (not e!434051))))

(declare-fun lt!347610 () SeekEntryResult!7945)

(assert (=> b!780151 (= res!527720 (or (= lt!347610 (MissingZero!7945 i!1173)) (= lt!347610 (MissingVacant!7945 i!1173))))))

(assert (=> b!780151 (= lt!347610 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!780152 () Bool)

(assert (=> b!780152 (= e!434050 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20389 a!3186) j!159) a!3186 mask!3328) (Found!7945 j!159)))))

(declare-fun b!780153 () Bool)

(assert (=> b!780153 (= e!434051 e!434046)))

(declare-fun res!527725 () Bool)

(assert (=> b!780153 (=> (not res!527725) (not e!434046))))

(assert (=> b!780153 (= res!527725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20389 a!3186) j!159) mask!3328) (select (arr!20389 a!3186) j!159) a!3186 mask!3328) lt!347607))))

(assert (=> b!780153 (= lt!347607 (Intermediate!7945 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67492 res!527719) b!780148))

(assert (= (and b!780148 res!527713) b!780150))

(assert (= (and b!780150 res!527722) b!780138))

(assert (= (and b!780138 res!527721) b!780144))

(assert (= (and b!780144 res!527724) b!780151))

(assert (= (and b!780151 res!527720) b!780142))

(assert (= (and b!780142 res!527712) b!780149))

(assert (= (and b!780149 res!527727) b!780136))

(assert (= (and b!780136 res!527717) b!780153))

(assert (= (and b!780153 res!527725) b!780137))

(assert (= (and b!780137 res!527714) b!780146))

(assert (= (and b!780146 c!86618) b!780147))

(assert (= (and b!780146 (not c!86618)) b!780152))

(assert (= (and b!780146 res!527723) b!780139))

(assert (= (and b!780139 res!527716) b!780145))

(assert (= (and b!780145 res!527718) b!780141))

(assert (= (and b!780145 (not res!527726)) b!780143))

(assert (= (and b!780143 (not res!527715)) b!780140))

(declare-fun m!724061 () Bool)

(assert (=> b!780139 m!724061))

(assert (=> b!780139 m!724061))

(declare-fun m!724063 () Bool)

(assert (=> b!780139 m!724063))

(declare-fun m!724065 () Bool)

(assert (=> b!780139 m!724065))

(declare-fun m!724067 () Bool)

(assert (=> b!780139 m!724067))

(declare-fun m!724069 () Bool)

(assert (=> b!780139 m!724069))

(declare-fun m!724071 () Bool)

(assert (=> b!780144 m!724071))

(declare-fun m!724073 () Bool)

(assert (=> b!780142 m!724073))

(declare-fun m!724075 () Bool)

(assert (=> b!780145 m!724075))

(assert (=> b!780145 m!724075))

(declare-fun m!724077 () Bool)

(assert (=> b!780145 m!724077))

(declare-fun m!724079 () Bool)

(assert (=> b!780145 m!724079))

(declare-fun m!724081 () Bool)

(assert (=> b!780145 m!724081))

(assert (=> b!780152 m!724075))

(assert (=> b!780152 m!724075))

(declare-fun m!724083 () Bool)

(assert (=> b!780152 m!724083))

(declare-fun m!724085 () Bool)

(assert (=> b!780137 m!724085))

(assert (=> b!780150 m!724075))

(assert (=> b!780150 m!724075))

(declare-fun m!724087 () Bool)

(assert (=> b!780150 m!724087))

(assert (=> b!780147 m!724075))

(assert (=> b!780147 m!724075))

(declare-fun m!724089 () Bool)

(assert (=> b!780147 m!724089))

(declare-fun m!724091 () Bool)

(assert (=> b!780149 m!724091))

(assert (=> b!780143 m!724067))

(declare-fun m!724093 () Bool)

(assert (=> b!780143 m!724093))

(assert (=> b!780143 m!724075))

(assert (=> b!780143 m!724075))

(assert (=> b!780143 m!724083))

(declare-fun m!724095 () Bool)

(assert (=> b!780151 m!724095))

(declare-fun m!724097 () Bool)

(assert (=> b!780138 m!724097))

(declare-fun m!724099 () Bool)

(assert (=> start!67492 m!724099))

(declare-fun m!724101 () Bool)

(assert (=> start!67492 m!724101))

(assert (=> b!780153 m!724075))

(assert (=> b!780153 m!724075))

(declare-fun m!724103 () Bool)

(assert (=> b!780153 m!724103))

(assert (=> b!780153 m!724103))

(assert (=> b!780153 m!724075))

(declare-fun m!724105 () Bool)

(assert (=> b!780153 m!724105))

(assert (=> b!780141 m!724075))

(assert (=> b!780141 m!724075))

(declare-fun m!724107 () Bool)

(assert (=> b!780141 m!724107))

(check-sat (not b!780153) (not b!780141) (not b!780144) (not b!780139) (not b!780138) (not b!780143) (not b!780147) (not start!67492) (not b!780152) (not b!780151) (not b!780145) (not b!780150) (not b!780149) (not b!780142))
(check-sat)
