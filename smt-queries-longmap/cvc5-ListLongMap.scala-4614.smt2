; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64318 () Bool)

(assert start!64318)

(declare-fun res!484373 () Bool)

(declare-fun e!405018 () Bool)

(assert (=> start!64318 (=> (not res!484373) (not e!405018))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64318 (= res!484373 (validMask!0 mask!3328))))

(assert (=> start!64318 e!405018))

(assert (=> start!64318 true))

(declare-datatypes ((array!40899 0))(
  ( (array!40900 (arr!19572 (Array (_ BitVec 32) (_ BitVec 64))) (size!19993 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40899)

(declare-fun array_inv!15368 (array!40899) Bool)

(assert (=> start!64318 (array_inv!15368 a!3186)))

(declare-fun b!722687 () Bool)

(declare-fun e!405016 () Bool)

(assert (=> b!722687 (= e!405016 false)))

(declare-fun lt!320388 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7172 0))(
  ( (MissingZero!7172 (index!31056 (_ BitVec 32))) (Found!7172 (index!31057 (_ BitVec 32))) (Intermediate!7172 (undefined!7984 Bool) (index!31058 (_ BitVec 32)) (x!62061 (_ BitVec 32))) (Undefined!7172) (MissingVacant!7172 (index!31059 (_ BitVec 32))) )
))
(declare-fun lt!320389 () SeekEntryResult!7172)

(declare-fun lt!320390 () array!40899)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40899 (_ BitVec 32)) SeekEntryResult!7172)

(assert (=> b!722687 (= lt!320389 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320388 lt!320390 mask!3328))))

