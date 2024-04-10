; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113536 () Bool)

(assert start!113536)

(declare-fun b_free!31529 () Bool)

(declare-fun b_next!31529 () Bool)

(assert (=> start!113536 (= b_free!31529 (not b_next!31529))))

(declare-fun tp!110396 () Bool)

(declare-fun b_and!50847 () Bool)

(assert (=> start!113536 (= tp!110396 b_and!50847)))

(declare-fun b!1347693 () Bool)

(declare-fun e!766771 () Bool)

(declare-fun e!766768 () Bool)

(declare-fun mapRes!58004 () Bool)

(assert (=> b!1347693 (= e!766771 (and e!766768 mapRes!58004))))

(declare-fun condMapEmpty!58004 () Bool)

(declare-datatypes ((V!55141 0))(
  ( (V!55142 (val!18839 Int)) )
))
(declare-datatypes ((ValueCell!17866 0))(
  ( (ValueCellFull!17866 (v!21490 V!55141)) (EmptyCell!17866) )
))
(declare-datatypes ((array!91892 0))(
  ( (array!91893 (arr!44401 (Array (_ BitVec 32) ValueCell!17866)) (size!44951 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91892)

(declare-fun mapDefault!58004 () ValueCell!17866)

