; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134048 () Bool)

(assert start!134048)

(declare-fun b_free!32053 () Bool)

(declare-fun b_next!32053 () Bool)

(assert (=> start!134048 (= b_free!32053 (not b_next!32053))))

(declare-fun tp!113282 () Bool)

(declare-fun b_and!51619 () Bool)

(assert (=> start!134048 (= tp!113282 b_and!51619)))

(declare-fun b!1564989 () Bool)

(declare-fun res!1069182 () Bool)

(declare-fun e!872238 () Bool)

(assert (=> b!1564989 (=> (not res!1069182) (not e!872238))))

(declare-datatypes ((array!104264 0))(
  ( (array!104265 (arr!50317 (Array (_ BitVec 32) (_ BitVec 64))) (size!50868 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104264)

(declare-datatypes ((List!36521 0))(
  ( (Nil!36518) (Cons!36517 (h!37981 (_ BitVec 64)) (t!51356 List!36521)) )
))
(declare-fun arrayNoDuplicates!0 (array!104264 (_ BitVec 32) List!36521) Bool)

(assert (=> b!1564989 (= res!1069182 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36518))))

(declare-fun mapIsEmpty!59454 () Bool)

(declare-fun mapRes!59454 () Bool)

(assert (=> mapIsEmpty!59454 mapRes!59454))

(declare-fun b!1564990 () Bool)

(declare-fun res!1069181 () Bool)

(assert (=> b!1564990 (=> (not res!1069181) (not e!872238))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104264 (_ BitVec 32)) Bool)

(assert (=> b!1564990 (= res!1069181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564992 () Bool)

(declare-fun res!1069180 () Bool)

(assert (=> b!1564992 (=> (not res!1069180) (not e!872238))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564992 (= res!1069180 (validKeyInArray!0 (select (arr!50317 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59454 () Bool)

(declare-fun tp!113283 () Bool)

(declare-fun e!872242 () Bool)

(assert (=> mapNonEmpty!59454 (= mapRes!59454 (and tp!113283 e!872242))))

(declare-datatypes ((V!59833 0))(
  ( (V!59834 (val!19443 Int)) )
))
(declare-datatypes ((ValueCell!18329 0))(
  ( (ValueCellFull!18329 (v!22187 V!59833)) (EmptyCell!18329) )
))
(declare-fun mapValue!59454 () ValueCell!18329)

(declare-fun mapKey!59454 () (_ BitVec 32))

(declare-datatypes ((array!104266 0))(
  ( (array!104267 (arr!50318 (Array (_ BitVec 32) ValueCell!18329)) (size!50869 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104266)

(declare-fun mapRest!59454 () (Array (_ BitVec 32) ValueCell!18329))

(assert (=> mapNonEmpty!59454 (= (arr!50318 _values!487) (store mapRest!59454 mapKey!59454 mapValue!59454))))

(declare-fun b!1564993 () Bool)

(declare-fun e!872241 () Bool)

(declare-fun tp_is_empty!38719 () Bool)

(assert (=> b!1564993 (= e!872241 tp_is_empty!38719)))

(declare-fun b!1564994 () Bool)

(declare-fun res!1069184 () Bool)

(assert (=> b!1564994 (=> (not res!1069184) (not e!872238))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564994 (= res!1069184 (and (= (size!50869 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50868 _keys!637) (size!50869 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564995 () Bool)

(declare-fun res!1069183 () Bool)

(assert (=> b!1564995 (=> (not res!1069183) (not e!872238))))

(assert (=> b!1564995 (= res!1069183 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50868 _keys!637)) (bvslt from!782 (size!50868 _keys!637))))))

(declare-fun b!1564991 () Bool)

(assert (=> b!1564991 (= e!872242 tp_is_empty!38719)))

(declare-fun res!1069179 () Bool)

(assert (=> start!134048 (=> (not res!1069179) (not e!872238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134048 (= res!1069179 (validMask!0 mask!947))))

(assert (=> start!134048 e!872238))

(assert (=> start!134048 tp!113282))

(assert (=> start!134048 tp_is_empty!38719))

(assert (=> start!134048 true))

(declare-fun array_inv!39359 (array!104264) Bool)

(assert (=> start!134048 (array_inv!39359 _keys!637)))

(declare-fun e!872240 () Bool)

(declare-fun array_inv!39360 (array!104266) Bool)

(assert (=> start!134048 (and (array_inv!39360 _values!487) e!872240)))

(declare-fun b!1564996 () Bool)

(assert (=> b!1564996 (= e!872240 (and e!872241 mapRes!59454))))

(declare-fun condMapEmpty!59454 () Bool)

(declare-fun mapDefault!59454 () ValueCell!18329)

(assert (=> b!1564996 (= condMapEmpty!59454 (= (arr!50318 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18329)) mapDefault!59454)))))

(declare-fun b!1564997 () Bool)

(assert (=> b!1564997 (= e!872238 (not true))))

(declare-fun lt!672630 () Bool)

(declare-datatypes ((tuple2!25180 0))(
  ( (tuple2!25181 (_1!12601 (_ BitVec 64)) (_2!12601 V!59833)) )
))
(declare-datatypes ((List!36522 0))(
  ( (Nil!36519) (Cons!36518 (h!37982 tuple2!25180) (t!51357 List!36522)) )
))
(declare-datatypes ((ListLongMap!22623 0))(
  ( (ListLongMap!22624 (toList!11327 List!36522)) )
))
(declare-fun lt!672628 () ListLongMap!22623)

(declare-fun contains!10328 (ListLongMap!22623 (_ BitVec 64)) Bool)

(assert (=> b!1564997 (= lt!672630 (contains!10328 lt!672628 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564997 (not (contains!10328 lt!672628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672632 () V!59833)

(declare-fun lt!672631 () ListLongMap!22623)

(declare-fun +!5103 (ListLongMap!22623 tuple2!25180) ListLongMap!22623)

(assert (=> b!1564997 (= lt!672628 (+!5103 lt!672631 (tuple2!25181 (select (arr!50317 _keys!637) from!782) lt!672632)))))

(declare-datatypes ((Unit!51891 0))(
  ( (Unit!51892) )
))
(declare-fun lt!672629 () Unit!51891)

(declare-fun addStillNotContains!554 (ListLongMap!22623 (_ BitVec 64) V!59833 (_ BitVec 64)) Unit!51891)

(assert (=> b!1564997 (= lt!672629 (addStillNotContains!554 lt!672631 (select (arr!50317 _keys!637) from!782) lt!672632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26299 (ValueCell!18329 V!59833) V!59833)

(declare-fun dynLambda!3901 (Int (_ BitVec 64)) V!59833)

(assert (=> b!1564997 (= lt!672632 (get!26299 (select (arr!50318 _values!487) from!782) (dynLambda!3901 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59833)

(declare-fun minValue!453 () V!59833)

(declare-fun getCurrentListMapNoExtraKeys!6726 (array!104264 array!104266 (_ BitVec 32) (_ BitVec 32) V!59833 V!59833 (_ BitVec 32) Int) ListLongMap!22623)

(assert (=> b!1564997 (= lt!672631 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!134048 res!1069179) b!1564994))

(assert (= (and b!1564994 res!1069184) b!1564990))

(assert (= (and b!1564990 res!1069181) b!1564989))

(assert (= (and b!1564989 res!1069182) b!1564995))

(assert (= (and b!1564995 res!1069183) b!1564992))

(assert (= (and b!1564992 res!1069180) b!1564997))

(assert (= (and b!1564996 condMapEmpty!59454) mapIsEmpty!59454))

(assert (= (and b!1564996 (not condMapEmpty!59454)) mapNonEmpty!59454))

(get-info :version)

(assert (= (and mapNonEmpty!59454 ((_ is ValueCellFull!18329) mapValue!59454)) b!1564991))

(assert (= (and b!1564996 ((_ is ValueCellFull!18329) mapDefault!59454)) b!1564993))

(assert (= start!134048 b!1564996))

(declare-fun b_lambda!24921 () Bool)

(assert (=> (not b_lambda!24921) (not b!1564997)))

(declare-fun t!51355 () Bool)

(declare-fun tb!12589 () Bool)

(assert (=> (and start!134048 (= defaultEntry!495 defaultEntry!495) t!51355) tb!12589))

(declare-fun result!26467 () Bool)

(assert (=> tb!12589 (= result!26467 tp_is_empty!38719)))

(assert (=> b!1564997 t!51355))

(declare-fun b_and!51621 () Bool)

(assert (= b_and!51619 (and (=> t!51355 result!26467) b_and!51621)))

(declare-fun m!1440579 () Bool)

(assert (=> mapNonEmpty!59454 m!1440579))

(declare-fun m!1440581 () Bool)

(assert (=> b!1564992 m!1440581))

(assert (=> b!1564992 m!1440581))

(declare-fun m!1440583 () Bool)

(assert (=> b!1564992 m!1440583))

(declare-fun m!1440585 () Bool)

(assert (=> b!1564997 m!1440585))

(declare-fun m!1440587 () Bool)

(assert (=> b!1564997 m!1440587))

(declare-fun m!1440589 () Bool)

(assert (=> b!1564997 m!1440589))

(declare-fun m!1440591 () Bool)

(assert (=> b!1564997 m!1440591))

(assert (=> b!1564997 m!1440585))

(declare-fun m!1440593 () Bool)

(assert (=> b!1564997 m!1440593))

(assert (=> b!1564997 m!1440581))

(declare-fun m!1440595 () Bool)

(assert (=> b!1564997 m!1440595))

(assert (=> b!1564997 m!1440587))

(declare-fun m!1440597 () Bool)

(assert (=> b!1564997 m!1440597))

(assert (=> b!1564997 m!1440581))

(declare-fun m!1440599 () Bool)

(assert (=> b!1564997 m!1440599))

(declare-fun m!1440601 () Bool)

(assert (=> start!134048 m!1440601))

(declare-fun m!1440603 () Bool)

(assert (=> start!134048 m!1440603))

(declare-fun m!1440605 () Bool)

(assert (=> start!134048 m!1440605))

(declare-fun m!1440607 () Bool)

(assert (=> b!1564989 m!1440607))

(declare-fun m!1440609 () Bool)

(assert (=> b!1564990 m!1440609))

(check-sat (not b!1564992) tp_is_empty!38719 (not start!134048) b_and!51621 (not mapNonEmpty!59454) (not b_next!32053) (not b!1564997) (not b!1564989) (not b_lambda!24921) (not b!1564990))
(check-sat b_and!51621 (not b_next!32053))
