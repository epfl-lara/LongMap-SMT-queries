; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66746 () Bool)

(assert start!66746)

(declare-fun b!769186 () Bool)

(declare-fun res!520249 () Bool)

(declare-fun e!428299 () Bool)

(assert (=> b!769186 (=> (not res!520249) (not e!428299))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769186 (= res!520249 (validKeyInArray!0 k0!2102))))

(declare-fun b!769187 () Bool)

(declare-fun e!428303 () Bool)

(assert (=> b!769187 (= e!428299 e!428303)))

(declare-fun res!520248 () Bool)

(assert (=> b!769187 (=> (not res!520248) (not e!428303))))

(declare-datatypes ((SeekEntryResult!7861 0))(
  ( (MissingZero!7861 (index!33812 (_ BitVec 32))) (Found!7861 (index!33813 (_ BitVec 32))) (Intermediate!7861 (undefined!8673 Bool) (index!33814 (_ BitVec 32)) (x!64755 (_ BitVec 32))) (Undefined!7861) (MissingVacant!7861 (index!33815 (_ BitVec 32))) )
))
(declare-fun lt!342111 () SeekEntryResult!7861)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769187 (= res!520248 (or (= lt!342111 (MissingZero!7861 i!1173)) (= lt!342111 (MissingVacant!7861 i!1173))))))

