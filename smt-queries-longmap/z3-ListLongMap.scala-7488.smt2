; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95136 () Bool)

(assert start!95136)

(declare-fun b_free!22105 () Bool)

(declare-fun b_next!22105 () Bool)

(assert (=> start!95136 (= b_free!22105 (not b_next!22105))))

(declare-fun tp!77780 () Bool)

(declare-fun b_and!34969 () Bool)

(assert (=> start!95136 (= tp!77780 b_and!34969)))

(declare-fun mapIsEmpty!40585 () Bool)

(declare-fun mapRes!40585 () Bool)

(assert (=> mapIsEmpty!40585 mapRes!40585))

(declare-fun mapNonEmpty!40585 () Bool)

(declare-fun tp!77779 () Bool)

(declare-fun e!613836 () Bool)

(assert (=> mapNonEmpty!40585 (= mapRes!40585 (and tp!77779 e!613836))))

(declare-datatypes ((V!39689 0))(
  ( (V!39690 (val!13008 Int)) )
))
(declare-datatypes ((ValueCell!12254 0))(
  ( (ValueCellFull!12254 (v!15622 V!39689)) (EmptyCell!12254) )
))
(declare-fun mapValue!40585 () ValueCell!12254)

(declare-fun mapKey!40585 () (_ BitVec 32))

(declare-fun mapRest!40585 () (Array (_ BitVec 32) ValueCell!12254))

(declare-datatypes ((array!68841 0))(
  ( (array!68842 (arr!33108 (Array (_ BitVec 32) ValueCell!12254)) (size!33645 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68841)

(assert (=> mapNonEmpty!40585 (= (arr!33108 _values!955) (store mapRest!40585 mapKey!40585 mapValue!40585))))

(declare-fun b!1074375 () Bool)

(declare-fun res!716239 () Bool)

(declare-fun e!613834 () Bool)

(assert (=> b!1074375 (=> (not res!716239) (not e!613834))))

(declare-datatypes ((array!68843 0))(
  ( (array!68844 (arr!33109 (Array (_ BitVec 32) (_ BitVec 64))) (size!33646 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68843)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68843 (_ BitVec 32)) Bool)

(assert (=> b!1074375 (= res!716239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!716241 () Bool)

(assert (=> start!95136 (=> (not res!716241) (not e!613834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95136 (= res!716241 (validMask!0 mask!1515))))

(assert (=> start!95136 e!613834))

(assert (=> start!95136 true))

(declare-fun tp_is_empty!25915 () Bool)

(assert (=> start!95136 tp_is_empty!25915))

(declare-fun e!613838 () Bool)

(declare-fun array_inv!25626 (array!68841) Bool)

(assert (=> start!95136 (and (array_inv!25626 _values!955) e!613838)))

(assert (=> start!95136 tp!77780))

(declare-fun array_inv!25627 (array!68843) Bool)

(assert (=> start!95136 (array_inv!25627 _keys!1163)))

(declare-fun b!1074376 () Bool)

(assert (=> b!1074376 (= e!613836 tp_is_empty!25915)))

(declare-fun b!1074377 () Bool)

(declare-fun e!613837 () Bool)

(assert (=> b!1074377 (= e!613838 (and e!613837 mapRes!40585))))

(declare-fun condMapEmpty!40585 () Bool)

(declare-fun mapDefault!40585 () ValueCell!12254)

(assert (=> b!1074377 (= condMapEmpty!40585 (= (arr!33108 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12254)) mapDefault!40585)))))

(declare-fun b!1074378 () Bool)

(declare-fun res!716242 () Bool)

(assert (=> b!1074378 (=> (not res!716242) (not e!613834))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074378 (= res!716242 (and (= (size!33645 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33646 _keys!1163) (size!33645 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074379 () Bool)

(assert (=> b!1074379 (= e!613834 false)))

(declare-datatypes ((tuple2!16550 0))(
  ( (tuple2!16551 (_1!8286 (_ BitVec 64)) (_2!8286 V!39689)) )
))
(declare-datatypes ((List!23106 0))(
  ( (Nil!23103) (Cons!23102 (h!24320 tuple2!16550) (t!32435 List!23106)) )
))
(declare-datatypes ((ListLongMap!14527 0))(
  ( (ListLongMap!14528 (toList!7279 List!23106)) )
))
(declare-fun lt!476450 () ListLongMap!14527)

(declare-fun minValue!907 () V!39689)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39689)

(declare-fun getCurrentListMapNoExtraKeys!3877 (array!68843 array!68841 (_ BitVec 32) (_ BitVec 32) V!39689 V!39689 (_ BitVec 32) Int) ListLongMap!14527)

(assert (=> b!1074379 (= lt!476450 (getCurrentListMapNoExtraKeys!3877 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39689)

(declare-fun lt!476451 () ListLongMap!14527)

(assert (=> b!1074379 (= lt!476451 (getCurrentListMapNoExtraKeys!3877 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074380 () Bool)

(declare-fun res!716240 () Bool)

(assert (=> b!1074380 (=> (not res!716240) (not e!613834))))

(declare-datatypes ((List!23107 0))(
  ( (Nil!23104) (Cons!23103 (h!24321 (_ BitVec 64)) (t!32436 List!23107)) )
))
(declare-fun arrayNoDuplicates!0 (array!68843 (_ BitVec 32) List!23107) Bool)

(assert (=> b!1074380 (= res!716240 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23104))))

(declare-fun b!1074381 () Bool)

(assert (=> b!1074381 (= e!613837 tp_is_empty!25915)))

(assert (= (and start!95136 res!716241) b!1074378))

(assert (= (and b!1074378 res!716242) b!1074375))

(assert (= (and b!1074375 res!716239) b!1074380))

(assert (= (and b!1074380 res!716240) b!1074379))

(assert (= (and b!1074377 condMapEmpty!40585) mapIsEmpty!40585))

(assert (= (and b!1074377 (not condMapEmpty!40585)) mapNonEmpty!40585))

(get-info :version)

(assert (= (and mapNonEmpty!40585 ((_ is ValueCellFull!12254) mapValue!40585)) b!1074376))

(assert (= (and b!1074377 ((_ is ValueCellFull!12254) mapDefault!40585)) b!1074381))

(assert (= start!95136 b!1074377))

(declare-fun m!993799 () Bool)

(assert (=> b!1074375 m!993799))

(declare-fun m!993801 () Bool)

(assert (=> mapNonEmpty!40585 m!993801))

(declare-fun m!993803 () Bool)

(assert (=> b!1074380 m!993803))

(declare-fun m!993805 () Bool)

(assert (=> b!1074379 m!993805))

(declare-fun m!993807 () Bool)

(assert (=> b!1074379 m!993807))

(declare-fun m!993809 () Bool)

(assert (=> start!95136 m!993809))

(declare-fun m!993811 () Bool)

(assert (=> start!95136 m!993811))

(declare-fun m!993813 () Bool)

(assert (=> start!95136 m!993813))

(check-sat (not b!1074379) b_and!34969 (not b!1074380) (not b!1074375) (not b_next!22105) tp_is_empty!25915 (not start!95136) (not mapNonEmpty!40585))
(check-sat b_and!34969 (not b_next!22105))
