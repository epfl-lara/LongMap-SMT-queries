; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71412 () Bool)

(assert start!71412)

(declare-fun b_free!13477 () Bool)

(declare-fun b_next!13477 () Bool)

(assert (=> start!71412 (= b_free!13477 (not b_next!13477))))

(declare-fun tp!47211 () Bool)

(declare-fun b_and!22457 () Bool)

(assert (=> start!71412 (= tp!47211 b_and!22457)))

(declare-fun mapNonEmpty!24427 () Bool)

(declare-fun mapRes!24427 () Bool)

(declare-fun tp!47212 () Bool)

(declare-fun e!462278 () Bool)

(assert (=> mapNonEmpty!24427 (= mapRes!24427 (and tp!47212 e!462278))))

(declare-datatypes ((V!25251 0))(
  ( (V!25252 (val!7641 Int)) )
))
(declare-datatypes ((ValueCell!7178 0))(
  ( (ValueCellFull!7178 (v!10075 V!25251)) (EmptyCell!7178) )
))
(declare-fun mapValue!24427 () ValueCell!7178)

(declare-fun mapRest!24427 () (Array (_ BitVec 32) ValueCell!7178))

(declare-datatypes ((array!46515 0))(
  ( (array!46516 (arr!22296 (Array (_ BitVec 32) ValueCell!7178)) (size!22717 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46515)

(declare-fun mapKey!24427 () (_ BitVec 32))

(assert (=> mapNonEmpty!24427 (= (arr!22296 _values!788) (store mapRest!24427 mapKey!24427 mapValue!24427))))

(declare-fun res!565011 () Bool)

(declare-fun e!462279 () Bool)

(assert (=> start!71412 (=> (not res!565011) (not e!462279))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71412 (= res!565011 (validMask!0 mask!1312))))

(assert (=> start!71412 e!462279))

(declare-fun tp_is_empty!15187 () Bool)

(assert (=> start!71412 tp_is_empty!15187))

(declare-datatypes ((array!46517 0))(
  ( (array!46518 (arr!22297 (Array (_ BitVec 32) (_ BitVec 64))) (size!22718 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46517)

(declare-fun array_inv!17825 (array!46517) Bool)

(assert (=> start!71412 (array_inv!17825 _keys!976)))

(assert (=> start!71412 true))

(declare-fun e!462281 () Bool)

(declare-fun array_inv!17826 (array!46515) Bool)

(assert (=> start!71412 (and (array_inv!17826 _values!788) e!462281)))

(assert (=> start!71412 tp!47211))

(declare-fun b!829332 () Bool)

(assert (=> b!829332 (= e!462278 tp_is_empty!15187)))

(declare-fun b!829333 () Bool)

(declare-fun e!462282 () Bool)

(assert (=> b!829333 (= e!462282 tp_is_empty!15187)))

(declare-fun b!829334 () Bool)

(declare-fun res!565009 () Bool)

(assert (=> b!829334 (=> (not res!565009) (not e!462279))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829334 (= res!565009 (and (= (size!22717 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22718 _keys!976) (size!22717 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829335 () Bool)

(declare-fun e!462283 () Bool)

(assert (=> b!829335 (= e!462279 (not e!462283))))

(declare-fun res!565012 () Bool)

(assert (=> b!829335 (=> res!565012 e!462283)))

(assert (=> b!829335 (= res!565012 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10146 0))(
  ( (tuple2!10147 (_1!5084 (_ BitVec 64)) (_2!5084 V!25251)) )
))
(declare-datatypes ((List!15932 0))(
  ( (Nil!15929) (Cons!15928 (h!17057 tuple2!10146) (t!22284 List!15932)) )
))
(declare-datatypes ((ListLongMap!8959 0))(
  ( (ListLongMap!8960 (toList!4495 List!15932)) )
))
(declare-fun lt!375978 () ListLongMap!8959)

(declare-fun lt!375972 () ListLongMap!8959)

(assert (=> b!829335 (= lt!375978 lt!375972)))

(declare-fun zeroValueBefore!34 () V!25251)

(declare-fun minValue!754 () V!25251)

(declare-datatypes ((Unit!28365 0))(
  ( (Unit!28366) )
))
(declare-fun lt!375973 () Unit!28365)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!25251)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!594 (array!46517 array!46515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25251 V!25251 V!25251 V!25251 (_ BitVec 32) Int) Unit!28365)

(assert (=> b!829335 (= lt!375973 (lemmaNoChangeToArrayThenSameMapNoExtras!594 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2524 (array!46517 array!46515 (_ BitVec 32) (_ BitVec 32) V!25251 V!25251 (_ BitVec 32) Int) ListLongMap!8959)

(assert (=> b!829335 (= lt!375972 (getCurrentListMapNoExtraKeys!2524 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829335 (= lt!375978 (getCurrentListMapNoExtraKeys!2524 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829336 () Bool)

(declare-fun res!565010 () Bool)

(assert (=> b!829336 (=> (not res!565010) (not e!462279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46517 (_ BitVec 32)) Bool)

(assert (=> b!829336 (= res!565010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24427 () Bool)

(assert (=> mapIsEmpty!24427 mapRes!24427))

(declare-fun b!829337 () Bool)

(declare-fun res!565008 () Bool)

(assert (=> b!829337 (=> (not res!565008) (not e!462279))))

(declare-datatypes ((List!15933 0))(
  ( (Nil!15930) (Cons!15929 (h!17058 (_ BitVec 64)) (t!22285 List!15933)) )
))
(declare-fun arrayNoDuplicates!0 (array!46517 (_ BitVec 32) List!15933) Bool)

(assert (=> b!829337 (= res!565008 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15930))))

(declare-fun b!829338 () Bool)

(assert (=> b!829338 (= e!462281 (and e!462282 mapRes!24427))))

(declare-fun condMapEmpty!24427 () Bool)

(declare-fun mapDefault!24427 () ValueCell!7178)

(assert (=> b!829338 (= condMapEmpty!24427 (= (arr!22296 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7178)) mapDefault!24427)))))

(declare-fun lt!375970 () ListLongMap!8959)

(declare-fun lt!375977 () ListLongMap!8959)

(declare-fun lt!375975 () tuple2!10146)

(declare-fun b!829339 () Bool)

(declare-fun +!2005 (ListLongMap!8959 tuple2!10146) ListLongMap!8959)

(assert (=> b!829339 (= e!462283 (= (+!2005 lt!375977 lt!375975) lt!375970))))

(declare-fun lt!375979 () ListLongMap!8959)

(declare-fun lt!375971 () ListLongMap!8959)

(assert (=> b!829339 (= lt!375979 (+!2005 lt!375971 lt!375975))))

(declare-fun lt!375976 () Unit!28365)

(declare-fun addCommutativeForDiffKeys!468 (ListLongMap!8959 (_ BitVec 64) V!25251 (_ BitVec 64) V!25251) Unit!28365)

(assert (=> b!829339 (= lt!375976 (addCommutativeForDiffKeys!468 lt!375978 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!829339 (= lt!375970 lt!375979)))

(declare-fun lt!375974 () tuple2!10146)

(assert (=> b!829339 (= lt!375979 (+!2005 (+!2005 lt!375978 lt!375975) lt!375974))))

(assert (=> b!829339 (= lt!375975 (tuple2!10147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!829339 (= lt!375977 lt!375971)))

(assert (=> b!829339 (= lt!375971 (+!2005 lt!375978 lt!375974))))

(assert (=> b!829339 (= lt!375974 (tuple2!10147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2548 (array!46517 array!46515 (_ BitVec 32) (_ BitVec 32) V!25251 V!25251 (_ BitVec 32) Int) ListLongMap!8959)

(assert (=> b!829339 (= lt!375970 (getCurrentListMap!2548 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829339 (= lt!375977 (getCurrentListMap!2548 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71412 res!565011) b!829334))

(assert (= (and b!829334 res!565009) b!829336))

(assert (= (and b!829336 res!565010) b!829337))

(assert (= (and b!829337 res!565008) b!829335))

(assert (= (and b!829335 (not res!565012)) b!829339))

(assert (= (and b!829338 condMapEmpty!24427) mapIsEmpty!24427))

(assert (= (and b!829338 (not condMapEmpty!24427)) mapNonEmpty!24427))

(get-info :version)

(assert (= (and mapNonEmpty!24427 ((_ is ValueCellFull!7178) mapValue!24427)) b!829332))

(assert (= (and b!829338 ((_ is ValueCellFull!7178) mapDefault!24427)) b!829333))

(assert (= start!71412 b!829338))

(declare-fun m!771817 () Bool)

(assert (=> start!71412 m!771817))

(declare-fun m!771819 () Bool)

(assert (=> start!71412 m!771819))

(declare-fun m!771821 () Bool)

(assert (=> start!71412 m!771821))

(declare-fun m!771823 () Bool)

(assert (=> b!829335 m!771823))

(declare-fun m!771825 () Bool)

(assert (=> b!829335 m!771825))

(declare-fun m!771827 () Bool)

(assert (=> b!829335 m!771827))

(declare-fun m!771829 () Bool)

(assert (=> mapNonEmpty!24427 m!771829))

(declare-fun m!771831 () Bool)

(assert (=> b!829336 m!771831))

(declare-fun m!771833 () Bool)

(assert (=> b!829339 m!771833))

(assert (=> b!829339 m!771833))

(declare-fun m!771835 () Bool)

(assert (=> b!829339 m!771835))

(declare-fun m!771837 () Bool)

(assert (=> b!829339 m!771837))

(declare-fun m!771839 () Bool)

(assert (=> b!829339 m!771839))

(declare-fun m!771841 () Bool)

(assert (=> b!829339 m!771841))

(declare-fun m!771843 () Bool)

(assert (=> b!829339 m!771843))

(declare-fun m!771845 () Bool)

(assert (=> b!829339 m!771845))

(declare-fun m!771847 () Bool)

(assert (=> b!829339 m!771847))

(declare-fun m!771849 () Bool)

(assert (=> b!829337 m!771849))

(check-sat (not mapNonEmpty!24427) (not start!71412) tp_is_empty!15187 (not b!829336) (not b!829339) b_and!22457 (not b!829335) (not b_next!13477) (not b!829337))
(check-sat b_and!22457 (not b_next!13477))
