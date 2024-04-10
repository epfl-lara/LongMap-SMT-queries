; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108062 () Bool)

(assert start!108062)

(declare-fun b_free!27775 () Bool)

(declare-fun b_next!27775 () Bool)

(assert (=> start!108062 (= b_free!27775 (not b_next!27775))))

(declare-fun tp!98278 () Bool)

(declare-fun b_and!45831 () Bool)

(assert (=> start!108062 (= tp!98278 b_and!45831)))

(declare-fun b!1276208 () Bool)

(declare-fun res!848152 () Bool)

(declare-fun e!728717 () Bool)

(assert (=> b!1276208 (=> (not res!848152) (not e!728717))))

(declare-datatypes ((array!83746 0))(
  ( (array!83747 (arr!40384 (Array (_ BitVec 32) (_ BitVec 64))) (size!40934 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83746)

(declare-datatypes ((List!28638 0))(
  ( (Nil!28635) (Cons!28634 (h!29843 (_ BitVec 64)) (t!42174 List!28638)) )
))
(declare-fun arrayNoDuplicates!0 (array!83746 (_ BitVec 32) List!28638) Bool)

(assert (=> b!1276208 (= res!848152 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28635))))

(declare-fun res!848154 () Bool)

(assert (=> start!108062 (=> (not res!848154) (not e!728717))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108062 (= res!848154 (validMask!0 mask!1805))))

(assert (=> start!108062 e!728717))

(assert (=> start!108062 true))

(assert (=> start!108062 tp!98278))

(declare-fun tp_is_empty!33325 () Bool)

(assert (=> start!108062 tp_is_empty!33325))

(declare-datatypes ((V!49537 0))(
  ( (V!49538 (val!16737 Int)) )
))
(declare-datatypes ((ValueCell!15764 0))(
  ( (ValueCellFull!15764 (v!19334 V!49537)) (EmptyCell!15764) )
))
(declare-datatypes ((array!83748 0))(
  ( (array!83749 (arr!40385 (Array (_ BitVec 32) ValueCell!15764)) (size!40935 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83748)

(declare-fun e!728718 () Bool)

(declare-fun array_inv!30693 (array!83748) Bool)

(assert (=> start!108062 (and (array_inv!30693 _values!1187) e!728718)))

(declare-fun array_inv!30694 (array!83746) Bool)

(assert (=> start!108062 (array_inv!30694 _keys!1427)))

(declare-fun b!1276209 () Bool)

(declare-fun e!728719 () Bool)

(assert (=> b!1276209 (= e!728719 tp_is_empty!33325)))

(declare-fun b!1276210 () Bool)

(assert (=> b!1276210 (= e!728717 false)))

(declare-fun lt!575455 () Bool)

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun minValue!1129 () V!49537)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49537)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((tuple2!21466 0))(
  ( (tuple2!21467 (_1!10744 (_ BitVec 64)) (_2!10744 V!49537)) )
))
(declare-datatypes ((List!28639 0))(
  ( (Nil!28636) (Cons!28635 (h!29844 tuple2!21466) (t!42175 List!28639)) )
))
(declare-datatypes ((ListLongMap!19123 0))(
  ( (ListLongMap!19124 (toList!9577 List!28639)) )
))
(declare-fun contains!7686 (ListLongMap!19123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4661 (array!83746 array!83748 (_ BitVec 32) (_ BitVec 32) V!49537 V!49537 (_ BitVec 32) Int) ListLongMap!19123)

(assert (=> b!1276210 (= lt!575455 (contains!7686 (getCurrentListMap!4661 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun mapIsEmpty!51518 () Bool)

(declare-fun mapRes!51518 () Bool)

(assert (=> mapIsEmpty!51518 mapRes!51518))

(declare-fun b!1276211 () Bool)

(declare-fun res!848151 () Bool)

(assert (=> b!1276211 (=> (not res!848151) (not e!728717))))

(assert (=> b!1276211 (= res!848151 (and (= (size!40935 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40934 _keys!1427) (size!40935 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51518 () Bool)

(declare-fun tp!98279 () Bool)

(assert (=> mapNonEmpty!51518 (= mapRes!51518 (and tp!98279 e!728719))))

(declare-fun mapKey!51518 () (_ BitVec 32))

(declare-fun mapValue!51518 () ValueCell!15764)

(declare-fun mapRest!51518 () (Array (_ BitVec 32) ValueCell!15764))

(assert (=> mapNonEmpty!51518 (= (arr!40385 _values!1187) (store mapRest!51518 mapKey!51518 mapValue!51518))))

(declare-fun b!1276212 () Bool)

(declare-fun e!728721 () Bool)

(assert (=> b!1276212 (= e!728718 (and e!728721 mapRes!51518))))

(declare-fun condMapEmpty!51518 () Bool)

(declare-fun mapDefault!51518 () ValueCell!15764)

