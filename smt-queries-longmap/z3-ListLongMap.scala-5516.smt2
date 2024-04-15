; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72862 () Bool)

(assert start!72862)

(declare-fun b_free!13795 () Bool)

(declare-fun b_next!13795 () Bool)

(assert (=> start!72862 (= b_free!13795 (not b_next!13795))))

(declare-fun tp!48889 () Bool)

(declare-fun b_and!22855 () Bool)

(assert (=> start!72862 (= tp!48889 b_and!22855)))

(declare-fun b!845762 () Bool)

(declare-fun e!472071 () Bool)

(assert (=> b!845762 (= e!472071 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26289 0))(
  ( (V!26290 (val!8013 Int)) )
))
(declare-datatypes ((tuple2!10492 0))(
  ( (tuple2!10493 (_1!5257 (_ BitVec 64)) (_2!5257 V!26289)) )
))
(declare-datatypes ((List!16351 0))(
  ( (Nil!16348) (Cons!16347 (h!17478 tuple2!10492) (t!22713 List!16351)) )
))
(declare-datatypes ((ListLongMap!9251 0))(
  ( (ListLongMap!9252 (toList!4641 List!16351)) )
))
(declare-fun lt!381227 () ListLongMap!9251)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48081 0))(
  ( (array!48082 (arr!23072 (Array (_ BitVec 32) (_ BitVec 64))) (size!23514 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48081)

(declare-datatypes ((ValueCell!7526 0))(
  ( (ValueCellFull!7526 (v!10432 V!26289)) (EmptyCell!7526) )
))
(declare-datatypes ((array!48083 0))(
  ( (array!48084 (arr!23073 (Array (_ BitVec 32) ValueCell!7526)) (size!23515 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48083)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26289)

(declare-fun zeroValue!654 () V!26289)

(declare-fun getCurrentListMapNoExtraKeys!2655 (array!48081 array!48083 (_ BitVec 32) (_ BitVec 32) V!26289 V!26289 (_ BitVec 32) Int) ListLongMap!9251)

(assert (=> b!845762 (= lt!381227 (getCurrentListMapNoExtraKeys!2655 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845763 () Bool)

(declare-fun e!472074 () Bool)

(declare-fun tp_is_empty!15931 () Bool)

(assert (=> b!845763 (= e!472074 tp_is_empty!15931)))

(declare-fun mapNonEmpty!25496 () Bool)

(declare-fun mapRes!25496 () Bool)

(declare-fun tp!48890 () Bool)

(assert (=> mapNonEmpty!25496 (= mapRes!25496 (and tp!48890 e!472074))))

(declare-fun mapKey!25496 () (_ BitVec 32))

(declare-fun mapRest!25496 () (Array (_ BitVec 32) ValueCell!7526))

(declare-fun mapValue!25496 () ValueCell!7526)

(assert (=> mapNonEmpty!25496 (= (arr!23073 _values!688) (store mapRest!25496 mapKey!25496 mapValue!25496))))

(declare-fun res!574642 () Bool)

(assert (=> start!72862 (=> (not res!574642) (not e!472071))))

(assert (=> start!72862 (= res!574642 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23514 _keys!868))))))

(assert (=> start!72862 e!472071))

(assert (=> start!72862 true))

(assert (=> start!72862 tp!48889))

(declare-fun array_inv!18406 (array!48081) Bool)

(assert (=> start!72862 (array_inv!18406 _keys!868)))

(declare-fun e!472070 () Bool)

(declare-fun array_inv!18407 (array!48083) Bool)

(assert (=> start!72862 (and (array_inv!18407 _values!688) e!472070)))

(assert (=> start!72862 tp_is_empty!15931))

(declare-fun b!845764 () Bool)

(declare-fun res!574644 () Bool)

(assert (=> b!845764 (=> (not res!574644) (not e!472071))))

(declare-datatypes ((List!16352 0))(
  ( (Nil!16349) (Cons!16348 (h!17479 (_ BitVec 64)) (t!22714 List!16352)) )
))
(declare-fun arrayNoDuplicates!0 (array!48081 (_ BitVec 32) List!16352) Bool)

(assert (=> b!845764 (= res!574644 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16349))))

(declare-fun b!845765 () Bool)

(declare-fun res!574646 () Bool)

(assert (=> b!845765 (=> (not res!574646) (not e!472071))))

(assert (=> b!845765 (= res!574646 (and (= (size!23515 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23514 _keys!868) (size!23515 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845766 () Bool)

(declare-fun res!574640 () Bool)

(assert (=> b!845766 (=> (not res!574640) (not e!472071))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845766 (= res!574640 (validKeyInArray!0 k0!854))))

(declare-fun b!845767 () Bool)

(declare-fun res!574645 () Bool)

(assert (=> b!845767 (=> (not res!574645) (not e!472071))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845767 (= res!574645 (and (= (select (arr!23072 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845768 () Bool)

(declare-fun res!574647 () Bool)

(assert (=> b!845768 (=> (not res!574647) (not e!472071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48081 (_ BitVec 32)) Bool)

(assert (=> b!845768 (= res!574647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845769 () Bool)

(declare-fun e!472072 () Bool)

(assert (=> b!845769 (= e!472072 tp_is_empty!15931)))

(declare-fun b!845770 () Bool)

(declare-fun res!574641 () Bool)

(assert (=> b!845770 (=> (not res!574641) (not e!472071))))

(assert (=> b!845770 (= res!574641 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23514 _keys!868))))))

(declare-fun b!845771 () Bool)

(declare-fun res!574643 () Bool)

(assert (=> b!845771 (=> (not res!574643) (not e!472071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845771 (= res!574643 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25496 () Bool)

(assert (=> mapIsEmpty!25496 mapRes!25496))

(declare-fun b!845772 () Bool)

(assert (=> b!845772 (= e!472070 (and e!472072 mapRes!25496))))

(declare-fun condMapEmpty!25496 () Bool)

(declare-fun mapDefault!25496 () ValueCell!7526)

(assert (=> b!845772 (= condMapEmpty!25496 (= (arr!23073 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7526)) mapDefault!25496)))))

(assert (= (and start!72862 res!574642) b!845771))

(assert (= (and b!845771 res!574643) b!845765))

(assert (= (and b!845765 res!574646) b!845768))

(assert (= (and b!845768 res!574647) b!845764))

(assert (= (and b!845764 res!574644) b!845770))

(assert (= (and b!845770 res!574641) b!845766))

(assert (= (and b!845766 res!574640) b!845767))

(assert (= (and b!845767 res!574645) b!845762))

(assert (= (and b!845772 condMapEmpty!25496) mapIsEmpty!25496))

(assert (= (and b!845772 (not condMapEmpty!25496)) mapNonEmpty!25496))

(get-info :version)

(assert (= (and mapNonEmpty!25496 ((_ is ValueCellFull!7526) mapValue!25496)) b!845763))

(assert (= (and b!845772 ((_ is ValueCellFull!7526) mapDefault!25496)) b!845769))

(assert (= start!72862 b!845772))

(declare-fun m!786803 () Bool)

(assert (=> b!845771 m!786803))

(declare-fun m!786805 () Bool)

(assert (=> b!845762 m!786805))

(declare-fun m!786807 () Bool)

(assert (=> b!845764 m!786807))

(declare-fun m!786809 () Bool)

(assert (=> b!845767 m!786809))

(declare-fun m!786811 () Bool)

(assert (=> b!845766 m!786811))

(declare-fun m!786813 () Bool)

(assert (=> start!72862 m!786813))

(declare-fun m!786815 () Bool)

(assert (=> start!72862 m!786815))

(declare-fun m!786817 () Bool)

(assert (=> mapNonEmpty!25496 m!786817))

(declare-fun m!786819 () Bool)

(assert (=> b!845768 m!786819))

(check-sat tp_is_empty!15931 (not b!845762) (not b!845764) (not b!845771) (not start!72862) (not b!845766) (not b_next!13795) (not mapNonEmpty!25496) (not b!845768) b_and!22855)
(check-sat b_and!22855 (not b_next!13795))
