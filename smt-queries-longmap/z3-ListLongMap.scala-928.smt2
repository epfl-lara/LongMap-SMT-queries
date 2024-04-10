; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20666 () Bool)

(assert start!20666)

(declare-fun b_free!5325 () Bool)

(declare-fun b_next!5325 () Bool)

(assert (=> start!20666 (= b_free!5325 (not b_next!5325))))

(declare-fun tp!19006 () Bool)

(declare-fun b_and!12071 () Bool)

(assert (=> start!20666 (= tp!19006 b_and!12071)))

(declare-fun b!206486 () Bool)

(declare-fun res!100044 () Bool)

(declare-fun e!134952 () Bool)

(assert (=> b!206486 (=> (not res!100044) (not e!134952))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9573 0))(
  ( (array!9574 (arr!4537 (Array (_ BitVec 32) (_ BitVec 64))) (size!4862 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9573)

(assert (=> b!206486 (= res!100044 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4862 _keys!825))))))

(declare-fun b!206488 () Bool)

(declare-fun e!134950 () Bool)

(declare-fun tp_is_empty!5181 () Bool)

(assert (=> b!206488 (= e!134950 tp_is_empty!5181)))

(declare-fun b!206489 () Bool)

(declare-fun e!134954 () Bool)

(declare-fun e!134951 () Bool)

(declare-fun mapRes!8840 () Bool)

(assert (=> b!206489 (= e!134954 (and e!134951 mapRes!8840))))

(declare-fun condMapEmpty!8840 () Bool)

