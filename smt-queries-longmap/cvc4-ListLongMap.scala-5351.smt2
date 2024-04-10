; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71684 () Bool)

(assert start!71684)

(declare-fun b_free!13517 () Bool)

(declare-fun b_next!13517 () Bool)

(assert (=> start!71684 (= b_free!13517 (not b_next!13517))))

(declare-fun tp!47348 () Bool)

(declare-fun b_and!22603 () Bool)

(assert (=> start!71684 (= tp!47348 b_and!22603)))

(declare-fun b!833645 () Bool)

(declare-fun e!465053 () Bool)

(declare-fun tp_is_empty!15227 () Bool)

(assert (=> b!833645 (= e!465053 tp_is_empty!15227)))

(declare-fun b!833646 () Bool)

(declare-fun e!465050 () Bool)

(assert (=> b!833646 (= e!465050 tp_is_empty!15227)))

(declare-fun mapIsEmpty!24503 () Bool)

(declare-fun mapRes!24503 () Bool)

(assert (=> mapIsEmpty!24503 mapRes!24503))

(declare-datatypes ((V!25303 0))(
  ( (V!25304 (val!7661 Int)) )
))
(declare-datatypes ((tuple2!10170 0))(
  ( (tuple2!10171 (_1!5096 (_ BitVec 64)) (_2!5096 V!25303)) )
))
(declare-fun lt!378396 () tuple2!10170)

(declare-fun b!833647 () Bool)

(declare-datatypes ((List!15962 0))(
  ( (Nil!15959) (Cons!15958 (h!17089 tuple2!10170) (t!22333 List!15962)) )
))
(declare-datatypes ((ListLongMap!8993 0))(
  ( (ListLongMap!8994 (toList!4512 List!15962)) )
))
(declare-fun lt!378395 () ListLongMap!8993)

(declare-fun lt!378394 () tuple2!10170)

(declare-fun e!465052 () Bool)

(declare-fun lt!378393 () ListLongMap!8993)

(declare-fun +!1990 (ListLongMap!8993 tuple2!10170) ListLongMap!8993)

(assert (=> b!833647 (= e!465052 (= lt!378395 (+!1990 (+!1990 lt!378393 lt!378396) lt!378394)))))

(declare-fun res!566857 () Bool)

(declare-fun e!465054 () Bool)

(assert (=> start!71684 (=> (not res!566857) (not e!465054))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71684 (= res!566857 (validMask!0 mask!1312))))

(assert (=> start!71684 e!465054))

(assert (=> start!71684 tp_is_empty!15227))

(declare-datatypes ((array!46628 0))(
  ( (array!46629 (arr!22348 (Array (_ BitVec 32) (_ BitVec 64))) (size!22769 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46628)

(declare-fun array_inv!17801 (array!46628) Bool)

(assert (=> start!71684 (array_inv!17801 _keys!976)))

(assert (=> start!71684 true))

(declare-datatypes ((ValueCell!7198 0))(
  ( (ValueCellFull!7198 (v!10109 V!25303)) (EmptyCell!7198) )
))
(declare-datatypes ((array!46630 0))(
  ( (array!46631 (arr!22349 (Array (_ BitVec 32) ValueCell!7198)) (size!22770 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46630)

(declare-fun e!465051 () Bool)

(declare-fun array_inv!17802 (array!46630) Bool)

(assert (=> start!71684 (and (array_inv!17802 _values!788) e!465051)))

(assert (=> start!71684 tp!47348))

(declare-fun b!833648 () Bool)

(declare-fun e!465057 () Bool)

(declare-fun lt!378385 () ListLongMap!8993)

(assert (=> b!833648 (= e!465057 (= lt!378395 lt!378385))))

(declare-fun lt!378388 () ListLongMap!8993)

(assert (=> b!833648 (and (= lt!378385 lt!378388) (= lt!378395 lt!378388))))

(declare-fun lt!378390 () ListLongMap!8993)

(assert (=> b!833648 (= lt!378388 (+!1990 lt!378390 lt!378394))))

(declare-fun lt!378389 () ListLongMap!8993)

(assert (=> b!833648 (= lt!378385 (+!1990 lt!378389 lt!378394))))

(declare-fun zeroValueBefore!34 () V!25303)

(declare-datatypes ((Unit!28567 0))(
  ( (Unit!28568) )
))
(declare-fun lt!378397 () Unit!28567)

(declare-fun zeroValueAfter!34 () V!25303)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!243 (ListLongMap!8993 (_ BitVec 64) V!25303 V!25303) Unit!28567)

(assert (=> b!833648 (= lt!378397 (addSameAsAddTwiceSameKeyDiffValues!243 lt!378389 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!833648 e!465052))

(declare-fun res!566855 () Bool)

(assert (=> b!833648 (=> (not res!566855) (not e!465052))))

(declare-fun lt!378386 () ListLongMap!8993)

(assert (=> b!833648 (= res!566855 (= lt!378386 lt!378390))))

(declare-fun lt!378392 () tuple2!10170)

(assert (=> b!833648 (= lt!378390 (+!1990 lt!378389 lt!378392))))

(declare-fun lt!378391 () ListLongMap!8993)

(assert (=> b!833648 (= lt!378389 (+!1990 lt!378391 lt!378396))))

(assert (=> b!833648 (= lt!378394 (tuple2!10171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465056 () Bool)

(assert (=> b!833648 e!465056))

(declare-fun res!566860 () Bool)

(assert (=> b!833648 (=> (not res!566860) (not e!465056))))

(assert (=> b!833648 (= res!566860 (= lt!378386 (+!1990 (+!1990 lt!378391 lt!378392) lt!378396)))))

(declare-fun minValue!754 () V!25303)

(assert (=> b!833648 (= lt!378396 (tuple2!10171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833648 (= lt!378392 (tuple2!10171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2606 (array!46628 array!46630 (_ BitVec 32) (_ BitVec 32) V!25303 V!25303 (_ BitVec 32) Int) ListLongMap!8993)

(assert (=> b!833648 (= lt!378395 (getCurrentListMap!2606 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!833648 (= lt!378386 (getCurrentListMap!2606 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833649 () Bool)

(declare-fun res!566859 () Bool)

(assert (=> b!833649 (=> (not res!566859) (not e!465054))))

(declare-datatypes ((List!15963 0))(
  ( (Nil!15960) (Cons!15959 (h!17090 (_ BitVec 64)) (t!22334 List!15963)) )
))
(declare-fun arrayNoDuplicates!0 (array!46628 (_ BitVec 32) List!15963) Bool)

(assert (=> b!833649 (= res!566859 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15960))))

(declare-fun b!833650 () Bool)

(assert (=> b!833650 (= e!465051 (and e!465050 mapRes!24503))))

(declare-fun condMapEmpty!24503 () Bool)

(declare-fun mapDefault!24503 () ValueCell!7198)

