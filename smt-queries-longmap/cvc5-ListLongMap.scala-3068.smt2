; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43260 () Bool)

(assert start!43260)

(declare-fun b_free!12127 () Bool)

(declare-fun b_next!12127 () Bool)

(assert (=> start!43260 (= b_free!12127 (not b_next!12127))))

(declare-fun tp!42651 () Bool)

(declare-fun b_and!20879 () Bool)

(assert (=> start!43260 (= tp!42651 b_and!20879)))

(declare-fun mapIsEmpty!22156 () Bool)

(declare-fun mapRes!22156 () Bool)

(assert (=> mapIsEmpty!22156 mapRes!22156))

(declare-fun b!479300 () Bool)

(declare-fun res!285912 () Bool)

(declare-fun e!281966 () Bool)

(assert (=> b!479300 (=> (not res!285912) (not e!281966))))

(declare-datatypes ((array!30951 0))(
  ( (array!30952 (arr!14882 (Array (_ BitVec 32) (_ BitVec 64))) (size!15240 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30951)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30951 (_ BitVec 32)) Bool)

(assert (=> b!479300 (= res!285912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479301 () Bool)

(declare-fun e!281968 () Bool)

(declare-fun tp_is_empty!13639 () Bool)

(assert (=> b!479301 (= e!281968 tp_is_empty!13639)))

(declare-fun mapNonEmpty!22156 () Bool)

(declare-fun tp!42652 () Bool)

(declare-fun e!281967 () Bool)

(assert (=> mapNonEmpty!22156 (= mapRes!22156 (and tp!42652 e!281967))))

(declare-datatypes ((V!19257 0))(
  ( (V!19258 (val!6867 Int)) )
))
(declare-datatypes ((ValueCell!6458 0))(
  ( (ValueCellFull!6458 (v!9156 V!19257)) (EmptyCell!6458) )
))
(declare-fun mapRest!22156 () (Array (_ BitVec 32) ValueCell!6458))

(declare-datatypes ((array!30953 0))(
  ( (array!30954 (arr!14883 (Array (_ BitVec 32) ValueCell!6458)) (size!15241 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30953)

(declare-fun mapValue!22156 () ValueCell!6458)

(declare-fun mapKey!22156 () (_ BitVec 32))

(assert (=> mapNonEmpty!22156 (= (arr!14883 _values!1516) (store mapRest!22156 mapKey!22156 mapValue!22156))))

(declare-fun res!285909 () Bool)

(assert (=> start!43260 (=> (not res!285909) (not e!281966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43260 (= res!285909 (validMask!0 mask!2352))))

(assert (=> start!43260 e!281966))

(assert (=> start!43260 true))

(assert (=> start!43260 tp_is_empty!13639))

(declare-fun e!281969 () Bool)

(declare-fun array_inv!10736 (array!30953) Bool)

(assert (=> start!43260 (and (array_inv!10736 _values!1516) e!281969)))

(assert (=> start!43260 tp!42651))

(declare-fun array_inv!10737 (array!30951) Bool)

(assert (=> start!43260 (array_inv!10737 _keys!1874)))

(declare-fun b!479302 () Bool)

(declare-fun res!285910 () Bool)

(assert (=> b!479302 (=> (not res!285910) (not e!281966))))

(declare-datatypes ((List!9091 0))(
  ( (Nil!9088) (Cons!9087 (h!9943 (_ BitVec 64)) (t!15297 List!9091)) )
))
(declare-fun arrayNoDuplicates!0 (array!30951 (_ BitVec 32) List!9091) Bool)

(assert (=> b!479302 (= res!285910 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9088))))

(declare-fun b!479303 () Bool)

(assert (=> b!479303 (= e!281966 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun lt!217843 () Bool)

(declare-fun minValue!1458 () V!19257)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19257)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9012 0))(
  ( (tuple2!9013 (_1!4517 (_ BitVec 64)) (_2!4517 V!19257)) )
))
(declare-datatypes ((List!9092 0))(
  ( (Nil!9089) (Cons!9088 (h!9944 tuple2!9012) (t!15298 List!9092)) )
))
(declare-datatypes ((ListLongMap!7925 0))(
  ( (ListLongMap!7926 (toList!3978 List!9092)) )
))
(declare-fun contains!2588 (ListLongMap!7925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2297 (array!30951 array!30953 (_ BitVec 32) (_ BitVec 32) V!19257 V!19257 (_ BitVec 32) Int) ListLongMap!7925)

(assert (=> b!479303 (= lt!217843 (contains!2588 (getCurrentListMap!2297 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!479304 () Bool)

(assert (=> b!479304 (= e!281967 tp_is_empty!13639)))

(declare-fun b!479305 () Bool)

(declare-fun res!285911 () Bool)

(assert (=> b!479305 (=> (not res!285911) (not e!281966))))

(assert (=> b!479305 (= res!285911 (and (= (size!15241 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15240 _keys!1874) (size!15241 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479306 () Bool)

(assert (=> b!479306 (= e!281969 (and e!281968 mapRes!22156))))

(declare-fun condMapEmpty!22156 () Bool)

(declare-fun mapDefault!22156 () ValueCell!6458)

