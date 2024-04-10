; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43302 () Bool)

(assert start!43302)

(declare-fun b_free!12169 () Bool)

(declare-fun b_next!12169 () Bool)

(assert (=> start!43302 (= b_free!12169 (not b_next!12169))))

(declare-fun tp!42777 () Bool)

(declare-fun b_and!20921 () Bool)

(assert (=> start!43302 (= tp!42777 b_and!20921)))

(declare-fun b!479749 () Bool)

(declare-fun res!286165 () Bool)

(declare-fun e!282288 () Bool)

(assert (=> b!479749 (=> (not res!286165) (not e!282288))))

(declare-datatypes ((array!31029 0))(
  ( (array!31030 (arr!14921 (Array (_ BitVec 32) (_ BitVec 64))) (size!15279 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31029)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31029 (_ BitVec 32)) Bool)

(assert (=> b!479749 (= res!286165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22219 () Bool)

(declare-fun mapRes!22219 () Bool)

(declare-fun tp!42778 () Bool)

(declare-fun e!282286 () Bool)

(assert (=> mapNonEmpty!22219 (= mapRes!22219 (and tp!42778 e!282286))))

(declare-datatypes ((V!19313 0))(
  ( (V!19314 (val!6888 Int)) )
))
(declare-datatypes ((ValueCell!6479 0))(
  ( (ValueCellFull!6479 (v!9177 V!19313)) (EmptyCell!6479) )
))
(declare-fun mapRest!22219 () (Array (_ BitVec 32) ValueCell!6479))

(declare-fun mapKey!22219 () (_ BitVec 32))

(declare-fun mapValue!22219 () ValueCell!6479)

(declare-datatypes ((array!31031 0))(
  ( (array!31032 (arr!14922 (Array (_ BitVec 32) ValueCell!6479)) (size!15280 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31031)

(assert (=> mapNonEmpty!22219 (= (arr!14922 _values!1516) (store mapRest!22219 mapKey!22219 mapValue!22219))))

(declare-fun b!479751 () Bool)

(declare-fun res!286167 () Bool)

(assert (=> b!479751 (=> (not res!286167) (not e!282288))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19313)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19313)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9042 0))(
  ( (tuple2!9043 (_1!4532 (_ BitVec 64)) (_2!4532 V!19313)) )
))
(declare-datatypes ((List!9120 0))(
  ( (Nil!9117) (Cons!9116 (h!9972 tuple2!9042) (t!15326 List!9120)) )
))
(declare-datatypes ((ListLongMap!7955 0))(
  ( (ListLongMap!7956 (toList!3993 List!9120)) )
))
(declare-fun contains!2603 (ListLongMap!7955 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2312 (array!31029 array!31031 (_ BitVec 32) (_ BitVec 32) V!19313 V!19313 (_ BitVec 32) Int) ListLongMap!7955)

(assert (=> b!479751 (= res!286167 (contains!2603 (getCurrentListMap!2312 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun mapIsEmpty!22219 () Bool)

(assert (=> mapIsEmpty!22219 mapRes!22219))

(declare-fun b!479752 () Bool)

(declare-fun e!282283 () Bool)

(assert (=> b!479752 (= e!282283 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!479753 () Bool)

(declare-fun res!286168 () Bool)

(assert (=> b!479753 (=> (not res!286168) (not e!282288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479753 (= res!286168 (validKeyInArray!0 k!1332))))

(declare-fun b!479754 () Bool)

(declare-fun e!282287 () Bool)

(declare-fun tp_is_empty!13681 () Bool)

(assert (=> b!479754 (= e!282287 tp_is_empty!13681)))

(declare-fun b!479755 () Bool)

(declare-fun res!286170 () Bool)

(assert (=> b!479755 (=> (not res!286170) (not e!282288))))

(declare-datatypes ((List!9121 0))(
  ( (Nil!9118) (Cons!9117 (h!9973 (_ BitVec 64)) (t!15327 List!9121)) )
))
(declare-fun arrayNoDuplicates!0 (array!31029 (_ BitVec 32) List!9121) Bool)

(assert (=> b!479755 (= res!286170 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9118))))

(declare-fun b!479756 () Bool)

(declare-fun res!286169 () Bool)

(assert (=> b!479756 (=> (not res!286169) (not e!282288))))

(assert (=> b!479756 (= res!286169 (and (= (size!15280 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15279 _keys!1874) (size!15280 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479757 () Bool)

(assert (=> b!479757 (= e!282286 tp_is_empty!13681)))

(declare-fun b!479750 () Bool)

(declare-fun arrayContainsKey!0 (array!31029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479750 (= e!282283 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun res!286166 () Bool)

(assert (=> start!43302 (=> (not res!286166) (not e!282288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43302 (= res!286166 (validMask!0 mask!2352))))

(assert (=> start!43302 e!282288))

(assert (=> start!43302 true))

(assert (=> start!43302 tp_is_empty!13681))

(declare-fun e!282284 () Bool)

(declare-fun array_inv!10764 (array!31031) Bool)

(assert (=> start!43302 (and (array_inv!10764 _values!1516) e!282284)))

(assert (=> start!43302 tp!42777))

(declare-fun array_inv!10765 (array!31029) Bool)

(assert (=> start!43302 (array_inv!10765 _keys!1874)))

(declare-fun b!479758 () Bool)

(assert (=> b!479758 (= e!282284 (and e!282287 mapRes!22219))))

(declare-fun condMapEmpty!22219 () Bool)

(declare-fun mapDefault!22219 () ValueCell!6479)

