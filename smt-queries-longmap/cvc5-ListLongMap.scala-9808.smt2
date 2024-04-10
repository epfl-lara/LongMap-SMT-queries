; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116498 () Bool)

(assert start!116498)

(declare-fun b!1374189 () Bool)

(declare-fun res!917374 () Bool)

(declare-fun e!778484 () Bool)

(assert (=> b!1374189 (=> (not res!917374) (not e!778484))))

(declare-datatypes ((array!93198 0))(
  ( (array!93199 (arr!45005 (Array (_ BitVec 32) (_ BitVec 64))) (size!45555 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93198)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374189 (= res!917374 (validKeyInArray!0 (select (arr!45005 a!4142) i!1457)))))

(declare-fun b!1374190 () Bool)

(declare-fun e!778485 () Bool)

(assert (=> b!1374190 (= e!778485 true)))

(declare-fun lt!603314 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93198 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374190 (= lt!603314 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603313 () (_ BitVec 32))

(declare-fun lt!603315 () array!93198)

(assert (=> b!1374190 (= lt!603313 (arrayCountValidKeys!0 lt!603315 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374192 () Bool)

(declare-fun res!917375 () Bool)

(assert (=> b!1374192 (=> (not res!917375) (not e!778484))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374192 (= res!917375 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374193 () Bool)

(declare-fun res!917373 () Bool)

(assert (=> b!1374193 (=> (not res!917373) (not e!778484))))

(assert (=> b!1374193 (= res!917373 (bvslt (size!45555 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374191 () Bool)

(assert (=> b!1374191 (= e!778484 (not e!778485))))

(declare-fun res!917377 () Bool)

(assert (=> b!1374191 (=> res!917377 e!778485)))

(assert (=> b!1374191 (= res!917377 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374191 (= (arrayCountValidKeys!0 lt!603315 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374191 (= lt!603315 (array!93199 (store (arr!45005 a!4142) i!1457 k!2959) (size!45555 a!4142)))))

(declare-datatypes ((Unit!45411 0))(
  ( (Unit!45412) )
))
(declare-fun lt!603316 () Unit!45411)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93198 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45411)

(assert (=> b!1374191 (= lt!603316 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917376 () Bool)

(assert (=> start!116498 (=> (not res!917376) (not e!778484))))

(assert (=> start!116498 (= res!917376 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45555 a!4142))))))

(assert (=> start!116498 e!778484))

(assert (=> start!116498 true))

(declare-fun array_inv!34033 (array!93198) Bool)

(assert (=> start!116498 (array_inv!34033 a!4142)))

(assert (= (and start!116498 res!917376) b!1374189))

(assert (= (and b!1374189 res!917374) b!1374192))

(assert (= (and b!1374192 res!917375) b!1374193))

(assert (= (and b!1374193 res!917373) b!1374191))

(assert (= (and b!1374191 (not res!917377)) b!1374190))

(declare-fun m!1257433 () Bool)

(assert (=> b!1374191 m!1257433))

(declare-fun m!1257435 () Bool)

(assert (=> b!1374191 m!1257435))

(declare-fun m!1257437 () Bool)

(assert (=> b!1374191 m!1257437))

(declare-fun m!1257439 () Bool)

(assert (=> b!1374191 m!1257439))

(declare-fun m!1257441 () Bool)

(assert (=> b!1374192 m!1257441))

(declare-fun m!1257443 () Bool)

(assert (=> b!1374189 m!1257443))

(assert (=> b!1374189 m!1257443))

(declare-fun m!1257445 () Bool)

(assert (=> b!1374189 m!1257445))

(declare-fun m!1257447 () Bool)

(assert (=> b!1374190 m!1257447))

(declare-fun m!1257449 () Bool)

(assert (=> b!1374190 m!1257449))

(declare-fun m!1257451 () Bool)

(assert (=> start!116498 m!1257451))

(push 1)

(assert (not b!1374189))

(assert (not b!1374192))

(assert (not start!116498))

(assert (not b!1374191))

(assert (not b!1374190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

