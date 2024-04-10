; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77660 () Bool)

(assert start!77660)

(declare-fun b_free!16245 () Bool)

(declare-fun b_next!16245 () Bool)

(assert (=> start!77660 (= b_free!16245 (not b_next!16245))))

(declare-fun tp!56996 () Bool)

(declare-fun b_and!26643 () Bool)

(assert (=> start!77660 (= tp!56996 b_and!26643)))

(declare-fun b!905533 () Bool)

(declare-fun res!611063 () Bool)

(declare-fun e!507437 () Bool)

(assert (=> b!905533 (=> (not res!611063) (not e!507437))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53368 0))(
  ( (array!53369 (arr!25643 (Array (_ BitVec 32) (_ BitVec 64))) (size!26102 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53368)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!905533 (= res!611063 (and (= (select (arr!25643 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905534 () Bool)

(declare-fun res!611065 () Bool)

(declare-fun e!507434 () Bool)

(assert (=> b!905534 (=> (not res!611065) (not e!507434))))

(declare-datatypes ((V!29849 0))(
  ( (V!29850 (val!9382 Int)) )
))
(declare-datatypes ((ValueCell!8850 0))(
  ( (ValueCellFull!8850 (v!11887 V!29849)) (EmptyCell!8850) )
))
(declare-datatypes ((array!53370 0))(
  ( (array!53371 (arr!25644 (Array (_ BitVec 32) ValueCell!8850)) (size!26103 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53370)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!905534 (= res!611065 (and (= (size!26103 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26102 _keys!1386) (size!26103 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905535 () Bool)

(declare-fun e!507440 () Bool)

(declare-fun e!507441 () Bool)

(assert (=> b!905535 (= e!507440 e!507441)))

(declare-fun res!611060 () Bool)

(assert (=> b!905535 (=> res!611060 e!507441)))

(declare-datatypes ((tuple2!12204 0))(
  ( (tuple2!12205 (_1!6113 (_ BitVec 64)) (_2!6113 V!29849)) )
))
(declare-datatypes ((List!18014 0))(
  ( (Nil!18011) (Cons!18010 (h!19156 tuple2!12204) (t!25431 List!18014)) )
))
(declare-datatypes ((ListLongMap!10901 0))(
  ( (ListLongMap!10902 (toList!5466 List!18014)) )
))
(declare-fun lt!408591 () ListLongMap!10901)

(declare-fun contains!4511 (ListLongMap!10901 (_ BitVec 64)) Bool)

(assert (=> b!905535 (= res!611060 (not (contains!4511 lt!408591 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29849)

(declare-fun minValue!1094 () V!29849)

(declare-fun getCurrentListMap!2732 (array!53368 array!53370 (_ BitVec 32) (_ BitVec 32) V!29849 V!29849 (_ BitVec 32) Int) ListLongMap!10901)

(assert (=> b!905535 (= lt!408591 (getCurrentListMap!2732 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905536 () Bool)

(declare-fun res!611061 () Bool)

(assert (=> b!905536 (=> res!611061 e!507441)))

(declare-fun lt!408590 () V!29849)

(declare-fun apply!455 (ListLongMap!10901 (_ BitVec 64)) V!29849)

(assert (=> b!905536 (= res!611061 (not (= (apply!455 lt!408591 k0!1033) lt!408590)))))

(declare-fun mapIsEmpty!29707 () Bool)

(declare-fun mapRes!29707 () Bool)

(assert (=> mapIsEmpty!29707 mapRes!29707))

(declare-fun b!905537 () Bool)

(assert (=> b!905537 (= e!507434 e!507437)))

(declare-fun res!611068 () Bool)

(assert (=> b!905537 (=> (not res!611068) (not e!507437))))

(declare-fun lt!408589 () ListLongMap!10901)

(assert (=> b!905537 (= res!611068 (contains!4511 lt!408589 k0!1033))))

(assert (=> b!905537 (= lt!408589 (getCurrentListMap!2732 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905538 () Bool)

(declare-fun res!611064 () Bool)

(assert (=> b!905538 (=> (not res!611064) (not e!507434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53368 (_ BitVec 32)) Bool)

(assert (=> b!905538 (= res!611064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29707 () Bool)

(declare-fun tp!56997 () Bool)

(declare-fun e!507438 () Bool)

(assert (=> mapNonEmpty!29707 (= mapRes!29707 (and tp!56997 e!507438))))

(declare-fun mapRest!29707 () (Array (_ BitVec 32) ValueCell!8850))

(declare-fun mapKey!29707 () (_ BitVec 32))

(declare-fun mapValue!29707 () ValueCell!8850)

(assert (=> mapNonEmpty!29707 (= (arr!25644 _values!1152) (store mapRest!29707 mapKey!29707 mapValue!29707))))

(declare-fun b!905540 () Bool)

(assert (=> b!905540 (= e!507441 true)))

(assert (=> b!905540 (= (apply!455 lt!408589 k0!1033) lt!408590)))

(declare-datatypes ((Unit!30724 0))(
  ( (Unit!30725) )
))
(declare-fun lt!408587 () Unit!30724)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!10 (array!53368 array!53370 (_ BitVec 32) (_ BitVec 32) V!29849 V!29849 (_ BitVec 64) V!29849 (_ BitVec 32) Int) Unit!30724)

(assert (=> b!905540 (= lt!408587 (lemmaListMapApplyFromThenApplyFromZero!10 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408590 i!717 defaultEntry!1160))))

(declare-fun b!905541 () Bool)

(declare-fun e!507439 () Bool)

(declare-fun tp_is_empty!18663 () Bool)

(assert (=> b!905541 (= e!507439 tp_is_empty!18663)))

(declare-fun b!905542 () Bool)

(assert (=> b!905542 (= e!507438 tp_is_empty!18663)))

(declare-fun b!905543 () Bool)

(declare-fun e!507435 () Bool)

(assert (=> b!905543 (= e!507435 (and e!507439 mapRes!29707))))

(declare-fun condMapEmpty!29707 () Bool)

(declare-fun mapDefault!29707 () ValueCell!8850)

(assert (=> b!905543 (= condMapEmpty!29707 (= (arr!25644 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8850)) mapDefault!29707)))))

(declare-fun b!905539 () Bool)

(declare-fun res!611062 () Bool)

(assert (=> b!905539 (=> (not res!611062) (not e!507437))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905539 (= res!611062 (inRange!0 i!717 mask!1756))))

(declare-fun res!611066 () Bool)

(assert (=> start!77660 (=> (not res!611066) (not e!507434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77660 (= res!611066 (validMask!0 mask!1756))))

(assert (=> start!77660 e!507434))

(declare-fun array_inv!20090 (array!53370) Bool)

(assert (=> start!77660 (and (array_inv!20090 _values!1152) e!507435)))

(assert (=> start!77660 tp!56996))

(assert (=> start!77660 true))

(assert (=> start!77660 tp_is_empty!18663))

(declare-fun array_inv!20091 (array!53368) Bool)

(assert (=> start!77660 (array_inv!20091 _keys!1386)))

(declare-fun b!905544 () Bool)

(declare-fun res!611067 () Bool)

(assert (=> b!905544 (=> (not res!611067) (not e!507434))))

(declare-datatypes ((List!18015 0))(
  ( (Nil!18012) (Cons!18011 (h!19157 (_ BitVec 64)) (t!25432 List!18015)) )
))
(declare-fun arrayNoDuplicates!0 (array!53368 (_ BitVec 32) List!18015) Bool)

(assert (=> b!905544 (= res!611067 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18012))))

(declare-fun b!905545 () Bool)

(assert (=> b!905545 (= e!507437 (not e!507440))))

(declare-fun res!611069 () Bool)

(assert (=> b!905545 (=> res!611069 e!507440)))

(assert (=> b!905545 (= res!611069 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26102 _keys!1386))))))

(declare-fun get!13473 (ValueCell!8850 V!29849) V!29849)

(declare-fun dynLambda!1331 (Int (_ BitVec 64)) V!29849)

(assert (=> b!905545 (= lt!408590 (get!13473 (select (arr!25644 _values!1152) i!717) (dynLambda!1331 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905545 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408588 () Unit!30724)

(declare-fun lemmaKeyInListMapIsInArray!203 (array!53368 array!53370 (_ BitVec 32) (_ BitVec 32) V!29849 V!29849 (_ BitVec 64) Int) Unit!30724)

(assert (=> b!905545 (= lt!408588 (lemmaKeyInListMapIsInArray!203 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!77660 res!611066) b!905534))

(assert (= (and b!905534 res!611065) b!905538))

(assert (= (and b!905538 res!611064) b!905544))

(assert (= (and b!905544 res!611067) b!905537))

(assert (= (and b!905537 res!611068) b!905539))

(assert (= (and b!905539 res!611062) b!905533))

(assert (= (and b!905533 res!611063) b!905545))

(assert (= (and b!905545 (not res!611069)) b!905535))

(assert (= (and b!905535 (not res!611060)) b!905536))

(assert (= (and b!905536 (not res!611061)) b!905540))

(assert (= (and b!905543 condMapEmpty!29707) mapIsEmpty!29707))

(assert (= (and b!905543 (not condMapEmpty!29707)) mapNonEmpty!29707))

(get-info :version)

(assert (= (and mapNonEmpty!29707 ((_ is ValueCellFull!8850) mapValue!29707)) b!905542))

(assert (= (and b!905543 ((_ is ValueCellFull!8850) mapDefault!29707)) b!905541))

(assert (= start!77660 b!905543))

(declare-fun b_lambda!13119 () Bool)

(assert (=> (not b_lambda!13119) (not b!905545)))

(declare-fun t!25430 () Bool)

(declare-fun tb!5267 () Bool)

(assert (=> (and start!77660 (= defaultEntry!1160 defaultEntry!1160) t!25430) tb!5267))

(declare-fun result!10329 () Bool)

(assert (=> tb!5267 (= result!10329 tp_is_empty!18663)))

(assert (=> b!905545 t!25430))

(declare-fun b_and!26645 () Bool)

(assert (= b_and!26643 (and (=> t!25430 result!10329) b_and!26645)))

(declare-fun m!840935 () Bool)

(assert (=> b!905539 m!840935))

(declare-fun m!840937 () Bool)

(assert (=> b!905533 m!840937))

(declare-fun m!840939 () Bool)

(assert (=> b!905538 m!840939))

(declare-fun m!840941 () Bool)

(assert (=> b!905537 m!840941))

(declare-fun m!840943 () Bool)

(assert (=> b!905537 m!840943))

(declare-fun m!840945 () Bool)

(assert (=> mapNonEmpty!29707 m!840945))

(declare-fun m!840947 () Bool)

(assert (=> b!905536 m!840947))

(declare-fun m!840949 () Bool)

(assert (=> b!905540 m!840949))

(declare-fun m!840951 () Bool)

(assert (=> b!905540 m!840951))

(declare-fun m!840953 () Bool)

(assert (=> start!77660 m!840953))

(declare-fun m!840955 () Bool)

(assert (=> start!77660 m!840955))

(declare-fun m!840957 () Bool)

(assert (=> start!77660 m!840957))

(declare-fun m!840959 () Bool)

(assert (=> b!905545 m!840959))

(declare-fun m!840961 () Bool)

(assert (=> b!905545 m!840961))

(declare-fun m!840963 () Bool)

(assert (=> b!905545 m!840963))

(declare-fun m!840965 () Bool)

(assert (=> b!905545 m!840965))

(assert (=> b!905545 m!840959))

(assert (=> b!905545 m!840963))

(declare-fun m!840967 () Bool)

(assert (=> b!905545 m!840967))

(declare-fun m!840969 () Bool)

(assert (=> b!905544 m!840969))

(declare-fun m!840971 () Bool)

(assert (=> b!905535 m!840971))

(declare-fun m!840973 () Bool)

(assert (=> b!905535 m!840973))

(check-sat (not b!905545) b_and!26645 (not b!905536) (not b_lambda!13119) (not b!905535) (not b!905538) (not start!77660) (not b!905539) (not mapNonEmpty!29707) (not b!905540) (not b!905544) (not b!905537) (not b_next!16245) tp_is_empty!18663)
(check-sat b_and!26645 (not b_next!16245))
