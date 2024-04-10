; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37556 () Bool)

(assert start!37556)

(declare-fun b_free!8683 () Bool)

(declare-fun b_next!8683 () Bool)

(assert (=> start!37556 (= b_free!8683 (not b_next!8683))))

(declare-fun tp!30765 () Bool)

(declare-fun b_and!15925 () Bool)

(assert (=> start!37556 (= tp!30765 b_and!15925)))

(declare-fun res!218454 () Bool)

(declare-fun e!232993 () Bool)

(assert (=> start!37556 (=> (not res!218454) (not e!232993))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37556 (= res!218454 (validMask!0 mask!970))))

(assert (=> start!37556 e!232993))

(declare-datatypes ((V!13547 0))(
  ( (V!13548 (val!4710 Int)) )
))
(declare-datatypes ((ValueCell!4322 0))(
  ( (ValueCellFull!4322 (v!6907 V!13547)) (EmptyCell!4322) )
))
(declare-datatypes ((array!22569 0))(
  ( (array!22570 (arr!10753 (Array (_ BitVec 32) ValueCell!4322)) (size!11105 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22569)

(declare-fun e!232997 () Bool)

(declare-fun array_inv!7912 (array!22569) Bool)

(assert (=> start!37556 (and (array_inv!7912 _values!506) e!232997)))

(assert (=> start!37556 tp!30765))

(assert (=> start!37556 true))

(declare-fun tp_is_empty!9331 () Bool)

(assert (=> start!37556 tp_is_empty!9331))

(declare-datatypes ((array!22571 0))(
  ( (array!22572 (arr!10754 (Array (_ BitVec 32) (_ BitVec 64))) (size!11106 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22571)

(declare-fun array_inv!7913 (array!22571) Bool)

(assert (=> start!37556 (array_inv!7913 _keys!658)))

(declare-fun b!383620 () Bool)

(declare-fun res!218456 () Bool)

(declare-fun e!232995 () Bool)

(assert (=> b!383620 (=> (not res!218456) (not e!232995))))

(declare-fun lt!180263 () array!22571)

(declare-datatypes ((List!6171 0))(
  ( (Nil!6168) (Cons!6167 (h!7023 (_ BitVec 64)) (t!11321 List!6171)) )
))
(declare-fun arrayNoDuplicates!0 (array!22571 (_ BitVec 32) List!6171) Bool)

(assert (=> b!383620 (= res!218456 (arrayNoDuplicates!0 lt!180263 #b00000000000000000000000000000000 Nil!6168))))

(declare-fun b!383621 () Bool)

(assert (=> b!383621 (= e!232993 e!232995)))

(declare-fun res!218461 () Bool)

(assert (=> b!383621 (=> (not res!218461) (not e!232995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22571 (_ BitVec 32)) Bool)

(assert (=> b!383621 (= res!218461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180263 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383621 (= lt!180263 (array!22572 (store (arr!10754 _keys!658) i!548 k!778) (size!11106 _keys!658)))))

(declare-fun mapIsEmpty!15561 () Bool)

(declare-fun mapRes!15561 () Bool)

(assert (=> mapIsEmpty!15561 mapRes!15561))

(declare-fun b!383622 () Bool)

(declare-fun res!218452 () Bool)

(assert (=> b!383622 (=> (not res!218452) (not e!232993))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383622 (= res!218452 (and (= (size!11105 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11106 _keys!658) (size!11105 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383623 () Bool)

(declare-fun res!218455 () Bool)

(assert (=> b!383623 (=> (not res!218455) (not e!232993))))

(assert (=> b!383623 (= res!218455 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6168))))

(declare-fun b!383624 () Bool)

(declare-fun res!218458 () Bool)

(assert (=> b!383624 (=> (not res!218458) (not e!232993))))

(assert (=> b!383624 (= res!218458 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11106 _keys!658))))))

(declare-fun b!383625 () Bool)

(declare-fun e!232996 () Bool)

(assert (=> b!383625 (= e!232996 true)))

(declare-datatypes ((tuple2!6336 0))(
  ( (tuple2!6337 (_1!3179 (_ BitVec 64)) (_2!3179 V!13547)) )
))
(declare-datatypes ((List!6172 0))(
  ( (Nil!6169) (Cons!6168 (h!7024 tuple2!6336) (t!11322 List!6172)) )
))
(declare-datatypes ((ListLongMap!5249 0))(
  ( (ListLongMap!5250 (toList!2640 List!6172)) )
))
(declare-fun lt!180266 () ListLongMap!5249)

(declare-fun lt!180267 () ListLongMap!5249)

(declare-fun lt!180258 () tuple2!6336)

(declare-fun +!975 (ListLongMap!5249 tuple2!6336) ListLongMap!5249)

(assert (=> b!383625 (= lt!180266 (+!975 lt!180267 lt!180258))))

(declare-fun lt!180257 () ListLongMap!5249)

(declare-fun lt!180262 () ListLongMap!5249)

(assert (=> b!383625 (= lt!180257 lt!180262)))

(declare-fun b!383626 () Bool)

(declare-fun e!232994 () Bool)

(assert (=> b!383626 (= e!232994 tp_is_empty!9331)))

(declare-fun b!383627 () Bool)

(assert (=> b!383627 (= e!232997 (and e!232994 mapRes!15561))))

(declare-fun condMapEmpty!15561 () Bool)

(declare-fun mapDefault!15561 () ValueCell!4322)

