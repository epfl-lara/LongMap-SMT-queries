; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133582 () Bool)

(assert start!133582)

(declare-fun b_free!31999 () Bool)

(declare-fun b_next!31999 () Bool)

(assert (=> start!133582 (= b_free!31999 (not b_next!31999))))

(declare-fun tp!113121 () Bool)

(declare-fun b_and!51509 () Bool)

(assert (=> start!133582 (= tp!113121 b_and!51509)))

(declare-fun mapNonEmpty!59373 () Bool)

(declare-fun mapRes!59373 () Bool)

(declare-fun tp!113120 () Bool)

(declare-fun e!870321 () Bool)

(assert (=> mapNonEmpty!59373 (= mapRes!59373 (and tp!113120 e!870321))))

(declare-datatypes ((V!59761 0))(
  ( (V!59762 (val!19416 Int)) )
))
(declare-datatypes ((ValueCell!18302 0))(
  ( (ValueCellFull!18302 (v!22168 V!59761)) (EmptyCell!18302) )
))
(declare-fun mapRest!59373 () (Array (_ BitVec 32) ValueCell!18302))

(declare-fun mapValue!59373 () ValueCell!18302)

(declare-datatypes ((array!104048 0))(
  ( (array!104049 (arr!50216 (Array (_ BitVec 32) ValueCell!18302)) (size!50766 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104048)

(declare-fun mapKey!59373 () (_ BitVec 32))

(assert (=> mapNonEmpty!59373 (= (arr!50216 _values!487) (store mapRest!59373 mapKey!59373 mapValue!59373))))

(declare-fun b!1561763 () Bool)

(declare-fun res!1067828 () Bool)

(declare-fun e!870317 () Bool)

(assert (=> b!1561763 (=> (not res!1067828) (not e!870317))))

(declare-datatypes ((array!104050 0))(
  ( (array!104051 (arr!50217 (Array (_ BitVec 32) (_ BitVec 64))) (size!50767 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104050)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561763 (= res!1067828 (validKeyInArray!0 (select (arr!50217 _keys!637) from!782)))))

(declare-fun res!1067830 () Bool)

(assert (=> start!133582 (=> (not res!1067830) (not e!870317))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133582 (= res!1067830 (validMask!0 mask!947))))

(assert (=> start!133582 e!870317))

(assert (=> start!133582 tp!113121))

(declare-fun tp_is_empty!38665 () Bool)

(assert (=> start!133582 tp_is_empty!38665))

(assert (=> start!133582 true))

(declare-fun array_inv!39033 (array!104050) Bool)

(assert (=> start!133582 (array_inv!39033 _keys!637)))

(declare-fun e!870320 () Bool)

(declare-fun array_inv!39034 (array!104048) Bool)

(assert (=> start!133582 (and (array_inv!39034 _values!487) e!870320)))

(declare-fun b!1561764 () Bool)

(declare-fun res!1067826 () Bool)

(assert (=> b!1561764 (=> (not res!1067826) (not e!870317))))

(declare-datatypes ((List!36453 0))(
  ( (Nil!36450) (Cons!36449 (h!37895 (_ BitVec 64)) (t!51242 List!36453)) )
))
(declare-fun arrayNoDuplicates!0 (array!104050 (_ BitVec 32) List!36453) Bool)

(assert (=> b!1561764 (= res!1067826 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36450))))

(declare-fun b!1561765 () Bool)

(assert (=> b!1561765 (= e!870321 tp_is_empty!38665)))

(declare-fun b!1561766 () Bool)

(declare-fun e!870322 () Bool)

(assert (=> b!1561766 (= e!870322 true)))

(declare-datatypes ((tuple2!25082 0))(
  ( (tuple2!25083 (_1!12552 (_ BitVec 64)) (_2!12552 V!59761)) )
))
(declare-datatypes ((List!36454 0))(
  ( (Nil!36451) (Cons!36450 (h!37896 tuple2!25082) (t!51243 List!36454)) )
))
(declare-datatypes ((ListLongMap!22517 0))(
  ( (ListLongMap!22518 (toList!11274 List!36454)) )
))
(declare-fun lt!671319 () ListLongMap!22517)

(declare-fun lt!671315 () Bool)

(declare-fun contains!10264 (ListLongMap!22517 (_ BitVec 64)) Bool)

(assert (=> b!1561766 (= lt!671315 (contains!10264 lt!671319 (select (arr!50217 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59373 () Bool)

(assert (=> mapIsEmpty!59373 mapRes!59373))

(declare-fun b!1561767 () Bool)

(assert (=> b!1561767 (= e!870317 (not e!870322))))

(declare-fun res!1067832 () Bool)

(assert (=> b!1561767 (=> res!1067832 e!870322)))

(assert (=> b!1561767 (= res!1067832 (contains!10264 lt!671319 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561767 (not (contains!10264 lt!671319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671318 () ListLongMap!22517)

(declare-fun lt!671316 () V!59761)

(declare-fun +!5044 (ListLongMap!22517 tuple2!25082) ListLongMap!22517)

(assert (=> b!1561767 (= lt!671319 (+!5044 lt!671318 (tuple2!25083 (select (arr!50217 _keys!637) from!782) lt!671316)))))

(declare-datatypes ((Unit!51942 0))(
  ( (Unit!51943) )
))
(declare-fun lt!671317 () Unit!51942)

(declare-fun addStillNotContains!534 (ListLongMap!22517 (_ BitVec 64) V!59761 (_ BitVec 64)) Unit!51942)

(assert (=> b!1561767 (= lt!671317 (addStillNotContains!534 lt!671318 (select (arr!50217 _keys!637) from!782) lt!671316 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26221 (ValueCell!18302 V!59761) V!59761)

(declare-fun dynLambda!3828 (Int (_ BitVec 64)) V!59761)

(assert (=> b!1561767 (= lt!671316 (get!26221 (select (arr!50216 _values!487) from!782) (dynLambda!3828 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59761)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59761)

(declare-fun getCurrentListMapNoExtraKeys!6658 (array!104050 array!104048 (_ BitVec 32) (_ BitVec 32) V!59761 V!59761 (_ BitVec 32) Int) ListLongMap!22517)

(assert (=> b!1561767 (= lt!671318 (getCurrentListMapNoExtraKeys!6658 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561768 () Bool)

(declare-fun e!870319 () Bool)

(assert (=> b!1561768 (= e!870319 tp_is_empty!38665)))

(declare-fun b!1561769 () Bool)

(declare-fun res!1067827 () Bool)

(assert (=> b!1561769 (=> (not res!1067827) (not e!870317))))

(assert (=> b!1561769 (= res!1067827 (and (= (size!50766 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50767 _keys!637) (size!50766 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561770 () Bool)

(declare-fun res!1067829 () Bool)

(assert (=> b!1561770 (=> (not res!1067829) (not e!870317))))

(assert (=> b!1561770 (= res!1067829 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50767 _keys!637)) (bvslt from!782 (size!50767 _keys!637))))))

(declare-fun b!1561771 () Bool)

(assert (=> b!1561771 (= e!870320 (and e!870319 mapRes!59373))))

(declare-fun condMapEmpty!59373 () Bool)

(declare-fun mapDefault!59373 () ValueCell!18302)

