; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108122 () Bool)

(assert start!108122)

(declare-fun b_free!27835 () Bool)

(declare-fun b_next!27835 () Bool)

(assert (=> start!108122 (= b_free!27835 (not b_next!27835))))

(declare-fun tp!98458 () Bool)

(declare-fun b_and!45891 () Bool)

(assert (=> start!108122 (= tp!98458 b_and!45891)))

(declare-fun b!1276846 () Bool)

(declare-fun res!848518 () Bool)

(declare-fun e!729172 () Bool)

(assert (=> b!1276846 (=> (not res!848518) (not e!729172))))

(declare-datatypes ((array!83862 0))(
  ( (array!83863 (arr!40442 (Array (_ BitVec 32) (_ BitVec 64))) (size!40992 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83862)

(declare-datatypes ((List!28679 0))(
  ( (Nil!28676) (Cons!28675 (h!29884 (_ BitVec 64)) (t!42215 List!28679)) )
))
(declare-fun arrayNoDuplicates!0 (array!83862 (_ BitVec 32) List!28679) Bool)

(assert (=> b!1276846 (= res!848518 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28676))))

(declare-fun b!1276847 () Bool)

(declare-fun res!848515 () Bool)

(assert (=> b!1276847 (=> (not res!848515) (not e!729172))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49617 0))(
  ( (V!49618 (val!16767 Int)) )
))
(declare-fun minValue!1129 () V!49617)

(declare-fun k!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15794 0))(
  ( (ValueCellFull!15794 (v!19364 V!49617)) (EmptyCell!15794) )
))
(declare-datatypes ((array!83864 0))(
  ( (array!83865 (arr!40443 (Array (_ BitVec 32) ValueCell!15794)) (size!40993 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83864)

(declare-fun zeroValue!1129 () V!49617)

(declare-datatypes ((tuple2!21502 0))(
  ( (tuple2!21503 (_1!10762 (_ BitVec 64)) (_2!10762 V!49617)) )
))
(declare-datatypes ((List!28680 0))(
  ( (Nil!28677) (Cons!28676 (h!29885 tuple2!21502) (t!42216 List!28680)) )
))
(declare-datatypes ((ListLongMap!19159 0))(
  ( (ListLongMap!19160 (toList!9595 List!28680)) )
))
(declare-fun contains!7704 (ListLongMap!19159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4679 (array!83862 array!83864 (_ BitVec 32) (_ BitVec 32) V!49617 V!49617 (_ BitVec 32) Int) ListLongMap!19159)

(assert (=> b!1276847 (= res!848515 (contains!7704 (getCurrentListMap!4679 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun mapNonEmpty!51608 () Bool)

(declare-fun mapRes!51608 () Bool)

(declare-fun tp!98459 () Bool)

(declare-fun e!729170 () Bool)

(assert (=> mapNonEmpty!51608 (= mapRes!51608 (and tp!98459 e!729170))))

(declare-fun mapKey!51608 () (_ BitVec 32))

(declare-fun mapRest!51608 () (Array (_ BitVec 32) ValueCell!15794))

(declare-fun mapValue!51608 () ValueCell!15794)

(assert (=> mapNonEmpty!51608 (= (arr!40443 _values!1187) (store mapRest!51608 mapKey!51608 mapValue!51608))))

(declare-fun mapIsEmpty!51608 () Bool)

(assert (=> mapIsEmpty!51608 mapRes!51608))

(declare-fun b!1276849 () Bool)

(declare-fun res!848520 () Bool)

(assert (=> b!1276849 (=> (not res!848520) (not e!729172))))

(assert (=> b!1276849 (= res!848520 (and (= (size!40993 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40992 _keys!1427) (size!40993 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276850 () Bool)

(declare-fun res!848519 () Bool)

(assert (=> b!1276850 (=> (not res!848519) (not e!729172))))

(assert (=> b!1276850 (= res!848519 (bvslt #b00000000000000000000000000000000 (size!40992 _keys!1427)))))

(declare-fun b!1276848 () Bool)

(declare-fun e!729173 () Bool)

(declare-fun e!729169 () Bool)

(assert (=> b!1276848 (= e!729173 (and e!729169 mapRes!51608))))

(declare-fun condMapEmpty!51608 () Bool)

(declare-fun mapDefault!51608 () ValueCell!15794)

