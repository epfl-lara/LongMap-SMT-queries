; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39438 () Bool)

(assert start!39438)

(declare-fun b_free!9705 () Bool)

(declare-fun b_next!9705 () Bool)

(assert (=> start!39438 (= b_free!9705 (not b_next!9705))))

(declare-fun tp!34643 () Bool)

(declare-fun b_and!17285 () Bool)

(assert (=> start!39438 (= tp!34643 b_and!17285)))

(declare-fun b!420085 () Bool)

(declare-fun res!244988 () Bool)

(declare-fun e!250269 () Bool)

(assert (=> b!420085 (=> (not res!244988) (not e!250269))))

(declare-datatypes ((array!25563 0))(
  ( (array!25564 (arr!12231 (Array (_ BitVec 32) (_ BitVec 64))) (size!12583 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25563)

(declare-datatypes ((List!7176 0))(
  ( (Nil!7173) (Cons!7172 (h!8028 (_ BitVec 64)) (t!12546 List!7176)) )
))
(declare-fun arrayNoDuplicates!0 (array!25563 (_ BitVec 32) List!7176) Bool)

(assert (=> b!420085 (= res!244988 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7173))))

(declare-fun b!420086 () Bool)

(declare-fun e!250272 () Bool)

(declare-fun tp_is_empty!10857 () Bool)

(assert (=> b!420086 (= e!250272 tp_is_empty!10857)))

(declare-fun b!420087 () Bool)

(declare-fun e!250268 () Bool)

(assert (=> b!420087 (= e!250268 tp_is_empty!10857)))

(declare-datatypes ((V!15581 0))(
  ( (V!15582 (val!5473 Int)) )
))
(declare-fun minValue!515 () V!15581)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5085 0))(
  ( (ValueCellFull!5085 (v!7720 V!15581)) (EmptyCell!5085) )
))
(declare-datatypes ((array!25565 0))(
  ( (array!25566 (arr!12232 (Array (_ BitVec 32) ValueCell!5085)) (size!12584 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25565)

(declare-fun zeroValue!515 () V!15581)

(declare-fun c!55271 () Bool)

(declare-fun lt!192707 () array!25563)

(declare-datatypes ((tuple2!7168 0))(
  ( (tuple2!7169 (_1!3595 (_ BitVec 64)) (_2!3595 V!15581)) )
))
(declare-datatypes ((List!7177 0))(
  ( (Nil!7174) (Cons!7173 (h!8029 tuple2!7168) (t!12547 List!7177)) )
))
(declare-datatypes ((ListLongMap!6081 0))(
  ( (ListLongMap!6082 (toList!3056 List!7177)) )
))
(declare-fun call!29293 () ListLongMap!6081)

(declare-fun lt!192712 () array!25565)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!29290 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1261 (array!25563 array!25565 (_ BitVec 32) (_ BitVec 32) V!15581 V!15581 (_ BitVec 32) Int) ListLongMap!6081)

(assert (=> bm!29290 (= call!29293 (getCurrentListMapNoExtraKeys!1261 (ite c!55271 _keys!709 lt!192707) (ite c!55271 _values!549 lt!192712) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29294 () ListLongMap!6081)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!420088 () Bool)

(declare-fun e!250273 () Bool)

(declare-fun v!412 () V!15581)

(declare-fun +!1253 (ListLongMap!6081 tuple2!7168) ListLongMap!6081)

(assert (=> b!420088 (= e!250273 (= call!29294 (+!1253 call!29293 (tuple2!7169 k0!794 v!412))))))

(declare-fun b!420089 () Bool)

(declare-fun e!250271 () Bool)

(declare-fun mapRes!17907 () Bool)

(assert (=> b!420089 (= e!250271 (and e!250272 mapRes!17907))))

(declare-fun condMapEmpty!17907 () Bool)

(declare-fun mapDefault!17907 () ValueCell!5085)

(assert (=> b!420089 (= condMapEmpty!17907 (= (arr!12232 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5085)) mapDefault!17907)))))

(declare-fun b!420090 () Bool)

(declare-fun res!244989 () Bool)

(assert (=> b!420090 (=> (not res!244989) (not e!250269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25563 (_ BitVec 32)) Bool)

(assert (=> b!420090 (= res!244989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420091 () Bool)

(declare-fun res!244993 () Bool)

(assert (=> b!420091 (=> (not res!244993) (not e!250269))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420091 (= res!244993 (or (= (select (arr!12231 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12231 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420092 () Bool)

(declare-fun e!250275 () Bool)

(assert (=> b!420092 (= e!250275 true)))

(declare-fun lt!192716 () V!15581)

(declare-fun lt!192715 () tuple2!7168)

(declare-fun lt!192711 () ListLongMap!6081)

(assert (=> b!420092 (= (+!1253 lt!192711 lt!192715) (+!1253 (+!1253 lt!192711 (tuple2!7169 k0!794 lt!192716)) lt!192715))))

(declare-fun lt!192709 () V!15581)

(assert (=> b!420092 (= lt!192715 (tuple2!7169 k0!794 lt!192709))))

(declare-datatypes ((Unit!12410 0))(
  ( (Unit!12411) )
))
(declare-fun lt!192713 () Unit!12410)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!50 (ListLongMap!6081 (_ BitVec 64) V!15581 V!15581) Unit!12410)

(assert (=> b!420092 (= lt!192713 (addSameAsAddTwiceSameKeyDiffValues!50 lt!192711 k0!794 lt!192716 lt!192709))))

(declare-fun lt!192710 () V!15581)

(declare-fun get!6070 (ValueCell!5085 V!15581) V!15581)

(assert (=> b!420092 (= lt!192716 (get!6070 (select (arr!12232 _values!549) from!863) lt!192710))))

(declare-fun lt!192708 () ListLongMap!6081)

(assert (=> b!420092 (= lt!192708 (+!1253 lt!192711 (tuple2!7169 (select (arr!12231 lt!192707) from!863) lt!192709)))))

(assert (=> b!420092 (= lt!192709 (get!6070 (select (store (arr!12232 _values!549) i!563 (ValueCellFull!5085 v!412)) from!863) lt!192710))))

(declare-fun dynLambda!721 (Int (_ BitVec 64)) V!15581)

(assert (=> b!420092 (= lt!192710 (dynLambda!721 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420092 (= lt!192711 (getCurrentListMapNoExtraKeys!1261 lt!192707 lt!192712 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!244991 () Bool)

(assert (=> start!39438 (=> (not res!244991) (not e!250269))))

(assert (=> start!39438 (= res!244991 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12583 _keys!709))))))

(assert (=> start!39438 e!250269))

(assert (=> start!39438 tp_is_empty!10857))

(assert (=> start!39438 tp!34643))

(assert (=> start!39438 true))

(declare-fun array_inv!8918 (array!25565) Bool)

(assert (=> start!39438 (and (array_inv!8918 _values!549) e!250271)))

(declare-fun array_inv!8919 (array!25563) Bool)

(assert (=> start!39438 (array_inv!8919 _keys!709)))

(declare-fun b!420093 () Bool)

(declare-fun res!244990 () Bool)

(declare-fun e!250274 () Bool)

(assert (=> b!420093 (=> (not res!244990) (not e!250274))))

(assert (=> b!420093 (= res!244990 (arrayNoDuplicates!0 lt!192707 #b00000000000000000000000000000000 Nil!7173))))

(declare-fun b!420094 () Bool)

(declare-fun res!245001 () Bool)

(assert (=> b!420094 (=> (not res!245001) (not e!250269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420094 (= res!245001 (validMask!0 mask!1025))))

(declare-fun b!420095 () Bool)

(declare-fun res!244994 () Bool)

(assert (=> b!420095 (=> (not res!244994) (not e!250269))))

(assert (=> b!420095 (= res!244994 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12583 _keys!709))))))

(declare-fun b!420096 () Bool)

(assert (=> b!420096 (= e!250269 e!250274)))

(declare-fun res!244996 () Bool)

(assert (=> b!420096 (=> (not res!244996) (not e!250274))))

(assert (=> b!420096 (= res!244996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192707 mask!1025))))

(assert (=> b!420096 (= lt!192707 (array!25564 (store (arr!12231 _keys!709) i!563 k0!794) (size!12583 _keys!709)))))

(declare-fun b!420097 () Bool)

(declare-fun res!244995 () Bool)

(assert (=> b!420097 (=> (not res!244995) (not e!250269))))

(assert (=> b!420097 (= res!244995 (and (= (size!12584 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12583 _keys!709) (size!12584 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420098 () Bool)

(declare-fun res!245000 () Bool)

(assert (=> b!420098 (=> (not res!245000) (not e!250274))))

(assert (=> b!420098 (= res!245000 (bvsle from!863 i!563))))

(declare-fun b!420099 () Bool)

(declare-fun e!250267 () Bool)

(assert (=> b!420099 (= e!250274 e!250267)))

(declare-fun res!244998 () Bool)

(assert (=> b!420099 (=> (not res!244998) (not e!250267))))

(assert (=> b!420099 (= res!244998 (= from!863 i!563))))

(assert (=> b!420099 (= lt!192708 (getCurrentListMapNoExtraKeys!1261 lt!192707 lt!192712 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420099 (= lt!192712 (array!25566 (store (arr!12232 _values!549) i!563 (ValueCellFull!5085 v!412)) (size!12584 _values!549)))))

(declare-fun lt!192706 () ListLongMap!6081)

(assert (=> b!420099 (= lt!192706 (getCurrentListMapNoExtraKeys!1261 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420100 () Bool)

(assert (=> b!420100 (= e!250267 (not e!250275))))

(declare-fun res!244992 () Bool)

(assert (=> b!420100 (=> res!244992 e!250275)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420100 (= res!244992 (validKeyInArray!0 (select (arr!12231 _keys!709) from!863)))))

(assert (=> b!420100 e!250273))

(assert (=> b!420100 (= c!55271 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192714 () Unit!12410)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!454 (array!25563 array!25565 (_ BitVec 32) (_ BitVec 32) V!15581 V!15581 (_ BitVec 32) (_ BitVec 64) V!15581 (_ BitVec 32) Int) Unit!12410)

(assert (=> b!420100 (= lt!192714 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!454 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420101 () Bool)

(assert (=> b!420101 (= e!250273 (= call!29293 call!29294))))

(declare-fun bm!29291 () Bool)

(assert (=> bm!29291 (= call!29294 (getCurrentListMapNoExtraKeys!1261 (ite c!55271 lt!192707 _keys!709) (ite c!55271 lt!192712 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420102 () Bool)

(declare-fun res!244997 () Bool)

(assert (=> b!420102 (=> (not res!244997) (not e!250269))))

(assert (=> b!420102 (= res!244997 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17907 () Bool)

(assert (=> mapIsEmpty!17907 mapRes!17907))

(declare-fun b!420103 () Bool)

(declare-fun res!244999 () Bool)

(assert (=> b!420103 (=> (not res!244999) (not e!250269))))

(declare-fun arrayContainsKey!0 (array!25563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420103 (= res!244999 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17907 () Bool)

(declare-fun tp!34644 () Bool)

(assert (=> mapNonEmpty!17907 (= mapRes!17907 (and tp!34644 e!250268))))

(declare-fun mapRest!17907 () (Array (_ BitVec 32) ValueCell!5085))

(declare-fun mapValue!17907 () ValueCell!5085)

(declare-fun mapKey!17907 () (_ BitVec 32))

(assert (=> mapNonEmpty!17907 (= (arr!12232 _values!549) (store mapRest!17907 mapKey!17907 mapValue!17907))))

(assert (= (and start!39438 res!244991) b!420094))

(assert (= (and b!420094 res!245001) b!420097))

(assert (= (and b!420097 res!244995) b!420090))

(assert (= (and b!420090 res!244989) b!420085))

(assert (= (and b!420085 res!244988) b!420095))

(assert (= (and b!420095 res!244994) b!420102))

(assert (= (and b!420102 res!244997) b!420091))

(assert (= (and b!420091 res!244993) b!420103))

(assert (= (and b!420103 res!244999) b!420096))

(assert (= (and b!420096 res!244996) b!420093))

(assert (= (and b!420093 res!244990) b!420098))

(assert (= (and b!420098 res!245000) b!420099))

(assert (= (and b!420099 res!244998) b!420100))

(assert (= (and b!420100 c!55271) b!420088))

(assert (= (and b!420100 (not c!55271)) b!420101))

(assert (= (or b!420088 b!420101) bm!29291))

(assert (= (or b!420088 b!420101) bm!29290))

(assert (= (and b!420100 (not res!244992)) b!420092))

(assert (= (and b!420089 condMapEmpty!17907) mapIsEmpty!17907))

(assert (= (and b!420089 (not condMapEmpty!17907)) mapNonEmpty!17907))

(get-info :version)

(assert (= (and mapNonEmpty!17907 ((_ is ValueCellFull!5085) mapValue!17907)) b!420087))

(assert (= (and b!420089 ((_ is ValueCellFull!5085) mapDefault!17907)) b!420086))

(assert (= start!39438 b!420089))

(declare-fun b_lambda!9009 () Bool)

(assert (=> (not b_lambda!9009) (not b!420092)))

(declare-fun t!12545 () Bool)

(declare-fun tb!3327 () Bool)

(assert (=> (and start!39438 (= defaultEntry!557 defaultEntry!557) t!12545) tb!3327))

(declare-fun result!6181 () Bool)

(assert (=> tb!3327 (= result!6181 tp_is_empty!10857)))

(assert (=> b!420092 t!12545))

(declare-fun b_and!17287 () Bool)

(assert (= b_and!17285 (and (=> t!12545 result!6181) b_and!17287)))

(declare-fun m!409667 () Bool)

(assert (=> b!420091 m!409667))

(declare-fun m!409669 () Bool)

(assert (=> b!420103 m!409669))

(declare-fun m!409671 () Bool)

(assert (=> bm!29290 m!409671))

(declare-fun m!409673 () Bool)

(assert (=> b!420090 m!409673))

(declare-fun m!409675 () Bool)

(assert (=> b!420102 m!409675))

(declare-fun m!409677 () Bool)

(assert (=> b!420099 m!409677))

(declare-fun m!409679 () Bool)

(assert (=> b!420099 m!409679))

(declare-fun m!409681 () Bool)

(assert (=> b!420099 m!409681))

(declare-fun m!409683 () Bool)

(assert (=> b!420092 m!409683))

(declare-fun m!409685 () Bool)

(assert (=> b!420092 m!409685))

(declare-fun m!409687 () Bool)

(assert (=> b!420092 m!409687))

(declare-fun m!409689 () Bool)

(assert (=> b!420092 m!409689))

(declare-fun m!409691 () Bool)

(assert (=> b!420092 m!409691))

(assert (=> b!420092 m!409683))

(declare-fun m!409693 () Bool)

(assert (=> b!420092 m!409693))

(declare-fun m!409695 () Bool)

(assert (=> b!420092 m!409695))

(declare-fun m!409697 () Bool)

(assert (=> b!420092 m!409697))

(declare-fun m!409699 () Bool)

(assert (=> b!420092 m!409699))

(assert (=> b!420092 m!409679))

(assert (=> b!420092 m!409691))

(declare-fun m!409701 () Bool)

(assert (=> b!420092 m!409701))

(declare-fun m!409703 () Bool)

(assert (=> b!420092 m!409703))

(declare-fun m!409705 () Bool)

(assert (=> b!420092 m!409705))

(assert (=> b!420092 m!409693))

(declare-fun m!409707 () Bool)

(assert (=> b!420093 m!409707))

(declare-fun m!409709 () Bool)

(assert (=> b!420085 m!409709))

(declare-fun m!409711 () Bool)

(assert (=> start!39438 m!409711))

(declare-fun m!409713 () Bool)

(assert (=> start!39438 m!409713))

(declare-fun m!409715 () Bool)

(assert (=> mapNonEmpty!17907 m!409715))

(declare-fun m!409717 () Bool)

(assert (=> b!420096 m!409717))

(declare-fun m!409719 () Bool)

(assert (=> b!420096 m!409719))

(declare-fun m!409721 () Bool)

(assert (=> b!420100 m!409721))

(assert (=> b!420100 m!409721))

(declare-fun m!409723 () Bool)

(assert (=> b!420100 m!409723))

(declare-fun m!409725 () Bool)

(assert (=> b!420100 m!409725))

(declare-fun m!409727 () Bool)

(assert (=> b!420094 m!409727))

(declare-fun m!409729 () Bool)

(assert (=> bm!29291 m!409729))

(declare-fun m!409731 () Bool)

(assert (=> b!420088 m!409731))

(check-sat (not b!420090) (not bm!29291) (not start!39438) (not b!420099) (not b_lambda!9009) (not b!420102) (not mapNonEmpty!17907) (not b!420088) (not b!420093) (not b_next!9705) (not b!420096) (not b!420094) (not bm!29290) (not b!420100) b_and!17287 (not b!420103) tp_is_empty!10857 (not b!420092) (not b!420085))
(check-sat b_and!17287 (not b_next!9705))
