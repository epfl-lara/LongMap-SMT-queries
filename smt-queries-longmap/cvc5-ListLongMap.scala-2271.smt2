; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37088 () Bool)

(assert start!37088)

(declare-fun b_free!8215 () Bool)

(declare-fun b_next!8215 () Bool)

(assert (=> start!37088 (= b_free!8215 (not b_next!8215))))

(declare-fun tp!29361 () Bool)

(declare-fun b_and!15457 () Bool)

(assert (=> start!37088 (= tp!29361 b_and!15457)))

(declare-fun b!373272 () Bool)

(declare-fun e!227577 () Bool)

(declare-fun e!227578 () Bool)

(assert (=> b!373272 (= e!227577 e!227578)))

(declare-fun res!210218 () Bool)

(assert (=> b!373272 (=> res!210218 e!227578)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!373272 (= res!210218 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!12923 0))(
  ( (V!12924 (val!4476 Int)) )
))
(declare-datatypes ((tuple2!5940 0))(
  ( (tuple2!5941 (_1!2981 (_ BitVec 64)) (_2!2981 V!12923)) )
))
(declare-datatypes ((List!5786 0))(
  ( (Nil!5783) (Cons!5782 (h!6638 tuple2!5940) (t!10936 List!5786)) )
))
(declare-datatypes ((ListLongMap!4853 0))(
  ( (ListLongMap!4854 (toList!2442 List!5786)) )
))
(declare-fun lt!171290 () ListLongMap!4853)

(declare-fun lt!171297 () ListLongMap!4853)

(assert (=> b!373272 (= lt!171290 lt!171297)))

(declare-fun lt!171298 () ListLongMap!4853)

(declare-fun lt!171302 () tuple2!5940)

(declare-fun +!788 (ListLongMap!4853 tuple2!5940) ListLongMap!4853)

(assert (=> b!373272 (= lt!171297 (+!788 lt!171298 lt!171302))))

(declare-fun v!373 () V!12923)

(declare-fun lt!171299 () ListLongMap!4853)

(declare-datatypes ((Unit!11482 0))(
  ( (Unit!11483) )
))
(declare-fun lt!171289 () Unit!11482)

(declare-fun zeroValue!472 () V!12923)

(declare-fun addCommutativeForDiffKeys!214 (ListLongMap!4853 (_ BitVec 64) V!12923 (_ BitVec 64) V!12923) Unit!11482)

(assert (=> b!373272 (= lt!171289 (addCommutativeForDiffKeys!214 lt!171299 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171291 () ListLongMap!4853)

(declare-fun lt!171293 () tuple2!5940)

(assert (=> b!373272 (= lt!171291 (+!788 lt!171290 lt!171293))))

(declare-fun lt!171295 () ListLongMap!4853)

(declare-fun lt!171294 () tuple2!5940)

(assert (=> b!373272 (= lt!171290 (+!788 lt!171295 lt!171294))))

(declare-fun lt!171288 () ListLongMap!4853)

(declare-fun lt!171300 () ListLongMap!4853)

(assert (=> b!373272 (= lt!171288 lt!171300)))

(assert (=> b!373272 (= lt!171300 (+!788 lt!171298 lt!171293))))

(assert (=> b!373272 (= lt!171298 (+!788 lt!171299 lt!171294))))

(declare-fun lt!171287 () ListLongMap!4853)

(assert (=> b!373272 (= lt!171291 (+!788 (+!788 lt!171287 lt!171294) lt!171293))))

(declare-fun minValue!472 () V!12923)

(assert (=> b!373272 (= lt!171293 (tuple2!5941 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373272 (= lt!171294 (tuple2!5941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373273 () Bool)

(declare-fun e!227575 () Bool)

(declare-fun tp_is_empty!8863 () Bool)

(assert (=> b!373273 (= e!227575 tp_is_empty!8863)))

(declare-fun b!373274 () Bool)

(assert (=> b!373274 (= e!227578 true)))

(assert (=> b!373274 (= (+!788 lt!171297 lt!171293) (+!788 lt!171300 lt!171302))))

(declare-fun lt!171303 () Unit!11482)

(assert (=> b!373274 (= lt!171303 (addCommutativeForDiffKeys!214 lt!171298 k!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373275 () Bool)

(declare-fun res!210219 () Bool)

(declare-fun e!227579 () Bool)

(assert (=> b!373275 (=> (not res!210219) (not e!227579))))

(declare-datatypes ((array!21667 0))(
  ( (array!21668 (arr!10302 (Array (_ BitVec 32) (_ BitVec 64))) (size!10654 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21667)

(declare-fun arrayContainsKey!0 (array!21667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373275 (= res!210219 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!373276 () Bool)

(declare-fun res!210216 () Bool)

(assert (=> b!373276 (=> (not res!210216) (not e!227579))))

(declare-datatypes ((List!5787 0))(
  ( (Nil!5784) (Cons!5783 (h!6639 (_ BitVec 64)) (t!10937 List!5787)) )
))
(declare-fun arrayNoDuplicates!0 (array!21667 (_ BitVec 32) List!5787) Bool)

(assert (=> b!373276 (= res!210216 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5784))))

(declare-fun b!373277 () Bool)

(declare-fun e!227580 () Bool)

(declare-fun e!227576 () Bool)

(declare-fun mapRes!14859 () Bool)

(assert (=> b!373277 (= e!227580 (and e!227576 mapRes!14859))))

(declare-fun condMapEmpty!14859 () Bool)

(declare-datatypes ((ValueCell!4088 0))(
  ( (ValueCellFull!4088 (v!6673 V!12923)) (EmptyCell!4088) )
))
(declare-datatypes ((array!21669 0))(
  ( (array!21670 (arr!10303 (Array (_ BitVec 32) ValueCell!4088)) (size!10655 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21669)

(declare-fun mapDefault!14859 () ValueCell!4088)

