; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32000 () Bool)

(assert start!32000)

(declare-fun b!319537 () Bool)

(declare-fun e!198448 () Bool)

(declare-datatypes ((array!16307 0))(
  ( (array!16308 (arr!7717 (Array (_ BitVec 32) (_ BitVec 64))) (size!8069 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16307)

(assert (=> b!319537 (= e!198448 (bvsgt #b00000000000000000000000000000000 (size!8069 a!3305)))))

(declare-fun b!319538 () Bool)

(declare-fun res!173922 () Bool)

(assert (=> b!319538 (=> (not res!173922) (not e!198448))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319538 (= res!173922 (and (= (size!8069 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8069 a!3305))))))

(declare-fun b!319539 () Bool)

(declare-fun res!173923 () Bool)

(assert (=> b!319539 (=> (not res!173923) (not e!198448))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319539 (= res!173923 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173924 () Bool)

(assert (=> start!32000 (=> (not res!173924) (not e!198448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32000 (= res!173924 (validMask!0 mask!3777))))

(assert (=> start!32000 e!198448))

(assert (=> start!32000 true))

(declare-fun array_inv!5680 (array!16307) Bool)

(assert (=> start!32000 (array_inv!5680 a!3305)))

(declare-fun b!319540 () Bool)

(declare-fun res!173925 () Bool)

(assert (=> b!319540 (=> (not res!173925) (not e!198448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319540 (= res!173925 (validKeyInArray!0 k!2497))))

(declare-fun b!319541 () Bool)

(declare-fun res!173921 () Bool)

(assert (=> b!319541 (=> (not res!173921) (not e!198448))))

(declare-datatypes ((SeekEntryResult!2848 0))(
  ( (MissingZero!2848 (index!13568 (_ BitVec 32))) (Found!2848 (index!13569 (_ BitVec 32))) (Intermediate!2848 (undefined!3660 Bool) (index!13570 (_ BitVec 32)) (x!31842 (_ BitVec 32))) (Undefined!2848) (MissingVacant!2848 (index!13571 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16307 (_ BitVec 32)) SeekEntryResult!2848)

(assert (=> b!319541 (= res!173921 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2848 i!1250)))))

(assert (= (and start!32000 res!173924) b!319538))

(assert (= (and b!319538 res!173922) b!319540))

(assert (= (and b!319540 res!173925) b!319539))

(assert (= (and b!319539 res!173923) b!319541))

(assert (= (and b!319541 res!173921) b!319537))

(declare-fun m!328117 () Bool)

(assert (=> b!319539 m!328117))

(declare-fun m!328119 () Bool)

(assert (=> start!32000 m!328119))

(declare-fun m!328121 () Bool)

(assert (=> start!32000 m!328121))

(declare-fun m!328123 () Bool)

(assert (=> b!319540 m!328123))

(declare-fun m!328125 () Bool)

(assert (=> b!319541 m!328125))

(push 1)

(assert (not b!319540))

(assert (not b!319539))

(assert (not b!319541))

(assert (not start!32000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

