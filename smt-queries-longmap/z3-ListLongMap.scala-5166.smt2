; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69950 () Bool)

(assert start!69950)

(declare-fun b_free!12403 () Bool)

(declare-fun b_next!12403 () Bool)

(assert (=> start!69950 (= b_free!12403 (not b_next!12403))))

(declare-fun tp!43921 () Bool)

(declare-fun b_and!21145 () Bool)

(assert (=> start!69950 (= tp!43921 b_and!21145)))

(declare-fun b!813067 () Bool)

(declare-fun res!555545 () Bool)

(declare-fun e!450510 () Bool)

(assert (=> b!813067 (=> (not res!555545) (not e!450510))))

(declare-datatypes ((array!44435 0))(
  ( (array!44436 (arr!21279 (Array (_ BitVec 32) (_ BitVec 64))) (size!21700 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44435)

(declare-datatypes ((List!15174 0))(
  ( (Nil!15171) (Cons!15170 (h!16299 (_ BitVec 64)) (t!21480 List!15174)) )
))
(declare-fun arrayNoDuplicates!0 (array!44435 (_ BitVec 32) List!15174) Bool)

(assert (=> b!813067 (= res!555545 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15171))))

(declare-fun res!555543 () Bool)

(assert (=> start!69950 (=> (not res!555543) (not e!450510))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69950 (= res!555543 (validMask!0 mask!1312))))

(assert (=> start!69950 e!450510))

(declare-fun tp_is_empty!14113 () Bool)

(assert (=> start!69950 tp_is_empty!14113))

(declare-fun array_inv!17121 (array!44435) Bool)

(assert (=> start!69950 (array_inv!17121 _keys!976)))

(assert (=> start!69950 true))

(declare-datatypes ((V!23819 0))(
  ( (V!23820 (val!7104 Int)) )
))
(declare-datatypes ((ValueCell!6641 0))(
  ( (ValueCellFull!6641 (v!9525 V!23819)) (EmptyCell!6641) )
))
(declare-datatypes ((array!44437 0))(
  ( (array!44438 (arr!21280 (Array (_ BitVec 32) ValueCell!6641)) (size!21701 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44437)

(declare-fun e!450507 () Bool)

(declare-fun array_inv!17122 (array!44437) Bool)

(assert (=> start!69950 (and (array_inv!17122 _values!788) e!450507)))

(assert (=> start!69950 tp!43921))

(declare-fun mapNonEmpty!22747 () Bool)

(declare-fun mapRes!22747 () Bool)

(declare-fun tp!43920 () Bool)

(declare-fun e!450506 () Bool)

(assert (=> mapNonEmpty!22747 (= mapRes!22747 (and tp!43920 e!450506))))

(declare-fun mapKey!22747 () (_ BitVec 32))

(declare-fun mapValue!22747 () ValueCell!6641)

(declare-fun mapRest!22747 () (Array (_ BitVec 32) ValueCell!6641))

(assert (=> mapNonEmpty!22747 (= (arr!21280 _values!788) (store mapRest!22747 mapKey!22747 mapValue!22747))))

(declare-fun b!813068 () Bool)

(assert (=> b!813068 (= e!450506 tp_is_empty!14113)))

(declare-fun b!813069 () Bool)

(assert (=> b!813069 (= e!450510 false)))

(declare-fun zeroValueBefore!34 () V!23819)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23819)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9350 0))(
  ( (tuple2!9351 (_1!4686 (_ BitVec 64)) (_2!4686 V!23819)) )
))
(declare-datatypes ((List!15175 0))(
  ( (Nil!15172) (Cons!15171 (h!16300 tuple2!9350) (t!21481 List!15175)) )
))
(declare-datatypes ((ListLongMap!8163 0))(
  ( (ListLongMap!8164 (toList!4097 List!15175)) )
))
(declare-fun lt!364023 () ListLongMap!8163)

(declare-fun getCurrentListMapNoExtraKeys!2162 (array!44435 array!44437 (_ BitVec 32) (_ BitVec 32) V!23819 V!23819 (_ BitVec 32) Int) ListLongMap!8163)

(assert (=> b!813069 (= lt!364023 (getCurrentListMapNoExtraKeys!2162 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813070 () Bool)

(declare-fun e!450509 () Bool)

(assert (=> b!813070 (= e!450507 (and e!450509 mapRes!22747))))

(declare-fun condMapEmpty!22747 () Bool)

(declare-fun mapDefault!22747 () ValueCell!6641)

(assert (=> b!813070 (= condMapEmpty!22747 (= (arr!21280 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6641)) mapDefault!22747)))))

(declare-fun b!813071 () Bool)

(declare-fun res!555542 () Bool)

(assert (=> b!813071 (=> (not res!555542) (not e!450510))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813071 (= res!555542 (and (= (size!21701 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21700 _keys!976) (size!21701 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813072 () Bool)

(assert (=> b!813072 (= e!450509 tp_is_empty!14113)))

(declare-fun b!813073 () Bool)

(declare-fun res!555544 () Bool)

(assert (=> b!813073 (=> (not res!555544) (not e!450510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44435 (_ BitVec 32)) Bool)

(assert (=> b!813073 (= res!555544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22747 () Bool)

(assert (=> mapIsEmpty!22747 mapRes!22747))

(assert (= (and start!69950 res!555543) b!813071))

(assert (= (and b!813071 res!555542) b!813073))

(assert (= (and b!813073 res!555544) b!813067))

(assert (= (and b!813067 res!555545) b!813069))

(assert (= (and b!813070 condMapEmpty!22747) mapIsEmpty!22747))

(assert (= (and b!813070 (not condMapEmpty!22747)) mapNonEmpty!22747))

(get-info :version)

(assert (= (and mapNonEmpty!22747 ((_ is ValueCellFull!6641) mapValue!22747)) b!813068))

(assert (= (and b!813070 ((_ is ValueCellFull!6641) mapDefault!22747)) b!813072))

(assert (= start!69950 b!813070))

(declare-fun m!754645 () Bool)

(assert (=> start!69950 m!754645))

(declare-fun m!754647 () Bool)

(assert (=> start!69950 m!754647))

(declare-fun m!754649 () Bool)

(assert (=> start!69950 m!754649))

(declare-fun m!754651 () Bool)

(assert (=> b!813067 m!754651))

(declare-fun m!754653 () Bool)

(assert (=> b!813073 m!754653))

(declare-fun m!754655 () Bool)

(assert (=> mapNonEmpty!22747 m!754655))

(declare-fun m!754657 () Bool)

(assert (=> b!813069 m!754657))

(check-sat (not b!813073) (not mapNonEmpty!22747) (not b!813067) (not start!69950) (not b!813069) tp_is_empty!14113 b_and!21145 (not b_next!12403))
(check-sat b_and!21145 (not b_next!12403))
