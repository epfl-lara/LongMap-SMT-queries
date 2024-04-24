; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39128 () Bool)

(assert start!39128)

(declare-fun b_free!9409 () Bool)

(declare-fun b_next!9409 () Bool)

(assert (=> start!39128 (= b_free!9409 (not b_next!9409))))

(declare-fun tp!33755 () Bool)

(declare-fun b_and!16809 () Bool)

(assert (=> start!39128 (= tp!33755 b_and!16809)))

(declare-fun b!411758 () Bool)

(declare-fun res!238983 () Bool)

(declare-fun e!246522 () Bool)

(assert (=> b!411758 (=> (not res!238983) (not e!246522))))

(declare-datatypes ((array!24984 0))(
  ( (array!24985 (arr!11941 (Array (_ BitVec 32) (_ BitVec 64))) (size!12293 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24984)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24984 (_ BitVec 32)) Bool)

(assert (=> b!411758 (= res!238983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411759 () Bool)

(declare-fun res!238990 () Bool)

(assert (=> b!411759 (=> (not res!238990) (not e!246522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411759 (= res!238990 (validMask!0 mask!1025))))

(declare-fun b!411760 () Bool)

(declare-fun e!246524 () Bool)

(declare-fun tp_is_empty!10561 () Bool)

(assert (=> b!411760 (= e!246524 tp_is_empty!10561)))

(declare-fun mapIsEmpty!17463 () Bool)

(declare-fun mapRes!17463 () Bool)

(assert (=> mapIsEmpty!17463 mapRes!17463))

(declare-fun b!411761 () Bool)

(declare-fun res!238992 () Bool)

(assert (=> b!411761 (=> (not res!238992) (not e!246522))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411761 (= res!238992 (validKeyInArray!0 k0!794))))

(declare-fun b!411762 () Bool)

(declare-fun e!246526 () Bool)

(assert (=> b!411762 (= e!246526 tp_is_empty!10561)))

(declare-fun b!411763 () Bool)

(declare-fun e!246523 () Bool)

(assert (=> b!411763 (= e!246523 (and e!246524 mapRes!17463))))

(declare-fun condMapEmpty!17463 () Bool)

(declare-datatypes ((V!15187 0))(
  ( (V!15188 (val!5325 Int)) )
))
(declare-datatypes ((ValueCell!4937 0))(
  ( (ValueCellFull!4937 (v!7573 V!15187)) (EmptyCell!4937) )
))
(declare-datatypes ((array!24986 0))(
  ( (array!24987 (arr!11942 (Array (_ BitVec 32) ValueCell!4937)) (size!12294 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24986)

(declare-fun mapDefault!17463 () ValueCell!4937)

(assert (=> b!411763 (= condMapEmpty!17463 (= (arr!11942 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4937)) mapDefault!17463)))))

(declare-fun b!411764 () Bool)

(declare-fun res!238986 () Bool)

(assert (=> b!411764 (=> (not res!238986) (not e!246522))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!411764 (= res!238986 (and (= (size!12294 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12293 _keys!709) (size!12294 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411765 () Bool)

(declare-fun res!238987 () Bool)

(assert (=> b!411765 (=> (not res!238987) (not e!246522))))

(declare-datatypes ((List!6798 0))(
  ( (Nil!6795) (Cons!6794 (h!7650 (_ BitVec 64)) (t!11964 List!6798)) )
))
(declare-fun arrayNoDuplicates!0 (array!24984 (_ BitVec 32) List!6798) Bool)

(assert (=> b!411765 (= res!238987 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6795))))

(declare-fun b!411766 () Bool)

(declare-fun res!238982 () Bool)

(declare-fun e!246525 () Bool)

(assert (=> b!411766 (=> (not res!238982) (not e!246525))))

(declare-fun lt!189374 () array!24984)

(assert (=> b!411766 (= res!238982 (arrayNoDuplicates!0 lt!189374 #b00000000000000000000000000000000 Nil!6795))))

(declare-fun mapNonEmpty!17463 () Bool)

(declare-fun tp!33756 () Bool)

(assert (=> mapNonEmpty!17463 (= mapRes!17463 (and tp!33756 e!246526))))

(declare-fun mapValue!17463 () ValueCell!4937)

(declare-fun mapRest!17463 () (Array (_ BitVec 32) ValueCell!4937))

(declare-fun mapKey!17463 () (_ BitVec 32))

(assert (=> mapNonEmpty!17463 (= (arr!11942 _values!549) (store mapRest!17463 mapKey!17463 mapValue!17463))))

(declare-fun b!411768 () Bool)

(assert (=> b!411768 (= e!246525 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15187)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6778 0))(
  ( (tuple2!6779 (_1!3400 (_ BitVec 64)) (_2!3400 V!15187)) )
))
(declare-datatypes ((List!6799 0))(
  ( (Nil!6796) (Cons!6795 (h!7651 tuple2!6778) (t!11965 List!6799)) )
))
(declare-datatypes ((ListLongMap!5693 0))(
  ( (ListLongMap!5694 (toList!2862 List!6799)) )
))
(declare-fun lt!189375 () ListLongMap!5693)

(declare-fun zeroValue!515 () V!15187)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15187)

(declare-fun getCurrentListMapNoExtraKeys!1114 (array!24984 array!24986 (_ BitVec 32) (_ BitVec 32) V!15187 V!15187 (_ BitVec 32) Int) ListLongMap!5693)

(assert (=> b!411768 (= lt!189375 (getCurrentListMapNoExtraKeys!1114 lt!189374 (array!24987 (store (arr!11942 _values!549) i!563 (ValueCellFull!4937 v!412)) (size!12294 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189373 () ListLongMap!5693)

(assert (=> b!411768 (= lt!189373 (getCurrentListMapNoExtraKeys!1114 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411769 () Bool)

(declare-fun res!238991 () Bool)

(assert (=> b!411769 (=> (not res!238991) (not e!246522))))

(assert (=> b!411769 (= res!238991 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12293 _keys!709))))))

(declare-fun b!411770 () Bool)

(declare-fun res!238988 () Bool)

(assert (=> b!411770 (=> (not res!238988) (not e!246522))))

(declare-fun arrayContainsKey!0 (array!24984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411770 (= res!238988 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411767 () Bool)

(declare-fun res!238989 () Bool)

(assert (=> b!411767 (=> (not res!238989) (not e!246525))))

(assert (=> b!411767 (= res!238989 (bvsle from!863 i!563))))

(declare-fun res!238981 () Bool)

(assert (=> start!39128 (=> (not res!238981) (not e!246522))))

(assert (=> start!39128 (= res!238981 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12293 _keys!709))))))

(assert (=> start!39128 e!246522))

(assert (=> start!39128 tp_is_empty!10561))

(assert (=> start!39128 tp!33755))

(assert (=> start!39128 true))

(declare-fun array_inv!8790 (array!24986) Bool)

(assert (=> start!39128 (and (array_inv!8790 _values!549) e!246523)))

(declare-fun array_inv!8791 (array!24984) Bool)

(assert (=> start!39128 (array_inv!8791 _keys!709)))

(declare-fun b!411771 () Bool)

(assert (=> b!411771 (= e!246522 e!246525)))

(declare-fun res!238984 () Bool)

(assert (=> b!411771 (=> (not res!238984) (not e!246525))))

(assert (=> b!411771 (= res!238984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189374 mask!1025))))

(assert (=> b!411771 (= lt!189374 (array!24985 (store (arr!11941 _keys!709) i!563 k0!794) (size!12293 _keys!709)))))

(declare-fun b!411772 () Bool)

(declare-fun res!238985 () Bool)

(assert (=> b!411772 (=> (not res!238985) (not e!246522))))

(assert (=> b!411772 (= res!238985 (or (= (select (arr!11941 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11941 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39128 res!238981) b!411759))

(assert (= (and b!411759 res!238990) b!411764))

(assert (= (and b!411764 res!238986) b!411758))

(assert (= (and b!411758 res!238983) b!411765))

(assert (= (and b!411765 res!238987) b!411769))

(assert (= (and b!411769 res!238991) b!411761))

(assert (= (and b!411761 res!238992) b!411772))

(assert (= (and b!411772 res!238985) b!411770))

(assert (= (and b!411770 res!238988) b!411771))

(assert (= (and b!411771 res!238984) b!411766))

(assert (= (and b!411766 res!238982) b!411767))

(assert (= (and b!411767 res!238989) b!411768))

(assert (= (and b!411763 condMapEmpty!17463) mapIsEmpty!17463))

(assert (= (and b!411763 (not condMapEmpty!17463)) mapNonEmpty!17463))

(get-info :version)

(assert (= (and mapNonEmpty!17463 ((_ is ValueCellFull!4937) mapValue!17463)) b!411762))

(assert (= (and b!411763 ((_ is ValueCellFull!4937) mapDefault!17463)) b!411760))

(assert (= start!39128 b!411763))

(declare-fun m!402063 () Bool)

(assert (=> b!411766 m!402063))

(declare-fun m!402065 () Bool)

(assert (=> start!39128 m!402065))

(declare-fun m!402067 () Bool)

(assert (=> start!39128 m!402067))

(declare-fun m!402069 () Bool)

(assert (=> b!411758 m!402069))

(declare-fun m!402071 () Bool)

(assert (=> b!411765 m!402071))

(declare-fun m!402073 () Bool)

(assert (=> b!411759 m!402073))

(declare-fun m!402075 () Bool)

(assert (=> b!411772 m!402075))

(declare-fun m!402077 () Bool)

(assert (=> b!411771 m!402077))

(declare-fun m!402079 () Bool)

(assert (=> b!411771 m!402079))

(declare-fun m!402081 () Bool)

(assert (=> mapNonEmpty!17463 m!402081))

(declare-fun m!402083 () Bool)

(assert (=> b!411768 m!402083))

(declare-fun m!402085 () Bool)

(assert (=> b!411768 m!402085))

(declare-fun m!402087 () Bool)

(assert (=> b!411768 m!402087))

(declare-fun m!402089 () Bool)

(assert (=> b!411770 m!402089))

(declare-fun m!402091 () Bool)

(assert (=> b!411761 m!402091))

(check-sat (not b_next!9409) tp_is_empty!10561 (not start!39128) (not b!411766) b_and!16809 (not b!411768) (not mapNonEmpty!17463) (not b!411765) (not b!411759) (not b!411758) (not b!411771) (not b!411761) (not b!411770))
(check-sat b_and!16809 (not b_next!9409))
