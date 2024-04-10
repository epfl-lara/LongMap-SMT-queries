; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131472 () Bool)

(assert start!131472)

(declare-fun b!1540993 () Bool)

(declare-fun res!1057541 () Bool)

(declare-fun e!857035 () Bool)

(assert (=> b!1540993 (=> (not res!1057541) (not e!857035))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102375 0))(
  ( (array!102376 (arr!49396 (Array (_ BitVec 32) (_ BitVec 64))) (size!49946 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102375)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540993 (= res!1057541 (and (= (size!49946 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49946 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49946 a!3920))))))

(declare-fun res!1057540 () Bool)

(assert (=> start!131472 (=> (not res!1057540) (not e!857035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131472 (= res!1057540 (validMask!0 mask!4052))))

(assert (=> start!131472 e!857035))

(assert (=> start!131472 true))

(declare-fun array_inv!38424 (array!102375) Bool)

(assert (=> start!131472 (array_inv!38424 a!3920)))

(declare-fun b!1540994 () Bool)

(declare-fun res!1057542 () Bool)

(assert (=> b!1540994 (=> (not res!1057542) (not e!857035))))

(assert (=> b!1540994 (= res!1057542 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49946 a!3920))))))

(declare-fun b!1540995 () Bool)

(declare-fun res!1057539 () Bool)

(assert (=> b!1540995 (=> (not res!1057539) (not e!857035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102375 (_ BitVec 32)) Bool)

(assert (=> b!1540995 (= res!1057539 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540996 () Bool)

(declare-fun res!1057543 () Bool)

(assert (=> b!1540996 (=> (not res!1057543) (not e!857035))))

(assert (=> b!1540996 (= res!1057543 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540997 () Bool)

(assert (=> b!1540997 (= e!857035 (not true))))

(assert (=> b!1540997 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51454 0))(
  ( (Unit!51455) )
))
(declare-fun lt!665560 () Unit!51454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102375 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51454)

(assert (=> b!1540997 (= lt!665560 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(assert (= (and start!131472 res!1057540) b!1540993))

(assert (= (and b!1540993 res!1057541) b!1540996))

(assert (= (and b!1540996 res!1057543) b!1540994))

(assert (= (and b!1540994 res!1057542) b!1540995))

(assert (= (and b!1540995 res!1057539) b!1540997))

(declare-fun m!1423035 () Bool)

(assert (=> start!131472 m!1423035))

(declare-fun m!1423037 () Bool)

(assert (=> start!131472 m!1423037))

(declare-fun m!1423039 () Bool)

(assert (=> b!1540995 m!1423039))

(declare-fun m!1423041 () Bool)

(assert (=> b!1540996 m!1423041))

(declare-fun m!1423043 () Bool)

(assert (=> b!1540997 m!1423043))

(declare-fun m!1423045 () Bool)

(assert (=> b!1540997 m!1423045))

(push 1)

(assert (not b!1540995))

(assert (not start!131472))

(assert (not b!1540996))

(assert (not b!1540997))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

