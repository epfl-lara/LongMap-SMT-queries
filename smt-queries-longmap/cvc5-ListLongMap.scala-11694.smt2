; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136772 () Bool)

(assert start!136772)

(declare-fun res!1078583 () Bool)

(declare-fun e!880516 () Bool)

(assert (=> start!136772 (=> (not res!1078583) (not e!880516))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105770 0))(
  ( (array!105771 (arr!50995 (Array (_ BitVec 32) (_ BitVec 64))) (size!51545 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105770)

(assert (=> start!136772 (= res!1078583 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51545 a!3559)) (bvslt (size!51545 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136772 e!880516))

(assert (=> start!136772 true))

(declare-fun array_inv!39722 (array!105770) Bool)

(assert (=> start!136772 (array_inv!39722 a!3559)))

(declare-fun b!1578644 () Bool)

(declare-fun res!1078584 () Bool)

(assert (=> b!1578644 (=> (not res!1078584) (not e!880516))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578644 (= res!1078584 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578645 () Bool)

(assert (=> b!1578645 (= e!880516 (and (bvsle from!2937 #b00000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!51545 a!3559))))))

(assert (= (and start!136772 res!1078583) b!1578644))

(assert (= (and b!1578644 res!1078584) b!1578645))

(declare-fun m!1450711 () Bool)

(assert (=> start!136772 m!1450711))

(declare-fun m!1450713 () Bool)

(assert (=> b!1578644 m!1450713))

(push 1)

(assert (not start!136772))

(assert (not b!1578644))

(check-sat)

(pop 1)

