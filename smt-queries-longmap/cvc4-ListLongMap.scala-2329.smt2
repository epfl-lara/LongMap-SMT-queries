; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37440 () Bool)

(assert start!37440)

(declare-fun b_free!8567 () Bool)

(declare-fun b_next!8567 () Bool)

(assert (=> start!37440 (= b_free!8567 (not b_next!8567))))

(declare-fun tp!30416 () Bool)

(declare-fun b_and!15809 () Bool)

(assert (=> start!37440 (= tp!30416 b_and!15809)))

(declare-fun b!381185 () Bool)

(declare-fun res!216538 () Bool)

(declare-fun e!231773 () Bool)

(assert (=> b!381185 (=> (not res!216538) (not e!231773))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13391 0))(
  ( (V!13392 (val!4652 Int)) )
))
(declare-datatypes ((ValueCell!4264 0))(
  ( (ValueCellFull!4264 (v!6849 V!13391)) (EmptyCell!4264) )
))
(declare-datatypes ((array!22347 0))(
  ( (array!22348 (arr!10642 (Array (_ BitVec 32) ValueCell!4264)) (size!10994 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22347)

(declare-datatypes ((array!22349 0))(
  ( (array!22350 (arr!10643 (Array (_ BitVec 32) (_ BitVec 64))) (size!10995 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22349)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!381185 (= res!216538 (and (= (size!10994 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10995 _keys!658) (size!10994 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381186 () Bool)

(declare-fun res!216541 () Bool)

(assert (=> b!381186 (=> (not res!216541) (not e!231773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22349 (_ BitVec 32)) Bool)

(assert (=> b!381186 (= res!216541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381187 () Bool)

(declare-fun e!231776 () Bool)

(declare-fun tp_is_empty!9215 () Bool)

(assert (=> b!381187 (= e!231776 tp_is_empty!9215)))

(declare-fun b!381188 () Bool)

(declare-fun res!216546 () Bool)

(assert (=> b!381188 (=> (not res!216546) (not e!231773))))

(declare-datatypes ((List!6079 0))(
  ( (Nil!6076) (Cons!6075 (h!6931 (_ BitVec 64)) (t!11229 List!6079)) )
))
(declare-fun arrayNoDuplicates!0 (array!22349 (_ BitVec 32) List!6079) Bool)

(assert (=> b!381188 (= res!216546 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6076))))

(declare-fun b!381189 () Bool)

(declare-fun e!231774 () Bool)

(assert (=> b!381189 (= e!231774 tp_is_empty!9215)))

(declare-fun b!381190 () Bool)

(declare-fun e!231779 () Bool)

(declare-fun mapRes!15387 () Bool)

(assert (=> b!381190 (= e!231779 (and e!231776 mapRes!15387))))

(declare-fun condMapEmpty!15387 () Bool)

(declare-fun mapDefault!15387 () ValueCell!4264)

