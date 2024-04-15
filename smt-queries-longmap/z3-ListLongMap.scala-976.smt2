; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21118 () Bool)

(assert start!21118)

(declare-fun b_free!5605 () Bool)

(declare-fun b_next!5605 () Bool)

(assert (=> start!21118 (= b_free!5605 (not b_next!5605))))

(declare-fun tp!19879 () Bool)

(declare-fun b_and!12421 () Bool)

(assert (=> start!21118 (= tp!19879 b_and!12421)))

(declare-fun b!212335 () Bool)

(declare-fun res!103796 () Bool)

(declare-fun e!138151 () Bool)

(assert (=> b!212335 (=> (not res!103796) (not e!138151))))

(declare-datatypes ((array!10127 0))(
  ( (array!10128 (arr!4805 (Array (_ BitVec 32) (_ BitVec 64))) (size!5131 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10127)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6937 0))(
  ( (V!6938 (val!2778 Int)) )
))
(declare-datatypes ((ValueCell!2390 0))(
  ( (ValueCellFull!2390 (v!4774 V!6937)) (EmptyCell!2390) )
))
(declare-datatypes ((array!10129 0))(
  ( (array!10130 (arr!4806 (Array (_ BitVec 32) ValueCell!2390)) (size!5132 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10129)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!212335 (= res!103796 (and (= (size!5132 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5131 _keys!825) (size!5132 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212336 () Bool)

(declare-fun e!138148 () Bool)

(declare-fun e!138150 () Bool)

(declare-fun mapRes!9293 () Bool)

(assert (=> b!212336 (= e!138148 (and e!138150 mapRes!9293))))

(declare-fun condMapEmpty!9293 () Bool)

(declare-fun mapDefault!9293 () ValueCell!2390)

(assert (=> b!212336 (= condMapEmpty!9293 (= (arr!4806 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2390)) mapDefault!9293)))))

(declare-fun b!212337 () Bool)

(declare-fun e!138152 () Bool)

(assert (=> b!212337 (= e!138151 (not e!138152))))

(declare-fun res!103791 () Bool)

(assert (=> b!212337 (=> res!103791 e!138152)))

(assert (=> b!212337 (= res!103791 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4174 0))(
  ( (tuple2!4175 (_1!2098 (_ BitVec 64)) (_2!2098 V!6937)) )
))
(declare-datatypes ((List!3082 0))(
  ( (Nil!3079) (Cons!3078 (h!3720 tuple2!4174) (t!8020 List!3082)) )
))
(declare-datatypes ((ListLongMap!3077 0))(
  ( (ListLongMap!3078 (toList!1554 List!3082)) )
))
(declare-fun lt!109358 () ListLongMap!3077)

(declare-fun zeroValue!615 () V!6937)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6937)

(declare-fun getCurrentListMap!1065 (array!10127 array!10129 (_ BitVec 32) (_ BitVec 32) V!6937 V!6937 (_ BitVec 32) Int) ListLongMap!3077)

(assert (=> b!212337 (= lt!109358 (getCurrentListMap!1065 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109361 () array!10129)

(declare-fun lt!109362 () ListLongMap!3077)

(assert (=> b!212337 (= lt!109362 (getCurrentListMap!1065 _keys!825 lt!109361 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109357 () ListLongMap!3077)

(declare-fun lt!109364 () ListLongMap!3077)

(assert (=> b!212337 (and (= lt!109357 lt!109364) (= lt!109364 lt!109357))))

(declare-fun lt!109363 () ListLongMap!3077)

(declare-fun v!520 () V!6937)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!578 (ListLongMap!3077 tuple2!4174) ListLongMap!3077)

(assert (=> b!212337 (= lt!109364 (+!578 lt!109363 (tuple2!4175 k0!843 v!520)))))

(declare-datatypes ((Unit!6406 0))(
  ( (Unit!6407) )
))
(declare-fun lt!109359 () Unit!6406)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!226 (array!10127 array!10129 (_ BitVec 32) (_ BitVec 32) V!6937 V!6937 (_ BitVec 32) (_ BitVec 64) V!6937 (_ BitVec 32) Int) Unit!6406)

(assert (=> b!212337 (= lt!109359 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!226 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!502 (array!10127 array!10129 (_ BitVec 32) (_ BitVec 32) V!6937 V!6937 (_ BitVec 32) Int) ListLongMap!3077)

(assert (=> b!212337 (= lt!109357 (getCurrentListMapNoExtraKeys!502 _keys!825 lt!109361 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212337 (= lt!109361 (array!10130 (store (arr!4806 _values!649) i!601 (ValueCellFull!2390 v!520)) (size!5132 _values!649)))))

(assert (=> b!212337 (= lt!109363 (getCurrentListMapNoExtraKeys!502 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!103793 () Bool)

(assert (=> start!21118 (=> (not res!103793) (not e!138151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21118 (= res!103793 (validMask!0 mask!1149))))

(assert (=> start!21118 e!138151))

(declare-fun array_inv!3155 (array!10129) Bool)

(assert (=> start!21118 (and (array_inv!3155 _values!649) e!138148)))

(assert (=> start!21118 true))

(declare-fun tp_is_empty!5467 () Bool)

(assert (=> start!21118 tp_is_empty!5467))

(declare-fun array_inv!3156 (array!10127) Bool)

(assert (=> start!21118 (array_inv!3156 _keys!825)))

(assert (=> start!21118 tp!19879))

(declare-fun b!212338 () Bool)

(declare-fun res!103789 () Bool)

(assert (=> b!212338 (=> (not res!103789) (not e!138151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10127 (_ BitVec 32)) Bool)

(assert (=> b!212338 (= res!103789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212339 () Bool)

(declare-fun res!103790 () Bool)

(assert (=> b!212339 (=> (not res!103790) (not e!138151))))

(assert (=> b!212339 (= res!103790 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5131 _keys!825))))))

(declare-fun b!212340 () Bool)

(assert (=> b!212340 (= e!138150 tp_is_empty!5467)))

(declare-fun mapNonEmpty!9293 () Bool)

(declare-fun tp!19880 () Bool)

(declare-fun e!138149 () Bool)

(assert (=> mapNonEmpty!9293 (= mapRes!9293 (and tp!19880 e!138149))))

(declare-fun mapKey!9293 () (_ BitVec 32))

(declare-fun mapRest!9293 () (Array (_ BitVec 32) ValueCell!2390))

(declare-fun mapValue!9293 () ValueCell!2390)

(assert (=> mapNonEmpty!9293 (= (arr!4806 _values!649) (store mapRest!9293 mapKey!9293 mapValue!9293))))

(declare-fun b!212341 () Bool)

(declare-fun lt!109360 () tuple2!4174)

(assert (=> b!212341 (= e!138152 (= lt!109362 (+!578 lt!109364 lt!109360)))))

(assert (=> b!212341 (= lt!109362 (+!578 lt!109357 lt!109360))))

(assert (=> b!212341 (= lt!109360 (tuple2!4175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!212342 () Bool)

(assert (=> b!212342 (= e!138149 tp_is_empty!5467)))

(declare-fun b!212343 () Bool)

(declare-fun res!103792 () Bool)

(assert (=> b!212343 (=> (not res!103792) (not e!138151))))

(assert (=> b!212343 (= res!103792 (= (select (arr!4805 _keys!825) i!601) k0!843))))

(declare-fun b!212344 () Bool)

(declare-fun res!103795 () Bool)

(assert (=> b!212344 (=> (not res!103795) (not e!138151))))

(declare-datatypes ((List!3083 0))(
  ( (Nil!3080) (Cons!3079 (h!3721 (_ BitVec 64)) (t!8021 List!3083)) )
))
(declare-fun arrayNoDuplicates!0 (array!10127 (_ BitVec 32) List!3083) Bool)

(assert (=> b!212344 (= res!103795 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3080))))

(declare-fun b!212345 () Bool)

(declare-fun res!103794 () Bool)

(assert (=> b!212345 (=> (not res!103794) (not e!138151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212345 (= res!103794 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!9293 () Bool)

(assert (=> mapIsEmpty!9293 mapRes!9293))

(assert (= (and start!21118 res!103793) b!212335))

(assert (= (and b!212335 res!103796) b!212338))

(assert (= (and b!212338 res!103789) b!212344))

(assert (= (and b!212344 res!103795) b!212339))

(assert (= (and b!212339 res!103790) b!212345))

(assert (= (and b!212345 res!103794) b!212343))

(assert (= (and b!212343 res!103792) b!212337))

(assert (= (and b!212337 (not res!103791)) b!212341))

(assert (= (and b!212336 condMapEmpty!9293) mapIsEmpty!9293))

(assert (= (and b!212336 (not condMapEmpty!9293)) mapNonEmpty!9293))

(get-info :version)

(assert (= (and mapNonEmpty!9293 ((_ is ValueCellFull!2390) mapValue!9293)) b!212342))

(assert (= (and b!212336 ((_ is ValueCellFull!2390) mapDefault!9293)) b!212340))

(assert (= start!21118 b!212336))

(declare-fun m!239667 () Bool)

(assert (=> mapNonEmpty!9293 m!239667))

(declare-fun m!239669 () Bool)

(assert (=> b!212337 m!239669))

(declare-fun m!239671 () Bool)

(assert (=> b!212337 m!239671))

(declare-fun m!239673 () Bool)

(assert (=> b!212337 m!239673))

(declare-fun m!239675 () Bool)

(assert (=> b!212337 m!239675))

(declare-fun m!239677 () Bool)

(assert (=> b!212337 m!239677))

(declare-fun m!239679 () Bool)

(assert (=> b!212337 m!239679))

(declare-fun m!239681 () Bool)

(assert (=> b!212337 m!239681))

(declare-fun m!239683 () Bool)

(assert (=> b!212345 m!239683))

(declare-fun m!239685 () Bool)

(assert (=> b!212343 m!239685))

(declare-fun m!239687 () Bool)

(assert (=> start!21118 m!239687))

(declare-fun m!239689 () Bool)

(assert (=> start!21118 m!239689))

(declare-fun m!239691 () Bool)

(assert (=> start!21118 m!239691))

(declare-fun m!239693 () Bool)

(assert (=> b!212341 m!239693))

(declare-fun m!239695 () Bool)

(assert (=> b!212341 m!239695))

(declare-fun m!239697 () Bool)

(assert (=> b!212344 m!239697))

(declare-fun m!239699 () Bool)

(assert (=> b!212338 m!239699))

(check-sat tp_is_empty!5467 (not b!212337) (not b!212341) (not mapNonEmpty!9293) (not b_next!5605) b_and!12421 (not b!212338) (not b!212344) (not b!212345) (not start!21118))
(check-sat b_and!12421 (not b_next!5605))
