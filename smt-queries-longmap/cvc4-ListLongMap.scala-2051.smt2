; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35478 () Bool)

(assert start!35478)

(declare-fun b_free!7865 () Bool)

(declare-fun b_next!7865 () Bool)

(assert (=> start!35478 (= b_free!7865 (not b_next!7865))))

(declare-fun tp!27380 () Bool)

(declare-fun b_and!15107 () Bool)

(assert (=> start!35478 (= tp!27380 b_and!15107)))

(declare-fun b!355568 () Bool)

(declare-fun res!197290 () Bool)

(declare-fun e!217779 () Bool)

(assert (=> b!355568 (=> (not res!197290) (not e!217779))))

(declare-datatypes ((array!19441 0))(
  ( (array!19442 (arr!9214 (Array (_ BitVec 32) (_ BitVec 64))) (size!9566 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19441)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19441 (_ BitVec 32)) Bool)

(assert (=> b!355568 (= res!197290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355569 () Bool)

(declare-fun res!197283 () Bool)

(assert (=> b!355569 (=> (not res!197283) (not e!217779))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355569 (= res!197283 (validKeyInArray!0 k!1077))))

(declare-fun b!355570 () Bool)

(declare-fun res!197282 () Bool)

(assert (=> b!355570 (=> (not res!197282) (not e!217779))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!355570 (= res!197282 (= (select (arr!9214 _keys!1456) from!1805) k!1077))))

(declare-fun b!355571 () Bool)

(declare-fun res!197288 () Bool)

(assert (=> b!355571 (=> (not res!197288) (not e!217779))))

(assert (=> b!355571 (= res!197288 (validKeyInArray!0 (select (arr!9214 _keys!1456) from!1805)))))

(declare-fun mapNonEmpty!13404 () Bool)

(declare-fun mapRes!13404 () Bool)

(declare-fun tp!27381 () Bool)

(declare-fun e!217780 () Bool)

(assert (=> mapNonEmpty!13404 (= mapRes!13404 (and tp!27381 e!217780))))

(declare-datatypes ((V!11551 0))(
  ( (V!11552 (val!4010 Int)) )
))
(declare-datatypes ((ValueCell!3622 0))(
  ( (ValueCellFull!3622 (v!6204 V!11551)) (EmptyCell!3622) )
))
(declare-fun mapValue!13404 () ValueCell!3622)

(declare-fun mapRest!13404 () (Array (_ BitVec 32) ValueCell!3622))

(declare-fun mapKey!13404 () (_ BitVec 32))

(declare-datatypes ((array!19443 0))(
  ( (array!19444 (arr!9215 (Array (_ BitVec 32) ValueCell!3622)) (size!9567 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19443)

(assert (=> mapNonEmpty!13404 (= (arr!9215 _values!1208) (store mapRest!13404 mapKey!13404 mapValue!13404))))

(declare-fun b!355572 () Bool)

(declare-fun res!197287 () Bool)

(assert (=> b!355572 (=> (not res!197287) (not e!217779))))

(declare-datatypes ((List!5341 0))(
  ( (Nil!5338) (Cons!5337 (h!6193 (_ BitVec 64)) (t!10491 List!5341)) )
))
(declare-fun arrayNoDuplicates!0 (array!19441 (_ BitVec 32) List!5341) Bool)

(assert (=> b!355572 (= res!197287 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5338))))

(declare-fun b!355573 () Bool)

(declare-fun e!217777 () Bool)

(declare-fun e!217781 () Bool)

(assert (=> b!355573 (= e!217777 (and e!217781 mapRes!13404))))

(declare-fun condMapEmpty!13404 () Bool)

(declare-fun mapDefault!13404 () ValueCell!3622)

