; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38866 () Bool)

(assert start!38866)

(declare-fun mapIsEmpty!17049 () Bool)

(declare-fun mapRes!17049 () Bool)

(assert (=> mapIsEmpty!17049 mapRes!17049))

(declare-fun b!406080 () Bool)

(declare-fun res!234502 () Bool)

(declare-fun e!244072 () Bool)

(assert (=> b!406080 (=> (not res!234502) (not e!244072))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406080 (= res!234502 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17049 () Bool)

(declare-fun tp!33168 () Bool)

(declare-fun e!244070 () Bool)

(assert (=> mapNonEmpty!17049 (= mapRes!17049 (and tp!33168 e!244070))))

(declare-datatypes ((V!14819 0))(
  ( (V!14820 (val!5187 Int)) )
))
(declare-datatypes ((ValueCell!4799 0))(
  ( (ValueCellFull!4799 (v!7434 V!14819)) (EmptyCell!4799) )
))
(declare-datatypes ((array!24461 0))(
  ( (array!24462 (arr!11680 (Array (_ BitVec 32) ValueCell!4799)) (size!12032 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24461)

(declare-fun mapValue!17049 () ValueCell!4799)

(declare-fun mapKey!17049 () (_ BitVec 32))

(declare-fun mapRest!17049 () (Array (_ BitVec 32) ValueCell!4799))

(assert (=> mapNonEmpty!17049 (= (arr!11680 _values!549) (store mapRest!17049 mapKey!17049 mapValue!17049))))

(declare-fun b!406081 () Bool)

(declare-fun res!234505 () Bool)

(assert (=> b!406081 (=> (not res!234505) (not e!244072))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24463 0))(
  ( (array!24464 (arr!11681 (Array (_ BitVec 32) (_ BitVec 64))) (size!12033 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24463)

(assert (=> b!406081 (= res!234505 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12033 _keys!709))))))

(declare-fun b!406082 () Bool)

(declare-fun res!234501 () Bool)

(assert (=> b!406082 (=> (not res!234501) (not e!244072))))

(assert (=> b!406082 (= res!234501 (or (= (select (arr!11681 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11681 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406083 () Bool)

(declare-fun res!234504 () Bool)

(assert (=> b!406083 (=> (not res!234504) (not e!244072))))

(declare-datatypes ((List!6785 0))(
  ( (Nil!6782) (Cons!6781 (h!7637 (_ BitVec 64)) (t!11959 List!6785)) )
))
(declare-fun arrayNoDuplicates!0 (array!24463 (_ BitVec 32) List!6785) Bool)

(assert (=> b!406083 (= res!234504 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6782))))

(declare-fun res!234498 () Bool)

(assert (=> start!38866 (=> (not res!234498) (not e!244072))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38866 (= res!234498 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12033 _keys!709))))))

(assert (=> start!38866 e!244072))

(assert (=> start!38866 true))

(declare-fun e!244073 () Bool)

(declare-fun array_inv!8530 (array!24461) Bool)

(assert (=> start!38866 (and (array_inv!8530 _values!549) e!244073)))

(declare-fun array_inv!8531 (array!24463) Bool)

(assert (=> start!38866 (array_inv!8531 _keys!709)))

(declare-fun b!406079 () Bool)

(declare-fun e!244074 () Bool)

(declare-fun tp_is_empty!10285 () Bool)

(assert (=> b!406079 (= e!244074 tp_is_empty!10285)))

(declare-fun b!406084 () Bool)

(declare-fun res!234503 () Bool)

(assert (=> b!406084 (=> (not res!234503) (not e!244072))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406084 (= res!234503 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!406085 () Bool)

(declare-fun res!234507 () Bool)

(assert (=> b!406085 (=> (not res!234507) (not e!244072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24463 (_ BitVec 32)) Bool)

(assert (=> b!406085 (= res!234507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406086 () Bool)

(assert (=> b!406086 (= e!244070 tp_is_empty!10285)))

(declare-fun b!406087 () Bool)

(declare-fun e!244071 () Bool)

(assert (=> b!406087 (= e!244072 e!244071)))

(declare-fun res!234499 () Bool)

(assert (=> b!406087 (=> (not res!234499) (not e!244071))))

(declare-fun lt!188435 () array!24463)

(assert (=> b!406087 (= res!234499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188435 mask!1025))))

(assert (=> b!406087 (= lt!188435 (array!24464 (store (arr!11681 _keys!709) i!563 k!794) (size!12033 _keys!709)))))

(declare-fun b!406088 () Bool)

(declare-fun res!234500 () Bool)

(assert (=> b!406088 (=> (not res!234500) (not e!244072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406088 (= res!234500 (validKeyInArray!0 k!794))))

(declare-fun b!406089 () Bool)

(declare-fun res!234506 () Bool)

(assert (=> b!406089 (=> (not res!234506) (not e!244072))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406089 (= res!234506 (and (= (size!12032 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12033 _keys!709) (size!12032 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406090 () Bool)

(assert (=> b!406090 (= e!244073 (and e!244074 mapRes!17049))))

(declare-fun condMapEmpty!17049 () Bool)

(declare-fun mapDefault!17049 () ValueCell!4799)

