; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133560 () Bool)

(assert start!133560)

(declare-fun b_free!31977 () Bool)

(declare-fun b_next!31977 () Bool)

(assert (=> start!133560 (= b_free!31977 (not b_next!31977))))

(declare-fun tp!113055 () Bool)

(declare-fun b_and!51465 () Bool)

(assert (=> start!133560 (= tp!113055 b_and!51465)))

(declare-fun res!1067630 () Bool)

(declare-fun e!870152 () Bool)

(assert (=> start!133560 (=> (not res!1067630) (not e!870152))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133560 (= res!1067630 (validMask!0 mask!947))))

(assert (=> start!133560 e!870152))

(assert (=> start!133560 tp!113055))

(declare-fun tp_is_empty!38643 () Bool)

(assert (=> start!133560 tp_is_empty!38643))

(assert (=> start!133560 true))

(declare-datatypes ((array!104004 0))(
  ( (array!104005 (arr!50194 (Array (_ BitVec 32) (_ BitVec 64))) (size!50744 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104004)

(declare-fun array_inv!39017 (array!104004) Bool)

(assert (=> start!133560 (array_inv!39017 _keys!637)))

(declare-datatypes ((V!59731 0))(
  ( (V!59732 (val!19405 Int)) )
))
(declare-datatypes ((ValueCell!18291 0))(
  ( (ValueCellFull!18291 (v!22157 V!59731)) (EmptyCell!18291) )
))
(declare-datatypes ((array!104006 0))(
  ( (array!104007 (arr!50195 (Array (_ BitVec 32) ValueCell!18291)) (size!50745 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104006)

(declare-fun e!870154 () Bool)

(declare-fun array_inv!39018 (array!104006) Bool)

(assert (=> start!133560 (and (array_inv!39018 _values!487) e!870154)))

(declare-fun b!1561442 () Bool)

(declare-fun e!870151 () Bool)

(declare-fun mapRes!59340 () Bool)

(assert (=> b!1561442 (= e!870154 (and e!870151 mapRes!59340))))

(declare-fun condMapEmpty!59340 () Bool)

(declare-fun mapDefault!59340 () ValueCell!18291)

(assert (=> b!1561442 (= condMapEmpty!59340 (= (arr!50195 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18291)) mapDefault!59340)))))

(declare-fun b!1561443 () Bool)

(assert (=> b!1561443 (= e!870152 (not true))))

(declare-datatypes ((tuple2!25070 0))(
  ( (tuple2!25071 (_1!12546 (_ BitVec 64)) (_2!12546 V!59731)) )
))
(declare-datatypes ((List!36438 0))(
  ( (Nil!36435) (Cons!36434 (h!37880 tuple2!25070) (t!51205 List!36438)) )
))
(declare-datatypes ((ListLongMap!22505 0))(
  ( (ListLongMap!22506 (toList!11268 List!36438)) )
))
(declare-fun lt!671213 () ListLongMap!22505)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671212 () V!59731)

(declare-fun contains!10258 (ListLongMap!22505 (_ BitVec 64)) Bool)

(declare-fun +!5038 (ListLongMap!22505 tuple2!25070) ListLongMap!22505)

(assert (=> b!1561443 (not (contains!10258 (+!5038 lt!671213 (tuple2!25071 (select (arr!50194 _keys!637) from!782) lt!671212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51930 0))(
  ( (Unit!51931) )
))
(declare-fun lt!671214 () Unit!51930)

(declare-fun addStillNotContains!528 (ListLongMap!22505 (_ BitVec 64) V!59731 (_ BitVec 64)) Unit!51930)

(assert (=> b!1561443 (= lt!671214 (addStillNotContains!528 lt!671213 (select (arr!50194 _keys!637) from!782) lt!671212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26207 (ValueCell!18291 V!59731) V!59731)

(declare-fun dynLambda!3822 (Int (_ BitVec 64)) V!59731)

(assert (=> b!1561443 (= lt!671212 (get!26207 (select (arr!50195 _values!487) from!782) (dynLambda!3822 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59731)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59731)

(declare-fun getCurrentListMapNoExtraKeys!6652 (array!104004 array!104006 (_ BitVec 32) (_ BitVec 32) V!59731 V!59731 (_ BitVec 32) Int) ListLongMap!22505)

(assert (=> b!1561443 (= lt!671213 (getCurrentListMapNoExtraKeys!6652 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561444 () Bool)

(declare-fun res!1067631 () Bool)

(assert (=> b!1561444 (=> (not res!1067631) (not e!870152))))

(declare-datatypes ((List!36439 0))(
  ( (Nil!36436) (Cons!36435 (h!37881 (_ BitVec 64)) (t!51206 List!36439)) )
))
(declare-fun arrayNoDuplicates!0 (array!104004 (_ BitVec 32) List!36439) Bool)

(assert (=> b!1561444 (= res!1067631 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36436))))

(declare-fun b!1561445 () Bool)

(declare-fun e!870150 () Bool)

(assert (=> b!1561445 (= e!870150 tp_is_empty!38643)))

(declare-fun b!1561446 () Bool)

(declare-fun res!1067629 () Bool)

(assert (=> b!1561446 (=> (not res!1067629) (not e!870152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561446 (= res!1067629 (validKeyInArray!0 (select (arr!50194 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59340 () Bool)

(declare-fun tp!113054 () Bool)

(assert (=> mapNonEmpty!59340 (= mapRes!59340 (and tp!113054 e!870150))))

(declare-fun mapValue!59340 () ValueCell!18291)

(declare-fun mapKey!59340 () (_ BitVec 32))

(declare-fun mapRest!59340 () (Array (_ BitVec 32) ValueCell!18291))

(assert (=> mapNonEmpty!59340 (= (arr!50195 _values!487) (store mapRest!59340 mapKey!59340 mapValue!59340))))

(declare-fun mapIsEmpty!59340 () Bool)

(assert (=> mapIsEmpty!59340 mapRes!59340))

(declare-fun b!1561447 () Bool)

(declare-fun res!1067628 () Bool)

(assert (=> b!1561447 (=> (not res!1067628) (not e!870152))))

(assert (=> b!1561447 (= res!1067628 (and (= (size!50745 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50744 _keys!637) (size!50745 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561448 () Bool)

(declare-fun res!1067627 () Bool)

(assert (=> b!1561448 (=> (not res!1067627) (not e!870152))))

(assert (=> b!1561448 (= res!1067627 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50744 _keys!637)) (bvslt from!782 (size!50744 _keys!637))))))

(declare-fun b!1561449 () Bool)

(assert (=> b!1561449 (= e!870151 tp_is_empty!38643)))

(declare-fun b!1561450 () Bool)

(declare-fun res!1067626 () Bool)

(assert (=> b!1561450 (=> (not res!1067626) (not e!870152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104004 (_ BitVec 32)) Bool)

(assert (=> b!1561450 (= res!1067626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133560 res!1067630) b!1561447))

(assert (= (and b!1561447 res!1067628) b!1561450))

(assert (= (and b!1561450 res!1067626) b!1561444))

(assert (= (and b!1561444 res!1067631) b!1561448))

(assert (= (and b!1561448 res!1067627) b!1561446))

(assert (= (and b!1561446 res!1067629) b!1561443))

(assert (= (and b!1561442 condMapEmpty!59340) mapIsEmpty!59340))

(assert (= (and b!1561442 (not condMapEmpty!59340)) mapNonEmpty!59340))

(get-info :version)

(assert (= (and mapNonEmpty!59340 ((_ is ValueCellFull!18291) mapValue!59340)) b!1561445))

(assert (= (and b!1561442 ((_ is ValueCellFull!18291) mapDefault!59340)) b!1561449))

(assert (= start!133560 b!1561442))

(declare-fun b_lambda!24851 () Bool)

(assert (=> (not b_lambda!24851) (not b!1561443)))

(declare-fun t!51204 () Bool)

(declare-fun tb!12521 () Bool)

(assert (=> (and start!133560 (= defaultEntry!495 defaultEntry!495) t!51204) tb!12521))

(declare-fun result!26323 () Bool)

(assert (=> tb!12521 (= result!26323 tp_is_empty!38643)))

(assert (=> b!1561443 t!51204))

(declare-fun b_and!51467 () Bool)

(assert (= b_and!51465 (and (=> t!51204 result!26323) b_and!51467)))

(declare-fun m!1437121 () Bool)

(assert (=> b!1561444 m!1437121))

(declare-fun m!1437123 () Bool)

(assert (=> mapNonEmpty!59340 m!1437123))

(declare-fun m!1437125 () Bool)

(assert (=> b!1561443 m!1437125))

(declare-fun m!1437127 () Bool)

(assert (=> b!1561443 m!1437127))

(declare-fun m!1437129 () Bool)

(assert (=> b!1561443 m!1437129))

(declare-fun m!1437131 () Bool)

(assert (=> b!1561443 m!1437131))

(declare-fun m!1437133 () Bool)

(assert (=> b!1561443 m!1437133))

(assert (=> b!1561443 m!1437125))

(assert (=> b!1561443 m!1437131))

(declare-fun m!1437135 () Bool)

(assert (=> b!1561443 m!1437135))

(assert (=> b!1561443 m!1437127))

(declare-fun m!1437137 () Bool)

(assert (=> b!1561443 m!1437137))

(assert (=> b!1561443 m!1437135))

(declare-fun m!1437139 () Bool)

(assert (=> b!1561443 m!1437139))

(declare-fun m!1437141 () Bool)

(assert (=> start!133560 m!1437141))

(declare-fun m!1437143 () Bool)

(assert (=> start!133560 m!1437143))

(declare-fun m!1437145 () Bool)

(assert (=> start!133560 m!1437145))

(assert (=> b!1561446 m!1437131))

(assert (=> b!1561446 m!1437131))

(declare-fun m!1437147 () Bool)

(assert (=> b!1561446 m!1437147))

(declare-fun m!1437149 () Bool)

(assert (=> b!1561450 m!1437149))

(check-sat (not b_lambda!24851) (not b!1561444) (not b!1561446) b_and!51467 (not mapNonEmpty!59340) (not b!1561443) (not b!1561450) tp_is_empty!38643 (not b_next!31977) (not start!133560))
(check-sat b_and!51467 (not b_next!31977))
