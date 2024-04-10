; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38788 () Bool)

(assert start!38788)

(declare-fun b!404558 () Bool)

(declare-fun res!233335 () Bool)

(declare-fun e!243368 () Bool)

(assert (=> b!404558 (=> (not res!233335) (not e!243368))))

(declare-datatypes ((array!24309 0))(
  ( (array!24310 (arr!11604 (Array (_ BitVec 32) (_ BitVec 64))) (size!11956 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24309)

(declare-datatypes ((V!14715 0))(
  ( (V!14716 (val!5148 Int)) )
))
(declare-datatypes ((ValueCell!4760 0))(
  ( (ValueCellFull!4760 (v!7395 V!14715)) (EmptyCell!4760) )
))
(declare-datatypes ((array!24311 0))(
  ( (array!24312 (arr!11605 (Array (_ BitVec 32) ValueCell!4760)) (size!11957 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24311)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404558 (= res!233335 (and (= (size!11957 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11956 _keys!709) (size!11957 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404559 () Bool)

(declare-fun e!243367 () Bool)

(assert (=> b!404559 (= e!243367 false)))

(declare-fun lt!188200 () Bool)

(declare-fun lt!188201 () array!24309)

(declare-datatypes ((List!6755 0))(
  ( (Nil!6752) (Cons!6751 (h!7607 (_ BitVec 64)) (t!11929 List!6755)) )
))
(declare-fun arrayNoDuplicates!0 (array!24309 (_ BitVec 32) List!6755) Bool)

(assert (=> b!404559 (= lt!188200 (arrayNoDuplicates!0 lt!188201 #b00000000000000000000000000000000 Nil!6752))))

(declare-fun b!404560 () Bool)

(declare-fun res!233330 () Bool)

(assert (=> b!404560 (=> (not res!233330) (not e!243368))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404560 (= res!233330 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!404561 () Bool)

(declare-fun res!233332 () Bool)

(assert (=> b!404561 (=> (not res!233332) (not e!243368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24309 (_ BitVec 32)) Bool)

(assert (=> b!404561 (= res!233332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16932 () Bool)

(declare-fun mapRes!16932 () Bool)

(declare-fun tp!33051 () Bool)

(declare-fun e!243371 () Bool)

(assert (=> mapNonEmpty!16932 (= mapRes!16932 (and tp!33051 e!243371))))

(declare-fun mapValue!16932 () ValueCell!4760)

(declare-fun mapKey!16932 () (_ BitVec 32))

(declare-fun mapRest!16932 () (Array (_ BitVec 32) ValueCell!4760))

(assert (=> mapNonEmpty!16932 (= (arr!11605 _values!549) (store mapRest!16932 mapKey!16932 mapValue!16932))))

(declare-fun b!404562 () Bool)

(declare-fun e!243372 () Bool)

(declare-fun tp_is_empty!10207 () Bool)

(assert (=> b!404562 (= e!243372 tp_is_empty!10207)))

(declare-fun b!404564 () Bool)

(declare-fun e!243370 () Bool)

(assert (=> b!404564 (= e!243370 (and e!243372 mapRes!16932))))

(declare-fun condMapEmpty!16932 () Bool)

(declare-fun mapDefault!16932 () ValueCell!4760)

