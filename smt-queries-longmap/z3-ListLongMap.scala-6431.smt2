; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82550 () Bool)

(assert start!82550)

(declare-fun b_free!18649 () Bool)

(declare-fun b_next!18649 () Bool)

(assert (=> start!82550 (= b_free!18649 (not b_next!18649))))

(declare-fun tp!64918 () Bool)

(declare-fun b_and!30147 () Bool)

(assert (=> start!82550 (= tp!64918 b_and!30147)))

(declare-fun b!961487 () Bool)

(declare-fun res!643341 () Bool)

(declare-fun e!542067 () Bool)

(assert (=> b!961487 (=> (not res!643341) (not e!542067))))

(declare-datatypes ((array!58844 0))(
  ( (array!58845 (arr!28291 (Array (_ BitVec 32) (_ BitVec 64))) (size!28771 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58844)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961487 (= res!643341 (validKeyInArray!0 (select (arr!28291 _keys!1668) i!793)))))

(declare-fun res!643344 () Bool)

(assert (=> start!82550 (=> (not res!643344) (not e!542067))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82550 (= res!643344 (validMask!0 mask!2088))))

(assert (=> start!82550 e!542067))

(assert (=> start!82550 true))

(declare-fun tp_is_empty!21361 () Bool)

(assert (=> start!82550 tp_is_empty!21361))

(declare-fun array_inv!22009 (array!58844) Bool)

(assert (=> start!82550 (array_inv!22009 _keys!1668)))

(declare-datatypes ((V!33465 0))(
  ( (V!33466 (val!10731 Int)) )
))
(declare-datatypes ((ValueCell!10199 0))(
  ( (ValueCellFull!10199 (v!13285 V!33465)) (EmptyCell!10199) )
))
(declare-datatypes ((array!58846 0))(
  ( (array!58847 (arr!28292 (Array (_ BitVec 32) ValueCell!10199)) (size!28772 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58846)

(declare-fun e!542064 () Bool)

(declare-fun array_inv!22010 (array!58846) Bool)

(assert (=> start!82550 (and (array_inv!22010 _values!1386) e!542064)))

(assert (=> start!82550 tp!64918))

(declare-fun b!961488 () Bool)

(declare-fun res!643340 () Bool)

(assert (=> b!961488 (=> (not res!643340) (not e!542067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58844 (_ BitVec 32)) Bool)

(assert (=> b!961488 (= res!643340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!961489 () Bool)

(assert (=> b!961489 (= e!542067 false)))

(declare-fun lt!431026 () Bool)

(declare-fun minValue!1328 () V!33465)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33465)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13816 0))(
  ( (tuple2!13817 (_1!6919 (_ BitVec 64)) (_2!6919 V!33465)) )
))
(declare-datatypes ((List!19647 0))(
  ( (Nil!19644) (Cons!19643 (h!20811 tuple2!13816) (t!28002 List!19647)) )
))
(declare-datatypes ((ListLongMap!12515 0))(
  ( (ListLongMap!12516 (toList!6273 List!19647)) )
))
(declare-fun contains!5385 (ListLongMap!12515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3506 (array!58844 array!58846 (_ BitVec 32) (_ BitVec 32) V!33465 V!33465 (_ BitVec 32) Int) ListLongMap!12515)

(assert (=> b!961489 (= lt!431026 (contains!5385 (getCurrentListMap!3506 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28291 _keys!1668) i!793)))))

(declare-fun b!961490 () Bool)

(declare-fun res!643343 () Bool)

(assert (=> b!961490 (=> (not res!643343) (not e!542067))))

(assert (=> b!961490 (= res!643343 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28771 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28771 _keys!1668))))))

(declare-fun b!961491 () Bool)

(declare-fun e!542065 () Bool)

(declare-fun mapRes!34021 () Bool)

(assert (=> b!961491 (= e!542064 (and e!542065 mapRes!34021))))

(declare-fun condMapEmpty!34021 () Bool)

(declare-fun mapDefault!34021 () ValueCell!10199)

(assert (=> b!961491 (= condMapEmpty!34021 (= (arr!28292 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10199)) mapDefault!34021)))))

(declare-fun b!961492 () Bool)

(declare-fun e!542063 () Bool)

(assert (=> b!961492 (= e!542063 tp_is_empty!21361)))

(declare-fun b!961493 () Bool)

(assert (=> b!961493 (= e!542065 tp_is_empty!21361)))

(declare-fun b!961494 () Bool)

(declare-fun res!643345 () Bool)

(assert (=> b!961494 (=> (not res!643345) (not e!542067))))

(declare-datatypes ((List!19648 0))(
  ( (Nil!19645) (Cons!19644 (h!20812 (_ BitVec 64)) (t!28003 List!19648)) )
))
(declare-fun arrayNoDuplicates!0 (array!58844 (_ BitVec 32) List!19648) Bool)

(assert (=> b!961494 (= res!643345 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19645))))

