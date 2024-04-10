; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66248 () Bool)

(assert start!66248)

(declare-fun b!763138 () Bool)

(declare-fun e!425256 () Bool)

(declare-fun e!425259 () Bool)

(assert (=> b!763138 (= e!425256 e!425259)))

(declare-fun res!516163 () Bool)

(assert (=> b!763138 (=> (not res!516163) (not e!425259))))

(declare-datatypes ((SeekEntryResult!7784 0))(
  ( (MissingZero!7784 (index!33504 (_ BitVec 32))) (Found!7784 (index!33505 (_ BitVec 32))) (Intermediate!7784 (undefined!8596 Bool) (index!33506 (_ BitVec 32)) (x!64412 (_ BitVec 32))) (Undefined!7784) (MissingVacant!7784 (index!33507 (_ BitVec 32))) )
))
(declare-fun lt!339729 () SeekEntryResult!7784)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763138 (= res!516163 (or (= lt!339729 (MissingZero!7784 i!1173)) (= lt!339729 (MissingVacant!7784 i!1173))))))

(declare-datatypes ((array!42153 0))(
  ( (array!42154 (arr!20184 (Array (_ BitVec 32) (_ BitVec 64))) (size!20605 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42153)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42153 (_ BitVec 32)) SeekEntryResult!7784)

(assert (=> b!763138 (= lt!339729 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763139 () Bool)

(declare-fun e!425255 () Bool)

(assert (=> b!763139 (= e!425255 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!339730 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763139 (= lt!339730 (toIndex!0 (select (store (arr!20184 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun res!516160 () Bool)

(assert (=> start!66248 (=> (not res!516160) (not e!425256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66248 (= res!516160 (validMask!0 mask!3328))))

(assert (=> start!66248 e!425256))

(assert (=> start!66248 true))

(declare-fun array_inv!15980 (array!42153) Bool)

(assert (=> start!66248 (array_inv!15980 a!3186)))

(declare-fun b!763140 () Bool)

(declare-fun res!516159 () Bool)

(assert (=> b!763140 (=> (not res!516159) (not e!425259))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763140 (= res!516159 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20605 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20605 a!3186))))))

(declare-fun b!763141 () Bool)

(declare-fun res!516158 () Bool)

(assert (=> b!763141 (=> (not res!516158) (not e!425256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763141 (= res!516158 (validKeyInArray!0 k!2102))))

(declare-fun b!763142 () Bool)

(declare-fun res!516156 () Bool)

(assert (=> b!763142 (=> (not res!516156) (not e!425255))))

(assert (=> b!763142 (= res!516156 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20184 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763143 () Bool)

(declare-fun res!516162 () Bool)

(assert (=> b!763143 (=> (not res!516162) (not e!425256))))

(assert (=> b!763143 (= res!516162 (validKeyInArray!0 (select (arr!20184 a!3186) j!159)))))

(declare-fun lt!339731 () SeekEntryResult!7784)

(declare-fun b!763144 () Bool)

(declare-fun e!425258 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42153 (_ BitVec 32)) SeekEntryResult!7784)

(assert (=> b!763144 (= e!425258 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20184 a!3186) j!159) a!3186 mask!3328) lt!339731))))

(declare-fun b!763145 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42153 (_ BitVec 32)) SeekEntryResult!7784)

(assert (=> b!763145 (= e!425258 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20184 a!3186) j!159) a!3186 mask!3328) (Found!7784 j!159)))))

(declare-fun b!763146 () Bool)

(assert (=> b!763146 (= e!425259 e!425255)))

(declare-fun res!516155 () Bool)

(assert (=> b!763146 (=> (not res!516155) (not e!425255))))

(assert (=> b!763146 (= res!516155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20184 a!3186) j!159) mask!3328) (select (arr!20184 a!3186) j!159) a!3186 mask!3328) lt!339731))))