(declare-datatypes ((array!42327 0))(
  ( (array!42328 (arr!20264 (Array (_ BitVec 32) (_ BitVec 64))) (size!20685 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42327)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42327 (_ BitVec 32)) SeekEntryResult!7861)

(assert (=> b!769187 (= lt!342111 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769188 () Bool)

(declare-datatypes ((Unit!26438 0))(
  ( (Unit!26439) )
))
(declare-fun e!428302 () Unit!26438)

(declare-fun Unit!26440 () Unit!26438)

(assert (=> b!769188 (= e!428302 Unit!26440)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!342103 () SeekEntryResult!7861)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42327 (_ BitVec 32)) SeekEntryResult!7861)

(assert (=> b!769188 (= lt!342103 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20264 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342113 () (_ BitVec 32))

(assert (=> b!769188 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342113 resIntermediateIndex!5 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) (Found!7861 j!159))))

(declare-fun b!769189 () Bool)

(declare-fun e!428297 () Bool)

(declare-fun e!428305 () Bool)

(assert (=> b!769189 (= e!428297 e!428305)))

(declare-fun res!520240 () Bool)

(assert (=> b!769189 (=> (not res!520240) (not e!428305))))

(declare-fun lt!342108 () SeekEntryResult!7861)

(assert (=> b!769189 (= res!520240 (= (seekEntryOrOpen!0 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342108))))

(assert (=> b!769189 (= lt!342108 (Found!7861 j!159))))

(declare-fun b!769190 () Bool)

(declare-fun res!520250 () Bool)

(assert (=> b!769190 (=> (not res!520250) (not e!428303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42327 (_ BitVec 32)) Bool)

(assert (=> b!769190 (= res!520250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769191 () Bool)

(declare-fun res!520251 () Bool)

(declare-fun e!428304 () Bool)

(assert (=> b!769191 (=> (not res!520251) (not e!428304))))

(assert (=> b!769191 (= res!520251 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20264 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769192 () Bool)

(declare-fun res!520247 () Bool)

(assert (=> b!769192 (=> (not res!520247) (not e!428299))))

(assert (=> b!769192 (= res!520247 (validKeyInArray!0 (select (arr!20264 a!3186) j!159)))))

(declare-fun e!428298 () Bool)

(declare-fun b!769193 () Bool)

(declare-fun lt!342104 () SeekEntryResult!7861)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42327 (_ BitVec 32)) SeekEntryResult!7861)

(assert (=> b!769193 (= e!428298 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342104))))

(declare-fun b!769194 () Bool)

(declare-fun e!428300 () Bool)

(assert (=> b!769194 (= e!428300 true)))

(declare-fun lt!342107 () Unit!26438)

(assert (=> b!769194 (= lt!342107 e!428302)))

(declare-fun c!84870 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769194 (= c!84870 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769194 (= lt!342113 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769196 () Bool)

(declare-fun res!520244 () Bool)

(assert (=> b!769196 (=> (not res!520244) (not e!428303))))

(declare-datatypes ((List!14305 0))(
  ( (Nil!14302) (Cons!14301 (h!15400 (_ BitVec 64)) (t!20611 List!14305)) )
))
(declare-fun arrayNoDuplicates!0 (array!42327 (_ BitVec 32) List!14305) Bool)

(assert (=> b!769196 (= res!520244 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14302))))

(declare-fun b!769197 () Bool)

(declare-fun res!520246 () Bool)

(assert (=> b!769197 (=> (not res!520246) (not e!428299))))

(assert (=> b!769197 (= res!520246 (and (= (size!20685 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20685 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20685 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769198 () Bool)

(declare-fun e!428296 () Bool)

(assert (=> b!769198 (= e!428304 e!428296)))

(declare-fun res!520253 () Bool)

(assert (=> b!769198 (=> (not res!520253) (not e!428296))))

(declare-fun lt!342112 () SeekEntryResult!7861)

(declare-fun lt!342106 () SeekEntryResult!7861)

(assert (=> b!769198 (= res!520253 (= lt!342112 lt!342106))))

(declare-fun lt!342109 () array!42327)

(declare-fun lt!342110 () (_ BitVec 64))

(assert (=> b!769198 (= lt!342106 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342110 lt!342109 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769198 (= lt!342112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342110 mask!3328) lt!342110 lt!342109 mask!3328))))

(assert (=> b!769198 (= lt!342110 (select (store (arr!20264 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769198 (= lt!342109 (array!42328 (store (arr!20264 a!3186) i!1173 k0!2102) (size!20685 a!3186)))))

(declare-fun b!769199 () Bool)

(declare-fun Unit!26441 () Unit!26438)

(assert (=> b!769199 (= e!428302 Unit!26441)))

(assert (=> b!769199 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342113 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342104)))

(declare-fun b!769200 () Bool)

(declare-fun res!520245 () Bool)

(assert (=> b!769200 (=> (not res!520245) (not e!428303))))

(assert (=> b!769200 (= res!520245 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20685 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20685 a!3186))))))

(declare-fun b!769201 () Bool)

(assert (=> b!769201 (= e!428305 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342108))))

(declare-fun b!769202 () Bool)

(assert (=> b!769202 (= e!428303 e!428304)))

(declare-fun res!520239 () Bool)

(assert (=> b!769202 (=> (not res!520239) (not e!428304))))

(assert (=> b!769202 (= res!520239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20264 a!3186) j!159) mask!3328) (select (arr!20264 a!3186) j!159) a!3186 mask!3328) lt!342104))))

(assert (=> b!769202 (= lt!342104 (Intermediate!7861 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769203 () Bool)

(assert (=> b!769203 (= e!428296 (not e!428300))))

(declare-fun res!520252 () Bool)

(assert (=> b!769203 (=> res!520252 e!428300)))

(get-info :version)

(assert (=> b!769203 (= res!520252 (or (not ((_ is Intermediate!7861) lt!342106)) (bvsge x!1131 (x!64755 lt!342106))))))

(assert (=> b!769203 e!428297))

(declare-fun res!520254 () Bool)

(assert (=> b!769203 (=> (not res!520254) (not e!428297))))

(assert (=> b!769203 (= res!520254 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342105 () Unit!26438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26438)

(assert (=> b!769203 (= lt!342105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769204 () Bool)

(assert (=> b!769204 (= e!428298 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20264 a!3186) j!159) a!3186 mask!3328) (Found!7861 j!159)))))

(declare-fun b!769205 () Bool)

(declare-fun res!520241 () Bool)

(assert (=> b!769205 (=> (not res!520241) (not e!428304))))

(assert (=> b!769205 (= res!520241 e!428298)))

(declare-fun c!84869 () Bool)

(assert (=> b!769205 (= c!84869 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!520242 () Bool)

(assert (=> start!66746 (=> (not res!520242) (not e!428299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66746 (= res!520242 (validMask!0 mask!3328))))

(assert (=> start!66746 e!428299))

(assert (=> start!66746 true))

(declare-fun array_inv!16147 (array!42327) Bool)

(assert (=> start!66746 (array_inv!16147 a!3186)))

(declare-fun b!769195 () Bool)

(declare-fun res!520243 () Bool)

(assert (=> b!769195 (=> (not res!520243) (not e!428299))))

(declare-fun arrayContainsKey!0 (array!42327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769195 (= res!520243 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66746 res!520242) b!769197))

(assert (= (and b!769197 res!520246) b!769192))

(assert (= (and b!769192 res!520247) b!769186))

(assert (= (and b!769186 res!520249) b!769195))

(assert (= (and b!769195 res!520243) b!769187))

(assert (= (and b!769187 res!520248) b!769190))

(assert (= (and b!769190 res!520250) b!769196))

(assert (= (and b!769196 res!520244) b!769200))

(assert (= (and b!769200 res!520245) b!769202))

(assert (= (and b!769202 res!520239) b!769191))

(assert (= (and b!769191 res!520251) b!769205))

(assert (= (and b!769205 c!84869) b!769193))

(assert (= (and b!769205 (not c!84869)) b!769204))

(assert (= (and b!769205 res!520241) b!769198))

(assert (= (and b!769198 res!520253) b!769203))

(assert (= (and b!769203 res!520254) b!769189))

(assert (= (and b!769189 res!520240) b!769201))

(assert (= (and b!769203 (not res!520252)) b!769194))

(assert (= (and b!769194 c!84870) b!769199))

(assert (= (and b!769194 (not c!84870)) b!769188))

(declare-fun m!714093 () Bool)

(assert (=> b!769189 m!714093))

(assert (=> b!769189 m!714093))

(declare-fun m!714095 () Bool)

(assert (=> b!769189 m!714095))

(declare-fun m!714097 () Bool)

(assert (=> b!769198 m!714097))

(declare-fun m!714099 () Bool)

(assert (=> b!769198 m!714099))

(declare-fun m!714101 () Bool)

(assert (=> b!769198 m!714101))

(declare-fun m!714103 () Bool)

(assert (=> b!769198 m!714103))

(declare-fun m!714105 () Bool)

(assert (=> b!769198 m!714105))

(assert (=> b!769198 m!714101))

(assert (=> b!769204 m!714093))

(assert (=> b!769204 m!714093))

(declare-fun m!714107 () Bool)

(assert (=> b!769204 m!714107))

(declare-fun m!714109 () Bool)

(assert (=> b!769195 m!714109))

(declare-fun m!714111 () Bool)

(assert (=> b!769186 m!714111))

(assert (=> b!769192 m!714093))

(assert (=> b!769192 m!714093))

(declare-fun m!714113 () Bool)

(assert (=> b!769192 m!714113))

(assert (=> b!769202 m!714093))

(assert (=> b!769202 m!714093))

(declare-fun m!714115 () Bool)

(assert (=> b!769202 m!714115))

(assert (=> b!769202 m!714115))

(assert (=> b!769202 m!714093))

(declare-fun m!714117 () Bool)

(assert (=> b!769202 m!714117))

(declare-fun m!714119 () Bool)

(assert (=> b!769191 m!714119))

(declare-fun m!714121 () Bool)

(assert (=> start!66746 m!714121))

(declare-fun m!714123 () Bool)

(assert (=> start!66746 m!714123))

(assert (=> b!769199 m!714093))

(assert (=> b!769199 m!714093))

(declare-fun m!714125 () Bool)

(assert (=> b!769199 m!714125))

(declare-fun m!714127 () Bool)

(assert (=> b!769187 m!714127))

(assert (=> b!769201 m!714093))

(assert (=> b!769201 m!714093))

(declare-fun m!714129 () Bool)

(assert (=> b!769201 m!714129))

(declare-fun m!714131 () Bool)

(assert (=> b!769203 m!714131))

(declare-fun m!714133 () Bool)

(assert (=> b!769203 m!714133))

(declare-fun m!714135 () Bool)

(assert (=> b!769196 m!714135))

(assert (=> b!769188 m!714093))

(assert (=> b!769188 m!714093))

(assert (=> b!769188 m!714107))

(assert (=> b!769188 m!714093))

(declare-fun m!714137 () Bool)

(assert (=> b!769188 m!714137))

(declare-fun m!714139 () Bool)

(assert (=> b!769194 m!714139))

(declare-fun m!714141 () Bool)

(assert (=> b!769190 m!714141))

(assert (=> b!769193 m!714093))

(assert (=> b!769193 m!714093))

(declare-fun m!714143 () Bool)

(assert (=> b!769193 m!714143))

(check-sat (not b!769189) (not b!769192) (not b!769190) (not b!769195) (not b!769198) (not b!769196) (not b!769202) (not b!769203) (not start!66746) (not b!769201) (not b!769194) (not b!769187) (not b!769204) (not b!769193) (not b!769199) (not b!769188) (not b!769186))
(check-sat)
