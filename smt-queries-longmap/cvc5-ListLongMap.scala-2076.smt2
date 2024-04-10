; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35624 () Bool)

(assert start!35624)

(declare-fun b_free!7879 () Bool)

(declare-fun b_next!7879 () Bool)

(assert (=> start!35624 (= b_free!7879 (not b_next!7879))))

(declare-fun tp!27620 () Bool)

(declare-fun b_and!15121 () Bool)

(assert (=> start!35624 (= tp!27620 b_and!15121)))

(declare-fun b!357503 () Bool)

(declare-fun res!198561 () Bool)

(declare-fun e!218896 () Bool)

(assert (=> b!357503 (=> (not res!198561) (not e!218896))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19721 0))(
  ( (array!19722 (arr!9354 (Array (_ BitVec 32) (_ BitVec 64))) (size!9706 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19721)

(assert (=> b!357503 (= res!198561 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9706 _keys!1456))))))

(declare-fun b!357504 () Bool)

(declare-fun res!198562 () Bool)

(assert (=> b!357504 (=> (not res!198562) (not e!218896))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357504 (= res!198562 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!357505 () Bool)

(declare-fun res!198568 () Bool)

(assert (=> b!357505 (=> (not res!198568) (not e!218896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357505 (= res!198568 (validKeyInArray!0 k!1077))))

(declare-fun res!198564 () Bool)

(assert (=> start!35624 (=> (not res!198564) (not e!218896))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35624 (= res!198564 (validMask!0 mask!1842))))

(assert (=> start!35624 e!218896))

(declare-fun tp_is_empty!8077 () Bool)

(assert (=> start!35624 tp_is_empty!8077))

(assert (=> start!35624 true))

(assert (=> start!35624 tp!27620))

(declare-fun array_inv!6878 (array!19721) Bool)

(assert (=> start!35624 (array_inv!6878 _keys!1456)))

(declare-datatypes ((V!11747 0))(
  ( (V!11748 (val!4083 Int)) )
))
(declare-datatypes ((ValueCell!3695 0))(
  ( (ValueCellFull!3695 (v!6277 V!11747)) (EmptyCell!3695) )
))
(declare-datatypes ((array!19723 0))(
  ( (array!19724 (arr!9355 (Array (_ BitVec 32) ValueCell!3695)) (size!9707 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19723)

(declare-fun e!218894 () Bool)

(declare-fun array_inv!6879 (array!19723) Bool)

(assert (=> start!35624 (and (array_inv!6879 _values!1208) e!218894)))

(declare-fun b!357506 () Bool)

(declare-fun res!198565 () Bool)

(assert (=> b!357506 (=> (not res!198565) (not e!218896))))

(declare-datatypes ((List!5397 0))(
  ( (Nil!5394) (Cons!5393 (h!6249 (_ BitVec 64)) (t!10547 List!5397)) )
))
(declare-fun arrayNoDuplicates!0 (array!19721 (_ BitVec 32) List!5397) Bool)

(assert (=> b!357506 (= res!198565 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5394))))

(declare-fun mapIsEmpty!13623 () Bool)

(declare-fun mapRes!13623 () Bool)

(assert (=> mapIsEmpty!13623 mapRes!13623))

(declare-fun b!357507 () Bool)

(declare-fun res!198563 () Bool)

(assert (=> b!357507 (=> (not res!198563) (not e!218896))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!357507 (= res!198563 (and (= (size!9707 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9706 _keys!1456) (size!9707 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357508 () Bool)

(declare-fun res!198567 () Bool)

(assert (=> b!357508 (=> (not res!198567) (not e!218896))))

(assert (=> b!357508 (= res!198567 (not (= (select (arr!9354 _keys!1456) from!1805) k!1077)))))

(declare-fun b!357509 () Bool)

(declare-fun e!218895 () Bool)

(assert (=> b!357509 (= e!218895 tp_is_empty!8077)))

(declare-fun b!357510 () Bool)

(declare-fun e!218897 () Bool)

(assert (=> b!357510 (= e!218896 (not e!218897))))

(declare-fun res!198566 () Bool)

(assert (=> b!357510 (=> res!198566 e!218897)))

(assert (=> b!357510 (= res!198566 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9706 _keys!1456))))))

(assert (=> b!357510 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11747)

(declare-fun zeroValue!1150 () V!11747)

(declare-datatypes ((Unit!11018 0))(
  ( (Unit!11019) )
))
(declare-fun lt!166051 () Unit!11018)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!28 (array!19721 array!19723 (_ BitVec 32) (_ BitVec 32) V!11747 V!11747 (_ BitVec 64) (_ BitVec 32)) Unit!11018)

(assert (=> b!357510 (= lt!166051 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!28 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357511 () Bool)

(assert (=> b!357511 (= e!218897 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5706 0))(
  ( (tuple2!5707 (_1!2864 (_ BitVec 64)) (_2!2864 V!11747)) )
))
(declare-datatypes ((List!5398 0))(
  ( (Nil!5395) (Cons!5394 (h!6250 tuple2!5706) (t!10548 List!5398)) )
))
(declare-datatypes ((ListLongMap!4619 0))(
  ( (ListLongMap!4620 (toList!2325 List!5398)) )
))
(declare-fun contains!2405 (ListLongMap!4619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1846 (array!19721 array!19723 (_ BitVec 32) (_ BitVec 32) V!11747 V!11747 (_ BitVec 32) Int) ListLongMap!4619)

(assert (=> b!357511 (contains!2405 (getCurrentListMap!1846 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k!1077)))

(declare-fun lt!166052 () Unit!11018)

(declare-fun lemmaArrayContainsKeyThenInListMap!341 (array!19721 array!19723 (_ BitVec 32) (_ BitVec 32) V!11747 V!11747 (_ BitVec 64) (_ BitVec 32) Int) Unit!11018)

(assert (=> b!357511 (= lt!166052 (lemmaArrayContainsKeyThenInListMap!341 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun mapNonEmpty!13623 () Bool)

(declare-fun tp!27621 () Bool)

(assert (=> mapNonEmpty!13623 (= mapRes!13623 (and tp!27621 e!218895))))

(declare-fun mapValue!13623 () ValueCell!3695)

(declare-fun mapKey!13623 () (_ BitVec 32))

(declare-fun mapRest!13623 () (Array (_ BitVec 32) ValueCell!3695))

(assert (=> mapNonEmpty!13623 (= (arr!9355 _values!1208) (store mapRest!13623 mapKey!13623 mapValue!13623))))

(declare-fun b!357512 () Bool)

(declare-fun res!198560 () Bool)

(assert (=> b!357512 (=> (not res!198560) (not e!218896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19721 (_ BitVec 32)) Bool)

(assert (=> b!357512 (= res!198560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357513 () Bool)

(declare-fun e!218893 () Bool)

(assert (=> b!357513 (= e!218893 tp_is_empty!8077)))

(declare-fun b!357514 () Bool)

(assert (=> b!357514 (= e!218894 (and e!218893 mapRes!13623))))

(declare-fun condMapEmpty!13623 () Bool)

(declare-fun mapDefault!13623 () ValueCell!3695)

