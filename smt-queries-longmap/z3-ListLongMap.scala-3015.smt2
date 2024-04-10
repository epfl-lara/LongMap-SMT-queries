; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42426 () Bool)

(assert start!42426)

(declare-fun b_free!11901 () Bool)

(declare-fun b_next!11901 () Bool)

(assert (=> start!42426 (= b_free!11901 (not b_next!11901))))

(declare-fun tp!41737 () Bool)

(declare-fun b_and!20357 () Bool)

(assert (=> start!42426 (= tp!41737 b_and!20357)))

(declare-fun b!473384 () Bool)

(declare-fun res!282762 () Bool)

(declare-fun e!277713 () Bool)

(assert (=> b!473384 (=> (not res!282762) (not e!277713))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30415 0))(
  ( (array!30416 (arr!14627 (Array (_ BitVec 32) (_ BitVec 64))) (size!14979 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30415)

(declare-datatypes ((V!18877 0))(
  ( (V!18878 (val!6709 Int)) )
))
(declare-datatypes ((ValueCell!6321 0))(
  ( (ValueCellFull!6321 (v!9000 V!18877)) (EmptyCell!6321) )
))
(declare-datatypes ((array!30417 0))(
  ( (array!30418 (arr!14628 (Array (_ BitVec 32) ValueCell!6321)) (size!14980 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30417)

(assert (=> b!473384 (= res!282762 (and (= (size!14980 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14979 _keys!1025) (size!14980 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473385 () Bool)

(declare-fun res!282764 () Bool)

(assert (=> b!473385 (=> (not res!282764) (not e!277713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30415 (_ BitVec 32)) Bool)

(assert (=> b!473385 (= res!282764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473386 () Bool)

(declare-fun e!277712 () Bool)

(declare-fun tp_is_empty!13329 () Bool)

(assert (=> b!473386 (= e!277712 tp_is_empty!13329)))

(declare-fun b!473387 () Bool)

(declare-fun e!277714 () Bool)

(assert (=> b!473387 (= e!277714 tp_is_empty!13329)))

(declare-fun res!282765 () Bool)

(assert (=> start!42426 (=> (not res!282765) (not e!277713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42426 (= res!282765 (validMask!0 mask!1365))))

(assert (=> start!42426 e!277713))

(assert (=> start!42426 tp_is_empty!13329))

(assert (=> start!42426 tp!41737))

(assert (=> start!42426 true))

(declare-fun array_inv!10550 (array!30415) Bool)

(assert (=> start!42426 (array_inv!10550 _keys!1025)))

(declare-fun e!277715 () Bool)

(declare-fun array_inv!10551 (array!30417) Bool)

(assert (=> start!42426 (and (array_inv!10551 _values!833) e!277715)))

(declare-fun mapNonEmpty!21706 () Bool)

(declare-fun mapRes!21706 () Bool)

(declare-fun tp!41736 () Bool)

(assert (=> mapNonEmpty!21706 (= mapRes!21706 (and tp!41736 e!277714))))

(declare-fun mapRest!21706 () (Array (_ BitVec 32) ValueCell!6321))

(declare-fun mapKey!21706 () (_ BitVec 32))

(declare-fun mapValue!21706 () ValueCell!6321)

(assert (=> mapNonEmpty!21706 (= (arr!14628 _values!833) (store mapRest!21706 mapKey!21706 mapValue!21706))))

(declare-fun b!473388 () Bool)

(assert (=> b!473388 (= e!277715 (and e!277712 mapRes!21706))))

(declare-fun condMapEmpty!21706 () Bool)

(declare-fun mapDefault!21706 () ValueCell!6321)

(assert (=> b!473388 (= condMapEmpty!21706 (= (arr!14628 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6321)) mapDefault!21706)))))

(declare-fun b!473389 () Bool)

(declare-fun e!277711 () Bool)

(assert (=> b!473389 (= e!277711 true)))

(declare-datatypes ((tuple2!8840 0))(
  ( (tuple2!8841 (_1!4431 (_ BitVec 64)) (_2!4431 V!18877)) )
))
(declare-datatypes ((List!8922 0))(
  ( (Nil!8919) (Cons!8918 (h!9774 tuple2!8840) (t!14892 List!8922)) )
))
(declare-datatypes ((ListLongMap!7753 0))(
  ( (ListLongMap!7754 (toList!3892 List!8922)) )
))
(declare-fun lt!215092 () ListLongMap!7753)

(declare-fun lt!215089 () tuple2!8840)

(declare-fun minValueBefore!38 () V!18877)

(declare-fun +!1729 (ListLongMap!7753 tuple2!8840) ListLongMap!7753)

(assert (=> b!473389 (= (+!1729 lt!215092 lt!215089) (+!1729 (+!1729 lt!215092 (tuple2!8841 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215089))))

(declare-fun minValueAfter!38 () V!18877)

(assert (=> b!473389 (= lt!215089 (tuple2!8841 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13940 0))(
  ( (Unit!13941) )
))
(declare-fun lt!215091 () Unit!13940)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!138 (ListLongMap!7753 (_ BitVec 64) V!18877 V!18877) Unit!13940)

(assert (=> b!473389 (= lt!215091 (addSameAsAddTwiceSameKeyDiffValues!138 lt!215092 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215086 () ListLongMap!7753)

(declare-fun zeroValue!794 () V!18877)

(assert (=> b!473389 (= lt!215092 (+!1729 lt!215086 (tuple2!8841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215088 () ListLongMap!7753)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMap!2258 (array!30415 array!30417 (_ BitVec 32) (_ BitVec 32) V!18877 V!18877 (_ BitVec 32) Int) ListLongMap!7753)

(assert (=> b!473389 (= lt!215088 (getCurrentListMap!2258 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215087 () ListLongMap!7753)

(assert (=> b!473389 (= lt!215087 (getCurrentListMap!2258 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473390 () Bool)

(assert (=> b!473390 (= e!277713 (not e!277711))))

(declare-fun res!282763 () Bool)

(assert (=> b!473390 (=> res!282763 e!277711)))

(assert (=> b!473390 (= res!282763 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215090 () ListLongMap!7753)

(assert (=> b!473390 (= lt!215086 lt!215090)))

(declare-fun lt!215085 () Unit!13940)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!232 (array!30415 array!30417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18877 V!18877 V!18877 V!18877 (_ BitVec 32) Int) Unit!13940)

(assert (=> b!473390 (= lt!215085 (lemmaNoChangeToArrayThenSameMapNoExtras!232 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2052 (array!30415 array!30417 (_ BitVec 32) (_ BitVec 32) V!18877 V!18877 (_ BitVec 32) Int) ListLongMap!7753)

(assert (=> b!473390 (= lt!215090 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473390 (= lt!215086 (getCurrentListMapNoExtraKeys!2052 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21706 () Bool)

(assert (=> mapIsEmpty!21706 mapRes!21706))

(declare-fun b!473391 () Bool)

(declare-fun res!282766 () Bool)

(assert (=> b!473391 (=> (not res!282766) (not e!277713))))

(declare-datatypes ((List!8923 0))(
  ( (Nil!8920) (Cons!8919 (h!9775 (_ BitVec 64)) (t!14893 List!8923)) )
))
(declare-fun arrayNoDuplicates!0 (array!30415 (_ BitVec 32) List!8923) Bool)

(assert (=> b!473391 (= res!282766 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8920))))

(assert (= (and start!42426 res!282765) b!473384))

(assert (= (and b!473384 res!282762) b!473385))

(assert (= (and b!473385 res!282764) b!473391))

(assert (= (and b!473391 res!282766) b!473390))

(assert (= (and b!473390 (not res!282763)) b!473389))

(assert (= (and b!473388 condMapEmpty!21706) mapIsEmpty!21706))

(assert (= (and b!473388 (not condMapEmpty!21706)) mapNonEmpty!21706))

(get-info :version)

(assert (= (and mapNonEmpty!21706 ((_ is ValueCellFull!6321) mapValue!21706)) b!473387))

(assert (= (and b!473388 ((_ is ValueCellFull!6321) mapDefault!21706)) b!473386))

(assert (= start!42426 b!473388))

(declare-fun m!455417 () Bool)

(assert (=> b!473390 m!455417))

(declare-fun m!455419 () Bool)

(assert (=> b!473390 m!455419))

(declare-fun m!455421 () Bool)

(assert (=> b!473390 m!455421))

(declare-fun m!455423 () Bool)

(assert (=> b!473391 m!455423))

(declare-fun m!455425 () Bool)

(assert (=> b!473389 m!455425))

(declare-fun m!455427 () Bool)

(assert (=> b!473389 m!455427))

(declare-fun m!455429 () Bool)

(assert (=> b!473389 m!455429))

(declare-fun m!455431 () Bool)

(assert (=> b!473389 m!455431))

(assert (=> b!473389 m!455431))

(declare-fun m!455433 () Bool)

(assert (=> b!473389 m!455433))

(declare-fun m!455435 () Bool)

(assert (=> b!473389 m!455435))

(declare-fun m!455437 () Bool)

(assert (=> b!473389 m!455437))

(declare-fun m!455439 () Bool)

(assert (=> b!473385 m!455439))

(declare-fun m!455441 () Bool)

(assert (=> start!42426 m!455441))

(declare-fun m!455443 () Bool)

(assert (=> start!42426 m!455443))

(declare-fun m!455445 () Bool)

(assert (=> start!42426 m!455445))

(declare-fun m!455447 () Bool)

(assert (=> mapNonEmpty!21706 m!455447))

(check-sat (not b!473385) (not b!473390) (not b!473391) (not start!42426) (not b!473389) tp_is_empty!13329 (not b_next!11901) (not mapNonEmpty!21706) b_and!20357)
(check-sat b_and!20357 (not b_next!11901))
