; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64190 () Bool)

(assert start!64190)

(declare-fun b!720953 () Bool)

(declare-fun res!483053 () Bool)

(declare-fun e!404306 () Bool)

(assert (=> b!720953 (=> (not res!483053) (not e!404306))))

(declare-datatypes ((array!40828 0))(
  ( (array!40829 (arr!19538 (Array (_ BitVec 32) (_ BitVec 64))) (size!19959 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40828)

(declare-datatypes ((List!13540 0))(
  ( (Nil!13537) (Cons!13536 (h!14587 (_ BitVec 64)) (t!19855 List!13540)) )
))
(declare-fun arrayNoDuplicates!0 (array!40828 (_ BitVec 32) List!13540) Bool)

(assert (=> b!720953 (= res!483053 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13537))))

(declare-fun b!720954 () Bool)

(declare-fun res!483046 () Bool)

(assert (=> b!720954 (=> (not res!483046) (not e!404306))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720954 (= res!483046 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19959 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19959 a!3186))))))

(declare-fun b!720955 () Bool)

(declare-fun res!483048 () Bool)

(assert (=> b!720955 (=> (not res!483048) (not e!404306))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40828 (_ BitVec 32)) Bool)

(assert (=> b!720955 (= res!483048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720956 () Bool)

(declare-fun res!483045 () Bool)

(declare-fun e!404305 () Bool)

(assert (=> b!720956 (=> (not res!483045) (not e!404305))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720956 (= res!483045 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720957 () Bool)

(declare-fun res!483049 () Bool)

(assert (=> b!720957 (=> (not res!483049) (not e!404305))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720957 (= res!483049 (validKeyInArray!0 (select (arr!19538 a!3186) j!159)))))

(declare-fun b!720958 () Bool)

(declare-fun res!483051 () Bool)

(declare-fun e!404302 () Bool)

(assert (=> b!720958 (=> (not res!483051) (not e!404302))))

(declare-fun e!404304 () Bool)

(assert (=> b!720958 (= res!483051 e!404304)))

(declare-fun c!79324 () Bool)

(assert (=> b!720958 (= c!79324 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!483056 () Bool)

(assert (=> start!64190 (=> (not res!483056) (not e!404305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64190 (= res!483056 (validMask!0 mask!3328))))

(assert (=> start!64190 e!404305))

(assert (=> start!64190 true))

(declare-fun array_inv!15334 (array!40828) Bool)

(assert (=> start!64190 (array_inv!15334 a!3186)))

(declare-fun b!720959 () Bool)

(declare-fun res!483052 () Bool)

(assert (=> b!720959 (=> (not res!483052) (not e!404302))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720959 (= res!483052 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19538 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720960 () Bool)

(declare-datatypes ((SeekEntryResult!7138 0))(
  ( (MissingZero!7138 (index!30920 (_ BitVec 32))) (Found!7138 (index!30921 (_ BitVec 32))) (Intermediate!7138 (undefined!7950 Bool) (index!30922 (_ BitVec 32)) (x!61922 (_ BitVec 32))) (Undefined!7138) (MissingVacant!7138 (index!30923 (_ BitVec 32))) )
))
(declare-fun lt!319926 () SeekEntryResult!7138)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40828 (_ BitVec 32)) SeekEntryResult!7138)

(assert (=> b!720960 (= e!404304 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19538 a!3186) j!159) a!3186 mask!3328) lt!319926))))

(declare-fun b!720961 () Bool)

(assert (=> b!720961 (= e!404305 e!404306)))

(declare-fun res!483050 () Bool)

(assert (=> b!720961 (=> (not res!483050) (not e!404306))))

(declare-fun lt!319928 () SeekEntryResult!7138)

(assert (=> b!720961 (= res!483050 (or (= lt!319928 (MissingZero!7138 i!1173)) (= lt!319928 (MissingVacant!7138 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40828 (_ BitVec 32)) SeekEntryResult!7138)

(assert (=> b!720961 (= lt!319928 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720962 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40828 (_ BitVec 32)) SeekEntryResult!7138)

(assert (=> b!720962 (= e!404304 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19538 a!3186) j!159) a!3186 mask!3328) (Found!7138 j!159)))))

(declare-fun b!720963 () Bool)

(declare-fun res!483054 () Bool)

(assert (=> b!720963 (=> (not res!483054) (not e!404305))))

(assert (=> b!720963 (= res!483054 (validKeyInArray!0 k!2102))))

(declare-fun b!720964 () Bool)

(declare-fun res!483047 () Bool)

(assert (=> b!720964 (=> (not res!483047) (not e!404305))))

(assert (=> b!720964 (= res!483047 (and (= (size!19959 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19959 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19959 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720965 () Bool)

(assert (=> b!720965 (= e!404302 false)))

(declare-fun lt!319927 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720965 (= lt!319927 (toIndex!0 (select (store (arr!19538 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!720966 () Bool)

(assert (=> b!720966 (= e!404306 e!404302)))

(declare-fun res!483055 () Bool)

(assert (=> b!720966 (=> (not res!483055) (not e!404302))))

(assert (=> b!720966 (= res!483055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19538 a!3186) j!159) mask!3328) (select (arr!19538 a!3186) j!159) a!3186 mask!3328) lt!319926))))

(assert (=> b!720966 (= lt!319926 (Intermediate!7138 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64190 res!483056) b!720964))

(assert (= (and b!720964 res!483047) b!720957))

(assert (= (and b!720957 res!483049) b!720963))

(assert (= (and b!720963 res!483054) b!720956))

(assert (= (and b!720956 res!483045) b!720961))

(assert (= (and b!720961 res!483050) b!720955))

(assert (= (and b!720955 res!483048) b!720953))

(assert (= (and b!720953 res!483053) b!720954))

(assert (= (and b!720954 res!483046) b!720966))

(assert (= (and b!720966 res!483055) b!720959))

(assert (= (and b!720959 res!483052) b!720958))

(assert (= (and b!720958 c!79324) b!720960))

(assert (= (and b!720958 (not c!79324)) b!720962))

(assert (= (and b!720958 res!483051) b!720965))

(declare-fun m!675933 () Bool)

(assert (=> b!720956 m!675933))

(declare-fun m!675935 () Bool)

(assert (=> b!720963 m!675935))

(declare-fun m!675937 () Bool)

(assert (=> start!64190 m!675937))

(declare-fun m!675939 () Bool)

(assert (=> start!64190 m!675939))

(declare-fun m!675941 () Bool)

(assert (=> b!720959 m!675941))

(declare-fun m!675943 () Bool)

(assert (=> b!720960 m!675943))

(assert (=> b!720960 m!675943))

(declare-fun m!675945 () Bool)

(assert (=> b!720960 m!675945))

(assert (=> b!720957 m!675943))

(assert (=> b!720957 m!675943))

(declare-fun m!675947 () Bool)

(assert (=> b!720957 m!675947))

(assert (=> b!720966 m!675943))

(assert (=> b!720966 m!675943))

(declare-fun m!675949 () Bool)

(assert (=> b!720966 m!675949))

(assert (=> b!720966 m!675949))

(assert (=> b!720966 m!675943))

(declare-fun m!675951 () Bool)

(assert (=> b!720966 m!675951))

(declare-fun m!675953 () Bool)

(assert (=> b!720953 m!675953))

(declare-fun m!675955 () Bool)

(assert (=> b!720965 m!675955))

(declare-fun m!675957 () Bool)

(assert (=> b!720965 m!675957))

(assert (=> b!720965 m!675957))

(declare-fun m!675959 () Bool)

(assert (=> b!720965 m!675959))

(declare-fun m!675961 () Bool)

(assert (=> b!720961 m!675961))

(assert (=> b!720962 m!675943))

(assert (=> b!720962 m!675943))

(declare-fun m!675963 () Bool)

(assert (=> b!720962 m!675963))

(declare-fun m!675965 () Bool)

(assert (=> b!720955 m!675965))

(push 1)

(assert (not b!720962))

(assert (not b!720955))

(assert (not b!720965))

(assert (not b!720956))

(assert (not b!720963))

(assert (not b!720961))

(assert (not b!720953))

