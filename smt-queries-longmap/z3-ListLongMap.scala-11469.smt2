; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133614 () Bool)

(assert start!133614)

(declare-fun b_free!32031 () Bool)

(declare-fun b_next!32031 () Bool)

(assert (=> start!133614 (= b_free!32031 (not b_next!32031))))

(declare-fun tp!113217 () Bool)

(declare-fun b_and!51573 () Bool)

(assert (=> start!133614 (= tp!113217 b_and!51573)))

(declare-fun b!1562234 () Bool)

(declare-fun res!1068124 () Bool)

(declare-fun e!870568 () Bool)

(assert (=> b!1562234 (=> (not res!1068124) (not e!870568))))

(declare-datatypes ((array!104110 0))(
  ( (array!104111 (arr!50247 (Array (_ BitVec 32) (_ BitVec 64))) (size!50797 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104110)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104110 (_ BitVec 32)) Bool)

(assert (=> b!1562234 (= res!1068124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562235 () Bool)

(declare-fun e!870566 () Bool)

(declare-fun tp_is_empty!38697 () Bool)

(assert (=> b!1562235 (= e!870566 tp_is_empty!38697)))

(declare-fun b!1562236 () Bool)

(declare-fun res!1068121 () Bool)

(assert (=> b!1562236 (=> (not res!1068121) (not e!870568))))

(declare-datatypes ((List!36473 0))(
  ( (Nil!36470) (Cons!36469 (h!37915 (_ BitVec 64)) (t!51294 List!36473)) )
))
(declare-fun arrayNoDuplicates!0 (array!104110 (_ BitVec 32) List!36473) Bool)

(assert (=> b!1562236 (= res!1068121 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36470))))

(declare-fun res!1068125 () Bool)

(assert (=> start!133614 (=> (not res!1068125) (not e!870568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133614 (= res!1068125 (validMask!0 mask!947))))

(assert (=> start!133614 e!870568))

(assert (=> start!133614 tp!113217))

(assert (=> start!133614 tp_is_empty!38697))

(assert (=> start!133614 true))

(declare-fun array_inv!39055 (array!104110) Bool)

(assert (=> start!133614 (array_inv!39055 _keys!637)))

(declare-datatypes ((V!59803 0))(
  ( (V!59804 (val!19432 Int)) )
))
(declare-datatypes ((ValueCell!18318 0))(
  ( (ValueCellFull!18318 (v!22184 V!59803)) (EmptyCell!18318) )
))
(declare-datatypes ((array!104112 0))(
  ( (array!104113 (arr!50248 (Array (_ BitVec 32) ValueCell!18318)) (size!50798 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104112)

(declare-fun e!870565 () Bool)

(declare-fun array_inv!39056 (array!104112) Bool)

(assert (=> start!133614 (and (array_inv!39056 _values!487) e!870565)))

(declare-fun b!1562237 () Bool)

(declare-fun res!1068123 () Bool)

(assert (=> b!1562237 (=> (not res!1068123) (not e!870568))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562237 (= res!1068123 (and (= (size!50798 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50797 _keys!637) (size!50798 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562238 () Bool)

(declare-fun res!1068126 () Bool)

(assert (=> b!1562238 (=> (not res!1068126) (not e!870568))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562238 (= res!1068126 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50797 _keys!637)) (bvslt from!782 (size!50797 _keys!637))))))

(declare-fun b!1562239 () Bool)

(assert (=> b!1562239 (= e!870568 (not true))))

(declare-fun lt!671559 () Bool)

(declare-datatypes ((tuple2!25102 0))(
  ( (tuple2!25103 (_1!12562 (_ BitVec 64)) (_2!12562 V!59803)) )
))
(declare-datatypes ((List!36474 0))(
  ( (Nil!36471) (Cons!36470 (h!37916 tuple2!25102) (t!51295 List!36474)) )
))
(declare-datatypes ((ListLongMap!22537 0))(
  ( (ListLongMap!22538 (toList!11284 List!36474)) )
))
(declare-fun lt!671557 () ListLongMap!22537)

(declare-fun contains!10274 (ListLongMap!22537 (_ BitVec 64)) Bool)

(assert (=> b!1562239 (= lt!671559 (contains!10274 lt!671557 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562239 (not (contains!10274 lt!671557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671556 () V!59803)

(declare-fun lt!671558 () ListLongMap!22537)

(declare-fun +!5054 (ListLongMap!22537 tuple2!25102) ListLongMap!22537)

(assert (=> b!1562239 (= lt!671557 (+!5054 lt!671558 (tuple2!25103 (select (arr!50247 _keys!637) from!782) lt!671556)))))

(declare-datatypes ((Unit!51962 0))(
  ( (Unit!51963) )
))
(declare-fun lt!671555 () Unit!51962)

(declare-fun addStillNotContains!544 (ListLongMap!22537 (_ BitVec 64) V!59803 (_ BitVec 64)) Unit!51962)

(assert (=> b!1562239 (= lt!671555 (addStillNotContains!544 lt!671558 (select (arr!50247 _keys!637) from!782) lt!671556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26241 (ValueCell!18318 V!59803) V!59803)

(declare-fun dynLambda!3838 (Int (_ BitVec 64)) V!59803)

(assert (=> b!1562239 (= lt!671556 (get!26241 (select (arr!50248 _values!487) from!782) (dynLambda!3838 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59803)

(declare-fun minValue!453 () V!59803)

(declare-fun getCurrentListMapNoExtraKeys!6668 (array!104110 array!104112 (_ BitVec 32) (_ BitVec 32) V!59803 V!59803 (_ BitVec 32) Int) ListLongMap!22537)

(assert (=> b!1562239 (= lt!671558 (getCurrentListMapNoExtraKeys!6668 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59421 () Bool)

(declare-fun mapRes!59421 () Bool)

(assert (=> mapIsEmpty!59421 mapRes!59421))

(declare-fun b!1562240 () Bool)

(declare-fun e!870564 () Bool)

(assert (=> b!1562240 (= e!870565 (and e!870564 mapRes!59421))))

(declare-fun condMapEmpty!59421 () Bool)

(declare-fun mapDefault!59421 () ValueCell!18318)

(assert (=> b!1562240 (= condMapEmpty!59421 (= (arr!50248 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18318)) mapDefault!59421)))))

(declare-fun mapNonEmpty!59421 () Bool)

(declare-fun tp!113216 () Bool)

(assert (=> mapNonEmpty!59421 (= mapRes!59421 (and tp!113216 e!870566))))

(declare-fun mapRest!59421 () (Array (_ BitVec 32) ValueCell!18318))

(declare-fun mapValue!59421 () ValueCell!18318)

(declare-fun mapKey!59421 () (_ BitVec 32))

(assert (=> mapNonEmpty!59421 (= (arr!50248 _values!487) (store mapRest!59421 mapKey!59421 mapValue!59421))))

(declare-fun b!1562241 () Bool)

(assert (=> b!1562241 (= e!870564 tp_is_empty!38697)))

(declare-fun b!1562242 () Bool)

(declare-fun res!1068122 () Bool)

(assert (=> b!1562242 (=> (not res!1068122) (not e!870568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562242 (= res!1068122 (validKeyInArray!0 (select (arr!50247 _keys!637) from!782)))))

(assert (= (and start!133614 res!1068125) b!1562237))

(assert (= (and b!1562237 res!1068123) b!1562234))

(assert (= (and b!1562234 res!1068124) b!1562236))

(assert (= (and b!1562236 res!1068121) b!1562238))

(assert (= (and b!1562238 res!1068126) b!1562242))

(assert (= (and b!1562242 res!1068122) b!1562239))

(assert (= (and b!1562240 condMapEmpty!59421) mapIsEmpty!59421))

(assert (= (and b!1562240 (not condMapEmpty!59421)) mapNonEmpty!59421))

(get-info :version)

(assert (= (and mapNonEmpty!59421 ((_ is ValueCellFull!18318) mapValue!59421)) b!1562235))

(assert (= (and b!1562240 ((_ is ValueCellFull!18318) mapDefault!59421)) b!1562241))

(assert (= start!133614 b!1562240))

(declare-fun b_lambda!24905 () Bool)

(assert (=> (not b_lambda!24905) (not b!1562239)))

(declare-fun t!51293 () Bool)

(declare-fun tb!12575 () Bool)

(assert (=> (and start!133614 (= defaultEntry!495 defaultEntry!495) t!51293) tb!12575))

(declare-fun result!26431 () Bool)

(assert (=> tb!12575 (= result!26431 tp_is_empty!38697)))

(assert (=> b!1562239 t!51293))

(declare-fun b_and!51575 () Bool)

(assert (= b_and!51573 (and (=> t!51293 result!26431) b_and!51575)))

(declare-fun m!1437969 () Bool)

(assert (=> b!1562239 m!1437969))

(declare-fun m!1437971 () Bool)

(assert (=> b!1562239 m!1437971))

(declare-fun m!1437973 () Bool)

(assert (=> b!1562239 m!1437973))

(declare-fun m!1437975 () Bool)

(assert (=> b!1562239 m!1437975))

(declare-fun m!1437977 () Bool)

(assert (=> b!1562239 m!1437977))

(declare-fun m!1437979 () Bool)

(assert (=> b!1562239 m!1437979))

(assert (=> b!1562239 m!1437969))

(assert (=> b!1562239 m!1437975))

(declare-fun m!1437981 () Bool)

(assert (=> b!1562239 m!1437981))

(declare-fun m!1437983 () Bool)

(assert (=> b!1562239 m!1437983))

(assert (=> b!1562239 m!1437971))

(declare-fun m!1437985 () Bool)

(assert (=> b!1562239 m!1437985))

(declare-fun m!1437987 () Bool)

(assert (=> start!133614 m!1437987))

(declare-fun m!1437989 () Bool)

(assert (=> start!133614 m!1437989))

(declare-fun m!1437991 () Bool)

(assert (=> start!133614 m!1437991))

(declare-fun m!1437993 () Bool)

(assert (=> b!1562234 m!1437993))

(declare-fun m!1437995 () Bool)

(assert (=> mapNonEmpty!59421 m!1437995))

(declare-fun m!1437997 () Bool)

(assert (=> b!1562236 m!1437997))

(assert (=> b!1562242 m!1437971))

(assert (=> b!1562242 m!1437971))

(declare-fun m!1437999 () Bool)

(assert (=> b!1562242 m!1437999))

(check-sat (not b_next!32031) b_and!51575 (not b!1562236) (not b_lambda!24905) (not b!1562234) (not b!1562242) (not b!1562239) (not mapNonEmpty!59421) tp_is_empty!38697 (not start!133614))
(check-sat b_and!51575 (not b_next!32031))
