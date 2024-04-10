; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92772 () Bool)

(assert start!92772)

(declare-fun b!1053794 () Bool)

(declare-fun e!598550 () Bool)

(declare-fun e!598554 () Bool)

(assert (=> b!1053794 (= e!598550 e!598554)))

(declare-fun res!702778 () Bool)

(assert (=> b!1053794 (=> res!702778 e!598554)))

(declare-fun lt!465222 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053794 (= res!702778 (bvsle lt!465222 i!1381))))

(declare-fun b!1053795 () Bool)

(declare-fun res!702777 () Bool)

(declare-fun e!598555 () Bool)

(assert (=> b!1053795 (=> (not res!702777) (not e!598555))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053795 (= res!702777 (validKeyInArray!0 k!2747))))

(declare-fun b!1053796 () Bool)

(declare-fun res!702781 () Bool)

(assert (=> b!1053796 (=> (not res!702781) (not e!598555))))

(declare-datatypes ((array!66465 0))(
  ( (array!66466 (arr!31966 (Array (_ BitVec 32) (_ BitVec 64))) (size!32502 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66465)

(declare-datatypes ((List!22278 0))(
  ( (Nil!22275) (Cons!22274 (h!23483 (_ BitVec 64)) (t!31585 List!22278)) )
))
(declare-fun arrayNoDuplicates!0 (array!66465 (_ BitVec 32) List!22278) Bool)

(assert (=> b!1053796 (= res!702781 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22275))))

(declare-fun b!1053797 () Bool)

(declare-fun arrayContainsKey!0 (array!66465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053797 (= e!598554 (arrayContainsKey!0 a!3488 k!2747 lt!465222))))

(declare-fun res!702775 () Bool)

(assert (=> start!92772 (=> (not res!702775) (not e!598555))))

(assert (=> start!92772 (= res!702775 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32502 a!3488)) (bvslt (size!32502 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92772 e!598555))

(assert (=> start!92772 true))

(declare-fun array_inv!24746 (array!66465) Bool)

(assert (=> start!92772 (array_inv!24746 a!3488)))

(declare-fun b!1053793 () Bool)

(declare-fun e!598551 () Bool)

(assert (=> b!1053793 (= e!598555 e!598551)))

(declare-fun res!702779 () Bool)

(assert (=> b!1053793 (=> (not res!702779) (not e!598551))))

(declare-fun lt!465221 () array!66465)

(assert (=> b!1053793 (= res!702779 (arrayContainsKey!0 lt!465221 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053793 (= lt!465221 (array!66466 (store (arr!31966 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32502 a!3488)))))

(declare-fun e!598552 () Bool)

(declare-fun b!1053798 () Bool)

(assert (=> b!1053798 (= e!598552 (not (or (bvsle lt!465222 i!1381) (bvsgt #b00000000000000000000000000000000 (size!32502 a!3488)) (bvsle i!1381 (size!32502 a!3488)))))))

(assert (=> b!1053798 e!598550))

(declare-fun res!702782 () Bool)

(assert (=> b!1053798 (=> (not res!702782) (not e!598550))))

(assert (=> b!1053798 (= res!702782 (= (select (store (arr!31966 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465222) k!2747))))

(declare-fun b!1053799 () Bool)

(declare-fun res!702780 () Bool)

(assert (=> b!1053799 (=> (not res!702780) (not e!598555))))

(assert (=> b!1053799 (= res!702780 (= (select (arr!31966 a!3488) i!1381) k!2747))))

(declare-fun b!1053800 () Bool)

(assert (=> b!1053800 (= e!598551 e!598552)))

(declare-fun res!702776 () Bool)

(assert (=> b!1053800 (=> (not res!702776) (not e!598552))))

(assert (=> b!1053800 (= res!702776 (not (= lt!465222 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66465 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053800 (= lt!465222 (arrayScanForKey!0 lt!465221 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92772 res!702775) b!1053796))

(assert (= (and b!1053796 res!702781) b!1053795))

(assert (= (and b!1053795 res!702777) b!1053799))

(assert (= (and b!1053799 res!702780) b!1053793))

(assert (= (and b!1053793 res!702779) b!1053800))

(assert (= (and b!1053800 res!702776) b!1053798))

(assert (= (and b!1053798 res!702782) b!1053794))

(assert (= (and b!1053794 (not res!702778)) b!1053797))

(declare-fun m!973991 () Bool)

(assert (=> b!1053797 m!973991))

(declare-fun m!973993 () Bool)

(assert (=> b!1053800 m!973993))

(declare-fun m!973995 () Bool)

(assert (=> b!1053795 m!973995))

(declare-fun m!973997 () Bool)

(assert (=> start!92772 m!973997))

(declare-fun m!973999 () Bool)

(assert (=> b!1053793 m!973999))

(declare-fun m!974001 () Bool)

(assert (=> b!1053793 m!974001))

(declare-fun m!974003 () Bool)

(assert (=> b!1053799 m!974003))

(declare-fun m!974005 () Bool)

(assert (=> b!1053796 m!974005))

(assert (=> b!1053798 m!974001))

(declare-fun m!974007 () Bool)

(assert (=> b!1053798 m!974007))

(push 1)

(assert (not start!92772))

(assert (not b!1053793))

(assert (not b!1053797))

(assert (not b!1053795))

(assert (not b!1053800))

(assert (not b!1053796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

