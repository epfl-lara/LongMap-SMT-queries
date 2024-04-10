; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64294 () Bool)

(assert start!64294)

(declare-fun res!483931 () Bool)

(declare-fun e!404837 () Bool)

(assert (=> start!64294 (=> (not res!483931) (not e!404837))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64294 (= res!483931 (validMask!0 mask!3328))))

(assert (=> start!64294 e!404837))

(assert (=> start!64294 true))

(declare-datatypes ((array!40875 0))(
  ( (array!40876 (arr!19560 (Array (_ BitVec 32) (_ BitVec 64))) (size!19981 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40875)

(declare-fun array_inv!15356 (array!40875) Bool)

(assert (=> start!64294 (array_inv!15356 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722181 () Bool)

(declare-fun e!404840 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7160 0))(
  ( (MissingZero!7160 (index!31008 (_ BitVec 32))) (Found!7160 (index!31009 (_ BitVec 32))) (Intermediate!7160 (undefined!7972 Bool) (index!31010 (_ BitVec 32)) (x!62017 (_ BitVec 32))) (Undefined!7160) (MissingVacant!7160 (index!31011 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40875 (_ BitVec 32)) SeekEntryResult!7160)

(assert (=> b!722181 (= e!404840 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19560 a!3186) j!159) a!3186 mask!3328) (Found!7160 j!159))))))

(declare-fun b!722182 () Bool)

(declare-fun res!483934 () Bool)

(assert (=> b!722182 (=> (not res!483934) (not e!404837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722182 (= res!483934 (validKeyInArray!0 (select (arr!19560 a!3186) j!159)))))

(declare-fun b!722183 () Bool)

(declare-fun res!483928 () Bool)

(assert (=> b!722183 (=> (not res!483928) (not e!404837))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722183 (= res!483928 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722184 () Bool)

(declare-fun res!483935 () Bool)

(assert (=> b!722184 (=> (not res!483935) (not e!404837))))

(assert (=> b!722184 (= res!483935 (validKeyInArray!0 k!2102))))

(declare-fun b!722185 () Bool)

(declare-fun e!404838 () Bool)

(assert (=> b!722185 (= e!404837 e!404838)))

(declare-fun res!483938 () Bool)

(assert (=> b!722185 (=> (not res!483938) (not e!404838))))

(declare-fun lt!320226 () SeekEntryResult!7160)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722185 (= res!483938 (or (= lt!320226 (MissingZero!7160 i!1173)) (= lt!320226 (MissingVacant!7160 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40875 (_ BitVec 32)) SeekEntryResult!7160)

(assert (=> b!722185 (= lt!320226 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722186 () Bool)

(declare-fun lt!320228 () SeekEntryResult!7160)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40875 (_ BitVec 32)) SeekEntryResult!7160)

(assert (=> b!722186 (= e!404840 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19560 a!3186) j!159) a!3186 mask!3328) lt!320228)))))

(declare-fun b!722187 () Bool)

(declare-fun res!483937 () Bool)

(assert (=> b!722187 (=> (not res!483937) (not e!404838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40875 (_ BitVec 32)) Bool)

(assert (=> b!722187 (= res!483937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722188 () Bool)

(declare-fun res!483929 () Bool)

(assert (=> b!722188 (=> (not res!483929) (not e!404837))))

(assert (=> b!722188 (= res!483929 (and (= (size!19981 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19981 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19981 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722189 () Bool)

(declare-fun res!483932 () Bool)

(declare-fun e!404836 () Bool)

(assert (=> b!722189 (=> (not res!483932) (not e!404836))))

(assert (=> b!722189 (= res!483932 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19560 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722190 () Bool)

(declare-fun res!483930 () Bool)

(assert (=> b!722190 (=> (not res!483930) (not e!404838))))

(declare-datatypes ((List!13562 0))(
  ( (Nil!13559) (Cons!13558 (h!14612 (_ BitVec 64)) (t!19877 List!13562)) )
))
(declare-fun arrayNoDuplicates!0 (array!40875 (_ BitVec 32) List!13562) Bool)

(assert (=> b!722190 (= res!483930 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13559))))

(declare-fun b!722191 () Bool)

(assert (=> b!722191 (= e!404838 e!404836)))

(declare-fun res!483936 () Bool)

(assert (=> b!722191 (=> (not res!483936) (not e!404836))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722191 (= res!483936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19560 a!3186) j!159) mask!3328) (select (arr!19560 a!3186) j!159) a!3186 mask!3328) lt!320228))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722191 (= lt!320228 (Intermediate!7160 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722192 () Bool)

(declare-fun res!483933 () Bool)

(assert (=> b!722192 (=> (not res!483933) (not e!404838))))

(assert (=> b!722192 (= res!483933 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19981 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19981 a!3186))))))

(declare-fun b!722193 () Bool)

(assert (=> b!722193 (= e!404836 false)))

(declare-fun lt!320227 () Bool)

(assert (=> b!722193 (= lt!320227 e!404840)))

(declare-fun c!79498 () Bool)

(assert (=> b!722193 (= c!79498 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64294 res!483931) b!722188))

(assert (= (and b!722188 res!483929) b!722182))

(assert (= (and b!722182 res!483934) b!722184))

(assert (= (and b!722184 res!483935) b!722183))

(assert (= (and b!722183 res!483928) b!722185))

(assert (= (and b!722185 res!483938) b!722187))

(assert (= (and b!722187 res!483937) b!722190))

(assert (= (and b!722190 res!483930) b!722192))

(assert (= (and b!722192 res!483933) b!722191))

(assert (= (and b!722191 res!483936) b!722189))

(assert (= (and b!722189 res!483932) b!722193))

(assert (= (and b!722193 c!79498) b!722186))

(assert (= (and b!722193 (not c!79498)) b!722181))

(declare-fun m!676777 () Bool)

(assert (=> b!722183 m!676777))

(declare-fun m!676779 () Bool)

(assert (=> b!722185 m!676779))

(declare-fun m!676781 () Bool)

(assert (=> b!722190 m!676781))

(declare-fun m!676783 () Bool)

(assert (=> b!722189 m!676783))

(declare-fun m!676785 () Bool)

(assert (=> b!722191 m!676785))

(assert (=> b!722191 m!676785))

(declare-fun m!676787 () Bool)

(assert (=> b!722191 m!676787))

(assert (=> b!722191 m!676787))

(assert (=> b!722191 m!676785))

(declare-fun m!676789 () Bool)

(assert (=> b!722191 m!676789))

(declare-fun m!676791 () Bool)

(assert (=> b!722184 m!676791))

(assert (=> b!722182 m!676785))

(assert (=> b!722182 m!676785))

(declare-fun m!676793 () Bool)

(assert (=> b!722182 m!676793))

(assert (=> b!722181 m!676785))

(assert (=> b!722181 m!676785))

(declare-fun m!676795 () Bool)

(assert (=> b!722181 m!676795))

(declare-fun m!676797 () Bool)

(assert (=> b!722187 m!676797))

(declare-fun m!676799 () Bool)

(assert (=> start!64294 m!676799))

(declare-fun m!676801 () Bool)

(assert (=> start!64294 m!676801))

(assert (=> b!722186 m!676785))

(assert (=> b!722186 m!676785))

(declare-fun m!676803 () Bool)

(assert (=> b!722186 m!676803))

(push 1)

