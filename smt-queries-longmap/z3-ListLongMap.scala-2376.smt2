; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37704 () Bool)

(assert start!37704)

(declare-fun b_free!8821 () Bool)

(declare-fun b_next!8821 () Bool)

(assert (=> start!37704 (= b_free!8821 (not b_next!8821))))

(declare-fun tp!31215 () Bool)

(declare-fun b_and!16037 () Bool)

(assert (=> start!37704 (= tp!31215 b_and!16037)))

(declare-fun b!386443 () Bool)

(declare-fun e!234385 () Bool)

(declare-fun tp_is_empty!9493 () Bool)

(assert (=> b!386443 (= e!234385 tp_is_empty!9493)))

(declare-fun mapIsEmpty!15804 () Bool)

(declare-fun mapRes!15804 () Bool)

(assert (=> mapIsEmpty!15804 mapRes!15804))

(declare-fun b!386445 () Bool)

(declare-fun res!220691 () Bool)

(declare-fun e!234384 () Bool)

(assert (=> b!386445 (=> (not res!220691) (not e!234384))))

(declare-datatypes ((array!22869 0))(
  ( (array!22870 (arr!10903 (Array (_ BitVec 32) (_ BitVec 64))) (size!11256 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22869)

(declare-datatypes ((List!6259 0))(
  ( (Nil!6256) (Cons!6255 (h!7111 (_ BitVec 64)) (t!11400 List!6259)) )
))
(declare-fun arrayNoDuplicates!0 (array!22869 (_ BitVec 32) List!6259) Bool)

(assert (=> b!386445 (= res!220691 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6256))))

(declare-fun b!386446 () Bool)

(declare-fun e!234386 () Bool)

(assert (=> b!386446 (= e!234384 e!234386)))

(declare-fun res!220694 () Bool)

(assert (=> b!386446 (=> (not res!220694) (not e!234386))))

(declare-fun lt!181636 () array!22869)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22869 (_ BitVec 32)) Bool)

(assert (=> b!386446 (= res!220694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181636 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386446 (= lt!181636 (array!22870 (store (arr!10903 _keys!658) i!548 k0!778) (size!11256 _keys!658)))))

(declare-fun b!386447 () Bool)

(declare-fun e!234381 () Bool)

(assert (=> b!386447 (= e!234381 tp_is_empty!9493)))

(declare-fun b!386448 () Bool)

(declare-fun res!220689 () Bool)

(assert (=> b!386448 (=> (not res!220689) (not e!234384))))

(declare-fun arrayContainsKey!0 (array!22869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386448 (= res!220689 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386449 () Bool)

(assert (=> b!386449 (= e!234386 false)))

(declare-datatypes ((V!13763 0))(
  ( (V!13764 (val!4791 Int)) )
))
(declare-datatypes ((ValueCell!4403 0))(
  ( (ValueCellFull!4403 (v!6982 V!13763)) (EmptyCell!4403) )
))
(declare-datatypes ((array!22871 0))(
  ( (array!22872 (arr!10904 (Array (_ BitVec 32) ValueCell!4403)) (size!11257 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22871)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6426 0))(
  ( (tuple2!6427 (_1!3224 (_ BitVec 64)) (_2!3224 V!13763)) )
))
(declare-datatypes ((List!6260 0))(
  ( (Nil!6257) (Cons!6256 (h!7112 tuple2!6426) (t!11401 List!6260)) )
))
(declare-datatypes ((ListLongMap!5329 0))(
  ( (ListLongMap!5330 (toList!2680 List!6260)) )
))
(declare-fun lt!181638 () ListLongMap!5329)

(declare-fun zeroValue!472 () V!13763)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13763)

(declare-fun minValue!472 () V!13763)

(declare-fun getCurrentListMapNoExtraKeys!920 (array!22869 array!22871 (_ BitVec 32) (_ BitVec 32) V!13763 V!13763 (_ BitVec 32) Int) ListLongMap!5329)

(assert (=> b!386449 (= lt!181638 (getCurrentListMapNoExtraKeys!920 lt!181636 (array!22872 (store (arr!10904 _values!506) i!548 (ValueCellFull!4403 v!373)) (size!11257 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181637 () ListLongMap!5329)

(assert (=> b!386449 (= lt!181637 (getCurrentListMapNoExtraKeys!920 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386450 () Bool)

(declare-fun e!234382 () Bool)

(assert (=> b!386450 (= e!234382 (and e!234385 mapRes!15804))))

(declare-fun condMapEmpty!15804 () Bool)

(declare-fun mapDefault!15804 () ValueCell!4403)

(assert (=> b!386450 (= condMapEmpty!15804 (= (arr!10904 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4403)) mapDefault!15804)))))

(declare-fun b!386451 () Bool)

(declare-fun res!220692 () Bool)

(assert (=> b!386451 (=> (not res!220692) (not e!234384))))

(assert (=> b!386451 (= res!220692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386452 () Bool)

(declare-fun res!220697 () Bool)

(assert (=> b!386452 (=> (not res!220697) (not e!234386))))

(assert (=> b!386452 (= res!220697 (arrayNoDuplicates!0 lt!181636 #b00000000000000000000000000000000 Nil!6256))))

(declare-fun b!386453 () Bool)

(declare-fun res!220696 () Bool)

(assert (=> b!386453 (=> (not res!220696) (not e!234384))))

(assert (=> b!386453 (= res!220696 (and (= (size!11257 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11256 _keys!658) (size!11257 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386454 () Bool)

(declare-fun res!220695 () Bool)

(assert (=> b!386454 (=> (not res!220695) (not e!234384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386454 (= res!220695 (validKeyInArray!0 k0!778))))

(declare-fun b!386444 () Bool)

(declare-fun res!220690 () Bool)

(assert (=> b!386444 (=> (not res!220690) (not e!234384))))

(assert (=> b!386444 (= res!220690 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11256 _keys!658))))))

(declare-fun res!220688 () Bool)

(assert (=> start!37704 (=> (not res!220688) (not e!234384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37704 (= res!220688 (validMask!0 mask!970))))

(assert (=> start!37704 e!234384))

(declare-fun array_inv!8022 (array!22871) Bool)

(assert (=> start!37704 (and (array_inv!8022 _values!506) e!234382)))

(assert (=> start!37704 tp!31215))

(assert (=> start!37704 true))

(assert (=> start!37704 tp_is_empty!9493))

(declare-fun array_inv!8023 (array!22869) Bool)

(assert (=> start!37704 (array_inv!8023 _keys!658)))

(declare-fun mapNonEmpty!15804 () Bool)

(declare-fun tp!31214 () Bool)

(assert (=> mapNonEmpty!15804 (= mapRes!15804 (and tp!31214 e!234381))))

(declare-fun mapRest!15804 () (Array (_ BitVec 32) ValueCell!4403))

(declare-fun mapKey!15804 () (_ BitVec 32))

(declare-fun mapValue!15804 () ValueCell!4403)

(assert (=> mapNonEmpty!15804 (= (arr!10904 _values!506) (store mapRest!15804 mapKey!15804 mapValue!15804))))

(declare-fun b!386455 () Bool)

(declare-fun res!220693 () Bool)

(assert (=> b!386455 (=> (not res!220693) (not e!234384))))

(assert (=> b!386455 (= res!220693 (or (= (select (arr!10903 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10903 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37704 res!220688) b!386453))

(assert (= (and b!386453 res!220696) b!386451))

(assert (= (and b!386451 res!220692) b!386445))

(assert (= (and b!386445 res!220691) b!386444))

(assert (= (and b!386444 res!220690) b!386454))

(assert (= (and b!386454 res!220695) b!386455))

(assert (= (and b!386455 res!220693) b!386448))

(assert (= (and b!386448 res!220689) b!386446))

(assert (= (and b!386446 res!220694) b!386452))

(assert (= (and b!386452 res!220697) b!386449))

(assert (= (and b!386450 condMapEmpty!15804) mapIsEmpty!15804))

(assert (= (and b!386450 (not condMapEmpty!15804)) mapNonEmpty!15804))

(get-info :version)

(assert (= (and mapNonEmpty!15804 ((_ is ValueCellFull!4403) mapValue!15804)) b!386447))

(assert (= (and b!386450 ((_ is ValueCellFull!4403) mapDefault!15804)) b!386443))

(assert (= start!37704 b!386450))

(declare-fun m!382271 () Bool)

(assert (=> start!37704 m!382271))

(declare-fun m!382273 () Bool)

(assert (=> start!37704 m!382273))

(declare-fun m!382275 () Bool)

(assert (=> start!37704 m!382275))

(declare-fun m!382277 () Bool)

(assert (=> b!386452 m!382277))

(declare-fun m!382279 () Bool)

(assert (=> b!386454 m!382279))

(declare-fun m!382281 () Bool)

(assert (=> b!386455 m!382281))

(declare-fun m!382283 () Bool)

(assert (=> b!386446 m!382283))

(declare-fun m!382285 () Bool)

(assert (=> b!386446 m!382285))

(declare-fun m!382287 () Bool)

(assert (=> b!386451 m!382287))

(declare-fun m!382289 () Bool)

(assert (=> b!386448 m!382289))

(declare-fun m!382291 () Bool)

(assert (=> b!386449 m!382291))

(declare-fun m!382293 () Bool)

(assert (=> b!386449 m!382293))

(declare-fun m!382295 () Bool)

(assert (=> b!386449 m!382295))

(declare-fun m!382297 () Bool)

(assert (=> b!386445 m!382297))

(declare-fun m!382299 () Bool)

(assert (=> mapNonEmpty!15804 m!382299))

(check-sat (not b!386446) tp_is_empty!9493 (not b!386445) b_and!16037 (not mapNonEmpty!15804) (not b!386454) (not b_next!8821) (not b!386451) (not b!386448) (not b!386449) (not start!37704) (not b!386452))
(check-sat b_and!16037 (not b_next!8821))
