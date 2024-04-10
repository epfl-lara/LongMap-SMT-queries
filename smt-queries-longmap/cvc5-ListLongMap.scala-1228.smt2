; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25926 () Bool)

(assert start!25926)

(declare-fun b!267718 () Bool)

(declare-fun res!132000 () Bool)

(declare-fun e!173063 () Bool)

(assert (=> b!267718 (=> (not res!132000) (not e!173063))))

(declare-datatypes ((array!13023 0))(
  ( (array!13024 (arr!6161 (Array (_ BitVec 32) (_ BitVec 64))) (size!6513 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13023)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267718 (= res!132000 (and (= (size!6513 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6513 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6513 a!3325))))))

(declare-fun b!267719 () Bool)

(declare-fun res!131997 () Bool)

(assert (=> b!267719 (=> (not res!131997) (not e!173063))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267719 (= res!131997 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267720 () Bool)

(declare-fun res!131999 () Bool)

(assert (=> b!267720 (=> (not res!131999) (not e!173063))))

(declare-datatypes ((List!3969 0))(
  ( (Nil!3966) (Cons!3965 (h!4632 (_ BitVec 64)) (t!9051 List!3969)) )
))
(declare-fun arrayNoDuplicates!0 (array!13023 (_ BitVec 32) List!3969) Bool)

(assert (=> b!267720 (= res!131999 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3966))))

(declare-fun b!267721 () Bool)

(assert (=> b!267721 (= e!173063 (bvslt mask!3868 #b00000000000000000000000000000000))))

(declare-fun res!131998 () Bool)

(assert (=> start!25926 (=> (not res!131998) (not e!173063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25926 (= res!131998 (validMask!0 mask!3868))))

(assert (=> start!25926 e!173063))

(declare-fun array_inv!4124 (array!13023) Bool)

(assert (=> start!25926 (array_inv!4124 a!3325)))

(assert (=> start!25926 true))

(declare-fun b!267722 () Bool)

(declare-fun res!131996 () Bool)

(assert (=> b!267722 (=> (not res!131996) (not e!173063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267722 (= res!131996 (validKeyInArray!0 k!2581))))

(assert (= (and start!25926 res!131998) b!267718))

(assert (= (and b!267718 res!132000) b!267722))

(assert (= (and b!267722 res!131996) b!267720))

(assert (= (and b!267720 res!131999) b!267719))

(assert (= (and b!267719 res!131997) b!267721))

(declare-fun m!284013 () Bool)

(assert (=> b!267719 m!284013))

(declare-fun m!284015 () Bool)

(assert (=> b!267720 m!284015))

(declare-fun m!284017 () Bool)

(assert (=> start!25926 m!284017))

(declare-fun m!284019 () Bool)

(assert (=> start!25926 m!284019))

(declare-fun m!284021 () Bool)

(assert (=> b!267722 m!284021))

(push 1)

(assert (not b!267722))

(assert (not b!267720))

(assert (not b!267719))

(assert (not start!25926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

