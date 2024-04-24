; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94162 () Bool)

(assert start!94162)

(declare-fun b_free!21385 () Bool)

(declare-fun b_next!21385 () Bool)

(assert (=> start!94162 (= b_free!21385 (not b_next!21385))))

(declare-fun tp!75580 () Bool)

(declare-fun b_and!34117 () Bool)

(assert (=> start!94162 (= tp!75580 b_and!34117)))

(declare-fun b!1063601 () Bool)

(declare-fun e!605914 () Bool)

(declare-fun tp_is_empty!25195 () Bool)

(assert (=> b!1063601 (= e!605914 tp_is_empty!25195)))

(declare-fun res!709843 () Bool)

(declare-fun e!605919 () Bool)

(assert (=> start!94162 (=> (not res!709843) (not e!605919))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94162 (= res!709843 (validMask!0 mask!1515))))

(assert (=> start!94162 e!605919))

(assert (=> start!94162 true))

(assert (=> start!94162 tp_is_empty!25195))

(declare-datatypes ((V!38729 0))(
  ( (V!38730 (val!12648 Int)) )
))
(declare-datatypes ((ValueCell!11894 0))(
  ( (ValueCellFull!11894 (v!15254 V!38729)) (EmptyCell!11894) )
))
(declare-datatypes ((array!67435 0))(
  ( (array!67436 (arr!32418 (Array (_ BitVec 32) ValueCell!11894)) (size!32955 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67435)

(declare-fun e!605918 () Bool)

(declare-fun array_inv!25132 (array!67435) Bool)

(assert (=> start!94162 (and (array_inv!25132 _values!955) e!605918)))

(assert (=> start!94162 tp!75580))

(declare-datatypes ((array!67437 0))(
  ( (array!67438 (arr!32419 (Array (_ BitVec 32) (_ BitVec 64))) (size!32956 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67437)

(declare-fun array_inv!25133 (array!67437) Bool)

(assert (=> start!94162 (array_inv!25133 _keys!1163)))

(declare-fun b!1063602 () Bool)

(declare-fun res!709844 () Bool)

(assert (=> b!1063602 (=> (not res!709844) (not e!605919))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063602 (= res!709844 (and (= (size!32955 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32956 _keys!1163) (size!32955 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063603 () Bool)

(declare-fun e!605917 () Bool)

(assert (=> b!1063603 (= e!605917 tp_is_empty!25195)))

(declare-fun mapNonEmpty!39466 () Bool)

(declare-fun mapRes!39466 () Bool)

(declare-fun tp!75581 () Bool)

(assert (=> mapNonEmpty!39466 (= mapRes!39466 (and tp!75581 e!605917))))

(declare-fun mapValue!39466 () ValueCell!11894)

(declare-fun mapRest!39466 () (Array (_ BitVec 32) ValueCell!11894))

(declare-fun mapKey!39466 () (_ BitVec 32))

(assert (=> mapNonEmpty!39466 (= (arr!32418 _values!955) (store mapRest!39466 mapKey!39466 mapValue!39466))))

(declare-fun b!1063604 () Bool)

(assert (=> b!1063604 (= e!605918 (and e!605914 mapRes!39466))))

(declare-fun condMapEmpty!39466 () Bool)

(declare-fun mapDefault!39466 () ValueCell!11894)

(assert (=> b!1063604 (= condMapEmpty!39466 (= (arr!32418 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11894)) mapDefault!39466)))))

(declare-fun b!1063605 () Bool)

(declare-fun res!709839 () Bool)

(assert (=> b!1063605 (=> (not res!709839) (not e!605919))))

(declare-datatypes ((List!22564 0))(
  ( (Nil!22561) (Cons!22560 (h!23778 (_ BitVec 64)) (t!31867 List!22564)) )
))
(declare-fun arrayNoDuplicates!0 (array!67437 (_ BitVec 32) List!22564) Bool)

(assert (=> b!1063605 (= res!709839 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22561))))

(declare-fun b!1063606 () Bool)

(declare-fun e!605915 () Bool)

(declare-fun e!605920 () Bool)

(assert (=> b!1063606 (= e!605915 e!605920)))

(declare-fun res!709841 () Bool)

(assert (=> b!1063606 (=> res!709841 e!605920)))

(declare-datatypes ((tuple2!15980 0))(
  ( (tuple2!15981 (_1!8001 (_ BitVec 64)) (_2!8001 V!38729)) )
))
(declare-datatypes ((List!22565 0))(
  ( (Nil!22562) (Cons!22561 (h!23779 tuple2!15980) (t!31868 List!22565)) )
))
(declare-datatypes ((ListLongMap!13957 0))(
  ( (ListLongMap!13958 (toList!6994 List!22565)) )
))
(declare-fun lt!468524 () ListLongMap!13957)

(declare-fun contains!6251 (ListLongMap!13957 (_ BitVec 64)) Bool)

(assert (=> b!1063606 (= res!709841 (contains!6251 lt!468524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!907 () V!38729)

(declare-fun zeroValueBefore!47 () V!38729)

(declare-fun defaultEntry!963 () Int)

(declare-fun getCurrentListMap!3977 (array!67437 array!67435 (_ BitVec 32) (_ BitVec 32) V!38729 V!38729 (_ BitVec 32) Int) ListLongMap!13957)

(assert (=> b!1063606 (= lt!468524 (getCurrentListMap!3977 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39466 () Bool)

(assert (=> mapIsEmpty!39466 mapRes!39466))

(declare-fun b!1063607 () Bool)

(assert (=> b!1063607 (= e!605919 (not e!605915))))

(declare-fun res!709842 () Bool)

(assert (=> b!1063607 (=> res!709842 e!605915)))

(assert (=> b!1063607 (= res!709842 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468522 () ListLongMap!13957)

(declare-fun lt!468523 () ListLongMap!13957)

(assert (=> b!1063607 (= lt!468522 lt!468523)))

(declare-fun zeroValueAfter!47 () V!38729)

(declare-datatypes ((Unit!34793 0))(
  ( (Unit!34794) )
))
(declare-fun lt!468525 () Unit!34793)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!643 (array!67437 array!67435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38729 V!38729 V!38729 V!38729 (_ BitVec 32) Int) Unit!34793)

(assert (=> b!1063607 (= lt!468525 (lemmaNoChangeToArrayThenSameMapNoExtras!643 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3640 (array!67437 array!67435 (_ BitVec 32) (_ BitVec 32) V!38729 V!38729 (_ BitVec 32) Int) ListLongMap!13957)

(assert (=> b!1063607 (= lt!468523 (getCurrentListMapNoExtraKeys!3640 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063607 (= lt!468522 (getCurrentListMapNoExtraKeys!3640 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063608 () Bool)

(assert (=> b!1063608 (= e!605920 true)))

(declare-fun -!559 (ListLongMap!13957 (_ BitVec 64)) ListLongMap!13957)

(assert (=> b!1063608 (= (-!559 lt!468524 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468524)))

(declare-fun lt!468526 () Unit!34793)

(declare-fun removeNotPresentStillSame!10 (ListLongMap!13957 (_ BitVec 64)) Unit!34793)

(assert (=> b!1063608 (= lt!468526 (removeNotPresentStillSame!10 lt!468524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063609 () Bool)

(declare-fun res!709840 () Bool)

(assert (=> b!1063609 (=> (not res!709840) (not e!605919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67437 (_ BitVec 32)) Bool)

(assert (=> b!1063609 (= res!709840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94162 res!709843) b!1063602))

(assert (= (and b!1063602 res!709844) b!1063609))

(assert (= (and b!1063609 res!709840) b!1063605))

(assert (= (and b!1063605 res!709839) b!1063607))

(assert (= (and b!1063607 (not res!709842)) b!1063606))

(assert (= (and b!1063606 (not res!709841)) b!1063608))

(assert (= (and b!1063604 condMapEmpty!39466) mapIsEmpty!39466))

(assert (= (and b!1063604 (not condMapEmpty!39466)) mapNonEmpty!39466))

(get-info :version)

(assert (= (and mapNonEmpty!39466 ((_ is ValueCellFull!11894) mapValue!39466)) b!1063603))

(assert (= (and b!1063604 ((_ is ValueCellFull!11894) mapDefault!39466)) b!1063601))

(assert (= start!94162 b!1063604))

(declare-fun m!982705 () Bool)

(assert (=> start!94162 m!982705))

(declare-fun m!982707 () Bool)

(assert (=> start!94162 m!982707))

(declare-fun m!982709 () Bool)

(assert (=> start!94162 m!982709))

(declare-fun m!982711 () Bool)

(assert (=> b!1063609 m!982711))

(declare-fun m!982713 () Bool)

(assert (=> b!1063608 m!982713))

(declare-fun m!982715 () Bool)

(assert (=> b!1063608 m!982715))

(declare-fun m!982717 () Bool)

(assert (=> b!1063605 m!982717))

(declare-fun m!982719 () Bool)

(assert (=> b!1063606 m!982719))

(declare-fun m!982721 () Bool)

(assert (=> b!1063606 m!982721))

(declare-fun m!982723 () Bool)

(assert (=> mapNonEmpty!39466 m!982723))

(declare-fun m!982725 () Bool)

(assert (=> b!1063607 m!982725))

(declare-fun m!982727 () Bool)

(assert (=> b!1063607 m!982727))

(declare-fun m!982729 () Bool)

(assert (=> b!1063607 m!982729))

(check-sat (not start!94162) (not b!1063607) (not b_next!21385) (not b!1063608) (not mapNonEmpty!39466) (not b!1063605) (not b!1063606) b_and!34117 (not b!1063609) tp_is_empty!25195)
(check-sat b_and!34117 (not b_next!21385))
