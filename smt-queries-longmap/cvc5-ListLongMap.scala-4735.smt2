; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65470 () Bool)

(assert start!65470)

(declare-fun b!746149 () Bool)

(declare-fun e!416701 () Bool)

(declare-fun e!416698 () Bool)

(assert (=> b!746149 (= e!416701 e!416698)))

(declare-fun res!502959 () Bool)

(assert (=> b!746149 (=> (not res!502959) (not e!416698))))

(declare-datatypes ((SeekEntryResult!7535 0))(
  ( (MissingZero!7535 (index!32508 (_ BitVec 32))) (Found!7535 (index!32509 (_ BitVec 32))) (Intermediate!7535 (undefined!8347 Bool) (index!32510 (_ BitVec 32)) (x!63461 (_ BitVec 32))) (Undefined!7535) (MissingVacant!7535 (index!32511 (_ BitVec 32))) )
))
(declare-fun lt!331564 () SeekEntryResult!7535)

(declare-fun lt!331562 () SeekEntryResult!7535)

(assert (=> b!746149 (= res!502959 (= lt!331564 lt!331562))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41643 0))(
  ( (array!41644 (arr!19935 (Array (_ BitVec 32) (_ BitVec 64))) (size!20356 (_ BitVec 32))) )
))
(declare-fun lt!331561 () array!41643)

(declare-fun lt!331556 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41643 (_ BitVec 32)) SeekEntryResult!7535)

(assert (=> b!746149 (= lt!331562 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331556 lt!331561 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746149 (= lt!331564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331556 mask!3328) lt!331556 lt!331561 mask!3328))))

