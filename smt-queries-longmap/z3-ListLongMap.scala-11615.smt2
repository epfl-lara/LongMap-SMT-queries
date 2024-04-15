; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135490 () Bool)

(assert start!135490)

(declare-fun res!1075490 () Bool)

(declare-fun e!877790 () Bool)

(assert (=> start!135490 (=> (not res!1075490) (not e!877790))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135490 (= res!1075490 (validMask!0 mask!877))))

(assert (=> start!135490 e!877790))

(assert (=> start!135490 true))

(declare-datatypes ((array!105161 0))(
  ( (array!105162 (arr!50729 (Array (_ BitVec 32) (_ BitVec 64))) (size!51281 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105161)

(declare-fun array_inv!39665 (array!105161) Bool)

(assert (=> start!135490 (array_inv!39665 _keys!591)))

(declare-fun b!1574013 () Bool)

(declare-fun res!1075491 () Bool)

(assert (=> b!1574013 (=> (not res!1075491) (not e!877790))))

(declare-fun i!537 () (_ BitVec 32))

(assert (=> b!1574013 (= res!1075491 (and (= (size!51281 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51281 _keys!591)) (bvslt i!537 (size!51281 _keys!591))))))

(declare-fun b!1574014 () Bool)

(declare-fun res!1075489 () Bool)

(assert (=> b!1574014 (=> (not res!1075489) (not e!877790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574014 (= res!1075489 (not (validKeyInArray!0 (select (arr!50729 _keys!591) i!537))))))

(declare-fun b!1574015 () Bool)

(assert (=> b!1574015 (= e!877790 (bvsge (bvsub (size!51281 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51281 _keys!591) i!537)))))

(assert (= (and start!135490 res!1075490) b!1574013))

(assert (= (and b!1574013 res!1075491) b!1574014))

(assert (= (and b!1574014 res!1075489) b!1574015))

(declare-fun m!1446687 () Bool)

(assert (=> start!135490 m!1446687))

(declare-fun m!1446689 () Bool)

(assert (=> start!135490 m!1446689))

(declare-fun m!1446691 () Bool)

(assert (=> b!1574014 m!1446691))

(assert (=> b!1574014 m!1446691))

(declare-fun m!1446693 () Bool)

(assert (=> b!1574014 m!1446693))

(check-sat (not start!135490) (not b!1574014))
(check-sat)
