; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20690 () Bool)

(assert start!20690)

(declare-fun b_free!5349 () Bool)

(declare-fun b_next!5349 () Bool)

(assert (=> start!20690 (= b_free!5349 (not b_next!5349))))

(declare-fun tp!19078 () Bool)

(declare-fun b_and!12095 () Bool)

(assert (=> start!20690 (= tp!19078 b_and!12095)))

(declare-fun b!206846 () Bool)

(declare-fun e!135132 () Bool)

(declare-fun e!135131 () Bool)

(declare-fun mapRes!8876 () Bool)

(assert (=> b!206846 (= e!135132 (and e!135131 mapRes!8876))))

(declare-fun condMapEmpty!8876 () Bool)

(declare-datatypes ((V!6587 0))(
  ( (V!6588 (val!2647 Int)) )
))
(declare-datatypes ((ValueCell!2259 0))(
  ( (ValueCellFull!2259 (v!4617 V!6587)) (EmptyCell!2259) )
))
(declare-datatypes ((array!9619 0))(
  ( (array!9620 (arr!4560 (Array (_ BitVec 32) ValueCell!2259)) (size!4885 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9619)

(declare-fun mapDefault!8876 () ValueCell!2259)

(assert (=> b!206846 (= condMapEmpty!8876 (= (arr!4560 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2259)) mapDefault!8876)))))

(declare-fun b!206847 () Bool)

(declare-fun res!100294 () Bool)

(declare-fun e!135130 () Bool)

(assert (=> b!206847 (=> (not res!100294) (not e!135130))))

(declare-datatypes ((array!9621 0))(
  ( (array!9622 (arr!4561 (Array (_ BitVec 32) (_ BitVec 64))) (size!4886 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9621)

(declare-datatypes ((List!2910 0))(
  ( (Nil!2907) (Cons!2906 (h!3548 (_ BitVec 64)) (t!7841 List!2910)) )
))
(declare-fun arrayNoDuplicates!0 (array!9621 (_ BitVec 32) List!2910) Bool)

(assert (=> b!206847 (= res!100294 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2907))))

(declare-fun b!206848 () Bool)

(declare-fun res!100295 () Bool)

(assert (=> b!206848 (=> (not res!100295) (not e!135130))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206848 (= res!100295 (validKeyInArray!0 k0!843))))

(declare-fun b!206849 () Bool)

(declare-fun res!100293 () Bool)

(assert (=> b!206849 (=> (not res!100293) (not e!135130))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206849 (= res!100293 (= (select (arr!4561 _keys!825) i!601) k0!843))))

(declare-fun b!206850 () Bool)

(declare-fun res!100292 () Bool)

(assert (=> b!206850 (=> (not res!100292) (not e!135130))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!206850 (= res!100292 (and (= (size!4885 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4886 _keys!825) (size!4885 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100296 () Bool)

(assert (=> start!20690 (=> (not res!100296) (not e!135130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20690 (= res!100296 (validMask!0 mask!1149))))

(assert (=> start!20690 e!135130))

(declare-fun array_inv!3017 (array!9619) Bool)

(assert (=> start!20690 (and (array_inv!3017 _values!649) e!135132)))

(assert (=> start!20690 true))

(declare-fun tp_is_empty!5205 () Bool)

(assert (=> start!20690 tp_is_empty!5205))

(declare-fun array_inv!3018 (array!9621) Bool)

(assert (=> start!20690 (array_inv!3018 _keys!825)))

(assert (=> start!20690 tp!19078))

(declare-fun b!206851 () Bool)

(assert (=> b!206851 (= e!135130 (not true))))

(declare-datatypes ((tuple2!4020 0))(
  ( (tuple2!4021 (_1!2021 (_ BitVec 64)) (_2!2021 V!6587)) )
))
(declare-datatypes ((List!2911 0))(
  ( (Nil!2908) (Cons!2907 (h!3549 tuple2!4020) (t!7842 List!2911)) )
))
(declare-datatypes ((ListLongMap!2933 0))(
  ( (ListLongMap!2934 (toList!1482 List!2911)) )
))
(declare-fun lt!105858 () ListLongMap!2933)

(declare-fun zeroValue!615 () V!6587)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6587)

(declare-fun getCurrentListMap!1049 (array!9621 array!9619 (_ BitVec 32) (_ BitVec 32) V!6587 V!6587 (_ BitVec 32) Int) ListLongMap!2933)

(assert (=> b!206851 (= lt!105858 (getCurrentListMap!1049 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105857 () ListLongMap!2933)

(declare-fun lt!105855 () array!9619)

(assert (=> b!206851 (= lt!105857 (getCurrentListMap!1049 _keys!825 lt!105855 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105859 () ListLongMap!2933)

(declare-fun lt!105861 () ListLongMap!2933)

(assert (=> b!206851 (and (= lt!105859 lt!105861) (= lt!105861 lt!105859))))

(declare-fun lt!105860 () ListLongMap!2933)

(declare-fun v!520 () V!6587)

(declare-fun +!509 (ListLongMap!2933 tuple2!4020) ListLongMap!2933)

(assert (=> b!206851 (= lt!105861 (+!509 lt!105860 (tuple2!4021 k0!843 v!520)))))

(declare-datatypes ((Unit!6306 0))(
  ( (Unit!6307) )
))
(declare-fun lt!105856 () Unit!6306)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!162 (array!9621 array!9619 (_ BitVec 32) (_ BitVec 32) V!6587 V!6587 (_ BitVec 32) (_ BitVec 64) V!6587 (_ BitVec 32) Int) Unit!6306)

(assert (=> b!206851 (= lt!105856 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!162 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!423 (array!9621 array!9619 (_ BitVec 32) (_ BitVec 32) V!6587 V!6587 (_ BitVec 32) Int) ListLongMap!2933)

(assert (=> b!206851 (= lt!105859 (getCurrentListMapNoExtraKeys!423 _keys!825 lt!105855 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206851 (= lt!105855 (array!9620 (store (arr!4560 _values!649) i!601 (ValueCellFull!2259 v!520)) (size!4885 _values!649)))))

(assert (=> b!206851 (= lt!105860 (getCurrentListMapNoExtraKeys!423 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206852 () Bool)

(declare-fun e!135133 () Bool)

(assert (=> b!206852 (= e!135133 tp_is_empty!5205)))

(declare-fun b!206853 () Bool)

(assert (=> b!206853 (= e!135131 tp_is_empty!5205)))

(declare-fun b!206854 () Bool)

(declare-fun res!100297 () Bool)

(assert (=> b!206854 (=> (not res!100297) (not e!135130))))

(assert (=> b!206854 (= res!100297 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4886 _keys!825))))))

(declare-fun b!206855 () Bool)

(declare-fun res!100291 () Bool)

(assert (=> b!206855 (=> (not res!100291) (not e!135130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9621 (_ BitVec 32)) Bool)

(assert (=> b!206855 (= res!100291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8876 () Bool)

(declare-fun tp!19079 () Bool)

(assert (=> mapNonEmpty!8876 (= mapRes!8876 (and tp!19079 e!135133))))

(declare-fun mapRest!8876 () (Array (_ BitVec 32) ValueCell!2259))

(declare-fun mapValue!8876 () ValueCell!2259)

(declare-fun mapKey!8876 () (_ BitVec 32))

(assert (=> mapNonEmpty!8876 (= (arr!4560 _values!649) (store mapRest!8876 mapKey!8876 mapValue!8876))))

(declare-fun mapIsEmpty!8876 () Bool)

(assert (=> mapIsEmpty!8876 mapRes!8876))

(assert (= (and start!20690 res!100296) b!206850))

(assert (= (and b!206850 res!100292) b!206855))

(assert (= (and b!206855 res!100291) b!206847))

(assert (= (and b!206847 res!100294) b!206854))

(assert (= (and b!206854 res!100297) b!206848))

(assert (= (and b!206848 res!100295) b!206849))

(assert (= (and b!206849 res!100293) b!206851))

(assert (= (and b!206846 condMapEmpty!8876) mapIsEmpty!8876))

(assert (= (and b!206846 (not condMapEmpty!8876)) mapNonEmpty!8876))

(get-info :version)

(assert (= (and mapNonEmpty!8876 ((_ is ValueCellFull!2259) mapValue!8876)) b!206852))

(assert (= (and b!206846 ((_ is ValueCellFull!2259) mapDefault!8876)) b!206853))

(assert (= start!20690 b!206846))

(declare-fun m!234589 () Bool)

(assert (=> b!206851 m!234589))

(declare-fun m!234591 () Bool)

(assert (=> b!206851 m!234591))

(declare-fun m!234593 () Bool)

(assert (=> b!206851 m!234593))

(declare-fun m!234595 () Bool)

(assert (=> b!206851 m!234595))

(declare-fun m!234597 () Bool)

(assert (=> b!206851 m!234597))

(declare-fun m!234599 () Bool)

(assert (=> b!206851 m!234599))

(declare-fun m!234601 () Bool)

(assert (=> b!206851 m!234601))

(declare-fun m!234603 () Bool)

(assert (=> b!206849 m!234603))

(declare-fun m!234605 () Bool)

(assert (=> mapNonEmpty!8876 m!234605))

(declare-fun m!234607 () Bool)

(assert (=> b!206848 m!234607))

(declare-fun m!234609 () Bool)

(assert (=> b!206855 m!234609))

(declare-fun m!234611 () Bool)

(assert (=> start!20690 m!234611))

(declare-fun m!234613 () Bool)

(assert (=> start!20690 m!234613))

(declare-fun m!234615 () Bool)

(assert (=> start!20690 m!234615))

(declare-fun m!234617 () Bool)

(assert (=> b!206847 m!234617))

(check-sat (not b_next!5349) (not b!206848) (not b!206851) tp_is_empty!5205 (not mapNonEmpty!8876) (not b!206847) b_and!12095 (not b!206855) (not start!20690))
(check-sat b_and!12095 (not b_next!5349))
