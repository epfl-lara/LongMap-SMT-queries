; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81858 () Bool)

(assert start!81858)

(declare-fun b_free!18353 () Bool)

(declare-fun b_next!18353 () Bool)

(assert (=> start!81858 (= b_free!18353 (not b_next!18353))))

(declare-fun tp!63758 () Bool)

(declare-fun b_and!29839 () Bool)

(assert (=> start!81858 (= tp!63758 b_and!29839)))

(declare-fun b!954643 () Bool)

(declare-fun res!639274 () Bool)

(declare-fun e!537835 () Bool)

(assert (=> b!954643 (=> (not res!639274) (not e!537835))))

(declare-datatypes ((array!57905 0))(
  ( (array!57906 (arr!27832 (Array (_ BitVec 32) (_ BitVec 64))) (size!28311 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57905)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57905 (_ BitVec 32)) Bool)

(assert (=> b!954643 (= res!639274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954644 () Bool)

(declare-fun e!537837 () Bool)

(declare-fun tp_is_empty!20897 () Bool)

(assert (=> b!954644 (= e!537837 tp_is_empty!20897)))

(declare-fun mapIsEmpty!33307 () Bool)

(declare-fun mapRes!33307 () Bool)

(assert (=> mapIsEmpty!33307 mapRes!33307))

(declare-fun b!954645 () Bool)

(declare-fun res!639272 () Bool)

(assert (=> b!954645 (=> (not res!639272) (not e!537835))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954645 (= res!639272 (validKeyInArray!0 (select (arr!27832 _keys!1441) i!735)))))

(declare-fun b!954646 () Bool)

(declare-fun res!639275 () Bool)

(assert (=> b!954646 (=> (not res!639275) (not e!537835))))

(assert (=> b!954646 (= res!639275 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28311 _keys!1441))))))

(declare-fun b!954647 () Bool)

(assert (=> b!954647 (= e!537835 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32845 0))(
  ( (V!32846 (val!10499 Int)) )
))
(declare-fun zeroValue!1139 () V!32845)

(declare-datatypes ((ValueCell!9967 0))(
  ( (ValueCellFull!9967 (v!13054 V!32845)) (EmptyCell!9967) )
))
(declare-datatypes ((array!57907 0))(
  ( (array!57908 (arr!27833 (Array (_ BitVec 32) ValueCell!9967)) (size!28312 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57907)

(declare-fun minValue!1139 () V!32845)

(declare-fun defaultEntry!1205 () Int)

(declare-fun lt!429923 () Bool)

(declare-datatypes ((tuple2!13626 0))(
  ( (tuple2!13627 (_1!6824 (_ BitVec 64)) (_2!6824 V!32845)) )
))
(declare-datatypes ((List!19404 0))(
  ( (Nil!19401) (Cons!19400 (h!20562 tuple2!13626) (t!27765 List!19404)) )
))
(declare-datatypes ((ListLongMap!12323 0))(
  ( (ListLongMap!12324 (toList!6177 List!19404)) )
))
(declare-fun contains!5275 (ListLongMap!12323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3410 (array!57905 array!57907 (_ BitVec 32) (_ BitVec 32) V!32845 V!32845 (_ BitVec 32) Int) ListLongMap!12323)

(assert (=> b!954647 (= lt!429923 (contains!5275 (getCurrentListMap!3410 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27832 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33307 () Bool)

(declare-fun tp!63759 () Bool)

(assert (=> mapNonEmpty!33307 (= mapRes!33307 (and tp!63759 e!537837))))

(declare-fun mapRest!33307 () (Array (_ BitVec 32) ValueCell!9967))

(declare-fun mapKey!33307 () (_ BitVec 32))

(declare-fun mapValue!33307 () ValueCell!9967)

(assert (=> mapNonEmpty!33307 (= (arr!27833 _values!1197) (store mapRest!33307 mapKey!33307 mapValue!33307))))

(declare-fun b!954648 () Bool)

(declare-fun res!639276 () Bool)

(assert (=> b!954648 (=> (not res!639276) (not e!537835))))

(assert (=> b!954648 (= res!639276 (and (= (size!28312 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28311 _keys!1441) (size!28312 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954649 () Bool)

(declare-fun e!537834 () Bool)

(declare-fun e!537836 () Bool)

(assert (=> b!954649 (= e!537834 (and e!537836 mapRes!33307))))

(declare-fun condMapEmpty!33307 () Bool)

(declare-fun mapDefault!33307 () ValueCell!9967)

