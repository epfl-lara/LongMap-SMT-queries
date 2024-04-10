; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133546 () Bool)

(assert start!133546)

(declare-fun b_free!31963 () Bool)

(declare-fun b_next!31963 () Bool)

(assert (=> start!133546 (= b_free!31963 (not b_next!31963))))

(declare-fun tp!113012 () Bool)

(declare-fun b_and!51437 () Bool)

(assert (=> start!133546 (= tp!113012 b_and!51437)))

(declare-fun b!1561239 () Bool)

(declare-fun e!870046 () Bool)

(assert (=> b!1561239 (= e!870046 (not true))))

(declare-datatypes ((V!59713 0))(
  ( (V!59714 (val!19398 Int)) )
))
(declare-fun lt!671151 () V!59713)

(declare-datatypes ((array!103976 0))(
  ( (array!103977 (arr!50180 (Array (_ BitVec 32) (_ BitVec 64))) (size!50730 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103976)

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((tuple2!25058 0))(
  ( (tuple2!25059 (_1!12540 (_ BitVec 64)) (_2!12540 V!59713)) )
))
(declare-datatypes ((List!36429 0))(
  ( (Nil!36426) (Cons!36425 (h!37871 tuple2!25058) (t!51182 List!36429)) )
))
(declare-datatypes ((ListLongMap!22493 0))(
  ( (ListLongMap!22494 (toList!11262 List!36429)) )
))
(declare-fun lt!671150 () ListLongMap!22493)

(declare-fun contains!10252 (ListLongMap!22493 (_ BitVec 64)) Bool)

(declare-fun +!5032 (ListLongMap!22493 tuple2!25058) ListLongMap!22493)

(assert (=> b!1561239 (not (contains!10252 (+!5032 lt!671150 (tuple2!25059 (select (arr!50180 _keys!637) from!782) lt!671151)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51918 0))(
  ( (Unit!51919) )
))
(declare-fun lt!671149 () Unit!51918)

(declare-fun addStillNotContains!522 (ListLongMap!22493 (_ BitVec 64) V!59713 (_ BitVec 64)) Unit!51918)

(assert (=> b!1561239 (= lt!671149 (addStillNotContains!522 lt!671150 (select (arr!50180 _keys!637) from!782) lt!671151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18284 0))(
  ( (ValueCellFull!18284 (v!22150 V!59713)) (EmptyCell!18284) )
))
(declare-datatypes ((array!103978 0))(
  ( (array!103979 (arr!50181 (Array (_ BitVec 32) ValueCell!18284)) (size!50731 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103978)

(declare-fun get!26197 (ValueCell!18284 V!59713) V!59713)

(declare-fun dynLambda!3816 (Int (_ BitVec 64)) V!59713)

(assert (=> b!1561239 (= lt!671151 (get!26197 (select (arr!50181 _values!487) from!782) (dynLambda!3816 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59713)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59713)

(declare-fun getCurrentListMapNoExtraKeys!6646 (array!103976 array!103978 (_ BitVec 32) (_ BitVec 32) V!59713 V!59713 (_ BitVec 32) Int) ListLongMap!22493)

(assert (=> b!1561239 (= lt!671150 (getCurrentListMapNoExtraKeys!6646 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapIsEmpty!59319 () Bool)

(declare-fun mapRes!59319 () Bool)

(assert (=> mapIsEmpty!59319 mapRes!59319))

(declare-fun b!1561240 () Bool)

(declare-fun res!1067504 () Bool)

(assert (=> b!1561240 (=> (not res!1067504) (not e!870046))))

(assert (=> b!1561240 (= res!1067504 (and (= (size!50731 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50730 _keys!637) (size!50731 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561241 () Bool)

(declare-fun e!870047 () Bool)

(declare-fun tp_is_empty!38629 () Bool)

(assert (=> b!1561241 (= e!870047 tp_is_empty!38629)))

(declare-fun b!1561242 () Bool)

(declare-fun res!1067500 () Bool)

(assert (=> b!1561242 (=> (not res!1067500) (not e!870046))))

(assert (=> b!1561242 (= res!1067500 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50730 _keys!637)) (bvslt from!782 (size!50730 _keys!637))))))

(declare-fun b!1561244 () Bool)

(declare-fun res!1067501 () Bool)

(assert (=> b!1561244 (=> (not res!1067501) (not e!870046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103976 (_ BitVec 32)) Bool)

(assert (=> b!1561244 (= res!1067501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59319 () Bool)

(declare-fun tp!113013 () Bool)

(declare-fun e!870048 () Bool)

(assert (=> mapNonEmpty!59319 (= mapRes!59319 (and tp!113013 e!870048))))

(declare-fun mapKey!59319 () (_ BitVec 32))

(declare-fun mapRest!59319 () (Array (_ BitVec 32) ValueCell!18284))

(declare-fun mapValue!59319 () ValueCell!18284)

(assert (=> mapNonEmpty!59319 (= (arr!50181 _values!487) (store mapRest!59319 mapKey!59319 mapValue!59319))))

(declare-fun b!1561245 () Bool)

(declare-fun e!870045 () Bool)

(assert (=> b!1561245 (= e!870045 (and e!870047 mapRes!59319))))

(declare-fun condMapEmpty!59319 () Bool)

(declare-fun mapDefault!59319 () ValueCell!18284)

