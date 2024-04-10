; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20534 () Bool)

(assert start!20534)

(declare-fun b_free!5193 () Bool)

(declare-fun b_next!5193 () Bool)

(assert (=> start!20534 (= b_free!5193 (not b_next!5193))))

(declare-fun tp!18610 () Bool)

(declare-fun b_and!11939 () Bool)

(assert (=> start!20534 (= tp!18610 b_and!11939)))

(declare-fun b!204111 () Bool)

(declare-fun res!98262 () Bool)

(declare-fun e!133578 () Bool)

(assert (=> b!204111 (=> (not res!98262) (not e!133578))))

(declare-datatypes ((array!9317 0))(
  ( (array!9318 (arr!4409 (Array (_ BitVec 32) (_ BitVec 64))) (size!4734 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9317)

(declare-datatypes ((List!2797 0))(
  ( (Nil!2794) (Cons!2793 (h!3435 (_ BitVec 64)) (t!7728 List!2797)) )
))
(declare-fun arrayNoDuplicates!0 (array!9317 (_ BitVec 32) List!2797) Bool)

(assert (=> b!204111 (= res!98262 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2794))))

(declare-fun b!204112 () Bool)

(declare-fun res!98264 () Bool)

(assert (=> b!204112 (=> (not res!98264) (not e!133578))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204112 (= res!98264 (= (select (arr!4409 _keys!825) i!601) k0!843))))

(declare-fun b!204114 () Bool)

(declare-fun res!98261 () Bool)

(assert (=> b!204114 (=> (not res!98261) (not e!133578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204114 (= res!98261 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8642 () Bool)

(declare-fun mapRes!8642 () Bool)

(declare-fun tp!18611 () Bool)

(declare-fun e!133580 () Bool)

(assert (=> mapNonEmpty!8642 (= mapRes!8642 (and tp!18611 e!133580))))

(declare-datatypes ((V!6379 0))(
  ( (V!6380 (val!2569 Int)) )
))
(declare-datatypes ((ValueCell!2181 0))(
  ( (ValueCellFull!2181 (v!4539 V!6379)) (EmptyCell!2181) )
))
(declare-datatypes ((array!9319 0))(
  ( (array!9320 (arr!4410 (Array (_ BitVec 32) ValueCell!2181)) (size!4735 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9319)

(declare-fun mapKey!8642 () (_ BitVec 32))

(declare-fun mapValue!8642 () ValueCell!2181)

(declare-fun mapRest!8642 () (Array (_ BitVec 32) ValueCell!2181))

(assert (=> mapNonEmpty!8642 (= (arr!4410 _values!649) (store mapRest!8642 mapKey!8642 mapValue!8642))))

(declare-fun b!204115 () Bool)

(declare-fun e!133574 () Bool)

(declare-fun e!133575 () Bool)

(assert (=> b!204115 (= e!133574 e!133575)))

(declare-fun res!98265 () Bool)

(assert (=> b!204115 (=> res!98265 e!133575)))

(assert (=> b!204115 (= res!98265 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3898 0))(
  ( (tuple2!3899 (_1!1960 (_ BitVec 64)) (_2!1960 V!6379)) )
))
(declare-datatypes ((List!2798 0))(
  ( (Nil!2795) (Cons!2794 (h!3436 tuple2!3898) (t!7729 List!2798)) )
))
(declare-datatypes ((ListLongMap!2811 0))(
  ( (ListLongMap!2812 (toList!1421 List!2798)) )
))
(declare-fun lt!103298 () ListLongMap!2811)

(declare-fun lt!103291 () ListLongMap!2811)

(assert (=> b!204115 (= lt!103298 lt!103291)))

(declare-fun lt!103297 () ListLongMap!2811)

(declare-fun lt!103289 () tuple2!3898)

(declare-fun +!448 (ListLongMap!2811 tuple2!3898) ListLongMap!2811)

(assert (=> b!204115 (= lt!103291 (+!448 lt!103297 lt!103289))))

(declare-fun lt!103288 () ListLongMap!2811)

(declare-fun lt!103296 () ListLongMap!2811)

(assert (=> b!204115 (= lt!103288 lt!103296)))

(declare-fun lt!103293 () ListLongMap!2811)

(assert (=> b!204115 (= lt!103296 (+!448 lt!103293 lt!103289))))

(declare-fun lt!103290 () ListLongMap!2811)

(assert (=> b!204115 (= lt!103298 (+!448 lt!103290 lt!103289))))

(declare-fun zeroValue!615 () V!6379)

(assert (=> b!204115 (= lt!103289 (tuple2!3899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204116 () Bool)

(assert (=> b!204116 (= e!133578 (not e!133574))))

(declare-fun res!98263 () Bool)

(assert (=> b!204116 (=> res!98263 e!133574)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204116 (= res!98263 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6379)

(declare-fun getCurrentListMap!995 (array!9317 array!9319 (_ BitVec 32) (_ BitVec 32) V!6379 V!6379 (_ BitVec 32) Int) ListLongMap!2811)

(assert (=> b!204116 (= lt!103288 (getCurrentListMap!995 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103292 () array!9319)

(assert (=> b!204116 (= lt!103298 (getCurrentListMap!995 _keys!825 lt!103292 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204116 (and (= lt!103290 lt!103297) (= lt!103297 lt!103290))))

(declare-fun lt!103299 () tuple2!3898)

(assert (=> b!204116 (= lt!103297 (+!448 lt!103293 lt!103299))))

(declare-fun v!520 () V!6379)

(assert (=> b!204116 (= lt!103299 (tuple2!3899 k0!843 v!520))))

(declare-datatypes ((Unit!6190 0))(
  ( (Unit!6191) )
))
(declare-fun lt!103294 () Unit!6190)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!108 (array!9317 array!9319 (_ BitVec 32) (_ BitVec 32) V!6379 V!6379 (_ BitVec 32) (_ BitVec 64) V!6379 (_ BitVec 32) Int) Unit!6190)

(assert (=> b!204116 (= lt!103294 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!108 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!369 (array!9317 array!9319 (_ BitVec 32) (_ BitVec 32) V!6379 V!6379 (_ BitVec 32) Int) ListLongMap!2811)

(assert (=> b!204116 (= lt!103290 (getCurrentListMapNoExtraKeys!369 _keys!825 lt!103292 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204116 (= lt!103292 (array!9320 (store (arr!4410 _values!649) i!601 (ValueCellFull!2181 v!520)) (size!4735 _values!649)))))

(assert (=> b!204116 (= lt!103293 (getCurrentListMapNoExtraKeys!369 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204117 () Bool)

(declare-fun res!98260 () Bool)

(assert (=> b!204117 (=> (not res!98260) (not e!133578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9317 (_ BitVec 32)) Bool)

(assert (=> b!204117 (= res!98260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204118 () Bool)

(declare-fun res!98259 () Bool)

(assert (=> b!204118 (=> (not res!98259) (not e!133578))))

(assert (=> b!204118 (= res!98259 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4734 _keys!825))))))

(declare-fun b!204113 () Bool)

(declare-fun tp_is_empty!5049 () Bool)

(assert (=> b!204113 (= e!133580 tp_is_empty!5049)))

(declare-fun res!98258 () Bool)

(assert (=> start!20534 (=> (not res!98258) (not e!133578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20534 (= res!98258 (validMask!0 mask!1149))))

(assert (=> start!20534 e!133578))

(declare-fun e!133579 () Bool)

(declare-fun array_inv!2913 (array!9319) Bool)

(assert (=> start!20534 (and (array_inv!2913 _values!649) e!133579)))

(assert (=> start!20534 true))

(assert (=> start!20534 tp_is_empty!5049))

(declare-fun array_inv!2914 (array!9317) Bool)

(assert (=> start!20534 (array_inv!2914 _keys!825)))

(assert (=> start!20534 tp!18610))

(declare-fun mapIsEmpty!8642 () Bool)

(assert (=> mapIsEmpty!8642 mapRes!8642))

(declare-fun b!204119 () Bool)

(declare-fun res!98266 () Bool)

(assert (=> b!204119 (=> (not res!98266) (not e!133578))))

(assert (=> b!204119 (= res!98266 (and (= (size!4735 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4734 _keys!825) (size!4735 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204120 () Bool)

(declare-fun e!133577 () Bool)

(assert (=> b!204120 (= e!133577 tp_is_empty!5049)))

(declare-fun b!204121 () Bool)

(assert (=> b!204121 (= e!133579 (and e!133577 mapRes!8642))))

(declare-fun condMapEmpty!8642 () Bool)

(declare-fun mapDefault!8642 () ValueCell!2181)

(assert (=> b!204121 (= condMapEmpty!8642 (= (arr!4410 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2181)) mapDefault!8642)))))

(declare-fun b!204122 () Bool)

(assert (=> b!204122 (= e!133575 true)))

(assert (=> b!204122 (= lt!103291 (+!448 lt!103296 lt!103299))))

(declare-fun lt!103295 () Unit!6190)

(declare-fun addCommutativeForDiffKeys!157 (ListLongMap!2811 (_ BitVec 64) V!6379 (_ BitVec 64) V!6379) Unit!6190)

(assert (=> b!204122 (= lt!103295 (addCommutativeForDiffKeys!157 lt!103293 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20534 res!98258) b!204119))

(assert (= (and b!204119 res!98266) b!204117))

(assert (= (and b!204117 res!98260) b!204111))

(assert (= (and b!204111 res!98262) b!204118))

(assert (= (and b!204118 res!98259) b!204114))

(assert (= (and b!204114 res!98261) b!204112))

(assert (= (and b!204112 res!98264) b!204116))

(assert (= (and b!204116 (not res!98263)) b!204115))

(assert (= (and b!204115 (not res!98265)) b!204122))

(assert (= (and b!204121 condMapEmpty!8642) mapIsEmpty!8642))

(assert (= (and b!204121 (not condMapEmpty!8642)) mapNonEmpty!8642))

(get-info :version)

(assert (= (and mapNonEmpty!8642 ((_ is ValueCellFull!2181) mapValue!8642)) b!204113))

(assert (= (and b!204121 ((_ is ValueCellFull!2181) mapDefault!8642)) b!204120))

(assert (= start!20534 b!204121))

(declare-fun m!231611 () Bool)

(assert (=> start!20534 m!231611))

(declare-fun m!231613 () Bool)

(assert (=> start!20534 m!231613))

(declare-fun m!231615 () Bool)

(assert (=> start!20534 m!231615))

(declare-fun m!231617 () Bool)

(assert (=> b!204114 m!231617))

(declare-fun m!231619 () Bool)

(assert (=> b!204112 m!231619))

(declare-fun m!231621 () Bool)

(assert (=> b!204122 m!231621))

(declare-fun m!231623 () Bool)

(assert (=> b!204122 m!231623))

(declare-fun m!231625 () Bool)

(assert (=> b!204117 m!231625))

(declare-fun m!231627 () Bool)

(assert (=> b!204111 m!231627))

(declare-fun m!231629 () Bool)

(assert (=> mapNonEmpty!8642 m!231629))

(declare-fun m!231631 () Bool)

(assert (=> b!204116 m!231631))

(declare-fun m!231633 () Bool)

(assert (=> b!204116 m!231633))

(declare-fun m!231635 () Bool)

(assert (=> b!204116 m!231635))

(declare-fun m!231637 () Bool)

(assert (=> b!204116 m!231637))

(declare-fun m!231639 () Bool)

(assert (=> b!204116 m!231639))

(declare-fun m!231641 () Bool)

(assert (=> b!204116 m!231641))

(declare-fun m!231643 () Bool)

(assert (=> b!204116 m!231643))

(declare-fun m!231645 () Bool)

(assert (=> b!204115 m!231645))

(declare-fun m!231647 () Bool)

(assert (=> b!204115 m!231647))

(declare-fun m!231649 () Bool)

(assert (=> b!204115 m!231649))

(check-sat (not start!20534) (not b!204117) (not b!204116) (not b!204111) b_and!11939 (not b_next!5193) (not b!204114) (not b!204122) (not mapNonEmpty!8642) tp_is_empty!5049 (not b!204115))
(check-sat b_and!11939 (not b_next!5193))
