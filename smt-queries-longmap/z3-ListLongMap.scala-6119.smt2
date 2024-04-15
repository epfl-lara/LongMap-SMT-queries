; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78804 () Bool)

(assert start!78804)

(declare-fun b_free!17035 () Bool)

(declare-fun b_next!17035 () Bool)

(assert (=> start!78804 (= b_free!17035 (not b_next!17035))))

(declare-fun tp!59547 () Bool)

(declare-fun b_and!27781 () Bool)

(assert (=> start!78804 (= tp!59547 b_and!27781)))

(declare-fun b!920068 () Bool)

(declare-fun e!516386 () Bool)

(declare-fun e!516385 () Bool)

(assert (=> b!920068 (= e!516386 (not e!516385))))

(declare-fun res!620498 () Bool)

(assert (=> b!920068 (=> res!620498 e!516385)))

(declare-datatypes ((array!55043 0))(
  ( (array!55044 (arr!26467 (Array (_ BitVec 32) (_ BitVec 64))) (size!26928 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55043)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920068 (= res!620498 (or (bvsge (size!26928 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26928 _keys!1487))))))

(declare-fun e!516390 () Bool)

(assert (=> b!920068 e!516390))

(declare-fun c!95989 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!920068 (= c!95989 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31023 0))(
  ( (V!31024 (val!9822 Int)) )
))
(declare-datatypes ((ValueCell!9290 0))(
  ( (ValueCellFull!9290 (v!12339 V!31023)) (EmptyCell!9290) )
))
(declare-datatypes ((array!55045 0))(
  ( (array!55046 (arr!26468 (Array (_ BitVec 32) ValueCell!9290)) (size!26929 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55045)

(declare-datatypes ((Unit!30980 0))(
  ( (Unit!30981) )
))
(declare-fun lt!412918 () Unit!30980)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31023)

(declare-fun minValue!1173 () V!31023)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!172 (array!55043 array!55045 (_ BitVec 32) (_ BitVec 32) V!31023 V!31023 (_ BitVec 64) (_ BitVec 32) Int) Unit!30980)

(assert (=> b!920068 (= lt!412918 (lemmaListMapContainsThenArrayContainsFrom!172 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!18607 0))(
  ( (Nil!18604) (Cons!18603 (h!19749 (_ BitVec 64)) (t!26363 List!18607)) )
))
(declare-fun arrayNoDuplicates!0 (array!55043 (_ BitVec 32) List!18607) Bool)

(assert (=> b!920068 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18604)))

(declare-fun lt!412912 () Unit!30980)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55043 (_ BitVec 32) (_ BitVec 32)) Unit!30980)

(assert (=> b!920068 (= lt!412912 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12824 0))(
  ( (tuple2!12825 (_1!6423 (_ BitVec 64)) (_2!6423 V!31023)) )
))
(declare-datatypes ((List!18608 0))(
  ( (Nil!18605) (Cons!18604 (h!19750 tuple2!12824) (t!26364 List!18608)) )
))
(declare-datatypes ((ListLongMap!11511 0))(
  ( (ListLongMap!11512 (toList!5771 List!18608)) )
))
(declare-fun lt!412913 () ListLongMap!11511)

(declare-fun lt!412917 () tuple2!12824)

(declare-fun contains!4770 (ListLongMap!11511 (_ BitVec 64)) Bool)

(declare-fun +!2684 (ListLongMap!11511 tuple2!12824) ListLongMap!11511)

(assert (=> b!920068 (contains!4770 (+!2684 lt!412913 lt!412917) k0!1099)))

(declare-fun lt!412914 () V!31023)

(declare-fun lt!412911 () Unit!30980)

(declare-fun lt!412919 () (_ BitVec 64))

(declare-fun addStillContains!381 (ListLongMap!11511 (_ BitVec 64) V!31023 (_ BitVec 64)) Unit!30980)

(assert (=> b!920068 (= lt!412911 (addStillContains!381 lt!412913 lt!412919 lt!412914 k0!1099))))

(declare-fun getCurrentListMap!2962 (array!55043 array!55045 (_ BitVec 32) (_ BitVec 32) V!31023 V!31023 (_ BitVec 32) Int) ListLongMap!11511)

(assert (=> b!920068 (= (getCurrentListMap!2962 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2684 (getCurrentListMap!2962 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412917))))

(assert (=> b!920068 (= lt!412917 (tuple2!12825 lt!412919 lt!412914))))

(declare-fun get!13891 (ValueCell!9290 V!31023) V!31023)

(declare-fun dynLambda!1440 (Int (_ BitVec 64)) V!31023)

(assert (=> b!920068 (= lt!412914 (get!13891 (select (arr!26468 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1440 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412915 () Unit!30980)

(declare-fun lemmaListMapRecursiveValidKeyArray!48 (array!55043 array!55045 (_ BitVec 32) (_ BitVec 32) V!31023 V!31023 (_ BitVec 32) Int) Unit!30980)

(assert (=> b!920068 (= lt!412915 (lemmaListMapRecursiveValidKeyArray!48 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920069 () Bool)

(declare-fun res!620491 () Bool)

(assert (=> b!920069 (=> res!620491 e!516385)))

(declare-fun contains!4771 (List!18607 (_ BitVec 64)) Bool)

(assert (=> b!920069 (= res!620491 (contains!4771 Nil!18604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920070 () Bool)

(declare-fun res!620492 () Bool)

(assert (=> b!920070 (=> res!620492 e!516385)))

(declare-fun noDuplicate!1336 (List!18607) Bool)

(assert (=> b!920070 (= res!620492 (not (noDuplicate!1336 Nil!18604)))))

(declare-fun b!920071 () Bool)

(declare-fun e!516383 () Bool)

(declare-fun e!516389 () Bool)

(declare-fun mapRes!31071 () Bool)

(assert (=> b!920071 (= e!516383 (and e!516389 mapRes!31071))))

(declare-fun condMapEmpty!31071 () Bool)

(declare-fun mapDefault!31071 () ValueCell!9290)

(assert (=> b!920071 (= condMapEmpty!31071 (= (arr!26468 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9290)) mapDefault!31071)))))

(declare-fun b!920072 () Bool)

(declare-fun tp_is_empty!19543 () Bool)

(assert (=> b!920072 (= e!516389 tp_is_empty!19543)))

(declare-fun b!920073 () Bool)

(assert (=> b!920073 (= e!516385 true)))

(declare-fun lt!412916 () Bool)

(assert (=> b!920073 (= lt!412916 (contains!4771 Nil!18604 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920074 () Bool)

(declare-fun res!620489 () Bool)

(declare-fun e!516388 () Bool)

(assert (=> b!920074 (=> (not res!620489) (not e!516388))))

(declare-fun v!791 () V!31023)

(declare-fun apply!594 (ListLongMap!11511 (_ BitVec 64)) V!31023)

(assert (=> b!920074 (= res!620489 (= (apply!594 lt!412913 k0!1099) v!791))))

(declare-fun b!920075 () Bool)

(declare-fun res!620490 () Bool)

(declare-fun e!516382 () Bool)

(assert (=> b!920075 (=> (not res!620490) (not e!516382))))

(assert (=> b!920075 (= res!620490 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18604))))

(declare-fun b!920076 () Bool)

(declare-fun res!620497 () Bool)

(assert (=> b!920076 (=> (not res!620497) (not e!516382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55043 (_ BitVec 32)) Bool)

(assert (=> b!920076 (= res!620497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920077 () Bool)

(declare-fun e!516384 () Bool)

(assert (=> b!920077 (= e!516384 tp_is_empty!19543)))

(declare-fun b!920078 () Bool)

(declare-fun arrayContainsKey!0 (array!55043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920078 (= e!516390 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!920079 () Bool)

(declare-fun res!620493 () Bool)

(assert (=> b!920079 (=> (not res!620493) (not e!516388))))

(assert (=> b!920079 (= res!620493 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!620494 () Bool)

(assert (=> start!78804 (=> (not res!620494) (not e!516382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78804 (= res!620494 (validMask!0 mask!1881))))

(assert (=> start!78804 e!516382))

(assert (=> start!78804 true))

(assert (=> start!78804 tp_is_empty!19543))

(declare-fun array_inv!20708 (array!55045) Bool)

(assert (=> start!78804 (and (array_inv!20708 _values!1231) e!516383)))

(assert (=> start!78804 tp!59547))

(declare-fun array_inv!20709 (array!55043) Bool)

(assert (=> start!78804 (array_inv!20709 _keys!1487)))

(declare-fun b!920080 () Bool)

(assert (=> b!920080 (= e!516388 e!516386)))

(declare-fun res!620496 () Bool)

(assert (=> b!920080 (=> (not res!620496) (not e!516386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920080 (= res!620496 (validKeyInArray!0 lt!412919))))

(assert (=> b!920080 (= lt!412919 (select (arr!26467 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920081 () Bool)

(declare-fun res!620486 () Bool)

(assert (=> b!920081 (=> (not res!620486) (not e!516388))))

(assert (=> b!920081 (= res!620486 (validKeyInArray!0 k0!1099))))

(declare-fun b!920082 () Bool)

(assert (=> b!920082 (= e!516390 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920083 () Bool)

(assert (=> b!920083 (= e!516382 e!516388)))

(declare-fun res!620487 () Bool)

(assert (=> b!920083 (=> (not res!620487) (not e!516388))))

(assert (=> b!920083 (= res!620487 (contains!4770 lt!412913 k0!1099))))

(assert (=> b!920083 (= lt!412913 (getCurrentListMap!2962 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31071 () Bool)

(assert (=> mapIsEmpty!31071 mapRes!31071))

(declare-fun b!920084 () Bool)

(declare-fun res!620488 () Bool)

(assert (=> b!920084 (=> (not res!620488) (not e!516382))))

(assert (=> b!920084 (= res!620488 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26928 _keys!1487))))))

(declare-fun b!920085 () Bool)

(declare-fun res!620495 () Bool)

(assert (=> b!920085 (=> (not res!620495) (not e!516382))))

(assert (=> b!920085 (= res!620495 (and (= (size!26929 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26928 _keys!1487) (size!26929 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31071 () Bool)

(declare-fun tp!59546 () Bool)

(assert (=> mapNonEmpty!31071 (= mapRes!31071 (and tp!59546 e!516384))))

(declare-fun mapKey!31071 () (_ BitVec 32))

(declare-fun mapValue!31071 () ValueCell!9290)

(declare-fun mapRest!31071 () (Array (_ BitVec 32) ValueCell!9290))

(assert (=> mapNonEmpty!31071 (= (arr!26468 _values!1231) (store mapRest!31071 mapKey!31071 mapValue!31071))))

(assert (= (and start!78804 res!620494) b!920085))

(assert (= (and b!920085 res!620495) b!920076))

(assert (= (and b!920076 res!620497) b!920075))

(assert (= (and b!920075 res!620490) b!920084))

(assert (= (and b!920084 res!620488) b!920083))

(assert (= (and b!920083 res!620487) b!920074))

(assert (= (and b!920074 res!620489) b!920079))

(assert (= (and b!920079 res!620493) b!920081))

(assert (= (and b!920081 res!620486) b!920080))

(assert (= (and b!920080 res!620496) b!920068))

(assert (= (and b!920068 c!95989) b!920078))

(assert (= (and b!920068 (not c!95989)) b!920082))

(assert (= (and b!920068 (not res!620498)) b!920070))

(assert (= (and b!920070 (not res!620492)) b!920069))

(assert (= (and b!920069 (not res!620491)) b!920073))

(assert (= (and b!920071 condMapEmpty!31071) mapIsEmpty!31071))

(assert (= (and b!920071 (not condMapEmpty!31071)) mapNonEmpty!31071))

(get-info :version)

(assert (= (and mapNonEmpty!31071 ((_ is ValueCellFull!9290) mapValue!31071)) b!920077))

(assert (= (and b!920071 ((_ is ValueCellFull!9290) mapDefault!31071)) b!920072))

(assert (= start!78804 b!920071))

(declare-fun b_lambda!13519 () Bool)

(assert (=> (not b_lambda!13519) (not b!920068)))

(declare-fun t!26362 () Bool)

(declare-fun tb!5607 () Bool)

(assert (=> (and start!78804 (= defaultEntry!1235 defaultEntry!1235) t!26362) tb!5607))

(declare-fun result!11045 () Bool)

(assert (=> tb!5607 (= result!11045 tp_is_empty!19543)))

(assert (=> b!920068 t!26362))

(declare-fun b_and!27783 () Bool)

(assert (= b_and!27781 (and (=> t!26362 result!11045) b_and!27783)))

(declare-fun m!853465 () Bool)

(assert (=> b!920075 m!853465))

(declare-fun m!853467 () Bool)

(assert (=> b!920070 m!853467))

(declare-fun m!853469 () Bool)

(assert (=> b!920078 m!853469))

(declare-fun m!853471 () Bool)

(assert (=> b!920074 m!853471))

(declare-fun m!853473 () Bool)

(assert (=> b!920073 m!853473))

(declare-fun m!853475 () Bool)

(assert (=> b!920083 m!853475))

(declare-fun m!853477 () Bool)

(assert (=> b!920083 m!853477))

(declare-fun m!853479 () Bool)

(assert (=> b!920076 m!853479))

(declare-fun m!853481 () Bool)

(assert (=> b!920080 m!853481))

(declare-fun m!853483 () Bool)

(assert (=> b!920080 m!853483))

(declare-fun m!853485 () Bool)

(assert (=> start!78804 m!853485))

(declare-fun m!853487 () Bool)

(assert (=> start!78804 m!853487))

(declare-fun m!853489 () Bool)

(assert (=> start!78804 m!853489))

(declare-fun m!853491 () Bool)

(assert (=> b!920069 m!853491))

(declare-fun m!853493 () Bool)

(assert (=> b!920081 m!853493))

(declare-fun m!853495 () Bool)

(assert (=> mapNonEmpty!31071 m!853495))

(declare-fun m!853497 () Bool)

(assert (=> b!920068 m!853497))

(declare-fun m!853499 () Bool)

(assert (=> b!920068 m!853499))

(assert (=> b!920068 m!853497))

(declare-fun m!853501 () Bool)

(assert (=> b!920068 m!853501))

(declare-fun m!853503 () Bool)

(assert (=> b!920068 m!853503))

(declare-fun m!853505 () Bool)

(assert (=> b!920068 m!853505))

(assert (=> b!920068 m!853503))

(assert (=> b!920068 m!853505))

(declare-fun m!853507 () Bool)

(assert (=> b!920068 m!853507))

(declare-fun m!853509 () Bool)

(assert (=> b!920068 m!853509))

(declare-fun m!853511 () Bool)

(assert (=> b!920068 m!853511))

(declare-fun m!853513 () Bool)

(assert (=> b!920068 m!853513))

(declare-fun m!853515 () Bool)

(assert (=> b!920068 m!853515))

(declare-fun m!853517 () Bool)

(assert (=> b!920068 m!853517))

(declare-fun m!853519 () Bool)

(assert (=> b!920068 m!853519))

(assert (=> b!920068 m!853511))

(declare-fun m!853521 () Bool)

(assert (=> b!920068 m!853521))

(check-sat (not b!920074) (not b!920068) b_and!27783 (not b!920078) (not b!920069) (not b_next!17035) (not b!920081) (not b!920076) (not b!920075) (not mapNonEmpty!31071) (not b!920080) (not b!920073) tp_is_empty!19543 (not b!920083) (not b_lambda!13519) (not start!78804) (not b!920070))
(check-sat b_and!27783 (not b_next!17035))
