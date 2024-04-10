; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36638 () Bool)

(assert start!36638)

(declare-fun mapIsEmpty!14262 () Bool)

(declare-fun mapRes!14262 () Bool)

(assert (=> mapIsEmpty!14262 mapRes!14262))

(declare-fun b!365699 () Bool)

(declare-fun res!204480 () Bool)

(declare-fun e!223949 () Bool)

(assert (=> b!365699 (=> (not res!204480) (not e!223949))))

(declare-datatypes ((array!20901 0))(
  ( (array!20902 (arr!9923 (Array (_ BitVec 32) (_ BitVec 64))) (size!10275 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20901)

(declare-datatypes ((List!5532 0))(
  ( (Nil!5529) (Cons!5528 (h!6384 (_ BitVec 64)) (t!10682 List!5532)) )
))
(declare-fun arrayNoDuplicates!0 (array!20901 (_ BitVec 32) List!5532) Bool)

(assert (=> b!365699 (= res!204480 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5529))))

(declare-fun b!365700 () Bool)

(declare-fun res!204479 () Bool)

(assert (=> b!365700 (=> (not res!204479) (not e!223949))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365700 (= res!204479 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10275 _keys!658))))))

(declare-fun b!365701 () Bool)

(declare-fun res!204483 () Bool)

(assert (=> b!365701 (=> (not res!204483) (not e!223949))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20901 (_ BitVec 32)) Bool)

(assert (=> b!365701 (= res!204483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365702 () Bool)

(declare-fun e!223950 () Bool)

(declare-fun tp_is_empty!8473 () Bool)

(assert (=> b!365702 (= e!223950 tp_is_empty!8473)))

(declare-fun b!365703 () Bool)

(declare-fun res!204482 () Bool)

(assert (=> b!365703 (=> (not res!204482) (not e!223949))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365703 (= res!204482 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!14262 () Bool)

(declare-fun tp!28338 () Bool)

(assert (=> mapNonEmpty!14262 (= mapRes!14262 (and tp!28338 e!223950))))

(declare-datatypes ((V!12403 0))(
  ( (V!12404 (val!4281 Int)) )
))
(declare-datatypes ((ValueCell!3893 0))(
  ( (ValueCellFull!3893 (v!6477 V!12403)) (EmptyCell!3893) )
))
(declare-datatypes ((array!20903 0))(
  ( (array!20904 (arr!9924 (Array (_ BitVec 32) ValueCell!3893)) (size!10276 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20903)

(declare-fun mapValue!14262 () ValueCell!3893)

(declare-fun mapKey!14262 () (_ BitVec 32))

(declare-fun mapRest!14262 () (Array (_ BitVec 32) ValueCell!3893))

(assert (=> mapNonEmpty!14262 (= (arr!9924 _values!506) (store mapRest!14262 mapKey!14262 mapValue!14262))))

(declare-fun b!365704 () Bool)

(declare-fun res!204478 () Bool)

(assert (=> b!365704 (=> (not res!204478) (not e!223949))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365704 (= res!204478 (and (= (size!10276 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10275 _keys!658) (size!10276 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365705 () Bool)

(declare-fun e!223951 () Bool)

(declare-fun e!223953 () Bool)

(assert (=> b!365705 (= e!223951 (and e!223953 mapRes!14262))))

(declare-fun condMapEmpty!14262 () Bool)

(declare-fun mapDefault!14262 () ValueCell!3893)

