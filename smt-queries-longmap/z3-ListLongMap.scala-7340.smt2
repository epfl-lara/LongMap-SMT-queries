; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93726 () Bool)

(assert start!93726)

(declare-fun b_free!21217 () Bool)

(declare-fun b_next!21217 () Bool)

(assert (=> start!93726 (= b_free!21217 (not b_next!21217))))

(declare-fun tp!75070 () Bool)

(declare-fun b_and!33901 () Bool)

(assert (=> start!93726 (= tp!75070 b_and!33901)))

(declare-fun b!1060114 () Bool)

(declare-fun res!708100 () Bool)

(declare-fun e!603521 () Bool)

(assert (=> b!1060114 (=> (not res!708100) (not e!603521))))

(declare-datatypes ((array!67016 0))(
  ( (array!67017 (arr!32217 (Array (_ BitVec 32) (_ BitVec 64))) (size!32755 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67016)

(declare-datatypes ((List!22495 0))(
  ( (Nil!22492) (Cons!22491 (h!23700 (_ BitVec 64)) (t!31793 List!22495)) )
))
(declare-fun arrayNoDuplicates!0 (array!67016 (_ BitVec 32) List!22495) Bool)

(assert (=> b!1060114 (= res!708100 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22492))))

(declare-fun b!1060115 () Bool)

(assert (=> b!1060115 (= e!603521 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38505 0))(
  ( (V!38506 (val!12564 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38505)

(declare-datatypes ((tuple2!15940 0))(
  ( (tuple2!15941 (_1!7981 (_ BitVec 64)) (_2!7981 V!38505)) )
))
(declare-datatypes ((List!22496 0))(
  ( (Nil!22493) (Cons!22492 (h!23701 tuple2!15940) (t!31794 List!22496)) )
))
(declare-datatypes ((ListLongMap!13909 0))(
  ( (ListLongMap!13910 (toList!6970 List!22496)) )
))
(declare-fun lt!467045 () ListLongMap!13909)

(declare-datatypes ((ValueCell!11810 0))(
  ( (ValueCellFull!11810 (v!15173 V!38505)) (EmptyCell!11810) )
))
(declare-datatypes ((array!67018 0))(
  ( (array!67019 (arr!32218 (Array (_ BitVec 32) ValueCell!11810)) (size!32756 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67018)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38505)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3587 (array!67016 array!67018 (_ BitVec 32) (_ BitVec 32) V!38505 V!38505 (_ BitVec 32) Int) ListLongMap!13909)

(assert (=> b!1060115 (= lt!467045 (getCurrentListMapNoExtraKeys!3587 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060116 () Bool)

(declare-fun e!603520 () Bool)

(declare-fun e!603522 () Bool)

(declare-fun mapRes!39208 () Bool)

(assert (=> b!1060116 (= e!603520 (and e!603522 mapRes!39208))))

(declare-fun condMapEmpty!39208 () Bool)

(declare-fun mapDefault!39208 () ValueCell!11810)

(assert (=> b!1060116 (= condMapEmpty!39208 (= (arr!32218 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11810)) mapDefault!39208)))))

(declare-fun b!1060117 () Bool)

(declare-fun res!708098 () Bool)

(assert (=> b!1060117 (=> (not res!708098) (not e!603521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67016 (_ BitVec 32)) Bool)

(assert (=> b!1060117 (= res!708098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708099 () Bool)

(assert (=> start!93726 (=> (not res!708099) (not e!603521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93726 (= res!708099 (validMask!0 mask!1515))))

(assert (=> start!93726 e!603521))

(assert (=> start!93726 true))

(declare-fun tp_is_empty!25027 () Bool)

(assert (=> start!93726 tp_is_empty!25027))

(declare-fun array_inv!24970 (array!67018) Bool)

(assert (=> start!93726 (and (array_inv!24970 _values!955) e!603520)))

(assert (=> start!93726 tp!75070))

(declare-fun array_inv!24971 (array!67016) Bool)

(assert (=> start!93726 (array_inv!24971 _keys!1163)))

(declare-fun mapNonEmpty!39208 () Bool)

(declare-fun tp!75071 () Bool)

(declare-fun e!603519 () Bool)

(assert (=> mapNonEmpty!39208 (= mapRes!39208 (and tp!75071 e!603519))))

(declare-fun mapRest!39208 () (Array (_ BitVec 32) ValueCell!11810))

(declare-fun mapValue!39208 () ValueCell!11810)

(declare-fun mapKey!39208 () (_ BitVec 32))

(assert (=> mapNonEmpty!39208 (= (arr!32218 _values!955) (store mapRest!39208 mapKey!39208 mapValue!39208))))

(declare-fun b!1060118 () Bool)

(assert (=> b!1060118 (= e!603522 tp_is_empty!25027)))

(declare-fun b!1060119 () Bool)

(assert (=> b!1060119 (= e!603519 tp_is_empty!25027)))

(declare-fun mapIsEmpty!39208 () Bool)

(assert (=> mapIsEmpty!39208 mapRes!39208))

(declare-fun b!1060120 () Bool)

(declare-fun res!708097 () Bool)

(assert (=> b!1060120 (=> (not res!708097) (not e!603521))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060120 (= res!708097 (and (= (size!32756 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32755 _keys!1163) (size!32756 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93726 res!708099) b!1060120))

(assert (= (and b!1060120 res!708097) b!1060117))

(assert (= (and b!1060117 res!708098) b!1060114))

(assert (= (and b!1060114 res!708100) b!1060115))

(assert (= (and b!1060116 condMapEmpty!39208) mapIsEmpty!39208))

(assert (= (and b!1060116 (not condMapEmpty!39208)) mapNonEmpty!39208))

(get-info :version)

(assert (= (and mapNonEmpty!39208 ((_ is ValueCellFull!11810) mapValue!39208)) b!1060119))

(assert (= (and b!1060116 ((_ is ValueCellFull!11810) mapDefault!39208)) b!1060118))

(assert (= start!93726 b!1060116))

(declare-fun m!978779 () Bool)

(assert (=> b!1060117 m!978779))

(declare-fun m!978781 () Bool)

(assert (=> start!93726 m!978781))

(declare-fun m!978783 () Bool)

(assert (=> start!93726 m!978783))

(declare-fun m!978785 () Bool)

(assert (=> start!93726 m!978785))

(declare-fun m!978787 () Bool)

(assert (=> mapNonEmpty!39208 m!978787))

(declare-fun m!978789 () Bool)

(assert (=> b!1060114 m!978789))

(declare-fun m!978791 () Bool)

(assert (=> b!1060115 m!978791))

(check-sat (not b!1060115) (not mapNonEmpty!39208) b_and!33901 (not b!1060117) tp_is_empty!25027 (not b_next!21217) (not start!93726) (not b!1060114))
(check-sat b_and!33901 (not b_next!21217))
