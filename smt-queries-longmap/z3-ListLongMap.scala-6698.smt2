; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84142 () Bool)

(assert start!84142)

(declare-fun b_free!19861 () Bool)

(declare-fun b_next!19861 () Bool)

(assert (=> start!84142 (= b_free!19861 (not b_next!19861))))

(declare-fun tp!69187 () Bool)

(declare-fun b_and!31773 () Bool)

(assert (=> start!84142 (= tp!69187 b_and!31773)))

(declare-fun b!983868 () Bool)

(declare-fun res!658398 () Bool)

(declare-fun e!554643 () Bool)

(assert (=> b!983868 (=> (not res!658398) (not e!554643))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61836 0))(
  ( (array!61837 (arr!29776 (Array (_ BitVec 32) (_ BitVec 64))) (size!30257 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61836)

(assert (=> b!983868 (= res!658398 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30257 _keys!1544))))))

(declare-fun b!983869 () Bool)

(declare-fun res!658394 () Bool)

(assert (=> b!983869 (=> (not res!658394) (not e!554643))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35601 0))(
  ( (V!35602 (val!11532 Int)) )
))
(declare-datatypes ((ValueCell!11000 0))(
  ( (ValueCellFull!11000 (v!14093 V!35601)) (EmptyCell!11000) )
))
(declare-datatypes ((array!61838 0))(
  ( (array!61839 (arr!29777 (Array (_ BitVec 32) ValueCell!11000)) (size!30258 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61838)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983869 (= res!658394 (and (= (size!30258 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30257 _keys!1544) (size!30258 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983870 () Bool)

(declare-fun res!658399 () Bool)

(assert (=> b!983870 (=> (not res!658399) (not e!554643))))

(declare-datatypes ((List!20675 0))(
  ( (Nil!20672) (Cons!20671 (h!21833 (_ BitVec 64)) (t!29471 List!20675)) )
))
(declare-fun arrayNoDuplicates!0 (array!61836 (_ BitVec 32) List!20675) Bool)

(assert (=> b!983870 (= res!658399 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20672))))

(declare-fun mapNonEmpty!36473 () Bool)

(declare-fun mapRes!36473 () Bool)

(declare-fun tp!69188 () Bool)

(declare-fun e!554648 () Bool)

(assert (=> mapNonEmpty!36473 (= mapRes!36473 (and tp!69188 e!554648))))

(declare-fun mapKey!36473 () (_ BitVec 32))

(declare-fun mapRest!36473 () (Array (_ BitVec 32) ValueCell!11000))

(declare-fun mapValue!36473 () ValueCell!11000)

(assert (=> mapNonEmpty!36473 (= (arr!29777 _values!1278) (store mapRest!36473 mapKey!36473 mapValue!36473))))

(declare-fun b!983871 () Bool)

(declare-fun res!658397 () Bool)

(assert (=> b!983871 (=> (not res!658397) (not e!554643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61836 (_ BitVec 32)) Bool)

(assert (=> b!983871 (= res!658397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983872 () Bool)

(declare-fun e!554644 () Bool)

(assert (=> b!983872 (= e!554644 (not true))))

(declare-datatypes ((tuple2!14820 0))(
  ( (tuple2!14821 (_1!7421 (_ BitVec 64)) (_2!7421 V!35601)) )
))
(declare-datatypes ((List!20676 0))(
  ( (Nil!20673) (Cons!20672 (h!21834 tuple2!14820) (t!29472 List!20676)) )
))
(declare-datatypes ((ListLongMap!13507 0))(
  ( (ListLongMap!13508 (toList!6769 List!20676)) )
))
(declare-fun lt!436440 () ListLongMap!13507)

(declare-fun lt!436439 () tuple2!14820)

(declare-fun lt!436436 () tuple2!14820)

(declare-fun +!3053 (ListLongMap!13507 tuple2!14820) ListLongMap!13507)

(assert (=> b!983872 (= (+!3053 (+!3053 lt!436440 lt!436439) lt!436436) (+!3053 (+!3053 lt!436440 lt!436436) lt!436439))))

(declare-fun lt!436437 () V!35601)

(assert (=> b!983872 (= lt!436436 (tuple2!14821 (select (arr!29776 _keys!1544) from!1932) lt!436437))))

(declare-fun minValue!1220 () V!35601)

(assert (=> b!983872 (= lt!436439 (tuple2!14821 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32572 0))(
  ( (Unit!32573) )
))
(declare-fun lt!436438 () Unit!32572)

(declare-fun addCommutativeForDiffKeys!657 (ListLongMap!13507 (_ BitVec 64) V!35601 (_ BitVec 64) V!35601) Unit!32572)

(assert (=> b!983872 (= lt!436438 (addCommutativeForDiffKeys!657 lt!436440 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29776 _keys!1544) from!1932) lt!436437))))

(declare-fun res!658396 () Bool)

(assert (=> start!84142 (=> (not res!658396) (not e!554643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84142 (= res!658396 (validMask!0 mask!1948))))

(assert (=> start!84142 e!554643))

(assert (=> start!84142 true))

(declare-fun tp_is_empty!22963 () Bool)

(assert (=> start!84142 tp_is_empty!22963))

(declare-fun e!554647 () Bool)

(declare-fun array_inv!23029 (array!61838) Bool)

(assert (=> start!84142 (and (array_inv!23029 _values!1278) e!554647)))

(assert (=> start!84142 tp!69187))

(declare-fun array_inv!23030 (array!61836) Bool)

(assert (=> start!84142 (array_inv!23030 _keys!1544)))

(declare-fun b!983873 () Bool)

(declare-fun e!554646 () Bool)

(assert (=> b!983873 (= e!554647 (and e!554646 mapRes!36473))))

(declare-fun condMapEmpty!36473 () Bool)

(declare-fun mapDefault!36473 () ValueCell!11000)

(assert (=> b!983873 (= condMapEmpty!36473 (= (arr!29777 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11000)) mapDefault!36473)))))

(declare-fun b!983874 () Bool)

(assert (=> b!983874 (= e!554646 tp_is_empty!22963)))

(declare-fun b!983875 () Bool)

(assert (=> b!983875 (= e!554643 e!554644)))

(declare-fun res!658395 () Bool)

(assert (=> b!983875 (=> (not res!658395) (not e!554644))))

(assert (=> b!983875 (= res!658395 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29776 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15459 (ValueCell!11000 V!35601) V!35601)

(declare-fun dynLambda!1805 (Int (_ BitVec 64)) V!35601)

(assert (=> b!983875 (= lt!436437 (get!15459 (select (arr!29777 _values!1278) from!1932) (dynLambda!1805 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35601)

(declare-fun getCurrentListMapNoExtraKeys!3477 (array!61836 array!61838 (_ BitVec 32) (_ BitVec 32) V!35601 V!35601 (_ BitVec 32) Int) ListLongMap!13507)

(assert (=> b!983875 (= lt!436440 (getCurrentListMapNoExtraKeys!3477 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983876 () Bool)

(declare-fun res!658401 () Bool)

(assert (=> b!983876 (=> (not res!658401) (not e!554643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983876 (= res!658401 (validKeyInArray!0 (select (arr!29776 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36473 () Bool)

(assert (=> mapIsEmpty!36473 mapRes!36473))

(declare-fun b!983877 () Bool)

(assert (=> b!983877 (= e!554648 tp_is_empty!22963)))

(declare-fun b!983878 () Bool)

(declare-fun res!658400 () Bool)

(assert (=> b!983878 (=> (not res!658400) (not e!554643))))

(assert (=> b!983878 (= res!658400 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!84142 res!658396) b!983869))

(assert (= (and b!983869 res!658394) b!983871))

(assert (= (and b!983871 res!658397) b!983870))

(assert (= (and b!983870 res!658399) b!983868))

(assert (= (and b!983868 res!658398) b!983876))

(assert (= (and b!983876 res!658401) b!983878))

(assert (= (and b!983878 res!658400) b!983875))

(assert (= (and b!983875 res!658395) b!983872))

(assert (= (and b!983873 condMapEmpty!36473) mapIsEmpty!36473))

(assert (= (and b!983873 (not condMapEmpty!36473)) mapNonEmpty!36473))

(get-info :version)

(assert (= (and mapNonEmpty!36473 ((_ is ValueCellFull!11000) mapValue!36473)) b!983877))

(assert (= (and b!983873 ((_ is ValueCellFull!11000) mapDefault!36473)) b!983874))

(assert (= start!84142 b!983873))

(declare-fun b_lambda!14875 () Bool)

(assert (=> (not b_lambda!14875) (not b!983875)))

(declare-fun t!29470 () Bool)

(declare-fun tb!6647 () Bool)

(assert (=> (and start!84142 (= defaultEntry!1281 defaultEntry!1281) t!29470) tb!6647))

(declare-fun result!13291 () Bool)

(assert (=> tb!6647 (= result!13291 tp_is_empty!22963)))

(assert (=> b!983875 t!29470))

(declare-fun b_and!31775 () Bool)

(assert (= b_and!31773 (and (=> t!29470 result!13291) b_and!31775)))

(declare-fun m!910445 () Bool)

(assert (=> b!983870 m!910445))

(declare-fun m!910447 () Bool)

(assert (=> b!983875 m!910447))

(declare-fun m!910449 () Bool)

(assert (=> b!983875 m!910449))

(declare-fun m!910451 () Bool)

(assert (=> b!983875 m!910451))

(declare-fun m!910453 () Bool)

(assert (=> b!983875 m!910453))

(assert (=> b!983875 m!910449))

(assert (=> b!983875 m!910453))

(declare-fun m!910455 () Bool)

(assert (=> b!983875 m!910455))

(assert (=> b!983872 m!910447))

(declare-fun m!910457 () Bool)

(assert (=> b!983872 m!910457))

(assert (=> b!983872 m!910447))

(declare-fun m!910459 () Bool)

(assert (=> b!983872 m!910459))

(declare-fun m!910461 () Bool)

(assert (=> b!983872 m!910461))

(assert (=> b!983872 m!910459))

(declare-fun m!910463 () Bool)

(assert (=> b!983872 m!910463))

(declare-fun m!910465 () Bool)

(assert (=> b!983872 m!910465))

(assert (=> b!983872 m!910463))

(assert (=> b!983876 m!910447))

(assert (=> b!983876 m!910447))

(declare-fun m!910467 () Bool)

(assert (=> b!983876 m!910467))

(declare-fun m!910469 () Bool)

(assert (=> mapNonEmpty!36473 m!910469))

(declare-fun m!910471 () Bool)

(assert (=> start!84142 m!910471))

(declare-fun m!910473 () Bool)

(assert (=> start!84142 m!910473))

(declare-fun m!910475 () Bool)

(assert (=> start!84142 m!910475))

(declare-fun m!910477 () Bool)

(assert (=> b!983871 m!910477))

(check-sat (not b_lambda!14875) (not b!983875) (not b!983876) (not mapNonEmpty!36473) b_and!31775 (not b!983871) (not b!983870) (not b!983872) (not b_next!19861) (not start!84142) tp_is_empty!22963)
(check-sat b_and!31775 (not b_next!19861))
