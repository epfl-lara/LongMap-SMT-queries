; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133946 () Bool)

(assert start!133946)

(declare-fun b_free!32169 () Bool)

(declare-fun b_next!32169 () Bool)

(assert (=> start!133946 (= b_free!32169 (not b_next!32169))))

(declare-fun tp!113809 () Bool)

(declare-fun b_and!51779 () Bool)

(assert (=> start!133946 (= tp!113809 b_and!51779)))

(declare-fun b!1565816 () Bool)

(declare-fun e!872765 () Bool)

(declare-fun e!872762 () Bool)

(assert (=> b!1565816 (= e!872765 (not e!872762))))

(declare-fun res!1070338 () Bool)

(assert (=> b!1565816 (=> res!1070338 e!872762)))

(declare-datatypes ((V!60131 0))(
  ( (V!60132 (val!19555 Int)) )
))
(declare-datatypes ((tuple2!25230 0))(
  ( (tuple2!25231 (_1!12626 (_ BitVec 64)) (_2!12626 V!60131)) )
))
(declare-datatypes ((List!36618 0))(
  ( (Nil!36615) (Cons!36614 (h!38060 tuple2!25230) (t!51501 List!36618)) )
))
(declare-datatypes ((ListLongMap!22665 0))(
  ( (ListLongMap!22666 (toList!11348 List!36618)) )
))
(declare-fun lt!672433 () ListLongMap!22665)

(declare-fun contains!10339 (ListLongMap!22665 (_ BitVec 64)) Bool)

