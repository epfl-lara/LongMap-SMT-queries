; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20308 () Bool)

(assert start!20308)

(declare-fun b_free!4963 () Bool)

(declare-fun b_next!4963 () Bool)

(assert (=> start!20308 (= b_free!4963 (not b_next!4963))))

(declare-fun tp!17921 () Bool)

(declare-fun b_and!11723 () Bool)

(assert (=> start!20308 (= tp!17921 b_and!11723)))

(declare-fun mapIsEmpty!8297 () Bool)

(declare-fun mapRes!8297 () Bool)

(assert (=> mapIsEmpty!8297 mapRes!8297))

(declare-fun b!200041 () Bool)

(declare-fun e!131225 () Bool)

(declare-fun tp_is_empty!4819 () Bool)

(assert (=> b!200041 (= e!131225 tp_is_empty!4819)))

(declare-fun b!200042 () Bool)

(declare-fun res!95201 () Bool)

(declare-fun e!131228 () Bool)

(assert (=> b!200042 (=> (not res!95201) (not e!131228))))

(declare-datatypes ((array!8865 0))(
  ( (array!8866 (arr!4183 (Array (_ BitVec 32) (_ BitVec 64))) (size!4508 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8865)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6073 0))(
  ( (V!6074 (val!2454 Int)) )
))
(declare-datatypes ((ValueCell!2066 0))(
  ( (ValueCellFull!2066 (v!4425 V!6073)) (EmptyCell!2066) )
))
(declare-datatypes ((array!8867 0))(
  ( (array!8868 (arr!4184 (Array (_ BitVec 32) ValueCell!2066)) (size!4509 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8867)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!200042 (= res!95201 (and (= (size!4509 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4508 _keys!825) (size!4509 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200043 () Bool)

(declare-fun res!95200 () Bool)

(assert (=> b!200043 (=> (not res!95200) (not e!131228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8865 (_ BitVec 32)) Bool)

(assert (=> b!200043 (= res!95200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200044 () Bool)

(declare-fun res!95198 () Bool)

(assert (=> b!200044 (=> (not res!95198) (not e!131228))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200044 (= res!95198 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4508 _keys!825))))))

(declare-fun mapNonEmpty!8297 () Bool)

(declare-fun tp!17920 () Bool)

(assert (=> mapNonEmpty!8297 (= mapRes!8297 (and tp!17920 e!131225))))

(declare-fun mapKey!8297 () (_ BitVec 32))

(declare-fun mapRest!8297 () (Array (_ BitVec 32) ValueCell!2066))

(declare-fun mapValue!8297 () ValueCell!2066)

(assert (=> mapNonEmpty!8297 (= (arr!4184 _values!649) (store mapRest!8297 mapKey!8297 mapValue!8297))))

(declare-fun b!200045 () Bool)

(declare-fun res!95202 () Bool)

(assert (=> b!200045 (=> (not res!95202) (not e!131228))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!200045 (= res!95202 (= (select (arr!4183 _keys!825) i!601) k0!843))))

(declare-fun b!200046 () Bool)

(assert (=> b!200046 (= e!131228 (not true))))

(declare-datatypes ((tuple2!3648 0))(
  ( (tuple2!3649 (_1!1835 (_ BitVec 64)) (_2!1835 V!6073)) )
))
(declare-datatypes ((List!2568 0))(
  ( (Nil!2565) (Cons!2564 (h!3206 tuple2!3648) (t!7491 List!2568)) )
))
(declare-datatypes ((ListLongMap!2563 0))(
  ( (ListLongMap!2564 (toList!1297 List!2568)) )
))
(declare-fun lt!98709 () ListLongMap!2563)

(declare-fun zeroValue!615 () V!6073)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6073)

(declare-fun lt!98713 () array!8867)

(declare-fun getCurrentListMap!894 (array!8865 array!8867 (_ BitVec 32) (_ BitVec 32) V!6073 V!6073 (_ BitVec 32) Int) ListLongMap!2563)

(assert (=> b!200046 (= lt!98709 (getCurrentListMap!894 _keys!825 lt!98713 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98712 () ListLongMap!2563)

(declare-fun lt!98710 () ListLongMap!2563)

(assert (=> b!200046 (and (= lt!98712 lt!98710) (= lt!98710 lt!98712))))

(declare-fun lt!98711 () ListLongMap!2563)

(declare-fun v!520 () V!6073)

(declare-fun +!351 (ListLongMap!2563 tuple2!3648) ListLongMap!2563)

(assert (=> b!200046 (= lt!98710 (+!351 lt!98711 (tuple2!3649 k0!843 v!520)))))

(declare-datatypes ((Unit!5988 0))(
  ( (Unit!5989) )
))
(declare-fun lt!98714 () Unit!5988)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!30 (array!8865 array!8867 (_ BitVec 32) (_ BitVec 32) V!6073 V!6073 (_ BitVec 32) (_ BitVec 64) V!6073 (_ BitVec 32) Int) Unit!5988)

(assert (=> b!200046 (= lt!98714 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!30 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!287 (array!8865 array!8867 (_ BitVec 32) (_ BitVec 32) V!6073 V!6073 (_ BitVec 32) Int) ListLongMap!2563)

(assert (=> b!200046 (= lt!98712 (getCurrentListMapNoExtraKeys!287 _keys!825 lt!98713 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200046 (= lt!98713 (array!8868 (store (arr!4184 _values!649) i!601 (ValueCellFull!2066 v!520)) (size!4509 _values!649)))))

(assert (=> b!200046 (= lt!98711 (getCurrentListMapNoExtraKeys!287 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!95197 () Bool)

(assert (=> start!20308 (=> (not res!95197) (not e!131228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20308 (= res!95197 (validMask!0 mask!1149))))

(assert (=> start!20308 e!131228))

(declare-fun e!131227 () Bool)

(declare-fun array_inv!2729 (array!8867) Bool)

(assert (=> start!20308 (and (array_inv!2729 _values!649) e!131227)))

(assert (=> start!20308 true))

(assert (=> start!20308 tp_is_empty!4819))

(declare-fun array_inv!2730 (array!8865) Bool)

(assert (=> start!20308 (array_inv!2730 _keys!825)))

(assert (=> start!20308 tp!17921))

(declare-fun b!200047 () Bool)

(declare-fun res!95203 () Bool)

(assert (=> b!200047 (=> (not res!95203) (not e!131228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200047 (= res!95203 (validKeyInArray!0 k0!843))))

(declare-fun b!200048 () Bool)

(declare-fun e!131226 () Bool)

(assert (=> b!200048 (= e!131227 (and e!131226 mapRes!8297))))

(declare-fun condMapEmpty!8297 () Bool)

(declare-fun mapDefault!8297 () ValueCell!2066)

(assert (=> b!200048 (= condMapEmpty!8297 (= (arr!4184 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2066)) mapDefault!8297)))))

(declare-fun b!200049 () Bool)

(declare-fun res!95199 () Bool)

(assert (=> b!200049 (=> (not res!95199) (not e!131228))))

(declare-datatypes ((List!2569 0))(
  ( (Nil!2566) (Cons!2565 (h!3207 (_ BitVec 64)) (t!7492 List!2569)) )
))
(declare-fun arrayNoDuplicates!0 (array!8865 (_ BitVec 32) List!2569) Bool)

(assert (=> b!200049 (= res!95199 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2566))))

(declare-fun b!200050 () Bool)

(assert (=> b!200050 (= e!131226 tp_is_empty!4819)))

(assert (= (and start!20308 res!95197) b!200042))

(assert (= (and b!200042 res!95201) b!200043))

(assert (= (and b!200043 res!95200) b!200049))

(assert (= (and b!200049 res!95199) b!200044))

(assert (= (and b!200044 res!95198) b!200047))

(assert (= (and b!200047 res!95203) b!200045))

(assert (= (and b!200045 res!95202) b!200046))

(assert (= (and b!200048 condMapEmpty!8297) mapIsEmpty!8297))

(assert (= (and b!200048 (not condMapEmpty!8297)) mapNonEmpty!8297))

(get-info :version)

(assert (= (and mapNonEmpty!8297 ((_ is ValueCellFull!2066) mapValue!8297)) b!200041))

(assert (= (and b!200048 ((_ is ValueCellFull!2066) mapDefault!8297)) b!200050))

(assert (= start!20308 b!200048))

(declare-fun m!226605 () Bool)

(assert (=> b!200045 m!226605))

(declare-fun m!226607 () Bool)

(assert (=> b!200049 m!226607))

(declare-fun m!226609 () Bool)

(assert (=> b!200046 m!226609))

(declare-fun m!226611 () Bool)

(assert (=> b!200046 m!226611))

(declare-fun m!226613 () Bool)

(assert (=> b!200046 m!226613))

(declare-fun m!226615 () Bool)

(assert (=> b!200046 m!226615))

(declare-fun m!226617 () Bool)

(assert (=> b!200046 m!226617))

(declare-fun m!226619 () Bool)

(assert (=> b!200046 m!226619))

(declare-fun m!226621 () Bool)

(assert (=> mapNonEmpty!8297 m!226621))

(declare-fun m!226623 () Bool)

(assert (=> b!200047 m!226623))

(declare-fun m!226625 () Bool)

(assert (=> b!200043 m!226625))

(declare-fun m!226627 () Bool)

(assert (=> start!20308 m!226627))

(declare-fun m!226629 () Bool)

(assert (=> start!20308 m!226629))

(declare-fun m!226631 () Bool)

(assert (=> start!20308 m!226631))

(check-sat b_and!11723 (not mapNonEmpty!8297) (not b!200049) tp_is_empty!4819 (not b!200047) (not start!20308) (not b!200043) (not b_next!4963) (not b!200046))
(check-sat b_and!11723 (not b_next!4963))
