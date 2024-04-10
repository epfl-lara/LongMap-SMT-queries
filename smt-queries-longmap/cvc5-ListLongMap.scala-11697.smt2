; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136802 () Bool)

(assert start!136802)

(declare-fun b!1578738 () Bool)

(declare-fun e!880595 () Bool)

(declare-fun from!2937 () (_ BitVec 32))

(assert (=> b!1578738 (= e!880595 (bvsge (bvsub from!2937 #b00000000000000000000000000000001) from!2937))))

(declare-fun b!1578737 () Bool)

(declare-fun res!1078676 () Bool)

(assert (=> b!1578737 (=> (not res!1078676) (not e!880595))))

(declare-datatypes ((array!105791 0))(
  ( (array!105792 (arr!51004 (Array (_ BitVec 32) (_ BitVec 64))) (size!51554 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105791)

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578737 (= res!1078676 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1078675 () Bool)

(assert (=> start!136802 (=> (not res!1078675) (not e!880595))))

(assert (=> start!136802 (= res!1078675 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51554 a!3559)) (bvslt (size!51554 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136802 e!880595))

(assert (=> start!136802 true))

(declare-fun array_inv!39731 (array!105791) Bool)

(assert (=> start!136802 (array_inv!39731 a!3559)))

(declare-fun b!1578735 () Bool)

(declare-fun res!1078674 () Bool)

(assert (=> b!1578735 (=> (not res!1078674) (not e!880595))))

(assert (=> b!1578735 (= res!1078674 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578736 () Bool)

(declare-fun res!1078677 () Bool)

(assert (=> b!1578736 (=> (not res!1078677) (not e!880595))))

(assert (=> b!1578736 (= res!1078677 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51554 a!3559))))))

(assert (= (and start!136802 res!1078675) b!1578735))

(assert (= (and b!1578735 res!1078674) b!1578736))

(assert (= (and b!1578736 res!1078677) b!1578737))

(assert (= (and b!1578737 res!1078676) b!1578738))

(declare-fun m!1450777 () Bool)

(assert (=> b!1578737 m!1450777))

(declare-fun m!1450779 () Bool)

(assert (=> start!136802 m!1450779))

(declare-fun m!1450781 () Bool)

(assert (=> b!1578735 m!1450781))

(push 1)

(assert (not b!1578737))

(assert (not start!136802))

(assert (not b!1578735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

