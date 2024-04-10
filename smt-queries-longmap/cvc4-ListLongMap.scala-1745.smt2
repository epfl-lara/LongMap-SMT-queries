; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31994 () Bool)

(assert start!31994)

(declare-fun b!319495 () Bool)

(declare-fun res!173877 () Bool)

(declare-fun e!198430 () Bool)

(assert (=> b!319495 (=> (not res!173877) (not e!198430))))

(declare-datatypes ((array!16301 0))(
  ( (array!16302 (arr!7714 (Array (_ BitVec 32) (_ BitVec 64))) (size!8066 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16301)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319495 (= res!173877 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319496 () Bool)

(assert (=> b!319496 (= e!198430 false)))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2845 0))(
  ( (MissingZero!2845 (index!13556 (_ BitVec 32))) (Found!2845 (index!13557 (_ BitVec 32))) (Intermediate!2845 (undefined!3657 Bool) (index!13558 (_ BitVec 32)) (x!31831 (_ BitVec 32))) (Undefined!2845) (MissingVacant!2845 (index!13559 (_ BitVec 32))) )
))
(declare-fun lt!155814 () SeekEntryResult!2845)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16301 (_ BitVec 32)) SeekEntryResult!2845)

(assert (=> b!319496 (= lt!155814 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun res!173879 () Bool)

(assert (=> start!31994 (=> (not res!173879) (not e!198430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31994 (= res!173879 (validMask!0 mask!3777))))

(assert (=> start!31994 e!198430))

(assert (=> start!31994 true))

(declare-fun array_inv!5677 (array!16301) Bool)

(assert (=> start!31994 (array_inv!5677 a!3305)))

(declare-fun b!319493 () Bool)

(declare-fun res!173878 () Bool)

(assert (=> b!319493 (=> (not res!173878) (not e!198430))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319493 (= res!173878 (and (= (size!8066 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8066 a!3305))))))

(declare-fun b!319494 () Bool)

(declare-fun res!173880 () Bool)

(assert (=> b!319494 (=> (not res!173880) (not e!198430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319494 (= res!173880 (validKeyInArray!0 k!2497))))

(assert (= (and start!31994 res!173879) b!319493))

(assert (= (and b!319493 res!173878) b!319494))

(assert (= (and b!319494 res!173880) b!319495))

(assert (= (and b!319495 res!173877) b!319496))

(declare-fun m!328087 () Bool)

(assert (=> b!319495 m!328087))

(declare-fun m!328089 () Bool)

(assert (=> b!319496 m!328089))

(declare-fun m!328091 () Bool)

(assert (=> start!31994 m!328091))

(declare-fun m!328093 () Bool)

(assert (=> start!31994 m!328093))

(declare-fun m!328095 () Bool)

(assert (=> b!319494 m!328095))

(push 1)

(assert (not b!319495))

(assert (not start!31994))

(assert (not b!319496))

(assert (not b!319494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

