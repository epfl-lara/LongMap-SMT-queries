; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39296 () Bool)

(assert start!39296)

(declare-fun b_free!9577 () Bool)

(declare-fun b_next!9577 () Bool)

(assert (=> start!39296 (= b_free!9577 (not b_next!9577))))

(declare-fun tp!34260 () Bool)

(declare-fun b_and!17043 () Bool)

(assert (=> start!39296 (= tp!34260 b_and!17043)))

(declare-fun b!416260 () Bool)

(declare-fun res!242310 () Bool)

(declare-fun e!248510 () Bool)

(assert (=> b!416260 (=> (not res!242310) (not e!248510))))

(declare-datatypes ((array!25318 0))(
  ( (array!25319 (arr!12108 (Array (_ BitVec 32) (_ BitVec 64))) (size!12460 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25318)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25318 (_ BitVec 32)) Bool)

(assert (=> b!416260 (= res!242310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416261 () Bool)

(declare-fun e!248512 () Bool)

(assert (=> b!416261 (= e!248512 true)))

(declare-datatypes ((V!15411 0))(
  ( (V!15412 (val!5409 Int)) )
))
(declare-fun lt!190621 () V!15411)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!6928 0))(
  ( (tuple2!6929 (_1!3475 (_ BitVec 64)) (_2!3475 V!15411)) )
))
(declare-datatypes ((List!6947 0))(
  ( (Nil!6944) (Cons!6943 (h!7799 tuple2!6928) (t!12181 List!6947)) )
))
(declare-datatypes ((ListLongMap!5843 0))(
  ( (ListLongMap!5844 (toList!2937 List!6947)) )
))
(declare-fun lt!190623 () ListLongMap!5843)

(declare-fun lt!190615 () tuple2!6928)

(declare-fun +!1208 (ListLongMap!5843 tuple2!6928) ListLongMap!5843)

(assert (=> b!416261 (= (+!1208 lt!190623 lt!190615) (+!1208 (+!1208 lt!190623 (tuple2!6929 k0!794 lt!190621)) lt!190615))))

(declare-fun lt!190616 () V!15411)

(assert (=> b!416261 (= lt!190615 (tuple2!6929 k0!794 lt!190616))))

(declare-datatypes ((Unit!12293 0))(
  ( (Unit!12294) )
))
(declare-fun lt!190613 () Unit!12293)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!4 (ListLongMap!5843 (_ BitVec 64) V!15411 V!15411) Unit!12293)

