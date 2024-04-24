; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77844 () Bool)

(assert start!77844)

(declare-fun b_free!16261 () Bool)

(declare-fun b_next!16261 () Bool)

(assert (=> start!77844 (= b_free!16261 (not b_next!16261))))

(declare-fun tp!57045 () Bool)

(declare-fun b_and!26685 () Bool)

(assert (=> start!77844 (= tp!57045 b_and!26685)))

(declare-fun b!906764 () Bool)

(declare-fun e!508215 () Bool)

(declare-fun e!508209 () Bool)

(assert (=> b!906764 (= e!508215 e!508209)))

(declare-fun res!611647 () Bool)

(assert (=> b!906764 (=> res!611647 e!508209)))

(declare-datatypes ((V!29871 0))(
  ( (V!29872 (val!9390 Int)) )
))
(declare-datatypes ((tuple2!12148 0))(
  ( (tuple2!12149 (_1!6085 (_ BitVec 64)) (_2!6085 V!29871)) )
))
(declare-datatypes ((List!17990 0))(
  ( (Nil!17987) (Cons!17986 (h!19138 tuple2!12148) (t!25415 List!17990)) )
))
(declare-datatypes ((ListLongMap!10847 0))(
  ( (ListLongMap!10848 (toList!5439 List!17990)) )
))
(declare-fun lt!409071 () ListLongMap!10847)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4494 (ListLongMap!10847 (_ BitVec 64)) Bool)

(assert (=> b!906764 (= res!611647 (not (contains!4494 lt!409071 k0!1033)))))

