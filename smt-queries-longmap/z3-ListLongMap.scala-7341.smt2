; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93974 () Bool)

(assert start!93974)

(declare-fun b_free!21223 () Bool)

(declare-fun b_next!21223 () Bool)

(assert (=> start!93974 (= b_free!21223 (not b_next!21223))))

(declare-fun tp!75089 () Bool)

(declare-fun b_and!33943 () Bool)

(assert (=> start!93974 (= tp!75089 b_and!33943)))

(declare-fun b!1061657 () Bool)

(declare-fun e!604513 () Bool)

(assert (=> b!1061657 (= e!604513 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38513 0))(
  ( (V!38514 (val!12567 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38513)

(declare-datatypes ((ValueCell!11813 0))(
  ( (ValueCellFull!11813 (v!15173 V!38513)) (EmptyCell!11813) )
))
(declare-datatypes ((array!67131 0))(
  ( (array!67132 (arr!32268 (Array (_ BitVec 32) ValueCell!11813)) (size!32805 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67131)

(declare-fun minValue!907 () V!38513)

(declare-fun defaultEntry!963 () Int)

(declare-datatypes ((tuple2!15874 0))(
  ( (tuple2!15875 (_1!7948 (_ BitVec 64)) (_2!7948 V!38513)) )
))
(declare-datatypes ((List!22458 0))(
  ( (Nil!22455) (Cons!22454 (h!23672 tuple2!15874) (t!31757 List!22458)) )
))
(declare-datatypes ((ListLongMap!13851 0))(
  ( (ListLongMap!13852 (toList!6941 List!22458)) )
))
(declare-fun lt!467769 () ListLongMap!13851)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67133 0))(
  ( (array!67134 (arr!32269 (Array (_ BitVec 32) (_ BitVec 64))) (size!32806 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67133)

(declare-fun getCurrentListMapNoExtraKeys!3589 (array!67133 array!67131 (_ BitVec 32) (_ BitVec 32) V!38513 V!38513 (_ BitVec 32) Int) ListLongMap!13851)

(assert (=> b!1061657 (= lt!467769 (getCurrentListMapNoExtraKeys!3589 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061658 () Bool)

(declare-fun e!604511 () Bool)

(declare-fun e!604514 () Bool)

(declare-fun mapRes!39217 () Bool)

(assert (=> b!1061658 (= e!604511 (and e!604514 mapRes!39217))))

(declare-fun condMapEmpty!39217 () Bool)

(declare-fun mapDefault!39217 () ValueCell!11813)

(assert (=> b!1061658 (= condMapEmpty!39217 (= (arr!32268 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11813)) mapDefault!39217)))))

(declare-fun b!1061659 () Bool)

(declare-fun tp_is_empty!25033 () Bool)

(assert (=> b!1061659 (= e!604514 tp_is_empty!25033)))

(declare-fun b!1061660 () Bool)

(declare-fun res!708726 () Bool)

(assert (=> b!1061660 (=> (not res!708726) (not e!604513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67133 (_ BitVec 32)) Bool)

(assert (=> b!1061660 (= res!708726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061661 () Bool)

(declare-fun res!708727 () Bool)

(assert (=> b!1061661 (=> (not res!708727) (not e!604513))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1061661 (= res!708727 (and (= (size!32805 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32806 _keys!1163) (size!32805 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061662 () Bool)

(declare-fun res!708725 () Bool)

(assert (=> b!1061662 (=> (not res!708725) (not e!604513))))

(declare-datatypes ((List!22459 0))(
  ( (Nil!22456) (Cons!22455 (h!23673 (_ BitVec 64)) (t!31758 List!22459)) )
))
(declare-fun arrayNoDuplicates!0 (array!67133 (_ BitVec 32) List!22459) Bool)

(assert (=> b!1061662 (= res!708725 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22456))))

(declare-fun res!708724 () Bool)

(assert (=> start!93974 (=> (not res!708724) (not e!604513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93974 (= res!708724 (validMask!0 mask!1515))))

(assert (=> start!93974 e!604513))

(assert (=> start!93974 true))

(assert (=> start!93974 tp_is_empty!25033))

(declare-fun array_inv!25022 (array!67131) Bool)

(assert (=> start!93974 (and (array_inv!25022 _values!955) e!604511)))

(assert (=> start!93974 tp!75089))

(declare-fun array_inv!25023 (array!67133) Bool)

(assert (=> start!93974 (array_inv!25023 _keys!1163)))

(declare-fun mapNonEmpty!39217 () Bool)

(declare-fun tp!75088 () Bool)

(declare-fun e!604512 () Bool)

(assert (=> mapNonEmpty!39217 (= mapRes!39217 (and tp!75088 e!604512))))

(declare-fun mapRest!39217 () (Array (_ BitVec 32) ValueCell!11813))

(declare-fun mapKey!39217 () (_ BitVec 32))

(declare-fun mapValue!39217 () ValueCell!11813)

(assert (=> mapNonEmpty!39217 (= (arr!32268 _values!955) (store mapRest!39217 mapKey!39217 mapValue!39217))))

(declare-fun mapIsEmpty!39217 () Bool)

(assert (=> mapIsEmpty!39217 mapRes!39217))

(declare-fun b!1061663 () Bool)

(assert (=> b!1061663 (= e!604512 tp_is_empty!25033)))

(assert (= (and start!93974 res!708724) b!1061661))

(assert (= (and b!1061661 res!708727) b!1061660))

(assert (= (and b!1061660 res!708726) b!1061662))

(assert (= (and b!1061662 res!708725) b!1061657))

(assert (= (and b!1061658 condMapEmpty!39217) mapIsEmpty!39217))

(assert (= (and b!1061658 (not condMapEmpty!39217)) mapNonEmpty!39217))

(get-info :version)

(assert (= (and mapNonEmpty!39217 ((_ is ValueCellFull!11813) mapValue!39217)) b!1061663))

(assert (= (and b!1061658 ((_ is ValueCellFull!11813) mapDefault!39217)) b!1061659))

(assert (= start!93974 b!1061658))

(declare-fun m!981119 () Bool)

(assert (=> b!1061660 m!981119))

(declare-fun m!981121 () Bool)

(assert (=> b!1061657 m!981121))

(declare-fun m!981123 () Bool)

(assert (=> start!93974 m!981123))

(declare-fun m!981125 () Bool)

(assert (=> start!93974 m!981125))

(declare-fun m!981127 () Bool)

(assert (=> start!93974 m!981127))

(declare-fun m!981129 () Bool)

(assert (=> b!1061662 m!981129))

(declare-fun m!981131 () Bool)

(assert (=> mapNonEmpty!39217 m!981131))

(check-sat b_and!33943 (not b!1061657) (not mapNonEmpty!39217) (not b!1061660) tp_is_empty!25033 (not b!1061662) (not b_next!21223) (not start!93974))
(check-sat b_and!33943 (not b_next!21223))
