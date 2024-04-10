; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108180 () Bool)

(assert start!108180)

(declare-fun b_free!27875 () Bool)

(declare-fun b_next!27875 () Bool)

(assert (=> start!108180 (= b_free!27875 (not b_next!27875))))

(declare-fun tp!98581 () Bool)

(declare-fun b_and!45933 () Bool)

(assert (=> start!108180 (= tp!98581 b_and!45933)))

(declare-fun b!1277487 () Bool)

(declare-fun e!729575 () Bool)

(assert (=> b!1277487 (= e!729575 false)))

(declare-fun lt!575704 () Bool)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49669 0))(
  ( (V!49670 (val!16787 Int)) )
))
(declare-fun minValue!1129 () V!49669)

(declare-fun k!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15814 0))(
  ( (ValueCellFull!15814 (v!19385 V!49669)) (EmptyCell!15814) )
))
(declare-datatypes ((array!83944 0))(
  ( (array!83945 (arr!40482 (Array (_ BitVec 32) ValueCell!15814)) (size!41032 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83944)

(declare-fun zeroValue!1129 () V!49669)

(declare-datatypes ((array!83946 0))(
  ( (array!83947 (arr!40483 (Array (_ BitVec 32) (_ BitVec 64))) (size!41033 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83946)

(declare-datatypes ((tuple2!21534 0))(
  ( (tuple2!21535 (_1!10778 (_ BitVec 64)) (_2!10778 V!49669)) )
))
(declare-datatypes ((List!28711 0))(
  ( (Nil!28708) (Cons!28707 (h!29916 tuple2!21534) (t!42249 List!28711)) )
))
(declare-datatypes ((ListLongMap!19191 0))(
  ( (ListLongMap!19192 (toList!9611 List!28711)) )
))
(declare-fun contains!7721 (ListLongMap!19191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4695 (array!83946 array!83944 (_ BitVec 32) (_ BitVec 32) V!49669 V!49669 (_ BitVec 32) Int) ListLongMap!19191)

(assert (=> b!1277487 (= lt!575704 (contains!7721 (getCurrentListMap!4695 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun mapNonEmpty!51671 () Bool)

(declare-fun mapRes!51671 () Bool)

(declare-fun tp!98582 () Bool)

(declare-fun e!729577 () Bool)

(assert (=> mapNonEmpty!51671 (= mapRes!51671 (and tp!98582 e!729577))))

(declare-fun mapValue!51671 () ValueCell!15814)

(declare-fun mapRest!51671 () (Array (_ BitVec 32) ValueCell!15814))

(declare-fun mapKey!51671 () (_ BitVec 32))

(assert (=> mapNonEmpty!51671 (= (arr!40482 _values!1187) (store mapRest!51671 mapKey!51671 mapValue!51671))))

(declare-fun b!1277488 () Bool)

(declare-fun res!848856 () Bool)

(assert (=> b!1277488 (=> (not res!848856) (not e!729575))))

(assert (=> b!1277488 (= res!848856 (and (= (size!41032 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41033 _keys!1427) (size!41032 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848858 () Bool)

(assert (=> start!108180 (=> (not res!848858) (not e!729575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108180 (= res!848858 (validMask!0 mask!1805))))

(assert (=> start!108180 e!729575))

(assert (=> start!108180 true))

(assert (=> start!108180 tp!98581))

(declare-fun tp_is_empty!33425 () Bool)

(assert (=> start!108180 tp_is_empty!33425))

(declare-fun e!729576 () Bool)

(declare-fun array_inv!30759 (array!83944) Bool)

(assert (=> start!108180 (and (array_inv!30759 _values!1187) e!729576)))

(declare-fun array_inv!30760 (array!83946) Bool)

(assert (=> start!108180 (array_inv!30760 _keys!1427)))

(declare-fun mapIsEmpty!51671 () Bool)

(assert (=> mapIsEmpty!51671 mapRes!51671))

(declare-fun b!1277489 () Bool)

(assert (=> b!1277489 (= e!729577 tp_is_empty!33425)))

(declare-fun b!1277490 () Bool)

(declare-fun res!848859 () Bool)

(assert (=> b!1277490 (=> (not res!848859) (not e!729575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83946 (_ BitVec 32)) Bool)

(assert (=> b!1277490 (= res!848859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277491 () Bool)

(declare-fun e!729579 () Bool)

(assert (=> b!1277491 (= e!729576 (and e!729579 mapRes!51671))))

(declare-fun condMapEmpty!51671 () Bool)

(declare-fun mapDefault!51671 () ValueCell!15814)

