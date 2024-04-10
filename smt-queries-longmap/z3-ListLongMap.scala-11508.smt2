; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133934 () Bool)

(assert start!133934)

(declare-fun b_free!32157 () Bool)

(declare-fun b_next!32157 () Bool)

(assert (=> start!133934 (= b_free!32157 (not b_next!32157))))

(declare-fun tp!113773 () Bool)

(declare-fun b_and!51755 () Bool)

(assert (=> start!133934 (= tp!113773 b_and!51755)))

(declare-fun b!1565637 () Bool)

(declare-fun e!872671 () Bool)

(declare-fun e!872670 () Bool)

(declare-fun mapRes!59788 () Bool)

(assert (=> b!1565637 (= e!872671 (and e!872670 mapRes!59788))))

(declare-fun condMapEmpty!59788 () Bool)

(declare-datatypes ((V!60115 0))(
  ( (V!60116 (val!19549 Int)) )
))
(declare-datatypes ((ValueCell!18435 0))(
  ( (ValueCellFull!18435 (v!22305 V!60115)) (EmptyCell!18435) )
))
(declare-datatypes ((array!104552 0))(
  ( (array!104553 (arr!50463 (Array (_ BitVec 32) ValueCell!18435)) (size!51013 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104552)

(declare-fun mapDefault!59788 () ValueCell!18435)

(assert (=> b!1565637 (= condMapEmpty!59788 (= (arr!50463 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18435)) mapDefault!59788)))))

(declare-fun b!1565638 () Bool)

(declare-fun res!1070227 () Bool)

(declare-fun e!872669 () Bool)

(assert (=> b!1565638 (=> (not res!1070227) (not e!872669))))

(declare-datatypes ((array!104554 0))(
  ( (array!104555 (arr!50464 (Array (_ BitVec 32) (_ BitVec 64))) (size!51014 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104554)

(declare-datatypes ((List!36608 0))(
  ( (Nil!36605) (Cons!36604 (h!38050 (_ BitVec 64)) (t!51479 List!36608)) )
))
(declare-fun arrayNoDuplicates!0 (array!104554 (_ BitVec 32) List!36608) Bool)

(assert (=> b!1565638 (= res!1070227 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36605))))

(declare-fun b!1565639 () Bool)

(declare-fun res!1070222 () Bool)

(assert (=> b!1565639 (=> (not res!1070222) (not e!872669))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565639 (= res!1070222 (validKeyInArray!0 (select (arr!50464 _keys!637) from!782)))))

(declare-fun mapNonEmpty!59788 () Bool)

(declare-fun tp!113772 () Bool)

(declare-fun e!872668 () Bool)

(assert (=> mapNonEmpty!59788 (= mapRes!59788 (and tp!113772 e!872668))))

(declare-fun mapKey!59788 () (_ BitVec 32))

(declare-fun mapValue!59788 () ValueCell!18435)

(declare-fun mapRest!59788 () (Array (_ BitVec 32) ValueCell!18435))

(assert (=> mapNonEmpty!59788 (= (arr!50463 _values!487) (store mapRest!59788 mapKey!59788 mapValue!59788))))

(declare-fun b!1565640 () Bool)

(declare-fun res!1070225 () Bool)

(assert (=> b!1565640 (=> (not res!1070225) (not e!872669))))

(assert (=> b!1565640 (= res!1070225 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51014 _keys!637)) (bvslt from!782 (size!51014 _keys!637))))))

(declare-fun b!1565641 () Bool)

(assert (=> b!1565641 (= e!872669 (not true))))

(declare-fun lt!672340 () Bool)

(declare-datatypes ((tuple2!25220 0))(
  ( (tuple2!25221 (_1!12621 (_ BitVec 64)) (_2!12621 V!60115)) )
))
(declare-datatypes ((List!36609 0))(
  ( (Nil!36606) (Cons!36605 (h!38051 tuple2!25220) (t!51480 List!36609)) )
))
(declare-datatypes ((ListLongMap!22655 0))(
  ( (ListLongMap!22656 (toList!11343 List!36609)) )
))
(declare-fun lt!672344 () ListLongMap!22655)

(declare-fun contains!10334 (ListLongMap!22655 (_ BitVec 64)) Bool)

(assert (=> b!1565641 (= lt!672340 (contains!10334 lt!672344 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565641 (not (contains!10334 lt!672344 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672342 () ListLongMap!22655)

(declare-fun lt!672343 () V!60115)

(declare-fun +!5073 (ListLongMap!22655 tuple2!25220) ListLongMap!22655)

(assert (=> b!1565641 (= lt!672344 (+!5073 lt!672342 (tuple2!25221 (select (arr!50464 _keys!637) from!782) lt!672343)))))

(declare-datatypes ((Unit!52010 0))(
  ( (Unit!52011) )
))
(declare-fun lt!672341 () Unit!52010)

(declare-fun addStillNotContains!563 (ListLongMap!22655 (_ BitVec 64) V!60115 (_ BitVec 64)) Unit!52010)

(assert (=> b!1565641 (= lt!672341 (addStillNotContains!563 lt!672342 (select (arr!50464 _keys!637) from!782) lt!672343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26340 (ValueCell!18435 V!60115) V!60115)

(declare-fun dynLambda!3857 (Int (_ BitVec 64)) V!60115)

(assert (=> b!1565641 (= lt!672343 (get!26340 (select (arr!50463 _values!487) from!782) (dynLambda!3857 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60115)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun minValue!453 () V!60115)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6708 (array!104554 array!104552 (_ BitVec 32) (_ BitVec 32) V!60115 V!60115 (_ BitVec 32) Int) ListLongMap!22655)

(assert (=> b!1565641 (= lt!672342 (getCurrentListMapNoExtraKeys!6708 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565643 () Bool)

(declare-fun tp_is_empty!38931 () Bool)

(assert (=> b!1565643 (= e!872668 tp_is_empty!38931)))

(declare-fun b!1565644 () Bool)

(declare-fun res!1070226 () Bool)

(assert (=> b!1565644 (=> (not res!1070226) (not e!872669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104554 (_ BitVec 32)) Bool)

(assert (=> b!1565644 (= res!1070226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565645 () Bool)

(declare-fun res!1070223 () Bool)

(assert (=> b!1565645 (=> (not res!1070223) (not e!872669))))

(assert (=> b!1565645 (= res!1070223 (and (= (size!51013 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51014 _keys!637) (size!51013 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59788 () Bool)

(assert (=> mapIsEmpty!59788 mapRes!59788))

(declare-fun b!1565642 () Bool)

(assert (=> b!1565642 (= e!872670 tp_is_empty!38931)))

(declare-fun res!1070224 () Bool)

(assert (=> start!133934 (=> (not res!1070224) (not e!872669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133934 (= res!1070224 (validMask!0 mask!947))))

(assert (=> start!133934 e!872669))

(assert (=> start!133934 tp!113773))

(assert (=> start!133934 tp_is_empty!38931))

(assert (=> start!133934 true))

(declare-fun array_inv!39213 (array!104554) Bool)

(assert (=> start!133934 (array_inv!39213 _keys!637)))

(declare-fun array_inv!39214 (array!104552) Bool)

(assert (=> start!133934 (and (array_inv!39214 _values!487) e!872671)))

(assert (= (and start!133934 res!1070224) b!1565645))

(assert (= (and b!1565645 res!1070223) b!1565644))

(assert (= (and b!1565644 res!1070226) b!1565638))

(assert (= (and b!1565638 res!1070227) b!1565640))

(assert (= (and b!1565640 res!1070225) b!1565639))

(assert (= (and b!1565639 res!1070222) b!1565641))

(assert (= (and b!1565637 condMapEmpty!59788) mapIsEmpty!59788))

(assert (= (and b!1565637 (not condMapEmpty!59788)) mapNonEmpty!59788))

(get-info :version)

(assert (= (and mapNonEmpty!59788 ((_ is ValueCellFull!18435) mapValue!59788)) b!1565643))

(assert (= (and b!1565637 ((_ is ValueCellFull!18435) mapDefault!59788)) b!1565642))

(assert (= start!133934 b!1565637))

(declare-fun b_lambda!24971 () Bool)

(assert (=> (not b_lambda!24971) (not b!1565641)))

(declare-fun t!51478 () Bool)

(declare-fun tb!12625 () Bool)

(assert (=> (and start!133934 (= defaultEntry!495 defaultEntry!495) t!51478) tb!12625))

(declare-fun result!26541 () Bool)

(assert (=> tb!12625 (= result!26541 tp_is_empty!38931)))

(assert (=> b!1565641 t!51478))

(declare-fun b_and!51757 () Bool)

(assert (= b_and!51755 (and (=> t!51478 result!26541) b_and!51757)))

(declare-fun m!1440547 () Bool)

(assert (=> start!133934 m!1440547))

(declare-fun m!1440549 () Bool)

(assert (=> start!133934 m!1440549))

(declare-fun m!1440551 () Bool)

(assert (=> start!133934 m!1440551))

(declare-fun m!1440553 () Bool)

(assert (=> b!1565639 m!1440553))

(assert (=> b!1565639 m!1440553))

(declare-fun m!1440555 () Bool)

(assert (=> b!1565639 m!1440555))

(declare-fun m!1440557 () Bool)

(assert (=> b!1565644 m!1440557))

(declare-fun m!1440559 () Bool)

(assert (=> b!1565638 m!1440559))

(declare-fun m!1440561 () Bool)

(assert (=> b!1565641 m!1440561))

(declare-fun m!1440563 () Bool)

(assert (=> b!1565641 m!1440563))

(assert (=> b!1565641 m!1440553))

(declare-fun m!1440565 () Bool)

(assert (=> b!1565641 m!1440565))

(declare-fun m!1440567 () Bool)

(assert (=> b!1565641 m!1440567))

(declare-fun m!1440569 () Bool)

(assert (=> b!1565641 m!1440569))

(declare-fun m!1440571 () Bool)

(assert (=> b!1565641 m!1440571))

(assert (=> b!1565641 m!1440563))

(assert (=> b!1565641 m!1440567))

(declare-fun m!1440573 () Bool)

(assert (=> b!1565641 m!1440573))

(declare-fun m!1440575 () Bool)

(assert (=> b!1565641 m!1440575))

(assert (=> b!1565641 m!1440553))

(declare-fun m!1440577 () Bool)

(assert (=> mapNonEmpty!59788 m!1440577))

(check-sat (not mapNonEmpty!59788) (not start!133934) tp_is_empty!38931 (not b_lambda!24971) (not b!1565639) (not b_next!32157) (not b!1565638) (not b!1565641) b_and!51757 (not b!1565644))
(check-sat b_and!51757 (not b_next!32157))
