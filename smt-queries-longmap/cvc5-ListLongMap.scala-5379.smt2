; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71872 () Bool)

(assert start!71872)

(declare-fun b!835211 () Bool)

(declare-fun res!568087 () Bool)

(declare-fun e!465960 () Bool)

(assert (=> b!835211 (=> (not res!568087) (not e!465960))))

(declare-datatypes ((array!46782 0))(
  ( (array!46783 (arr!22425 (Array (_ BitVec 32) (_ BitVec 64))) (size!22846 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46782)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835211 (= res!568087 (and (bvslt (size!22846 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22846 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835212 () Bool)

(declare-fun res!568086 () Bool)

(assert (=> b!835212 (=> (not res!568086) (not e!465960))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835212 (= res!568086 (validKeyInArray!0 k!2968))))

(declare-fun b!835213 () Bool)

(declare-fun res!568084 () Bool)

(assert (=> b!835213 (=> (not res!568084) (not e!465960))))

(assert (=> b!835213 (= res!568084 (validKeyInArray!0 (select (arr!22425 a!4227) to!390)))))

(declare-fun b!835214 () Bool)

(declare-fun res!568088 () Bool)

(assert (=> b!835214 (=> (not res!568088) (not e!465960))))

(assert (=> b!835214 (= res!568088 (not (= to!390 (size!22846 a!4227))))))

(declare-fun b!835215 () Bool)

(assert (=> b!835215 (= e!465960 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22846 a!4227))))))

(declare-fun res!568083 () Bool)

(assert (=> start!71872 (=> (not res!568083) (not e!465960))))

(assert (=> start!71872 (= res!568083 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22846 a!4227))))))

(assert (=> start!71872 e!465960))

(assert (=> start!71872 true))

(declare-fun array_inv!17872 (array!46782) Bool)

(assert (=> start!71872 (array_inv!17872 a!4227)))

(declare-fun b!835216 () Bool)

(declare-fun res!568085 () Bool)

(assert (=> b!835216 (=> (not res!568085) (not e!465960))))

(assert (=> b!835216 (= res!568085 (not (validKeyInArray!0 (select (arr!22425 a!4227) i!1466))))))

(declare-fun b!835217 () Bool)

(declare-fun res!568082 () Bool)

(assert (=> b!835217 (=> (not res!568082) (not e!465960))))

(declare-fun arrayCountValidKeys!0 (array!46782 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835217 (= res!568082 (= (arrayCountValidKeys!0 (array!46783 (store (arr!22425 a!4227) i!1466 k!2968) (size!22846 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(assert (= (and start!71872 res!568083) b!835216))

(assert (= (and b!835216 res!568085) b!835212))

(assert (= (and b!835212 res!568086) b!835211))

(assert (= (and b!835211 res!568087) b!835217))

(assert (= (and b!835217 res!568082) b!835214))

(assert (= (and b!835214 res!568088) b!835213))

(assert (= (and b!835213 res!568084) b!835215))

(declare-fun m!780369 () Bool)

(assert (=> b!835213 m!780369))

(assert (=> b!835213 m!780369))

(declare-fun m!780371 () Bool)

(assert (=> b!835213 m!780371))

(declare-fun m!780373 () Bool)

(assert (=> b!835212 m!780373))

(declare-fun m!780375 () Bool)

(assert (=> start!71872 m!780375))

(declare-fun m!780377 () Bool)

(assert (=> b!835217 m!780377))

(declare-fun m!780379 () Bool)

(assert (=> b!835217 m!780379))

(declare-fun m!780381 () Bool)

(assert (=> b!835217 m!780381))

(declare-fun m!780383 () Bool)

(assert (=> b!835216 m!780383))

(assert (=> b!835216 m!780383))

(declare-fun m!780385 () Bool)

(assert (=> b!835216 m!780385))

(push 1)

(assert (not b!835216))

(assert (not b!835212))

(assert (not start!71872))

(assert (not b!835213))

(assert (not b!835217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

