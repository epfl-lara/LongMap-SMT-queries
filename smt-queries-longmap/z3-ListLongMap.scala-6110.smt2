; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78750 () Bool)

(assert start!78750)

(declare-fun b_free!16981 () Bool)

(declare-fun b_next!16981 () Bool)

(assert (=> start!78750 (= b_free!16981 (not b_next!16981))))

(declare-fun tp!59384 () Bool)

(declare-fun b_and!27673 () Bool)

(assert (=> start!78750 (= tp!59384 b_and!27673)))

(declare-fun mapNonEmpty!30990 () Bool)

(declare-fun mapRes!30990 () Bool)

(declare-fun tp!59385 () Bool)

(declare-fun e!515811 () Bool)

(assert (=> mapNonEmpty!30990 (= mapRes!30990 (and tp!59385 e!515811))))

(declare-datatypes ((V!30951 0))(
  ( (V!30952 (val!9795 Int)) )
))
(declare-datatypes ((ValueCell!9263 0))(
  ( (ValueCellFull!9263 (v!12312 V!30951)) (EmptyCell!9263) )
))
(declare-fun mapValue!30990 () ValueCell!9263)

(declare-fun mapRest!30990 () (Array (_ BitVec 32) ValueCell!9263))

(declare-fun mapKey!30990 () (_ BitVec 32))

