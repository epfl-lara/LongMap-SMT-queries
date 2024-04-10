; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84024 () Bool)

(assert start!84024)

(declare-fun b_free!19779 () Bool)

(declare-fun b_next!19779 () Bool)

(assert (=> start!84024 (= b_free!19779 (not b_next!19779))))

(declare-fun tp!68860 () Bool)

(declare-fun b_and!31641 () Bool)

(assert (=> start!84024 (= tp!68860 b_and!31641)))

(declare-fun mapIsEmpty!36269 () Bool)

(declare-fun mapRes!36269 () Bool)

(assert (=> mapIsEmpty!36269 mapRes!36269))

(declare-fun b!982174 () Bool)

(declare-fun e!553657 () Bool)

(declare-fun tp_is_empty!22827 () Bool)

(assert (=> b!982174 (= e!553657 tp_is_empty!22827)))

(declare-fun b!982175 () Bool)

(declare-fun res!657262 () Bool)

(declare-fun e!553660 () Bool)

(assert (=> b!982175 (=> (not res!657262) (not e!553660))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61647 0))(
  ( (array!61648 (arr!29681 (Array (_ BitVec 32) (_ BitVec 64))) (size!30160 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61647)

(assert (=> b!982175 (= res!657262 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30160 _keys!1544))))))

(declare-fun mapNonEmpty!36269 () Bool)

(declare-fun tp!68859 () Bool)

(assert (=> mapNonEmpty!36269 (= mapRes!36269 (and tp!68859 e!553657))))

(declare-datatypes ((V!35419 0))(
  ( (V!35420 (val!11464 Int)) )
))
(declare-datatypes ((ValueCell!10932 0))(
  ( (ValueCellFull!10932 (v!14026 V!35419)) (EmptyCell!10932) )
))
(declare-fun mapValue!36269 () ValueCell!10932)

