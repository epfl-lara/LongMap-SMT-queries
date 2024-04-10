; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133864 () Bool)

(assert start!133864)

(declare-fun b_free!32125 () Bool)

(declare-fun b_next!32125 () Bool)

(assert (=> start!133864 (= b_free!32125 (not b_next!32125))))

(declare-fun tp!113670 () Bool)

(declare-fun b_and!51695 () Bool)

(assert (=> start!133864 (= tp!113670 b_and!51695)))

(declare-fun b!1564998 () Bool)

(declare-fun res!1069858 () Bool)

(declare-fun e!872301 () Bool)

(assert (=> b!1564998 (=> (not res!1069858) (not e!872301))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104486 0))(
  ( (array!104487 (arr!50432 (Array (_ BitVec 32) (_ BitVec 64))) (size!50982 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104486)

(declare-datatypes ((V!60073 0))(
  ( (V!60074 (val!19533 Int)) )
))
(declare-datatypes ((ValueCell!18419 0))(
  ( (ValueCellFull!18419 (v!22287 V!60073)) (EmptyCell!18419) )
))
(declare-datatypes ((array!104488 0))(
  ( (array!104489 (arr!50433 (Array (_ BitVec 32) ValueCell!18419)) (size!50983 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104488)

(assert (=> b!1564998 (= res!1069858 (and (= (size!50983 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50982 _keys!637) (size!50983 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59734 () Bool)

(declare-fun mapRes!59734 () Bool)

(assert (=> mapIsEmpty!59734 mapRes!59734))

(declare-fun mapNonEmpty!59734 () Bool)

(declare-fun tp!113671 () Bool)

(declare-fun e!872305 () Bool)

(assert (=> mapNonEmpty!59734 (= mapRes!59734 (and tp!113671 e!872305))))

(declare-fun mapValue!59734 () ValueCell!18419)

(declare-fun mapKey!59734 () (_ BitVec 32))

(declare-fun mapRest!59734 () (Array (_ BitVec 32) ValueCell!18419))

(assert (=> mapNonEmpty!59734 (= (arr!50433 _values!487) (store mapRest!59734 mapKey!59734 mapValue!59734))))

(declare-fun b!1564999 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564999 (= e!872301 (bvsge from!782 (size!50983 _values!487)))))

(declare-fun zeroValue!453 () V!60073)

(declare-datatypes ((tuple2!25200 0))(
  ( (tuple2!25201 (_1!12611 (_ BitVec 64)) (_2!12611 V!60073)) )
))
(declare-datatypes ((List!36588 0))(
  ( (Nil!36585) (Cons!36584 (h!38030 tuple2!25200) (t!51435 List!36588)) )
))
(declare-datatypes ((ListLongMap!22635 0))(
  ( (ListLongMap!22636 (toList!11333 List!36588)) )
))
(declare-fun lt!672128 () ListLongMap!22635)

(declare-fun minValue!453 () V!60073)

(declare-fun defaultEntry!495 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6698 (array!104486 array!104488 (_ BitVec 32) (_ BitVec 32) V!60073 V!60073 (_ BitVec 32) Int) ListLongMap!22635)

(assert (=> b!1564999 (= lt!672128 (getCurrentListMapNoExtraKeys!6698 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565001 () Bool)

(declare-fun tp_is_empty!38899 () Bool)

(assert (=> b!1565001 (= e!872305 tp_is_empty!38899)))

(declare-fun b!1565002 () Bool)

(declare-fun res!1069861 () Bool)

(assert (=> b!1565002 (=> (not res!1069861) (not e!872301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565002 (= res!1069861 (validKeyInArray!0 (select (arr!50432 _keys!637) from!782)))))

(declare-fun b!1565003 () Bool)

(declare-fun e!872304 () Bool)

(declare-fun e!872302 () Bool)

(assert (=> b!1565003 (= e!872304 (and e!872302 mapRes!59734))))

(declare-fun condMapEmpty!59734 () Bool)

(declare-fun mapDefault!59734 () ValueCell!18419)