(declare-fun mapNonEmpty!34021 () Bool)

(declare-fun tp!64917 () Bool)

(assert (=> mapNonEmpty!34021 (= mapRes!34021 (and tp!64917 e!542063))))

(declare-fun mapKey!34021 () (_ BitVec 32))

(declare-fun mapValue!34021 () ValueCell!10199)

(declare-fun mapRest!34021 () (Array (_ BitVec 32) ValueCell!10199))

(assert (=> mapNonEmpty!34021 (= (arr!28292 _values!1386) (store mapRest!34021 mapKey!34021 mapValue!34021))))

(declare-fun b!961495 () Bool)

(declare-fun res!643342 () Bool)

(assert (=> b!961495 (=> (not res!643342) (not e!542067))))

(assert (=> b!961495 (= res!643342 (and (= (size!28772 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28771 _keys!1668) (size!28772 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34021 () Bool)

(assert (=> mapIsEmpty!34021 mapRes!34021))

(assert (= (and start!82550 res!643344) b!961495))

(assert (= (and b!961495 res!643342) b!961488))

(assert (= (and b!961488 res!643340) b!961494))

(assert (= (and b!961494 res!643345) b!961490))

(assert (= (and b!961490 res!643343) b!961487))

(assert (= (and b!961487 res!643341) b!961489))

(assert (= (and b!961491 condMapEmpty!34021) mapIsEmpty!34021))

(assert (= (and b!961491 (not condMapEmpty!34021)) mapNonEmpty!34021))

(get-info :version)

(assert (= (and mapNonEmpty!34021 ((_ is ValueCellFull!10199) mapValue!34021)) b!961492))

(assert (= (and b!961491 ((_ is ValueCellFull!10199) mapDefault!34021)) b!961493))

(assert (= start!82550 b!961491))

(declare-fun m!892083 () Bool)

(assert (=> b!961487 m!892083))

(assert (=> b!961487 m!892083))

(declare-fun m!892085 () Bool)

(assert (=> b!961487 m!892085))

(declare-fun m!892087 () Bool)

(assert (=> start!82550 m!892087))

(declare-fun m!892089 () Bool)

(assert (=> start!82550 m!892089))

(declare-fun m!892091 () Bool)

(assert (=> start!82550 m!892091))

(declare-fun m!892093 () Bool)

(assert (=> b!961488 m!892093))

(declare-fun m!892095 () Bool)

(assert (=> b!961494 m!892095))

(declare-fun m!892097 () Bool)

(assert (=> mapNonEmpty!34021 m!892097))

(declare-fun m!892099 () Bool)

(assert (=> b!961489 m!892099))

(assert (=> b!961489 m!892083))

(assert (=> b!961489 m!892099))

(assert (=> b!961489 m!892083))

(declare-fun m!892101 () Bool)

(assert (=> b!961489 m!892101))

(check-sat (not start!82550) (not b!961489) (not mapNonEmpty!34021) (not b!961487) (not b_next!18649) (not b!961488) tp_is_empty!21361 (not b!961494) b_and!30147)
(check-sat b_and!30147 (not b_next!18649))
