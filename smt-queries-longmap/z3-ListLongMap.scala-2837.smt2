; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40972 () Bool)

(assert start!40972)

(declare-fun b_free!10921 () Bool)

(declare-fun b_next!10921 () Bool)

(assert (=> start!40972 (= b_free!10921 (not b_next!10921))))

(declare-fun tp!38590 () Bool)

(declare-fun b_and!19037 () Bool)

(assert (=> start!40972 (= tp!38590 b_and!19037)))

(declare-fun b!456078 () Bool)

(declare-fun e!266473 () Bool)

(declare-fun tp_is_empty!12259 () Bool)

(assert (=> b!456078 (= e!266473 tp_is_empty!12259)))

(declare-fun b!456079 () Bool)

(declare-fun e!266475 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28309 0))(
  ( (array!28310 (arr!13598 (Array (_ BitVec 32) (_ BitVec 64))) (size!13951 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28309)

(assert (=> b!456079 (= e!266475 (not (bvslt from!863 (size!13951 _keys!709))))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17451 0))(
  ( (V!17452 (val!6174 Int)) )
))
(declare-datatypes ((ValueCell!5786 0))(
  ( (ValueCellFull!5786 (v!8434 V!17451)) (EmptyCell!5786) )
))
(declare-datatypes ((array!28311 0))(
  ( (array!28312 (arr!13599 (Array (_ BitVec 32) ValueCell!5786)) (size!13952 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28311)

(declare-fun zeroValue!515 () V!17451)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!206287 () array!28309)

(declare-fun v!412 () V!17451)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!206288 () array!28311)

(declare-fun minValue!515 () V!17451)

(declare-datatypes ((tuple2!8150 0))(
  ( (tuple2!8151 (_1!4086 (_ BitVec 64)) (_2!4086 V!17451)) )
))
(declare-datatypes ((List!8212 0))(
  ( (Nil!8209) (Cons!8208 (h!9064 tuple2!8150) (t!14031 List!8212)) )
))
(declare-datatypes ((ListLongMap!7053 0))(
  ( (ListLongMap!7054 (toList!3542 List!8212)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1737 (array!28309 array!28311 (_ BitVec 32) (_ BitVec 32) V!17451 V!17451 (_ BitVec 32) Int) ListLongMap!7053)

(declare-fun +!1597 (ListLongMap!7053 tuple2!8150) ListLongMap!7053)

(assert (=> b!456079 (= (getCurrentListMapNoExtraKeys!1737 lt!206287 lt!206288 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1597 (getCurrentListMapNoExtraKeys!1737 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8151 k0!794 v!412)))))

(declare-datatypes ((Unit!13243 0))(
  ( (Unit!13244) )
))
(declare-fun lt!206289 () Unit!13243)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!734 (array!28309 array!28311 (_ BitVec 32) (_ BitVec 32) V!17451 V!17451 (_ BitVec 32) (_ BitVec 64) V!17451 (_ BitVec 32) Int) Unit!13243)

(assert (=> b!456079 (= lt!206289 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!734 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!272169 () Bool)

(declare-fun e!266476 () Bool)

(assert (=> start!40972 (=> (not res!272169) (not e!266476))))

(assert (=> start!40972 (= res!272169 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13951 _keys!709))))))

(assert (=> start!40972 e!266476))

(assert (=> start!40972 tp_is_empty!12259))

(assert (=> start!40972 tp!38590))

(assert (=> start!40972 true))

(declare-fun e!266474 () Bool)

(declare-fun array_inv!9908 (array!28311) Bool)

(assert (=> start!40972 (and (array_inv!9908 _values!549) e!266474)))

(declare-fun array_inv!9909 (array!28309) Bool)

(assert (=> start!40972 (array_inv!9909 _keys!709)))

(declare-fun b!456080 () Bool)

(declare-fun res!272171 () Bool)

(assert (=> b!456080 (=> (not res!272171) (not e!266476))))

(assert (=> b!456080 (= res!272171 (or (= (select (arr!13598 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13598 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456081 () Bool)

(declare-fun res!272166 () Bool)

(assert (=> b!456081 (=> (not res!272166) (not e!266476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28309 (_ BitVec 32)) Bool)

(assert (=> b!456081 (= res!272166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456082 () Bool)

(declare-fun e!266471 () Bool)

(declare-fun mapRes!20029 () Bool)

(assert (=> b!456082 (= e!266474 (and e!266471 mapRes!20029))))

(declare-fun condMapEmpty!20029 () Bool)

(declare-fun mapDefault!20029 () ValueCell!5786)

(assert (=> b!456082 (= condMapEmpty!20029 (= (arr!13599 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5786)) mapDefault!20029)))))

(declare-fun mapNonEmpty!20029 () Bool)

(declare-fun tp!38589 () Bool)

(assert (=> mapNonEmpty!20029 (= mapRes!20029 (and tp!38589 e!266473))))

(declare-fun mapKey!20029 () (_ BitVec 32))

(declare-fun mapValue!20029 () ValueCell!5786)

(declare-fun mapRest!20029 () (Array (_ BitVec 32) ValueCell!5786))

(assert (=> mapNonEmpty!20029 (= (arr!13599 _values!549) (store mapRest!20029 mapKey!20029 mapValue!20029))))

(declare-fun b!456083 () Bool)

(declare-fun res!272170 () Bool)

(declare-fun e!266470 () Bool)

(assert (=> b!456083 (=> (not res!272170) (not e!266470))))

(assert (=> b!456083 (= res!272170 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!20029 () Bool)

(assert (=> mapIsEmpty!20029 mapRes!20029))

(declare-fun b!456084 () Bool)

(assert (=> b!456084 (= e!266470 e!266475)))

(declare-fun res!272165 () Bool)

(assert (=> b!456084 (=> (not res!272165) (not e!266475))))

(assert (=> b!456084 (= res!272165 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206290 () ListLongMap!7053)

(assert (=> b!456084 (= lt!206290 (getCurrentListMapNoExtraKeys!1737 lt!206287 lt!206288 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456084 (= lt!206288 (array!28312 (store (arr!13599 _values!549) i!563 (ValueCellFull!5786 v!412)) (size!13952 _values!549)))))

(declare-fun lt!206291 () ListLongMap!7053)

(assert (=> b!456084 (= lt!206291 (getCurrentListMapNoExtraKeys!1737 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456085 () Bool)

(declare-fun res!272173 () Bool)

(assert (=> b!456085 (=> (not res!272173) (not e!266476))))

(assert (=> b!456085 (= res!272173 (and (= (size!13952 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13951 _keys!709) (size!13952 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456086 () Bool)

(declare-fun res!272168 () Bool)

(assert (=> b!456086 (=> (not res!272168) (not e!266476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456086 (= res!272168 (validMask!0 mask!1025))))

(declare-fun b!456087 () Bool)

(assert (=> b!456087 (= e!266476 e!266470)))

(declare-fun res!272172 () Bool)

(assert (=> b!456087 (=> (not res!272172) (not e!266470))))

(assert (=> b!456087 (= res!272172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206287 mask!1025))))

(assert (=> b!456087 (= lt!206287 (array!28310 (store (arr!13598 _keys!709) i!563 k0!794) (size!13951 _keys!709)))))

(declare-fun b!456088 () Bool)

(assert (=> b!456088 (= e!266471 tp_is_empty!12259)))

(declare-fun b!456089 () Bool)

(declare-fun res!272167 () Bool)

(assert (=> b!456089 (=> (not res!272167) (not e!266476))))

(assert (=> b!456089 (= res!272167 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13951 _keys!709))))))

(declare-fun b!456090 () Bool)

(declare-fun res!272175 () Bool)

(assert (=> b!456090 (=> (not res!272175) (not e!266476))))

(declare-datatypes ((List!8213 0))(
  ( (Nil!8210) (Cons!8209 (h!9065 (_ BitVec 64)) (t!14032 List!8213)) )
))
(declare-fun arrayNoDuplicates!0 (array!28309 (_ BitVec 32) List!8213) Bool)

(assert (=> b!456090 (= res!272175 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8210))))

(declare-fun b!456091 () Bool)

(declare-fun res!272174 () Bool)

(assert (=> b!456091 (=> (not res!272174) (not e!266476))))

(declare-fun arrayContainsKey!0 (array!28309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456091 (= res!272174 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456092 () Bool)

(declare-fun res!272176 () Bool)

(assert (=> b!456092 (=> (not res!272176) (not e!266470))))

(assert (=> b!456092 (= res!272176 (arrayNoDuplicates!0 lt!206287 #b00000000000000000000000000000000 Nil!8210))))

(declare-fun b!456093 () Bool)

(declare-fun res!272177 () Bool)

(assert (=> b!456093 (=> (not res!272177) (not e!266476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456093 (= res!272177 (validKeyInArray!0 k0!794))))

(assert (= (and start!40972 res!272169) b!456086))

(assert (= (and b!456086 res!272168) b!456085))

(assert (= (and b!456085 res!272173) b!456081))

(assert (= (and b!456081 res!272166) b!456090))

(assert (= (and b!456090 res!272175) b!456089))

(assert (= (and b!456089 res!272167) b!456093))

(assert (= (and b!456093 res!272177) b!456080))

(assert (= (and b!456080 res!272171) b!456091))

(assert (= (and b!456091 res!272174) b!456087))

(assert (= (and b!456087 res!272172) b!456092))

(assert (= (and b!456092 res!272176) b!456083))

(assert (= (and b!456083 res!272170) b!456084))

(assert (= (and b!456084 res!272165) b!456079))

(assert (= (and b!456082 condMapEmpty!20029) mapIsEmpty!20029))

(assert (= (and b!456082 (not condMapEmpty!20029)) mapNonEmpty!20029))

(get-info :version)

(assert (= (and mapNonEmpty!20029 ((_ is ValueCellFull!5786) mapValue!20029)) b!456078))

(assert (= (and b!456082 ((_ is ValueCellFull!5786) mapDefault!20029)) b!456088))

(assert (= start!40972 b!456082))

(declare-fun m!439097 () Bool)

(assert (=> b!456092 m!439097))

(declare-fun m!439099 () Bool)

(assert (=> b!456090 m!439099))

(declare-fun m!439101 () Bool)

(assert (=> b!456084 m!439101))

(declare-fun m!439103 () Bool)

(assert (=> b!456084 m!439103))

(declare-fun m!439105 () Bool)

(assert (=> b!456084 m!439105))

(declare-fun m!439107 () Bool)

(assert (=> b!456093 m!439107))

(declare-fun m!439109 () Bool)

(assert (=> b!456081 m!439109))

(declare-fun m!439111 () Bool)

(assert (=> b!456079 m!439111))

(declare-fun m!439113 () Bool)

(assert (=> b!456079 m!439113))

(assert (=> b!456079 m!439113))

(declare-fun m!439115 () Bool)

(assert (=> b!456079 m!439115))

(declare-fun m!439117 () Bool)

(assert (=> b!456079 m!439117))

(declare-fun m!439119 () Bool)

(assert (=> b!456087 m!439119))

(declare-fun m!439121 () Bool)

(assert (=> b!456087 m!439121))

(declare-fun m!439123 () Bool)

(assert (=> start!40972 m!439123))

(declare-fun m!439125 () Bool)

(assert (=> start!40972 m!439125))

(declare-fun m!439127 () Bool)

(assert (=> b!456080 m!439127))

(declare-fun m!439129 () Bool)

(assert (=> mapNonEmpty!20029 m!439129))

(declare-fun m!439131 () Bool)

(assert (=> b!456086 m!439131))

(declare-fun m!439133 () Bool)

(assert (=> b!456091 m!439133))

(check-sat (not b!456081) (not b_next!10921) (not b!456084) (not b!456086) (not b!456087) (not b!456090) (not b!456079) tp_is_empty!12259 (not start!40972) (not b!456092) (not b!456091) b_and!19037 (not mapNonEmpty!20029) (not b!456093))
(check-sat b_and!19037 (not b_next!10921))
