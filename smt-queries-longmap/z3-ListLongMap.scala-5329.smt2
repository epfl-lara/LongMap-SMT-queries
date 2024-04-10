; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71236 () Bool)

(assert start!71236)

(declare-fun b_free!13383 () Bool)

(declare-fun b_next!13383 () Bool)

(assert (=> start!71236 (= b_free!13383 (not b_next!13383))))

(declare-fun tp!46912 () Bool)

(declare-fun b_and!22321 () Bool)

(assert (=> start!71236 (= tp!46912 b_and!22321)))

(declare-fun b!827470 () Bool)

(declare-fun e!460961 () Bool)

(declare-fun e!460962 () Bool)

(declare-fun mapRes!24268 () Bool)

(assert (=> b!827470 (= e!460961 (and e!460962 mapRes!24268))))

(declare-fun condMapEmpty!24268 () Bool)

(declare-datatypes ((V!25125 0))(
  ( (V!25126 (val!7594 Int)) )
))
(declare-datatypes ((ValueCell!7131 0))(
  ( (ValueCellFull!7131 (v!10029 V!25125)) (EmptyCell!7131) )
))
(declare-datatypes ((array!46360 0))(
  ( (array!46361 (arr!22224 (Array (_ BitVec 32) ValueCell!7131)) (size!22645 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46360)

(declare-fun mapDefault!24268 () ValueCell!7131)

(assert (=> b!827470 (= condMapEmpty!24268 (= (arr!22224 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7131)) mapDefault!24268)))))

(declare-fun b!827471 () Bool)

(declare-fun tp_is_empty!15093 () Bool)

(assert (=> b!827471 (= e!460962 tp_is_empty!15093)))

(declare-fun b!827472 () Bool)

(declare-fun res!563995 () Bool)

(declare-fun e!460960 () Bool)

(assert (=> b!827472 (=> (not res!563995) (not e!460960))))

(declare-datatypes ((array!46362 0))(
  ( (array!46363 (arr!22225 (Array (_ BitVec 32) (_ BitVec 64))) (size!22646 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46362)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46362 (_ BitVec 32)) Bool)

(assert (=> b!827472 (= res!563995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827473 () Bool)

(declare-fun e!460963 () Bool)

(assert (=> b!827473 (= e!460963 tp_is_empty!15093)))

(declare-fun b!827474 () Bool)

(declare-fun res!563996 () Bool)

(assert (=> b!827474 (=> (not res!563996) (not e!460960))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827474 (= res!563996 (and (= (size!22645 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22646 _keys!976) (size!22645 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!563994 () Bool)

(assert (=> start!71236 (=> (not res!563994) (not e!460960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71236 (= res!563994 (validMask!0 mask!1312))))

(assert (=> start!71236 e!460960))

(assert (=> start!71236 tp_is_empty!15093))

(declare-fun array_inv!17709 (array!46362) Bool)

(assert (=> start!71236 (array_inv!17709 _keys!976)))

(assert (=> start!71236 true))

(declare-fun array_inv!17710 (array!46360) Bool)

(assert (=> start!71236 (and (array_inv!17710 _values!788) e!460961)))

(assert (=> start!71236 tp!46912))

(declare-fun b!827475 () Bool)

(declare-fun res!563993 () Bool)

(assert (=> b!827475 (=> (not res!563993) (not e!460960))))

(declare-datatypes ((List!15863 0))(
  ( (Nil!15860) (Cons!15859 (h!16988 (_ BitVec 64)) (t!22212 List!15863)) )
))
(declare-fun arrayNoDuplicates!0 (array!46362 (_ BitVec 32) List!15863) Bool)

(assert (=> b!827475 (= res!563993 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15860))))

(declare-fun mapNonEmpty!24268 () Bool)

(declare-fun tp!46911 () Bool)

(assert (=> mapNonEmpty!24268 (= mapRes!24268 (and tp!46911 e!460963))))

(declare-fun mapRest!24268 () (Array (_ BitVec 32) ValueCell!7131))

(declare-fun mapValue!24268 () ValueCell!7131)

(declare-fun mapKey!24268 () (_ BitVec 32))

(assert (=> mapNonEmpty!24268 (= (arr!22224 _values!788) (store mapRest!24268 mapKey!24268 mapValue!24268))))

(declare-fun mapIsEmpty!24268 () Bool)

(assert (=> mapIsEmpty!24268 mapRes!24268))

(declare-fun b!827476 () Bool)

(assert (=> b!827476 (= e!460960 false)))

(declare-datatypes ((tuple2!10068 0))(
  ( (tuple2!10069 (_1!5045 (_ BitVec 64)) (_2!5045 V!25125)) )
))
(declare-datatypes ((List!15864 0))(
  ( (Nil!15861) (Cons!15860 (h!16989 tuple2!10068) (t!22213 List!15864)) )
))
(declare-datatypes ((ListLongMap!8891 0))(
  ( (ListLongMap!8892 (toList!4461 List!15864)) )
))
(declare-fun lt!374915 () ListLongMap!8891)

(declare-fun zeroValueAfter!34 () V!25125)

(declare-fun minValue!754 () V!25125)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2463 (array!46362 array!46360 (_ BitVec 32) (_ BitVec 32) V!25125 V!25125 (_ BitVec 32) Int) ListLongMap!8891)

(assert (=> b!827476 (= lt!374915 (getCurrentListMapNoExtraKeys!2463 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25125)

(declare-fun lt!374914 () ListLongMap!8891)

(assert (=> b!827476 (= lt!374914 (getCurrentListMapNoExtraKeys!2463 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71236 res!563994) b!827474))

(assert (= (and b!827474 res!563996) b!827472))

(assert (= (and b!827472 res!563995) b!827475))

(assert (= (and b!827475 res!563993) b!827476))

(assert (= (and b!827470 condMapEmpty!24268) mapIsEmpty!24268))

(assert (= (and b!827470 (not condMapEmpty!24268)) mapNonEmpty!24268))

(get-info :version)

(assert (= (and mapNonEmpty!24268 ((_ is ValueCellFull!7131) mapValue!24268)) b!827473))

(assert (= (and b!827470 ((_ is ValueCellFull!7131) mapDefault!24268)) b!827471))

(assert (= start!71236 b!827470))

(declare-fun m!770543 () Bool)

(assert (=> mapNonEmpty!24268 m!770543))

(declare-fun m!770545 () Bool)

(assert (=> b!827476 m!770545))

(declare-fun m!770547 () Bool)

(assert (=> b!827476 m!770547))

(declare-fun m!770549 () Bool)

(assert (=> start!71236 m!770549))

(declare-fun m!770551 () Bool)

(assert (=> start!71236 m!770551))

(declare-fun m!770553 () Bool)

(assert (=> start!71236 m!770553))

(declare-fun m!770555 () Bool)

(assert (=> b!827475 m!770555))

(declare-fun m!770557 () Bool)

(assert (=> b!827472 m!770557))

(check-sat (not b!827472) tp_is_empty!15093 (not mapNonEmpty!24268) (not b_next!13383) (not b!827476) (not start!71236) b_and!22321 (not b!827475))
(check-sat b_and!22321 (not b_next!13383))
