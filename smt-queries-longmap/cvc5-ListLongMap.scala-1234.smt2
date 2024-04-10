; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25962 () Bool)

(assert start!25962)

(declare-fun b!267961 () Bool)

(declare-fun res!132240 () Bool)

(declare-fun e!173171 () Bool)

(assert (=> b!267961 (=> (not res!132240) (not e!173171))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267961 (= res!132240 (validKeyInArray!0 k!2581))))

(declare-fun res!132242 () Bool)

(assert (=> start!25962 (=> (not res!132242) (not e!173171))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25962 (= res!132242 (validMask!0 mask!3868))))

(assert (=> start!25962 e!173171))

(declare-datatypes ((array!13059 0))(
  ( (array!13060 (arr!6179 (Array (_ BitVec 32) (_ BitVec 64))) (size!6531 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13059)

(declare-fun array_inv!4142 (array!13059) Bool)

(assert (=> start!25962 (array_inv!4142 a!3325)))

(assert (=> start!25962 true))

(declare-fun b!267962 () Bool)

(assert (=> b!267962 (= e!173171 false)))

(declare-datatypes ((SeekEntryResult!1337 0))(
  ( (MissingZero!1337 (index!7518 (_ BitVec 32))) (Found!1337 (index!7519 (_ BitVec 32))) (Intermediate!1337 (undefined!2149 Bool) (index!7520 (_ BitVec 32)) (x!25894 (_ BitVec 32))) (Undefined!1337) (MissingVacant!1337 (index!7521 (_ BitVec 32))) )
))
(declare-fun lt!134758 () SeekEntryResult!1337)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13059 (_ BitVec 32)) SeekEntryResult!1337)

(assert (=> b!267962 (= lt!134758 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!267963 () Bool)

(declare-fun res!132241 () Bool)

(assert (=> b!267963 (=> (not res!132241) (not e!173171))))

(declare-datatypes ((List!3987 0))(
  ( (Nil!3984) (Cons!3983 (h!4650 (_ BitVec 64)) (t!9069 List!3987)) )
))
(declare-fun arrayNoDuplicates!0 (array!13059 (_ BitVec 32) List!3987) Bool)

(assert (=> b!267963 (= res!132241 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3984))))

(declare-fun b!267964 () Bool)

(declare-fun res!132243 () Bool)

(assert (=> b!267964 (=> (not res!132243) (not e!173171))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267964 (= res!132243 (and (= (size!6531 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6531 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6531 a!3325))))))

(declare-fun b!267965 () Bool)

(declare-fun res!132239 () Bool)

(assert (=> b!267965 (=> (not res!132239) (not e!173171))))

(declare-fun arrayContainsKey!0 (array!13059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267965 (= res!132239 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!25962 res!132242) b!267964))

(assert (= (and b!267964 res!132243) b!267961))

(assert (= (and b!267961 res!132240) b!267963))

(assert (= (and b!267963 res!132241) b!267965))

(assert (= (and b!267965 res!132239) b!267962))

(declare-fun m!284199 () Bool)

(assert (=> b!267962 m!284199))

(declare-fun m!284201 () Bool)

(assert (=> b!267963 m!284201))

(declare-fun m!284203 () Bool)

(assert (=> start!25962 m!284203))

(declare-fun m!284205 () Bool)

(assert (=> start!25962 m!284205))

(declare-fun m!284207 () Bool)

(assert (=> b!267961 m!284207))

(declare-fun m!284209 () Bool)

(assert (=> b!267965 m!284209))

(push 1)

(assert (not b!267963))

(assert (not b!267961))

(assert (not b!267965))

(assert (not start!25962))

(assert (not b!267962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

