; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84610 () Bool)

(assert start!84610)

(declare-fun b_free!19993 () Bool)

(declare-fun b_next!19993 () Bool)

(assert (=> start!84610 (= b_free!19993 (not b_next!19993))))

(declare-fun tp!69760 () Bool)

(declare-fun b_and!32063 () Bool)

(assert (=> start!84610 (= tp!69760 b_and!32063)))

(declare-fun b!988498 () Bool)

(declare-fun e!557472 () Bool)

(declare-fun tp_is_empty!23209 () Bool)

(assert (=> b!988498 (= e!557472 tp_is_empty!23209)))

(declare-fun b!988499 () Bool)

(declare-fun e!557473 () Bool)

(declare-fun e!557476 () Bool)

(assert (=> b!988499 (= e!557473 (not e!557476))))

(declare-fun res!661025 () Bool)

(assert (=> b!988499 (=> res!661025 e!557476)))

(declare-datatypes ((array!62422 0))(
  ( (array!62423 (arr!30062 (Array (_ BitVec 32) (_ BitVec 64))) (size!30542 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62422)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!988499 (= res!661025 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30062 _keys!1544) from!1932)))))

(declare-datatypes ((V!35929 0))(
  ( (V!35930 (val!11655 Int)) )
))
(declare-datatypes ((tuple2!14868 0))(
  ( (tuple2!14869 (_1!7445 (_ BitVec 64)) (_2!7445 V!35929)) )
))
(declare-fun lt!438201 () tuple2!14868)

(declare-datatypes ((List!20775 0))(
  ( (Nil!20772) (Cons!20771 (h!21939 tuple2!14868) (t!29688 List!20775)) )
))
(declare-datatypes ((ListLongMap!13567 0))(
  ( (ListLongMap!13568 (toList!6799 List!20775)) )
))
(declare-fun lt!438207 () ListLongMap!13567)

(declare-fun lt!438211 () ListLongMap!13567)

(declare-fun lt!438209 () tuple2!14868)

(declare-fun +!3098 (ListLongMap!13567 tuple2!14868) ListLongMap!13567)

(assert (=> b!988499 (= (+!3098 lt!438211 lt!438209) (+!3098 lt!438207 lt!438201))))

(declare-fun lt!438203 () ListLongMap!13567)

(assert (=> b!988499 (= lt!438207 (+!3098 lt!438203 lt!438209))))

(declare-fun lt!438202 () V!35929)

(assert (=> b!988499 (= lt!438209 (tuple2!14869 (select (arr!30062 _keys!1544) from!1932) lt!438202))))

(assert (=> b!988499 (= lt!438211 (+!3098 lt!438203 lt!438201))))

(declare-fun minValue!1220 () V!35929)

(assert (=> b!988499 (= lt!438201 (tuple2!14869 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32770 0))(
  ( (Unit!32771) )
))
(declare-fun lt!438206 () Unit!32770)

(declare-fun addCommutativeForDiffKeys!701 (ListLongMap!13567 (_ BitVec 64) V!35929 (_ BitVec 64) V!35929) Unit!32770)

(assert (=> b!988499 (= lt!438206 (addCommutativeForDiffKeys!701 lt!438203 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30062 _keys!1544) from!1932) lt!438202))))

