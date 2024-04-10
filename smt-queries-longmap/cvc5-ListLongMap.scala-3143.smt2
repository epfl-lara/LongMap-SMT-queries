; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44280 () Bool)

(assert start!44280)

(declare-fun b!486935 () Bool)

(declare-fun res!290323 () Bool)

(declare-fun e!286587 () Bool)

(assert (=> b!486935 (=> (not res!290323) (not e!286587))))

(declare-datatypes ((array!31531 0))(
  ( (array!31532 (arr!15159 (Array (_ BitVec 32) (_ BitVec 64))) (size!15523 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31531)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31531 (_ BitVec 32)) Bool)

(assert (=> b!486935 (= res!290323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486936 () Bool)

(declare-fun e!286586 () Bool)

(assert (=> b!486936 (= e!286586 e!286587)))

(declare-fun res!290326 () Bool)

(assert (=> b!486936 (=> (not res!290326) (not e!286587))))

(declare-datatypes ((SeekEntryResult!3626 0))(
  ( (MissingZero!3626 (index!16683 (_ BitVec 32))) (Found!3626 (index!16684 (_ BitVec 32))) (Intermediate!3626 (undefined!4438 Bool) (index!16685 (_ BitVec 32)) (x!45814 (_ BitVec 32))) (Undefined!3626) (MissingVacant!3626 (index!16686 (_ BitVec 32))) )
))
(declare-fun lt!219897 () SeekEntryResult!3626)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486936 (= res!290326 (or (= lt!219897 (MissingZero!3626 i!1204)) (= lt!219897 (MissingVacant!3626 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31531 (_ BitVec 32)) SeekEntryResult!3626)

(assert (=> b!486936 (= lt!219897 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486937 () Bool)

(declare-fun res!290321 () Bool)

(assert (=> b!486937 (=> (not res!290321) (not e!286586))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486937 (= res!290321 (validKeyInArray!0 (select (arr!15159 a!3235) j!176)))))

(declare-fun b!486938 () Bool)

(declare-fun res!290325 () Bool)

(assert (=> b!486938 (=> (not res!290325) (not e!286586))))

(assert (=> b!486938 (= res!290325 (and (= (size!15523 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15523 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15523 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486939 () Bool)

(declare-fun res!290324 () Bool)

(assert (=> b!486939 (=> (not res!290324) (not e!286586))))

(assert (=> b!486939 (= res!290324 (validKeyInArray!0 k!2280))))

(declare-fun b!486940 () Bool)

(declare-fun res!290327 () Bool)

(assert (=> b!486940 (=> (not res!290327) (not e!286586))))

(declare-fun arrayContainsKey!0 (array!31531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486940 (= res!290327 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290322 () Bool)

(assert (=> start!44280 (=> (not res!290322) (not e!286586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44280 (= res!290322 (validMask!0 mask!3524))))

(assert (=> start!44280 e!286586))

(assert (=> start!44280 true))

(declare-fun array_inv!10955 (array!31531) Bool)

(assert (=> start!44280 (array_inv!10955 a!3235)))

(declare-fun b!486941 () Bool)

(assert (=> b!486941 (= e!286587 false)))

(declare-fun lt!219898 () Bool)

(declare-datatypes ((List!9317 0))(
  ( (Nil!9314) (Cons!9313 (h!10169 (_ BitVec 64)) (t!15545 List!9317)) )
))
(declare-fun arrayNoDuplicates!0 (array!31531 (_ BitVec 32) List!9317) Bool)

(assert (=> b!486941 (= lt!219898 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9314))))

(assert (= (and start!44280 res!290322) b!486938))

(assert (= (and b!486938 res!290325) b!486937))

(assert (= (and b!486937 res!290321) b!486939))

(assert (= (and b!486939 res!290324) b!486940))

(assert (= (and b!486940 res!290327) b!486936))

(assert (= (and b!486936 res!290326) b!486935))

(assert (= (and b!486935 res!290323) b!486941))

(declare-fun m!466803 () Bool)

(assert (=> b!486935 m!466803))

(declare-fun m!466805 () Bool)

(assert (=> start!44280 m!466805))

(declare-fun m!466807 () Bool)

(assert (=> start!44280 m!466807))

(declare-fun m!466809 () Bool)

(assert (=> b!486940 m!466809))

(declare-fun m!466811 () Bool)

(assert (=> b!486937 m!466811))

(assert (=> b!486937 m!466811))

(declare-fun m!466813 () Bool)

(assert (=> b!486937 m!466813))

(declare-fun m!466815 () Bool)

(assert (=> b!486936 m!466815))

(declare-fun m!466817 () Bool)

(assert (=> b!486939 m!466817))

(declare-fun m!466819 () Bool)

(assert (=> b!486941 m!466819))

(push 1)

(assert (not start!44280))

(assert (not b!486936))

(assert (not b!486935))

(assert (not b!486940))

