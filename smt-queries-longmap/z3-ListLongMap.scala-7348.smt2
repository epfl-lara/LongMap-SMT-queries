; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93794 () Bool)

(assert start!93794)

(declare-fun b_free!21267 () Bool)

(declare-fun b_next!21267 () Bool)

(assert (=> start!93794 (= b_free!21267 (not b_next!21267))))

(declare-fun tp!75223 () Bool)

(declare-fun b_and!33981 () Bool)

(assert (=> start!93794 (= tp!75223 b_and!33981)))

(declare-fun mapNonEmpty!39286 () Bool)

(declare-fun mapRes!39286 () Bool)

(declare-fun tp!75224 () Bool)

(declare-fun e!604038 () Bool)

(assert (=> mapNonEmpty!39286 (= mapRes!39286 (and tp!75224 e!604038))))

(declare-datatypes ((V!38571 0))(
  ( (V!38572 (val!12589 Int)) )
))
(declare-datatypes ((ValueCell!11835 0))(
  ( (ValueCellFull!11835 (v!15199 V!38571)) (EmptyCell!11835) )
))
(declare-fun mapRest!39286 () (Array (_ BitVec 32) ValueCell!11835))

(declare-datatypes ((array!67165 0))(
  ( (array!67166 (arr!32290 (Array (_ BitVec 32) ValueCell!11835)) (size!32826 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67165)

(declare-fun mapKey!39286 () (_ BitVec 32))

(declare-fun mapValue!39286 () ValueCell!11835)

(assert (=> mapNonEmpty!39286 (= (arr!32290 _values!955) (store mapRest!39286 mapKey!39286 mapValue!39286))))

(declare-fun mapIsEmpty!39286 () Bool)

(assert (=> mapIsEmpty!39286 mapRes!39286))

(declare-fun b!1060865 () Bool)

(declare-fun e!604035 () Bool)

(declare-fun tp_is_empty!25077 () Bool)

(assert (=> b!1060865 (= e!604035 tp_is_empty!25077)))

(declare-fun res!708495 () Bool)

(declare-fun e!604037 () Bool)

(assert (=> start!93794 (=> (not res!708495) (not e!604037))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93794 (= res!708495 (validMask!0 mask!1515))))

(assert (=> start!93794 e!604037))

(assert (=> start!93794 true))

(assert (=> start!93794 tp_is_empty!25077))

(declare-fun e!604034 () Bool)

(declare-fun array_inv!25022 (array!67165) Bool)

(assert (=> start!93794 (and (array_inv!25022 _values!955) e!604034)))

(assert (=> start!93794 tp!75223))

(declare-datatypes ((array!67167 0))(
  ( (array!67168 (arr!32291 (Array (_ BitVec 32) (_ BitVec 64))) (size!32827 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67167)

(declare-fun array_inv!25023 (array!67167) Bool)

(assert (=> start!93794 (array_inv!25023 _keys!1163)))

(declare-fun b!1060866 () Bool)

(assert (=> b!1060866 (= e!604038 tp_is_empty!25077)))

(declare-fun b!1060867 () Bool)

(assert (=> b!1060867 (= e!604037 false)))

(declare-fun minValue!907 () V!38571)

(declare-datatypes ((tuple2!15906 0))(
  ( (tuple2!15907 (_1!7964 (_ BitVec 64)) (_2!7964 V!38571)) )
))
(declare-datatypes ((List!22493 0))(
  ( (Nil!22490) (Cons!22489 (h!23698 tuple2!15906) (t!31802 List!22493)) )
))
(declare-datatypes ((ListLongMap!13875 0))(
  ( (ListLongMap!13876 (toList!6953 List!22493)) )
))
(declare-fun lt!467401 () ListLongMap!13875)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38571)

(declare-fun getCurrentListMapNoExtraKeys!3555 (array!67167 array!67165 (_ BitVec 32) (_ BitVec 32) V!38571 V!38571 (_ BitVec 32) Int) ListLongMap!13875)

(assert (=> b!1060867 (= lt!467401 (getCurrentListMapNoExtraKeys!3555 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38571)

(declare-fun lt!467400 () ListLongMap!13875)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060867 (= lt!467400 (getCurrentListMapNoExtraKeys!3555 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060868 () Bool)

(declare-fun res!708493 () Bool)

(assert (=> b!1060868 (=> (not res!708493) (not e!604037))))

(declare-datatypes ((List!22494 0))(
  ( (Nil!22491) (Cons!22490 (h!23699 (_ BitVec 64)) (t!31803 List!22494)) )
))
(declare-fun arrayNoDuplicates!0 (array!67167 (_ BitVec 32) List!22494) Bool)

(assert (=> b!1060868 (= res!708493 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22491))))

(declare-fun b!1060869 () Bool)

(declare-fun res!708494 () Bool)

(assert (=> b!1060869 (=> (not res!708494) (not e!604037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67167 (_ BitVec 32)) Bool)

(assert (=> b!1060869 (= res!708494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060870 () Bool)

(assert (=> b!1060870 (= e!604034 (and e!604035 mapRes!39286))))

(declare-fun condMapEmpty!39286 () Bool)

(declare-fun mapDefault!39286 () ValueCell!11835)

(assert (=> b!1060870 (= condMapEmpty!39286 (= (arr!32290 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11835)) mapDefault!39286)))))

(declare-fun b!1060871 () Bool)

(declare-fun res!708496 () Bool)

(assert (=> b!1060871 (=> (not res!708496) (not e!604037))))

(assert (=> b!1060871 (= res!708496 (and (= (size!32826 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32827 _keys!1163) (size!32826 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93794 res!708495) b!1060871))

(assert (= (and b!1060871 res!708496) b!1060869))

(assert (= (and b!1060869 res!708494) b!1060868))

(assert (= (and b!1060868 res!708493) b!1060867))

(assert (= (and b!1060870 condMapEmpty!39286) mapIsEmpty!39286))

(assert (= (and b!1060870 (not condMapEmpty!39286)) mapNonEmpty!39286))

(get-info :version)

(assert (= (and mapNonEmpty!39286 ((_ is ValueCellFull!11835) mapValue!39286)) b!1060866))

(assert (= (and b!1060870 ((_ is ValueCellFull!11835) mapDefault!39286)) b!1060865))

(assert (= start!93794 b!1060870))

(declare-fun m!979831 () Bool)

(assert (=> mapNonEmpty!39286 m!979831))

(declare-fun m!979833 () Bool)

(assert (=> b!1060867 m!979833))

(declare-fun m!979835 () Bool)

(assert (=> b!1060867 m!979835))

(declare-fun m!979837 () Bool)

(assert (=> b!1060869 m!979837))

(declare-fun m!979839 () Bool)

(assert (=> b!1060868 m!979839))

(declare-fun m!979841 () Bool)

(assert (=> start!93794 m!979841))

(declare-fun m!979843 () Bool)

(assert (=> start!93794 m!979843))

(declare-fun m!979845 () Bool)

(assert (=> start!93794 m!979845))

(check-sat b_and!33981 (not start!93794) (not b_next!21267) (not mapNonEmpty!39286) tp_is_empty!25077 (not b!1060868) (not b!1060867) (not b!1060869))
(check-sat b_and!33981 (not b_next!21267))
