; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133544 () Bool)

(assert start!133544)

(declare-fun b_free!32011 () Bool)

(declare-fun b_next!32011 () Bool)

(assert (=> start!133544 (= b_free!32011 (not b_next!32011))))

(declare-fun tp!113157 () Bool)

(declare-fun b_and!51515 () Bool)

(assert (=> start!133544 (= tp!113157 b_and!51515)))

(declare-fun b!1561631 () Bool)

(declare-fun res!1067813 () Bool)

(declare-fun e!870220 () Bool)

(assert (=> b!1561631 (=> (not res!1067813) (not e!870220))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103984 0))(
  ( (array!103985 (arr!50185 (Array (_ BitVec 32) (_ BitVec 64))) (size!50737 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103984)

(declare-datatypes ((V!59777 0))(
  ( (V!59778 (val!19422 Int)) )
))
(declare-datatypes ((ValueCell!18308 0))(
  ( (ValueCellFull!18308 (v!22170 V!59777)) (EmptyCell!18308) )
))
(declare-datatypes ((array!103986 0))(
  ( (array!103987 (arr!50186 (Array (_ BitVec 32) ValueCell!18308)) (size!50738 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103986)

(assert (=> b!1561631 (= res!1067813 (and (= (size!50738 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50737 _keys!637) (size!50738 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561632 () Bool)

(declare-fun res!1067815 () Bool)

(assert (=> b!1561632 (=> (not res!1067815) (not e!870220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103984 (_ BitVec 32)) Bool)

(assert (=> b!1561632 (= res!1067815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561633 () Bool)

(declare-fun e!870217 () Bool)

(declare-fun e!870219 () Bool)

(declare-fun mapRes!59391 () Bool)

(assert (=> b!1561633 (= e!870217 (and e!870219 mapRes!59391))))

(declare-fun condMapEmpty!59391 () Bool)

(declare-fun mapDefault!59391 () ValueCell!18308)

(assert (=> b!1561633 (= condMapEmpty!59391 (= (arr!50186 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18308)) mapDefault!59391)))))

(declare-fun mapIsEmpty!59391 () Bool)

(assert (=> mapIsEmpty!59391 mapRes!59391))

(declare-fun res!1067817 () Bool)

(assert (=> start!133544 (=> (not res!1067817) (not e!870220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133544 (= res!1067817 (validMask!0 mask!947))))

(assert (=> start!133544 e!870220))

(assert (=> start!133544 tp!113157))

(declare-fun tp_is_empty!38677 () Bool)

(assert (=> start!133544 tp_is_empty!38677))

(assert (=> start!133544 true))

(declare-fun array_inv!39193 (array!103984) Bool)

(assert (=> start!133544 (array_inv!39193 _keys!637)))

(declare-fun array_inv!39194 (array!103986) Bool)

(assert (=> start!133544 (and (array_inv!39194 _values!487) e!870217)))

(declare-fun b!1561634 () Bool)

(declare-fun res!1067816 () Bool)

(assert (=> b!1561634 (=> (not res!1067816) (not e!870220))))

(declare-datatypes ((List!36498 0))(
  ( (Nil!36495) (Cons!36494 (h!37941 (_ BitVec 64)) (t!51291 List!36498)) )
))
(declare-fun arrayNoDuplicates!0 (array!103984 (_ BitVec 32) List!36498) Bool)

(assert (=> b!1561634 (= res!1067816 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36495))))

(declare-fun b!1561635 () Bool)

(assert (=> b!1561635 (= e!870219 tp_is_empty!38677)))

(declare-fun b!1561636 () Bool)

(declare-fun e!870216 () Bool)

(assert (=> b!1561636 (= e!870216 tp_is_empty!38677)))

(declare-fun mapNonEmpty!59391 () Bool)

(declare-fun tp!113158 () Bool)

(assert (=> mapNonEmpty!59391 (= mapRes!59391 (and tp!113158 e!870216))))

(declare-fun mapValue!59391 () ValueCell!18308)

(declare-fun mapKey!59391 () (_ BitVec 32))

(declare-fun mapRest!59391 () (Array (_ BitVec 32) ValueCell!18308))

(assert (=> mapNonEmpty!59391 (= (arr!50186 _values!487) (store mapRest!59391 mapKey!59391 mapValue!59391))))

(declare-fun b!1561637 () Bool)

(assert (=> b!1561637 (= e!870220 (not true))))

(declare-fun lt!671122 () Bool)

(declare-datatypes ((tuple2!25158 0))(
  ( (tuple2!25159 (_1!12590 (_ BitVec 64)) (_2!12590 V!59777)) )
))
(declare-datatypes ((List!36499 0))(
  ( (Nil!36496) (Cons!36495 (h!37942 tuple2!25158) (t!51292 List!36499)) )
))
(declare-datatypes ((ListLongMap!22593 0))(
  ( (ListLongMap!22594 (toList!11312 List!36499)) )
))
(declare-fun lt!671121 () ListLongMap!22593)

(declare-fun contains!10222 (ListLongMap!22593 (_ BitVec 64)) Bool)

(assert (=> b!1561637 (= lt!671122 (contains!10222 lt!671121 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561637 (not (contains!10222 lt!671121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671119 () ListLongMap!22593)

(declare-fun lt!671120 () V!59777)

(declare-fun +!5077 (ListLongMap!22593 tuple2!25158) ListLongMap!22593)

(assert (=> b!1561637 (= lt!671121 (+!5077 lt!671119 (tuple2!25159 (select (arr!50185 _keys!637) from!782) lt!671120)))))

(declare-datatypes ((Unit!51762 0))(
  ( (Unit!51763) )
))
(declare-fun lt!671123 () Unit!51762)

(declare-fun addStillNotContains!524 (ListLongMap!22593 (_ BitVec 64) V!59777 (_ BitVec 64)) Unit!51762)

(assert (=> b!1561637 (= lt!671123 (addStillNotContains!524 lt!671119 (select (arr!50185 _keys!637) from!782) lt!671120 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26226 (ValueCell!18308 V!59777) V!59777)

(declare-fun dynLambda!3853 (Int (_ BitVec 64)) V!59777)

(assert (=> b!1561637 (= lt!671120 (get!26226 (select (arr!50186 _values!487) from!782) (dynLambda!3853 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59777)

(declare-fun minValue!453 () V!59777)

(declare-fun getCurrentListMapNoExtraKeys!6686 (array!103984 array!103986 (_ BitVec 32) (_ BitVec 32) V!59777 V!59777 (_ BitVec 32) Int) ListLongMap!22593)

(assert (=> b!1561637 (= lt!671119 (getCurrentListMapNoExtraKeys!6686 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561638 () Bool)

(declare-fun res!1067812 () Bool)

(assert (=> b!1561638 (=> (not res!1067812) (not e!870220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561638 (= res!1067812 (validKeyInArray!0 (select (arr!50185 _keys!637) from!782)))))

(declare-fun b!1561639 () Bool)

(declare-fun res!1067814 () Bool)

(assert (=> b!1561639 (=> (not res!1067814) (not e!870220))))

(assert (=> b!1561639 (= res!1067814 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50737 _keys!637)) (bvslt from!782 (size!50737 _keys!637))))))

(assert (= (and start!133544 res!1067817) b!1561631))

(assert (= (and b!1561631 res!1067813) b!1561632))

(assert (= (and b!1561632 res!1067815) b!1561634))

(assert (= (and b!1561634 res!1067816) b!1561639))

(assert (= (and b!1561639 res!1067814) b!1561638))

(assert (= (and b!1561638 res!1067812) b!1561637))

(assert (= (and b!1561633 condMapEmpty!59391) mapIsEmpty!59391))

(assert (= (and b!1561633 (not condMapEmpty!59391)) mapNonEmpty!59391))

(get-info :version)

(assert (= (and mapNonEmpty!59391 ((_ is ValueCellFull!18308) mapValue!59391)) b!1561636))

(assert (= (and b!1561633 ((_ is ValueCellFull!18308) mapDefault!59391)) b!1561635))

(assert (= start!133544 b!1561633))

(declare-fun b_lambda!24875 () Bool)

(assert (=> (not b_lambda!24875) (not b!1561637)))

(declare-fun t!51290 () Bool)

(declare-fun tb!12547 () Bool)

(assert (=> (and start!133544 (= defaultEntry!495 defaultEntry!495) t!51290) tb!12547))

(declare-fun result!26383 () Bool)

(assert (=> tb!12547 (= result!26383 tp_is_empty!38677)))

(assert (=> b!1561637 t!51290))

(declare-fun b_and!51517 () Bool)

(assert (= b_and!51515 (and (=> t!51290 result!26383) b_and!51517)))

(declare-fun m!1436757 () Bool)

(assert (=> b!1561634 m!1436757))

(declare-fun m!1436759 () Bool)

(assert (=> b!1561637 m!1436759))

(declare-fun m!1436761 () Bool)

(assert (=> b!1561637 m!1436761))

(declare-fun m!1436763 () Bool)

(assert (=> b!1561637 m!1436763))

(assert (=> b!1561637 m!1436759))

(declare-fun m!1436765 () Bool)

(assert (=> b!1561637 m!1436765))

(declare-fun m!1436767 () Bool)

(assert (=> b!1561637 m!1436767))

(assert (=> b!1561637 m!1436765))

(declare-fun m!1436769 () Bool)

(assert (=> b!1561637 m!1436769))

(assert (=> b!1561637 m!1436761))

(declare-fun m!1436771 () Bool)

(assert (=> b!1561637 m!1436771))

(declare-fun m!1436773 () Bool)

(assert (=> b!1561637 m!1436773))

(declare-fun m!1436775 () Bool)

(assert (=> b!1561637 m!1436775))

(assert (=> b!1561638 m!1436765))

(assert (=> b!1561638 m!1436765))

(declare-fun m!1436777 () Bool)

(assert (=> b!1561638 m!1436777))

(declare-fun m!1436779 () Bool)

(assert (=> b!1561632 m!1436779))

(declare-fun m!1436781 () Bool)

(assert (=> mapNonEmpty!59391 m!1436781))

(declare-fun m!1436783 () Bool)

(assert (=> start!133544 m!1436783))

(declare-fun m!1436785 () Bool)

(assert (=> start!133544 m!1436785))

(declare-fun m!1436787 () Bool)

(assert (=> start!133544 m!1436787))

(check-sat (not b!1561634) (not b!1561632) (not b_next!32011) (not b!1561638) b_and!51517 (not b!1561637) (not b_lambda!24875) (not start!133544) tp_is_empty!38677 (not mapNonEmpty!59391))
(check-sat b_and!51517 (not b_next!32011))
