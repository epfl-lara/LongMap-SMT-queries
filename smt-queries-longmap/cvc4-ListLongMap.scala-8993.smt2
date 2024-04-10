; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108722 () Bool)

(assert start!108722)

(declare-fun b_free!28235 () Bool)

(declare-fun b_next!28235 () Bool)

(assert (=> start!108722 (= b_free!28235 (not b_next!28235))))

(declare-fun tp!99820 () Bool)

(declare-fun b_and!46301 () Bool)

(assert (=> start!108722 (= tp!99820 b_and!46301)))

(declare-fun mapIsEmpty!52370 () Bool)

(declare-fun mapRes!52370 () Bool)

(assert (=> mapIsEmpty!52370 mapRes!52370))

(declare-fun b!1283668 () Bool)

(declare-fun res!852721 () Bool)

(declare-fun e!733321 () Bool)

(assert (=> b!1283668 (=> (not res!852721) (not e!733321))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84812 0))(
  ( (array!84813 (arr!40908 (Array (_ BitVec 32) (_ BitVec 64))) (size!41458 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84812)

(assert (=> b!1283668 (= res!852721 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41458 _keys!1741))))))

(declare-fun res!852719 () Bool)

(assert (=> start!108722 (=> (not res!852719) (not e!733321))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108722 (= res!852719 (validMask!0 mask!2175))))

(assert (=> start!108722 e!733321))

(declare-fun tp_is_empty!33875 () Bool)

(assert (=> start!108722 tp_is_empty!33875))

(assert (=> start!108722 true))

(declare-datatypes ((V!50269 0))(
  ( (V!50270 (val!17012 Int)) )
))
(declare-datatypes ((ValueCell!16039 0))(
  ( (ValueCellFull!16039 (v!19614 V!50269)) (EmptyCell!16039) )
))
(declare-datatypes ((array!84814 0))(
  ( (array!84815 (arr!40909 (Array (_ BitVec 32) ValueCell!16039)) (size!41459 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84814)

(declare-fun e!733323 () Bool)

(declare-fun array_inv!31029 (array!84814) Bool)

(assert (=> start!108722 (and (array_inv!31029 _values!1445) e!733323)))

(declare-fun array_inv!31030 (array!84812) Bool)

(assert (=> start!108722 (array_inv!31030 _keys!1741)))

(assert (=> start!108722 tp!99820))

(declare-fun b!1283669 () Bool)

(declare-fun res!852726 () Bool)

(assert (=> b!1283669 (=> (not res!852726) (not e!733321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84812 (_ BitVec 32)) Bool)

(assert (=> b!1283669 (= res!852726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283670 () Bool)

(declare-fun res!852722 () Bool)

(assert (=> b!1283670 (=> (not res!852722) (not e!733321))))

(declare-fun minValue!1387 () V!50269)

(declare-fun zeroValue!1387 () V!50269)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21788 0))(
  ( (tuple2!21789 (_1!10905 (_ BitVec 64)) (_2!10905 V!50269)) )
))
(declare-datatypes ((List!28984 0))(
  ( (Nil!28981) (Cons!28980 (h!30189 tuple2!21788) (t!42528 List!28984)) )
))
(declare-datatypes ((ListLongMap!19445 0))(
  ( (ListLongMap!19446 (toList!9738 List!28984)) )
))
(declare-fun contains!7855 (ListLongMap!19445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4819 (array!84812 array!84814 (_ BitVec 32) (_ BitVec 32) V!50269 V!50269 (_ BitVec 32) Int) ListLongMap!19445)

(assert (=> b!1283670 (= res!852722 (contains!7855 (getCurrentListMap!4819 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1283671 () Bool)

(declare-fun res!852723 () Bool)

(assert (=> b!1283671 (=> (not res!852723) (not e!733321))))

(declare-datatypes ((List!28985 0))(
  ( (Nil!28982) (Cons!28981 (h!30190 (_ BitVec 64)) (t!42529 List!28985)) )
))
(declare-fun arrayNoDuplicates!0 (array!84812 (_ BitVec 32) List!28985) Bool)

(assert (=> b!1283671 (= res!852723 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28982))))

(declare-fun b!1283672 () Bool)

(declare-fun e!733325 () Bool)

(assert (=> b!1283672 (= e!733325 tp_is_empty!33875)))

(declare-fun mapNonEmpty!52370 () Bool)

(declare-fun tp!99821 () Bool)

(declare-fun e!733324 () Bool)

(assert (=> mapNonEmpty!52370 (= mapRes!52370 (and tp!99821 e!733324))))

(declare-fun mapKey!52370 () (_ BitVec 32))

(declare-fun mapValue!52370 () ValueCell!16039)

(declare-fun mapRest!52370 () (Array (_ BitVec 32) ValueCell!16039))

(assert (=> mapNonEmpty!52370 (= (arr!40909 _values!1445) (store mapRest!52370 mapKey!52370 mapValue!52370))))

(declare-fun b!1283673 () Bool)

(declare-fun res!852718 () Bool)

(assert (=> b!1283673 (=> (not res!852718) (not e!733321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283673 (= res!852718 (validKeyInArray!0 (select (arr!40908 _keys!1741) from!2144)))))

(declare-fun b!1283674 () Bool)

(assert (=> b!1283674 (= e!733324 tp_is_empty!33875)))

(declare-fun b!1283675 () Bool)

(declare-fun res!852720 () Bool)

(assert (=> b!1283675 (=> (not res!852720) (not e!733321))))

(assert (=> b!1283675 (= res!852720 (and (= (size!41459 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41458 _keys!1741) (size!41459 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283676 () Bool)

(declare-fun res!852724 () Bool)

(assert (=> b!1283676 (=> (not res!852724) (not e!733321))))

(assert (=> b!1283676 (= res!852724 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41458 _keys!1741))))))

(declare-fun b!1283677 () Bool)

(declare-fun res!852725 () Bool)

(assert (=> b!1283677 (=> (not res!852725) (not e!733321))))

(assert (=> b!1283677 (= res!852725 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283678 () Bool)

(assert (=> b!1283678 (= e!733323 (and e!733325 mapRes!52370))))

(declare-fun condMapEmpty!52370 () Bool)

(declare-fun mapDefault!52370 () ValueCell!16039)

