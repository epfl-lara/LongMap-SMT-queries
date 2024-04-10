; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82658 () Bool)

(assert start!82658)

(declare-fun b_free!18791 () Bool)

(declare-fun b_next!18791 () Bool)

(assert (=> start!82658 (= b_free!18791 (not b_next!18791))))

(declare-fun tp!65492 () Bool)

(declare-fun b_and!30279 () Bool)

(assert (=> start!82658 (= tp!65492 b_and!30279)))

(declare-fun b!963624 () Bool)

(declare-fun res!644928 () Bool)

(declare-fun e!543320 () Bool)

(assert (=> b!963624 (=> (not res!644928) (not e!543320))))

(declare-datatypes ((array!59277 0))(
  ( (array!59278 (arr!28507 (Array (_ BitVec 32) (_ BitVec 64))) (size!28986 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59277)

(declare-datatypes ((List!19784 0))(
  ( (Nil!19781) (Cons!19780 (h!20942 (_ BitVec 64)) (t!28147 List!19784)) )
))
(declare-fun arrayNoDuplicates!0 (array!59277 (_ BitVec 32) List!19784) Bool)

(assert (=> b!963624 (= res!644928 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19781))))

(declare-fun b!963625 () Bool)

(declare-fun e!543316 () Bool)

(declare-fun e!543319 () Bool)

(declare-fun mapRes!34384 () Bool)

(assert (=> b!963625 (= e!543316 (and e!543319 mapRes!34384))))

(declare-fun condMapEmpty!34384 () Bool)

(declare-datatypes ((V!33773 0))(
  ( (V!33774 (val!10847 Int)) )
))
(declare-datatypes ((ValueCell!10315 0))(
  ( (ValueCellFull!10315 (v!13405 V!33773)) (EmptyCell!10315) )
))
(declare-datatypes ((array!59279 0))(
  ( (array!59280 (arr!28508 (Array (_ BitVec 32) ValueCell!10315)) (size!28987 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59279)

(declare-fun mapDefault!34384 () ValueCell!10315)

