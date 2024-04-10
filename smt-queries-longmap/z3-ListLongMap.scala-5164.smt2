; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69960 () Bool)

(assert start!69960)

(declare-fun b_free!12393 () Bool)

(declare-fun b_next!12393 () Bool)

(assert (=> start!69960 (= b_free!12393 (not b_next!12393))))

(declare-fun tp!43891 () Bool)

(declare-fun b_and!21161 () Bool)

(assert (=> start!69960 (= tp!43891 b_and!21161)))

(declare-fun b!813208 () Bool)

(declare-fun e!450582 () Bool)

(assert (=> b!813208 (= e!450582 false)))

(declare-datatypes ((V!23805 0))(
  ( (V!23806 (val!7099 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23805)

(declare-datatypes ((array!44418 0))(
  ( (array!44419 (arr!21270 (Array (_ BitVec 32) (_ BitVec 64))) (size!21691 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44418)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6636 0))(
  ( (ValueCellFull!6636 (v!9526 V!23805)) (EmptyCell!6636) )
))
(declare-datatypes ((array!44420 0))(
  ( (array!44421 (arr!21271 (Array (_ BitVec 32) ValueCell!6636)) (size!21692 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44420)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun minValue!754 () V!23805)

(declare-datatypes ((tuple2!9296 0))(
  ( (tuple2!9297 (_1!4659 (_ BitVec 64)) (_2!4659 V!23805)) )
))
(declare-datatypes ((List!15128 0))(
  ( (Nil!15125) (Cons!15124 (h!16253 tuple2!9296) (t!21443 List!15128)) )
))
(declare-datatypes ((ListLongMap!8119 0))(
  ( (ListLongMap!8120 (toList!4075 List!15128)) )
))
(declare-fun lt!364251 () ListLongMap!8119)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2125 (array!44418 array!44420 (_ BitVec 32) (_ BitVec 32) V!23805 V!23805 (_ BitVec 32) Int) ListLongMap!8119)

(assert (=> b!813208 (= lt!364251 (getCurrentListMapNoExtraKeys!2125 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813209 () Bool)

(declare-fun res!555590 () Bool)

(assert (=> b!813209 (=> (not res!555590) (not e!450582))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813209 (= res!555590 (and (= (size!21692 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21691 _keys!976) (size!21692 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813210 () Bool)

(declare-fun res!555589 () Bool)

(assert (=> b!813210 (=> (not res!555589) (not e!450582))))

(declare-datatypes ((List!15129 0))(
  ( (Nil!15126) (Cons!15125 (h!16254 (_ BitVec 64)) (t!21444 List!15129)) )
))
(declare-fun arrayNoDuplicates!0 (array!44418 (_ BitVec 32) List!15129) Bool)

(assert (=> b!813210 (= res!555589 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15126))))

(declare-fun b!813211 () Bool)

(declare-fun res!555588 () Bool)

(assert (=> b!813211 (=> (not res!555588) (not e!450582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44418 (_ BitVec 32)) Bool)

(assert (=> b!813211 (= res!555588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22732 () Bool)

(declare-fun mapRes!22732 () Bool)

(declare-fun tp!43890 () Bool)

(declare-fun e!450584 () Bool)

(assert (=> mapNonEmpty!22732 (= mapRes!22732 (and tp!43890 e!450584))))

(declare-fun mapRest!22732 () (Array (_ BitVec 32) ValueCell!6636))

(declare-fun mapKey!22732 () (_ BitVec 32))

(declare-fun mapValue!22732 () ValueCell!6636)

(assert (=> mapNonEmpty!22732 (= (arr!21271 _values!788) (store mapRest!22732 mapKey!22732 mapValue!22732))))

(declare-fun b!813213 () Bool)

(declare-fun e!450583 () Bool)

(declare-fun e!450581 () Bool)

(assert (=> b!813213 (= e!450583 (and e!450581 mapRes!22732))))

(declare-fun condMapEmpty!22732 () Bool)

(declare-fun mapDefault!22732 () ValueCell!6636)

(assert (=> b!813213 (= condMapEmpty!22732 (= (arr!21271 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6636)) mapDefault!22732)))))

(declare-fun mapIsEmpty!22732 () Bool)

(assert (=> mapIsEmpty!22732 mapRes!22732))

(declare-fun b!813214 () Bool)

(declare-fun tp_is_empty!14103 () Bool)

(assert (=> b!813214 (= e!450581 tp_is_empty!14103)))

(declare-fun b!813212 () Bool)

(assert (=> b!813212 (= e!450584 tp_is_empty!14103)))

(declare-fun res!555591 () Bool)

(assert (=> start!69960 (=> (not res!555591) (not e!450582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69960 (= res!555591 (validMask!0 mask!1312))))

(assert (=> start!69960 e!450582))

(assert (=> start!69960 tp_is_empty!14103))

(declare-fun array_inv!17033 (array!44418) Bool)

(assert (=> start!69960 (array_inv!17033 _keys!976)))

(assert (=> start!69960 true))

(declare-fun array_inv!17034 (array!44420) Bool)

(assert (=> start!69960 (and (array_inv!17034 _values!788) e!450583)))

(assert (=> start!69960 tp!43891))

(assert (= (and start!69960 res!555591) b!813209))

(assert (= (and b!813209 res!555590) b!813211))

(assert (= (and b!813211 res!555588) b!813210))

(assert (= (and b!813210 res!555589) b!813208))

(assert (= (and b!813213 condMapEmpty!22732) mapIsEmpty!22732))

(assert (= (and b!813213 (not condMapEmpty!22732)) mapNonEmpty!22732))

(get-info :version)

(assert (= (and mapNonEmpty!22732 ((_ is ValueCellFull!6636) mapValue!22732)) b!813212))

(assert (= (and b!813213 ((_ is ValueCellFull!6636) mapDefault!22732)) b!813214))

(assert (= start!69960 b!813213))

(declare-fun m!755327 () Bool)

(assert (=> b!813208 m!755327))

(declare-fun m!755329 () Bool)

(assert (=> b!813210 m!755329))

(declare-fun m!755331 () Bool)

(assert (=> start!69960 m!755331))

(declare-fun m!755333 () Bool)

(assert (=> start!69960 m!755333))

(declare-fun m!755335 () Bool)

(assert (=> start!69960 m!755335))

(declare-fun m!755337 () Bool)

(assert (=> mapNonEmpty!22732 m!755337))

(declare-fun m!755339 () Bool)

(assert (=> b!813211 m!755339))

(check-sat (not start!69960) (not b!813208) tp_is_empty!14103 (not mapNonEmpty!22732) (not b!813210) (not b!813211) b_and!21161 (not b_next!12393))
(check-sat b_and!21161 (not b_next!12393))
