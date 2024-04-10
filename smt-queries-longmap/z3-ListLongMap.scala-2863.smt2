; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41236 () Bool)

(assert start!41236)

(declare-fun b_free!11079 () Bool)

(declare-fun b_next!11079 () Bool)

(assert (=> start!41236 (= b_free!11079 (not b_next!11079))))

(declare-fun tp!39076 () Bool)

(declare-fun b_and!19399 () Bool)

(assert (=> start!41236 (= tp!39076 b_and!19399)))

(declare-fun mapIsEmpty!20278 () Bool)

(declare-fun mapRes!20278 () Bool)

(assert (=> mapIsEmpty!20278 mapRes!20278))

(declare-fun b!461293 () Bool)

(declare-fun res!275901 () Bool)

(declare-fun e!269052 () Bool)

(assert (=> b!461293 (=> (not res!275901) (not e!269052))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461293 (= res!275901 (validMask!0 mask!1025))))

(declare-fun b!461294 () Bool)

(declare-fun res!275905 () Bool)

(declare-fun e!269050 () Bool)

(assert (=> b!461294 (=> (not res!275905) (not e!269050))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461294 (= res!275905 (bvsle from!863 i!563))))

(declare-fun b!461295 () Bool)

(declare-fun res!275902 () Bool)

(assert (=> b!461295 (=> (not res!275902) (not e!269052))))

