; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20282 () Bool)

(assert start!20282)

(declare-fun b_free!4941 () Bool)

(declare-fun b_next!4941 () Bool)

(assert (=> start!20282 (= b_free!4941 (not b_next!4941))))

(declare-fun tp!17855 () Bool)

(declare-fun b_and!11687 () Bool)

(assert (=> start!20282 (= tp!17855 b_and!11687)))

(declare-fun b!199664 () Bool)

(declare-fun res!94950 () Bool)

(declare-fun e!131035 () Bool)

(assert (=> b!199664 (=> (not res!94950) (not e!131035))))

(declare-datatypes ((array!8833 0))(
  ( (array!8834 (arr!4167 (Array (_ BitVec 32) (_ BitVec 64))) (size!4492 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8833)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!199664 (= res!94950 (= (select (arr!4167 _keys!825) i!601) k0!843))))

(declare-fun b!199665 () Bool)

(declare-fun e!131039 () Bool)

(declare-fun e!131036 () Bool)

(declare-fun mapRes!8264 () Bool)

(assert (=> b!199665 (= e!131039 (and e!131036 mapRes!8264))))

(declare-fun condMapEmpty!8264 () Bool)

(declare-datatypes ((V!6043 0))(
  ( (V!6044 (val!2443 Int)) )
))
(declare-datatypes ((ValueCell!2055 0))(
  ( (ValueCellFull!2055 (v!4413 V!6043)) (EmptyCell!2055) )
))
(declare-datatypes ((array!8835 0))(
  ( (array!8836 (arr!4168 (Array (_ BitVec 32) ValueCell!2055)) (size!4493 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8835)

(declare-fun mapDefault!8264 () ValueCell!2055)

(assert (=> b!199665 (= condMapEmpty!8264 (= (arr!4168 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2055)) mapDefault!8264)))))

(declare-fun b!199666 () Bool)

(declare-fun res!94949 () Bool)

(assert (=> b!199666 (=> (not res!94949) (not e!131035))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!199666 (= res!94949 (and (= (size!4493 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4492 _keys!825) (size!4493 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199667 () Bool)

(declare-fun res!94951 () Bool)

(assert (=> b!199667 (=> (not res!94951) (not e!131035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8833 (_ BitVec 32)) Bool)

(assert (=> b!199667 (= res!94951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199668 () Bool)

(declare-fun res!94945 () Bool)

(assert (=> b!199668 (=> (not res!94945) (not e!131035))))

(assert (=> b!199668 (= res!94945 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4492 _keys!825))))))

(declare-fun b!199669 () Bool)

(declare-fun tp_is_empty!4797 () Bool)

(assert (=> b!199669 (= e!131036 tp_is_empty!4797)))

(declare-fun mapIsEmpty!8264 () Bool)

(assert (=> mapIsEmpty!8264 mapRes!8264))

(declare-fun b!199671 () Bool)

(declare-fun res!94948 () Bool)

(assert (=> b!199671 (=> (not res!94948) (not e!131035))))

(declare-datatypes ((List!2611 0))(
  ( (Nil!2608) (Cons!2607 (h!3249 (_ BitVec 64)) (t!7542 List!2611)) )
))
(declare-fun arrayNoDuplicates!0 (array!8833 (_ BitVec 32) List!2611) Bool)

(assert (=> b!199671 (= res!94948 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2608))))

(declare-fun b!199672 () Bool)

(declare-fun e!131037 () Bool)

(assert (=> b!199672 (= e!131037 tp_is_empty!4797)))

(declare-fun mapNonEmpty!8264 () Bool)

(declare-fun tp!17854 () Bool)

(assert (=> mapNonEmpty!8264 (= mapRes!8264 (and tp!17854 e!131037))))

(declare-fun mapRest!8264 () (Array (_ BitVec 32) ValueCell!2055))

(declare-fun mapValue!8264 () ValueCell!2055)

(declare-fun mapKey!8264 () (_ BitVec 32))

(assert (=> mapNonEmpty!8264 (= (arr!4168 _values!649) (store mapRest!8264 mapKey!8264 mapValue!8264))))

(declare-fun b!199673 () Bool)

(declare-fun res!94947 () Bool)

(assert (=> b!199673 (=> (not res!94947) (not e!131035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199673 (= res!94947 (validKeyInArray!0 k0!843))))

(declare-fun b!199670 () Bool)

(assert (=> b!199670 (= e!131035 (not true))))

(declare-fun lt!98454 () array!8835)

(declare-datatypes ((tuple2!3694 0))(
  ( (tuple2!3695 (_1!1858 (_ BitVec 64)) (_2!1858 V!6043)) )
))
(declare-datatypes ((List!2612 0))(
  ( (Nil!2609) (Cons!2608 (h!3250 tuple2!3694) (t!7543 List!2612)) )
))
(declare-datatypes ((ListLongMap!2607 0))(
  ( (ListLongMap!2608 (toList!1319 List!2612)) )
))
(declare-fun lt!98452 () ListLongMap!2607)

(declare-fun zeroValue!615 () V!6043)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6043)

(declare-fun getCurrentListMap!910 (array!8833 array!8835 (_ BitVec 32) (_ BitVec 32) V!6043 V!6043 (_ BitVec 32) Int) ListLongMap!2607)

(assert (=> b!199670 (= lt!98452 (getCurrentListMap!910 _keys!825 lt!98454 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98457 () ListLongMap!2607)

(declare-fun lt!98456 () ListLongMap!2607)

(assert (=> b!199670 (and (= lt!98457 lt!98456) (= lt!98456 lt!98457))))

(declare-fun v!520 () V!6043)

(declare-fun lt!98453 () ListLongMap!2607)

(declare-fun +!346 (ListLongMap!2607 tuple2!3694) ListLongMap!2607)

(assert (=> b!199670 (= lt!98456 (+!346 lt!98453 (tuple2!3695 k0!843 v!520)))))

(declare-datatypes ((Unit!5994 0))(
  ( (Unit!5995) )
))
(declare-fun lt!98455 () Unit!5994)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!23 (array!8833 array!8835 (_ BitVec 32) (_ BitVec 32) V!6043 V!6043 (_ BitVec 32) (_ BitVec 64) V!6043 (_ BitVec 32) Int) Unit!5994)

(assert (=> b!199670 (= lt!98455 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!23 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!284 (array!8833 array!8835 (_ BitVec 32) (_ BitVec 32) V!6043 V!6043 (_ BitVec 32) Int) ListLongMap!2607)

(assert (=> b!199670 (= lt!98457 (getCurrentListMapNoExtraKeys!284 _keys!825 lt!98454 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199670 (= lt!98454 (array!8836 (store (arr!4168 _values!649) i!601 (ValueCellFull!2055 v!520)) (size!4493 _values!649)))))

(assert (=> b!199670 (= lt!98453 (getCurrentListMapNoExtraKeys!284 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!94946 () Bool)

(assert (=> start!20282 (=> (not res!94946) (not e!131035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20282 (= res!94946 (validMask!0 mask!1149))))

(assert (=> start!20282 e!131035))

(declare-fun array_inv!2737 (array!8835) Bool)

(assert (=> start!20282 (and (array_inv!2737 _values!649) e!131039)))

(assert (=> start!20282 true))

(assert (=> start!20282 tp_is_empty!4797))

(declare-fun array_inv!2738 (array!8833) Bool)

(assert (=> start!20282 (array_inv!2738 _keys!825)))

(assert (=> start!20282 tp!17855))

(assert (= (and start!20282 res!94946) b!199666))

(assert (= (and b!199666 res!94949) b!199667))

(assert (= (and b!199667 res!94951) b!199671))

(assert (= (and b!199671 res!94948) b!199668))

(assert (= (and b!199668 res!94945) b!199673))

(assert (= (and b!199673 res!94947) b!199664))

(assert (= (and b!199664 res!94950) b!199670))

(assert (= (and b!199665 condMapEmpty!8264) mapIsEmpty!8264))

(assert (= (and b!199665 (not condMapEmpty!8264)) mapNonEmpty!8264))

(get-info :version)

(assert (= (and mapNonEmpty!8264 ((_ is ValueCellFull!2055) mapValue!8264)) b!199672))

(assert (= (and b!199665 ((_ is ValueCellFull!2055) mapDefault!8264)) b!199669))

(assert (= start!20282 b!199665))

(declare-fun m!226115 () Bool)

(assert (=> b!199673 m!226115))

(declare-fun m!226117 () Bool)

(assert (=> b!199664 m!226117))

(declare-fun m!226119 () Bool)

(assert (=> mapNonEmpty!8264 m!226119))

(declare-fun m!226121 () Bool)

(assert (=> b!199667 m!226121))

(declare-fun m!226123 () Bool)

(assert (=> b!199670 m!226123))

(declare-fun m!226125 () Bool)

(assert (=> b!199670 m!226125))

(declare-fun m!226127 () Bool)

(assert (=> b!199670 m!226127))

(declare-fun m!226129 () Bool)

(assert (=> b!199670 m!226129))

(declare-fun m!226131 () Bool)

(assert (=> b!199670 m!226131))

(declare-fun m!226133 () Bool)

(assert (=> b!199670 m!226133))

(declare-fun m!226135 () Bool)

(assert (=> b!199671 m!226135))

(declare-fun m!226137 () Bool)

(assert (=> start!20282 m!226137))

(declare-fun m!226139 () Bool)

(assert (=> start!20282 m!226139))

(declare-fun m!226141 () Bool)

(assert (=> start!20282 m!226141))

(check-sat (not b_next!4941) tp_is_empty!4797 (not start!20282) (not b!199673) (not b!199671) (not b!199670) b_and!11687 (not b!199667) (not mapNonEmpty!8264))
(check-sat b_and!11687 (not b_next!4941))
