; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77842 () Bool)

(assert start!77842)

(declare-fun b_free!16401 () Bool)

(declare-fun b_next!16401 () Bool)

(assert (=> start!77842 (= b_free!16401 (not b_next!16401))))

(declare-fun tp!57467 () Bool)

(declare-fun b_and!26959 () Bool)

(assert (=> start!77842 (= tp!57467 b_and!26959)))

(declare-fun b!908883 () Bool)

(declare-fun e!509409 () Bool)

(declare-fun e!509413 () Bool)

(assert (=> b!908883 (= e!509409 e!509413)))

(declare-fun res!613468 () Bool)

(assert (=> b!908883 (=> (not res!613468) (not e!509413))))

(declare-datatypes ((V!30057 0))(
  ( (V!30058 (val!9460 Int)) )
))
(declare-datatypes ((tuple2!12328 0))(
  ( (tuple2!12329 (_1!6175 (_ BitVec 64)) (_2!6175 V!30057)) )
))
(declare-datatypes ((List!18121 0))(
  ( (Nil!18118) (Cons!18117 (h!19263 tuple2!12328) (t!25694 List!18121)) )
))
(declare-datatypes ((ListLongMap!11025 0))(
  ( (ListLongMap!11026 (toList!5528 List!18121)) )
))
(declare-fun lt!409876 () ListLongMap!11025)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4570 (ListLongMap!11025 (_ BitVec 64)) Bool)

(assert (=> b!908883 (= res!613468 (contains!4570 lt!409876 k0!1033))))

