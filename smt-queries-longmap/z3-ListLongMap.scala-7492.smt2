; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94918 () Bool)

(assert start!94918)

(declare-fun b_free!22129 () Bool)

(declare-fun b_next!22129 () Bool)

(assert (=> start!94918 (= b_free!22129 (not b_next!22129))))

(declare-fun tp!77851 () Bool)

(declare-fun b_and!34957 () Bool)

(assert (=> start!94918 (= tp!77851 b_and!34957)))

(declare-fun b!1073147 () Bool)

(declare-fun e!613069 () Bool)

(assert (=> b!1073147 (= e!613069 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39721 0))(
  ( (V!39722 (val!13020 Int)) )
))
(declare-datatypes ((tuple2!16648 0))(
  ( (tuple2!16649 (_1!8335 (_ BitVec 64)) (_2!8335 V!39721)) )
))
(declare-datatypes ((List!23172 0))(
  ( (Nil!23169) (Cons!23168 (h!24377 tuple2!16648) (t!32500 List!23172)) )
))
(declare-datatypes ((ListLongMap!14617 0))(
  ( (ListLongMap!14618 (toList!7324 List!23172)) )
))
(declare-fun lt!475807 () ListLongMap!14617)

(declare-datatypes ((ValueCell!12266 0))(
  ( (ValueCellFull!12266 (v!15637 V!39721)) (EmptyCell!12266) )
))
(declare-datatypes ((array!68782 0))(
  ( (array!68783 (arr!33085 (Array (_ BitVec 32) ValueCell!12266)) (size!33623 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68782)

(declare-fun minValue!907 () V!39721)

(declare-datatypes ((array!68784 0))(
  ( (array!68785 (arr!33086 (Array (_ BitVec 32) (_ BitVec 64))) (size!33624 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68784)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39721)

(declare-fun getCurrentListMapNoExtraKeys!3904 (array!68784 array!68782 (_ BitVec 32) (_ BitVec 32) V!39721 V!39721 (_ BitVec 32) Int) ListLongMap!14617)

(assert (=> b!1073147 (= lt!475807 (getCurrentListMapNoExtraKeys!3904 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39721)

(declare-fun lt!475808 () ListLongMap!14617)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073147 (= lt!475808 (getCurrentListMapNoExtraKeys!3904 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073148 () Bool)

(declare-fun e!613068 () Bool)

(declare-fun e!613070 () Bool)

(declare-fun mapRes!40621 () Bool)

(assert (=> b!1073148 (= e!613068 (and e!613070 mapRes!40621))))

(declare-fun condMapEmpty!40621 () Bool)

(declare-fun mapDefault!40621 () ValueCell!12266)

(assert (=> b!1073148 (= condMapEmpty!40621 (= (arr!33085 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12266)) mapDefault!40621)))))

(declare-fun b!1073149 () Bool)

(declare-fun res!715795 () Bool)

(assert (=> b!1073149 (=> (not res!715795) (not e!613069))))

(assert (=> b!1073149 (= res!715795 (and (= (size!33623 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33624 _keys!1163) (size!33623 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!715794 () Bool)

(assert (=> start!94918 (=> (not res!715794) (not e!613069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94918 (= res!715794 (validMask!0 mask!1515))))

(assert (=> start!94918 e!613069))

(assert (=> start!94918 true))

(declare-fun tp_is_empty!25939 () Bool)

(assert (=> start!94918 tp_is_empty!25939))

(declare-fun array_inv!25600 (array!68782) Bool)

(assert (=> start!94918 (and (array_inv!25600 _values!955) e!613068)))

(assert (=> start!94918 tp!77851))

(declare-fun array_inv!25601 (array!68784) Bool)

(assert (=> start!94918 (array_inv!25601 _keys!1163)))

(declare-fun b!1073150 () Bool)

(declare-fun res!715792 () Bool)

(assert (=> b!1073150 (=> (not res!715792) (not e!613069))))

(declare-datatypes ((List!23173 0))(
  ( (Nil!23170) (Cons!23169 (h!24378 (_ BitVec 64)) (t!32501 List!23173)) )
))
(declare-fun arrayNoDuplicates!0 (array!68784 (_ BitVec 32) List!23173) Bool)

(assert (=> b!1073150 (= res!715792 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23170))))

(declare-fun b!1073151 () Bool)

(assert (=> b!1073151 (= e!613070 tp_is_empty!25939)))

(declare-fun b!1073152 () Bool)

(declare-fun e!613066 () Bool)

(assert (=> b!1073152 (= e!613066 tp_is_empty!25939)))

(declare-fun b!1073153 () Bool)

(declare-fun res!715793 () Bool)

(assert (=> b!1073153 (=> (not res!715793) (not e!613069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68784 (_ BitVec 32)) Bool)

(assert (=> b!1073153 (= res!715793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40621 () Bool)

(declare-fun tp!77852 () Bool)

(assert (=> mapNonEmpty!40621 (= mapRes!40621 (and tp!77852 e!613066))))

(declare-fun mapValue!40621 () ValueCell!12266)

(declare-fun mapRest!40621 () (Array (_ BitVec 32) ValueCell!12266))

(declare-fun mapKey!40621 () (_ BitVec 32))

(assert (=> mapNonEmpty!40621 (= (arr!33085 _values!955) (store mapRest!40621 mapKey!40621 mapValue!40621))))

(declare-fun mapIsEmpty!40621 () Bool)

(assert (=> mapIsEmpty!40621 mapRes!40621))

(assert (= (and start!94918 res!715794) b!1073149))

(assert (= (and b!1073149 res!715795) b!1073153))

(assert (= (and b!1073153 res!715793) b!1073150))

(assert (= (and b!1073150 res!715792) b!1073147))

(assert (= (and b!1073148 condMapEmpty!40621) mapIsEmpty!40621))

(assert (= (and b!1073148 (not condMapEmpty!40621)) mapNonEmpty!40621))

(get-info :version)

(assert (= (and mapNonEmpty!40621 ((_ is ValueCellFull!12266) mapValue!40621)) b!1073152))

(assert (= (and b!1073148 ((_ is ValueCellFull!12266) mapDefault!40621)) b!1073151))

(assert (= start!94918 b!1073148))

(declare-fun m!991693 () Bool)

(assert (=> b!1073147 m!991693))

(declare-fun m!991695 () Bool)

(assert (=> b!1073147 m!991695))

(declare-fun m!991697 () Bool)

(assert (=> b!1073153 m!991697))

(declare-fun m!991699 () Bool)

(assert (=> start!94918 m!991699))

(declare-fun m!991701 () Bool)

(assert (=> start!94918 m!991701))

(declare-fun m!991703 () Bool)

(assert (=> start!94918 m!991703))

(declare-fun m!991705 () Bool)

(assert (=> b!1073150 m!991705))

(declare-fun m!991707 () Bool)

(assert (=> mapNonEmpty!40621 m!991707))

(check-sat (not start!94918) b_and!34957 (not b!1073153) tp_is_empty!25939 (not b!1073147) (not b!1073150) (not mapNonEmpty!40621) (not b_next!22129))
(check-sat b_and!34957 (not b_next!22129))
