; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20444 () Bool)

(assert start!20444)

(declare-fun b_free!5103 () Bool)

(declare-fun b_next!5103 () Bool)

(assert (=> start!20444 (= b_free!5103 (not b_next!5103))))

(declare-fun tp!18341 () Bool)

(declare-fun b_and!11849 () Bool)

(assert (=> start!20444 (= tp!18341 b_and!11849)))

(declare-fun res!97043 () Bool)

(declare-fun e!132634 () Bool)

(assert (=> start!20444 (=> (not res!97043) (not e!132634))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20444 (= res!97043 (validMask!0 mask!1149))))

(assert (=> start!20444 e!132634))

(declare-datatypes ((V!6259 0))(
  ( (V!6260 (val!2524 Int)) )
))
(declare-datatypes ((ValueCell!2136 0))(
  ( (ValueCellFull!2136 (v!4494 V!6259)) (EmptyCell!2136) )
))
(declare-datatypes ((array!9143 0))(
  ( (array!9144 (arr!4322 (Array (_ BitVec 32) ValueCell!2136)) (size!4647 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9143)

(declare-fun e!132629 () Bool)

(declare-fun array_inv!2853 (array!9143) Bool)

(assert (=> start!20444 (and (array_inv!2853 _values!649) e!132629)))

(assert (=> start!20444 true))

(declare-fun tp_is_empty!4959 () Bool)

(assert (=> start!20444 tp_is_empty!4959))

(declare-datatypes ((array!9145 0))(
  ( (array!9146 (arr!4323 (Array (_ BitVec 32) (_ BitVec 64))) (size!4648 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9145)

(declare-fun array_inv!2854 (array!9145) Bool)

(assert (=> start!20444 (array_inv!2854 _keys!825)))

(assert (=> start!20444 tp!18341))

(declare-fun b!202491 () Bool)

(declare-fun e!132635 () Bool)

(assert (=> b!202491 (= e!132635 tp_is_empty!4959)))

(declare-fun b!202492 () Bool)

(declare-fun res!97048 () Bool)

(assert (=> b!202492 (=> (not res!97048) (not e!132634))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202492 (= res!97048 (= (select (arr!4323 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8507 () Bool)

(declare-fun mapRes!8507 () Bool)

(assert (=> mapIsEmpty!8507 mapRes!8507))

(declare-fun b!202493 () Bool)

(declare-fun res!97044 () Bool)

(assert (=> b!202493 (=> (not res!97044) (not e!132634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202493 (= res!97044 (validKeyInArray!0 k0!843))))

(declare-fun b!202494 () Bool)

(declare-fun e!132632 () Bool)

(declare-fun e!132633 () Bool)

(assert (=> b!202494 (= e!132632 e!132633)))

(declare-fun res!97047 () Bool)

(assert (=> b!202494 (=> res!97047 e!132633)))

(assert (=> b!202494 (= res!97047 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3828 0))(
  ( (tuple2!3829 (_1!1925 (_ BitVec 64)) (_2!1925 V!6259)) )
))
(declare-datatypes ((List!2732 0))(
  ( (Nil!2729) (Cons!2728 (h!3370 tuple2!3828) (t!7663 List!2732)) )
))
(declare-datatypes ((ListLongMap!2741 0))(
  ( (ListLongMap!2742 (toList!1386 List!2732)) )
))
(declare-fun lt!101671 () ListLongMap!2741)

(declare-fun lt!101677 () ListLongMap!2741)

(assert (=> b!202494 (= lt!101671 lt!101677)))

(declare-fun lt!101669 () ListLongMap!2741)

(declare-fun lt!101679 () tuple2!3828)

(declare-fun +!413 (ListLongMap!2741 tuple2!3828) ListLongMap!2741)

(assert (=> b!202494 (= lt!101677 (+!413 lt!101669 lt!101679))))

(declare-fun lt!101673 () ListLongMap!2741)

(declare-fun lt!101675 () ListLongMap!2741)

(assert (=> b!202494 (= lt!101673 lt!101675)))

(declare-fun lt!101676 () ListLongMap!2741)

(assert (=> b!202494 (= lt!101675 (+!413 lt!101676 lt!101679))))

(declare-fun lt!101668 () ListLongMap!2741)

(assert (=> b!202494 (= lt!101671 (+!413 lt!101668 lt!101679))))

(declare-fun zeroValue!615 () V!6259)

(assert (=> b!202494 (= lt!101679 (tuple2!3829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202495 () Bool)

(declare-fun res!97050 () Bool)

(assert (=> b!202495 (=> (not res!97050) (not e!132634))))

(declare-datatypes ((List!2733 0))(
  ( (Nil!2730) (Cons!2729 (h!3371 (_ BitVec 64)) (t!7664 List!2733)) )
))
(declare-fun arrayNoDuplicates!0 (array!9145 (_ BitVec 32) List!2733) Bool)

(assert (=> b!202495 (= res!97050 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2730))))

(declare-fun b!202496 () Bool)

(declare-fun res!97049 () Bool)

(assert (=> b!202496 (=> (not res!97049) (not e!132634))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202496 (= res!97049 (and (= (size!4647 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4648 _keys!825) (size!4647 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202497 () Bool)

(assert (=> b!202497 (= e!132633 true)))

(declare-fun lt!101678 () tuple2!3828)

(assert (=> b!202497 (= lt!101677 (+!413 lt!101675 lt!101678))))

(declare-fun v!520 () V!6259)

(declare-datatypes ((Unit!6122 0))(
  ( (Unit!6123) )
))
(declare-fun lt!101672 () Unit!6122)

(declare-fun addCommutativeForDiffKeys!130 (ListLongMap!2741 (_ BitVec 64) V!6259 (_ BitVec 64) V!6259) Unit!6122)

(assert (=> b!202497 (= lt!101672 (addCommutativeForDiffKeys!130 lt!101676 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202498 () Bool)

(declare-fun e!132631 () Bool)

(assert (=> b!202498 (= e!132631 tp_is_empty!4959)))

(declare-fun b!202499 () Bool)

(assert (=> b!202499 (= e!132629 (and e!132635 mapRes!8507))))

(declare-fun condMapEmpty!8507 () Bool)

(declare-fun mapDefault!8507 () ValueCell!2136)

(assert (=> b!202499 (= condMapEmpty!8507 (= (arr!4322 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2136)) mapDefault!8507)))))

(declare-fun b!202500 () Bool)

(declare-fun res!97045 () Bool)

(assert (=> b!202500 (=> (not res!97045) (not e!132634))))

(assert (=> b!202500 (= res!97045 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4648 _keys!825))))))

(declare-fun mapNonEmpty!8507 () Bool)

(declare-fun tp!18340 () Bool)

(assert (=> mapNonEmpty!8507 (= mapRes!8507 (and tp!18340 e!132631))))

(declare-fun mapKey!8507 () (_ BitVec 32))

(declare-fun mapValue!8507 () ValueCell!2136)

(declare-fun mapRest!8507 () (Array (_ BitVec 32) ValueCell!2136))

(assert (=> mapNonEmpty!8507 (= (arr!4322 _values!649) (store mapRest!8507 mapKey!8507 mapValue!8507))))

(declare-fun b!202501 () Bool)

(assert (=> b!202501 (= e!132634 (not e!132632))))

(declare-fun res!97046 () Bool)

(assert (=> b!202501 (=> res!97046 e!132632)))

(assert (=> b!202501 (= res!97046 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6259)

(declare-fun getCurrentListMap!967 (array!9145 array!9143 (_ BitVec 32) (_ BitVec 32) V!6259 V!6259 (_ BitVec 32) Int) ListLongMap!2741)

(assert (=> b!202501 (= lt!101673 (getCurrentListMap!967 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101670 () array!9143)

(assert (=> b!202501 (= lt!101671 (getCurrentListMap!967 _keys!825 lt!101670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202501 (and (= lt!101668 lt!101669) (= lt!101669 lt!101668))))

(assert (=> b!202501 (= lt!101669 (+!413 lt!101676 lt!101678))))

(assert (=> b!202501 (= lt!101678 (tuple2!3829 k0!843 v!520))))

(declare-fun lt!101674 () Unit!6122)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!80 (array!9145 array!9143 (_ BitVec 32) (_ BitVec 32) V!6259 V!6259 (_ BitVec 32) (_ BitVec 64) V!6259 (_ BitVec 32) Int) Unit!6122)

(assert (=> b!202501 (= lt!101674 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!80 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!341 (array!9145 array!9143 (_ BitVec 32) (_ BitVec 32) V!6259 V!6259 (_ BitVec 32) Int) ListLongMap!2741)

(assert (=> b!202501 (= lt!101668 (getCurrentListMapNoExtraKeys!341 _keys!825 lt!101670 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202501 (= lt!101670 (array!9144 (store (arr!4322 _values!649) i!601 (ValueCellFull!2136 v!520)) (size!4647 _values!649)))))

(assert (=> b!202501 (= lt!101676 (getCurrentListMapNoExtraKeys!341 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202502 () Bool)

(declare-fun res!97051 () Bool)

(assert (=> b!202502 (=> (not res!97051) (not e!132634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9145 (_ BitVec 32)) Bool)

(assert (=> b!202502 (= res!97051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20444 res!97043) b!202496))

(assert (= (and b!202496 res!97049) b!202502))

(assert (= (and b!202502 res!97051) b!202495))

(assert (= (and b!202495 res!97050) b!202500))

(assert (= (and b!202500 res!97045) b!202493))

(assert (= (and b!202493 res!97044) b!202492))

(assert (= (and b!202492 res!97048) b!202501))

(assert (= (and b!202501 (not res!97046)) b!202494))

(assert (= (and b!202494 (not res!97047)) b!202497))

(assert (= (and b!202499 condMapEmpty!8507) mapIsEmpty!8507))

(assert (= (and b!202499 (not condMapEmpty!8507)) mapNonEmpty!8507))

(get-info :version)

(assert (= (and mapNonEmpty!8507 ((_ is ValueCellFull!2136) mapValue!8507)) b!202498))

(assert (= (and b!202499 ((_ is ValueCellFull!2136) mapDefault!8507)) b!202491))

(assert (= start!20444 b!202499))

(declare-fun m!229811 () Bool)

(assert (=> start!20444 m!229811))

(declare-fun m!229813 () Bool)

(assert (=> start!20444 m!229813))

(declare-fun m!229815 () Bool)

(assert (=> start!20444 m!229815))

(declare-fun m!229817 () Bool)

(assert (=> b!202495 m!229817))

(declare-fun m!229819 () Bool)

(assert (=> b!202497 m!229819))

(declare-fun m!229821 () Bool)

(assert (=> b!202497 m!229821))

(declare-fun m!229823 () Bool)

(assert (=> b!202492 m!229823))

(declare-fun m!229825 () Bool)

(assert (=> b!202493 m!229825))

(declare-fun m!229827 () Bool)

(assert (=> b!202494 m!229827))

(declare-fun m!229829 () Bool)

(assert (=> b!202494 m!229829))

(declare-fun m!229831 () Bool)

(assert (=> b!202494 m!229831))

(declare-fun m!229833 () Bool)

(assert (=> b!202501 m!229833))

(declare-fun m!229835 () Bool)

(assert (=> b!202501 m!229835))

(declare-fun m!229837 () Bool)

(assert (=> b!202501 m!229837))

(declare-fun m!229839 () Bool)

(assert (=> b!202501 m!229839))

(declare-fun m!229841 () Bool)

(assert (=> b!202501 m!229841))

(declare-fun m!229843 () Bool)

(assert (=> b!202501 m!229843))

(declare-fun m!229845 () Bool)

(assert (=> b!202501 m!229845))

(declare-fun m!229847 () Bool)

(assert (=> b!202502 m!229847))

(declare-fun m!229849 () Bool)

(assert (=> mapNonEmpty!8507 m!229849))

(check-sat (not b_next!5103) (not b!202493) (not b!202497) (not start!20444) (not b!202502) (not b!202501) (not mapNonEmpty!8507) tp_is_empty!4959 b_and!11849 (not b!202494) (not b!202495))
(check-sat b_and!11849 (not b_next!5103))
