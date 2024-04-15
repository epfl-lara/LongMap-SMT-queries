; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74558 () Bool)

(assert start!74558)

(declare-fun b_free!15265 () Bool)

(declare-fun b_next!15265 () Bool)

(assert (=> start!74558 (= b_free!15265 (not b_next!15265))))

(declare-fun tp!53477 () Bool)

(declare-fun b_and!25115 () Bool)

(assert (=> start!74558 (= tp!53477 b_and!25115)))

(declare-fun b!878471 () Bool)

(declare-fun e!488880 () Bool)

(declare-fun tp_is_empty!17509 () Bool)

(assert (=> b!878471 (= e!488880 tp_is_empty!17509)))

(declare-fun b!878472 () Bool)

(declare-fun e!488877 () Bool)

(declare-fun e!488875 () Bool)

(assert (=> b!878472 (= e!488877 e!488875)))

(declare-fun res!596870 () Bool)

(assert (=> b!878472 (=> (not res!596870) (not e!488875))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878472 (= res!596870 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28393 0))(
  ( (V!28394 (val!8802 Int)) )
))
(declare-datatypes ((tuple2!11658 0))(
  ( (tuple2!11659 (_1!5840 (_ BitVec 64)) (_2!5840 V!28393)) )
))
(declare-datatypes ((List!17458 0))(
  ( (Nil!17455) (Cons!17454 (h!18585 tuple2!11658) (t!24538 List!17458)) )
))
(declare-datatypes ((ListLongMap!10417 0))(
  ( (ListLongMap!10418 (toList!5224 List!17458)) )
))
(declare-fun lt!397072 () ListLongMap!10417)

