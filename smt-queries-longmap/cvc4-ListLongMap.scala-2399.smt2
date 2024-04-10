; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37972 () Bool)

(assert start!37972)

(declare-fun b_free!8963 () Bool)

(declare-fun b_next!8963 () Bool)

(assert (=> start!37972 (= b_free!8963 (not b_next!8963))))

(declare-fun tp!31656 () Bool)

(declare-fun b_and!16265 () Bool)

(assert (=> start!37972 (= tp!31656 b_and!16265)))

(declare-fun b!390661 () Bool)

(declare-fun e!236637 () Bool)

(declare-fun tp_is_empty!9635 () Bool)

(assert (=> b!390661 (= e!236637 tp_is_empty!9635)))

(declare-fun b!390662 () Bool)

(declare-fun e!236632 () Bool)

(declare-fun e!236633 () Bool)

(assert (=> b!390662 (= e!236632 (not e!236633))))

(declare-fun res!223570 () Bool)

(assert (=> b!390662 (=> res!223570 e!236633)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390662 (= res!223570 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13951 0))(
  ( (V!13952 (val!4862 Int)) )
))
(declare-datatypes ((tuple2!6544 0))(
  ( (tuple2!6545 (_1!3283 (_ BitVec 64)) (_2!3283 V!13951)) )
))
(declare-datatypes ((List!6399 0))(
  ( (Nil!6396) (Cons!6395 (h!7251 tuple2!6544) (t!11559 List!6399)) )
))
(declare-datatypes ((ListLongMap!5457 0))(
  ( (ListLongMap!5458 (toList!2744 List!6399)) )
))
(declare-fun lt!184172 () ListLongMap!5457)

(declare-datatypes ((ValueCell!4474 0))(
  ( (ValueCellFull!4474 (v!7079 V!13951)) (EmptyCell!4474) )
))
(declare-datatypes ((array!23169 0))(
  ( (array!23170 (arr!11048 (Array (_ BitVec 32) ValueCell!4474)) (size!11400 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23169)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13951)

(declare-datatypes ((array!23171 0))(
  ( (array!23172 (arr!11049 (Array (_ BitVec 32) (_ BitVec 64))) (size!11401 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23171)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13951)

(declare-fun getCurrentListMap!2090 (array!23171 array!23169 (_ BitVec 32) (_ BitVec 32) V!13951 V!13951 (_ BitVec 32) Int) ListLongMap!5457)

(assert (=> b!390662 (= lt!184172 (getCurrentListMap!2090 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184166 () array!23171)

(declare-fun lt!184169 () ListLongMap!5457)

(declare-fun lt!184170 () array!23169)

(assert (=> b!390662 (= lt!184169 (getCurrentListMap!2090 lt!184166 lt!184170 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184168 () ListLongMap!5457)

(declare-fun lt!184167 () ListLongMap!5457)

(assert (=> b!390662 (and (= lt!184168 lt!184167) (= lt!184167 lt!184168))))

(declare-fun v!373 () V!13951)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun lt!184165 () ListLongMap!5457)

(declare-fun +!1039 (ListLongMap!5457 tuple2!6544) ListLongMap!5457)

(assert (=> b!390662 (= lt!184167 (+!1039 lt!184165 (tuple2!6545 k!778 v!373)))))

(declare-datatypes ((Unit!11960 0))(
  ( (Unit!11961) )
))
(declare-fun lt!184171 () Unit!11960)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!254 (array!23171 array!23169 (_ BitVec 32) (_ BitVec 32) V!13951 V!13951 (_ BitVec 32) (_ BitVec 64) V!13951 (_ BitVec 32) Int) Unit!11960)

(assert (=> b!390662 (= lt!184171 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!254 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!970 (array!23171 array!23169 (_ BitVec 32) (_ BitVec 32) V!13951 V!13951 (_ BitVec 32) Int) ListLongMap!5457)

(assert (=> b!390662 (= lt!184168 (getCurrentListMapNoExtraKeys!970 lt!184166 lt!184170 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390662 (= lt!184170 (array!23170 (store (arr!11048 _values!506) i!548 (ValueCellFull!4474 v!373)) (size!11400 _values!506)))))

(assert (=> b!390662 (= lt!184165 (getCurrentListMapNoExtraKeys!970 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390663 () Bool)

(declare-fun res!223567 () Bool)

(assert (=> b!390663 (=> (not res!223567) (not e!236632))))

(declare-datatypes ((List!6400 0))(
  ( (Nil!6397) (Cons!6396 (h!7252 (_ BitVec 64)) (t!11560 List!6400)) )
))
(declare-fun arrayNoDuplicates!0 (array!23171 (_ BitVec 32) List!6400) Bool)

(assert (=> b!390663 (= res!223567 (arrayNoDuplicates!0 lt!184166 #b00000000000000000000000000000000 Nil!6397))))

(declare-fun b!390664 () Bool)

(declare-fun res!223574 () Bool)

(declare-fun e!236638 () Bool)

(assert (=> b!390664 (=> (not res!223574) (not e!236638))))

(assert (=> b!390664 (= res!223574 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6397))))

(declare-fun mapNonEmpty!16032 () Bool)

(declare-fun mapRes!16032 () Bool)

(declare-fun tp!31655 () Bool)

(assert (=> mapNonEmpty!16032 (= mapRes!16032 (and tp!31655 e!236637))))

(declare-fun mapRest!16032 () (Array (_ BitVec 32) ValueCell!4474))

(declare-fun mapKey!16032 () (_ BitVec 32))

(declare-fun mapValue!16032 () ValueCell!4474)

(assert (=> mapNonEmpty!16032 (= (arr!11048 _values!506) (store mapRest!16032 mapKey!16032 mapValue!16032))))

(declare-fun b!390665 () Bool)

(declare-fun res!223573 () Bool)

(assert (=> b!390665 (=> (not res!223573) (not e!236638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390665 (= res!223573 (validKeyInArray!0 k!778))))

(declare-fun b!390666 () Bool)

(declare-fun e!236636 () Bool)

(assert (=> b!390666 (= e!236636 tp_is_empty!9635)))

(declare-fun b!390667 () Bool)

(declare-fun res!223568 () Bool)

(assert (=> b!390667 (=> (not res!223568) (not e!236638))))

(declare-fun arrayContainsKey!0 (array!23171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390667 (= res!223568 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!390668 () Bool)

(declare-fun lt!184173 () tuple2!6544)

(assert (=> b!390668 (= e!236633 (= lt!184172 (+!1039 lt!184165 lt!184173)))))

(assert (=> b!390668 (= lt!184169 (+!1039 lt!184168 lt!184173))))

(assert (=> b!390668 (= lt!184173 (tuple2!6545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390669 () Bool)

(declare-fun res!223572 () Bool)

(assert (=> b!390669 (=> (not res!223572) (not e!236638))))

(assert (=> b!390669 (= res!223572 (and (= (size!11400 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11401 _keys!658) (size!11400 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390670 () Bool)

(declare-fun e!236635 () Bool)

(assert (=> b!390670 (= e!236635 (and e!236636 mapRes!16032))))

(declare-fun condMapEmpty!16032 () Bool)

(declare-fun mapDefault!16032 () ValueCell!4474)

