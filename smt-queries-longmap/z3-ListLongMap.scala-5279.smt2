; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70824 () Bool)

(assert start!70824)

(declare-fun b_free!13081 () Bool)

(declare-fun b_next!13081 () Bool)

(assert (=> start!70824 (= b_free!13081 (not b_next!13081))))

(declare-fun tp!45991 () Bool)

(declare-fun b_and!21939 () Bool)

(assert (=> start!70824 (= tp!45991 b_and!21939)))

(declare-fun b!822581 () Bool)

(declare-fun e!457380 () Bool)

(declare-fun e!457377 () Bool)

(declare-fun mapRes!23800 () Bool)

(assert (=> b!822581 (= e!457380 (and e!457377 mapRes!23800))))

(declare-fun condMapEmpty!23800 () Bool)

(declare-datatypes ((V!24723 0))(
  ( (V!24724 (val!7443 Int)) )
))
(declare-datatypes ((ValueCell!6980 0))(
  ( (ValueCellFull!6980 (v!9869 V!24723)) (EmptyCell!6980) )
))
(declare-datatypes ((array!45745 0))(
  ( (array!45746 (arr!21922 (Array (_ BitVec 32) ValueCell!6980)) (size!22343 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45745)

(declare-fun mapDefault!23800 () ValueCell!6980)

(assert (=> b!822581 (= condMapEmpty!23800 (= (arr!21922 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6980)) mapDefault!23800)))))

(declare-fun mapIsEmpty!23800 () Bool)

(assert (=> mapIsEmpty!23800 mapRes!23800))

(declare-fun b!822582 () Bool)

(declare-fun res!561057 () Bool)

(declare-fun e!457378 () Bool)

(assert (=> b!822582 (=> (not res!561057) (not e!457378))))

(declare-datatypes ((array!45747 0))(
  ( (array!45748 (arr!21923 (Array (_ BitVec 32) (_ BitVec 64))) (size!22344 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45747)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822582 (= res!561057 (and (= (size!22343 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22344 _keys!976) (size!22343 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23800 () Bool)

(declare-fun tp!45990 () Bool)

(declare-fun e!457381 () Bool)

(assert (=> mapNonEmpty!23800 (= mapRes!23800 (and tp!45990 e!457381))))

(declare-fun mapRest!23800 () (Array (_ BitVec 32) ValueCell!6980))

(declare-fun mapKey!23800 () (_ BitVec 32))

(declare-fun mapValue!23800 () ValueCell!6980)

(assert (=> mapNonEmpty!23800 (= (arr!21922 _values!788) (store mapRest!23800 mapKey!23800 mapValue!23800))))

(declare-fun b!822584 () Bool)

(declare-fun res!561056 () Bool)

(assert (=> b!822584 (=> (not res!561056) (not e!457378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45747 (_ BitVec 32)) Bool)

(assert (=> b!822584 (= res!561056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822585 () Bool)

(declare-fun e!457379 () Bool)

(assert (=> b!822585 (= e!457379 true)))

(declare-datatypes ((tuple2!9834 0))(
  ( (tuple2!9835 (_1!4928 (_ BitVec 64)) (_2!4928 V!24723)) )
))
(declare-datatypes ((List!15647 0))(
  ( (Nil!15644) (Cons!15643 (h!16772 tuple2!9834) (t!21977 List!15647)) )
))
(declare-datatypes ((ListLongMap!8647 0))(
  ( (ListLongMap!8648 (toList!4339 List!15647)) )
))
(declare-fun lt!370286 () ListLongMap!8647)

(declare-fun lt!370283 () ListLongMap!8647)

(declare-fun lt!370282 () tuple2!9834)

(declare-fun +!1918 (ListLongMap!8647 tuple2!9834) ListLongMap!8647)

(assert (=> b!822585 (= lt!370286 (+!1918 lt!370283 lt!370282))))

(declare-datatypes ((Unit!28100 0))(
  ( (Unit!28101) )
))
(declare-fun lt!370285 () Unit!28100)

(declare-fun zeroValueAfter!34 () V!24723)

(declare-fun minValue!754 () V!24723)

(declare-fun lt!370287 () ListLongMap!8647)

(declare-fun addCommutativeForDiffKeys!449 (ListLongMap!8647 (_ BitVec 64) V!24723 (_ BitVec 64) V!24723) Unit!28100)

(assert (=> b!822585 (= lt!370285 (addCommutativeForDiffKeys!449 lt!370287 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370280 () ListLongMap!8647)

(assert (=> b!822585 (= lt!370280 lt!370286)))

(declare-fun lt!370284 () tuple2!9834)

(assert (=> b!822585 (= lt!370286 (+!1918 (+!1918 lt!370287 lt!370282) lt!370284))))

(assert (=> b!822585 (= lt!370282 (tuple2!9835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370288 () ListLongMap!8647)

(assert (=> b!822585 (= lt!370288 lt!370283)))

(assert (=> b!822585 (= lt!370283 (+!1918 lt!370287 lt!370284))))

(assert (=> b!822585 (= lt!370284 (tuple2!9835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2460 (array!45747 array!45745 (_ BitVec 32) (_ BitVec 32) V!24723 V!24723 (_ BitVec 32) Int) ListLongMap!8647)

(assert (=> b!822585 (= lt!370280 (getCurrentListMap!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24723)

(assert (=> b!822585 (= lt!370288 (getCurrentListMap!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822586 () Bool)

(declare-fun tp_is_empty!14791 () Bool)

(assert (=> b!822586 (= e!457381 tp_is_empty!14791)))

(declare-fun b!822587 () Bool)

(assert (=> b!822587 (= e!457378 (not e!457379))))

(declare-fun res!561054 () Bool)

(assert (=> b!822587 (=> res!561054 e!457379)))

(assert (=> b!822587 (= res!561054 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370289 () ListLongMap!8647)

(assert (=> b!822587 (= lt!370287 lt!370289)))

(declare-fun lt!370281 () Unit!28100)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!478 (array!45747 array!45745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24723 V!24723 V!24723 V!24723 (_ BitVec 32) Int) Unit!28100)

(assert (=> b!822587 (= lt!370281 (lemmaNoChangeToArrayThenSameMapNoExtras!478 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2385 (array!45747 array!45745 (_ BitVec 32) (_ BitVec 32) V!24723 V!24723 (_ BitVec 32) Int) ListLongMap!8647)

(assert (=> b!822587 (= lt!370289 (getCurrentListMapNoExtraKeys!2385 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822587 (= lt!370287 (getCurrentListMapNoExtraKeys!2385 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822588 () Bool)

(declare-fun res!561055 () Bool)

(assert (=> b!822588 (=> (not res!561055) (not e!457378))))

(declare-datatypes ((List!15648 0))(
  ( (Nil!15645) (Cons!15644 (h!16773 (_ BitVec 64)) (t!21978 List!15648)) )
))
(declare-fun arrayNoDuplicates!0 (array!45747 (_ BitVec 32) List!15648) Bool)

(assert (=> b!822588 (= res!561055 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15645))))

(declare-fun res!561053 () Bool)

(assert (=> start!70824 (=> (not res!561053) (not e!457378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70824 (= res!561053 (validMask!0 mask!1312))))

(assert (=> start!70824 e!457378))

(assert (=> start!70824 tp_is_empty!14791))

(declare-fun array_inv!17571 (array!45747) Bool)

(assert (=> start!70824 (array_inv!17571 _keys!976)))

(assert (=> start!70824 true))

(declare-fun array_inv!17572 (array!45745) Bool)

(assert (=> start!70824 (and (array_inv!17572 _values!788) e!457380)))

(assert (=> start!70824 tp!45991))

(declare-fun b!822583 () Bool)

(assert (=> b!822583 (= e!457377 tp_is_empty!14791)))

(assert (= (and start!70824 res!561053) b!822582))

(assert (= (and b!822582 res!561057) b!822584))

(assert (= (and b!822584 res!561056) b!822588))

(assert (= (and b!822588 res!561055) b!822587))

(assert (= (and b!822587 (not res!561054)) b!822585))

(assert (= (and b!822581 condMapEmpty!23800) mapIsEmpty!23800))

(assert (= (and b!822581 (not condMapEmpty!23800)) mapNonEmpty!23800))

(get-info :version)

(assert (= (and mapNonEmpty!23800 ((_ is ValueCellFull!6980) mapValue!23800)) b!822586))

(assert (= (and b!822581 ((_ is ValueCellFull!6980) mapDefault!23800)) b!822583))

(assert (= start!70824 b!822581))

(declare-fun m!764033 () Bool)

(assert (=> mapNonEmpty!23800 m!764033))

(declare-fun m!764035 () Bool)

(assert (=> b!822588 m!764035))

(declare-fun m!764037 () Bool)

(assert (=> b!822584 m!764037))

(declare-fun m!764039 () Bool)

(assert (=> b!822585 m!764039))

(declare-fun m!764041 () Bool)

(assert (=> b!822585 m!764041))

(declare-fun m!764043 () Bool)

(assert (=> b!822585 m!764043))

(declare-fun m!764045 () Bool)

(assert (=> b!822585 m!764045))

(declare-fun m!764047 () Bool)

(assert (=> b!822585 m!764047))

(declare-fun m!764049 () Bool)

(assert (=> b!822585 m!764049))

(declare-fun m!764051 () Bool)

(assert (=> b!822585 m!764051))

(assert (=> b!822585 m!764041))

(declare-fun m!764053 () Bool)

(assert (=> start!70824 m!764053))

(declare-fun m!764055 () Bool)

(assert (=> start!70824 m!764055))

(declare-fun m!764057 () Bool)

(assert (=> start!70824 m!764057))

(declare-fun m!764059 () Bool)

(assert (=> b!822587 m!764059))

(declare-fun m!764061 () Bool)

(assert (=> b!822587 m!764061))

(declare-fun m!764063 () Bool)

(assert (=> b!822587 m!764063))

(check-sat b_and!21939 (not b!822588) tp_is_empty!14791 (not b!822584) (not mapNonEmpty!23800) (not b!822587) (not start!70824) (not b!822585) (not b_next!13081))
(check-sat b_and!21939 (not b_next!13081))
