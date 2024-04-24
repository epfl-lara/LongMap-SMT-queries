; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78876 () Bool)

(assert start!78876)

(declare-fun b_free!16921 () Bool)

(declare-fun b_next!16921 () Bool)

(assert (=> start!78876 (= b_free!16921 (not b_next!16921))))

(declare-fun tp!59204 () Bool)

(declare-fun b_and!27589 () Bool)

(assert (=> start!78876 (= tp!59204 b_and!27589)))

(declare-fun b!918864 () Bool)

(declare-fun res!619232 () Bool)

(declare-fun e!515916 () Bool)

(assert (=> b!918864 (=> (not res!619232) (not e!515916))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30871 0))(
  ( (V!30872 (val!9765 Int)) )
))
(declare-fun v!791 () V!30871)

(declare-datatypes ((tuple2!12650 0))(
  ( (tuple2!12651 (_1!6336 (_ BitVec 64)) (_2!6336 V!30871)) )
))
(declare-datatypes ((List!18471 0))(
  ( (Nil!18468) (Cons!18467 (h!19619 tuple2!12650) (t!26114 List!18471)) )
))
(declare-datatypes ((ListLongMap!11349 0))(
  ( (ListLongMap!11350 (toList!5690 List!18471)) )
))
(declare-fun lt!412489 () ListLongMap!11349)

(declare-fun apply!569 (ListLongMap!11349 (_ BitVec 64)) V!30871)

(assert (=> b!918864 (= res!619232 (= (apply!569 lt!412489 k0!1099) v!791))))

(declare-fun mapNonEmpty!30900 () Bool)

(declare-fun mapRes!30900 () Bool)

(declare-fun tp!59205 () Bool)

(declare-fun e!515914 () Bool)

(assert (=> mapNonEmpty!30900 (= mapRes!30900 (and tp!59205 e!515914))))

(declare-datatypes ((ValueCell!9233 0))(
  ( (ValueCellFull!9233 (v!12280 V!30871)) (EmptyCell!9233) )
))
(declare-fun mapValue!30900 () ValueCell!9233)

(declare-fun mapRest!30900 () (Array (_ BitVec 32) ValueCell!9233))

