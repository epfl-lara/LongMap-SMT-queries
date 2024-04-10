; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78770 () Bool)

(assert start!78770)

(declare-fun b_free!16983 () Bool)

(declare-fun b_next!16983 () Bool)

(assert (=> start!78770 (= b_free!16983 (not b_next!16983))))

(declare-fun tp!59390 () Bool)

(declare-fun b_and!27703 () Bool)

(assert (=> start!78770 (= tp!59390 b_and!27703)))

(declare-fun b!919231 () Bool)

(declare-fun e!515981 () Bool)

(assert (=> b!919231 (= e!515981 (not true))))

(declare-datatypes ((array!54966 0))(
  ( (array!54967 (arr!26428 (Array (_ BitVec 32) (_ BitVec 64))) (size!26887 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54966)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18538 0))(
  ( (Nil!18535) (Cons!18534 (h!19680 (_ BitVec 64)) (t!26251 List!18538)) )
))
(declare-fun arrayNoDuplicates!0 (array!54966 (_ BitVec 32) List!18538) Bool)

(assert (=> b!919231 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18535)))

(declare-datatypes ((Unit!31032 0))(
  ( (Unit!31033) )
))
(declare-fun lt!412597 () Unit!31032)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54966 (_ BitVec 32) (_ BitVec 32)) Unit!31032)

(assert (=> b!919231 (= lt!412597 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!30953 0))(
  ( (V!30954 (val!9796 Int)) )
))
(declare-datatypes ((tuple2!12734 0))(
  ( (tuple2!12735 (_1!6378 (_ BitVec 64)) (_2!6378 V!30953)) )
))
(declare-datatypes ((List!18539 0))(
  ( (Nil!18536) (Cons!18535 (h!19681 tuple2!12734) (t!26252 List!18539)) )
))
(declare-datatypes ((ListLongMap!11431 0))(
  ( (ListLongMap!11432 (toList!5731 List!18539)) )
))
(declare-fun lt!412599 () ListLongMap!11431)

(declare-fun lt!412602 () tuple2!12734)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4777 (ListLongMap!11431 (_ BitVec 64)) Bool)

(declare-fun +!2642 (ListLongMap!11431 tuple2!12734) ListLongMap!11431)

(assert (=> b!919231 (contains!4777 (+!2642 lt!412599 lt!412602) k0!1099)))

(declare-fun lt!412603 () Unit!31032)

(declare-fun lt!412598 () (_ BitVec 64))

(declare-fun lt!412600 () V!30953)

(declare-fun addStillContains!366 (ListLongMap!11431 (_ BitVec 64) V!30953 (_ BitVec 64)) Unit!31032)

