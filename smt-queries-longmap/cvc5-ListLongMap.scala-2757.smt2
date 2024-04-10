; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40394 () Bool)

(assert start!40394)

(declare-fun b!444029 () Bool)

(declare-fun e!261186 () Bool)

(declare-fun e!261183 () Bool)

(assert (=> b!444029 (= e!261186 e!261183)))

(declare-fun res!263229 () Bool)

(assert (=> b!444029 (=> (not res!263229) (not e!261183))))

(declare-datatypes ((array!27367 0))(
  ( (array!27368 (arr!13131 (Array (_ BitVec 32) (_ BitVec 64))) (size!13483 (_ BitVec 32))) )
))
(declare-fun lt!203429 () array!27367)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27367 (_ BitVec 32)) Bool)

(assert (=> b!444029 (= res!263229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203429 mask!1025))))

(declare-fun _keys!709 () array!27367)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444029 (= lt!203429 (array!27368 (store (arr!13131 _keys!709) i!563 k!794) (size!13483 _keys!709)))))

(declare-fun b!444030 () Bool)

(declare-fun res!263226 () Bool)

(assert (=> b!444030 (=> (not res!263226) (not e!261186))))

(assert (=> b!444030 (= res!263226 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13483 _keys!709))))))

(declare-fun b!444031 () Bool)

(declare-fun res!263228 () Bool)

(assert (=> b!444031 (=> (not res!263228) (not e!261186))))

(assert (=> b!444031 (= res!263228 (or (= (select (arr!13131 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13131 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444032 () Bool)

(declare-fun e!261185 () Bool)

(declare-fun tp_is_empty!11779 () Bool)

(assert (=> b!444032 (= e!261185 tp_is_empty!11779)))

(declare-fun b!444033 () Bool)

(declare-fun res!263230 () Bool)

(assert (=> b!444033 (=> (not res!263230) (not e!261186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444033 (= res!263230 (validKeyInArray!0 k!794))))

(declare-fun b!444034 () Bool)

(assert (=> b!444034 (= e!261183 false)))

(declare-fun lt!203428 () Bool)

(declare-datatypes ((List!7866 0))(
  ( (Nil!7863) (Cons!7862 (h!8718 (_ BitVec 64)) (t!13624 List!7866)) )
))
(declare-fun arrayNoDuplicates!0 (array!27367 (_ BitVec 32) List!7866) Bool)

(assert (=> b!444034 (= lt!203428 (arrayNoDuplicates!0 lt!203429 #b00000000000000000000000000000000 Nil!7863))))

(declare-fun b!444035 () Bool)

(declare-fun res!263223 () Bool)

(assert (=> b!444035 (=> (not res!263223) (not e!261186))))

(assert (=> b!444035 (= res!263223 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7863))))

(declare-fun b!444036 () Bool)

(declare-fun res!263224 () Bool)

(assert (=> b!444036 (=> (not res!263224) (not e!261186))))

(declare-fun arrayContainsKey!0 (array!27367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444036 (= res!263224 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19296 () Bool)

(declare-fun mapRes!19296 () Bool)

(declare-fun tp!37278 () Bool)

(declare-fun e!261188 () Bool)

(assert (=> mapNonEmpty!19296 (= mapRes!19296 (and tp!37278 e!261188))))

(declare-datatypes ((V!16811 0))(
  ( (V!16812 (val!5934 Int)) )
))
(declare-datatypes ((ValueCell!5546 0))(
  ( (ValueCellFull!5546 (v!8185 V!16811)) (EmptyCell!5546) )
))
(declare-fun mapValue!19296 () ValueCell!5546)

(declare-fun mapKey!19296 () (_ BitVec 32))

(declare-datatypes ((array!27369 0))(
  ( (array!27370 (arr!13132 (Array (_ BitVec 32) ValueCell!5546)) (size!13484 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27369)

(declare-fun mapRest!19296 () (Array (_ BitVec 32) ValueCell!5546))

(assert (=> mapNonEmpty!19296 (= (arr!13132 _values!549) (store mapRest!19296 mapKey!19296 mapValue!19296))))

(declare-fun b!444037 () Bool)

(declare-fun e!261187 () Bool)

(assert (=> b!444037 (= e!261187 (and e!261185 mapRes!19296))))

(declare-fun condMapEmpty!19296 () Bool)

(declare-fun mapDefault!19296 () ValueCell!5546)

