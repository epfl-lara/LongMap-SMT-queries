; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116684 () Bool)

(assert start!116684)

(declare-fun b!1375243 () Bool)

(declare-fun e!779194 () Bool)

(assert (=> b!1375243 (= e!779194 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lt!603636 () (_ BitVec 32))

(declare-datatypes ((array!93275 0))(
  ( (array!93276 (arr!45039 (Array (_ BitVec 32) (_ BitVec 64))) (size!45590 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93275)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93275 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375243 (= lt!603636 (arrayCountValidKeys!0 (array!93276 (store (arr!45039 a!4142) i!1457 k!2959) (size!45590 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603635 () (_ BitVec 32))

(assert (=> b!1375243 (= lt!603635 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375240 () Bool)

(declare-fun res!917646 () Bool)

(assert (=> b!1375240 (=> (not res!917646) (not e!779194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375240 (= res!917646 (validKeyInArray!0 (select (arr!45039 a!4142) i!1457)))))

(declare-fun b!1375241 () Bool)

(declare-fun res!917643 () Bool)

(assert (=> b!1375241 (=> (not res!917643) (not e!779194))))

(assert (=> b!1375241 (= res!917643 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917645 () Bool)

(assert (=> start!116684 (=> (not res!917645) (not e!779194))))

(assert (=> start!116684 (= res!917645 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45590 a!4142))))))

(assert (=> start!116684 e!779194))

(assert (=> start!116684 true))

(declare-fun array_inv!34320 (array!93275) Bool)

(assert (=> start!116684 (array_inv!34320 a!4142)))

(declare-fun b!1375242 () Bool)

(declare-fun res!917644 () Bool)

(assert (=> b!1375242 (=> (not res!917644) (not e!779194))))

(assert (=> b!1375242 (= res!917644 (and (bvslt (size!45590 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45590 a!4142))))))

(assert (= (and start!116684 res!917645) b!1375240))

(assert (= (and b!1375240 res!917646) b!1375241))

(assert (= (and b!1375241 res!917643) b!1375242))

(assert (= (and b!1375242 res!917644) b!1375243))

(declare-fun m!1258727 () Bool)

(assert (=> b!1375243 m!1258727))

(declare-fun m!1258729 () Bool)

(assert (=> b!1375243 m!1258729))

(declare-fun m!1258731 () Bool)

(assert (=> b!1375243 m!1258731))

(declare-fun m!1258733 () Bool)

(assert (=> b!1375240 m!1258733))

(assert (=> b!1375240 m!1258733))

(declare-fun m!1258735 () Bool)

(assert (=> b!1375240 m!1258735))

(declare-fun m!1258737 () Bool)

(assert (=> b!1375241 m!1258737))

(declare-fun m!1258739 () Bool)

(assert (=> start!116684 m!1258739))

(push 1)

(assert (not b!1375241))

(assert (not b!1375240))

(assert (not start!116684))

(assert (not b!1375243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

