; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63766 () Bool)

(assert start!63766)

(declare-fun res!480019 () Bool)

(declare-fun e!402837 () Bool)

(assert (=> start!63766 (=> (not res!480019) (not e!402837))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63766 (= res!480019 (validMask!0 mask!3328))))

(assert (=> start!63766 e!402837))

(declare-datatypes ((array!40595 0))(
  ( (array!40596 (arr!19428 (Array (_ BitVec 32) (_ BitVec 64))) (size!19848 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40595)

(declare-fun array_inv!15287 (array!40595) Bool)

(assert (=> start!63766 (array_inv!15287 a!3186)))

(assert (=> start!63766 true))

(declare-fun b!717378 () Bool)

(declare-fun res!480018 () Bool)

(assert (=> b!717378 (=> (not res!480018) (not e!402837))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717378 (= res!480018 (validKeyInArray!0 k!2102))))

(declare-fun b!717379 () Bool)

(declare-fun res!480017 () Bool)

(assert (=> b!717379 (=> (not res!480017) (not e!402837))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717379 (= res!480017 (validKeyInArray!0 (select (arr!19428 a!3186) j!159)))))

(declare-fun b!717380 () Bool)

(assert (=> b!717380 (= e!402837 false)))

(declare-datatypes ((SeekEntryResult!6984 0))(
  ( (MissingZero!6984 (index!30304 (_ BitVec 32))) (Found!6984 (index!30305 (_ BitVec 32))) (Intermediate!6984 (undefined!7796 Bool) (index!30306 (_ BitVec 32)) (x!61479 (_ BitVec 32))) (Undefined!6984) (MissingVacant!6984 (index!30307 (_ BitVec 32))) )
))
(declare-fun lt!319122 () SeekEntryResult!6984)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40595 (_ BitVec 32)) SeekEntryResult!6984)

(assert (=> b!717380 (= lt!319122 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717381 () Bool)

(declare-fun res!480015 () Bool)

(assert (=> b!717381 (=> (not res!480015) (not e!402837))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717381 (= res!480015 (and (= (size!19848 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19848 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19848 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717382 () Bool)

(declare-fun res!480016 () Bool)

(assert (=> b!717382 (=> (not res!480016) (not e!402837))))

(declare-fun arrayContainsKey!0 (array!40595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717382 (= res!480016 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!63766 res!480019) b!717381))

(assert (= (and b!717381 res!480015) b!717379))

(assert (= (and b!717379 res!480017) b!717378))

(assert (= (and b!717378 res!480018) b!717382))

(assert (= (and b!717382 res!480016) b!717380))

(declare-fun m!673861 () Bool)

(assert (=> start!63766 m!673861))

(declare-fun m!673863 () Bool)

(assert (=> start!63766 m!673863))

(declare-fun m!673865 () Bool)

(assert (=> b!717380 m!673865))

(declare-fun m!673867 () Bool)

(assert (=> b!717378 m!673867))

(declare-fun m!673869 () Bool)

(assert (=> b!717379 m!673869))

(assert (=> b!717379 m!673869))

(declare-fun m!673871 () Bool)

(assert (=> b!717379 m!673871))

(declare-fun m!673873 () Bool)

(assert (=> b!717382 m!673873))

(push 1)

(assert (not b!717379))

(assert (not b!717380))

(assert (not start!63766))

(assert (not b!717382))

(assert (not b!717378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

