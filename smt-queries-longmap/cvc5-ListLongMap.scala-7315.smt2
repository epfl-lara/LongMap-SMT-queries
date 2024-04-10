; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93510 () Bool)

(assert start!93510)

(declare-fun res!707365 () Bool)

(declare-fun e!602439 () Bool)

(assert (=> start!93510 (=> (not res!707365) (not e!602439))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66800 0))(
  ( (array!66801 (arr!32116 (Array (_ BitVec 32) (_ BitVec 64))) (size!32652 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66800)

(assert (=> start!93510 (= res!707365 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32652 a!3475)) (bvslt (size!32652 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93510 e!602439))

(assert (=> start!93510 true))

(declare-fun array_inv!24896 (array!66800) Bool)

(assert (=> start!93510 (array_inv!24896 a!3475)))

(declare-fun b!1058791 () Bool)

(declare-fun res!707366 () Bool)

(assert (=> b!1058791 (=> (not res!707366) (not e!602439))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058791 (= res!707366 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058792 () Bool)

(assert (=> b!1058792 (= e!602439 (bvslt (bvsub (size!32652 a!3475) from!2850) #b00000000000000000000000000000000))))

(assert (= (and start!93510 res!707365) b!1058791))

(assert (= (and b!1058791 res!707366) b!1058792))

(declare-fun m!978435 () Bool)

(assert (=> start!93510 m!978435))

(declare-fun m!978437 () Bool)

(assert (=> b!1058791 m!978437))

(push 1)

(assert (not start!93510))

(assert (not b!1058791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

