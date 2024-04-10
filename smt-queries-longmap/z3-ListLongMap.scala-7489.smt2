; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94908 () Bool)

(assert start!94908)

(declare-fun b_free!22113 () Bool)

(declare-fun b_next!22113 () Bool)

(assert (=> start!94908 (= b_free!22113 (not b_next!22113))))

(declare-fun tp!77804 () Bool)

(declare-fun b_and!34967 () Bool)

(assert (=> start!94908 (= tp!77804 b_and!34967)))

(declare-fun b!1073133 () Bool)

(declare-fun e!613043 () Bool)

(declare-fun e!613042 () Bool)

(declare-fun mapRes!40597 () Bool)

(assert (=> b!1073133 (= e!613043 (and e!613042 mapRes!40597))))

(declare-fun condMapEmpty!40597 () Bool)

(declare-datatypes ((V!39699 0))(
  ( (V!39700 (val!13012 Int)) )
))
(declare-datatypes ((ValueCell!12258 0))(
  ( (ValueCellFull!12258 (v!15630 V!39699)) (EmptyCell!12258) )
))
(declare-datatypes ((array!68809 0))(
  ( (array!68810 (arr!33098 (Array (_ BitVec 32) ValueCell!12258)) (size!33634 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68809)

(declare-fun mapDefault!40597 () ValueCell!12258)

(assert (=> b!1073133 (= condMapEmpty!40597 (= (arr!33098 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12258)) mapDefault!40597)))))

(declare-fun b!1073134 () Bool)

(declare-fun tp_is_empty!25923 () Bool)

(assert (=> b!1073134 (= e!613042 tp_is_empty!25923)))

(declare-fun b!1073135 () Bool)

(declare-fun e!613041 () Bool)

(assert (=> b!1073135 (= e!613041 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun minValue!907 () V!39699)

(declare-datatypes ((array!68811 0))(
  ( (array!68812 (arr!33099 (Array (_ BitVec 32) (_ BitVec 64))) (size!33635 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68811)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((tuple2!16570 0))(
  ( (tuple2!16571 (_1!8296 (_ BitVec 64)) (_2!8296 V!39699)) )
))
(declare-datatypes ((List!23105 0))(
  ( (Nil!23102) (Cons!23101 (h!24310 tuple2!16570) (t!32442 List!23105)) )
))
(declare-datatypes ((ListLongMap!14539 0))(
  ( (ListLongMap!14540 (toList!7285 List!23105)) )
))
(declare-fun lt!475960 () ListLongMap!14539)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39699)

(declare-fun getCurrentListMapNoExtraKeys!3849 (array!68811 array!68809 (_ BitVec 32) (_ BitVec 32) V!39699 V!39699 (_ BitVec 32) Int) ListLongMap!14539)

(assert (=> b!1073135 (= lt!475960 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39699)

(declare-fun lt!475959 () ListLongMap!14539)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073135 (= lt!475959 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073136 () Bool)

(declare-fun e!613039 () Bool)

(assert (=> b!1073136 (= e!613039 tp_is_empty!25923)))

(declare-fun mapNonEmpty!40597 () Bool)

(declare-fun tp!77803 () Bool)

(assert (=> mapNonEmpty!40597 (= mapRes!40597 (and tp!77803 e!613039))))

(declare-fun mapKey!40597 () (_ BitVec 32))

(declare-fun mapRest!40597 () (Array (_ BitVec 32) ValueCell!12258))

(declare-fun mapValue!40597 () ValueCell!12258)

(assert (=> mapNonEmpty!40597 (= (arr!33098 _values!955) (store mapRest!40597 mapKey!40597 mapValue!40597))))

(declare-fun b!1073137 () Bool)

(declare-fun res!715765 () Bool)

(assert (=> b!1073137 (=> (not res!715765) (not e!613041))))

(declare-datatypes ((List!23106 0))(
  ( (Nil!23103) (Cons!23102 (h!24311 (_ BitVec 64)) (t!32443 List!23106)) )
))
(declare-fun arrayNoDuplicates!0 (array!68811 (_ BitVec 32) List!23106) Bool)

(assert (=> b!1073137 (= res!715765 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23103))))

(declare-fun mapIsEmpty!40597 () Bool)

(assert (=> mapIsEmpty!40597 mapRes!40597))

(declare-fun b!1073138 () Bool)

(declare-fun res!715767 () Bool)

(assert (=> b!1073138 (=> (not res!715767) (not e!613041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68811 (_ BitVec 32)) Bool)

(assert (=> b!1073138 (= res!715767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!715768 () Bool)

(assert (=> start!94908 (=> (not res!715768) (not e!613041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94908 (= res!715768 (validMask!0 mask!1515))))

(assert (=> start!94908 e!613041))

(assert (=> start!94908 true))

(assert (=> start!94908 tp_is_empty!25923))

(declare-fun array_inv!25586 (array!68809) Bool)

(assert (=> start!94908 (and (array_inv!25586 _values!955) e!613043)))

(assert (=> start!94908 tp!77804))

(declare-fun array_inv!25587 (array!68811) Bool)

(assert (=> start!94908 (array_inv!25587 _keys!1163)))

(declare-fun b!1073132 () Bool)

(declare-fun res!715766 () Bool)

(assert (=> b!1073132 (=> (not res!715766) (not e!613041))))

(assert (=> b!1073132 (= res!715766 (and (= (size!33634 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33635 _keys!1163) (size!33634 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94908 res!715768) b!1073132))

(assert (= (and b!1073132 res!715766) b!1073138))

(assert (= (and b!1073138 res!715767) b!1073137))

(assert (= (and b!1073137 res!715765) b!1073135))

(assert (= (and b!1073133 condMapEmpty!40597) mapIsEmpty!40597))

(assert (= (and b!1073133 (not condMapEmpty!40597)) mapNonEmpty!40597))

(get-info :version)

(assert (= (and mapNonEmpty!40597 ((_ is ValueCellFull!12258) mapValue!40597)) b!1073136))

(assert (= (and b!1073133 ((_ is ValueCellFull!12258) mapDefault!40597)) b!1073134))

(assert (= start!94908 b!1073133))

(declare-fun m!992191 () Bool)

(assert (=> b!1073138 m!992191))

(declare-fun m!992193 () Bool)

(assert (=> start!94908 m!992193))

(declare-fun m!992195 () Bool)

(assert (=> start!94908 m!992195))

(declare-fun m!992197 () Bool)

(assert (=> start!94908 m!992197))

(declare-fun m!992199 () Bool)

(assert (=> mapNonEmpty!40597 m!992199))

(declare-fun m!992201 () Bool)

(assert (=> b!1073135 m!992201))

(declare-fun m!992203 () Bool)

(assert (=> b!1073135 m!992203))

(declare-fun m!992205 () Bool)

(assert (=> b!1073137 m!992205))

(check-sat (not start!94908) tp_is_empty!25923 b_and!34967 (not b_next!22113) (not b!1073135) (not mapNonEmpty!40597) (not b!1073137) (not b!1073138))
(check-sat b_and!34967 (not b_next!22113))
