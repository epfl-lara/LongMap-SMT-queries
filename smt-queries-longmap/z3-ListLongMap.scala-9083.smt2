; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109506 () Bool)

(assert start!109506)

(declare-fun b_free!28771 () Bool)

(declare-fun b_next!28771 () Bool)

(assert (=> start!109506 (= b_free!28771 (not b_next!28771))))

(declare-fun tp!101431 () Bool)

(declare-fun b_and!46863 () Bool)

(assert (=> start!109506 (= tp!101431 b_and!46863)))

(declare-fun mapNonEmpty!53177 () Bool)

(declare-fun mapRes!53177 () Bool)

(declare-fun tp!101432 () Bool)

(declare-fun e!738845 () Bool)

(assert (=> mapNonEmpty!53177 (= mapRes!53177 (and tp!101432 e!738845))))

(declare-datatypes ((V!50985 0))(
  ( (V!50986 (val!17280 Int)) )
))
(declare-datatypes ((ValueCell!16307 0))(
  ( (ValueCellFull!16307 (v!19878 V!50985)) (EmptyCell!16307) )
))
(declare-fun mapRest!53177 () (Array (_ BitVec 32) ValueCell!16307))

(declare-fun mapValue!53177 () ValueCell!16307)

(declare-datatypes ((array!85885 0))(
  ( (array!85886 (arr!41439 (Array (_ BitVec 32) ValueCell!16307)) (size!41990 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85885)

(declare-fun mapKey!53177 () (_ BitVec 32))

(assert (=> mapNonEmpty!53177 (= (arr!41439 _values!1445) (store mapRest!53177 mapKey!53177 mapValue!53177))))

(declare-fun b!1294385 () Bool)

(declare-fun tp_is_empty!34411 () Bool)

(assert (=> b!1294385 (= e!738845 tp_is_empty!34411)))

(declare-fun b!1294386 () Bool)

(declare-fun e!738846 () Bool)

(assert (=> b!1294386 (= e!738846 tp_is_empty!34411)))

(declare-fun b!1294387 () Bool)

(declare-fun e!738844 () Bool)

(assert (=> b!1294387 (= e!738844 true)))

(declare-datatypes ((tuple2!22248 0))(
  ( (tuple2!22249 (_1!11135 (_ BitVec 64)) (_2!11135 V!50985)) )
))
(declare-datatypes ((List!29414 0))(
  ( (Nil!29411) (Cons!29410 (h!30628 tuple2!22248) (t!42970 List!29414)) )
))
(declare-datatypes ((ListLongMap!19913 0))(
  ( (ListLongMap!19914 (toList!9972 List!29414)) )
))
(declare-fun lt!579944 () ListLongMap!19913)

(declare-fun zeroValue!1387 () V!50985)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8103 (ListLongMap!19913 (_ BitVec 64)) Bool)

(declare-fun +!4443 (ListLongMap!19913 tuple2!22248) ListLongMap!19913)

(assert (=> b!1294387 (not (contains!8103 (+!4443 lt!579944 (tuple2!22249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42783 0))(
  ( (Unit!42784) )
))
(declare-fun lt!579945 () Unit!42783)

(declare-fun addStillNotContains!419 (ListLongMap!19913 (_ BitVec 64) V!50985 (_ BitVec 64)) Unit!42783)

(assert (=> b!1294387 (= lt!579945 (addStillNotContains!419 lt!579944 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50985)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85887 0))(
  ( (array!85888 (arr!41440 (Array (_ BitVec 32) (_ BitVec 64))) (size!41991 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85887)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6083 (array!85887 array!85885 (_ BitVec 32) (_ BitVec 32) V!50985 V!50985 (_ BitVec 32) Int) ListLongMap!19913)

(assert (=> b!1294387 (= lt!579944 (getCurrentListMapNoExtraKeys!6083 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294388 () Bool)

(declare-fun res!859749 () Bool)

(declare-fun e!738842 () Bool)

(assert (=> b!1294388 (=> (not res!859749) (not e!738842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85887 (_ BitVec 32)) Bool)

(assert (=> b!1294388 (= res!859749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!859754 () Bool)

(assert (=> start!109506 (=> (not res!859754) (not e!738842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109506 (= res!859754 (validMask!0 mask!2175))))

(assert (=> start!109506 e!738842))

(assert (=> start!109506 tp_is_empty!34411))

(assert (=> start!109506 true))

(declare-fun e!738841 () Bool)

(declare-fun array_inv!31623 (array!85885) Bool)

(assert (=> start!109506 (and (array_inv!31623 _values!1445) e!738841)))

(declare-fun array_inv!31624 (array!85887) Bool)

(assert (=> start!109506 (array_inv!31624 _keys!1741)))

(assert (=> start!109506 tp!101431))

(declare-fun b!1294389 () Bool)

(declare-fun res!859748 () Bool)

(assert (=> b!1294389 (=> (not res!859748) (not e!738842))))

(declare-fun getCurrentListMap!5002 (array!85887 array!85885 (_ BitVec 32) (_ BitVec 32) V!50985 V!50985 (_ BitVec 32) Int) ListLongMap!19913)

(assert (=> b!1294389 (= res!859748 (contains!8103 (getCurrentListMap!5002 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294390 () Bool)

(declare-fun res!859751 () Bool)

(assert (=> b!1294390 (=> (not res!859751) (not e!738842))))

(assert (=> b!1294390 (= res!859751 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41991 _keys!1741))))))

(declare-fun b!1294391 () Bool)

(assert (=> b!1294391 (= e!738841 (and e!738846 mapRes!53177))))

(declare-fun condMapEmpty!53177 () Bool)

(declare-fun mapDefault!53177 () ValueCell!16307)

(assert (=> b!1294391 (= condMapEmpty!53177 (= (arr!41439 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16307)) mapDefault!53177)))))

(declare-fun b!1294392 () Bool)

(assert (=> b!1294392 (= e!738842 (not e!738844))))

(declare-fun res!859750 () Bool)

(assert (=> b!1294392 (=> res!859750 e!738844)))

(assert (=> b!1294392 (= res!859750 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1294392 (not (contains!8103 (ListLongMap!19914 Nil!29411) k0!1205))))

(declare-fun lt!579943 () Unit!42783)

(declare-fun emptyContainsNothing!134 ((_ BitVec 64)) Unit!42783)

(assert (=> b!1294392 (= lt!579943 (emptyContainsNothing!134 k0!1205))))

(declare-fun b!1294393 () Bool)

(declare-fun res!859756 () Bool)

(assert (=> b!1294393 (=> (not res!859756) (not e!738842))))

(declare-datatypes ((List!29415 0))(
  ( (Nil!29412) (Cons!29411 (h!30629 (_ BitVec 64)) (t!42971 List!29415)) )
))
(declare-fun arrayNoDuplicates!0 (array!85887 (_ BitVec 32) List!29415) Bool)

(assert (=> b!1294393 (= res!859756 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29412))))

(declare-fun b!1294394 () Bool)

(declare-fun res!859753 () Bool)

(assert (=> b!1294394 (=> (not res!859753) (not e!738842))))

(assert (=> b!1294394 (= res!859753 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41991 _keys!1741))))))

(declare-fun b!1294395 () Bool)

(declare-fun res!859752 () Bool)

(assert (=> b!1294395 (=> (not res!859752) (not e!738842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294395 (= res!859752 (not (validKeyInArray!0 (select (arr!41440 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53177 () Bool)

(assert (=> mapIsEmpty!53177 mapRes!53177))

(declare-fun b!1294396 () Bool)

(declare-fun res!859755 () Bool)

(assert (=> b!1294396 (=> (not res!859755) (not e!738842))))

(assert (=> b!1294396 (= res!859755 (and (= (size!41990 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41991 _keys!1741) (size!41990 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109506 res!859754) b!1294396))

(assert (= (and b!1294396 res!859755) b!1294388))

(assert (= (and b!1294388 res!859749) b!1294393))

(assert (= (and b!1294393 res!859756) b!1294390))

(assert (= (and b!1294390 res!859751) b!1294389))

(assert (= (and b!1294389 res!859748) b!1294394))

(assert (= (and b!1294394 res!859753) b!1294395))

(assert (= (and b!1294395 res!859752) b!1294392))

(assert (= (and b!1294392 (not res!859750)) b!1294387))

(assert (= (and b!1294391 condMapEmpty!53177) mapIsEmpty!53177))

(assert (= (and b!1294391 (not condMapEmpty!53177)) mapNonEmpty!53177))

(get-info :version)

(assert (= (and mapNonEmpty!53177 ((_ is ValueCellFull!16307) mapValue!53177)) b!1294385))

(assert (= (and b!1294391 ((_ is ValueCellFull!16307) mapDefault!53177)) b!1294386))

(assert (= start!109506 b!1294391))

(declare-fun m!1187133 () Bool)

(assert (=> b!1294389 m!1187133))

(assert (=> b!1294389 m!1187133))

(declare-fun m!1187135 () Bool)

(assert (=> b!1294389 m!1187135))

(declare-fun m!1187137 () Bool)

(assert (=> b!1294388 m!1187137))

(declare-fun m!1187139 () Bool)

(assert (=> b!1294395 m!1187139))

(assert (=> b!1294395 m!1187139))

(declare-fun m!1187141 () Bool)

(assert (=> b!1294395 m!1187141))

(declare-fun m!1187143 () Bool)

(assert (=> b!1294392 m!1187143))

(declare-fun m!1187145 () Bool)

(assert (=> b!1294392 m!1187145))

(declare-fun m!1187147 () Bool)

(assert (=> start!109506 m!1187147))

(declare-fun m!1187149 () Bool)

(assert (=> start!109506 m!1187149))

(declare-fun m!1187151 () Bool)

(assert (=> start!109506 m!1187151))

(declare-fun m!1187153 () Bool)

(assert (=> b!1294393 m!1187153))

(declare-fun m!1187155 () Bool)

(assert (=> mapNonEmpty!53177 m!1187155))

(declare-fun m!1187157 () Bool)

(assert (=> b!1294387 m!1187157))

(assert (=> b!1294387 m!1187157))

(declare-fun m!1187159 () Bool)

(assert (=> b!1294387 m!1187159))

(declare-fun m!1187161 () Bool)

(assert (=> b!1294387 m!1187161))

(declare-fun m!1187163 () Bool)

(assert (=> b!1294387 m!1187163))

(check-sat b_and!46863 (not mapNonEmpty!53177) (not b!1294389) (not b!1294392) tp_is_empty!34411 (not b!1294395) (not start!109506) (not b!1294387) (not b!1294393) (not b_next!28771) (not b!1294388))
(check-sat b_and!46863 (not b_next!28771))
