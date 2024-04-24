; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4130 () Bool)

(assert start!4130)

(declare-fun b_free!1039 () Bool)

(declare-fun b_next!1039 () Bool)

(assert (=> start!4130 (= b_free!1039 (not b_next!1039))))

(declare-fun tp!4536 () Bool)

(declare-fun b_and!1839 () Bool)

(assert (=> start!4130 (= tp!4536 b_and!1839)))

(declare-fun b!30930 () Bool)

(declare-fun res!18709 () Bool)

(declare-fun e!19804 () Bool)

(assert (=> b!30930 (=> (not res!18709) (not e!19804))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1683 0))(
  ( (V!1684 (val!723 Int)) )
))
(declare-datatypes ((ValueCell!497 0))(
  ( (ValueCellFull!497 (v!1812 V!1683)) (EmptyCell!497) )
))
(declare-datatypes ((array!1991 0))(
  ( (array!1992 (arr!949 (Array (_ BitVec 32) ValueCell!497)) (size!1050 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1991)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1993 0))(
  ( (array!1994 (arr!950 (Array (_ BitVec 32) (_ BitVec 64))) (size!1051 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1993)

(declare-fun zeroValue!1443 () V!1683)

(declare-fun minValue!1443 () V!1683)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((tuple2!1186 0))(
  ( (tuple2!1187 (_1!604 (_ BitVec 64)) (_2!604 V!1683)) )
))
(declare-datatypes ((List!777 0))(
  ( (Nil!774) (Cons!773 (h!1340 tuple2!1186) (t!3464 List!777)) )
))
(declare-datatypes ((ListLongMap!757 0))(
  ( (ListLongMap!758 (toList!394 List!777)) )
))
(declare-fun contains!336 (ListLongMap!757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!219 (array!1993 array!1991 (_ BitVec 32) (_ BitVec 32) V!1683 V!1683 (_ BitVec 32) Int) ListLongMap!757)

(assert (=> b!30930 (= res!18709 (not (contains!336 (getCurrentListMap!219 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30931 () Bool)

(declare-fun res!18705 () Bool)

(assert (=> b!30931 (=> (not res!18705) (not e!19804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1993 (_ BitVec 32)) Bool)

(assert (=> b!30931 (= res!18705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30932 () Bool)

(declare-fun res!18704 () Bool)

(assert (=> b!30932 (=> (not res!18704) (not e!19804))))

(assert (=> b!30932 (= res!18704 (and (= (size!1050 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1051 _keys!1833) (size!1050 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30933 () Bool)

(assert (=> b!30933 (= e!19804 false)))

(declare-datatypes ((SeekEntryResult!115 0))(
  ( (MissingZero!115 (index!2582 (_ BitVec 32))) (Found!115 (index!2583 (_ BitVec 32))) (Intermediate!115 (undefined!927 Bool) (index!2584 (_ BitVec 32)) (x!6593 (_ BitVec 32))) (Undefined!115) (MissingVacant!115 (index!2585 (_ BitVec 32))) )
))
(declare-fun lt!11484 () SeekEntryResult!115)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1993 (_ BitVec 32)) SeekEntryResult!115)

(assert (=> b!30933 (= lt!11484 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30934 () Bool)

(declare-fun res!18710 () Bool)

(assert (=> b!30934 (=> (not res!18710) (not e!19804))))

(declare-datatypes ((List!778 0))(
  ( (Nil!775) (Cons!774 (h!1341 (_ BitVec 64)) (t!3465 List!778)) )
))
(declare-fun arrayNoDuplicates!0 (array!1993 (_ BitVec 32) List!778) Bool)

(assert (=> b!30934 (= res!18710 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!775))))

(declare-fun mapNonEmpty!1618 () Bool)

(declare-fun mapRes!1618 () Bool)

(declare-fun tp!4537 () Bool)

(declare-fun e!19806 () Bool)

(assert (=> mapNonEmpty!1618 (= mapRes!1618 (and tp!4537 e!19806))))

(declare-fun mapKey!1618 () (_ BitVec 32))

(declare-fun mapRest!1618 () (Array (_ BitVec 32) ValueCell!497))

(declare-fun mapValue!1618 () ValueCell!497)

(assert (=> mapNonEmpty!1618 (= (arr!949 _values!1501) (store mapRest!1618 mapKey!1618 mapValue!1618))))

(declare-fun b!30935 () Bool)

(declare-fun tp_is_empty!1393 () Bool)

(assert (=> b!30935 (= e!19806 tp_is_empty!1393)))

(declare-fun res!18706 () Bool)

(assert (=> start!4130 (=> (not res!18706) (not e!19804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4130 (= res!18706 (validMask!0 mask!2294))))

(assert (=> start!4130 e!19804))

(assert (=> start!4130 true))

(assert (=> start!4130 tp!4536))

(declare-fun e!19807 () Bool)

(declare-fun array_inv!653 (array!1991) Bool)

(assert (=> start!4130 (and (array_inv!653 _values!1501) e!19807)))

(declare-fun array_inv!654 (array!1993) Bool)

(assert (=> start!4130 (array_inv!654 _keys!1833)))

(assert (=> start!4130 tp_is_empty!1393))

(declare-fun b!30936 () Bool)

(declare-fun e!19805 () Bool)

(assert (=> b!30936 (= e!19807 (and e!19805 mapRes!1618))))

(declare-fun condMapEmpty!1618 () Bool)

(declare-fun mapDefault!1618 () ValueCell!497)

(assert (=> b!30936 (= condMapEmpty!1618 (= (arr!949 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!497)) mapDefault!1618)))))

(declare-fun b!30937 () Bool)

(declare-fun res!18708 () Bool)

(assert (=> b!30937 (=> (not res!18708) (not e!19804))))

(declare-fun arrayContainsKey!0 (array!1993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30937 (= res!18708 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30938 () Bool)

(assert (=> b!30938 (= e!19805 tp_is_empty!1393)))

(declare-fun mapIsEmpty!1618 () Bool)

(assert (=> mapIsEmpty!1618 mapRes!1618))

(declare-fun b!30939 () Bool)

(declare-fun res!18707 () Bool)

(assert (=> b!30939 (=> (not res!18707) (not e!19804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30939 (= res!18707 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4130 res!18706) b!30932))

(assert (= (and b!30932 res!18704) b!30931))

(assert (= (and b!30931 res!18705) b!30934))

(assert (= (and b!30934 res!18710) b!30939))

(assert (= (and b!30939 res!18707) b!30930))

(assert (= (and b!30930 res!18709) b!30937))

(assert (= (and b!30937 res!18708) b!30933))

(assert (= (and b!30936 condMapEmpty!1618) mapIsEmpty!1618))

(assert (= (and b!30936 (not condMapEmpty!1618)) mapNonEmpty!1618))

(get-info :version)

(assert (= (and mapNonEmpty!1618 ((_ is ValueCellFull!497) mapValue!1618)) b!30935))

(assert (= (and b!30936 ((_ is ValueCellFull!497) mapDefault!1618)) b!30938))

(assert (= start!4130 b!30936))

(declare-fun m!24749 () Bool)

(assert (=> b!30930 m!24749))

(assert (=> b!30930 m!24749))

(declare-fun m!24751 () Bool)

(assert (=> b!30930 m!24751))

(declare-fun m!24753 () Bool)

(assert (=> b!30934 m!24753))

(declare-fun m!24755 () Bool)

(assert (=> b!30933 m!24755))

(declare-fun m!24757 () Bool)

(assert (=> b!30939 m!24757))

(declare-fun m!24759 () Bool)

(assert (=> mapNonEmpty!1618 m!24759))

(declare-fun m!24761 () Bool)

(assert (=> start!4130 m!24761))

(declare-fun m!24763 () Bool)

(assert (=> start!4130 m!24763))

(declare-fun m!24765 () Bool)

(assert (=> start!4130 m!24765))

(declare-fun m!24767 () Bool)

(assert (=> b!30931 m!24767))

(declare-fun m!24769 () Bool)

(assert (=> b!30937 m!24769))

(check-sat (not mapNonEmpty!1618) (not b!30933) (not b!30930) (not b!30939) (not b!30931) (not b!30934) (not b_next!1039) tp_is_empty!1393 b_and!1839 (not start!4130) (not b!30937))
(check-sat b_and!1839 (not b_next!1039))
