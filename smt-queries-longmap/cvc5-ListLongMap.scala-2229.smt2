; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36836 () Bool)

(assert start!36836)

(declare-fun b_free!7963 () Bool)

(declare-fun b_next!7963 () Bool)

(assert (=> start!36836 (= b_free!7963 (not b_next!7963))))

(declare-fun tp!28604 () Bool)

(declare-fun b_and!15205 () Bool)

(assert (=> start!36836 (= tp!28604 b_and!15205)))

(declare-fun res!206393 () Bool)

(declare-fun e!225279 () Bool)

(assert (=> start!36836 (=> (not res!206393) (not e!225279))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36836 (= res!206393 (validMask!0 mask!970))))

(assert (=> start!36836 e!225279))

(assert (=> start!36836 true))

(declare-datatypes ((V!12587 0))(
  ( (V!12588 (val!4350 Int)) )
))
(declare-datatypes ((ValueCell!3962 0))(
  ( (ValueCellFull!3962 (v!6547 V!12587)) (EmptyCell!3962) )
))
(declare-datatypes ((array!21179 0))(
  ( (array!21180 (arr!10058 (Array (_ BitVec 32) ValueCell!3962)) (size!10410 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21179)

(declare-fun e!225276 () Bool)

(declare-fun array_inv!7438 (array!21179) Bool)

(assert (=> start!36836 (and (array_inv!7438 _values!506) e!225276)))

(assert (=> start!36836 tp!28604))

(declare-fun tp_is_empty!8611 () Bool)

(assert (=> start!36836 tp_is_empty!8611))

(declare-datatypes ((array!21181 0))(
  ( (array!21182 (arr!10059 (Array (_ BitVec 32) (_ BitVec 64))) (size!10411 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21181)

(declare-fun array_inv!7439 (array!21181) Bool)

(assert (=> start!36836 (array_inv!7439 _keys!658)))

(declare-fun b!368318 () Bool)

(declare-fun res!206396 () Bool)

(assert (=> b!368318 (=> (not res!206396) (not e!225279))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368318 (= res!206396 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10411 _keys!658))))))

(declare-fun b!368319 () Bool)

(declare-fun res!206392 () Bool)

(declare-fun e!225277 () Bool)

(assert (=> b!368319 (=> (not res!206392) (not e!225277))))

(declare-fun lt!169512 () array!21181)

(declare-datatypes ((List!5596 0))(
  ( (Nil!5593) (Cons!5592 (h!6448 (_ BitVec 64)) (t!10746 List!5596)) )
))
(declare-fun arrayNoDuplicates!0 (array!21181 (_ BitVec 32) List!5596) Bool)

(assert (=> b!368319 (= res!206392 (arrayNoDuplicates!0 lt!169512 #b00000000000000000000000000000000 Nil!5593))))

(declare-fun mapNonEmpty!14481 () Bool)

(declare-fun mapRes!14481 () Bool)

(declare-fun tp!28605 () Bool)

(declare-fun e!225281 () Bool)

(assert (=> mapNonEmpty!14481 (= mapRes!14481 (and tp!28605 e!225281))))

(declare-fun mapRest!14481 () (Array (_ BitVec 32) ValueCell!3962))

(declare-fun mapValue!14481 () ValueCell!3962)

(declare-fun mapKey!14481 () (_ BitVec 32))

(assert (=> mapNonEmpty!14481 (= (arr!10058 _values!506) (store mapRest!14481 mapKey!14481 mapValue!14481))))

(declare-fun b!368320 () Bool)

(declare-fun res!206398 () Bool)

(assert (=> b!368320 (=> (not res!206398) (not e!225279))))

(assert (=> b!368320 (= res!206398 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5593))))

(declare-fun b!368321 () Bool)

(declare-fun res!206395 () Bool)

(assert (=> b!368321 (=> (not res!206395) (not e!225279))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368321 (= res!206395 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368322 () Bool)

(assert (=> b!368322 (= e!225277 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12587)

(declare-datatypes ((tuple2!5764 0))(
  ( (tuple2!5765 (_1!2893 (_ BitVec 64)) (_2!2893 V!12587)) )
))
(declare-datatypes ((List!5597 0))(
  ( (Nil!5594) (Cons!5593 (h!6449 tuple2!5764) (t!10747 List!5597)) )
))
(declare-datatypes ((ListLongMap!4677 0))(
  ( (ListLongMap!4678 (toList!2354 List!5597)) )
))
(declare-fun lt!169511 () ListLongMap!4677)

(declare-fun minValue!472 () V!12587)

(declare-fun getCurrentListMapNoExtraKeys!631 (array!21181 array!21179 (_ BitVec 32) (_ BitVec 32) V!12587 V!12587 (_ BitVec 32) Int) ListLongMap!4677)

(assert (=> b!368322 (= lt!169511 (getCurrentListMapNoExtraKeys!631 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368323 () Bool)

(declare-fun res!206397 () Bool)

(assert (=> b!368323 (=> (not res!206397) (not e!225279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368323 (= res!206397 (validKeyInArray!0 k!778))))

(declare-fun b!368324 () Bool)

(assert (=> b!368324 (= e!225279 e!225277)))

(declare-fun res!206399 () Bool)

(assert (=> b!368324 (=> (not res!206399) (not e!225277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21181 (_ BitVec 32)) Bool)

(assert (=> b!368324 (= res!206399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169512 mask!970))))

(assert (=> b!368324 (= lt!169512 (array!21182 (store (arr!10059 _keys!658) i!548 k!778) (size!10411 _keys!658)))))

(declare-fun b!368325 () Bool)

(declare-fun res!206391 () Bool)

(assert (=> b!368325 (=> (not res!206391) (not e!225279))))

(assert (=> b!368325 (= res!206391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368326 () Bool)

(declare-fun e!225278 () Bool)

(assert (=> b!368326 (= e!225276 (and e!225278 mapRes!14481))))

(declare-fun condMapEmpty!14481 () Bool)

(declare-fun mapDefault!14481 () ValueCell!3962)

