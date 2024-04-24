; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40190 () Bool)

(assert start!40190)

(declare-fun b_free!10471 () Bool)

(declare-fun b_next!10471 () Bool)

(assert (=> start!40190 (= b_free!10471 (not b_next!10471))))

(declare-fun tp!36942 () Bool)

(declare-fun b_and!18453 () Bool)

(assert (=> start!40190 (= tp!36942 b_and!18453)))

(declare-fun b!440611 () Bool)

(declare-fun res!260676 () Bool)

(declare-fun e!259556 () Bool)

(assert (=> b!440611 (=> (not res!260676) (not e!259556))))

(declare-datatypes ((array!27066 0))(
  ( (array!27067 (arr!12982 (Array (_ BitVec 32) (_ BitVec 64))) (size!13334 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27066)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27066 (_ BitVec 32)) Bool)

(assert (=> b!440611 (= res!260676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440612 () Bool)

(declare-fun e!259559 () Bool)

(assert (=> b!440612 (= e!259559 (not true))))

(declare-datatypes ((V!16603 0))(
  ( (V!16604 (val!5856 Int)) )
))
(declare-fun minValue!515 () V!16603)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5468 0))(
  ( (ValueCellFull!5468 (v!8104 V!16603)) (EmptyCell!5468) )
))
(declare-datatypes ((array!27068 0))(
  ( (array!27069 (arr!12983 (Array (_ BitVec 32) ValueCell!5468)) (size!13335 (_ BitVec 32))) )
))
(declare-fun lt!202672 () array!27068)

(declare-fun _values!549 () array!27068)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202670 () array!27066)

(declare-fun v!412 () V!16603)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16603)

