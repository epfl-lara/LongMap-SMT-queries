; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77814 () Bool)

(assert start!77814)

(declare-fun b_free!16231 () Bool)

(declare-fun b_next!16231 () Bool)

(assert (=> start!77814 (= b_free!16231 (not b_next!16231))))

(declare-fun tp!56956 () Bool)

(declare-fun b_and!26625 () Bool)

(assert (=> start!77814 (= tp!56956 b_and!26625)))

(declare-fun res!611202 () Bool)

(declare-fun e!507853 () Bool)

(assert (=> start!77814 (=> (not res!611202) (not e!507853))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77814 (= res!611202 (validMask!0 mask!1756))))

(assert (=> start!77814 e!507853))

(declare-datatypes ((V!29831 0))(
  ( (V!29832 (val!9375 Int)) )
))
(declare-datatypes ((ValueCell!8843 0))(
  ( (ValueCellFull!8843 (v!11877 V!29831)) (EmptyCell!8843) )
))
(declare-datatypes ((array!53385 0))(
  ( (array!53386 (arr!25647 (Array (_ BitVec 32) ValueCell!8843)) (size!26107 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53385)

(declare-fun e!507851 () Bool)

(declare-fun array_inv!20150 (array!53385) Bool)

(assert (=> start!77814 (and (array_inv!20150 _values!1152) e!507851)))

(assert (=> start!77814 tp!56956))

(assert (=> start!77814 true))

(declare-fun tp_is_empty!18649 () Bool)

(assert (=> start!77814 tp_is_empty!18649))

(declare-datatypes ((array!53387 0))(
  ( (array!53388 (arr!25648 (Array (_ BitVec 32) (_ BitVec 64))) (size!26108 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53387)

(declare-fun array_inv!20151 (array!53387) Bool)

(assert (=> start!77814 (array_inv!20151 _keys!1386)))

(declare-fun b!906149 () Bool)

(declare-fun res!611197 () Bool)

(declare-fun e!507852 () Bool)

(assert (=> b!906149 (=> (not res!611197) (not e!507852))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906149 (= res!611197 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29686 () Bool)

(declare-fun mapRes!29686 () Bool)

(declare-fun tp!56955 () Bool)

(declare-fun e!507848 () Bool)

(assert (=> mapNonEmpty!29686 (= mapRes!29686 (and tp!56955 e!507848))))

(declare-fun mapValue!29686 () ValueCell!8843)

(declare-fun mapRest!29686 () (Array (_ BitVec 32) ValueCell!8843))

(declare-fun mapKey!29686 () (_ BitVec 32))

(assert (=> mapNonEmpty!29686 (= (arr!25647 _values!1152) (store mapRest!29686 mapKey!29686 mapValue!29686))))

(declare-fun b!906150 () Bool)

(declare-fun res!611195 () Bool)

(assert (=> b!906150 (=> (not res!611195) (not e!507853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53387 (_ BitVec 32)) Bool)

(assert (=> b!906150 (= res!611195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906151 () Bool)

(declare-fun res!611201 () Bool)

(assert (=> b!906151 (=> (not res!611201) (not e!507853))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!906151 (= res!611201 (and (= (size!26107 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26108 _keys!1386) (size!26107 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906152 () Bool)

(declare-fun e!507850 () Bool)

(assert (=> b!906152 (= e!507851 (and e!507850 mapRes!29686))))

(declare-fun condMapEmpty!29686 () Bool)

(declare-fun mapDefault!29686 () ValueCell!8843)

(assert (=> b!906152 (= condMapEmpty!29686 (= (arr!25647 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8843)) mapDefault!29686)))))

(declare-fun b!906153 () Bool)

(declare-fun res!611198 () Bool)

(assert (=> b!906153 (=> (not res!611198) (not e!507852))))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!906153 (= res!611198 (and (= (select (arr!25648 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906154 () Bool)

(assert (=> b!906154 (= e!507853 e!507852)))

(declare-fun res!611203 () Bool)

(assert (=> b!906154 (=> (not res!611203) (not e!507852))))

(declare-datatypes ((tuple2!12124 0))(
  ( (tuple2!12125 (_1!6073 (_ BitVec 64)) (_2!6073 V!29831)) )
))
(declare-datatypes ((List!17967 0))(
  ( (Nil!17964) (Cons!17963 (h!19115 tuple2!12124) (t!25362 List!17967)) )
))
(declare-datatypes ((ListLongMap!10823 0))(
  ( (ListLongMap!10824 (toList!5427 List!17967)) )
))
(declare-fun lt!408847 () ListLongMap!10823)

(declare-fun contains!4482 (ListLongMap!10823 (_ BitVec 64)) Bool)

(assert (=> b!906154 (= res!611203 (contains!4482 lt!408847 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun minValue!1094 () V!29831)

(declare-fun zeroValue!1094 () V!29831)

(declare-fun getCurrentListMap!2693 (array!53387 array!53385 (_ BitVec 32) (_ BitVec 32) V!29831 V!29831 (_ BitVec 32) Int) ListLongMap!10823)

(assert (=> b!906154 (= lt!408847 (getCurrentListMap!2693 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906155 () Bool)

(assert (=> b!906155 (= e!507850 tp_is_empty!18649)))

(declare-fun b!906156 () Bool)

(declare-fun res!611194 () Bool)

(declare-fun e!507849 () Bool)

(assert (=> b!906156 (=> res!611194 e!507849)))

(declare-fun lt!408844 () ListLongMap!10823)

(declare-fun lt!408845 () V!29831)

(declare-fun apply!451 (ListLongMap!10823 (_ BitVec 64)) V!29831)

(assert (=> b!906156 (= res!611194 (not (= (apply!451 lt!408844 k0!1033) lt!408845)))))

(declare-fun b!906157 () Bool)

(declare-fun e!507854 () Bool)

(assert (=> b!906157 (= e!507852 (not e!507854))))

(declare-fun res!611199 () Bool)

(assert (=> b!906157 (=> res!611199 e!507854)))

(assert (=> b!906157 (= res!611199 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26108 _keys!1386))))))

(declare-fun get!13484 (ValueCell!8843 V!29831) V!29831)

(declare-fun dynLambda!1342 (Int (_ BitVec 64)) V!29831)

(assert (=> b!906157 (= lt!408845 (get!13484 (select (arr!25647 _values!1152) i!717) (dynLambda!1342 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906157 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30710 0))(
  ( (Unit!30711) )
))
(declare-fun lt!408846 () Unit!30710)

(declare-fun lemmaKeyInListMapIsInArray!201 (array!53387 array!53385 (_ BitVec 32) (_ BitVec 32) V!29831 V!29831 (_ BitVec 64) Int) Unit!30710)

(assert (=> b!906157 (= lt!408846 (lemmaKeyInListMapIsInArray!201 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29686 () Bool)

(assert (=> mapIsEmpty!29686 mapRes!29686))

(declare-fun b!906158 () Bool)

(declare-fun res!611196 () Bool)

(assert (=> b!906158 (=> (not res!611196) (not e!507853))))

(declare-datatypes ((List!17968 0))(
  ( (Nil!17965) (Cons!17964 (h!19116 (_ BitVec 64)) (t!25363 List!17968)) )
))
(declare-fun arrayNoDuplicates!0 (array!53387 (_ BitVec 32) List!17968) Bool)

(assert (=> b!906158 (= res!611196 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17965))))

(declare-fun b!906159 () Bool)

(assert (=> b!906159 (= e!507849 true)))

(assert (=> b!906159 (= (apply!451 lt!408847 k0!1033) lt!408845)))

(declare-fun lt!408843 () Unit!30710)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!7 (array!53387 array!53385 (_ BitVec 32) (_ BitVec 32) V!29831 V!29831 (_ BitVec 64) V!29831 (_ BitVec 32) Int) Unit!30710)

(assert (=> b!906159 (= lt!408843 (lemmaListMapApplyFromThenApplyFromZero!7 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408845 i!717 defaultEntry!1160))))

(declare-fun b!906160 () Bool)

(assert (=> b!906160 (= e!507854 e!507849)))

(declare-fun res!611200 () Bool)

(assert (=> b!906160 (=> res!611200 e!507849)))

(assert (=> b!906160 (= res!611200 (not (contains!4482 lt!408844 k0!1033)))))

(assert (=> b!906160 (= lt!408844 (getCurrentListMap!2693 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906161 () Bool)

(assert (=> b!906161 (= e!507848 tp_is_empty!18649)))

(assert (= (and start!77814 res!611202) b!906151))

(assert (= (and b!906151 res!611201) b!906150))

(assert (= (and b!906150 res!611195) b!906158))

(assert (= (and b!906158 res!611196) b!906154))

(assert (= (and b!906154 res!611203) b!906149))

(assert (= (and b!906149 res!611197) b!906153))

(assert (= (and b!906153 res!611198) b!906157))

(assert (= (and b!906157 (not res!611199)) b!906160))

(assert (= (and b!906160 (not res!611200)) b!906156))

(assert (= (and b!906156 (not res!611194)) b!906159))

(assert (= (and b!906152 condMapEmpty!29686) mapIsEmpty!29686))

(assert (= (and b!906152 (not condMapEmpty!29686)) mapNonEmpty!29686))

(get-info :version)

(assert (= (and mapNonEmpty!29686 ((_ is ValueCellFull!8843) mapValue!29686)) b!906161))

(assert (= (and b!906152 ((_ is ValueCellFull!8843) mapDefault!29686)) b!906155))

(assert (= start!77814 b!906152))

(declare-fun b_lambda!13119 () Bool)

(assert (=> (not b_lambda!13119) (not b!906157)))

(declare-fun t!25361 () Bool)

(declare-fun tb!5245 () Bool)

(assert (=> (and start!77814 (= defaultEntry!1160 defaultEntry!1160) t!25361) tb!5245))

(declare-fun result!10293 () Bool)

(assert (=> tb!5245 (= result!10293 tp_is_empty!18649)))

(assert (=> b!906157 t!25361))

(declare-fun b_and!26627 () Bool)

(assert (= b_and!26625 (and (=> t!25361 result!10293) b_and!26627)))

(declare-fun m!841949 () Bool)

(assert (=> b!906156 m!841949))

(declare-fun m!841951 () Bool)

(assert (=> b!906157 m!841951))

(declare-fun m!841953 () Bool)

(assert (=> b!906157 m!841953))

(declare-fun m!841955 () Bool)

(assert (=> b!906157 m!841955))

(declare-fun m!841957 () Bool)

(assert (=> b!906157 m!841957))

(assert (=> b!906157 m!841951))

(assert (=> b!906157 m!841955))

(declare-fun m!841959 () Bool)

(assert (=> b!906157 m!841959))

(declare-fun m!841961 () Bool)

(assert (=> b!906150 m!841961))

(declare-fun m!841963 () Bool)

(assert (=> b!906153 m!841963))

(declare-fun m!841965 () Bool)

(assert (=> start!77814 m!841965))

(declare-fun m!841967 () Bool)

(assert (=> start!77814 m!841967))

(declare-fun m!841969 () Bool)

(assert (=> start!77814 m!841969))

(declare-fun m!841971 () Bool)

(assert (=> b!906158 m!841971))

(declare-fun m!841973 () Bool)

(assert (=> b!906159 m!841973))

(declare-fun m!841975 () Bool)

(assert (=> b!906159 m!841975))

(declare-fun m!841977 () Bool)

(assert (=> b!906149 m!841977))

(declare-fun m!841979 () Bool)

(assert (=> mapNonEmpty!29686 m!841979))

(declare-fun m!841981 () Bool)

(assert (=> b!906160 m!841981))

(declare-fun m!841983 () Bool)

(assert (=> b!906160 m!841983))

(declare-fun m!841985 () Bool)

(assert (=> b!906154 m!841985))

(declare-fun m!841987 () Bool)

(assert (=> b!906154 m!841987))

(check-sat (not b!906154) (not b!906149) (not b_lambda!13119) (not b!906150) (not mapNonEmpty!29686) (not b!906158) (not start!77814) (not b!906156) tp_is_empty!18649 b_and!26627 (not b_next!16231) (not b!906160) (not b!906159) (not b!906157))
(check-sat b_and!26627 (not b_next!16231))
