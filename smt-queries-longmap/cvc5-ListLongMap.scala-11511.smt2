; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133950 () Bool)

(assert start!133950)

(declare-fun b_free!32173 () Bool)

(declare-fun b_next!32173 () Bool)

(assert (=> start!133950 (= b_free!32173 (not b_next!32173))))

(declare-fun tp!113820 () Bool)

(declare-fun b_and!51787 () Bool)

(assert (=> start!133950 (= tp!113820 b_and!51787)))

(declare-fun b!1565882 () Bool)

(declare-fun e!872802 () Bool)

(declare-fun tp_is_empty!38947 () Bool)

(assert (=> b!1565882 (= e!872802 tp_is_empty!38947)))

(declare-fun b!1565883 () Bool)

(declare-fun e!872803 () Bool)

(assert (=> b!1565883 (= e!872803 tp_is_empty!38947)))

(declare-fun b!1565884 () Bool)

(declare-fun res!1070382 () Bool)

(declare-fun e!872800 () Bool)

(assert (=> b!1565884 (=> (not res!1070382) (not e!872800))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104582 0))(
  ( (array!104583 (arr!50478 (Array (_ BitVec 32) (_ BitVec 64))) (size!51028 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104582)

(assert (=> b!1565884 (= res!1070382 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51028 _keys!637)) (bvslt from!782 (size!51028 _keys!637))))))

(declare-fun b!1565885 () Bool)

(declare-fun res!1070380 () Bool)

(assert (=> b!1565885 (=> (not res!1070380) (not e!872800))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104582 (_ BitVec 32)) Bool)

(assert (=> b!1565885 (= res!1070380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565886 () Bool)

(declare-fun res!1070383 () Bool)

(assert (=> b!1565886 (=> (not res!1070383) (not e!872800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565886 (= res!1070383 (validKeyInArray!0 (select (arr!50478 _keys!637) from!782)))))

(declare-fun res!1070384 () Bool)

(assert (=> start!133950 (=> (not res!1070384) (not e!872800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133950 (= res!1070384 (validMask!0 mask!947))))

(assert (=> start!133950 e!872800))

(assert (=> start!133950 tp!113820))

(assert (=> start!133950 tp_is_empty!38947))

(assert (=> start!133950 true))

(declare-fun array_inv!39223 (array!104582) Bool)

(assert (=> start!133950 (array_inv!39223 _keys!637)))

(declare-datatypes ((V!60137 0))(
  ( (V!60138 (val!19557 Int)) )
))
(declare-datatypes ((ValueCell!18443 0))(
  ( (ValueCellFull!18443 (v!22313 V!60137)) (EmptyCell!18443) )
))
(declare-datatypes ((array!104584 0))(
  ( (array!104585 (arr!50479 (Array (_ BitVec 32) ValueCell!18443)) (size!51029 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104584)

(declare-fun e!872798 () Bool)

(declare-fun array_inv!39224 (array!104584) Bool)

(assert (=> start!133950 (and (array_inv!39224 _values!487) e!872798)))

(declare-fun mapIsEmpty!59812 () Bool)

(declare-fun mapRes!59812 () Bool)

(assert (=> mapIsEmpty!59812 mapRes!59812))

(declare-fun b!1565887 () Bool)

(declare-fun res!1070386 () Bool)

(assert (=> b!1565887 (=> (not res!1070386) (not e!872800))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565887 (= res!1070386 (and (= (size!51029 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51028 _keys!637) (size!51029 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59812 () Bool)

(declare-fun tp!113821 () Bool)

(assert (=> mapNonEmpty!59812 (= mapRes!59812 (and tp!113821 e!872802))))

(declare-fun mapValue!59812 () ValueCell!18443)

(declare-fun mapKey!59812 () (_ BitVec 32))

(declare-fun mapRest!59812 () (Array (_ BitVec 32) ValueCell!18443))

(assert (=> mapNonEmpty!59812 (= (arr!50479 _values!487) (store mapRest!59812 mapKey!59812 mapValue!59812))))

(declare-fun b!1565888 () Bool)

(declare-fun e!872799 () Bool)

(assert (=> b!1565888 (= e!872800 (not e!872799))))

(declare-fun res!1070381 () Bool)

(assert (=> b!1565888 (=> res!1070381 e!872799)))

(declare-datatypes ((tuple2!25232 0))(
  ( (tuple2!25233 (_1!12627 (_ BitVec 64)) (_2!12627 V!60137)) )
))
(declare-datatypes ((List!36620 0))(
  ( (Nil!36617) (Cons!36616 (h!38062 tuple2!25232) (t!51507 List!36620)) )
))
(declare-datatypes ((ListLongMap!22667 0))(
  ( (ListLongMap!22668 (toList!11349 List!36620)) )
))
(declare-fun lt!672461 () ListLongMap!22667)

(declare-fun contains!10340 (ListLongMap!22667 (_ BitVec 64)) Bool)

(assert (=> b!1565888 (= res!1070381 (contains!10340 lt!672461 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565888 (not (contains!10340 lt!672461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672460 () ListLongMap!22667)

(declare-fun lt!672459 () V!60137)

(declare-fun +!5079 (ListLongMap!22667 tuple2!25232) ListLongMap!22667)

(assert (=> b!1565888 (= lt!672461 (+!5079 lt!672460 (tuple2!25233 (select (arr!50478 _keys!637) from!782) lt!672459)))))

(declare-datatypes ((Unit!52022 0))(
  ( (Unit!52023) )
))
(declare-fun lt!672458 () Unit!52022)

(declare-fun addStillNotContains!569 (ListLongMap!22667 (_ BitVec 64) V!60137 (_ BitVec 64)) Unit!52022)

(assert (=> b!1565888 (= lt!672458 (addStillNotContains!569 lt!672460 (select (arr!50478 _keys!637) from!782) lt!672459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26352 (ValueCell!18443 V!60137) V!60137)

(declare-fun dynLambda!3863 (Int (_ BitVec 64)) V!60137)

(assert (=> b!1565888 (= lt!672459 (get!26352 (select (arr!50479 _values!487) from!782) (dynLambda!3863 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60137)

(declare-fun minValue!453 () V!60137)

(declare-fun getCurrentListMapNoExtraKeys!6714 (array!104582 array!104584 (_ BitVec 32) (_ BitVec 32) V!60137 V!60137 (_ BitVec 32) Int) ListLongMap!22667)

(assert (=> b!1565888 (= lt!672460 (getCurrentListMapNoExtraKeys!6714 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565889 () Bool)

(declare-fun res!1070379 () Bool)

(assert (=> b!1565889 (=> (not res!1070379) (not e!872800))))

(declare-datatypes ((List!36621 0))(
  ( (Nil!36618) (Cons!36617 (h!38063 (_ BitVec 64)) (t!51508 List!36621)) )
))
(declare-fun arrayNoDuplicates!0 (array!104582 (_ BitVec 32) List!36621) Bool)

(assert (=> b!1565889 (= res!1070379 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36618))))

(declare-fun b!1565890 () Bool)

(assert (=> b!1565890 (= e!872799 (bvslt from!782 (size!51029 _values!487)))))

(declare-fun b!1565891 () Bool)

(assert (=> b!1565891 (= e!872798 (and e!872803 mapRes!59812))))

(declare-fun condMapEmpty!59812 () Bool)

(declare-fun mapDefault!59812 () ValueCell!18443)

