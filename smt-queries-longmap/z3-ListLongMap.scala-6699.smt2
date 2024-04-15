; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84148 () Bool)

(assert start!84148)

(declare-fun b_free!19867 () Bool)

(declare-fun b_next!19867 () Bool)

(assert (=> start!84148 (= b_free!19867 (not b_next!19867))))

(declare-fun tp!69206 () Bool)

(declare-fun b_and!31785 () Bool)

(assert (=> start!84148 (= tp!69206 b_and!31785)))

(declare-fun b!983973 () Bool)

(declare-fun res!658471 () Bool)

(declare-fun e!554699 () Bool)

(assert (=> b!983973 (=> (not res!658471) (not e!554699))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983973 (= res!658471 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!983974 () Bool)

(declare-fun e!554697 () Bool)

(declare-fun tp_is_empty!22969 () Bool)

(assert (=> b!983974 (= e!554697 tp_is_empty!22969)))

(declare-fun res!658469 () Bool)

(assert (=> start!84148 (=> (not res!658469) (not e!554699))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84148 (= res!658469 (validMask!0 mask!1948))))

(assert (=> start!84148 e!554699))

(assert (=> start!84148 true))

(assert (=> start!84148 tp_is_empty!22969))

(declare-datatypes ((V!35609 0))(
  ( (V!35610 (val!11535 Int)) )
))
(declare-datatypes ((ValueCell!11003 0))(
  ( (ValueCellFull!11003 (v!14096 V!35609)) (EmptyCell!11003) )
))
(declare-datatypes ((array!61846 0))(
  ( (array!61847 (arr!29781 (Array (_ BitVec 32) ValueCell!11003)) (size!30262 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61846)

(declare-fun e!554702 () Bool)

(declare-fun array_inv!23031 (array!61846) Bool)

(assert (=> start!84148 (and (array_inv!23031 _values!1278) e!554702)))

(assert (=> start!84148 tp!69206))

(declare-datatypes ((array!61848 0))(
  ( (array!61849 (arr!29782 (Array (_ BitVec 32) (_ BitVec 64))) (size!30263 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61848)

(declare-fun array_inv!23032 (array!61848) Bool)

(assert (=> start!84148 (array_inv!23032 _keys!1544)))

(declare-fun b!983975 () Bool)

(declare-fun e!554701 () Bool)

(declare-fun mapRes!36482 () Bool)

(assert (=> b!983975 (= e!554702 (and e!554701 mapRes!36482))))

(declare-fun condMapEmpty!36482 () Bool)

(declare-fun mapDefault!36482 () ValueCell!11003)

(assert (=> b!983975 (= condMapEmpty!36482 (= (arr!29781 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11003)) mapDefault!36482)))))

(declare-fun b!983976 () Bool)

(declare-fun e!554700 () Bool)

(assert (=> b!983976 (= e!554699 e!554700)))

(declare-fun res!658466 () Bool)

(assert (=> b!983976 (=> (not res!658466) (not e!554700))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983976 (= res!658466 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29782 _keys!1544) from!1932))))))

(declare-fun lt!436482 () V!35609)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15463 (ValueCell!11003 V!35609) V!35609)

(declare-fun dynLambda!1807 (Int (_ BitVec 64)) V!35609)

(assert (=> b!983976 (= lt!436482 (get!15463 (select (arr!29781 _values!1278) from!1932) (dynLambda!1807 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35609)

(declare-datatypes ((tuple2!14824 0))(
  ( (tuple2!14825 (_1!7423 (_ BitVec 64)) (_2!7423 V!35609)) )
))
(declare-datatypes ((List!20678 0))(
  ( (Nil!20675) (Cons!20674 (h!21836 tuple2!14824) (t!29480 List!20678)) )
))
(declare-datatypes ((ListLongMap!13511 0))(
  ( (ListLongMap!13512 (toList!6771 List!20678)) )
))
(declare-fun lt!436484 () ListLongMap!13511)

(declare-fun zeroValue!1220 () V!35609)

(declare-fun getCurrentListMapNoExtraKeys!3479 (array!61848 array!61846 (_ BitVec 32) (_ BitVec 32) V!35609 V!35609 (_ BitVec 32) Int) ListLongMap!13511)

(assert (=> b!983976 (= lt!436484 (getCurrentListMapNoExtraKeys!3479 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983977 () Bool)

(declare-fun res!658468 () Bool)

(assert (=> b!983977 (=> (not res!658468) (not e!554699))))

(assert (=> b!983977 (= res!658468 (and (= (size!30262 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30263 _keys!1544) (size!30262 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983978 () Bool)

(declare-fun res!658470 () Bool)

(assert (=> b!983978 (=> (not res!658470) (not e!554699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983978 (= res!658470 (validKeyInArray!0 (select (arr!29782 _keys!1544) from!1932)))))

(declare-fun b!983979 () Bool)

(declare-fun res!658472 () Bool)

(assert (=> b!983979 (=> (not res!658472) (not e!554699))))

(declare-datatypes ((List!20679 0))(
  ( (Nil!20676) (Cons!20675 (h!21837 (_ BitVec 64)) (t!29481 List!20679)) )
))
(declare-fun arrayNoDuplicates!0 (array!61848 (_ BitVec 32) List!20679) Bool)

(assert (=> b!983979 (= res!658472 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20676))))

(declare-fun mapIsEmpty!36482 () Bool)

(assert (=> mapIsEmpty!36482 mapRes!36482))

(declare-fun b!983980 () Bool)

(assert (=> b!983980 (= e!554701 tp_is_empty!22969)))

(declare-fun mapNonEmpty!36482 () Bool)

(declare-fun tp!69205 () Bool)

(assert (=> mapNonEmpty!36482 (= mapRes!36482 (and tp!69205 e!554697))))

(declare-fun mapValue!36482 () ValueCell!11003)

(declare-fun mapRest!36482 () (Array (_ BitVec 32) ValueCell!11003))

(declare-fun mapKey!36482 () (_ BitVec 32))

(assert (=> mapNonEmpty!36482 (= (arr!29781 _values!1278) (store mapRest!36482 mapKey!36482 mapValue!36482))))

(declare-fun b!983981 () Bool)

(declare-fun res!658473 () Bool)

(assert (=> b!983981 (=> (not res!658473) (not e!554699))))

(assert (=> b!983981 (= res!658473 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30263 _keys!1544))))))

(declare-fun b!983982 () Bool)

(assert (=> b!983982 (= e!554700 (not true))))

(declare-fun lt!436481 () tuple2!14824)

(declare-fun lt!436483 () tuple2!14824)

(declare-fun +!3054 (ListLongMap!13511 tuple2!14824) ListLongMap!13511)

(assert (=> b!983982 (= (+!3054 (+!3054 lt!436484 lt!436481) lt!436483) (+!3054 (+!3054 lt!436484 lt!436483) lt!436481))))

(assert (=> b!983982 (= lt!436483 (tuple2!14825 (select (arr!29782 _keys!1544) from!1932) lt!436482))))

(assert (=> b!983982 (= lt!436481 (tuple2!14825 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32574 0))(
  ( (Unit!32575) )
))
(declare-fun lt!436485 () Unit!32574)

(declare-fun addCommutativeForDiffKeys!658 (ListLongMap!13511 (_ BitVec 64) V!35609 (_ BitVec 64) V!35609) Unit!32574)

(assert (=> b!983982 (= lt!436485 (addCommutativeForDiffKeys!658 lt!436484 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29782 _keys!1544) from!1932) lt!436482))))

(declare-fun b!983983 () Bool)

(declare-fun res!658467 () Bool)

(assert (=> b!983983 (=> (not res!658467) (not e!554699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61848 (_ BitVec 32)) Bool)

(assert (=> b!983983 (= res!658467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84148 res!658469) b!983977))

(assert (= (and b!983977 res!658468) b!983983))

(assert (= (and b!983983 res!658467) b!983979))

(assert (= (and b!983979 res!658472) b!983981))

(assert (= (and b!983981 res!658473) b!983978))

(assert (= (and b!983978 res!658470) b!983973))

(assert (= (and b!983973 res!658471) b!983976))

(assert (= (and b!983976 res!658466) b!983982))

(assert (= (and b!983975 condMapEmpty!36482) mapIsEmpty!36482))

(assert (= (and b!983975 (not condMapEmpty!36482)) mapNonEmpty!36482))

(get-info :version)

(assert (= (and mapNonEmpty!36482 ((_ is ValueCellFull!11003) mapValue!36482)) b!983974))

(assert (= (and b!983975 ((_ is ValueCellFull!11003) mapDefault!36482)) b!983980))

(assert (= start!84148 b!983975))

(declare-fun b_lambda!14881 () Bool)

(assert (=> (not b_lambda!14881) (not b!983976)))

(declare-fun t!29479 () Bool)

(declare-fun tb!6653 () Bool)

(assert (=> (and start!84148 (= defaultEntry!1281 defaultEntry!1281) t!29479) tb!6653))

(declare-fun result!13303 () Bool)

(assert (=> tb!6653 (= result!13303 tp_is_empty!22969)))

(assert (=> b!983976 t!29479))

(declare-fun b_and!31787 () Bool)

(assert (= b_and!31785 (and (=> t!29479 result!13303) b_and!31787)))

(declare-fun m!910547 () Bool)

(assert (=> b!983982 m!910547))

(declare-fun m!910549 () Bool)

(assert (=> b!983982 m!910549))

(declare-fun m!910551 () Bool)

(assert (=> b!983982 m!910551))

(assert (=> b!983982 m!910547))

(declare-fun m!910553 () Bool)

(assert (=> b!983982 m!910553))

(declare-fun m!910555 () Bool)

(assert (=> b!983982 m!910555))

(assert (=> b!983982 m!910551))

(declare-fun m!910557 () Bool)

(assert (=> b!983982 m!910557))

(assert (=> b!983982 m!910553))

(declare-fun m!910559 () Bool)

(assert (=> b!983979 m!910559))

(declare-fun m!910561 () Bool)

(assert (=> start!84148 m!910561))

(declare-fun m!910563 () Bool)

(assert (=> start!84148 m!910563))

(declare-fun m!910565 () Bool)

(assert (=> start!84148 m!910565))

(declare-fun m!910567 () Bool)

(assert (=> mapNonEmpty!36482 m!910567))

(assert (=> b!983978 m!910547))

(assert (=> b!983978 m!910547))

(declare-fun m!910569 () Bool)

(assert (=> b!983978 m!910569))

(declare-fun m!910571 () Bool)

(assert (=> b!983983 m!910571))

(assert (=> b!983976 m!910547))

(declare-fun m!910573 () Bool)

(assert (=> b!983976 m!910573))

(declare-fun m!910575 () Bool)

(assert (=> b!983976 m!910575))

(declare-fun m!910577 () Bool)

(assert (=> b!983976 m!910577))

(assert (=> b!983976 m!910573))

(assert (=> b!983976 m!910577))

(declare-fun m!910579 () Bool)

(assert (=> b!983976 m!910579))

(check-sat (not b!983982) (not b_next!19867) (not b_lambda!14881) (not start!84148) b_and!31787 tp_is_empty!22969 (not b!983979) (not b!983978) (not b!983976) (not b!983983) (not mapNonEmpty!36482))
(check-sat b_and!31787 (not b_next!19867))
