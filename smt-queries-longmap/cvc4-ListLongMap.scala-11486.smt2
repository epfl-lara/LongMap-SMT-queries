; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133718 () Bool)

(assert start!133718)

(declare-fun b_free!32081 () Bool)

(declare-fun b_next!32081 () Bool)

(assert (=> start!133718 (= b_free!32081 (not b_next!32081))))

(declare-fun tp!113447 () Bool)

(declare-fun b_and!51651 () Bool)

(assert (=> start!133718 (= tp!113447 b_and!51651)))

(declare-fun b!1563485 () Bool)

(declare-fun e!871383 () Bool)

(declare-fun tp_is_empty!38801 () Bool)

(assert (=> b!1563485 (= e!871383 tp_is_empty!38801)))

(declare-fun b!1563486 () Bool)

(declare-fun e!871380 () Bool)

(assert (=> b!1563486 (= e!871380 tp_is_empty!38801)))

(declare-fun b!1563487 () Bool)

(declare-fun e!871384 () Bool)

(declare-fun e!871381 () Bool)

(assert (=> b!1563487 (= e!871384 e!871381)))

(declare-fun res!1068879 () Bool)

(assert (=> b!1563487 (=> (not res!1068879) (not e!871381))))

(declare-datatypes ((V!59941 0))(
  ( (V!59942 (val!19484 Int)) )
))
(declare-datatypes ((tuple2!25138 0))(
  ( (tuple2!25139 (_1!12580 (_ BitVec 64)) (_2!12580 V!59941)) )
))
(declare-datatypes ((List!36522 0))(
  ( (Nil!36519) (Cons!36518 (h!37964 tuple2!25138) (t!51369 List!36522)) )
))
(declare-datatypes ((ListLongMap!22573 0))(
  ( (ListLongMap!22574 (toList!11302 List!36522)) )
))
(declare-fun lt!671898 () ListLongMap!22573)

(declare-fun contains!10292 (ListLongMap!22573 (_ BitVec 64)) Bool)

(assert (=> b!1563487 (= res!1068879 (not (contains!10292 lt!671898 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59941)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59941)

(declare-datatypes ((array!104298 0))(
  ( (array!104299 (arr!50341 (Array (_ BitVec 32) (_ BitVec 64))) (size!50891 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104298)

(declare-datatypes ((ValueCell!18370 0))(
  ( (ValueCellFull!18370 (v!22236 V!59941)) (EmptyCell!18370) )
))
(declare-datatypes ((array!104300 0))(
  ( (array!104301 (arr!50342 (Array (_ BitVec 32) ValueCell!18370)) (size!50892 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104300)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6685 (array!104298 array!104300 (_ BitVec 32) (_ BitVec 32) V!59941 V!59941 (_ BitVec 32) Int) ListLongMap!22573)

(assert (=> b!1563487 (= lt!671898 (getCurrentListMapNoExtraKeys!6685 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59577 () Bool)

(declare-fun mapRes!59577 () Bool)

(declare-fun tp!113448 () Bool)

(assert (=> mapNonEmpty!59577 (= mapRes!59577 (and tp!113448 e!871383))))

(declare-fun mapKey!59577 () (_ BitVec 32))

(declare-fun mapRest!59577 () (Array (_ BitVec 32) ValueCell!18370))

(declare-fun mapValue!59577 () ValueCell!18370)

(assert (=> mapNonEmpty!59577 (= (arr!50342 _values!487) (store mapRest!59577 mapKey!59577 mapValue!59577))))

(declare-fun b!1563489 () Bool)

(declare-fun res!1068880 () Bool)

(assert (=> b!1563489 (=> (not res!1068880) (not e!871384))))

(assert (=> b!1563489 (= res!1068880 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50891 _keys!637)) (bvslt from!782 (size!50891 _keys!637))))))

(declare-fun b!1563490 () Bool)

(declare-fun res!1068881 () Bool)

(assert (=> b!1563490 (=> (not res!1068881) (not e!871384))))

(assert (=> b!1563490 (= res!1068881 (and (= (size!50892 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50891 _keys!637) (size!50892 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563491 () Bool)

(declare-fun e!871382 () Bool)

(assert (=> b!1563491 (= e!871382 (and e!871380 mapRes!59577))))

(declare-fun condMapEmpty!59577 () Bool)

(declare-fun mapDefault!59577 () ValueCell!18370)

