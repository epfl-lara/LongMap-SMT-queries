; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66246 () Bool)

(assert start!66246)

(declare-fun b!763096 () Bool)

(declare-fun res!516120 () Bool)

(declare-fun e!425243 () Bool)

(assert (=> b!763096 (=> (not res!516120) (not e!425243))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763096 (= res!516120 (validKeyInArray!0 k!2102))))

(declare-fun b!763097 () Bool)

(declare-fun e!425241 () Bool)

(assert (=> b!763097 (= e!425241 false)))

(declare-datatypes ((array!42151 0))(
  ( (array!42152 (arr!20183 (Array (_ BitVec 32) (_ BitVec 64))) (size!20604 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42151)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!339720 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763097 (= lt!339720 (toIndex!0 (select (store (arr!20183 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!763098 () Bool)

(declare-fun res!516126 () Bool)

(assert (=> b!763098 (=> (not res!516126) (not e!425243))))

(declare-fun arrayContainsKey!0 (array!42151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763098 (= res!516126 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763099 () Bool)

(declare-fun e!425244 () Bool)

(assert (=> b!763099 (= e!425243 e!425244)))

(declare-fun res!516130 () Bool)

(assert (=> b!763099 (=> (not res!516130) (not e!425244))))

(declare-datatypes ((SeekEntryResult!7783 0))(
  ( (MissingZero!7783 (index!33500 (_ BitVec 32))) (Found!7783 (index!33501 (_ BitVec 32))) (Intermediate!7783 (undefined!8595 Bool) (index!33502 (_ BitVec 32)) (x!64403 (_ BitVec 32))) (Undefined!7783) (MissingVacant!7783 (index!33503 (_ BitVec 32))) )
))
(declare-fun lt!339721 () SeekEntryResult!7783)

(assert (=> b!763099 (= res!516130 (or (= lt!339721 (MissingZero!7783 i!1173)) (= lt!339721 (MissingVacant!7783 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42151 (_ BitVec 32)) SeekEntryResult!7783)

(assert (=> b!763099 (= lt!339721 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763100 () Bool)

(declare-fun res!516119 () Bool)

(assert (=> b!763100 (=> (not res!516119) (not e!425243))))

(assert (=> b!763100 (= res!516119 (and (= (size!20604 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20604 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20604 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763101 () Bool)

(declare-fun res!516121 () Bool)

(assert (=> b!763101 (=> (not res!516121) (not e!425244))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763101 (= res!516121 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20604 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20604 a!3186))))))

(declare-fun e!425240 () Bool)

(declare-fun b!763102 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42151 (_ BitVec 32)) SeekEntryResult!7783)

(assert (=> b!763102 (= e!425240 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20183 a!3186) j!159) a!3186 mask!3328) (Found!7783 j!159)))))

(declare-fun b!763103 () Bool)

(declare-fun res!516127 () Bool)

(assert (=> b!763103 (=> (not res!516127) (not e!425241))))

(assert (=> b!763103 (= res!516127 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20183 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763104 () Bool)

(declare-fun res!516129 () Bool)

(assert (=> b!763104 (=> (not res!516129) (not e!425244))))

(declare-datatypes ((List!14185 0))(
  ( (Nil!14182) (Cons!14181 (h!15265 (_ BitVec 64)) (t!20500 List!14185)) )
))
(declare-fun arrayNoDuplicates!0 (array!42151 (_ BitVec 32) List!14185) Bool)

(assert (=> b!763104 (= res!516129 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14182))))

(declare-fun lt!339722 () SeekEntryResult!7783)

(declare-fun b!763106 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42151 (_ BitVec 32)) SeekEntryResult!7783)

(assert (=> b!763106 (= e!425240 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20183 a!3186) j!159) a!3186 mask!3328) lt!339722))))

(declare-fun b!763107 () Bool)

(assert (=> b!763107 (= e!425244 e!425241)))

(declare-fun res!516123 () Bool)

(assert (=> b!763107 (=> (not res!516123) (not e!425241))))

(assert (=> b!763107 (= res!516123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20183 a!3186) j!159) mask!3328) (select (arr!20183 a!3186) j!159) a!3186 mask!3328) lt!339722))))

(assert (=> b!763107 (= lt!339722 (Intermediate!7783 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763108 () Bool)

(declare-fun res!516125 () Bool)

(assert (=> b!763108 (=> (not res!516125) (not e!425241))))

(assert (=> b!763108 (= res!516125 e!425240)))

(declare-fun c!83875 () Bool)

(assert (=> b!763108 (= c!83875 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763109 () Bool)

(declare-fun res!516122 () Bool)

(assert (=> b!763109 (=> (not res!516122) (not e!425243))))

(assert (=> b!763109 (= res!516122 (validKeyInArray!0 (select (arr!20183 a!3186) j!159)))))

(declare-fun res!516128 () Bool)

(assert (=> start!66246 (=> (not res!516128) (not e!425243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66246 (= res!516128 (validMask!0 mask!3328))))

(assert (=> start!66246 e!425243))

(assert (=> start!66246 true))

(declare-fun array_inv!15979 (array!42151) Bool)

(assert (=> start!66246 (array_inv!15979 a!3186)))

(declare-fun b!763105 () Bool)

(declare-fun res!516124 () Bool)

(assert (=> b!763105 (=> (not res!516124) (not e!425244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42151 (_ BitVec 32)) Bool)

(assert (=> b!763105 (= res!516124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66246 res!516128) b!763100))

(assert (= (and b!763100 res!516119) b!763109))

(assert (= (and b!763109 res!516122) b!763096))

(assert (= (and b!763096 res!516120) b!763098))

(assert (= (and b!763098 res!516126) b!763099))

(assert (= (and b!763099 res!516130) b!763105))

(assert (= (and b!763105 res!516124) b!763104))

(assert (= (and b!763104 res!516129) b!763101))

(assert (= (and b!763101 res!516121) b!763107))

(assert (= (and b!763107 res!516123) b!763103))

(assert (= (and b!763103 res!516127) b!763108))

(assert (= (and b!763108 c!83875) b!763106))

(assert (= (and b!763108 (not c!83875)) b!763102))

(assert (= (and b!763108 res!516125) b!763097))

(declare-fun m!709667 () Bool)

(assert (=> b!763097 m!709667))

(declare-fun m!709669 () Bool)

(assert (=> b!763097 m!709669))

(assert (=> b!763097 m!709669))

(declare-fun m!709671 () Bool)

(assert (=> b!763097 m!709671))

(declare-fun m!709673 () Bool)

(assert (=> b!763104 m!709673))

(declare-fun m!709675 () Bool)

(assert (=> b!763096 m!709675))

(declare-fun m!709677 () Bool)

(assert (=> b!763102 m!709677))

(assert (=> b!763102 m!709677))

(declare-fun m!709679 () Bool)

(assert (=> b!763102 m!709679))

(assert (=> b!763106 m!709677))

(assert (=> b!763106 m!709677))

(declare-fun m!709681 () Bool)

(assert (=> b!763106 m!709681))

(assert (=> b!763109 m!709677))

(assert (=> b!763109 m!709677))

(declare-fun m!709683 () Bool)

(assert (=> b!763109 m!709683))

(declare-fun m!709685 () Bool)

(assert (=> b!763103 m!709685))

(declare-fun m!709687 () Bool)

(assert (=> b!763105 m!709687))

(declare-fun m!709689 () Bool)

(assert (=> b!763098 m!709689))

(declare-fun m!709691 () Bool)

(assert (=> start!66246 m!709691))

(declare-fun m!709693 () Bool)

(assert (=> start!66246 m!709693))

(assert (=> b!763107 m!709677))

(assert (=> b!763107 m!709677))

(declare-fun m!709695 () Bool)

(assert (=> b!763107 m!709695))

(assert (=> b!763107 m!709695))

(assert (=> b!763107 m!709677))

(declare-fun m!709697 () Bool)

(assert (=> b!763107 m!709697))

(declare-fun m!709699 () Bool)

(assert (=> b!763099 m!709699))

(push 1)

(assert (not b!763096))

(assert (not b!763106))

(assert (not b!763104))

