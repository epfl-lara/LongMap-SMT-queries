; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97716 () Bool)

(assert start!97716)

(declare-fun b!1117200 () Bool)

(declare-fun e!636443 () Bool)

(declare-fun e!636444 () Bool)

(declare-fun mapRes!43738 () Bool)

(assert (=> b!1117200 (= e!636443 (and e!636444 mapRes!43738))))

(declare-fun condMapEmpty!43738 () Bool)

(declare-datatypes ((V!42389 0))(
  ( (V!42390 (val!14030 Int)) )
))
(declare-datatypes ((ValueCell!13264 0))(
  ( (ValueCellFull!13264 (v!16663 V!42389)) (EmptyCell!13264) )
))
(declare-datatypes ((array!72791 0))(
  ( (array!72792 (arr!35048 (Array (_ BitVec 32) ValueCell!13264)) (size!35584 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72791)

(declare-fun mapDefault!43738 () ValueCell!13264)

