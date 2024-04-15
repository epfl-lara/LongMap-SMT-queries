; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70722 () Bool)

(assert start!70722)

(declare-fun b_free!13015 () Bool)

(declare-fun b_next!13015 () Bool)

(assert (=> start!70722 (= b_free!13015 (not b_next!13015))))

(declare-fun tp!45787 () Bool)

(declare-fun b_and!21851 () Bool)

(assert (=> start!70722 (= tp!45787 b_and!21851)))

(declare-fun res!560416 () Bool)

(declare-fun e!456570 () Bool)

(assert (=> start!70722 (=> (not res!560416) (not e!456570))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70722 (= res!560416 (validMask!0 mask!1312))))

(assert (=> start!70722 e!456570))

(declare-fun tp_is_empty!14725 () Bool)

(assert (=> start!70722 tp_is_empty!14725))

(declare-datatypes ((array!45613 0))(
  ( (array!45614 (arr!21858 (Array (_ BitVec 32) (_ BitVec 64))) (size!22279 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45613)

(declare-fun array_inv!17533 (array!45613) Bool)

(assert (=> start!70722 (array_inv!17533 _keys!976)))

(assert (=> start!70722 true))

(declare-datatypes ((V!24635 0))(
  ( (V!24636 (val!7410 Int)) )
))
(declare-datatypes ((ValueCell!6947 0))(
  ( (ValueCellFull!6947 (v!9835 V!24635)) (EmptyCell!6947) )
))
(declare-datatypes ((array!45615 0))(
  ( (array!45616 (arr!21859 (Array (_ BitVec 32) ValueCell!6947)) (size!22280 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45615)

(declare-fun e!456571 () Bool)

(declare-fun array_inv!17534 (array!45615) Bool)

(assert (=> start!70722 (and (array_inv!17534 _values!788) e!456571)))

(assert (=> start!70722 tp!45787))

(declare-fun mapNonEmpty!23695 () Bool)

(declare-fun mapRes!23695 () Bool)

(declare-fun tp!45786 () Bool)

(declare-fun e!456572 () Bool)

(assert (=> mapNonEmpty!23695 (= mapRes!23695 (and tp!45786 e!456572))))

(declare-fun mapKey!23695 () (_ BitVec 32))

(declare-fun mapRest!23695 () (Array (_ BitVec 32) ValueCell!6947))

(declare-fun mapValue!23695 () ValueCell!6947)

(assert (=> mapNonEmpty!23695 (= (arr!21859 _values!788) (store mapRest!23695 mapKey!23695 mapValue!23695))))

(declare-fun b!821451 () Bool)

(declare-fun e!456568 () Bool)

(assert (=> b!821451 (= e!456568 tp_is_empty!14725)))

(declare-fun mapIsEmpty!23695 () Bool)

(assert (=> mapIsEmpty!23695 mapRes!23695))

(declare-fun b!821452 () Bool)

(declare-fun e!456569 () Bool)

(assert (=> b!821452 (= e!456570 (not e!456569))))

(declare-fun res!560412 () Bool)

(assert (=> b!821452 (=> res!560412 e!456569)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821452 (= res!560412 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9788 0))(
  ( (tuple2!9789 (_1!4905 (_ BitVec 64)) (_2!4905 V!24635)) )
))
(declare-datatypes ((List!15599 0))(
  ( (Nil!15596) (Cons!15595 (h!16724 tuple2!9788) (t!21925 List!15599)) )
))
(declare-datatypes ((ListLongMap!8601 0))(
  ( (ListLongMap!8602 (toList!4316 List!15599)) )
))
(declare-fun lt!369107 () ListLongMap!8601)

(declare-fun lt!369109 () ListLongMap!8601)

(assert (=> b!821452 (= lt!369107 lt!369109)))

(declare-fun zeroValueBefore!34 () V!24635)

(declare-fun zeroValueAfter!34 () V!24635)

(declare-fun minValue!754 () V!24635)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28053 0))(
  ( (Unit!28054) )
))
(declare-fun lt!369110 () Unit!28053)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!457 (array!45613 array!45615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24635 V!24635 V!24635 V!24635 (_ BitVec 32) Int) Unit!28053)

(assert (=> b!821452 (= lt!369110 (lemmaNoChangeToArrayThenSameMapNoExtras!457 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2364 (array!45613 array!45615 (_ BitVec 32) (_ BitVec 32) V!24635 V!24635 (_ BitVec 32) Int) ListLongMap!8601)

(assert (=> b!821452 (= lt!369109 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821452 (= lt!369107 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821453 () Bool)

(declare-fun res!560413 () Bool)

(assert (=> b!821453 (=> (not res!560413) (not e!456570))))

(declare-datatypes ((List!15600 0))(
  ( (Nil!15597) (Cons!15596 (h!16725 (_ BitVec 64)) (t!21926 List!15600)) )
))
(declare-fun arrayNoDuplicates!0 (array!45613 (_ BitVec 32) List!15600) Bool)

(assert (=> b!821453 (= res!560413 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15597))))

(declare-fun b!821454 () Bool)

(declare-fun res!560414 () Bool)

(assert (=> b!821454 (=> (not res!560414) (not e!456570))))

(assert (=> b!821454 (= res!560414 (and (= (size!22280 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22279 _keys!976) (size!22280 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821455 () Bool)

(assert (=> b!821455 (= e!456569 (bvsle #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun lt!369108 () ListLongMap!8601)

(declare-fun getCurrentListMap!2442 (array!45613 array!45615 (_ BitVec 32) (_ BitVec 32) V!24635 V!24635 (_ BitVec 32) Int) ListLongMap!8601)

(assert (=> b!821455 (= lt!369108 (getCurrentListMap!2442 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821456 () Bool)

(assert (=> b!821456 (= e!456572 tp_is_empty!14725)))

(declare-fun b!821457 () Bool)

(declare-fun res!560415 () Bool)

(assert (=> b!821457 (=> (not res!560415) (not e!456570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45613 (_ BitVec 32)) Bool)

(assert (=> b!821457 (= res!560415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821458 () Bool)

(assert (=> b!821458 (= e!456571 (and e!456568 mapRes!23695))))

(declare-fun condMapEmpty!23695 () Bool)

(declare-fun mapDefault!23695 () ValueCell!6947)

(assert (=> b!821458 (= condMapEmpty!23695 (= (arr!21859 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6947)) mapDefault!23695)))))

(assert (= (and start!70722 res!560416) b!821454))

(assert (= (and b!821454 res!560414) b!821457))

(assert (= (and b!821457 res!560415) b!821453))

(assert (= (and b!821453 res!560413) b!821452))

(assert (= (and b!821452 (not res!560412)) b!821455))

(assert (= (and b!821458 condMapEmpty!23695) mapIsEmpty!23695))

(assert (= (and b!821458 (not condMapEmpty!23695)) mapNonEmpty!23695))

(get-info :version)

(assert (= (and mapNonEmpty!23695 ((_ is ValueCellFull!6947) mapValue!23695)) b!821456))

(assert (= (and b!821458 ((_ is ValueCellFull!6947) mapDefault!23695)) b!821451))

(assert (= start!70722 b!821458))

(declare-fun m!762697 () Bool)

(assert (=> b!821457 m!762697))

(declare-fun m!762699 () Bool)

(assert (=> b!821455 m!762699))

(declare-fun m!762701 () Bool)

(assert (=> start!70722 m!762701))

(declare-fun m!762703 () Bool)

(assert (=> start!70722 m!762703))

(declare-fun m!762705 () Bool)

(assert (=> start!70722 m!762705))

(declare-fun m!762707 () Bool)

(assert (=> b!821453 m!762707))

(declare-fun m!762709 () Bool)

(assert (=> mapNonEmpty!23695 m!762709))

(declare-fun m!762711 () Bool)

(assert (=> b!821452 m!762711))

(declare-fun m!762713 () Bool)

(assert (=> b!821452 m!762713))

(declare-fun m!762715 () Bool)

(assert (=> b!821452 m!762715))

(check-sat (not b_next!13015) b_and!21851 (not start!70722) (not b!821452) tp_is_empty!14725 (not b!821455) (not b!821457) (not mapNonEmpty!23695) (not b!821453))
(check-sat b_and!21851 (not b_next!13015))
(get-model)

(declare-fun bm!35708 () Bool)

(declare-fun call!35713 () Bool)

(declare-fun lt!369190 () ListLongMap!8601)

(declare-fun contains!4146 (ListLongMap!8601 (_ BitVec 64)) Bool)

(assert (=> bm!35708 (= call!35713 (contains!4146 lt!369190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!821549 () Bool)

(declare-fun res!560466 () Bool)

(declare-fun e!456638 () Bool)

(assert (=> b!821549 (=> (not res!560466) (not e!456638))))

(declare-fun e!456642 () Bool)

(assert (=> b!821549 (= res!560466 e!456642)))

(declare-fun c!89184 () Bool)

(assert (=> b!821549 (= c!89184 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!104595 () Bool)

(assert (=> d!104595 e!456638))

(declare-fun res!560467 () Bool)

(assert (=> d!104595 (=> (not res!560467) (not e!456638))))

(assert (=> d!104595 (= res!560467 (or (bvsge #b00000000000000000000000000000000 (size!22279 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))))

(declare-fun lt!369198 () ListLongMap!8601)

(assert (=> d!104595 (= lt!369190 lt!369198)))

(declare-fun lt!369182 () Unit!28053)

(declare-fun e!456647 () Unit!28053)

(assert (=> d!104595 (= lt!369182 e!456647)))

(declare-fun c!89183 () Bool)

(declare-fun e!456645 () Bool)

(assert (=> d!104595 (= c!89183 e!456645)))

(declare-fun res!560465 () Bool)

(assert (=> d!104595 (=> (not res!560465) (not e!456645))))

(assert (=> d!104595 (= res!560465 (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun e!456637 () ListLongMap!8601)

(assert (=> d!104595 (= lt!369198 e!456637)))

(declare-fun c!89182 () Bool)

(assert (=> d!104595 (= c!89182 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104595 (validMask!0 mask!1312)))

(assert (=> d!104595 (= (getCurrentListMap!2442 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369190)))

(declare-fun b!821550 () Bool)

(assert (=> b!821550 (= e!456642 (not call!35713))))

(declare-fun b!821551 () Bool)

(declare-fun c!89180 () Bool)

(assert (=> b!821551 (= c!89180 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!456641 () ListLongMap!8601)

(declare-fun e!456640 () ListLongMap!8601)

(assert (=> b!821551 (= e!456641 e!456640)))

(declare-fun e!456639 () Bool)

(declare-fun b!821552 () Bool)

(declare-fun apply!357 (ListLongMap!8601 (_ BitVec 64)) V!24635)

(declare-fun get!11648 (ValueCell!6947 V!24635) V!24635)

(declare-fun dynLambda!971 (Int (_ BitVec 64)) V!24635)

(assert (=> b!821552 (= e!456639 (= (apply!357 lt!369190 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)) (get!11648 (select (arr!21859 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!821552 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22280 _values!788)))))

(assert (=> b!821552 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun b!821553 () Bool)

(declare-fun call!35714 () ListLongMap!8601)

(assert (=> b!821553 (= e!456640 call!35714)))

(declare-fun b!821554 () Bool)

(declare-fun e!456643 () Bool)

(assert (=> b!821554 (= e!456638 e!456643)))

(declare-fun c!89181 () Bool)

(assert (=> b!821554 (= c!89181 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35709 () Bool)

(declare-fun call!35715 () Bool)

(assert (=> bm!35709 (= call!35715 (contains!4146 lt!369190 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!821555 () Bool)

(declare-fun res!560468 () Bool)

(assert (=> b!821555 (=> (not res!560468) (not e!456638))))

(declare-fun e!456644 () Bool)

(assert (=> b!821555 (= res!560468 e!456644)))

(declare-fun res!560469 () Bool)

(assert (=> b!821555 (=> res!560469 e!456644)))

(declare-fun e!456636 () Bool)

(assert (=> b!821555 (= res!560469 (not e!456636))))

(declare-fun res!560471 () Bool)

(assert (=> b!821555 (=> (not res!560471) (not e!456636))))

(assert (=> b!821555 (= res!560471 (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun call!35716 () ListLongMap!8601)

(declare-fun c!89179 () Bool)

(declare-fun call!35712 () ListLongMap!8601)

(declare-fun call!35717 () ListLongMap!8601)

(declare-fun call!35711 () ListLongMap!8601)

(declare-fun bm!35710 () Bool)

(declare-fun +!1900 (ListLongMap!8601 tuple2!9788) ListLongMap!8601)

(assert (=> bm!35710 (= call!35716 (+!1900 (ite c!89182 call!35711 (ite c!89179 call!35712 call!35717)) (ite (or c!89182 c!89179) (tuple2!9789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!35711 () Bool)

(assert (=> bm!35711 (= call!35712 call!35711)))

(declare-fun b!821556 () Bool)

(assert (=> b!821556 (= e!456640 call!35717)))

(declare-fun b!821557 () Bool)

(assert (=> b!821557 (= e!456637 e!456641)))

(assert (=> b!821557 (= c!89179 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!821558 () Bool)

(assert (=> b!821558 (= e!456637 (+!1900 call!35716 (tuple2!9789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!821559 () Bool)

(declare-fun lt!369192 () Unit!28053)

(assert (=> b!821559 (= e!456647 lt!369192)))

(declare-fun lt!369186 () ListLongMap!8601)

(assert (=> b!821559 (= lt!369186 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369196 () (_ BitVec 64))

(assert (=> b!821559 (= lt!369196 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369183 () (_ BitVec 64))

(assert (=> b!821559 (= lt!369183 (select (arr!21858 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369185 () Unit!28053)

(declare-fun addStillContains!310 (ListLongMap!8601 (_ BitVec 64) V!24635 (_ BitVec 64)) Unit!28053)

(assert (=> b!821559 (= lt!369185 (addStillContains!310 lt!369186 lt!369196 zeroValueBefore!34 lt!369183))))

(assert (=> b!821559 (contains!4146 (+!1900 lt!369186 (tuple2!9789 lt!369196 zeroValueBefore!34)) lt!369183)))

(declare-fun lt!369184 () Unit!28053)

(assert (=> b!821559 (= lt!369184 lt!369185)))

(declare-fun lt!369195 () ListLongMap!8601)

(assert (=> b!821559 (= lt!369195 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369179 () (_ BitVec 64))

(assert (=> b!821559 (= lt!369179 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369197 () (_ BitVec 64))

(assert (=> b!821559 (= lt!369197 (select (arr!21858 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369199 () Unit!28053)

(declare-fun addApplyDifferent!310 (ListLongMap!8601 (_ BitVec 64) V!24635 (_ BitVec 64)) Unit!28053)

(assert (=> b!821559 (= lt!369199 (addApplyDifferent!310 lt!369195 lt!369179 minValue!754 lt!369197))))

(assert (=> b!821559 (= (apply!357 (+!1900 lt!369195 (tuple2!9789 lt!369179 minValue!754)) lt!369197) (apply!357 lt!369195 lt!369197))))

(declare-fun lt!369193 () Unit!28053)

(assert (=> b!821559 (= lt!369193 lt!369199)))

(declare-fun lt!369191 () ListLongMap!8601)

(assert (=> b!821559 (= lt!369191 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369187 () (_ BitVec 64))

(assert (=> b!821559 (= lt!369187 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369188 () (_ BitVec 64))

(assert (=> b!821559 (= lt!369188 (select (arr!21858 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369180 () Unit!28053)

(assert (=> b!821559 (= lt!369180 (addApplyDifferent!310 lt!369191 lt!369187 zeroValueBefore!34 lt!369188))))

(assert (=> b!821559 (= (apply!357 (+!1900 lt!369191 (tuple2!9789 lt!369187 zeroValueBefore!34)) lt!369188) (apply!357 lt!369191 lt!369188))))

(declare-fun lt!369181 () Unit!28053)

(assert (=> b!821559 (= lt!369181 lt!369180)))

(declare-fun lt!369194 () ListLongMap!8601)

(assert (=> b!821559 (= lt!369194 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369200 () (_ BitVec 64))

(assert (=> b!821559 (= lt!369200 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369189 () (_ BitVec 64))

(assert (=> b!821559 (= lt!369189 (select (arr!21858 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821559 (= lt!369192 (addApplyDifferent!310 lt!369194 lt!369200 minValue!754 lt!369189))))

(assert (=> b!821559 (= (apply!357 (+!1900 lt!369194 (tuple2!9789 lt!369200 minValue!754)) lt!369189) (apply!357 lt!369194 lt!369189))))

(declare-fun b!821560 () Bool)

(declare-fun Unit!28055 () Unit!28053)

(assert (=> b!821560 (= e!456647 Unit!28055)))

(declare-fun bm!35712 () Bool)

(assert (=> bm!35712 (= call!35717 call!35712)))

(declare-fun b!821561 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!821561 (= e!456645 (validKeyInArray!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821562 () Bool)

(declare-fun e!456635 () Bool)

(assert (=> b!821562 (= e!456642 e!456635)))

(declare-fun res!560472 () Bool)

(assert (=> b!821562 (= res!560472 call!35713)))

(assert (=> b!821562 (=> (not res!560472) (not e!456635))))

(declare-fun bm!35713 () Bool)

(assert (=> bm!35713 (= call!35714 call!35716)))

(declare-fun b!821563 () Bool)

(declare-fun e!456646 () Bool)

(assert (=> b!821563 (= e!456646 (= (apply!357 lt!369190 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!821564 () Bool)

(assert (=> b!821564 (= e!456636 (validKeyInArray!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821565 () Bool)

(assert (=> b!821565 (= e!456644 e!456639)))

(declare-fun res!560470 () Bool)

(assert (=> b!821565 (=> (not res!560470) (not e!456639))))

(assert (=> b!821565 (= res!560470 (contains!4146 lt!369190 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun b!821566 () Bool)

(assert (=> b!821566 (= e!456643 e!456646)))

(declare-fun res!560473 () Bool)

(assert (=> b!821566 (= res!560473 call!35715)))

(assert (=> b!821566 (=> (not res!560473) (not e!456646))))

(declare-fun b!821567 () Bool)

(assert (=> b!821567 (= e!456641 call!35714)))

(declare-fun b!821568 () Bool)

(assert (=> b!821568 (= e!456643 (not call!35715))))

(declare-fun b!821569 () Bool)

(assert (=> b!821569 (= e!456635 (= (apply!357 lt!369190 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!35714 () Bool)

(assert (=> bm!35714 (= call!35711 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and d!104595 c!89182) b!821558))

(assert (= (and d!104595 (not c!89182)) b!821557))

(assert (= (and b!821557 c!89179) b!821567))

(assert (= (and b!821557 (not c!89179)) b!821551))

(assert (= (and b!821551 c!89180) b!821553))

(assert (= (and b!821551 (not c!89180)) b!821556))

(assert (= (or b!821553 b!821556) bm!35712))

(assert (= (or b!821567 bm!35712) bm!35711))

(assert (= (or b!821567 b!821553) bm!35713))

(assert (= (or b!821558 bm!35711) bm!35714))

(assert (= (or b!821558 bm!35713) bm!35710))

(assert (= (and d!104595 res!560465) b!821561))

(assert (= (and d!104595 c!89183) b!821559))

(assert (= (and d!104595 (not c!89183)) b!821560))

(assert (= (and d!104595 res!560467) b!821555))

(assert (= (and b!821555 res!560471) b!821564))

(assert (= (and b!821555 (not res!560469)) b!821565))

(assert (= (and b!821565 res!560470) b!821552))

(assert (= (and b!821555 res!560468) b!821549))

(assert (= (and b!821549 c!89184) b!821562))

(assert (= (and b!821549 (not c!89184)) b!821550))

(assert (= (and b!821562 res!560472) b!821569))

(assert (= (or b!821562 b!821550) bm!35708))

(assert (= (and b!821549 res!560466) b!821554))

(assert (= (and b!821554 c!89181) b!821566))

(assert (= (and b!821554 (not c!89181)) b!821568))

(assert (= (and b!821566 res!560473) b!821563))

(assert (= (or b!821566 b!821568) bm!35709))

(declare-fun b_lambda!10993 () Bool)

(assert (=> (not b_lambda!10993) (not b!821552)))

(declare-fun t!21929 () Bool)

(declare-fun tb!4187 () Bool)

(assert (=> (and start!70722 (= defaultEntry!796 defaultEntry!796) t!21929) tb!4187))

(declare-fun result!7917 () Bool)

(assert (=> tb!4187 (= result!7917 tp_is_empty!14725)))

(assert (=> b!821552 t!21929))

(declare-fun b_and!21857 () Bool)

(assert (= b_and!21851 (and (=> t!21929 result!7917) b_and!21857)))

(declare-fun m!762757 () Bool)

(assert (=> bm!35710 m!762757))

(declare-fun m!762759 () Bool)

(assert (=> b!821558 m!762759))

(assert (=> bm!35714 m!762715))

(declare-fun m!762761 () Bool)

(assert (=> b!821565 m!762761))

(assert (=> b!821565 m!762761))

(declare-fun m!762763 () Bool)

(assert (=> b!821565 m!762763))

(declare-fun m!762765 () Bool)

(assert (=> b!821559 m!762765))

(declare-fun m!762767 () Bool)

(assert (=> b!821559 m!762767))

(declare-fun m!762769 () Bool)

(assert (=> b!821559 m!762769))

(declare-fun m!762771 () Bool)

(assert (=> b!821559 m!762771))

(declare-fun m!762773 () Bool)

(assert (=> b!821559 m!762773))

(declare-fun m!762775 () Bool)

(assert (=> b!821559 m!762775))

(declare-fun m!762777 () Bool)

(assert (=> b!821559 m!762777))

(declare-fun m!762779 () Bool)

(assert (=> b!821559 m!762779))

(declare-fun m!762781 () Bool)

(assert (=> b!821559 m!762781))

(assert (=> b!821559 m!762715))

(assert (=> b!821559 m!762761))

(declare-fun m!762783 () Bool)

(assert (=> b!821559 m!762783))

(declare-fun m!762785 () Bool)

(assert (=> b!821559 m!762785))

(declare-fun m!762787 () Bool)

(assert (=> b!821559 m!762787))

(assert (=> b!821559 m!762773))

(assert (=> b!821559 m!762783))

(assert (=> b!821559 m!762777))

(declare-fun m!762789 () Bool)

(assert (=> b!821559 m!762789))

(declare-fun m!762791 () Bool)

(assert (=> b!821559 m!762791))

(assert (=> b!821559 m!762769))

(declare-fun m!762793 () Bool)

(assert (=> b!821559 m!762793))

(assert (=> b!821561 m!762761))

(assert (=> b!821561 m!762761))

(declare-fun m!762795 () Bool)

(assert (=> b!821561 m!762795))

(declare-fun m!762797 () Bool)

(assert (=> b!821569 m!762797))

(declare-fun m!762799 () Bool)

(assert (=> bm!35708 m!762799))

(assert (=> b!821564 m!762761))

(assert (=> b!821564 m!762761))

(assert (=> b!821564 m!762795))

(declare-fun m!762801 () Bool)

(assert (=> bm!35709 m!762801))

(declare-fun m!762803 () Bool)

(assert (=> b!821563 m!762803))

(assert (=> b!821552 m!762761))

(declare-fun m!762805 () Bool)

(assert (=> b!821552 m!762805))

(declare-fun m!762807 () Bool)

(assert (=> b!821552 m!762807))

(assert (=> b!821552 m!762761))

(declare-fun m!762809 () Bool)

(assert (=> b!821552 m!762809))

(assert (=> b!821552 m!762809))

(assert (=> b!821552 m!762807))

(declare-fun m!762811 () Bool)

(assert (=> b!821552 m!762811))

(assert (=> d!104595 m!762701))

(assert (=> b!821455 d!104595))

(declare-fun b!821582 () Bool)

(declare-fun e!456658 () Bool)

(declare-fun e!456657 () Bool)

(assert (=> b!821582 (= e!456658 e!456657)))

(declare-fun c!89187 () Bool)

(assert (=> b!821582 (= c!89187 (validKeyInArray!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821583 () Bool)

(declare-fun call!35720 () Bool)

(assert (=> b!821583 (= e!456657 call!35720)))

(declare-fun b!821584 () Bool)

(declare-fun e!456656 () Bool)

(assert (=> b!821584 (= e!456656 e!456658)))

(declare-fun res!560481 () Bool)

(assert (=> b!821584 (=> (not res!560481) (not e!456658))))

(declare-fun e!456659 () Bool)

(assert (=> b!821584 (= res!560481 (not e!456659))))

(declare-fun res!560480 () Bool)

(assert (=> b!821584 (=> (not res!560480) (not e!456659))))

(assert (=> b!821584 (= res!560480 (validKeyInArray!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821585 () Bool)

(declare-fun contains!4147 (List!15600 (_ BitVec 64)) Bool)

(assert (=> b!821585 (= e!456659 (contains!4147 Nil!15597 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35717 () Bool)

(assert (=> bm!35717 (= call!35720 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89187 (Cons!15596 (select (arr!21858 _keys!976) #b00000000000000000000000000000000) Nil!15597) Nil!15597)))))

(declare-fun b!821586 () Bool)

(assert (=> b!821586 (= e!456657 call!35720)))

(declare-fun d!104597 () Bool)

(declare-fun res!560482 () Bool)

(assert (=> d!104597 (=> res!560482 e!456656)))

(assert (=> d!104597 (= res!560482 (bvsge #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(assert (=> d!104597 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15597) e!456656)))

(assert (= (and d!104597 (not res!560482)) b!821584))

(assert (= (and b!821584 res!560480) b!821585))

(assert (= (and b!821584 res!560481) b!821582))

(assert (= (and b!821582 c!89187) b!821586))

(assert (= (and b!821582 (not c!89187)) b!821583))

(assert (= (or b!821586 b!821583) bm!35717))

(assert (=> b!821582 m!762761))

(assert (=> b!821582 m!762761))

(assert (=> b!821582 m!762795))

(assert (=> b!821584 m!762761))

(assert (=> b!821584 m!762761))

(assert (=> b!821584 m!762795))

(assert (=> b!821585 m!762761))

(assert (=> b!821585 m!762761))

(declare-fun m!762813 () Bool)

(assert (=> b!821585 m!762813))

(assert (=> bm!35717 m!762761))

(declare-fun m!762815 () Bool)

(assert (=> bm!35717 m!762815))

(assert (=> b!821453 d!104597))

(declare-fun d!104599 () Bool)

(assert (=> d!104599 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70722 d!104599))

(declare-fun d!104601 () Bool)

(assert (=> d!104601 (= (array_inv!17533 _keys!976) (bvsge (size!22279 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70722 d!104601))

(declare-fun d!104603 () Bool)

(assert (=> d!104603 (= (array_inv!17534 _values!788) (bvsge (size!22280 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70722 d!104603))

(declare-fun bm!35720 () Bool)

(declare-fun call!35723 () Bool)

(assert (=> bm!35720 (= call!35723 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!821596 () Bool)

(declare-fun e!456667 () Bool)

(declare-fun e!456668 () Bool)

(assert (=> b!821596 (= e!456667 e!456668)))

(declare-fun lt!369209 () (_ BitVec 64))

(assert (=> b!821596 (= lt!369209 (select (arr!21858 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369207 () Unit!28053)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45613 (_ BitVec 64) (_ BitVec 32)) Unit!28053)

(assert (=> b!821596 (= lt!369207 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!369209 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!821596 (arrayContainsKey!0 _keys!976 lt!369209 #b00000000000000000000000000000000)))

(declare-fun lt!369208 () Unit!28053)

(assert (=> b!821596 (= lt!369208 lt!369207)))

(declare-fun res!560487 () Bool)

(declare-datatypes ((SeekEntryResult!8725 0))(
  ( (MissingZero!8725 (index!37271 (_ BitVec 32))) (Found!8725 (index!37272 (_ BitVec 32))) (Intermediate!8725 (undefined!9537 Bool) (index!37273 (_ BitVec 32)) (x!69280 (_ BitVec 32))) (Undefined!8725) (MissingVacant!8725 (index!37274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45613 (_ BitVec 32)) SeekEntryResult!8725)

(assert (=> b!821596 (= res!560487 (= (seekEntryOrOpen!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8725 #b00000000000000000000000000000000)))))

(assert (=> b!821596 (=> (not res!560487) (not e!456668))))

(declare-fun b!821597 () Bool)

(declare-fun e!456666 () Bool)

(assert (=> b!821597 (= e!456666 e!456667)))

(declare-fun c!89190 () Bool)

(assert (=> b!821597 (= c!89190 (validKeyInArray!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821598 () Bool)

(assert (=> b!821598 (= e!456668 call!35723)))

(declare-fun b!821595 () Bool)

(assert (=> b!821595 (= e!456667 call!35723)))

(declare-fun d!104605 () Bool)

(declare-fun res!560488 () Bool)

(assert (=> d!104605 (=> res!560488 e!456666)))

(assert (=> d!104605 (= res!560488 (bvsge #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(assert (=> d!104605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!456666)))

(assert (= (and d!104605 (not res!560488)) b!821597))

(assert (= (and b!821597 c!89190) b!821596))

(assert (= (and b!821597 (not c!89190)) b!821595))

(assert (= (and b!821596 res!560487) b!821598))

(assert (= (or b!821598 b!821595) bm!35720))

(declare-fun m!762817 () Bool)

(assert (=> bm!35720 m!762817))

(assert (=> b!821596 m!762761))

(declare-fun m!762819 () Bool)

(assert (=> b!821596 m!762819))

(declare-fun m!762821 () Bool)

(assert (=> b!821596 m!762821))

(assert (=> b!821596 m!762761))

(declare-fun m!762823 () Bool)

(assert (=> b!821596 m!762823))

(assert (=> b!821597 m!762761))

(assert (=> b!821597 m!762761))

(assert (=> b!821597 m!762795))

(assert (=> b!821457 d!104605))

(declare-fun d!104607 () Bool)

(assert (=> d!104607 (= (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369212 () Unit!28053)

(declare-fun choose!1407 (array!45613 array!45615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24635 V!24635 V!24635 V!24635 (_ BitVec 32) Int) Unit!28053)

(assert (=> d!104607 (= lt!369212 (choose!1407 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104607 (validMask!0 mask!1312)))

(assert (=> d!104607 (= (lemmaNoChangeToArrayThenSameMapNoExtras!457 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369212)))

(declare-fun bs!22894 () Bool)

(assert (= bs!22894 d!104607))

(assert (=> bs!22894 m!762715))

(assert (=> bs!22894 m!762713))

(declare-fun m!762825 () Bool)

(assert (=> bs!22894 m!762825))

(assert (=> bs!22894 m!762701))

(assert (=> b!821452 d!104607))

(declare-fun lt!369233 () ListLongMap!8601)

(declare-fun e!456684 () Bool)

(declare-fun b!821623 () Bool)

(assert (=> b!821623 (= e!456684 (= lt!369233 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!821624 () Bool)

(declare-fun e!456687 () Bool)

(declare-fun e!456686 () Bool)

(assert (=> b!821624 (= e!456687 e!456686)))

(declare-fun c!89200 () Bool)

(declare-fun e!456685 () Bool)

(assert (=> b!821624 (= c!89200 e!456685)))

(declare-fun res!560499 () Bool)

(assert (=> b!821624 (=> (not res!560499) (not e!456685))))

(assert (=> b!821624 (= res!560499 (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun b!821625 () Bool)

(declare-fun res!560497 () Bool)

(assert (=> b!821625 (=> (not res!560497) (not e!456687))))

(assert (=> b!821625 (= res!560497 (not (contains!4146 lt!369233 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821626 () Bool)

(declare-fun isEmpty!644 (ListLongMap!8601) Bool)

(assert (=> b!821626 (= e!456684 (isEmpty!644 lt!369233))))

(declare-fun d!104609 () Bool)

(assert (=> d!104609 e!456687))

(declare-fun res!560500 () Bool)

(assert (=> d!104609 (=> (not res!560500) (not e!456687))))

(assert (=> d!104609 (= res!560500 (not (contains!4146 lt!369233 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!456689 () ListLongMap!8601)

(assert (=> d!104609 (= lt!369233 e!456689)))

(declare-fun c!89199 () Bool)

(assert (=> d!104609 (= c!89199 (bvsge #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(assert (=> d!104609 (validMask!0 mask!1312)))

(assert (=> d!104609 (= (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369233)))

(declare-fun b!821627 () Bool)

(assert (=> b!821627 (= e!456689 (ListLongMap!8602 Nil!15596))))

(declare-fun b!821628 () Bool)

(declare-fun e!456683 () ListLongMap!8601)

(declare-fun call!35726 () ListLongMap!8601)

(assert (=> b!821628 (= e!456683 call!35726)))

(declare-fun b!821629 () Bool)

(assert (=> b!821629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(assert (=> b!821629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22280 _values!788)))))

(declare-fun e!456688 () Bool)

(assert (=> b!821629 (= e!456688 (= (apply!357 lt!369233 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)) (get!11648 (select (arr!21859 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!821630 () Bool)

(assert (=> b!821630 (= e!456686 e!456684)))

(declare-fun c!89201 () Bool)

(assert (=> b!821630 (= c!89201 (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun b!821631 () Bool)

(assert (=> b!821631 (= e!456686 e!456688)))

(assert (=> b!821631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun res!560498 () Bool)

(assert (=> b!821631 (= res!560498 (contains!4146 lt!369233 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821631 (=> (not res!560498) (not e!456688))))

(declare-fun b!821632 () Bool)

(assert (=> b!821632 (= e!456685 (validKeyInArray!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821632 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821633 () Bool)

(declare-fun lt!369230 () Unit!28053)

(declare-fun lt!369229 () Unit!28053)

(assert (=> b!821633 (= lt!369230 lt!369229)))

(declare-fun lt!369232 () ListLongMap!8601)

(declare-fun lt!369227 () (_ BitVec 64))

(declare-fun lt!369228 () V!24635)

(declare-fun lt!369231 () (_ BitVec 64))

(assert (=> b!821633 (not (contains!4146 (+!1900 lt!369232 (tuple2!9789 lt!369231 lt!369228)) lt!369227))))

(declare-fun addStillNotContains!183 (ListLongMap!8601 (_ BitVec 64) V!24635 (_ BitVec 64)) Unit!28053)

(assert (=> b!821633 (= lt!369229 (addStillNotContains!183 lt!369232 lt!369231 lt!369228 lt!369227))))

(assert (=> b!821633 (= lt!369227 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821633 (= lt!369228 (get!11648 (select (arr!21859 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821633 (= lt!369231 (select (arr!21858 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821633 (= lt!369232 call!35726)))

(assert (=> b!821633 (= e!456683 (+!1900 call!35726 (tuple2!9789 (select (arr!21858 _keys!976) #b00000000000000000000000000000000) (get!11648 (select (arr!21859 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!35723 () Bool)

(assert (=> bm!35723 (= call!35726 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!821634 () Bool)

(assert (=> b!821634 (= e!456689 e!456683)))

(declare-fun c!89202 () Bool)

(assert (=> b!821634 (= c!89202 (validKeyInArray!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104609 c!89199) b!821627))

(assert (= (and d!104609 (not c!89199)) b!821634))

(assert (= (and b!821634 c!89202) b!821633))

(assert (= (and b!821634 (not c!89202)) b!821628))

(assert (= (or b!821633 b!821628) bm!35723))

(assert (= (and d!104609 res!560500) b!821625))

(assert (= (and b!821625 res!560497) b!821624))

(assert (= (and b!821624 res!560499) b!821632))

(assert (= (and b!821624 c!89200) b!821631))

(assert (= (and b!821624 (not c!89200)) b!821630))

(assert (= (and b!821631 res!560498) b!821629))

(assert (= (and b!821630 c!89201) b!821623))

(assert (= (and b!821630 (not c!89201)) b!821626))

(declare-fun b_lambda!10995 () Bool)

(assert (=> (not b_lambda!10995) (not b!821629)))

(assert (=> b!821629 t!21929))

(declare-fun b_and!21859 () Bool)

(assert (= b_and!21857 (and (=> t!21929 result!7917) b_and!21859)))

(declare-fun b_lambda!10997 () Bool)

(assert (=> (not b_lambda!10997) (not b!821633)))

(assert (=> b!821633 t!21929))

(declare-fun b_and!21861 () Bool)

(assert (= b_and!21859 (and (=> t!21929 result!7917) b_and!21861)))

(declare-fun m!762827 () Bool)

(assert (=> b!821633 m!762827))

(declare-fun m!762829 () Bool)

(assert (=> b!821633 m!762829))

(assert (=> b!821633 m!762809))

(assert (=> b!821633 m!762807))

(assert (=> b!821633 m!762811))

(assert (=> b!821633 m!762761))

(assert (=> b!821633 m!762809))

(declare-fun m!762831 () Bool)

(assert (=> b!821633 m!762831))

(declare-fun m!762833 () Bool)

(assert (=> b!821633 m!762833))

(assert (=> b!821633 m!762831))

(assert (=> b!821633 m!762807))

(assert (=> b!821631 m!762761))

(assert (=> b!821631 m!762761))

(declare-fun m!762835 () Bool)

(assert (=> b!821631 m!762835))

(declare-fun m!762837 () Bool)

(assert (=> d!104609 m!762837))

(assert (=> d!104609 m!762701))

(declare-fun m!762839 () Bool)

(assert (=> b!821623 m!762839))

(assert (=> b!821632 m!762761))

(assert (=> b!821632 m!762761))

(assert (=> b!821632 m!762795))

(assert (=> bm!35723 m!762839))

(assert (=> b!821634 m!762761))

(assert (=> b!821634 m!762761))

(assert (=> b!821634 m!762795))

(declare-fun m!762841 () Bool)

(assert (=> b!821626 m!762841))

(assert (=> b!821629 m!762809))

(assert (=> b!821629 m!762761))

(declare-fun m!762843 () Bool)

(assert (=> b!821629 m!762843))

(assert (=> b!821629 m!762809))

(assert (=> b!821629 m!762807))

(assert (=> b!821629 m!762811))

(assert (=> b!821629 m!762807))

(assert (=> b!821629 m!762761))

(declare-fun m!762845 () Bool)

(assert (=> b!821625 m!762845))

(assert (=> b!821452 d!104609))

(declare-fun b!821635 () Bool)

(declare-fun lt!369240 () ListLongMap!8601)

(declare-fun e!456691 () Bool)

(assert (=> b!821635 (= e!456691 (= lt!369240 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!821636 () Bool)

(declare-fun e!456694 () Bool)

(declare-fun e!456693 () Bool)

(assert (=> b!821636 (= e!456694 e!456693)))

(declare-fun c!89204 () Bool)

(declare-fun e!456692 () Bool)

(assert (=> b!821636 (= c!89204 e!456692)))

(declare-fun res!560503 () Bool)

(assert (=> b!821636 (=> (not res!560503) (not e!456692))))

(assert (=> b!821636 (= res!560503 (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun b!821637 () Bool)

(declare-fun res!560501 () Bool)

(assert (=> b!821637 (=> (not res!560501) (not e!456694))))

(assert (=> b!821637 (= res!560501 (not (contains!4146 lt!369240 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821638 () Bool)

(assert (=> b!821638 (= e!456691 (isEmpty!644 lt!369240))))

(declare-fun d!104611 () Bool)

(assert (=> d!104611 e!456694))

(declare-fun res!560504 () Bool)

(assert (=> d!104611 (=> (not res!560504) (not e!456694))))

(assert (=> d!104611 (= res!560504 (not (contains!4146 lt!369240 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!456696 () ListLongMap!8601)

(assert (=> d!104611 (= lt!369240 e!456696)))

(declare-fun c!89203 () Bool)

(assert (=> d!104611 (= c!89203 (bvsge #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(assert (=> d!104611 (validMask!0 mask!1312)))

(assert (=> d!104611 (= (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369240)))

(declare-fun b!821639 () Bool)

(assert (=> b!821639 (= e!456696 (ListLongMap!8602 Nil!15596))))

(declare-fun b!821640 () Bool)

(declare-fun e!456690 () ListLongMap!8601)

(declare-fun call!35727 () ListLongMap!8601)

(assert (=> b!821640 (= e!456690 call!35727)))

(declare-fun b!821641 () Bool)

(assert (=> b!821641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(assert (=> b!821641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22280 _values!788)))))

(declare-fun e!456695 () Bool)

(assert (=> b!821641 (= e!456695 (= (apply!357 lt!369240 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)) (get!11648 (select (arr!21859 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!821642 () Bool)

(assert (=> b!821642 (= e!456693 e!456691)))

(declare-fun c!89205 () Bool)

(assert (=> b!821642 (= c!89205 (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun b!821643 () Bool)

(assert (=> b!821643 (= e!456693 e!456695)))

(assert (=> b!821643 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22279 _keys!976)))))

(declare-fun res!560502 () Bool)

(assert (=> b!821643 (= res!560502 (contains!4146 lt!369240 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821643 (=> (not res!560502) (not e!456695))))

(declare-fun b!821644 () Bool)

(assert (=> b!821644 (= e!456692 (validKeyInArray!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821644 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821645 () Bool)

(declare-fun lt!369237 () Unit!28053)

(declare-fun lt!369236 () Unit!28053)

(assert (=> b!821645 (= lt!369237 lt!369236)))

(declare-fun lt!369238 () (_ BitVec 64))

(declare-fun lt!369235 () V!24635)

(declare-fun lt!369234 () (_ BitVec 64))

(declare-fun lt!369239 () ListLongMap!8601)

(assert (=> b!821645 (not (contains!4146 (+!1900 lt!369239 (tuple2!9789 lt!369238 lt!369235)) lt!369234))))

(assert (=> b!821645 (= lt!369236 (addStillNotContains!183 lt!369239 lt!369238 lt!369235 lt!369234))))

(assert (=> b!821645 (= lt!369234 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821645 (= lt!369235 (get!11648 (select (arr!21859 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821645 (= lt!369238 (select (arr!21858 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821645 (= lt!369239 call!35727)))

(assert (=> b!821645 (= e!456690 (+!1900 call!35727 (tuple2!9789 (select (arr!21858 _keys!976) #b00000000000000000000000000000000) (get!11648 (select (arr!21859 _values!788) #b00000000000000000000000000000000) (dynLambda!971 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!35724 () Bool)

(assert (=> bm!35724 (= call!35727 (getCurrentListMapNoExtraKeys!2364 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!821646 () Bool)

(assert (=> b!821646 (= e!456696 e!456690)))

(declare-fun c!89206 () Bool)

(assert (=> b!821646 (= c!89206 (validKeyInArray!0 (select (arr!21858 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104611 c!89203) b!821639))

(assert (= (and d!104611 (not c!89203)) b!821646))

(assert (= (and b!821646 c!89206) b!821645))

(assert (= (and b!821646 (not c!89206)) b!821640))

(assert (= (or b!821645 b!821640) bm!35724))

(assert (= (and d!104611 res!560504) b!821637))

(assert (= (and b!821637 res!560501) b!821636))

(assert (= (and b!821636 res!560503) b!821644))

(assert (= (and b!821636 c!89204) b!821643))

(assert (= (and b!821636 (not c!89204)) b!821642))

(assert (= (and b!821643 res!560502) b!821641))

(assert (= (and b!821642 c!89205) b!821635))

(assert (= (and b!821642 (not c!89205)) b!821638))

(declare-fun b_lambda!10999 () Bool)

(assert (=> (not b_lambda!10999) (not b!821641)))

(assert (=> b!821641 t!21929))

(declare-fun b_and!21863 () Bool)

(assert (= b_and!21861 (and (=> t!21929 result!7917) b_and!21863)))

(declare-fun b_lambda!11001 () Bool)

(assert (=> (not b_lambda!11001) (not b!821645)))

(assert (=> b!821645 t!21929))

(declare-fun b_and!21865 () Bool)

(assert (= b_and!21863 (and (=> t!21929 result!7917) b_and!21865)))

(declare-fun m!762847 () Bool)

(assert (=> b!821645 m!762847))

(declare-fun m!762849 () Bool)

(assert (=> b!821645 m!762849))

(assert (=> b!821645 m!762809))

(assert (=> b!821645 m!762807))

(assert (=> b!821645 m!762811))

(assert (=> b!821645 m!762761))

(assert (=> b!821645 m!762809))

(declare-fun m!762851 () Bool)

(assert (=> b!821645 m!762851))

(declare-fun m!762853 () Bool)

(assert (=> b!821645 m!762853))

(assert (=> b!821645 m!762851))

(assert (=> b!821645 m!762807))

(assert (=> b!821643 m!762761))

(assert (=> b!821643 m!762761))

(declare-fun m!762855 () Bool)

(assert (=> b!821643 m!762855))

(declare-fun m!762857 () Bool)

(assert (=> d!104611 m!762857))

(assert (=> d!104611 m!762701))

(declare-fun m!762859 () Bool)

(assert (=> b!821635 m!762859))

(assert (=> b!821644 m!762761))

(assert (=> b!821644 m!762761))

(assert (=> b!821644 m!762795))

(assert (=> bm!35724 m!762859))

(assert (=> b!821646 m!762761))

(assert (=> b!821646 m!762761))

(assert (=> b!821646 m!762795))

(declare-fun m!762861 () Bool)

(assert (=> b!821638 m!762861))

(assert (=> b!821641 m!762809))

(assert (=> b!821641 m!762761))

(declare-fun m!762863 () Bool)

(assert (=> b!821641 m!762863))

(assert (=> b!821641 m!762809))

(assert (=> b!821641 m!762807))

(assert (=> b!821641 m!762811))

(assert (=> b!821641 m!762807))

(assert (=> b!821641 m!762761))

(declare-fun m!762865 () Bool)

(assert (=> b!821637 m!762865))

(assert (=> b!821452 d!104611))

(declare-fun b!821653 () Bool)

(declare-fun e!456701 () Bool)

(assert (=> b!821653 (= e!456701 tp_is_empty!14725)))

(declare-fun b!821654 () Bool)

(declare-fun e!456702 () Bool)

(assert (=> b!821654 (= e!456702 tp_is_empty!14725)))

(declare-fun condMapEmpty!23704 () Bool)

(declare-fun mapDefault!23704 () ValueCell!6947)

(assert (=> mapNonEmpty!23695 (= condMapEmpty!23704 (= mapRest!23695 ((as const (Array (_ BitVec 32) ValueCell!6947)) mapDefault!23704)))))

(declare-fun mapRes!23704 () Bool)

(assert (=> mapNonEmpty!23695 (= tp!45786 (and e!456702 mapRes!23704))))

(declare-fun mapNonEmpty!23704 () Bool)

(declare-fun tp!45802 () Bool)

(assert (=> mapNonEmpty!23704 (= mapRes!23704 (and tp!45802 e!456701))))

(declare-fun mapKey!23704 () (_ BitVec 32))

(declare-fun mapValue!23704 () ValueCell!6947)

(declare-fun mapRest!23704 () (Array (_ BitVec 32) ValueCell!6947))

(assert (=> mapNonEmpty!23704 (= mapRest!23695 (store mapRest!23704 mapKey!23704 mapValue!23704))))

(declare-fun mapIsEmpty!23704 () Bool)

(assert (=> mapIsEmpty!23704 mapRes!23704))

(assert (= (and mapNonEmpty!23695 condMapEmpty!23704) mapIsEmpty!23704))

(assert (= (and mapNonEmpty!23695 (not condMapEmpty!23704)) mapNonEmpty!23704))

(assert (= (and mapNonEmpty!23704 ((_ is ValueCellFull!6947) mapValue!23704)) b!821653))

(assert (= (and mapNonEmpty!23695 ((_ is ValueCellFull!6947) mapDefault!23704)) b!821654))

(declare-fun m!762867 () Bool)

(assert (=> mapNonEmpty!23704 m!762867))

(declare-fun b_lambda!11003 () Bool)

(assert (= b_lambda!10995 (or (and start!70722 b_free!13015) b_lambda!11003)))

(declare-fun b_lambda!11005 () Bool)

(assert (= b_lambda!10993 (or (and start!70722 b_free!13015) b_lambda!11005)))

(declare-fun b_lambda!11007 () Bool)

(assert (= b_lambda!10999 (or (and start!70722 b_free!13015) b_lambda!11007)))

(declare-fun b_lambda!11009 () Bool)

(assert (= b_lambda!11001 (or (and start!70722 b_free!13015) b_lambda!11009)))

(declare-fun b_lambda!11011 () Bool)

(assert (= b_lambda!10997 (or (and start!70722 b_free!13015) b_lambda!11011)))

(check-sat (not b_lambda!11009) (not b!821584) (not b!821597) (not b!821558) (not b!821634) (not bm!35710) (not bm!35720) (not b!821582) (not b!821632) (not b_lambda!11011) (not bm!35709) (not b!821644) (not bm!35724) (not b!821643) (not b!821646) (not b!821559) (not d!104607) (not b!821569) (not d!104609) (not b_lambda!11007) (not b!821564) (not b!821631) (not b_lambda!11003) (not b_next!13015) (not b!821585) (not b!821565) (not b!821635) (not b!821633) (not b!821629) (not bm!35717) b_and!21865 (not b!821625) (not b!821561) tp_is_empty!14725 (not b!821552) (not d!104611) (not bm!35714) (not d!104595) (not b_lambda!11005) (not bm!35708) (not b!821563) (not b!821637) (not b!821626) (not b!821596) (not b!821645) (not bm!35723) (not mapNonEmpty!23704) (not b!821623) (not b!821638) (not b!821641))
(check-sat b_and!21865 (not b_next!13015))
