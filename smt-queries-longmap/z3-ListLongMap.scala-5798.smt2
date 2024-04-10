; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74804 () Bool)

(assert start!74804)

(declare-fun b_free!15381 () Bool)

(declare-fun b_next!15381 () Bool)

(assert (=> start!74804 (= b_free!15381 (not b_next!15381))))

(declare-fun tp!53840 () Bool)

(declare-fun b_and!25429 () Bool)

(assert (=> start!74804 (= tp!53840 b_and!25429)))

(declare-fun mapIsEmpty!28068 () Bool)

(declare-fun mapRes!28068 () Bool)

(assert (=> mapIsEmpty!28068 mapRes!28068))

(declare-fun b!881821 () Bool)

(declare-fun res!599074 () Bool)

(declare-fun e!490759 () Bool)

(assert (=> b!881821 (=> (not res!599074) (not e!490759))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881821 (= res!599074 (validKeyInArray!0 k0!854))))

(declare-fun b!881822 () Bool)

(declare-fun e!490757 () Bool)

(assert (=> b!881822 (= e!490757 true)))

(declare-datatypes ((array!51378 0))(
  ( (array!51379 (arr!24710 (Array (_ BitVec 32) (_ BitVec 64))) (size!25150 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51378)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!51378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881822 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30092 0))(
  ( (Unit!30093) )
))
(declare-fun lt!398890 () Unit!30092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51378 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30092)

(assert (=> b!881822 (= lt!398890 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!17542 0))(
  ( (Nil!17539) (Cons!17538 (h!18669 (_ BitVec 64)) (t!24725 List!17542)) )
))
(declare-fun arrayNoDuplicates!0 (array!51378 (_ BitVec 32) List!17542) Bool)

(assert (=> b!881822 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17539)))

(declare-fun lt!398894 () Unit!30092)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51378 (_ BitVec 32) (_ BitVec 32)) Unit!30092)