(assert (=> b!919231 (= lt!412603 (addStillContains!366 lt!412599 lt!412598 lt!412600 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9264 0))(
  ( (ValueCellFull!9264 (v!12314 V!30953)) (EmptyCell!9264) )
))
(declare-datatypes ((array!54968 0))(
  ( (array!54969 (arr!26429 (Array (_ BitVec 32) ValueCell!9264)) (size!26888 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54968)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30953)

(declare-fun minValue!1173 () V!30953)

(declare-fun getCurrentListMap!2987 (array!54966 array!54968 (_ BitVec 32) (_ BitVec 32) V!30953 V!30953 (_ BitVec 32) Int) ListLongMap!11431)

(assert (=> b!919231 (= (getCurrentListMap!2987 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2642 (getCurrentListMap!2987 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412602))))

(assert (=> b!919231 (= lt!412602 (tuple2!12735 lt!412598 lt!412600))))

(declare-fun get!13859 (ValueCell!9264 V!30953) V!30953)

(declare-fun dynLambda!1431 (Int (_ BitVec 64)) V!30953)

(assert (=> b!919231 (= lt!412600 (get!13859 (select (arr!26429 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1431 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412601 () Unit!31032)

(declare-fun lemmaListMapRecursiveValidKeyArray!32 (array!54966 array!54968 (_ BitVec 32) (_ BitVec 32) V!30953 V!30953 (_ BitVec 32) Int) Unit!31032)

(assert (=> b!919231 (= lt!412601 (lemmaListMapRecursiveValidKeyArray!32 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919232 () Bool)

(declare-fun e!515985 () Bool)

(assert (=> b!919232 (= e!515985 e!515981)))

(declare-fun res!619819 () Bool)

(assert (=> b!919232 (=> (not res!619819) (not e!515981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919232 (= res!619819 (validKeyInArray!0 lt!412598))))

(assert (=> b!919232 (= lt!412598 (select (arr!26428 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919233 () Bool)

(declare-fun e!515983 () Bool)

(assert (=> b!919233 (= e!515983 e!515985)))

(declare-fun res!619812 () Bool)

(assert (=> b!919233 (=> (not res!619812) (not e!515985))))

(assert (=> b!919233 (= res!619812 (contains!4777 lt!412599 k0!1099))))

(assert (=> b!919233 (= lt!412599 (getCurrentListMap!2987 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!619810 () Bool)

(assert (=> start!78770 (=> (not res!619810) (not e!515983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78770 (= res!619810 (validMask!0 mask!1881))))

(assert (=> start!78770 e!515983))

(assert (=> start!78770 true))

(declare-fun tp_is_empty!19491 () Bool)

(assert (=> start!78770 tp_is_empty!19491))

(declare-fun e!515980 () Bool)

(declare-fun array_inv!20598 (array!54968) Bool)

(assert (=> start!78770 (and (array_inv!20598 _values!1231) e!515980)))

(assert (=> start!78770 tp!59390))

(declare-fun array_inv!20599 (array!54966) Bool)

(assert (=> start!78770 (array_inv!20599 _keys!1487)))

(declare-fun b!919234 () Bool)

(declare-fun res!619811 () Bool)

(assert (=> b!919234 (=> (not res!619811) (not e!515983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54966 (_ BitVec 32)) Bool)

(assert (=> b!919234 (= res!619811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919235 () Bool)

(declare-fun res!619816 () Bool)

(assert (=> b!919235 (=> (not res!619816) (not e!515985))))

(assert (=> b!919235 (= res!619816 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!30993 () Bool)

(declare-fun mapRes!30993 () Bool)

(assert (=> mapIsEmpty!30993 mapRes!30993))

(declare-fun b!919236 () Bool)

(declare-fun res!619813 () Bool)

(assert (=> b!919236 (=> (not res!619813) (not e!515985))))

(declare-fun v!791 () V!30953)

(declare-fun apply!576 (ListLongMap!11431 (_ BitVec 64)) V!30953)

(assert (=> b!919236 (= res!619813 (= (apply!576 lt!412599 k0!1099) v!791))))

(declare-fun b!919237 () Bool)

(declare-fun res!619814 () Bool)

(assert (=> b!919237 (=> (not res!619814) (not e!515985))))

(assert (=> b!919237 (= res!619814 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!30993 () Bool)

(declare-fun tp!59389 () Bool)

(declare-fun e!515982 () Bool)

(assert (=> mapNonEmpty!30993 (= mapRes!30993 (and tp!59389 e!515982))))

(declare-fun mapRest!30993 () (Array (_ BitVec 32) ValueCell!9264))

(declare-fun mapValue!30993 () ValueCell!9264)

(declare-fun mapKey!30993 () (_ BitVec 32))

(assert (=> mapNonEmpty!30993 (= (arr!26429 _values!1231) (store mapRest!30993 mapKey!30993 mapValue!30993))))

(declare-fun b!919238 () Bool)

(assert (=> b!919238 (= e!515982 tp_is_empty!19491)))

(declare-fun b!919239 () Bool)

(declare-fun res!619815 () Bool)

(assert (=> b!919239 (=> (not res!619815) (not e!515983))))

(assert (=> b!919239 (= res!619815 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18535))))

(declare-fun b!919240 () Bool)

(declare-fun e!515984 () Bool)

(assert (=> b!919240 (= e!515980 (and e!515984 mapRes!30993))))

(declare-fun condMapEmpty!30993 () Bool)

(declare-fun mapDefault!30993 () ValueCell!9264)

(assert (=> b!919240 (= condMapEmpty!30993 (= (arr!26429 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9264)) mapDefault!30993)))))

(declare-fun b!919241 () Bool)

(assert (=> b!919241 (= e!515984 tp_is_empty!19491)))

(declare-fun b!919242 () Bool)

(declare-fun res!619817 () Bool)

(assert (=> b!919242 (=> (not res!619817) (not e!515983))))

(assert (=> b!919242 (= res!619817 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26887 _keys!1487))))))

(declare-fun b!919243 () Bool)

(declare-fun res!619818 () Bool)

(assert (=> b!919243 (=> (not res!619818) (not e!515983))))

(assert (=> b!919243 (= res!619818 (and (= (size!26888 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26887 _keys!1487) (size!26888 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78770 res!619810) b!919243))

(assert (= (and b!919243 res!619818) b!919234))

(assert (= (and b!919234 res!619811) b!919239))

(assert (= (and b!919239 res!619815) b!919242))

(assert (= (and b!919242 res!619817) b!919233))

(assert (= (and b!919233 res!619812) b!919236))

(assert (= (and b!919236 res!619813) b!919235))

(assert (= (and b!919235 res!619816) b!919237))

(assert (= (and b!919237 res!619814) b!919232))

(assert (= (and b!919232 res!619819) b!919231))

(assert (= (and b!919240 condMapEmpty!30993) mapIsEmpty!30993))

(assert (= (and b!919240 (not condMapEmpty!30993)) mapNonEmpty!30993))

(get-info :version)

(assert (= (and mapNonEmpty!30993 ((_ is ValueCellFull!9264) mapValue!30993)) b!919238))

(assert (= (and b!919240 ((_ is ValueCellFull!9264) mapDefault!30993)) b!919241))

(assert (= start!78770 b!919240))

(declare-fun b_lambda!13485 () Bool)

(assert (=> (not b_lambda!13485) (not b!919231)))

(declare-fun t!26250 () Bool)

(declare-fun tb!5563 () Bool)

(assert (=> (and start!78770 (= defaultEntry!1235 defaultEntry!1235) t!26250) tb!5563))

(declare-fun result!10949 () Bool)

(assert (=> tb!5563 (= result!10949 tp_is_empty!19491)))

(assert (=> b!919231 t!26250))

(declare-fun b_and!27705 () Bool)

(assert (= b_and!27703 (and (=> t!26250 result!10949) b_and!27705)))

(declare-fun m!852975 () Bool)

(assert (=> b!919239 m!852975))

(declare-fun m!852977 () Bool)

(assert (=> start!78770 m!852977))

(declare-fun m!852979 () Bool)

(assert (=> start!78770 m!852979))

(declare-fun m!852981 () Bool)

(assert (=> start!78770 m!852981))

(declare-fun m!852983 () Bool)

(assert (=> b!919234 m!852983))

(declare-fun m!852985 () Bool)

(assert (=> b!919236 m!852985))

(declare-fun m!852987 () Bool)

(assert (=> b!919233 m!852987))

(declare-fun m!852989 () Bool)

(assert (=> b!919233 m!852989))

(declare-fun m!852991 () Bool)

(assert (=> mapNonEmpty!30993 m!852991))

(declare-fun m!852993 () Bool)

(assert (=> b!919237 m!852993))

(declare-fun m!852995 () Bool)

(assert (=> b!919231 m!852995))

(declare-fun m!852997 () Bool)

(assert (=> b!919231 m!852997))

(declare-fun m!852999 () Bool)

(assert (=> b!919231 m!852999))

(declare-fun m!853001 () Bool)

(assert (=> b!919231 m!853001))

(declare-fun m!853003 () Bool)

(assert (=> b!919231 m!853003))

(declare-fun m!853005 () Bool)

(assert (=> b!919231 m!853005))

(assert (=> b!919231 m!853003))

(declare-fun m!853007 () Bool)

(assert (=> b!919231 m!853007))

(declare-fun m!853009 () Bool)

(assert (=> b!919231 m!853009))

(declare-fun m!853011 () Bool)

(assert (=> b!919231 m!853011))

(declare-fun m!853013 () Bool)

(assert (=> b!919231 m!853013))

(assert (=> b!919231 m!853001))

(declare-fun m!853015 () Bool)

(assert (=> b!919231 m!853015))

(assert (=> b!919231 m!853005))

(assert (=> b!919231 m!852995))

(declare-fun m!853017 () Bool)

(assert (=> b!919231 m!853017))

(declare-fun m!853019 () Bool)

(assert (=> b!919232 m!853019))

(declare-fun m!853021 () Bool)

(assert (=> b!919232 m!853021))

(check-sat (not b!919231) (not b!919239) (not start!78770) (not b!919233) (not b_next!16983) (not b!919237) tp_is_empty!19491 (not mapNonEmpty!30993) (not b!919236) (not b_lambda!13485) b_and!27705 (not b!919234) (not b!919232))
(check-sat b_and!27705 (not b_next!16983))
