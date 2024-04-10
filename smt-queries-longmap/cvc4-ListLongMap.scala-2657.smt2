; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39764 () Bool)

(assert start!39764)

(declare-fun b_free!10031 () Bool)

(declare-fun b_next!10031 () Bool)

(assert (=> start!39764 (= b_free!10031 (not b_next!10031))))

(declare-fun tp!35621 () Bool)

(declare-fun b_and!17721 () Bool)

(assert (=> start!39764 (= tp!35621 b_and!17721)))

(declare-fun b!428255 () Bool)

(declare-fun e!253818 () Bool)

(declare-fun tp_is_empty!11183 () Bool)

(assert (=> b!428255 (= e!253818 tp_is_empty!11183)))

(declare-fun b!428256 () Bool)

(declare-fun res!251364 () Bool)

(declare-fun e!253817 () Bool)

(assert (=> b!428256 (=> (not res!251364) (not e!253817))))

(declare-datatypes ((array!26203 0))(
  ( (array!26204 (arr!12551 (Array (_ BitVec 32) (_ BitVec 64))) (size!12903 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26203)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26203 (_ BitVec 32)) Bool)

(assert (=> b!428256 (= res!251364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428257 () Bool)

(declare-fun res!251359 () Bool)

(declare-fun e!253819 () Bool)

(assert (=> b!428257 (=> (not res!251359) (not e!253819))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428257 (= res!251359 (bvsle from!863 i!563))))

(declare-fun b!428258 () Bool)

(declare-fun e!253820 () Bool)

(assert (=> b!428258 (= e!253819 e!253820)))

(declare-fun res!251368 () Bool)

(assert (=> b!428258 (=> (not res!251368) (not e!253820))))

(assert (=> b!428258 (= res!251368 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16015 0))(
  ( (V!16016 (val!5636 Int)) )
))
(declare-datatypes ((tuple2!7416 0))(
  ( (tuple2!7417 (_1!3719 (_ BitVec 64)) (_2!3719 V!16015)) )
))
(declare-datatypes ((List!7429 0))(
  ( (Nil!7426) (Cons!7425 (h!8281 tuple2!7416) (t!12909 List!7429)) )
))
(declare-datatypes ((ListLongMap!6329 0))(
  ( (ListLongMap!6330 (toList!3180 List!7429)) )
))
(declare-fun lt!195658 () ListLongMap!6329)

(declare-fun minValue!515 () V!16015)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!195661 () array!26203)

(declare-fun zeroValue!515 () V!16015)

(declare-datatypes ((ValueCell!5248 0))(
  ( (ValueCellFull!5248 (v!7883 V!16015)) (EmptyCell!5248) )
))
(declare-datatypes ((array!26205 0))(
  ( (array!26206 (arr!12552 (Array (_ BitVec 32) ValueCell!5248)) (size!12904 (_ BitVec 32))) )
))
(declare-fun lt!195659 () array!26205)

(declare-fun getCurrentListMapNoExtraKeys!1382 (array!26203 array!26205 (_ BitVec 32) (_ BitVec 32) V!16015 V!16015 (_ BitVec 32) Int) ListLongMap!6329)

(assert (=> b!428258 (= lt!195658 (getCurrentListMapNoExtraKeys!1382 lt!195661 lt!195659 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26205)

(declare-fun v!412 () V!16015)

(assert (=> b!428258 (= lt!195659 (array!26206 (store (arr!12552 _values!549) i!563 (ValueCellFull!5248 v!412)) (size!12904 _values!549)))))

(declare-fun lt!195662 () ListLongMap!6329)

(assert (=> b!428258 (= lt!195662 (getCurrentListMapNoExtraKeys!1382 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428259 () Bool)

(declare-fun e!253814 () Bool)

(assert (=> b!428259 (= e!253814 tp_is_empty!11183)))

(declare-fun b!428260 () Bool)

(declare-fun res!251369 () Bool)

(assert (=> b!428260 (=> (not res!251369) (not e!253819))))

(declare-datatypes ((List!7430 0))(
  ( (Nil!7427) (Cons!7426 (h!8282 (_ BitVec 64)) (t!12910 List!7430)) )
))
(declare-fun arrayNoDuplicates!0 (array!26203 (_ BitVec 32) List!7430) Bool)

(assert (=> b!428260 (= res!251369 (arrayNoDuplicates!0 lt!195661 #b00000000000000000000000000000000 Nil!7427))))

(declare-fun res!251360 () Bool)

(assert (=> start!39764 (=> (not res!251360) (not e!253817))))

(assert (=> start!39764 (= res!251360 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12903 _keys!709))))))

(assert (=> start!39764 e!253817))

(assert (=> start!39764 tp_is_empty!11183))

(assert (=> start!39764 tp!35621))

(assert (=> start!39764 true))

(declare-fun e!253816 () Bool)

(declare-fun array_inv!9150 (array!26205) Bool)

(assert (=> start!39764 (and (array_inv!9150 _values!549) e!253816)))

(declare-fun array_inv!9151 (array!26203) Bool)

(assert (=> start!39764 (array_inv!9151 _keys!709)))

(declare-fun b!428261 () Bool)

(declare-fun res!251362 () Bool)

(assert (=> b!428261 (=> (not res!251362) (not e!253817))))

(assert (=> b!428261 (= res!251362 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12903 _keys!709))))))

(declare-fun b!428262 () Bool)

(declare-fun mapRes!18396 () Bool)

(assert (=> b!428262 (= e!253816 (and e!253818 mapRes!18396))))

(declare-fun condMapEmpty!18396 () Bool)

(declare-fun mapDefault!18396 () ValueCell!5248)

