; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70656 () Bool)

(assert start!70656)

(declare-fun b_free!12817 () Bool)

(declare-fun b_next!12817 () Bool)

(assert (=> start!70656 (= b_free!12817 (not b_next!12817))))

(declare-fun tp!45184 () Bool)

(declare-fun b_and!21657 () Bool)

(assert (=> start!70656 (= tp!45184 b_and!21657)))

(declare-fun mapNonEmpty!23389 () Bool)

(declare-fun mapRes!23389 () Bool)

(declare-fun tp!45183 () Bool)

(declare-fun e!455150 () Bool)

(assert (=> mapNonEmpty!23389 (= mapRes!23389 (and tp!45183 e!455150))))

(declare-datatypes ((V!24371 0))(
  ( (V!24372 (val!7311 Int)) )
))
(declare-datatypes ((ValueCell!6848 0))(
  ( (ValueCellFull!6848 (v!9740 V!24371)) (EmptyCell!6848) )
))
(declare-fun mapValue!23389 () ValueCell!6848)

(declare-datatypes ((array!45255 0))(
  ( (array!45256 (arr!21677 (Array (_ BitVec 32) ValueCell!6848)) (size!22097 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45255)

(declare-fun mapRest!23389 () (Array (_ BitVec 32) ValueCell!6848))

(declare-fun mapKey!23389 () (_ BitVec 32))

(assert (=> mapNonEmpty!23389 (= (arr!21677 _values!788) (store mapRest!23389 mapKey!23389 mapValue!23389))))

(declare-fun b!819681 () Bool)

(declare-fun e!455149 () Bool)

(assert (=> b!819681 (= e!455149 true)))

(declare-datatypes ((tuple2!9524 0))(
  ( (tuple2!9525 (_1!4773 (_ BitVec 64)) (_2!4773 V!24371)) )
))
(declare-fun lt!367397 () tuple2!9524)

(declare-datatypes ((List!15333 0))(
  ( (Nil!15330) (Cons!15329 (h!16464 tuple2!9524) (t!21654 List!15333)) )
))
(declare-datatypes ((ListLongMap!8349 0))(
  ( (ListLongMap!8350 (toList!4190 List!15333)) )
))
(declare-fun lt!367398 () ListLongMap!8349)

(declare-fun lt!367401 () ListLongMap!8349)

(declare-fun lt!367400 () tuple2!9524)

(declare-fun +!1829 (ListLongMap!8349 tuple2!9524) ListLongMap!8349)

(assert (=> b!819681 (= lt!367401 (+!1829 (+!1829 lt!367398 lt!367397) lt!367400))))

(declare-fun lt!367402 () ListLongMap!8349)

(declare-fun lt!367399 () ListLongMap!8349)

(assert (=> b!819681 (= (+!1829 lt!367402 lt!367400) (+!1829 lt!367399 lt!367400))))

(declare-fun zeroValueBefore!34 () V!24371)

(declare-datatypes ((Unit!27932 0))(
  ( (Unit!27933) )
))
(declare-fun lt!367406 () Unit!27932)

(declare-fun zeroValueAfter!34 () V!24371)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!171 (ListLongMap!8349 (_ BitVec 64) V!24371 V!24371) Unit!27932)

(assert (=> b!819681 (= lt!367406 (addSameAsAddTwiceSameKeyDiffValues!171 lt!367402 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819681 (= lt!367400 (tuple2!9525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455151 () Bool)

(assert (=> b!819681 e!455151))

(declare-fun res!559103 () Bool)

(assert (=> b!819681 (=> (not res!559103) (not e!455151))))

(declare-fun lt!367404 () ListLongMap!8349)

(assert (=> b!819681 (= res!559103 (= lt!367404 lt!367399))))

(assert (=> b!819681 (= lt!367399 (+!1829 lt!367402 lt!367397))))

(assert (=> b!819681 (= lt!367397 (tuple2!9525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45257 0))(
  ( (array!45258 (arr!21678 (Array (_ BitVec 32) (_ BitVec 64))) (size!22098 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45257)

(declare-fun minValue!754 () V!24371)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!367403 () ListLongMap!8349)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2384 (array!45257 array!45255 (_ BitVec 32) (_ BitVec 32) V!24371 V!24371 (_ BitVec 32) Int) ListLongMap!8349)

(assert (=> b!819681 (= lt!367403 (getCurrentListMap!2384 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819681 (= lt!367404 (getCurrentListMap!2384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819682 () Bool)

(declare-fun e!455153 () Bool)

(declare-fun tp_is_empty!14527 () Bool)

(assert (=> b!819682 (= e!455153 tp_is_empty!14527)))

(declare-fun res!559105 () Bool)

(declare-fun e!455152 () Bool)

(assert (=> start!70656 (=> (not res!559105) (not e!455152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70656 (= res!559105 (validMask!0 mask!1312))))

(assert (=> start!70656 e!455152))

(assert (=> start!70656 tp_is_empty!14527))

(declare-fun array_inv!17359 (array!45257) Bool)

(assert (=> start!70656 (array_inv!17359 _keys!976)))

(assert (=> start!70656 true))

(declare-fun e!455154 () Bool)

(declare-fun array_inv!17360 (array!45255) Bool)

(assert (=> start!70656 (and (array_inv!17360 _values!788) e!455154)))

(assert (=> start!70656 tp!45184))

(declare-fun b!819683 () Bool)

(declare-fun res!559108 () Bool)

(assert (=> b!819683 (=> (not res!559108) (not e!455152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45257 (_ BitVec 32)) Bool)

(assert (=> b!819683 (= res!559108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819684 () Bool)

(assert (=> b!819684 (= e!455150 tp_is_empty!14527)))

(declare-fun b!819685 () Bool)

(assert (=> b!819685 (= e!455154 (and e!455153 mapRes!23389))))

(declare-fun condMapEmpty!23389 () Bool)

(declare-fun mapDefault!23389 () ValueCell!6848)

(assert (=> b!819685 (= condMapEmpty!23389 (= (arr!21677 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6848)) mapDefault!23389)))))

(declare-fun b!819686 () Bool)

(declare-fun res!559106 () Bool)

(assert (=> b!819686 (=> (not res!559106) (not e!455152))))

(assert (=> b!819686 (= res!559106 (and (= (size!22097 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22098 _keys!976) (size!22097 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23389 () Bool)

(assert (=> mapIsEmpty!23389 mapRes!23389))

(declare-fun b!819687 () Bool)

(assert (=> b!819687 (= e!455151 (= lt!367403 (+!1829 lt!367398 (tuple2!9525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819688 () Bool)

(assert (=> b!819688 (= e!455152 (not e!455149))))

(declare-fun res!559107 () Bool)

(assert (=> b!819688 (=> res!559107 e!455149)))

(assert (=> b!819688 (= res!559107 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819688 (= lt!367402 lt!367398)))

(declare-fun lt!367405 () Unit!27932)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!375 (array!45257 array!45255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24371 V!24371 V!24371 V!24371 (_ BitVec 32) Int) Unit!27932)

(assert (=> b!819688 (= lt!367405 (lemmaNoChangeToArrayThenSameMapNoExtras!375 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2287 (array!45257 array!45255 (_ BitVec 32) (_ BitVec 32) V!24371 V!24371 (_ BitVec 32) Int) ListLongMap!8349)

(assert (=> b!819688 (= lt!367398 (getCurrentListMapNoExtraKeys!2287 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819688 (= lt!367402 (getCurrentListMapNoExtraKeys!2287 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819689 () Bool)

(declare-fun res!559104 () Bool)

(assert (=> b!819689 (=> (not res!559104) (not e!455152))))

(declare-datatypes ((List!15334 0))(
  ( (Nil!15331) (Cons!15330 (h!16465 (_ BitVec 64)) (t!21655 List!15334)) )
))
(declare-fun arrayNoDuplicates!0 (array!45257 (_ BitVec 32) List!15334) Bool)

(assert (=> b!819689 (= res!559104 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15331))))

(assert (= (and start!70656 res!559105) b!819686))

(assert (= (and b!819686 res!559106) b!819683))

(assert (= (and b!819683 res!559108) b!819689))

(assert (= (and b!819689 res!559104) b!819688))

(assert (= (and b!819688 (not res!559107)) b!819681))

(assert (= (and b!819681 res!559103) b!819687))

(assert (= (and b!819685 condMapEmpty!23389) mapIsEmpty!23389))

(assert (= (and b!819685 (not condMapEmpty!23389)) mapNonEmpty!23389))

(get-info :version)

(assert (= (and mapNonEmpty!23389 ((_ is ValueCellFull!6848) mapValue!23389)) b!819684))

(assert (= (and b!819685 ((_ is ValueCellFull!6848) mapDefault!23389)) b!819682))

(assert (= start!70656 b!819685))

(declare-fun m!761495 () Bool)

(assert (=> start!70656 m!761495))

(declare-fun m!761497 () Bool)

(assert (=> start!70656 m!761497))

(declare-fun m!761499 () Bool)

(assert (=> start!70656 m!761499))

(declare-fun m!761501 () Bool)

(assert (=> b!819688 m!761501))

(declare-fun m!761503 () Bool)

(assert (=> b!819688 m!761503))

(declare-fun m!761505 () Bool)

(assert (=> b!819688 m!761505))

(declare-fun m!761507 () Bool)

(assert (=> b!819687 m!761507))

(declare-fun m!761509 () Bool)

(assert (=> mapNonEmpty!23389 m!761509))

(declare-fun m!761511 () Bool)

(assert (=> b!819683 m!761511))

(declare-fun m!761513 () Bool)

(assert (=> b!819681 m!761513))

(declare-fun m!761515 () Bool)

(assert (=> b!819681 m!761515))

(declare-fun m!761517 () Bool)

(assert (=> b!819681 m!761517))

(declare-fun m!761519 () Bool)

(assert (=> b!819681 m!761519))

(declare-fun m!761521 () Bool)

(assert (=> b!819681 m!761521))

(declare-fun m!761523 () Bool)

(assert (=> b!819681 m!761523))

(declare-fun m!761525 () Bool)

(assert (=> b!819681 m!761525))

(declare-fun m!761527 () Bool)

(assert (=> b!819681 m!761527))

(assert (=> b!819681 m!761515))

(declare-fun m!761529 () Bool)

(assert (=> b!819689 m!761529))

(check-sat (not b!819689) b_and!21657 (not b_next!12817) (not b!819681) (not b!819683) (not b!819688) (not start!70656) (not mapNonEmpty!23389) tp_is_empty!14527 (not b!819687))
(check-sat b_and!21657 (not b_next!12817))
