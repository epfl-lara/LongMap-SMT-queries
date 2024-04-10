; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112102 () Bool)

(assert start!112102)

(declare-fun b!1327775 () Bool)

(declare-fun e!756928 () Bool)

(declare-fun e!756927 () Bool)

(declare-fun mapRes!56284 () Bool)

(assert (=> b!1327775 (= e!756928 (and e!756927 mapRes!56284))))

(declare-fun condMapEmpty!56284 () Bool)

(declare-datatypes ((V!53645 0))(
  ( (V!53646 (val!18278 Int)) )
))
(declare-datatypes ((ValueCell!17305 0))(
  ( (ValueCellFull!17305 (v!20915 V!53645)) (EmptyCell!17305) )
))
(declare-datatypes ((array!89722 0))(
  ( (array!89723 (arr!43327 (Array (_ BitVec 32) ValueCell!17305)) (size!43877 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89722)

(declare-fun mapDefault!56284 () ValueCell!17305)

