; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20770 () Bool)

(assert start!20770)

(declare-fun b_free!5425 () Bool)

(declare-fun b_next!5425 () Bool)

(assert (=> start!20770 (= b_free!5425 (not b_next!5425))))

(declare-fun tp!19307 () Bool)

(declare-fun b_and!12185 () Bool)

(assert (=> start!20770 (= tp!19307 b_and!12185)))

(declare-fun res!101113 () Bool)

(declare-fun e!135728 () Bool)

(assert (=> start!20770 (=> (not res!101113) (not e!135728))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20770 (= res!101113 (validMask!0 mask!1149))))

(assert (=> start!20770 e!135728))

(declare-datatypes ((V!6689 0))(
  ( (V!6690 (val!2685 Int)) )
))
(declare-datatypes ((ValueCell!2297 0))(
  ( (ValueCellFull!2297 (v!4656 V!6689)) (EmptyCell!2297) )
))
(declare-datatypes ((array!9763 0))(
  ( (array!9764 (arr!4632 (Array (_ BitVec 32) ValueCell!2297)) (size!4957 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9763)

(declare-fun e!135725 () Bool)

(declare-fun array_inv!3037 (array!9763) Bool)

(assert (=> start!20770 (and (array_inv!3037 _values!649) e!135725)))

(assert (=> start!20770 true))

(declare-fun tp_is_empty!5281 () Bool)

(assert (=> start!20770 tp_is_empty!5281))

(declare-datatypes ((array!9765 0))(
  ( (array!9766 (arr!4633 (Array (_ BitVec 32) (_ BitVec 64))) (size!4958 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9765)

(declare-fun array_inv!3038 (array!9765) Bool)

(assert (=> start!20770 (array_inv!3038 _keys!825)))

(assert (=> start!20770 tp!19307))

(declare-fun b!208033 () Bool)

(declare-fun res!101115 () Bool)

(assert (=> b!208033 (=> (not res!101115) (not e!135728))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208033 (= res!101115 (and (= (size!4957 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4958 _keys!825) (size!4957 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208034 () Bool)

(declare-fun res!101111 () Bool)

(assert (=> b!208034 (=> (not res!101111) (not e!135728))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208034 (= res!101111 (validKeyInArray!0 k0!843))))

(declare-fun b!208035 () Bool)

(declare-fun e!135726 () Bool)

(assert (=> b!208035 (= e!135726 tp_is_empty!5281)))

(declare-fun mapIsEmpty!8990 () Bool)

(declare-fun mapRes!8990 () Bool)

(assert (=> mapIsEmpty!8990 mapRes!8990))

(declare-fun b!208036 () Bool)

(declare-fun res!101116 () Bool)

(assert (=> b!208036 (=> (not res!101116) (not e!135728))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208036 (= res!101116 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4958 _keys!825))))))

(declare-fun b!208037 () Bool)

(declare-fun res!101110 () Bool)

(assert (=> b!208037 (=> (not res!101110) (not e!135728))))

(assert (=> b!208037 (= res!101110 (= (select (arr!4633 _keys!825) i!601) k0!843))))

(declare-fun b!208038 () Bool)

(assert (=> b!208038 (= e!135725 (and e!135726 mapRes!8990))))

(declare-fun condMapEmpty!8990 () Bool)

(declare-fun mapDefault!8990 () ValueCell!2297)

(assert (=> b!208038 (= condMapEmpty!8990 (= (arr!4632 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2297)) mapDefault!8990)))))

(declare-fun mapNonEmpty!8990 () Bool)

(declare-fun tp!19306 () Bool)

(declare-fun e!135727 () Bool)

(assert (=> mapNonEmpty!8990 (= mapRes!8990 (and tp!19306 e!135727))))

(declare-fun mapValue!8990 () ValueCell!2297)

(declare-fun mapRest!8990 () (Array (_ BitVec 32) ValueCell!2297))

(declare-fun mapKey!8990 () (_ BitVec 32))

(assert (=> mapNonEmpty!8990 (= (arr!4632 _values!649) (store mapRest!8990 mapKey!8990 mapValue!8990))))

(declare-fun b!208039 () Bool)

(declare-fun res!101112 () Bool)

(assert (=> b!208039 (=> (not res!101112) (not e!135728))))

(declare-datatypes ((List!2903 0))(
  ( (Nil!2900) (Cons!2899 (h!3541 (_ BitVec 64)) (t!7826 List!2903)) )
))
(declare-fun arrayNoDuplicates!0 (array!9765 (_ BitVec 32) List!2903) Bool)

(assert (=> b!208039 (= res!101112 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2900))))

(declare-fun b!208040 () Bool)

(assert (=> b!208040 (= e!135727 tp_is_empty!5281)))

(declare-fun b!208041 () Bool)

(declare-datatypes ((tuple2!4014 0))(
  ( (tuple2!4015 (_1!2018 (_ BitVec 64)) (_2!2018 V!6689)) )
))
(declare-datatypes ((List!2904 0))(
  ( (Nil!2901) (Cons!2900 (h!3542 tuple2!4014) (t!7827 List!2904)) )
))
(declare-datatypes ((ListLongMap!2929 0))(
  ( (ListLongMap!2930 (toList!1480 List!2904)) )
))
(declare-fun lt!106726 () ListLongMap!2929)

(declare-fun lt!106723 () Bool)

(declare-fun lt!106729 () ListLongMap!2929)

(assert (=> b!208041 (= e!135728 (not (or (and (not lt!106723) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!106723) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!106723) (not (= lt!106729 lt!106726)) (bvsle #b00000000000000000000000000000000 (size!4958 _keys!825)))))))

(assert (=> b!208041 (= lt!106723 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!106725 () ListLongMap!2929)

(declare-fun zeroValue!615 () V!6689)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6689)

(declare-fun getCurrentListMap!1050 (array!9765 array!9763 (_ BitVec 32) (_ BitVec 32) V!6689 V!6689 (_ BitVec 32) Int) ListLongMap!2929)

(assert (=> b!208041 (= lt!106725 (getCurrentListMap!1050 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106724 () array!9763)

(assert (=> b!208041 (= lt!106729 (getCurrentListMap!1050 _keys!825 lt!106724 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106730 () ListLongMap!2929)

(assert (=> b!208041 (and (= lt!106726 lt!106730) (= lt!106730 lt!106726))))

(declare-fun v!520 () V!6689)

(declare-fun lt!106728 () ListLongMap!2929)

(declare-fun +!534 (ListLongMap!2929 tuple2!4014) ListLongMap!2929)

(assert (=> b!208041 (= lt!106730 (+!534 lt!106728 (tuple2!4015 k0!843 v!520)))))

(declare-datatypes ((Unit!6344 0))(
  ( (Unit!6345) )
))
(declare-fun lt!106727 () Unit!6344)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!186 (array!9765 array!9763 (_ BitVec 32) (_ BitVec 32) V!6689 V!6689 (_ BitVec 32) (_ BitVec 64) V!6689 (_ BitVec 32) Int) Unit!6344)

(assert (=> b!208041 (= lt!106727 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!186 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!443 (array!9765 array!9763 (_ BitVec 32) (_ BitVec 32) V!6689 V!6689 (_ BitVec 32) Int) ListLongMap!2929)

(assert (=> b!208041 (= lt!106726 (getCurrentListMapNoExtraKeys!443 _keys!825 lt!106724 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!208041 (= lt!106724 (array!9764 (store (arr!4632 _values!649) i!601 (ValueCellFull!2297 v!520)) (size!4957 _values!649)))))

(assert (=> b!208041 (= lt!106728 (getCurrentListMapNoExtraKeys!443 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208042 () Bool)

(declare-fun res!101114 () Bool)

(assert (=> b!208042 (=> (not res!101114) (not e!135728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9765 (_ BitVec 32)) Bool)

(assert (=> b!208042 (= res!101114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20770 res!101113) b!208033))

(assert (= (and b!208033 res!101115) b!208042))

(assert (= (and b!208042 res!101114) b!208039))

(assert (= (and b!208039 res!101112) b!208036))

(assert (= (and b!208036 res!101116) b!208034))

(assert (= (and b!208034 res!101111) b!208037))

(assert (= (and b!208037 res!101110) b!208041))

(assert (= (and b!208038 condMapEmpty!8990) mapIsEmpty!8990))

(assert (= (and b!208038 (not condMapEmpty!8990)) mapNonEmpty!8990))

(get-info :version)

(assert (= (and mapNonEmpty!8990 ((_ is ValueCellFull!2297) mapValue!8990)) b!208040))

(assert (= (and b!208038 ((_ is ValueCellFull!2297) mapDefault!8990)) b!208035))

(assert (= start!20770 b!208038))

(declare-fun m!235911 () Bool)

(assert (=> b!208034 m!235911))

(declare-fun m!235913 () Bool)

(assert (=> b!208037 m!235913))

(declare-fun m!235915 () Bool)

(assert (=> b!208041 m!235915))

(declare-fun m!235917 () Bool)

(assert (=> b!208041 m!235917))

(declare-fun m!235919 () Bool)

(assert (=> b!208041 m!235919))

(declare-fun m!235921 () Bool)

(assert (=> b!208041 m!235921))

(declare-fun m!235923 () Bool)

(assert (=> b!208041 m!235923))

(declare-fun m!235925 () Bool)

(assert (=> b!208041 m!235925))

(declare-fun m!235927 () Bool)

(assert (=> b!208041 m!235927))

(declare-fun m!235929 () Bool)

(assert (=> b!208039 m!235929))

(declare-fun m!235931 () Bool)

(assert (=> start!20770 m!235931))

(declare-fun m!235933 () Bool)

(assert (=> start!20770 m!235933))

(declare-fun m!235935 () Bool)

(assert (=> start!20770 m!235935))

(declare-fun m!235937 () Bool)

(assert (=> b!208042 m!235937))

(declare-fun m!235939 () Bool)

(assert (=> mapNonEmpty!8990 m!235939))

(check-sat (not b!208042) tp_is_empty!5281 (not b!208034) b_and!12185 (not mapNonEmpty!8990) (not b!208039) (not start!20770) (not b_next!5425) (not b!208041))
(check-sat b_and!12185 (not b_next!5425))
