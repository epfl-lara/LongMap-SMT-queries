; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3980 () Bool)

(assert start!3980)

(declare-fun b_free!885 () Bool)

(declare-fun b_next!885 () Bool)

(assert (=> start!3980 (= b_free!885 (not b_next!885))))

(declare-fun tp!4074 () Bool)

(declare-fun b_and!1695 () Bool)

(assert (=> start!3980 (= tp!4074 b_and!1695)))

(declare-fun b!28688 () Bool)

(declare-fun e!18554 () Bool)

(declare-fun e!18552 () Bool)

(assert (=> b!28688 (= e!18554 e!18552)))

(declare-fun res!17123 () Bool)

(assert (=> b!28688 (=> (not res!17123) (not e!18552))))

(declare-datatypes ((V!1477 0))(
  ( (V!1478 (val!646 Int)) )
))
(declare-datatypes ((tuple2!1074 0))(
  ( (tuple2!1075 (_1!548 (_ BitVec 64)) (_2!548 V!1477)) )
))
(declare-datatypes ((List!673 0))(
  ( (Nil!670) (Cons!669 (h!1236 tuple2!1074) (t!3366 List!673)) )
))
(declare-datatypes ((ListLongMap!651 0))(
  ( (ListLongMap!652 (toList!341 List!673)) )
))
(declare-fun lt!10900 () ListLongMap!651)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!281 (ListLongMap!651 (_ BitVec 64)) Bool)

