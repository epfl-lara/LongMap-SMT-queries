; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67162 () Bool)

(assert start!67162)

(declare-fun b!776380 () Bool)

(declare-fun e!432041 () Bool)

(declare-fun e!432039 () Bool)

(assert (=> b!776380 (= e!432041 e!432039)))

(declare-fun res!525199 () Bool)

(assert (=> b!776380 (=> (not res!525199) (not e!432039))))

(declare-datatypes ((SeekEntryResult!7954 0))(
  ( (MissingZero!7954 (index!34184 (_ BitVec 32))) (Found!7954 (index!34185 (_ BitVec 32))) (Intermediate!7954 (undefined!8766 Bool) (index!34186 (_ BitVec 32)) (x!65121 (_ BitVec 32))) (Undefined!7954) (MissingVacant!7954 (index!34187 (_ BitVec 32))) )
))
(declare-fun lt!345894 () SeekEntryResult!7954)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776380 (= res!525199 (or (= lt!345894 (MissingZero!7954 i!1173)) (= lt!345894 (MissingVacant!7954 i!1173))))))

(declare-datatypes ((array!42517 0))(
  ( (array!42518 (arr!20354 (Array (_ BitVec 32) (_ BitVec 64))) (size!20775 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42517)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42517 (_ BitVec 32)) SeekEntryResult!7954)

(assert (=> b!776380 (= lt!345894 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776381 () Bool)

(declare-fun res!525201 () Bool)

(declare-fun e!432038 () Bool)

(assert (=> b!776381 (=> (not res!525201) (not e!432038))))

(declare-fun e!432040 () Bool)

(assert (=> b!776381 (= res!525201 e!432040)))

(declare-fun c!85996 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776381 (= c!85996 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776382 () Bool)

(declare-fun res!525200 () Bool)

(assert (=> b!776382 (=> (not res!525200) (not e!432041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776382 (= res!525200 (validKeyInArray!0 k!2102))))

(declare-fun b!776383 () Bool)

(declare-fun res!525196 () Bool)

(assert (=> b!776383 (=> (not res!525196) (not e!432039))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!776383 (= res!525196 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20775 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20775 a!3186))))))

(declare-fun b!776384 () Bool)

(declare-fun res!525192 () Bool)

(assert (=> b!776384 (=> (not res!525192) (not e!432039))))

(declare-datatypes ((List!14356 0))(
  ( (Nil!14353) (Cons!14352 (h!15460 (_ BitVec 64)) (t!20671 List!14356)) )
))
(declare-fun arrayNoDuplicates!0 (array!42517 (_ BitVec 32) List!14356) Bool)

(assert (=> b!776384 (= res!525192 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14353))))

(declare-fun res!525193 () Bool)

(assert (=> start!67162 (=> (not res!525193) (not e!432041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67162 (= res!525193 (validMask!0 mask!3328))))

(assert (=> start!67162 e!432041))

(assert (=> start!67162 true))

(declare-fun array_inv!16150 (array!42517) Bool)

(assert (=> start!67162 (array_inv!16150 a!3186)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!345897 () SeekEntryResult!7954)

(declare-fun e!432037 () Bool)

(declare-fun b!776385 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42517 (_ BitVec 32)) SeekEntryResult!7954)

(assert (=> b!776385 (= e!432037 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20354 a!3186) j!159) a!3186 mask!3328) lt!345897))))

(declare-fun b!776386 () Bool)

(declare-fun e!432043 () Bool)

(assert (=> b!776386 (= e!432038 e!432043)))

(declare-fun res!525198 () Bool)

(assert (=> b!776386 (=> (not res!525198) (not e!432043))))

(declare-fun lt!345892 () SeekEntryResult!7954)

(declare-fun lt!345895 () SeekEntryResult!7954)

(assert (=> b!776386 (= res!525198 (= lt!345892 lt!345895))))

(declare-fun lt!345899 () (_ BitVec 64))

(declare-fun lt!345891 () array!42517)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42517 (_ BitVec 32)) SeekEntryResult!7954)

