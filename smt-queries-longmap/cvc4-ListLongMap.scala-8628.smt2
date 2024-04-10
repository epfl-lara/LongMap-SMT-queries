; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105060 () Bool)

(assert start!105060)

(declare-fun b_free!26807 () Bool)

(declare-fun b_next!26807 () Bool)

(assert (=> start!105060 (= b_free!26807 (not b_next!26807))))

(declare-fun tp!93919 () Bool)

(declare-fun b_and!44603 () Bool)

(assert (=> start!105060 (= tp!93919 b_and!44603)))

(declare-fun b!1252095 () Bool)

(declare-fun e!711097 () Bool)

(declare-fun e!711100 () Bool)

(declare-fun mapRes!49333 () Bool)

(assert (=> b!1252095 (= e!711097 (and e!711100 mapRes!49333))))

(declare-fun condMapEmpty!49333 () Bool)

(declare-datatypes ((V!47643 0))(
  ( (V!47644 (val!15917 Int)) )
))
(declare-datatypes ((ValueCell!15091 0))(
  ( (ValueCellFull!15091 (v!18615 V!47643)) (EmptyCell!15091) )
))
(declare-datatypes ((array!81082 0))(
  ( (array!81083 (arr!39105 (Array (_ BitVec 32) ValueCell!15091)) (size!39641 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81082)

(declare-fun mapDefault!49333 () ValueCell!15091)