(declare-datatypes ((array!54943 0))(
  ( (array!54944 (arr!26417 (Array (_ BitVec 32) ValueCell!9263)) (size!26878 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54943)

(assert (=> mapNonEmpty!30990 (= (arr!26417 _values!1231) (store mapRest!30990 mapKey!30990 mapValue!30990))))

(declare-fun b!918951 () Bool)

(declare-fun tp_is_empty!19489 () Bool)

(assert (=> b!918951 (= e!515811 tp_is_empty!19489)))

(declare-fun b!918952 () Bool)

(declare-fun e!515815 () Bool)

(declare-fun e!515813 () Bool)

(assert (=> b!918952 (= e!515815 e!515813)))

(declare-fun res!619673 () Bool)

(assert (=> b!918952 (=> (not res!619673) (not e!515813))))

(declare-fun lt!412340 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918952 (= res!619673 (validKeyInArray!0 lt!412340))))

(declare-datatypes ((array!54945 0))(
  ( (array!54946 (arr!26418 (Array (_ BitVec 32) (_ BitVec 64))) (size!26879 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54945)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918952 (= lt!412340 (select (arr!26418 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918953 () Bool)

(declare-fun res!619678 () Bool)

(declare-fun e!515812 () Bool)

(assert (=> b!918953 (=> (not res!619678) (not e!515812))))

(declare-datatypes ((List!18568 0))(
  ( (Nil!18565) (Cons!18564 (h!19710 (_ BitVec 64)) (t!26270 List!18568)) )
))
(declare-fun arrayNoDuplicates!0 (array!54945 (_ BitVec 32) List!18568) Bool)

(assert (=> b!918953 (= res!619678 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18565))))

(declare-fun b!918954 () Bool)

(assert (=> b!918954 (= e!515812 e!515815)))

(declare-fun res!619671 () Bool)

(assert (=> b!918954 (=> (not res!619671) (not e!515815))))

(declare-datatypes ((tuple2!12782 0))(
  ( (tuple2!12783 (_1!6402 (_ BitVec 64)) (_2!6402 V!30951)) )
))
(declare-datatypes ((List!18569 0))(
  ( (Nil!18566) (Cons!18565 (h!19711 tuple2!12782) (t!26271 List!18569)) )
))
(declare-datatypes ((ListLongMap!11469 0))(
  ( (ListLongMap!11470 (toList!5750 List!18569)) )
))
(declare-fun lt!412343 () ListLongMap!11469)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4750 (ListLongMap!11469 (_ BitVec 64)) Bool)

(assert (=> b!918954 (= res!619671 (contains!4750 lt!412343 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30951)

(declare-fun minValue!1173 () V!30951)

(declare-fun getCurrentListMap!2942 (array!54945 array!54943 (_ BitVec 32) (_ BitVec 32) V!30951 V!30951 (_ BitVec 32) Int) ListLongMap!11469)

(assert (=> b!918954 (= lt!412343 (getCurrentListMap!2942 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!619674 () Bool)

(assert (=> start!78750 (=> (not res!619674) (not e!515812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78750 (= res!619674 (validMask!0 mask!1881))))

(assert (=> start!78750 e!515812))

(assert (=> start!78750 true))

(assert (=> start!78750 tp_is_empty!19489))

(declare-fun e!515814 () Bool)

(declare-fun array_inv!20674 (array!54943) Bool)

(assert (=> start!78750 (and (array_inv!20674 _values!1231) e!515814)))

(assert (=> start!78750 tp!59384))

(declare-fun array_inv!20675 (array!54945) Bool)

(assert (=> start!78750 (array_inv!20675 _keys!1487)))

(declare-fun b!918955 () Bool)

(declare-fun res!619676 () Bool)

(assert (=> b!918955 (=> (not res!619676) (not e!515815))))

(assert (=> b!918955 (= res!619676 (validKeyInArray!0 k0!1099))))

(declare-fun b!918956 () Bool)

(declare-fun res!619677 () Bool)

(assert (=> b!918956 (=> (not res!619677) (not e!515815))))

(declare-fun v!791 () V!30951)

(declare-fun apply!580 (ListLongMap!11469 (_ BitVec 64)) V!30951)

(assert (=> b!918956 (= res!619677 (= (apply!580 lt!412343 k0!1099) v!791))))

(declare-fun b!918957 () Bool)

(declare-fun e!515816 () Bool)

(assert (=> b!918957 (= e!515814 (and e!515816 mapRes!30990))))

(declare-fun condMapEmpty!30990 () Bool)

(declare-fun mapDefault!30990 () ValueCell!9263)

(assert (=> b!918957 (= condMapEmpty!30990 (= (arr!26417 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9263)) mapDefault!30990)))))

(declare-fun b!918958 () Bool)

(assert (=> b!918958 (= e!515816 tp_is_empty!19489)))

(declare-fun b!918959 () Bool)

(declare-fun res!619679 () Bool)

(assert (=> b!918959 (=> (not res!619679) (not e!515812))))

(assert (=> b!918959 (= res!619679 (and (= (size!26878 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26879 _keys!1487) (size!26878 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918960 () Bool)

(declare-fun res!619672 () Bool)

(assert (=> b!918960 (=> (not res!619672) (not e!515815))))

(assert (=> b!918960 (= res!619672 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918961 () Bool)

(assert (=> b!918961 (= e!515813 (not true))))

(assert (=> b!918961 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18565)))

(declare-datatypes ((Unit!30948 0))(
  ( (Unit!30949) )
))
(declare-fun lt!412341 () Unit!30948)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54945 (_ BitVec 32) (_ BitVec 32)) Unit!30948)

(assert (=> b!918961 (= lt!412341 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412342 () tuple2!12782)

(declare-fun +!2668 (ListLongMap!11469 tuple2!12782) ListLongMap!11469)

(assert (=> b!918961 (contains!4750 (+!2668 lt!412343 lt!412342) k0!1099)))

(declare-fun lt!412344 () V!30951)

(declare-fun lt!412345 () Unit!30948)

(declare-fun addStillContains!365 (ListLongMap!11469 (_ BitVec 64) V!30951 (_ BitVec 64)) Unit!30948)

(assert (=> b!918961 (= lt!412345 (addStillContains!365 lt!412343 lt!412340 lt!412344 k0!1099))))

(assert (=> b!918961 (= (getCurrentListMap!2942 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2668 (getCurrentListMap!2942 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412342))))

(assert (=> b!918961 (= lt!412342 (tuple2!12783 lt!412340 lt!412344))))

(declare-fun get!13857 (ValueCell!9263 V!30951) V!30951)

(declare-fun dynLambda!1424 (Int (_ BitVec 64)) V!30951)

(assert (=> b!918961 (= lt!412344 (get!13857 (select (arr!26417 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1424 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412346 () Unit!30948)

(declare-fun lemmaListMapRecursiveValidKeyArray!32 (array!54945 array!54943 (_ BitVec 32) (_ BitVec 32) V!30951 V!30951 (_ BitVec 32) Int) Unit!30948)

(assert (=> b!918961 (= lt!412346 (lemmaListMapRecursiveValidKeyArray!32 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!30990 () Bool)

(assert (=> mapIsEmpty!30990 mapRes!30990))

(declare-fun b!918962 () Bool)

(declare-fun res!619670 () Bool)

(assert (=> b!918962 (=> (not res!619670) (not e!515812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54945 (_ BitVec 32)) Bool)

(assert (=> b!918962 (= res!619670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918963 () Bool)

(declare-fun res!619675 () Bool)

(assert (=> b!918963 (=> (not res!619675) (not e!515812))))

(assert (=> b!918963 (= res!619675 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26879 _keys!1487))))))

(assert (= (and start!78750 res!619674) b!918959))

(assert (= (and b!918959 res!619679) b!918962))

(assert (= (and b!918962 res!619670) b!918953))

(assert (= (and b!918953 res!619678) b!918963))

(assert (= (and b!918963 res!619675) b!918954))

(assert (= (and b!918954 res!619671) b!918956))

(assert (= (and b!918956 res!619677) b!918960))

(assert (= (and b!918960 res!619672) b!918955))

(assert (= (and b!918955 res!619676) b!918952))

(assert (= (and b!918952 res!619673) b!918961))

(assert (= (and b!918957 condMapEmpty!30990) mapIsEmpty!30990))

(assert (= (and b!918957 (not condMapEmpty!30990)) mapNonEmpty!30990))

(get-info :version)

(assert (= (and mapNonEmpty!30990 ((_ is ValueCellFull!9263) mapValue!30990)) b!918951))

(assert (= (and b!918957 ((_ is ValueCellFull!9263) mapDefault!30990)) b!918958))

(assert (= start!78750 b!918957))

(declare-fun b_lambda!13465 () Bool)

(assert (=> (not b_lambda!13465) (not b!918961)))

(declare-fun t!26269 () Bool)

(declare-fun tb!5553 () Bool)

(assert (=> (and start!78750 (= defaultEntry!1235 defaultEntry!1235) t!26269) tb!5553))

(declare-fun result!10937 () Bool)

(assert (=> tb!5553 (= result!10937 tp_is_empty!19489)))

(assert (=> b!918961 t!26269))

(declare-fun b_and!27675 () Bool)

(assert (= b_and!27673 (and (=> t!26269 result!10937) b_and!27675)))

(declare-fun m!852169 () Bool)

(assert (=> b!918961 m!852169))

(assert (=> b!918961 m!852169))

(declare-fun m!852171 () Bool)

(assert (=> b!918961 m!852171))

(declare-fun m!852173 () Bool)

(assert (=> b!918961 m!852173))

(declare-fun m!852175 () Bool)

(assert (=> b!918961 m!852175))

(declare-fun m!852177 () Bool)

(assert (=> b!918961 m!852177))

(declare-fun m!852179 () Bool)

(assert (=> b!918961 m!852179))

(declare-fun m!852181 () Bool)

(assert (=> b!918961 m!852181))

(declare-fun m!852183 () Bool)

(assert (=> b!918961 m!852183))

(assert (=> b!918961 m!852181))

(declare-fun m!852185 () Bool)

(assert (=> b!918961 m!852185))

(declare-fun m!852187 () Bool)

(assert (=> b!918961 m!852187))

(assert (=> b!918961 m!852171))

(declare-fun m!852189 () Bool)

(assert (=> b!918961 m!852189))

(assert (=> b!918961 m!852177))

(declare-fun m!852191 () Bool)

(assert (=> b!918961 m!852191))

(declare-fun m!852193 () Bool)

(assert (=> b!918953 m!852193))

(declare-fun m!852195 () Bool)

(assert (=> b!918955 m!852195))

(declare-fun m!852197 () Bool)

(assert (=> b!918952 m!852197))

(declare-fun m!852199 () Bool)

(assert (=> b!918952 m!852199))

(declare-fun m!852201 () Bool)

(assert (=> b!918954 m!852201))

(declare-fun m!852203 () Bool)

(assert (=> b!918954 m!852203))

(declare-fun m!852205 () Bool)

(assert (=> mapNonEmpty!30990 m!852205))

(declare-fun m!852207 () Bool)

(assert (=> start!78750 m!852207))

(declare-fun m!852209 () Bool)

(assert (=> start!78750 m!852209))

(declare-fun m!852211 () Bool)

(assert (=> start!78750 m!852211))

(declare-fun m!852213 () Bool)

(assert (=> b!918956 m!852213))

(declare-fun m!852215 () Bool)

(assert (=> b!918962 m!852215))

(check-sat (not mapNonEmpty!30990) (not b!918954) (not b!918956) tp_is_empty!19489 (not b_next!16981) (not b_lambda!13465) (not start!78750) b_and!27675 (not b!918952) (not b!918955) (not b!918961) (not b!918953) (not b!918962))
(check-sat b_and!27675 (not b_next!16981))