(declare-datatypes ((array!28633 0))(
  ( (array!28634 (arr!13756 (Array (_ BitVec 32) (_ BitVec 64))) (size!14108 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28633)

(assert (=> b!461295 (= res!275902 (or (= (select (arr!13756 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13756 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!275909 () Bool)

(assert (=> start!41236 (=> (not res!275909) (not e!269052))))

(assert (=> start!41236 (= res!275909 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14108 _keys!709))))))

(assert (=> start!41236 e!269052))

(declare-fun tp_is_empty!12417 () Bool)

(assert (=> start!41236 tp_is_empty!12417))

(assert (=> start!41236 tp!39076))

(assert (=> start!41236 true))

(declare-datatypes ((V!17661 0))(
  ( (V!17662 (val!6253 Int)) )
))
(declare-datatypes ((ValueCell!5865 0))(
  ( (ValueCellFull!5865 (v!8535 V!17661)) (EmptyCell!5865) )
))
(declare-datatypes ((array!28635 0))(
  ( (array!28636 (arr!13757 (Array (_ BitVec 32) ValueCell!5865)) (size!14109 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28635)

(declare-fun e!269051 () Bool)

(declare-fun array_inv!9952 (array!28635) Bool)

(assert (=> start!41236 (and (array_inv!9952 _values!549) e!269051)))

(declare-fun array_inv!9953 (array!28633) Bool)

(assert (=> start!41236 (array_inv!9953 _keys!709)))

(declare-fun b!461296 () Bool)

(declare-fun e!269054 () Bool)

(assert (=> b!461296 (= e!269054 tp_is_empty!12417)))

(declare-fun b!461297 () Bool)

(declare-fun res!275898 () Bool)

(assert (=> b!461297 (=> (not res!275898) (not e!269052))))

(assert (=> b!461297 (= res!275898 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14108 _keys!709))))))

(declare-fun b!461298 () Bool)

(declare-fun res!275908 () Bool)

(assert (=> b!461298 (=> (not res!275908) (not e!269052))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461298 (= res!275908 (validKeyInArray!0 k0!794))))

(declare-fun b!461299 () Bool)

(declare-fun res!275904 () Bool)

(assert (=> b!461299 (=> (not res!275904) (not e!269052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28633 (_ BitVec 32)) Bool)

(assert (=> b!461299 (= res!275904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461300 () Bool)

(declare-fun res!275907 () Bool)

(assert (=> b!461300 (=> (not res!275907) (not e!269052))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!461300 (= res!275907 (and (= (size!14109 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14108 _keys!709) (size!14109 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461301 () Bool)

(declare-fun e!269053 () Bool)

(assert (=> b!461301 (= e!269050 e!269053)))

(declare-fun res!275903 () Bool)

(assert (=> b!461301 (=> (not res!275903) (not e!269053))))

(assert (=> b!461301 (= res!275903 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17661)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!208947 () array!28633)

(declare-fun zeroValue!515 () V!17661)

(declare-fun lt!208946 () array!28635)

(declare-datatypes ((tuple2!8252 0))(
  ( (tuple2!8253 (_1!4137 (_ BitVec 64)) (_2!4137 V!17661)) )
))
(declare-datatypes ((List!8324 0))(
  ( (Nil!8321) (Cons!8320 (h!9176 tuple2!8252) (t!14266 List!8324)) )
))
(declare-datatypes ((ListLongMap!7165 0))(
  ( (ListLongMap!7166 (toList!3598 List!8324)) )
))
(declare-fun lt!208943 () ListLongMap!7165)

(declare-fun getCurrentListMapNoExtraKeys!1778 (array!28633 array!28635 (_ BitVec 32) (_ BitVec 32) V!17661 V!17661 (_ BitVec 32) Int) ListLongMap!7165)

(assert (=> b!461301 (= lt!208943 (getCurrentListMapNoExtraKeys!1778 lt!208947 lt!208946 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17661)

(assert (=> b!461301 (= lt!208946 (array!28636 (store (arr!13757 _values!549) i!563 (ValueCellFull!5865 v!412)) (size!14109 _values!549)))))

(declare-fun lt!208945 () ListLongMap!7165)

(assert (=> b!461301 (= lt!208945 (getCurrentListMapNoExtraKeys!1778 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!461302 () Bool)

(declare-fun e!269049 () Bool)

(assert (=> b!461302 (= e!269051 (and e!269049 mapRes!20278))))

(declare-fun condMapEmpty!20278 () Bool)

(declare-fun mapDefault!20278 () ValueCell!5865)

(assert (=> b!461302 (= condMapEmpty!20278 (= (arr!13757 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5865)) mapDefault!20278)))))

(declare-fun b!461303 () Bool)

(assert (=> b!461303 (= e!269049 tp_is_empty!12417)))

(declare-fun b!461304 () Bool)

(declare-fun res!275897 () Bool)

(assert (=> b!461304 (=> (not res!275897) (not e!269052))))

(declare-datatypes ((List!8325 0))(
  ( (Nil!8322) (Cons!8321 (h!9177 (_ BitVec 64)) (t!14267 List!8325)) )
))
(declare-fun arrayNoDuplicates!0 (array!28633 (_ BitVec 32) List!8325) Bool)

(assert (=> b!461304 (= res!275897 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8322))))

(declare-fun b!461305 () Bool)

(assert (=> b!461305 (= e!269053 (not true))))

(declare-fun +!1632 (ListLongMap!7165 tuple2!8252) ListLongMap!7165)

(assert (=> b!461305 (= (getCurrentListMapNoExtraKeys!1778 lt!208947 lt!208946 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1632 (getCurrentListMapNoExtraKeys!1778 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8253 k0!794 v!412)))))

(declare-datatypes ((Unit!13430 0))(
  ( (Unit!13431) )
))
(declare-fun lt!208944 () Unit!13430)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!788 (array!28633 array!28635 (_ BitVec 32) (_ BitVec 32) V!17661 V!17661 (_ BitVec 32) (_ BitVec 64) V!17661 (_ BitVec 32) Int) Unit!13430)

(assert (=> b!461305 (= lt!208944 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!788 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461306 () Bool)

(declare-fun res!275906 () Bool)

(assert (=> b!461306 (=> (not res!275906) (not e!269052))))

(declare-fun arrayContainsKey!0 (array!28633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461306 (= res!275906 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20278 () Bool)

(declare-fun tp!39075 () Bool)

(assert (=> mapNonEmpty!20278 (= mapRes!20278 (and tp!39075 e!269054))))

(declare-fun mapRest!20278 () (Array (_ BitVec 32) ValueCell!5865))

(declare-fun mapValue!20278 () ValueCell!5865)

(declare-fun mapKey!20278 () (_ BitVec 32))

(assert (=> mapNonEmpty!20278 (= (arr!13757 _values!549) (store mapRest!20278 mapKey!20278 mapValue!20278))))

(declare-fun b!461307 () Bool)

(assert (=> b!461307 (= e!269052 e!269050)))

(declare-fun res!275900 () Bool)

(assert (=> b!461307 (=> (not res!275900) (not e!269050))))

(assert (=> b!461307 (= res!275900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208947 mask!1025))))

(assert (=> b!461307 (= lt!208947 (array!28634 (store (arr!13756 _keys!709) i!563 k0!794) (size!14108 _keys!709)))))

(declare-fun b!461308 () Bool)

(declare-fun res!275899 () Bool)

(assert (=> b!461308 (=> (not res!275899) (not e!269050))))

(assert (=> b!461308 (= res!275899 (arrayNoDuplicates!0 lt!208947 #b00000000000000000000000000000000 Nil!8322))))

(assert (= (and start!41236 res!275909) b!461293))

(assert (= (and b!461293 res!275901) b!461300))

(assert (= (and b!461300 res!275907) b!461299))

(assert (= (and b!461299 res!275904) b!461304))

(assert (= (and b!461304 res!275897) b!461297))

(assert (= (and b!461297 res!275898) b!461298))

(assert (= (and b!461298 res!275908) b!461295))

(assert (= (and b!461295 res!275902) b!461306))

(assert (= (and b!461306 res!275906) b!461307))

(assert (= (and b!461307 res!275900) b!461308))

(assert (= (and b!461308 res!275899) b!461294))

(assert (= (and b!461294 res!275905) b!461301))

(assert (= (and b!461301 res!275903) b!461305))

(assert (= (and b!461302 condMapEmpty!20278) mapIsEmpty!20278))

(assert (= (and b!461302 (not condMapEmpty!20278)) mapNonEmpty!20278))

(get-info :version)

(assert (= (and mapNonEmpty!20278 ((_ is ValueCellFull!5865) mapValue!20278)) b!461296))

(assert (= (and b!461302 ((_ is ValueCellFull!5865) mapDefault!20278)) b!461303))

(assert (= start!41236 b!461302))

(declare-fun m!444479 () Bool)

(assert (=> mapNonEmpty!20278 m!444479))

(declare-fun m!444481 () Bool)

(assert (=> b!461307 m!444481))

(declare-fun m!444483 () Bool)

(assert (=> b!461307 m!444483))

(declare-fun m!444485 () Bool)

(assert (=> b!461295 m!444485))

(declare-fun m!444487 () Bool)

(assert (=> b!461299 m!444487))

(declare-fun m!444489 () Bool)

(assert (=> b!461293 m!444489))

(declare-fun m!444491 () Bool)

(assert (=> b!461298 m!444491))

(declare-fun m!444493 () Bool)

(assert (=> start!41236 m!444493))

(declare-fun m!444495 () Bool)

(assert (=> start!41236 m!444495))

(declare-fun m!444497 () Bool)

(assert (=> b!461305 m!444497))

(declare-fun m!444499 () Bool)

(assert (=> b!461305 m!444499))

(assert (=> b!461305 m!444499))

(declare-fun m!444501 () Bool)

(assert (=> b!461305 m!444501))

(declare-fun m!444503 () Bool)

(assert (=> b!461305 m!444503))

(declare-fun m!444505 () Bool)

(assert (=> b!461304 m!444505))

(declare-fun m!444507 () Bool)

(assert (=> b!461306 m!444507))

(declare-fun m!444509 () Bool)

(assert (=> b!461301 m!444509))

(declare-fun m!444511 () Bool)

(assert (=> b!461301 m!444511))

(declare-fun m!444513 () Bool)

(assert (=> b!461301 m!444513))

(declare-fun m!444515 () Bool)

(assert (=> b!461308 m!444515))

(check-sat (not b!461301) (not b!461304) (not b!461308) (not b!461305) (not b!461299) (not b!461293) (not b_next!11079) b_and!19399 (not mapNonEmpty!20278) tp_is_empty!12417 (not b!461298) (not start!41236) (not b!461307) (not b!461306))
(check-sat b_and!19399 (not b_next!11079))
