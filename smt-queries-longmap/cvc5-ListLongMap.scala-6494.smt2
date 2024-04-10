; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82804 () Bool)

(assert start!82804)

(declare-fun b_free!18931 () Bool)

(declare-fun b_next!18931 () Bool)

(assert (=> start!82804 (= b_free!18931 (not b_next!18931))))

(declare-fun tp!65922 () Bool)

(declare-fun b_and!30419 () Bool)

(assert (=> start!82804 (= tp!65922 b_and!30419)))

(declare-fun b!965885 () Bool)

(declare-fun res!646532 () Bool)

(declare-fun e!544495 () Bool)

(assert (=> b!965885 (=> (not res!646532) (not e!544495))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33969 0))(
  ( (V!33970 (val!10920 Int)) )
))
(declare-datatypes ((ValueCell!10388 0))(
  ( (ValueCellFull!10388 (v!13478 V!33969)) (EmptyCell!10388) )
))
(declare-datatypes ((array!59563 0))(
  ( (array!59564 (arr!28650 (Array (_ BitVec 32) ValueCell!10388)) (size!29129 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59563)

(declare-datatypes ((array!59565 0))(
  ( (array!59566 (arr!28651 (Array (_ BitVec 32) (_ BitVec 64))) (size!29130 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59565)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965885 (= res!646532 (and (= (size!29129 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29130 _keys!1686) (size!29129 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!646534 () Bool)

(assert (=> start!82804 (=> (not res!646534) (not e!544495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82804 (= res!646534 (validMask!0 mask!2110))))

(assert (=> start!82804 e!544495))

(assert (=> start!82804 true))

(declare-fun e!544492 () Bool)

(declare-fun array_inv!22189 (array!59563) Bool)

(assert (=> start!82804 (and (array_inv!22189 _values!1400) e!544492)))

(declare-fun array_inv!22190 (array!59565) Bool)

(assert (=> start!82804 (array_inv!22190 _keys!1686)))

(assert (=> start!82804 tp!65922))

(declare-fun tp_is_empty!21739 () Bool)

(assert (=> start!82804 tp_is_empty!21739))

(declare-fun b!965886 () Bool)

(declare-fun e!544493 () Bool)

(declare-fun mapRes!34603 () Bool)

(assert (=> b!965886 (= e!544492 (and e!544493 mapRes!34603))))

(declare-fun condMapEmpty!34603 () Bool)

(declare-fun mapDefault!34603 () ValueCell!10388)