(declare-datatypes ((ValueCell!8928 0))(
  ( (ValueCellFull!8928 (v!11967 V!30057)) (EmptyCell!8928) )
))
(declare-datatypes ((array!53666 0))(
  ( (array!53667 (arr!25791 (Array (_ BitVec 32) ValueCell!8928)) (size!26250 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53666)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30057)

(declare-datatypes ((array!53668 0))(
  ( (array!53669 (arr!25792 (Array (_ BitVec 32) (_ BitVec 64))) (size!26251 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53668)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30057)

(declare-fun getCurrentListMap!2790 (array!53668 array!53666 (_ BitVec 32) (_ BitVec 32) V!30057 V!30057 (_ BitVec 32) Int) ListLongMap!11025)

(assert (=> b!908883 (= lt!409876 (getCurrentListMap!2790 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908884 () Bool)

(declare-fun res!613473 () Bool)

(declare-fun e!509412 () Bool)

(assert (=> b!908884 (=> res!613473 e!509412)))

(declare-fun lt!409878 () ListLongMap!11025)

(declare-fun lt!409880 () V!30057)

(declare-fun apply!508 (ListLongMap!11025 (_ BitVec 64)) V!30057)

(assert (=> b!908884 (= res!613473 (not (= (apply!508 lt!409878 k0!1033) lt!409880)))))

(declare-fun b!908885 () Bool)

(declare-fun res!613466 () Bool)

(assert (=> b!908885 (=> (not res!613466) (not e!509409))))

(declare-datatypes ((List!18122 0))(
  ( (Nil!18119) (Cons!18118 (h!19264 (_ BitVec 64)) (t!25695 List!18122)) )
))
(declare-fun arrayNoDuplicates!0 (array!53668 (_ BitVec 32) List!18122) Bool)

(assert (=> b!908885 (= res!613466 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18119))))

(declare-fun b!908886 () Bool)

(assert (=> b!908886 (= e!509412 (bvsle #b00000000000000000000000000000000 (size!26251 _keys!1386)))))

(assert (=> b!908886 (= (apply!508 lt!409876 k0!1033) lt!409880)))

(declare-datatypes ((Unit!30848 0))(
  ( (Unit!30849) )
))
(declare-fun lt!409879 () Unit!30848)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun lemmaListMapApplyFromThenApplyFromZero!59 (array!53668 array!53666 (_ BitVec 32) (_ BitVec 32) V!30057 V!30057 (_ BitVec 64) V!30057 (_ BitVec 32) Int) Unit!30848)

(assert (=> b!908886 (= lt!409879 (lemmaListMapApplyFromThenApplyFromZero!59 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409880 i!717 defaultEntry!1160))))

(declare-fun b!908887 () Bool)

(declare-fun e!509414 () Bool)

(assert (=> b!908887 (= e!509414 e!509412)))

(declare-fun res!613470 () Bool)

(assert (=> b!908887 (=> res!613470 e!509412)))

(assert (=> b!908887 (= res!613470 (not (contains!4570 lt!409878 k0!1033)))))

(assert (=> b!908887 (= lt!409878 (getCurrentListMap!2790 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!613469 () Bool)

(assert (=> start!77842 (=> (not res!613469) (not e!509409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77842 (= res!613469 (validMask!0 mask!1756))))

(assert (=> start!77842 e!509409))

(declare-fun e!509410 () Bool)

(declare-fun array_inv!20188 (array!53666) Bool)

(assert (=> start!77842 (and (array_inv!20188 _values!1152) e!509410)))

(assert (=> start!77842 tp!57467))

(assert (=> start!77842 true))

(declare-fun tp_is_empty!18819 () Bool)

(assert (=> start!77842 tp_is_empty!18819))

(declare-fun array_inv!20189 (array!53668) Bool)

(assert (=> start!77842 (array_inv!20189 _keys!1386)))

(declare-fun b!908888 () Bool)

(declare-fun e!509411 () Bool)

(assert (=> b!908888 (= e!509411 tp_is_empty!18819)))

(declare-fun b!908889 () Bool)

(declare-fun res!613464 () Bool)

(assert (=> b!908889 (=> (not res!613464) (not e!509409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53668 (_ BitVec 32)) Bool)

(assert (=> b!908889 (= res!613464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908890 () Bool)

(declare-fun e!509408 () Bool)

(assert (=> b!908890 (= e!509408 tp_is_empty!18819)))

(declare-fun mapIsEmpty!29944 () Bool)

(declare-fun mapRes!29944 () Bool)

(assert (=> mapIsEmpty!29944 mapRes!29944))

(declare-fun mapNonEmpty!29944 () Bool)

(declare-fun tp!57468 () Bool)

(assert (=> mapNonEmpty!29944 (= mapRes!29944 (and tp!57468 e!509411))))

(declare-fun mapValue!29944 () ValueCell!8928)

(declare-fun mapKey!29944 () (_ BitVec 32))

(declare-fun mapRest!29944 () (Array (_ BitVec 32) ValueCell!8928))

(assert (=> mapNonEmpty!29944 (= (arr!25791 _values!1152) (store mapRest!29944 mapKey!29944 mapValue!29944))))

(declare-fun b!908891 () Bool)

(assert (=> b!908891 (= e!509410 (and e!509408 mapRes!29944))))

(declare-fun condMapEmpty!29944 () Bool)

(declare-fun mapDefault!29944 () ValueCell!8928)

(assert (=> b!908891 (= condMapEmpty!29944 (= (arr!25791 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8928)) mapDefault!29944)))))

(declare-fun b!908892 () Bool)

(declare-fun res!613465 () Bool)

(assert (=> b!908892 (=> (not res!613465) (not e!509413))))

(assert (=> b!908892 (= res!613465 (and (= (select (arr!25792 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908893 () Bool)

(assert (=> b!908893 (= e!509413 (not e!509414))))

(declare-fun res!613471 () Bool)

(assert (=> b!908893 (=> res!613471 e!509414)))

(assert (=> b!908893 (= res!613471 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26251 _keys!1386))))))

(declare-fun get!13581 (ValueCell!8928 V!30057) V!30057)

(declare-fun dynLambda!1384 (Int (_ BitVec 64)) V!30057)

(assert (=> b!908893 (= lt!409880 (get!13581 (select (arr!25791 _values!1152) i!717) (dynLambda!1384 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908893 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409877 () Unit!30848)

(declare-fun lemmaKeyInListMapIsInArray!256 (array!53668 array!53666 (_ BitVec 32) (_ BitVec 32) V!30057 V!30057 (_ BitVec 64) Int) Unit!30848)

(assert (=> b!908893 (= lt!409877 (lemmaKeyInListMapIsInArray!256 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908894 () Bool)

(declare-fun res!613472 () Bool)

(assert (=> b!908894 (=> (not res!613472) (not e!509413))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908894 (= res!613472 (inRange!0 i!717 mask!1756))))

(declare-fun b!908895 () Bool)

(declare-fun res!613467 () Bool)

(assert (=> b!908895 (=> (not res!613467) (not e!509409))))

(assert (=> b!908895 (= res!613467 (and (= (size!26250 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26251 _keys!1386) (size!26250 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77842 res!613469) b!908895))

(assert (= (and b!908895 res!613467) b!908889))

(assert (= (and b!908889 res!613464) b!908885))

(assert (= (and b!908885 res!613466) b!908883))

(assert (= (and b!908883 res!613468) b!908894))

(assert (= (and b!908894 res!613472) b!908892))

(assert (= (and b!908892 res!613465) b!908893))

(assert (= (and b!908893 (not res!613471)) b!908887))

(assert (= (and b!908887 (not res!613470)) b!908884))

(assert (= (and b!908884 (not res!613473)) b!908886))

(assert (= (and b!908891 condMapEmpty!29944) mapIsEmpty!29944))

(assert (= (and b!908891 (not condMapEmpty!29944)) mapNonEmpty!29944))

(get-info :version)

(assert (= (and mapNonEmpty!29944 ((_ is ValueCellFull!8928) mapValue!29944)) b!908888))

(assert (= (and b!908891 ((_ is ValueCellFull!8928) mapDefault!29944)) b!908890))

(assert (= start!77842 b!908891))

(declare-fun b_lambda!13285 () Bool)

(assert (=> (not b_lambda!13285) (not b!908893)))

(declare-fun t!25693 () Bool)

(declare-fun tb!5423 () Bool)

(assert (=> (and start!77842 (= defaultEntry!1160 defaultEntry!1160) t!25693) tb!5423))

(declare-fun result!10643 () Bool)

(assert (=> tb!5423 (= result!10643 tp_is_empty!18819)))

(assert (=> b!908893 t!25693))

(declare-fun b_and!26961 () Bool)

(assert (= b_and!26959 (and (=> t!25693 result!10643) b_and!26961)))

(declare-fun m!844209 () Bool)

(assert (=> b!908885 m!844209))

(declare-fun m!844211 () Bool)

(assert (=> b!908889 m!844211))

(declare-fun m!844213 () Bool)

(assert (=> b!908887 m!844213))

(declare-fun m!844215 () Bool)

(assert (=> b!908887 m!844215))

(declare-fun m!844217 () Bool)

(assert (=> b!908894 m!844217))

(declare-fun m!844219 () Bool)

(assert (=> b!908884 m!844219))

(declare-fun m!844221 () Bool)

(assert (=> mapNonEmpty!29944 m!844221))

(declare-fun m!844223 () Bool)

(assert (=> b!908886 m!844223))

(declare-fun m!844225 () Bool)

(assert (=> b!908886 m!844225))

(declare-fun m!844227 () Bool)

(assert (=> b!908893 m!844227))

(declare-fun m!844229 () Bool)

(assert (=> b!908893 m!844229))

(declare-fun m!844231 () Bool)

(assert (=> b!908893 m!844231))

(declare-fun m!844233 () Bool)

(assert (=> b!908893 m!844233))

(assert (=> b!908893 m!844227))

(assert (=> b!908893 m!844231))

(declare-fun m!844235 () Bool)

(assert (=> b!908893 m!844235))

(declare-fun m!844237 () Bool)

(assert (=> start!77842 m!844237))

(declare-fun m!844239 () Bool)

(assert (=> start!77842 m!844239))

(declare-fun m!844241 () Bool)

(assert (=> start!77842 m!844241))

(declare-fun m!844243 () Bool)

(assert (=> b!908892 m!844243))

(declare-fun m!844245 () Bool)

(assert (=> b!908883 m!844245))

(declare-fun m!844247 () Bool)

(assert (=> b!908883 m!844247))

(check-sat tp_is_empty!18819 (not mapNonEmpty!29944) b_and!26961 (not b!908894) (not start!77842) (not b!908885) (not b!908883) (not b!908886) (not b!908893) (not b_next!16401) (not b!908887) (not b_lambda!13285) (not b!908884) (not b!908889))
(check-sat b_and!26961 (not b_next!16401))
