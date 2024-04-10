; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39296 () Bool)

(assert start!39296)

(declare-fun b_free!9563 () Bool)

(declare-fun b_next!9563 () Bool)

(assert (=> start!39296 (= b_free!9563 (not b_next!9563))))

(declare-fun tp!34217 () Bool)

(declare-fun b_and!17001 () Bool)

(assert (=> start!39296 (= tp!34217 b_and!17001)))

(declare-fun b!415896 () Bool)

(declare-fun e!248355 () Bool)

(declare-datatypes ((V!15391 0))(
  ( (V!15392 (val!5402 Int)) )
))
(declare-datatypes ((tuple2!7040 0))(
  ( (tuple2!7041 (_1!3531 (_ BitVec 64)) (_2!3531 V!15391)) )
))
(declare-datatypes ((List!7061 0))(
  ( (Nil!7058) (Cons!7057 (h!7913 tuple2!7040) (t!12289 List!7061)) )
))
(declare-datatypes ((ListLongMap!5953 0))(
  ( (ListLongMap!5954 (toList!2992 List!7061)) )
))
(declare-fun call!28868 () ListLongMap!5953)

(declare-fun call!28867 () ListLongMap!5953)

(assert (=> b!415896 (= e!248355 (= call!28868 call!28867))))

(declare-fun mapIsEmpty!17694 () Bool)

(declare-fun mapRes!17694 () Bool)

(assert (=> mapIsEmpty!17694 mapRes!17694))

(declare-fun b!415897 () Bool)

(declare-fun res!242019 () Bool)

(declare-fun e!248352 () Bool)

(assert (=> b!415897 (=> (not res!242019) (not e!248352))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415897 (= res!242019 (validMask!0 mask!1025))))

(declare-fun b!415898 () Bool)

(declare-fun res!242017 () Bool)

(assert (=> b!415898 (=> (not res!242017) (not e!248352))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25287 0))(
  ( (array!25288 (arr!12093 (Array (_ BitVec 32) (_ BitVec 64))) (size!12445 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25287)

(assert (=> b!415898 (= res!242017 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12445 _keys!709))))))

(declare-fun res!242018 () Bool)

(assert (=> start!39296 (=> (not res!242018) (not e!248352))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39296 (= res!242018 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12445 _keys!709))))))

(assert (=> start!39296 e!248352))

(declare-fun tp_is_empty!10715 () Bool)

(assert (=> start!39296 tp_is_empty!10715))

(assert (=> start!39296 tp!34217))

(assert (=> start!39296 true))

(declare-datatypes ((ValueCell!5014 0))(
  ( (ValueCellFull!5014 (v!7649 V!15391)) (EmptyCell!5014) )
))
(declare-datatypes ((array!25289 0))(
  ( (array!25290 (arr!12094 (Array (_ BitVec 32) ValueCell!5014)) (size!12446 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25289)

(declare-fun e!248354 () Bool)

(declare-fun array_inv!8822 (array!25289) Bool)

(assert (=> start!39296 (and (array_inv!8822 _values!549) e!248354)))

(declare-fun array_inv!8823 (array!25287) Bool)

(assert (=> start!39296 (array_inv!8823 _keys!709)))

(declare-fun b!415899 () Bool)

(declare-fun e!248350 () Bool)

(assert (=> b!415899 (= e!248350 tp_is_empty!10715)))

(declare-fun b!415900 () Bool)

(declare-fun e!248357 () Bool)

(assert (=> b!415900 (= e!248354 (and e!248357 mapRes!17694))))

(declare-fun condMapEmpty!17694 () Bool)

(declare-fun mapDefault!17694 () ValueCell!5014)