(declare-datatypes ((array!54889 0))(
  ( (array!54890 (arr!26385 (Array (_ BitVec 32) ValueCell!9233)) (size!26845 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54889)

(declare-fun mapKey!30900 () (_ BitVec 32))

(assert (=> mapNonEmpty!30900 (= (arr!26385 _values!1231) (store mapRest!30900 mapKey!30900 mapValue!30900))))

(declare-fun b!918865 () Bool)

(declare-fun res!619233 () Bool)

(assert (=> b!918865 (=> (not res!619233) (not e!515916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918865 (= res!619233 (validKeyInArray!0 k0!1099))))

(declare-fun b!918866 () Bool)

(declare-fun tp_is_empty!19429 () Bool)

(assert (=> b!918866 (= e!515914 tp_is_empty!19429)))

(declare-fun b!918867 () Bool)

(declare-fun e!515915 () Bool)

(assert (=> b!918867 (= e!515915 (not true))))

(declare-datatypes ((array!54891 0))(
  ( (array!54892 (arr!26386 (Array (_ BitVec 32) (_ BitVec 64))) (size!26846 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54891)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!412488 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30871)

(declare-fun minValue!1173 () V!30871)

(declare-fun getCurrentListMap!2945 (array!54891 array!54889 (_ BitVec 32) (_ BitVec 32) V!30871 V!30871 (_ BitVec 32) Int) ListLongMap!11349)

(declare-fun +!2634 (ListLongMap!11349 tuple2!12650) ListLongMap!11349)

(declare-fun get!13843 (ValueCell!9233 V!30871) V!30871)

(declare-fun dynLambda!1431 (Int (_ BitVec 64)) V!30871)

(assert (=> b!918867 (= (getCurrentListMap!2945 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2634 (getCurrentListMap!2945 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12651 lt!412488 (get!13843 (select (arr!26385 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1431 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30980 0))(
  ( (Unit!30981) )
))
(declare-fun lt!412490 () Unit!30980)

(declare-fun lemmaListMapRecursiveValidKeyArray!14 (array!54891 array!54889 (_ BitVec 32) (_ BitVec 32) V!30871 V!30871 (_ BitVec 32) Int) Unit!30980)

(assert (=> b!918867 (= lt!412490 (lemmaListMapRecursiveValidKeyArray!14 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!30900 () Bool)

(assert (=> mapIsEmpty!30900 mapRes!30900))

(declare-fun b!918868 () Bool)

(declare-fun res!619230 () Bool)

(declare-fun e!515911 () Bool)

(assert (=> b!918868 (=> (not res!619230) (not e!515911))))

(assert (=> b!918868 (= res!619230 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26846 _keys!1487))))))

(declare-fun b!918869 () Bool)

(assert (=> b!918869 (= e!515916 e!515915)))

(declare-fun res!619228 () Bool)

(assert (=> b!918869 (=> (not res!619228) (not e!515915))))

(assert (=> b!918869 (= res!619228 (validKeyInArray!0 lt!412488))))

(assert (=> b!918869 (= lt!412488 (select (arr!26386 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918870 () Bool)

(declare-fun e!515917 () Bool)

(declare-fun e!515913 () Bool)

(assert (=> b!918870 (= e!515917 (and e!515913 mapRes!30900))))

(declare-fun condMapEmpty!30900 () Bool)

(declare-fun mapDefault!30900 () ValueCell!9233)

(assert (=> b!918870 (= condMapEmpty!30900 (= (arr!26385 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9233)) mapDefault!30900)))))

(declare-fun b!918863 () Bool)

(declare-fun res!619224 () Bool)

(assert (=> b!918863 (=> (not res!619224) (not e!515911))))

(declare-datatypes ((List!18472 0))(
  ( (Nil!18469) (Cons!18468 (h!19620 (_ BitVec 64)) (t!26115 List!18472)) )
))
(declare-fun arrayNoDuplicates!0 (array!54891 (_ BitVec 32) List!18472) Bool)

(assert (=> b!918863 (= res!619224 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18469))))

(declare-fun res!619229 () Bool)

(assert (=> start!78876 (=> (not res!619229) (not e!515911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78876 (= res!619229 (validMask!0 mask!1881))))

(assert (=> start!78876 e!515911))

(assert (=> start!78876 true))

(assert (=> start!78876 tp_is_empty!19429))

(declare-fun array_inv!20668 (array!54889) Bool)

(assert (=> start!78876 (and (array_inv!20668 _values!1231) e!515917)))

(assert (=> start!78876 tp!59204))

(declare-fun array_inv!20669 (array!54891) Bool)

(assert (=> start!78876 (array_inv!20669 _keys!1487)))

(declare-fun b!918871 () Bool)

(declare-fun res!619227 () Bool)

(assert (=> b!918871 (=> (not res!619227) (not e!515911))))

(assert (=> b!918871 (= res!619227 (and (= (size!26845 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26846 _keys!1487) (size!26845 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918872 () Bool)

(assert (=> b!918872 (= e!515913 tp_is_empty!19429)))

(declare-fun b!918873 () Bool)

(declare-fun res!619231 () Bool)

(assert (=> b!918873 (=> (not res!619231) (not e!515911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54891 (_ BitVec 32)) Bool)

(assert (=> b!918873 (= res!619231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918874 () Bool)

(assert (=> b!918874 (= e!515911 e!515916)))

(declare-fun res!619225 () Bool)

(assert (=> b!918874 (=> (not res!619225) (not e!515916))))

(declare-fun contains!4746 (ListLongMap!11349 (_ BitVec 64)) Bool)

(assert (=> b!918874 (= res!619225 (contains!4746 lt!412489 k0!1099))))

(assert (=> b!918874 (= lt!412489 (getCurrentListMap!2945 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918875 () Bool)

(declare-fun res!619226 () Bool)

(assert (=> b!918875 (=> (not res!619226) (not e!515916))))

(assert (=> b!918875 (= res!619226 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!78876 res!619229) b!918871))

(assert (= (and b!918871 res!619227) b!918873))

(assert (= (and b!918873 res!619231) b!918863))

(assert (= (and b!918863 res!619224) b!918868))

(assert (= (and b!918868 res!619230) b!918874))

(assert (= (and b!918874 res!619225) b!918864))

(assert (= (and b!918864 res!619232) b!918875))

(assert (= (and b!918875 res!619226) b!918865))

(assert (= (and b!918865 res!619233) b!918869))

(assert (= (and b!918869 res!619228) b!918867))

(assert (= (and b!918870 condMapEmpty!30900) mapIsEmpty!30900))

(assert (= (and b!918870 (not condMapEmpty!30900)) mapNonEmpty!30900))

(get-info :version)

(assert (= (and mapNonEmpty!30900 ((_ is ValueCellFull!9233) mapValue!30900)) b!918866))

(assert (= (and b!918870 ((_ is ValueCellFull!9233) mapDefault!30900)) b!918872))

(assert (= start!78876 b!918870))

(declare-fun b_lambda!13437 () Bool)

(assert (=> (not b_lambda!13437) (not b!918867)))

(declare-fun t!26113 () Bool)

(declare-fun tb!5493 () Bool)

(assert (=> (and start!78876 (= defaultEntry!1235 defaultEntry!1235) t!26113) tb!5493))

(declare-fun result!10817 () Bool)

(assert (=> tb!5493 (= result!10817 tp_is_empty!19429)))

(assert (=> b!918867 t!26113))

(declare-fun b_and!27591 () Bool)

(assert (= b_and!27589 (and (=> t!26113 result!10817) b_and!27591)))

(declare-fun m!852961 () Bool)

(assert (=> b!918873 m!852961))

(declare-fun m!852963 () Bool)

(assert (=> mapNonEmpty!30900 m!852963))

(declare-fun m!852965 () Bool)

(assert (=> b!918874 m!852965))

(declare-fun m!852967 () Bool)

(assert (=> b!918874 m!852967))

(declare-fun m!852969 () Bool)

(assert (=> b!918863 m!852969))

(declare-fun m!852971 () Bool)

(assert (=> b!918864 m!852971))

(declare-fun m!852973 () Bool)

(assert (=> b!918869 m!852973))

(declare-fun m!852975 () Bool)

(assert (=> b!918869 m!852975))

(declare-fun m!852977 () Bool)

(assert (=> b!918865 m!852977))

(declare-fun m!852979 () Bool)

(assert (=> start!78876 m!852979))

(declare-fun m!852981 () Bool)

(assert (=> start!78876 m!852981))

(declare-fun m!852983 () Bool)

(assert (=> start!78876 m!852983))

(declare-fun m!852985 () Bool)

(assert (=> b!918867 m!852985))

(declare-fun m!852987 () Bool)

(assert (=> b!918867 m!852987))

(declare-fun m!852989 () Bool)

(assert (=> b!918867 m!852989))

(declare-fun m!852991 () Bool)

(assert (=> b!918867 m!852991))

(assert (=> b!918867 m!852985))

(assert (=> b!918867 m!852987))

(declare-fun m!852993 () Bool)

(assert (=> b!918867 m!852993))

(declare-fun m!852995 () Bool)

(assert (=> b!918867 m!852995))

(assert (=> b!918867 m!852989))

(declare-fun m!852997 () Bool)

(assert (=> b!918867 m!852997))

(check-sat tp_is_empty!19429 (not start!78876) (not b_next!16921) (not mapNonEmpty!30900) (not b!918865) (not b_lambda!13437) (not b!918867) (not b!918863) (not b!918864) (not b!918874) (not b!918869) b_and!27591 (not b!918873))
(check-sat b_and!27591 (not b_next!16921))
