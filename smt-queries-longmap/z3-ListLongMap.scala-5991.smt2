; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77966 () Bool)

(assert start!77966)

(declare-fun b_free!16357 () Bool)

(declare-fun b_next!16357 () Bool)

(assert (=> start!77966 (= b_free!16357 (not b_next!16357))))

(declare-fun tp!57337 () Bool)

(declare-fun b_and!26881 () Bool)

(assert (=> start!77966 (= tp!57337 b_and!26881)))

(declare-fun b!908884 () Bool)

(declare-fun e!509467 () Bool)

(declare-fun e!509463 () Bool)

(declare-fun mapRes!29878 () Bool)

(assert (=> b!908884 (= e!509467 (and e!509463 mapRes!29878))))

(declare-fun condMapEmpty!29878 () Bool)

(declare-datatypes ((V!29999 0))(
  ( (V!30000 (val!9438 Int)) )
))
(declare-datatypes ((ValueCell!8906 0))(
  ( (ValueCellFull!8906 (v!11942 V!29999)) (EmptyCell!8906) )
))
(declare-datatypes ((array!53627 0))(
  ( (array!53628 (arr!25767 (Array (_ BitVec 32) ValueCell!8906)) (size!26227 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53627)

(declare-fun mapDefault!29878 () ValueCell!8906)

(assert (=> b!908884 (= condMapEmpty!29878 (= (arr!25767 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8906)) mapDefault!29878)))))

(declare-fun b!908886 () Bool)

(declare-fun res!613148 () Bool)

(declare-fun e!509466 () Bool)

(assert (=> b!908886 (=> res!613148 e!509466)))

(declare-datatypes ((tuple2!12232 0))(
  ( (tuple2!12233 (_1!6127 (_ BitVec 64)) (_2!6127 V!29999)) )
))
(declare-datatypes ((List!18062 0))(
  ( (Nil!18059) (Cons!18058 (h!19210 tuple2!12232) (t!25583 List!18062)) )
))
(declare-datatypes ((ListLongMap!10931 0))(
  ( (ListLongMap!10932 (toList!5481 List!18062)) )
))
(declare-fun lt!409910 () ListLongMap!10931)

(declare-fun lt!409907 () V!29999)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!499 (ListLongMap!10931 (_ BitVec 64)) V!29999)

(assert (=> b!908886 (= res!613148 (not (= (apply!499 lt!409910 k0!1033) lt!409907)))))

(declare-fun b!908887 () Bool)

(declare-fun res!613151 () Bool)

(declare-fun e!509465 () Bool)

(assert (=> b!908887 (=> (not res!613151) (not e!509465))))

(declare-datatypes ((array!53629 0))(
  ( (array!53630 (arr!25768 (Array (_ BitVec 32) (_ BitVec 64))) (size!26228 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53629)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53629 (_ BitVec 32)) Bool)

(assert (=> b!908887 (= res!613151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908888 () Bool)

(assert (=> b!908888 (= e!509466 true)))

(declare-fun lt!409908 () ListLongMap!10931)

(assert (=> b!908888 (= (apply!499 lt!409908 k0!1033) lt!409907)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29999)

(declare-datatypes ((Unit!30808 0))(
  ( (Unit!30809) )
))
(declare-fun lt!409909 () Unit!30808)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29999)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!47 (array!53629 array!53627 (_ BitVec 32) (_ BitVec 32) V!29999 V!29999 (_ BitVec 64) V!29999 (_ BitVec 32) Int) Unit!30808)

(assert (=> b!908888 (= lt!409909 (lemmaListMapApplyFromThenApplyFromZero!47 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409907 i!717 defaultEntry!1160))))

(declare-fun b!908889 () Bool)

(declare-fun res!613150 () Bool)

(assert (=> b!908889 (=> (not res!613150) (not e!509465))))

(declare-datatypes ((List!18063 0))(
  ( (Nil!18060) (Cons!18059 (h!19211 (_ BitVec 64)) (t!25584 List!18063)) )
))
(declare-fun arrayNoDuplicates!0 (array!53629 (_ BitVec 32) List!18063) Bool)

(assert (=> b!908889 (= res!613150 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18060))))

(declare-fun b!908890 () Bool)

(declare-fun e!509462 () Bool)

(declare-fun e!509468 () Bool)

(assert (=> b!908890 (= e!509462 (not e!509468))))

(declare-fun res!613157 () Bool)

(assert (=> b!908890 (=> res!613157 e!509468)))

(assert (=> b!908890 (= res!613157 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26228 _keys!1386))))))