(declare-datatypes ((array!61649 0))(
  ( (array!61650 (arr!29682 (Array (_ BitVec 32) ValueCell!10932)) (size!30161 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61649)

(declare-fun mapKey!36269 () (_ BitVec 32))

(declare-fun mapRest!36269 () (Array (_ BitVec 32) ValueCell!10932))

(assert (=> mapNonEmpty!36269 (= (arr!29682 _values!1278) (store mapRest!36269 mapKey!36269 mapValue!36269))))

(declare-fun res!657259 () Bool)

(assert (=> start!84024 (=> (not res!657259) (not e!553660))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84024 (= res!657259 (validMask!0 mask!1948))))

(assert (=> start!84024 e!553660))

(assert (=> start!84024 true))

(assert (=> start!84024 tp_is_empty!22827))

(declare-fun e!553661 () Bool)

(declare-fun array_inv!22951 (array!61649) Bool)

(assert (=> start!84024 (and (array_inv!22951 _values!1278) e!553661)))

(assert (=> start!84024 tp!68860))

(declare-fun array_inv!22952 (array!61647) Bool)

(assert (=> start!84024 (array_inv!22952 _keys!1544)))

(declare-fun b!982176 () Bool)

(declare-fun res!657265 () Bool)

(assert (=> b!982176 (=> (not res!657265) (not e!553660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61647 (_ BitVec 32)) Bool)

(assert (=> b!982176 (= res!657265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982177 () Bool)

(declare-fun e!553658 () Bool)

(assert (=> b!982177 (= e!553658 (not true))))

(declare-datatypes ((tuple2!14680 0))(
  ( (tuple2!14681 (_1!7351 (_ BitVec 64)) (_2!7351 V!35419)) )
))
(declare-datatypes ((List!20561 0))(
  ( (Nil!20558) (Cons!20557 (h!21719 tuple2!14680) (t!29290 List!20561)) )
))
(declare-datatypes ((ListLongMap!13377 0))(
  ( (ListLongMap!13378 (toList!6704 List!20561)) )
))
(declare-fun lt!436021 () ListLongMap!13377)

(declare-fun lt!436025 () tuple2!14680)

(declare-fun lt!436023 () tuple2!14680)

(declare-fun +!3002 (ListLongMap!13377 tuple2!14680) ListLongMap!13377)

(assert (=> b!982177 (= (+!3002 (+!3002 lt!436021 lt!436025) lt!436023) (+!3002 (+!3002 lt!436021 lt!436023) lt!436025))))

(declare-fun lt!436024 () V!35419)

(assert (=> b!982177 (= lt!436023 (tuple2!14681 (select (arr!29681 _keys!1544) from!1932) lt!436024))))

(declare-fun zeroValue!1220 () V!35419)

(assert (=> b!982177 (= lt!436025 (tuple2!14681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32643 0))(
  ( (Unit!32644) )
))
(declare-fun lt!436022 () Unit!32643)

(declare-fun addCommutativeForDiffKeys!630 (ListLongMap!13377 (_ BitVec 64) V!35419 (_ BitVec 64) V!35419) Unit!32643)

(assert (=> b!982177 (= lt!436022 (addCommutativeForDiffKeys!630 lt!436021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29681 _keys!1544) from!1932) lt!436024))))

(declare-fun b!982178 () Bool)

(declare-fun res!657264 () Bool)

(assert (=> b!982178 (=> (not res!657264) (not e!553660))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982178 (= res!657264 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982179 () Bool)

(declare-fun res!657261 () Bool)

(assert (=> b!982179 (=> (not res!657261) (not e!553660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982179 (= res!657261 (validKeyInArray!0 (select (arr!29681 _keys!1544) from!1932)))))

(declare-fun b!982180 () Bool)

(declare-fun e!553662 () Bool)

(assert (=> b!982180 (= e!553661 (and e!553662 mapRes!36269))))

(declare-fun condMapEmpty!36269 () Bool)

(declare-fun mapDefault!36269 () ValueCell!10932)

(assert (=> b!982180 (= condMapEmpty!36269 (= (arr!29682 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10932)) mapDefault!36269)))))

(declare-fun b!982181 () Bool)

(assert (=> b!982181 (= e!553660 e!553658)))

(declare-fun res!657260 () Bool)

(assert (=> b!982181 (=> (not res!657260) (not e!553658))))

(assert (=> b!982181 (= res!657260 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29681 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15390 (ValueCell!10932 V!35419) V!35419)

(declare-fun dynLambda!1787 (Int (_ BitVec 64)) V!35419)

(assert (=> b!982181 (= lt!436024 (get!15390 (select (arr!29682 _values!1278) from!1932) (dynLambda!1787 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35419)

(declare-fun getCurrentListMapNoExtraKeys!3404 (array!61647 array!61649 (_ BitVec 32) (_ BitVec 32) V!35419 V!35419 (_ BitVec 32) Int) ListLongMap!13377)

(assert (=> b!982181 (= lt!436021 (getCurrentListMapNoExtraKeys!3404 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982182 () Bool)

(declare-fun res!657263 () Bool)

(assert (=> b!982182 (=> (not res!657263) (not e!553660))))

(assert (=> b!982182 (= res!657263 (and (= (size!30161 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30160 _keys!1544) (size!30161 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982183 () Bool)

(assert (=> b!982183 (= e!553662 tp_is_empty!22827)))

(declare-fun b!982184 () Bool)

(declare-fun res!657266 () Bool)

(assert (=> b!982184 (=> (not res!657266) (not e!553660))))

(declare-datatypes ((List!20562 0))(
  ( (Nil!20559) (Cons!20558 (h!21720 (_ BitVec 64)) (t!29291 List!20562)) )
))
(declare-fun arrayNoDuplicates!0 (array!61647 (_ BitVec 32) List!20562) Bool)

(assert (=> b!982184 (= res!657266 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20559))))

(assert (= (and start!84024 res!657259) b!982182))

(assert (= (and b!982182 res!657263) b!982176))

(assert (= (and b!982176 res!657265) b!982184))

(assert (= (and b!982184 res!657266) b!982175))

(assert (= (and b!982175 res!657262) b!982179))

(assert (= (and b!982179 res!657261) b!982178))

(assert (= (and b!982178 res!657264) b!982181))

(assert (= (and b!982181 res!657260) b!982177))

(assert (= (and b!982180 condMapEmpty!36269) mapIsEmpty!36269))

(assert (= (and b!982180 (not condMapEmpty!36269)) mapNonEmpty!36269))

(get-info :version)

(assert (= (and mapNonEmpty!36269 ((_ is ValueCellFull!10932) mapValue!36269)) b!982174))

(assert (= (and b!982180 ((_ is ValueCellFull!10932) mapDefault!36269)) b!982183))

(assert (= start!84024 b!982180))

(declare-fun b_lambda!14817 () Bool)

(assert (=> (not b_lambda!14817) (not b!982181)))

(declare-fun t!29289 () Bool)

(declare-fun tb!6579 () Bool)

(assert (=> (and start!84024 (= defaultEntry!1281 defaultEntry!1281) t!29289) tb!6579))

(declare-fun result!13147 () Bool)

(assert (=> tb!6579 (= result!13147 tp_is_empty!22827)))

(assert (=> b!982181 t!29289))

(declare-fun b_and!31643 () Bool)

(assert (= b_and!31641 (and (=> t!29289 result!13147) b_and!31643)))

(declare-fun m!909521 () Bool)

(assert (=> b!982179 m!909521))

(assert (=> b!982179 m!909521))

(declare-fun m!909523 () Bool)

(assert (=> b!982179 m!909523))

(assert (=> b!982181 m!909521))

(declare-fun m!909525 () Bool)

(assert (=> b!982181 m!909525))

(declare-fun m!909527 () Bool)

(assert (=> b!982181 m!909527))

(declare-fun m!909529 () Bool)

(assert (=> b!982181 m!909529))

(assert (=> b!982181 m!909525))

(assert (=> b!982181 m!909529))

(declare-fun m!909531 () Bool)

(assert (=> b!982181 m!909531))

(declare-fun m!909533 () Bool)

(assert (=> mapNonEmpty!36269 m!909533))

(declare-fun m!909535 () Bool)

(assert (=> b!982184 m!909535))

(declare-fun m!909537 () Bool)

(assert (=> start!84024 m!909537))

(declare-fun m!909539 () Bool)

(assert (=> start!84024 m!909539))

(declare-fun m!909541 () Bool)

(assert (=> start!84024 m!909541))

(declare-fun m!909543 () Bool)

(assert (=> b!982177 m!909543))

(declare-fun m!909545 () Bool)

(assert (=> b!982177 m!909545))

(declare-fun m!909547 () Bool)

(assert (=> b!982177 m!909547))

(declare-fun m!909549 () Bool)

(assert (=> b!982177 m!909549))

(assert (=> b!982177 m!909543))

(assert (=> b!982177 m!909521))

(declare-fun m!909551 () Bool)

(assert (=> b!982177 m!909551))

(assert (=> b!982177 m!909521))

(assert (=> b!982177 m!909547))

(declare-fun m!909553 () Bool)

(assert (=> b!982176 m!909553))

(check-sat (not b!982181) (not b_lambda!14817) (not b!982184) (not mapNonEmpty!36269) tp_is_empty!22827 b_and!31643 (not b!982179) (not start!84024) (not b_next!19779) (not b!982177) (not b!982176))
(check-sat b_and!31643 (not b_next!19779))
