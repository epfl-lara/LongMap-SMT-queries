; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20794 () Bool)

(assert start!20794)

(declare-fun b_free!5443 () Bool)

(declare-fun b_next!5443 () Bool)

(assert (=> start!20794 (= b_free!5443 (not b_next!5443))))

(declare-fun tp!19369 () Bool)

(declare-fun b_and!12203 () Bool)

(assert (=> start!20794 (= tp!19369 b_and!12203)))

(declare-fun res!101330 () Bool)

(declare-fun e!135907 () Bool)

(assert (=> start!20794 (=> (not res!101330) (not e!135907))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20794 (= res!101330 (validMask!0 mask!1149))))

(assert (=> start!20794 e!135907))

(declare-datatypes ((V!6721 0))(
  ( (V!6722 (val!2697 Int)) )
))
(declare-datatypes ((ValueCell!2309 0))(
  ( (ValueCellFull!2309 (v!4668 V!6721)) (EmptyCell!2309) )
))
(declare-datatypes ((array!9809 0))(
  ( (array!9810 (arr!4655 (Array (_ BitVec 32) ValueCell!2309)) (size!4980 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9809)

(declare-fun e!135905 () Bool)

(declare-fun array_inv!3053 (array!9809) Bool)

(assert (=> start!20794 (and (array_inv!3053 _values!649) e!135905)))

(assert (=> start!20794 true))

(declare-fun tp_is_empty!5305 () Bool)

(assert (=> start!20794 tp_is_empty!5305))

(declare-datatypes ((array!9811 0))(
  ( (array!9812 (arr!4656 (Array (_ BitVec 32) (_ BitVec 64))) (size!4981 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9811)

(declare-fun array_inv!3054 (array!9811) Bool)

(assert (=> start!20794 (array_inv!3054 _keys!825)))

(assert (=> start!20794 tp!19369))

(declare-fun b!208357 () Bool)

(declare-fun res!101326 () Bool)

(assert (=> b!208357 (=> (not res!101326) (not e!135907))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208357 (= res!101326 (and (= (size!4980 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4981 _keys!825) (size!4980 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208358 () Bool)

(assert (=> b!208358 (= e!135907 false)))

(declare-datatypes ((tuple2!4028 0))(
  ( (tuple2!4029 (_1!2025 (_ BitVec 64)) (_2!2025 V!6721)) )
))
(declare-datatypes ((List!2917 0))(
  ( (Nil!2914) (Cons!2913 (h!3555 tuple2!4028) (t!7840 List!2917)) )
))
(declare-datatypes ((ListLongMap!2943 0))(
  ( (ListLongMap!2944 (toList!1487 List!2917)) )
))
(declare-fun lt!106820 () ListLongMap!2943)

(declare-fun v!520 () V!6721)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6721)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6721)

(declare-fun getCurrentListMapNoExtraKeys!450 (array!9811 array!9809 (_ BitVec 32) (_ BitVec 32) V!6721 V!6721 (_ BitVec 32) Int) ListLongMap!2943)

(assert (=> b!208358 (= lt!106820 (getCurrentListMapNoExtraKeys!450 _keys!825 (array!9810 (store (arr!4655 _values!649) i!601 (ValueCellFull!2309 v!520)) (size!4980 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106819 () ListLongMap!2943)

(assert (=> b!208358 (= lt!106819 (getCurrentListMapNoExtraKeys!450 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208359 () Bool)

(declare-fun res!101329 () Bool)

(assert (=> b!208359 (=> (not res!101329) (not e!135907))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!208359 (= res!101329 (= (select (arr!4656 _keys!825) i!601) k0!843))))

(declare-fun b!208360 () Bool)

(declare-fun res!101328 () Bool)

(assert (=> b!208360 (=> (not res!101328) (not e!135907))))

(declare-datatypes ((List!2918 0))(
  ( (Nil!2915) (Cons!2914 (h!3556 (_ BitVec 64)) (t!7841 List!2918)) )
))
(declare-fun arrayNoDuplicates!0 (array!9811 (_ BitVec 32) List!2918) Bool)

(assert (=> b!208360 (= res!101328 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2915))))

(declare-fun b!208361 () Bool)

(declare-fun e!135906 () Bool)

(assert (=> b!208361 (= e!135906 tp_is_empty!5305)))

(declare-fun b!208362 () Bool)

(declare-fun res!101332 () Bool)

(assert (=> b!208362 (=> (not res!101332) (not e!135907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208362 (= res!101332 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!9026 () Bool)

(declare-fun mapRes!9026 () Bool)

(declare-fun tp!19370 () Bool)

(assert (=> mapNonEmpty!9026 (= mapRes!9026 (and tp!19370 e!135906))))

(declare-fun mapKey!9026 () (_ BitVec 32))

(declare-fun mapValue!9026 () ValueCell!2309)

(declare-fun mapRest!9026 () (Array (_ BitVec 32) ValueCell!2309))

(assert (=> mapNonEmpty!9026 (= (arr!4655 _values!649) (store mapRest!9026 mapKey!9026 mapValue!9026))))

(declare-fun b!208363 () Bool)

(declare-fun res!101331 () Bool)

(assert (=> b!208363 (=> (not res!101331) (not e!135907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9811 (_ BitVec 32)) Bool)

(assert (=> b!208363 (= res!101331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208364 () Bool)

(declare-fun e!135904 () Bool)

(assert (=> b!208364 (= e!135904 tp_is_empty!5305)))

(declare-fun b!208365 () Bool)

(assert (=> b!208365 (= e!135905 (and e!135904 mapRes!9026))))

(declare-fun condMapEmpty!9026 () Bool)

(declare-fun mapDefault!9026 () ValueCell!2309)

(assert (=> b!208365 (= condMapEmpty!9026 (= (arr!4655 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2309)) mapDefault!9026)))))

(declare-fun mapIsEmpty!9026 () Bool)

(assert (=> mapIsEmpty!9026 mapRes!9026))

(declare-fun b!208366 () Bool)

(declare-fun res!101327 () Bool)

(assert (=> b!208366 (=> (not res!101327) (not e!135907))))

(assert (=> b!208366 (= res!101327 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4981 _keys!825))))))

(assert (= (and start!20794 res!101330) b!208357))

(assert (= (and b!208357 res!101326) b!208363))

(assert (= (and b!208363 res!101331) b!208360))

(assert (= (and b!208360 res!101328) b!208366))

(assert (= (and b!208366 res!101327) b!208362))

(assert (= (and b!208362 res!101332) b!208359))

(assert (= (and b!208359 res!101329) b!208358))

(assert (= (and b!208365 condMapEmpty!9026) mapIsEmpty!9026))

(assert (= (and b!208365 (not condMapEmpty!9026)) mapNonEmpty!9026))

(get-info :version)

(assert (= (and mapNonEmpty!9026 ((_ is ValueCellFull!2309) mapValue!9026)) b!208361))

(assert (= (and b!208365 ((_ is ValueCellFull!2309) mapDefault!9026)) b!208364))

(assert (= start!20794 b!208365))

(declare-fun m!236157 () Bool)

(assert (=> b!208360 m!236157))

(declare-fun m!236159 () Bool)

(assert (=> b!208359 m!236159))

(declare-fun m!236161 () Bool)

(assert (=> b!208358 m!236161))

(declare-fun m!236163 () Bool)

(assert (=> b!208358 m!236163))

(declare-fun m!236165 () Bool)

(assert (=> b!208358 m!236165))

(declare-fun m!236167 () Bool)

(assert (=> b!208362 m!236167))

(declare-fun m!236169 () Bool)

(assert (=> start!20794 m!236169))

(declare-fun m!236171 () Bool)

(assert (=> start!20794 m!236171))

(declare-fun m!236173 () Bool)

(assert (=> start!20794 m!236173))

(declare-fun m!236175 () Bool)

(assert (=> mapNonEmpty!9026 m!236175))

(declare-fun m!236177 () Bool)

(assert (=> b!208363 m!236177))

(check-sat (not mapNonEmpty!9026) (not b!208360) (not b!208363) b_and!12203 tp_is_empty!5305 (not b_next!5443) (not start!20794) (not b!208358) (not b!208362))
(check-sat b_and!12203 (not b_next!5443))
