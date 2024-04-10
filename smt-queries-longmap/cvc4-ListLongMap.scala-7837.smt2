; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97770 () Bool)

(assert start!97770)

(declare-fun b_free!23471 () Bool)

(declare-fun b_next!23471 () Bool)

(assert (=> start!97770 (= b_free!23471 (not b_next!23471))))

(declare-fun tp!83116 () Bool)

(declare-fun b_and!37745 () Bool)

(assert (=> start!97770 (= tp!83116 b_and!37745)))

(declare-fun mapNonEmpty!43819 () Bool)

(declare-fun mapRes!43819 () Bool)

(declare-fun tp!83117 () Bool)

(declare-fun e!636982 () Bool)

(assert (=> mapNonEmpty!43819 (= mapRes!43819 (and tp!83117 e!636982))))

(declare-fun mapKey!43819 () (_ BitVec 32))

(declare-datatypes ((V!42461 0))(
  ( (V!42462 (val!14057 Int)) )
))
(declare-datatypes ((ValueCell!13291 0))(
  ( (ValueCellFull!13291 (v!16690 V!42461)) (EmptyCell!13291) )
))
(declare-datatypes ((array!72893 0))(
  ( (array!72894 (arr!35099 (Array (_ BitVec 32) ValueCell!13291)) (size!35635 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72893)

(declare-fun mapValue!43819 () ValueCell!13291)

(declare-fun mapRest!43819 () (Array (_ BitVec 32) ValueCell!13291))

(assert (=> mapNonEmpty!43819 (= (arr!35099 _values!996) (store mapRest!43819 mapKey!43819 mapValue!43819))))

(declare-fun b!1118307 () Bool)

(declare-fun res!746892 () Bool)

(declare-fun e!636984 () Bool)

(assert (=> b!1118307 (=> (not res!746892) (not e!636984))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72895 0))(
  ( (array!72896 (arr!35100 (Array (_ BitVec 32) (_ BitVec 64))) (size!35636 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72895)

(assert (=> b!1118307 (= res!746892 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35636 _keys!1208))))))

(declare-fun b!1118308 () Bool)

(declare-fun e!636986 () Bool)

(declare-fun e!636987 () Bool)

(assert (=> b!1118308 (= e!636986 (and e!636987 mapRes!43819))))

(declare-fun condMapEmpty!43819 () Bool)

(declare-fun mapDefault!43819 () ValueCell!13291)