(declare-datatypes ((ValueCell!11123 0))(
  ( (ValueCellFull!11123 (v!14216 V!35929)) (EmptyCell!11123) )
))
(declare-datatypes ((array!62424 0))(
  ( (array!62425 (arr!30063 (Array (_ BitVec 32) ValueCell!11123)) (size!30543 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62424)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15619 (ValueCell!11123 V!35929) V!35929)

(declare-fun dynLambda!1882 (Int (_ BitVec 64)) V!35929)

(assert (=> b!988499 (= lt!438202 (get!15619 (select (arr!30063 _values!1278) from!1932) (dynLambda!1882 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!438204 () ListLongMap!13567)

(declare-fun lt!438210 () tuple2!14868)

(assert (=> b!988499 (= lt!438203 (+!3098 lt!438204 lt!438210))))

(declare-fun zeroValue!1220 () V!35929)

(assert (=> b!988499 (= lt!438210 (tuple2!14869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3528 (array!62422 array!62424 (_ BitVec 32) (_ BitVec 32) V!35929 V!35929 (_ BitVec 32) Int) ListLongMap!13567)

(assert (=> b!988499 (= lt!438204 (getCurrentListMapNoExtraKeys!3528 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988500 () Bool)

(assert (=> b!988500 (= e!557476 true)))

(declare-fun lt!438208 () ListLongMap!13567)

(declare-fun getCurrentListMap!3859 (array!62422 array!62424 (_ BitVec 32) (_ BitVec 32) V!35929 V!35929 (_ BitVec 32) Int) ListLongMap!13567)

(assert (=> b!988500 (= lt!438208 (getCurrentListMap!3859 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (=> b!988500 (= lt!438207 (+!3098 (+!3098 lt!438204 lt!438209) lt!438210))))

(declare-fun lt!438205 () Unit!32770)

(assert (=> b!988500 (= lt!438205 (addCommutativeForDiffKeys!701 lt!438204 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30062 _keys!1544) from!1932) lt!438202))))

(declare-fun b!988501 () Bool)

(declare-fun res!661026 () Bool)

(assert (=> b!988501 (=> (not res!661026) (not e!557473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988501 (= res!661026 (validKeyInArray!0 (select (arr!30062 _keys!1544) from!1932)))))

(declare-fun b!988502 () Bool)

(declare-fun res!661023 () Bool)

(assert (=> b!988502 (=> (not res!661023) (not e!557473))))

(declare-datatypes ((List!20776 0))(
  ( (Nil!20773) (Cons!20772 (h!21940 (_ BitVec 64)) (t!29689 List!20776)) )
))
(declare-fun arrayNoDuplicates!0 (array!62422 (_ BitVec 32) List!20776) Bool)

(assert (=> b!988502 (= res!661023 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20773))))

(declare-fun b!988503 () Bool)

(declare-fun e!557475 () Bool)

(assert (=> b!988503 (= e!557475 tp_is_empty!23209)))

(declare-fun b!988504 () Bool)

(declare-fun res!661019 () Bool)

(assert (=> b!988504 (=> (not res!661019) (not e!557473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62422 (_ BitVec 32)) Bool)

(assert (=> b!988504 (= res!661019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!661024 () Bool)

(assert (=> start!84610 (=> (not res!661024) (not e!557473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84610 (= res!661024 (validMask!0 mask!1948))))

(assert (=> start!84610 e!557473))

(assert (=> start!84610 true))

(assert (=> start!84610 tp_is_empty!23209))

(declare-fun e!557471 () Bool)

(declare-fun array_inv!23251 (array!62424) Bool)

(assert (=> start!84610 (and (array_inv!23251 _values!1278) e!557471)))

(assert (=> start!84610 tp!69760))

(declare-fun array_inv!23252 (array!62422) Bool)

(assert (=> start!84610 (array_inv!23252 _keys!1544)))

(declare-fun b!988505 () Bool)

(declare-fun res!661022 () Bool)

(assert (=> b!988505 (=> (not res!661022) (not e!557473))))

(assert (=> b!988505 (= res!661022 (and (= (size!30543 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30542 _keys!1544) (size!30543 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36848 () Bool)

(declare-fun mapRes!36848 () Bool)

(declare-fun tp!69761 () Bool)

(assert (=> mapNonEmpty!36848 (= mapRes!36848 (and tp!69761 e!557472))))

(declare-fun mapKey!36848 () (_ BitVec 32))

(declare-fun mapValue!36848 () ValueCell!11123)

(declare-fun mapRest!36848 () (Array (_ BitVec 32) ValueCell!11123))

(assert (=> mapNonEmpty!36848 (= (arr!30063 _values!1278) (store mapRest!36848 mapKey!36848 mapValue!36848))))

(declare-fun b!988506 () Bool)

(assert (=> b!988506 (= e!557471 (and e!557475 mapRes!36848))))

(declare-fun condMapEmpty!36848 () Bool)

(declare-fun mapDefault!36848 () ValueCell!11123)

(assert (=> b!988506 (= condMapEmpty!36848 (= (arr!30063 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11123)) mapDefault!36848)))))

(declare-fun b!988507 () Bool)

(declare-fun res!661020 () Bool)

(assert (=> b!988507 (=> (not res!661020) (not e!557473))))

(assert (=> b!988507 (= res!661020 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30542 _keys!1544))))))

(declare-fun b!988508 () Bool)

(declare-fun res!661021 () Bool)

(assert (=> b!988508 (=> (not res!661021) (not e!557473))))

(assert (=> b!988508 (= res!661021 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36848 () Bool)

(assert (=> mapIsEmpty!36848 mapRes!36848))

(assert (= (and start!84610 res!661024) b!988505))

(assert (= (and b!988505 res!661022) b!988504))

(assert (= (and b!988504 res!661019) b!988502))

(assert (= (and b!988502 res!661023) b!988507))

(assert (= (and b!988507 res!661020) b!988501))

(assert (= (and b!988501 res!661026) b!988508))

(assert (= (and b!988508 res!661021) b!988499))

(assert (= (and b!988499 (not res!661025)) b!988500))

(assert (= (and b!988506 condMapEmpty!36848) mapIsEmpty!36848))

(assert (= (and b!988506 (not condMapEmpty!36848)) mapNonEmpty!36848))

(get-info :version)

(assert (= (and mapNonEmpty!36848 ((_ is ValueCellFull!11123) mapValue!36848)) b!988498))

(assert (= (and b!988506 ((_ is ValueCellFull!11123) mapDefault!36848)) b!988503))

(assert (= start!84610 b!988506))

(declare-fun b_lambda!15039 () Bool)

(assert (=> (not b_lambda!15039) (not b!988499)))

(declare-fun t!29687 () Bool)

(declare-fun tb!6763 () Bool)

(assert (=> (and start!84610 (= defaultEntry!1281 defaultEntry!1281) t!29687) tb!6763))

(declare-fun result!13527 () Bool)

(assert (=> tb!6763 (= result!13527 tp_is_empty!23209)))

(assert (=> b!988499 t!29687))

(declare-fun b_and!32065 () Bool)

(assert (= b_and!32063 (and (=> t!29687 result!13527) b_and!32065)))

(declare-fun m!915521 () Bool)

(assert (=> start!84610 m!915521))

(declare-fun m!915523 () Bool)

(assert (=> start!84610 m!915523))

(declare-fun m!915525 () Bool)

(assert (=> start!84610 m!915525))

(declare-fun m!915527 () Bool)

(assert (=> b!988499 m!915527))

(declare-fun m!915529 () Bool)

(assert (=> b!988499 m!915529))

(declare-fun m!915531 () Bool)

(assert (=> b!988499 m!915531))

(declare-fun m!915533 () Bool)

(assert (=> b!988499 m!915533))

(declare-fun m!915535 () Bool)

(assert (=> b!988499 m!915535))

(declare-fun m!915537 () Bool)

(assert (=> b!988499 m!915537))

(declare-fun m!915539 () Bool)

(assert (=> b!988499 m!915539))

(declare-fun m!915541 () Bool)

(assert (=> b!988499 m!915541))

(assert (=> b!988499 m!915541))

(declare-fun m!915543 () Bool)

(assert (=> b!988499 m!915543))

(declare-fun m!915545 () Bool)

(assert (=> b!988499 m!915545))

(assert (=> b!988499 m!915527))

(assert (=> b!988499 m!915545))

(declare-fun m!915547 () Bool)

(assert (=> b!988499 m!915547))

(assert (=> b!988501 m!915541))

(assert (=> b!988501 m!915541))

(declare-fun m!915549 () Bool)

(assert (=> b!988501 m!915549))

(declare-fun m!915551 () Bool)

(assert (=> b!988504 m!915551))

(declare-fun m!915553 () Bool)

(assert (=> b!988500 m!915553))

(assert (=> b!988500 m!915553))

(declare-fun m!915555 () Bool)

(assert (=> b!988500 m!915555))

(assert (=> b!988500 m!915541))

(declare-fun m!915557 () Bool)

(assert (=> b!988500 m!915557))

(assert (=> b!988500 m!915541))

(declare-fun m!915559 () Bool)

(assert (=> b!988500 m!915559))

(declare-fun m!915561 () Bool)

(assert (=> mapNonEmpty!36848 m!915561))

(declare-fun m!915563 () Bool)

(assert (=> b!988502 m!915563))

(check-sat (not b_next!19993) (not b!988502) (not b!988499) tp_is_empty!23209 (not b_lambda!15039) (not b!988500) (not start!84610) b_and!32065 (not b!988504) (not mapNonEmpty!36848) (not b!988501))
(check-sat b_and!32065 (not b_next!19993))