(assert (=> b!776386 (= lt!345895 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345899 lt!345891 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776386 (= lt!345892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345899 mask!3328) lt!345899 lt!345891 mask!3328))))

(assert (=> b!776386 (= lt!345899 (select (store (arr!20354 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776386 (= lt!345891 (array!42518 (store (arr!20354 a!3186) i!1173 k!2102) (size!20775 a!3186)))))

(declare-fun b!776387 () Bool)

(declare-fun res!525195 () Bool)

(assert (=> b!776387 (=> (not res!525195) (not e!432038))))

(assert (=> b!776387 (= res!525195 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20354 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776388 () Bool)

(declare-fun e!432036 () Bool)

(assert (=> b!776388 (= e!432036 e!432037)))

(declare-fun res!525189 () Bool)

(assert (=> b!776388 (=> (not res!525189) (not e!432037))))

(assert (=> b!776388 (= res!525189 (= (seekEntryOrOpen!0 (select (arr!20354 a!3186) j!159) a!3186 mask!3328) lt!345897))))

(assert (=> b!776388 (= lt!345897 (Found!7954 j!159))))

(declare-fun b!776389 () Bool)

(declare-fun res!525194 () Bool)

(assert (=> b!776389 (=> (not res!525194) (not e!432041))))

(declare-fun arrayContainsKey!0 (array!42517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776389 (= res!525194 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776390 () Bool)

(assert (=> b!776390 (= e!432039 e!432038)))

(declare-fun res!525203 () Bool)

(assert (=> b!776390 (=> (not res!525203) (not e!432038))))

(declare-fun lt!345898 () SeekEntryResult!7954)

(assert (=> b!776390 (= res!525203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20354 a!3186) j!159) mask!3328) (select (arr!20354 a!3186) j!159) a!3186 mask!3328) lt!345898))))

(assert (=> b!776390 (= lt!345898 (Intermediate!7954 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776391 () Bool)

(declare-fun res!525197 () Bool)

(assert (=> b!776391 (=> (not res!525197) (not e!432041))))

(assert (=> b!776391 (= res!525197 (and (= (size!20775 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20775 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20775 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776392 () Bool)

(declare-fun e!432044 () Bool)

(assert (=> b!776392 (= e!432044 true)))

(declare-fun lt!345893 () SeekEntryResult!7954)

(assert (=> b!776392 (= lt!345893 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20354 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776393 () Bool)

(assert (=> b!776393 (= e!432043 (not e!432044))))

(declare-fun res!525188 () Bool)

(assert (=> b!776393 (=> res!525188 e!432044)))

(assert (=> b!776393 (= res!525188 (or (not (is-Intermediate!7954 lt!345895)) (bvslt x!1131 (x!65121 lt!345895)) (not (= x!1131 (x!65121 lt!345895))) (not (= index!1321 (index!34186 lt!345895)))))))

(assert (=> b!776393 e!432036))

(declare-fun res!525190 () Bool)

(assert (=> b!776393 (=> (not res!525190) (not e!432036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42517 (_ BitVec 32)) Bool)

(assert (=> b!776393 (= res!525190 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26802 0))(
  ( (Unit!26803) )
))
(declare-fun lt!345896 () Unit!26802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26802)

(assert (=> b!776393 (= lt!345896 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776394 () Bool)

(declare-fun res!525202 () Bool)

(assert (=> b!776394 (=> (not res!525202) (not e!432039))))

(assert (=> b!776394 (= res!525202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776395 () Bool)

(assert (=> b!776395 (= e!432040 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20354 a!3186) j!159) a!3186 mask!3328) lt!345898))))

(declare-fun b!776396 () Bool)

(declare-fun res!525191 () Bool)

(assert (=> b!776396 (=> (not res!525191) (not e!432041))))

(assert (=> b!776396 (= res!525191 (validKeyInArray!0 (select (arr!20354 a!3186) j!159)))))

(declare-fun b!776397 () Bool)

(assert (=> b!776397 (= e!432040 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20354 a!3186) j!159) a!3186 mask!3328) (Found!7954 j!159)))))

(assert (= (and start!67162 res!525193) b!776391))

(assert (= (and b!776391 res!525197) b!776396))

(assert (= (and b!776396 res!525191) b!776382))

(assert (= (and b!776382 res!525200) b!776389))

(assert (= (and b!776389 res!525194) b!776380))

(assert (= (and b!776380 res!525199) b!776394))

(assert (= (and b!776394 res!525202) b!776384))

(assert (= (and b!776384 res!525192) b!776383))

(assert (= (and b!776383 res!525196) b!776390))

(assert (= (and b!776390 res!525203) b!776387))

(assert (= (and b!776387 res!525195) b!776381))

(assert (= (and b!776381 c!85996) b!776395))

(assert (= (and b!776381 (not c!85996)) b!776397))

(assert (= (and b!776381 res!525201) b!776386))

(assert (= (and b!776386 res!525198) b!776393))

(assert (= (and b!776393 res!525190) b!776388))

(assert (= (and b!776388 res!525189) b!776385))

(assert (= (and b!776393 (not res!525188)) b!776392))

(declare-fun m!720469 () Bool)

(assert (=> b!776389 m!720469))

(declare-fun m!720471 () Bool)

(assert (=> b!776380 m!720471))

(declare-fun m!720473 () Bool)

(assert (=> b!776390 m!720473))

(assert (=> b!776390 m!720473))

(declare-fun m!720475 () Bool)

(assert (=> b!776390 m!720475))

(assert (=> b!776390 m!720475))

(assert (=> b!776390 m!720473))

(declare-fun m!720477 () Bool)

(assert (=> b!776390 m!720477))

(assert (=> b!776395 m!720473))

(assert (=> b!776395 m!720473))

(declare-fun m!720479 () Bool)

(assert (=> b!776395 m!720479))

(declare-fun m!720481 () Bool)

(assert (=> start!67162 m!720481))

(declare-fun m!720483 () Bool)

(assert (=> start!67162 m!720483))

(declare-fun m!720485 () Bool)

(assert (=> b!776393 m!720485))

(declare-fun m!720487 () Bool)

(assert (=> b!776393 m!720487))

(assert (=> b!776392 m!720473))

(assert (=> b!776392 m!720473))

(declare-fun m!720489 () Bool)

(assert (=> b!776392 m!720489))

(declare-fun m!720491 () Bool)

(assert (=> b!776386 m!720491))

(declare-fun m!720493 () Bool)

(assert (=> b!776386 m!720493))

(declare-fun m!720495 () Bool)

(assert (=> b!776386 m!720495))

(declare-fun m!720497 () Bool)

(assert (=> b!776386 m!720497))

(declare-fun m!720499 () Bool)

(assert (=> b!776386 m!720499))

(assert (=> b!776386 m!720493))

(assert (=> b!776397 m!720473))

(assert (=> b!776397 m!720473))

(assert (=> b!776397 m!720489))

(assert (=> b!776388 m!720473))

(assert (=> b!776388 m!720473))

(declare-fun m!720501 () Bool)

(assert (=> b!776388 m!720501))

(assert (=> b!776396 m!720473))

(assert (=> b!776396 m!720473))

(declare-fun m!720503 () Bool)

(assert (=> b!776396 m!720503))

(assert (=> b!776385 m!720473))

(assert (=> b!776385 m!720473))

(declare-fun m!720505 () Bool)

(assert (=> b!776385 m!720505))

(declare-fun m!720507 () Bool)

(assert (=> b!776382 m!720507))

(declare-fun m!720509 () Bool)

(assert (=> b!776384 m!720509))

(declare-fun m!720511 () Bool)

(assert (=> b!776394 m!720511))

(declare-fun m!720513 () Bool)

(assert (=> b!776387 m!720513))

(push 1)

