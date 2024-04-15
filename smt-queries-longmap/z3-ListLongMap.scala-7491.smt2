; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94912 () Bool)

(assert start!94912)

(declare-fun b_free!22123 () Bool)

(declare-fun b_next!22123 () Bool)

(assert (=> start!94912 (= b_free!22123 (not b_next!22123))))

(declare-fun tp!77833 () Bool)

(declare-fun b_and!34951 () Bool)

(assert (=> start!94912 (= tp!77833 b_and!34951)))

(declare-fun b!1073084 () Bool)

(declare-fun e!613022 () Bool)

(declare-fun tp_is_empty!25933 () Bool)

(assert (=> b!1073084 (= e!613022 tp_is_empty!25933)))

(declare-fun b!1073085 () Bool)

(declare-fun e!613024 () Bool)

(assert (=> b!1073085 (= e!613024 tp_is_empty!25933)))

(declare-fun res!715756 () Bool)

(declare-fun e!613023 () Bool)

(assert (=> start!94912 (=> (not res!715756) (not e!613023))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94912 (= res!715756 (validMask!0 mask!1515))))

(assert (=> start!94912 e!613023))

(assert (=> start!94912 true))

(assert (=> start!94912 tp_is_empty!25933))

(declare-datatypes ((V!39713 0))(
  ( (V!39714 (val!13017 Int)) )
))
(declare-datatypes ((ValueCell!12263 0))(
  ( (ValueCellFull!12263 (v!15634 V!39713)) (EmptyCell!12263) )
))
(declare-datatypes ((array!68770 0))(
  ( (array!68771 (arr!33079 (Array (_ BitVec 32) ValueCell!12263)) (size!33617 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68770)

(declare-fun e!613025 () Bool)

(declare-fun array_inv!25594 (array!68770) Bool)

(assert (=> start!94912 (and (array_inv!25594 _values!955) e!613025)))

(assert (=> start!94912 tp!77833))

(declare-datatypes ((array!68772 0))(
  ( (array!68773 (arr!33080 (Array (_ BitVec 32) (_ BitVec 64))) (size!33618 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68772)

(declare-fun array_inv!25595 (array!68772) Bool)

(assert (=> start!94912 (array_inv!25595 _keys!1163)))

(declare-fun b!1073086 () Bool)

(declare-fun res!715759 () Bool)

(assert (=> b!1073086 (=> (not res!715759) (not e!613023))))

(declare-datatypes ((List!23167 0))(
  ( (Nil!23164) (Cons!23163 (h!24372 (_ BitVec 64)) (t!32495 List!23167)) )
))
(declare-fun arrayNoDuplicates!0 (array!68772 (_ BitVec 32) List!23167) Bool)

(assert (=> b!1073086 (= res!715759 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23164))))

(declare-fun mapNonEmpty!40612 () Bool)

(declare-fun mapRes!40612 () Bool)

(declare-fun tp!77834 () Bool)

(assert (=> mapNonEmpty!40612 (= mapRes!40612 (and tp!77834 e!613024))))

(declare-fun mapValue!40612 () ValueCell!12263)

(declare-fun mapKey!40612 () (_ BitVec 32))

(declare-fun mapRest!40612 () (Array (_ BitVec 32) ValueCell!12263))

(assert (=> mapNonEmpty!40612 (= (arr!33079 _values!955) (store mapRest!40612 mapKey!40612 mapValue!40612))))

(declare-fun b!1073087 () Bool)

(declare-fun res!715758 () Bool)

(assert (=> b!1073087 (=> (not res!715758) (not e!613023))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073087 (= res!715758 (and (= (size!33617 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33618 _keys!1163) (size!33617 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40612 () Bool)

(assert (=> mapIsEmpty!40612 mapRes!40612))

(declare-fun b!1073088 () Bool)

(assert (=> b!1073088 (= e!613025 (and e!613022 mapRes!40612))))

(declare-fun condMapEmpty!40612 () Bool)

(declare-fun mapDefault!40612 () ValueCell!12263)

(assert (=> b!1073088 (= condMapEmpty!40612 (= (arr!33079 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12263)) mapDefault!40612)))))

(declare-fun b!1073089 () Bool)

(assert (=> b!1073089 (= e!613023 false)))

(declare-fun minValue!907 () V!39713)

(declare-datatypes ((tuple2!16642 0))(
  ( (tuple2!16643 (_1!8332 (_ BitVec 64)) (_2!8332 V!39713)) )
))
(declare-datatypes ((List!23168 0))(
  ( (Nil!23165) (Cons!23164 (h!24373 tuple2!16642) (t!32496 List!23168)) )
))
(declare-datatypes ((ListLongMap!14611 0))(
  ( (ListLongMap!14612 (toList!7321 List!23168)) )
))
(declare-fun lt!475789 () ListLongMap!14611)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39713)

(declare-fun getCurrentListMapNoExtraKeys!3901 (array!68772 array!68770 (_ BitVec 32) (_ BitVec 32) V!39713 V!39713 (_ BitVec 32) Int) ListLongMap!14611)

(assert (=> b!1073089 (= lt!475789 (getCurrentListMapNoExtraKeys!3901 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39713)

(declare-fun lt!475790 () ListLongMap!14611)

(assert (=> b!1073089 (= lt!475790 (getCurrentListMapNoExtraKeys!3901 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073090 () Bool)

(declare-fun res!715757 () Bool)

(assert (=> b!1073090 (=> (not res!715757) (not e!613023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68772 (_ BitVec 32)) Bool)

(assert (=> b!1073090 (= res!715757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94912 res!715756) b!1073087))

(assert (= (and b!1073087 res!715758) b!1073090))

(assert (= (and b!1073090 res!715757) b!1073086))

(assert (= (and b!1073086 res!715759) b!1073089))

(assert (= (and b!1073088 condMapEmpty!40612) mapIsEmpty!40612))

(assert (= (and b!1073088 (not condMapEmpty!40612)) mapNonEmpty!40612))

(get-info :version)

(assert (= (and mapNonEmpty!40612 ((_ is ValueCellFull!12263) mapValue!40612)) b!1073085))

(assert (= (and b!1073088 ((_ is ValueCellFull!12263) mapDefault!40612)) b!1073084))

(assert (= start!94912 b!1073088))

(declare-fun m!991645 () Bool)

(assert (=> mapNonEmpty!40612 m!991645))

(declare-fun m!991647 () Bool)

(assert (=> b!1073089 m!991647))

(declare-fun m!991649 () Bool)

(assert (=> b!1073089 m!991649))

(declare-fun m!991651 () Bool)

(assert (=> b!1073086 m!991651))

(declare-fun m!991653 () Bool)

(assert (=> start!94912 m!991653))

(declare-fun m!991655 () Bool)

(assert (=> start!94912 m!991655))

(declare-fun m!991657 () Bool)

(assert (=> start!94912 m!991657))

(declare-fun m!991659 () Bool)

(assert (=> b!1073090 m!991659))

(check-sat (not b!1073086) (not b!1073089) (not b_next!22123) (not mapNonEmpty!40612) (not b!1073090) tp_is_empty!25933 (not start!94912) b_and!34951)
(check-sat b_and!34951 (not b_next!22123))
