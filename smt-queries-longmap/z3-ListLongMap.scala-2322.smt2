; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37380 () Bool)

(assert start!37380)

(declare-fun b_free!8521 () Bool)

(declare-fun b_next!8521 () Bool)

(assert (=> start!37380 (= b_free!8521 (not b_next!8521))))

(declare-fun tp!30278 () Bool)

(declare-fun b_and!15737 () Bool)

(assert (=> start!37380 (= tp!30278 b_and!15737)))

(declare-fun b!379904 () Bool)

(declare-fun e!231078 () Bool)

(assert (=> b!379904 (= e!231078 true)))

(declare-datatypes ((V!13331 0))(
  ( (V!13332 (val!4629 Int)) )
))
(declare-datatypes ((tuple2!6178 0))(
  ( (tuple2!6179 (_1!3100 (_ BitVec 64)) (_2!3100 V!13331)) )
))
(declare-datatypes ((List!6006 0))(
  ( (Nil!6003) (Cons!6002 (h!6858 tuple2!6178) (t!11147 List!6006)) )
))
(declare-datatypes ((ListLongMap!5081 0))(
  ( (ListLongMap!5082 (toList!2556 List!6006)) )
))
(declare-fun lt!177594 () ListLongMap!5081)

(declare-fun lt!177598 () ListLongMap!5081)

(declare-fun lt!177596 () tuple2!6178)

(declare-fun +!924 (ListLongMap!5081 tuple2!6178) ListLongMap!5081)

(assert (=> b!379904 (= lt!177594 (+!924 lt!177598 lt!177596))))

(declare-fun lt!177591 () ListLongMap!5081)

(declare-fun k0!778 () (_ BitVec 64))

(declare-datatypes ((Unit!11708 0))(
  ( (Unit!11709) )
))
(declare-fun lt!177592 () Unit!11708)

(declare-fun minValue!472 () V!13331)

(declare-fun v!373 () V!13331)

(declare-fun addCommutativeForDiffKeys!316 (ListLongMap!5081 (_ BitVec 64) V!13331 (_ BitVec 64) V!13331) Unit!11708)