(assert (=> b!416261 (= lt!190613 (addSameAsAddTwiceSameKeyDiffValues!4 lt!190623 k0!794 lt!190621 lt!190616))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5021 0))(
  ( (ValueCellFull!5021 (v!7657 V!15411)) (EmptyCell!5021) )
))
(declare-datatypes ((array!25320 0))(
  ( (array!25321 (arr!12109 (Array (_ BitVec 32) ValueCell!5021)) (size!12461 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25320)

(declare-fun lt!190618 () V!15411)

(declare-fun get!5984 (ValueCell!5021 V!15411) V!15411)

(assert (=> b!416261 (= lt!190621 (get!5984 (select (arr!12109 _values!549) from!863) lt!190618))))

(declare-fun lt!190619 () ListLongMap!5843)

(declare-fun lt!190617 () array!25318)

(assert (=> b!416261 (= lt!190619 (+!1208 lt!190623 (tuple2!6929 (select (arr!12108 lt!190617) from!863) lt!190616)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15411)

(assert (=> b!416261 (= lt!190616 (get!5984 (select (store (arr!12109 _values!549) i!563 (ValueCellFull!5021 v!412)) from!863) lt!190618))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!671 (Int (_ BitVec 64)) V!15411)

(assert (=> b!416261 (= lt!190618 (dynLambda!671 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!190622 () array!25320)

(declare-fun minValue!515 () V!15411)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15411)

(declare-fun getCurrentListMapNoExtraKeys!1184 (array!25318 array!25320 (_ BitVec 32) (_ BitVec 32) V!15411 V!15411 (_ BitVec 32) Int) ListLongMap!5843)

(assert (=> b!416261 (= lt!190623 (getCurrentListMapNoExtraKeys!1184 lt!190617 lt!190622 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!28897 () ListLongMap!5843)

(declare-fun bm!28893 () Bool)

(declare-fun c!55056 () Bool)

(assert (=> bm!28893 (= call!28897 (getCurrentListMapNoExtraKeys!1184 (ite c!55056 lt!190617 _keys!709) (ite c!55056 lt!190622 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416262 () Bool)

(declare-fun e!248515 () Bool)

(assert (=> b!416262 (= e!248510 e!248515)))

(declare-fun res!242298 () Bool)

(assert (=> b!416262 (=> (not res!242298) (not e!248515))))

(assert (=> b!416262 (= res!242298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190617 mask!1025))))

(assert (=> b!416262 (= lt!190617 (array!25319 (store (arr!12108 _keys!709) i!563 k0!794) (size!12460 _keys!709)))))

(declare-fun b!416263 () Bool)

(declare-fun res!242303 () Bool)

(assert (=> b!416263 (=> (not res!242303) (not e!248510))))

(declare-fun arrayContainsKey!0 (array!25318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416263 (= res!242303 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416264 () Bool)

(declare-fun res!242306 () Bool)

(assert (=> b!416264 (=> (not res!242306) (not e!248510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416264 (= res!242306 (validMask!0 mask!1025))))

(declare-fun b!416265 () Bool)

(declare-fun res!242297 () Bool)

(assert (=> b!416265 (=> (not res!242297) (not e!248515))))

(declare-datatypes ((List!6948 0))(
  ( (Nil!6945) (Cons!6944 (h!7800 (_ BitVec 64)) (t!12182 List!6948)) )
))
(declare-fun arrayNoDuplicates!0 (array!25318 (_ BitVec 32) List!6948) Bool)

(assert (=> b!416265 (= res!242297 (arrayNoDuplicates!0 lt!190617 #b00000000000000000000000000000000 Nil!6945))))

(declare-fun b!416266 () Bool)

(declare-fun res!242301 () Bool)

(assert (=> b!416266 (=> (not res!242301) (not e!248510))))

(assert (=> b!416266 (= res!242301 (or (= (select (arr!12108 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12108 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416267 () Bool)

(declare-fun res!242305 () Bool)

(assert (=> b!416267 (=> (not res!242305) (not e!248510))))

(assert (=> b!416267 (= res!242305 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6945))))

(declare-fun bm!28894 () Bool)

(declare-fun call!28896 () ListLongMap!5843)

(assert (=> bm!28894 (= call!28896 (getCurrentListMapNoExtraKeys!1184 (ite c!55056 _keys!709 lt!190617) (ite c!55056 _values!549 lt!190622) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!242309 () Bool)

(assert (=> start!39296 (=> (not res!242309) (not e!248510))))

(assert (=> start!39296 (= res!242309 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12460 _keys!709))))))

(assert (=> start!39296 e!248510))

(declare-fun tp_is_empty!10729 () Bool)

(assert (=> start!39296 tp_is_empty!10729))

(assert (=> start!39296 tp!34260))

(assert (=> start!39296 true))

(declare-fun e!248509 () Bool)

(declare-fun array_inv!8908 (array!25320) Bool)

(assert (=> start!39296 (and (array_inv!8908 _values!549) e!248509)))

(declare-fun array_inv!8909 (array!25318) Bool)

(assert (=> start!39296 (array_inv!8909 _keys!709)))

(declare-fun b!416268 () Bool)

(declare-fun e!248508 () Bool)

(assert (=> b!416268 (= e!248508 (not e!248512))))

(declare-fun res!242308 () Bool)

(assert (=> b!416268 (=> res!242308 e!248512)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416268 (= res!242308 (validKeyInArray!0 (select (arr!12108 _keys!709) from!863)))))

(declare-fun e!248511 () Bool)

(assert (=> b!416268 e!248511))

(assert (=> b!416268 (= c!55056 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190620 () Unit!12293)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!414 (array!25318 array!25320 (_ BitVec 32) (_ BitVec 32) V!15411 V!15411 (_ BitVec 32) (_ BitVec 64) V!15411 (_ BitVec 32) Int) Unit!12293)

(assert (=> b!416268 (= lt!190620 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!414 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416269 () Bool)

(assert (=> b!416269 (= e!248511 (= call!28896 call!28897))))

(declare-fun b!416270 () Bool)

(assert (=> b!416270 (= e!248511 (= call!28897 (+!1208 call!28896 (tuple2!6929 k0!794 v!412))))))

(declare-fun b!416271 () Bool)

(declare-fun e!248513 () Bool)

(declare-fun mapRes!17715 () Bool)

(assert (=> b!416271 (= e!248509 (and e!248513 mapRes!17715))))

(declare-fun condMapEmpty!17715 () Bool)

(declare-fun mapDefault!17715 () ValueCell!5021)

(assert (=> b!416271 (= condMapEmpty!17715 (= (arr!12109 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5021)) mapDefault!17715)))))

(declare-fun b!416272 () Bool)

(declare-fun res!242300 () Bool)

(assert (=> b!416272 (=> (not res!242300) (not e!248510))))

(assert (=> b!416272 (= res!242300 (validKeyInArray!0 k0!794))))

(declare-fun b!416273 () Bool)

(declare-fun res!242307 () Bool)

(assert (=> b!416273 (=> (not res!242307) (not e!248510))))

(assert (=> b!416273 (= res!242307 (and (= (size!12461 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12460 _keys!709) (size!12461 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416274 () Bool)

(declare-fun res!242304 () Bool)

(assert (=> b!416274 (=> (not res!242304) (not e!248510))))

(assert (=> b!416274 (= res!242304 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12460 _keys!709))))))

(declare-fun b!416275 () Bool)

(declare-fun res!242302 () Bool)

(assert (=> b!416275 (=> (not res!242302) (not e!248515))))

(assert (=> b!416275 (= res!242302 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17715 () Bool)

(assert (=> mapIsEmpty!17715 mapRes!17715))

(declare-fun b!416276 () Bool)

(declare-fun e!248507 () Bool)

(assert (=> b!416276 (= e!248507 tp_is_empty!10729)))

(declare-fun b!416277 () Bool)

(assert (=> b!416277 (= e!248515 e!248508)))

(declare-fun res!242299 () Bool)

(assert (=> b!416277 (=> (not res!242299) (not e!248508))))

(assert (=> b!416277 (= res!242299 (= from!863 i!563))))

(assert (=> b!416277 (= lt!190619 (getCurrentListMapNoExtraKeys!1184 lt!190617 lt!190622 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416277 (= lt!190622 (array!25321 (store (arr!12109 _values!549) i!563 (ValueCellFull!5021 v!412)) (size!12461 _values!549)))))

(declare-fun lt!190614 () ListLongMap!5843)

(assert (=> b!416277 (= lt!190614 (getCurrentListMapNoExtraKeys!1184 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416278 () Bool)

(assert (=> b!416278 (= e!248513 tp_is_empty!10729)))

(declare-fun mapNonEmpty!17715 () Bool)

(declare-fun tp!34259 () Bool)

(assert (=> mapNonEmpty!17715 (= mapRes!17715 (and tp!34259 e!248507))))

(declare-fun mapRest!17715 () (Array (_ BitVec 32) ValueCell!5021))

(declare-fun mapValue!17715 () ValueCell!5021)

(declare-fun mapKey!17715 () (_ BitVec 32))

(assert (=> mapNonEmpty!17715 (= (arr!12109 _values!549) (store mapRest!17715 mapKey!17715 mapValue!17715))))

(assert (= (and start!39296 res!242309) b!416264))

(assert (= (and b!416264 res!242306) b!416273))

(assert (= (and b!416273 res!242307) b!416260))

(assert (= (and b!416260 res!242310) b!416267))

(assert (= (and b!416267 res!242305) b!416274))

(assert (= (and b!416274 res!242304) b!416272))

(assert (= (and b!416272 res!242300) b!416266))

(assert (= (and b!416266 res!242301) b!416263))

(assert (= (and b!416263 res!242303) b!416262))

(assert (= (and b!416262 res!242298) b!416265))

(assert (= (and b!416265 res!242297) b!416275))

(assert (= (and b!416275 res!242302) b!416277))

(assert (= (and b!416277 res!242299) b!416268))

(assert (= (and b!416268 c!55056) b!416270))

(assert (= (and b!416268 (not c!55056)) b!416269))

(assert (= (or b!416270 b!416269) bm!28893))

(assert (= (or b!416270 b!416269) bm!28894))

(assert (= (and b!416268 (not res!242308)) b!416261))

(assert (= (and b!416271 condMapEmpty!17715) mapIsEmpty!17715))

(assert (= (and b!416271 (not condMapEmpty!17715)) mapNonEmpty!17715))

(get-info :version)

(assert (= (and mapNonEmpty!17715 ((_ is ValueCellFull!5021) mapValue!17715)) b!416276))

(assert (= (and b!416271 ((_ is ValueCellFull!5021) mapDefault!17715)) b!416278))

(assert (= start!39296 b!416271))

(declare-fun b_lambda!8903 () Bool)

(assert (=> (not b_lambda!8903) (not b!416261)))

(declare-fun t!12180 () Bool)

(declare-fun tb!3191 () Bool)

(assert (=> (and start!39296 (= defaultEntry!557 defaultEntry!557) t!12180) tb!3191))

(declare-fun result!5917 () Bool)

(assert (=> tb!3191 (= result!5917 tp_is_empty!10729)))

(assert (=> b!416261 t!12180))

(declare-fun b_and!17045 () Bool)

(assert (= b_and!17043 (and (=> t!12180 result!5917) b_and!17045)))

(declare-fun m!405673 () Bool)

(assert (=> b!416265 m!405673))

(declare-fun m!405675 () Bool)

(assert (=> mapNonEmpty!17715 m!405675))

(declare-fun m!405677 () Bool)

(assert (=> b!416277 m!405677))

(declare-fun m!405679 () Bool)

(assert (=> b!416277 m!405679))

(declare-fun m!405681 () Bool)

(assert (=> b!416277 m!405681))

(declare-fun m!405683 () Bool)

(assert (=> b!416268 m!405683))

(assert (=> b!416268 m!405683))

(declare-fun m!405685 () Bool)

(assert (=> b!416268 m!405685))

(declare-fun m!405687 () Bool)

(assert (=> b!416268 m!405687))

(declare-fun m!405689 () Bool)

(assert (=> b!416264 m!405689))

(declare-fun m!405691 () Bool)

(assert (=> start!39296 m!405691))

(declare-fun m!405693 () Bool)

(assert (=> start!39296 m!405693))

(declare-fun m!405695 () Bool)

(assert (=> b!416266 m!405695))

(declare-fun m!405697 () Bool)

(assert (=> b!416272 m!405697))

(declare-fun m!405699 () Bool)

(assert (=> b!416261 m!405699))

(declare-fun m!405701 () Bool)

(assert (=> b!416261 m!405701))

(declare-fun m!405703 () Bool)

(assert (=> b!416261 m!405703))

(assert (=> b!416261 m!405701))

(declare-fun m!405705 () Bool)

(assert (=> b!416261 m!405705))

(assert (=> b!416261 m!405679))

(declare-fun m!405707 () Bool)

(assert (=> b!416261 m!405707))

(declare-fun m!405709 () Bool)

(assert (=> b!416261 m!405709))

(declare-fun m!405711 () Bool)

(assert (=> b!416261 m!405711))

(declare-fun m!405713 () Bool)

(assert (=> b!416261 m!405713))

(declare-fun m!405715 () Bool)

(assert (=> b!416261 m!405715))

(declare-fun m!405717 () Bool)

(assert (=> b!416261 m!405717))

(assert (=> b!416261 m!405709))

(declare-fun m!405719 () Bool)

(assert (=> b!416261 m!405719))

(assert (=> b!416261 m!405715))

(declare-fun m!405721 () Bool)

(assert (=> b!416261 m!405721))

(declare-fun m!405723 () Bool)

(assert (=> b!416263 m!405723))

(declare-fun m!405725 () Bool)

(assert (=> b!416260 m!405725))

(declare-fun m!405727 () Bool)

(assert (=> bm!28893 m!405727))

(declare-fun m!405729 () Bool)

(assert (=> b!416262 m!405729))

(declare-fun m!405731 () Bool)

(assert (=> b!416262 m!405731))

(declare-fun m!405733 () Bool)

(assert (=> b!416270 m!405733))

(declare-fun m!405735 () Bool)

(assert (=> bm!28894 m!405735))

(declare-fun m!405737 () Bool)

(assert (=> b!416267 m!405737))

(check-sat (not b!416265) (not b!416262) (not b_next!9577) (not b!416263) (not b!416264) (not b!416268) (not bm!28893) (not mapNonEmpty!17715) (not b!416261) tp_is_empty!10729 (not b!416270) (not b_lambda!8903) (not b!416260) (not b!416267) (not b!416277) (not b!416272) (not bm!28894) (not start!39296) b_and!17045)
(check-sat b_and!17045 (not b_next!9577))
