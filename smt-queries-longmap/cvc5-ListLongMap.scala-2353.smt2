; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37580 () Bool)

(assert start!37580)

(declare-fun b_free!8707 () Bool)

(declare-fun b_next!8707 () Bool)

(assert (=> start!37580 (= b_free!8707 (not b_next!8707))))

(declare-fun tp!30837 () Bool)

(declare-fun b_and!15949 () Bool)

(assert (=> start!37580 (= tp!30837 b_and!15949)))

(declare-fun b!384126 () Bool)

(declare-fun e!233251 () Bool)

(declare-fun e!233252 () Bool)

(assert (=> b!384126 (= e!233251 e!233252)))

(declare-fun res!218860 () Bool)

(assert (=> b!384126 (=> res!218860 e!233252)))

(declare-datatypes ((V!13579 0))(
  ( (V!13580 (val!4722 Int)) )
))
(declare-datatypes ((tuple2!6354 0))(
  ( (tuple2!6355 (_1!3188 (_ BitVec 64)) (_2!3188 V!13579)) )
))
(declare-datatypes ((List!6190 0))(
  ( (Nil!6187) (Cons!6186 (h!7042 tuple2!6354) (t!11340 List!6190)) )
))
(declare-datatypes ((ListLongMap!5267 0))(
  ( (ListLongMap!5268 (toList!2649 List!6190)) )
))
(declare-fun lt!180653 () ListLongMap!5267)

(declare-fun lt!180658 () ListLongMap!5267)

(declare-fun lt!180652 () tuple2!6354)

(declare-fun +!984 (ListLongMap!5267 tuple2!6354) ListLongMap!5267)

(assert (=> b!384126 (= res!218860 (not (= (+!984 lt!180658 lt!180652) lt!180653)))))

(declare-fun lt!180660 () ListLongMap!5267)

(assert (=> b!384126 (= lt!180653 lt!180660)))

(declare-fun b!384127 () Bool)

(declare-fun res!218859 () Bool)

(declare-fun e!233246 () Bool)

(assert (=> b!384127 (=> (not res!218859) (not e!233246))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22615 0))(
  ( (array!22616 (arr!10776 (Array (_ BitVec 32) (_ BitVec 64))) (size!11128 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22615)

(assert (=> b!384127 (= res!218859 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11128 _keys!658))))))

(declare-fun b!384128 () Bool)

(declare-fun e!233248 () Bool)

(assert (=> b!384128 (= e!233246 e!233248)))

(declare-fun res!218858 () Bool)

(assert (=> b!384128 (=> (not res!218858) (not e!233248))))

(declare-fun lt!180654 () array!22615)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22615 (_ BitVec 32)) Bool)

(assert (=> b!384128 (= res!218858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180654 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!384128 (= lt!180654 (array!22616 (store (arr!10776 _keys!658) i!548 k!778) (size!11128 _keys!658)))))

(declare-fun res!218857 () Bool)

(assert (=> start!37580 (=> (not res!218857) (not e!233246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37580 (= res!218857 (validMask!0 mask!970))))

(assert (=> start!37580 e!233246))

(declare-datatypes ((ValueCell!4334 0))(
  ( (ValueCellFull!4334 (v!6919 V!13579)) (EmptyCell!4334) )
))
(declare-datatypes ((array!22617 0))(
  ( (array!22618 (arr!10777 (Array (_ BitVec 32) ValueCell!4334)) (size!11129 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22617)

(declare-fun e!233247 () Bool)

(declare-fun array_inv!7932 (array!22617) Bool)

(assert (=> start!37580 (and (array_inv!7932 _values!506) e!233247)))

(assert (=> start!37580 tp!30837))

(assert (=> start!37580 true))

(declare-fun tp_is_empty!9355 () Bool)

(assert (=> start!37580 tp_is_empty!9355))

(declare-fun array_inv!7933 (array!22615) Bool)

(assert (=> start!37580 (array_inv!7933 _keys!658)))

(declare-fun b!384129 () Bool)

(assert (=> b!384129 (= e!233252 (bvsle #b00000000000000000000000000000000 (size!11128 _keys!658)))))

(declare-fun b!384130 () Bool)

(declare-fun e!233245 () Bool)

(assert (=> b!384130 (= e!233245 tp_is_empty!9355)))

(declare-fun mapIsEmpty!15597 () Bool)

(declare-fun mapRes!15597 () Bool)

(assert (=> mapIsEmpty!15597 mapRes!15597))

(declare-fun b!384131 () Bool)

(declare-fun res!218855 () Bool)

(assert (=> b!384131 (=> (not res!218855) (not e!233246))))

(declare-fun arrayContainsKey!0 (array!22615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384131 (= res!218855 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!384132 () Bool)

(declare-fun res!218851 () Bool)

(assert (=> b!384132 (=> (not res!218851) (not e!233246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384132 (= res!218851 (validKeyInArray!0 k!778))))

(declare-fun b!384133 () Bool)

(declare-fun res!218854 () Bool)

(assert (=> b!384133 (=> (not res!218854) (not e!233246))))

(assert (=> b!384133 (= res!218854 (or (= (select (arr!10776 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10776 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384134 () Bool)

(declare-fun res!218853 () Bool)

(assert (=> b!384134 (=> (not res!218853) (not e!233248))))

(declare-datatypes ((List!6191 0))(
  ( (Nil!6188) (Cons!6187 (h!7043 (_ BitVec 64)) (t!11341 List!6191)) )
))
(declare-fun arrayNoDuplicates!0 (array!22615 (_ BitVec 32) List!6191) Bool)

(assert (=> b!384134 (= res!218853 (arrayNoDuplicates!0 lt!180654 #b00000000000000000000000000000000 Nil!6188))))

(declare-fun b!384135 () Bool)

(declare-fun e!233250 () Bool)

(assert (=> b!384135 (= e!233247 (and e!233250 mapRes!15597))))

(declare-fun condMapEmpty!15597 () Bool)

(declare-fun mapDefault!15597 () ValueCell!4334)

