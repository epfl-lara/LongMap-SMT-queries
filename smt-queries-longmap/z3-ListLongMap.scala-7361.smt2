; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93864 () Bool)

(assert start!93864)

(declare-fun b_free!21343 () Bool)

(declare-fun b_next!21343 () Bool)

(assert (=> start!93864 (= b_free!21343 (not b_next!21343))))

(declare-fun tp!75451 () Bool)

(declare-fun b_and!34031 () Bool)

(assert (=> start!93864 (= tp!75451 b_and!34031)))

(declare-fun mapIsEmpty!39400 () Bool)

(declare-fun mapRes!39400 () Bool)

(assert (=> mapIsEmpty!39400 mapRes!39400))

(declare-fun b!1061510 () Bool)

(declare-fun res!708883 () Bool)

(declare-fun e!604511 () Bool)

(assert (=> b!1061510 (=> (not res!708883) (not e!604511))))

(declare-datatypes ((array!67256 0))(
  ( (array!67257 (arr!32336 (Array (_ BitVec 32) (_ BitVec 64))) (size!32874 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67256)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67256 (_ BitVec 32)) Bool)

(assert (=> b!1061510 (= res!708883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061511 () Bool)

(assert (=> b!1061511 (= e!604511 (not true))))

(declare-datatypes ((V!38673 0))(
  ( (V!38674 (val!12627 Int)) )
))
(declare-datatypes ((tuple2!16032 0))(
  ( (tuple2!16033 (_1!8027 (_ BitVec 64)) (_2!8027 V!38673)) )
))
(declare-datatypes ((List!22587 0))(
  ( (Nil!22584) (Cons!22583 (h!23792 tuple2!16032) (t!31887 List!22587)) )
))
(declare-datatypes ((ListLongMap!14001 0))(
  ( (ListLongMap!14002 (toList!7016 List!22587)) )
))
(declare-fun lt!467495 () ListLongMap!14001)

(declare-fun lt!467493 () ListLongMap!14001)

(assert (=> b!1061511 (= lt!467495 lt!467493)))

(declare-fun zeroValueBefore!47 () V!38673)

(declare-datatypes ((ValueCell!11873 0))(
  ( (ValueCellFull!11873 (v!15236 V!38673)) (EmptyCell!11873) )
))
(declare-datatypes ((array!67258 0))(
  ( (array!67259 (arr!32337 (Array (_ BitVec 32) ValueCell!11873)) (size!32875 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67258)

(declare-fun minValue!907 () V!38673)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38673)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((Unit!34631 0))(
  ( (Unit!34632) )
))
(declare-fun lt!467494 () Unit!34631)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!627 (array!67256 array!67258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38673 V!38673 V!38673 V!38673 (_ BitVec 32) Int) Unit!34631)

(assert (=> b!1061511 (= lt!467494 (lemmaNoChangeToArrayThenSameMapNoExtras!627 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3633 (array!67256 array!67258 (_ BitVec 32) (_ BitVec 32) V!38673 V!38673 (_ BitVec 32) Int) ListLongMap!14001)

(assert (=> b!1061511 (= lt!467493 (getCurrentListMapNoExtraKeys!3633 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061511 (= lt!467495 (getCurrentListMapNoExtraKeys!3633 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061512 () Bool)

(declare-fun res!708882 () Bool)

(assert (=> b!1061512 (=> (not res!708882) (not e!604511))))

(declare-datatypes ((List!22588 0))(
  ( (Nil!22585) (Cons!22584 (h!23793 (_ BitVec 64)) (t!31888 List!22588)) )
))
(declare-fun arrayNoDuplicates!0 (array!67256 (_ BitVec 32) List!22588) Bool)

(assert (=> b!1061512 (= res!708882 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22585))))

(declare-fun b!1061513 () Bool)

(declare-fun res!708881 () Bool)

(assert (=> b!1061513 (=> (not res!708881) (not e!604511))))

(assert (=> b!1061513 (= res!708881 (and (= (size!32875 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32874 _keys!1163) (size!32875 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708880 () Bool)

(assert (=> start!93864 (=> (not res!708880) (not e!604511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93864 (= res!708880 (validMask!0 mask!1515))))

(assert (=> start!93864 e!604511))

(assert (=> start!93864 true))

(declare-fun tp_is_empty!25153 () Bool)

(assert (=> start!93864 tp_is_empty!25153))

(declare-fun e!604514 () Bool)

(declare-fun array_inv!25054 (array!67258) Bool)

(assert (=> start!93864 (and (array_inv!25054 _values!955) e!604514)))

(assert (=> start!93864 tp!75451))

(declare-fun array_inv!25055 (array!67256) Bool)

(assert (=> start!93864 (array_inv!25055 _keys!1163)))

(declare-fun b!1061514 () Bool)

(declare-fun e!604515 () Bool)

(assert (=> b!1061514 (= e!604515 tp_is_empty!25153)))

(declare-fun b!1061515 () Bool)

(assert (=> b!1061515 (= e!604514 (and e!604515 mapRes!39400))))

(declare-fun condMapEmpty!39400 () Bool)

(declare-fun mapDefault!39400 () ValueCell!11873)

(assert (=> b!1061515 (= condMapEmpty!39400 (= (arr!32337 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11873)) mapDefault!39400)))))

(declare-fun mapNonEmpty!39400 () Bool)

(declare-fun tp!75452 () Bool)

(declare-fun e!604512 () Bool)

(assert (=> mapNonEmpty!39400 (= mapRes!39400 (and tp!75452 e!604512))))

(declare-fun mapValue!39400 () ValueCell!11873)

(declare-fun mapKey!39400 () (_ BitVec 32))

(declare-fun mapRest!39400 () (Array (_ BitVec 32) ValueCell!11873))

(assert (=> mapNonEmpty!39400 (= (arr!32337 _values!955) (store mapRest!39400 mapKey!39400 mapValue!39400))))

(declare-fun b!1061516 () Bool)

(assert (=> b!1061516 (= e!604512 tp_is_empty!25153)))

(assert (= (and start!93864 res!708880) b!1061513))

(assert (= (and b!1061513 res!708881) b!1061510))

(assert (= (and b!1061510 res!708883) b!1061512))

(assert (= (and b!1061512 res!708882) b!1061511))

(assert (= (and b!1061515 condMapEmpty!39400) mapIsEmpty!39400))

(assert (= (and b!1061515 (not condMapEmpty!39400)) mapNonEmpty!39400))

(get-info :version)

(assert (= (and mapNonEmpty!39400 ((_ is ValueCellFull!11873) mapValue!39400)) b!1061516))

(assert (= (and b!1061515 ((_ is ValueCellFull!11873) mapDefault!39400)) b!1061514))

(assert (= start!93864 b!1061515))

(declare-fun m!979855 () Bool)

(assert (=> b!1061511 m!979855))

(declare-fun m!979857 () Bool)

(assert (=> b!1061511 m!979857))

(declare-fun m!979859 () Bool)

(assert (=> b!1061511 m!979859))

(declare-fun m!979861 () Bool)

(assert (=> b!1061510 m!979861))

(declare-fun m!979863 () Bool)

(assert (=> start!93864 m!979863))

(declare-fun m!979865 () Bool)

(assert (=> start!93864 m!979865))

(declare-fun m!979867 () Bool)

(assert (=> start!93864 m!979867))

(declare-fun m!979869 () Bool)

(assert (=> b!1061512 m!979869))

(declare-fun m!979871 () Bool)

(assert (=> mapNonEmpty!39400 m!979871))

(check-sat (not b!1061512) (not start!93864) (not mapNonEmpty!39400) (not b!1061510) tp_is_empty!25153 (not b!1061511) b_and!34031 (not b_next!21343))
(check-sat b_and!34031 (not b_next!21343))
