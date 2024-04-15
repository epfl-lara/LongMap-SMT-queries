; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84214 () Bool)

(assert start!84214)

(declare-fun b_free!19933 () Bool)

(declare-fun b_next!19933 () Bool)

(assert (=> start!84214 (= b_free!19933 (not b_next!19933))))

(declare-fun tp!69403 () Bool)

(declare-fun b_and!31917 () Bool)

(assert (=> start!84214 (= tp!69403 b_and!31917)))

(declare-fun b!985128 () Bool)

(declare-fun res!659261 () Bool)

(declare-fun e!555294 () Bool)

(assert (=> b!985128 (=> (not res!659261) (not e!555294))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35697 0))(
  ( (V!35698 (val!11568 Int)) )
))
(declare-datatypes ((ValueCell!11036 0))(
  ( (ValueCellFull!11036 (v!14129 V!35697)) (EmptyCell!11036) )
))
(declare-datatypes ((array!61974 0))(
  ( (array!61975 (arr!29845 (Array (_ BitVec 32) ValueCell!11036)) (size!30326 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61974)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61976 0))(
  ( (array!61977 (arr!29846 (Array (_ BitVec 32) (_ BitVec 64))) (size!30327 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61976)

(assert (=> b!985128 (= res!659261 (and (= (size!30326 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30327 _keys!1544) (size!30326 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36581 () Bool)

(declare-fun mapRes!36581 () Bool)

(declare-fun tp!69404 () Bool)

(declare-fun e!555296 () Bool)

(assert (=> mapNonEmpty!36581 (= mapRes!36581 (and tp!69404 e!555296))))

(declare-fun mapRest!36581 () (Array (_ BitVec 32) ValueCell!11036))

(declare-fun mapKey!36581 () (_ BitVec 32))

(declare-fun mapValue!36581 () ValueCell!11036)

(assert (=> mapNonEmpty!36581 (= (arr!29845 _values!1278) (store mapRest!36581 mapKey!36581 mapValue!36581))))

(declare-fun b!985129 () Bool)

(declare-fun e!555291 () Bool)

(assert (=> b!985129 (= e!555294 e!555291)))

(declare-fun res!659262 () Bool)

(assert (=> b!985129 (=> (not res!659262) (not e!555291))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985129 (= res!659262 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29846 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436978 () V!35697)

(declare-fun get!15511 (ValueCell!11036 V!35697) V!35697)

(declare-fun dynLambda!1833 (Int (_ BitVec 64)) V!35697)

(assert (=> b!985129 (= lt!436978 (get!15511 (select (arr!29845 _values!1278) from!1932) (dynLambda!1833 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35697)

(declare-fun zeroValue!1220 () V!35697)

(declare-datatypes ((tuple2!14882 0))(
  ( (tuple2!14883 (_1!7452 (_ BitVec 64)) (_2!7452 V!35697)) )
))
(declare-datatypes ((List!20730 0))(
  ( (Nil!20727) (Cons!20726 (h!21888 tuple2!14882) (t!29598 List!20730)) )
))
(declare-datatypes ((ListLongMap!13569 0))(
  ( (ListLongMap!13570 (toList!6800 List!20730)) )
))
(declare-fun lt!436980 () ListLongMap!13569)

(declare-fun getCurrentListMapNoExtraKeys!3505 (array!61976 array!61974 (_ BitVec 32) (_ BitVec 32) V!35697 V!35697 (_ BitVec 32) Int) ListLongMap!13569)

(assert (=> b!985129 (= lt!436980 (getCurrentListMapNoExtraKeys!3505 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985130 () Bool)

(declare-fun res!659264 () Bool)

(assert (=> b!985130 (=> (not res!659264) (not e!555294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985130 (= res!659264 (validKeyInArray!0 (select (arr!29846 _keys!1544) from!1932)))))

(declare-fun b!985131 () Bool)

(declare-fun e!555292 () Bool)

(declare-fun e!555293 () Bool)

(assert (=> b!985131 (= e!555292 (and e!555293 mapRes!36581))))

(declare-fun condMapEmpty!36581 () Bool)

(declare-fun mapDefault!36581 () ValueCell!11036)

(assert (=> b!985131 (= condMapEmpty!36581 (= (arr!29845 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11036)) mapDefault!36581)))))

(declare-fun b!985132 () Bool)

(declare-fun res!659265 () Bool)

(assert (=> b!985132 (=> (not res!659265) (not e!555294))))

(declare-datatypes ((List!20731 0))(
  ( (Nil!20728) (Cons!20727 (h!21889 (_ BitVec 64)) (t!29599 List!20731)) )
))
(declare-fun arrayNoDuplicates!0 (array!61976 (_ BitVec 32) List!20731) Bool)

(assert (=> b!985132 (= res!659265 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20728))))

(declare-fun res!659258 () Bool)

(assert (=> start!84214 (=> (not res!659258) (not e!555294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84214 (= res!659258 (validMask!0 mask!1948))))

(assert (=> start!84214 e!555294))

(assert (=> start!84214 true))

(declare-fun tp_is_empty!23035 () Bool)

(assert (=> start!84214 tp_is_empty!23035))

(declare-fun array_inv!23075 (array!61974) Bool)

(assert (=> start!84214 (and (array_inv!23075 _values!1278) e!555292)))

(assert (=> start!84214 tp!69403))

(declare-fun array_inv!23076 (array!61976) Bool)

(assert (=> start!84214 (array_inv!23076 _keys!1544)))

(declare-fun b!985133 () Bool)

(assert (=> b!985133 (= e!555293 tp_is_empty!23035)))

(declare-fun b!985134 () Bool)

(declare-fun res!659260 () Bool)

(assert (=> b!985134 (=> (not res!659260) (not e!555294))))

(assert (=> b!985134 (= res!659260 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30327 _keys!1544))))))

(declare-fun b!985135 () Bool)

(assert (=> b!985135 (= e!555291 (not true))))

(declare-fun lt!436977 () tuple2!14882)

(declare-fun lt!436976 () tuple2!14882)

(declare-fun +!3076 (ListLongMap!13569 tuple2!14882) ListLongMap!13569)

(assert (=> b!985135 (= (+!3076 (+!3076 lt!436980 lt!436977) lt!436976) (+!3076 (+!3076 lt!436980 lt!436976) lt!436977))))

(assert (=> b!985135 (= lt!436976 (tuple2!14883 (select (arr!29846 _keys!1544) from!1932) lt!436978))))

(assert (=> b!985135 (= lt!436977 (tuple2!14883 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32618 0))(
  ( (Unit!32619) )
))
(declare-fun lt!436979 () Unit!32618)

(declare-fun addCommutativeForDiffKeys!680 (ListLongMap!13569 (_ BitVec 64) V!35697 (_ BitVec 64) V!35697) Unit!32618)

(assert (=> b!985135 (= lt!436979 (addCommutativeForDiffKeys!680 lt!436980 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29846 _keys!1544) from!1932) lt!436978))))

(declare-fun b!985136 () Bool)

(assert (=> b!985136 (= e!555296 tp_is_empty!23035)))

(declare-fun b!985137 () Bool)

(declare-fun res!659263 () Bool)

(assert (=> b!985137 (=> (not res!659263) (not e!555294))))

(assert (=> b!985137 (= res!659263 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985138 () Bool)

(declare-fun res!659259 () Bool)

(assert (=> b!985138 (=> (not res!659259) (not e!555294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61976 (_ BitVec 32)) Bool)

(assert (=> b!985138 (= res!659259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36581 () Bool)

(assert (=> mapIsEmpty!36581 mapRes!36581))

(assert (= (and start!84214 res!659258) b!985128))

(assert (= (and b!985128 res!659261) b!985138))

(assert (= (and b!985138 res!659259) b!985132))

(assert (= (and b!985132 res!659265) b!985134))

(assert (= (and b!985134 res!659260) b!985130))

(assert (= (and b!985130 res!659264) b!985137))

(assert (= (and b!985137 res!659263) b!985129))

(assert (= (and b!985129 res!659262) b!985135))

(assert (= (and b!985131 condMapEmpty!36581) mapIsEmpty!36581))

(assert (= (and b!985131 (not condMapEmpty!36581)) mapNonEmpty!36581))

(get-info :version)

(assert (= (and mapNonEmpty!36581 ((_ is ValueCellFull!11036) mapValue!36581)) b!985136))

(assert (= (and b!985131 ((_ is ValueCellFull!11036) mapDefault!36581)) b!985133))

(assert (= start!84214 b!985131))

(declare-fun b_lambda!14947 () Bool)

(assert (=> (not b_lambda!14947) (not b!985129)))

(declare-fun t!29597 () Bool)

(declare-fun tb!6719 () Bool)

(assert (=> (and start!84214 (= defaultEntry!1281 defaultEntry!1281) t!29597) tb!6719))

(declare-fun result!13435 () Bool)

(assert (=> tb!6719 (= result!13435 tp_is_empty!23035)))

(assert (=> b!985129 t!29597))

(declare-fun b_and!31919 () Bool)

(assert (= b_and!31917 (and (=> t!29597 result!13435) b_and!31919)))

(declare-fun m!911669 () Bool)

(assert (=> b!985135 m!911669))

(declare-fun m!911671 () Bool)

(assert (=> b!985135 m!911671))

(declare-fun m!911673 () Bool)

(assert (=> b!985135 m!911673))

(assert (=> b!985135 m!911673))

(declare-fun m!911675 () Bool)

(assert (=> b!985135 m!911675))

(assert (=> b!985135 m!911669))

(declare-fun m!911677 () Bool)

(assert (=> b!985135 m!911677))

(assert (=> b!985135 m!911671))

(declare-fun m!911679 () Bool)

(assert (=> b!985135 m!911679))

(declare-fun m!911681 () Bool)

(assert (=> start!84214 m!911681))

(declare-fun m!911683 () Bool)

(assert (=> start!84214 m!911683))

(declare-fun m!911685 () Bool)

(assert (=> start!84214 m!911685))

(assert (=> b!985130 m!911669))

(assert (=> b!985130 m!911669))

(declare-fun m!911687 () Bool)

(assert (=> b!985130 m!911687))

(assert (=> b!985129 m!911669))

(declare-fun m!911689 () Bool)

(assert (=> b!985129 m!911689))

(declare-fun m!911691 () Bool)

(assert (=> b!985129 m!911691))

(declare-fun m!911693 () Bool)

(assert (=> b!985129 m!911693))

(assert (=> b!985129 m!911689))

(assert (=> b!985129 m!911693))

(declare-fun m!911695 () Bool)

(assert (=> b!985129 m!911695))

(declare-fun m!911697 () Bool)

(assert (=> mapNonEmpty!36581 m!911697))

(declare-fun m!911699 () Bool)

(assert (=> b!985138 m!911699))

(declare-fun m!911701 () Bool)

(assert (=> b!985132 m!911701))

(check-sat (not b_next!19933) (not mapNonEmpty!36581) b_and!31919 (not start!84214) (not b_lambda!14947) tp_is_empty!23035 (not b!985135) (not b!985130) (not b!985132) (not b!985129) (not b!985138))
(check-sat b_and!31919 (not b_next!19933))
