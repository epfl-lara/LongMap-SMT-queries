; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38876 () Bool)

(assert start!38876)

(declare-fun b!406274 () Bool)

(declare-fun res!234657 () Bool)

(declare-fun e!244164 () Bool)

(assert (=> b!406274 (=> (not res!234657) (not e!244164))))

(declare-datatypes ((array!24481 0))(
  ( (array!24482 (arr!11690 (Array (_ BitVec 32) (_ BitVec 64))) (size!12042 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24481)

(declare-datatypes ((List!6790 0))(
  ( (Nil!6787) (Cons!6786 (h!7642 (_ BitVec 64)) (t!11964 List!6790)) )
))
(declare-fun arrayNoDuplicates!0 (array!24481 (_ BitVec 32) List!6790) Bool)

(assert (=> b!406274 (= res!234657 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6787))))

(declare-fun b!406275 () Bool)

(declare-fun e!244162 () Bool)

(assert (=> b!406275 (= e!244164 e!244162)))

(declare-fun res!234651 () Bool)

(assert (=> b!406275 (=> (not res!234651) (not e!244162))))

(declare-fun lt!188464 () array!24481)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24481 (_ BitVec 32)) Bool)

(assert (=> b!406275 (= res!234651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188464 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406275 (= lt!188464 (array!24482 (store (arr!11690 _keys!709) i!563 k!794) (size!12042 _keys!709)))))

(declare-fun b!406276 () Bool)

(declare-fun res!234653 () Bool)

(assert (=> b!406276 (=> (not res!234653) (not e!244164))))

(assert (=> b!406276 (= res!234653 (or (= (select (arr!11690 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11690 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406278 () Bool)

(declare-fun e!244163 () Bool)

(declare-fun e!244159 () Bool)

(declare-fun mapRes!17064 () Bool)

(assert (=> b!406278 (= e!244163 (and e!244159 mapRes!17064))))

(declare-fun condMapEmpty!17064 () Bool)

(declare-datatypes ((V!14831 0))(
  ( (V!14832 (val!5192 Int)) )
))
(declare-datatypes ((ValueCell!4804 0))(
  ( (ValueCellFull!4804 (v!7439 V!14831)) (EmptyCell!4804) )
))
(declare-datatypes ((array!24483 0))(
  ( (array!24484 (arr!11691 (Array (_ BitVec 32) ValueCell!4804)) (size!12043 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24483)

(declare-fun mapDefault!17064 () ValueCell!4804)

