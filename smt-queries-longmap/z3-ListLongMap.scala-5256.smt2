; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70636 () Bool)

(assert start!70636)

(declare-fun b_free!12943 () Bool)

(declare-fun b_next!12943 () Bool)

(assert (=> start!70636 (= b_free!12943 (not b_next!12943))))

(declare-fun tp!45567 () Bool)

(declare-fun b_and!21771 () Bool)

(assert (=> start!70636 (= tp!45567 b_and!21771)))

(declare-fun res!559875 () Bool)

(declare-fun e!455900 () Bool)

(assert (=> start!70636 (=> (not res!559875) (not e!455900))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70636 (= res!559875 (validMask!0 mask!1312))))

(assert (=> start!70636 e!455900))

(declare-fun tp_is_empty!14653 () Bool)

(assert (=> start!70636 tp_is_empty!14653))

(declare-datatypes ((array!45473 0))(
  ( (array!45474 (arr!21789 (Array (_ BitVec 32) (_ BitVec 64))) (size!22210 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45473)

(declare-fun array_inv!17479 (array!45473) Bool)

(assert (=> start!70636 (array_inv!17479 _keys!976)))

(assert (=> start!70636 true))

(declare-datatypes ((V!24539 0))(
  ( (V!24540 (val!7374 Int)) )
))
(declare-datatypes ((ValueCell!6911 0))(
  ( (ValueCellFull!6911 (v!9799 V!24539)) (EmptyCell!6911) )
))
(declare-datatypes ((array!45475 0))(
  ( (array!45476 (arr!21790 (Array (_ BitVec 32) ValueCell!6911)) (size!22211 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45475)

(declare-fun e!455902 () Bool)

(declare-fun array_inv!17480 (array!45475) Bool)

(assert (=> start!70636 (and (array_inv!17480 _values!788) e!455902)))

(assert (=> start!70636 tp!45567))

(declare-fun b!820536 () Bool)

(assert (=> b!820536 (= e!455900 (not true))))

(declare-datatypes ((tuple2!9730 0))(
  ( (tuple2!9731 (_1!4876 (_ BitVec 64)) (_2!4876 V!24539)) )
))
(declare-datatypes ((List!15544 0))(
  ( (Nil!15541) (Cons!15540 (h!16669 tuple2!9730) (t!21868 List!15544)) )
))
(declare-datatypes ((ListLongMap!8543 0))(
  ( (ListLongMap!8544 (toList!4287 List!15544)) )
))
(declare-fun lt!368669 () ListLongMap!8543)

(declare-fun lt!368670 () ListLongMap!8543)

(assert (=> b!820536 (= lt!368669 lt!368670)))

(declare-fun zeroValueBefore!34 () V!24539)

(declare-datatypes ((Unit!28003 0))(
  ( (Unit!28004) )
))
(declare-fun lt!368671 () Unit!28003)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24539)

(declare-fun minValue!754 () V!24539)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!432 (array!45473 array!45475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24539 V!24539 V!24539 V!24539 (_ BitVec 32) Int) Unit!28003)

(assert (=> b!820536 (= lt!368671 (lemmaNoChangeToArrayThenSameMapNoExtras!432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2339 (array!45473 array!45475 (_ BitVec 32) (_ BitVec 32) V!24539 V!24539 (_ BitVec 32) Int) ListLongMap!8543)

(assert (=> b!820536 (= lt!368670 (getCurrentListMapNoExtraKeys!2339 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820536 (= lt!368669 (getCurrentListMapNoExtraKeys!2339 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820537 () Bool)

(declare-fun e!455899 () Bool)

(assert (=> b!820537 (= e!455899 tp_is_empty!14653)))

(declare-fun b!820538 () Bool)

(declare-fun res!559876 () Bool)

(assert (=> b!820538 (=> (not res!559876) (not e!455900))))

(assert (=> b!820538 (= res!559876 (and (= (size!22211 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22210 _keys!976) (size!22211 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23584 () Bool)

(declare-fun mapRes!23584 () Bool)

(assert (=> mapIsEmpty!23584 mapRes!23584))

(declare-fun b!820539 () Bool)

(declare-fun res!559878 () Bool)

(assert (=> b!820539 (=> (not res!559878) (not e!455900))))

(declare-datatypes ((List!15545 0))(
  ( (Nil!15542) (Cons!15541 (h!16670 (_ BitVec 64)) (t!21869 List!15545)) )
))
(declare-fun arrayNoDuplicates!0 (array!45473 (_ BitVec 32) List!15545) Bool)

(assert (=> b!820539 (= res!559878 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15542))))

(declare-fun b!820540 () Bool)

(declare-fun e!455898 () Bool)

(assert (=> b!820540 (= e!455898 tp_is_empty!14653)))

(declare-fun b!820541 () Bool)

(assert (=> b!820541 (= e!455902 (and e!455898 mapRes!23584))))

(declare-fun condMapEmpty!23584 () Bool)

(declare-fun mapDefault!23584 () ValueCell!6911)

(assert (=> b!820541 (= condMapEmpty!23584 (= (arr!21790 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6911)) mapDefault!23584)))))

(declare-fun b!820542 () Bool)

(declare-fun res!559877 () Bool)

(assert (=> b!820542 (=> (not res!559877) (not e!455900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45473 (_ BitVec 32)) Bool)

(assert (=> b!820542 (= res!559877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23584 () Bool)

(declare-fun tp!45568 () Bool)

(assert (=> mapNonEmpty!23584 (= mapRes!23584 (and tp!45568 e!455899))))

(declare-fun mapKey!23584 () (_ BitVec 32))

(declare-fun mapValue!23584 () ValueCell!6911)

(declare-fun mapRest!23584 () (Array (_ BitVec 32) ValueCell!6911))

(assert (=> mapNonEmpty!23584 (= (arr!21790 _values!788) (store mapRest!23584 mapKey!23584 mapValue!23584))))

(assert (= (and start!70636 res!559875) b!820538))

(assert (= (and b!820538 res!559876) b!820542))

(assert (= (and b!820542 res!559877) b!820539))

(assert (= (and b!820539 res!559878) b!820536))

(assert (= (and b!820541 condMapEmpty!23584) mapIsEmpty!23584))

(assert (= (and b!820541 (not condMapEmpty!23584)) mapNonEmpty!23584))

(get-info :version)

(assert (= (and mapNonEmpty!23584 ((_ is ValueCellFull!6911) mapValue!23584)) b!820537))

(assert (= (and b!820541 ((_ is ValueCellFull!6911) mapDefault!23584)) b!820540))

(assert (= start!70636 b!820541))

(declare-fun m!761935 () Bool)

(assert (=> b!820539 m!761935))

(declare-fun m!761937 () Bool)

(assert (=> b!820536 m!761937))

(declare-fun m!761939 () Bool)

(assert (=> b!820536 m!761939))

(declare-fun m!761941 () Bool)

(assert (=> b!820536 m!761941))

(declare-fun m!761943 () Bool)

(assert (=> start!70636 m!761943))

(declare-fun m!761945 () Bool)

(assert (=> start!70636 m!761945))

(declare-fun m!761947 () Bool)

(assert (=> start!70636 m!761947))

(declare-fun m!761949 () Bool)

(assert (=> mapNonEmpty!23584 m!761949))

(declare-fun m!761951 () Bool)

(assert (=> b!820542 m!761951))

(check-sat (not b!820542) (not mapNonEmpty!23584) (not b_next!12943) b_and!21771 (not start!70636) (not b!820539) tp_is_empty!14653 (not b!820536))
(check-sat b_and!21771 (not b_next!12943))
