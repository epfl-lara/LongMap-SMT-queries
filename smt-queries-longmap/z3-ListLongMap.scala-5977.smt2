; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77670 () Bool)

(assert start!77670)

(declare-fun b_free!16273 () Bool)

(declare-fun b_next!16273 () Bool)

(assert (=> start!77670 (= b_free!16273 (not b_next!16273))))

(declare-fun tp!57081 () Bool)

(declare-fun b_and!26673 () Bool)

(assert (=> start!77670 (= tp!57081 b_and!26673)))

(declare-fun b!905868 () Bool)

(declare-fun e!507622 () Bool)

(declare-fun e!507624 () Bool)

(declare-fun mapRes!29749 () Bool)

(assert (=> b!905868 (= e!507622 (and e!507624 mapRes!29749))))

(declare-fun condMapEmpty!29749 () Bool)

(declare-datatypes ((V!29887 0))(
  ( (V!29888 (val!9396 Int)) )
))
(declare-datatypes ((ValueCell!8864 0))(
  ( (ValueCellFull!8864 (v!11900 V!29887)) (EmptyCell!8864) )
))
(declare-datatypes ((array!53401 0))(
  ( (array!53402 (arr!25660 (Array (_ BitVec 32) ValueCell!8864)) (size!26121 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53401)

(declare-fun mapDefault!29749 () ValueCell!8864)

(assert (=> b!905868 (= condMapEmpty!29749 (= (arr!25660 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8864)) mapDefault!29749)))))

(declare-fun mapIsEmpty!29749 () Bool)

(assert (=> mapIsEmpty!29749 mapRes!29749))

(declare-fun mapNonEmpty!29749 () Bool)

(declare-fun tp!57082 () Bool)

(declare-fun e!507629 () Bool)

(assert (=> mapNonEmpty!29749 (= mapRes!29749 (and tp!57082 e!507629))))

(declare-fun mapKey!29749 () (_ BitVec 32))

(declare-fun mapRest!29749 () (Array (_ BitVec 32) ValueCell!8864))

(declare-fun mapValue!29749 () ValueCell!8864)

(assert (=> mapNonEmpty!29749 (= (arr!25660 _values!1152) (store mapRest!29749 mapKey!29749 mapValue!29749))))

(declare-fun b!905869 () Bool)

(declare-fun e!507623 () Bool)

(assert (=> b!905869 (= e!507623 true)))

(declare-datatypes ((tuple2!12246 0))(
  ( (tuple2!12247 (_1!6134 (_ BitVec 64)) (_2!6134 V!29887)) )
))
(declare-datatypes ((List!18039 0))(
  ( (Nil!18036) (Cons!18035 (h!19181 tuple2!12246) (t!25475 List!18039)) )
))
(declare-datatypes ((ListLongMap!10933 0))(
  ( (ListLongMap!10934 (toList!5482 List!18039)) )
))
(declare-fun lt!408562 () ListLongMap!10933)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408563 () V!29887)

(declare-fun apply!460 (ListLongMap!10933 (_ BitVec 64)) V!29887)

(assert (=> b!905869 (= (apply!460 lt!408562 k0!1033) lt!408563)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29887)

(declare-datatypes ((array!53403 0))(
  ( (array!53404 (arr!25661 (Array (_ BitVec 32) (_ BitVec 64))) (size!26122 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53403)

(declare-datatypes ((Unit!30668 0))(
  ( (Unit!30669) )
))
(declare-fun lt!408565 () Unit!30668)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29887)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!22 (array!53403 array!53401 (_ BitVec 32) (_ BitVec 32) V!29887 V!29887 (_ BitVec 64) V!29887 (_ BitVec 32) Int) Unit!30668)

(assert (=> b!905869 (= lt!408565 (lemmaListMapApplyFromThenApplyFromZero!22 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408563 i!717 defaultEntry!1160))))

(declare-fun b!905870 () Bool)

(declare-fun tp_is_empty!18691 () Bool)

(assert (=> b!905870 (= e!507629 tp_is_empty!18691)))

(declare-fun b!905871 () Bool)

(declare-fun e!507628 () Bool)

(assert (=> b!905871 (= e!507628 e!507623)))

(declare-fun res!611379 () Bool)

(assert (=> b!905871 (=> res!611379 e!507623)))

(declare-fun lt!408561 () ListLongMap!10933)

(declare-fun contains!4490 (ListLongMap!10933 (_ BitVec 64)) Bool)

(assert (=> b!905871 (= res!611379 (not (contains!4490 lt!408561 k0!1033)))))

(declare-fun getCurrentListMap!2694 (array!53403 array!53401 (_ BitVec 32) (_ BitVec 32) V!29887 V!29887 (_ BitVec 32) Int) ListLongMap!10933)

(assert (=> b!905871 (= lt!408561 (getCurrentListMap!2694 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905872 () Bool)

(declare-fun e!507627 () Bool)

(assert (=> b!905872 (= e!507627 (not e!507628))))

(declare-fun res!611377 () Bool)

(assert (=> b!905872 (=> res!611377 e!507628)))

(assert (=> b!905872 (= res!611377 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26122 _keys!1386))))))

(declare-fun get!13493 (ValueCell!8864 V!29887) V!29887)

(declare-fun dynLambda!1336 (Int (_ BitVec 64)) V!29887)

(assert (=> b!905872 (= lt!408563 (get!13493 (select (arr!25660 _values!1152) i!717) (dynLambda!1336 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905872 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408564 () Unit!30668)

(declare-fun lemmaKeyInListMapIsInArray!212 (array!53403 array!53401 (_ BitVec 32) (_ BitVec 32) V!29887 V!29887 (_ BitVec 64) Int) Unit!30668)

(assert (=> b!905872 (= lt!408564 (lemmaKeyInListMapIsInArray!212 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905873 () Bool)

(declare-fun res!611370 () Bool)

(assert (=> b!905873 (=> res!611370 e!507623)))

(assert (=> b!905873 (= res!611370 (not (= (apply!460 lt!408561 k0!1033) lt!408563)))))

(declare-fun b!905874 () Bool)

(declare-fun res!611378 () Bool)

(assert (=> b!905874 (=> (not res!611378) (not e!507627))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905874 (= res!611378 (inRange!0 i!717 mask!1756))))

(declare-fun b!905875 () Bool)

(assert (=> b!905875 (= e!507624 tp_is_empty!18691)))

(declare-fun res!611375 () Bool)

(declare-fun e!507626 () Bool)

(assert (=> start!77670 (=> (not res!611375) (not e!507626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77670 (= res!611375 (validMask!0 mask!1756))))

(assert (=> start!77670 e!507626))

(declare-fun array_inv!20146 (array!53401) Bool)

(assert (=> start!77670 (and (array_inv!20146 _values!1152) e!507622)))

(assert (=> start!77670 tp!57081))

(assert (=> start!77670 true))

(assert (=> start!77670 tp_is_empty!18691))

(declare-fun array_inv!20147 (array!53403) Bool)

(assert (=> start!77670 (array_inv!20147 _keys!1386)))

(declare-fun b!905876 () Bool)

(declare-fun res!611376 () Bool)

(assert (=> b!905876 (=> (not res!611376) (not e!507627))))

(assert (=> b!905876 (= res!611376 (and (= (select (arr!25661 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905877 () Bool)

(declare-fun res!611371 () Bool)

(assert (=> b!905877 (=> (not res!611371) (not e!507626))))

(declare-datatypes ((List!18040 0))(
  ( (Nil!18037) (Cons!18036 (h!19182 (_ BitVec 64)) (t!25476 List!18040)) )
))
(declare-fun arrayNoDuplicates!0 (array!53403 (_ BitVec 32) List!18040) Bool)

(assert (=> b!905877 (= res!611371 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18037))))

(declare-fun b!905878 () Bool)

(declare-fun res!611374 () Bool)

(assert (=> b!905878 (=> (not res!611374) (not e!507626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53403 (_ BitVec 32)) Bool)

(assert (=> b!905878 (= res!611374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905879 () Bool)

(declare-fun res!611373 () Bool)

(assert (=> b!905879 (=> (not res!611373) (not e!507626))))

(assert (=> b!905879 (= res!611373 (and (= (size!26121 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26122 _keys!1386) (size!26121 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905880 () Bool)

(assert (=> b!905880 (= e!507626 e!507627)))

(declare-fun res!611372 () Bool)

(assert (=> b!905880 (=> (not res!611372) (not e!507627))))

(assert (=> b!905880 (= res!611372 (contains!4490 lt!408562 k0!1033))))

(assert (=> b!905880 (= lt!408562 (getCurrentListMap!2694 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and start!77670 res!611375) b!905879))

(assert (= (and b!905879 res!611373) b!905878))

(assert (= (and b!905878 res!611374) b!905877))

(assert (= (and b!905877 res!611371) b!905880))

(assert (= (and b!905880 res!611372) b!905874))

(assert (= (and b!905874 res!611378) b!905876))

(assert (= (and b!905876 res!611376) b!905872))

(assert (= (and b!905872 (not res!611377)) b!905871))

(assert (= (and b!905871 (not res!611379)) b!905873))

(assert (= (and b!905873 (not res!611370)) b!905869))

(assert (= (and b!905868 condMapEmpty!29749) mapIsEmpty!29749))

(assert (= (and b!905868 (not condMapEmpty!29749)) mapNonEmpty!29749))

(get-info :version)

(assert (= (and mapNonEmpty!29749 ((_ is ValueCellFull!8864) mapValue!29749)) b!905870))

(assert (= (and b!905868 ((_ is ValueCellFull!8864) mapDefault!29749)) b!905875))

(assert (= start!77670 b!905868))

(declare-fun b_lambda!13129 () Bool)

(assert (=> (not b_lambda!13129) (not b!905872)))

(declare-fun t!25474 () Bool)

(declare-fun tb!5287 () Bool)

(assert (=> (and start!77670 (= defaultEntry!1160 defaultEntry!1160) t!25474) tb!5287))

(declare-fun result!10377 () Bool)

(assert (=> tb!5287 (= result!10377 tp_is_empty!18691)))

(assert (=> b!905872 t!25474))

(declare-fun b_and!26675 () Bool)

(assert (= b_and!26673 (and (=> t!25474 result!10377) b_and!26675)))

(declare-fun m!840737 () Bool)

(assert (=> b!905876 m!840737))

(declare-fun m!840739 () Bool)

(assert (=> b!905871 m!840739))

(declare-fun m!840741 () Bool)

(assert (=> b!905871 m!840741))

(declare-fun m!840743 () Bool)

(assert (=> b!905880 m!840743))

(declare-fun m!840745 () Bool)

(assert (=> b!905880 m!840745))

(declare-fun m!840747 () Bool)

(assert (=> b!905878 m!840747))

(declare-fun m!840749 () Bool)

(assert (=> b!905873 m!840749))

(declare-fun m!840751 () Bool)

(assert (=> mapNonEmpty!29749 m!840751))

(declare-fun m!840753 () Bool)

(assert (=> b!905869 m!840753))

(declare-fun m!840755 () Bool)

(assert (=> b!905869 m!840755))

(declare-fun m!840757 () Bool)

(assert (=> b!905872 m!840757))

(declare-fun m!840759 () Bool)

(assert (=> b!905872 m!840759))

(declare-fun m!840761 () Bool)

(assert (=> b!905872 m!840761))

(declare-fun m!840763 () Bool)

(assert (=> b!905872 m!840763))

(assert (=> b!905872 m!840757))

(assert (=> b!905872 m!840761))

(declare-fun m!840765 () Bool)

(assert (=> b!905872 m!840765))

(declare-fun m!840767 () Bool)

(assert (=> b!905877 m!840767))

(declare-fun m!840769 () Bool)

(assert (=> start!77670 m!840769))

(declare-fun m!840771 () Bool)

(assert (=> start!77670 m!840771))

(declare-fun m!840773 () Bool)

(assert (=> start!77670 m!840773))

(declare-fun m!840775 () Bool)

(assert (=> b!905874 m!840775))

(check-sat (not mapNonEmpty!29749) (not start!77670) (not b!905873) (not b!905877) (not b!905874) (not b!905880) tp_is_empty!18691 (not b!905871) (not b!905878) b_and!26675 (not b!905869) (not b_lambda!13129) (not b!905872) (not b_next!16273))
(check-sat b_and!26675 (not b_next!16273))
