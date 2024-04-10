; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84148 () Bool)

(assert start!84148)

(declare-fun b_free!19849 () Bool)

(declare-fun b_next!19849 () Bool)

(assert (=> start!84148 (= b_free!19849 (not b_next!19849))))

(declare-fun tp!69151 () Bool)

(declare-fun b_and!31775 () Bool)

(assert (=> start!84148 (= tp!69151 b_and!31775)))

(declare-fun b!983897 () Bool)

(declare-fun e!554686 () Bool)

(declare-fun e!554688 () Bool)

(declare-fun mapRes!36455 () Bool)

(assert (=> b!983897 (= e!554686 (and e!554688 mapRes!36455))))

(declare-fun condMapEmpty!36455 () Bool)

(declare-datatypes ((V!35585 0))(
  ( (V!35586 (val!11526 Int)) )
))
(declare-datatypes ((ValueCell!10994 0))(
  ( (ValueCellFull!10994 (v!14088 V!35585)) (EmptyCell!10994) )
))
(declare-datatypes ((array!61885 0))(
  ( (array!61886 (arr!29800 (Array (_ BitVec 32) ValueCell!10994)) (size!30279 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61885)

(declare-fun mapDefault!36455 () ValueCell!10994)

