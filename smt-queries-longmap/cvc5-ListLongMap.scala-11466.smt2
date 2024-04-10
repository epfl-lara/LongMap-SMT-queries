; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133594 () Bool)

(assert start!133594)

(declare-fun b_free!32011 () Bool)

(declare-fun b_next!32011 () Bool)

(assert (=> start!133594 (= b_free!32011 (not b_next!32011))))

(declare-fun tp!113156 () Bool)

(declare-fun b_and!51533 () Bool)

(assert (=> start!133594 (= tp!113156 b_and!51533)))

(declare-fun b!1561944 () Bool)

(declare-fun e!870415 () Bool)

(declare-fun tp_is_empty!38677 () Bool)

(assert (=> b!1561944 (= e!870415 tp_is_empty!38677)))

(declare-fun b!1561945 () Bool)

(declare-fun res!1067943 () Bool)

(declare-fun e!870416 () Bool)

(assert (=> b!1561945 (=> (not res!1067943) (not e!870416))))

(declare-datatypes ((array!104072 0))(
  ( (array!104073 (arr!50228 (Array (_ BitVec 32) (_ BitVec 64))) (size!50778 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104072)

(declare-datatypes ((List!36462 0))(
  ( (Nil!36459) (Cons!36458 (h!37904 (_ BitVec 64)) (t!51263 List!36462)) )
))
(declare-fun arrayNoDuplicates!0 (array!104072 (_ BitVec 32) List!36462) Bool)

(assert (=> b!1561945 (= res!1067943 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36459))))

(declare-fun b!1561946 () Bool)

(declare-fun res!1067942 () Bool)

(assert (=> b!1561946 (=> (not res!1067942) (not e!870416))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561946 (= res!1067942 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50778 _keys!637)) (bvslt from!782 (size!50778 _keys!637))))))

(declare-fun b!1561947 () Bool)

(declare-fun res!1067946 () Bool)

(assert (=> b!1561947 (=> (not res!1067946) (not e!870416))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59777 0))(
  ( (V!59778 (val!19422 Int)) )
))
(declare-datatypes ((ValueCell!18308 0))(
  ( (ValueCellFull!18308 (v!22174 V!59777)) (EmptyCell!18308) )
))
(declare-datatypes ((array!104074 0))(
  ( (array!104075 (arr!50229 (Array (_ BitVec 32) ValueCell!18308)) (size!50779 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104074)

(assert (=> b!1561947 (= res!1067946 (and (= (size!50779 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50778 _keys!637) (size!50779 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1067944 () Bool)

(assert (=> start!133594 (=> (not res!1067944) (not e!870416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133594 (= res!1067944 (validMask!0 mask!947))))

(assert (=> start!133594 e!870416))

(assert (=> start!133594 tp!113156))

(assert (=> start!133594 tp_is_empty!38677))

(assert (=> start!133594 true))

(declare-fun array_inv!39041 (array!104072) Bool)

(assert (=> start!133594 (array_inv!39041 _keys!637)))

(declare-fun e!870418 () Bool)

(declare-fun array_inv!39042 (array!104074) Bool)

(assert (=> start!133594 (and (array_inv!39042 _values!487) e!870418)))

(declare-fun mapIsEmpty!59391 () Bool)

(declare-fun mapRes!59391 () Bool)

(assert (=> mapIsEmpty!59391 mapRes!59391))

(declare-fun b!1561948 () Bool)

(assert (=> b!1561948 (= e!870416 (not true))))

(declare-fun lt!671405 () Bool)

(declare-datatypes ((tuple2!25090 0))(
  ( (tuple2!25091 (_1!12556 (_ BitVec 64)) (_2!12556 V!59777)) )
))
(declare-datatypes ((List!36463 0))(
  ( (Nil!36460) (Cons!36459 (h!37905 tuple2!25090) (t!51264 List!36463)) )
))
(declare-datatypes ((ListLongMap!22525 0))(
  ( (ListLongMap!22526 (toList!11278 List!36463)) )
))
(declare-fun lt!671406 () ListLongMap!22525)

(declare-fun contains!10268 (ListLongMap!22525 (_ BitVec 64)) Bool)

(assert (=> b!1561948 (= lt!671405 (contains!10268 lt!671406 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561948 (not (contains!10268 lt!671406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671407 () ListLongMap!22525)

(declare-fun lt!671408 () V!59777)

(declare-fun +!5048 (ListLongMap!22525 tuple2!25090) ListLongMap!22525)

(assert (=> b!1561948 (= lt!671406 (+!5048 lt!671407 (tuple2!25091 (select (arr!50228 _keys!637) from!782) lt!671408)))))

(declare-datatypes ((Unit!51950 0))(
  ( (Unit!51951) )
))
(declare-fun lt!671409 () Unit!51950)

(declare-fun addStillNotContains!538 (ListLongMap!22525 (_ BitVec 64) V!59777 (_ BitVec 64)) Unit!51950)

(assert (=> b!1561948 (= lt!671409 (addStillNotContains!538 lt!671407 (select (arr!50228 _keys!637) from!782) lt!671408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26229 (ValueCell!18308 V!59777) V!59777)

(declare-fun dynLambda!3832 (Int (_ BitVec 64)) V!59777)

(assert (=> b!1561948 (= lt!671408 (get!26229 (select (arr!50229 _values!487) from!782) (dynLambda!3832 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59777)

(declare-fun minValue!453 () V!59777)

(declare-fun getCurrentListMapNoExtraKeys!6662 (array!104072 array!104074 (_ BitVec 32) (_ BitVec 32) V!59777 V!59777 (_ BitVec 32) Int) ListLongMap!22525)

(assert (=> b!1561948 (= lt!671407 (getCurrentListMapNoExtraKeys!6662 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561949 () Bool)

(declare-fun res!1067945 () Bool)

(assert (=> b!1561949 (=> (not res!1067945) (not e!870416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561949 (= res!1067945 (validKeyInArray!0 (select (arr!50228 _keys!637) from!782)))))

(declare-fun b!1561950 () Bool)

(declare-fun e!870414 () Bool)

(assert (=> b!1561950 (= e!870414 tp_is_empty!38677)))

(declare-fun mapNonEmpty!59391 () Bool)

(declare-fun tp!113157 () Bool)

(assert (=> mapNonEmpty!59391 (= mapRes!59391 (and tp!113157 e!870415))))

(declare-fun mapValue!59391 () ValueCell!18308)

(declare-fun mapRest!59391 () (Array (_ BitVec 32) ValueCell!18308))

(declare-fun mapKey!59391 () (_ BitVec 32))

(assert (=> mapNonEmpty!59391 (= (arr!50229 _values!487) (store mapRest!59391 mapKey!59391 mapValue!59391))))

(declare-fun b!1561951 () Bool)

(assert (=> b!1561951 (= e!870418 (and e!870414 mapRes!59391))))

(declare-fun condMapEmpty!59391 () Bool)

(declare-fun mapDefault!59391 () ValueCell!18308)