(declare-fun a!3186 () array!41643)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!746149 (= lt!331556 (select (store (arr!19935 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!746149 (= lt!331561 (array!41644 (store (arr!19935 a!3186) i!1173 k!2102) (size!20356 a!3186)))))

(declare-fun b!746150 () Bool)

(declare-fun res!502949 () Bool)

(assert (=> b!746150 (=> (not res!502949) (not e!416701))))

(declare-fun e!416704 () Bool)

(assert (=> b!746150 (= res!502949 e!416704)))

(declare-fun c!81982 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746150 (= c!81982 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746151 () Bool)

(declare-fun e!416700 () Bool)

(assert (=> b!746151 (= e!416698 (not e!416700))))

(declare-fun res!502956 () Bool)

(assert (=> b!746151 (=> res!502956 e!416700)))

(assert (=> b!746151 (= res!502956 (or (not (is-Intermediate!7535 lt!331562)) (bvslt x!1131 (x!63461 lt!331562)) (not (= x!1131 (x!63461 lt!331562))) (not (= index!1321 (index!32510 lt!331562)))))))

(declare-fun e!416705 () Bool)

(assert (=> b!746151 e!416705))

(declare-fun res!502951 () Bool)

(assert (=> b!746151 (=> (not res!502951) (not e!416705))))

(declare-fun lt!331558 () SeekEntryResult!7535)

(declare-fun lt!331565 () SeekEntryResult!7535)

(assert (=> b!746151 (= res!502951 (= lt!331558 lt!331565))))

(assert (=> b!746151 (= lt!331565 (Found!7535 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41643 (_ BitVec 32)) SeekEntryResult!7535)

(assert (=> b!746151 (= lt!331558 (seekEntryOrOpen!0 (select (arr!19935 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41643 (_ BitVec 32)) Bool)

(assert (=> b!746151 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25550 0))(
  ( (Unit!25551) )
))
(declare-fun lt!331557 () Unit!25550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41643 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25550)

(assert (=> b!746151 (= lt!331557 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746152 () Bool)

(declare-fun res!502948 () Bool)

(declare-fun e!416697 () Bool)

(assert (=> b!746152 (=> (not res!502948) (not e!416697))))

(assert (=> b!746152 (= res!502948 (and (= (size!20356 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20356 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20356 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!746153 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41643 (_ BitVec 32)) SeekEntryResult!7535)

(assert (=> b!746153 (= e!416704 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19935 a!3186) j!159) a!3186 mask!3328) (Found!7535 j!159)))))

(declare-fun b!746154 () Bool)

(declare-fun e!416703 () Bool)

(assert (=> b!746154 (= e!416697 e!416703)))

(declare-fun res!502946 () Bool)

(assert (=> b!746154 (=> (not res!502946) (not e!416703))))

(declare-fun lt!331559 () SeekEntryResult!7535)

(assert (=> b!746154 (= res!502946 (or (= lt!331559 (MissingZero!7535 i!1173)) (= lt!331559 (MissingVacant!7535 i!1173))))))

(assert (=> b!746154 (= lt!331559 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!746156 () Bool)

(declare-fun res!502957 () Bool)

(assert (=> b!746156 (=> (not res!502957) (not e!416697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746156 (= res!502957 (validKeyInArray!0 (select (arr!19935 a!3186) j!159)))))

(declare-fun b!746157 () Bool)

(assert (=> b!746157 (= e!416705 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19935 a!3186) j!159) a!3186 mask!3328) lt!331565))))

(declare-fun b!746158 () Bool)

(declare-fun e!416702 () Bool)

(assert (=> b!746158 (= e!416700 e!416702)))

(declare-fun res!502958 () Bool)

(assert (=> b!746158 (=> res!502958 e!416702)))

(declare-fun lt!331563 () SeekEntryResult!7535)

(assert (=> b!746158 (= res!502958 (or (not (= lt!331563 lt!331565)) (= (select (store (arr!19935 a!3186) i!1173 k!2102) index!1321) lt!331556) (not (= (select (store (arr!19935 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746158 (= lt!331563 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19935 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746159 () Bool)

(declare-fun res!502953 () Bool)

(assert (=> b!746159 (=> (not res!502953) (not e!416703))))

(declare-datatypes ((List!13937 0))(
  ( (Nil!13934) (Cons!13933 (h!15005 (_ BitVec 64)) (t!20252 List!13937)) )
))
(declare-fun arrayNoDuplicates!0 (array!41643 (_ BitVec 32) List!13937) Bool)

(assert (=> b!746159 (= res!502953 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13934))))

(declare-fun b!746160 () Bool)

(declare-fun res!502955 () Bool)

(assert (=> b!746160 (=> (not res!502955) (not e!416697))))

(assert (=> b!746160 (= res!502955 (validKeyInArray!0 k!2102))))

(declare-fun b!746161 () Bool)

(assert (=> b!746161 (= e!416703 e!416701)))

(declare-fun res!502954 () Bool)

(assert (=> b!746161 (=> (not res!502954) (not e!416701))))

(declare-fun lt!331560 () SeekEntryResult!7535)

(assert (=> b!746161 (= res!502954 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19935 a!3186) j!159) mask!3328) (select (arr!19935 a!3186) j!159) a!3186 mask!3328) lt!331560))))

(assert (=> b!746161 (= lt!331560 (Intermediate!7535 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746162 () Bool)

(declare-fun res!502952 () Bool)

(assert (=> b!746162 (=> (not res!502952) (not e!416701))))

(assert (=> b!746162 (= res!502952 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19935 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746163 () Bool)

(declare-fun res!502950 () Bool)

(assert (=> b!746163 (=> (not res!502950) (not e!416697))))

(declare-fun arrayContainsKey!0 (array!41643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746163 (= res!502950 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746164 () Bool)

(declare-fun res!502961 () Bool)

(assert (=> b!746164 (=> (not res!502961) (not e!416703))))

(assert (=> b!746164 (= res!502961 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20356 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20356 a!3186))))))

(declare-fun b!746165 () Bool)

(assert (=> b!746165 (= e!416702 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!746165 (= lt!331558 lt!331563)))

(declare-fun b!746166 () Bool)

(assert (=> b!746166 (= e!416704 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19935 a!3186) j!159) a!3186 mask!3328) lt!331560))))

(declare-fun res!502947 () Bool)

(assert (=> start!65470 (=> (not res!502947) (not e!416697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65470 (= res!502947 (validMask!0 mask!3328))))

(assert (=> start!65470 e!416697))

(assert (=> start!65470 true))

(declare-fun array_inv!15731 (array!41643) Bool)

(assert (=> start!65470 (array_inv!15731 a!3186)))

(declare-fun b!746155 () Bool)

(declare-fun res!502960 () Bool)

(assert (=> b!746155 (=> (not res!502960) (not e!416703))))

(assert (=> b!746155 (= res!502960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65470 res!502947) b!746152))

(assert (= (and b!746152 res!502948) b!746156))

(assert (= (and b!746156 res!502957) b!746160))

(assert (= (and b!746160 res!502955) b!746163))

(assert (= (and b!746163 res!502950) b!746154))

(assert (= (and b!746154 res!502946) b!746155))

(assert (= (and b!746155 res!502960) b!746159))

(assert (= (and b!746159 res!502953) b!746164))

(assert (= (and b!746164 res!502961) b!746161))

(assert (= (and b!746161 res!502954) b!746162))

(assert (= (and b!746162 res!502952) b!746150))

(assert (= (and b!746150 c!81982) b!746166))

(assert (= (and b!746150 (not c!81982)) b!746153))

(assert (= (and b!746150 res!502949) b!746149))

(assert (= (and b!746149 res!502959) b!746151))

(assert (= (and b!746151 res!502951) b!746157))

(assert (= (and b!746151 (not res!502956)) b!746158))

(assert (= (and b!746158 (not res!502958)) b!746165))

(declare-fun m!696439 () Bool)

(assert (=> b!746162 m!696439))

(declare-fun m!696441 () Bool)

(assert (=> b!746156 m!696441))

(assert (=> b!746156 m!696441))

(declare-fun m!696443 () Bool)

(assert (=> b!746156 m!696443))

(assert (=> b!746157 m!696441))

(assert (=> b!746157 m!696441))

(declare-fun m!696445 () Bool)

(assert (=> b!746157 m!696445))

(assert (=> b!746153 m!696441))

(assert (=> b!746153 m!696441))

(declare-fun m!696447 () Bool)

(assert (=> b!746153 m!696447))

(assert (=> b!746161 m!696441))

(assert (=> b!746161 m!696441))

(declare-fun m!696449 () Bool)

(assert (=> b!746161 m!696449))

(assert (=> b!746161 m!696449))

(assert (=> b!746161 m!696441))

(declare-fun m!696451 () Bool)

(assert (=> b!746161 m!696451))

(declare-fun m!696453 () Bool)

(assert (=> start!65470 m!696453))

(declare-fun m!696455 () Bool)

(assert (=> start!65470 m!696455))

(declare-fun m!696457 () Bool)

(assert (=> b!746159 m!696457))

(declare-fun m!696459 () Bool)

(assert (=> b!746160 m!696459))

(assert (=> b!746151 m!696441))

(assert (=> b!746151 m!696441))

(declare-fun m!696461 () Bool)

(assert (=> b!746151 m!696461))

(declare-fun m!696463 () Bool)

(assert (=> b!746151 m!696463))

(declare-fun m!696465 () Bool)

(assert (=> b!746151 m!696465))

(declare-fun m!696467 () Bool)

(assert (=> b!746154 m!696467))

(declare-fun m!696469 () Bool)

(assert (=> b!746155 m!696469))

(declare-fun m!696471 () Bool)

(assert (=> b!746158 m!696471))

(declare-fun m!696473 () Bool)

(assert (=> b!746158 m!696473))

(assert (=> b!746158 m!696441))

(assert (=> b!746158 m!696441))

(assert (=> b!746158 m!696447))

(declare-fun m!696475 () Bool)

(assert (=> b!746149 m!696475))

(assert (=> b!746149 m!696475))

(declare-fun m!696477 () Bool)

(assert (=> b!746149 m!696477))

(declare-fun m!696479 () Bool)

(assert (=> b!746149 m!696479))

(declare-fun m!696481 () Bool)

(assert (=> b!746149 m!696481))

(assert (=> b!746149 m!696471))

(assert (=> b!746166 m!696441))

(assert (=> b!746166 m!696441))

(declare-fun m!696483 () Bool)

(assert (=> b!746166 m!696483))

(declare-fun m!696485 () Bool)

(assert (=> b!746163 m!696485))

(push 1)

(assert (not b!746157))

(assert (not b!746163))

(assert (not b!746155))

(assert (not start!65470))

(assert (not b!746161))

(assert (not b!746149))

(assert (not b!746158))

(assert (not b!746160))

(assert (not b!746154))

(assert (not b!746159))

(assert (not b!746156))

(assert (not b!746153))

(assert (not b!746166))

(assert (not b!746151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

