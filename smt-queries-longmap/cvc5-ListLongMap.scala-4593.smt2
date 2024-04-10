; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64072 () Bool)

(assert start!64072)

(declare-fun b!719619 () Bool)

(declare-fun e!403758 () Bool)

(declare-fun e!403759 () Bool)

(assert (=> b!719619 (= e!403758 e!403759)))

(declare-fun res!482019 () Bool)

(assert (=> b!719619 (=> (not res!482019) (not e!403759))))

(declare-datatypes ((SeekEntryResult!7109 0))(
  ( (MissingZero!7109 (index!30804 (_ BitVec 32))) (Found!7109 (index!30805 (_ BitVec 32))) (Intermediate!7109 (undefined!7921 Bool) (index!30806 (_ BitVec 32)) (x!61812 (_ BitVec 32))) (Undefined!7109) (MissingVacant!7109 (index!30807 (_ BitVec 32))) )
))
(declare-fun lt!319628 () SeekEntryResult!7109)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719619 (= res!482019 (or (= lt!319628 (MissingZero!7109 i!1173)) (= lt!319628 (MissingVacant!7109 i!1173))))))

(declare-datatypes ((array!40767 0))(
  ( (array!40768 (arr!19509 (Array (_ BitVec 32) (_ BitVec 64))) (size!19930 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40767)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40767 (_ BitVec 32)) SeekEntryResult!7109)

(assert (=> b!719619 (= lt!319628 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719620 () Bool)

(declare-fun res!482013 () Bool)

(assert (=> b!719620 (=> (not res!482013) (not e!403758))))

(declare-fun arrayContainsKey!0 (array!40767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719620 (= res!482013 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719621 () Bool)

(declare-fun res!482020 () Bool)

(assert (=> b!719621 (=> (not res!482020) (not e!403758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719621 (= res!482020 (validKeyInArray!0 k!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!719622 () Bool)

(assert (=> b!719622 (= e!403759 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19509 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719623 () Bool)

(declare-fun res!482017 () Bool)

(assert (=> b!719623 (=> (not res!482017) (not e!403759))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40767 (_ BitVec 32)) SeekEntryResult!7109)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719623 (= res!482017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19509 a!3186) j!159) mask!3328) (select (arr!19509 a!3186) j!159) a!3186 mask!3328) (Intermediate!7109 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719624 () Bool)

(declare-fun res!482016 () Bool)

(assert (=> b!719624 (=> (not res!482016) (not e!403759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40767 (_ BitVec 32)) Bool)

(assert (=> b!719624 (= res!482016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719625 () Bool)

(declare-fun res!482021 () Bool)

(assert (=> b!719625 (=> (not res!482021) (not e!403759))))

(assert (=> b!719625 (= res!482021 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19930 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19930 a!3186))))))

(declare-fun res!482012 () Bool)

(assert (=> start!64072 (=> (not res!482012) (not e!403758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64072 (= res!482012 (validMask!0 mask!3328))))

(assert (=> start!64072 e!403758))

(assert (=> start!64072 true))

(declare-fun array_inv!15305 (array!40767) Bool)

(assert (=> start!64072 (array_inv!15305 a!3186)))

(declare-fun b!719626 () Bool)

(declare-fun res!482015 () Bool)

(assert (=> b!719626 (=> (not res!482015) (not e!403758))))

(assert (=> b!719626 (= res!482015 (validKeyInArray!0 (select (arr!19509 a!3186) j!159)))))

(declare-fun b!719627 () Bool)

(declare-fun res!482014 () Bool)

(assert (=> b!719627 (=> (not res!482014) (not e!403758))))

(assert (=> b!719627 (= res!482014 (and (= (size!19930 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19930 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19930 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719628 () Bool)

(declare-fun res!482018 () Bool)

(assert (=> b!719628 (=> (not res!482018) (not e!403759))))

(declare-datatypes ((List!13511 0))(
  ( (Nil!13508) (Cons!13507 (h!14555 (_ BitVec 64)) (t!19826 List!13511)) )
))
(declare-fun arrayNoDuplicates!0 (array!40767 (_ BitVec 32) List!13511) Bool)

(assert (=> b!719628 (= res!482018 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13508))))

(assert (= (and start!64072 res!482012) b!719627))

(assert (= (and b!719627 res!482014) b!719626))

(assert (= (and b!719626 res!482015) b!719621))

(assert (= (and b!719621 res!482020) b!719620))

(assert (= (and b!719620 res!482013) b!719619))

(assert (= (and b!719619 res!482019) b!719624))

(assert (= (and b!719624 res!482016) b!719628))

(assert (= (and b!719628 res!482018) b!719625))

(assert (= (and b!719625 res!482021) b!719623))

(assert (= (and b!719623 res!482017) b!719622))

(declare-fun m!674989 () Bool)

(assert (=> b!719624 m!674989))

(declare-fun m!674991 () Bool)

(assert (=> start!64072 m!674991))

(declare-fun m!674993 () Bool)

(assert (=> start!64072 m!674993))

(declare-fun m!674995 () Bool)

(assert (=> b!719623 m!674995))

(assert (=> b!719623 m!674995))

(declare-fun m!674997 () Bool)

(assert (=> b!719623 m!674997))

(assert (=> b!719623 m!674997))

(assert (=> b!719623 m!674995))

(declare-fun m!674999 () Bool)

(assert (=> b!719623 m!674999))

(declare-fun m!675001 () Bool)

(assert (=> b!719628 m!675001))

(declare-fun m!675003 () Bool)

(assert (=> b!719619 m!675003))

(declare-fun m!675005 () Bool)

(assert (=> b!719621 m!675005))

(declare-fun m!675007 () Bool)

(assert (=> b!719622 m!675007))

(declare-fun m!675009 () Bool)

(assert (=> b!719620 m!675009))

(assert (=> b!719626 m!674995))

(assert (=> b!719626 m!674995))

(declare-fun m!675011 () Bool)

(assert (=> b!719626 m!675011))

(push 1)

(assert (not b!719624))

(assert (not b!719623))

(assert (not b!719620))

(assert (not b!719628))

(assert (not b!719626))

(assert (not b!719621))

(assert (not start!64072))

(assert (not b!719619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

