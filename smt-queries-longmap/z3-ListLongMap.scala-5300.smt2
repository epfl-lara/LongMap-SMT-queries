; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70984 () Bool)

(assert start!70984)

(declare-fun b_free!13207 () Bool)

(declare-fun b_next!13207 () Bool)

(assert (=> start!70984 (= b_free!13207 (not b_next!13207))))

(declare-fun tp!46374 () Bool)

(declare-fun b_and!22085 () Bool)

(assert (=> start!70984 (= tp!46374 b_and!22085)))

(declare-fun b!824279 () Bool)

(declare-fun e!458602 () Bool)

(declare-fun e!458600 () Bool)

(declare-fun mapRes!23995 () Bool)

(assert (=> b!824279 (= e!458602 (and e!458600 mapRes!23995))))

(declare-fun condMapEmpty!23995 () Bool)

(declare-datatypes ((V!24891 0))(
  ( (V!24892 (val!7506 Int)) )
))
(declare-datatypes ((ValueCell!7043 0))(
  ( (ValueCellFull!7043 (v!9933 V!24891)) (EmptyCell!7043) )
))
(declare-datatypes ((array!45991 0))(
  ( (array!45992 (arr!22043 (Array (_ BitVec 32) ValueCell!7043)) (size!22464 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45991)

(declare-fun mapDefault!23995 () ValueCell!7043)

(assert (=> b!824279 (= condMapEmpty!23995 (= (arr!22043 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7043)) mapDefault!23995)))))

(declare-fun mapNonEmpty!23995 () Bool)

(declare-fun tp!46375 () Bool)

(declare-fun e!458601 () Bool)

(assert (=> mapNonEmpty!23995 (= mapRes!23995 (and tp!46375 e!458601))))

(declare-fun mapRest!23995 () (Array (_ BitVec 32) ValueCell!7043))

(declare-fun mapValue!23995 () ValueCell!7043)

(declare-fun mapKey!23995 () (_ BitVec 32))

(assert (=> mapNonEmpty!23995 (= (arr!22043 _values!788) (store mapRest!23995 mapKey!23995 mapValue!23995))))

(declare-fun b!824280 () Bool)

(declare-fun e!458603 () Bool)

(assert (=> b!824280 (= e!458603 true)))

(declare-fun zeroValueBefore!34 () V!24891)

(declare-datatypes ((array!45993 0))(
  ( (array!45994 (arr!22044 (Array (_ BitVec 32) (_ BitVec 64))) (size!22465 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45993)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24891)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9938 0))(
  ( (tuple2!9939 (_1!4980 (_ BitVec 64)) (_2!4980 V!24891)) )
))
(declare-datatypes ((List!15738 0))(
  ( (Nil!15735) (Cons!15734 (h!16863 tuple2!9938) (t!22072 List!15738)) )
))
(declare-datatypes ((ListLongMap!8751 0))(
  ( (ListLongMap!8752 (toList!4391 List!15738)) )
))
(declare-fun lt!371625 () ListLongMap!8751)

(declare-fun getCurrentListMap!2487 (array!45993 array!45991 (_ BitVec 32) (_ BitVec 32) V!24891 V!24891 (_ BitVec 32) Int) ListLongMap!8751)

(assert (=> b!824280 (= lt!371625 (getCurrentListMap!2487 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23995 () Bool)

(assert (=> mapIsEmpty!23995 mapRes!23995))

(declare-fun b!824281 () Bool)

(declare-fun res!562031 () Bool)

(declare-fun e!458598 () Bool)

(assert (=> b!824281 (=> (not res!562031) (not e!458598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45993 (_ BitVec 32)) Bool)

(assert (=> b!824281 (= res!562031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!562028 () Bool)

(assert (=> start!70984 (=> (not res!562028) (not e!458598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70984 (= res!562028 (validMask!0 mask!1312))))

(assert (=> start!70984 e!458598))

(declare-fun tp_is_empty!14917 () Bool)

(assert (=> start!70984 tp_is_empty!14917))

(declare-fun array_inv!17655 (array!45993) Bool)

(assert (=> start!70984 (array_inv!17655 _keys!976)))

(assert (=> start!70984 true))

(declare-fun array_inv!17656 (array!45991) Bool)

(assert (=> start!70984 (and (array_inv!17656 _values!788) e!458602)))

(assert (=> start!70984 tp!46374))

(declare-fun b!824278 () Bool)

(assert (=> b!824278 (= e!458600 tp_is_empty!14917)))

(declare-fun b!824282 () Bool)

(declare-fun res!562030 () Bool)

(assert (=> b!824282 (=> (not res!562030) (not e!458598))))

(declare-datatypes ((List!15739 0))(
  ( (Nil!15736) (Cons!15735 (h!16864 (_ BitVec 64)) (t!22073 List!15739)) )
))
(declare-fun arrayNoDuplicates!0 (array!45993 (_ BitVec 32) List!15739) Bool)

(assert (=> b!824282 (= res!562030 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15736))))

(declare-fun b!824283 () Bool)

(declare-fun res!562027 () Bool)

(assert (=> b!824283 (=> (not res!562027) (not e!458598))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824283 (= res!562027 (and (= (size!22464 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22465 _keys!976) (size!22464 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824284 () Bool)

(assert (=> b!824284 (= e!458601 tp_is_empty!14917)))

(declare-fun b!824285 () Bool)

(assert (=> b!824285 (= e!458598 (not e!458603))))

(declare-fun res!562029 () Bool)

(assert (=> b!824285 (=> res!562029 e!458603)))

(assert (=> b!824285 (= res!562029 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371626 () ListLongMap!8751)

(declare-fun lt!371627 () ListLongMap!8751)

(assert (=> b!824285 (= lt!371626 lt!371627)))

(declare-fun zeroValueAfter!34 () V!24891)

(declare-datatypes ((Unit!28206 0))(
  ( (Unit!28207) )
))
(declare-fun lt!371624 () Unit!28206)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!528 (array!45993 array!45991 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24891 V!24891 V!24891 V!24891 (_ BitVec 32) Int) Unit!28206)

(assert (=> b!824285 (= lt!371624 (lemmaNoChangeToArrayThenSameMapNoExtras!528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2435 (array!45993 array!45991 (_ BitVec 32) (_ BitVec 32) V!24891 V!24891 (_ BitVec 32) Int) ListLongMap!8751)

(assert (=> b!824285 (= lt!371627 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824285 (= lt!371626 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70984 res!562028) b!824283))

(assert (= (and b!824283 res!562027) b!824281))

(assert (= (and b!824281 res!562031) b!824282))

(assert (= (and b!824282 res!562030) b!824285))

(assert (= (and b!824285 (not res!562029)) b!824280))

(assert (= (and b!824279 condMapEmpty!23995) mapIsEmpty!23995))

(assert (= (and b!824279 (not condMapEmpty!23995)) mapNonEmpty!23995))

(get-info :version)

(assert (= (and mapNonEmpty!23995 ((_ is ValueCellFull!7043) mapValue!23995)) b!824284))

(assert (= (and b!824279 ((_ is ValueCellFull!7043) mapDefault!23995)) b!824278))

(assert (= start!70984 b!824279))

(declare-fun m!765845 () Bool)

(assert (=> b!824285 m!765845))

(declare-fun m!765847 () Bool)

(assert (=> b!824285 m!765847))

(declare-fun m!765849 () Bool)

(assert (=> b!824285 m!765849))

(declare-fun m!765851 () Bool)

(assert (=> b!824281 m!765851))

(declare-fun m!765853 () Bool)

(assert (=> mapNonEmpty!23995 m!765853))

(declare-fun m!765855 () Bool)

(assert (=> b!824282 m!765855))

(declare-fun m!765857 () Bool)

(assert (=> start!70984 m!765857))

(declare-fun m!765859 () Bool)

(assert (=> start!70984 m!765859))

(declare-fun m!765861 () Bool)

(assert (=> start!70984 m!765861))

(declare-fun m!765863 () Bool)

(assert (=> b!824280 m!765863))

(check-sat (not b!824282) (not mapNonEmpty!23995) tp_is_empty!14917 (not b!824285) b_and!22085 (not b!824280) (not b_next!13207) (not b!824281) (not start!70984))
(check-sat b_and!22085 (not b_next!13207))
