; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70530 () Bool)

(assert start!70530)

(declare-fun b_free!12857 () Bool)

(declare-fun b_next!12857 () Bool)

(assert (=> start!70530 (= b_free!12857 (not b_next!12857))))

(declare-fun tp!45303 () Bool)

(declare-fun b_and!21687 () Bool)

(assert (=> start!70530 (= tp!45303 b_and!21687)))

(declare-fun b!819335 () Bool)

(declare-fun res!559128 () Bool)

(declare-fun e!454999 () Bool)

(assert (=> b!819335 (=> (not res!559128) (not e!454999))))

(declare-datatypes ((array!45330 0))(
  ( (array!45331 (arr!21719 (Array (_ BitVec 32) (_ BitVec 64))) (size!22140 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45330)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45330 (_ BitVec 32)) Bool)

(assert (=> b!819335 (= res!559128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819336 () Bool)

(declare-fun e!455006 () Bool)

(declare-fun e!455004 () Bool)

(assert (=> b!819336 (= e!455006 e!455004)))

(declare-fun res!559130 () Bool)

(assert (=> b!819336 (=> res!559130 e!455004)))

(declare-datatypes ((V!24423 0))(
  ( (V!24424 (val!7331 Int)) )
))
(declare-datatypes ((tuple2!9646 0))(
  ( (tuple2!9647 (_1!4834 (_ BitVec 64)) (_2!4834 V!24423)) )
))
(declare-datatypes ((List!15474 0))(
  ( (Nil!15471) (Cons!15470 (h!16599 tuple2!9646) (t!21803 List!15474)) )
))
(declare-datatypes ((ListLongMap!8469 0))(
  ( (ListLongMap!8470 (toList!4250 List!15474)) )
))
(declare-fun lt!367643 () ListLongMap!8469)

(declare-fun lt!367636 () tuple2!9646)

(declare-fun lt!367637 () tuple2!9646)

(declare-fun lt!367640 () ListLongMap!8469)

(declare-fun +!1846 (ListLongMap!8469 tuple2!9646) ListLongMap!8469)

(assert (=> b!819336 (= res!559130 (not (= lt!367643 (+!1846 (+!1846 lt!367640 lt!367637) lt!367636))))))

(declare-fun lt!367635 () ListLongMap!8469)

(declare-fun lt!367641 () ListLongMap!8469)

(assert (=> b!819336 (= (+!1846 lt!367635 lt!367636) (+!1846 lt!367641 lt!367636))))

(declare-fun zeroValueBefore!34 () V!24423)

(declare-datatypes ((Unit!27977 0))(
  ( (Unit!27978) )
))
(declare-fun lt!367639 () Unit!27977)

(declare-fun zeroValueAfter!34 () V!24423)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!185 (ListLongMap!8469 (_ BitVec 64) V!24423 V!24423) Unit!27977)

(assert (=> b!819336 (= lt!367639 (addSameAsAddTwiceSameKeyDiffValues!185 lt!367635 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819336 (= lt!367636 (tuple2!9647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455002 () Bool)

(assert (=> b!819336 e!455002))

(declare-fun res!559129 () Bool)

(assert (=> b!819336 (=> (not res!559129) (not e!455002))))

(declare-fun lt!367642 () ListLongMap!8469)

(assert (=> b!819336 (= res!559129 (= lt!367642 lt!367641))))

(assert (=> b!819336 (= lt!367641 (+!1846 lt!367635 lt!367637))))

(assert (=> b!819336 (= lt!367637 (tuple2!9647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24423)

(declare-datatypes ((ValueCell!6868 0))(
  ( (ValueCellFull!6868 (v!9760 V!24423)) (EmptyCell!6868) )
))
(declare-datatypes ((array!45332 0))(
  ( (array!45333 (arr!21720 (Array (_ BitVec 32) ValueCell!6868)) (size!22141 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45332)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2451 (array!45330 array!45332 (_ BitVec 32) (_ BitVec 32) V!24423 V!24423 (_ BitVec 32) Int) ListLongMap!8469)

(assert (=> b!819336 (= lt!367643 (getCurrentListMap!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819336 (= lt!367642 (getCurrentListMap!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819337 () Bool)

(declare-fun res!559125 () Bool)

(assert (=> b!819337 (=> (not res!559125) (not e!454999))))

(declare-datatypes ((List!15475 0))(
  ( (Nil!15472) (Cons!15471 (h!16600 (_ BitVec 64)) (t!21804 List!15475)) )
))
(declare-fun arrayNoDuplicates!0 (array!45330 (_ BitVec 32) List!15475) Bool)

(assert (=> b!819337 (= res!559125 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15472))))

(declare-fun b!819338 () Bool)

(assert (=> b!819338 (= e!455004 (bvsle #b00000000000000000000000000000000 (size!22140 _keys!976)))))

(declare-fun b!819339 () Bool)

(declare-fun e!455005 () Bool)

(declare-fun e!455003 () Bool)

(declare-fun mapRes!23449 () Bool)

(assert (=> b!819339 (= e!455005 (and e!455003 mapRes!23449))))

(declare-fun condMapEmpty!23449 () Bool)

(declare-fun mapDefault!23449 () ValueCell!6868)

