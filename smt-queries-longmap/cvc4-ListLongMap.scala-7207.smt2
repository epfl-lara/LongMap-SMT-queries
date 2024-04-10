; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92308 () Bool)

(assert start!92308)

(declare-fun b!1049127 () Bool)

(declare-fun e!595186 () Bool)

(assert (=> b!1049127 (= e!595186 true)))

(declare-datatypes ((array!66109 0))(
  ( (array!66110 (arr!31794 (Array (_ BitVec 32) (_ BitVec 64))) (size!32330 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66109)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22106 0))(
  ( (Nil!22103) (Cons!22102 (h!23311 (_ BitVec 64)) (t!31413 List!22106)) )
))
(declare-fun arrayNoDuplicates!0 (array!66109 (_ BitVec 32) List!22106) Bool)

(assert (=> b!1049127 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22103)))

(declare-datatypes ((Unit!34308 0))(
  ( (Unit!34309) )
))
(declare-fun lt!463397 () Unit!34308)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66109 (_ BitVec 32) (_ BitVec 32)) Unit!34308)

(assert (=> b!1049127 (= lt!463397 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049128 () Bool)

(declare-fun e!595191 () Bool)

(declare-fun e!595188 () Bool)

(assert (=> b!1049128 (= e!595191 e!595188)))

(declare-fun res!698258 () Bool)

(assert (=> b!1049128 (=> (not res!698258) (not e!595188))))

(declare-fun lt!463396 () array!66109)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049128 (= res!698258 (arrayContainsKey!0 lt!463396 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049128 (= lt!463396 (array!66110 (store (arr!31794 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32330 a!3488)))))

(declare-fun lt!463398 () (_ BitVec 32))

(declare-fun b!1049129 () Bool)

(declare-fun e!595190 () Bool)

(assert (=> b!1049129 (= e!595190 (arrayContainsKey!0 a!3488 k!2747 lt!463398))))

(declare-fun b!1049130 () Bool)

(declare-fun res!698253 () Bool)

(assert (=> b!1049130 (=> (not res!698253) (not e!595191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049130 (= res!698253 (validKeyInArray!0 k!2747))))

(declare-fun b!1049131 () Bool)

(declare-fun res!698255 () Bool)

(assert (=> b!1049131 (=> (not res!698255) (not e!595191))))

(assert (=> b!1049131 (= res!698255 (= (select (arr!31794 a!3488) i!1381) k!2747))))

(declare-fun res!698261 () Bool)

(assert (=> start!92308 (=> (not res!698261) (not e!595191))))

(assert (=> start!92308 (= res!698261 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32330 a!3488)) (bvslt (size!32330 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92308 e!595191))

(assert (=> start!92308 true))

(declare-fun array_inv!24574 (array!66109) Bool)

(assert (=> start!92308 (array_inv!24574 a!3488)))

(declare-fun b!1049132 () Bool)

(declare-fun e!595192 () Bool)

(assert (=> b!1049132 (= e!595192 (not e!595186))))

(declare-fun res!698254 () Bool)

(assert (=> b!1049132 (=> res!698254 e!595186)))

(assert (=> b!1049132 (= res!698254 (bvsle lt!463398 i!1381))))

(declare-fun e!595189 () Bool)

(assert (=> b!1049132 e!595189))

(declare-fun res!698259 () Bool)

(assert (=> b!1049132 (=> (not res!698259) (not e!595189))))

(assert (=> b!1049132 (= res!698259 (= (select (store (arr!31794 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463398) k!2747))))

(declare-fun b!1049133 () Bool)

(declare-fun res!698260 () Bool)

(assert (=> b!1049133 (=> (not res!698260) (not e!595191))))

(assert (=> b!1049133 (= res!698260 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22103))))

(declare-fun b!1049134 () Bool)

(assert (=> b!1049134 (= e!595188 e!595192)))

(declare-fun res!698256 () Bool)

(assert (=> b!1049134 (=> (not res!698256) (not e!595192))))

(assert (=> b!1049134 (= res!698256 (not (= lt!463398 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66109 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049134 (= lt!463398 (arrayScanForKey!0 lt!463396 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049135 () Bool)

(assert (=> b!1049135 (= e!595189 e!595190)))

(declare-fun res!698257 () Bool)

(assert (=> b!1049135 (=> res!698257 e!595190)))

(assert (=> b!1049135 (= res!698257 (bvsle lt!463398 i!1381))))

(assert (= (and start!92308 res!698261) b!1049133))

(assert (= (and b!1049133 res!698260) b!1049130))

(assert (= (and b!1049130 res!698253) b!1049131))

(assert (= (and b!1049131 res!698255) b!1049128))

(assert (= (and b!1049128 res!698258) b!1049134))

(assert (= (and b!1049134 res!698256) b!1049132))

(assert (= (and b!1049132 res!698259) b!1049135))

(assert (= (and b!1049135 (not res!698257)) b!1049129))

(assert (= (and b!1049132 (not res!698254)) b!1049127))

(declare-fun m!969943 () Bool)

(assert (=> b!1049131 m!969943))

(declare-fun m!969945 () Bool)

(assert (=> b!1049133 m!969945))

(declare-fun m!969947 () Bool)

(assert (=> b!1049129 m!969947))

(declare-fun m!969949 () Bool)

(assert (=> start!92308 m!969949))

(declare-fun m!969951 () Bool)

(assert (=> b!1049128 m!969951))

(declare-fun m!969953 () Bool)

(assert (=> b!1049128 m!969953))

(declare-fun m!969955 () Bool)

(assert (=> b!1049134 m!969955))

(assert (=> b!1049132 m!969953))

(declare-fun m!969957 () Bool)

(assert (=> b!1049132 m!969957))

(declare-fun m!969959 () Bool)

(assert (=> b!1049127 m!969959))

(declare-fun m!969961 () Bool)

(assert (=> b!1049127 m!969961))

(declare-fun m!969963 () Bool)

(assert (=> b!1049130 m!969963))

(push 1)

(assert (not b!1049130))

(assert (not b!1049127))

(assert (not b!1049129))

(assert (not b!1049134))

(assert (not start!92308))

(assert (not b!1049133))

(assert (not b!1049128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

