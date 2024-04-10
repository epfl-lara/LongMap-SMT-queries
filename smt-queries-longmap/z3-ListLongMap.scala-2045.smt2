; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35440 () Bool)

(assert start!35440)

(declare-fun b_free!7827 () Bool)

(declare-fun b_next!7827 () Bool)

(assert (=> start!35440 (= b_free!7827 (not b_next!7827))))

(declare-fun tp!27267 () Bool)

(declare-fun b_and!15069 () Bool)

(assert (=> start!35440 (= tp!27267 b_and!15069)))

(declare-fun b!354884 () Bool)

(declare-fun e!217496 () Bool)

(declare-fun tp_is_empty!7893 () Bool)

(assert (=> b!354884 (= e!217496 tp_is_empty!7893)))

(declare-fun res!196770 () Bool)

(declare-fun e!217492 () Bool)

(assert (=> start!35440 (=> (not res!196770) (not e!217492))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35440 (= res!196770 (validMask!0 mask!1842))))

(assert (=> start!35440 e!217492))

(assert (=> start!35440 tp_is_empty!7893))

(assert (=> start!35440 true))

(assert (=> start!35440 tp!27267))

(declare-datatypes ((array!19367 0))(
  ( (array!19368 (arr!9177 (Array (_ BitVec 32) (_ BitVec 64))) (size!9529 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19367)

(declare-fun array_inv!6746 (array!19367) Bool)

(assert (=> start!35440 (array_inv!6746 _keys!1456)))

(declare-datatypes ((V!11501 0))(
  ( (V!11502 (val!3991 Int)) )
))
(declare-datatypes ((ValueCell!3603 0))(
  ( (ValueCellFull!3603 (v!6185 V!11501)) (EmptyCell!3603) )
))
(declare-datatypes ((array!19369 0))(
  ( (array!19370 (arr!9178 (Array (_ BitVec 32) ValueCell!3603)) (size!9530 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19369)

(declare-fun e!217493 () Bool)

(declare-fun array_inv!6747 (array!19369) Bool)

(assert (=> start!35440 (and (array_inv!6747 _values!1208) e!217493)))

(declare-fun mapIsEmpty!13347 () Bool)

(declare-fun mapRes!13347 () Bool)

(assert (=> mapIsEmpty!13347 mapRes!13347))

(declare-fun b!354885 () Bool)

(assert (=> b!354885 (= e!217492 (not true))))

(declare-fun minValue!1150 () V!11501)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11501)

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5672 0))(
  ( (tuple2!5673 (_1!2847 (_ BitVec 64)) (_2!2847 V!11501)) )
))
(declare-datatypes ((List!5315 0))(
  ( (Nil!5312) (Cons!5311 (h!6167 tuple2!5672) (t!10465 List!5315)) )
))
(declare-datatypes ((ListLongMap!4585 0))(
  ( (ListLongMap!4586 (toList!2308 List!5315)) )
))
(declare-fun contains!2388 (ListLongMap!4585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1829 (array!19367 array!19369 (_ BitVec 32) (_ BitVec 32) V!11501 V!11501 (_ BitVec 32) Int) ListLongMap!4585)

(assert (=> b!354885 (contains!2388 (getCurrentListMap!1829 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9177 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10938 0))(
  ( (Unit!10939) )
))
(declare-fun lt!165755 () Unit!10938)

(declare-fun lemmaValidKeyInArrayIsInListMap!186 (array!19367 array!19369 (_ BitVec 32) (_ BitVec 32) V!11501 V!11501 (_ BitVec 32) Int) Unit!10938)

(assert (=> b!354885 (= lt!165755 (lemmaValidKeyInArrayIsInListMap!186 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354886 () Bool)

(declare-fun res!196775 () Bool)

(assert (=> b!354886 (=> (not res!196775) (not e!217492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354886 (= res!196775 (validKeyInArray!0 (select (arr!9177 _keys!1456) from!1805)))))

(declare-fun b!354887 () Bool)

(declare-fun res!196771 () Bool)

(assert (=> b!354887 (=> (not res!196771) (not e!217492))))

(assert (=> b!354887 (= res!196771 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9529 _keys!1456))))))

(declare-fun b!354888 () Bool)

(declare-fun res!196776 () Bool)

(assert (=> b!354888 (=> (not res!196776) (not e!217492))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!354888 (= res!196776 (= (select (arr!9177 _keys!1456) from!1805) k0!1077))))

(declare-fun b!354889 () Bool)

(declare-fun res!196773 () Bool)

(assert (=> b!354889 (=> (not res!196773) (not e!217492))))

(declare-datatypes ((List!5316 0))(
  ( (Nil!5313) (Cons!5312 (h!6168 (_ BitVec 64)) (t!10466 List!5316)) )
))
(declare-fun arrayNoDuplicates!0 (array!19367 (_ BitVec 32) List!5316) Bool)

(assert (=> b!354889 (= res!196773 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5313))))

(declare-fun mapNonEmpty!13347 () Bool)

(declare-fun tp!27266 () Bool)

(assert (=> mapNonEmpty!13347 (= mapRes!13347 (and tp!27266 e!217496))))

(declare-fun mapValue!13347 () ValueCell!3603)

(declare-fun mapKey!13347 () (_ BitVec 32))

(declare-fun mapRest!13347 () (Array (_ BitVec 32) ValueCell!3603))

(assert (=> mapNonEmpty!13347 (= (arr!9178 _values!1208) (store mapRest!13347 mapKey!13347 mapValue!13347))))

(declare-fun b!354890 () Bool)

(declare-fun res!196769 () Bool)

(assert (=> b!354890 (=> (not res!196769) (not e!217492))))

(assert (=> b!354890 (= res!196769 (validKeyInArray!0 k0!1077))))

(declare-fun b!354891 () Bool)

(declare-fun res!196774 () Bool)

(assert (=> b!354891 (=> (not res!196774) (not e!217492))))

(assert (=> b!354891 (= res!196774 (and (= (size!9530 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9529 _keys!1456) (size!9530 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354892 () Bool)

(declare-fun res!196772 () Bool)

(assert (=> b!354892 (=> (not res!196772) (not e!217492))))

(declare-fun arrayContainsKey!0 (array!19367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354892 (= res!196772 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354893 () Bool)

(declare-fun e!217494 () Bool)

(assert (=> b!354893 (= e!217493 (and e!217494 mapRes!13347))))

(declare-fun condMapEmpty!13347 () Bool)

(declare-fun mapDefault!13347 () ValueCell!3603)

(assert (=> b!354893 (= condMapEmpty!13347 (= (arr!9178 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3603)) mapDefault!13347)))))

(declare-fun b!354894 () Bool)

(declare-fun res!196777 () Bool)

(assert (=> b!354894 (=> (not res!196777) (not e!217492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19367 (_ BitVec 32)) Bool)

(assert (=> b!354894 (= res!196777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354895 () Bool)

(assert (=> b!354895 (= e!217494 tp_is_empty!7893)))

(assert (= (and start!35440 res!196770) b!354891))

(assert (= (and b!354891 res!196774) b!354894))

(assert (= (and b!354894 res!196777) b!354889))

(assert (= (and b!354889 res!196773) b!354890))

(assert (= (and b!354890 res!196769) b!354887))

(assert (= (and b!354887 res!196771) b!354892))

(assert (= (and b!354892 res!196772) b!354888))

(assert (= (and b!354888 res!196776) b!354886))

(assert (= (and b!354886 res!196775) b!354885))

(assert (= (and b!354893 condMapEmpty!13347) mapIsEmpty!13347))

(assert (= (and b!354893 (not condMapEmpty!13347)) mapNonEmpty!13347))

(get-info :version)

(assert (= (and mapNonEmpty!13347 ((_ is ValueCellFull!3603) mapValue!13347)) b!354884))

(assert (= (and b!354893 ((_ is ValueCellFull!3603) mapDefault!13347)) b!354895))

(assert (= start!35440 b!354893))

(declare-fun m!353757 () Bool)

(assert (=> b!354890 m!353757))

(declare-fun m!353759 () Bool)

(assert (=> b!354892 m!353759))

(declare-fun m!353761 () Bool)

(assert (=> start!35440 m!353761))

(declare-fun m!353763 () Bool)

(assert (=> start!35440 m!353763))

(declare-fun m!353765 () Bool)

(assert (=> start!35440 m!353765))

(declare-fun m!353767 () Bool)

(assert (=> b!354894 m!353767))

(declare-fun m!353769 () Bool)

(assert (=> b!354886 m!353769))

(assert (=> b!354886 m!353769))

(declare-fun m!353771 () Bool)

(assert (=> b!354886 m!353771))

(declare-fun m!353773 () Bool)

(assert (=> mapNonEmpty!13347 m!353773))

(declare-fun m!353775 () Bool)

(assert (=> b!354885 m!353775))

(assert (=> b!354885 m!353769))

(assert (=> b!354885 m!353775))

(assert (=> b!354885 m!353769))

(declare-fun m!353777 () Bool)

(assert (=> b!354885 m!353777))

(declare-fun m!353779 () Bool)

(assert (=> b!354885 m!353779))

(declare-fun m!353781 () Bool)

(assert (=> b!354889 m!353781))

(assert (=> b!354888 m!353769))

(check-sat (not b!354889) (not b_next!7827) b_and!15069 tp_is_empty!7893 (not b!354894) (not mapNonEmpty!13347) (not b!354890) (not b!354886) (not b!354892) (not start!35440) (not b!354885))
(check-sat b_and!15069 (not b_next!7827))
