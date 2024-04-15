; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66240 () Bool)

(assert start!66240)

(declare-fun b!763129 () Bool)

(declare-fun res!516257 () Bool)

(declare-fun e!425193 () Bool)

(assert (=> b!763129 (=> (not res!516257) (not e!425193))))

(declare-datatypes ((array!42162 0))(
  ( (array!42163 (arr!20189 (Array (_ BitVec 32) (_ BitVec 64))) (size!20610 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42162)

(declare-datatypes ((List!14230 0))(
  ( (Nil!14227) (Cons!14226 (h!15310 (_ BitVec 64)) (t!20536 List!14230)) )
))
(declare-fun arrayNoDuplicates!0 (array!42162 (_ BitVec 32) List!14230) Bool)

(assert (=> b!763129 (= res!516257 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14227))))

(declare-fun b!763130 () Bool)

(declare-fun e!425195 () Bool)

(assert (=> b!763130 (= e!425195 false)))

(declare-fun lt!339545 () Bool)

(declare-fun e!425192 () Bool)

(assert (=> b!763130 (= lt!339545 e!425192)))

(declare-fun c!83826 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763130 (= c!83826 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763131 () Bool)

(declare-fun res!516258 () Bool)

(declare-fun e!425194 () Bool)

(assert (=> b!763131 (=> (not res!516258) (not e!425194))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!763131 (= res!516258 (and (= (size!20610 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20610 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20610 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763132 () Bool)

(declare-fun res!516250 () Bool)

(assert (=> b!763132 (=> (not res!516250) (not e!425193))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763132 (= res!516250 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20610 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20610 a!3186))))))

(declare-fun b!763133 () Bool)

(declare-fun res!516256 () Bool)

(assert (=> b!763133 (=> (not res!516256) (not e!425193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42162 (_ BitVec 32)) Bool)

(assert (=> b!763133 (= res!516256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763134 () Bool)

(assert (=> b!763134 (= e!425194 e!425193)))

(declare-fun res!516252 () Bool)

(assert (=> b!763134 (=> (not res!516252) (not e!425193))))

(declare-datatypes ((SeekEntryResult!7786 0))(
  ( (MissingZero!7786 (index!33512 (_ BitVec 32))) (Found!7786 (index!33513 (_ BitVec 32))) (Intermediate!7786 (undefined!8598 Bool) (index!33514 (_ BitVec 32)) (x!64425 (_ BitVec 32))) (Undefined!7786) (MissingVacant!7786 (index!33515 (_ BitVec 32))) )
))
(declare-fun lt!339544 () SeekEntryResult!7786)

(assert (=> b!763134 (= res!516252 (or (= lt!339544 (MissingZero!7786 i!1173)) (= lt!339544 (MissingVacant!7786 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42162 (_ BitVec 32)) SeekEntryResult!7786)

(assert (=> b!763134 (= lt!339544 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!339543 () SeekEntryResult!7786)

(declare-fun b!763135 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42162 (_ BitVec 32)) SeekEntryResult!7786)

(assert (=> b!763135 (= e!425192 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20189 a!3186) j!159) a!3186 mask!3328) lt!339543)))))

(declare-fun b!763136 () Bool)

(declare-fun res!516253 () Bool)

(assert (=> b!763136 (=> (not res!516253) (not e!425194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763136 (= res!516253 (validKeyInArray!0 k0!2102))))

(declare-fun b!763137 () Bool)

(declare-fun res!516260 () Bool)

(assert (=> b!763137 (=> (not res!516260) (not e!425194))))

(declare-fun arrayContainsKey!0 (array!42162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763137 (= res!516260 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!516251 () Bool)

(assert (=> start!66240 (=> (not res!516251) (not e!425194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66240 (= res!516251 (validMask!0 mask!3328))))

(assert (=> start!66240 e!425194))

(assert (=> start!66240 true))

(declare-fun array_inv!16072 (array!42162) Bool)

(assert (=> start!66240 (array_inv!16072 a!3186)))

(declare-fun b!763138 () Bool)

(assert (=> b!763138 (= e!425193 e!425195)))

(declare-fun res!516255 () Bool)

(assert (=> b!763138 (=> (not res!516255) (not e!425195))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763138 (= res!516255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20189 a!3186) j!159) mask!3328) (select (arr!20189 a!3186) j!159) a!3186 mask!3328) lt!339543))))

(assert (=> b!763138 (= lt!339543 (Intermediate!7786 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763139 () Bool)

(declare-fun res!516254 () Bool)

(assert (=> b!763139 (=> (not res!516254) (not e!425194))))

(assert (=> b!763139 (= res!516254 (validKeyInArray!0 (select (arr!20189 a!3186) j!159)))))

(declare-fun b!763140 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42162 (_ BitVec 32)) SeekEntryResult!7786)

(assert (=> b!763140 (= e!425192 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20189 a!3186) j!159) a!3186 mask!3328) (Found!7786 j!159))))))

(declare-fun b!763141 () Bool)

(declare-fun res!516259 () Bool)

(assert (=> b!763141 (=> (not res!516259) (not e!425195))))

(assert (=> b!763141 (= res!516259 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20189 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66240 res!516251) b!763131))

(assert (= (and b!763131 res!516258) b!763139))

(assert (= (and b!763139 res!516254) b!763136))

(assert (= (and b!763136 res!516253) b!763137))

(assert (= (and b!763137 res!516260) b!763134))

(assert (= (and b!763134 res!516252) b!763133))

(assert (= (and b!763133 res!516256) b!763129))

(assert (= (and b!763129 res!516257) b!763132))

(assert (= (and b!763132 res!516250) b!763138))

(assert (= (and b!763138 res!516255) b!763141))

(assert (= (and b!763141 res!516259) b!763130))

(assert (= (and b!763130 c!83826) b!763135))

(assert (= (and b!763130 (not c!83826)) b!763140))

(declare-fun m!709129 () Bool)

(assert (=> start!66240 m!709129))

(declare-fun m!709131 () Bool)

(assert (=> start!66240 m!709131))

(declare-fun m!709133 () Bool)

(assert (=> b!763137 m!709133))

(declare-fun m!709135 () Bool)

(assert (=> b!763133 m!709135))

(declare-fun m!709137 () Bool)

(assert (=> b!763138 m!709137))

(assert (=> b!763138 m!709137))

(declare-fun m!709139 () Bool)

(assert (=> b!763138 m!709139))

(assert (=> b!763138 m!709139))

(assert (=> b!763138 m!709137))

(declare-fun m!709141 () Bool)

(assert (=> b!763138 m!709141))

(assert (=> b!763140 m!709137))

(assert (=> b!763140 m!709137))

(declare-fun m!709143 () Bool)

(assert (=> b!763140 m!709143))

(declare-fun m!709145 () Bool)

(assert (=> b!763136 m!709145))

(declare-fun m!709147 () Bool)

(assert (=> b!763141 m!709147))

(assert (=> b!763135 m!709137))

(assert (=> b!763135 m!709137))

(declare-fun m!709149 () Bool)

(assert (=> b!763135 m!709149))

(declare-fun m!709151 () Bool)

(assert (=> b!763134 m!709151))

(declare-fun m!709153 () Bool)

(assert (=> b!763129 m!709153))

(assert (=> b!763139 m!709137))

(assert (=> b!763139 m!709137))

(declare-fun m!709155 () Bool)

(assert (=> b!763139 m!709155))

(check-sat (not b!763136) (not b!763137) (not b!763138) (not b!763139) (not start!66240) (not b!763140) (not b!763133) (not b!763134) (not b!763129) (not b!763135))
(check-sat)
