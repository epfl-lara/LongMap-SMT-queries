; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63948 () Bool)

(assert start!63948)

(declare-fun b!718411 () Bool)

(declare-fun e!403308 () Bool)

(assert (=> b!718411 (= e!403308 false)))

(declare-datatypes ((array!40688 0))(
  ( (array!40689 (arr!19471 (Array (_ BitVec 32) (_ BitVec 64))) (size!19892 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40688)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319357 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718411 (= lt!319357 (toIndex!0 (select (arr!19471 a!3186) j!159) mask!3328))))

(declare-fun res!480898 () Bool)

(declare-fun e!403310 () Bool)

(assert (=> start!63948 (=> (not res!480898) (not e!403310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63948 (= res!480898 (validMask!0 mask!3328))))

(assert (=> start!63948 e!403310))

(assert (=> start!63948 true))

(declare-fun array_inv!15267 (array!40688) Bool)

(assert (=> start!63948 (array_inv!15267 a!3186)))

(declare-fun b!718412 () Bool)

(declare-fun res!480892 () Bool)

(assert (=> b!718412 (=> (not res!480892) (not e!403308))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718412 (= res!480892 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19892 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19892 a!3186))))))

(declare-fun b!718413 () Bool)

(declare-fun res!480899 () Bool)

(assert (=> b!718413 (=> (not res!480899) (not e!403310))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718413 (= res!480899 (and (= (size!19892 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19892 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19892 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718414 () Bool)

(declare-fun res!480893 () Bool)

(assert (=> b!718414 (=> (not res!480893) (not e!403310))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718414 (= res!480893 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718415 () Bool)

(declare-fun res!480891 () Bool)

(assert (=> b!718415 (=> (not res!480891) (not e!403308))))

(declare-datatypes ((List!13473 0))(
  ( (Nil!13470) (Cons!13469 (h!14514 (_ BitVec 64)) (t!19788 List!13473)) )
))
(declare-fun arrayNoDuplicates!0 (array!40688 (_ BitVec 32) List!13473) Bool)

(assert (=> b!718415 (= res!480891 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13470))))

(declare-fun b!718416 () Bool)

(declare-fun res!480896 () Bool)

(assert (=> b!718416 (=> (not res!480896) (not e!403310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718416 (= res!480896 (validKeyInArray!0 k0!2102))))

(declare-fun b!718417 () Bool)

(declare-fun res!480897 () Bool)

(assert (=> b!718417 (=> (not res!480897) (not e!403310))))

(assert (=> b!718417 (= res!480897 (validKeyInArray!0 (select (arr!19471 a!3186) j!159)))))

(declare-fun b!718418 () Bool)

(assert (=> b!718418 (= e!403310 e!403308)))

(declare-fun res!480894 () Bool)

(assert (=> b!718418 (=> (not res!480894) (not e!403308))))

(declare-datatypes ((SeekEntryResult!7071 0))(
  ( (MissingZero!7071 (index!30652 (_ BitVec 32))) (Found!7071 (index!30653 (_ BitVec 32))) (Intermediate!7071 (undefined!7883 Bool) (index!30654 (_ BitVec 32)) (x!61667 (_ BitVec 32))) (Undefined!7071) (MissingVacant!7071 (index!30655 (_ BitVec 32))) )
))
(declare-fun lt!319358 () SeekEntryResult!7071)

(assert (=> b!718418 (= res!480894 (or (= lt!319358 (MissingZero!7071 i!1173)) (= lt!319358 (MissingVacant!7071 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40688 (_ BitVec 32)) SeekEntryResult!7071)

(assert (=> b!718418 (= lt!319358 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718419 () Bool)

(declare-fun res!480895 () Bool)

(assert (=> b!718419 (=> (not res!480895) (not e!403308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40688 (_ BitVec 32)) Bool)

(assert (=> b!718419 (= res!480895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!63948 res!480898) b!718413))

(assert (= (and b!718413 res!480899) b!718417))

(assert (= (and b!718417 res!480897) b!718416))

(assert (= (and b!718416 res!480896) b!718414))

(assert (= (and b!718414 res!480893) b!718418))

(assert (= (and b!718418 res!480894) b!718419))

(assert (= (and b!718419 res!480895) b!718415))

(assert (= (and b!718415 res!480891) b!718412))

(assert (= (and b!718412 res!480892) b!718411))

(declare-fun m!674061 () Bool)

(assert (=> start!63948 m!674061))

(declare-fun m!674063 () Bool)

(assert (=> start!63948 m!674063))

(declare-fun m!674065 () Bool)

(assert (=> b!718414 m!674065))

(declare-fun m!674067 () Bool)

(assert (=> b!718418 m!674067))

(declare-fun m!674069 () Bool)

(assert (=> b!718415 m!674069))

(declare-fun m!674071 () Bool)

(assert (=> b!718416 m!674071))

(declare-fun m!674073 () Bool)

(assert (=> b!718411 m!674073))

(assert (=> b!718411 m!674073))

(declare-fun m!674075 () Bool)

(assert (=> b!718411 m!674075))

(declare-fun m!674077 () Bool)

(assert (=> b!718419 m!674077))

(assert (=> b!718417 m!674073))

(assert (=> b!718417 m!674073))

(declare-fun m!674079 () Bool)

(assert (=> b!718417 m!674079))

(check-sat (not b!718414) (not start!63948) (not b!718419) (not b!718416) (not b!718418) (not b!718415) (not b!718417) (not b!718411))
(check-sat)
