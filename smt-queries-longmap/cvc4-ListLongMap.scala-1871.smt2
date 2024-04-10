; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33664 () Bool)

(assert start!33664)

(declare-fun b_free!6899 () Bool)

(declare-fun b_next!6899 () Bool)

(assert (=> start!33664 (= b_free!6899 (not b_next!6899))))

(declare-fun tp!24200 () Bool)

(declare-fun b_and!14079 () Bool)

(assert (=> start!33664 (= tp!24200 b_and!14079)))

(declare-fun mapNonEmpty!11673 () Bool)

(declare-fun mapRes!11673 () Bool)

(declare-fun tp!24201 () Bool)

(declare-fun e!205242 () Bool)

(assert (=> mapNonEmpty!11673 (= mapRes!11673 (and tp!24201 e!205242))))

(declare-datatypes ((V!10111 0))(
  ( (V!10112 (val!3470 Int)) )
))
(declare-datatypes ((ValueCell!3082 0))(
  ( (ValueCellFull!3082 (v!5632 V!10111)) (EmptyCell!3082) )
))
(declare-fun mapValue!11673 () ValueCell!3082)

(declare-datatypes ((array!17295 0))(
  ( (array!17296 (arr!8178 (Array (_ BitVec 32) ValueCell!3082)) (size!8530 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17295)

(declare-fun mapKey!11673 () (_ BitVec 32))

(declare-fun mapRest!11673 () (Array (_ BitVec 32) ValueCell!3082))

(assert (=> mapNonEmpty!11673 (= (arr!8178 _values!1525) (store mapRest!11673 mapKey!11673 mapValue!11673))))

(declare-fun b!334338 () Bool)

(declare-fun res!184304 () Bool)

(declare-fun e!205243 () Bool)

(assert (=> b!334338 (=> (not res!184304) (not e!205243))))

(declare-datatypes ((array!17297 0))(
  ( (array!17298 (arr!8179 (Array (_ BitVec 32) (_ BitVec 64))) (size!8531 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17297)

(declare-datatypes ((List!4662 0))(
  ( (Nil!4659) (Cons!4658 (h!5514 (_ BitVec 64)) (t!9750 List!4662)) )
))
(declare-fun arrayNoDuplicates!0 (array!17297 (_ BitVec 32) List!4662) Bool)

(assert (=> b!334338 (= res!184304 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4659))))

(declare-fun b!334339 () Bool)

(declare-fun e!205244 () Bool)

(declare-fun e!205240 () Bool)

(assert (=> b!334339 (= e!205244 (and e!205240 mapRes!11673))))

(declare-fun condMapEmpty!11673 () Bool)

(declare-fun mapDefault!11673 () ValueCell!3082)

