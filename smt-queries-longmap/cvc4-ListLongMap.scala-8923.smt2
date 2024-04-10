; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108210 () Bool)

(assert start!108210)

(declare-fun b_free!27905 () Bool)

(declare-fun b_next!27905 () Bool)

(assert (=> start!108210 (= b_free!27905 (not b_next!27905))))

(declare-fun tp!98672 () Bool)

(declare-fun b_and!45963 () Bool)

(assert (=> start!108210 (= tp!98672 b_and!45963)))

(declare-fun b!1277810 () Bool)

(declare-fun res!849044 () Bool)

(declare-fun e!729804 () Bool)

(assert (=> b!1277810 (=> (not res!849044) (not e!729804))))

(declare-datatypes ((array!84000 0))(
  ( (array!84001 (arr!40510 (Array (_ BitVec 32) (_ BitVec 64))) (size!41060 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!84000)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84000 (_ BitVec 32)) Bool)

(assert (=> b!1277810 (= res!849044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51716 () Bool)

(declare-fun mapRes!51716 () Bool)

(assert (=> mapIsEmpty!51716 mapRes!51716))

(declare-fun b!1277811 () Bool)

(declare-fun res!849046 () Bool)

(assert (=> b!1277811 (=> (not res!849046) (not e!729804))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49709 0))(
  ( (V!49710 (val!16802 Int)) )
))
(declare-fun minValue!1129 () V!49709)

(declare-fun k!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15829 0))(
  ( (ValueCellFull!15829 (v!19400 V!49709)) (EmptyCell!15829) )
))
(declare-datatypes ((array!84002 0))(
  ( (array!84003 (arr!40511 (Array (_ BitVec 32) ValueCell!15829)) (size!41061 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84002)

(declare-fun zeroValue!1129 () V!49709)

(declare-datatypes ((tuple2!21552 0))(
  ( (tuple2!21553 (_1!10787 (_ BitVec 64)) (_2!10787 V!49709)) )
))
(declare-datatypes ((List!28728 0))(
  ( (Nil!28725) (Cons!28724 (h!29933 tuple2!21552) (t!42266 List!28728)) )
))
(declare-datatypes ((ListLongMap!19209 0))(
  ( (ListLongMap!19210 (toList!9620 List!28728)) )
))
(declare-fun contains!7730 (ListLongMap!19209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4704 (array!84000 array!84002 (_ BitVec 32) (_ BitVec 32) V!49709 V!49709 (_ BitVec 32) Int) ListLongMap!19209)

(assert (=> b!1277811 (= res!849046 (contains!7730 (getCurrentListMap!4704 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1277812 () Bool)

(declare-fun res!849045 () Bool)

(assert (=> b!1277812 (=> (not res!849045) (not e!729804))))

(declare-datatypes ((List!28729 0))(
  ( (Nil!28726) (Cons!28725 (h!29934 (_ BitVec 64)) (t!42267 List!28729)) )
))
(declare-fun arrayNoDuplicates!0 (array!84000 (_ BitVec 32) List!28729) Bool)

(assert (=> b!1277812 (= res!849045 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28726))))

(declare-fun b!1277813 () Bool)

(declare-fun e!729803 () Bool)

(declare-fun tp_is_empty!33455 () Bool)

(assert (=> b!1277813 (= e!729803 tp_is_empty!33455)))

(declare-fun b!1277814 () Bool)

(assert (=> b!1277814 (= e!729804 (bvsge #b00000000000000000000000000000000 (size!41060 _keys!1427)))))

(declare-fun b!1277815 () Bool)

(declare-fun res!849048 () Bool)

(assert (=> b!1277815 (=> (not res!849048) (not e!729804))))

(assert (=> b!1277815 (= res!849048 (and (= (size!41061 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41060 _keys!1427) (size!41061 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51716 () Bool)

(declare-fun tp!98671 () Bool)

(declare-fun e!729801 () Bool)

(assert (=> mapNonEmpty!51716 (= mapRes!51716 (and tp!98671 e!729801))))

(declare-fun mapKey!51716 () (_ BitVec 32))

(declare-fun mapRest!51716 () (Array (_ BitVec 32) ValueCell!15829))

(declare-fun mapValue!51716 () ValueCell!15829)

(assert (=> mapNonEmpty!51716 (= (arr!40511 _values!1187) (store mapRest!51716 mapKey!51716 mapValue!51716))))

(declare-fun b!1277817 () Bool)

(declare-fun e!729800 () Bool)

(assert (=> b!1277817 (= e!729800 (and e!729803 mapRes!51716))))

(declare-fun condMapEmpty!51716 () Bool)

(declare-fun mapDefault!51716 () ValueCell!15829)

