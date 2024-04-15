; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111722 () Bool)

(assert start!111722)

(declare-fun b_free!30379 () Bool)

(declare-fun b_next!30379 () Bool)

(assert (=> start!111722 (= b_free!30379 (not b_next!30379))))

(declare-fun tp!106613 () Bool)

(declare-fun b_and!48899 () Bool)

(assert (=> start!111722 (= tp!106613 b_and!48899)))

(declare-fun b!1323774 () Bool)

(declare-fun res!878690 () Bool)

(declare-fun e!754647 () Bool)

(assert (=> b!1323774 (=> (not res!878690) (not e!754647))))

(declare-datatypes ((array!89247 0))(
  ( (array!89248 (arr!43098 (Array (_ BitVec 32) (_ BitVec 64))) (size!43650 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89247)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323774 (= res!878690 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43650 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55946 () Bool)

(declare-fun mapRes!55946 () Bool)

(assert (=> mapIsEmpty!55946 mapRes!55946))

(declare-fun b!1323775 () Bool)

(declare-fun res!878691 () Bool)

(assert (=> b!1323775 (=> (not res!878691) (not e!754647))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((V!53369 0))(
  ( (V!53370 (val!18174 Int)) )
))
(declare-datatypes ((ValueCell!17201 0))(
  ( (ValueCellFull!17201 (v!20803 V!53369)) (EmptyCell!17201) )
))
(declare-datatypes ((array!89249 0))(
  ( (array!89250 (arr!43099 (Array (_ BitVec 32) ValueCell!17201)) (size!43651 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89249)

(assert (=> b!1323775 (= res!878691 (and (= (size!43651 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43650 _keys!1609) (size!43651 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55946 () Bool)

(declare-fun tp!106614 () Bool)

(declare-fun e!754650 () Bool)

(assert (=> mapNonEmpty!55946 (= mapRes!55946 (and tp!106614 e!754650))))

(declare-fun mapValue!55946 () ValueCell!17201)

(declare-fun mapKey!55946 () (_ BitVec 32))

(declare-fun mapRest!55946 () (Array (_ BitVec 32) ValueCell!17201))

(assert (=> mapNonEmpty!55946 (= (arr!43099 _values!1337) (store mapRest!55946 mapKey!55946 mapValue!55946))))

(declare-fun b!1323776 () Bool)

(declare-fun res!878693 () Bool)

(assert (=> b!1323776 (=> (not res!878693) (not e!754647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89247 (_ BitVec 32)) Bool)

(assert (=> b!1323776 (= res!878693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323777 () Bool)

(assert (=> b!1323777 (= e!754647 false)))

(declare-fun lt!589215 () Bool)

(declare-fun zeroValue!1279 () V!53369)

(declare-fun minValue!1279 () V!53369)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23498 0))(
  ( (tuple2!23499 (_1!11760 (_ BitVec 64)) (_2!11760 V!53369)) )
))
(declare-datatypes ((List!30629 0))(
  ( (Nil!30626) (Cons!30625 (h!31834 tuple2!23498) (t!44547 List!30629)) )
))
(declare-datatypes ((ListLongMap!21155 0))(
  ( (ListLongMap!21156 (toList!10593 List!30629)) )
))
(declare-fun contains!8676 (ListLongMap!21155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5472 (array!89247 array!89249 (_ BitVec 32) (_ BitVec 32) V!53369 V!53369 (_ BitVec 32) Int) ListLongMap!21155)

(assert (=> b!1323777 (= lt!589215 (contains!8676 (getCurrentListMap!5472 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!878692 () Bool)

(assert (=> start!111722 (=> (not res!878692) (not e!754647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111722 (= res!878692 (validMask!0 mask!2019))))

(assert (=> start!111722 e!754647))

(declare-fun array_inv!32719 (array!89247) Bool)

(assert (=> start!111722 (array_inv!32719 _keys!1609)))

(assert (=> start!111722 true))

(declare-fun tp_is_empty!36199 () Bool)

(assert (=> start!111722 tp_is_empty!36199))

(declare-fun e!754651 () Bool)

(declare-fun array_inv!32720 (array!89249) Bool)

(assert (=> start!111722 (and (array_inv!32720 _values!1337) e!754651)))

(assert (=> start!111722 tp!106613))

(declare-fun b!1323778 () Bool)

(declare-fun e!754649 () Bool)

(assert (=> b!1323778 (= e!754649 tp_is_empty!36199)))

(declare-fun b!1323779 () Bool)

(assert (=> b!1323779 (= e!754651 (and e!754649 mapRes!55946))))

(declare-fun condMapEmpty!55946 () Bool)

(declare-fun mapDefault!55946 () ValueCell!17201)

(assert (=> b!1323779 (= condMapEmpty!55946 (= (arr!43099 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17201)) mapDefault!55946)))))

(declare-fun b!1323780 () Bool)

(declare-fun res!878694 () Bool)

(assert (=> b!1323780 (=> (not res!878694) (not e!754647))))

(declare-datatypes ((List!30630 0))(
  ( (Nil!30627) (Cons!30626 (h!31835 (_ BitVec 64)) (t!44548 List!30630)) )
))
(declare-fun arrayNoDuplicates!0 (array!89247 (_ BitVec 32) List!30630) Bool)

(assert (=> b!1323780 (= res!878694 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30627))))

(declare-fun b!1323781 () Bool)

(assert (=> b!1323781 (= e!754650 tp_is_empty!36199)))

(assert (= (and start!111722 res!878692) b!1323775))

(assert (= (and b!1323775 res!878691) b!1323776))

(assert (= (and b!1323776 res!878693) b!1323780))

(assert (= (and b!1323780 res!878694) b!1323774))

(assert (= (and b!1323774 res!878690) b!1323777))

(assert (= (and b!1323779 condMapEmpty!55946) mapIsEmpty!55946))

(assert (= (and b!1323779 (not condMapEmpty!55946)) mapNonEmpty!55946))

(get-info :version)

(assert (= (and mapNonEmpty!55946 ((_ is ValueCellFull!17201) mapValue!55946)) b!1323781))

(assert (= (and b!1323779 ((_ is ValueCellFull!17201) mapDefault!55946)) b!1323778))

(assert (= start!111722 b!1323779))

(declare-fun m!1212387 () Bool)

(assert (=> mapNonEmpty!55946 m!1212387))

(declare-fun m!1212389 () Bool)

(assert (=> b!1323780 m!1212389))

(declare-fun m!1212391 () Bool)

(assert (=> b!1323777 m!1212391))

(assert (=> b!1323777 m!1212391))

(declare-fun m!1212393 () Bool)

(assert (=> b!1323777 m!1212393))

(declare-fun m!1212395 () Bool)

(assert (=> start!111722 m!1212395))

(declare-fun m!1212397 () Bool)

(assert (=> start!111722 m!1212397))

(declare-fun m!1212399 () Bool)

(assert (=> start!111722 m!1212399))

(declare-fun m!1212401 () Bool)

(assert (=> b!1323776 m!1212401))

(check-sat (not start!111722) (not b!1323777) (not mapNonEmpty!55946) b_and!48899 (not b!1323776) (not b!1323780) (not b_next!30379) tp_is_empty!36199)
(check-sat b_and!48899 (not b_next!30379))
