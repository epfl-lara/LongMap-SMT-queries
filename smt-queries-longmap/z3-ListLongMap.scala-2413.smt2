; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38170 () Bool)

(assert start!38170)

(declare-fun b_free!9043 () Bool)

(declare-fun b_next!9043 () Bool)

(assert (=> start!38170 (= b_free!9043 (not b_next!9043))))

(declare-fun tp!31914 () Bool)

(declare-fun b_and!16391 () Bool)

(assert (=> start!38170 (= tp!31914 b_and!16391)))

(declare-fun res!225407 () Bool)

(declare-fun e!238168 () Bool)

(assert (=> start!38170 (=> (not res!225407) (not e!238168))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38170 (= res!225407 (validMask!0 mask!970))))

(assert (=> start!38170 e!238168))

(declare-datatypes ((V!14059 0))(
  ( (V!14060 (val!4902 Int)) )
))
(declare-datatypes ((ValueCell!4514 0))(
  ( (ValueCellFull!4514 (v!7137 V!14059)) (EmptyCell!4514) )
))
(declare-datatypes ((array!23321 0))(
  ( (array!23322 (arr!11118 (Array (_ BitVec 32) ValueCell!4514)) (size!11471 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23321)

(declare-fun e!238166 () Bool)

(declare-fun array_inv!8164 (array!23321) Bool)

(assert (=> start!38170 (and (array_inv!8164 _values!506) e!238166)))

(assert (=> start!38170 tp!31914))

(assert (=> start!38170 true))

(declare-fun tp_is_empty!9715 () Bool)

(assert (=> start!38170 tp_is_empty!9715))

(declare-datatypes ((array!23323 0))(
  ( (array!23324 (arr!11119 (Array (_ BitVec 32) (_ BitVec 64))) (size!11472 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23323)

(declare-fun array_inv!8165 (array!23323) Bool)

(assert (=> start!38170 (array_inv!8165 _keys!658)))

(declare-fun b!393387 () Bool)

(declare-fun res!225409 () Bool)

(assert (=> b!393387 (=> (not res!225409) (not e!238168))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393387 (= res!225409 (or (= (select (arr!11119 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11119 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393388 () Bool)

(declare-fun e!238165 () Bool)

(assert (=> b!393388 (= e!238168 e!238165)))

(declare-fun res!225411 () Bool)

(assert (=> b!393388 (=> (not res!225411) (not e!238165))))

(declare-fun lt!186124 () array!23323)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23323 (_ BitVec 32)) Bool)

(assert (=> b!393388 (= res!225411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186124 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!393388 (= lt!186124 (array!23324 (store (arr!11119 _keys!658) i!548 k0!778) (size!11472 _keys!658)))))

(declare-fun b!393389 () Bool)

(declare-fun res!225401 () Bool)

(assert (=> b!393389 (=> (not res!225401) (not e!238168))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393389 (= res!225401 (and (= (size!11471 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11472 _keys!658) (size!11471 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393390 () Bool)

(declare-fun e!238169 () Bool)

(declare-fun mapRes!16170 () Bool)

(assert (=> b!393390 (= e!238166 (and e!238169 mapRes!16170))))

(declare-fun condMapEmpty!16170 () Bool)

(declare-fun mapDefault!16170 () ValueCell!4514)

(assert (=> b!393390 (= condMapEmpty!16170 (= (arr!11118 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4514)) mapDefault!16170)))))

(declare-fun b!393391 () Bool)

(declare-fun res!225404 () Bool)

(assert (=> b!393391 (=> (not res!225404) (not e!238168))))

(declare-fun arrayContainsKey!0 (array!23323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393391 (= res!225404 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393392 () Bool)

(declare-fun e!238170 () Bool)

(assert (=> b!393392 (= e!238165 (not e!238170))))

(declare-fun res!225408 () Bool)

(assert (=> b!393392 (=> res!225408 e!238170)))

(declare-fun lt!186125 () Bool)

(assert (=> b!393392 (= res!225408 (or (and (not lt!186125) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186125) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186125)))))

(assert (=> b!393392 (= lt!186125 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6586 0))(
  ( (tuple2!6587 (_1!3304 (_ BitVec 64)) (_2!3304 V!14059)) )
))
(declare-datatypes ((List!6427 0))(
  ( (Nil!6424) (Cons!6423 (h!7279 tuple2!6586) (t!11590 List!6427)) )
))
(declare-datatypes ((ListLongMap!5489 0))(
  ( (ListLongMap!5490 (toList!2760 List!6427)) )
))
(declare-fun lt!186126 () ListLongMap!5489)

(declare-fun zeroValue!472 () V!14059)

(declare-fun minValue!472 () V!14059)

(declare-fun getCurrentListMap!2075 (array!23323 array!23321 (_ BitVec 32) (_ BitVec 32) V!14059 V!14059 (_ BitVec 32) Int) ListLongMap!5489)

(assert (=> b!393392 (= lt!186126 (getCurrentListMap!2075 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186127 () array!23321)

(declare-fun lt!186130 () ListLongMap!5489)

(assert (=> b!393392 (= lt!186130 (getCurrentListMap!2075 lt!186124 lt!186127 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186128 () ListLongMap!5489)

(declare-fun lt!186132 () ListLongMap!5489)

(assert (=> b!393392 (and (= lt!186128 lt!186132) (= lt!186132 lt!186128))))

(declare-fun v!373 () V!14059)

(declare-fun lt!186129 () ListLongMap!5489)

(declare-fun +!1080 (ListLongMap!5489 tuple2!6586) ListLongMap!5489)

(assert (=> b!393392 (= lt!186132 (+!1080 lt!186129 (tuple2!6587 k0!778 v!373)))))

(declare-datatypes ((Unit!12010 0))(
  ( (Unit!12011) )
))
(declare-fun lt!186131 () Unit!12010)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!276 (array!23323 array!23321 (_ BitVec 32) (_ BitVec 32) V!14059 V!14059 (_ BitVec 32) (_ BitVec 64) V!14059 (_ BitVec 32) Int) Unit!12010)

(assert (=> b!393392 (= lt!186131 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!276 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!985 (array!23323 array!23321 (_ BitVec 32) (_ BitVec 32) V!14059 V!14059 (_ BitVec 32) Int) ListLongMap!5489)

(assert (=> b!393392 (= lt!186128 (getCurrentListMapNoExtraKeys!985 lt!186124 lt!186127 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393392 (= lt!186127 (array!23322 (store (arr!11118 _values!506) i!548 (ValueCellFull!4514 v!373)) (size!11471 _values!506)))))

(assert (=> b!393392 (= lt!186129 (getCurrentListMapNoExtraKeys!985 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393393 () Bool)

(assert (=> b!393393 (= e!238170 true)))

(assert (=> b!393393 (= lt!186130 lt!186128)))

(declare-fun b!393394 () Bool)

(assert (=> b!393394 (= e!238169 tp_is_empty!9715)))

(declare-fun b!393395 () Bool)

(declare-fun res!225402 () Bool)

(assert (=> b!393395 (=> (not res!225402) (not e!238168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393395 (= res!225402 (validKeyInArray!0 k0!778))))

(declare-fun b!393396 () Bool)

(declare-fun res!225410 () Bool)

(assert (=> b!393396 (=> (not res!225410) (not e!238168))))

(declare-datatypes ((List!6428 0))(
  ( (Nil!6425) (Cons!6424 (h!7280 (_ BitVec 64)) (t!11591 List!6428)) )
))
(declare-fun arrayNoDuplicates!0 (array!23323 (_ BitVec 32) List!6428) Bool)

(assert (=> b!393396 (= res!225410 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6425))))

(declare-fun b!393397 () Bool)

(declare-fun res!225403 () Bool)

(assert (=> b!393397 (=> (not res!225403) (not e!238168))))

(assert (=> b!393397 (= res!225403 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11472 _keys!658))))))

(declare-fun b!393398 () Bool)

(declare-fun res!225405 () Bool)

(assert (=> b!393398 (=> (not res!225405) (not e!238168))))

(assert (=> b!393398 (= res!225405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393399 () Bool)

(declare-fun e!238167 () Bool)

(assert (=> b!393399 (= e!238167 tp_is_empty!9715)))

(declare-fun mapIsEmpty!16170 () Bool)

(assert (=> mapIsEmpty!16170 mapRes!16170))

(declare-fun b!393400 () Bool)

(declare-fun res!225406 () Bool)

(assert (=> b!393400 (=> (not res!225406) (not e!238165))))

(assert (=> b!393400 (= res!225406 (arrayNoDuplicates!0 lt!186124 #b00000000000000000000000000000000 Nil!6425))))

(declare-fun mapNonEmpty!16170 () Bool)

(declare-fun tp!31913 () Bool)

(assert (=> mapNonEmpty!16170 (= mapRes!16170 (and tp!31913 e!238167))))

(declare-fun mapValue!16170 () ValueCell!4514)

(declare-fun mapRest!16170 () (Array (_ BitVec 32) ValueCell!4514))

(declare-fun mapKey!16170 () (_ BitVec 32))

(assert (=> mapNonEmpty!16170 (= (arr!11118 _values!506) (store mapRest!16170 mapKey!16170 mapValue!16170))))

(assert (= (and start!38170 res!225407) b!393389))

(assert (= (and b!393389 res!225401) b!393398))

(assert (= (and b!393398 res!225405) b!393396))

(assert (= (and b!393396 res!225410) b!393397))

(assert (= (and b!393397 res!225403) b!393395))

(assert (= (and b!393395 res!225402) b!393387))

(assert (= (and b!393387 res!225409) b!393391))

(assert (= (and b!393391 res!225404) b!393388))

(assert (= (and b!393388 res!225411) b!393400))

(assert (= (and b!393400 res!225406) b!393392))

(assert (= (and b!393392 (not res!225408)) b!393393))

(assert (= (and b!393390 condMapEmpty!16170) mapIsEmpty!16170))

(assert (= (and b!393390 (not condMapEmpty!16170)) mapNonEmpty!16170))

(get-info :version)

(assert (= (and mapNonEmpty!16170 ((_ is ValueCellFull!4514) mapValue!16170)) b!393399))

(assert (= (and b!393390 ((_ is ValueCellFull!4514) mapDefault!16170)) b!393394))

(assert (= start!38170 b!393390))

(declare-fun m!389399 () Bool)

(assert (=> b!393398 m!389399))

(declare-fun m!389401 () Bool)

(assert (=> b!393388 m!389401))

(declare-fun m!389403 () Bool)

(assert (=> b!393388 m!389403))

(declare-fun m!389405 () Bool)

(assert (=> b!393392 m!389405))

(declare-fun m!389407 () Bool)

(assert (=> b!393392 m!389407))

(declare-fun m!389409 () Bool)

(assert (=> b!393392 m!389409))

(declare-fun m!389411 () Bool)

(assert (=> b!393392 m!389411))

(declare-fun m!389413 () Bool)

(assert (=> b!393392 m!389413))

(declare-fun m!389415 () Bool)

(assert (=> b!393392 m!389415))

(declare-fun m!389417 () Bool)

(assert (=> b!393392 m!389417))

(declare-fun m!389419 () Bool)

(assert (=> b!393395 m!389419))

(declare-fun m!389421 () Bool)

(assert (=> b!393387 m!389421))

(declare-fun m!389423 () Bool)

(assert (=> b!393396 m!389423))

(declare-fun m!389425 () Bool)

(assert (=> b!393391 m!389425))

(declare-fun m!389427 () Bool)

(assert (=> mapNonEmpty!16170 m!389427))

(declare-fun m!389429 () Bool)

(assert (=> start!38170 m!389429))

(declare-fun m!389431 () Bool)

(assert (=> start!38170 m!389431))

(declare-fun m!389433 () Bool)

(assert (=> start!38170 m!389433))

(declare-fun m!389435 () Bool)

(assert (=> b!393400 m!389435))

(check-sat (not b!393391) (not b!393398) (not b!393388) (not b_next!9043) (not b!393400) tp_is_empty!9715 (not mapNonEmpty!16170) (not b!393392) (not b!393396) (not b!393395) b_and!16391 (not start!38170))
(check-sat b_and!16391 (not b_next!9043))
