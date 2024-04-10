; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64030 () Bool)

(assert start!64030)

(declare-fun b!719032 () Bool)

(declare-fun e!403569 () Bool)

(declare-fun e!403571 () Bool)

(assert (=> b!719032 (= e!403569 e!403571)))

(declare-fun res!481433 () Bool)

(assert (=> b!719032 (=> (not res!481433) (not e!403571))))

(declare-datatypes ((SeekEntryResult!7088 0))(
  ( (MissingZero!7088 (index!30720 (_ BitVec 32))) (Found!7088 (index!30721 (_ BitVec 32))) (Intermediate!7088 (undefined!7900 Bool) (index!30722 (_ BitVec 32)) (x!61735 (_ BitVec 32))) (Undefined!7088) (MissingVacant!7088 (index!30723 (_ BitVec 32))) )
))
(declare-fun lt!319522 () SeekEntryResult!7088)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719032 (= res!481433 (or (= lt!319522 (MissingZero!7088 i!1173)) (= lt!319522 (MissingVacant!7088 i!1173))))))

(declare-datatypes ((array!40725 0))(
  ( (array!40726 (arr!19488 (Array (_ BitVec 32) (_ BitVec 64))) (size!19909 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40725)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40725 (_ BitVec 32)) SeekEntryResult!7088)

(assert (=> b!719032 (= lt!319522 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719033 () Bool)

(declare-fun res!481427 () Bool)

(assert (=> b!719033 (=> (not res!481427) (not e!403569))))

(declare-fun arrayContainsKey!0 (array!40725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719033 (= res!481427 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719034 () Bool)

(declare-fun res!481429 () Bool)

(assert (=> b!719034 (=> (not res!481429) (not e!403571))))

(declare-datatypes ((List!13490 0))(
  ( (Nil!13487) (Cons!13486 (h!14534 (_ BitVec 64)) (t!19805 List!13490)) )
))
(declare-fun arrayNoDuplicates!0 (array!40725 (_ BitVec 32) List!13490) Bool)

(assert (=> b!719034 (= res!481429 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13487))))

(declare-fun b!719035 () Bool)

(declare-fun res!481431 () Bool)

(assert (=> b!719035 (=> (not res!481431) (not e!403571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40725 (_ BitVec 32)) Bool)

(assert (=> b!719035 (= res!481431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719036 () Bool)

(declare-fun res!481426 () Bool)

(assert (=> b!719036 (=> (not res!481426) (not e!403569))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719036 (= res!481426 (validKeyInArray!0 (select (arr!19488 a!3186) j!159)))))

(declare-fun b!719037 () Bool)

(declare-fun res!481428 () Bool)

(assert (=> b!719037 (=> (not res!481428) (not e!403569))))

(assert (=> b!719037 (= res!481428 (and (= (size!19909 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19909 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19909 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719038 () Bool)

(declare-fun res!481430 () Bool)

(assert (=> b!719038 (=> (not res!481430) (not e!403569))))

(assert (=> b!719038 (= res!481430 (validKeyInArray!0 k!2102))))

(declare-fun res!481425 () Bool)

(assert (=> start!64030 (=> (not res!481425) (not e!403569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64030 (= res!481425 (validMask!0 mask!3328))))

(assert (=> start!64030 e!403569))

(assert (=> start!64030 true))

(declare-fun array_inv!15284 (array!40725) Bool)

(assert (=> start!64030 (array_inv!15284 a!3186)))

(declare-fun b!719039 () Bool)

(assert (=> b!719039 (= e!403571 false)))

(declare-fun lt!319523 () SeekEntryResult!7088)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40725 (_ BitVec 32)) SeekEntryResult!7088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719039 (= lt!319523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19488 a!3186) j!159) mask!3328) (select (arr!19488 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!719040 () Bool)

(declare-fun res!481432 () Bool)

(assert (=> b!719040 (=> (not res!481432) (not e!403571))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719040 (= res!481432 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19909 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19909 a!3186))))))

(assert (= (and start!64030 res!481425) b!719037))

(assert (= (and b!719037 res!481428) b!719036))

(assert (= (and b!719036 res!481426) b!719038))

(assert (= (and b!719038 res!481430) b!719033))

(assert (= (and b!719033 res!481427) b!719032))

(assert (= (and b!719032 res!481433) b!719035))

(assert (= (and b!719035 res!481431) b!719034))

(assert (= (and b!719034 res!481429) b!719040))

(assert (= (and b!719040 res!481432) b!719039))

(declare-fun m!674515 () Bool)

(assert (=> b!719033 m!674515))

(declare-fun m!674517 () Bool)

(assert (=> b!719039 m!674517))

(assert (=> b!719039 m!674517))

(declare-fun m!674519 () Bool)

(assert (=> b!719039 m!674519))

(assert (=> b!719039 m!674519))

(assert (=> b!719039 m!674517))

(declare-fun m!674521 () Bool)

(assert (=> b!719039 m!674521))

(declare-fun m!674523 () Bool)

(assert (=> b!719038 m!674523))

(assert (=> b!719036 m!674517))

(assert (=> b!719036 m!674517))

(declare-fun m!674525 () Bool)

(assert (=> b!719036 m!674525))

(declare-fun m!674527 () Bool)

(assert (=> b!719035 m!674527))

(declare-fun m!674529 () Bool)

(assert (=> b!719034 m!674529))

(declare-fun m!674531 () Bool)

(assert (=> start!64030 m!674531))

(declare-fun m!674533 () Bool)

(assert (=> start!64030 m!674533))

(declare-fun m!674535 () Bool)

(assert (=> b!719032 m!674535))

(push 1)

(assert (not b!719036))

