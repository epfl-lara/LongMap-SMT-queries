; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136778 () Bool)

(assert start!136778)

(declare-fun res!1078601 () Bool)

(declare-fun e!880534 () Bool)

(assert (=> start!136778 (=> (not res!1078601) (not e!880534))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105776 0))(
  ( (array!105777 (arr!50998 (Array (_ BitVec 32) (_ BitVec 64))) (size!51548 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105776)

(assert (=> start!136778 (= res!1078601 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51548 a!3559)) (bvslt (size!51548 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136778 e!880534))

(assert (=> start!136778 true))

(declare-fun array_inv!39725 (array!105776) Bool)

(assert (=> start!136778 (array_inv!39725 a!3559)))

(declare-fun b!1578662 () Bool)

(declare-fun res!1078602 () Bool)

(assert (=> b!1578662 (=> (not res!1078602) (not e!880534))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578662 (= res!1078602 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578663 () Bool)

(assert (=> b!1578663 (= e!880534 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvsge (bvsub from!2937 #b00000000000000000000000000000001) (size!51548 a!3559))))))

(assert (= (and start!136778 res!1078601) b!1578662))

(assert (= (and b!1578662 res!1078602) b!1578663))

(declare-fun m!1450723 () Bool)

(assert (=> start!136778 m!1450723))

(declare-fun m!1450725 () Bool)

(assert (=> b!1578662 m!1450725))

(push 1)

(assert (not b!1578662))

(assert (not start!136778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

