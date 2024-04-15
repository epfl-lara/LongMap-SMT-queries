; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93846 () Bool)

(assert start!93846)

(declare-fun b_free!21325 () Bool)

(declare-fun b_next!21325 () Bool)

(assert (=> start!93846 (= b_free!21325 (not b_next!21325))))

(declare-fun tp!75398 () Bool)

(declare-fun b_and!34013 () Bool)

(assert (=> start!93846 (= tp!75398 b_and!34013)))

(declare-fun b!1061321 () Bool)

(declare-fun e!604378 () Bool)

(declare-fun e!604377 () Bool)

(declare-fun mapRes!39373 () Bool)

(assert (=> b!1061321 (= e!604378 (and e!604377 mapRes!39373))))

(declare-fun condMapEmpty!39373 () Bool)

(declare-datatypes ((V!38649 0))(
  ( (V!38650 (val!12618 Int)) )
))
(declare-datatypes ((ValueCell!11864 0))(
  ( (ValueCellFull!11864 (v!15227 V!38649)) (EmptyCell!11864) )
))
(declare-datatypes ((array!67220 0))(
  ( (array!67221 (arr!32318 (Array (_ BitVec 32) ValueCell!11864)) (size!32856 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67220)

(declare-fun mapDefault!39373 () ValueCell!11864)

(assert (=> b!1061321 (= condMapEmpty!39373 (= (arr!32318 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11864)) mapDefault!39373)))))

(declare-fun b!1061322 () Bool)

(declare-fun res!708774 () Bool)

(declare-fun e!604379 () Bool)

(assert (=> b!1061322 (=> (not res!708774) (not e!604379))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67222 0))(
  ( (array!67223 (arr!32319 (Array (_ BitVec 32) (_ BitVec 64))) (size!32857 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67222)

(assert (=> b!1061322 (= res!708774 (and (= (size!32856 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32857 _keys!1163) (size!32856 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061323 () Bool)

(declare-fun res!708775 () Bool)

(assert (=> b!1061323 (=> (not res!708775) (not e!604379))))

(declare-datatypes ((List!22574 0))(
  ( (Nil!22571) (Cons!22570 (h!23779 (_ BitVec 64)) (t!31874 List!22574)) )
))
(declare-fun arrayNoDuplicates!0 (array!67222 (_ BitVec 32) List!22574) Bool)

(assert (=> b!1061323 (= res!708775 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22571))))

(declare-fun b!1061324 () Bool)

(declare-fun res!708772 () Bool)

(assert (=> b!1061324 (=> (not res!708772) (not e!604379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67222 (_ BitVec 32)) Bool)

(assert (=> b!1061324 (= res!708772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061325 () Bool)

(assert (=> b!1061325 (= e!604379 (not true))))

(declare-datatypes ((tuple2!16020 0))(
  ( (tuple2!16021 (_1!8021 (_ BitVec 64)) (_2!8021 V!38649)) )
))
(declare-datatypes ((List!22575 0))(
  ( (Nil!22572) (Cons!22571 (h!23780 tuple2!16020) (t!31875 List!22575)) )
))
(declare-datatypes ((ListLongMap!13989 0))(
  ( (ListLongMap!13990 (toList!7010 List!22575)) )
))
(declare-fun lt!467414 () ListLongMap!13989)

(declare-fun lt!467412 () ListLongMap!13989)

(assert (=> b!1061325 (= lt!467414 lt!467412)))

(declare-fun zeroValueBefore!47 () V!38649)

(declare-datatypes ((Unit!34619 0))(
  ( (Unit!34620) )
))
(declare-fun lt!467413 () Unit!34619)

(declare-fun minValue!907 () V!38649)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38649)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!621 (array!67222 array!67220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38649 V!38649 V!38649 V!38649 (_ BitVec 32) Int) Unit!34619)

(assert (=> b!1061325 (= lt!467413 (lemmaNoChangeToArrayThenSameMapNoExtras!621 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3627 (array!67222 array!67220 (_ BitVec 32) (_ BitVec 32) V!38649 V!38649 (_ BitVec 32) Int) ListLongMap!13989)

(assert (=> b!1061325 (= lt!467412 (getCurrentListMapNoExtraKeys!3627 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061325 (= lt!467414 (getCurrentListMapNoExtraKeys!3627 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!708773 () Bool)

(assert (=> start!93846 (=> (not res!708773) (not e!604379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93846 (= res!708773 (validMask!0 mask!1515))))

(assert (=> start!93846 e!604379))

(assert (=> start!93846 true))

(declare-fun tp_is_empty!25135 () Bool)

(assert (=> start!93846 tp_is_empty!25135))

(declare-fun array_inv!25044 (array!67220) Bool)

(assert (=> start!93846 (and (array_inv!25044 _values!955) e!604378)))

(assert (=> start!93846 tp!75398))

(declare-fun array_inv!25045 (array!67222) Bool)

(assert (=> start!93846 (array_inv!25045 _keys!1163)))

(declare-fun mapNonEmpty!39373 () Bool)

(declare-fun tp!75397 () Bool)

(declare-fun e!604376 () Bool)

(assert (=> mapNonEmpty!39373 (= mapRes!39373 (and tp!75397 e!604376))))

(declare-fun mapValue!39373 () ValueCell!11864)

(declare-fun mapKey!39373 () (_ BitVec 32))

(declare-fun mapRest!39373 () (Array (_ BitVec 32) ValueCell!11864))

(assert (=> mapNonEmpty!39373 (= (arr!32318 _values!955) (store mapRest!39373 mapKey!39373 mapValue!39373))))

(declare-fun b!1061326 () Bool)

(assert (=> b!1061326 (= e!604377 tp_is_empty!25135)))

(declare-fun mapIsEmpty!39373 () Bool)

(assert (=> mapIsEmpty!39373 mapRes!39373))

(declare-fun b!1061327 () Bool)

(assert (=> b!1061327 (= e!604376 tp_is_empty!25135)))

(assert (= (and start!93846 res!708773) b!1061322))

(assert (= (and b!1061322 res!708774) b!1061324))

(assert (= (and b!1061324 res!708772) b!1061323))

(assert (= (and b!1061323 res!708775) b!1061325))

(assert (= (and b!1061321 condMapEmpty!39373) mapIsEmpty!39373))

(assert (= (and b!1061321 (not condMapEmpty!39373)) mapNonEmpty!39373))

(get-info :version)

(assert (= (and mapNonEmpty!39373 ((_ is ValueCellFull!11864) mapValue!39373)) b!1061327))

(assert (= (and b!1061321 ((_ is ValueCellFull!11864) mapDefault!39373)) b!1061326))

(assert (= start!93846 b!1061321))

(declare-fun m!979693 () Bool)

(assert (=> mapNonEmpty!39373 m!979693))

(declare-fun m!979695 () Bool)

(assert (=> start!93846 m!979695))

(declare-fun m!979697 () Bool)

(assert (=> start!93846 m!979697))

(declare-fun m!979699 () Bool)

(assert (=> start!93846 m!979699))

(declare-fun m!979701 () Bool)

(assert (=> b!1061325 m!979701))

(declare-fun m!979703 () Bool)

(assert (=> b!1061325 m!979703))

(declare-fun m!979705 () Bool)

(assert (=> b!1061325 m!979705))

(declare-fun m!979707 () Bool)

(assert (=> b!1061323 m!979707))

(declare-fun m!979709 () Bool)

(assert (=> b!1061324 m!979709))

(check-sat (not b!1061325) (not start!93846) (not b!1061324) tp_is_empty!25135 b_and!34013 (not b_next!21325) (not b!1061323) (not mapNonEmpty!39373))
(check-sat b_and!34013 (not b_next!21325))
