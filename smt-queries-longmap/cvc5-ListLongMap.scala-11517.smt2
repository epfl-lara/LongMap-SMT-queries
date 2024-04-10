; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134076 () Bool)

(assert start!134076)

(declare-fun b_free!32203 () Bool)

(declare-fun b_next!32203 () Bool)

(assert (=> start!134076 (= b_free!32203 (not b_next!32203))))

(declare-fun tp!113927 () Bool)

(declare-fun b_and!51847 () Bool)

(assert (=> start!134076 (= tp!113927 b_and!51847)))

(declare-fun b!1567003 () Bool)

(declare-fun res!1070977 () Bool)

(declare-fun e!873480 () Bool)

(assert (=> b!1567003 (=> (not res!1070977) (not e!873480))))

(declare-datatypes ((array!104656 0))(
  ( (array!104657 (arr!50513 (Array (_ BitVec 32) (_ BitVec 64))) (size!51063 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104656)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104656 (_ BitVec 32)) Bool)

(assert (=> b!1567003 (= res!1070977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567004 () Bool)

(declare-fun res!1070980 () Bool)

(assert (=> b!1567004 (=> (not res!1070980) (not e!873480))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567004 (= res!1070980 (not (validKeyInArray!0 (select (arr!50513 _keys!637) from!782))))))

(declare-fun b!1567005 () Bool)

(declare-fun e!873479 () Bool)

(declare-fun tp_is_empty!38983 () Bool)

(assert (=> b!1567005 (= e!873479 tp_is_empty!38983)))

(declare-fun mapIsEmpty!59874 () Bool)

(declare-fun mapRes!59874 () Bool)

(assert (=> mapIsEmpty!59874 mapRes!59874))

(declare-fun b!1567006 () Bool)

(declare-fun e!873477 () Bool)

(assert (=> b!1567006 (= e!873480 e!873477)))

(declare-fun res!1070981 () Bool)

(assert (=> b!1567006 (=> (not res!1070981) (not e!873477))))

(declare-datatypes ((V!60185 0))(
  ( (V!60186 (val!19575 Int)) )
))
(declare-datatypes ((tuple2!25256 0))(
  ( (tuple2!25257 (_1!12639 (_ BitVec 64)) (_2!12639 V!60185)) )
))
(declare-datatypes ((List!36643 0))(
  ( (Nil!36640) (Cons!36639 (h!38086 tuple2!25256) (t!51547 List!36643)) )
))
(declare-datatypes ((ListLongMap!22691 0))(
  ( (ListLongMap!22692 (toList!11361 List!36643)) )
))
(declare-fun lt!672844 () ListLongMap!22691)

(declare-fun contains!10355 (ListLongMap!22691 (_ BitVec 64)) Bool)

(assert (=> b!1567006 (= res!1070981 (not (contains!10355 lt!672844 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60185)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60185)

(declare-datatypes ((ValueCell!18461 0))(
  ( (ValueCellFull!18461 (v!22334 V!60185)) (EmptyCell!18461) )
))
(declare-datatypes ((array!104658 0))(
  ( (array!104659 (arr!50514 (Array (_ BitVec 32) ValueCell!18461)) (size!51064 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104658)

(declare-fun getCurrentListMapNoExtraKeys!6726 (array!104656 array!104658 (_ BitVec 32) (_ BitVec 32) V!60185 V!60185 (_ BitVec 32) Int) ListLongMap!22691)

(assert (=> b!1567006 (= lt!672844 (getCurrentListMapNoExtraKeys!6726 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567008 () Bool)

(declare-fun e!873478 () Bool)

(assert (=> b!1567008 (= e!873478 tp_is_empty!38983)))

(declare-fun b!1567009 () Bool)

(declare-fun res!1070982 () Bool)

(assert (=> b!1567009 (=> (not res!1070982) (not e!873480))))

(declare-datatypes ((List!36644 0))(
  ( (Nil!36641) (Cons!36640 (h!38087 (_ BitVec 64)) (t!51548 List!36644)) )
))
(declare-fun arrayNoDuplicates!0 (array!104656 (_ BitVec 32) List!36644) Bool)

(assert (=> b!1567009 (= res!1070982 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36641))))

(declare-fun b!1567010 () Bool)

(assert (=> b!1567010 (= e!873477 false)))

(declare-fun lt!672845 () Bool)

(assert (=> b!1567010 (= lt!672845 (contains!10355 lt!672844 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567011 () Bool)

(declare-fun res!1070978 () Bool)

(assert (=> b!1567011 (=> (not res!1070978) (not e!873480))))

(assert (=> b!1567011 (= res!1070978 (and (= (size!51064 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51063 _keys!637) (size!51064 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59874 () Bool)

(declare-fun tp!113928 () Bool)

(assert (=> mapNonEmpty!59874 (= mapRes!59874 (and tp!113928 e!873479))))

(declare-fun mapValue!59874 () ValueCell!18461)

(declare-fun mapRest!59874 () (Array (_ BitVec 32) ValueCell!18461))

(declare-fun mapKey!59874 () (_ BitVec 32))

(assert (=> mapNonEmpty!59874 (= (arr!50514 _values!487) (store mapRest!59874 mapKey!59874 mapValue!59874))))

(declare-fun b!1567012 () Bool)

(declare-fun res!1070983 () Bool)

(assert (=> b!1567012 (=> (not res!1070983) (not e!873480))))

(assert (=> b!1567012 (= res!1070983 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51063 _keys!637)) (bvslt from!782 (size!51063 _keys!637))))))

(declare-fun b!1567007 () Bool)

(declare-fun e!873481 () Bool)

(assert (=> b!1567007 (= e!873481 (and e!873478 mapRes!59874))))

(declare-fun condMapEmpty!59874 () Bool)

(declare-fun mapDefault!59874 () ValueCell!18461)

