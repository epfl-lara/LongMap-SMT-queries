; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133532 () Bool)

(assert start!133532)

(declare-fun b_free!31999 () Bool)

(declare-fun b_next!31999 () Bool)

(assert (=> start!133532 (= b_free!31999 (not b_next!31999))))

(declare-fun tp!113121 () Bool)

(declare-fun b_and!51491 () Bool)

(assert (=> start!133532 (= tp!113121 b_and!51491)))

(declare-fun mapNonEmpty!59373 () Bool)

(declare-fun mapRes!59373 () Bool)

(declare-fun tp!113122 () Bool)

(declare-fun e!870122 () Bool)

(assert (=> mapNonEmpty!59373 (= mapRes!59373 (and tp!113122 e!870122))))

(declare-datatypes ((V!59761 0))(
  ( (V!59762 (val!19416 Int)) )
))
(declare-datatypes ((ValueCell!18302 0))(
  ( (ValueCellFull!18302 (v!22164 V!59761)) (EmptyCell!18302) )
))
(declare-fun mapValue!59373 () ValueCell!18302)

(declare-fun mapKey!59373 () (_ BitVec 32))

(declare-fun mapRest!59373 () (Array (_ BitVec 32) ValueCell!18302))

(declare-datatypes ((array!103960 0))(
  ( (array!103961 (arr!50173 (Array (_ BitVec 32) ValueCell!18302)) (size!50725 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103960)

(assert (=> mapNonEmpty!59373 (= (arr!50173 _values!487) (store mapRest!59373 mapKey!59373 mapValue!59373))))

(declare-fun mapIsEmpty!59373 () Bool)

(assert (=> mapIsEmpty!59373 mapRes!59373))

(declare-fun b!1561450 () Bool)

(declare-fun res!1067700 () Bool)

(declare-fun e!870121 () Bool)

(assert (=> b!1561450 (=> (not res!1067700) (not e!870121))))

(declare-datatypes ((array!103962 0))(
  ( (array!103963 (arr!50174 (Array (_ BitVec 32) (_ BitVec 64))) (size!50726 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103962)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103962 (_ BitVec 32)) Bool)

(assert (=> b!1561450 (= res!1067700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561451 () Bool)

(declare-fun res!1067702 () Bool)

(assert (=> b!1561451 (=> (not res!1067702) (not e!870121))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561451 (= res!1067702 (validKeyInArray!0 (select (arr!50174 _keys!637) from!782)))))

(declare-fun b!1561452 () Bool)

(declare-fun e!870124 () Bool)

(declare-fun e!870120 () Bool)

(assert (=> b!1561452 (= e!870124 (and e!870120 mapRes!59373))))

(declare-fun condMapEmpty!59373 () Bool)

(declare-fun mapDefault!59373 () ValueCell!18302)

(assert (=> b!1561452 (= condMapEmpty!59373 (= (arr!50173 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18302)) mapDefault!59373)))))

(declare-fun b!1561453 () Bool)

(declare-fun tp_is_empty!38665 () Bool)

(assert (=> b!1561453 (= e!870122 tp_is_empty!38665)))

(declare-fun b!1561454 () Bool)

(assert (=> b!1561454 (= e!870120 tp_is_empty!38665)))

(declare-fun b!1561455 () Bool)

(declare-fun res!1067698 () Bool)

(assert (=> b!1561455 (=> (not res!1067698) (not e!870121))))

(declare-datatypes ((List!36487 0))(
  ( (Nil!36484) (Cons!36483 (h!37930 (_ BitVec 64)) (t!51268 List!36487)) )
))
(declare-fun arrayNoDuplicates!0 (array!103962 (_ BitVec 32) List!36487) Bool)

(assert (=> b!1561455 (= res!1067698 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36484))))

(declare-fun res!1067697 () Bool)

(assert (=> start!133532 (=> (not res!1067697) (not e!870121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133532 (= res!1067697 (validMask!0 mask!947))))

(assert (=> start!133532 e!870121))

(assert (=> start!133532 tp!113121))

(assert (=> start!133532 tp_is_empty!38665))

(assert (=> start!133532 true))

(declare-fun array_inv!39181 (array!103962) Bool)

(assert (=> start!133532 (array_inv!39181 _keys!637)))

(declare-fun array_inv!39182 (array!103960) Bool)

(assert (=> start!133532 (and (array_inv!39182 _values!487) e!870124)))

(declare-fun b!1561456 () Bool)

(declare-fun res!1067701 () Bool)

(assert (=> b!1561456 (=> (not res!1067701) (not e!870121))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561456 (= res!1067701 (and (= (size!50725 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50726 _keys!637) (size!50725 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561457 () Bool)

(declare-fun res!1067699 () Bool)

(assert (=> b!1561457 (=> (not res!1067699) (not e!870121))))

(assert (=> b!1561457 (= res!1067699 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50726 _keys!637)) (bvslt from!782 (size!50726 _keys!637))))))

(declare-fun b!1561458 () Bool)

(declare-fun e!870119 () Bool)

(assert (=> b!1561458 (= e!870119 true)))

(declare-fun lt!671031 () Bool)

(declare-datatypes ((tuple2!25148 0))(
  ( (tuple2!25149 (_1!12585 (_ BitVec 64)) (_2!12585 V!59761)) )
))
(declare-datatypes ((List!36488 0))(
  ( (Nil!36485) (Cons!36484 (h!37931 tuple2!25148) (t!51269 List!36488)) )
))
(declare-datatypes ((ListLongMap!22583 0))(
  ( (ListLongMap!22584 (toList!11307 List!36488)) )
))
(declare-fun lt!671029 () ListLongMap!22583)

(declare-fun contains!10217 (ListLongMap!22583 (_ BitVec 64)) Bool)

(assert (=> b!1561458 (= lt!671031 (contains!10217 lt!671029 (select (arr!50174 _keys!637) from!782)))))

(declare-fun b!1561459 () Bool)

(assert (=> b!1561459 (= e!870121 (not e!870119))))

(declare-fun res!1067703 () Bool)

(assert (=> b!1561459 (=> res!1067703 e!870119)))

(assert (=> b!1561459 (= res!1067703 (contains!10217 lt!671029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561459 (not (contains!10217 lt!671029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671032 () V!59761)

(declare-fun lt!671030 () ListLongMap!22583)

(declare-fun +!5072 (ListLongMap!22583 tuple2!25148) ListLongMap!22583)

(assert (=> b!1561459 (= lt!671029 (+!5072 lt!671030 (tuple2!25149 (select (arr!50174 _keys!637) from!782) lt!671032)))))

(declare-datatypes ((Unit!51752 0))(
  ( (Unit!51753) )
))
(declare-fun lt!671033 () Unit!51752)

(declare-fun addStillNotContains!519 (ListLongMap!22583 (_ BitVec 64) V!59761 (_ BitVec 64)) Unit!51752)

(assert (=> b!1561459 (= lt!671033 (addStillNotContains!519 lt!671030 (select (arr!50174 _keys!637) from!782) lt!671032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26217 (ValueCell!18302 V!59761) V!59761)

(declare-fun dynLambda!3848 (Int (_ BitVec 64)) V!59761)

(assert (=> b!1561459 (= lt!671032 (get!26217 (select (arr!50173 _values!487) from!782) (dynLambda!3848 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59761)

(declare-fun minValue!453 () V!59761)

(declare-fun getCurrentListMapNoExtraKeys!6681 (array!103962 array!103960 (_ BitVec 32) (_ BitVec 32) V!59761 V!59761 (_ BitVec 32) Int) ListLongMap!22583)

(assert (=> b!1561459 (= lt!671030 (getCurrentListMapNoExtraKeys!6681 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!133532 res!1067697) b!1561456))

(assert (= (and b!1561456 res!1067701) b!1561450))

(assert (= (and b!1561450 res!1067700) b!1561455))

(assert (= (and b!1561455 res!1067698) b!1561457))

(assert (= (and b!1561457 res!1067699) b!1561451))

(assert (= (and b!1561451 res!1067702) b!1561459))

(assert (= (and b!1561459 (not res!1067703)) b!1561458))

(assert (= (and b!1561452 condMapEmpty!59373) mapIsEmpty!59373))

(assert (= (and b!1561452 (not condMapEmpty!59373)) mapNonEmpty!59373))

(get-info :version)

(assert (= (and mapNonEmpty!59373 ((_ is ValueCellFull!18302) mapValue!59373)) b!1561453))

(assert (= (and b!1561452 ((_ is ValueCellFull!18302) mapDefault!59373)) b!1561454))

(assert (= start!133532 b!1561452))

(declare-fun b_lambda!24863 () Bool)

(assert (=> (not b_lambda!24863) (not b!1561459)))

(declare-fun t!51267 () Bool)

(declare-fun tb!12535 () Bool)

(assert (=> (and start!133532 (= defaultEntry!495 defaultEntry!495) t!51267) tb!12535))

(declare-fun result!26359 () Bool)

(assert (=> tb!12535 (= result!26359 tp_is_empty!38665)))

(assert (=> b!1561459 t!51267))

(declare-fun b_and!51493 () Bool)

(assert (= b_and!51491 (and (=> t!51267 result!26359) b_and!51493)))

(declare-fun m!1436559 () Bool)

(assert (=> start!133532 m!1436559))

(declare-fun m!1436561 () Bool)

(assert (=> start!133532 m!1436561))

(declare-fun m!1436563 () Bool)

(assert (=> start!133532 m!1436563))

(declare-fun m!1436565 () Bool)

(assert (=> mapNonEmpty!59373 m!1436565))

(declare-fun m!1436567 () Bool)

(assert (=> b!1561450 m!1436567))

(declare-fun m!1436569 () Bool)

(assert (=> b!1561451 m!1436569))

(assert (=> b!1561451 m!1436569))

(declare-fun m!1436571 () Bool)

(assert (=> b!1561451 m!1436571))

(declare-fun m!1436573 () Bool)

(assert (=> b!1561459 m!1436573))

(declare-fun m!1436575 () Bool)

(assert (=> b!1561459 m!1436575))

(declare-fun m!1436577 () Bool)

(assert (=> b!1561459 m!1436577))

(declare-fun m!1436579 () Bool)

(assert (=> b!1561459 m!1436579))

(declare-fun m!1436581 () Bool)

(assert (=> b!1561459 m!1436581))

(assert (=> b!1561459 m!1436569))

(assert (=> b!1561459 m!1436575))

(declare-fun m!1436583 () Bool)

(assert (=> b!1561459 m!1436583))

(assert (=> b!1561459 m!1436573))

(assert (=> b!1561459 m!1436569))

(declare-fun m!1436585 () Bool)

(assert (=> b!1561459 m!1436585))

(declare-fun m!1436587 () Bool)

(assert (=> b!1561459 m!1436587))

(assert (=> b!1561458 m!1436569))

(assert (=> b!1561458 m!1436569))

(declare-fun m!1436589 () Bool)

(assert (=> b!1561458 m!1436589))

(declare-fun m!1436591 () Bool)

(assert (=> b!1561455 m!1436591))

(check-sat tp_is_empty!38665 (not b_lambda!24863) (not mapNonEmpty!59373) (not b!1561450) (not b!1561451) (not b!1561459) (not b!1561455) (not start!133532) (not b!1561458) (not b_next!31999) b_and!51493)
(check-sat b_and!51493 (not b_next!31999))
