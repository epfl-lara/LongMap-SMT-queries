; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93860 () Bool)

(assert start!93860)

(declare-fun b_free!21333 () Bool)

(declare-fun b_next!21333 () Bool)

(assert (=> start!93860 (= b_free!21333 (not b_next!21333))))

(declare-fun tp!75421 () Bool)

(declare-fun b_and!34047 () Bool)

(assert (=> start!93860 (= tp!75421 b_and!34047)))

(declare-fun b!1061558 () Bool)

(declare-fun e!604533 () Bool)

(declare-fun e!604531 () Bool)

(declare-fun mapRes!39385 () Bool)

(assert (=> b!1061558 (= e!604533 (and e!604531 mapRes!39385))))

(declare-fun condMapEmpty!39385 () Bool)

(declare-datatypes ((V!38659 0))(
  ( (V!38660 (val!12622 Int)) )
))
(declare-datatypes ((ValueCell!11868 0))(
  ( (ValueCellFull!11868 (v!15232 V!38659)) (EmptyCell!11868) )
))
(declare-datatypes ((array!67289 0))(
  ( (array!67290 (arr!32352 (Array (_ BitVec 32) ValueCell!11868)) (size!32888 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67289)

(declare-fun mapDefault!39385 () ValueCell!11868)

(assert (=> b!1061558 (= condMapEmpty!39385 (= (arr!32352 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11868)) mapDefault!39385)))))

(declare-fun b!1061560 () Bool)

(declare-fun e!604529 () Bool)

(assert (=> b!1061560 (= e!604529 (not true))))

(declare-datatypes ((tuple2!15954 0))(
  ( (tuple2!15955 (_1!7988 (_ BitVec 64)) (_2!7988 V!38659)) )
))
(declare-datatypes ((List!22540 0))(
  ( (Nil!22537) (Cons!22536 (h!23745 tuple2!15954) (t!31849 List!22540)) )
))
(declare-datatypes ((ListLongMap!13923 0))(
  ( (ListLongMap!13924 (toList!6977 List!22540)) )
))
(declare-fun lt!467649 () ListLongMap!13923)

(declare-fun lt!467650 () ListLongMap!13923)

(assert (=> b!1061560 (= lt!467649 lt!467650)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38659)

(declare-datatypes ((Unit!34756 0))(
  ( (Unit!34757) )
))
(declare-fun lt!467648 () Unit!34756)

(declare-fun minValue!907 () V!38659)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38659)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67291 0))(
  ( (array!67292 (arr!32353 (Array (_ BitVec 32) (_ BitVec 64))) (size!32889 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67291)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!616 (array!67291 array!67289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38659 V!38659 V!38659 V!38659 (_ BitVec 32) Int) Unit!34756)

(assert (=> b!1061560 (= lt!467648 (lemmaNoChangeToArrayThenSameMapNoExtras!616 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3579 (array!67291 array!67289 (_ BitVec 32) (_ BitVec 32) V!38659 V!38659 (_ BitVec 32) Int) ListLongMap!13923)

(assert (=> b!1061560 (= lt!467650 (getCurrentListMapNoExtraKeys!3579 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061560 (= lt!467649 (getCurrentListMapNoExtraKeys!3579 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39385 () Bool)

(assert (=> mapIsEmpty!39385 mapRes!39385))

(declare-fun b!1061561 () Bool)

(declare-fun tp_is_empty!25143 () Bool)

(assert (=> b!1061561 (= e!604531 tp_is_empty!25143)))

(declare-fun mapNonEmpty!39385 () Bool)

(declare-fun tp!75422 () Bool)

(declare-fun e!604532 () Bool)

(assert (=> mapNonEmpty!39385 (= mapRes!39385 (and tp!75422 e!604532))))

(declare-fun mapKey!39385 () (_ BitVec 32))

(declare-fun mapRest!39385 () (Array (_ BitVec 32) ValueCell!11868))

(declare-fun mapValue!39385 () ValueCell!11868)

(assert (=> mapNonEmpty!39385 (= (arr!32352 _values!955) (store mapRest!39385 mapKey!39385 mapValue!39385))))

(declare-fun b!1061562 () Bool)

(declare-fun res!708889 () Bool)

(assert (=> b!1061562 (=> (not res!708889) (not e!604529))))

(assert (=> b!1061562 (= res!708889 (and (= (size!32888 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32889 _keys!1163) (size!32888 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061563 () Bool)

(declare-fun res!708892 () Bool)

(assert (=> b!1061563 (=> (not res!708892) (not e!604529))))

(declare-datatypes ((List!22541 0))(
  ( (Nil!22538) (Cons!22537 (h!23746 (_ BitVec 64)) (t!31850 List!22541)) )
))
(declare-fun arrayNoDuplicates!0 (array!67291 (_ BitVec 32) List!22541) Bool)

(assert (=> b!1061563 (= res!708892 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22538))))

(declare-fun b!1061564 () Bool)

(declare-fun res!708891 () Bool)

(assert (=> b!1061564 (=> (not res!708891) (not e!604529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67291 (_ BitVec 32)) Bool)

(assert (=> b!1061564 (= res!708891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061559 () Bool)

(assert (=> b!1061559 (= e!604532 tp_is_empty!25143)))

(declare-fun res!708890 () Bool)

(assert (=> start!93860 (=> (not res!708890) (not e!604529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93860 (= res!708890 (validMask!0 mask!1515))))

(assert (=> start!93860 e!604529))

(assert (=> start!93860 true))

(assert (=> start!93860 tp_is_empty!25143))

(declare-fun array_inv!25068 (array!67289) Bool)

(assert (=> start!93860 (and (array_inv!25068 _values!955) e!604533)))

(assert (=> start!93860 tp!75421))

(declare-fun array_inv!25069 (array!67291) Bool)

(assert (=> start!93860 (array_inv!25069 _keys!1163)))

(assert (= (and start!93860 res!708890) b!1061562))

(assert (= (and b!1061562 res!708889) b!1061564))

(assert (= (and b!1061564 res!708891) b!1061563))

(assert (= (and b!1061563 res!708892) b!1061560))

(assert (= (and b!1061558 condMapEmpty!39385) mapIsEmpty!39385))

(assert (= (and b!1061558 (not condMapEmpty!39385)) mapNonEmpty!39385))

(get-info :version)

(assert (= (and mapNonEmpty!39385 ((_ is ValueCellFull!11868) mapValue!39385)) b!1061559))

(assert (= (and b!1061558 ((_ is ValueCellFull!11868) mapDefault!39385)) b!1061561))

(assert (= start!93860 b!1061558))

(declare-fun m!980391 () Bool)

(assert (=> start!93860 m!980391))

(declare-fun m!980393 () Bool)

(assert (=> start!93860 m!980393))

(declare-fun m!980395 () Bool)

(assert (=> start!93860 m!980395))

(declare-fun m!980397 () Bool)

(assert (=> mapNonEmpty!39385 m!980397))

(declare-fun m!980399 () Bool)

(assert (=> b!1061563 m!980399))

(declare-fun m!980401 () Bool)

(assert (=> b!1061560 m!980401))

(declare-fun m!980403 () Bool)

(assert (=> b!1061560 m!980403))

(declare-fun m!980405 () Bool)

(assert (=> b!1061560 m!980405))

(declare-fun m!980407 () Bool)

(assert (=> b!1061564 m!980407))

(check-sat tp_is_empty!25143 (not mapNonEmpty!39385) (not start!93860) (not b!1061564) (not b!1061563) (not b_next!21333) b_and!34047 (not b!1061560))
(check-sat b_and!34047 (not b_next!21333))
