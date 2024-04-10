; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38968 () Bool)

(assert start!38968)

(declare-fun mapIsEmpty!17202 () Bool)

(declare-fun mapRes!17202 () Bool)

(assert (=> mapIsEmpty!17202 mapRes!17202))

(declare-fun b!408068 () Bool)

(declare-fun res!236028 () Bool)

(declare-fun e!244987 () Bool)

(assert (=> b!408068 (=> (not res!236028) (not e!244987))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408068 (= res!236028 (validKeyInArray!0 k!794))))

(declare-fun b!408069 () Bool)

(declare-fun res!236033 () Bool)

(assert (=> b!408069 (=> (not res!236033) (not e!244987))))

(declare-datatypes ((array!24653 0))(
  ( (array!24654 (arr!11776 (Array (_ BitVec 32) (_ BitVec 64))) (size!12128 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24653)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24653 (_ BitVec 32)) Bool)

(assert (=> b!408069 (= res!236033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408071 () Bool)

(declare-fun res!236030 () Bool)

(assert (=> b!408071 (=> (not res!236030) (not e!244987))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408071 (= res!236030 (or (= (select (arr!11776 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11776 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17202 () Bool)

(declare-fun tp!33321 () Bool)

(declare-fun e!244989 () Bool)

(assert (=> mapNonEmpty!17202 (= mapRes!17202 (and tp!33321 e!244989))))

(declare-datatypes ((V!14955 0))(
  ( (V!14956 (val!5238 Int)) )
))
(declare-datatypes ((ValueCell!4850 0))(
  ( (ValueCellFull!4850 (v!7485 V!14955)) (EmptyCell!4850) )
))
(declare-fun mapRest!17202 () (Array (_ BitVec 32) ValueCell!4850))

(declare-fun mapValue!17202 () ValueCell!4850)

(declare-datatypes ((array!24655 0))(
  ( (array!24656 (arr!11777 (Array (_ BitVec 32) ValueCell!4850)) (size!12129 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24655)

(declare-fun mapKey!17202 () (_ BitVec 32))

(assert (=> mapNonEmpty!17202 (= (arr!11777 _values!549) (store mapRest!17202 mapKey!17202 mapValue!17202))))

(declare-fun b!408072 () Bool)

(declare-fun e!244988 () Bool)

(declare-fun e!244991 () Bool)

(assert (=> b!408072 (= e!244988 (and e!244991 mapRes!17202))))

(declare-fun condMapEmpty!17202 () Bool)

(declare-fun mapDefault!17202 () ValueCell!4850)

