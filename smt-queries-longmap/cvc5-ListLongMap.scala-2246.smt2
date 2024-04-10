; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36938 () Bool)

(assert start!36938)

(declare-fun b_free!8065 () Bool)

(declare-fun b_next!8065 () Bool)

(assert (=> start!36938 (= b_free!8065 (not b_next!8065))))

(declare-fun tp!28911 () Bool)

(declare-fun b_and!15307 () Bool)

(assert (=> start!36938 (= tp!28911 b_and!15307)))

(declare-fun b!370307 () Bool)

(declare-fun e!226197 () Bool)

(declare-fun tp_is_empty!8713 () Bool)

(assert (=> b!370307 (= e!226197 tp_is_empty!8713)))

(declare-fun b!370308 () Bool)

(declare-fun res!207926 () Bool)

(declare-fun e!226195 () Bool)

(assert (=> b!370308 (=> (not res!207926) (not e!226195))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12723 0))(
  ( (V!12724 (val!4401 Int)) )
))
(declare-datatypes ((ValueCell!4013 0))(
  ( (ValueCellFull!4013 (v!6598 V!12723)) (EmptyCell!4013) )
))
(declare-datatypes ((array!21369 0))(
  ( (array!21370 (arr!10153 (Array (_ BitVec 32) ValueCell!4013)) (size!10505 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21369)

(declare-datatypes ((array!21371 0))(
  ( (array!21372 (arr!10154 (Array (_ BitVec 32) (_ BitVec 64))) (size!10506 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21371)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!370308 (= res!207926 (and (= (size!10505 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10506 _keys!658) (size!10505 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370309 () Bool)

(declare-fun res!207924 () Bool)

(assert (=> b!370309 (=> (not res!207924) (not e!226195))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370309 (= res!207924 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!14634 () Bool)

(declare-fun mapRes!14634 () Bool)

(declare-fun tp!28910 () Bool)

(declare-fun e!226194 () Bool)

(assert (=> mapNonEmpty!14634 (= mapRes!14634 (and tp!28910 e!226194))))

(declare-fun mapRest!14634 () (Array (_ BitVec 32) ValueCell!4013))

(declare-fun mapValue!14634 () ValueCell!4013)

(declare-fun mapKey!14634 () (_ BitVec 32))

(assert (=> mapNonEmpty!14634 (= (arr!10153 _values!506) (store mapRest!14634 mapKey!14634 mapValue!14634))))

(declare-fun b!370310 () Bool)

(declare-fun res!207925 () Bool)

(assert (=> b!370310 (=> (not res!207925) (not e!226195))))

(declare-fun arrayContainsKey!0 (array!21371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370310 (= res!207925 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14634 () Bool)

(assert (=> mapIsEmpty!14634 mapRes!14634))

(declare-fun b!370311 () Bool)

(assert (=> b!370311 (= e!226194 tp_is_empty!8713)))

(declare-fun b!370312 () Bool)

(declare-fun e!226198 () Bool)

(assert (=> b!370312 (= e!226198 (and e!226197 mapRes!14634))))

(declare-fun condMapEmpty!14634 () Bool)

(declare-fun mapDefault!14634 () ValueCell!4013)

