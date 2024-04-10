; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38984 () Bool)

(assert start!38984)

(declare-fun b!408380 () Bool)

(declare-fun res!236275 () Bool)

(declare-fun e!245133 () Bool)

(assert (=> b!408380 (=> (not res!236275) (not e!245133))))

(declare-datatypes ((array!24681 0))(
  ( (array!24682 (arr!11790 (Array (_ BitVec 32) (_ BitVec 64))) (size!12142 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24681)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408380 (= res!236275 (or (= (select (arr!11790 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11790 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408381 () Bool)

(declare-fun res!236274 () Bool)

(assert (=> b!408381 (=> (not res!236274) (not e!245133))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408381 (= res!236274 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!408382 () Bool)

(declare-fun e!245135 () Bool)

(assert (=> b!408382 (= e!245133 e!245135)))

(declare-fun res!236273 () Bool)

(assert (=> b!408382 (=> (not res!236273) (not e!245135))))

(declare-fun lt!188789 () array!24681)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24681 (_ BitVec 32)) Bool)

(assert (=> b!408382 (= res!236273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188789 mask!1025))))

(assert (=> b!408382 (= lt!188789 (array!24682 (store (arr!11790 _keys!709) i!563 k!794) (size!12142 _keys!709)))))

(declare-fun b!408383 () Bool)

(declare-fun res!236269 () Bool)

(assert (=> b!408383 (=> (not res!236269) (not e!245133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408383 (= res!236269 (validMask!0 mask!1025))))

(declare-fun res!236272 () Bool)

(assert (=> start!38984 (=> (not res!236272) (not e!245133))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38984 (= res!236272 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12142 _keys!709))))))

(assert (=> start!38984 e!245133))

(assert (=> start!38984 true))

(declare-datatypes ((V!14975 0))(
  ( (V!14976 (val!5246 Int)) )
))
(declare-datatypes ((ValueCell!4858 0))(
  ( (ValueCellFull!4858 (v!7493 V!14975)) (EmptyCell!4858) )
))
(declare-datatypes ((array!24683 0))(
  ( (array!24684 (arr!11791 (Array (_ BitVec 32) ValueCell!4858)) (size!12143 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24683)

(declare-fun e!245131 () Bool)

(declare-fun array_inv!8600 (array!24683) Bool)

(assert (=> start!38984 (and (array_inv!8600 _values!549) e!245131)))

(declare-fun array_inv!8601 (array!24681) Bool)

(assert (=> start!38984 (array_inv!8601 _keys!709)))

(declare-fun b!408384 () Bool)

(declare-fun res!236268 () Bool)

(assert (=> b!408384 (=> (not res!236268) (not e!245133))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408384 (= res!236268 (and (= (size!12143 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12142 _keys!709) (size!12143 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17226 () Bool)

(declare-fun mapRes!17226 () Bool)

(assert (=> mapIsEmpty!17226 mapRes!17226))

(declare-fun b!408385 () Bool)

(declare-fun e!245136 () Bool)

(declare-fun tp_is_empty!10403 () Bool)

(assert (=> b!408385 (= e!245136 tp_is_empty!10403)))

(declare-fun b!408386 () Bool)

(assert (=> b!408386 (= e!245135 false)))

(declare-fun lt!188788 () Bool)

(declare-datatypes ((List!6832 0))(
  ( (Nil!6829) (Cons!6828 (h!7684 (_ BitVec 64)) (t!12006 List!6832)) )
))
(declare-fun arrayNoDuplicates!0 (array!24681 (_ BitVec 32) List!6832) Bool)

(assert (=> b!408386 (= lt!188788 (arrayNoDuplicates!0 lt!188789 #b00000000000000000000000000000000 Nil!6829))))

(declare-fun b!408387 () Bool)

(declare-fun e!245132 () Bool)

(assert (=> b!408387 (= e!245132 tp_is_empty!10403)))

(declare-fun b!408388 () Bool)

(declare-fun res!236276 () Bool)

(assert (=> b!408388 (=> (not res!236276) (not e!245133))))

(assert (=> b!408388 (= res!236276 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6829))))

(declare-fun mapNonEmpty!17226 () Bool)

(declare-fun tp!33345 () Bool)

(assert (=> mapNonEmpty!17226 (= mapRes!17226 (and tp!33345 e!245132))))

(declare-fun mapKey!17226 () (_ BitVec 32))

(declare-fun mapValue!17226 () ValueCell!4858)

(declare-fun mapRest!17226 () (Array (_ BitVec 32) ValueCell!4858))

(assert (=> mapNonEmpty!17226 (= (arr!11791 _values!549) (store mapRest!17226 mapKey!17226 mapValue!17226))))

(declare-fun b!408389 () Bool)

(declare-fun res!236271 () Bool)

(assert (=> b!408389 (=> (not res!236271) (not e!245133))))

(assert (=> b!408389 (= res!236271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408390 () Bool)

(assert (=> b!408390 (= e!245131 (and e!245136 mapRes!17226))))

(declare-fun condMapEmpty!17226 () Bool)

(declare-fun mapDefault!17226 () ValueCell!4858)

