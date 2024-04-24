; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70586 () Bool)

(assert start!70586)

(declare-fun b_free!12763 () Bool)

(declare-fun b_next!12763 () Bool)

(assert (=> start!70586 (= b_free!12763 (not b_next!12763))))

(declare-fun tp!45019 () Bool)

(declare-fun b_and!21593 () Bool)

(assert (=> start!70586 (= tp!45019 b_and!21593)))

(declare-fun mapIsEmpty!23305 () Bool)

(declare-fun mapRes!23305 () Bool)

(assert (=> mapIsEmpty!23305 mapRes!23305))

(declare-fun res!558623 () Bool)

(declare-fun e!454552 () Bool)

(assert (=> start!70586 (=> (not res!558623) (not e!454552))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70586 (= res!558623 (validMask!0 mask!1312))))

(assert (=> start!70586 e!454552))

(declare-fun tp_is_empty!14473 () Bool)

(assert (=> start!70586 tp_is_empty!14473))

(declare-datatypes ((array!45145 0))(
  ( (array!45146 (arr!21623 (Array (_ BitVec 32) (_ BitVec 64))) (size!22043 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45145)

(declare-fun array_inv!17321 (array!45145) Bool)

(assert (=> start!70586 (array_inv!17321 _keys!976)))

(assert (=> start!70586 true))

(declare-datatypes ((V!24299 0))(
  ( (V!24300 (val!7284 Int)) )
))
(declare-datatypes ((ValueCell!6821 0))(
  ( (ValueCellFull!6821 (v!9713 V!24299)) (EmptyCell!6821) )
))
(declare-datatypes ((array!45147 0))(
  ( (array!45148 (arr!21624 (Array (_ BitVec 32) ValueCell!6821)) (size!22044 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45147)

(declare-fun e!454553 () Bool)

(declare-fun array_inv!17322 (array!45147) Bool)

(assert (=> start!70586 (and (array_inv!17322 _values!788) e!454553)))

(assert (=> start!70586 tp!45019))

(declare-fun b!818865 () Bool)

(declare-fun e!454554 () Bool)

(assert (=> b!818865 (= e!454554 tp_is_empty!14473)))

(declare-fun b!818866 () Bool)

(declare-fun e!454551 () Bool)

(assert (=> b!818866 (= e!454551 true)))

(declare-datatypes ((tuple2!9482 0))(
  ( (tuple2!9483 (_1!4752 (_ BitVec 64)) (_2!4752 V!24299)) )
))
(declare-datatypes ((List!15294 0))(
  ( (Nil!15291) (Cons!15290 (h!16425 tuple2!9482) (t!21613 List!15294)) )
))
(declare-datatypes ((ListLongMap!8307 0))(
  ( (ListLongMap!8308 (toList!4169 List!15294)) )
))
(declare-fun lt!366849 () ListLongMap!8307)

(declare-fun zeroValueBefore!34 () V!24299)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24299)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2367 (array!45145 array!45147 (_ BitVec 32) (_ BitVec 32) V!24299 V!24299 (_ BitVec 32) Int) ListLongMap!8307)

(assert (=> b!818866 (= lt!366849 (getCurrentListMap!2367 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818867 () Bool)

(declare-fun e!454550 () Bool)

(assert (=> b!818867 (= e!454553 (and e!454550 mapRes!23305))))

(declare-fun condMapEmpty!23305 () Bool)

(declare-fun mapDefault!23305 () ValueCell!6821)

(assert (=> b!818867 (= condMapEmpty!23305 (= (arr!21624 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6821)) mapDefault!23305)))))

(declare-fun b!818868 () Bool)

(declare-fun res!558621 () Bool)

(assert (=> b!818868 (=> (not res!558621) (not e!454552))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818868 (= res!558621 (and (= (size!22044 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22043 _keys!976) (size!22044 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818869 () Bool)

(declare-fun res!558624 () Bool)

(assert (=> b!818869 (=> (not res!558624) (not e!454552))))

(declare-datatypes ((List!15295 0))(
  ( (Nil!15292) (Cons!15291 (h!16426 (_ BitVec 64)) (t!21614 List!15295)) )
))
(declare-fun arrayNoDuplicates!0 (array!45145 (_ BitVec 32) List!15295) Bool)

(assert (=> b!818869 (= res!558624 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15292))))

(declare-fun b!818870 () Bool)

(assert (=> b!818870 (= e!454552 (not e!454551))))

(declare-fun res!558622 () Bool)

(assert (=> b!818870 (=> res!558622 e!454551)))

(assert (=> b!818870 (= res!558622 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366850 () ListLongMap!8307)

(declare-fun lt!366847 () ListLongMap!8307)

(assert (=> b!818870 (= lt!366850 lt!366847)))

(declare-datatypes ((Unit!27891 0))(
  ( (Unit!27892) )
))
(declare-fun lt!366848 () Unit!27891)

(declare-fun zeroValueAfter!34 () V!24299)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!355 (array!45145 array!45147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24299 V!24299 V!24299 V!24299 (_ BitVec 32) Int) Unit!27891)

(assert (=> b!818870 (= lt!366848 (lemmaNoChangeToArrayThenSameMapNoExtras!355 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2267 (array!45145 array!45147 (_ BitVec 32) (_ BitVec 32) V!24299 V!24299 (_ BitVec 32) Int) ListLongMap!8307)

(assert (=> b!818870 (= lt!366847 (getCurrentListMapNoExtraKeys!2267 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818870 (= lt!366850 (getCurrentListMapNoExtraKeys!2267 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818871 () Bool)

(declare-fun res!558620 () Bool)

(assert (=> b!818871 (=> (not res!558620) (not e!454552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45145 (_ BitVec 32)) Bool)

(assert (=> b!818871 (= res!558620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818872 () Bool)

(assert (=> b!818872 (= e!454550 tp_is_empty!14473)))

(declare-fun mapNonEmpty!23305 () Bool)

(declare-fun tp!45018 () Bool)

(assert (=> mapNonEmpty!23305 (= mapRes!23305 (and tp!45018 e!454554))))

(declare-fun mapValue!23305 () ValueCell!6821)

(declare-fun mapRest!23305 () (Array (_ BitVec 32) ValueCell!6821))

(declare-fun mapKey!23305 () (_ BitVec 32))

(assert (=> mapNonEmpty!23305 (= (arr!21624 _values!788) (store mapRest!23305 mapKey!23305 mapValue!23305))))

(assert (= (and start!70586 res!558623) b!818868))

(assert (= (and b!818868 res!558621) b!818871))

(assert (= (and b!818871 res!558620) b!818869))

(assert (= (and b!818869 res!558624) b!818870))

(assert (= (and b!818870 (not res!558622)) b!818866))

(assert (= (and b!818867 condMapEmpty!23305) mapIsEmpty!23305))

(assert (= (and b!818867 (not condMapEmpty!23305)) mapNonEmpty!23305))

(get-info :version)

(assert (= (and mapNonEmpty!23305 ((_ is ValueCellFull!6821) mapValue!23305)) b!818865))

(assert (= (and b!818867 ((_ is ValueCellFull!6821) mapDefault!23305)) b!818872))

(assert (= start!70586 b!818867))

(declare-fun m!760747 () Bool)

(assert (=> mapNonEmpty!23305 m!760747))

(declare-fun m!760749 () Bool)

(assert (=> start!70586 m!760749))

(declare-fun m!760751 () Bool)

(assert (=> start!70586 m!760751))

(declare-fun m!760753 () Bool)

(assert (=> start!70586 m!760753))

(declare-fun m!760755 () Bool)

(assert (=> b!818870 m!760755))

(declare-fun m!760757 () Bool)

(assert (=> b!818870 m!760757))

(declare-fun m!760759 () Bool)

(assert (=> b!818870 m!760759))

(declare-fun m!760761 () Bool)

(assert (=> b!818871 m!760761))

(declare-fun m!760763 () Bool)

(assert (=> b!818869 m!760763))

(declare-fun m!760765 () Bool)

(assert (=> b!818866 m!760765))

(check-sat (not mapNonEmpty!23305) b_and!21593 (not start!70586) (not b_next!12763) (not b!818866) (not b!818871) (not b!818869) tp_is_empty!14473 (not b!818870))
(check-sat b_and!21593 (not b_next!12763))
