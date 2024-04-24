; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20668 () Bool)

(assert start!20668)

(declare-fun b_free!5323 () Bool)

(declare-fun b_next!5323 () Bool)

(assert (=> start!20668 (= b_free!5323 (not b_next!5323))))

(declare-fun tp!19001 () Bool)

(declare-fun b_and!12083 () Bool)

(assert (=> start!20668 (= tp!19001 b_and!12083)))

(declare-fun b!206503 () Bool)

(declare-fun res!100045 () Bool)

(declare-fun e!134960 () Bool)

(assert (=> b!206503 (=> (not res!100045) (not e!134960))))

(declare-datatypes ((array!9563 0))(
  ( (array!9564 (arr!4532 (Array (_ BitVec 32) (_ BitVec 64))) (size!4857 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9563)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206503 (= res!100045 (= (select (arr!4532 _keys!825) i!601) k0!843))))

(declare-fun b!206504 () Bool)

(declare-fun res!100043 () Bool)

(assert (=> b!206504 (=> (not res!100043) (not e!134960))))

(declare-datatypes ((List!2839 0))(
  ( (Nil!2836) (Cons!2835 (h!3477 (_ BitVec 64)) (t!7762 List!2839)) )
))
(declare-fun arrayNoDuplicates!0 (array!9563 (_ BitVec 32) List!2839) Bool)

(assert (=> b!206504 (= res!100043 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2836))))

(declare-fun b!206505 () Bool)

(declare-fun res!100044 () Bool)

(assert (=> b!206505 (=> (not res!100044) (not e!134960))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9563 (_ BitVec 32)) Bool)

(assert (=> b!206505 (= res!100044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206506 () Bool)

(declare-fun e!134959 () Bool)

(declare-fun tp_is_empty!5179 () Bool)

(assert (=> b!206506 (= e!134959 tp_is_empty!5179)))

(declare-fun b!206507 () Bool)

(declare-fun e!134961 () Bool)

(declare-fun e!134963 () Bool)

(declare-fun mapRes!8837 () Bool)

(assert (=> b!206507 (= e!134961 (and e!134963 mapRes!8837))))

(declare-fun condMapEmpty!8837 () Bool)

(declare-datatypes ((V!6553 0))(
  ( (V!6554 (val!2634 Int)) )
))
(declare-datatypes ((ValueCell!2246 0))(
  ( (ValueCellFull!2246 (v!4605 V!6553)) (EmptyCell!2246) )
))
(declare-datatypes ((array!9565 0))(
  ( (array!9566 (arr!4533 (Array (_ BitVec 32) ValueCell!2246)) (size!4858 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9565)

(declare-fun mapDefault!8837 () ValueCell!2246)

(assert (=> b!206507 (= condMapEmpty!8837 (= (arr!4533 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2246)) mapDefault!8837)))))

(declare-fun b!206508 () Bool)

(declare-fun res!100040 () Bool)

(assert (=> b!206508 (=> (not res!100040) (not e!134960))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206508 (= res!100040 (and (= (size!4858 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4857 _keys!825) (size!4858 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206509 () Bool)

(declare-fun res!100042 () Bool)

(assert (=> b!206509 (=> (not res!100042) (not e!134960))))

(assert (=> b!206509 (= res!100042 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4857 _keys!825))))))

(declare-fun b!206510 () Bool)

(assert (=> b!206510 (= e!134963 tp_is_empty!5179)))

(declare-fun mapIsEmpty!8837 () Bool)

(assert (=> mapIsEmpty!8837 mapRes!8837))

(declare-fun b!206511 () Bool)

(declare-fun res!100039 () Bool)

(assert (=> b!206511 (=> (not res!100039) (not e!134960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206511 (= res!100039 (validKeyInArray!0 k0!843))))

(declare-fun b!206512 () Bool)

(assert (=> b!206512 (= e!134960 (not true))))

(declare-datatypes ((tuple2!3952 0))(
  ( (tuple2!3953 (_1!1987 (_ BitVec 64)) (_2!1987 V!6553)) )
))
(declare-datatypes ((List!2840 0))(
  ( (Nil!2837) (Cons!2836 (h!3478 tuple2!3952) (t!7763 List!2840)) )
))
(declare-datatypes ((ListLongMap!2867 0))(
  ( (ListLongMap!2868 (toList!1449 List!2840)) )
))
(declare-fun lt!105642 () ListLongMap!2867)

(declare-fun zeroValue!615 () V!6553)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6553)

(declare-fun getCurrentListMap!1019 (array!9563 array!9565 (_ BitVec 32) (_ BitVec 32) V!6553 V!6553 (_ BitVec 32) Int) ListLongMap!2867)

(assert (=> b!206512 (= lt!105642 (getCurrentListMap!1019 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105644 () array!9565)

(declare-fun lt!105643 () ListLongMap!2867)

(assert (=> b!206512 (= lt!105643 (getCurrentListMap!1019 _keys!825 lt!105644 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105647 () ListLongMap!2867)

(declare-fun lt!105645 () ListLongMap!2867)

(assert (=> b!206512 (and (= lt!105647 lt!105645) (= lt!105645 lt!105647))))

(declare-fun lt!105646 () ListLongMap!2867)

(declare-fun v!520 () V!6553)

(declare-fun +!503 (ListLongMap!2867 tuple2!3952) ListLongMap!2867)

(assert (=> b!206512 (= lt!105645 (+!503 lt!105646 (tuple2!3953 k0!843 v!520)))))

(declare-datatypes ((Unit!6282 0))(
  ( (Unit!6283) )
))
(declare-fun lt!105641 () Unit!6282)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!155 (array!9563 array!9565 (_ BitVec 32) (_ BitVec 32) V!6553 V!6553 (_ BitVec 32) (_ BitVec 64) V!6553 (_ BitVec 32) Int) Unit!6282)

(assert (=> b!206512 (= lt!105641 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!155 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!412 (array!9563 array!9565 (_ BitVec 32) (_ BitVec 32) V!6553 V!6553 (_ BitVec 32) Int) ListLongMap!2867)

(assert (=> b!206512 (= lt!105647 (getCurrentListMapNoExtraKeys!412 _keys!825 lt!105644 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206512 (= lt!105644 (array!9566 (store (arr!4533 _values!649) i!601 (ValueCellFull!2246 v!520)) (size!4858 _values!649)))))

(assert (=> b!206512 (= lt!105646 (getCurrentListMapNoExtraKeys!412 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!100041 () Bool)

(assert (=> start!20668 (=> (not res!100041) (not e!134960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20668 (= res!100041 (validMask!0 mask!1149))))

(assert (=> start!20668 e!134960))

(declare-fun array_inv!2971 (array!9565) Bool)

(assert (=> start!20668 (and (array_inv!2971 _values!649) e!134961)))

(assert (=> start!20668 true))

(assert (=> start!20668 tp_is_empty!5179))

(declare-fun array_inv!2972 (array!9563) Bool)

(assert (=> start!20668 (array_inv!2972 _keys!825)))

(assert (=> start!20668 tp!19001))

(declare-fun mapNonEmpty!8837 () Bool)

(declare-fun tp!19000 () Bool)

(assert (=> mapNonEmpty!8837 (= mapRes!8837 (and tp!19000 e!134959))))

(declare-fun mapValue!8837 () ValueCell!2246)

(declare-fun mapKey!8837 () (_ BitVec 32))

(declare-fun mapRest!8837 () (Array (_ BitVec 32) ValueCell!2246))

(assert (=> mapNonEmpty!8837 (= (arr!4533 _values!649) (store mapRest!8837 mapKey!8837 mapValue!8837))))

(assert (= (and start!20668 res!100041) b!206508))

(assert (= (and b!206508 res!100040) b!206505))

(assert (= (and b!206505 res!100044) b!206504))

(assert (= (and b!206504 res!100043) b!206509))

(assert (= (and b!206509 res!100042) b!206511))

(assert (= (and b!206511 res!100039) b!206503))

(assert (= (and b!206503 res!100045) b!206512))

(assert (= (and b!206507 condMapEmpty!8837) mapIsEmpty!8837))

(assert (= (and b!206507 (not condMapEmpty!8837)) mapNonEmpty!8837))

(get-info :version)

(assert (= (and mapNonEmpty!8837 ((_ is ValueCellFull!2246) mapValue!8837)) b!206506))

(assert (= (and b!206507 ((_ is ValueCellFull!2246) mapDefault!8837)) b!206510))

(assert (= start!20668 b!206507))

(declare-fun m!234381 () Bool)

(assert (=> b!206504 m!234381))

(declare-fun m!234383 () Bool)

(assert (=> b!206505 m!234383))

(declare-fun m!234385 () Bool)

(assert (=> b!206511 m!234385))

(declare-fun m!234387 () Bool)

(assert (=> b!206503 m!234387))

(declare-fun m!234389 () Bool)

(assert (=> b!206512 m!234389))

(declare-fun m!234391 () Bool)

(assert (=> b!206512 m!234391))

(declare-fun m!234393 () Bool)

(assert (=> b!206512 m!234393))

(declare-fun m!234395 () Bool)

(assert (=> b!206512 m!234395))

(declare-fun m!234397 () Bool)

(assert (=> b!206512 m!234397))

(declare-fun m!234399 () Bool)

(assert (=> b!206512 m!234399))

(declare-fun m!234401 () Bool)

(assert (=> b!206512 m!234401))

(declare-fun m!234403 () Bool)

(assert (=> start!20668 m!234403))

(declare-fun m!234405 () Bool)

(assert (=> start!20668 m!234405))

(declare-fun m!234407 () Bool)

(assert (=> start!20668 m!234407))

(declare-fun m!234409 () Bool)

(assert (=> mapNonEmpty!8837 m!234409))

(check-sat (not b!206505) b_and!12083 (not b!206512) (not b_next!5323) (not start!20668) (not mapNonEmpty!8837) tp_is_empty!5179 (not b!206511) (not b!206504))
(check-sat b_and!12083 (not b_next!5323))
