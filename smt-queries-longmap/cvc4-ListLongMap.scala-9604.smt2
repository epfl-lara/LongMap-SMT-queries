; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113548 () Bool)

(assert start!113548)

(declare-fun b_free!31541 () Bool)

(declare-fun b_next!31541 () Bool)

(assert (=> start!113548 (= b_free!31541 (not b_next!31541))))

(declare-fun tp!110432 () Bool)

(declare-fun b_and!50871 () Bool)

(assert (=> start!113548 (= tp!110432 b_and!50871)))

(declare-fun b!1347921 () Bool)

(declare-fun e!766858 () Bool)

(declare-fun e!766859 () Bool)

(declare-fun mapRes!58022 () Bool)

(assert (=> b!1347921 (= e!766858 (and e!766859 mapRes!58022))))

(declare-fun condMapEmpty!58022 () Bool)

(declare-datatypes ((V!55157 0))(
  ( (V!55158 (val!18845 Int)) )
))
(declare-datatypes ((ValueCell!17872 0))(
  ( (ValueCellFull!17872 (v!21496 V!55157)) (EmptyCell!17872) )
))
(declare-datatypes ((array!91914 0))(
  ( (array!91915 (arr!44412 (Array (_ BitVec 32) ValueCell!17872)) (size!44962 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91914)

(declare-fun mapDefault!58022 () ValueCell!17872)

