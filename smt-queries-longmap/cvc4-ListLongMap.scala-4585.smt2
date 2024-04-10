; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64028 () Bool)

(assert start!64028)

(declare-fun b!719004 () Bool)

(declare-fun res!481403 () Bool)

(declare-fun e!403560 () Bool)

(assert (=> b!719004 (=> (not res!481403) (not e!403560))))

(declare-datatypes ((array!40723 0))(
  ( (array!40724 (arr!19487 (Array (_ BitVec 32) (_ BitVec 64))) (size!19908 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40723)

(declare-datatypes ((List!13489 0))(
  ( (Nil!13486) (Cons!13485 (h!14533 (_ BitVec 64)) (t!19804 List!13489)) )
))
(declare-fun arrayNoDuplicates!0 (array!40723 (_ BitVec 32) List!13489) Bool)

(assert (=> b!719004 (= res!481403 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13486))))

(declare-fun b!719005 () Bool)

(declare-fun res!481400 () Bool)

(declare-fun e!403562 () Bool)

(assert (=> b!719005 (=> (not res!481400) (not e!403562))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719005 (= res!481400 (validKeyInArray!0 (select (arr!19487 a!3186) j!159)))))

(declare-fun res!481405 () Bool)

(assert (=> start!64028 (=> (not res!481405) (not e!403562))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64028 (= res!481405 (validMask!0 mask!3328))))

(assert (=> start!64028 e!403562))

(assert (=> start!64028 true))

(declare-fun array_inv!15283 (array!40723) Bool)

(assert (=> start!64028 (array_inv!15283 a!3186)))

(declare-fun b!719006 () Bool)

(declare-fun res!481401 () Bool)

(assert (=> b!719006 (=> (not res!481401) (not e!403562))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!719006 (= res!481401 (validKeyInArray!0 k!2102))))

(declare-fun b!719007 () Bool)

(declare-fun res!481399 () Bool)

(assert (=> b!719007 (=> (not res!481399) (not e!403560))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7087 0))(
  ( (MissingZero!7087 (index!30716 (_ BitVec 32))) (Found!7087 (index!30717 (_ BitVec 32))) (Intermediate!7087 (undefined!7899 Bool) (index!30718 (_ BitVec 32)) (x!61726 (_ BitVec 32))) (Undefined!7087) (MissingVacant!7087 (index!30719 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40723 (_ BitVec 32)) SeekEntryResult!7087)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719007 (= res!481399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19487 a!3186) j!159) mask!3328) (select (arr!19487 a!3186) j!159) a!3186 mask!3328) (Intermediate!7087 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719008 () Bool)

(declare-fun res!481402 () Bool)

(assert (=> b!719008 (=> (not res!481402) (not e!403562))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719008 (= res!481402 (and (= (size!19908 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19908 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19908 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719009 () Bool)

(declare-fun res!481404 () Bool)

(assert (=> b!719009 (=> (not res!481404) (not e!403562))))

(declare-fun arrayContainsKey!0 (array!40723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719009 (= res!481404 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719010 () Bool)

(declare-fun res!481398 () Bool)

(assert (=> b!719010 (=> (not res!481398) (not e!403560))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719010 (= res!481398 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19908 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19908 a!3186))))))

(declare-fun b!719011 () Bool)

(declare-fun res!481406 () Bool)

(assert (=> b!719011 (=> (not res!481406) (not e!403560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40723 (_ BitVec 32)) Bool)

(assert (=> b!719011 (= res!481406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719012 () Bool)

(assert (=> b!719012 (= e!403562 e!403560)))

(declare-fun res!481397 () Bool)

(assert (=> b!719012 (=> (not res!481397) (not e!403560))))

(declare-fun lt!319517 () SeekEntryResult!7087)

(assert (=> b!719012 (= res!481397 (or (= lt!319517 (MissingZero!7087 i!1173)) (= lt!319517 (MissingVacant!7087 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40723 (_ BitVec 32)) SeekEntryResult!7087)

(assert (=> b!719012 (= lt!319517 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719013 () Bool)

(assert (=> b!719013 (= e!403560 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19487 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(assert (= (and start!64028 res!481405) b!719008))

(assert (= (and b!719008 res!481402) b!719005))

(assert (= (and b!719005 res!481400) b!719006))

(assert (= (and b!719006 res!481401) b!719009))

(assert (= (and b!719009 res!481404) b!719012))

(assert (= (and b!719012 res!481397) b!719011))

(assert (= (and b!719011 res!481406) b!719004))

(assert (= (and b!719004 res!481403) b!719010))

(assert (= (and b!719010 res!481398) b!719007))

(assert (= (and b!719007 res!481399) b!719013))

(declare-fun m!674491 () Bool)

(assert (=> b!719007 m!674491))

(assert (=> b!719007 m!674491))

(declare-fun m!674493 () Bool)

(assert (=> b!719007 m!674493))

(assert (=> b!719007 m!674493))

(assert (=> b!719007 m!674491))

(declare-fun m!674495 () Bool)

(assert (=> b!719007 m!674495))

(declare-fun m!674497 () Bool)

(assert (=> b!719006 m!674497))

(declare-fun m!674499 () Bool)

(assert (=> b!719012 m!674499))

(declare-fun m!674501 () Bool)

(assert (=> b!719009 m!674501))

(declare-fun m!674503 () Bool)

(assert (=> b!719013 m!674503))

(declare-fun m!674505 () Bool)

(assert (=> b!719004 m!674505))

(assert (=> b!719005 m!674491))

(assert (=> b!719005 m!674491))

(declare-fun m!674507 () Bool)

(assert (=> b!719005 m!674507))

(declare-fun m!674509 () Bool)

(assert (=> start!64028 m!674509))

(declare-fun m!674511 () Bool)

(assert (=> start!64028 m!674511))

(declare-fun m!674513 () Bool)

(assert (=> b!719011 m!674513))

(push 1)

(assert (not b!719005))

(assert (not start!64028))

(assert (not b!719012))

(assert (not b!719011))

(assert (not b!719009))

(assert (not b!719004))

(assert (not b!719007))

(assert (not b!719006))

(check-sat)