(assert (=> b!1565816 (= res!1070338 (contains!10339 lt!672433 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565816 (not (contains!10339 lt!672433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672434 () ListLongMap!22665)

(declare-datatypes ((array!104576 0))(
  ( (array!104577 (arr!50475 (Array (_ BitVec 32) (_ BitVec 64))) (size!51025 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104576)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!672432 () V!60131)

(declare-fun +!5078 (ListLongMap!22665 tuple2!25230) ListLongMap!22665)

(assert (=> b!1565816 (= lt!672433 (+!5078 lt!672434 (tuple2!25231 (select (arr!50475 _keys!637) from!782) lt!672432)))))

(declare-datatypes ((Unit!52020 0))(
  ( (Unit!52021) )
))
(declare-fun lt!672431 () Unit!52020)

(declare-fun addStillNotContains!568 (ListLongMap!22665 (_ BitVec 64) V!60131 (_ BitVec 64)) Unit!52020)

(assert (=> b!1565816 (= lt!672431 (addStillNotContains!568 lt!672434 (select (arr!50475 _keys!637) from!782) lt!672432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18441 0))(
  ( (ValueCellFull!18441 (v!22311 V!60131)) (EmptyCell!18441) )
))
(declare-datatypes ((array!104578 0))(
  ( (array!104579 (arr!50476 (Array (_ BitVec 32) ValueCell!18441)) (size!51026 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104578)

(declare-fun get!26349 (ValueCell!18441 V!60131) V!60131)

(declare-fun dynLambda!3862 (Int (_ BitVec 64)) V!60131)

(assert (=> b!1565816 (= lt!672432 (get!26349 (select (arr!50476 _values!487) from!782) (dynLambda!3862 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60131)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60131)

(declare-fun getCurrentListMapNoExtraKeys!6713 (array!104576 array!104578 (_ BitVec 32) (_ BitVec 32) V!60131 V!60131 (_ BitVec 32) Int) ListLongMap!22665)

(assert (=> b!1565816 (= lt!672434 (getCurrentListMapNoExtraKeys!6713 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565817 () Bool)

(declare-fun res!1070339 () Bool)

(assert (=> b!1565817 (=> (not res!1070339) (not e!872765))))

(assert (=> b!1565817 (= res!1070339 (and (= (size!51026 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51025 _keys!637) (size!51026 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59806 () Bool)

(declare-fun mapRes!59806 () Bool)

(declare-fun tp!113808 () Bool)

(declare-fun e!872764 () Bool)

(assert (=> mapNonEmpty!59806 (= mapRes!59806 (and tp!113808 e!872764))))

(declare-fun mapRest!59806 () (Array (_ BitVec 32) ValueCell!18441))

(declare-fun mapKey!59806 () (_ BitVec 32))

(declare-fun mapValue!59806 () ValueCell!18441)

(assert (=> mapNonEmpty!59806 (= (arr!50476 _values!487) (store mapRest!59806 mapKey!59806 mapValue!59806))))

(declare-fun b!1565818 () Bool)

(declare-fun res!1070337 () Bool)

(assert (=> b!1565818 (=> (not res!1070337) (not e!872765))))

(assert (=> b!1565818 (= res!1070337 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51025 _keys!637)) (bvslt from!782 (size!51025 _keys!637))))))

(declare-fun b!1565819 () Bool)

(declare-fun res!1070341 () Bool)

(assert (=> b!1565819 (=> (not res!1070341) (not e!872765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104576 (_ BitVec 32)) Bool)

(assert (=> b!1565819 (= res!1070341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1070335 () Bool)

(assert (=> start!133946 (=> (not res!1070335) (not e!872765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133946 (= res!1070335 (validMask!0 mask!947))))

(assert (=> start!133946 e!872765))

(assert (=> start!133946 tp!113809))

(declare-fun tp_is_empty!38943 () Bool)

(assert (=> start!133946 tp_is_empty!38943))

(assert (=> start!133946 true))

(declare-fun array_inv!39221 (array!104576) Bool)

(assert (=> start!133946 (array_inv!39221 _keys!637)))

(declare-fun e!872766 () Bool)

(declare-fun array_inv!39222 (array!104578) Bool)

(assert (=> start!133946 (and (array_inv!39222 _values!487) e!872766)))

(declare-fun b!1565820 () Bool)

(assert (=> b!1565820 (= e!872762 true)))

(declare-fun lt!672430 () Bool)

(assert (=> b!1565820 (= lt!672430 (contains!10339 lt!672433 (select (arr!50475 _keys!637) from!782)))))

(declare-fun b!1565821 () Bool)

(declare-fun res!1070336 () Bool)

(assert (=> b!1565821 (=> (not res!1070336) (not e!872765))))

(declare-datatypes ((List!36619 0))(
  ( (Nil!36616) (Cons!36615 (h!38061 (_ BitVec 64)) (t!51502 List!36619)) )
))
(declare-fun arrayNoDuplicates!0 (array!104576 (_ BitVec 32) List!36619) Bool)

(assert (=> b!1565821 (= res!1070336 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36616))))

(declare-fun b!1565822 () Bool)

(declare-fun e!872763 () Bool)

(assert (=> b!1565822 (= e!872766 (and e!872763 mapRes!59806))))

(declare-fun condMapEmpty!59806 () Bool)

(declare-fun mapDefault!59806 () ValueCell!18441)

(assert (=> b!1565822 (= condMapEmpty!59806 (= (arr!50476 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18441)) mapDefault!59806)))))

(declare-fun b!1565823 () Bool)

(declare-fun res!1070340 () Bool)

(assert (=> b!1565823 (=> (not res!1070340) (not e!872765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565823 (= res!1070340 (validKeyInArray!0 (select (arr!50475 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59806 () Bool)

(assert (=> mapIsEmpty!59806 mapRes!59806))

(declare-fun b!1565824 () Bool)

(assert (=> b!1565824 (= e!872763 tp_is_empty!38943)))

(declare-fun b!1565825 () Bool)

(assert (=> b!1565825 (= e!872764 tp_is_empty!38943)))

(assert (= (and start!133946 res!1070335) b!1565817))

(assert (= (and b!1565817 res!1070339) b!1565819))

(assert (= (and b!1565819 res!1070341) b!1565821))

(assert (= (and b!1565821 res!1070336) b!1565818))

(assert (= (and b!1565818 res!1070337) b!1565823))

(assert (= (and b!1565823 res!1070340) b!1565816))

(assert (= (and b!1565816 (not res!1070338)) b!1565820))

(assert (= (and b!1565822 condMapEmpty!59806) mapIsEmpty!59806))

(assert (= (and b!1565822 (not condMapEmpty!59806)) mapNonEmpty!59806))

(get-info :version)

(assert (= (and mapNonEmpty!59806 ((_ is ValueCellFull!18441) mapValue!59806)) b!1565825))

(assert (= (and b!1565822 ((_ is ValueCellFull!18441) mapDefault!59806)) b!1565824))

(assert (= start!133946 b!1565822))

(declare-fun b_lambda!24983 () Bool)

(assert (=> (not b_lambda!24983) (not b!1565816)))

(declare-fun t!51500 () Bool)

(declare-fun tb!12637 () Bool)

(assert (=> (and start!133946 (= defaultEntry!495 defaultEntry!495) t!51500) tb!12637))

(declare-fun result!26565 () Bool)

(assert (=> tb!12637 (= result!26565 tp_is_empty!38943)))

(assert (=> b!1565816 t!51500))

(declare-fun b_and!51781 () Bool)

(assert (= b_and!51779 (and (=> t!51500 result!26565) b_and!51781)))

(declare-fun m!1440741 () Bool)

(assert (=> start!133946 m!1440741))

(declare-fun m!1440743 () Bool)

(assert (=> start!133946 m!1440743))

(declare-fun m!1440745 () Bool)

(assert (=> start!133946 m!1440745))

(declare-fun m!1440747 () Bool)

(assert (=> b!1565816 m!1440747))

(declare-fun m!1440749 () Bool)

(assert (=> b!1565816 m!1440749))

(declare-fun m!1440751 () Bool)

(assert (=> b!1565816 m!1440751))

(declare-fun m!1440753 () Bool)

(assert (=> b!1565816 m!1440753))

(declare-fun m!1440755 () Bool)

(assert (=> b!1565816 m!1440755))

(declare-fun m!1440757 () Bool)

(assert (=> b!1565816 m!1440757))

(declare-fun m!1440759 () Bool)

(assert (=> b!1565816 m!1440759))

(assert (=> b!1565816 m!1440753))

(declare-fun m!1440761 () Bool)

(assert (=> b!1565816 m!1440761))

(assert (=> b!1565816 m!1440749))

(assert (=> b!1565816 m!1440755))

(declare-fun m!1440763 () Bool)

(assert (=> b!1565816 m!1440763))

(assert (=> b!1565823 m!1440753))

(assert (=> b!1565823 m!1440753))

(declare-fun m!1440765 () Bool)

(assert (=> b!1565823 m!1440765))

(declare-fun m!1440767 () Bool)

(assert (=> b!1565819 m!1440767))

(declare-fun m!1440769 () Bool)

(assert (=> mapNonEmpty!59806 m!1440769))

(assert (=> b!1565820 m!1440753))

(assert (=> b!1565820 m!1440753))

(declare-fun m!1440771 () Bool)

(assert (=> b!1565820 m!1440771))

(declare-fun m!1440773 () Bool)

(assert (=> b!1565821 m!1440773))

(check-sat b_and!51781 (not b!1565819) (not b!1565820) (not start!133946) (not b!1565816) (not b_lambda!24983) tp_is_empty!38943 (not b!1565823) (not b_next!32169) (not mapNonEmpty!59806) (not b!1565821))
(check-sat b_and!51781 (not b_next!32169))
