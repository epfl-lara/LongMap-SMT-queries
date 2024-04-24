; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39458 () Bool)

(assert start!39458)

(declare-fun b_free!9739 () Bool)

(declare-fun b_next!9739 () Bool)

(assert (=> start!39458 (= b_free!9739 (not b_next!9739))))

(declare-fun tp!34745 () Bool)

(declare-fun b_and!17367 () Bool)

(assert (=> start!39458 (= tp!34745 b_and!17367)))

(declare-fun b!421039 () Bool)

(declare-fun e!250697 () Bool)

(declare-fun tp_is_empty!10891 () Bool)

(assert (=> b!421039 (= e!250697 tp_is_empty!10891)))

(declare-fun b!421040 () Bool)

(declare-fun res!245704 () Bool)

(declare-fun e!250694 () Bool)

(assert (=> b!421040 (=> (not res!245704) (not e!250694))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421040 (= res!245704 (bvsle from!863 i!563))))

(declare-fun b!421041 () Bool)

(declare-fun e!250699 () Bool)

(declare-fun mapRes!17958 () Bool)

(assert (=> b!421041 (= e!250699 (and e!250697 mapRes!17958))))

(declare-fun condMapEmpty!17958 () Bool)

(declare-datatypes ((V!15627 0))(
  ( (V!15628 (val!5490 Int)) )
))
(declare-datatypes ((ValueCell!5102 0))(
  ( (ValueCellFull!5102 (v!7738 V!15627)) (EmptyCell!5102) )
))
(declare-datatypes ((array!25638 0))(
  ( (array!25639 (arr!12268 (Array (_ BitVec 32) ValueCell!5102)) (size!12620 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25638)

(declare-fun mapDefault!17958 () ValueCell!5102)

(assert (=> b!421041 (= condMapEmpty!17958 (= (arr!12268 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5102)) mapDefault!17958)))))

(declare-fun b!421042 () Bool)

(declare-fun e!250696 () Bool)

(assert (=> b!421042 (= e!250696 true)))

(declare-fun lt!193290 () V!15627)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!7082 0))(
  ( (tuple2!7083 (_1!3552 (_ BitVec 64)) (_2!3552 V!15627)) )
))
(declare-fun lt!193291 () tuple2!7082)

(declare-datatypes ((List!7086 0))(
  ( (Nil!7083) (Cons!7082 (h!7938 tuple2!7082) (t!12482 List!7086)) )
))
(declare-datatypes ((ListLongMap!5997 0))(
  ( (ListLongMap!5998 (toList!3014 List!7086)) )
))
(declare-fun lt!193286 () ListLongMap!5997)

(declare-fun +!1276 (ListLongMap!5997 tuple2!7082) ListLongMap!5997)

(assert (=> b!421042 (= (+!1276 lt!193286 lt!193291) (+!1276 (+!1276 lt!193286 (tuple2!7083 k0!794 lt!193290)) lt!193291))))

(declare-fun lt!193294 () V!15627)

(assert (=> b!421042 (= lt!193291 (tuple2!7083 k0!794 lt!193294))))

(declare-datatypes ((Unit!12427 0))(
  ( (Unit!12428) )
))
(declare-fun lt!193287 () Unit!12427)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!66 (ListLongMap!5997 (_ BitVec 64) V!15627 V!15627) Unit!12427)

(assert (=> b!421042 (= lt!193287 (addSameAsAddTwiceSameKeyDiffValues!66 lt!193286 k0!794 lt!193290 lt!193294))))

(declare-fun lt!193292 () V!15627)

(declare-fun get!6100 (ValueCell!5102 V!15627) V!15627)

(assert (=> b!421042 (= lt!193290 (get!6100 (select (arr!12268 _values!549) from!863) lt!193292))))

(declare-datatypes ((array!25640 0))(
  ( (array!25641 (arr!12269 (Array (_ BitVec 32) (_ BitVec 64))) (size!12621 (_ BitVec 32))) )
))
(declare-fun lt!193295 () array!25640)

(declare-fun lt!193289 () ListLongMap!5997)

(assert (=> b!421042 (= lt!193289 (+!1276 lt!193286 (tuple2!7083 (select (arr!12269 lt!193295) from!863) lt!193294)))))

(declare-fun v!412 () V!15627)

