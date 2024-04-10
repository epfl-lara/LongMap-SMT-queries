; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82636 () Bool)

(assert start!82636)

(declare-fun b_free!18769 () Bool)

(declare-fun b_next!18769 () Bool)

(assert (=> start!82636 (= b_free!18769 (not b_next!18769))))

(declare-fun tp!65426 () Bool)

(declare-fun b_and!30257 () Bool)

(assert (=> start!82636 (= tp!65426 b_and!30257)))

(declare-fun b!963262 () Bool)

(declare-fun e!543152 () Bool)

(declare-fun tp_is_empty!21571 () Bool)

(assert (=> b!963262 (= e!543152 tp_is_empty!21571)))

(declare-fun b!963263 () Bool)

(declare-fun res!644664 () Bool)

(declare-fun e!543155 () Bool)

(assert (=> b!963263 (=> (not res!644664) (not e!543155))))

(declare-datatypes ((array!59237 0))(
  ( (array!59238 (arr!28487 (Array (_ BitVec 32) (_ BitVec 64))) (size!28966 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59237)

(declare-datatypes ((List!19772 0))(
  ( (Nil!19769) (Cons!19768 (h!20930 (_ BitVec 64)) (t!28135 List!19772)) )
))
(declare-fun arrayNoDuplicates!0 (array!59237 (_ BitVec 32) List!19772) Bool)

(assert (=> b!963263 (= res!644664 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19769))))

(declare-fun b!963264 () Bool)

(declare-fun e!543153 () Bool)

(declare-fun e!543151 () Bool)

(declare-fun mapRes!34351 () Bool)

(assert (=> b!963264 (= e!543153 (and e!543151 mapRes!34351))))

(declare-fun condMapEmpty!34351 () Bool)

(declare-datatypes ((V!33745 0))(
  ( (V!33746 (val!10836 Int)) )
))
(declare-datatypes ((ValueCell!10304 0))(
  ( (ValueCellFull!10304 (v!13394 V!33745)) (EmptyCell!10304) )
))
(declare-datatypes ((array!59239 0))(
  ( (array!59240 (arr!28488 (Array (_ BitVec 32) ValueCell!10304)) (size!28967 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59239)

(declare-fun mapDefault!34351 () ValueCell!10304)

