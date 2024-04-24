; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112884 () Bool)

(assert start!112884)

(declare-fun b_free!30997 () Bool)

(declare-fun b_next!30997 () Bool)

(assert (=> start!112884 (= b_free!30997 (not b_next!30997))))

(declare-fun tp!108632 () Bool)

(declare-fun b_and!49933 () Bool)

(assert (=> start!112884 (= tp!108632 b_and!49933)))

(declare-fun b!1337552 () Bool)

(declare-fun res!887299 () Bool)

(declare-fun e!761848 () Bool)

(assert (=> b!1337552 (=> (not res!887299) (not e!761848))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1337552 (= res!887299 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337553 () Bool)

(declare-fun res!887297 () Bool)

(assert (=> b!1337553 (=> (not res!887297) (not e!761848))))

(declare-datatypes ((array!90787 0))(
  ( (array!90788 (arr!43854 (Array (_ BitVec 32) (_ BitVec 64))) (size!44405 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90787)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90787 (_ BitVec 32)) Bool)

(assert (=> b!1337553 (= res!887297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337554 () Bool)

(declare-fun res!887293 () Bool)

(assert (=> b!1337554 (=> (not res!887293) (not e!761848))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337554 (= res!887293 (validKeyInArray!0 (select (arr!43854 _keys!1590) from!1980)))))

(declare-fun b!1337555 () Bool)

(declare-fun res!887296 () Bool)

(assert (=> b!1337555 (=> (not res!887296) (not e!761848))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1337555 (= res!887296 (not (= (select (arr!43854 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337556 () Bool)

(declare-fun res!887298 () Bool)

(assert (=> b!1337556 (=> (not res!887298) (not e!761848))))

(assert (=> b!1337556 (= res!887298 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44405 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337557 () Bool)

(declare-fun e!761845 () Bool)

(declare-fun e!761844 () Bool)

(declare-fun mapRes!57038 () Bool)

(assert (=> b!1337557 (= e!761845 (and e!761844 mapRes!57038))))

(declare-fun condMapEmpty!57038 () Bool)

(declare-datatypes ((V!54313 0))(
  ( (V!54314 (val!18528 Int)) )
))
(declare-datatypes ((ValueCell!17555 0))(
  ( (ValueCellFull!17555 (v!21163 V!54313)) (EmptyCell!17555) )
))
(declare-datatypes ((array!90789 0))(
  ( (array!90790 (arr!43855 (Array (_ BitVec 32) ValueCell!17555)) (size!44406 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90789)

(declare-fun mapDefault!57038 () ValueCell!17555)

(assert (=> b!1337557 (= condMapEmpty!57038 (= (arr!43855 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17555)) mapDefault!57038)))))

(declare-fun mapNonEmpty!57038 () Bool)

(declare-fun tp!108631 () Bool)

(declare-fun e!761846 () Bool)

(assert (=> mapNonEmpty!57038 (= mapRes!57038 (and tp!108631 e!761846))))

(declare-fun mapValue!57038 () ValueCell!17555)

(declare-fun mapRest!57038 () (Array (_ BitVec 32) ValueCell!17555))

(declare-fun mapKey!57038 () (_ BitVec 32))

(assert (=> mapNonEmpty!57038 (= (arr!43855 _values!1320) (store mapRest!57038 mapKey!57038 mapValue!57038))))

(declare-fun b!1337558 () Bool)

(declare-fun res!887295 () Bool)

(assert (=> b!1337558 (=> (not res!887295) (not e!761848))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54313)

(declare-fun zeroValue!1262 () V!54313)

(declare-datatypes ((tuple2!23932 0))(
  ( (tuple2!23933 (_1!11977 (_ BitVec 64)) (_2!11977 V!54313)) )
))
(declare-datatypes ((List!31078 0))(
  ( (Nil!31075) (Cons!31074 (h!32292 tuple2!23932) (t!45348 List!31078)) )
))
(declare-datatypes ((ListLongMap!21597 0))(
  ( (ListLongMap!21598 (toList!10814 List!31078)) )
))
(declare-fun contains!8991 (ListLongMap!21597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5771 (array!90787 array!90789 (_ BitVec 32) (_ BitVec 32) V!54313 V!54313 (_ BitVec 32) Int) ListLongMap!21597)

(assert (=> b!1337558 (= res!887295 (contains!8991 (getCurrentListMap!5771 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1337559 () Bool)

(assert (=> b!1337559 (= e!761848 (not true))))

(declare-fun lt!593221 () ListLongMap!21597)

(assert (=> b!1337559 (contains!8991 lt!593221 k0!1153)))

(declare-datatypes ((Unit!43843 0))(
  ( (Unit!43844) )
))
(declare-fun lt!593220 () Unit!43843)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!302 ((_ BitVec 64) (_ BitVec 64) V!54313 ListLongMap!21597) Unit!43843)

(assert (=> b!1337559 (= lt!593220 (lemmaInListMapAfterAddingDiffThenInBefore!302 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!593221))))

(declare-fun +!4767 (ListLongMap!21597 tuple2!23932) ListLongMap!21597)

(declare-fun getCurrentListMapNoExtraKeys!6416 (array!90787 array!90789 (_ BitVec 32) (_ BitVec 32) V!54313 V!54313 (_ BitVec 32) Int) ListLongMap!21597)

(declare-fun get!22135 (ValueCell!17555 V!54313) V!54313)

(declare-fun dynLambda!3721 (Int (_ BitVec 64)) V!54313)

(assert (=> b!1337559 (= lt!593221 (+!4767 (getCurrentListMapNoExtraKeys!6416 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23933 (select (arr!43854 _keys!1590) from!1980) (get!22135 (select (arr!43855 _values!1320) from!1980) (dynLambda!3721 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1337560 () Bool)

(declare-fun res!887294 () Bool)

(assert (=> b!1337560 (=> (not res!887294) (not e!761848))))

(assert (=> b!1337560 (= res!887294 (and (= (size!44406 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44405 _keys!1590) (size!44406 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57038 () Bool)

(assert (=> mapIsEmpty!57038 mapRes!57038))

(declare-fun res!887292 () Bool)

(assert (=> start!112884 (=> (not res!887292) (not e!761848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112884 (= res!887292 (validMask!0 mask!1998))))

(assert (=> start!112884 e!761848))

(declare-fun array_inv!33339 (array!90789) Bool)

(assert (=> start!112884 (and (array_inv!33339 _values!1320) e!761845)))

(assert (=> start!112884 true))

(declare-fun array_inv!33340 (array!90787) Bool)

(assert (=> start!112884 (array_inv!33340 _keys!1590)))

(assert (=> start!112884 tp!108632))

(declare-fun tp_is_empty!36907 () Bool)

(assert (=> start!112884 tp_is_empty!36907))

(declare-fun b!1337561 () Bool)

(assert (=> b!1337561 (= e!761844 tp_is_empty!36907)))

(declare-fun b!1337562 () Bool)

(assert (=> b!1337562 (= e!761846 tp_is_empty!36907)))

(declare-fun b!1337563 () Bool)

(declare-fun res!887291 () Bool)

(assert (=> b!1337563 (=> (not res!887291) (not e!761848))))

(declare-datatypes ((List!31079 0))(
  ( (Nil!31076) (Cons!31075 (h!32293 (_ BitVec 64)) (t!45349 List!31079)) )
))
(declare-fun arrayNoDuplicates!0 (array!90787 (_ BitVec 32) List!31079) Bool)

(assert (=> b!1337563 (= res!887291 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31076))))

(assert (= (and start!112884 res!887292) b!1337560))

(assert (= (and b!1337560 res!887294) b!1337553))

(assert (= (and b!1337553 res!887297) b!1337563))

(assert (= (and b!1337563 res!887291) b!1337556))

(assert (= (and b!1337556 res!887298) b!1337558))

(assert (= (and b!1337558 res!887295) b!1337555))

(assert (= (and b!1337555 res!887296) b!1337554))

(assert (= (and b!1337554 res!887293) b!1337552))

(assert (= (and b!1337552 res!887299) b!1337559))

(assert (= (and b!1337557 condMapEmpty!57038) mapIsEmpty!57038))

(assert (= (and b!1337557 (not condMapEmpty!57038)) mapNonEmpty!57038))

(get-info :version)

(assert (= (and mapNonEmpty!57038 ((_ is ValueCellFull!17555) mapValue!57038)) b!1337562))

(assert (= (and b!1337557 ((_ is ValueCellFull!17555) mapDefault!57038)) b!1337561))

(assert (= start!112884 b!1337557))

(declare-fun b_lambda!24149 () Bool)

(assert (=> (not b_lambda!24149) (not b!1337559)))

(declare-fun t!45347 () Bool)

(declare-fun tb!12073 () Bool)

(assert (=> (and start!112884 (= defaultEntry!1323 defaultEntry!1323) t!45347) tb!12073))

(declare-fun result!25227 () Bool)

(assert (=> tb!12073 (= result!25227 tp_is_empty!36907)))

(assert (=> b!1337559 t!45347))

(declare-fun b_and!49935 () Bool)

(assert (= b_and!49933 (and (=> t!45347 result!25227) b_and!49935)))

(declare-fun m!1225959 () Bool)

(assert (=> b!1337555 m!1225959))

(assert (=> b!1337554 m!1225959))

(assert (=> b!1337554 m!1225959))

(declare-fun m!1225961 () Bool)

(assert (=> b!1337554 m!1225961))

(declare-fun m!1225963 () Bool)

(assert (=> start!112884 m!1225963))

(declare-fun m!1225965 () Bool)

(assert (=> start!112884 m!1225965))

(declare-fun m!1225967 () Bool)

(assert (=> start!112884 m!1225967))

(declare-fun m!1225969 () Bool)

(assert (=> b!1337559 m!1225969))

(declare-fun m!1225971 () Bool)

(assert (=> b!1337559 m!1225971))

(declare-fun m!1225973 () Bool)

(assert (=> b!1337559 m!1225973))

(declare-fun m!1225975 () Bool)

(assert (=> b!1337559 m!1225975))

(declare-fun m!1225977 () Bool)

(assert (=> b!1337559 m!1225977))

(declare-fun m!1225979 () Bool)

(assert (=> b!1337559 m!1225979))

(assert (=> b!1337559 m!1225969))

(assert (=> b!1337559 m!1225973))

(assert (=> b!1337559 m!1225959))

(declare-fun m!1225981 () Bool)

(assert (=> b!1337559 m!1225981))

(assert (=> b!1337559 m!1225975))

(declare-fun m!1225983 () Bool)

(assert (=> b!1337558 m!1225983))

(assert (=> b!1337558 m!1225983))

(declare-fun m!1225985 () Bool)

(assert (=> b!1337558 m!1225985))

(declare-fun m!1225987 () Bool)

(assert (=> b!1337553 m!1225987))

(declare-fun m!1225989 () Bool)

(assert (=> mapNonEmpty!57038 m!1225989))

(declare-fun m!1225991 () Bool)

(assert (=> b!1337563 m!1225991))

(check-sat (not b!1337553) (not mapNonEmpty!57038) tp_is_empty!36907 (not start!112884) (not b!1337558) (not b_lambda!24149) (not b!1337554) (not b!1337559) b_and!49935 (not b!1337563) (not b_next!30997))
(check-sat b_and!49935 (not b_next!30997))
