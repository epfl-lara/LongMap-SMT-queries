; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111562 () Bool)

(assert start!111562)

(declare-fun b_free!30219 () Bool)

(declare-fun b_next!30219 () Bool)

(assert (=> start!111562 (= b_free!30219 (not b_next!30219))))

(declare-fun tp!106133 () Bool)

(declare-fun b_and!48597 () Bool)

(assert (=> start!111562 (= tp!106133 b_and!48597)))

(declare-fun mapIsEmpty!55706 () Bool)

(declare-fun mapRes!55706 () Bool)

(assert (=> mapIsEmpty!55706 mapRes!55706))

(declare-fun b!1321050 () Bool)

(declare-fun res!876806 () Bool)

(declare-fun e!753481 () Bool)

(assert (=> b!1321050 (=> (not res!876806) (not e!753481))))

(declare-datatypes ((array!89008 0))(
  ( (array!89009 (arr!42978 (Array (_ BitVec 32) (_ BitVec 64))) (size!43528 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89008)

(declare-datatypes ((List!30453 0))(
  ( (Nil!30450) (Cons!30449 (h!31658 (_ BitVec 64)) (t!44221 List!30453)) )
))
(declare-fun arrayNoDuplicates!0 (array!89008 (_ BitVec 32) List!30453) Bool)

(assert (=> b!1321050 (= res!876806 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30450))))

(declare-fun b!1321051 () Bool)

(assert (=> b!1321051 (= e!753481 (not true))))

(declare-datatypes ((V!53155 0))(
  ( (V!53156 (val!18094 Int)) )
))
(declare-datatypes ((tuple2!23304 0))(
  ( (tuple2!23305 (_1!11663 (_ BitVec 64)) (_2!11663 V!53155)) )
))
(declare-datatypes ((List!30454 0))(
  ( (Nil!30451) (Cons!30450 (h!31659 tuple2!23304) (t!44222 List!30454)) )
))
(declare-datatypes ((ListLongMap!20961 0))(
  ( (ListLongMap!20962 (toList!10496 List!30454)) )
))
(declare-fun lt!587230 () ListLongMap!20961)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8651 (ListLongMap!20961 (_ BitVec 64)) Bool)

(assert (=> b!1321051 (contains!8651 lt!587230 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!587229 () V!53155)

(declare-datatypes ((Unit!43526 0))(
  ( (Unit!43527) )
))
(declare-fun lt!587235 () Unit!43526)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!149 ((_ BitVec 64) (_ BitVec 64) V!53155 ListLongMap!20961) Unit!43526)

(assert (=> b!1321051 (= lt!587235 (lemmaInListMapAfterAddingDiffThenInBefore!149 k0!1164 (select (arr!42978 _keys!1609) from!2000) lt!587229 lt!587230))))

(declare-fun lt!587231 () ListLongMap!20961)

(assert (=> b!1321051 (contains!8651 lt!587231 k0!1164)))

(declare-fun zeroValue!1279 () V!53155)

(declare-fun lt!587232 () Unit!43526)

(assert (=> b!1321051 (= lt!587232 (lemmaInListMapAfterAddingDiffThenInBefore!149 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587231))))

(declare-fun lt!587234 () ListLongMap!20961)

(assert (=> b!1321051 (contains!8651 lt!587234 k0!1164)))

(declare-fun lt!587233 () Unit!43526)

(declare-fun minValue!1279 () V!53155)

(assert (=> b!1321051 (= lt!587233 (lemmaInListMapAfterAddingDiffThenInBefore!149 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587234))))

(declare-fun +!4553 (ListLongMap!20961 tuple2!23304) ListLongMap!20961)

(assert (=> b!1321051 (= lt!587234 (+!4553 lt!587231 (tuple2!23305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321051 (= lt!587231 (+!4553 lt!587230 (tuple2!23305 (select (arr!42978 _keys!1609) from!2000) lt!587229)))))

(declare-datatypes ((ValueCell!17121 0))(
  ( (ValueCellFull!17121 (v!20724 V!53155)) (EmptyCell!17121) )
))
(declare-datatypes ((array!89010 0))(
  ( (array!89011 (arr!42979 (Array (_ BitVec 32) ValueCell!17121)) (size!43529 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89010)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21617 (ValueCell!17121 V!53155) V!53155)

(declare-fun dynLambda!3492 (Int (_ BitVec 64)) V!53155)

(assert (=> b!1321051 (= lt!587229 (get!21617 (select (arr!42979 _values!1337) from!2000) (dynLambda!3492 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6188 (array!89008 array!89010 (_ BitVec 32) (_ BitVec 32) V!53155 V!53155 (_ BitVec 32) Int) ListLongMap!20961)

(assert (=> b!1321051 (= lt!587230 (getCurrentListMapNoExtraKeys!6188 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321052 () Bool)

(declare-fun res!876808 () Bool)

(assert (=> b!1321052 (=> (not res!876808) (not e!753481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321052 (= res!876808 (validKeyInArray!0 (select (arr!42978 _keys!1609) from!2000)))))

(declare-fun b!1321053 () Bool)

(declare-fun res!876811 () Bool)

(assert (=> b!1321053 (=> (not res!876811) (not e!753481))))

(assert (=> b!1321053 (= res!876811 (and (= (size!43529 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43528 _keys!1609) (size!43529 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321054 () Bool)

(declare-fun e!753482 () Bool)

(declare-fun tp_is_empty!36039 () Bool)

(assert (=> b!1321054 (= e!753482 tp_is_empty!36039)))

(declare-fun b!1321055 () Bool)

(declare-fun e!753483 () Bool)

(declare-fun e!753480 () Bool)

(assert (=> b!1321055 (= e!753483 (and e!753480 mapRes!55706))))

(declare-fun condMapEmpty!55706 () Bool)

(declare-fun mapDefault!55706 () ValueCell!17121)

(assert (=> b!1321055 (= condMapEmpty!55706 (= (arr!42979 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17121)) mapDefault!55706)))))

(declare-fun res!876807 () Bool)

(assert (=> start!111562 (=> (not res!876807) (not e!753481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111562 (= res!876807 (validMask!0 mask!2019))))

(assert (=> start!111562 e!753481))

(declare-fun array_inv!32445 (array!89008) Bool)

(assert (=> start!111562 (array_inv!32445 _keys!1609)))

(assert (=> start!111562 true))

(assert (=> start!111562 tp_is_empty!36039))

(declare-fun array_inv!32446 (array!89010) Bool)

(assert (=> start!111562 (and (array_inv!32446 _values!1337) e!753483)))

(assert (=> start!111562 tp!106133))

(declare-fun b!1321056 () Bool)

(declare-fun res!876812 () Bool)

(assert (=> b!1321056 (=> (not res!876812) (not e!753481))))

(assert (=> b!1321056 (= res!876812 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43528 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321057 () Bool)

(assert (=> b!1321057 (= e!753480 tp_is_empty!36039)))

(declare-fun b!1321058 () Bool)

(declare-fun res!876810 () Bool)

(assert (=> b!1321058 (=> (not res!876810) (not e!753481))))

(declare-fun getCurrentListMap!5499 (array!89008 array!89010 (_ BitVec 32) (_ BitVec 32) V!53155 V!53155 (_ BitVec 32) Int) ListLongMap!20961)

(assert (=> b!1321058 (= res!876810 (contains!8651 (getCurrentListMap!5499 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321059 () Bool)

(declare-fun res!876809 () Bool)

(assert (=> b!1321059 (=> (not res!876809) (not e!753481))))

(assert (=> b!1321059 (= res!876809 (not (= (select (arr!42978 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55706 () Bool)

(declare-fun tp!106132 () Bool)

(assert (=> mapNonEmpty!55706 (= mapRes!55706 (and tp!106132 e!753482))))

(declare-fun mapRest!55706 () (Array (_ BitVec 32) ValueCell!17121))

(declare-fun mapKey!55706 () (_ BitVec 32))

(declare-fun mapValue!55706 () ValueCell!17121)

(assert (=> mapNonEmpty!55706 (= (arr!42979 _values!1337) (store mapRest!55706 mapKey!55706 mapValue!55706))))

(declare-fun b!1321060 () Bool)

(declare-fun res!876805 () Bool)

(assert (=> b!1321060 (=> (not res!876805) (not e!753481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89008 (_ BitVec 32)) Bool)

(assert (=> b!1321060 (= res!876805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111562 res!876807) b!1321053))

(assert (= (and b!1321053 res!876811) b!1321060))

(assert (= (and b!1321060 res!876805) b!1321050))

(assert (= (and b!1321050 res!876806) b!1321056))

(assert (= (and b!1321056 res!876812) b!1321058))

(assert (= (and b!1321058 res!876810) b!1321059))

(assert (= (and b!1321059 res!876809) b!1321052))

(assert (= (and b!1321052 res!876808) b!1321051))

(assert (= (and b!1321055 condMapEmpty!55706) mapIsEmpty!55706))

(assert (= (and b!1321055 (not condMapEmpty!55706)) mapNonEmpty!55706))

(get-info :version)

(assert (= (and mapNonEmpty!55706 ((_ is ValueCellFull!17121) mapValue!55706)) b!1321054))

(assert (= (and b!1321055 ((_ is ValueCellFull!17121) mapDefault!55706)) b!1321057))

(assert (= start!111562 b!1321055))

(declare-fun b_lambda!23545 () Bool)

(assert (=> (not b_lambda!23545) (not b!1321051)))

(declare-fun t!44220 () Bool)

(declare-fun tb!11571 () Bool)

(assert (=> (and start!111562 (= defaultEntry!1340 defaultEntry!1340) t!44220) tb!11571))

(declare-fun result!24197 () Bool)

(assert (=> tb!11571 (= result!24197 tp_is_empty!36039)))

(assert (=> b!1321051 t!44220))

(declare-fun b_and!48599 () Bool)

(assert (= b_and!48597 (and (=> t!44220 result!24197) b_and!48599)))

(declare-fun m!1208879 () Bool)

(assert (=> b!1321050 m!1208879))

(declare-fun m!1208881 () Bool)

(assert (=> b!1321051 m!1208881))

(declare-fun m!1208883 () Bool)

(assert (=> b!1321051 m!1208883))

(declare-fun m!1208885 () Bool)

(assert (=> b!1321051 m!1208885))

(declare-fun m!1208887 () Bool)

(assert (=> b!1321051 m!1208887))

(declare-fun m!1208889 () Bool)

(assert (=> b!1321051 m!1208889))

(declare-fun m!1208891 () Bool)

(assert (=> b!1321051 m!1208891))

(assert (=> b!1321051 m!1208891))

(assert (=> b!1321051 m!1208881))

(declare-fun m!1208893 () Bool)

(assert (=> b!1321051 m!1208893))

(assert (=> b!1321051 m!1208883))

(declare-fun m!1208895 () Bool)

(assert (=> b!1321051 m!1208895))

(declare-fun m!1208897 () Bool)

(assert (=> b!1321051 m!1208897))

(declare-fun m!1208899 () Bool)

(assert (=> b!1321051 m!1208899))

(declare-fun m!1208901 () Bool)

(assert (=> b!1321051 m!1208901))

(declare-fun m!1208903 () Bool)

(assert (=> b!1321051 m!1208903))

(declare-fun m!1208905 () Bool)

(assert (=> b!1321051 m!1208905))

(declare-fun m!1208907 () Bool)

(assert (=> b!1321058 m!1208907))

(assert (=> b!1321058 m!1208907))

(declare-fun m!1208909 () Bool)

(assert (=> b!1321058 m!1208909))

(assert (=> b!1321052 m!1208883))

(assert (=> b!1321052 m!1208883))

(declare-fun m!1208911 () Bool)

(assert (=> b!1321052 m!1208911))

(declare-fun m!1208913 () Bool)

(assert (=> b!1321060 m!1208913))

(assert (=> b!1321059 m!1208883))

(declare-fun m!1208915 () Bool)

(assert (=> mapNonEmpty!55706 m!1208915))

(declare-fun m!1208917 () Bool)

(assert (=> start!111562 m!1208917))

(declare-fun m!1208919 () Bool)

(assert (=> start!111562 m!1208919))

(declare-fun m!1208921 () Bool)

(assert (=> start!111562 m!1208921))

(check-sat (not b!1321058) tp_is_empty!36039 (not b!1321050) (not mapNonEmpty!55706) (not b!1321051) b_and!48599 (not b!1321052) (not start!111562) (not b_lambda!23545) (not b_next!30219) (not b!1321060))
(check-sat b_and!48599 (not b_next!30219))
