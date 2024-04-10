; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21116 () Bool)

(assert start!21116)

(declare-fun b_free!5607 () Bool)

(declare-fun b_next!5607 () Bool)

(assert (=> start!21116 (= b_free!5607 (not b_next!5607))))

(declare-fun tp!19886 () Bool)

(declare-fun b_and!12449 () Bool)

(assert (=> start!21116 (= tp!19886 b_and!12449)))

(declare-fun b!212515 () Bool)

(declare-fun res!103915 () Bool)

(declare-fun e!138272 () Bool)

(assert (=> b!212515 (=> (not res!103915) (not e!138272))))

(declare-datatypes ((array!10143 0))(
  ( (array!10144 (arr!4814 (Array (_ BitVec 32) (_ BitVec 64))) (size!5139 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10143)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10143 (_ BitVec 32)) Bool)

(assert (=> b!212515 (= res!103915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212516 () Bool)

(declare-fun e!138267 () Bool)

(declare-fun tp_is_empty!5469 () Bool)

(assert (=> b!212516 (= e!138267 tp_is_empty!5469)))

(declare-fun b!212517 () Bool)

(declare-fun e!138268 () Bool)

(declare-fun e!138269 () Bool)

(declare-fun mapRes!9296 () Bool)

(assert (=> b!212517 (= e!138268 (and e!138269 mapRes!9296))))

(declare-fun condMapEmpty!9296 () Bool)

(declare-datatypes ((V!6939 0))(
  ( (V!6940 (val!2779 Int)) )
))
(declare-datatypes ((ValueCell!2391 0))(
  ( (ValueCellFull!2391 (v!4781 V!6939)) (EmptyCell!2391) )
))
(declare-datatypes ((array!10145 0))(
  ( (array!10146 (arr!4815 (Array (_ BitVec 32) ValueCell!2391)) (size!5140 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10145)

(declare-fun mapDefault!9296 () ValueCell!2391)

(assert (=> b!212517 (= condMapEmpty!9296 (= (arr!4815 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2391)) mapDefault!9296)))))

(declare-fun b!212518 () Bool)

(declare-fun res!103914 () Bool)

(assert (=> b!212518 (=> (not res!103914) (not e!138272))))

(declare-datatypes ((List!3097 0))(
  ( (Nil!3094) (Cons!3093 (h!3735 (_ BitVec 64)) (t!8044 List!3097)) )
))
(declare-fun arrayNoDuplicates!0 (array!10143 (_ BitVec 32) List!3097) Bool)

(assert (=> b!212518 (= res!103914 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3094))))

(declare-fun res!103913 () Bool)

(assert (=> start!21116 (=> (not res!103913) (not e!138272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21116 (= res!103913 (validMask!0 mask!1149))))

(assert (=> start!21116 e!138272))

(declare-fun array_inv!3187 (array!10145) Bool)

(assert (=> start!21116 (and (array_inv!3187 _values!649) e!138268)))

(assert (=> start!21116 true))

(assert (=> start!21116 tp_is_empty!5469))

(declare-fun array_inv!3188 (array!10143) Bool)

(assert (=> start!21116 (array_inv!3188 _keys!825)))

(assert (=> start!21116 tp!19886))

(declare-fun mapIsEmpty!9296 () Bool)

(assert (=> mapIsEmpty!9296 mapRes!9296))

(declare-fun b!212519 () Bool)

(assert (=> b!212519 (= e!138269 tp_is_empty!5469)))

(declare-fun b!212520 () Bool)

(declare-fun e!138271 () Bool)

(assert (=> b!212520 (= e!138272 (not e!138271))))

(declare-fun res!103910 () Bool)

(assert (=> b!212520 (=> res!103910 e!138271)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212520 (= res!103910 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4208 0))(
  ( (tuple2!4209 (_1!2115 (_ BitVec 64)) (_2!2115 V!6939)) )
))
(declare-datatypes ((List!3098 0))(
  ( (Nil!3095) (Cons!3094 (h!3736 tuple2!4208) (t!8045 List!3098)) )
))
(declare-datatypes ((ListLongMap!3121 0))(
  ( (ListLongMap!3122 (toList!1576 List!3098)) )
))
(declare-fun lt!109565 () ListLongMap!3121)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6939)

(declare-fun zeroValue!615 () V!6939)

(declare-fun getCurrentListMap!1108 (array!10143 array!10145 (_ BitVec 32) (_ BitVec 32) V!6939 V!6939 (_ BitVec 32) Int) ListLongMap!3121)

(assert (=> b!212520 (= lt!109565 (getCurrentListMap!1108 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109566 () array!10145)

(declare-fun lt!109568 () ListLongMap!3121)

(assert (=> b!212520 (= lt!109568 (getCurrentListMap!1108 _keys!825 lt!109566 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109562 () ListLongMap!3121)

(declare-fun lt!109563 () ListLongMap!3121)

(assert (=> b!212520 (and (= lt!109562 lt!109563) (= lt!109563 lt!109562))))

(declare-fun lt!109569 () ListLongMap!3121)

(declare-fun v!520 () V!6939)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!579 (ListLongMap!3121 tuple2!4208) ListLongMap!3121)

(assert (=> b!212520 (= lt!109563 (+!579 lt!109569 (tuple2!4209 k0!843 v!520)))))

(declare-datatypes ((Unit!6452 0))(
  ( (Unit!6453) )
))
(declare-fun lt!109567 () Unit!6452)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!225 (array!10143 array!10145 (_ BitVec 32) (_ BitVec 32) V!6939 V!6939 (_ BitVec 32) (_ BitVec 64) V!6939 (_ BitVec 32) Int) Unit!6452)

(assert (=> b!212520 (= lt!109567 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!225 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!510 (array!10143 array!10145 (_ BitVec 32) (_ BitVec 32) V!6939 V!6939 (_ BitVec 32) Int) ListLongMap!3121)

(assert (=> b!212520 (= lt!109562 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!109566 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212520 (= lt!109566 (array!10146 (store (arr!4815 _values!649) i!601 (ValueCellFull!2391 v!520)) (size!5140 _values!649)))))

(assert (=> b!212520 (= lt!109569 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212521 () Bool)

(declare-fun res!103912 () Bool)

(assert (=> b!212521 (=> (not res!103912) (not e!138272))))

(assert (=> b!212521 (= res!103912 (= (select (arr!4814 _keys!825) i!601) k0!843))))

(declare-fun b!212522 () Bool)

(declare-fun res!103911 () Bool)

(assert (=> b!212522 (=> (not res!103911) (not e!138272))))

(assert (=> b!212522 (= res!103911 (and (= (size!5140 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5139 _keys!825) (size!5140 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212523 () Bool)

(declare-fun lt!109564 () tuple2!4208)

(assert (=> b!212523 (= e!138271 (= lt!109568 (+!579 lt!109563 lt!109564)))))

(assert (=> b!212523 (= lt!109568 (+!579 lt!109562 lt!109564))))

(assert (=> b!212523 (= lt!109564 (tuple2!4209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!212524 () Bool)

(declare-fun res!103908 () Bool)

(assert (=> b!212524 (=> (not res!103908) (not e!138272))))

(assert (=> b!212524 (= res!103908 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5139 _keys!825))))))

(declare-fun b!212525 () Bool)

(declare-fun res!103909 () Bool)

(assert (=> b!212525 (=> (not res!103909) (not e!138272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212525 (= res!103909 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!9296 () Bool)

(declare-fun tp!19885 () Bool)

(assert (=> mapNonEmpty!9296 (= mapRes!9296 (and tp!19885 e!138267))))

(declare-fun mapValue!9296 () ValueCell!2391)

(declare-fun mapKey!9296 () (_ BitVec 32))

(declare-fun mapRest!9296 () (Array (_ BitVec 32) ValueCell!2391))

(assert (=> mapNonEmpty!9296 (= (arr!4815 _values!649) (store mapRest!9296 mapKey!9296 mapValue!9296))))

(assert (= (and start!21116 res!103913) b!212522))

(assert (= (and b!212522 res!103911) b!212515))

(assert (= (and b!212515 res!103915) b!212518))

(assert (= (and b!212518 res!103914) b!212524))

(assert (= (and b!212524 res!103908) b!212525))

(assert (= (and b!212525 res!103909) b!212521))

(assert (= (and b!212521 res!103912) b!212520))

(assert (= (and b!212520 (not res!103910)) b!212523))

(assert (= (and b!212517 condMapEmpty!9296) mapIsEmpty!9296))

(assert (= (and b!212517 (not condMapEmpty!9296)) mapNonEmpty!9296))

(get-info :version)

(assert (= (and mapNonEmpty!9296 ((_ is ValueCellFull!2391) mapValue!9296)) b!212516))

(assert (= (and b!212517 ((_ is ValueCellFull!2391) mapDefault!9296)) b!212519))

(assert (= start!21116 b!212517))

(declare-fun m!240317 () Bool)

(assert (=> b!212515 m!240317))

(declare-fun m!240319 () Bool)

(assert (=> b!212518 m!240319))

(declare-fun m!240321 () Bool)

(assert (=> b!212523 m!240321))

(declare-fun m!240323 () Bool)

(assert (=> b!212523 m!240323))

(declare-fun m!240325 () Bool)

(assert (=> mapNonEmpty!9296 m!240325))

(declare-fun m!240327 () Bool)

(assert (=> start!21116 m!240327))

(declare-fun m!240329 () Bool)

(assert (=> start!21116 m!240329))

(declare-fun m!240331 () Bool)

(assert (=> start!21116 m!240331))

(declare-fun m!240333 () Bool)

(assert (=> b!212525 m!240333))

(declare-fun m!240335 () Bool)

(assert (=> b!212520 m!240335))

(declare-fun m!240337 () Bool)

(assert (=> b!212520 m!240337))

(declare-fun m!240339 () Bool)

(assert (=> b!212520 m!240339))

(declare-fun m!240341 () Bool)

(assert (=> b!212520 m!240341))

(declare-fun m!240343 () Bool)

(assert (=> b!212520 m!240343))

(declare-fun m!240345 () Bool)

(assert (=> b!212520 m!240345))

(declare-fun m!240347 () Bool)

(assert (=> b!212520 m!240347))

(declare-fun m!240349 () Bool)

(assert (=> b!212521 m!240349))

(check-sat (not b_next!5607) (not b!212523) (not b!212525) (not b!212520) (not start!21116) (not b!212518) (not b!212515) tp_is_empty!5469 b_and!12449 (not mapNonEmpty!9296))
(check-sat b_and!12449 (not b_next!5607))
