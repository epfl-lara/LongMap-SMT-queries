; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94894 () Bool)

(assert start!94894)

(declare-fun b_free!22105 () Bool)

(declare-fun b_next!22105 () Bool)

(assert (=> start!94894 (= b_free!22105 (not b_next!22105))))

(declare-fun tp!77779 () Bool)

(declare-fun b_and!34933 () Bool)

(assert (=> start!94894 (= tp!77779 b_and!34933)))

(declare-fun b!1072895 () Bool)

(declare-fun e!612888 () Bool)

(declare-fun tp_is_empty!25915 () Bool)

(assert (=> b!1072895 (= e!612888 tp_is_empty!25915)))

(declare-fun res!715650 () Bool)

(declare-fun e!612887 () Bool)

(assert (=> start!94894 (=> (not res!715650) (not e!612887))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94894 (= res!715650 (validMask!0 mask!1515))))

(assert (=> start!94894 e!612887))

(assert (=> start!94894 true))

(assert (=> start!94894 tp_is_empty!25915))

(declare-datatypes ((V!39689 0))(
  ( (V!39690 (val!13008 Int)) )
))
(declare-datatypes ((ValueCell!12254 0))(
  ( (ValueCellFull!12254 (v!15625 V!39689)) (EmptyCell!12254) )
))
(declare-datatypes ((array!68736 0))(
  ( (array!68737 (arr!33062 (Array (_ BitVec 32) ValueCell!12254)) (size!33600 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68736)

(declare-fun e!612889 () Bool)

(declare-fun array_inv!25578 (array!68736) Bool)

(assert (=> start!94894 (and (array_inv!25578 _values!955) e!612889)))

(assert (=> start!94894 tp!77779))

(declare-datatypes ((array!68738 0))(
  ( (array!68739 (arr!33063 (Array (_ BitVec 32) (_ BitVec 64))) (size!33601 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68738)

(declare-fun array_inv!25579 (array!68738) Bool)

(assert (=> start!94894 (array_inv!25579 _keys!1163)))

(declare-fun b!1072896 () Bool)

(assert (=> b!1072896 (= e!612887 false)))

(declare-datatypes ((tuple2!16628 0))(
  ( (tuple2!16629 (_1!8325 (_ BitVec 64)) (_2!8325 V!39689)) )
))
(declare-datatypes ((List!23152 0))(
  ( (Nil!23149) (Cons!23148 (h!24357 tuple2!16628) (t!32480 List!23152)) )
))
(declare-datatypes ((ListLongMap!14597 0))(
  ( (ListLongMap!14598 (toList!7314 List!23152)) )
))
(declare-fun lt!475736 () ListLongMap!14597)

(declare-fun minValue!907 () V!39689)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39689)

(declare-fun getCurrentListMapNoExtraKeys!3894 (array!68738 array!68736 (_ BitVec 32) (_ BitVec 32) V!39689 V!39689 (_ BitVec 32) Int) ListLongMap!14597)

(assert (=> b!1072896 (= lt!475736 (getCurrentListMapNoExtraKeys!3894 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39689)

(declare-fun lt!475735 () ListLongMap!14597)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072896 (= lt!475735 (getCurrentListMapNoExtraKeys!3894 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072897 () Bool)

(declare-fun e!612886 () Bool)

(declare-fun mapRes!40585 () Bool)

(assert (=> b!1072897 (= e!612889 (and e!612886 mapRes!40585))))

(declare-fun condMapEmpty!40585 () Bool)

(declare-fun mapDefault!40585 () ValueCell!12254)

(assert (=> b!1072897 (= condMapEmpty!40585 (= (arr!33062 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12254)) mapDefault!40585)))))

(declare-fun b!1072898 () Bool)

(declare-fun res!715649 () Bool)

(assert (=> b!1072898 (=> (not res!715649) (not e!612887))))

(assert (=> b!1072898 (= res!715649 (and (= (size!33600 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33601 _keys!1163) (size!33600 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072899 () Bool)

(declare-fun res!715651 () Bool)

(assert (=> b!1072899 (=> (not res!715651) (not e!612887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68738 (_ BitVec 32)) Bool)

(assert (=> b!1072899 (= res!715651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40585 () Bool)

(assert (=> mapIsEmpty!40585 mapRes!40585))

(declare-fun b!1072900 () Bool)

(declare-fun res!715648 () Bool)

(assert (=> b!1072900 (=> (not res!715648) (not e!612887))))

(declare-datatypes ((List!23153 0))(
  ( (Nil!23150) (Cons!23149 (h!24358 (_ BitVec 64)) (t!32481 List!23153)) )
))
(declare-fun arrayNoDuplicates!0 (array!68738 (_ BitVec 32) List!23153) Bool)

(assert (=> b!1072900 (= res!715648 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23150))))

(declare-fun b!1072901 () Bool)

(assert (=> b!1072901 (= e!612886 tp_is_empty!25915)))

(declare-fun mapNonEmpty!40585 () Bool)

(declare-fun tp!77780 () Bool)

(assert (=> mapNonEmpty!40585 (= mapRes!40585 (and tp!77780 e!612888))))

(declare-fun mapValue!40585 () ValueCell!12254)

(declare-fun mapRest!40585 () (Array (_ BitVec 32) ValueCell!12254))

(declare-fun mapKey!40585 () (_ BitVec 32))

(assert (=> mapNonEmpty!40585 (= (arr!33062 _values!955) (store mapRest!40585 mapKey!40585 mapValue!40585))))

(assert (= (and start!94894 res!715650) b!1072898))

(assert (= (and b!1072898 res!715649) b!1072899))

(assert (= (and b!1072899 res!715651) b!1072900))

(assert (= (and b!1072900 res!715648) b!1072896))

(assert (= (and b!1072897 condMapEmpty!40585) mapIsEmpty!40585))

(assert (= (and b!1072897 (not condMapEmpty!40585)) mapNonEmpty!40585))

(get-info :version)

(assert (= (and mapNonEmpty!40585 ((_ is ValueCellFull!12254) mapValue!40585)) b!1072895))

(assert (= (and b!1072897 ((_ is ValueCellFull!12254) mapDefault!40585)) b!1072901))

(assert (= start!94894 b!1072897))

(declare-fun m!991501 () Bool)

(assert (=> b!1072899 m!991501))

(declare-fun m!991503 () Bool)

(assert (=> start!94894 m!991503))

(declare-fun m!991505 () Bool)

(assert (=> start!94894 m!991505))

(declare-fun m!991507 () Bool)

(assert (=> start!94894 m!991507))

(declare-fun m!991509 () Bool)

(assert (=> b!1072896 m!991509))

(declare-fun m!991511 () Bool)

(assert (=> b!1072896 m!991511))

(declare-fun m!991513 () Bool)

(assert (=> b!1072900 m!991513))

(declare-fun m!991515 () Bool)

(assert (=> mapNonEmpty!40585 m!991515))

(check-sat (not mapNonEmpty!40585) (not b!1072899) tp_is_empty!25915 (not b_next!22105) b_and!34933 (not start!94894) (not b!1072900) (not b!1072896))
(check-sat b_and!34933 (not b_next!22105))