(assert (=> b!28688 (= res!17123 (not (contains!281 lt!10900 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!420 0))(
  ( (ValueCellFull!420 (v!1735 V!1477)) (EmptyCell!420) )
))
(declare-datatypes ((array!1713 0))(
  ( (array!1714 (arr!810 (Array (_ BitVec 32) ValueCell!420)) (size!911 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1713)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1715 0))(
  ( (array!1716 (arr!811 (Array (_ BitVec 32) (_ BitVec 64))) (size!912 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1715)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1477)

(declare-fun minValue!1443 () V!1477)

(declare-fun getCurrentListMap!171 (array!1715 array!1713 (_ BitVec 32) (_ BitVec 32) V!1477 V!1477 (_ BitVec 32) Int) ListLongMap!651)

(assert (=> b!28688 (= lt!10900 (getCurrentListMap!171 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28689 () Bool)

(declare-fun e!18553 () Bool)

(assert (=> b!28689 (= e!18552 (not e!18553))))

(declare-fun res!17126 () Bool)

(assert (=> b!28689 (=> res!17126 e!18553)))

(assert (=> b!28689 (= res!17126 (not (= (size!912 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10898 () (_ BitVec 32))

(assert (=> b!28689 (contains!281 lt!10900 (select (arr!811 _keys!1833) lt!10898))))

(declare-datatypes ((Unit!649 0))(
  ( (Unit!650) )
))
(declare-fun lt!10899 () Unit!649)

(declare-fun lemmaValidKeyInArrayIsInListMap!18 (array!1715 array!1713 (_ BitVec 32) (_ BitVec 32) V!1477 V!1477 (_ BitVec 32) Int) Unit!649)

(assert (=> b!28689 (= lt!10899 (lemmaValidKeyInArrayIsInListMap!18 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10898 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1715 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28689 (= lt!10898 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28690 () Bool)

(declare-fun res!17127 () Bool)

(assert (=> b!28690 (=> (not res!17127) (not e!18554))))

(assert (=> b!28690 (= res!17127 (and (= (size!911 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!912 _keys!1833) (size!911 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28691 () Bool)

(declare-fun e!18551 () Bool)

(declare-fun tp_is_empty!1239 () Bool)

(assert (=> b!28691 (= e!18551 tp_is_empty!1239)))

(declare-fun b!28692 () Bool)

(declare-fun res!17124 () Bool)

(assert (=> b!28692 (=> (not res!17124) (not e!18554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1715 (_ BitVec 32)) Bool)

(assert (=> b!28692 (= res!17124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28693 () Bool)

(declare-fun res!17130 () Bool)

(assert (=> b!28693 (=> (not res!17130) (not e!18552))))

(declare-fun arrayContainsKey!0 (array!1715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28693 (= res!17130 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1387 () Bool)

(declare-fun mapRes!1387 () Bool)

(assert (=> mapIsEmpty!1387 mapRes!1387))

(declare-fun b!28695 () Bool)

(declare-fun res!17129 () Bool)

(assert (=> b!28695 (=> (not res!17129) (not e!18554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28695 (= res!17129 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1387 () Bool)

(declare-fun tp!4075 () Bool)

(assert (=> mapNonEmpty!1387 (= mapRes!1387 (and tp!4075 e!18551))))

(declare-fun mapKey!1387 () (_ BitVec 32))

(declare-fun mapValue!1387 () ValueCell!420)

(declare-fun mapRest!1387 () (Array (_ BitVec 32) ValueCell!420))

(assert (=> mapNonEmpty!1387 (= (arr!810 _values!1501) (store mapRest!1387 mapKey!1387 mapValue!1387))))

(declare-fun b!28696 () Bool)

(declare-fun e!18548 () Bool)

(declare-fun e!18550 () Bool)

(assert (=> b!28696 (= e!18548 (and e!18550 mapRes!1387))))

(declare-fun condMapEmpty!1387 () Bool)

(declare-fun mapDefault!1387 () ValueCell!420)

(assert (=> b!28696 (= condMapEmpty!1387 (= (arr!810 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!420)) mapDefault!1387)))))

(declare-fun b!28697 () Bool)

(declare-fun res!17128 () Bool)

(assert (=> b!28697 (=> (not res!17128) (not e!18554))))

(declare-datatypes ((List!674 0))(
  ( (Nil!671) (Cons!670 (h!1237 (_ BitVec 64)) (t!3367 List!674)) )
))
(declare-fun arrayNoDuplicates!0 (array!1715 (_ BitVec 32) List!674) Bool)

(assert (=> b!28697 (= res!17128 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!671))))

(declare-fun b!28698 () Bool)

(assert (=> b!28698 (= e!18553 true)))

(declare-datatypes ((SeekEntryResult!70 0))(
  ( (MissingZero!70 (index!2402 (_ BitVec 32))) (Found!70 (index!2403 (_ BitVec 32))) (Intermediate!70 (undefined!882 Bool) (index!2404 (_ BitVec 32)) (x!6340 (_ BitVec 32))) (Undefined!70) (MissingVacant!70 (index!2405 (_ BitVec 32))) )
))
(declare-fun lt!10901 () SeekEntryResult!70)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1715 (_ BitVec 32)) SeekEntryResult!70)

(assert (=> b!28698 (= lt!10901 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!28694 () Bool)

(assert (=> b!28694 (= e!18550 tp_is_empty!1239)))

(declare-fun res!17125 () Bool)

(assert (=> start!3980 (=> (not res!17125) (not e!18554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3980 (= res!17125 (validMask!0 mask!2294))))

(assert (=> start!3980 e!18554))

(assert (=> start!3980 true))

(assert (=> start!3980 tp!4074))

(declare-fun array_inv!557 (array!1713) Bool)

(assert (=> start!3980 (and (array_inv!557 _values!1501) e!18548)))

(declare-fun array_inv!558 (array!1715) Bool)

(assert (=> start!3980 (array_inv!558 _keys!1833)))

(assert (=> start!3980 tp_is_empty!1239))

(assert (= (and start!3980 res!17125) b!28690))

(assert (= (and b!28690 res!17127) b!28692))

(assert (= (and b!28692 res!17124) b!28697))

(assert (= (and b!28697 res!17128) b!28695))

(assert (= (and b!28695 res!17129) b!28688))

(assert (= (and b!28688 res!17123) b!28693))

(assert (= (and b!28693 res!17130) b!28689))

(assert (= (and b!28689 (not res!17126)) b!28698))

(assert (= (and b!28696 condMapEmpty!1387) mapIsEmpty!1387))

(assert (= (and b!28696 (not condMapEmpty!1387)) mapNonEmpty!1387))

(get-info :version)

(assert (= (and mapNonEmpty!1387 ((_ is ValueCellFull!420) mapValue!1387)) b!28691))

(assert (= (and b!28696 ((_ is ValueCellFull!420) mapDefault!1387)) b!28694))

(assert (= start!3980 b!28696))

(declare-fun m!22867 () Bool)

(assert (=> start!3980 m!22867))

(declare-fun m!22869 () Bool)

(assert (=> start!3980 m!22869))

(declare-fun m!22871 () Bool)

(assert (=> start!3980 m!22871))

(declare-fun m!22873 () Bool)

(assert (=> b!28688 m!22873))

(declare-fun m!22875 () Bool)

(assert (=> b!28688 m!22875))

(declare-fun m!22877 () Bool)

(assert (=> b!28697 m!22877))

(declare-fun m!22879 () Bool)

(assert (=> b!28692 m!22879))

(declare-fun m!22881 () Bool)

(assert (=> b!28695 m!22881))

(declare-fun m!22883 () Bool)

(assert (=> b!28693 m!22883))

(declare-fun m!22885 () Bool)

(assert (=> mapNonEmpty!1387 m!22885))

(declare-fun m!22887 () Bool)

(assert (=> b!28689 m!22887))

(assert (=> b!28689 m!22887))

(declare-fun m!22889 () Bool)

(assert (=> b!28689 m!22889))

(declare-fun m!22891 () Bool)

(assert (=> b!28689 m!22891))

(declare-fun m!22893 () Bool)

(assert (=> b!28689 m!22893))

(declare-fun m!22895 () Bool)

(assert (=> b!28698 m!22895))

(check-sat (not b!28695) (not b!28698) (not b!28697) (not b!28688) (not mapNonEmpty!1387) tp_is_empty!1239 b_and!1695 (not b_next!885) (not b!28689) (not start!3980) (not b!28692) (not b!28693))
(check-sat b_and!1695 (not b_next!885))
