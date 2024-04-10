; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71962 () Bool)

(assert start!71962)

(declare-fun b!836172 () Bool)

(declare-fun res!568899 () Bool)

(declare-fun e!466467 () Bool)

(assert (=> b!836172 (=> (not res!568899) (not e!466467))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836172 (= res!568899 (validKeyInArray!0 k!2968))))

(declare-fun res!568901 () Bool)

(assert (=> start!71962 (=> (not res!568901) (not e!466467))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46872 0))(
  ( (array!46873 (arr!22470 (Array (_ BitVec 32) (_ BitVec 64))) (size!22891 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46872)

(assert (=> start!71962 (= res!568901 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22891 a!4227))))))

(assert (=> start!71962 e!466467))

(assert (=> start!71962 true))

(declare-fun array_inv!17917 (array!46872) Bool)

(assert (=> start!71962 (array_inv!17917 a!4227)))

(declare-fun b!836173 () Bool)

(declare-fun e!466466 () Bool)

(declare-fun lt!380383 () array!46872)

(declare-fun arrayCountValidKeys!0 (array!46872 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836173 (= e!466466 (not (= (arrayCountValidKeys!0 lt!380383 (bvadd #b00000000000000000000000000000001 i!1466) (size!22891 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22891 a!4227)))))))

(declare-fun b!836174 () Bool)

(declare-fun res!568902 () Bool)

(assert (=> b!836174 (=> (not res!568902) (not e!466466))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836174 (= res!568902 (= to!390 (size!22891 a!4227)))))

(declare-fun b!836175 () Bool)

(declare-fun res!568900 () Bool)

(assert (=> b!836175 (=> (not res!568900) (not e!466467))))

(assert (=> b!836175 (= res!568900 (and (bvslt (size!22891 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22891 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836176 () Bool)

(declare-fun res!568904 () Bool)

(assert (=> b!836176 (=> (not res!568904) (not e!466467))))

(assert (=> b!836176 (= res!568904 (not (validKeyInArray!0 (select (arr!22470 a!4227) i!1466))))))

(declare-fun b!836177 () Bool)

(assert (=> b!836177 (= e!466467 e!466466)))

(declare-fun res!568903 () Bool)

(assert (=> b!836177 (=> (not res!568903) (not e!466466))))

(assert (=> b!836177 (= res!568903 (= (arrayCountValidKeys!0 lt!380383 (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(assert (=> b!836177 (= lt!380383 (array!46873 (store (arr!22470 a!4227) i!1466 k!2968) (size!22891 a!4227)))))

(assert (= (and start!71962 res!568901) b!836176))

(assert (= (and b!836176 res!568904) b!836172))

(assert (= (and b!836172 res!568899) b!836175))

(assert (= (and b!836175 res!568900) b!836177))

(assert (= (and b!836177 res!568903) b!836174))

(assert (= (and b!836174 res!568902) b!836173))

(declare-fun m!781567 () Bool)

(assert (=> start!71962 m!781567))

(declare-fun m!781569 () Bool)

(assert (=> b!836177 m!781569))

(declare-fun m!781571 () Bool)

(assert (=> b!836177 m!781571))

(declare-fun m!781573 () Bool)

(assert (=> b!836177 m!781573))

(declare-fun m!781575 () Bool)

(assert (=> b!836176 m!781575))

(assert (=> b!836176 m!781575))

(declare-fun m!781577 () Bool)

(assert (=> b!836176 m!781577))

(declare-fun m!781579 () Bool)

(assert (=> b!836172 m!781579))

(declare-fun m!781581 () Bool)

(assert (=> b!836173 m!781581))

(declare-fun m!781583 () Bool)

(assert (=> b!836173 m!781583))

(push 1)

(assert (not b!836177))

(assert (not start!71962))

(assert (not b!836172))

(assert (not b!836173))

(assert (not b!836176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

