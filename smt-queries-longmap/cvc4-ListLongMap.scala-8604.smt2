; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104872 () Bool)

(assert start!104872)

(declare-fun b_free!26663 () Bool)

(declare-fun b_next!26663 () Bool)

(assert (=> start!104872 (= b_free!26663 (not b_next!26663))))

(declare-fun tp!93482 () Bool)

(declare-fun b_and!44439 () Bool)

(assert (=> start!104872 (= tp!93482 b_and!44439)))

(declare-fun b!1249944 () Bool)

(declare-fun e!709492 () Bool)

(declare-fun e!709496 () Bool)

(declare-fun mapRes!49111 () Bool)

(assert (=> b!1249944 (= e!709492 (and e!709496 mapRes!49111))))

(declare-fun condMapEmpty!49111 () Bool)

(declare-datatypes ((V!47451 0))(
  ( (V!47452 (val!15845 Int)) )
))
(declare-datatypes ((ValueCell!15019 0))(
  ( (ValueCellFull!15019 (v!18541 V!47451)) (EmptyCell!15019) )
))
(declare-datatypes ((array!80802 0))(
  ( (array!80803 (arr!38967 (Array (_ BitVec 32) ValueCell!15019)) (size!39503 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80802)

(declare-fun mapDefault!49111 () ValueCell!15019)

