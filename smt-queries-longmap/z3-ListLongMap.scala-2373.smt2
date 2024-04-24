; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37686 () Bool)

(assert start!37686)

(declare-fun b_free!8803 () Bool)

(declare-fun b_next!8803 () Bool)

(assert (=> start!37686 (= b_free!8803 (not b_next!8803))))

(declare-fun tp!31161 () Bool)

(declare-fun b_and!16059 () Bool)

(assert (=> start!37686 (= tp!31161 b_and!16059)))

(declare-fun b!386314 () Bool)

(declare-fun e!234361 () Bool)

(declare-fun tp_is_empty!9475 () Bool)

(assert (=> b!386314 (= e!234361 tp_is_empty!9475)))

(declare-fun mapNonEmpty!15777 () Bool)

(declare-fun mapRes!15777 () Bool)

(declare-fun tp!31160 () Bool)

(assert (=> mapNonEmpty!15777 (= mapRes!15777 (and tp!31160 e!234361))))

(declare-datatypes ((V!13739 0))(
  ( (V!13740 (val!4782 Int)) )
))
(declare-datatypes ((ValueCell!4394 0))(
  ( (ValueCellFull!4394 (v!6980 V!13739)) (EmptyCell!4394) )
))
(declare-fun mapRest!15777 () (Array (_ BitVec 32) ValueCell!4394))

(declare-fun mapKey!15777 () (_ BitVec 32))

(declare-fun mapValue!15777 () ValueCell!4394)