(declare-datatypes ((V!6555 0))(
  ( (V!6556 (val!2635 Int)) )
))
(declare-datatypes ((ValueCell!2247 0))(
  ( (ValueCellFull!2247 (v!4605 V!6555)) (EmptyCell!2247) )
))
(declare-datatypes ((array!9575 0))(
  ( (array!9576 (arr!4538 (Array (_ BitVec 32) ValueCell!2247)) (size!4863 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9575)

(declare-fun mapDefault!8840 () ValueCell!2247)

(assert (=> b!206489 (= condMapEmpty!8840 (= (arr!4538 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2247)) mapDefault!8840)))))

(declare-fun b!206490 () Bool)

(declare-fun res!100043 () Bool)

(assert (=> b!206490 (=> (not res!100043) (not e!134952))))

(declare-datatypes ((List!2895 0))(
  ( (Nil!2892) (Cons!2891 (h!3533 (_ BitVec 64)) (t!7826 List!2895)) )
))
(declare-fun arrayNoDuplicates!0 (array!9573 (_ BitVec 32) List!2895) Bool)

(assert (=> b!206490 (= res!100043 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2892))))

(declare-fun b!206491 () Bool)

(declare-fun res!100042 () Bool)

(assert (=> b!206491 (=> (not res!100042) (not e!134952))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!206491 (= res!100042 (= (select (arr!4537 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8840 () Bool)

(declare-fun tp!19007 () Bool)

(assert (=> mapNonEmpty!8840 (= mapRes!8840 (and tp!19007 e!134950))))

(declare-fun mapValue!8840 () ValueCell!2247)

(declare-fun mapKey!8840 () (_ BitVec 32))

(declare-fun mapRest!8840 () (Array (_ BitVec 32) ValueCell!2247))

(assert (=> mapNonEmpty!8840 (= (arr!4538 _values!649) (store mapRest!8840 mapKey!8840 mapValue!8840))))

(declare-fun b!206492 () Bool)

(assert (=> b!206492 (= e!134951 tp_is_empty!5181)))

(declare-fun mapIsEmpty!8840 () Bool)

(assert (=> mapIsEmpty!8840 mapRes!8840))

(declare-fun b!206493 () Bool)

(declare-fun res!100039 () Bool)

(assert (=> b!206493 (=> (not res!100039) (not e!134952))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9573 (_ BitVec 32)) Bool)

(assert (=> b!206493 (= res!100039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206487 () Bool)

(declare-fun res!100045 () Bool)

(assert (=> b!206487 (=> (not res!100045) (not e!134952))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206487 (= res!100045 (and (= (size!4863 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4862 _keys!825) (size!4863 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100041 () Bool)

(assert (=> start!20666 (=> (not res!100041) (not e!134952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20666 (= res!100041 (validMask!0 mask!1149))))

(assert (=> start!20666 e!134952))

(declare-fun array_inv!3001 (array!9575) Bool)

(assert (=> start!20666 (and (array_inv!3001 _values!649) e!134954)))

(assert (=> start!20666 true))

(assert (=> start!20666 tp_is_empty!5181))

(declare-fun array_inv!3002 (array!9573) Bool)

(assert (=> start!20666 (array_inv!3002 _keys!825)))

(assert (=> start!20666 tp!19006))

(declare-fun b!206494 () Bool)

(assert (=> b!206494 (= e!134952 (not true))))

(declare-datatypes ((tuple2!4004 0))(
  ( (tuple2!4005 (_1!2013 (_ BitVec 64)) (_2!2013 V!6555)) )
))
(declare-datatypes ((List!2896 0))(
  ( (Nil!2893) (Cons!2892 (h!3534 tuple2!4004) (t!7827 List!2896)) )
))
(declare-datatypes ((ListLongMap!2917 0))(
  ( (ListLongMap!2918 (toList!1474 List!2896)) )
))
(declare-fun lt!105609 () ListLongMap!2917)

(declare-fun zeroValue!615 () V!6555)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6555)

(declare-fun getCurrentListMap!1041 (array!9573 array!9575 (_ BitVec 32) (_ BitVec 32) V!6555 V!6555 (_ BitVec 32) Int) ListLongMap!2917)

(assert (=> b!206494 (= lt!105609 (getCurrentListMap!1041 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105605 () array!9575)

(declare-fun lt!105607 () ListLongMap!2917)

(assert (=> b!206494 (= lt!105607 (getCurrentListMap!1041 _keys!825 lt!105605 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105604 () ListLongMap!2917)

(declare-fun lt!105608 () ListLongMap!2917)

(assert (=> b!206494 (and (= lt!105604 lt!105608) (= lt!105608 lt!105604))))

(declare-fun lt!105606 () ListLongMap!2917)

(declare-fun v!520 () V!6555)

(declare-fun +!501 (ListLongMap!2917 tuple2!4004) ListLongMap!2917)

(assert (=> b!206494 (= lt!105608 (+!501 lt!105606 (tuple2!4005 k0!843 v!520)))))

(declare-datatypes ((Unit!6290 0))(
  ( (Unit!6291) )
))
(declare-fun lt!105603 () Unit!6290)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!154 (array!9573 array!9575 (_ BitVec 32) (_ BitVec 32) V!6555 V!6555 (_ BitVec 32) (_ BitVec 64) V!6555 (_ BitVec 32) Int) Unit!6290)

(assert (=> b!206494 (= lt!105603 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!154 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!415 (array!9573 array!9575 (_ BitVec 32) (_ BitVec 32) V!6555 V!6555 (_ BitVec 32) Int) ListLongMap!2917)

(assert (=> b!206494 (= lt!105604 (getCurrentListMapNoExtraKeys!415 _keys!825 lt!105605 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206494 (= lt!105605 (array!9576 (store (arr!4538 _values!649) i!601 (ValueCellFull!2247 v!520)) (size!4863 _values!649)))))

(assert (=> b!206494 (= lt!105606 (getCurrentListMapNoExtraKeys!415 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206495 () Bool)

(declare-fun res!100040 () Bool)

(assert (=> b!206495 (=> (not res!100040) (not e!134952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206495 (= res!100040 (validKeyInArray!0 k0!843))))

(assert (= (and start!20666 res!100041) b!206487))

(assert (= (and b!206487 res!100045) b!206493))

(assert (= (and b!206493 res!100039) b!206490))

(assert (= (and b!206490 res!100043) b!206486))

(assert (= (and b!206486 res!100044) b!206495))

(assert (= (and b!206495 res!100040) b!206491))

(assert (= (and b!206491 res!100042) b!206494))

(assert (= (and b!206489 condMapEmpty!8840) mapIsEmpty!8840))

(assert (= (and b!206489 (not condMapEmpty!8840)) mapNonEmpty!8840))

(get-info :version)

(assert (= (and mapNonEmpty!8840 ((_ is ValueCellFull!2247) mapValue!8840)) b!206488))

(assert (= (and b!206489 ((_ is ValueCellFull!2247) mapDefault!8840)) b!206492))

(assert (= start!20666 b!206489))

(declare-fun m!234229 () Bool)

(assert (=> mapNonEmpty!8840 m!234229))

(declare-fun m!234231 () Bool)

(assert (=> b!206491 m!234231))

(declare-fun m!234233 () Bool)

(assert (=> b!206493 m!234233))

(declare-fun m!234235 () Bool)

(assert (=> b!206490 m!234235))

(declare-fun m!234237 () Bool)

(assert (=> b!206494 m!234237))

(declare-fun m!234239 () Bool)

(assert (=> b!206494 m!234239))

(declare-fun m!234241 () Bool)

(assert (=> b!206494 m!234241))

(declare-fun m!234243 () Bool)

(assert (=> b!206494 m!234243))

(declare-fun m!234245 () Bool)

(assert (=> b!206494 m!234245))

(declare-fun m!234247 () Bool)

(assert (=> b!206494 m!234247))

(declare-fun m!234249 () Bool)

(assert (=> b!206494 m!234249))

(declare-fun m!234251 () Bool)

(assert (=> b!206495 m!234251))

(declare-fun m!234253 () Bool)

(assert (=> start!20666 m!234253))

(declare-fun m!234255 () Bool)

(assert (=> start!20666 m!234255))

(declare-fun m!234257 () Bool)

(assert (=> start!20666 m!234257))

(check-sat (not b!206493) (not mapNonEmpty!8840) (not b!206490) (not b!206495) (not start!20666) (not b_next!5325) b_and!12071 tp_is_empty!5181 (not b!206494))
(check-sat b_and!12071 (not b_next!5325))
