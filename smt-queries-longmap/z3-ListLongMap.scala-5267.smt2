; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70738 () Bool)

(assert start!70738)

(declare-fun b_free!13011 () Bool)

(declare-fun b_next!13011 () Bool)

(assert (=> start!70738 (= b_free!13011 (not b_next!13011))))

(declare-fun tp!45774 () Bool)

(declare-fun b_and!21873 () Bool)

(assert (=> start!70738 (= tp!45774 b_and!21873)))

(declare-fun b!821649 () Bool)

(declare-fun e!456686 () Bool)

(declare-fun tp_is_empty!14721 () Bool)

(assert (=> b!821649 (= e!456686 tp_is_empty!14721)))

(declare-fun b!821650 () Bool)

(declare-fun e!456682 () Bool)

(declare-fun e!456685 () Bool)

(assert (=> b!821650 (= e!456682 (not e!456685))))

(declare-fun res!560492 () Bool)

(assert (=> b!821650 (=> res!560492 e!456685)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821650 (= res!560492 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24629 0))(
  ( (V!24630 (val!7408 Int)) )
))
(declare-datatypes ((tuple2!9776 0))(
  ( (tuple2!9777 (_1!4899 (_ BitVec 64)) (_2!4899 V!24629)) )
))
(declare-datatypes ((List!15592 0))(
  ( (Nil!15589) (Cons!15588 (h!16717 tuple2!9776) (t!21927 List!15592)) )
))
(declare-datatypes ((ListLongMap!8599 0))(
  ( (ListLongMap!8600 (toList!4315 List!15592)) )
))
(declare-fun lt!369329 () ListLongMap!8599)

(declare-fun lt!369327 () ListLongMap!8599)

(assert (=> b!821650 (= lt!369329 lt!369327)))

(declare-fun zeroValueBefore!34 () V!24629)

