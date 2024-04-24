; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71188 () Bool)

(assert start!71188)

(declare-fun b_free!13225 () Bool)

(declare-fun b_next!13225 () Bool)

(assert (=> start!71188 (= b_free!13225 (not b_next!13225))))

(declare-fun tp!46429 () Bool)

(declare-fun b_and!22139 () Bool)

(assert (=> start!71188 (= tp!46429 b_and!22139)))

(declare-fun b!825635 () Bool)

(declare-fun e!459489 () Bool)

(assert (=> b!825635 (= e!459489 true)))

(declare-datatypes ((V!24915 0))(
  ( (V!24916 (val!7515 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24915)

(declare-datatypes ((array!46059 0))(
  ( (array!46060 (arr!22072 (Array (_ BitVec 32) (_ BitVec 64))) (size!22492 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46059)

(declare-fun minValue!754 () V!24915)

(declare-datatypes ((ValueCell!7052 0))(
  ( (ValueCellFull!7052 (v!9948 V!24915)) (EmptyCell!7052) )
))
(declare-datatypes ((array!46061 0))(
  ( (array!46062 (arr!22073 (Array (_ BitVec 32) ValueCell!7052)) (size!22493 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46061)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((tuple2!9866 0))(
  ( (tuple2!9867 (_1!4944 (_ BitVec 64)) (_2!4944 V!24915)) )
))
(declare-datatypes ((List!15651 0))(
  ( (Nil!15648) (Cons!15647 (h!16782 tuple2!9866) (t!21986 List!15651)) )
))
(declare-datatypes ((ListLongMap!8691 0))(
  ( (ListLongMap!8692 (toList!4361 List!15651)) )
))
(declare-fun lt!372329 () ListLongMap!8691)

(declare-fun getCurrentListMap!2488 (array!46059 array!46061 (_ BitVec 32) (_ BitVec 32) V!24915 V!24915 (_ BitVec 32) Int) ListLongMap!8691)

(assert (=> b!825635 (= lt!372329 (getCurrentListMap!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825636 () Bool)

(declare-fun e!459490 () Bool)

(assert (=> b!825636 (= e!459490 (not e!459489))))

(declare-fun res!562618 () Bool)

(assert (=> b!825636 (=> res!562618 e!459489)))

(assert (=> b!825636 (= res!562618 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372331 () ListLongMap!8691)

(declare-fun lt!372332 () ListLongMap!8691)

(assert (=> b!825636 (= lt!372331 lt!372332)))

(declare-fun zeroValueAfter!34 () V!24915)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28273 0))(
  ( (Unit!28274) )
))
(declare-fun lt!372330 () Unit!28273)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!531 (array!46059 array!46061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24915 V!24915 V!24915 V!24915 (_ BitVec 32) Int) Unit!28273)

(assert (=> b!825636 (= lt!372330 (lemmaNoChangeToArrayThenSameMapNoExtras!531 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2443 (array!46059 array!46061 (_ BitVec 32) (_ BitVec 32) V!24915 V!24915 (_ BitVec 32) Int) ListLongMap!8691)

(assert (=> b!825636 (= lt!372332 (getCurrentListMapNoExtraKeys!2443 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825636 (= lt!372331 (getCurrentListMapNoExtraKeys!2443 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825637 () Bool)

(declare-fun e!459488 () Bool)

(declare-fun tp_is_empty!14935 () Bool)

(assert (=> b!825637 (= e!459488 tp_is_empty!14935)))

(declare-fun b!825638 () Bool)

(declare-fun res!562614 () Bool)

(assert (=> b!825638 (=> (not res!562614) (not e!459490))))

(declare-datatypes ((List!15652 0))(
  ( (Nil!15649) (Cons!15648 (h!16783 (_ BitVec 64)) (t!21987 List!15652)) )
))
(declare-fun arrayNoDuplicates!0 (array!46059 (_ BitVec 32) List!15652) Bool)

(assert (=> b!825638 (= res!562614 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15649))))

(declare-fun b!825639 () Bool)

(declare-fun res!562617 () Bool)

(assert (=> b!825639 (=> (not res!562617) (not e!459490))))

(assert (=> b!825639 (= res!562617 (and (= (size!22493 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22492 _keys!976) (size!22493 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24022 () Bool)

(declare-fun mapRes!24022 () Bool)

(assert (=> mapIsEmpty!24022 mapRes!24022))

(declare-fun b!825634 () Bool)

(declare-fun res!562615 () Bool)

(assert (=> b!825634 (=> (not res!562615) (not e!459490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46059 (_ BitVec 32)) Bool)

(assert (=> b!825634 (= res!562615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!562616 () Bool)

(assert (=> start!71188 (=> (not res!562616) (not e!459490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71188 (= res!562616 (validMask!0 mask!1312))))

(assert (=> start!71188 e!459490))

(assert (=> start!71188 tp_is_empty!14935))

(declare-fun array_inv!17643 (array!46059) Bool)

(assert (=> start!71188 (array_inv!17643 _keys!976)))

(assert (=> start!71188 true))

(declare-fun e!459492 () Bool)

(declare-fun array_inv!17644 (array!46061) Bool)

(assert (=> start!71188 (and (array_inv!17644 _values!788) e!459492)))

(assert (=> start!71188 tp!46429))

(declare-fun mapNonEmpty!24022 () Bool)

(declare-fun tp!46428 () Bool)

(assert (=> mapNonEmpty!24022 (= mapRes!24022 (and tp!46428 e!459488))))

(declare-fun mapKey!24022 () (_ BitVec 32))

(declare-fun mapValue!24022 () ValueCell!7052)

(declare-fun mapRest!24022 () (Array (_ BitVec 32) ValueCell!7052))

(assert (=> mapNonEmpty!24022 (= (arr!22073 _values!788) (store mapRest!24022 mapKey!24022 mapValue!24022))))

(declare-fun b!825640 () Bool)

(declare-fun e!459493 () Bool)

(assert (=> b!825640 (= e!459492 (and e!459493 mapRes!24022))))

(declare-fun condMapEmpty!24022 () Bool)

(declare-fun mapDefault!24022 () ValueCell!7052)

(assert (=> b!825640 (= condMapEmpty!24022 (= (arr!22073 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7052)) mapDefault!24022)))))

(declare-fun b!825641 () Bool)

(assert (=> b!825641 (= e!459493 tp_is_empty!14935)))

(assert (= (and start!71188 res!562616) b!825639))

(assert (= (and b!825639 res!562617) b!825634))

(assert (= (and b!825634 res!562615) b!825638))

(assert (= (and b!825638 res!562614) b!825636))

(assert (= (and b!825636 (not res!562618)) b!825635))

(assert (= (and b!825640 condMapEmpty!24022) mapIsEmpty!24022))

(assert (= (and b!825640 (not condMapEmpty!24022)) mapNonEmpty!24022))

(get-info :version)

(assert (= (and mapNonEmpty!24022 ((_ is ValueCellFull!7052) mapValue!24022)) b!825637))

(assert (= (and b!825640 ((_ is ValueCellFull!7052) mapDefault!24022)) b!825641))

(assert (= start!71188 b!825640))

(declare-fun m!768059 () Bool)

(assert (=> b!825634 m!768059))

(declare-fun m!768061 () Bool)

(assert (=> mapNonEmpty!24022 m!768061))

(declare-fun m!768063 () Bool)

(assert (=> b!825635 m!768063))

(declare-fun m!768065 () Bool)

(assert (=> start!71188 m!768065))

(declare-fun m!768067 () Bool)

(assert (=> start!71188 m!768067))

(declare-fun m!768069 () Bool)

(assert (=> start!71188 m!768069))

(declare-fun m!768071 () Bool)

(assert (=> b!825636 m!768071))

(declare-fun m!768073 () Bool)

(assert (=> b!825636 m!768073))

(declare-fun m!768075 () Bool)

(assert (=> b!825636 m!768075))

(declare-fun m!768077 () Bool)

(assert (=> b!825638 m!768077))

(check-sat (not b!825636) b_and!22139 (not mapNonEmpty!24022) tp_is_empty!14935 (not start!71188) (not b!825634) (not b_next!13225) (not b!825635) (not b!825638))
(check-sat b_and!22139 (not b_next!13225))