(declare-datatypes ((array!22836 0))(
  ( (array!22837 (arr!10886 (Array (_ BitVec 32) ValueCell!4394)) (size!11238 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22836)

(assert (=> mapNonEmpty!15777 (= (arr!10886 _values!506) (store mapRest!15777 mapKey!15777 mapValue!15777))))

(declare-fun b!386315 () Bool)

(declare-fun res!220548 () Bool)

(declare-fun e!234365 () Bool)

(assert (=> b!386315 (=> (not res!220548) (not e!234365))))

(declare-datatypes ((array!22838 0))(
  ( (array!22839 (arr!10887 (Array (_ BitVec 32) (_ BitVec 64))) (size!11239 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22838)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386315 (= res!220548 (or (= (select (arr!10887 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10887 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386316 () Bool)

(declare-fun res!220550 () Bool)

(declare-fun e!234363 () Bool)

(assert (=> b!386316 (=> (not res!220550) (not e!234363))))

(declare-fun lt!181810 () array!22838)

(declare-datatypes ((List!6142 0))(
  ( (Nil!6139) (Cons!6138 (h!6994 (_ BitVec 64)) (t!11284 List!6142)) )
))
(declare-fun arrayNoDuplicates!0 (array!22838 (_ BitVec 32) List!6142) Bool)

(assert (=> b!386316 (= res!220550 (arrayNoDuplicates!0 lt!181810 #b00000000000000000000000000000000 Nil!6139))))

(declare-fun b!386317 () Bool)

(declare-fun res!220551 () Bool)

(assert (=> b!386317 (=> (not res!220551) (not e!234365))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386317 (= res!220551 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386318 () Bool)

(declare-fun e!234366 () Bool)

(assert (=> b!386318 (= e!234366 tp_is_empty!9475)))

(declare-fun b!386319 () Bool)

(declare-fun res!220547 () Bool)

(assert (=> b!386319 (=> (not res!220547) (not e!234365))))

(assert (=> b!386319 (= res!220547 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11239 _keys!658))))))

(declare-fun b!386320 () Bool)

(declare-fun e!234362 () Bool)

(assert (=> b!386320 (= e!234362 (and e!234366 mapRes!15777))))

(declare-fun condMapEmpty!15777 () Bool)

(declare-fun mapDefault!15777 () ValueCell!4394)

(assert (=> b!386320 (= condMapEmpty!15777 (= (arr!10886 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4394)) mapDefault!15777)))))

(declare-fun res!220552 () Bool)

(assert (=> start!37686 (=> (not res!220552) (not e!234365))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37686 (= res!220552 (validMask!0 mask!970))))

(assert (=> start!37686 e!234365))

(declare-fun array_inv!8046 (array!22836) Bool)

(assert (=> start!37686 (and (array_inv!8046 _values!506) e!234362)))

(assert (=> start!37686 tp!31161))

(assert (=> start!37686 true))

(assert (=> start!37686 tp_is_empty!9475))

(declare-fun array_inv!8047 (array!22838) Bool)

(assert (=> start!37686 (array_inv!8047 _keys!658)))

(declare-fun mapIsEmpty!15777 () Bool)

(assert (=> mapIsEmpty!15777 mapRes!15777))

(declare-fun b!386321 () Bool)

(assert (=> b!386321 (= e!234363 false)))

(declare-datatypes ((tuple2!6292 0))(
  ( (tuple2!6293 (_1!3157 (_ BitVec 64)) (_2!3157 V!13739)) )
))
(declare-datatypes ((List!6143 0))(
  ( (Nil!6140) (Cons!6139 (h!6995 tuple2!6292) (t!11285 List!6143)) )
))
(declare-datatypes ((ListLongMap!5207 0))(
  ( (ListLongMap!5208 (toList!2619 List!6143)) )
))
(declare-fun lt!181809 () ListLongMap!5207)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13739)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13739)

(declare-fun minValue!472 () V!13739)

(declare-fun getCurrentListMapNoExtraKeys!894 (array!22838 array!22836 (_ BitVec 32) (_ BitVec 32) V!13739 V!13739 (_ BitVec 32) Int) ListLongMap!5207)

(assert (=> b!386321 (= lt!181809 (getCurrentListMapNoExtraKeys!894 lt!181810 (array!22837 (store (arr!10886 _values!506) i!548 (ValueCellFull!4394 v!373)) (size!11238 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181808 () ListLongMap!5207)

(assert (=> b!386321 (= lt!181808 (getCurrentListMapNoExtraKeys!894 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386322 () Bool)

(declare-fun res!220544 () Bool)

(assert (=> b!386322 (=> (not res!220544) (not e!234365))))

(assert (=> b!386322 (= res!220544 (and (= (size!11238 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11239 _keys!658) (size!11238 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386323 () Bool)

(declare-fun res!220549 () Bool)

(assert (=> b!386323 (=> (not res!220549) (not e!234365))))

(assert (=> b!386323 (= res!220549 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6139))))

(declare-fun b!386324 () Bool)

(declare-fun res!220553 () Bool)

(assert (=> b!386324 (=> (not res!220553) (not e!234365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22838 (_ BitVec 32)) Bool)

(assert (=> b!386324 (= res!220553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386325 () Bool)

(declare-fun res!220546 () Bool)

(assert (=> b!386325 (=> (not res!220546) (not e!234365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386325 (= res!220546 (validKeyInArray!0 k0!778))))

(declare-fun b!386326 () Bool)

(assert (=> b!386326 (= e!234365 e!234363)))

(declare-fun res!220545 () Bool)

(assert (=> b!386326 (=> (not res!220545) (not e!234363))))

(assert (=> b!386326 (= res!220545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181810 mask!970))))

(assert (=> b!386326 (= lt!181810 (array!22839 (store (arr!10887 _keys!658) i!548 k0!778) (size!11239 _keys!658)))))

(assert (= (and start!37686 res!220552) b!386322))

(assert (= (and b!386322 res!220544) b!386324))

(assert (= (and b!386324 res!220553) b!386323))

(assert (= (and b!386323 res!220549) b!386319))

(assert (= (and b!386319 res!220547) b!386325))

(assert (= (and b!386325 res!220546) b!386315))

(assert (= (and b!386315 res!220548) b!386317))

(assert (= (and b!386317 res!220551) b!386326))

(assert (= (and b!386326 res!220545) b!386316))

(assert (= (and b!386316 res!220550) b!386321))

(assert (= (and b!386320 condMapEmpty!15777) mapIsEmpty!15777))

(assert (= (and b!386320 (not condMapEmpty!15777)) mapNonEmpty!15777))

(get-info :version)

(assert (= (and mapNonEmpty!15777 ((_ is ValueCellFull!4394) mapValue!15777)) b!386314))

(assert (= (and b!386320 ((_ is ValueCellFull!4394) mapDefault!15777)) b!386318))

(assert (= start!37686 b!386320))

(declare-fun m!382955 () Bool)

(assert (=> b!386323 m!382955))

(declare-fun m!382957 () Bool)

(assert (=> b!386321 m!382957))

(declare-fun m!382959 () Bool)

(assert (=> b!386321 m!382959))

(declare-fun m!382961 () Bool)

(assert (=> b!386321 m!382961))

(declare-fun m!382963 () Bool)

(assert (=> start!37686 m!382963))

(declare-fun m!382965 () Bool)

(assert (=> start!37686 m!382965))

(declare-fun m!382967 () Bool)

(assert (=> start!37686 m!382967))

(declare-fun m!382969 () Bool)

(assert (=> b!386324 m!382969))

(declare-fun m!382971 () Bool)

(assert (=> b!386315 m!382971))

(declare-fun m!382973 () Bool)

(assert (=> b!386325 m!382973))

(declare-fun m!382975 () Bool)

(assert (=> mapNonEmpty!15777 m!382975))

(declare-fun m!382977 () Bool)

(assert (=> b!386316 m!382977))

(declare-fun m!382979 () Bool)

(assert (=> b!386317 m!382979))

(declare-fun m!382981 () Bool)

(assert (=> b!386326 m!382981))

(declare-fun m!382983 () Bool)

(assert (=> b!386326 m!382983))

(check-sat (not b!386324) (not start!37686) (not b!386316) (not b!386325) b_and!16059 tp_is_empty!9475 (not b!386323) (not b_next!8803) (not b!386321) (not b!386317) (not mapNonEmpty!15777) (not b!386326))
(check-sat b_and!16059 (not b_next!8803))
