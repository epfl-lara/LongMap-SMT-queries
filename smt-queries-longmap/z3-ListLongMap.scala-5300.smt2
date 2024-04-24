; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71170 () Bool)

(assert start!71170)

(declare-fun b_free!13207 () Bool)

(declare-fun b_next!13207 () Bool)

(assert (=> start!71170 (= b_free!13207 (not b_next!13207))))

(declare-fun tp!46375 () Bool)

(declare-fun b_and!22121 () Bool)

(assert (=> start!71170 (= tp!46375 b_and!22121)))

(declare-fun b!825418 () Bool)

(declare-fun res!562479 () Bool)

(declare-fun e!459329 () Bool)

(assert (=> b!825418 (=> (not res!562479) (not e!459329))))

(declare-datatypes ((array!46029 0))(
  ( (array!46030 (arr!22057 (Array (_ BitVec 32) (_ BitVec 64))) (size!22477 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46029)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24891 0))(
  ( (V!24892 (val!7506 Int)) )
))
(declare-datatypes ((ValueCell!7043 0))(
  ( (ValueCellFull!7043 (v!9939 V!24891)) (EmptyCell!7043) )
))
(declare-datatypes ((array!46031 0))(
  ( (array!46032 (arr!22058 (Array (_ BitVec 32) ValueCell!7043)) (size!22478 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46031)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825418 (= res!562479 (and (= (size!22478 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22477 _keys!976) (size!22478 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!562480 () Bool)

(assert (=> start!71170 (=> (not res!562480) (not e!459329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71170 (= res!562480 (validMask!0 mask!1312))))

(assert (=> start!71170 e!459329))

(declare-fun tp_is_empty!14917 () Bool)

(assert (=> start!71170 tp_is_empty!14917))

(declare-fun array_inv!17635 (array!46029) Bool)

(assert (=> start!71170 (array_inv!17635 _keys!976)))

(assert (=> start!71170 true))

(declare-fun e!459328 () Bool)

(declare-fun array_inv!17636 (array!46031) Bool)

(assert (=> start!71170 (and (array_inv!17636 _values!788) e!459328)))

(assert (=> start!71170 tp!46375))

(declare-fun b!825419 () Bool)

(declare-fun e!459330 () Bool)

(assert (=> b!825419 (= e!459329 (not e!459330))))

(declare-fun res!562483 () Bool)

(assert (=> b!825419 (=> res!562483 e!459330)))

(assert (=> b!825419 (= res!562483 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9858 0))(
  ( (tuple2!9859 (_1!4940 (_ BitVec 64)) (_2!4940 V!24891)) )
))
(declare-datatypes ((List!15641 0))(
  ( (Nil!15638) (Cons!15637 (h!16772 tuple2!9858) (t!21976 List!15641)) )
))
(declare-datatypes ((ListLongMap!8683 0))(
  ( (ListLongMap!8684 (toList!4357 List!15641)) )
))
(declare-fun lt!372222 () ListLongMap!8683)

(declare-fun lt!372223 () ListLongMap!8683)

(assert (=> b!825419 (= lt!372222 lt!372223)))

(declare-fun zeroValueBefore!34 () V!24891)

(declare-fun zeroValueAfter!34 () V!24891)

(declare-fun minValue!754 () V!24891)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28265 0))(
  ( (Unit!28266) )
))
(declare-fun lt!372224 () Unit!28265)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!527 (array!46029 array!46031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24891 V!24891 V!24891 V!24891 (_ BitVec 32) Int) Unit!28265)

(assert (=> b!825419 (= lt!372224 (lemmaNoChangeToArrayThenSameMapNoExtras!527 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2439 (array!46029 array!46031 (_ BitVec 32) (_ BitVec 32) V!24891 V!24891 (_ BitVec 32) Int) ListLongMap!8683)

(assert (=> b!825419 (= lt!372223 (getCurrentListMapNoExtraKeys!2439 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825419 (= lt!372222 (getCurrentListMapNoExtraKeys!2439 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825420 () Bool)

(assert (=> b!825420 (= e!459330 true)))

(declare-fun lt!372221 () ListLongMap!8683)

(declare-fun getCurrentListMap!2484 (array!46029 array!46031 (_ BitVec 32) (_ BitVec 32) V!24891 V!24891 (_ BitVec 32) Int) ListLongMap!8683)

(assert (=> b!825420 (= lt!372221 (getCurrentListMap!2484 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23995 () Bool)

(declare-fun mapRes!23995 () Bool)

(assert (=> mapIsEmpty!23995 mapRes!23995))

(declare-fun b!825421 () Bool)

(declare-fun res!562482 () Bool)

(assert (=> b!825421 (=> (not res!562482) (not e!459329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46029 (_ BitVec 32)) Bool)

(assert (=> b!825421 (= res!562482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825422 () Bool)

(declare-fun e!459326 () Bool)

(assert (=> b!825422 (= e!459328 (and e!459326 mapRes!23995))))

(declare-fun condMapEmpty!23995 () Bool)

(declare-fun mapDefault!23995 () ValueCell!7043)

(assert (=> b!825422 (= condMapEmpty!23995 (= (arr!22058 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7043)) mapDefault!23995)))))

(declare-fun mapNonEmpty!23995 () Bool)

(declare-fun tp!46374 () Bool)

(declare-fun e!459327 () Bool)

(assert (=> mapNonEmpty!23995 (= mapRes!23995 (and tp!46374 e!459327))))

(declare-fun mapRest!23995 () (Array (_ BitVec 32) ValueCell!7043))

(declare-fun mapValue!23995 () ValueCell!7043)

(declare-fun mapKey!23995 () (_ BitVec 32))

(assert (=> mapNonEmpty!23995 (= (arr!22058 _values!788) (store mapRest!23995 mapKey!23995 mapValue!23995))))

(declare-fun b!825423 () Bool)

(assert (=> b!825423 (= e!459327 tp_is_empty!14917)))

(declare-fun b!825424 () Bool)

(assert (=> b!825424 (= e!459326 tp_is_empty!14917)))

(declare-fun b!825425 () Bool)

(declare-fun res!562481 () Bool)

(assert (=> b!825425 (=> (not res!562481) (not e!459329))))

(declare-datatypes ((List!15642 0))(
  ( (Nil!15639) (Cons!15638 (h!16773 (_ BitVec 64)) (t!21977 List!15642)) )
))
(declare-fun arrayNoDuplicates!0 (array!46029 (_ BitVec 32) List!15642) Bool)

(assert (=> b!825425 (= res!562481 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15639))))

(assert (= (and start!71170 res!562480) b!825418))

(assert (= (and b!825418 res!562479) b!825421))

(assert (= (and b!825421 res!562482) b!825425))

(assert (= (and b!825425 res!562481) b!825419))

(assert (= (and b!825419 (not res!562483)) b!825420))

(assert (= (and b!825422 condMapEmpty!23995) mapIsEmpty!23995))

(assert (= (and b!825422 (not condMapEmpty!23995)) mapNonEmpty!23995))

(get-info :version)

(assert (= (and mapNonEmpty!23995 ((_ is ValueCellFull!7043) mapValue!23995)) b!825423))

(assert (= (and b!825422 ((_ is ValueCellFull!7043) mapDefault!23995)) b!825424))

(assert (= start!71170 b!825422))

(declare-fun m!767879 () Bool)

(assert (=> b!825420 m!767879))

(declare-fun m!767881 () Bool)

(assert (=> mapNonEmpty!23995 m!767881))

(declare-fun m!767883 () Bool)

(assert (=> b!825419 m!767883))

(declare-fun m!767885 () Bool)

(assert (=> b!825419 m!767885))

(declare-fun m!767887 () Bool)

(assert (=> b!825419 m!767887))

(declare-fun m!767889 () Bool)

(assert (=> start!71170 m!767889))

(declare-fun m!767891 () Bool)

(assert (=> start!71170 m!767891))

(declare-fun m!767893 () Bool)

(assert (=> start!71170 m!767893))

(declare-fun m!767895 () Bool)

(assert (=> b!825425 m!767895))

(declare-fun m!767897 () Bool)

(assert (=> b!825421 m!767897))

(check-sat (not start!71170) (not mapNonEmpty!23995) (not b!825419) (not b!825421) b_and!22121 (not b_next!13207) (not b!825425) (not b!825420) tp_is_empty!14917)
(check-sat b_and!22121 (not b_next!13207))