(declare-datatypes ((ValueCell!8858 0))(
  ( (ValueCellFull!8858 (v!11892 V!29871)) (EmptyCell!8858) )
))
(declare-datatypes ((array!53441 0))(
  ( (array!53442 (arr!25675 (Array (_ BitVec 32) ValueCell!8858)) (size!26135 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53441)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29871)

(declare-datatypes ((array!53443 0))(
  ( (array!53444 (arr!25676 (Array (_ BitVec 32) (_ BitVec 64))) (size!26136 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53443)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29871)

(declare-fun getCurrentListMap!2705 (array!53443 array!53441 (_ BitVec 32) (_ BitVec 32) V!29871 V!29871 (_ BitVec 32) Int) ListLongMap!10847)

(assert (=> b!906764 (= lt!409071 (getCurrentListMap!2705 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906765 () Bool)

(declare-fun res!611649 () Bool)

(declare-fun e!508208 () Bool)

(assert (=> b!906765 (=> (not res!611649) (not e!508208))))

(assert (=> b!906765 (= res!611649 (and (= (select (arr!25676 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906766 () Bool)

(declare-fun res!611645 () Bool)

(assert (=> b!906766 (=> res!611645 e!508209)))

(declare-fun lt!409068 () V!29871)

(declare-fun apply!461 (ListLongMap!10847 (_ BitVec 64)) V!29871)

(assert (=> b!906766 (= res!611645 (not (= (apply!461 lt!409071 k0!1033) lt!409068)))))

(declare-fun mapIsEmpty!29731 () Bool)

(declare-fun mapRes!29731 () Bool)

(assert (=> mapIsEmpty!29731 mapRes!29731))

(declare-fun b!906767 () Bool)

(assert (=> b!906767 (= e!508208 (not e!508215))))

(declare-fun res!611651 () Bool)

(assert (=> b!906767 (=> res!611651 e!508215)))

(assert (=> b!906767 (= res!611651 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26136 _keys!1386))))))

(declare-fun get!13504 (ValueCell!8858 V!29871) V!29871)

(declare-fun dynLambda!1352 (Int (_ BitVec 64)) V!29871)

(assert (=> b!906767 (= lt!409068 (get!13504 (select (arr!25675 _values!1152) i!717) (dynLambda!1352 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906767 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30732 0))(
  ( (Unit!30733) )
))
(declare-fun lt!409072 () Unit!30732)

(declare-fun lemmaKeyInListMapIsInArray!211 (array!53443 array!53441 (_ BitVec 32) (_ BitVec 32) V!29871 V!29871 (_ BitVec 64) Int) Unit!30732)

(assert (=> b!906767 (= lt!409072 (lemmaKeyInListMapIsInArray!211 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29731 () Bool)

(declare-fun tp!57046 () Bool)

(declare-fun e!508213 () Bool)

(assert (=> mapNonEmpty!29731 (= mapRes!29731 (and tp!57046 e!508213))))

(declare-fun mapValue!29731 () ValueCell!8858)

(declare-fun mapKey!29731 () (_ BitVec 32))

(declare-fun mapRest!29731 () (Array (_ BitVec 32) ValueCell!8858))

(assert (=> mapNonEmpty!29731 (= (arr!25675 _values!1152) (store mapRest!29731 mapKey!29731 mapValue!29731))))

(declare-fun b!906768 () Bool)

(assert (=> b!906768 (= e!508209 true)))

(declare-fun lt!409070 () ListLongMap!10847)

(assert (=> b!906768 (= (apply!461 lt!409070 k0!1033) lt!409068)))

(declare-fun lt!409069 () Unit!30732)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!17 (array!53443 array!53441 (_ BitVec 32) (_ BitVec 32) V!29871 V!29871 (_ BitVec 64) V!29871 (_ BitVec 32) Int) Unit!30732)

(assert (=> b!906768 (= lt!409069 (lemmaListMapApplyFromThenApplyFromZero!17 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409068 i!717 defaultEntry!1160))))

(declare-fun b!906769 () Bool)

(declare-fun res!611650 () Bool)

(assert (=> b!906769 (=> (not res!611650) (not e!508208))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906769 (= res!611650 (inRange!0 i!717 mask!1756))))

(declare-fun b!906770 () Bool)

(declare-fun e!508211 () Bool)

(assert (=> b!906770 (= e!508211 e!508208)))

(declare-fun res!611652 () Bool)

(assert (=> b!906770 (=> (not res!611652) (not e!508208))))

(assert (=> b!906770 (= res!611652 (contains!4494 lt!409070 k0!1033))))

(assert (=> b!906770 (= lt!409070 (getCurrentListMap!2705 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906771 () Bool)

(declare-fun res!611646 () Bool)

(assert (=> b!906771 (=> (not res!611646) (not e!508211))))

(declare-datatypes ((List!17991 0))(
  ( (Nil!17988) (Cons!17987 (h!19139 (_ BitVec 64)) (t!25416 List!17991)) )
))
(declare-fun arrayNoDuplicates!0 (array!53443 (_ BitVec 32) List!17991) Bool)

(assert (=> b!906771 (= res!611646 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17988))))

(declare-fun b!906772 () Bool)

(declare-fun res!611648 () Bool)

(assert (=> b!906772 (=> (not res!611648) (not e!508211))))

(assert (=> b!906772 (= res!611648 (and (= (size!26135 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26136 _keys!1386) (size!26135 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906773 () Bool)

(declare-fun tp_is_empty!18679 () Bool)

(assert (=> b!906773 (= e!508213 tp_is_empty!18679)))

(declare-fun b!906774 () Bool)

(declare-fun e!508214 () Bool)

(declare-fun e!508212 () Bool)

(assert (=> b!906774 (= e!508214 (and e!508212 mapRes!29731))))

(declare-fun condMapEmpty!29731 () Bool)

(declare-fun mapDefault!29731 () ValueCell!8858)

(assert (=> b!906774 (= condMapEmpty!29731 (= (arr!25675 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8858)) mapDefault!29731)))))

(declare-fun res!611644 () Bool)

(assert (=> start!77844 (=> (not res!611644) (not e!508211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77844 (= res!611644 (validMask!0 mask!1756))))

(assert (=> start!77844 e!508211))

(declare-fun array_inv!20172 (array!53441) Bool)

(assert (=> start!77844 (and (array_inv!20172 _values!1152) e!508214)))

(assert (=> start!77844 tp!57045))

(assert (=> start!77844 true))

(assert (=> start!77844 tp_is_empty!18679))

(declare-fun array_inv!20173 (array!53443) Bool)

(assert (=> start!77844 (array_inv!20173 _keys!1386)))

(declare-fun b!906775 () Bool)

(declare-fun res!611653 () Bool)

(assert (=> b!906775 (=> (not res!611653) (not e!508211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53443 (_ BitVec 32)) Bool)

(assert (=> b!906775 (= res!611653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906776 () Bool)

(assert (=> b!906776 (= e!508212 tp_is_empty!18679)))

(assert (= (and start!77844 res!611644) b!906772))

(assert (= (and b!906772 res!611648) b!906775))

(assert (= (and b!906775 res!611653) b!906771))

(assert (= (and b!906771 res!611646) b!906770))

(assert (= (and b!906770 res!611652) b!906769))

(assert (= (and b!906769 res!611650) b!906765))

(assert (= (and b!906765 res!611649) b!906767))

(assert (= (and b!906767 (not res!611651)) b!906764))

(assert (= (and b!906764 (not res!611647)) b!906766))

(assert (= (and b!906766 (not res!611645)) b!906768))

(assert (= (and b!906774 condMapEmpty!29731) mapIsEmpty!29731))

(assert (= (and b!906774 (not condMapEmpty!29731)) mapNonEmpty!29731))

(get-info :version)

(assert (= (and mapNonEmpty!29731 ((_ is ValueCellFull!8858) mapValue!29731)) b!906773))

(assert (= (and b!906774 ((_ is ValueCellFull!8858) mapDefault!29731)) b!906776))

(assert (= start!77844 b!906774))

(declare-fun b_lambda!13149 () Bool)

(assert (=> (not b_lambda!13149) (not b!906767)))

(declare-fun t!25414 () Bool)

(declare-fun tb!5275 () Bool)

(assert (=> (and start!77844 (= defaultEntry!1160 defaultEntry!1160) t!25414) tb!5275))

(declare-fun result!10353 () Bool)

(assert (=> tb!5275 (= result!10353 tp_is_empty!18679)))

(assert (=> b!906767 t!25414))

(declare-fun b_and!26687 () Bool)

(assert (= b_and!26685 (and (=> t!25414 result!10353) b_and!26687)))

(declare-fun m!842549 () Bool)

(assert (=> b!906767 m!842549))

(declare-fun m!842551 () Bool)

(assert (=> b!906767 m!842551))

(declare-fun m!842553 () Bool)

(assert (=> b!906767 m!842553))

(declare-fun m!842555 () Bool)

(assert (=> b!906767 m!842555))

(assert (=> b!906767 m!842549))

(assert (=> b!906767 m!842553))

(declare-fun m!842557 () Bool)

(assert (=> b!906767 m!842557))

(declare-fun m!842559 () Bool)

(assert (=> b!906768 m!842559))

(declare-fun m!842561 () Bool)

(assert (=> b!906768 m!842561))

(declare-fun m!842563 () Bool)

(assert (=> b!906764 m!842563))

(declare-fun m!842565 () Bool)

(assert (=> b!906764 m!842565))

(declare-fun m!842567 () Bool)

(assert (=> b!906769 m!842567))

(declare-fun m!842569 () Bool)

(assert (=> b!906770 m!842569))

(declare-fun m!842571 () Bool)

(assert (=> b!906770 m!842571))

(declare-fun m!842573 () Bool)

(assert (=> b!906766 m!842573))

(declare-fun m!842575 () Bool)

(assert (=> b!906775 m!842575))

(declare-fun m!842577 () Bool)

(assert (=> start!77844 m!842577))

(declare-fun m!842579 () Bool)

(assert (=> start!77844 m!842579))

(declare-fun m!842581 () Bool)

(assert (=> start!77844 m!842581))

(declare-fun m!842583 () Bool)

(assert (=> b!906771 m!842583))

(declare-fun m!842585 () Bool)

(assert (=> b!906765 m!842585))

(declare-fun m!842587 () Bool)

(assert (=> mapNonEmpty!29731 m!842587))

(check-sat (not b!906770) (not b_next!16261) (not b_lambda!13149) (not b!906768) (not b!906771) (not b!906767) (not b!906775) (not start!77844) (not b!906766) (not b!906764) b_and!26687 (not b!906769) (not mapNonEmpty!29731) tp_is_empty!18679)
(check-sat b_and!26687 (not b_next!16261))
