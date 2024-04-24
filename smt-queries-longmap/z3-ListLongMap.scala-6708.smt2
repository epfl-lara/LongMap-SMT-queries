; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84388 () Bool)

(assert start!84388)

(declare-fun b_free!19921 () Bool)

(declare-fun b_next!19921 () Bool)

(assert (=> start!84388 (= b_free!19921 (not b_next!19921))))

(declare-fun tp!69367 () Bool)

(declare-fun b_and!31929 () Bool)

(assert (=> start!84388 (= tp!69367 b_and!31929)))

(declare-fun mapNonEmpty!36563 () Bool)

(declare-fun mapRes!36563 () Bool)

(declare-fun tp!69368 () Bool)

(declare-fun e!555914 () Bool)

(assert (=> mapNonEmpty!36563 (= mapRes!36563 (and tp!69368 e!555914))))

(declare-datatypes ((V!35681 0))(
  ( (V!35682 (val!11562 Int)) )
))
(declare-datatypes ((ValueCell!11030 0))(
  ( (ValueCellFull!11030 (v!14121 V!35681)) (EmptyCell!11030) )
))
(declare-datatypes ((array!62062 0))(
  ( (array!62063 (arr!29884 (Array (_ BitVec 32) ValueCell!11030)) (size!30364 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62062)

(declare-fun mapValue!36563 () ValueCell!11030)

(declare-fun mapRest!36563 () (Array (_ BitVec 32) ValueCell!11030))

(declare-fun mapKey!36563 () (_ BitVec 32))

(assert (=> mapNonEmpty!36563 (= (arr!29884 _values!1278) (store mapRest!36563 mapKey!36563 mapValue!36563))))

(declare-fun res!659575 () Bool)

(declare-fun e!555918 () Bool)

(assert (=> start!84388 (=> (not res!659575) (not e!555918))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84388 (= res!659575 (validMask!0 mask!1948))))

(assert (=> start!84388 e!555918))

(assert (=> start!84388 true))

(declare-fun tp_is_empty!23023 () Bool)

(assert (=> start!84388 tp_is_empty!23023))

(declare-fun e!555916 () Bool)

(declare-fun array_inv!23119 (array!62062) Bool)

(assert (=> start!84388 (and (array_inv!23119 _values!1278) e!555916)))

(assert (=> start!84388 tp!69367))

(declare-datatypes ((array!62064 0))(
  ( (array!62065 (arr!29885 (Array (_ BitVec 32) (_ BitVec 64))) (size!30365 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62064)

(declare-fun array_inv!23120 (array!62064) Bool)

(assert (=> start!84388 (array_inv!23120 _keys!1544)))

(declare-fun b!986060 () Bool)

(declare-fun res!659574 () Bool)

(assert (=> b!986060 (=> (not res!659574) (not e!555918))))

(declare-datatypes ((List!20692 0))(
  ( (Nil!20689) (Cons!20688 (h!21856 (_ BitVec 64)) (t!29549 List!20692)) )
))
(declare-fun arrayNoDuplicates!0 (array!62064 (_ BitVec 32) List!20692) Bool)

(assert (=> b!986060 (= res!659574 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20689))))

(declare-fun b!986061 () Bool)

(declare-fun e!555913 () Bool)

(assert (=> b!986061 (= e!555913 tp_is_empty!23023)))

(declare-fun b!986062 () Bool)

(declare-fun res!659568 () Bool)

(assert (=> b!986062 (=> (not res!659568) (not e!555918))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986062 (= res!659568 (validKeyInArray!0 (select (arr!29885 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36563 () Bool)

(assert (=> mapIsEmpty!36563 mapRes!36563))

(declare-fun b!986063 () Bool)

(declare-fun res!659569 () Bool)

(assert (=> b!986063 (=> (not res!659569) (not e!555918))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986063 (= res!659569 (and (= (size!30364 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30365 _keys!1544) (size!30364 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986064 () Bool)

(declare-fun res!659572 () Bool)

(assert (=> b!986064 (=> (not res!659572) (not e!555918))))

(assert (=> b!986064 (= res!659572 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30365 _keys!1544))))))

(declare-fun b!986065 () Bool)

(assert (=> b!986065 (= e!555914 tp_is_empty!23023)))

(declare-fun b!986066 () Bool)

(declare-fun res!659570 () Bool)

(assert (=> b!986066 (=> (not res!659570) (not e!555918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62064 (_ BitVec 32)) Bool)

(assert (=> b!986066 (= res!659570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986067 () Bool)

(declare-fun e!555915 () Bool)

(assert (=> b!986067 (= e!555918 e!555915)))

(declare-fun res!659571 () Bool)

(assert (=> b!986067 (=> (not res!659571) (not e!555915))))

(assert (=> b!986067 (= res!659571 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29885 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!437486 () V!35681)

(declare-fun get!15534 (ValueCell!11030 V!35681) V!35681)

(declare-fun dynLambda!1861 (Int (_ BitVec 64)) V!35681)

(assert (=> b!986067 (= lt!437486 (get!15534 (select (arr!29884 _values!1278) from!1932) (dynLambda!1861 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35681)

(declare-datatypes ((tuple2!14812 0))(
  ( (tuple2!14813 (_1!7417 (_ BitVec 64)) (_2!7417 V!35681)) )
))
(declare-datatypes ((List!20693 0))(
  ( (Nil!20690) (Cons!20689 (h!21857 tuple2!14812) (t!29550 List!20693)) )
))
(declare-datatypes ((ListLongMap!13511 0))(
  ( (ListLongMap!13512 (toList!6771 List!20693)) )
))
(declare-fun lt!437484 () ListLongMap!13511)

(declare-fun zeroValue!1220 () V!35681)

(declare-fun getCurrentListMapNoExtraKeys!3504 (array!62064 array!62062 (_ BitVec 32) (_ BitVec 32) V!35681 V!35681 (_ BitVec 32) Int) ListLongMap!13511)

(assert (=> b!986067 (= lt!437484 (getCurrentListMapNoExtraKeys!3504 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!986068 () Bool)

(declare-fun res!659573 () Bool)

(assert (=> b!986068 (=> (not res!659573) (not e!555918))))

(assert (=> b!986068 (= res!659573 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!986069 () Bool)

(assert (=> b!986069 (= e!555915 (not true))))

(declare-fun lt!437485 () tuple2!14812)

(declare-fun lt!437483 () tuple2!14812)

(declare-fun +!3072 (ListLongMap!13511 tuple2!14812) ListLongMap!13511)

(assert (=> b!986069 (= (+!3072 (+!3072 lt!437484 lt!437485) lt!437483) (+!3072 (+!3072 lt!437484 lt!437483) lt!437485))))

(assert (=> b!986069 (= lt!437483 (tuple2!14813 (select (arr!29885 _keys!1544) from!1932) lt!437486))))

(assert (=> b!986069 (= lt!437485 (tuple2!14813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32724 0))(
  ( (Unit!32725) )
))
(declare-fun lt!437487 () Unit!32724)

(declare-fun addCommutativeForDiffKeys!679 (ListLongMap!13511 (_ BitVec 64) V!35681 (_ BitVec 64) V!35681) Unit!32724)

(assert (=> b!986069 (= lt!437487 (addCommutativeForDiffKeys!679 lt!437484 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29885 _keys!1544) from!1932) lt!437486))))

(declare-fun b!986070 () Bool)

(assert (=> b!986070 (= e!555916 (and e!555913 mapRes!36563))))

(declare-fun condMapEmpty!36563 () Bool)

(declare-fun mapDefault!36563 () ValueCell!11030)

(assert (=> b!986070 (= condMapEmpty!36563 (= (arr!29884 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11030)) mapDefault!36563)))))

(assert (= (and start!84388 res!659575) b!986063))

(assert (= (and b!986063 res!659569) b!986066))

(assert (= (and b!986066 res!659570) b!986060))

(assert (= (and b!986060 res!659574) b!986064))

(assert (= (and b!986064 res!659572) b!986062))

(assert (= (and b!986062 res!659568) b!986068))

(assert (= (and b!986068 res!659573) b!986067))

(assert (= (and b!986067 res!659571) b!986069))

(assert (= (and b!986070 condMapEmpty!36563) mapIsEmpty!36563))

(assert (= (and b!986070 (not condMapEmpty!36563)) mapNonEmpty!36563))

(get-info :version)

(assert (= (and mapNonEmpty!36563 ((_ is ValueCellFull!11030) mapValue!36563)) b!986065))

(assert (= (and b!986070 ((_ is ValueCellFull!11030) mapDefault!36563)) b!986061))

(assert (= start!84388 b!986070))

(declare-fun b_lambda!14967 () Bool)

(assert (=> (not b_lambda!14967) (not b!986067)))

(declare-fun t!29548 () Bool)

(declare-fun tb!6707 () Bool)

(assert (=> (and start!84388 (= defaultEntry!1281 defaultEntry!1281) t!29548) tb!6707))

(declare-fun result!13411 () Bool)

(assert (=> tb!6707 (= result!13411 tp_is_empty!23023)))

(assert (=> b!986067 t!29548))

(declare-fun b_and!31931 () Bool)

(assert (= b_and!31929 (and (=> t!29548 result!13411) b_and!31931)))

(declare-fun m!913517 () Bool)

(assert (=> b!986069 m!913517))

(declare-fun m!913519 () Bool)

(assert (=> b!986069 m!913519))

(declare-fun m!913521 () Bool)

(assert (=> b!986069 m!913521))

(assert (=> b!986069 m!913519))

(declare-fun m!913523 () Bool)

(assert (=> b!986069 m!913523))

(assert (=> b!986069 m!913517))

(declare-fun m!913525 () Bool)

(assert (=> b!986069 m!913525))

(assert (=> b!986069 m!913523))

(declare-fun m!913527 () Bool)

(assert (=> b!986069 m!913527))

(assert (=> b!986067 m!913517))

(declare-fun m!913529 () Bool)

(assert (=> b!986067 m!913529))

(declare-fun m!913531 () Bool)

(assert (=> b!986067 m!913531))

(declare-fun m!913533 () Bool)

(assert (=> b!986067 m!913533))

(assert (=> b!986067 m!913529))

(assert (=> b!986067 m!913533))

(declare-fun m!913535 () Bool)

(assert (=> b!986067 m!913535))

(assert (=> b!986062 m!913517))

(assert (=> b!986062 m!913517))

(declare-fun m!913537 () Bool)

(assert (=> b!986062 m!913537))

(declare-fun m!913539 () Bool)

(assert (=> mapNonEmpty!36563 m!913539))

(declare-fun m!913541 () Bool)

(assert (=> b!986066 m!913541))

(declare-fun m!913543 () Bool)

(assert (=> b!986060 m!913543))

(declare-fun m!913545 () Bool)

(assert (=> start!84388 m!913545))

(declare-fun m!913547 () Bool)

(assert (=> start!84388 m!913547))

(declare-fun m!913549 () Bool)

(assert (=> start!84388 m!913549))

(check-sat (not b!986060) (not b!986069) tp_is_empty!23023 (not b!986066) (not start!84388) (not b_next!19921) (not b!986067) (not b!986062) (not mapNonEmpty!36563) b_and!31931 (not b_lambda!14967))
(check-sat b_and!31931 (not b_next!19921))
