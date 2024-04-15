; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20668 () Bool)

(assert start!20668)

(declare-fun b_free!5323 () Bool)

(declare-fun b_next!5323 () Bool)

(assert (=> start!20668 (= b_free!5323 (not b_next!5323))))

(declare-fun tp!19000 () Bool)

(declare-fun b_and!12043 () Bool)

(assert (=> start!20668 (= tp!19000 b_and!12043)))

(declare-fun b!206309 () Bool)

(declare-fun e!134837 () Bool)

(declare-fun tp_is_empty!5179 () Bool)

(assert (=> b!206309 (= e!134837 tp_is_empty!5179)))

(declare-fun b!206310 () Bool)

(declare-fun res!99929 () Bool)

(declare-fun e!134838 () Bool)

(assert (=> b!206310 (=> (not res!99929) (not e!134838))))

(declare-datatypes ((array!9555 0))(
  ( (array!9556 (arr!4527 (Array (_ BitVec 32) (_ BitVec 64))) (size!4853 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9555)

(declare-datatypes ((List!2887 0))(
  ( (Nil!2884) (Cons!2883 (h!3525 (_ BitVec 64)) (t!7809 List!2887)) )
))
(declare-fun arrayNoDuplicates!0 (array!9555 (_ BitVec 32) List!2887) Bool)

(assert (=> b!206310 (= res!99929 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2884))))

(declare-fun b!206311 () Bool)

(declare-fun res!99928 () Bool)

(assert (=> b!206311 (=> (not res!99928) (not e!134838))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9555 (_ BitVec 32)) Bool)

(assert (=> b!206311 (= res!99928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206312 () Bool)

(declare-fun res!99926 () Bool)

(assert (=> b!206312 (=> (not res!99926) (not e!134838))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206312 (= res!99926 (= (select (arr!4527 _keys!825) i!601) k0!843))))

(declare-fun b!206313 () Bool)

(declare-fun res!99923 () Bool)

(assert (=> b!206313 (=> (not res!99923) (not e!134838))))

(assert (=> b!206313 (= res!99923 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4853 _keys!825))))))

(declare-fun mapNonEmpty!8837 () Bool)

(declare-fun mapRes!8837 () Bool)

(declare-fun tp!19001 () Bool)

(assert (=> mapNonEmpty!8837 (= mapRes!8837 (and tp!19001 e!134837))))

(declare-fun mapKey!8837 () (_ BitVec 32))

(declare-datatypes ((V!6553 0))(
  ( (V!6554 (val!2634 Int)) )
))
(declare-datatypes ((ValueCell!2246 0))(
  ( (ValueCellFull!2246 (v!4598 V!6553)) (EmptyCell!2246) )
))
(declare-datatypes ((array!9557 0))(
  ( (array!9558 (arr!4528 (Array (_ BitVec 32) ValueCell!2246)) (size!4854 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9557)

(declare-fun mapRest!8837 () (Array (_ BitVec 32) ValueCell!2246))

(declare-fun mapValue!8837 () ValueCell!2246)

(assert (=> mapNonEmpty!8837 (= (arr!4528 _values!649) (store mapRest!8837 mapKey!8837 mapValue!8837))))

(declare-fun b!206314 () Bool)

(declare-fun res!99924 () Bool)

(assert (=> b!206314 (=> (not res!99924) (not e!134838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206314 (= res!99924 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8837 () Bool)

(assert (=> mapIsEmpty!8837 mapRes!8837))

(declare-fun b!206315 () Bool)

(declare-fun e!134834 () Bool)

(declare-fun e!134836 () Bool)

(assert (=> b!206315 (= e!134834 (and e!134836 mapRes!8837))))

(declare-fun condMapEmpty!8837 () Bool)

(declare-fun mapDefault!8837 () ValueCell!2246)

(assert (=> b!206315 (= condMapEmpty!8837 (= (arr!4528 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2246)) mapDefault!8837)))))

(declare-fun res!99925 () Bool)

(assert (=> start!20668 (=> (not res!99925) (not e!134838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20668 (= res!99925 (validMask!0 mask!1149))))

(assert (=> start!20668 e!134838))

(declare-fun array_inv!2975 (array!9557) Bool)

(assert (=> start!20668 (and (array_inv!2975 _values!649) e!134834)))

(assert (=> start!20668 true))

(assert (=> start!20668 tp_is_empty!5179))

(declare-fun array_inv!2976 (array!9555) Bool)

(assert (=> start!20668 (array_inv!2976 _keys!825)))

(assert (=> start!20668 tp!19000))

(declare-fun b!206316 () Bool)

(assert (=> b!206316 (= e!134836 tp_is_empty!5179)))

(declare-fun b!206317 () Bool)

(assert (=> b!206317 (= e!134838 (not true))))

(declare-fun zeroValue!615 () V!6553)

(declare-datatypes ((tuple2!3986 0))(
  ( (tuple2!3987 (_1!2004 (_ BitVec 64)) (_2!2004 V!6553)) )
))
(declare-datatypes ((List!2888 0))(
  ( (Nil!2885) (Cons!2884 (h!3526 tuple2!3986) (t!7810 List!2888)) )
))
(declare-datatypes ((ListLongMap!2889 0))(
  ( (ListLongMap!2890 (toList!1460 List!2888)) )
))
(declare-fun lt!105405 () ListLongMap!2889)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6553)

(declare-fun getCurrentListMap!1001 (array!9555 array!9557 (_ BitVec 32) (_ BitVec 32) V!6553 V!6553 (_ BitVec 32) Int) ListLongMap!2889)

(assert (=> b!206317 (= lt!105405 (getCurrentListMap!1001 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105403 () array!9557)

(declare-fun lt!105406 () ListLongMap!2889)

(assert (=> b!206317 (= lt!105406 (getCurrentListMap!1001 _keys!825 lt!105403 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105402 () ListLongMap!2889)

(declare-fun lt!105401 () ListLongMap!2889)

(assert (=> b!206317 (and (= lt!105402 lt!105401) (= lt!105401 lt!105402))))

(declare-fun v!520 () V!6553)

(declare-fun lt!105407 () ListLongMap!2889)

(declare-fun +!509 (ListLongMap!2889 tuple2!3986) ListLongMap!2889)

(assert (=> b!206317 (= lt!105401 (+!509 lt!105407 (tuple2!3987 k0!843 v!520)))))

(declare-datatypes ((Unit!6258 0))(
  ( (Unit!6259) )
))
(declare-fun lt!105404 () Unit!6258)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!160 (array!9555 array!9557 (_ BitVec 32) (_ BitVec 32) V!6553 V!6553 (_ BitVec 32) (_ BitVec 64) V!6553 (_ BitVec 32) Int) Unit!6258)

(assert (=> b!206317 (= lt!105404 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!160 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!411 (array!9555 array!9557 (_ BitVec 32) (_ BitVec 32) V!6553 V!6553 (_ BitVec 32) Int) ListLongMap!2889)

(assert (=> b!206317 (= lt!105402 (getCurrentListMapNoExtraKeys!411 _keys!825 lt!105403 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206317 (= lt!105403 (array!9558 (store (arr!4528 _values!649) i!601 (ValueCellFull!2246 v!520)) (size!4854 _values!649)))))

(assert (=> b!206317 (= lt!105407 (getCurrentListMapNoExtraKeys!411 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206318 () Bool)

(declare-fun res!99927 () Bool)

(assert (=> b!206318 (=> (not res!99927) (not e!134838))))

(assert (=> b!206318 (= res!99927 (and (= (size!4854 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4853 _keys!825) (size!4854 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20668 res!99925) b!206318))

(assert (= (and b!206318 res!99927) b!206311))

(assert (= (and b!206311 res!99928) b!206310))

(assert (= (and b!206310 res!99929) b!206313))

(assert (= (and b!206313 res!99923) b!206314))

(assert (= (and b!206314 res!99924) b!206312))

(assert (= (and b!206312 res!99926) b!206317))

(assert (= (and b!206315 condMapEmpty!8837) mapIsEmpty!8837))

(assert (= (and b!206315 (not condMapEmpty!8837)) mapNonEmpty!8837))

(get-info :version)

(assert (= (and mapNonEmpty!8837 ((_ is ValueCellFull!2246) mapValue!8837)) b!206309))

(assert (= (and b!206315 ((_ is ValueCellFull!2246) mapDefault!8837)) b!206316))

(assert (= start!20668 b!206315))

(declare-fun m!233583 () Bool)

(assert (=> mapNonEmpty!8837 m!233583))

(declare-fun m!233585 () Bool)

(assert (=> start!20668 m!233585))

(declare-fun m!233587 () Bool)

(assert (=> start!20668 m!233587))

(declare-fun m!233589 () Bool)

(assert (=> start!20668 m!233589))

(declare-fun m!233591 () Bool)

(assert (=> b!206312 m!233591))

(declare-fun m!233593 () Bool)

(assert (=> b!206314 m!233593))

(declare-fun m!233595 () Bool)

(assert (=> b!206317 m!233595))

(declare-fun m!233597 () Bool)

(assert (=> b!206317 m!233597))

(declare-fun m!233599 () Bool)

(assert (=> b!206317 m!233599))

(declare-fun m!233601 () Bool)

(assert (=> b!206317 m!233601))

(declare-fun m!233603 () Bool)

(assert (=> b!206317 m!233603))

(declare-fun m!233605 () Bool)

(assert (=> b!206317 m!233605))

(declare-fun m!233607 () Bool)

(assert (=> b!206317 m!233607))

(declare-fun m!233609 () Bool)

(assert (=> b!206311 m!233609))

(declare-fun m!233611 () Bool)

(assert (=> b!206310 m!233611))

(check-sat (not b_next!5323) b_and!12043 (not b!206311) (not b!206317) (not b!206310) tp_is_empty!5179 (not b!206314) (not start!20668) (not mapNonEmpty!8837))
(check-sat b_and!12043 (not b_next!5323))