(declare-datatypes ((array!45638 0))(
  ( (array!45639 (arr!21870 (Array (_ BitVec 32) (_ BitVec 64))) (size!22291 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45638)

(declare-fun zeroValueAfter!34 () V!24629)

(declare-fun minValue!754 () V!24629)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28097 0))(
  ( (Unit!28098) )
))
(declare-fun lt!369326 () Unit!28097)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!6945 0))(
  ( (ValueCellFull!6945 (v!9839 V!24629)) (EmptyCell!6945) )
))
(declare-datatypes ((array!45640 0))(
  ( (array!45641 (arr!21871 (Array (_ BitVec 32) ValueCell!6945)) (size!22292 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45640)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!446 (array!45638 array!45640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24629 V!24629 V!24629 V!24629 (_ BitVec 32) Int) Unit!28097)

(assert (=> b!821650 (= lt!369326 (lemmaNoChangeToArrayThenSameMapNoExtras!446 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2336 (array!45638 array!45640 (_ BitVec 32) (_ BitVec 32) V!24629 V!24629 (_ BitVec 32) Int) ListLongMap!8599)

(assert (=> b!821650 (= lt!369327 (getCurrentListMapNoExtraKeys!2336 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821650 (= lt!369329 (getCurrentListMapNoExtraKeys!2336 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23689 () Bool)

(declare-fun mapRes!23689 () Bool)

(assert (=> mapIsEmpty!23689 mapRes!23689))

(declare-fun mapNonEmpty!23689 () Bool)

(declare-fun tp!45775 () Bool)

(declare-fun e!456681 () Bool)

(assert (=> mapNonEmpty!23689 (= mapRes!23689 (and tp!45775 e!456681))))

(declare-fun mapRest!23689 () (Array (_ BitVec 32) ValueCell!6945))

(declare-fun mapKey!23689 () (_ BitVec 32))

(declare-fun mapValue!23689 () ValueCell!6945)

(assert (=> mapNonEmpty!23689 (= (arr!21871 _values!788) (store mapRest!23689 mapKey!23689 mapValue!23689))))

(declare-fun b!821652 () Bool)

(declare-fun res!560490 () Bool)

(assert (=> b!821652 (=> (not res!560490) (not e!456682))))

(assert (=> b!821652 (= res!560490 (and (= (size!22292 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22291 _keys!976) (size!22292 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821653 () Bool)

(declare-fun e!456684 () Bool)

(assert (=> b!821653 (= e!456684 (and e!456686 mapRes!23689))))

(declare-fun condMapEmpty!23689 () Bool)

(declare-fun mapDefault!23689 () ValueCell!6945)

(assert (=> b!821653 (= condMapEmpty!23689 (= (arr!21871 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6945)) mapDefault!23689)))))

(declare-fun b!821654 () Bool)

(assert (=> b!821654 (= e!456681 tp_is_empty!14721)))

(declare-fun b!821655 () Bool)

(declare-fun res!560488 () Bool)

(assert (=> b!821655 (=> (not res!560488) (not e!456682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45638 (_ BitVec 32)) Bool)

(assert (=> b!821655 (= res!560488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821656 () Bool)

(declare-fun res!560489 () Bool)

(assert (=> b!821656 (=> (not res!560489) (not e!456682))))

(declare-datatypes ((List!15593 0))(
  ( (Nil!15590) (Cons!15589 (h!16718 (_ BitVec 64)) (t!21928 List!15593)) )
))
(declare-fun arrayNoDuplicates!0 (array!45638 (_ BitVec 32) List!15593) Bool)

(assert (=> b!821656 (= res!560489 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15590))))

(declare-fun b!821651 () Bool)

(assert (=> b!821651 (= e!456685 true)))

(declare-fun lt!369328 () ListLongMap!8599)

(declare-fun getCurrentListMap!2484 (array!45638 array!45640 (_ BitVec 32) (_ BitVec 32) V!24629 V!24629 (_ BitVec 32) Int) ListLongMap!8599)

(assert (=> b!821651 (= lt!369328 (getCurrentListMap!2484 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560491 () Bool)

(assert (=> start!70738 (=> (not res!560491) (not e!456682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70738 (= res!560491 (validMask!0 mask!1312))))

(assert (=> start!70738 e!456682))

(assert (=> start!70738 tp_is_empty!14721))

(declare-fun array_inv!17473 (array!45638) Bool)

(assert (=> start!70738 (array_inv!17473 _keys!976)))

(assert (=> start!70738 true))

(declare-fun array_inv!17474 (array!45640) Bool)

(assert (=> start!70738 (and (array_inv!17474 _values!788) e!456684)))

(assert (=> start!70738 tp!45774))

(assert (= (and start!70738 res!560491) b!821652))

(assert (= (and b!821652 res!560490) b!821655))

(assert (= (and b!821655 res!560488) b!821656))

(assert (= (and b!821656 res!560489) b!821650))

(assert (= (and b!821650 (not res!560492)) b!821651))

(assert (= (and b!821653 condMapEmpty!23689) mapIsEmpty!23689))

(assert (= (and b!821653 (not condMapEmpty!23689)) mapNonEmpty!23689))

(get-info :version)

(assert (= (and mapNonEmpty!23689 ((_ is ValueCellFull!6945) mapValue!23689)) b!821654))

(assert (= (and b!821653 ((_ is ValueCellFull!6945) mapDefault!23689)) b!821649))

(assert (= start!70738 b!821653))

(declare-fun m!763409 () Bool)

(assert (=> b!821655 m!763409))

(declare-fun m!763411 () Bool)

(assert (=> mapNonEmpty!23689 m!763411))

(declare-fun m!763413 () Bool)

(assert (=> start!70738 m!763413))

(declare-fun m!763415 () Bool)

(assert (=> start!70738 m!763415))

(declare-fun m!763417 () Bool)

(assert (=> start!70738 m!763417))

(declare-fun m!763419 () Bool)

(assert (=> b!821656 m!763419))

(declare-fun m!763421 () Bool)

(assert (=> b!821651 m!763421))

(declare-fun m!763423 () Bool)

(assert (=> b!821650 m!763423))

(declare-fun m!763425 () Bool)

(assert (=> b!821650 m!763425))

(declare-fun m!763427 () Bool)

(assert (=> b!821650 m!763427))

(check-sat (not b_next!13011) (not start!70738) b_and!21873 (not b!821650) (not b!821656) (not mapNonEmpty!23689) (not b!821651) (not b!821655) tp_is_empty!14721)
(check-sat b_and!21873 (not b_next!13011))
