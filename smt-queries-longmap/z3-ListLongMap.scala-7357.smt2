; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93840 () Bool)

(assert start!93840)

(declare-fun b_free!21319 () Bool)

(declare-fun b_next!21319 () Bool)

(assert (=> start!93840 (= b_free!21319 (not b_next!21319))))

(declare-fun tp!75379 () Bool)

(declare-fun b_and!34007 () Bool)

(assert (=> start!93840 (= tp!75379 b_and!34007)))

(declare-fun b!1061258 () Bool)

(declare-fun e!604332 () Bool)

(assert (=> b!1061258 (= e!604332 (not true))))

(declare-datatypes ((V!38641 0))(
  ( (V!38642 (val!12615 Int)) )
))
(declare-datatypes ((tuple2!16014 0))(
  ( (tuple2!16015 (_1!8018 (_ BitVec 64)) (_2!8018 V!38641)) )
))
(declare-datatypes ((List!22569 0))(
  ( (Nil!22566) (Cons!22565 (h!23774 tuple2!16014) (t!31869 List!22569)) )
))
(declare-datatypes ((ListLongMap!13983 0))(
  ( (ListLongMap!13984 (toList!7007 List!22569)) )
))
(declare-fun lt!467387 () ListLongMap!13983)

(declare-fun lt!467385 () ListLongMap!13983)

(assert (=> b!1061258 (= lt!467387 lt!467385)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11861 0))(
  ( (ValueCellFull!11861 (v!15224 V!38641)) (EmptyCell!11861) )
))
(declare-datatypes ((array!67208 0))(
  ( (array!67209 (arr!32312 (Array (_ BitVec 32) ValueCell!11861)) (size!32850 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67208)

(declare-fun minValue!907 () V!38641)

(declare-datatypes ((Unit!34613 0))(
  ( (Unit!34614) )
))
(declare-fun lt!467386 () Unit!34613)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38641)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38641)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67210 0))(
  ( (array!67211 (arr!32313 (Array (_ BitVec 32) (_ BitVec 64))) (size!32851 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67210)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!618 (array!67210 array!67208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38641 V!38641 V!38641 V!38641 (_ BitVec 32) Int) Unit!34613)

(assert (=> b!1061258 (= lt!467386 (lemmaNoChangeToArrayThenSameMapNoExtras!618 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3624 (array!67210 array!67208 (_ BitVec 32) (_ BitVec 32) V!38641 V!38641 (_ BitVec 32) Int) ListLongMap!13983)

(assert (=> b!1061258 (= lt!467385 (getCurrentListMapNoExtraKeys!3624 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061258 (= lt!467387 (getCurrentListMapNoExtraKeys!3624 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061259 () Bool)

(declare-fun res!708738 () Bool)

(assert (=> b!1061259 (=> (not res!708738) (not e!604332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67210 (_ BitVec 32)) Bool)

(assert (=> b!1061259 (= res!708738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061260 () Bool)

(declare-fun e!604333 () Bool)

(declare-fun tp_is_empty!25129 () Bool)

(assert (=> b!1061260 (= e!604333 tp_is_empty!25129)))

(declare-fun mapIsEmpty!39364 () Bool)

(declare-fun mapRes!39364 () Bool)

(assert (=> mapIsEmpty!39364 mapRes!39364))

(declare-fun mapNonEmpty!39364 () Bool)

(declare-fun tp!75380 () Bool)

(declare-fun e!604331 () Bool)

(assert (=> mapNonEmpty!39364 (= mapRes!39364 (and tp!75380 e!604331))))

(declare-fun mapKey!39364 () (_ BitVec 32))

(declare-fun mapValue!39364 () ValueCell!11861)

(declare-fun mapRest!39364 () (Array (_ BitVec 32) ValueCell!11861))

(assert (=> mapNonEmpty!39364 (= (arr!32312 _values!955) (store mapRest!39364 mapKey!39364 mapValue!39364))))

(declare-fun res!708737 () Bool)

(assert (=> start!93840 (=> (not res!708737) (not e!604332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93840 (= res!708737 (validMask!0 mask!1515))))

(assert (=> start!93840 e!604332))

(assert (=> start!93840 true))

(assert (=> start!93840 tp_is_empty!25129))

(declare-fun e!604335 () Bool)

(declare-fun array_inv!25040 (array!67208) Bool)

(assert (=> start!93840 (and (array_inv!25040 _values!955) e!604335)))

(assert (=> start!93840 tp!75379))

(declare-fun array_inv!25041 (array!67210) Bool)

(assert (=> start!93840 (array_inv!25041 _keys!1163)))

(declare-fun b!1061261 () Bool)

(declare-fun res!708739 () Bool)

(assert (=> b!1061261 (=> (not res!708739) (not e!604332))))

(declare-datatypes ((List!22570 0))(
  ( (Nil!22567) (Cons!22566 (h!23775 (_ BitVec 64)) (t!31870 List!22570)) )
))
(declare-fun arrayNoDuplicates!0 (array!67210 (_ BitVec 32) List!22570) Bool)

(assert (=> b!1061261 (= res!708739 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22567))))

(declare-fun b!1061262 () Bool)

(assert (=> b!1061262 (= e!604331 tp_is_empty!25129)))

(declare-fun b!1061263 () Bool)

(declare-fun res!708736 () Bool)

(assert (=> b!1061263 (=> (not res!708736) (not e!604332))))

(assert (=> b!1061263 (= res!708736 (and (= (size!32850 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32851 _keys!1163) (size!32850 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061264 () Bool)

(assert (=> b!1061264 (= e!604335 (and e!604333 mapRes!39364))))

(declare-fun condMapEmpty!39364 () Bool)

(declare-fun mapDefault!39364 () ValueCell!11861)

(assert (=> b!1061264 (= condMapEmpty!39364 (= (arr!32312 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11861)) mapDefault!39364)))))

(assert (= (and start!93840 res!708737) b!1061263))

(assert (= (and b!1061263 res!708736) b!1061259))

(assert (= (and b!1061259 res!708738) b!1061261))

(assert (= (and b!1061261 res!708739) b!1061258))

(assert (= (and b!1061264 condMapEmpty!39364) mapIsEmpty!39364))

(assert (= (and b!1061264 (not condMapEmpty!39364)) mapNonEmpty!39364))

(get-info :version)

(assert (= (and mapNonEmpty!39364 ((_ is ValueCellFull!11861) mapValue!39364)) b!1061262))

(assert (= (and b!1061264 ((_ is ValueCellFull!11861) mapDefault!39364)) b!1061260))

(assert (= start!93840 b!1061264))

(declare-fun m!979639 () Bool)

(assert (=> b!1061258 m!979639))

(declare-fun m!979641 () Bool)

(assert (=> b!1061258 m!979641))

(declare-fun m!979643 () Bool)

(assert (=> b!1061258 m!979643))

(declare-fun m!979645 () Bool)

(assert (=> start!93840 m!979645))

(declare-fun m!979647 () Bool)

(assert (=> start!93840 m!979647))

(declare-fun m!979649 () Bool)

(assert (=> start!93840 m!979649))

(declare-fun m!979651 () Bool)

(assert (=> mapNonEmpty!39364 m!979651))

(declare-fun m!979653 () Bool)

(assert (=> b!1061261 m!979653))

(declare-fun m!979655 () Bool)

(assert (=> b!1061259 m!979655))

(check-sat (not mapNonEmpty!39364) (not b!1061261) b_and!34007 (not b_next!21319) tp_is_empty!25129 (not b!1061258) (not start!93840) (not b!1061259))
(check-sat b_and!34007 (not b_next!21319))
