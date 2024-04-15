; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70010 () Bool)

(assert start!70010)

(declare-fun b_free!12451 () Bool)

(declare-fun b_next!12451 () Bool)

(assert (=> start!70010 (= b_free!12451 (not b_next!12451))))

(declare-fun tp!44068 () Bool)

(declare-fun b_and!21197 () Bool)

(assert (=> start!70010 (= tp!44068 b_and!21197)))

(declare-fun b!813644 () Bool)

(declare-fun res!555860 () Bool)

(declare-fun e!450917 () Bool)

(assert (=> b!813644 (=> (not res!555860) (not e!450917))))

(declare-datatypes ((array!44525 0))(
  ( (array!44526 (arr!21323 (Array (_ BitVec 32) (_ BitVec 64))) (size!21744 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44525)

(declare-datatypes ((List!15203 0))(
  ( (Nil!15200) (Cons!15199 (h!16328 (_ BitVec 64)) (t!21511 List!15203)) )
))
(declare-fun arrayNoDuplicates!0 (array!44525 (_ BitVec 32) List!15203) Bool)

(assert (=> b!813644 (= res!555860 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15200))))

(declare-fun b!813645 () Bool)

(declare-fun e!450914 () Bool)

(declare-fun tp_is_empty!14161 () Bool)

(assert (=> b!813645 (= e!450914 tp_is_empty!14161)))

(declare-fun b!813646 () Bool)

(declare-fun e!450916 () Bool)

(declare-fun e!450915 () Bool)

(declare-fun mapRes!22822 () Bool)

(assert (=> b!813646 (= e!450916 (and e!450915 mapRes!22822))))

(declare-fun condMapEmpty!22822 () Bool)

(declare-datatypes ((V!23883 0))(
  ( (V!23884 (val!7128 Int)) )
))
(declare-datatypes ((ValueCell!6665 0))(
  ( (ValueCellFull!6665 (v!9549 V!23883)) (EmptyCell!6665) )
))
(declare-datatypes ((array!44527 0))(
  ( (array!44528 (arr!21324 (Array (_ BitVec 32) ValueCell!6665)) (size!21745 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44527)

(declare-fun mapDefault!22822 () ValueCell!6665)

(assert (=> b!813646 (= condMapEmpty!22822 (= (arr!21324 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6665)) mapDefault!22822)))))

(declare-fun b!813647 () Bool)

(declare-fun res!555858 () Bool)

(assert (=> b!813647 (=> (not res!555858) (not e!450917))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44525 (_ BitVec 32)) Bool)

(assert (=> b!813647 (= res!555858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813648 () Bool)

(assert (=> b!813648 (= e!450917 false)))

(declare-fun zeroValueAfter!34 () V!23883)

(declare-fun minValue!754 () V!23883)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9376 0))(
  ( (tuple2!9377 (_1!4699 (_ BitVec 64)) (_2!4699 V!23883)) )
))
(declare-datatypes ((List!15204 0))(
  ( (Nil!15201) (Cons!15200 (h!16329 tuple2!9376) (t!21512 List!15204)) )
))
(declare-datatypes ((ListLongMap!8189 0))(
  ( (ListLongMap!8190 (toList!4110 List!15204)) )
))
(declare-fun lt!364181 () ListLongMap!8189)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2175 (array!44525 array!44527 (_ BitVec 32) (_ BitVec 32) V!23883 V!23883 (_ BitVec 32) Int) ListLongMap!8189)

(assert (=> b!813648 (= lt!364181 (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23883)

(declare-fun lt!364182 () ListLongMap!8189)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!813648 (= lt!364182 (getCurrentListMapNoExtraKeys!2175 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22822 () Bool)

(declare-fun tp!44067 () Bool)

(assert (=> mapNonEmpty!22822 (= mapRes!22822 (and tp!44067 e!450914))))

(declare-fun mapKey!22822 () (_ BitVec 32))

(declare-fun mapValue!22822 () ValueCell!6665)

(declare-fun mapRest!22822 () (Array (_ BitVec 32) ValueCell!6665))

(assert (=> mapNonEmpty!22822 (= (arr!21324 _values!788) (store mapRest!22822 mapKey!22822 mapValue!22822))))

(declare-fun b!813649 () Bool)

(assert (=> b!813649 (= e!450915 tp_is_empty!14161)))

(declare-fun res!555859 () Bool)

(assert (=> start!70010 (=> (not res!555859) (not e!450917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70010 (= res!555859 (validMask!0 mask!1312))))

(assert (=> start!70010 e!450917))

(assert (=> start!70010 tp_is_empty!14161))

(declare-fun array_inv!17153 (array!44525) Bool)

(assert (=> start!70010 (array_inv!17153 _keys!976)))

(assert (=> start!70010 true))

(declare-fun array_inv!17154 (array!44527) Bool)

(assert (=> start!70010 (and (array_inv!17154 _values!788) e!450916)))

(assert (=> start!70010 tp!44068))

(declare-fun b!813650 () Bool)

(declare-fun res!555857 () Bool)

(assert (=> b!813650 (=> (not res!555857) (not e!450917))))

(assert (=> b!813650 (= res!555857 (and (= (size!21745 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21744 _keys!976) (size!21745 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22822 () Bool)

(assert (=> mapIsEmpty!22822 mapRes!22822))

(assert (= (and start!70010 res!555859) b!813650))

(assert (= (and b!813650 res!555857) b!813647))

(assert (= (and b!813647 res!555858) b!813644))

(assert (= (and b!813644 res!555860) b!813648))

(assert (= (and b!813646 condMapEmpty!22822) mapIsEmpty!22822))

(assert (= (and b!813646 (not condMapEmpty!22822)) mapNonEmpty!22822))

(get-info :version)

(assert (= (and mapNonEmpty!22822 ((_ is ValueCellFull!6665) mapValue!22822)) b!813645))

(assert (= (and b!813646 ((_ is ValueCellFull!6665) mapDefault!22822)) b!813649))

(assert (= start!70010 b!813646))

(declare-fun m!755061 () Bool)

(assert (=> b!813644 m!755061))

(declare-fun m!755063 () Bool)

(assert (=> b!813647 m!755063))

(declare-fun m!755065 () Bool)

(assert (=> start!70010 m!755065))

(declare-fun m!755067 () Bool)

(assert (=> start!70010 m!755067))

(declare-fun m!755069 () Bool)

(assert (=> start!70010 m!755069))

(declare-fun m!755071 () Bool)

(assert (=> mapNonEmpty!22822 m!755071))

(declare-fun m!755073 () Bool)

(assert (=> b!813648 m!755073))

(declare-fun m!755075 () Bool)

(assert (=> b!813648 m!755075))

(check-sat (not b!813644) (not b!813647) (not b!813648) (not mapNonEmpty!22822) tp_is_empty!14161 (not start!70010) (not b_next!12451) b_and!21197)
(check-sat b_and!21197 (not b_next!12451))