(assert (=> b!421042 (= lt!193294 (get!6100 (select (store (arr!12268 _values!549) i!563 (ValueCellFull!5102 v!412)) from!863) lt!193292))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!733 (Int (_ BitVec 64)) V!15627)

(assert (=> b!421042 (= lt!193292 (dynLambda!733 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15627)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15627)

(declare-fun lt!193293 () array!25638)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1260 (array!25640 array!25638 (_ BitVec 32) (_ BitVec 32) V!15627 V!15627 (_ BitVec 32) Int) ListLongMap!5997)

(assert (=> b!421042 (= lt!193286 (getCurrentListMapNoExtraKeys!1260 lt!193295 lt!193293 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421043 () Bool)

(declare-fun res!245712 () Bool)

(assert (=> b!421043 (=> (not res!245712) (not e!250694))))

(declare-datatypes ((List!7087 0))(
  ( (Nil!7084) (Cons!7083 (h!7939 (_ BitVec 64)) (t!12483 List!7087)) )
))
(declare-fun arrayNoDuplicates!0 (array!25640 (_ BitVec 32) List!7087) Bool)

(assert (=> b!421043 (= res!245712 (arrayNoDuplicates!0 lt!193295 #b00000000000000000000000000000000 Nil!7084))))

(declare-fun mapNonEmpty!17958 () Bool)

(declare-fun tp!34746 () Bool)

(declare-fun e!250695 () Bool)

(assert (=> mapNonEmpty!17958 (= mapRes!17958 (and tp!34746 e!250695))))

(declare-fun mapValue!17958 () ValueCell!5102)

(declare-fun mapRest!17958 () (Array (_ BitVec 32) ValueCell!5102))

(declare-fun mapKey!17958 () (_ BitVec 32))

(assert (=> mapNonEmpty!17958 (= (arr!12268 _values!549) (store mapRest!17958 mapKey!17958 mapValue!17958))))

(declare-fun b!421044 () Bool)

(declare-fun res!245710 () Bool)

(declare-fun e!250700 () Bool)

(assert (=> b!421044 (=> (not res!245710) (not e!250700))))

(declare-fun _keys!709 () array!25640)

(declare-fun arrayContainsKey!0 (array!25640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421044 (= res!245710 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421045 () Bool)

(declare-fun call!29383 () ListLongMap!5997)

(declare-fun call!29382 () ListLongMap!5997)

(declare-fun e!250701 () Bool)

(assert (=> b!421045 (= e!250701 (= call!29383 (+!1276 call!29382 (tuple2!7083 k0!794 v!412))))))

(declare-fun b!421046 () Bool)

(declare-fun res!245699 () Bool)

(assert (=> b!421046 (=> (not res!245699) (not e!250700))))

(assert (=> b!421046 (= res!245699 (or (= (select (arr!12269 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12269 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421047 () Bool)

(assert (=> b!421047 (= e!250700 e!250694)))

(declare-fun res!245703 () Bool)

(assert (=> b!421047 (=> (not res!245703) (not e!250694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25640 (_ BitVec 32)) Bool)

(assert (=> b!421047 (= res!245703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193295 mask!1025))))

(assert (=> b!421047 (= lt!193295 (array!25641 (store (arr!12269 _keys!709) i!563 k0!794) (size!12621 _keys!709)))))

(declare-fun b!421048 () Bool)

(declare-fun res!245701 () Bool)

(assert (=> b!421048 (=> (not res!245701) (not e!250700))))

(assert (=> b!421048 (= res!245701 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7084))))

(declare-fun b!421049 () Bool)

(assert (=> b!421049 (= e!250695 tp_is_empty!10891)))

(declare-fun bm!29379 () Bool)

(declare-fun c!55299 () Bool)

(assert (=> bm!29379 (= call!29383 (getCurrentListMapNoExtraKeys!1260 (ite c!55299 lt!193295 _keys!709) (ite c!55299 lt!193293 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421050 () Bool)

(declare-fun e!250702 () Bool)

(assert (=> b!421050 (= e!250694 e!250702)))

(declare-fun res!245705 () Bool)

(assert (=> b!421050 (=> (not res!245705) (not e!250702))))

(assert (=> b!421050 (= res!245705 (= from!863 i!563))))

(assert (=> b!421050 (= lt!193289 (getCurrentListMapNoExtraKeys!1260 lt!193295 lt!193293 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421050 (= lt!193293 (array!25639 (store (arr!12268 _values!549) i!563 (ValueCellFull!5102 v!412)) (size!12620 _values!549)))))

(declare-fun lt!193288 () ListLongMap!5997)

(assert (=> b!421050 (= lt!193288 (getCurrentListMapNoExtraKeys!1260 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29380 () Bool)

(assert (=> bm!29380 (= call!29382 (getCurrentListMapNoExtraKeys!1260 (ite c!55299 _keys!709 lt!193295) (ite c!55299 _values!549 lt!193293) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!245707 () Bool)

(assert (=> start!39458 (=> (not res!245707) (not e!250700))))

(assert (=> start!39458 (= res!245707 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12621 _keys!709))))))

(assert (=> start!39458 e!250700))

(assert (=> start!39458 tp_is_empty!10891))

(assert (=> start!39458 tp!34745))

(assert (=> start!39458 true))

(declare-fun array_inv!9018 (array!25638) Bool)

(assert (=> start!39458 (and (array_inv!9018 _values!549) e!250699)))

(declare-fun array_inv!9019 (array!25640) Bool)

(assert (=> start!39458 (array_inv!9019 _keys!709)))

(declare-fun b!421051 () Bool)

(declare-fun res!245702 () Bool)

(assert (=> b!421051 (=> (not res!245702) (not e!250700))))

(assert (=> b!421051 (= res!245702 (and (= (size!12620 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12621 _keys!709) (size!12620 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421052 () Bool)

(declare-fun res!245709 () Bool)

(assert (=> b!421052 (=> (not res!245709) (not e!250700))))

(assert (=> b!421052 (= res!245709 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12621 _keys!709))))))

(declare-fun b!421053 () Bool)

(assert (=> b!421053 (= e!250701 (= call!29382 call!29383))))

(declare-fun mapIsEmpty!17958 () Bool)

(assert (=> mapIsEmpty!17958 mapRes!17958))

(declare-fun b!421054 () Bool)

(declare-fun res!245708 () Bool)

(assert (=> b!421054 (=> (not res!245708) (not e!250700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421054 (= res!245708 (validKeyInArray!0 k0!794))))

(declare-fun b!421055 () Bool)

(declare-fun res!245700 () Bool)

(assert (=> b!421055 (=> (not res!245700) (not e!250700))))

(assert (=> b!421055 (= res!245700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421056 () Bool)

(assert (=> b!421056 (= e!250702 (not e!250696))))

(declare-fun res!245711 () Bool)

(assert (=> b!421056 (=> res!245711 e!250696)))

(assert (=> b!421056 (= res!245711 (validKeyInArray!0 (select (arr!12269 _keys!709) from!863)))))

(assert (=> b!421056 e!250701))

(assert (=> b!421056 (= c!55299 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193296 () Unit!12427)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!463 (array!25640 array!25638 (_ BitVec 32) (_ BitVec 32) V!15627 V!15627 (_ BitVec 32) (_ BitVec 64) V!15627 (_ BitVec 32) Int) Unit!12427)

(assert (=> b!421056 (= lt!193296 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!463 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421057 () Bool)

(declare-fun res!245706 () Bool)

(assert (=> b!421057 (=> (not res!245706) (not e!250700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421057 (= res!245706 (validMask!0 mask!1025))))

(assert (= (and start!39458 res!245707) b!421057))

(assert (= (and b!421057 res!245706) b!421051))

(assert (= (and b!421051 res!245702) b!421055))

(assert (= (and b!421055 res!245700) b!421048))

(assert (= (and b!421048 res!245701) b!421052))

(assert (= (and b!421052 res!245709) b!421054))

(assert (= (and b!421054 res!245708) b!421046))

(assert (= (and b!421046 res!245699) b!421044))

(assert (= (and b!421044 res!245710) b!421047))

(assert (= (and b!421047 res!245703) b!421043))

(assert (= (and b!421043 res!245712) b!421040))

(assert (= (and b!421040 res!245704) b!421050))

(assert (= (and b!421050 res!245705) b!421056))

(assert (= (and b!421056 c!55299) b!421045))

(assert (= (and b!421056 (not c!55299)) b!421053))

(assert (= (or b!421045 b!421053) bm!29379))

(assert (= (or b!421045 b!421053) bm!29380))

(assert (= (and b!421056 (not res!245711)) b!421042))

(assert (= (and b!421041 condMapEmpty!17958) mapIsEmpty!17958))

(assert (= (and b!421041 (not condMapEmpty!17958)) mapNonEmpty!17958))

(get-info :version)

(assert (= (and mapNonEmpty!17958 ((_ is ValueCellFull!5102) mapValue!17958)) b!421049))

(assert (= (and b!421041 ((_ is ValueCellFull!5102) mapDefault!17958)) b!421039))

(assert (= start!39458 b!421041))

(declare-fun b_lambda!9065 () Bool)

(assert (=> (not b_lambda!9065) (not b!421042)))

(declare-fun t!12481 () Bool)

(declare-fun tb!3353 () Bool)

(assert (=> (and start!39458 (= defaultEntry!557 defaultEntry!557) t!12481) tb!3353))

(declare-fun result!6241 () Bool)

(assert (=> tb!3353 (= result!6241 tp_is_empty!10891)))

(assert (=> b!421042 t!12481))

(declare-fun b_and!17369 () Bool)

(assert (= b_and!17367 (and (=> t!12481 result!6241) b_and!17369)))

(declare-fun m!411007 () Bool)

(assert (=> bm!29379 m!411007))

(declare-fun m!411009 () Bool)

(assert (=> mapNonEmpty!17958 m!411009))

(declare-fun m!411011 () Bool)

(assert (=> start!39458 m!411011))

(declare-fun m!411013 () Bool)

(assert (=> start!39458 m!411013))

(declare-fun m!411015 () Bool)

(assert (=> b!421056 m!411015))

(assert (=> b!421056 m!411015))

(declare-fun m!411017 () Bool)

(assert (=> b!421056 m!411017))

(declare-fun m!411019 () Bool)

(assert (=> b!421056 m!411019))

(declare-fun m!411021 () Bool)

(assert (=> b!421046 m!411021))

(declare-fun m!411023 () Bool)

(assert (=> b!421050 m!411023))

(declare-fun m!411025 () Bool)

(assert (=> b!421050 m!411025))

(declare-fun m!411027 () Bool)

(assert (=> b!421050 m!411027))

(declare-fun m!411029 () Bool)

(assert (=> b!421054 m!411029))

(declare-fun m!411031 () Bool)

(assert (=> b!421044 m!411031))

(declare-fun m!411033 () Bool)

(assert (=> b!421043 m!411033))

(declare-fun m!411035 () Bool)

(assert (=> b!421042 m!411035))

(declare-fun m!411037 () Bool)

(assert (=> b!421042 m!411037))

(declare-fun m!411039 () Bool)

(assert (=> b!421042 m!411039))

(declare-fun m!411041 () Bool)

(assert (=> b!421042 m!411041))

(assert (=> b!421042 m!411025))

(declare-fun m!411043 () Bool)

(assert (=> b!421042 m!411043))

(declare-fun m!411045 () Bool)

(assert (=> b!421042 m!411045))

(declare-fun m!411047 () Bool)

(assert (=> b!421042 m!411047))

(declare-fun m!411049 () Bool)

(assert (=> b!421042 m!411049))

(assert (=> b!421042 m!411035))

(assert (=> b!421042 m!411049))

(declare-fun m!411051 () Bool)

(assert (=> b!421042 m!411051))

(declare-fun m!411053 () Bool)

(assert (=> b!421042 m!411053))

(declare-fun m!411055 () Bool)

(assert (=> b!421042 m!411055))

(assert (=> b!421042 m!411045))

(declare-fun m!411057 () Bool)

(assert (=> b!421042 m!411057))

(declare-fun m!411059 () Bool)

(assert (=> b!421047 m!411059))

(declare-fun m!411061 () Bool)

(assert (=> b!421047 m!411061))

(declare-fun m!411063 () Bool)

(assert (=> bm!29380 m!411063))

(declare-fun m!411065 () Bool)

(assert (=> b!421057 m!411065))

(declare-fun m!411067 () Bool)

(assert (=> b!421045 m!411067))

(declare-fun m!411069 () Bool)

(assert (=> b!421048 m!411069))

(declare-fun m!411071 () Bool)

(assert (=> b!421055 m!411071))

(check-sat (not b!421057) (not b!421042) b_and!17369 (not start!39458) (not b_lambda!9065) (not b!421047) (not b!421050) (not bm!29379) (not bm!29380) (not b_next!9739) (not b!421043) (not b!421054) (not b!421044) (not b!421048) (not b!421055) (not mapNonEmpty!17958) (not b!421045) (not b!421056) tp_is_empty!10891)
(check-sat b_and!17369 (not b_next!9739))
