; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35622 () Bool)

(assert start!35622)

(declare-fun b_free!7877 () Bool)

(declare-fun b_next!7877 () Bool)

(assert (=> start!35622 (= b_free!7877 (not b_next!7877))))

(declare-fun tp!27615 () Bool)

(declare-fun b_and!15119 () Bool)

(assert (=> start!35622 (= tp!27615 b_and!15119)))

(declare-fun res!198541 () Bool)

(declare-fun e!218879 () Bool)

(assert (=> start!35622 (=> (not res!198541) (not e!218879))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35622 (= res!198541 (validMask!0 mask!1842))))

(assert (=> start!35622 e!218879))

(declare-fun tp_is_empty!8075 () Bool)

(assert (=> start!35622 tp_is_empty!8075))

(assert (=> start!35622 true))

(assert (=> start!35622 tp!27615))

(declare-datatypes ((array!19717 0))(
  ( (array!19718 (arr!9352 (Array (_ BitVec 32) (_ BitVec 64))) (size!9704 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19717)

(declare-fun array_inv!6876 (array!19717) Bool)

(assert (=> start!35622 (array_inv!6876 _keys!1456)))

(declare-datatypes ((V!11743 0))(
  ( (V!11744 (val!4082 Int)) )
))
(declare-datatypes ((ValueCell!3694 0))(
  ( (ValueCellFull!3694 (v!6276 V!11743)) (EmptyCell!3694) )
))
(declare-datatypes ((array!19719 0))(
  ( (array!19720 (arr!9353 (Array (_ BitVec 32) ValueCell!3694)) (size!9705 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19719)

(declare-fun e!218876 () Bool)

(declare-fun array_inv!6877 (array!19719) Bool)

(assert (=> start!35622 (and (array_inv!6877 _values!1208) e!218876)))

(declare-fun b!357467 () Bool)

(declare-fun res!198533 () Bool)

(assert (=> b!357467 (=> (not res!198533) (not e!218879))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357467 (= res!198533 (validKeyInArray!0 k!1077))))

(declare-fun b!357468 () Bool)

(declare-fun res!198539 () Bool)

(assert (=> b!357468 (=> (not res!198539) (not e!218879))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!357468 (= res!198539 (and (= (size!9705 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9704 _keys!1456) (size!9705 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13620 () Bool)

(declare-fun mapRes!13620 () Bool)

(assert (=> mapIsEmpty!13620 mapRes!13620))

(declare-fun b!357469 () Bool)

(declare-fun e!218875 () Bool)

(assert (=> b!357469 (= e!218875 true)))

(declare-fun minValue!1150 () V!11743)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11743)

(declare-datatypes ((tuple2!5704 0))(
  ( (tuple2!5705 (_1!2863 (_ BitVec 64)) (_2!2863 V!11743)) )
))
(declare-datatypes ((List!5396 0))(
  ( (Nil!5393) (Cons!5392 (h!6248 tuple2!5704) (t!10546 List!5396)) )
))
(declare-datatypes ((ListLongMap!4617 0))(
  ( (ListLongMap!4618 (toList!2324 List!5396)) )
))
(declare-fun contains!2404 (ListLongMap!4617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1845 (array!19717 array!19719 (_ BitVec 32) (_ BitVec 32) V!11743 V!11743 (_ BitVec 32) Int) ListLongMap!4617)

(assert (=> b!357469 (contains!2404 (getCurrentListMap!1845 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k!1077)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((Unit!11016 0))(
  ( (Unit!11017) )
))
(declare-fun lt!166045 () Unit!11016)

(declare-fun lemmaArrayContainsKeyThenInListMap!340 (array!19717 array!19719 (_ BitVec 32) (_ BitVec 32) V!11743 V!11743 (_ BitVec 64) (_ BitVec 32) Int) Unit!11016)

(assert (=> b!357469 (= lt!166045 (lemmaArrayContainsKeyThenInListMap!340 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357470 () Bool)

(declare-fun res!198540 () Bool)

(assert (=> b!357470 (=> (not res!198540) (not e!218879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19717 (_ BitVec 32)) Bool)

(assert (=> b!357470 (= res!198540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357471 () Bool)

(assert (=> b!357471 (= e!218879 (not e!218875))))

(declare-fun res!198536 () Bool)

(assert (=> b!357471 (=> res!198536 e!218875)))

(assert (=> b!357471 (= res!198536 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9704 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357471 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166046 () Unit!11016)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!27 (array!19717 array!19719 (_ BitVec 32) (_ BitVec 32) V!11743 V!11743 (_ BitVec 64) (_ BitVec 32)) Unit!11016)

(assert (=> b!357471 (= lt!166046 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!27 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun mapNonEmpty!13620 () Bool)

(declare-fun tp!27614 () Bool)

(declare-fun e!218874 () Bool)

(assert (=> mapNonEmpty!13620 (= mapRes!13620 (and tp!27614 e!218874))))

(declare-fun mapKey!13620 () (_ BitVec 32))

(declare-fun mapRest!13620 () (Array (_ BitVec 32) ValueCell!3694))

(declare-fun mapValue!13620 () ValueCell!3694)

(assert (=> mapNonEmpty!13620 (= (arr!9353 _values!1208) (store mapRest!13620 mapKey!13620 mapValue!13620))))

(declare-fun b!357472 () Bool)

(declare-fun e!218877 () Bool)

(assert (=> b!357472 (= e!218876 (and e!218877 mapRes!13620))))

(declare-fun condMapEmpty!13620 () Bool)

(declare-fun mapDefault!13620 () ValueCell!3694)

