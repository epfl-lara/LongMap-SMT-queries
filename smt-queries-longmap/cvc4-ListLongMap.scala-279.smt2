; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4524 () Bool)

(assert start!4524)

(declare-fun b_free!1265 () Bool)

(declare-fun b_next!1265 () Bool)

(assert (=> start!4524 (= b_free!1265 (not b_next!1265))))

(declare-fun tp!5236 () Bool)

(declare-fun b_and!2089 () Bool)

(assert (=> start!4524 (= tp!5236 b_and!2089)))

(declare-fun b!35332 () Bool)

(declare-fun e!22321 () Bool)

(declare-fun tp_is_empty!1619 () Bool)

(assert (=> b!35332 (= e!22321 tp_is_empty!1619)))

(declare-fun b!35333 () Bool)

(declare-fun e!22319 () Bool)

(declare-datatypes ((array!2453 0))(
  ( (array!2454 (arr!1173 (Array (_ BitVec 32) (_ BitVec 64))) (size!1274 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2453)

(declare-datatypes ((SeekEntryResult!162 0))(
  ( (MissingZero!162 (index!2770 (_ BitVec 32))) (Found!162 (index!2771 (_ BitVec 32))) (Intermediate!162 (undefined!974 Bool) (index!2772 (_ BitVec 32)) (x!7006 (_ BitVec 32))) (Undefined!162) (MissingVacant!162 (index!2773 (_ BitVec 32))) )
))
(declare-fun lt!12954 () SeekEntryResult!162)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35333 (= e!22319 (not (validKeyInArray!0 (select (arr!1173 _keys!1833) (index!2771 lt!12954)))))))

(declare-fun b!35334 () Bool)

(declare-fun e!22317 () Bool)

(declare-fun mapRes!1978 () Bool)

(assert (=> b!35334 (= e!22317 (and e!22321 mapRes!1978))))

(declare-fun condMapEmpty!1978 () Bool)

(declare-datatypes ((V!1983 0))(
  ( (V!1984 (val!836 Int)) )
))
(declare-datatypes ((ValueCell!610 0))(
  ( (ValueCellFull!610 (v!1932 V!1983)) (EmptyCell!610) )
))
(declare-datatypes ((array!2455 0))(
  ( (array!2456 (arr!1174 (Array (_ BitVec 32) ValueCell!610)) (size!1275 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2455)

(declare-fun mapDefault!1978 () ValueCell!610)

