; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82580 () Bool)

(assert start!82580)

(declare-fun b_free!18713 () Bool)

(declare-fun b_next!18713 () Bool)

(assert (=> start!82580 (= b_free!18713 (not b_next!18713))))

(declare-fun tp!65259 () Bool)

(declare-fun b_and!30201 () Bool)

(assert (=> start!82580 (= tp!65259 b_and!30201)))

(declare-fun b!962411 () Bool)

(declare-fun res!644067 () Bool)

(declare-fun e!542733 () Bool)

(assert (=> b!962411 (=> (not res!644067) (not e!542733))))

(declare-datatypes ((array!59127 0))(
  ( (array!59128 (arr!28432 (Array (_ BitVec 32) (_ BitVec 64))) (size!28911 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59127)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962411 (= res!644067 (validKeyInArray!0 (select (arr!28432 _keys!1686) i!803)))))

(declare-fun res!644068 () Bool)

(assert (=> start!82580 (=> (not res!644068) (not e!542733))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82580 (= res!644068 (validMask!0 mask!2110))))

(assert (=> start!82580 e!542733))

(assert (=> start!82580 true))

(declare-datatypes ((V!33669 0))(
  ( (V!33670 (val!10808 Int)) )
))
(declare-datatypes ((ValueCell!10276 0))(
  ( (ValueCellFull!10276 (v!13366 V!33669)) (EmptyCell!10276) )
))
(declare-datatypes ((array!59129 0))(
  ( (array!59130 (arr!28433 (Array (_ BitVec 32) ValueCell!10276)) (size!28912 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59129)

(declare-fun e!542734 () Bool)

(declare-fun array_inv!22031 (array!59129) Bool)

(assert (=> start!82580 (and (array_inv!22031 _values!1400) e!542734)))

(declare-fun array_inv!22032 (array!59127) Bool)

(assert (=> start!82580 (array_inv!22032 _keys!1686)))

(assert (=> start!82580 tp!65259))

(declare-fun tp_is_empty!21515 () Bool)

(assert (=> start!82580 tp_is_empty!21515))

(declare-fun b!962412 () Bool)

(declare-fun e!542735 () Bool)

(declare-fun mapRes!34267 () Bool)

(assert (=> b!962412 (= e!542734 (and e!542735 mapRes!34267))))

(declare-fun condMapEmpty!34267 () Bool)

(declare-fun mapDefault!34267 () ValueCell!10276)

