; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33582 () Bool)

(assert start!33582)

(declare-fun b_free!6835 () Bool)

(declare-fun b_next!6835 () Bool)

(assert (=> start!33582 (= b_free!6835 (not b_next!6835))))

(declare-fun tp!24005 () Bool)

(declare-fun b_and!14013 () Bool)

(assert (=> start!33582 (= tp!24005 b_and!14013)))

(declare-fun b!333241 () Bool)

(declare-fun res!183578 () Bool)

(declare-fun e!204626 () Bool)

(assert (=> b!333241 (=> (not res!183578) (not e!204626))))

(declare-datatypes ((array!17171 0))(
  ( (array!17172 (arr!8117 (Array (_ BitVec 32) (_ BitVec 64))) (size!8469 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17171)

(declare-datatypes ((List!4620 0))(
  ( (Nil!4617) (Cons!4616 (h!5472 (_ BitVec 64)) (t!9706 List!4620)) )
))
(declare-fun arrayNoDuplicates!0 (array!17171 (_ BitVec 32) List!4620) Bool)

(assert (=> b!333241 (= res!183578 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4617))))

(declare-fun b!333242 () Bool)

(declare-fun res!183573 () Bool)

(assert (=> b!333242 (=> (not res!183573) (not e!204626))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17171 (_ BitVec 32)) Bool)

(assert (=> b!333242 (= res!183573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333243 () Bool)

(declare-fun res!183576 () Bool)

(assert (=> b!333243 (=> (not res!183576) (not e!204626))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333243 (= res!183576 (validKeyInArray!0 k!1348))))

(declare-fun mapNonEmpty!11574 () Bool)

(declare-fun mapRes!11574 () Bool)

(declare-fun tp!24006 () Bool)

(declare-fun e!204628 () Bool)

(assert (=> mapNonEmpty!11574 (= mapRes!11574 (and tp!24006 e!204628))))

(declare-datatypes ((V!10027 0))(
  ( (V!10028 (val!3438 Int)) )
))
(declare-datatypes ((ValueCell!3050 0))(
  ( (ValueCellFull!3050 (v!5599 V!10027)) (EmptyCell!3050) )
))
(declare-fun mapValue!11574 () ValueCell!3050)

(declare-datatypes ((array!17173 0))(
  ( (array!17174 (arr!8118 (Array (_ BitVec 32) ValueCell!3050)) (size!8470 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17173)

(declare-fun mapKey!11574 () (_ BitVec 32))

(declare-fun mapRest!11574 () (Array (_ BitVec 32) ValueCell!3050))

(assert (=> mapNonEmpty!11574 (= (arr!8118 _values!1525) (store mapRest!11574 mapKey!11574 mapValue!11574))))

(declare-fun b!333244 () Bool)

(declare-fun e!204630 () Bool)

(declare-fun e!204629 () Bool)

(assert (=> b!333244 (= e!204630 (and e!204629 mapRes!11574))))

(declare-fun condMapEmpty!11574 () Bool)

(declare-fun mapDefault!11574 () ValueCell!3050)

