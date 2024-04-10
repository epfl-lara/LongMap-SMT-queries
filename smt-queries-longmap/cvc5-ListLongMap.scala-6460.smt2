; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82600 () Bool)

(assert start!82600)

(declare-fun b_free!18733 () Bool)

(declare-fun b_next!18733 () Bool)

(assert (=> start!82600 (= b_free!18733 (not b_next!18733))))

(declare-fun tp!65318 () Bool)

(declare-fun b_and!30221 () Bool)

(assert (=> start!82600 (= tp!65318 b_and!30221)))

(declare-fun b!962681 () Bool)

(declare-fun e!542882 () Bool)

(declare-fun e!542884 () Bool)

(declare-fun mapRes!34297 () Bool)

(assert (=> b!962681 (= e!542882 (and e!542884 mapRes!34297))))

(declare-fun condMapEmpty!34297 () Bool)

(declare-datatypes ((V!33697 0))(
  ( (V!33698 (val!10818 Int)) )
))
(declare-datatypes ((ValueCell!10286 0))(
  ( (ValueCellFull!10286 (v!13376 V!33697)) (EmptyCell!10286) )
))
(declare-datatypes ((array!59167 0))(
  ( (array!59168 (arr!28452 (Array (_ BitVec 32) ValueCell!10286)) (size!28931 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59167)

(declare-fun mapDefault!34297 () ValueCell!10286)

