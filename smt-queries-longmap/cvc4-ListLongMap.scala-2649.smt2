; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39716 () Bool)

(assert start!39716)

(declare-fun b_free!9983 () Bool)

(declare-fun b_next!9983 () Bool)

(assert (=> start!39716 (= b_free!9983 (not b_next!9983))))

(declare-fun tp!35477 () Bool)

(declare-fun b_and!17639 () Bool)

(assert (=> start!39716 (= tp!35477 b_and!17639)))

(declare-fun mapIsEmpty!18324 () Bool)

(declare-fun mapRes!18324 () Bool)

(assert (=> mapIsEmpty!18324 mapRes!18324))

(declare-fun b!427007 () Bool)

(declare-fun res!250361 () Bool)

(declare-fun e!253248 () Bool)

(assert (=> b!427007 (=> (not res!250361) (not e!253248))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427007 (= res!250361 (validMask!0 mask!1025))))

(declare-fun b!427008 () Bool)

(declare-fun res!250364 () Bool)

(assert (=> b!427008 (=> (not res!250364) (not e!253248))))

(declare-datatypes ((array!26109 0))(
  ( (array!26110 (arr!12504 (Array (_ BitVec 32) (_ BitVec 64))) (size!12856 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26109)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26109 (_ BitVec 32)) Bool)

(assert (=> b!427008 (= res!250364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427009 () Bool)

(declare-fun e!253251 () Bool)

(declare-fun tp_is_empty!11135 () Bool)

(assert (=> b!427009 (= e!253251 tp_is_empty!11135)))

(declare-fun b!427010 () Bool)

(declare-fun e!253254 () Bool)

(declare-fun e!253250 () Bool)

(assert (=> b!427010 (= e!253254 e!253250)))

(declare-fun res!250360 () Bool)

(assert (=> b!427010 (=> (not res!250360) (not e!253250))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427010 (= res!250360 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15951 0))(
  ( (V!15952 (val!5612 Int)) )
))
(declare-fun minValue!515 () V!15951)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15951)

(declare-fun lt!195141 () array!26109)

(declare-datatypes ((tuple2!7374 0))(
  ( (tuple2!7375 (_1!3698 (_ BitVec 64)) (_2!3698 V!15951)) )
))
(declare-datatypes ((List!7391 0))(
  ( (Nil!7388) (Cons!7387 (h!8243 tuple2!7374) (t!12835 List!7391)) )
))
(declare-datatypes ((ListLongMap!6287 0))(
  ( (ListLongMap!6288 (toList!3159 List!7391)) )
))
(declare-fun lt!195143 () ListLongMap!6287)

(declare-datatypes ((ValueCell!5224 0))(
  ( (ValueCellFull!5224 (v!7859 V!15951)) (EmptyCell!5224) )
))
(declare-datatypes ((array!26111 0))(
  ( (array!26112 (arr!12505 (Array (_ BitVec 32) ValueCell!5224)) (size!12857 (_ BitVec 32))) )
))
(declare-fun lt!195139 () array!26111)

(declare-fun getCurrentListMapNoExtraKeys!1363 (array!26109 array!26111 (_ BitVec 32) (_ BitVec 32) V!15951 V!15951 (_ BitVec 32) Int) ListLongMap!6287)

(assert (=> b!427010 (= lt!195143 (getCurrentListMapNoExtraKeys!1363 lt!195141 lt!195139 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26111)

(declare-fun v!412 () V!15951)

(assert (=> b!427010 (= lt!195139 (array!26112 (store (arr!12505 _values!549) i!563 (ValueCellFull!5224 v!412)) (size!12857 _values!549)))))

(declare-fun lt!195140 () ListLongMap!6287)

(assert (=> b!427010 (= lt!195140 (getCurrentListMapNoExtraKeys!1363 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427011 () Bool)

(assert (=> b!427011 (= e!253248 e!253254)))

(declare-fun res!250366 () Bool)

(assert (=> b!427011 (=> (not res!250366) (not e!253254))))

(assert (=> b!427011 (= res!250366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195141 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!427011 (= lt!195141 (array!26110 (store (arr!12504 _keys!709) i!563 k!794) (size!12856 _keys!709)))))

(declare-fun res!250371 () Bool)

(assert (=> start!39716 (=> (not res!250371) (not e!253248))))

(assert (=> start!39716 (= res!250371 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12856 _keys!709))))))

(assert (=> start!39716 e!253248))

(assert (=> start!39716 tp_is_empty!11135))

(assert (=> start!39716 tp!35477))

(assert (=> start!39716 true))

(declare-fun e!253252 () Bool)

(declare-fun array_inv!9112 (array!26111) Bool)

(assert (=> start!39716 (and (array_inv!9112 _values!549) e!253252)))

(declare-fun array_inv!9113 (array!26109) Bool)

(assert (=> start!39716 (array_inv!9113 _keys!709)))

(declare-fun b!427012 () Bool)

(declare-fun res!250369 () Bool)

(assert (=> b!427012 (=> (not res!250369) (not e!253254))))

(assert (=> b!427012 (= res!250369 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18324 () Bool)

(declare-fun tp!35478 () Bool)

(declare-fun e!253253 () Bool)

(assert (=> mapNonEmpty!18324 (= mapRes!18324 (and tp!35478 e!253253))))

(declare-fun mapValue!18324 () ValueCell!5224)

(declare-fun mapKey!18324 () (_ BitVec 32))

(declare-fun mapRest!18324 () (Array (_ BitVec 32) ValueCell!5224))

(assert (=> mapNonEmpty!18324 (= (arr!12505 _values!549) (store mapRest!18324 mapKey!18324 mapValue!18324))))

(declare-fun b!427013 () Bool)

(assert (=> b!427013 (= e!253252 (and e!253251 mapRes!18324))))

(declare-fun condMapEmpty!18324 () Bool)

(declare-fun mapDefault!18324 () ValueCell!5224)

