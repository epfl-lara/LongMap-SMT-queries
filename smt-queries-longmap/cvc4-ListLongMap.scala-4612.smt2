; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64310 () Bool)

(assert start!64310)

(declare-fun b!722519 () Bool)

(declare-fun res!484224 () Bool)

(declare-fun e!404958 () Bool)

(assert (=> b!722519 (=> (not res!484224) (not e!404958))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722519 (= res!484224 (validKeyInArray!0 k!2102))))

(declare-fun b!722520 () Bool)

(declare-fun res!484218 () Bool)

(assert (=> b!722520 (=> (not res!484218) (not e!404958))))

(declare-datatypes ((array!40891 0))(
  ( (array!40892 (arr!19568 (Array (_ BitVec 32) (_ BitVec 64))) (size!19989 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40891)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!722520 (= res!484218 (validKeyInArray!0 (select (arr!19568 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!404956 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!722521 () Bool)

(declare-datatypes ((SeekEntryResult!7168 0))(
  ( (MissingZero!7168 (index!31040 (_ BitVec 32))) (Found!7168 (index!31041 (_ BitVec 32))) (Intermediate!7168 (undefined!7980 Bool) (index!31042 (_ BitVec 32)) (x!62041 (_ BitVec 32))) (Undefined!7168) (MissingVacant!7168 (index!31043 (_ BitVec 32))) )
))
(declare-fun lt!320315 () SeekEntryResult!7168)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40891 (_ BitVec 32)) SeekEntryResult!7168)

(assert (=> b!722521 (= e!404956 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19568 a!3186) j!159) a!3186 mask!3328) lt!320315))))

(declare-fun b!722522 () Bool)

(declare-fun res!484221 () Bool)

(declare-fun e!404960 () Bool)

(assert (=> b!722522 (=> (not res!484221) (not e!404960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40891 (_ BitVec 32)) Bool)

(assert (=> b!722522 (= res!484221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!484220 () Bool)

(assert (=> start!64310 (=> (not res!484220) (not e!404958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64310 (= res!484220 (validMask!0 mask!3328))))

(assert (=> start!64310 e!404958))

(assert (=> start!64310 true))

(declare-fun array_inv!15364 (array!40891) Bool)

(assert (=> start!64310 (array_inv!15364 a!3186)))

(declare-fun b!722523 () Bool)

(declare-fun res!484222 () Bool)

(declare-fun e!404957 () Bool)

(assert (=> b!722523 (=> (not res!484222) (not e!404957))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722523 (= res!484222 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19568 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722524 () Bool)

(assert (=> b!722524 (= e!404958 e!404960)))

(declare-fun res!484225 () Bool)

(assert (=> b!722524 (=> (not res!484225) (not e!404960))))

(declare-fun lt!320313 () SeekEntryResult!7168)

(assert (=> b!722524 (= res!484225 (or (= lt!320313 (MissingZero!7168 i!1173)) (= lt!320313 (MissingVacant!7168 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40891 (_ BitVec 32)) SeekEntryResult!7168)

(assert (=> b!722524 (= lt!320313 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722525 () Bool)

(assert (=> b!722525 (= e!404957 false)))

(declare-fun lt!320316 () (_ BitVec 64))

(declare-fun lt!320317 () SeekEntryResult!7168)

(declare-fun lt!320314 () array!40891)

(assert (=> b!722525 (= lt!320317 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320316 lt!320314 mask!3328))))

(declare-fun lt!320318 () SeekEntryResult!7168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722525 (= lt!320318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320316 mask!3328) lt!320316 lt!320314 mask!3328))))

(assert (=> b!722525 (= lt!320316 (select (store (arr!19568 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!722525 (= lt!320314 (array!40892 (store (arr!19568 a!3186) i!1173 k!2102) (size!19989 a!3186)))))

(declare-fun b!722526 () Bool)

(declare-fun res!484219 () Bool)

(assert (=> b!722526 (=> (not res!484219) (not e!404960))))

(declare-datatypes ((List!13570 0))(
  ( (Nil!13567) (Cons!13566 (h!14620 (_ BitVec 64)) (t!19885 List!13570)) )
))
(declare-fun arrayNoDuplicates!0 (array!40891 (_ BitVec 32) List!13570) Bool)

(assert (=> b!722526 (= res!484219 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13567))))

(declare-fun b!722527 () Bool)

(declare-fun res!484227 () Bool)

(assert (=> b!722527 (=> (not res!484227) (not e!404958))))

(declare-fun arrayContainsKey!0 (array!40891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722527 (= res!484227 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722528 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40891 (_ BitVec 32)) SeekEntryResult!7168)

(assert (=> b!722528 (= e!404956 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19568 a!3186) j!159) a!3186 mask!3328) (Found!7168 j!159)))))

(declare-fun b!722529 () Bool)

(declare-fun res!484223 () Bool)

(assert (=> b!722529 (=> (not res!484223) (not e!404957))))

(assert (=> b!722529 (= res!484223 e!404956)))

(declare-fun c!79522 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722529 (= c!79522 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722530 () Bool)

(assert (=> b!722530 (= e!404960 e!404957)))

(declare-fun res!484229 () Bool)

(assert (=> b!722530 (=> (not res!484229) (not e!404957))))

(assert (=> b!722530 (= res!484229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19568 a!3186) j!159) mask!3328) (select (arr!19568 a!3186) j!159) a!3186 mask!3328) lt!320315))))

(assert (=> b!722530 (= lt!320315 (Intermediate!7168 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722531 () Bool)

(declare-fun res!484226 () Bool)

(assert (=> b!722531 (=> (not res!484226) (not e!404960))))

(assert (=> b!722531 (= res!484226 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19989 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19989 a!3186))))))

(declare-fun b!722532 () Bool)

(declare-fun res!484228 () Bool)

(assert (=> b!722532 (=> (not res!484228) (not e!404958))))

(assert (=> b!722532 (= res!484228 (and (= (size!19989 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19989 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19989 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64310 res!484220) b!722532))

(assert (= (and b!722532 res!484228) b!722520))

(assert (= (and b!722520 res!484218) b!722519))

(assert (= (and b!722519 res!484224) b!722527))

(assert (= (and b!722527 res!484227) b!722524))

(assert (= (and b!722524 res!484225) b!722522))

(assert (= (and b!722522 res!484221) b!722526))

(assert (= (and b!722526 res!484219) b!722531))

(assert (= (and b!722531 res!484226) b!722530))

(assert (= (and b!722530 res!484229) b!722523))

(assert (= (and b!722523 res!484222) b!722529))

(assert (= (and b!722529 c!79522) b!722521))

(assert (= (and b!722529 (not c!79522)) b!722528))

(assert (= (and b!722529 res!484223) b!722525))

(declare-fun m!677039 () Bool)

(assert (=> b!722520 m!677039))

(assert (=> b!722520 m!677039))

(declare-fun m!677041 () Bool)

(assert (=> b!722520 m!677041))

(declare-fun m!677043 () Bool)

(assert (=> b!722523 m!677043))

(declare-fun m!677045 () Bool)

(assert (=> b!722527 m!677045))

(declare-fun m!677047 () Bool)

(assert (=> b!722525 m!677047))

(declare-fun m!677049 () Bool)

(assert (=> b!722525 m!677049))

(assert (=> b!722525 m!677047))

(declare-fun m!677051 () Bool)

(assert (=> b!722525 m!677051))

(declare-fun m!677053 () Bool)

(assert (=> b!722525 m!677053))

(declare-fun m!677055 () Bool)

(assert (=> b!722525 m!677055))

(declare-fun m!677057 () Bool)

(assert (=> b!722526 m!677057))

(declare-fun m!677059 () Bool)

(assert (=> b!722524 m!677059))

(declare-fun m!677061 () Bool)

(assert (=> start!64310 m!677061))

(declare-fun m!677063 () Bool)

(assert (=> start!64310 m!677063))

(declare-fun m!677065 () Bool)

(assert (=> b!722522 m!677065))

(assert (=> b!722530 m!677039))

(assert (=> b!722530 m!677039))

(declare-fun m!677067 () Bool)

(assert (=> b!722530 m!677067))

(assert (=> b!722530 m!677067))

(assert (=> b!722530 m!677039))

(declare-fun m!677069 () Bool)

(assert (=> b!722530 m!677069))

(assert (=> b!722521 m!677039))

(assert (=> b!722521 m!677039))

(declare-fun m!677071 () Bool)

(assert (=> b!722521 m!677071))

(declare-fun m!677073 () Bool)

(assert (=> b!722519 m!677073))

(assert (=> b!722528 m!677039))

(assert (=> b!722528 m!677039))

(declare-fun m!677075 () Bool)

(assert (=> b!722528 m!677075))

(push 1)

