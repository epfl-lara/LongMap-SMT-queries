; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39608 () Bool)

(assert start!39608)

(declare-fun b_free!9875 () Bool)

(declare-fun b_next!9875 () Bool)

(assert (=> start!39608 (= b_free!9875 (not b_next!9875))))

(declare-fun tp!35153 () Bool)

(declare-fun b_and!17531 () Bool)

(assert (=> start!39608 (= tp!35153 b_and!17531)))

(declare-fun b!424434 () Bool)

(declare-fun res!248272 () Bool)

(declare-fun e!252134 () Bool)

(assert (=> b!424434 (=> (not res!248272) (not e!252134))))

(declare-datatypes ((array!25893 0))(
  ( (array!25894 (arr!12396 (Array (_ BitVec 32) (_ BitVec 64))) (size!12748 (_ BitVec 32))) )
))
(declare-fun lt!194368 () array!25893)

(declare-datatypes ((List!7307 0))(
  ( (Nil!7304) (Cons!7303 (h!8159 (_ BitVec 64)) (t!12751 List!7307)) )
))
(declare-fun arrayNoDuplicates!0 (array!25893 (_ BitVec 32) List!7307) Bool)

(assert (=> b!424434 (= res!248272 (arrayNoDuplicates!0 lt!194368 #b00000000000000000000000000000000 Nil!7304))))

(declare-fun b!424435 () Bool)

(declare-fun res!248281 () Bool)

(assert (=> b!424435 (=> (not res!248281) (not e!252134))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424435 (= res!248281 (bvsle from!863 i!563))))

(declare-fun b!424436 () Bool)

(declare-fun e!252133 () Bool)

(declare-fun tp_is_empty!11027 () Bool)

(assert (=> b!424436 (= e!252133 tp_is_empty!11027)))

(declare-fun b!424437 () Bool)

(declare-fun res!248282 () Bool)

(declare-fun e!252138 () Bool)

(assert (=> b!424437 (=> (not res!248282) (not e!252138))))

(declare-fun _keys!709 () array!25893)

(assert (=> b!424437 (= res!248282 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7304))))

(declare-fun b!424438 () Bool)

(declare-fun res!248276 () Bool)

(assert (=> b!424438 (=> (not res!248276) (not e!252138))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424438 (= res!248276 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18162 () Bool)

(declare-fun mapRes!18162 () Bool)

(assert (=> mapIsEmpty!18162 mapRes!18162))

(declare-fun b!424439 () Bool)

(declare-fun e!252137 () Bool)

(assert (=> b!424439 (= e!252137 tp_is_empty!11027)))

(declare-fun b!424440 () Bool)

(declare-fun res!248277 () Bool)

(assert (=> b!424440 (=> (not res!248277) (not e!252138))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25893 (_ BitVec 32)) Bool)

(assert (=> b!424440 (= res!248277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424441 () Bool)

(declare-fun res!248274 () Bool)

(assert (=> b!424441 (=> (not res!248274) (not e!252138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424441 (= res!248274 (validMask!0 mask!1025))))

(declare-fun b!424442 () Bool)

(declare-fun e!252135 () Bool)

(assert (=> b!424442 (= e!252135 (and e!252137 mapRes!18162))))

(declare-fun condMapEmpty!18162 () Bool)

(declare-datatypes ((V!15807 0))(
  ( (V!15808 (val!5558 Int)) )
))
(declare-datatypes ((ValueCell!5170 0))(
  ( (ValueCellFull!5170 (v!7805 V!15807)) (EmptyCell!5170) )
))
(declare-datatypes ((array!25895 0))(
  ( (array!25896 (arr!12397 (Array (_ BitVec 32) ValueCell!5170)) (size!12749 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25895)

(declare-fun mapDefault!18162 () ValueCell!5170)

