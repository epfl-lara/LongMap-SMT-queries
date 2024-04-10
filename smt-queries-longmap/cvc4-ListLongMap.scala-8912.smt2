; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108126 () Bool)

(assert start!108126)

(declare-fun b_free!27839 () Bool)

(declare-fun b_next!27839 () Bool)

(assert (=> start!108126 (= b_free!27839 (not b_next!27839))))

(declare-fun tp!98470 () Bool)

(declare-fun b_and!45895 () Bool)

(assert (=> start!108126 (= tp!98470 b_and!45895)))

(declare-fun b!1276912 () Bool)

(declare-fun res!848556 () Bool)

(declare-fun e!729205 () Bool)

(assert (=> b!1276912 (=> (not res!848556) (not e!729205))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49621 0))(
  ( (V!49622 (val!16769 Int)) )
))
(declare-fun minValue!1129 () V!49621)

(declare-fun k!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15796 0))(
  ( (ValueCellFull!15796 (v!19366 V!49621)) (EmptyCell!15796) )
))
(declare-datatypes ((array!83870 0))(
  ( (array!83871 (arr!40446 (Array (_ BitVec 32) ValueCell!15796)) (size!40996 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83870)

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun zeroValue!1129 () V!49621)

(declare-datatypes ((array!83872 0))(
  ( (array!83873 (arr!40447 (Array (_ BitVec 32) (_ BitVec 64))) (size!40997 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83872)

(declare-datatypes ((tuple2!21506 0))(
  ( (tuple2!21507 (_1!10764 (_ BitVec 64)) (_2!10764 V!49621)) )
))
(declare-datatypes ((List!28683 0))(
  ( (Nil!28680) (Cons!28679 (h!29888 tuple2!21506) (t!42219 List!28683)) )
))
(declare-datatypes ((ListLongMap!19163 0))(
  ( (ListLongMap!19164 (toList!9597 List!28683)) )
))
(declare-fun contains!7706 (ListLongMap!19163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4681 (array!83872 array!83870 (_ BitVec 32) (_ BitVec 32) V!49621 V!49621 (_ BitVec 32) Int) ListLongMap!19163)

(assert (=> b!1276912 (= res!848556 (contains!7706 (getCurrentListMap!4681 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun res!848554 () Bool)

(assert (=> start!108126 (=> (not res!848554) (not e!729205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108126 (= res!848554 (validMask!0 mask!1805))))

(assert (=> start!108126 e!729205))

(assert (=> start!108126 true))

(assert (=> start!108126 tp!98470))

(declare-fun tp_is_empty!33389 () Bool)

(assert (=> start!108126 tp_is_empty!33389))

(declare-fun e!729207 () Bool)

(declare-fun array_inv!30733 (array!83870) Bool)

(assert (=> start!108126 (and (array_inv!30733 _values!1187) e!729207)))

(declare-fun array_inv!30734 (array!83872) Bool)

(assert (=> start!108126 (array_inv!30734 _keys!1427)))

(declare-fun b!1276913 () Bool)

(declare-fun res!848553 () Bool)

(assert (=> b!1276913 (=> (not res!848553) (not e!729205))))

(assert (=> b!1276913 (= res!848553 (bvslt #b00000000000000000000000000000000 (size!40997 _keys!1427)))))

(declare-fun b!1276914 () Bool)

(declare-fun e!729206 () Bool)

(assert (=> b!1276914 (= e!729206 tp_is_empty!33389)))

(declare-fun b!1276915 () Bool)

(declare-fun e!729210 () Bool)

(assert (=> b!1276915 (= e!729210 (ite (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!51614 () Bool)

(declare-fun mapRes!51614 () Bool)

(assert (=> mapIsEmpty!51614 mapRes!51614))

(declare-fun mapNonEmpty!51614 () Bool)

(declare-fun tp!98471 () Bool)

(declare-fun e!729209 () Bool)

(assert (=> mapNonEmpty!51614 (= mapRes!51614 (and tp!98471 e!729209))))

(declare-fun mapKey!51614 () (_ BitVec 32))

(declare-fun mapValue!51614 () ValueCell!15796)

(declare-fun mapRest!51614 () (Array (_ BitVec 32) ValueCell!15796))

(assert (=> mapNonEmpty!51614 (= (arr!40446 _values!1187) (store mapRest!51614 mapKey!51614 mapValue!51614))))

(declare-fun b!1276916 () Bool)

(declare-fun arrayContainsKey!0 (array!83872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276916 (= e!729210 (arrayContainsKey!0 _keys!1427 k!1053 #b00000000000000000000000000000000))))

(declare-fun b!1276917 () Bool)

(declare-fun res!848552 () Bool)

(assert (=> b!1276917 (=> (not res!848552) (not e!729205))))

(declare-datatypes ((List!28684 0))(
  ( (Nil!28681) (Cons!28680 (h!29889 (_ BitVec 64)) (t!42220 List!28684)) )
))
(declare-fun arrayNoDuplicates!0 (array!83872 (_ BitVec 32) List!28684) Bool)

(assert (=> b!1276917 (= res!848552 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28681))))

(declare-fun b!1276918 () Bool)

(declare-fun res!848555 () Bool)

(assert (=> b!1276918 (=> (not res!848555) (not e!729205))))

(assert (=> b!1276918 (= res!848555 (and (= (size!40996 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40997 _keys!1427) (size!40996 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276919 () Bool)

(assert (=> b!1276919 (= e!729209 tp_is_empty!33389)))

(declare-fun b!1276920 () Bool)

(declare-fun res!848551 () Bool)

(assert (=> b!1276920 (=> (not res!848551) (not e!729205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83872 (_ BitVec 32)) Bool)

(assert (=> b!1276920 (= res!848551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276921 () Bool)

(assert (=> b!1276921 (= e!729207 (and e!729206 mapRes!51614))))

(declare-fun condMapEmpty!51614 () Bool)

(declare-fun mapDefault!51614 () ValueCell!15796)

