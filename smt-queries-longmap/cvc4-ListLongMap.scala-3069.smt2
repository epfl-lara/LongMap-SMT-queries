; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43270 () Bool)

(assert start!43270)

(declare-fun b_free!12137 () Bool)

(declare-fun b_next!12137 () Bool)

(assert (=> start!43270 (= b_free!12137 (not b_next!12137))))

(declare-fun tp!42682 () Bool)

(declare-fun b_and!20889 () Bool)

(assert (=> start!43270 (= tp!42682 b_and!20889)))

(declare-fun b!479405 () Bool)

(declare-fun e!282042 () Bool)

(assert (=> b!479405 (= e!282042 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun lt!217858 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19269 0))(
  ( (V!19270 (val!6872 Int)) )
))
(declare-fun zeroValue!1458 () V!19269)

(declare-datatypes ((ValueCell!6463 0))(
  ( (ValueCellFull!6463 (v!9161 V!19269)) (EmptyCell!6463) )
))
(declare-datatypes ((array!30971 0))(
  ( (array!30972 (arr!14892 (Array (_ BitVec 32) ValueCell!6463)) (size!15250 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30971)

(declare-fun minValue!1458 () V!19269)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!30973 0))(
  ( (array!30974 (arr!14893 (Array (_ BitVec 32) (_ BitVec 64))) (size!15251 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30973)

(declare-datatypes ((tuple2!9020 0))(
  ( (tuple2!9021 (_1!4521 (_ BitVec 64)) (_2!4521 V!19269)) )
))
(declare-datatypes ((List!9098 0))(
  ( (Nil!9095) (Cons!9094 (h!9950 tuple2!9020) (t!15304 List!9098)) )
))
(declare-datatypes ((ListLongMap!7933 0))(
  ( (ListLongMap!7934 (toList!3982 List!9098)) )
))
(declare-fun contains!2592 (ListLongMap!7933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2301 (array!30973 array!30971 (_ BitVec 32) (_ BitVec 32) V!19269 V!19269 (_ BitVec 32) Int) ListLongMap!7933)

(assert (=> b!479405 (= lt!217858 (contains!2592 (getCurrentListMap!2301 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!479406 () Bool)

(declare-fun res!285970 () Bool)

(assert (=> b!479406 (=> (not res!285970) (not e!282042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30973 (_ BitVec 32)) Bool)

(assert (=> b!479406 (= res!285970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22171 () Bool)

(declare-fun mapRes!22171 () Bool)

(declare-fun tp!42681 () Bool)

(declare-fun e!282044 () Bool)

(assert (=> mapNonEmpty!22171 (= mapRes!22171 (and tp!42681 e!282044))))

(declare-fun mapValue!22171 () ValueCell!6463)

(declare-fun mapKey!22171 () (_ BitVec 32))

(declare-fun mapRest!22171 () (Array (_ BitVec 32) ValueCell!6463))

(assert (=> mapNonEmpty!22171 (= (arr!14892 _values!1516) (store mapRest!22171 mapKey!22171 mapValue!22171))))

(declare-fun b!479407 () Bool)

(declare-fun res!285969 () Bool)

(assert (=> b!479407 (=> (not res!285969) (not e!282042))))

(declare-datatypes ((List!9099 0))(
  ( (Nil!9096) (Cons!9095 (h!9951 (_ BitVec 64)) (t!15305 List!9099)) )
))
(declare-fun arrayNoDuplicates!0 (array!30973 (_ BitVec 32) List!9099) Bool)

(assert (=> b!479407 (= res!285969 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9096))))

(declare-fun b!479408 () Bool)

(declare-fun res!285971 () Bool)

(assert (=> b!479408 (=> (not res!285971) (not e!282042))))

(assert (=> b!479408 (= res!285971 (and (= (size!15250 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15251 _keys!1874) (size!15250 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479409 () Bool)

(declare-fun e!282041 () Bool)

(declare-fun tp_is_empty!13649 () Bool)

(assert (=> b!479409 (= e!282041 tp_is_empty!13649)))

(declare-fun mapIsEmpty!22171 () Bool)

(assert (=> mapIsEmpty!22171 mapRes!22171))

(declare-fun res!285972 () Bool)

(assert (=> start!43270 (=> (not res!285972) (not e!282042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43270 (= res!285972 (validMask!0 mask!2352))))

(assert (=> start!43270 e!282042))

(assert (=> start!43270 true))

(assert (=> start!43270 tp_is_empty!13649))

(declare-fun e!282045 () Bool)

(declare-fun array_inv!10742 (array!30971) Bool)

(assert (=> start!43270 (and (array_inv!10742 _values!1516) e!282045)))

(assert (=> start!43270 tp!42682))

(declare-fun array_inv!10743 (array!30973) Bool)

(assert (=> start!43270 (array_inv!10743 _keys!1874)))

(declare-fun b!479410 () Bool)

(assert (=> b!479410 (= e!282045 (and e!282041 mapRes!22171))))

(declare-fun condMapEmpty!22171 () Bool)

(declare-fun mapDefault!22171 () ValueCell!6463)