(declare-datatypes ((array!51123 0))(
  ( (array!51124 (arr!24588 (Array (_ BitVec 32) (_ BitVec 64))) (size!25030 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51123)

(declare-datatypes ((ValueCell!8315 0))(
  ( (ValueCellFull!8315 (v!11236 V!28393)) (EmptyCell!8315) )
))
(declare-datatypes ((array!51125 0))(
  ( (array!51126 (arr!24589 (Array (_ BitVec 32) ValueCell!8315)) (size!25031 (_ BitVec 32))) )
))
(declare-fun lt!397075 () array!51125)

(declare-fun minValue!654 () V!28393)

(declare-fun zeroValue!654 () V!28393)

(declare-fun getCurrentListMapNoExtraKeys!3217 (array!51123 array!51125 (_ BitVec 32) (_ BitVec 32) V!28393 V!28393 (_ BitVec 32) Int) ListLongMap!10417)

(assert (=> b!878472 (= lt!397072 (getCurrentListMapNoExtraKeys!3217 _keys!868 lt!397075 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!51125)

(declare-fun v!557 () V!28393)

(assert (=> b!878472 (= lt!397075 (array!51126 (store (arr!24589 _values!688) i!612 (ValueCellFull!8315 v!557)) (size!25031 _values!688)))))

(declare-fun lt!397074 () ListLongMap!10417)

(assert (=> b!878472 (= lt!397074 (getCurrentListMapNoExtraKeys!3217 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878473 () Bool)

(declare-fun res!596877 () Bool)

(assert (=> b!878473 (=> (not res!596877) (not e!488877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878473 (= res!596877 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27879 () Bool)

(declare-fun mapRes!27879 () Bool)

(assert (=> mapIsEmpty!27879 mapRes!27879))

(declare-fun b!878474 () Bool)

(declare-fun res!596869 () Bool)

(assert (=> b!878474 (=> (not res!596869) (not e!488877))))

(declare-datatypes ((List!17459 0))(
  ( (Nil!17456) (Cons!17455 (h!18586 (_ BitVec 64)) (t!24539 List!17459)) )
))
(declare-fun arrayNoDuplicates!0 (array!51123 (_ BitVec 32) List!17459) Bool)

(assert (=> b!878474 (= res!596869 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17456))))

(declare-fun b!878475 () Bool)

(declare-fun res!596875 () Bool)

(assert (=> b!878475 (=> (not res!596875) (not e!488877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51123 (_ BitVec 32)) Bool)

(assert (=> b!878475 (= res!596875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878476 () Bool)

(declare-fun res!596874 () Bool)

(assert (=> b!878476 (=> (not res!596874) (not e!488877))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!878476 (= res!596874 (and (= (select (arr!24588 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878477 () Bool)

(declare-fun res!596871 () Bool)

(assert (=> b!878477 (=> (not res!596871) (not e!488877))))

(assert (=> b!878477 (= res!596871 (and (= (size!25031 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25030 _keys!868) (size!25031 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878478 () Bool)

(declare-fun e!488879 () Bool)

(assert (=> b!878478 (= e!488879 tp_is_empty!17509)))

(declare-fun b!878479 () Bool)

(declare-fun e!488878 () Bool)

(assert (=> b!878479 (= e!488878 (and e!488880 mapRes!27879))))

(declare-fun condMapEmpty!27879 () Bool)

(declare-fun mapDefault!27879 () ValueCell!8315)

(assert (=> b!878479 (= condMapEmpty!27879 (= (arr!24589 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8315)) mapDefault!27879)))))

(declare-fun mapNonEmpty!27879 () Bool)

(declare-fun tp!53478 () Bool)

(assert (=> mapNonEmpty!27879 (= mapRes!27879 (and tp!53478 e!488879))))

(declare-fun mapValue!27879 () ValueCell!8315)

(declare-fun mapRest!27879 () (Array (_ BitVec 32) ValueCell!8315))

(declare-fun mapKey!27879 () (_ BitVec 32))

(assert (=> mapNonEmpty!27879 (= (arr!24589 _values!688) (store mapRest!27879 mapKey!27879 mapValue!27879))))

(declare-fun res!596872 () Bool)

(assert (=> start!74558 (=> (not res!596872) (not e!488877))))

(assert (=> start!74558 (= res!596872 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25030 _keys!868))))))

(assert (=> start!74558 e!488877))

(assert (=> start!74558 tp_is_empty!17509))

(assert (=> start!74558 true))

(assert (=> start!74558 tp!53477))

(declare-fun array_inv!19418 (array!51123) Bool)

(assert (=> start!74558 (array_inv!19418 _keys!868)))

(declare-fun array_inv!19419 (array!51125) Bool)

(assert (=> start!74558 (and (array_inv!19419 _values!688) e!488878)))

(declare-fun b!878480 () Bool)

(declare-fun res!596876 () Bool)

(assert (=> b!878480 (=> (not res!596876) (not e!488877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878480 (= res!596876 (validKeyInArray!0 k0!854))))

(declare-fun b!878481 () Bool)

(assert (=> b!878481 (= e!488875 (not (bvslt from!1053 (size!25030 _keys!868))))))

(declare-fun +!2520 (ListLongMap!10417 tuple2!11658) ListLongMap!10417)

(assert (=> b!878481 (= (getCurrentListMapNoExtraKeys!3217 _keys!868 lt!397075 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2520 (getCurrentListMapNoExtraKeys!3217 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11659 k0!854 v!557)))))

(declare-datatypes ((Unit!29955 0))(
  ( (Unit!29956) )
))
(declare-fun lt!397073 () Unit!29955)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!689 (array!51123 array!51125 (_ BitVec 32) (_ BitVec 32) V!28393 V!28393 (_ BitVec 32) (_ BitVec 64) V!28393 (_ BitVec 32) Int) Unit!29955)

(assert (=> b!878481 (= lt!397073 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!689 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!878482 () Bool)

(declare-fun res!596873 () Bool)

(assert (=> b!878482 (=> (not res!596873) (not e!488877))))

(assert (=> b!878482 (= res!596873 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25030 _keys!868))))))

(assert (= (and start!74558 res!596872) b!878473))

(assert (= (and b!878473 res!596877) b!878477))

(assert (= (and b!878477 res!596871) b!878475))

(assert (= (and b!878475 res!596875) b!878474))

(assert (= (and b!878474 res!596869) b!878482))

(assert (= (and b!878482 res!596873) b!878480))

(assert (= (and b!878480 res!596876) b!878476))

(assert (= (and b!878476 res!596874) b!878472))

(assert (= (and b!878472 res!596870) b!878481))

(assert (= (and b!878479 condMapEmpty!27879) mapIsEmpty!27879))

(assert (= (and b!878479 (not condMapEmpty!27879)) mapNonEmpty!27879))

(get-info :version)

(assert (= (and mapNonEmpty!27879 ((_ is ValueCellFull!8315) mapValue!27879)) b!878478))

(assert (= (and b!878479 ((_ is ValueCellFull!8315) mapDefault!27879)) b!878471))

(assert (= start!74558 b!878479))

(declare-fun m!817731 () Bool)

(assert (=> b!878481 m!817731))

(declare-fun m!817733 () Bool)

(assert (=> b!878481 m!817733))

(assert (=> b!878481 m!817733))

(declare-fun m!817735 () Bool)

(assert (=> b!878481 m!817735))

(declare-fun m!817737 () Bool)

(assert (=> b!878481 m!817737))

(declare-fun m!817739 () Bool)

(assert (=> b!878475 m!817739))

(declare-fun m!817741 () Bool)

(assert (=> start!74558 m!817741))

(declare-fun m!817743 () Bool)

(assert (=> start!74558 m!817743))

(declare-fun m!817745 () Bool)

(assert (=> mapNonEmpty!27879 m!817745))

(declare-fun m!817747 () Bool)

(assert (=> b!878472 m!817747))

(declare-fun m!817749 () Bool)

(assert (=> b!878472 m!817749))

(declare-fun m!817751 () Bool)

(assert (=> b!878472 m!817751))

(declare-fun m!817753 () Bool)

(assert (=> b!878473 m!817753))

(declare-fun m!817755 () Bool)

(assert (=> b!878480 m!817755))

(declare-fun m!817757 () Bool)

(assert (=> b!878474 m!817757))

(declare-fun m!817759 () Bool)

(assert (=> b!878476 m!817759))

(check-sat b_and!25115 (not b!878474) (not b!878481) (not b!878475) (not b!878473) (not start!74558) (not mapNonEmpty!27879) tp_is_empty!17509 (not b!878480) (not b_next!15265) (not b!878472))
(check-sat b_and!25115 (not b_next!15265))
