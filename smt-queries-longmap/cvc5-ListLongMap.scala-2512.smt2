; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38890 () Bool)

(assert start!38890)

(declare-fun b!406547 () Bool)

(declare-fun res!234858 () Bool)

(declare-fun e!244285 () Bool)

(assert (=> b!406547 (=> (not res!234858) (not e!244285))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406547 (= res!234858 (validKeyInArray!0 k!794))))

(declare-fun b!406548 () Bool)

(declare-fun e!244287 () Bool)

(assert (=> b!406548 (= e!244287 false)))

(declare-fun lt!188506 () Bool)

(declare-datatypes ((array!24507 0))(
  ( (array!24508 (arr!11703 (Array (_ BitVec 32) (_ BitVec 64))) (size!12055 (_ BitVec 32))) )
))
(declare-fun lt!188507 () array!24507)

(declare-datatypes ((List!6795 0))(
  ( (Nil!6792) (Cons!6791 (h!7647 (_ BitVec 64)) (t!11969 List!6795)) )
))
(declare-fun arrayNoDuplicates!0 (array!24507 (_ BitVec 32) List!6795) Bool)

(assert (=> b!406548 (= lt!188506 (arrayNoDuplicates!0 lt!188507 #b00000000000000000000000000000000 Nil!6792))))

(declare-fun b!406549 () Bool)

(declare-fun res!234863 () Bool)

(assert (=> b!406549 (=> (not res!234863) (not e!244285))))

(declare-fun _keys!709 () array!24507)

(declare-fun arrayContainsKey!0 (array!24507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406549 (= res!234863 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!234866 () Bool)

(assert (=> start!38890 (=> (not res!234866) (not e!244285))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38890 (= res!234866 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12055 _keys!709))))))

(assert (=> start!38890 e!244285))

(assert (=> start!38890 true))

(declare-datatypes ((V!14851 0))(
  ( (V!14852 (val!5199 Int)) )
))
(declare-datatypes ((ValueCell!4811 0))(
  ( (ValueCellFull!4811 (v!7446 V!14851)) (EmptyCell!4811) )
))
(declare-datatypes ((array!24509 0))(
  ( (array!24510 (arr!11704 (Array (_ BitVec 32) ValueCell!4811)) (size!12056 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24509)

(declare-fun e!244290 () Bool)

(declare-fun array_inv!8546 (array!24509) Bool)

(assert (=> start!38890 (and (array_inv!8546 _values!549) e!244290)))

(declare-fun array_inv!8547 (array!24507) Bool)

(assert (=> start!38890 (array_inv!8547 _keys!709)))

(declare-fun b!406550 () Bool)

(declare-fun e!244288 () Bool)

(declare-fun tp_is_empty!10309 () Bool)

(assert (=> b!406550 (= e!244288 tp_is_empty!10309)))

(declare-fun b!406551 () Bool)

(declare-fun res!234860 () Bool)

(assert (=> b!406551 (=> (not res!234860) (not e!244285))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406551 (= res!234860 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17085 () Bool)

(declare-fun mapRes!17085 () Bool)

(assert (=> mapIsEmpty!17085 mapRes!17085))

(declare-fun mapNonEmpty!17085 () Bool)

(declare-fun tp!33204 () Bool)

(declare-fun e!244289 () Bool)

(assert (=> mapNonEmpty!17085 (= mapRes!17085 (and tp!33204 e!244289))))

(declare-fun mapRest!17085 () (Array (_ BitVec 32) ValueCell!4811))

(declare-fun mapKey!17085 () (_ BitVec 32))

(declare-fun mapValue!17085 () ValueCell!4811)

(assert (=> mapNonEmpty!17085 (= (arr!11704 _values!549) (store mapRest!17085 mapKey!17085 mapValue!17085))))

(declare-fun b!406552 () Bool)

(declare-fun res!234865 () Bool)

(assert (=> b!406552 (=> (not res!234865) (not e!244285))))

(assert (=> b!406552 (= res!234865 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6792))))

(declare-fun b!406553 () Bool)

(declare-fun res!234862 () Bool)

(assert (=> b!406553 (=> (not res!234862) (not e!244285))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406553 (= res!234862 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12055 _keys!709))))))

(declare-fun b!406554 () Bool)

(assert (=> b!406554 (= e!244290 (and e!244288 mapRes!17085))))

(declare-fun condMapEmpty!17085 () Bool)

(declare-fun mapDefault!17085 () ValueCell!4811)