(declare-datatypes ((tuple2!7692 0))(
  ( (tuple2!7693 (_1!3857 (_ BitVec 64)) (_2!3857 V!16603)) )
))
(declare-datatypes ((List!7679 0))(
  ( (Nil!7676) (Cons!7675 (h!8531 tuple2!7692) (t!13427 List!7679)) )
))
(declare-datatypes ((ListLongMap!6607 0))(
  ( (ListLongMap!6608 (toList!3319 List!7679)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1552 (array!27066 array!27068 (_ BitVec 32) (_ BitVec 32) V!16603 V!16603 (_ BitVec 32) Int) ListLongMap!6607)

(declare-fun +!1510 (ListLongMap!6607 tuple2!7692) ListLongMap!6607)

(assert (=> b!440612 (= (getCurrentListMapNoExtraKeys!1552 lt!202670 lt!202672 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1510 (getCurrentListMapNoExtraKeys!1552 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7693 k0!794 v!412)))))

(declare-datatypes ((Unit!13095 0))(
  ( (Unit!13096) )
))
(declare-fun lt!202674 () Unit!13095)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!670 (array!27066 array!27068 (_ BitVec 32) (_ BitVec 32) V!16603 V!16603 (_ BitVec 32) (_ BitVec 64) V!16603 (_ BitVec 32) Int) Unit!13095)

(assert (=> b!440612 (= lt!202674 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!670 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440613 () Bool)

(declare-fun res!260684 () Bool)

(assert (=> b!440613 (=> (not res!260684) (not e!259556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440613 (= res!260684 (validMask!0 mask!1025))))

(declare-fun b!440614 () Bool)

(declare-fun e!259555 () Bool)

(declare-fun e!259557 () Bool)

(declare-fun mapRes!19056 () Bool)

(assert (=> b!440614 (= e!259555 (and e!259557 mapRes!19056))))

(declare-fun condMapEmpty!19056 () Bool)

(declare-fun mapDefault!19056 () ValueCell!5468)

(assert (=> b!440614 (= condMapEmpty!19056 (= (arr!12983 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5468)) mapDefault!19056)))))

(declare-fun b!440615 () Bool)

(declare-fun res!260675 () Bool)

(assert (=> b!440615 (=> (not res!260675) (not e!259556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440615 (= res!260675 (validKeyInArray!0 k0!794))))

(declare-fun b!440616 () Bool)

(declare-fun res!260677 () Bool)

(assert (=> b!440616 (=> (not res!260677) (not e!259556))))

(assert (=> b!440616 (= res!260677 (or (= (select (arr!12982 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12982 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440617 () Bool)

(declare-fun e!259560 () Bool)

(assert (=> b!440617 (= e!259560 e!259559)))

(declare-fun res!260680 () Bool)

(assert (=> b!440617 (=> (not res!260680) (not e!259559))))

(assert (=> b!440617 (= res!260680 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202671 () ListLongMap!6607)

(assert (=> b!440617 (= lt!202671 (getCurrentListMapNoExtraKeys!1552 lt!202670 lt!202672 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440617 (= lt!202672 (array!27069 (store (arr!12983 _values!549) i!563 (ValueCellFull!5468 v!412)) (size!13335 _values!549)))))

(declare-fun lt!202673 () ListLongMap!6607)

(assert (=> b!440617 (= lt!202673 (getCurrentListMapNoExtraKeys!1552 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440618 () Bool)

(declare-fun res!260678 () Bool)

(assert (=> b!440618 (=> (not res!260678) (not e!259556))))

(declare-datatypes ((List!7680 0))(
  ( (Nil!7677) (Cons!7676 (h!8532 (_ BitVec 64)) (t!13428 List!7680)) )
))
(declare-fun arrayNoDuplicates!0 (array!27066 (_ BitVec 32) List!7680) Bool)

(assert (=> b!440618 (= res!260678 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7677))))

(declare-fun b!440619 () Bool)

(declare-fun res!260681 () Bool)

(assert (=> b!440619 (=> (not res!260681) (not e!259556))))

(assert (=> b!440619 (= res!260681 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13334 _keys!709))))))

(declare-fun mapNonEmpty!19056 () Bool)

(declare-fun tp!36941 () Bool)

(declare-fun e!259558 () Bool)

(assert (=> mapNonEmpty!19056 (= mapRes!19056 (and tp!36941 e!259558))))

(declare-fun mapRest!19056 () (Array (_ BitVec 32) ValueCell!5468))

(declare-fun mapValue!19056 () ValueCell!5468)

(declare-fun mapKey!19056 () (_ BitVec 32))

(assert (=> mapNonEmpty!19056 (= (arr!12983 _values!549) (store mapRest!19056 mapKey!19056 mapValue!19056))))

(declare-fun res!260682 () Bool)

(assert (=> start!40190 (=> (not res!260682) (not e!259556))))

(assert (=> start!40190 (= res!260682 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13334 _keys!709))))))

(assert (=> start!40190 e!259556))

(declare-fun tp_is_empty!11623 () Bool)

(assert (=> start!40190 tp_is_empty!11623))

(assert (=> start!40190 tp!36942))

(assert (=> start!40190 true))

(declare-fun array_inv!9490 (array!27068) Bool)

(assert (=> start!40190 (and (array_inv!9490 _values!549) e!259555)))

(declare-fun array_inv!9491 (array!27066) Bool)

(assert (=> start!40190 (array_inv!9491 _keys!709)))

(declare-fun b!440620 () Bool)

(assert (=> b!440620 (= e!259557 tp_is_empty!11623)))

(declare-fun b!440621 () Bool)

(declare-fun res!260679 () Bool)

(assert (=> b!440621 (=> (not res!260679) (not e!259556))))

(declare-fun arrayContainsKey!0 (array!27066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440621 (= res!260679 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440622 () Bool)

(declare-fun res!260674 () Bool)

(assert (=> b!440622 (=> (not res!260674) (not e!259560))))

(assert (=> b!440622 (= res!260674 (bvsle from!863 i!563))))

(declare-fun b!440623 () Bool)

(declare-fun res!260683 () Bool)

(assert (=> b!440623 (=> (not res!260683) (not e!259556))))

(assert (=> b!440623 (= res!260683 (and (= (size!13335 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13334 _keys!709) (size!13335 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440624 () Bool)

(assert (=> b!440624 (= e!259558 tp_is_empty!11623)))

(declare-fun mapIsEmpty!19056 () Bool)

(assert (=> mapIsEmpty!19056 mapRes!19056))

(declare-fun b!440625 () Bool)

(assert (=> b!440625 (= e!259556 e!259560)))

(declare-fun res!260685 () Bool)

(assert (=> b!440625 (=> (not res!260685) (not e!259560))))

(assert (=> b!440625 (= res!260685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202670 mask!1025))))

(assert (=> b!440625 (= lt!202670 (array!27067 (store (arr!12982 _keys!709) i!563 k0!794) (size!13334 _keys!709)))))

(declare-fun b!440626 () Bool)

(declare-fun res!260673 () Bool)

(assert (=> b!440626 (=> (not res!260673) (not e!259560))))

(assert (=> b!440626 (= res!260673 (arrayNoDuplicates!0 lt!202670 #b00000000000000000000000000000000 Nil!7677))))

(assert (= (and start!40190 res!260682) b!440613))

(assert (= (and b!440613 res!260684) b!440623))

(assert (= (and b!440623 res!260683) b!440611))

(assert (= (and b!440611 res!260676) b!440618))

(assert (= (and b!440618 res!260678) b!440619))

(assert (= (and b!440619 res!260681) b!440615))

(assert (= (and b!440615 res!260675) b!440616))

(assert (= (and b!440616 res!260677) b!440621))

(assert (= (and b!440621 res!260679) b!440625))

(assert (= (and b!440625 res!260685) b!440626))

(assert (= (and b!440626 res!260673) b!440622))

(assert (= (and b!440622 res!260674) b!440617))

(assert (= (and b!440617 res!260680) b!440612))

(assert (= (and b!440614 condMapEmpty!19056) mapIsEmpty!19056))

(assert (= (and b!440614 (not condMapEmpty!19056)) mapNonEmpty!19056))

(get-info :version)

(assert (= (and mapNonEmpty!19056 ((_ is ValueCellFull!5468) mapValue!19056)) b!440624))

(assert (= (and b!440614 ((_ is ValueCellFull!5468) mapDefault!19056)) b!440620))

(assert (= start!40190 b!440614))

(declare-fun m!427877 () Bool)

(assert (=> b!440612 m!427877))

(declare-fun m!427879 () Bool)

(assert (=> b!440612 m!427879))

(assert (=> b!440612 m!427879))

(declare-fun m!427881 () Bool)

(assert (=> b!440612 m!427881))

(declare-fun m!427883 () Bool)

(assert (=> b!440612 m!427883))

(declare-fun m!427885 () Bool)

(assert (=> b!440625 m!427885))

(declare-fun m!427887 () Bool)

(assert (=> b!440625 m!427887))

(declare-fun m!427889 () Bool)

(assert (=> start!40190 m!427889))

(declare-fun m!427891 () Bool)

(assert (=> start!40190 m!427891))

(declare-fun m!427893 () Bool)

(assert (=> b!440611 m!427893))

(declare-fun m!427895 () Bool)

(assert (=> b!440615 m!427895))

(declare-fun m!427897 () Bool)

(assert (=> mapNonEmpty!19056 m!427897))

(declare-fun m!427899 () Bool)

(assert (=> b!440618 m!427899))

(declare-fun m!427901 () Bool)

(assert (=> b!440621 m!427901))

(declare-fun m!427903 () Bool)

(assert (=> b!440613 m!427903))

(declare-fun m!427905 () Bool)

(assert (=> b!440616 m!427905))

(declare-fun m!427907 () Bool)

(assert (=> b!440626 m!427907))

(declare-fun m!427909 () Bool)

(assert (=> b!440617 m!427909))

(declare-fun m!427911 () Bool)

(assert (=> b!440617 m!427911))

(declare-fun m!427913 () Bool)

(assert (=> b!440617 m!427913))

(check-sat (not b!440612) (not b!440625) (not start!40190) b_and!18453 (not b!440611) (not b!440617) (not b!440618) (not b!440613) (not b_next!10471) (not mapNonEmpty!19056) (not b!440615) tp_is_empty!11623 (not b!440626) (not b!440621))
(check-sat b_and!18453 (not b_next!10471))
