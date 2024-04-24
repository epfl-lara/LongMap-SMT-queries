; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35418 () Bool)

(assert start!35418)

(declare-fun b_free!7819 () Bool)

(declare-fun b_next!7819 () Bool)

(assert (=> start!35418 (= b_free!7819 (not b_next!7819))))

(declare-fun tp!27243 () Bool)

(declare-fun b_and!15075 () Bool)

(assert (=> start!35418 (= tp!27243 b_and!15075)))

(declare-fun b!354687 () Bool)

(declare-fun res!196662 () Bool)

(declare-fun e!217398 () Bool)

(assert (=> b!354687 (=> (not res!196662) (not e!217398))))

(declare-datatypes ((array!19340 0))(
  ( (array!19341 (arr!9163 (Array (_ BitVec 32) (_ BitVec 64))) (size!9515 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19340)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354687 (= res!196662 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354688 () Bool)

(declare-fun res!196663 () Bool)

(assert (=> b!354688 (=> (not res!196663) (not e!217398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354688 (= res!196663 (validKeyInArray!0 k0!1077))))

(declare-fun b!354689 () Bool)

(declare-fun e!217401 () Bool)

(declare-fun e!217402 () Bool)

(declare-fun mapRes!13335 () Bool)

(assert (=> b!354689 (= e!217401 (and e!217402 mapRes!13335))))

(declare-fun condMapEmpty!13335 () Bool)

(declare-datatypes ((V!11491 0))(
  ( (V!11492 (val!3987 Int)) )
))
(declare-datatypes ((ValueCell!3599 0))(
  ( (ValueCellFull!3599 (v!6182 V!11491)) (EmptyCell!3599) )
))
(declare-datatypes ((array!19342 0))(
  ( (array!19343 (arr!9164 (Array (_ BitVec 32) ValueCell!3599)) (size!9516 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19342)

(declare-fun mapDefault!13335 () ValueCell!3599)

(assert (=> b!354689 (= condMapEmpty!13335 (= (arr!9164 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3599)) mapDefault!13335)))))

(declare-fun b!354690 () Bool)

(declare-fun res!196658 () Bool)

(assert (=> b!354690 (=> (not res!196658) (not e!217398))))

(assert (=> b!354690 (= res!196658 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9515 _keys!1456))))))

(declare-fun b!354691 () Bool)

(declare-fun res!196666 () Bool)

(assert (=> b!354691 (=> (not res!196666) (not e!217398))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19340 (_ BitVec 32)) Bool)

(assert (=> b!354691 (= res!196666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354692 () Bool)

(assert (=> b!354692 (= e!217398 (not true))))

(declare-fun minValue!1150 () V!11491)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11491)

(declare-datatypes ((tuple2!5578 0))(
  ( (tuple2!5579 (_1!2800 (_ BitVec 64)) (_2!2800 V!11491)) )
))
(declare-datatypes ((List!5215 0))(
  ( (Nil!5212) (Cons!5211 (h!6067 tuple2!5578) (t!10357 List!5215)) )
))
(declare-datatypes ((ListLongMap!4493 0))(
  ( (ListLongMap!4494 (toList!2262 List!5215)) )
))
(declare-fun contains!2361 (ListLongMap!4493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1790 (array!19340 array!19342 (_ BitVec 32) (_ BitVec 32) V!11491 V!11491 (_ BitVec 32) Int) ListLongMap!4493)

(assert (=> b!354692 (contains!2361 (getCurrentListMap!1790 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9163 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10909 0))(
  ( (Unit!10910) )
))
(declare-fun lt!165761 () Unit!10909)

(declare-fun lemmaValidKeyInArrayIsInListMap!180 (array!19340 array!19342 (_ BitVec 32) (_ BitVec 32) V!11491 V!11491 (_ BitVec 32) Int) Unit!10909)

(assert (=> b!354692 (= lt!165761 (lemmaValidKeyInArrayIsInListMap!180 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354693 () Bool)

(declare-fun res!196660 () Bool)

(assert (=> b!354693 (=> (not res!196660) (not e!217398))))

(assert (=> b!354693 (= res!196660 (and (= (size!9516 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9515 _keys!1456) (size!9516 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354694 () Bool)

(declare-fun res!196659 () Bool)

(assert (=> b!354694 (=> (not res!196659) (not e!217398))))

(declare-datatypes ((List!5216 0))(
  ( (Nil!5213) (Cons!5212 (h!6068 (_ BitVec 64)) (t!10358 List!5216)) )
))
(declare-fun arrayNoDuplicates!0 (array!19340 (_ BitVec 32) List!5216) Bool)

(assert (=> b!354694 (= res!196659 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5213))))

(declare-fun b!354695 () Bool)

(declare-fun res!196661 () Bool)

(assert (=> b!354695 (=> (not res!196661) (not e!217398))))

(assert (=> b!354695 (= res!196661 (validKeyInArray!0 (select (arr!9163 _keys!1456) from!1805)))))

(declare-fun res!196664 () Bool)

(assert (=> start!35418 (=> (not res!196664) (not e!217398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35418 (= res!196664 (validMask!0 mask!1842))))

(assert (=> start!35418 e!217398))

(declare-fun tp_is_empty!7885 () Bool)

(assert (=> start!35418 tp_is_empty!7885))

(assert (=> start!35418 true))

(assert (=> start!35418 tp!27243))

(declare-fun array_inv!6772 (array!19340) Bool)

(assert (=> start!35418 (array_inv!6772 _keys!1456)))

(declare-fun array_inv!6773 (array!19342) Bool)

(assert (=> start!35418 (and (array_inv!6773 _values!1208) e!217401)))

(declare-fun mapNonEmpty!13335 () Bool)

(declare-fun tp!27242 () Bool)

(declare-fun e!217400 () Bool)

(assert (=> mapNonEmpty!13335 (= mapRes!13335 (and tp!27242 e!217400))))

(declare-fun mapRest!13335 () (Array (_ BitVec 32) ValueCell!3599))

(declare-fun mapValue!13335 () ValueCell!3599)

(declare-fun mapKey!13335 () (_ BitVec 32))

(assert (=> mapNonEmpty!13335 (= (arr!9164 _values!1208) (store mapRest!13335 mapKey!13335 mapValue!13335))))

(declare-fun b!354696 () Bool)

(assert (=> b!354696 (= e!217402 tp_is_empty!7885)))

(declare-fun mapIsEmpty!13335 () Bool)

(assert (=> mapIsEmpty!13335 mapRes!13335))

(declare-fun b!354697 () Bool)

(assert (=> b!354697 (= e!217400 tp_is_empty!7885)))

(declare-fun b!354698 () Bool)

(declare-fun res!196665 () Bool)

(assert (=> b!354698 (=> (not res!196665) (not e!217398))))

(assert (=> b!354698 (= res!196665 (= (select (arr!9163 _keys!1456) from!1805) k0!1077))))

(assert (= (and start!35418 res!196664) b!354693))

(assert (= (and b!354693 res!196660) b!354691))

(assert (= (and b!354691 res!196666) b!354694))

(assert (= (and b!354694 res!196659) b!354688))

(assert (= (and b!354688 res!196663) b!354690))

(assert (= (and b!354690 res!196658) b!354687))

(assert (= (and b!354687 res!196662) b!354698))

(assert (= (and b!354698 res!196665) b!354695))

(assert (= (and b!354695 res!196661) b!354692))

(assert (= (and b!354689 condMapEmpty!13335) mapIsEmpty!13335))

(assert (= (and b!354689 (not condMapEmpty!13335)) mapNonEmpty!13335))

(get-info :version)

(assert (= (and mapNonEmpty!13335 ((_ is ValueCellFull!3599) mapValue!13335)) b!354697))

(assert (= (and b!354689 ((_ is ValueCellFull!3599) mapDefault!13335)) b!354696))

(assert (= start!35418 b!354689))

(declare-fun m!353877 () Bool)

(assert (=> b!354694 m!353877))

(declare-fun m!353879 () Bool)

(assert (=> b!354695 m!353879))

(assert (=> b!354695 m!353879))

(declare-fun m!353881 () Bool)

(assert (=> b!354695 m!353881))

(declare-fun m!353883 () Bool)

(assert (=> b!354688 m!353883))

(assert (=> b!354698 m!353879))

(declare-fun m!353885 () Bool)

(assert (=> b!354692 m!353885))

(assert (=> b!354692 m!353879))

(assert (=> b!354692 m!353885))

(assert (=> b!354692 m!353879))

(declare-fun m!353887 () Bool)

(assert (=> b!354692 m!353887))

(declare-fun m!353889 () Bool)

(assert (=> b!354692 m!353889))

(declare-fun m!353891 () Bool)

(assert (=> mapNonEmpty!13335 m!353891))

(declare-fun m!353893 () Bool)

(assert (=> start!35418 m!353893))

(declare-fun m!353895 () Bool)

(assert (=> start!35418 m!353895))

(declare-fun m!353897 () Bool)

(assert (=> start!35418 m!353897))

(declare-fun m!353899 () Bool)

(assert (=> b!354691 m!353899))

(declare-fun m!353901 () Bool)

(assert (=> b!354687 m!353901))

(check-sat (not mapNonEmpty!13335) (not b!354691) (not start!35418) (not b_next!7819) (not b!354694) (not b!354687) (not b!354688) (not b!354695) (not b!354692) b_and!15075 tp_is_empty!7885)
(check-sat b_and!15075 (not b_next!7819))
