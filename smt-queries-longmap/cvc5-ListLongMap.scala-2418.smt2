; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38236 () Bool)

(assert start!38236)

(declare-fun b_free!9073 () Bool)

(declare-fun b_next!9073 () Bool)

(assert (=> start!38236 (= b_free!9073 (not b_next!9073))))

(declare-fun tp!32006 () Bool)

(declare-fun b_and!16459 () Bool)

(assert (=> start!38236 (= tp!32006 b_and!16459)))

(declare-fun b!394498 () Bool)

(declare-fun res!226133 () Bool)

(declare-fun e!238799 () Bool)

(assert (=> b!394498 (=> (not res!226133) (not e!238799))))

(declare-datatypes ((array!23399 0))(
  ( (array!23400 (arr!11156 (Array (_ BitVec 32) (_ BitVec 64))) (size!11508 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23399)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!394498 (= res!226133 (or (= (select (arr!11156 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11156 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394499 () Bool)

(declare-fun res!226123 () Bool)

(assert (=> b!394499 (=> (not res!226123) (not e!238799))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394499 (= res!226123 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!394500 () Bool)

(declare-fun e!238798 () Bool)

(assert (=> b!394500 (= e!238798 true)))

(declare-datatypes ((V!14099 0))(
  ( (V!14100 (val!4917 Int)) )
))
(declare-datatypes ((tuple2!6640 0))(
  ( (tuple2!6641 (_1!3331 (_ BitVec 64)) (_2!3331 V!14099)) )
))
(declare-datatypes ((List!6493 0))(
  ( (Nil!6490) (Cons!6489 (h!7345 tuple2!6640) (t!11667 List!6493)) )
))
(declare-datatypes ((ListLongMap!5553 0))(
  ( (ListLongMap!5554 (toList!2792 List!6493)) )
))
(declare-fun lt!186958 () ListLongMap!5553)

(declare-fun lt!186950 () ListLongMap!5553)

(declare-fun lt!186952 () tuple2!6640)

(declare-fun +!1085 (ListLongMap!5553 tuple2!6640) ListLongMap!5553)

(assert (=> b!394500 (= lt!186958 (+!1085 lt!186950 lt!186952))))

(declare-fun lt!186951 () ListLongMap!5553)

(declare-fun lt!186960 () ListLongMap!5553)

(assert (=> b!394500 (= lt!186951 lt!186960)))

(declare-fun b!394501 () Bool)

(declare-fun res!226130 () Bool)

(assert (=> b!394501 (=> (not res!226130) (not e!238799))))

(declare-datatypes ((List!6494 0))(
  ( (Nil!6491) (Cons!6490 (h!7346 (_ BitVec 64)) (t!11668 List!6494)) )
))
(declare-fun arrayNoDuplicates!0 (array!23399 (_ BitVec 32) List!6494) Bool)

(assert (=> b!394501 (= res!226130 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6491))))

(declare-fun mapNonEmpty!16218 () Bool)

(declare-fun mapRes!16218 () Bool)

(declare-fun tp!32007 () Bool)

(declare-fun e!238797 () Bool)

(assert (=> mapNonEmpty!16218 (= mapRes!16218 (and tp!32007 e!238797))))

(declare-fun mapKey!16218 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4529 0))(
  ( (ValueCellFull!4529 (v!7162 V!14099)) (EmptyCell!4529) )
))
(declare-fun mapRest!16218 () (Array (_ BitVec 32) ValueCell!4529))

(declare-fun mapValue!16218 () ValueCell!4529)

(declare-datatypes ((array!23401 0))(
  ( (array!23402 (arr!11157 (Array (_ BitVec 32) ValueCell!4529)) (size!11509 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23401)

(assert (=> mapNonEmpty!16218 (= (arr!11157 _values!506) (store mapRest!16218 mapKey!16218 mapValue!16218))))

(declare-fun b!394502 () Bool)

(declare-fun e!238793 () Bool)

(declare-fun tp_is_empty!9745 () Bool)

(assert (=> b!394502 (= e!238793 tp_is_empty!9745)))

(declare-fun b!394503 () Bool)

(assert (=> b!394503 (= e!238797 tp_is_empty!9745)))

(declare-fun b!394504 () Bool)

(declare-fun res!226132 () Bool)

(declare-fun e!238795 () Bool)

(assert (=> b!394504 (=> (not res!226132) (not e!238795))))

(declare-fun lt!186956 () array!23399)

(assert (=> b!394504 (= res!226132 (arrayNoDuplicates!0 lt!186956 #b00000000000000000000000000000000 Nil!6491))))

(declare-fun b!394505 () Bool)

(declare-fun res!226131 () Bool)

(assert (=> b!394505 (=> (not res!226131) (not e!238799))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23399 (_ BitVec 32)) Bool)

(assert (=> b!394505 (= res!226131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!226124 () Bool)

(assert (=> start!38236 (=> (not res!226124) (not e!238799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38236 (= res!226124 (validMask!0 mask!970))))

(assert (=> start!38236 e!238799))

(declare-fun e!238794 () Bool)

(declare-fun array_inv!8190 (array!23401) Bool)

(assert (=> start!38236 (and (array_inv!8190 _values!506) e!238794)))

(assert (=> start!38236 tp!32006))

(assert (=> start!38236 true))

(assert (=> start!38236 tp_is_empty!9745))

(declare-fun array_inv!8191 (array!23399) Bool)

(assert (=> start!38236 (array_inv!8191 _keys!658)))

(declare-fun mapIsEmpty!16218 () Bool)

(assert (=> mapIsEmpty!16218 mapRes!16218))

(declare-fun b!394506 () Bool)

(declare-fun res!226126 () Bool)

(assert (=> b!394506 (=> (not res!226126) (not e!238799))))

(assert (=> b!394506 (= res!226126 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11508 _keys!658))))))

(declare-fun b!394507 () Bool)

(assert (=> b!394507 (= e!238795 (not e!238798))))

(declare-fun res!226128 () Bool)

(assert (=> b!394507 (=> res!226128 e!238798)))

(declare-fun lt!186954 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394507 (= res!226128 (or (and (not lt!186954) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186954) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186954)))))

(assert (=> b!394507 (= lt!186954 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14099)

(declare-fun minValue!472 () V!14099)

(declare-fun getCurrentListMap!2131 (array!23399 array!23401 (_ BitVec 32) (_ BitVec 32) V!14099 V!14099 (_ BitVec 32) Int) ListLongMap!5553)

(assert (=> b!394507 (= lt!186950 (getCurrentListMap!2131 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186959 () array!23401)

(assert (=> b!394507 (= lt!186951 (getCurrentListMap!2131 lt!186956 lt!186959 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186957 () ListLongMap!5553)

(assert (=> b!394507 (and (= lt!186960 lt!186957) (= lt!186957 lt!186960))))

(declare-fun lt!186955 () ListLongMap!5553)

(assert (=> b!394507 (= lt!186957 (+!1085 lt!186955 lt!186952))))

(declare-fun v!373 () V!14099)

(assert (=> b!394507 (= lt!186952 (tuple2!6641 k!778 v!373))))

(declare-datatypes ((Unit!12060 0))(
  ( (Unit!12061) )
))
(declare-fun lt!186953 () Unit!12060)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!295 (array!23399 array!23401 (_ BitVec 32) (_ BitVec 32) V!14099 V!14099 (_ BitVec 32) (_ BitVec 64) V!14099 (_ BitVec 32) Int) Unit!12060)

(assert (=> b!394507 (= lt!186953 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!295 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1011 (array!23399 array!23401 (_ BitVec 32) (_ BitVec 32) V!14099 V!14099 (_ BitVec 32) Int) ListLongMap!5553)

(assert (=> b!394507 (= lt!186960 (getCurrentListMapNoExtraKeys!1011 lt!186956 lt!186959 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394507 (= lt!186959 (array!23402 (store (arr!11157 _values!506) i!548 (ValueCellFull!4529 v!373)) (size!11509 _values!506)))))

(assert (=> b!394507 (= lt!186955 (getCurrentListMapNoExtraKeys!1011 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394508 () Bool)

(assert (=> b!394508 (= e!238799 e!238795)))

(declare-fun res!226127 () Bool)

(assert (=> b!394508 (=> (not res!226127) (not e!238795))))

(assert (=> b!394508 (= res!226127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186956 mask!970))))

(assert (=> b!394508 (= lt!186956 (array!23400 (store (arr!11156 _keys!658) i!548 k!778) (size!11508 _keys!658)))))

(declare-fun b!394509 () Bool)

(declare-fun res!226129 () Bool)

(assert (=> b!394509 (=> (not res!226129) (not e!238799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394509 (= res!226129 (validKeyInArray!0 k!778))))

(declare-fun b!394510 () Bool)

(assert (=> b!394510 (= e!238794 (and e!238793 mapRes!16218))))

(declare-fun condMapEmpty!16218 () Bool)

(declare-fun mapDefault!16218 () ValueCell!4529)

