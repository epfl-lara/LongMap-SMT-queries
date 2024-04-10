; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82688 () Bool)

(assert start!82688)

(declare-fun b_free!18821 () Bool)

(declare-fun b_next!18821 () Bool)

(assert (=> start!82688 (= b_free!18821 (not b_next!18821))))

(declare-fun tp!65582 () Bool)

(declare-fun b_and!30309 () Bool)

(assert (=> start!82688 (= tp!65582 b_and!30309)))

(declare-fun b!964136 () Bool)

(declare-fun res!645308 () Bool)

(declare-fun e!543558 () Bool)

(assert (=> b!964136 (=> (not res!645308) (not e!543558))))

(declare-datatypes ((array!59335 0))(
  ( (array!59336 (arr!28536 (Array (_ BitVec 32) (_ BitVec 64))) (size!29015 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59335)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964136 (= res!645308 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29015 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29015 _keys!1686))))))

(declare-fun b!964137 () Bool)

(declare-fun res!645306 () Bool)

(assert (=> b!964137 (=> (not res!645306) (not e!543558))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33813 0))(
  ( (V!33814 (val!10862 Int)) )
))
(declare-datatypes ((ValueCell!10330 0))(
  ( (ValueCellFull!10330 (v!13420 V!33813)) (EmptyCell!10330) )
))
(declare-datatypes ((array!59337 0))(
  ( (array!59338 (arr!28537 (Array (_ BitVec 32) ValueCell!10330)) (size!29016 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59337)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!964137 (= res!645306 (and (= (size!29016 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29015 _keys!1686) (size!29016 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964138 () Bool)

(declare-fun e!543562 () Bool)

(declare-fun e!543559 () Bool)

(declare-fun mapRes!34429 () Bool)

(assert (=> b!964138 (= e!543562 (and e!543559 mapRes!34429))))

(declare-fun condMapEmpty!34429 () Bool)

(declare-fun mapDefault!34429 () ValueCell!10330)

