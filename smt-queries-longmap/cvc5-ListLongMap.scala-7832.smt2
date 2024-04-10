; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97736 () Bool)

(assert start!97736)

(declare-fun b_free!23437 () Bool)

(declare-fun b_next!23437 () Bool)

(assert (=> start!97736 (= b_free!23437 (not b_next!23437))))

(declare-fun tp!83014 () Bool)

(declare-fun b_and!37711 () Bool)

(assert (=> start!97736 (= tp!83014 b_and!37711)))

(declare-fun b!1117592 () Bool)

(declare-fun e!636627 () Bool)

(declare-fun tp_is_empty!27967 () Bool)

(assert (=> b!1117592 (= e!636627 tp_is_empty!27967)))

(declare-fun mapIsEmpty!43768 () Bool)

(declare-fun mapRes!43768 () Bool)

(assert (=> mapIsEmpty!43768 mapRes!43768))

(declare-fun b!1117593 () Bool)

(declare-fun res!746331 () Bool)

(declare-fun e!636629 () Bool)

(assert (=> b!1117593 (=> (not res!746331) (not e!636629))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72825 0))(
  ( (array!72826 (arr!35065 (Array (_ BitVec 32) (_ BitVec 64))) (size!35601 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72825)

(assert (=> b!1117593 (= res!746331 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35601 _keys!1208))))))

(declare-fun b!1117594 () Bool)

(declare-fun e!636625 () Bool)

(declare-fun e!636624 () Bool)

(assert (=> b!1117594 (= e!636625 (and e!636624 mapRes!43768))))

(declare-fun condMapEmpty!43768 () Bool)

(declare-datatypes ((V!42417 0))(
  ( (V!42418 (val!14040 Int)) )
))
(declare-datatypes ((ValueCell!13274 0))(
  ( (ValueCellFull!13274 (v!16673 V!42417)) (EmptyCell!13274) )
))
(declare-datatypes ((array!72827 0))(
  ( (array!72828 (arr!35066 (Array (_ BitVec 32) ValueCell!13274)) (size!35602 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72827)

(declare-fun mapDefault!43768 () ValueCell!13274)

