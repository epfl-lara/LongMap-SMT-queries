; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78888 () Bool)

(assert start!78888)

(declare-fun b_free!16933 () Bool)

(declare-fun b_next!16933 () Bool)

(assert (=> start!78888 (= b_free!16933 (not b_next!16933))))

(declare-fun tp!59241 () Bool)

(declare-fun b_and!27613 () Bool)

(assert (=> start!78888 (= tp!59241 b_and!27613)))

(declare-fun b!919109 () Bool)

(declare-fun res!619410 () Bool)

(declare-fun e!516039 () Bool)

(assert (=> b!919109 (=> (not res!619410) (not e!516039))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919109 (= res!619410 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919110 () Bool)

(declare-fun e!516042 () Bool)

(assert (=> b!919110 (= e!516042 e!516039)))

(declare-fun res!619408 () Bool)

(assert (=> b!919110 (=> (not res!619408) (not e!516039))))

(declare-datatypes ((V!30887 0))(
  ( (V!30888 (val!9771 Int)) )
))
(declare-datatypes ((tuple2!12662 0))(
  ( (tuple2!12663 (_1!6342 (_ BitVec 64)) (_2!6342 V!30887)) )
))
(declare-datatypes ((List!18482 0))(
  ( (Nil!18479) (Cons!18478 (h!19630 tuple2!12662) (t!26137 List!18482)) )
))
(declare-datatypes ((ListLongMap!11361 0))(
  ( (ListLongMap!11362 (toList!5696 List!18482)) )
))
(declare-fun lt!412542 () ListLongMap!11361)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4750 (ListLongMap!11361 (_ BitVec 64)) Bool)

(assert (=> b!919110 (= res!619408 (contains!4750 lt!412542 k0!1099))))

(declare-datatypes ((array!54913 0))(
  ( (array!54914 (arr!26397 (Array (_ BitVec 32) (_ BitVec 64))) (size!26857 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54913)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9239 0))(
  ( (ValueCellFull!9239 (v!12286 V!30887)) (EmptyCell!9239) )
))
(declare-datatypes ((array!54915 0))(
  ( (array!54916 (arr!26398 (Array (_ BitVec 32) ValueCell!9239)) (size!26858 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54915)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30887)

(declare-fun minValue!1173 () V!30887)

(declare-fun getCurrentListMap!2950 (array!54913 array!54915 (_ BitVec 32) (_ BitVec 32) V!30887 V!30887 (_ BitVec 32) Int) ListLongMap!11361)

(assert (=> b!919110 (= lt!412542 (getCurrentListMap!2950 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919111 () Bool)

(declare-fun res!619411 () Bool)

(assert (=> b!919111 (=> (not res!619411) (not e!516039))))

(declare-fun v!791 () V!30887)

(declare-fun apply!573 (ListLongMap!11361 (_ BitVec 64)) V!30887)

(assert (=> b!919111 (= res!619411 (= (apply!573 lt!412542 k0!1099) v!791))))

(declare-fun b!919112 () Bool)

(declare-fun res!619404 () Bool)

(assert (=> b!919112 (=> (not res!619404) (not e!516042))))

(assert (=> b!919112 (= res!619404 (and (= (size!26858 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26857 _keys!1487) (size!26858 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919113 () Bool)

(declare-fun res!619406 () Bool)

(assert (=> b!919113 (=> (not res!619406) (not e!516042))))

(assert (=> b!919113 (= res!619406 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26857 _keys!1487))))))

(declare-fun b!919114 () Bool)

(declare-fun e!516043 () Bool)

(assert (=> b!919114 (= e!516039 e!516043)))

(declare-fun res!619407 () Bool)

(assert (=> b!919114 (=> (not res!619407) (not e!516043))))

(declare-fun lt!412544 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919114 (= res!619407 (validKeyInArray!0 lt!412544))))

(assert (=> b!919114 (= lt!412544 (select (arr!26397 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919115 () Bool)

(declare-fun res!619409 () Bool)

(assert (=> b!919115 (=> (not res!619409) (not e!516042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54913 (_ BitVec 32)) Bool)

(assert (=> b!919115 (= res!619409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919116 () Bool)

(declare-fun e!516041 () Bool)

(declare-fun tp_is_empty!19441 () Bool)

(assert (=> b!919116 (= e!516041 tp_is_empty!19441)))

(declare-fun b!919117 () Bool)

(declare-fun e!516037 () Bool)

(assert (=> b!919117 (= e!516037 tp_is_empty!19441)))

(declare-fun res!619412 () Bool)

(assert (=> start!78888 (=> (not res!619412) (not e!516042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78888 (= res!619412 (validMask!0 mask!1881))))

(assert (=> start!78888 e!516042))

(assert (=> start!78888 true))

(assert (=> start!78888 tp_is_empty!19441))

(declare-fun e!516038 () Bool)

(declare-fun array_inv!20674 (array!54915) Bool)

(assert (=> start!78888 (and (array_inv!20674 _values!1231) e!516038)))

(assert (=> start!78888 tp!59241))

(declare-fun array_inv!20675 (array!54913) Bool)

(assert (=> start!78888 (array_inv!20675 _keys!1487)))

(declare-fun mapNonEmpty!30918 () Bool)

(declare-fun mapRes!30918 () Bool)

(declare-fun tp!59240 () Bool)

(assert (=> mapNonEmpty!30918 (= mapRes!30918 (and tp!59240 e!516037))))

(declare-fun mapValue!30918 () ValueCell!9239)

(declare-fun mapKey!30918 () (_ BitVec 32))

(declare-fun mapRest!30918 () (Array (_ BitVec 32) ValueCell!9239))

(assert (=> mapNonEmpty!30918 (= (arr!26398 _values!1231) (store mapRest!30918 mapKey!30918 mapValue!30918))))

(declare-fun mapIsEmpty!30918 () Bool)

(assert (=> mapIsEmpty!30918 mapRes!30918))

(declare-fun b!919118 () Bool)

(assert (=> b!919118 (= e!516038 (and e!516041 mapRes!30918))))

(declare-fun condMapEmpty!30918 () Bool)

(declare-fun mapDefault!30918 () ValueCell!9239)

(assert (=> b!919118 (= condMapEmpty!30918 (= (arr!26398 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9239)) mapDefault!30918)))))

(declare-fun b!919119 () Bool)

(declare-fun res!619405 () Bool)

(assert (=> b!919119 (=> (not res!619405) (not e!516042))))

(declare-datatypes ((List!18483 0))(
  ( (Nil!18480) (Cons!18479 (h!19631 (_ BitVec 64)) (t!26138 List!18483)) )
))
(declare-fun arrayNoDuplicates!0 (array!54913 (_ BitVec 32) List!18483) Bool)

(assert (=> b!919119 (= res!619405 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18480))))

(declare-fun b!919120 () Bool)

(declare-fun res!619413 () Bool)

(assert (=> b!919120 (=> (not res!619413) (not e!516039))))

(assert (=> b!919120 (= res!619413 (validKeyInArray!0 k0!1099))))

(declare-fun b!919121 () Bool)

(assert (=> b!919121 (= e!516043 (not (bvsle from!1844 (size!26857 _keys!1487))))))

(declare-fun +!2638 (ListLongMap!11361 tuple2!12662) ListLongMap!11361)

(declare-fun get!13851 (ValueCell!9239 V!30887) V!30887)

(declare-fun dynLambda!1435 (Int (_ BitVec 64)) V!30887)

(assert (=> b!919121 (= (getCurrentListMap!2950 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2638 (getCurrentListMap!2950 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12663 lt!412544 (get!13851 (select (arr!26398 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1435 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30988 0))(
  ( (Unit!30989) )
))
(declare-fun lt!412543 () Unit!30988)

(declare-fun lemmaListMapRecursiveValidKeyArray!18 (array!54913 array!54915 (_ BitVec 32) (_ BitVec 32) V!30887 V!30887 (_ BitVec 32) Int) Unit!30988)

(assert (=> b!919121 (= lt!412543 (lemmaListMapRecursiveValidKeyArray!18 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!78888 res!619412) b!919112))

(assert (= (and b!919112 res!619404) b!919115))

(assert (= (and b!919115 res!619409) b!919119))

(assert (= (and b!919119 res!619405) b!919113))

(assert (= (and b!919113 res!619406) b!919110))

(assert (= (and b!919110 res!619408) b!919111))

(assert (= (and b!919111 res!619411) b!919109))

(assert (= (and b!919109 res!619410) b!919120))

(assert (= (and b!919120 res!619413) b!919114))

(assert (= (and b!919114 res!619407) b!919121))

(assert (= (and b!919118 condMapEmpty!30918) mapIsEmpty!30918))

(assert (= (and b!919118 (not condMapEmpty!30918)) mapNonEmpty!30918))

(get-info :version)

(assert (= (and mapNonEmpty!30918 ((_ is ValueCellFull!9239) mapValue!30918)) b!919117))

(assert (= (and b!919118 ((_ is ValueCellFull!9239) mapDefault!30918)) b!919116))

(assert (= start!78888 b!919118))

(declare-fun b_lambda!13449 () Bool)

(assert (=> (not b_lambda!13449) (not b!919121)))

(declare-fun t!26136 () Bool)

(declare-fun tb!5505 () Bool)

(assert (=> (and start!78888 (= defaultEntry!1235 defaultEntry!1235) t!26136) tb!5505))

(declare-fun result!10841 () Bool)

(assert (=> tb!5505 (= result!10841 tp_is_empty!19441)))

(assert (=> b!919121 t!26136))

(declare-fun b_and!27615 () Bool)

(assert (= b_and!27613 (and (=> t!26136 result!10841) b_and!27615)))

(declare-fun m!853189 () Bool)

(assert (=> b!919119 m!853189))

(declare-fun m!853191 () Bool)

(assert (=> b!919111 m!853191))

(declare-fun m!853193 () Bool)

(assert (=> b!919120 m!853193))

(declare-fun m!853195 () Bool)

(assert (=> mapNonEmpty!30918 m!853195))

(declare-fun m!853197 () Bool)

(assert (=> b!919115 m!853197))

(declare-fun m!853199 () Bool)

(assert (=> b!919121 m!853199))

(assert (=> b!919121 m!853199))

(declare-fun m!853201 () Bool)

(assert (=> b!919121 m!853201))

(declare-fun m!853203 () Bool)

(assert (=> b!919121 m!853203))

(declare-fun m!853205 () Bool)

(assert (=> b!919121 m!853205))

(declare-fun m!853207 () Bool)

(assert (=> b!919121 m!853207))

(declare-fun m!853209 () Bool)

(assert (=> b!919121 m!853209))

(assert (=> b!919121 m!853201))

(assert (=> b!919121 m!853207))

(declare-fun m!853211 () Bool)

(assert (=> b!919121 m!853211))

(declare-fun m!853213 () Bool)

(assert (=> b!919114 m!853213))

(declare-fun m!853215 () Bool)

(assert (=> b!919114 m!853215))

(declare-fun m!853217 () Bool)

(assert (=> b!919110 m!853217))

(declare-fun m!853219 () Bool)

(assert (=> b!919110 m!853219))

(declare-fun m!853221 () Bool)

(assert (=> start!78888 m!853221))

(declare-fun m!853223 () Bool)

(assert (=> start!78888 m!853223))

(declare-fun m!853225 () Bool)

(assert (=> start!78888 m!853225))

(check-sat (not start!78888) (not b_next!16933) (not mapNonEmpty!30918) (not b!919114) (not b!919120) (not b!919115) (not b!919110) (not b!919121) (not b!919119) (not b!919111) b_and!27615 tp_is_empty!19441 (not b_lambda!13449))
(check-sat b_and!27615 (not b_next!16933))
