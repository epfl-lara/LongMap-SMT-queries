; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64418 () Bool)

(assert start!64418)

(declare-fun b!723845 () Bool)

(declare-fun e!405561 () Bool)

(assert (=> b!723845 (= e!405561 (not true))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((array!40932 0))(
  ( (array!40933 (arr!19586 (Array (_ BitVec 32) (_ BitVec 64))) (size!20006 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40932)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40932 (_ BitVec 32)) Bool)

(assert (=> b!723845 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24681 0))(
  ( (Unit!24682) )
))
(declare-fun lt!320828 () Unit!24681)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24681)

(assert (=> b!723845 (= lt!320828 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723846 () Bool)

(declare-fun res!485259 () Bool)

(declare-fun e!405559 () Bool)

(assert (=> b!723846 (=> (not res!485259) (not e!405559))))

(assert (=> b!723846 (= res!485259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!723847 () Bool)

(declare-fun e!405562 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7142 0))(
  ( (MissingZero!7142 (index!30936 (_ BitVec 32))) (Found!7142 (index!30937 (_ BitVec 32))) (Intermediate!7142 (undefined!7954 Bool) (index!30938 (_ BitVec 32)) (x!62082 (_ BitVec 32))) (Undefined!7142) (MissingVacant!7142 (index!30939 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40932 (_ BitVec 32)) SeekEntryResult!7142)

(assert (=> b!723847 (= e!405562 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19586 a!3186) j!159) a!3186 mask!3328) (Found!7142 j!159)))))

(declare-fun lt!320827 () SeekEntryResult!7142)

(declare-fun b!723848 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40932 (_ BitVec 32)) SeekEntryResult!7142)

(assert (=> b!723848 (= e!405562 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19586 a!3186) j!159) a!3186 mask!3328) lt!320827))))

(declare-fun b!723849 () Bool)

(declare-fun e!405563 () Bool)

(assert (=> b!723849 (= e!405559 e!405563)))

(declare-fun res!485258 () Bool)

