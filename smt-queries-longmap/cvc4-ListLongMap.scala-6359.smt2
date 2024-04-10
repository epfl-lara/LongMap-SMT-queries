; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81894 () Bool)

(assert start!81894)

(declare-fun b_free!18389 () Bool)

(declare-fun b_next!18389 () Bool)

(assert (=> start!81894 (= b_free!18389 (not b_next!18389))))

(declare-fun tp!63866 () Bool)

(declare-fun b_and!29875 () Bool)

(assert (=> start!81894 (= tp!63866 b_and!29875)))

(declare-fun b!955138 () Bool)

(declare-fun res!639606 () Bool)

(declare-fun e!538106 () Bool)

(assert (=> b!955138 (=> (not res!639606) (not e!538106))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57971 0))(
  ( (array!57972 (arr!27865 (Array (_ BitVec 32) (_ BitVec 64))) (size!28344 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57971)

(assert (=> b!955138 (= res!639606 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28344 _keys!1441))))))

(declare-fun b!955139 () Bool)

(declare-fun e!538105 () Bool)

(declare-fun tp_is_empty!20933 () Bool)

(assert (=> b!955139 (= e!538105 tp_is_empty!20933)))

(declare-fun b!955140 () Bool)

(declare-fun e!538108 () Bool)

(declare-fun e!538107 () Bool)

(declare-fun mapRes!33361 () Bool)

(assert (=> b!955140 (= e!538108 (and e!538107 mapRes!33361))))

(declare-fun condMapEmpty!33361 () Bool)

(declare-datatypes ((V!32893 0))(
  ( (V!32894 (val!10517 Int)) )
))
(declare-datatypes ((ValueCell!9985 0))(
  ( (ValueCellFull!9985 (v!13072 V!32893)) (EmptyCell!9985) )
))
(declare-datatypes ((array!57973 0))(
  ( (array!57974 (arr!27866 (Array (_ BitVec 32) ValueCell!9985)) (size!28345 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57973)

(declare-fun mapDefault!33361 () ValueCell!9985)

