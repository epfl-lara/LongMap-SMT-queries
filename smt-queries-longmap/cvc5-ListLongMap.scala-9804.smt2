; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116468 () Bool)

(assert start!116468)

(declare-fun b!1373978 () Bool)

(declare-fun res!917207 () Bool)

(declare-fun e!778370 () Bool)

(assert (=> b!1373978 (=> (not res!917207) (not e!778370))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373978 (= res!917207 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1373980 () Bool)

(assert (=> b!1373980 (= e!778370 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lt!603027 () (_ BitVec 32))

(declare-datatypes ((array!93127 0))(
  ( (array!93128 (arr!44970 (Array (_ BitVec 32) (_ BitVec 64))) (size!45522 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93127)

(declare-fun arrayCountValidKeys!0 (array!93127 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373980 (= lt!603027 (arrayCountValidKeys!0 (array!93128 (store (arr!44970 a!4142) i!1457 k!2959) (size!45522 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603026 () (_ BitVec 32))

(assert (=> b!1373980 (= lt!603026 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373979 () Bool)

(declare-fun res!917204 () Bool)

(assert (=> b!1373979 (=> (not res!917204) (not e!778370))))

(assert (=> b!1373979 (= res!917204 (and (bvslt (size!45522 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45522 a!4142))))))

(declare-fun b!1373977 () Bool)

(declare-fun res!917206 () Bool)

(assert (=> b!1373977 (=> (not res!917206) (not e!778370))))

(assert (=> b!1373977 (= res!917206 (validKeyInArray!0 (select (arr!44970 a!4142) i!1457)))))

(declare-fun res!917205 () Bool)

(assert (=> start!116468 (=> (not res!917205) (not e!778370))))

(assert (=> start!116468 (= res!917205 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45522 a!4142))))))

(assert (=> start!116468 e!778370))

(assert (=> start!116468 true))

(declare-fun array_inv!34203 (array!93127) Bool)

(assert (=> start!116468 (array_inv!34203 a!4142)))

(assert (= (and start!116468 res!917205) b!1373977))

(assert (= (and b!1373977 res!917206) b!1373978))

(assert (= (and b!1373978 res!917207) b!1373979))

(assert (= (and b!1373979 res!917204) b!1373980))

(declare-fun m!1256731 () Bool)

(assert (=> b!1373978 m!1256731))

(declare-fun m!1256733 () Bool)

(assert (=> b!1373980 m!1256733))

(declare-fun m!1256735 () Bool)

(assert (=> b!1373980 m!1256735))

(declare-fun m!1256737 () Bool)

(assert (=> b!1373980 m!1256737))

(declare-fun m!1256739 () Bool)

(assert (=> b!1373977 m!1256739))

(assert (=> b!1373977 m!1256739))

(declare-fun m!1256741 () Bool)

(assert (=> b!1373977 m!1256741))

(declare-fun m!1256743 () Bool)

(assert (=> start!116468 m!1256743))

(push 1)

(assert (not b!1373980))

(assert (not b!1373978))

(assert (not b!1373977))

(assert (not start!116468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