(assert (=> b!723849 (=> (not res!485258) (not e!405563))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723849 (= res!485258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19586 a!3186) j!159) mask!3328) (select (arr!19586 a!3186) j!159) a!3186 mask!3328) lt!320827))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723849 (= lt!320827 (Intermediate!7142 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723850 () Bool)

(assert (=> b!723850 (= e!405563 e!405561)))

(declare-fun res!485263 () Bool)

(assert (=> b!723850 (=> (not res!485263) (not e!405561))))

(declare-fun lt!320829 () (_ BitVec 64))

(declare-fun lt!320826 () array!40932)

(assert (=> b!723850 (= res!485263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320829 mask!3328) lt!320829 lt!320826 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320829 lt!320826 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!723850 (= lt!320829 (select (store (arr!19586 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723850 (= lt!320826 (array!40933 (store (arr!19586 a!3186) i!1173 k!2102) (size!20006 a!3186)))))

(declare-fun b!723851 () Bool)

(declare-fun res!485262 () Bool)

(assert (=> b!723851 (=> (not res!485262) (not e!405559))))

(declare-datatypes ((List!13495 0))(
  ( (Nil!13492) (Cons!13491 (h!14548 (_ BitVec 64)) (t!19802 List!13495)) )
))
(declare-fun arrayNoDuplicates!0 (array!40932 (_ BitVec 32) List!13495) Bool)

(assert (=> b!723851 (= res!485262 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13492))))

(declare-fun b!723852 () Bool)

(declare-fun res!485268 () Bool)

(assert (=> b!723852 (=> (not res!485268) (not e!405563))))

(assert (=> b!723852 (= res!485268 e!405562)))

(declare-fun c!79667 () Bool)

(assert (=> b!723852 (= c!79667 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!485261 () Bool)

(declare-fun e!405560 () Bool)

(assert (=> start!64418 (=> (not res!485261) (not e!405560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64418 (= res!485261 (validMask!0 mask!3328))))

(assert (=> start!64418 e!405560))

(assert (=> start!64418 true))

(declare-fun array_inv!15445 (array!40932) Bool)

(assert (=> start!64418 (array_inv!15445 a!3186)))

(declare-fun b!723853 () Bool)

(declare-fun res!485269 () Bool)

(assert (=> b!723853 (=> (not res!485269) (not e!405560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723853 (= res!485269 (validKeyInArray!0 (select (arr!19586 a!3186) j!159)))))

(declare-fun b!723854 () Bool)

(declare-fun res!485267 () Bool)

(assert (=> b!723854 (=> (not res!485267) (not e!405560))))

(assert (=> b!723854 (= res!485267 (and (= (size!20006 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20006 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20006 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723855 () Bool)

(declare-fun res!485264 () Bool)

(assert (=> b!723855 (=> (not res!485264) (not e!405560))))

(assert (=> b!723855 (= res!485264 (validKeyInArray!0 k!2102))))

(declare-fun b!723856 () Bool)

(assert (=> b!723856 (= e!405560 e!405559)))

(declare-fun res!485257 () Bool)

(assert (=> b!723856 (=> (not res!485257) (not e!405559))))

(declare-fun lt!320825 () SeekEntryResult!7142)

(assert (=> b!723856 (= res!485257 (or (= lt!320825 (MissingZero!7142 i!1173)) (= lt!320825 (MissingVacant!7142 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40932 (_ BitVec 32)) SeekEntryResult!7142)

(assert (=> b!723856 (= lt!320825 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!723857 () Bool)

(declare-fun res!485265 () Bool)

(assert (=> b!723857 (=> (not res!485265) (not e!405559))))

(assert (=> b!723857 (= res!485265 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20006 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20006 a!3186))))))

(declare-fun b!723858 () Bool)

(declare-fun res!485266 () Bool)

(assert (=> b!723858 (=> (not res!485266) (not e!405563))))

(assert (=> b!723858 (= res!485266 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19586 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723859 () Bool)

(declare-fun res!485260 () Bool)

(assert (=> b!723859 (=> (not res!485260) (not e!405560))))

(declare-fun arrayContainsKey!0 (array!40932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723859 (= res!485260 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64418 res!485261) b!723854))

(assert (= (and b!723854 res!485267) b!723853))

(assert (= (and b!723853 res!485269) b!723855))

(assert (= (and b!723855 res!485264) b!723859))

(assert (= (and b!723859 res!485260) b!723856))

(assert (= (and b!723856 res!485257) b!723846))

(assert (= (and b!723846 res!485259) b!723851))

(assert (= (and b!723851 res!485262) b!723857))

(assert (= (and b!723857 res!485265) b!723849))

(assert (= (and b!723849 res!485258) b!723858))

(assert (= (and b!723858 res!485266) b!723852))

(assert (= (and b!723852 c!79667) b!723848))

(assert (= (and b!723852 (not c!79667)) b!723847))

(assert (= (and b!723852 res!485268) b!723850))

(assert (= (and b!723850 res!485263) b!723845))

(declare-fun m!678801 () Bool)

(assert (=> b!723845 m!678801))

(declare-fun m!678803 () Bool)

(assert (=> b!723845 m!678803))

(declare-fun m!678805 () Bool)

(assert (=> b!723856 m!678805))

(declare-fun m!678807 () Bool)

(assert (=> b!723850 m!678807))

(declare-fun m!678809 () Bool)

(assert (=> b!723850 m!678809))

(declare-fun m!678811 () Bool)

(assert (=> b!723850 m!678811))

(declare-fun m!678813 () Bool)

(assert (=> b!723850 m!678813))

(assert (=> b!723850 m!678807))

(declare-fun m!678815 () Bool)

(assert (=> b!723850 m!678815))

(declare-fun m!678817 () Bool)

(assert (=> b!723853 m!678817))

(assert (=> b!723853 m!678817))

(declare-fun m!678819 () Bool)

(assert (=> b!723853 m!678819))

(declare-fun m!678821 () Bool)

(assert (=> b!723859 m!678821))

(declare-fun m!678823 () Bool)

(assert (=> start!64418 m!678823))

(declare-fun m!678825 () Bool)

(assert (=> start!64418 m!678825))

(declare-fun m!678827 () Bool)

(assert (=> b!723855 m!678827))

(assert (=> b!723849 m!678817))

(assert (=> b!723849 m!678817))

(declare-fun m!678829 () Bool)

(assert (=> b!723849 m!678829))

(assert (=> b!723849 m!678829))

(assert (=> b!723849 m!678817))

(declare-fun m!678831 () Bool)

(assert (=> b!723849 m!678831))

(assert (=> b!723847 m!678817))

(assert (=> b!723847 m!678817))

(declare-fun m!678833 () Bool)

(assert (=> b!723847 m!678833))

(declare-fun m!678835 () Bool)

(assert (=> b!723846 m!678835))

(assert (=> b!723848 m!678817))

(assert (=> b!723848 m!678817))

(declare-fun m!678837 () Bool)

(assert (=> b!723848 m!678837))

(declare-fun m!678839 () Bool)

(assert (=> b!723858 m!678839))

(declare-fun m!678841 () Bool)

(assert (=> b!723851 m!678841))

(push 1)

(assert (not b!723851))

(assert (not b!723850))

(assert (not b!723846))

(assert (not b!723853))

(assert (not b!723859))

(assert (not b!723845))

(assert (not b!723849))

(assert (not b!723855))

(assert (not b!723856))

(assert (not b!723848))

(assert (not start!64418))

(assert (not b!723847))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

