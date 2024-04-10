; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44284 () Bool)

(assert start!44284)

(declare-fun b!486977 () Bool)

(declare-fun res!290363 () Bool)

(declare-fun e!286605 () Bool)

(assert (=> b!486977 (=> (not res!290363) (not e!286605))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31535 0))(
  ( (array!31536 (arr!15161 (Array (_ BitVec 32) (_ BitVec 64))) (size!15525 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31535)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486977 (= res!290363 (and (= (size!15525 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15525 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15525 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290368 () Bool)

(assert (=> start!44284 (=> (not res!290368) (not e!286605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44284 (= res!290368 (validMask!0 mask!3524))))

(assert (=> start!44284 e!286605))

(assert (=> start!44284 true))

(declare-fun array_inv!10957 (array!31535) Bool)

(assert (=> start!44284 (array_inv!10957 a!3235)))

(declare-fun b!486978 () Bool)

(declare-fun res!290364 () Bool)

(assert (=> b!486978 (=> (not res!290364) (not e!286605))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486978 (= res!290364 (validKeyInArray!0 k!2280))))

(declare-fun b!486979 () Bool)

(declare-fun res!290369 () Bool)

(assert (=> b!486979 (=> (not res!290369) (not e!286605))))

(assert (=> b!486979 (= res!290369 (validKeyInArray!0 (select (arr!15161 a!3235) j!176)))))

(declare-fun b!486980 () Bool)

(declare-fun e!286604 () Bool)

(assert (=> b!486980 (= e!286604 false)))

(declare-fun lt!219909 () Bool)

(declare-datatypes ((List!9319 0))(
  ( (Nil!9316) (Cons!9315 (h!10171 (_ BitVec 64)) (t!15547 List!9319)) )
))
(declare-fun arrayNoDuplicates!0 (array!31535 (_ BitVec 32) List!9319) Bool)

(assert (=> b!486980 (= lt!219909 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9316))))

(declare-fun b!486981 () Bool)

(assert (=> b!486981 (= e!286605 e!286604)))

(declare-fun res!290365 () Bool)

(assert (=> b!486981 (=> (not res!290365) (not e!286604))))

(declare-datatypes ((SeekEntryResult!3628 0))(
  ( (MissingZero!3628 (index!16691 (_ BitVec 32))) (Found!3628 (index!16692 (_ BitVec 32))) (Intermediate!3628 (undefined!4440 Bool) (index!16693 (_ BitVec 32)) (x!45816 (_ BitVec 32))) (Undefined!3628) (MissingVacant!3628 (index!16694 (_ BitVec 32))) )
))
(declare-fun lt!219910 () SeekEntryResult!3628)

(assert (=> b!486981 (= res!290365 (or (= lt!219910 (MissingZero!3628 i!1204)) (= lt!219910 (MissingVacant!3628 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31535 (_ BitVec 32)) SeekEntryResult!3628)

(assert (=> b!486981 (= lt!219910 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486982 () Bool)

(declare-fun res!290367 () Bool)

(assert (=> b!486982 (=> (not res!290367) (not e!286604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31535 (_ BitVec 32)) Bool)

(assert (=> b!486982 (= res!290367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486983 () Bool)

(declare-fun res!290366 () Bool)

(assert (=> b!486983 (=> (not res!290366) (not e!286605))))

(declare-fun arrayContainsKey!0 (array!31535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486983 (= res!290366 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44284 res!290368) b!486977))

(assert (= (and b!486977 res!290363) b!486979))

(assert (= (and b!486979 res!290369) b!486978))

(assert (= (and b!486978 res!290364) b!486983))

(assert (= (and b!486983 res!290366) b!486981))

(assert (= (and b!486981 res!290365) b!486982))

(assert (= (and b!486982 res!290367) b!486980))

(declare-fun m!466839 () Bool)

(assert (=> b!486983 m!466839))

(declare-fun m!466841 () Bool)

(assert (=> b!486978 m!466841))

(declare-fun m!466843 () Bool)

(assert (=> start!44284 m!466843))

(declare-fun m!466845 () Bool)

(assert (=> start!44284 m!466845))

(declare-fun m!466847 () Bool)

(assert (=> b!486980 m!466847))

(declare-fun m!466849 () Bool)

(assert (=> b!486979 m!466849))

(assert (=> b!486979 m!466849))

(declare-fun m!466851 () Bool)

(assert (=> b!486979 m!466851))

(declare-fun m!466853 () Bool)

(assert (=> b!486981 m!466853))

(declare-fun m!466855 () Bool)

(assert (=> b!486982 m!466855))

(push 1)

(assert (not b!486979))

(assert (not b!486980))

(assert (not start!44284))

(assert (not b!486982))

(assert (not b!486978))

(assert (not b!486981))

(assert (not b!486983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

