; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84180 () Bool)

(assert start!84180)

(declare-fun b_free!19881 () Bool)

(declare-fun b_next!19881 () Bool)

(assert (=> start!84180 (= b_free!19881 (not b_next!19881))))

(declare-fun tp!69247 () Bool)

(declare-fun b_and!31839 () Bool)

(assert (=> start!84180 (= tp!69247 b_and!31839)))

(declare-fun b!984457 () Bool)

(declare-fun e!554972 () Bool)

(declare-fun e!554976 () Bool)

(assert (=> b!984457 (= e!554972 e!554976)))

(declare-fun res!658744 () Bool)

(assert (=> b!984457 (=> (not res!658744) (not e!554976))))

(declare-datatypes ((array!61947 0))(
  ( (array!61948 (arr!29831 (Array (_ BitVec 32) (_ BitVec 64))) (size!30310 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61947)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984457 (= res!658744 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29831 _keys!1544) from!1932))))))

(declare-datatypes ((V!35627 0))(
  ( (V!35628 (val!11542 Int)) )
))
(declare-datatypes ((ValueCell!11010 0))(
  ( (ValueCellFull!11010 (v!14104 V!35627)) (EmptyCell!11010) )
))
(declare-datatypes ((array!61949 0))(
  ( (array!61950 (arr!29832 (Array (_ BitVec 32) ValueCell!11010)) (size!30311 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61949)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436825 () V!35627)

(declare-fun get!15472 (ValueCell!11010 V!35627) V!35627)

(declare-fun dynLambda!1817 (Int (_ BitVec 64)) V!35627)

(assert (=> b!984457 (= lt!436825 (get!15472 (select (arr!29832 _values!1278) from!1932) (dynLambda!1817 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35627)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14760 0))(
  ( (tuple2!14761 (_1!7391 (_ BitVec 64)) (_2!7391 V!35627)) )
))
(declare-datatypes ((List!20653 0))(
  ( (Nil!20650) (Cons!20649 (h!21811 tuple2!14760) (t!29478 List!20653)) )
))
(declare-datatypes ((ListLongMap!13457 0))(
  ( (ListLongMap!13458 (toList!6744 List!20653)) )
))
(declare-fun lt!436824 () ListLongMap!13457)

(declare-fun zeroValue!1220 () V!35627)

(declare-fun getCurrentListMapNoExtraKeys!3437 (array!61947 array!61949 (_ BitVec 32) (_ BitVec 32) V!35627 V!35627 (_ BitVec 32) Int) ListLongMap!13457)

(assert (=> b!984457 (= lt!436824 (getCurrentListMapNoExtraKeys!3437 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36503 () Bool)

(declare-fun mapRes!36503 () Bool)

(assert (=> mapIsEmpty!36503 mapRes!36503))

(declare-fun b!984458 () Bool)

(declare-fun res!658746 () Bool)

(assert (=> b!984458 (=> (not res!658746) (not e!554972))))

(assert (=> b!984458 (= res!658746 (and (= (size!30311 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30310 _keys!1544) (size!30311 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984459 () Bool)

(declare-fun e!554971 () Bool)

(declare-fun e!554974 () Bool)

(assert (=> b!984459 (= e!554971 (and e!554974 mapRes!36503))))

(declare-fun condMapEmpty!36503 () Bool)

(declare-fun mapDefault!36503 () ValueCell!11010)

(assert (=> b!984459 (= condMapEmpty!36503 (= (arr!29832 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11010)) mapDefault!36503)))))

(declare-fun res!658749 () Bool)

(assert (=> start!84180 (=> (not res!658749) (not e!554972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84180 (= res!658749 (validMask!0 mask!1948))))

(assert (=> start!84180 e!554972))

(assert (=> start!84180 true))

(declare-fun tp_is_empty!22983 () Bool)

(assert (=> start!84180 tp_is_empty!22983))

(declare-fun array_inv!23065 (array!61949) Bool)

(assert (=> start!84180 (and (array_inv!23065 _values!1278) e!554971)))

(assert (=> start!84180 tp!69247))

(declare-fun array_inv!23066 (array!61947) Bool)

(assert (=> start!84180 (array_inv!23066 _keys!1544)))

(declare-fun mapNonEmpty!36503 () Bool)

(declare-fun tp!69246 () Bool)

(declare-fun e!554975 () Bool)

(assert (=> mapNonEmpty!36503 (= mapRes!36503 (and tp!69246 e!554975))))

(declare-fun mapRest!36503 () (Array (_ BitVec 32) ValueCell!11010))

(declare-fun mapKey!36503 () (_ BitVec 32))

(declare-fun mapValue!36503 () ValueCell!11010)

(assert (=> mapNonEmpty!36503 (= (arr!29832 _values!1278) (store mapRest!36503 mapKey!36503 mapValue!36503))))

(declare-fun b!984460 () Bool)

(assert (=> b!984460 (= e!554975 tp_is_empty!22983)))

(declare-fun b!984461 () Bool)

(declare-fun res!658747 () Bool)

(assert (=> b!984461 (=> (not res!658747) (not e!554972))))

(assert (=> b!984461 (= res!658747 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30310 _keys!1544))))))

(declare-fun b!984462 () Bool)

(assert (=> b!984462 (= e!554974 tp_is_empty!22983)))

(declare-fun b!984463 () Bool)

(declare-fun res!658745 () Bool)

(assert (=> b!984463 (=> (not res!658745) (not e!554972))))

(declare-datatypes ((List!20654 0))(
  ( (Nil!20651) (Cons!20650 (h!21812 (_ BitVec 64)) (t!29479 List!20654)) )
))
(declare-fun arrayNoDuplicates!0 (array!61947 (_ BitVec 32) List!20654) Bool)

(assert (=> b!984463 (= res!658745 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20651))))

(declare-fun b!984464 () Bool)

(declare-fun res!658748 () Bool)

(assert (=> b!984464 (=> (not res!658748) (not e!554972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61947 (_ BitVec 32)) Bool)

(assert (=> b!984464 (= res!658748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984465 () Bool)

(declare-fun res!658751 () Bool)

(assert (=> b!984465 (=> (not res!658751) (not e!554972))))

(assert (=> b!984465 (= res!658751 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984466 () Bool)

(declare-fun res!658750 () Bool)

(assert (=> b!984466 (=> (not res!658750) (not e!554972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984466 (= res!658750 (validKeyInArray!0 (select (arr!29831 _keys!1544) from!1932)))))

(declare-fun b!984467 () Bool)

(assert (=> b!984467 (= e!554976 (not true))))

(declare-fun lt!436822 () tuple2!14760)

(declare-fun lt!436826 () tuple2!14760)

(declare-fun +!3036 (ListLongMap!13457 tuple2!14760) ListLongMap!13457)

(assert (=> b!984467 (= (+!3036 (+!3036 lt!436824 lt!436822) lt!436826) (+!3036 (+!3036 lt!436824 lt!436826) lt!436822))))

(assert (=> b!984467 (= lt!436826 (tuple2!14761 (select (arr!29831 _keys!1544) from!1932) lt!436825))))

(assert (=> b!984467 (= lt!436822 (tuple2!14761 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32711 0))(
  ( (Unit!32712) )
))
(declare-fun lt!436823 () Unit!32711)

(declare-fun addCommutativeForDiffKeys!664 (ListLongMap!13457 (_ BitVec 64) V!35627 (_ BitVec 64) V!35627) Unit!32711)

(assert (=> b!984467 (= lt!436823 (addCommutativeForDiffKeys!664 lt!436824 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29831 _keys!1544) from!1932) lt!436825))))

(assert (= (and start!84180 res!658749) b!984458))

(assert (= (and b!984458 res!658746) b!984464))

(assert (= (and b!984464 res!658748) b!984463))

(assert (= (and b!984463 res!658745) b!984461))

(assert (= (and b!984461 res!658747) b!984466))

(assert (= (and b!984466 res!658750) b!984465))

(assert (= (and b!984465 res!658751) b!984457))

(assert (= (and b!984457 res!658744) b!984467))

(assert (= (and b!984459 condMapEmpty!36503) mapIsEmpty!36503))

(assert (= (and b!984459 (not condMapEmpty!36503)) mapNonEmpty!36503))

(get-info :version)

(assert (= (and mapNonEmpty!36503 ((_ is ValueCellFull!11010) mapValue!36503)) b!984460))

(assert (= (and b!984459 ((_ is ValueCellFull!11010) mapDefault!36503)) b!984462))

(assert (= start!84180 b!984459))

(declare-fun b_lambda!14913 () Bool)

(assert (=> (not b_lambda!14913) (not b!984457)))

(declare-fun t!29477 () Bool)

(declare-fun tb!6675 () Bool)

(assert (=> (and start!84180 (= defaultEntry!1281 defaultEntry!1281) t!29477) tb!6675))

(declare-fun result!13339 () Bool)

(assert (=> tb!6675 (= result!13339 tp_is_empty!22983)))

(assert (=> b!984457 t!29477))

(declare-fun b_and!31841 () Bool)

(assert (= b_and!31839 (and (=> t!29477 result!13339) b_and!31841)))

(declare-fun m!911543 () Bool)

(assert (=> start!84180 m!911543))

(declare-fun m!911545 () Bool)

(assert (=> start!84180 m!911545))

(declare-fun m!911547 () Bool)

(assert (=> start!84180 m!911547))

(declare-fun m!911549 () Bool)

(assert (=> b!984466 m!911549))

(assert (=> b!984466 m!911549))

(declare-fun m!911551 () Bool)

(assert (=> b!984466 m!911551))

(assert (=> b!984457 m!911549))

(declare-fun m!911553 () Bool)

(assert (=> b!984457 m!911553))

(declare-fun m!911555 () Bool)

(assert (=> b!984457 m!911555))

(declare-fun m!911557 () Bool)

(assert (=> b!984457 m!911557))

(assert (=> b!984457 m!911553))

(assert (=> b!984457 m!911557))

(declare-fun m!911559 () Bool)

(assert (=> b!984457 m!911559))

(declare-fun m!911561 () Bool)

(assert (=> b!984463 m!911561))

(declare-fun m!911563 () Bool)

(assert (=> b!984464 m!911563))

(declare-fun m!911565 () Bool)

(assert (=> mapNonEmpty!36503 m!911565))

(declare-fun m!911567 () Bool)

(assert (=> b!984467 m!911567))

(declare-fun m!911569 () Bool)

(assert (=> b!984467 m!911569))

(assert (=> b!984467 m!911549))

(assert (=> b!984467 m!911549))

(declare-fun m!911571 () Bool)

(assert (=> b!984467 m!911571))

(declare-fun m!911573 () Bool)

(assert (=> b!984467 m!911573))

(declare-fun m!911575 () Bool)

(assert (=> b!984467 m!911575))

(assert (=> b!984467 m!911567))

(assert (=> b!984467 m!911573))

(check-sat (not b!984463) (not b!984466) (not b_lambda!14913) (not start!84180) tp_is_empty!22983 (not b!984467) b_and!31841 (not b!984457) (not b!984464) (not mapNonEmpty!36503) (not b_next!19881))
(check-sat b_and!31841 (not b_next!19881))
