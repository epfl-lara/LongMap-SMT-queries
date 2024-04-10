; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20300 () Bool)

(assert start!20300)

(declare-fun b_free!4959 () Bool)

(declare-fun b_next!4959 () Bool)

(assert (=> start!20300 (= b_free!4959 (not b_next!4959))))

(declare-fun tp!17908 () Bool)

(declare-fun b_and!11705 () Bool)

(assert (=> start!20300 (= tp!17908 b_and!11705)))

(declare-fun mapNonEmpty!8291 () Bool)

(declare-fun mapRes!8291 () Bool)

(declare-fun tp!17909 () Bool)

(declare-fun e!131172 () Bool)

(assert (=> mapNonEmpty!8291 (= mapRes!8291 (and tp!17909 e!131172))))

(declare-datatypes ((V!6067 0))(
  ( (V!6068 (val!2452 Int)) )
))
(declare-datatypes ((ValueCell!2064 0))(
  ( (ValueCellFull!2064 (v!4422 V!6067)) (EmptyCell!2064) )
))
(declare-fun mapRest!8291 () (Array (_ BitVec 32) ValueCell!2064))

(declare-fun mapValue!8291 () ValueCell!2064)

(declare-fun mapKey!8291 () (_ BitVec 32))

(declare-datatypes ((array!8867 0))(
  ( (array!8868 (arr!4184 (Array (_ BitVec 32) ValueCell!2064)) (size!4509 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8867)

(assert (=> mapNonEmpty!8291 (= (arr!4184 _values!649) (store mapRest!8291 mapKey!8291 mapValue!8291))))

(declare-fun res!95138 () Bool)

(declare-fun e!131173 () Bool)

(assert (=> start!20300 (=> (not res!95138) (not e!131173))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20300 (= res!95138 (validMask!0 mask!1149))))

(assert (=> start!20300 e!131173))

(declare-fun e!131171 () Bool)

(declare-fun array_inv!2751 (array!8867) Bool)

(assert (=> start!20300 (and (array_inv!2751 _values!649) e!131171)))

(assert (=> start!20300 true))

(declare-fun tp_is_empty!4815 () Bool)

(assert (=> start!20300 tp_is_empty!4815))

(declare-datatypes ((array!8869 0))(
  ( (array!8870 (arr!4185 (Array (_ BitVec 32) (_ BitVec 64))) (size!4510 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8869)

(declare-fun array_inv!2752 (array!8869) Bool)

(assert (=> start!20300 (array_inv!2752 _keys!825)))

(assert (=> start!20300 tp!17908))

(declare-fun b!199934 () Bool)

(declare-fun res!95140 () Bool)

(assert (=> b!199934 (=> (not res!95140) (not e!131173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8869 (_ BitVec 32)) Bool)

(assert (=> b!199934 (= res!95140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199935 () Bool)

(assert (=> b!199935 (= e!131173 (not true))))

(declare-fun zeroValue!615 () V!6067)

(declare-fun defaultEntry!657 () Int)

(declare-fun lt!98615 () array!8867)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6067)

(declare-datatypes ((tuple2!3704 0))(
  ( (tuple2!3705 (_1!1863 (_ BitVec 64)) (_2!1863 V!6067)) )
))
(declare-datatypes ((List!2621 0))(
  ( (Nil!2618) (Cons!2617 (h!3259 tuple2!3704) (t!7552 List!2621)) )
))
(declare-datatypes ((ListLongMap!2617 0))(
  ( (ListLongMap!2618 (toList!1324 List!2621)) )
))
(declare-fun lt!98618 () ListLongMap!2617)

(declare-fun getCurrentListMap!915 (array!8869 array!8867 (_ BitVec 32) (_ BitVec 32) V!6067 V!6067 (_ BitVec 32) Int) ListLongMap!2617)

(assert (=> b!199935 (= lt!98618 (getCurrentListMap!915 _keys!825 lt!98615 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98616 () ListLongMap!2617)

(declare-fun lt!98619 () ListLongMap!2617)

(assert (=> b!199935 (and (= lt!98616 lt!98619) (= lt!98619 lt!98616))))

(declare-fun lt!98617 () ListLongMap!2617)

(declare-fun v!520 () V!6067)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!351 (ListLongMap!2617 tuple2!3704) ListLongMap!2617)

(assert (=> b!199935 (= lt!98619 (+!351 lt!98617 (tuple2!3705 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6004 0))(
  ( (Unit!6005) )
))
(declare-fun lt!98614 () Unit!6004)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!28 (array!8869 array!8867 (_ BitVec 32) (_ BitVec 32) V!6067 V!6067 (_ BitVec 32) (_ BitVec 64) V!6067 (_ BitVec 32) Int) Unit!6004)

(assert (=> b!199935 (= lt!98614 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!28 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!289 (array!8869 array!8867 (_ BitVec 32) (_ BitVec 32) V!6067 V!6067 (_ BitVec 32) Int) ListLongMap!2617)

(assert (=> b!199935 (= lt!98616 (getCurrentListMapNoExtraKeys!289 _keys!825 lt!98615 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199935 (= lt!98615 (array!8868 (store (arr!4184 _values!649) i!601 (ValueCellFull!2064 v!520)) (size!4509 _values!649)))))

(assert (=> b!199935 (= lt!98617 (getCurrentListMapNoExtraKeys!289 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199936 () Bool)

(declare-fun res!95137 () Bool)

(assert (=> b!199936 (=> (not res!95137) (not e!131173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199936 (= res!95137 (validKeyInArray!0 k0!843))))

(declare-fun b!199937 () Bool)

(declare-fun res!95134 () Bool)

(assert (=> b!199937 (=> (not res!95134) (not e!131173))))

(assert (=> b!199937 (= res!95134 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4510 _keys!825))))))

(declare-fun b!199938 () Bool)

(declare-fun res!95139 () Bool)

(assert (=> b!199938 (=> (not res!95139) (not e!131173))))

(declare-datatypes ((List!2622 0))(
  ( (Nil!2619) (Cons!2618 (h!3260 (_ BitVec 64)) (t!7553 List!2622)) )
))
(declare-fun arrayNoDuplicates!0 (array!8869 (_ BitVec 32) List!2622) Bool)

(assert (=> b!199938 (= res!95139 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2619))))

(declare-fun b!199939 () Bool)

(assert (=> b!199939 (= e!131172 tp_is_empty!4815)))

(declare-fun b!199940 () Bool)

(declare-fun e!131170 () Bool)

(assert (=> b!199940 (= e!131171 (and e!131170 mapRes!8291))))

(declare-fun condMapEmpty!8291 () Bool)

(declare-fun mapDefault!8291 () ValueCell!2064)

(assert (=> b!199940 (= condMapEmpty!8291 (= (arr!4184 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2064)) mapDefault!8291)))))

(declare-fun b!199941 () Bool)

(declare-fun res!95136 () Bool)

(assert (=> b!199941 (=> (not res!95136) (not e!131173))))

(assert (=> b!199941 (= res!95136 (= (select (arr!4185 _keys!825) i!601) k0!843))))

(declare-fun b!199942 () Bool)

(declare-fun res!95135 () Bool)

(assert (=> b!199942 (=> (not res!95135) (not e!131173))))

(assert (=> b!199942 (= res!95135 (and (= (size!4509 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4510 _keys!825) (size!4509 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8291 () Bool)

(assert (=> mapIsEmpty!8291 mapRes!8291))

(declare-fun b!199943 () Bool)

(assert (=> b!199943 (= e!131170 tp_is_empty!4815)))

(assert (= (and start!20300 res!95138) b!199942))

(assert (= (and b!199942 res!95135) b!199934))

(assert (= (and b!199934 res!95140) b!199938))

(assert (= (and b!199938 res!95139) b!199937))

(assert (= (and b!199937 res!95134) b!199936))

(assert (= (and b!199936 res!95137) b!199941))

(assert (= (and b!199941 res!95136) b!199935))

(assert (= (and b!199940 condMapEmpty!8291) mapIsEmpty!8291))

(assert (= (and b!199940 (not condMapEmpty!8291)) mapNonEmpty!8291))

(get-info :version)

(assert (= (and mapNonEmpty!8291 ((_ is ValueCellFull!2064) mapValue!8291)) b!199939))

(assert (= (and b!199940 ((_ is ValueCellFull!2064) mapDefault!8291)) b!199943))

(assert (= start!20300 b!199940))

(declare-fun m!226367 () Bool)

(assert (=> b!199935 m!226367))

(declare-fun m!226369 () Bool)

(assert (=> b!199935 m!226369))

(declare-fun m!226371 () Bool)

(assert (=> b!199935 m!226371))

(declare-fun m!226373 () Bool)

(assert (=> b!199935 m!226373))

(declare-fun m!226375 () Bool)

(assert (=> b!199935 m!226375))

(declare-fun m!226377 () Bool)

(assert (=> b!199935 m!226377))

(declare-fun m!226379 () Bool)

(assert (=> start!20300 m!226379))

(declare-fun m!226381 () Bool)

(assert (=> start!20300 m!226381))

(declare-fun m!226383 () Bool)

(assert (=> start!20300 m!226383))

(declare-fun m!226385 () Bool)

(assert (=> mapNonEmpty!8291 m!226385))

(declare-fun m!226387 () Bool)

(assert (=> b!199938 m!226387))

(declare-fun m!226389 () Bool)

(assert (=> b!199936 m!226389))

(declare-fun m!226391 () Bool)

(assert (=> b!199934 m!226391))

(declare-fun m!226393 () Bool)

(assert (=> b!199941 m!226393))

(check-sat (not start!20300) b_and!11705 (not b!199936) (not b!199935) (not b_next!4959) (not b!199934) tp_is_empty!4815 (not b!199938) (not mapNonEmpty!8291))
(check-sat b_and!11705 (not b_next!4959))
