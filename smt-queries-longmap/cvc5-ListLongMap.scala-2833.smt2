; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40962 () Bool)

(assert start!40962)

(declare-fun b_free!10897 () Bool)

(declare-fun b_next!10897 () Bool)

(assert (=> start!40962 (= b_free!10897 (not b_next!10897))))

(declare-fun tp!38517 () Bool)

(declare-fun b_and!19039 () Bool)

(assert (=> start!40962 (= tp!38517 b_and!19039)))

(declare-fun b!455807 () Bool)

(declare-fun res!271863 () Bool)

(declare-fun e!266431 () Bool)

(assert (=> b!455807 (=> (not res!271863) (not e!266431))))

(declare-datatypes ((array!28273 0))(
  ( (array!28274 (arr!13580 (Array (_ BitVec 32) (_ BitVec 64))) (size!13932 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28273)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17419 0))(
  ( (V!17420 (val!6162 Int)) )
))
(declare-datatypes ((ValueCell!5774 0))(
  ( (ValueCellFull!5774 (v!8428 V!17419)) (EmptyCell!5774) )
))
(declare-datatypes ((array!28275 0))(
  ( (array!28276 (arr!13581 (Array (_ BitVec 32) ValueCell!5774)) (size!13933 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28275)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!455807 (= res!271863 (and (= (size!13933 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13932 _keys!709) (size!13933 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455808 () Bool)

(declare-fun res!271870 () Bool)

(assert (=> b!455808 (=> (not res!271870) (not e!266431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455808 (= res!271870 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19993 () Bool)

(declare-fun mapRes!19993 () Bool)

(assert (=> mapIsEmpty!19993 mapRes!19993))

(declare-fun b!455809 () Bool)

(declare-fun res!271861 () Bool)

(assert (=> b!455809 (=> (not res!271861) (not e!266431))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455809 (= res!271861 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!455810 () Bool)

(declare-fun e!266429 () Bool)

(assert (=> b!455810 (= e!266431 e!266429)))

(declare-fun res!271864 () Bool)

(assert (=> b!455810 (=> (not res!271864) (not e!266429))))

(declare-fun lt!206409 () array!28273)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28273 (_ BitVec 32)) Bool)

(assert (=> b!455810 (= res!271864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206409 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455810 (= lt!206409 (array!28274 (store (arr!13580 _keys!709) i!563 k!794) (size!13932 _keys!709)))))

(declare-fun b!455811 () Bool)

(declare-fun res!271860 () Bool)

(assert (=> b!455811 (=> (not res!271860) (not e!266429))))

(declare-datatypes ((List!8188 0))(
  ( (Nil!8185) (Cons!8184 (h!9040 (_ BitVec 64)) (t!14016 List!8188)) )
))
(declare-fun arrayNoDuplicates!0 (array!28273 (_ BitVec 32) List!8188) Bool)

(assert (=> b!455811 (= res!271860 (arrayNoDuplicates!0 lt!206409 #b00000000000000000000000000000000 Nil!8185))))

(declare-fun b!455812 () Bool)

(declare-fun res!271865 () Bool)

(assert (=> b!455812 (=> (not res!271865) (not e!266431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455812 (= res!271865 (validKeyInArray!0 k!794))))

(declare-fun b!455813 () Bool)

(declare-fun res!271862 () Bool)

(assert (=> b!455813 (=> (not res!271862) (not e!266431))))

(assert (=> b!455813 (= res!271862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!271866 () Bool)

(assert (=> start!40962 (=> (not res!271866) (not e!266431))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40962 (= res!271866 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13932 _keys!709))))))

(assert (=> start!40962 e!266431))

(declare-fun tp_is_empty!12235 () Bool)

(assert (=> start!40962 tp_is_empty!12235))

(assert (=> start!40962 tp!38517))

(assert (=> start!40962 true))

(declare-fun e!266430 () Bool)

(declare-fun array_inv!9842 (array!28275) Bool)

(assert (=> start!40962 (and (array_inv!9842 _values!549) e!266430)))

(declare-fun array_inv!9843 (array!28273) Bool)

(assert (=> start!40962 (array_inv!9843 _keys!709)))

(declare-fun b!455814 () Bool)

(declare-fun e!266426 () Bool)

(assert (=> b!455814 (= e!266430 (and e!266426 mapRes!19993))))

(declare-fun condMapEmpty!19993 () Bool)

(declare-fun mapDefault!19993 () ValueCell!5774)

