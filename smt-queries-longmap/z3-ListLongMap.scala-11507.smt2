; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133876 () Bool)

(assert start!133876)

(declare-fun b_free!32149 () Bool)

(declare-fun b_next!32149 () Bool)

(assert (=> start!133876 (= b_free!32149 (not b_next!32149))))

(declare-fun tp!113750 () Bool)

(declare-fun b_and!51721 () Bool)

(assert (=> start!133876 (= tp!113750 b_and!51721)))

(declare-fun b!1565208 () Bool)

(declare-fun res!1070021 () Bool)

(declare-fun e!872413 () Bool)

(assert (=> b!1565208 (=> (not res!1070021) (not e!872413))))

(declare-datatypes ((array!104466 0))(
  ( (array!104467 (arr!50421 (Array (_ BitVec 32) (_ BitVec 64))) (size!50973 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104466)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565208 (= res!1070021 (validKeyInArray!0 (select (arr!50421 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59776 () Bool)

(declare-fun mapRes!59776 () Bool)

(assert (=> mapIsEmpty!59776 mapRes!59776))

(declare-fun b!1565209 () Bool)

(declare-fun res!1070023 () Bool)

(assert (=> b!1565209 (=> (not res!1070023) (not e!872413))))

(assert (=> b!1565209 (= res!1070023 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50973 _keys!637)) (bvslt from!782 (size!50973 _keys!637))))))

(declare-fun b!1565210 () Bool)

(declare-fun e!872410 () Bool)

(declare-fun tp_is_empty!38923 () Bool)

(assert (=> b!1565210 (= e!872410 tp_is_empty!38923)))

(declare-fun b!1565211 () Bool)

(declare-fun e!872409 () Bool)

(assert (=> b!1565211 (= e!872409 tp_is_empty!38923)))

(declare-fun b!1565212 () Bool)

(declare-fun e!872412 () Bool)

(assert (=> b!1565212 (= e!872412 (and e!872410 mapRes!59776))))

(declare-fun condMapEmpty!59776 () Bool)

(declare-datatypes ((V!60105 0))(
  ( (V!60106 (val!19545 Int)) )
))
(declare-datatypes ((ValueCell!18431 0))(
  ( (ValueCellFull!18431 (v!22297 V!60105)) (EmptyCell!18431) )
))
(declare-datatypes ((array!104468 0))(
  ( (array!104469 (arr!50422 (Array (_ BitVec 32) ValueCell!18431)) (size!50974 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104468)

(declare-fun mapDefault!59776 () ValueCell!18431)

(assert (=> b!1565212 (= condMapEmpty!59776 (= (arr!50422 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18431)) mapDefault!59776)))))

(declare-fun b!1565213 () Bool)

(declare-fun res!1070025 () Bool)

(assert (=> b!1565213 (=> (not res!1070025) (not e!872413))))

(declare-datatypes ((List!36652 0))(
  ( (Nil!36649) (Cons!36648 (h!38095 (_ BitVec 64)) (t!51507 List!36652)) )
))
(declare-fun arrayNoDuplicates!0 (array!104466 (_ BitVec 32) List!36652) Bool)

(assert (=> b!1565213 (= res!1070025 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36649))))

(declare-fun b!1565214 () Bool)

(declare-fun res!1070024 () Bool)

(assert (=> b!1565214 (=> (not res!1070024) (not e!872413))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104466 (_ BitVec 32)) Bool)

(assert (=> b!1565214 (= res!1070024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1070022 () Bool)

(assert (=> start!133876 (=> (not res!1070022) (not e!872413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133876 (= res!1070022 (validMask!0 mask!947))))

(assert (=> start!133876 e!872413))

(assert (=> start!133876 tp!113750))

(assert (=> start!133876 tp_is_empty!38923))

(assert (=> start!133876 true))

(declare-fun array_inv!39383 (array!104466) Bool)

(assert (=> start!133876 (array_inv!39383 _keys!637)))

(declare-fun array_inv!39384 (array!104468) Bool)

(assert (=> start!133876 (and (array_inv!39384 _values!487) e!872412)))

(declare-fun mapNonEmpty!59776 () Bool)

(declare-fun tp!113749 () Bool)

(assert (=> mapNonEmpty!59776 (= mapRes!59776 (and tp!113749 e!872409))))

(declare-fun mapKey!59776 () (_ BitVec 32))

(declare-fun mapValue!59776 () ValueCell!18431)

(declare-fun mapRest!59776 () (Array (_ BitVec 32) ValueCell!18431))

(assert (=> mapNonEmpty!59776 (= (arr!50422 _values!487) (store mapRest!59776 mapKey!59776 mapValue!59776))))

(declare-fun b!1565215 () Bool)

(declare-fun res!1070026 () Bool)

(assert (=> b!1565215 (=> (not res!1070026) (not e!872413))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565215 (= res!1070026 (and (= (size!50974 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50973 _keys!637) (size!50974 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565216 () Bool)

(assert (=> b!1565216 (= e!872413 (not (bvslt from!782 (size!50974 _values!487))))))

(declare-fun lt!672010 () V!60105)

(declare-datatypes ((tuple2!25292 0))(
  ( (tuple2!25293 (_1!12657 (_ BitVec 64)) (_2!12657 V!60105)) )
))
(declare-datatypes ((List!36653 0))(
  ( (Nil!36650) (Cons!36649 (h!38096 tuple2!25292) (t!51508 List!36653)) )
))
(declare-datatypes ((ListLongMap!22727 0))(
  ( (ListLongMap!22728 (toList!11379 List!36653)) )
))
(declare-fun lt!672009 () ListLongMap!22727)

(declare-fun contains!10292 (ListLongMap!22727 (_ BitVec 64)) Bool)

(declare-fun +!5100 (ListLongMap!22727 tuple2!25292) ListLongMap!22727)

(assert (=> b!1565216 (not (contains!10292 (+!5100 lt!672009 (tuple2!25293 (select (arr!50421 _keys!637) from!782) lt!672010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51818 0))(
  ( (Unit!51819) )
))
(declare-fun lt!672008 () Unit!51818)

(declare-fun addStillNotContains!547 (ListLongMap!22727 (_ BitVec 64) V!60105 (_ BitVec 64)) Unit!51818)

(assert (=> b!1565216 (= lt!672008 (addStillNotContains!547 lt!672009 (select (arr!50421 _keys!637) from!782) lt!672010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26333 (ValueCell!18431 V!60105) V!60105)

(declare-fun dynLambda!3876 (Int (_ BitVec 64)) V!60105)

(assert (=> b!1565216 (= lt!672010 (get!26333 (select (arr!50422 _values!487) from!782) (dynLambda!3876 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60105)

(declare-fun minValue!453 () V!60105)

(declare-fun getCurrentListMapNoExtraKeys!6731 (array!104466 array!104468 (_ BitVec 32) (_ BitVec 32) V!60105 V!60105 (_ BitVec 32) Int) ListLongMap!22727)

(assert (=> b!1565216 (= lt!672009 (getCurrentListMapNoExtraKeys!6731 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!133876 res!1070022) b!1565215))

(assert (= (and b!1565215 res!1070026) b!1565214))

(assert (= (and b!1565214 res!1070024) b!1565213))

(assert (= (and b!1565213 res!1070025) b!1565209))

(assert (= (and b!1565209 res!1070023) b!1565208))

(assert (= (and b!1565208 res!1070021) b!1565216))

(assert (= (and b!1565212 condMapEmpty!59776) mapIsEmpty!59776))

(assert (= (and b!1565212 (not condMapEmpty!59776)) mapNonEmpty!59776))

(get-info :version)

(assert (= (and mapNonEmpty!59776 ((_ is ValueCellFull!18431) mapValue!59776)) b!1565211))

(assert (= (and b!1565212 ((_ is ValueCellFull!18431) mapDefault!59776)) b!1565210))

(assert (= start!133876 b!1565212))

(declare-fun b_lambda!24953 () Bool)

(assert (=> (not b_lambda!24953) (not b!1565216)))

(declare-fun t!51506 () Bool)

(declare-fun tb!12609 () Bool)

(assert (=> (and start!133876 (= defaultEntry!495 defaultEntry!495) t!51506) tb!12609))

(declare-fun result!26517 () Bool)

(assert (=> tb!12609 (= result!26517 tp_is_empty!38923)))

(assert (=> b!1565216 t!51506))

(declare-fun b_and!51723 () Bool)

(assert (= b_and!51721 (and (=> t!51506 result!26517) b_and!51723)))

(declare-fun m!1439533 () Bool)

(assert (=> mapNonEmpty!59776 m!1439533))

(declare-fun m!1439535 () Bool)

(assert (=> b!1565208 m!1439535))

(assert (=> b!1565208 m!1439535))

(declare-fun m!1439537 () Bool)

(assert (=> b!1565208 m!1439537))

(declare-fun m!1439539 () Bool)

(assert (=> b!1565214 m!1439539))

(declare-fun m!1439541 () Bool)

(assert (=> start!133876 m!1439541))

(declare-fun m!1439543 () Bool)

(assert (=> start!133876 m!1439543))

(declare-fun m!1439545 () Bool)

(assert (=> start!133876 m!1439545))

(declare-fun m!1439547 () Bool)

(assert (=> b!1565213 m!1439547))

(declare-fun m!1439549 () Bool)

(assert (=> b!1565216 m!1439549))

(declare-fun m!1439551 () Bool)

(assert (=> b!1565216 m!1439551))

(declare-fun m!1439553 () Bool)

(assert (=> b!1565216 m!1439553))

(declare-fun m!1439555 () Bool)

(assert (=> b!1565216 m!1439555))

(declare-fun m!1439557 () Bool)

(assert (=> b!1565216 m!1439557))

(assert (=> b!1565216 m!1439555))

(assert (=> b!1565216 m!1439549))

(assert (=> b!1565216 m!1439535))

(declare-fun m!1439559 () Bool)

(assert (=> b!1565216 m!1439559))

(assert (=> b!1565216 m!1439535))

(assert (=> b!1565216 m!1439551))

(declare-fun m!1439561 () Bool)

(assert (=> b!1565216 m!1439561))

(check-sat (not b!1565214) (not b!1565216) (not start!133876) (not b_lambda!24953) (not b!1565208) (not b_next!32149) (not mapNonEmpty!59776) (not b!1565213) tp_is_empty!38923 b_and!51723)
(check-sat b_and!51723 (not b_next!32149))
