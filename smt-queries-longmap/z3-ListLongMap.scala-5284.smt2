; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71040 () Bool)

(assert start!71040)

(declare-fun b_free!13111 () Bool)

(declare-fun b_next!13111 () Bool)

(assert (=> start!71040 (= b_free!13111 (not b_next!13111))))

(declare-fun tp!46081 () Bool)

(declare-fun b_and!22005 () Bool)

(assert (=> start!71040 (= tp!46081 b_and!22005)))

(declare-fun b!824081 () Bool)

(declare-fun res!561733 () Bool)

(declare-fun e!458375 () Bool)

(assert (=> b!824081 (=> (not res!561733) (not e!458375))))

(declare-datatypes ((array!45835 0))(
  ( (array!45836 (arr!21962 (Array (_ BitVec 32) (_ BitVec 64))) (size!22382 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45835)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45835 (_ BitVec 32)) Bool)

(assert (=> b!824081 (= res!561733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824082 () Bool)

(declare-fun e!458380 () Bool)

(declare-fun tp_is_empty!14821 () Bool)

(assert (=> b!824082 (= e!458380 tp_is_empty!14821)))

(declare-fun b!824083 () Bool)

(declare-fun e!458377 () Bool)

(assert (=> b!824083 (= e!458375 (not e!458377))))

(declare-fun res!561730 () Bool)

(assert (=> b!824083 (=> res!561730 e!458377)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824083 (= res!561730 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24763 0))(
  ( (V!24764 (val!7458 Int)) )
))
(declare-datatypes ((tuple2!9776 0))(
  ( (tuple2!9777 (_1!4899 (_ BitVec 64)) (_2!4899 V!24763)) )
))
(declare-datatypes ((List!15562 0))(
  ( (Nil!15559) (Cons!15558 (h!16693 tuple2!9776) (t!21893 List!15562)) )
))
(declare-datatypes ((ListLongMap!8601 0))(
  ( (ListLongMap!8602 (toList!4316 List!15562)) )
))
(declare-fun lt!371327 () ListLongMap!8601)

(declare-fun lt!371330 () ListLongMap!8601)

(assert (=> b!824083 (= lt!371327 lt!371330)))

(declare-fun zeroValueBefore!34 () V!24763)

(declare-fun zeroValueAfter!34 () V!24763)

(declare-fun minValue!754 () V!24763)

(declare-datatypes ((ValueCell!6995 0))(
  ( (ValueCellFull!6995 (v!9890 V!24763)) (EmptyCell!6995) )
))
(declare-datatypes ((array!45837 0))(
  ( (array!45838 (arr!21963 (Array (_ BitVec 32) ValueCell!6995)) (size!22383 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45837)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28183 0))(
  ( (Unit!28184) )
))
(declare-fun lt!371333 () Unit!28183)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!488 (array!45835 array!45837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24763 V!24763 V!24763 V!24763 (_ BitVec 32) Int) Unit!28183)

(assert (=> b!824083 (= lt!371333 (lemmaNoChangeToArrayThenSameMapNoExtras!488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2400 (array!45835 array!45837 (_ BitVec 32) (_ BitVec 32) V!24763 V!24763 (_ BitVec 32) Int) ListLongMap!8601)

(assert (=> b!824083 (= lt!371330 (getCurrentListMapNoExtraKeys!2400 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824083 (= lt!371327 (getCurrentListMapNoExtraKeys!2400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824084 () Bool)

(assert (=> b!824084 (= e!458377 true)))

(declare-fun lt!371336 () ListLongMap!8601)

(declare-fun lt!371329 () ListLongMap!8601)

(declare-fun lt!371335 () tuple2!9776)

(declare-fun +!1905 (ListLongMap!8601 tuple2!9776) ListLongMap!8601)

(assert (=> b!824084 (= lt!371336 (+!1905 lt!371329 lt!371335))))

(declare-fun lt!371328 () Unit!28183)

(declare-fun addCommutativeForDiffKeys!463 (ListLongMap!8601 (_ BitVec 64) V!24763 (_ BitVec 64) V!24763) Unit!28183)

(assert (=> b!824084 (= lt!371328 (addCommutativeForDiffKeys!463 lt!371327 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371332 () ListLongMap!8601)

(assert (=> b!824084 (= lt!371332 lt!371336)))

(declare-fun lt!371331 () tuple2!9776)

(assert (=> b!824084 (= lt!371336 (+!1905 (+!1905 lt!371327 lt!371335) lt!371331))))

(assert (=> b!824084 (= lt!371335 (tuple2!9777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371334 () ListLongMap!8601)

(assert (=> b!824084 (= lt!371334 lt!371329)))

(assert (=> b!824084 (= lt!371329 (+!1905 lt!371327 lt!371331))))

(assert (=> b!824084 (= lt!371331 (tuple2!9777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2469 (array!45835 array!45837 (_ BitVec 32) (_ BitVec 32) V!24763 V!24763 (_ BitVec 32) Int) ListLongMap!8601)

(assert (=> b!824084 (= lt!371332 (getCurrentListMap!2469 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824084 (= lt!371334 (getCurrentListMap!2469 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824085 () Bool)

(declare-fun e!458379 () Bool)

(assert (=> b!824085 (= e!458379 tp_is_empty!14821)))

(declare-fun mapIsEmpty!23845 () Bool)

(declare-fun mapRes!23845 () Bool)

(assert (=> mapIsEmpty!23845 mapRes!23845))

(declare-fun b!824086 () Bool)

(declare-fun res!561731 () Bool)

(assert (=> b!824086 (=> (not res!561731) (not e!458375))))

(declare-datatypes ((List!15563 0))(
  ( (Nil!15560) (Cons!15559 (h!16694 (_ BitVec 64)) (t!21894 List!15563)) )
))
(declare-fun arrayNoDuplicates!0 (array!45835 (_ BitVec 32) List!15563) Bool)

(assert (=> b!824086 (= res!561731 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15560))))

(declare-fun b!824087 () Bool)

(declare-fun e!458376 () Bool)

(assert (=> b!824087 (= e!458376 (and e!458380 mapRes!23845))))

(declare-fun condMapEmpty!23845 () Bool)

(declare-fun mapDefault!23845 () ValueCell!6995)

(assert (=> b!824087 (= condMapEmpty!23845 (= (arr!21963 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6995)) mapDefault!23845)))))

(declare-fun res!561732 () Bool)

(assert (=> start!71040 (=> (not res!561732) (not e!458375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71040 (= res!561732 (validMask!0 mask!1312))))

(assert (=> start!71040 e!458375))

(assert (=> start!71040 tp_is_empty!14821))

(declare-fun array_inv!17567 (array!45835) Bool)

(assert (=> start!71040 (array_inv!17567 _keys!976)))

(assert (=> start!71040 true))

(declare-fun array_inv!17568 (array!45837) Bool)

(assert (=> start!71040 (and (array_inv!17568 _values!788) e!458376)))

(assert (=> start!71040 tp!46081))

(declare-fun b!824088 () Bool)

(declare-fun res!561734 () Bool)

(assert (=> b!824088 (=> (not res!561734) (not e!458375))))

(assert (=> b!824088 (= res!561734 (and (= (size!22383 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22382 _keys!976) (size!22383 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23845 () Bool)

(declare-fun tp!46080 () Bool)

(assert (=> mapNonEmpty!23845 (= mapRes!23845 (and tp!46080 e!458379))))

(declare-fun mapRest!23845 () (Array (_ BitVec 32) ValueCell!6995))

(declare-fun mapKey!23845 () (_ BitVec 32))

(declare-fun mapValue!23845 () ValueCell!6995)

(assert (=> mapNonEmpty!23845 (= (arr!21963 _values!788) (store mapRest!23845 mapKey!23845 mapValue!23845))))

(assert (= (and start!71040 res!561732) b!824088))

(assert (= (and b!824088 res!561734) b!824081))

(assert (= (and b!824081 res!561733) b!824086))

(assert (= (and b!824086 res!561731) b!824083))

(assert (= (and b!824083 (not res!561730)) b!824084))

(assert (= (and b!824087 condMapEmpty!23845) mapIsEmpty!23845))

(assert (= (and b!824087 (not condMapEmpty!23845)) mapNonEmpty!23845))

(get-info :version)

(assert (= (and mapNonEmpty!23845 ((_ is ValueCellFull!6995) mapValue!23845)) b!824085))

(assert (= (and b!824087 ((_ is ValueCellFull!6995) mapDefault!23845)) b!824082))

(assert (= start!71040 b!824087))

(declare-fun m!766547 () Bool)

(assert (=> b!824086 m!766547))

(declare-fun m!766549 () Bool)

(assert (=> mapNonEmpty!23845 m!766549))

(declare-fun m!766551 () Bool)

(assert (=> b!824081 m!766551))

(declare-fun m!766553 () Bool)

(assert (=> start!71040 m!766553))

(declare-fun m!766555 () Bool)

(assert (=> start!71040 m!766555))

(declare-fun m!766557 () Bool)

(assert (=> start!71040 m!766557))

(declare-fun m!766559 () Bool)

(assert (=> b!824083 m!766559))

(declare-fun m!766561 () Bool)

(assert (=> b!824083 m!766561))

(declare-fun m!766563 () Bool)

(assert (=> b!824083 m!766563))

(declare-fun m!766565 () Bool)

(assert (=> b!824084 m!766565))

(declare-fun m!766567 () Bool)

(assert (=> b!824084 m!766567))

(declare-fun m!766569 () Bool)

(assert (=> b!824084 m!766569))

(declare-fun m!766571 () Bool)

(assert (=> b!824084 m!766571))

(assert (=> b!824084 m!766565))

(declare-fun m!766573 () Bool)

(assert (=> b!824084 m!766573))

(declare-fun m!766575 () Bool)

(assert (=> b!824084 m!766575))

(declare-fun m!766577 () Bool)

(assert (=> b!824084 m!766577))

(check-sat (not mapNonEmpty!23845) (not b!824081) (not b!824084) (not b_next!13111) tp_is_empty!14821 b_and!22005 (not start!71040) (not b!824083) (not b!824086))
(check-sat b_and!22005 (not b_next!13111))
