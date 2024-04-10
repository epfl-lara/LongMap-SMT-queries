; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70002 () Bool)

(assert start!70002)

(declare-fun b_free!12423 () Bool)

(declare-fun b_next!12423 () Bool)

(assert (=> start!70002 (= b_free!12423 (not b_next!12423))))

(declare-fun tp!43984 () Bool)

(declare-fun b_and!21195 () Bool)

(assert (=> start!70002 (= tp!43984 b_and!21195)))

(declare-fun b!813596 () Bool)

(declare-fun e!450857 () Bool)

(declare-fun tp_is_empty!14133 () Bool)

(assert (=> b!813596 (= e!450857 tp_is_empty!14133)))

(declare-fun res!555798 () Bool)

(declare-fun e!450856 () Bool)

(assert (=> start!70002 (=> (not res!555798) (not e!450856))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70002 (= res!555798 (validMask!0 mask!1312))))

(assert (=> start!70002 e!450856))

(assert (=> start!70002 tp_is_empty!14133))

(declare-datatypes ((array!44474 0))(
  ( (array!44475 (arr!21297 (Array (_ BitVec 32) (_ BitVec 64))) (size!21718 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44474)

(declare-fun array_inv!17057 (array!44474) Bool)

(assert (=> start!70002 (array_inv!17057 _keys!976)))

(assert (=> start!70002 true))

(declare-datatypes ((V!23845 0))(
  ( (V!23846 (val!7114 Int)) )
))
(declare-datatypes ((ValueCell!6651 0))(
  ( (ValueCellFull!6651 (v!9541 V!23845)) (EmptyCell!6651) )
))
(declare-datatypes ((array!44476 0))(
  ( (array!44477 (arr!21298 (Array (_ BitVec 32) ValueCell!6651)) (size!21719 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44476)

(declare-fun e!450855 () Bool)

(declare-fun array_inv!17058 (array!44476) Bool)

(assert (=> start!70002 (and (array_inv!17058 _values!788) e!450855)))

(assert (=> start!70002 tp!43984))

(declare-fun b!813597 () Bool)

(declare-fun res!555796 () Bool)

(assert (=> b!813597 (=> (not res!555796) (not e!450856))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813597 (= res!555796 (and (= (size!21719 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21718 _keys!976) (size!21719 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813598 () Bool)

(assert (=> b!813598 (= e!450856 false)))

(declare-fun zeroValueAfter!34 () V!23845)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9316 0))(
  ( (tuple2!9317 (_1!4669 (_ BitVec 64)) (_2!4669 V!23845)) )
))
(declare-datatypes ((List!15148 0))(
  ( (Nil!15145) (Cons!15144 (h!16273 tuple2!9316) (t!21465 List!15148)) )
))
(declare-datatypes ((ListLongMap!8139 0))(
  ( (ListLongMap!8140 (toList!4085 List!15148)) )
))
(declare-fun lt!364341 () ListLongMap!8139)

(declare-fun minValue!754 () V!23845)

(declare-fun getCurrentListMapNoExtraKeys!2135 (array!44474 array!44476 (_ BitVec 32) (_ BitVec 32) V!23845 V!23845 (_ BitVec 32) Int) ListLongMap!8139)

(assert (=> b!813598 (= lt!364341 (getCurrentListMapNoExtraKeys!2135 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23845)

(declare-fun lt!364340 () ListLongMap!8139)

(assert (=> b!813598 (= lt!364340 (getCurrentListMapNoExtraKeys!2135 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813599 () Bool)

(declare-fun e!450854 () Bool)

(declare-fun mapRes!22780 () Bool)

(assert (=> b!813599 (= e!450855 (and e!450854 mapRes!22780))))

(declare-fun condMapEmpty!22780 () Bool)

(declare-fun mapDefault!22780 () ValueCell!6651)

(assert (=> b!813599 (= condMapEmpty!22780 (= (arr!21298 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6651)) mapDefault!22780)))))

(declare-fun mapNonEmpty!22780 () Bool)

(declare-fun tp!43983 () Bool)

(assert (=> mapNonEmpty!22780 (= mapRes!22780 (and tp!43983 e!450857))))

(declare-fun mapValue!22780 () ValueCell!6651)

(declare-fun mapRest!22780 () (Array (_ BitVec 32) ValueCell!6651))

(declare-fun mapKey!22780 () (_ BitVec 32))

(assert (=> mapNonEmpty!22780 (= (arr!21298 _values!788) (store mapRest!22780 mapKey!22780 mapValue!22780))))

(declare-fun b!813600 () Bool)

(declare-fun res!555795 () Bool)

(assert (=> b!813600 (=> (not res!555795) (not e!450856))))

(declare-datatypes ((List!15149 0))(
  ( (Nil!15146) (Cons!15145 (h!16274 (_ BitVec 64)) (t!21466 List!15149)) )
))
(declare-fun arrayNoDuplicates!0 (array!44474 (_ BitVec 32) List!15149) Bool)

(assert (=> b!813600 (= res!555795 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15146))))

(declare-fun b!813601 () Bool)

(assert (=> b!813601 (= e!450854 tp_is_empty!14133)))

(declare-fun b!813602 () Bool)

(declare-fun res!555797 () Bool)

(assert (=> b!813602 (=> (not res!555797) (not e!450856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44474 (_ BitVec 32)) Bool)

(assert (=> b!813602 (= res!555797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22780 () Bool)

(assert (=> mapIsEmpty!22780 mapRes!22780))

(assert (= (and start!70002 res!555798) b!813597))

(assert (= (and b!813597 res!555796) b!813602))

(assert (= (and b!813602 res!555797) b!813600))

(assert (= (and b!813600 res!555795) b!813598))

(assert (= (and b!813599 condMapEmpty!22780) mapIsEmpty!22780))

(assert (= (and b!813599 (not condMapEmpty!22780)) mapNonEmpty!22780))

(get-info :version)

(assert (= (and mapNonEmpty!22780 ((_ is ValueCellFull!6651) mapValue!22780)) b!813596))

(assert (= (and b!813599 ((_ is ValueCellFull!6651) mapDefault!22780)) b!813601))

(assert (= start!70002 b!813599))

(declare-fun m!755589 () Bool)

(assert (=> b!813598 m!755589))

(declare-fun m!755591 () Bool)

(assert (=> b!813598 m!755591))

(declare-fun m!755593 () Bool)

(assert (=> b!813600 m!755593))

(declare-fun m!755595 () Bool)

(assert (=> mapNonEmpty!22780 m!755595))

(declare-fun m!755597 () Bool)

(assert (=> b!813602 m!755597))

(declare-fun m!755599 () Bool)

(assert (=> start!70002 m!755599))

(declare-fun m!755601 () Bool)

(assert (=> start!70002 m!755601))

(declare-fun m!755603 () Bool)

(assert (=> start!70002 m!755603))

(check-sat b_and!21195 (not start!70002) (not mapNonEmpty!22780) tp_is_empty!14133 (not b!813600) (not b!813598) (not b_next!12423) (not b!813602))
(check-sat b_and!21195 (not b_next!12423))
