; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112034 () Bool)

(assert start!112034)

(declare-fun b!1327369 () Bool)

(declare-fun e!756615 () Bool)

(declare-fun tp_is_empty!36377 () Bool)

(assert (=> b!1327369 (= e!756615 tp_is_empty!36377)))

(declare-fun b!1327370 () Bool)

(declare-fun e!756617 () Bool)

(declare-fun mapRes!56227 () Bool)

(assert (=> b!1327370 (= e!756617 (and e!756615 mapRes!56227))))

(declare-fun condMapEmpty!56227 () Bool)

(declare-datatypes ((V!53605 0))(
  ( (V!53606 (val!18263 Int)) )
))
(declare-datatypes ((ValueCell!17290 0))(
  ( (ValueCellFull!17290 (v!20899 V!53605)) (EmptyCell!17290) )
))
(declare-datatypes ((array!89662 0))(
  ( (array!89663 (arr!43301 (Array (_ BitVec 32) ValueCell!17290)) (size!43851 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89662)

(declare-fun mapDefault!56227 () ValueCell!17290)

