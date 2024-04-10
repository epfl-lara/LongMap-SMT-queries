; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83778 () Bool)

(assert start!83778)

(declare-fun b_free!19587 () Bool)

(declare-fun b_next!19587 () Bool)

(assert (=> start!83778 (= b_free!19587 (not b_next!19587))))

(declare-fun tp!68203 () Bool)

(declare-fun b_and!31263 () Bool)

(assert (=> start!83778 (= tp!68203 b_and!31263)))

(declare-fun b!978365 () Bool)

(declare-fun res!654746 () Bool)

(declare-fun e!551585 () Bool)

(assert (=> b!978365 (=> (not res!654746) (not e!551585))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35091 0))(
  ( (V!35092 (val!11341 Int)) )
))
(declare-datatypes ((ValueCell!10809 0))(
  ( (ValueCellFull!10809 (v!13903 V!35091)) (EmptyCell!10809) )
))
(declare-datatypes ((array!61189 0))(
  ( (array!61190 (arr!29452 (Array (_ BitVec 32) ValueCell!10809)) (size!29931 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61189)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61191 0))(
  ( (array!61192 (arr!29453 (Array (_ BitVec 32) (_ BitVec 64))) (size!29932 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61191)

(assert (=> b!978365 (= res!654746 (and (= (size!29931 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29932 _keys!1544) (size!29931 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978366 () Bool)

(declare-fun res!654749 () Bool)

(assert (=> b!978366 (=> (not res!654749) (not e!551585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61191 (_ BitVec 32)) Bool)

(assert (=> b!978366 (= res!654749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!654745 () Bool)

(assert (=> start!83778 (=> (not res!654745) (not e!551585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83778 (= res!654745 (validMask!0 mask!1948))))

(assert (=> start!83778 e!551585))

(assert (=> start!83778 true))

(declare-fun tp_is_empty!22581 () Bool)

(assert (=> start!83778 tp_is_empty!22581))

(declare-fun e!551586 () Bool)

(declare-fun array_inv!22769 (array!61189) Bool)

(assert (=> start!83778 (and (array_inv!22769 _values!1278) e!551586)))

(assert (=> start!83778 tp!68203))

(declare-fun array_inv!22770 (array!61191) Bool)

(assert (=> start!83778 (array_inv!22770 _keys!1544)))

(declare-fun b!978367 () Bool)

(declare-fun res!654748 () Bool)

(assert (=> b!978367 (=> (not res!654748) (not e!551585))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978367 (= res!654748 (validKeyInArray!0 (select (arr!29453 _keys!1544) from!1932)))))

(declare-fun b!978368 () Bool)

(assert (=> b!978368 (= e!551585 (not true))))

(declare-datatypes ((tuple2!14542 0))(
  ( (tuple2!14543 (_1!7282 (_ BitVec 64)) (_2!7282 V!35091)) )
))
(declare-datatypes ((List!20414 0))(
  ( (Nil!20411) (Cons!20410 (h!21572 tuple2!14542) (t!28957 List!20414)) )
))
(declare-datatypes ((ListLongMap!13239 0))(
  ( (ListLongMap!13240 (toList!6635 List!20414)) )
))
(declare-fun lt!433736 () ListLongMap!13239)

(declare-fun lt!433735 () tuple2!14542)

(declare-fun lt!433737 () tuple2!14542)

(declare-fun +!2940 (ListLongMap!13239 tuple2!14542) ListLongMap!13239)

(assert (=> b!978368 (= (+!2940 (+!2940 lt!433736 lt!433735) lt!433737) (+!2940 (+!2940 lt!433736 lt!433737) lt!433735))))

(declare-fun lt!433738 () V!35091)

(assert (=> b!978368 (= lt!433737 (tuple2!14543 (select (arr!29453 _keys!1544) from!1932) lt!433738))))

(declare-fun minValue!1220 () V!35091)

(assert (=> b!978368 (= lt!433735 (tuple2!14543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32519 0))(
  ( (Unit!32520) )
))
(declare-fun lt!433739 () Unit!32519)

(declare-fun addCommutativeForDiffKeys!568 (ListLongMap!13239 (_ BitVec 64) V!35091 (_ BitVec 64) V!35091) Unit!32519)

(assert (=> b!978368 (= lt!433739 (addCommutativeForDiffKeys!568 lt!433736 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29453 _keys!1544) from!1932) lt!433738))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15249 (ValueCell!10809 V!35091) V!35091)

(declare-fun dynLambda!1728 (Int (_ BitVec 64)) V!35091)

(assert (=> b!978368 (= lt!433738 (get!15249 (select (arr!29452 _values!1278) from!1932) (dynLambda!1728 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35091)

(declare-fun getCurrentListMapNoExtraKeys!3342 (array!61191 array!61189 (_ BitVec 32) (_ BitVec 32) V!35091 V!35091 (_ BitVec 32) Int) ListLongMap!13239)

(assert (=> b!978368 (= lt!433736 (+!2940 (getCurrentListMapNoExtraKeys!3342 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978369 () Bool)

(declare-fun e!551582 () Bool)

(assert (=> b!978369 (= e!551582 tp_is_empty!22581)))

(declare-fun mapNonEmpty!35900 () Bool)

(declare-fun mapRes!35900 () Bool)

(declare-fun tp!68202 () Bool)

(assert (=> mapNonEmpty!35900 (= mapRes!35900 (and tp!68202 e!551582))))

(declare-fun mapValue!35900 () ValueCell!10809)

(declare-fun mapRest!35900 () (Array (_ BitVec 32) ValueCell!10809))

(declare-fun mapKey!35900 () (_ BitVec 32))

(assert (=> mapNonEmpty!35900 (= (arr!29452 _values!1278) (store mapRest!35900 mapKey!35900 mapValue!35900))))

(declare-fun mapIsEmpty!35900 () Bool)

(assert (=> mapIsEmpty!35900 mapRes!35900))

(declare-fun b!978370 () Bool)

(declare-fun res!654744 () Bool)

(assert (=> b!978370 (=> (not res!654744) (not e!551585))))

(assert (=> b!978370 (= res!654744 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29932 _keys!1544))))))

(declare-fun b!978371 () Bool)

(declare-fun res!654747 () Bool)

(assert (=> b!978371 (=> (not res!654747) (not e!551585))))

(declare-datatypes ((List!20415 0))(
  ( (Nil!20412) (Cons!20411 (h!21573 (_ BitVec 64)) (t!28958 List!20415)) )
))
(declare-fun arrayNoDuplicates!0 (array!61191 (_ BitVec 32) List!20415) Bool)

(assert (=> b!978371 (= res!654747 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20412))))

(declare-fun b!978372 () Bool)

(declare-fun res!654743 () Bool)

(assert (=> b!978372 (=> (not res!654743) (not e!551585))))

(assert (=> b!978372 (= res!654743 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978373 () Bool)

(declare-fun e!551583 () Bool)

(assert (=> b!978373 (= e!551586 (and e!551583 mapRes!35900))))

(declare-fun condMapEmpty!35900 () Bool)

(declare-fun mapDefault!35900 () ValueCell!10809)

(assert (=> b!978373 (= condMapEmpty!35900 (= (arr!29452 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10809)) mapDefault!35900)))))

(declare-fun b!978374 () Bool)

(assert (=> b!978374 (= e!551583 tp_is_empty!22581)))

(assert (= (and start!83778 res!654745) b!978365))

(assert (= (and b!978365 res!654746) b!978366))

(assert (= (and b!978366 res!654749) b!978371))

(assert (= (and b!978371 res!654747) b!978370))

(assert (= (and b!978370 res!654744) b!978367))

(assert (= (and b!978367 res!654748) b!978372))

(assert (= (and b!978372 res!654743) b!978368))

(assert (= (and b!978373 condMapEmpty!35900) mapIsEmpty!35900))

(assert (= (and b!978373 (not condMapEmpty!35900)) mapNonEmpty!35900))

(get-info :version)

(assert (= (and mapNonEmpty!35900 ((_ is ValueCellFull!10809) mapValue!35900)) b!978369))

(assert (= (and b!978373 ((_ is ValueCellFull!10809) mapDefault!35900)) b!978374))

(assert (= start!83778 b!978373))

(declare-fun b_lambda!14631 () Bool)

(assert (=> (not b_lambda!14631) (not b!978368)))

(declare-fun t!28956 () Bool)

(declare-fun tb!6393 () Bool)

(assert (=> (and start!83778 (= defaultEntry!1281 defaultEntry!1281) t!28956) tb!6393))

(declare-fun result!12775 () Bool)

(assert (=> tb!6393 (= result!12775 tp_is_empty!22581)))

(assert (=> b!978368 t!28956))

(declare-fun b_and!31265 () Bool)

(assert (= b_and!31263 (and (=> t!28956 result!12775) b_and!31265)))

(declare-fun m!905503 () Bool)

(assert (=> b!978368 m!905503))

(declare-fun m!905505 () Bool)

(assert (=> b!978368 m!905505))

(declare-fun m!905507 () Bool)

(assert (=> b!978368 m!905507))

(assert (=> b!978368 m!905505))

(declare-fun m!905509 () Bool)

(assert (=> b!978368 m!905509))

(declare-fun m!905511 () Bool)

(assert (=> b!978368 m!905511))

(declare-fun m!905513 () Bool)

(assert (=> b!978368 m!905513))

(assert (=> b!978368 m!905503))

(declare-fun m!905515 () Bool)

(assert (=> b!978368 m!905515))

(declare-fun m!905517 () Bool)

(assert (=> b!978368 m!905517))

(declare-fun m!905519 () Bool)

(assert (=> b!978368 m!905519))

(assert (=> b!978368 m!905517))

(assert (=> b!978368 m!905511))

(declare-fun m!905521 () Bool)

(assert (=> b!978368 m!905521))

(assert (=> b!978368 m!905507))

(assert (=> b!978368 m!905521))

(declare-fun m!905523 () Bool)

(assert (=> b!978368 m!905523))

(declare-fun m!905525 () Bool)

(assert (=> b!978366 m!905525))

(assert (=> b!978367 m!905505))

(assert (=> b!978367 m!905505))

(declare-fun m!905527 () Bool)

(assert (=> b!978367 m!905527))

(declare-fun m!905529 () Bool)

(assert (=> start!83778 m!905529))

(declare-fun m!905531 () Bool)

(assert (=> start!83778 m!905531))

(declare-fun m!905533 () Bool)

(assert (=> start!83778 m!905533))

(declare-fun m!905535 () Bool)

(assert (=> mapNonEmpty!35900 m!905535))

(declare-fun m!905537 () Bool)

(assert (=> b!978371 m!905537))

(check-sat (not mapNonEmpty!35900) b_and!31265 tp_is_empty!22581 (not b!978368) (not start!83778) (not b_next!19587) (not b_lambda!14631) (not b!978371) (not b!978367) (not b!978366))
(check-sat b_and!31265 (not b_next!19587))
