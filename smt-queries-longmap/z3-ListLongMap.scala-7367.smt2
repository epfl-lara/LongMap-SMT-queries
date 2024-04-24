; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94156 () Bool)

(assert start!94156)

(declare-fun b_free!21379 () Bool)

(declare-fun b_next!21379 () Bool)

(assert (=> start!94156 (= b_free!21379 (not b_next!21379))))

(declare-fun tp!75562 () Bool)

(declare-fun b_and!34111 () Bool)

(assert (=> start!94156 (= tp!75562 b_and!34111)))

(declare-fun b!1063520 () Bool)

(declare-fun res!709785 () Bool)

(declare-fun e!605856 () Bool)

(assert (=> b!1063520 (=> (not res!709785) (not e!605856))))

(declare-datatypes ((array!67423 0))(
  ( (array!67424 (arr!32412 (Array (_ BitVec 32) (_ BitVec 64))) (size!32949 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67423)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67423 (_ BitVec 32)) Bool)

(assert (=> b!1063520 (= res!709785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063521 () Bool)

(declare-fun res!709790 () Bool)

(assert (=> b!1063521 (=> (not res!709790) (not e!605856))))

(declare-datatypes ((List!22560 0))(
  ( (Nil!22557) (Cons!22556 (h!23774 (_ BitVec 64)) (t!31863 List!22560)) )
))
(declare-fun arrayNoDuplicates!0 (array!67423 (_ BitVec 32) List!22560) Bool)

(assert (=> b!1063521 (= res!709790 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22557))))

(declare-fun b!1063522 () Bool)

(declare-fun e!605855 () Bool)

(declare-fun e!605854 () Bool)

(declare-fun mapRes!39457 () Bool)

(assert (=> b!1063522 (= e!605855 (and e!605854 mapRes!39457))))

(declare-fun condMapEmpty!39457 () Bool)

(declare-datatypes ((V!38721 0))(
  ( (V!38722 (val!12645 Int)) )
))
(declare-datatypes ((ValueCell!11891 0))(
  ( (ValueCellFull!11891 (v!15251 V!38721)) (EmptyCell!11891) )
))
(declare-datatypes ((array!67425 0))(
  ( (array!67426 (arr!32413 (Array (_ BitVec 32) ValueCell!11891)) (size!32950 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67425)

(declare-fun mapDefault!39457 () ValueCell!11891)

(assert (=> b!1063522 (= condMapEmpty!39457 (= (arr!32413 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11891)) mapDefault!39457)))))

(declare-fun b!1063523 () Bool)

(declare-fun e!605853 () Bool)

(assert (=> b!1063523 (= e!605856 (not e!605853))))

(declare-fun res!709789 () Bool)

(assert (=> b!1063523 (=> res!709789 e!605853)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063523 (= res!709789 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!15974 0))(
  ( (tuple2!15975 (_1!7998 (_ BitVec 64)) (_2!7998 V!38721)) )
))
(declare-datatypes ((List!22561 0))(
  ( (Nil!22558) (Cons!22557 (h!23775 tuple2!15974) (t!31864 List!22561)) )
))
(declare-datatypes ((ListLongMap!13951 0))(
  ( (ListLongMap!13952 (toList!6991 List!22561)) )
))
(declare-fun lt!468478 () ListLongMap!13951)

(declare-fun lt!468481 () ListLongMap!13951)

(assert (=> b!1063523 (= lt!468478 lt!468481)))

(declare-fun zeroValueBefore!47 () V!38721)

(declare-datatypes ((Unit!34787 0))(
  ( (Unit!34788) )
))
(declare-fun lt!468477 () Unit!34787)

(declare-fun minValue!907 () V!38721)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38721)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!641 (array!67423 array!67425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38721 V!38721 V!38721 V!38721 (_ BitVec 32) Int) Unit!34787)

(assert (=> b!1063523 (= lt!468477 (lemmaNoChangeToArrayThenSameMapNoExtras!641 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3638 (array!67423 array!67425 (_ BitVec 32) (_ BitVec 32) V!38721 V!38721 (_ BitVec 32) Int) ListLongMap!13951)

(assert (=> b!1063523 (= lt!468481 (getCurrentListMapNoExtraKeys!3638 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063523 (= lt!468478 (getCurrentListMapNoExtraKeys!3638 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39457 () Bool)

(declare-fun tp!75563 () Bool)

(declare-fun e!605851 () Bool)

(assert (=> mapNonEmpty!39457 (= mapRes!39457 (and tp!75563 e!605851))))

(declare-fun mapRest!39457 () (Array (_ BitVec 32) ValueCell!11891))

(declare-fun mapValue!39457 () ValueCell!11891)

(declare-fun mapKey!39457 () (_ BitVec 32))

(assert (=> mapNonEmpty!39457 (= (arr!32413 _values!955) (store mapRest!39457 mapKey!39457 mapValue!39457))))

(declare-fun b!1063524 () Bool)

(declare-fun e!605852 () Bool)

(assert (=> b!1063524 (= e!605853 e!605852)))

(declare-fun res!709787 () Bool)

(assert (=> b!1063524 (=> res!709787 e!605852)))

(declare-fun lt!468479 () ListLongMap!13951)

(declare-fun contains!6250 (ListLongMap!13951 (_ BitVec 64)) Bool)

(assert (=> b!1063524 (= res!709787 (contains!6250 lt!468479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3976 (array!67423 array!67425 (_ BitVec 32) (_ BitVec 32) V!38721 V!38721 (_ BitVec 32) Int) ListLongMap!13951)

(assert (=> b!1063524 (= lt!468479 (getCurrentListMap!3976 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063525 () Bool)

(assert (=> b!1063525 (= e!605852 true)))

(declare-fun -!556 (ListLongMap!13951 (_ BitVec 64)) ListLongMap!13951)

(assert (=> b!1063525 (= (-!556 lt!468479 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468479)))

(declare-fun lt!468480 () Unit!34787)

(declare-fun removeNotPresentStillSame!7 (ListLongMap!13951 (_ BitVec 64)) Unit!34787)

(assert (=> b!1063525 (= lt!468480 (removeNotPresentStillSame!7 lt!468479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063527 () Bool)

(declare-fun res!709786 () Bool)

(assert (=> b!1063527 (=> (not res!709786) (not e!605856))))

(assert (=> b!1063527 (= res!709786 (and (= (size!32950 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32949 _keys!1163) (size!32950 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39457 () Bool)

(assert (=> mapIsEmpty!39457 mapRes!39457))

(declare-fun b!1063528 () Bool)

(declare-fun tp_is_empty!25189 () Bool)

(assert (=> b!1063528 (= e!605854 tp_is_empty!25189)))

(declare-fun b!1063526 () Bool)

(assert (=> b!1063526 (= e!605851 tp_is_empty!25189)))

(declare-fun res!709788 () Bool)

(assert (=> start!94156 (=> (not res!709788) (not e!605856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94156 (= res!709788 (validMask!0 mask!1515))))

(assert (=> start!94156 e!605856))

(assert (=> start!94156 true))

(assert (=> start!94156 tp_is_empty!25189))

(declare-fun array_inv!25126 (array!67425) Bool)

(assert (=> start!94156 (and (array_inv!25126 _values!955) e!605855)))

(assert (=> start!94156 tp!75562))

(declare-fun array_inv!25127 (array!67423) Bool)

(assert (=> start!94156 (array_inv!25127 _keys!1163)))

(assert (= (and start!94156 res!709788) b!1063527))

(assert (= (and b!1063527 res!709786) b!1063520))

(assert (= (and b!1063520 res!709785) b!1063521))

(assert (= (and b!1063521 res!709790) b!1063523))

(assert (= (and b!1063523 (not res!709789)) b!1063524))

(assert (= (and b!1063524 (not res!709787)) b!1063525))

(assert (= (and b!1063522 condMapEmpty!39457) mapIsEmpty!39457))

(assert (= (and b!1063522 (not condMapEmpty!39457)) mapNonEmpty!39457))

(get-info :version)

(assert (= (and mapNonEmpty!39457 ((_ is ValueCellFull!11891) mapValue!39457)) b!1063526))

(assert (= (and b!1063522 ((_ is ValueCellFull!11891) mapDefault!39457)) b!1063528))

(assert (= start!94156 b!1063522))

(declare-fun m!982627 () Bool)

(assert (=> b!1063524 m!982627))

(declare-fun m!982629 () Bool)

(assert (=> b!1063524 m!982629))

(declare-fun m!982631 () Bool)

(assert (=> b!1063520 m!982631))

(declare-fun m!982633 () Bool)

(assert (=> b!1063525 m!982633))

(declare-fun m!982635 () Bool)

(assert (=> b!1063525 m!982635))

(declare-fun m!982637 () Bool)

(assert (=> b!1063523 m!982637))

(declare-fun m!982639 () Bool)

(assert (=> b!1063523 m!982639))

(declare-fun m!982641 () Bool)

(assert (=> b!1063523 m!982641))

(declare-fun m!982643 () Bool)

(assert (=> b!1063521 m!982643))

(declare-fun m!982645 () Bool)

(assert (=> start!94156 m!982645))

(declare-fun m!982647 () Bool)

(assert (=> start!94156 m!982647))

(declare-fun m!982649 () Bool)

(assert (=> start!94156 m!982649))

(declare-fun m!982651 () Bool)

(assert (=> mapNonEmpty!39457 m!982651))

(check-sat (not b!1063525) (not start!94156) (not b!1063520) (not b!1063521) (not b_next!21379) b_and!34111 (not b!1063523) (not b!1063524) (not mapNonEmpty!39457) tp_is_empty!25189)
(check-sat b_and!34111 (not b_next!21379))
