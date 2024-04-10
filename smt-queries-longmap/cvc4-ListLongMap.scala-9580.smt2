; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113346 () Bool)

(assert start!113346)

(declare-fun b_free!31397 () Bool)

(declare-fun b_next!31397 () Bool)

(assert (=> start!113346 (= b_free!31397 (not b_next!31397))))

(declare-fun tp!109996 () Bool)

(declare-fun b_and!50647 () Bool)

(assert (=> start!113346 (= tp!109996 b_and!50647)))

(declare-fun b!1345138 () Bool)

(declare-fun res!892517 () Bool)

(declare-fun e!765482 () Bool)

(assert (=> b!1345138 (=> (not res!892517) (not e!765482))))

(declare-datatypes ((array!91634 0))(
  ( (array!91635 (arr!44273 (Array (_ BitVec 32) (_ BitVec 64))) (size!44823 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91634)

(declare-datatypes ((List!31355 0))(
  ( (Nil!31352) (Cons!31351 (h!32560 (_ BitVec 64)) (t!45909 List!31355)) )
))
(declare-fun arrayNoDuplicates!0 (array!91634 (_ BitVec 32) List!31355) Bool)

(assert (=> b!1345138 (= res!892517 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31352))))

(declare-fun b!1345139 () Bool)

(declare-fun e!765480 () Bool)

(declare-fun e!765481 () Bool)

(declare-fun mapRes!57802 () Bool)

(assert (=> b!1345139 (= e!765480 (and e!765481 mapRes!57802))))

(declare-fun condMapEmpty!57802 () Bool)

(declare-datatypes ((V!54965 0))(
  ( (V!54966 (val!18773 Int)) )
))
(declare-datatypes ((ValueCell!17800 0))(
  ( (ValueCellFull!17800 (v!21421 V!54965)) (EmptyCell!17800) )
))
(declare-datatypes ((array!91636 0))(
  ( (array!91637 (arr!44274 (Array (_ BitVec 32) ValueCell!17800)) (size!44824 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91636)

(declare-fun mapDefault!57802 () ValueCell!17800)

