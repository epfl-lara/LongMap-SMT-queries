; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112138 () Bool)

(assert start!112138)

(declare-fun mapIsEmpty!56338 () Bool)

(declare-fun mapRes!56338 () Bool)

(assert (=> mapIsEmpty!56338 mapRes!56338))

(declare-fun b!1328099 () Bool)

(declare-fun e!757200 () Bool)

(declare-fun e!757197 () Bool)

(assert (=> b!1328099 (= e!757200 (and e!757197 mapRes!56338))))

(declare-fun condMapEmpty!56338 () Bool)

(declare-datatypes ((V!53693 0))(
  ( (V!53694 (val!18296 Int)) )
))
(declare-datatypes ((ValueCell!17323 0))(
  ( (ValueCellFull!17323 (v!20933 V!53693)) (EmptyCell!17323) )
))
(declare-datatypes ((array!89786 0))(
  ( (array!89787 (arr!43359 (Array (_ BitVec 32) ValueCell!17323)) (size!43909 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89786)

(declare-fun mapDefault!56338 () ValueCell!17323)