(assert (=> b!379904 (= lt!177592 (addCommutativeForDiffKeys!316 lt!177591 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379906 () Bool)

(declare-fun res!215609 () Bool)

(declare-fun e!231080 () Bool)

(assert (=> b!379906 (=> (not res!215609) (not e!231080))))

(declare-datatypes ((array!22241 0))(
  ( (array!22242 (arr!10589 (Array (_ BitVec 32) (_ BitVec 64))) (size!10942 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22241)

(declare-datatypes ((List!6007 0))(
  ( (Nil!6004) (Cons!6003 (h!6859 (_ BitVec 64)) (t!11148 List!6007)) )
))
(declare-fun arrayNoDuplicates!0 (array!22241 (_ BitVec 32) List!6007) Bool)

(assert (=> b!379906 (= res!215609 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6004))))

(declare-fun b!379907 () Bool)

(declare-fun e!231077 () Bool)

(declare-fun e!231075 () Bool)

(assert (=> b!379907 (= e!231077 (not e!231075))))

(declare-fun res!215618 () Bool)

(assert (=> b!379907 (=> res!215618 e!231075)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379907 (= res!215618 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4241 0))(
  ( (ValueCellFull!4241 (v!6820 V!13331)) (EmptyCell!4241) )
))
(declare-datatypes ((array!22243 0))(
  ( (array!22244 (arr!10590 (Array (_ BitVec 32) ValueCell!4241)) (size!10943 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22243)

(declare-fun lt!177595 () ListLongMap!5081)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13331)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1951 (array!22241 array!22243 (_ BitVec 32) (_ BitVec 32) V!13331 V!13331 (_ BitVec 32) Int) ListLongMap!5081)

(assert (=> b!379907 (= lt!177595 (getCurrentListMap!1951 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177597 () array!22243)

(declare-fun lt!177590 () array!22241)

(declare-fun lt!177593 () ListLongMap!5081)

(assert (=> b!379907 (= lt!177593 (getCurrentListMap!1951 lt!177590 lt!177597 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177599 () ListLongMap!5081)

(declare-fun lt!177589 () ListLongMap!5081)

(assert (=> b!379907 (and (= lt!177599 lt!177589) (= lt!177589 lt!177599))))

(assert (=> b!379907 (= lt!177589 (+!924 lt!177591 lt!177596))))

(assert (=> b!379907 (= lt!177596 (tuple2!6179 k0!778 v!373))))

(declare-fun lt!177588 () Unit!11708)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!144 (array!22241 array!22243 (_ BitVec 32) (_ BitVec 32) V!13331 V!13331 (_ BitVec 32) (_ BitVec 64) V!13331 (_ BitVec 32) Int) Unit!11708)

(assert (=> b!379907 (= lt!177588 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!144 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!816 (array!22241 array!22243 (_ BitVec 32) (_ BitVec 32) V!13331 V!13331 (_ BitVec 32) Int) ListLongMap!5081)

(assert (=> b!379907 (= lt!177599 (getCurrentListMapNoExtraKeys!816 lt!177590 lt!177597 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379907 (= lt!177597 (array!22244 (store (arr!10590 _values!506) i!548 (ValueCellFull!4241 v!373)) (size!10943 _values!506)))))

(assert (=> b!379907 (= lt!177591 (getCurrentListMapNoExtraKeys!816 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379908 () Bool)

(declare-fun e!231079 () Bool)

(declare-fun e!231073 () Bool)

(declare-fun mapRes!15318 () Bool)

(assert (=> b!379908 (= e!231079 (and e!231073 mapRes!15318))))

(declare-fun condMapEmpty!15318 () Bool)

(declare-fun mapDefault!15318 () ValueCell!4241)

(assert (=> b!379908 (= condMapEmpty!15318 (= (arr!10590 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4241)) mapDefault!15318)))))

(declare-fun b!379909 () Bool)

(declare-fun res!215615 () Bool)

(assert (=> b!379909 (=> (not res!215615) (not e!231080))))

(declare-fun arrayContainsKey!0 (array!22241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379909 (= res!215615 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15318 () Bool)

(assert (=> mapIsEmpty!15318 mapRes!15318))

(declare-fun b!379905 () Bool)

(assert (=> b!379905 (= e!231080 e!231077)))

(declare-fun res!215610 () Bool)

(assert (=> b!379905 (=> (not res!215610) (not e!231077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22241 (_ BitVec 32)) Bool)

(assert (=> b!379905 (= res!215610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177590 mask!970))))

(assert (=> b!379905 (= lt!177590 (array!22242 (store (arr!10589 _keys!658) i!548 k0!778) (size!10942 _keys!658)))))

(declare-fun res!215614 () Bool)

(assert (=> start!37380 (=> (not res!215614) (not e!231080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37380 (= res!215614 (validMask!0 mask!970))))

(assert (=> start!37380 e!231080))

(declare-fun array_inv!7800 (array!22243) Bool)

(assert (=> start!37380 (and (array_inv!7800 _values!506) e!231079)))

(assert (=> start!37380 tp!30278))

(assert (=> start!37380 true))

(declare-fun tp_is_empty!9169 () Bool)

(assert (=> start!37380 tp_is_empty!9169))

(declare-fun array_inv!7801 (array!22241) Bool)

(assert (=> start!37380 (array_inv!7801 _keys!658)))

(declare-fun b!379910 () Bool)

(declare-fun res!215612 () Bool)

(assert (=> b!379910 (=> (not res!215612) (not e!231080))))

(assert (=> b!379910 (= res!215612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15318 () Bool)

(declare-fun tp!30279 () Bool)

(declare-fun e!231074 () Bool)

(assert (=> mapNonEmpty!15318 (= mapRes!15318 (and tp!30279 e!231074))))

(declare-fun mapKey!15318 () (_ BitVec 32))

(declare-fun mapRest!15318 () (Array (_ BitVec 32) ValueCell!4241))

(declare-fun mapValue!15318 () ValueCell!4241)

(assert (=> mapNonEmpty!15318 (= (arr!10590 _values!506) (store mapRest!15318 mapKey!15318 mapValue!15318))))

(declare-fun b!379911 () Bool)

(assert (=> b!379911 (= e!231073 tp_is_empty!9169)))

(declare-fun b!379912 () Bool)

(declare-fun res!215616 () Bool)

(assert (=> b!379912 (=> (not res!215616) (not e!231080))))

(assert (=> b!379912 (= res!215616 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10942 _keys!658))))))

(declare-fun b!379913 () Bool)

(declare-fun res!215607 () Bool)

(assert (=> b!379913 (=> (not res!215607) (not e!231077))))

(assert (=> b!379913 (= res!215607 (arrayNoDuplicates!0 lt!177590 #b00000000000000000000000000000000 Nil!6004))))

(declare-fun b!379914 () Bool)

(assert (=> b!379914 (= e!231074 tp_is_empty!9169)))

(declare-fun b!379915 () Bool)

(declare-fun res!215617 () Bool)

(assert (=> b!379915 (=> (not res!215617) (not e!231080))))

(assert (=> b!379915 (= res!215617 (or (= (select (arr!10589 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10589 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379916 () Bool)

(declare-fun res!215613 () Bool)

(assert (=> b!379916 (=> (not res!215613) (not e!231080))))

(assert (=> b!379916 (= res!215613 (and (= (size!10943 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10942 _keys!658) (size!10943 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379917 () Bool)

(assert (=> b!379917 (= e!231075 e!231078)))

(declare-fun res!215608 () Bool)

(assert (=> b!379917 (=> res!215608 e!231078)))

(assert (=> b!379917 (= res!215608 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!379917 (= lt!177595 lt!177598)))

(declare-fun lt!177600 () tuple2!6178)

(assert (=> b!379917 (= lt!177598 (+!924 lt!177591 lt!177600))))

(assert (=> b!379917 (= lt!177593 lt!177594)))

(assert (=> b!379917 (= lt!177594 (+!924 lt!177589 lt!177600))))

(assert (=> b!379917 (= lt!177593 (+!924 lt!177599 lt!177600))))

(assert (=> b!379917 (= lt!177600 (tuple2!6179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379918 () Bool)

(declare-fun res!215611 () Bool)

(assert (=> b!379918 (=> (not res!215611) (not e!231080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379918 (= res!215611 (validKeyInArray!0 k0!778))))

(assert (= (and start!37380 res!215614) b!379916))

(assert (= (and b!379916 res!215613) b!379910))

(assert (= (and b!379910 res!215612) b!379906))

(assert (= (and b!379906 res!215609) b!379912))

(assert (= (and b!379912 res!215616) b!379918))

(assert (= (and b!379918 res!215611) b!379915))

(assert (= (and b!379915 res!215617) b!379909))

(assert (= (and b!379909 res!215615) b!379905))

(assert (= (and b!379905 res!215610) b!379913))

(assert (= (and b!379913 res!215607) b!379907))

(assert (= (and b!379907 (not res!215618)) b!379917))

(assert (= (and b!379917 (not res!215608)) b!379904))

(assert (= (and b!379908 condMapEmpty!15318) mapIsEmpty!15318))

(assert (= (and b!379908 (not condMapEmpty!15318)) mapNonEmpty!15318))

(get-info :version)

(assert (= (and mapNonEmpty!15318 ((_ is ValueCellFull!4241) mapValue!15318)) b!379914))

(assert (= (and b!379908 ((_ is ValueCellFull!4241) mapDefault!15318)) b!379911))

(assert (= start!37380 b!379908))

(declare-fun m!376379 () Bool)

(assert (=> b!379915 m!376379))

(declare-fun m!376381 () Bool)

(assert (=> b!379909 m!376381))

(declare-fun m!376383 () Bool)

(assert (=> b!379913 m!376383))

(declare-fun m!376385 () Bool)

(assert (=> b!379907 m!376385))

(declare-fun m!376387 () Bool)

(assert (=> b!379907 m!376387))

(declare-fun m!376389 () Bool)

(assert (=> b!379907 m!376389))

(declare-fun m!376391 () Bool)

(assert (=> b!379907 m!376391))

(declare-fun m!376393 () Bool)

(assert (=> b!379907 m!376393))

(declare-fun m!376395 () Bool)

(assert (=> b!379907 m!376395))

(declare-fun m!376397 () Bool)

(assert (=> b!379907 m!376397))

(declare-fun m!376399 () Bool)

(assert (=> b!379906 m!376399))

(declare-fun m!376401 () Bool)

(assert (=> mapNonEmpty!15318 m!376401))

(declare-fun m!376403 () Bool)

(assert (=> b!379917 m!376403))

(declare-fun m!376405 () Bool)

(assert (=> b!379917 m!376405))

(declare-fun m!376407 () Bool)

(assert (=> b!379917 m!376407))

(declare-fun m!376409 () Bool)

(assert (=> b!379904 m!376409))

(declare-fun m!376411 () Bool)

(assert (=> b!379904 m!376411))

(declare-fun m!376413 () Bool)

(assert (=> b!379918 m!376413))

(declare-fun m!376415 () Bool)

(assert (=> b!379905 m!376415))

(declare-fun m!376417 () Bool)

(assert (=> b!379905 m!376417))

(declare-fun m!376419 () Bool)

(assert (=> start!37380 m!376419))

(declare-fun m!376421 () Bool)

(assert (=> start!37380 m!376421))

(declare-fun m!376423 () Bool)

(assert (=> start!37380 m!376423))

(declare-fun m!376425 () Bool)

(assert (=> b!379910 m!376425))

(check-sat (not b!379904) (not b!379907) (not b_next!8521) (not b!379906) (not start!37380) (not b!379917) (not b!379918) (not b!379913) b_and!15737 (not mapNonEmpty!15318) tp_is_empty!9169 (not b!379910) (not b!379905) (not b!379909))
(check-sat b_and!15737 (not b_next!8521))
