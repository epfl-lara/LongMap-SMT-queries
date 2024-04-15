; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37374 () Bool)

(assert start!37374)

(declare-fun b_free!8515 () Bool)

(declare-fun b_next!8515 () Bool)

(assert (=> start!37374 (= b_free!8515 (not b_next!8515))))

(declare-fun tp!30260 () Bool)

(declare-fun b_and!15731 () Bool)

(assert (=> start!37374 (= tp!30260 b_and!15731)))

(declare-fun b!379769 () Bool)

(declare-fun res!215501 () Bool)

(declare-fun e!231008 () Bool)

(assert (=> b!379769 (=> (not res!215501) (not e!231008))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13323 0))(
  ( (V!13324 (val!4626 Int)) )
))
(declare-datatypes ((ValueCell!4238 0))(
  ( (ValueCellFull!4238 (v!6817 V!13323)) (EmptyCell!4238) )
))
(declare-datatypes ((array!22229 0))(
  ( (array!22230 (arr!10583 (Array (_ BitVec 32) ValueCell!4238)) (size!10936 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22229)

(declare-datatypes ((array!22231 0))(
  ( (array!22232 (arr!10584 (Array (_ BitVec 32) (_ BitVec 64))) (size!10937 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22231)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!379769 (= res!215501 (and (= (size!10936 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10937 _keys!658) (size!10936 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379770 () Bool)

(declare-fun e!231007 () Bool)

(assert (=> b!379770 (= e!231007 true)))

(declare-datatypes ((tuple2!6172 0))(
  ( (tuple2!6173 (_1!3097 (_ BitVec 64)) (_2!3097 V!13323)) )
))
(declare-datatypes ((List!6000 0))(
  ( (Nil!5997) (Cons!5996 (h!6852 tuple2!6172) (t!11141 List!6000)) )
))
(declare-datatypes ((ListLongMap!5075 0))(
  ( (ListLongMap!5076 (toList!2553 List!6000)) )
))
(declare-fun lt!177481 () ListLongMap!5075)

(declare-fun lt!177476 () ListLongMap!5075)

(declare-fun lt!177483 () tuple2!6172)

(declare-fun +!921 (ListLongMap!5075 tuple2!6172) ListLongMap!5075)

(assert (=> b!379770 (= lt!177481 (+!921 lt!177476 lt!177483))))

(declare-fun v!373 () V!13323)

(declare-fun lt!177479 () ListLongMap!5075)

(declare-datatypes ((Unit!11702 0))(
  ( (Unit!11703) )
))
(declare-fun lt!177471 () Unit!11702)

(declare-fun minValue!472 () V!13323)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!314 (ListLongMap!5075 (_ BitVec 64) V!13323 (_ BitVec 64) V!13323) Unit!11702)

(assert (=> b!379770 (= lt!177471 (addCommutativeForDiffKeys!314 lt!177479 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379771 () Bool)

(declare-fun res!215508 () Bool)

(declare-fun e!231001 () Bool)

(assert (=> b!379771 (=> (not res!215508) (not e!231001))))

(declare-fun lt!177478 () array!22231)

(declare-datatypes ((List!6001 0))(
  ( (Nil!5998) (Cons!5997 (h!6853 (_ BitVec 64)) (t!11142 List!6001)) )
))
(declare-fun arrayNoDuplicates!0 (array!22231 (_ BitVec 32) List!6001) Bool)

(assert (=> b!379771 (= res!215508 (arrayNoDuplicates!0 lt!177478 #b00000000000000000000000000000000 Nil!5998))))

(declare-fun b!379772 () Bool)

(declare-fun res!215504 () Bool)

(assert (=> b!379772 (=> (not res!215504) (not e!231008))))

(declare-fun arrayContainsKey!0 (array!22231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379772 (= res!215504 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15309 () Bool)

(declare-fun mapRes!15309 () Bool)

(assert (=> mapIsEmpty!15309 mapRes!15309))

(declare-fun res!215505 () Bool)

(assert (=> start!37374 (=> (not res!215505) (not e!231008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37374 (= res!215505 (validMask!0 mask!970))))

(assert (=> start!37374 e!231008))

(declare-fun e!231003 () Bool)

(declare-fun array_inv!7794 (array!22229) Bool)

(assert (=> start!37374 (and (array_inv!7794 _values!506) e!231003)))

(assert (=> start!37374 tp!30260))

(assert (=> start!37374 true))

(declare-fun tp_is_empty!9163 () Bool)

(assert (=> start!37374 tp_is_empty!9163))

(declare-fun array_inv!7795 (array!22231) Bool)

(assert (=> start!37374 (array_inv!7795 _keys!658)))

(declare-fun b!379773 () Bool)

(declare-fun e!231005 () Bool)

(assert (=> b!379773 (= e!231005 e!231007)))

(declare-fun res!215503 () Bool)

(assert (=> b!379773 (=> res!215503 e!231007)))

(assert (=> b!379773 (= res!215503 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177472 () ListLongMap!5075)

(assert (=> b!379773 (= lt!177472 lt!177476)))

(declare-fun lt!177482 () tuple2!6172)

(assert (=> b!379773 (= lt!177476 (+!921 lt!177479 lt!177482))))

(declare-fun lt!177480 () ListLongMap!5075)

(assert (=> b!379773 (= lt!177480 lt!177481)))

(declare-fun lt!177475 () ListLongMap!5075)

(assert (=> b!379773 (= lt!177481 (+!921 lt!177475 lt!177482))))

(declare-fun lt!177474 () ListLongMap!5075)

(assert (=> b!379773 (= lt!177480 (+!921 lt!177474 lt!177482))))

(assert (=> b!379773 (= lt!177482 (tuple2!6173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379774 () Bool)

(declare-fun e!231006 () Bool)

(assert (=> b!379774 (= e!231003 (and e!231006 mapRes!15309))))

(declare-fun condMapEmpty!15309 () Bool)

(declare-fun mapDefault!15309 () ValueCell!4238)

(assert (=> b!379774 (= condMapEmpty!15309 (= (arr!10583 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4238)) mapDefault!15309)))))

(declare-fun b!379775 () Bool)

(assert (=> b!379775 (= e!231001 (not e!231005))))

(declare-fun res!215510 () Bool)

(assert (=> b!379775 (=> res!215510 e!231005)))

(assert (=> b!379775 (= res!215510 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13323)

(declare-fun getCurrentListMap!1948 (array!22231 array!22229 (_ BitVec 32) (_ BitVec 32) V!13323 V!13323 (_ BitVec 32) Int) ListLongMap!5075)

(assert (=> b!379775 (= lt!177472 (getCurrentListMap!1948 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177477 () array!22229)

(assert (=> b!379775 (= lt!177480 (getCurrentListMap!1948 lt!177478 lt!177477 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379775 (and (= lt!177474 lt!177475) (= lt!177475 lt!177474))))

(assert (=> b!379775 (= lt!177475 (+!921 lt!177479 lt!177483))))

(assert (=> b!379775 (= lt!177483 (tuple2!6173 k0!778 v!373))))

(declare-fun lt!177473 () Unit!11702)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!141 (array!22231 array!22229 (_ BitVec 32) (_ BitVec 32) V!13323 V!13323 (_ BitVec 32) (_ BitVec 64) V!13323 (_ BitVec 32) Int) Unit!11702)

(assert (=> b!379775 (= lt!177473 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!141 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!813 (array!22231 array!22229 (_ BitVec 32) (_ BitVec 32) V!13323 V!13323 (_ BitVec 32) Int) ListLongMap!5075)

(assert (=> b!379775 (= lt!177474 (getCurrentListMapNoExtraKeys!813 lt!177478 lt!177477 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379775 (= lt!177477 (array!22230 (store (arr!10583 _values!506) i!548 (ValueCellFull!4238 v!373)) (size!10936 _values!506)))))

(assert (=> b!379775 (= lt!177479 (getCurrentListMapNoExtraKeys!813 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379776 () Bool)

(declare-fun res!215506 () Bool)

(assert (=> b!379776 (=> (not res!215506) (not e!231008))))

(assert (=> b!379776 (= res!215506 (or (= (select (arr!10584 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10584 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15309 () Bool)

(declare-fun tp!30261 () Bool)

(declare-fun e!231004 () Bool)

(assert (=> mapNonEmpty!15309 (= mapRes!15309 (and tp!30261 e!231004))))

(declare-fun mapKey!15309 () (_ BitVec 32))

(declare-fun mapRest!15309 () (Array (_ BitVec 32) ValueCell!4238))

(declare-fun mapValue!15309 () ValueCell!4238)

(assert (=> mapNonEmpty!15309 (= (arr!10583 _values!506) (store mapRest!15309 mapKey!15309 mapValue!15309))))

(declare-fun b!379777 () Bool)

(declare-fun res!215499 () Bool)

(assert (=> b!379777 (=> (not res!215499) (not e!231008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379777 (= res!215499 (validKeyInArray!0 k0!778))))

(declare-fun b!379778 () Bool)

(declare-fun res!215507 () Bool)

(assert (=> b!379778 (=> (not res!215507) (not e!231008))))

(assert (=> b!379778 (= res!215507 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10937 _keys!658))))))

(declare-fun b!379779 () Bool)

(assert (=> b!379779 (= e!231004 tp_is_empty!9163)))

(declare-fun b!379780 () Bool)

(assert (=> b!379780 (= e!231008 e!231001)))

(declare-fun res!215502 () Bool)

(assert (=> b!379780 (=> (not res!215502) (not e!231001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22231 (_ BitVec 32)) Bool)

(assert (=> b!379780 (= res!215502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177478 mask!970))))

(assert (=> b!379780 (= lt!177478 (array!22232 (store (arr!10584 _keys!658) i!548 k0!778) (size!10937 _keys!658)))))

(declare-fun b!379781 () Bool)

(declare-fun res!215500 () Bool)

(assert (=> b!379781 (=> (not res!215500) (not e!231008))))

(assert (=> b!379781 (= res!215500 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5998))))

(declare-fun b!379782 () Bool)

(declare-fun res!215509 () Bool)

(assert (=> b!379782 (=> (not res!215509) (not e!231008))))

(assert (=> b!379782 (= res!215509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379783 () Bool)

(assert (=> b!379783 (= e!231006 tp_is_empty!9163)))

(assert (= (and start!37374 res!215505) b!379769))

(assert (= (and b!379769 res!215501) b!379782))

(assert (= (and b!379782 res!215509) b!379781))

(assert (= (and b!379781 res!215500) b!379778))

(assert (= (and b!379778 res!215507) b!379777))

(assert (= (and b!379777 res!215499) b!379776))

(assert (= (and b!379776 res!215506) b!379772))

(assert (= (and b!379772 res!215504) b!379780))

(assert (= (and b!379780 res!215502) b!379771))

(assert (= (and b!379771 res!215508) b!379775))

(assert (= (and b!379775 (not res!215510)) b!379773))

(assert (= (and b!379773 (not res!215503)) b!379770))

(assert (= (and b!379774 condMapEmpty!15309) mapIsEmpty!15309))

(assert (= (and b!379774 (not condMapEmpty!15309)) mapNonEmpty!15309))

(get-info :version)

(assert (= (and mapNonEmpty!15309 ((_ is ValueCellFull!4238) mapValue!15309)) b!379779))

(assert (= (and b!379774 ((_ is ValueCellFull!4238) mapDefault!15309)) b!379783))

(assert (= start!37374 b!379774))

(declare-fun m!376235 () Bool)

(assert (=> b!379782 m!376235))

(declare-fun m!376237 () Bool)

(assert (=> b!379780 m!376237))

(declare-fun m!376239 () Bool)

(assert (=> b!379780 m!376239))

(declare-fun m!376241 () Bool)

(assert (=> b!379781 m!376241))

(declare-fun m!376243 () Bool)

(assert (=> b!379770 m!376243))

(declare-fun m!376245 () Bool)

(assert (=> b!379770 m!376245))

(declare-fun m!376247 () Bool)

(assert (=> start!37374 m!376247))

(declare-fun m!376249 () Bool)

(assert (=> start!37374 m!376249))

(declare-fun m!376251 () Bool)

(assert (=> start!37374 m!376251))

(declare-fun m!376253 () Bool)

(assert (=> b!379775 m!376253))

(declare-fun m!376255 () Bool)

(assert (=> b!379775 m!376255))

(declare-fun m!376257 () Bool)

(assert (=> b!379775 m!376257))

(declare-fun m!376259 () Bool)

(assert (=> b!379775 m!376259))

(declare-fun m!376261 () Bool)

(assert (=> b!379775 m!376261))

(declare-fun m!376263 () Bool)

(assert (=> b!379775 m!376263))

(declare-fun m!376265 () Bool)

(assert (=> b!379775 m!376265))

(declare-fun m!376267 () Bool)

(assert (=> b!379776 m!376267))

(declare-fun m!376269 () Bool)

(assert (=> b!379771 m!376269))

(declare-fun m!376271 () Bool)

(assert (=> b!379777 m!376271))

(declare-fun m!376273 () Bool)

(assert (=> b!379773 m!376273))

(declare-fun m!376275 () Bool)

(assert (=> b!379773 m!376275))

(declare-fun m!376277 () Bool)

(assert (=> b!379773 m!376277))

(declare-fun m!376279 () Bool)

(assert (=> b!379772 m!376279))

(declare-fun m!376281 () Bool)

(assert (=> mapNonEmpty!15309 m!376281))

(check-sat (not b!379773) (not b!379771) b_and!15731 (not b!379782) (not start!37374) (not b_next!8515) (not b!379770) tp_is_empty!9163 (not mapNonEmpty!15309) (not b!379777) (not b!379780) (not b!379781) (not b!379772) (not b!379775))
(check-sat b_and!15731 (not b_next!8515))
