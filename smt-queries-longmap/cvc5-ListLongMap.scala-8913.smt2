; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108128 () Bool)

(assert start!108128)

(declare-fun b_free!27841 () Bool)

(declare-fun b_next!27841 () Bool)

(assert (=> start!108128 (= b_free!27841 (not b_next!27841))))

(declare-fun tp!98477 () Bool)

(declare-fun b_and!45897 () Bool)

(assert (=> start!108128 (= tp!98477 b_and!45897)))

(declare-fun mapNonEmpty!51617 () Bool)

(declare-fun mapRes!51617 () Bool)

(declare-fun tp!98476 () Bool)

(declare-fun e!729224 () Bool)

(assert (=> mapNonEmpty!51617 (= mapRes!51617 (and tp!98476 e!729224))))

(declare-datatypes ((V!49625 0))(
  ( (V!49626 (val!16770 Int)) )
))
(declare-datatypes ((ValueCell!15797 0))(
  ( (ValueCellFull!15797 (v!19367 V!49625)) (EmptyCell!15797) )
))
(declare-fun mapRest!51617 () (Array (_ BitVec 32) ValueCell!15797))

(declare-datatypes ((array!83874 0))(
  ( (array!83875 (arr!40448 (Array (_ BitVec 32) ValueCell!15797)) (size!40998 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83874)

(declare-fun mapValue!51617 () ValueCell!15797)

(declare-fun mapKey!51617 () (_ BitVec 32))

(assert (=> mapNonEmpty!51617 (= (arr!40448 _values!1187) (store mapRest!51617 mapKey!51617 mapValue!51617))))

(declare-fun b!1276945 () Bool)

(declare-fun e!729226 () Bool)

(declare-datatypes ((array!83876 0))(
  ( (array!83877 (arr!40449 (Array (_ BitVec 32) (_ BitVec 64))) (size!40999 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83876)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!83876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276945 (= e!729226 (arrayContainsKey!0 _keys!1427 k!1053 #b00000000000000000000000000000000))))

(declare-fun b!1276946 () Bool)

(declare-fun res!848574 () Bool)

(declare-fun e!729225 () Bool)

(assert (=> b!1276946 (=> (not res!848574) (not e!729225))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83876 (_ BitVec 32)) Bool)

(assert (=> b!1276946 (= res!848574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51617 () Bool)

(assert (=> mapIsEmpty!51617 mapRes!51617))

(declare-fun b!1276947 () Bool)

(declare-fun res!848573 () Bool)

(assert (=> b!1276947 (=> (not res!848573) (not e!729225))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276947 (= res!848573 (and (= (size!40998 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40999 _keys!1427) (size!40998 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276948 () Bool)

(declare-fun res!848572 () Bool)

(assert (=> b!1276948 (=> (not res!848572) (not e!729225))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49625)

(declare-fun zeroValue!1129 () V!49625)

(declare-datatypes ((tuple2!21508 0))(
  ( (tuple2!21509 (_1!10765 (_ BitVec 64)) (_2!10765 V!49625)) )
))
(declare-datatypes ((List!28685 0))(
  ( (Nil!28682) (Cons!28681 (h!29890 tuple2!21508) (t!42221 List!28685)) )
))
(declare-datatypes ((ListLongMap!19165 0))(
  ( (ListLongMap!19166 (toList!9598 List!28685)) )
))
(declare-fun contains!7707 (ListLongMap!19165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4682 (array!83876 array!83874 (_ BitVec 32) (_ BitVec 32) V!49625 V!49625 (_ BitVec 32) Int) ListLongMap!19165)

(assert (=> b!1276948 (= res!848572 (contains!7707 (getCurrentListMap!4682 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1276949 () Bool)

(declare-fun res!848571 () Bool)

(assert (=> b!1276949 (=> (not res!848571) (not e!729225))))

(declare-datatypes ((List!28686 0))(
  ( (Nil!28683) (Cons!28682 (h!29891 (_ BitVec 64)) (t!42222 List!28686)) )
))
(declare-fun arrayNoDuplicates!0 (array!83876 (_ BitVec 32) List!28686) Bool)

(assert (=> b!1276949 (= res!848571 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28683))))

(declare-fun b!1276950 () Bool)

(assert (=> b!1276950 (= e!729226 (ite (= k!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1276951 () Bool)

(declare-fun e!729227 () Bool)

(declare-fun e!729228 () Bool)

(assert (=> b!1276951 (= e!729227 (and e!729228 mapRes!51617))))

(declare-fun condMapEmpty!51617 () Bool)

(declare-fun mapDefault!51617 () ValueCell!15797)