(assert (=> b!763146 (= lt!339731 (Intermediate!7784 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763147 () Bool)

(declare-fun res!516166 () Bool)

(assert (=> b!763147 (=> (not res!516166) (not e!425255))))

(assert (=> b!763147 (= res!516166 e!425258)))

(declare-fun c!83878 () Bool)

(assert (=> b!763147 (= c!83878 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763148 () Bool)

(declare-fun res!516165 () Bool)

(assert (=> b!763148 (=> (not res!516165) (not e!425256))))

(assert (=> b!763148 (= res!516165 (and (= (size!20605 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20605 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20605 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763149 () Bool)

(declare-fun res!516164 () Bool)

(assert (=> b!763149 (=> (not res!516164) (not e!425259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42153 (_ BitVec 32)) Bool)

(assert (=> b!763149 (= res!516164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763150 () Bool)

(declare-fun res!516157 () Bool)

(assert (=> b!763150 (=> (not res!516157) (not e!425259))))

(declare-datatypes ((List!14186 0))(
  ( (Nil!14183) (Cons!14182 (h!15266 (_ BitVec 64)) (t!20501 List!14186)) )
))
(declare-fun arrayNoDuplicates!0 (array!42153 (_ BitVec 32) List!14186) Bool)

(assert (=> b!763150 (= res!516157 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14183))))

(declare-fun b!763151 () Bool)

(declare-fun res!516161 () Bool)

(assert (=> b!763151 (=> (not res!516161) (not e!425256))))

(declare-fun arrayContainsKey!0 (array!42153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763151 (= res!516161 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66248 res!516160) b!763148))

(assert (= (and b!763148 res!516165) b!763143))

(assert (= (and b!763143 res!516162) b!763141))

(assert (= (and b!763141 res!516158) b!763151))

(assert (= (and b!763151 res!516161) b!763138))

(assert (= (and b!763138 res!516163) b!763149))

(assert (= (and b!763149 res!516164) b!763150))

(assert (= (and b!763150 res!516157) b!763140))

(assert (= (and b!763140 res!516159) b!763146))

(assert (= (and b!763146 res!516155) b!763142))

(assert (= (and b!763142 res!516156) b!763147))

(assert (= (and b!763147 c!83878) b!763144))

(assert (= (and b!763147 (not c!83878)) b!763145))

(assert (= (and b!763147 res!516166) b!763139))

(declare-fun m!709701 () Bool)

(assert (=> b!763144 m!709701))

(assert (=> b!763144 m!709701))

(declare-fun m!709703 () Bool)

(assert (=> b!763144 m!709703))

(assert (=> b!763145 m!709701))

(assert (=> b!763145 m!709701))

(declare-fun m!709705 () Bool)

(assert (=> b!763145 m!709705))

(declare-fun m!709707 () Bool)

(assert (=> start!66248 m!709707))

(declare-fun m!709709 () Bool)

(assert (=> start!66248 m!709709))

(declare-fun m!709711 () Bool)

(assert (=> b!763149 m!709711))

(declare-fun m!709713 () Bool)

(assert (=> b!763141 m!709713))

(declare-fun m!709715 () Bool)

(assert (=> b!763139 m!709715))

(declare-fun m!709717 () Bool)

(assert (=> b!763139 m!709717))

(assert (=> b!763139 m!709717))

(declare-fun m!709719 () Bool)

(assert (=> b!763139 m!709719))

(declare-fun m!709721 () Bool)

(assert (=> b!763142 m!709721))

(assert (=> b!763146 m!709701))

(assert (=> b!763146 m!709701))

(declare-fun m!709723 () Bool)

(assert (=> b!763146 m!709723))

(assert (=> b!763146 m!709723))

(assert (=> b!763146 m!709701))

(declare-fun m!709725 () Bool)

(assert (=> b!763146 m!709725))

(assert (=> b!763143 m!709701))

(assert (=> b!763143 m!709701))

(declare-fun m!709727 () Bool)

(assert (=> b!763143 m!709727))

(declare-fun m!709729 () Bool)

(assert (=> b!763150 m!709729))

(declare-fun m!709731 () Bool)

(assert (=> b!763151 m!709731))

(declare-fun m!709733 () Bool)

(assert (=> b!763138 m!709733))

(push 1)