(declare-fun get!13572 (ValueCell!8906 V!29999) V!29999)

(declare-fun dynLambda!1385 (Int (_ BitVec 64)) V!29999)

(assert (=> b!908890 (= lt!409907 (get!13572 (select (arr!25767 _values!1152) i!717) (dynLambda!1385 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908890 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409911 () Unit!30808)

(declare-fun lemmaKeyInListMapIsInArray!244 (array!53629 array!53627 (_ BitVec 32) (_ BitVec 32) V!29999 V!29999 (_ BitVec 64) Int) Unit!30808)

(assert (=> b!908890 (= lt!409911 (lemmaKeyInListMapIsInArray!244 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29878 () Bool)

(declare-fun tp!57336 () Bool)

(declare-fun e!509464 () Bool)

(assert (=> mapNonEmpty!29878 (= mapRes!29878 (and tp!57336 e!509464))))

(declare-fun mapKey!29878 () (_ BitVec 32))

(declare-fun mapValue!29878 () ValueCell!8906)

(declare-fun mapRest!29878 () (Array (_ BitVec 32) ValueCell!8906))

(assert (=> mapNonEmpty!29878 (= (arr!25767 _values!1152) (store mapRest!29878 mapKey!29878 mapValue!29878))))

(declare-fun b!908891 () Bool)

(assert (=> b!908891 (= e!509468 e!509466)))

(declare-fun res!613156 () Bool)

(assert (=> b!908891 (=> res!613156 e!509466)))

(declare-fun contains!4535 (ListLongMap!10931 (_ BitVec 64)) Bool)

(assert (=> b!908891 (= res!613156 (not (contains!4535 lt!409910 k0!1033)))))

(declare-fun getCurrentListMap!2745 (array!53629 array!53627 (_ BitVec 32) (_ BitVec 32) V!29999 V!29999 (_ BitVec 32) Int) ListLongMap!10931)

(assert (=> b!908891 (= lt!409910 (getCurrentListMap!2745 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908892 () Bool)

(declare-fun res!613149 () Bool)

(assert (=> b!908892 (=> (not res!613149) (not e!509465))))

(assert (=> b!908892 (= res!613149 (and (= (size!26227 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26228 _keys!1386) (size!26227 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29878 () Bool)

(assert (=> mapIsEmpty!29878 mapRes!29878))

(declare-fun b!908893 () Bool)

(declare-fun res!613154 () Bool)

(assert (=> b!908893 (=> (not res!613154) (not e!509462))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908893 (= res!613154 (inRange!0 i!717 mask!1756))))

(declare-fun b!908894 () Bool)

(declare-fun res!613155 () Bool)

(assert (=> b!908894 (=> (not res!613155) (not e!509462))))

(assert (=> b!908894 (= res!613155 (and (= (select (arr!25768 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908885 () Bool)

(declare-fun tp_is_empty!18775 () Bool)

(assert (=> b!908885 (= e!509463 tp_is_empty!18775)))

(declare-fun res!613153 () Bool)

(assert (=> start!77966 (=> (not res!613153) (not e!509465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77966 (= res!613153 (validMask!0 mask!1756))))

(assert (=> start!77966 e!509465))

(declare-fun array_inv!20232 (array!53627) Bool)

(assert (=> start!77966 (and (array_inv!20232 _values!1152) e!509467)))

(assert (=> start!77966 tp!57337))

(assert (=> start!77966 true))

(assert (=> start!77966 tp_is_empty!18775))

(declare-fun array_inv!20233 (array!53629) Bool)

(assert (=> start!77966 (array_inv!20233 _keys!1386)))

(declare-fun b!908895 () Bool)

(assert (=> b!908895 (= e!509464 tp_is_empty!18775)))

(declare-fun b!908896 () Bool)

(assert (=> b!908896 (= e!509465 e!509462)))

(declare-fun res!613152 () Bool)

(assert (=> b!908896 (=> (not res!613152) (not e!509462))))

(assert (=> b!908896 (= res!613152 (contains!4535 lt!409908 k0!1033))))

(assert (=> b!908896 (= lt!409908 (getCurrentListMap!2745 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and start!77966 res!613153) b!908892))

(assert (= (and b!908892 res!613149) b!908887))

(assert (= (and b!908887 res!613151) b!908889))

(assert (= (and b!908889 res!613150) b!908896))

(assert (= (and b!908896 res!613152) b!908893))

(assert (= (and b!908893 res!613154) b!908894))

(assert (= (and b!908894 res!613155) b!908890))

(assert (= (and b!908890 (not res!613157)) b!908891))

(assert (= (and b!908891 (not res!613156)) b!908886))

(assert (= (and b!908886 (not res!613148)) b!908888))

(assert (= (and b!908884 condMapEmpty!29878) mapIsEmpty!29878))

(assert (= (and b!908884 (not condMapEmpty!29878)) mapNonEmpty!29878))

(get-info :version)

(assert (= (and mapNonEmpty!29878 ((_ is ValueCellFull!8906) mapValue!29878)) b!908895))

(assert (= (and b!908884 ((_ is ValueCellFull!8906) mapDefault!29878)) b!908885))

(assert (= start!77966 b!908884))

(declare-fun b_lambda!13255 () Bool)

(assert (=> (not b_lambda!13255) (not b!908890)))

(declare-fun t!25582 () Bool)

(declare-fun tb!5371 () Bool)

(assert (=> (and start!77966 (= defaultEntry!1160 defaultEntry!1160) t!25582) tb!5371))

(declare-fun result!10547 () Bool)

(assert (=> tb!5371 (= result!10547 tp_is_empty!18775)))

(assert (=> b!908890 t!25582))

(declare-fun b_and!26883 () Bool)

(assert (= b_and!26881 (and (=> t!25582 result!10547) b_and!26883)))

(declare-fun m!844623 () Bool)

(assert (=> b!908890 m!844623))

(declare-fun m!844625 () Bool)

(assert (=> b!908890 m!844625))

(declare-fun m!844627 () Bool)

(assert (=> b!908890 m!844627))

(declare-fun m!844629 () Bool)

(assert (=> b!908890 m!844629))

(assert (=> b!908890 m!844623))

(assert (=> b!908890 m!844627))

(declare-fun m!844631 () Bool)

(assert (=> b!908890 m!844631))

(declare-fun m!844633 () Bool)

(assert (=> start!77966 m!844633))

(declare-fun m!844635 () Bool)

(assert (=> start!77966 m!844635))

(declare-fun m!844637 () Bool)

(assert (=> start!77966 m!844637))

(declare-fun m!844639 () Bool)

(assert (=> b!908896 m!844639))

(declare-fun m!844641 () Bool)

(assert (=> b!908896 m!844641))

(declare-fun m!844643 () Bool)

(assert (=> b!908891 m!844643))

(declare-fun m!844645 () Bool)

(assert (=> b!908891 m!844645))

(declare-fun m!844647 () Bool)

(assert (=> b!908894 m!844647))

(declare-fun m!844649 () Bool)

(assert (=> b!908886 m!844649))

(declare-fun m!844651 () Bool)

(assert (=> b!908888 m!844651))

(declare-fun m!844653 () Bool)

(assert (=> b!908888 m!844653))

(declare-fun m!844655 () Bool)

(assert (=> mapNonEmpty!29878 m!844655))

(declare-fun m!844657 () Bool)

(assert (=> b!908887 m!844657))

(declare-fun m!844659 () Bool)

(assert (=> b!908893 m!844659))

(declare-fun m!844661 () Bool)

(assert (=> b!908889 m!844661))

(check-sat tp_is_empty!18775 (not b!908886) (not mapNonEmpty!29878) (not b_lambda!13255) (not b!908888) (not start!77966) (not b!908893) (not b!908891) (not b!908896) (not b!908887) (not b!908890) b_and!26883 (not b_next!16357) (not b!908889))
(check-sat b_and!26883 (not b_next!16357))
