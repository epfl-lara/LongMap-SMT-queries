; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3972 () Bool)

(assert start!3972)

(declare-fun b_free!877 () Bool)

(declare-fun b_next!877 () Bool)

(assert (=> start!3972 (= b_free!877 (not b_next!877))))

(declare-fun tp!4050 () Bool)

(declare-fun b_and!1687 () Bool)

(assert (=> start!3972 (= tp!4050 b_and!1687)))

(declare-fun b!28556 () Bool)

(declare-fun e!18470 () Bool)

(declare-fun tp_is_empty!1231 () Bool)

(assert (=> b!28556 (= e!18470 tp_is_empty!1231)))

(declare-fun b!28557 () Bool)

(declare-fun res!17028 () Bool)

(declare-fun e!18466 () Bool)

(assert (=> b!28557 (=> (not res!17028) (not e!18466))))

(declare-datatypes ((array!1697 0))(
  ( (array!1698 (arr!802 (Array (_ BitVec 32) (_ BitVec 64))) (size!903 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1697)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28557 (= res!17028 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28558 () Bool)

(declare-fun res!17029 () Bool)

(declare-fun e!18469 () Bool)

(assert (=> b!28558 (=> (not res!17029) (not e!18469))))

(declare-datatypes ((List!667 0))(
  ( (Nil!664) (Cons!663 (h!1230 (_ BitVec 64)) (t!3360 List!667)) )
))
(declare-fun arrayNoDuplicates!0 (array!1697 (_ BitVec 32) List!667) Bool)

(assert (=> b!28558 (= res!17029 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!664))))

(declare-fun b!28559 () Bool)

(declare-fun e!18465 () Bool)

(declare-fun mapRes!1375 () Bool)

(assert (=> b!28559 (= e!18465 (and e!18470 mapRes!1375))))

(declare-fun condMapEmpty!1375 () Bool)

(declare-datatypes ((V!1467 0))(
  ( (V!1468 (val!642 Int)) )
))
(declare-datatypes ((ValueCell!416 0))(
  ( (ValueCellFull!416 (v!1731 V!1467)) (EmptyCell!416) )
))
(declare-datatypes ((array!1699 0))(
  ( (array!1700 (arr!803 (Array (_ BitVec 32) ValueCell!416)) (size!904 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1699)

(declare-fun mapDefault!1375 () ValueCell!416)