(assert (=> b!881822 (= lt!398894 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881823 () Bool)

(declare-fun e!490758 () Bool)

(assert (=> b!881823 (= e!490759 e!490758)))

(declare-fun res!599077 () Bool)

(assert (=> b!881823 (=> (not res!599077) (not e!490758))))

(assert (=> b!881823 (= res!599077 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28547 0))(
  ( (V!28548 (val!8860 Int)) )
))
(declare-datatypes ((tuple2!11730 0))(
  ( (tuple2!11731 (_1!5876 (_ BitVec 64)) (_2!5876 V!28547)) )
))
(declare-datatypes ((List!17543 0))(
  ( (Nil!17540) (Cons!17539 (h!18670 tuple2!11730) (t!24726 List!17543)) )
))
(declare-datatypes ((ListLongMap!10499 0))(
  ( (ListLongMap!10500 (toList!5265 List!17543)) )
))
(declare-fun lt!398892 () ListLongMap!10499)

(declare-datatypes ((ValueCell!8373 0))(
  ( (ValueCellFull!8373 (v!11320 V!28547)) (EmptyCell!8373) )
))
(declare-datatypes ((array!51380 0))(
  ( (array!51381 (arr!24711 (Array (_ BitVec 32) ValueCell!8373)) (size!25151 (_ BitVec 32))) )
))
(declare-fun lt!398893 () array!51380)

(declare-fun minValue!654 () V!28547)

(declare-fun zeroValue!654 () V!28547)

(declare-fun getCurrentListMapNoExtraKeys!3228 (array!51378 array!51380 (_ BitVec 32) (_ BitVec 32) V!28547 V!28547 (_ BitVec 32) Int) ListLongMap!10499)

(assert (=> b!881823 (= lt!398892 (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!398893 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28547)

(declare-fun _values!688 () array!51380)

(assert (=> b!881823 (= lt!398893 (array!51381 (store (arr!24711 _values!688) i!612 (ValueCellFull!8373 v!557)) (size!25151 _values!688)))))

(declare-fun lt!398889 () ListLongMap!10499)

(assert (=> b!881823 (= lt!398889 (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881824 () Bool)

(declare-fun e!490761 () Bool)

(declare-fun tp_is_empty!17625 () Bool)

(assert (=> b!881824 (= e!490761 tp_is_empty!17625)))

(declare-fun b!881825 () Bool)

(declare-fun e!490754 () Bool)

(assert (=> b!881825 (= e!490754 (and e!490761 mapRes!28068))))

(declare-fun condMapEmpty!28068 () Bool)

(declare-fun mapDefault!28068 () ValueCell!8373)

(assert (=> b!881825 (= condMapEmpty!28068 (= (arr!24711 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8373)) mapDefault!28068)))))

(declare-fun b!881826 () Bool)

(declare-fun res!599071 () Bool)

(assert (=> b!881826 (=> (not res!599071) (not e!490759))))

(assert (=> b!881826 (= res!599071 (and (= (size!25151 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25150 _keys!868) (size!25151 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881827 () Bool)

(declare-fun res!599079 () Bool)

(assert (=> b!881827 (=> (not res!599079) (not e!490759))))

(assert (=> b!881827 (= res!599079 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17539))))

(declare-fun b!881828 () Bool)

(declare-fun res!599076 () Bool)

(assert (=> b!881828 (=> (not res!599076) (not e!490759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51378 (_ BitVec 32)) Bool)

(assert (=> b!881828 (= res!599076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!28068 () Bool)

(declare-fun tp!53839 () Bool)

(declare-fun e!490760 () Bool)

(assert (=> mapNonEmpty!28068 (= mapRes!28068 (and tp!53839 e!490760))))

(declare-fun mapValue!28068 () ValueCell!8373)

(declare-fun mapRest!28068 () (Array (_ BitVec 32) ValueCell!8373))

(declare-fun mapKey!28068 () (_ BitVec 32))

(assert (=> mapNonEmpty!28068 (= (arr!24711 _values!688) (store mapRest!28068 mapKey!28068 mapValue!28068))))

(declare-fun b!881829 () Bool)

(declare-fun e!490755 () Bool)

(assert (=> b!881829 (= e!490758 (not e!490755))))

(declare-fun res!599078 () Bool)

(assert (=> b!881829 (=> res!599078 e!490755)))

(assert (=> b!881829 (= res!599078 (not (validKeyInArray!0 (select (arr!24710 _keys!868) from!1053))))))

(declare-fun lt!398888 () ListLongMap!10499)

(declare-fun lt!398887 () ListLongMap!10499)

(assert (=> b!881829 (= lt!398888 lt!398887)))

(declare-fun lt!398886 () ListLongMap!10499)

(declare-fun +!2537 (ListLongMap!10499 tuple2!11730) ListLongMap!10499)

(assert (=> b!881829 (= lt!398887 (+!2537 lt!398886 (tuple2!11731 k0!854 v!557)))))

(assert (=> b!881829 (= lt!398888 (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!398893 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881829 (= lt!398886 (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398891 () Unit!30092)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!726 (array!51378 array!51380 (_ BitVec 32) (_ BitVec 32) V!28547 V!28547 (_ BitVec 32) (_ BitVec 64) V!28547 (_ BitVec 32) Int) Unit!30092)

(assert (=> b!881829 (= lt!398891 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!726 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881820 () Bool)

(declare-fun res!599073 () Bool)

(assert (=> b!881820 (=> (not res!599073) (not e!490759))))

(assert (=> b!881820 (= res!599073 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25150 _keys!868))))))

(declare-fun res!599070 () Bool)

(assert (=> start!74804 (=> (not res!599070) (not e!490759))))

(assert (=> start!74804 (= res!599070 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25150 _keys!868))))))

(assert (=> start!74804 e!490759))

(assert (=> start!74804 tp_is_empty!17625))

(assert (=> start!74804 true))

(assert (=> start!74804 tp!53840))

(declare-fun array_inv!19460 (array!51378) Bool)

(assert (=> start!74804 (array_inv!19460 _keys!868)))

(declare-fun array_inv!19461 (array!51380) Bool)

(assert (=> start!74804 (and (array_inv!19461 _values!688) e!490754)))

(declare-fun b!881830 () Bool)

(declare-fun res!599075 () Bool)

(assert (=> b!881830 (=> (not res!599075) (not e!490759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881830 (= res!599075 (validMask!0 mask!1196))))

(declare-fun b!881831 () Bool)

(declare-fun res!599069 () Bool)

(assert (=> b!881831 (=> (not res!599069) (not e!490759))))

(assert (=> b!881831 (= res!599069 (and (= (select (arr!24710 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881832 () Bool)

(assert (=> b!881832 (= e!490755 e!490757)))

(declare-fun res!599072 () Bool)

(assert (=> b!881832 (=> res!599072 e!490757)))

(assert (=> b!881832 (= res!599072 (not (= (select (arr!24710 _keys!868) from!1053) k0!854)))))

(declare-fun get!13006 (ValueCell!8373 V!28547) V!28547)

(declare-fun dynLambda!1251 (Int (_ BitVec 64)) V!28547)

(assert (=> b!881832 (= lt!398892 (+!2537 lt!398887 (tuple2!11731 (select (arr!24710 _keys!868) from!1053) (get!13006 (select (arr!24711 _values!688) from!1053) (dynLambda!1251 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881833 () Bool)

(assert (=> b!881833 (= e!490760 tp_is_empty!17625)))

(assert (= (and start!74804 res!599070) b!881830))

(assert (= (and b!881830 res!599075) b!881826))

(assert (= (and b!881826 res!599071) b!881828))

(assert (= (and b!881828 res!599076) b!881827))

(assert (= (and b!881827 res!599079) b!881820))

(assert (= (and b!881820 res!599073) b!881821))

(assert (= (and b!881821 res!599074) b!881831))

(assert (= (and b!881831 res!599069) b!881823))

(assert (= (and b!881823 res!599077) b!881829))

(assert (= (and b!881829 (not res!599078)) b!881832))

(assert (= (and b!881832 (not res!599072)) b!881822))

(assert (= (and b!881825 condMapEmpty!28068) mapIsEmpty!28068))

(assert (= (and b!881825 (not condMapEmpty!28068)) mapNonEmpty!28068))

(get-info :version)

(assert (= (and mapNonEmpty!28068 ((_ is ValueCellFull!8373) mapValue!28068)) b!881833))

(assert (= (and b!881825 ((_ is ValueCellFull!8373) mapDefault!28068)) b!881824))

(assert (= start!74804 b!881825))

(declare-fun b_lambda!12591 () Bool)

(assert (=> (not b_lambda!12591) (not b!881832)))

(declare-fun t!24724 () Bool)

(declare-fun tb!5039 () Bool)

(assert (=> (and start!74804 (= defaultEntry!696 defaultEntry!696) t!24724) tb!5039))

(declare-fun result!9709 () Bool)

(assert (=> tb!5039 (= result!9709 tp_is_empty!17625)))

(assert (=> b!881832 t!24724))

(declare-fun b_and!25431 () Bool)

(assert (= b_and!25429 (and (=> t!24724 result!9709) b_and!25431)))

(declare-fun m!821715 () Bool)

(assert (=> b!881822 m!821715))

(declare-fun m!821717 () Bool)

(assert (=> b!881822 m!821717))

(declare-fun m!821719 () Bool)

(assert (=> b!881822 m!821719))

(declare-fun m!821721 () Bool)

(assert (=> b!881822 m!821721))

(declare-fun m!821723 () Bool)

(assert (=> b!881828 m!821723))

(declare-fun m!821725 () Bool)

(assert (=> b!881832 m!821725))

(declare-fun m!821727 () Bool)

(assert (=> b!881832 m!821727))

(declare-fun m!821729 () Bool)

(assert (=> b!881832 m!821729))

(declare-fun m!821731 () Bool)

(assert (=> b!881832 m!821731))

(assert (=> b!881832 m!821727))

(declare-fun m!821733 () Bool)

(assert (=> b!881832 m!821733))

(assert (=> b!881832 m!821725))

(declare-fun m!821735 () Bool)

(assert (=> b!881831 m!821735))

(declare-fun m!821737 () Bool)

(assert (=> b!881821 m!821737))

(assert (=> b!881829 m!821731))

(declare-fun m!821739 () Bool)

(assert (=> b!881829 m!821739))

(assert (=> b!881829 m!821731))

(declare-fun m!821741 () Bool)

(assert (=> b!881829 m!821741))

(declare-fun m!821743 () Bool)

(assert (=> b!881829 m!821743))

(declare-fun m!821745 () Bool)

(assert (=> b!881829 m!821745))

(declare-fun m!821747 () Bool)

(assert (=> b!881829 m!821747))

(declare-fun m!821749 () Bool)

(assert (=> mapNonEmpty!28068 m!821749))

(declare-fun m!821751 () Bool)

(assert (=> b!881827 m!821751))

(declare-fun m!821753 () Bool)

(assert (=> b!881830 m!821753))

(declare-fun m!821755 () Bool)

(assert (=> b!881823 m!821755))

(declare-fun m!821757 () Bool)

(assert (=> b!881823 m!821757))

(declare-fun m!821759 () Bool)

(assert (=> b!881823 m!821759))

(declare-fun m!821761 () Bool)

(assert (=> start!74804 m!821761))

(declare-fun m!821763 () Bool)

(assert (=> start!74804 m!821763))

(check-sat (not b_next!15381) (not b!881829) (not b!881832) b_and!25431 tp_is_empty!17625 (not b!881828) (not mapNonEmpty!28068) (not b!881830) (not start!74804) (not b!881827) (not b_lambda!12591) (not b!881823) (not b!881821) (not b!881822))
(check-sat b_and!25431 (not b_next!15381))