(declare-fun lt!320387 () SeekEntryResult!7172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722687 (= lt!320387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320388 mask!3328) lt!320388 lt!320390 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!722687 (= lt!320388 (select (store (arr!19572 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!722687 (= lt!320390 (array!40900 (store (arr!19572 a!3186) i!1173 k!2102) (size!19993 a!3186)))))

(declare-fun b!722688 () Bool)

(declare-fun res!484365 () Bool)

(declare-fun e!405019 () Bool)

(assert (=> b!722688 (=> (not res!484365) (not e!405019))))

(declare-datatypes ((List!13574 0))(
  ( (Nil!13571) (Cons!13570 (h!14624 (_ BitVec 64)) (t!19889 List!13574)) )
))
(declare-fun arrayNoDuplicates!0 (array!40899 (_ BitVec 32) List!13574) Bool)

(assert (=> b!722688 (= res!484365 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13571))))

(declare-fun b!722689 () Bool)

(declare-fun res!484366 () Bool)

(assert (=> b!722689 (=> (not res!484366) (not e!405018))))

(assert (=> b!722689 (= res!484366 (and (= (size!19993 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19993 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19993 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!405020 () Bool)

(declare-fun b!722690 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40899 (_ BitVec 32)) SeekEntryResult!7172)

(assert (=> b!722690 (= e!405020 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19572 a!3186) j!159) a!3186 mask!3328) (Found!7172 j!159)))))

(declare-fun b!722691 () Bool)

(declare-fun res!484369 () Bool)

(assert (=> b!722691 (=> (not res!484369) (not e!405018))))

(declare-fun arrayContainsKey!0 (array!40899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722691 (= res!484369 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722692 () Bool)

(declare-fun res!484372 () Bool)

(assert (=> b!722692 (=> (not res!484372) (not e!405016))))

(assert (=> b!722692 (= res!484372 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19572 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722693 () Bool)

(declare-fun res!484362 () Bool)

(assert (=> b!722693 (=> (not res!484362) (not e!405019))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722693 (= res!484362 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19993 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19993 a!3186))))))

(declare-fun b!722694 () Bool)

(declare-fun res!484363 () Bool)

(assert (=> b!722694 (=> (not res!484363) (not e!405019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40899 (_ BitVec 32)) Bool)

(assert (=> b!722694 (= res!484363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722695 () Bool)

(assert (=> b!722695 (= e!405018 e!405019)))

(declare-fun res!484370 () Bool)

(assert (=> b!722695 (=> (not res!484370) (not e!405019))))

(declare-fun lt!320386 () SeekEntryResult!7172)

(assert (=> b!722695 (= res!484370 (or (= lt!320386 (MissingZero!7172 i!1173)) (= lt!320386 (MissingVacant!7172 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40899 (_ BitVec 32)) SeekEntryResult!7172)

(assert (=> b!722695 (= lt!320386 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722696 () Bool)

(declare-fun res!484368 () Bool)

(assert (=> b!722696 (=> (not res!484368) (not e!405018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722696 (= res!484368 (validKeyInArray!0 (select (arr!19572 a!3186) j!159)))))

(declare-fun b!722697 () Bool)

(declare-fun res!484367 () Bool)

(assert (=> b!722697 (=> (not res!484367) (not e!405016))))

(assert (=> b!722697 (= res!484367 e!405020)))

(declare-fun c!79534 () Bool)

(assert (=> b!722697 (= c!79534 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722698 () Bool)

(declare-fun lt!320385 () SeekEntryResult!7172)

(assert (=> b!722698 (= e!405020 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19572 a!3186) j!159) a!3186 mask!3328) lt!320385))))

(declare-fun b!722699 () Bool)

(declare-fun res!484371 () Bool)

(assert (=> b!722699 (=> (not res!484371) (not e!405018))))

(assert (=> b!722699 (= res!484371 (validKeyInArray!0 k!2102))))

(declare-fun b!722700 () Bool)

(assert (=> b!722700 (= e!405019 e!405016)))

(declare-fun res!484364 () Bool)

(assert (=> b!722700 (=> (not res!484364) (not e!405016))))

(assert (=> b!722700 (= res!484364 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19572 a!3186) j!159) mask!3328) (select (arr!19572 a!3186) j!159) a!3186 mask!3328) lt!320385))))

(assert (=> b!722700 (= lt!320385 (Intermediate!7172 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64318 res!484373) b!722689))

(assert (= (and b!722689 res!484366) b!722696))

(assert (= (and b!722696 res!484368) b!722699))

(assert (= (and b!722699 res!484371) b!722691))

(assert (= (and b!722691 res!484369) b!722695))

(assert (= (and b!722695 res!484370) b!722694))

(assert (= (and b!722694 res!484363) b!722688))

(assert (= (and b!722688 res!484365) b!722693))

(assert (= (and b!722693 res!484362) b!722700))

(assert (= (and b!722700 res!484364) b!722692))

(assert (= (and b!722692 res!484372) b!722697))

(assert (= (and b!722697 c!79534) b!722698))

(assert (= (and b!722697 (not c!79534)) b!722690))

(assert (= (and b!722697 res!484367) b!722687))

(declare-fun m!677191 () Bool)

(assert (=> b!722696 m!677191))

(assert (=> b!722696 m!677191))

(declare-fun m!677193 () Bool)

(assert (=> b!722696 m!677193))

(declare-fun m!677195 () Bool)

(assert (=> b!722694 m!677195))

(declare-fun m!677197 () Bool)

(assert (=> b!722688 m!677197))

(declare-fun m!677199 () Bool)

(assert (=> b!722687 m!677199))

(declare-fun m!677201 () Bool)

(assert (=> b!722687 m!677201))

(declare-fun m!677203 () Bool)

(assert (=> b!722687 m!677203))

(assert (=> b!722687 m!677199))

(declare-fun m!677205 () Bool)

(assert (=> b!722687 m!677205))

(declare-fun m!677207 () Bool)

(assert (=> b!722687 m!677207))

(declare-fun m!677209 () Bool)

(assert (=> b!722699 m!677209))

(declare-fun m!677211 () Bool)

(assert (=> start!64318 m!677211))

(declare-fun m!677213 () Bool)

(assert (=> start!64318 m!677213))

(assert (=> b!722690 m!677191))

(assert (=> b!722690 m!677191))

(declare-fun m!677215 () Bool)

(assert (=> b!722690 m!677215))

(declare-fun m!677217 () Bool)

(assert (=> b!722692 m!677217))

(declare-fun m!677219 () Bool)

(assert (=> b!722691 m!677219))

(assert (=> b!722698 m!677191))

(assert (=> b!722698 m!677191))

(declare-fun m!677221 () Bool)

(assert (=> b!722698 m!677221))

(assert (=> b!722700 m!677191))

(assert (=> b!722700 m!677191))

(declare-fun m!677223 () Bool)

(assert (=> b!722700 m!677223))

(assert (=> b!722700 m!677223))

(assert (=> b!722700 m!677191))

(declare-fun m!677225 () Bool)

(assert (=> b!722700 m!677225))

(declare-fun m!677227 () Bool)

(assert (=> b!722695 m!677227))

(push 1)

