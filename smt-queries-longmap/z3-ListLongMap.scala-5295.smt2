; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71126 () Bool)

(assert start!71126)

(declare-fun b_free!13177 () Bool)

(declare-fun b_next!13177 () Bool)

(assert (=> start!71126 (= b_free!13177 (not b_next!13177))))

(declare-fun tp!46281 () Bool)

(declare-fun b_and!22083 () Bool)

(assert (=> start!71126 (= tp!46281 b_and!22083)))

(declare-fun b!824989 () Bool)

(declare-fun res!562240 () Bool)

(declare-fun e!459017 () Bool)

(assert (=> b!824989 (=> (not res!562240) (not e!459017))))

(declare-datatypes ((array!45967 0))(
  ( (array!45968 (arr!22027 (Array (_ BitVec 32) (_ BitVec 64))) (size!22447 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45967)

(declare-datatypes ((List!15614 0))(
  ( (Nil!15611) (Cons!15610 (h!16745 (_ BitVec 64)) (t!21947 List!15614)) )
))
(declare-fun arrayNoDuplicates!0 (array!45967 (_ BitVec 32) List!15614) Bool)

(assert (=> b!824989 (= res!562240 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15611))))

(declare-fun b!824991 () Bool)

(assert (=> b!824991 (= e!459017 (not true))))

(declare-datatypes ((V!24851 0))(
  ( (V!24852 (val!7491 Int)) )
))
(declare-datatypes ((tuple2!9830 0))(
  ( (tuple2!9831 (_1!4926 (_ BitVec 64)) (_2!4926 V!24851)) )
))
(declare-datatypes ((List!15615 0))(
  ( (Nil!15612) (Cons!15611 (h!16746 tuple2!9830) (t!21948 List!15615)) )
))
(declare-datatypes ((ListLongMap!8655 0))(
  ( (ListLongMap!8656 (toList!4343 List!15615)) )
))
(declare-fun lt!372019 () ListLongMap!8655)

(declare-fun lt!372018 () ListLongMap!8655)

(assert (=> b!824991 (= lt!372019 lt!372018)))

(declare-fun zeroValueBefore!34 () V!24851)

(declare-datatypes ((Unit!28239 0))(
  ( (Unit!28240) )
))
(declare-fun lt!372017 () Unit!28239)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24851)

(declare-fun minValue!754 () V!24851)

(declare-datatypes ((ValueCell!7028 0))(
  ( (ValueCellFull!7028 (v!9924 V!24851)) (EmptyCell!7028) )
))
(declare-datatypes ((array!45969 0))(
  ( (array!45970 (arr!22028 (Array (_ BitVec 32) ValueCell!7028)) (size!22448 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45969)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!514 (array!45967 array!45969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24851 V!24851 V!24851 V!24851 (_ BitVec 32) Int) Unit!28239)

(assert (=> b!824991 (= lt!372017 (lemmaNoChangeToArrayThenSameMapNoExtras!514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2426 (array!45967 array!45969 (_ BitVec 32) (_ BitVec 32) V!24851 V!24851 (_ BitVec 32) Int) ListLongMap!8655)

(assert (=> b!824991 (= lt!372018 (getCurrentListMapNoExtraKeys!2426 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824991 (= lt!372019 (getCurrentListMapNoExtraKeys!2426 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824992 () Bool)

(declare-fun e!459020 () Bool)

(declare-fun e!459018 () Bool)

(declare-fun mapRes!23947 () Bool)

(assert (=> b!824992 (= e!459020 (and e!459018 mapRes!23947))))

(declare-fun condMapEmpty!23947 () Bool)

(declare-fun mapDefault!23947 () ValueCell!7028)

(assert (=> b!824992 (= condMapEmpty!23947 (= (arr!22028 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7028)) mapDefault!23947)))))

(declare-fun b!824993 () Bool)

(declare-fun res!562241 () Bool)

(assert (=> b!824993 (=> (not res!562241) (not e!459017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45967 (_ BitVec 32)) Bool)

(assert (=> b!824993 (= res!562241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23947 () Bool)

(assert (=> mapIsEmpty!23947 mapRes!23947))

(declare-fun b!824994 () Bool)

(declare-fun tp_is_empty!14887 () Bool)

(assert (=> b!824994 (= e!459018 tp_is_empty!14887)))

(declare-fun mapNonEmpty!23947 () Bool)

(declare-fun tp!46282 () Bool)

(declare-fun e!459021 () Bool)

(assert (=> mapNonEmpty!23947 (= mapRes!23947 (and tp!46282 e!459021))))

(declare-fun mapRest!23947 () (Array (_ BitVec 32) ValueCell!7028))

(declare-fun mapKey!23947 () (_ BitVec 32))

(declare-fun mapValue!23947 () ValueCell!7028)

(assert (=> mapNonEmpty!23947 (= (arr!22028 _values!788) (store mapRest!23947 mapKey!23947 mapValue!23947))))

(declare-fun b!824995 () Bool)

(assert (=> b!824995 (= e!459021 tp_is_empty!14887)))

(declare-fun b!824990 () Bool)

(declare-fun res!562239 () Bool)

(assert (=> b!824990 (=> (not res!562239) (not e!459017))))

(assert (=> b!824990 (= res!562239 (and (= (size!22448 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22447 _keys!976) (size!22448 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!562242 () Bool)

(assert (=> start!71126 (=> (not res!562242) (not e!459017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71126 (= res!562242 (validMask!0 mask!1312))))

(assert (=> start!71126 e!459017))

(assert (=> start!71126 tp_is_empty!14887))

(declare-fun array_inv!17615 (array!45967) Bool)

(assert (=> start!71126 (array_inv!17615 _keys!976)))

(assert (=> start!71126 true))

(declare-fun array_inv!17616 (array!45969) Bool)

(assert (=> start!71126 (and (array_inv!17616 _values!788) e!459020)))

(assert (=> start!71126 tp!46281))

(assert (= (and start!71126 res!562242) b!824990))

(assert (= (and b!824990 res!562239) b!824993))

(assert (= (and b!824993 res!562241) b!824989))

(assert (= (and b!824989 res!562240) b!824991))

(assert (= (and b!824992 condMapEmpty!23947) mapIsEmpty!23947))

(assert (= (and b!824992 (not condMapEmpty!23947)) mapNonEmpty!23947))

(get-info :version)

(assert (= (and mapNonEmpty!23947 ((_ is ValueCellFull!7028) mapValue!23947)) b!824995))

(assert (= (and b!824992 ((_ is ValueCellFull!7028) mapDefault!23947)) b!824994))

(assert (= start!71126 b!824992))

(declare-fun m!767525 () Bool)

(assert (=> start!71126 m!767525))

(declare-fun m!767527 () Bool)

(assert (=> start!71126 m!767527))

(declare-fun m!767529 () Bool)

(assert (=> start!71126 m!767529))

(declare-fun m!767531 () Bool)

(assert (=> mapNonEmpty!23947 m!767531))

(declare-fun m!767533 () Bool)

(assert (=> b!824993 m!767533))

(declare-fun m!767535 () Bool)

(assert (=> b!824989 m!767535))

(declare-fun m!767537 () Bool)

(assert (=> b!824991 m!767537))

(declare-fun m!767539 () Bool)

(assert (=> b!824991 m!767539))

(declare-fun m!767541 () Bool)

(assert (=> b!824991 m!767541))

(check-sat (not start!71126) (not mapNonEmpty!23947) b_and!22083 (not b!824991) tp_is_empty!14887 (not b_next!13177) (not b!824993) (not b!824989))
(check-sat b_and!22083 (not b_next!13177))
