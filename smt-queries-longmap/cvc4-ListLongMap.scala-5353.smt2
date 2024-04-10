; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71696 () Bool)

(assert start!71696)

(declare-fun b_free!13529 () Bool)

(declare-fun b_next!13529 () Bool)

(assert (=> start!71696 (= b_free!13529 (not b_next!13529))))

(declare-fun tp!47383 () Bool)

(declare-fun b_and!22615 () Bool)

(assert (=> start!71696 (= tp!47383 b_and!22615)))

(declare-fun mapIsEmpty!24521 () Bool)

(declare-fun mapRes!24521 () Bool)

(assert (=> mapIsEmpty!24521 mapRes!24521))

(declare-fun b!833833 () Bool)

(declare-fun e!465209 () Bool)

(declare-fun e!465207 () Bool)

(assert (=> b!833833 (= e!465209 e!465207)))

(declare-fun res!566991 () Bool)

(assert (=> b!833833 (=> res!566991 e!465207)))

(declare-datatypes ((V!25319 0))(
  ( (V!25320 (val!7667 Int)) )
))
(declare-datatypes ((tuple2!10182 0))(
  ( (tuple2!10183 (_1!5102 (_ BitVec 64)) (_2!5102 V!25319)) )
))
(declare-datatypes ((List!15971 0))(
  ( (Nil!15968) (Cons!15967 (h!17098 tuple2!10182) (t!22342 List!15971)) )
))
(declare-datatypes ((ListLongMap!9005 0))(
  ( (ListLongMap!9006 (toList!4518 List!15971)) )
))
(declare-fun lt!378620 () ListLongMap!9005)

(declare-fun lt!378627 () ListLongMap!9005)

(declare-fun lt!378631 () tuple2!10182)

(declare-fun lt!378625 () tuple2!10182)

(declare-fun +!1996 (ListLongMap!9005 tuple2!10182) ListLongMap!9005)

(assert (=> b!833833 (= res!566991 (not (= lt!378627 (+!1996 (+!1996 lt!378620 lt!378631) lt!378625))))))

(declare-fun lt!378623 () ListLongMap!9005)

(declare-fun lt!378621 () ListLongMap!9005)

(assert (=> b!833833 (and (= lt!378623 lt!378621) (= lt!378627 lt!378621) (= lt!378627 lt!378623))))

(declare-fun lt!378622 () ListLongMap!9005)

(assert (=> b!833833 (= lt!378621 (+!1996 lt!378622 lt!378631))))

(declare-fun lt!378624 () ListLongMap!9005)

(assert (=> b!833833 (= lt!378623 (+!1996 lt!378624 lt!378631))))

(declare-fun zeroValueBefore!34 () V!25319)

(declare-fun zeroValueAfter!34 () V!25319)

(declare-datatypes ((Unit!28579 0))(
  ( (Unit!28580) )
))
(declare-fun lt!378626 () Unit!28579)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!248 (ListLongMap!9005 (_ BitVec 64) V!25319 V!25319) Unit!28579)

(assert (=> b!833833 (= lt!378626 (addSameAsAddTwiceSameKeyDiffValues!248 lt!378624 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!465210 () Bool)

(assert (=> b!833833 e!465210))

(declare-fun res!566992 () Bool)

(assert (=> b!833833 (=> (not res!566992) (not e!465210))))

(declare-fun lt!378619 () ListLongMap!9005)

(assert (=> b!833833 (= res!566992 (= lt!378619 lt!378622))))

(declare-fun lt!378629 () tuple2!10182)

(assert (=> b!833833 (= lt!378622 (+!1996 lt!378624 lt!378629))))

(assert (=> b!833833 (= lt!378624 (+!1996 lt!378620 lt!378625))))

(assert (=> b!833833 (= lt!378631 (tuple2!10183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465202 () Bool)

(assert (=> b!833833 e!465202))

(declare-fun res!566995 () Bool)

(assert (=> b!833833 (=> (not res!566995) (not e!465202))))

(assert (=> b!833833 (= res!566995 (= lt!378619 (+!1996 (+!1996 lt!378620 lt!378629) lt!378625)))))

(declare-fun minValue!754 () V!25319)

(assert (=> b!833833 (= lt!378625 (tuple2!10183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833833 (= lt!378629 (tuple2!10183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46652 0))(
  ( (array!46653 (arr!22360 (Array (_ BitVec 32) (_ BitVec 64))) (size!22781 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46652)

(declare-datatypes ((ValueCell!7204 0))(
  ( (ValueCellFull!7204 (v!10115 V!25319)) (EmptyCell!7204) )
))
(declare-datatypes ((array!46654 0))(
  ( (array!46655 (arr!22361 (Array (_ BitVec 32) ValueCell!7204)) (size!22782 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46654)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2611 (array!46652 array!46654 (_ BitVec 32) (_ BitVec 32) V!25319 V!25319 (_ BitVec 32) Int) ListLongMap!9005)

(assert (=> b!833833 (= lt!378627 (getCurrentListMap!2611 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!833833 (= lt!378619 (getCurrentListMap!2611 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24521 () Bool)

(declare-fun tp!47384 () Bool)

(declare-fun e!465208 () Bool)

(assert (=> mapNonEmpty!24521 (= mapRes!24521 (and tp!47384 e!465208))))

(declare-fun mapKey!24521 () (_ BitVec 32))

(declare-fun mapValue!24521 () ValueCell!7204)

(declare-fun mapRest!24521 () (Array (_ BitVec 32) ValueCell!7204))

(assert (=> mapNonEmpty!24521 (= (arr!22361 _values!788) (store mapRest!24521 mapKey!24521 mapValue!24521))))

(declare-fun b!833834 () Bool)

(declare-fun res!566996 () Bool)

(declare-fun e!465206 () Bool)

(assert (=> b!833834 (=> (not res!566996) (not e!465206))))

(declare-datatypes ((List!15972 0))(
  ( (Nil!15969) (Cons!15968 (h!17099 (_ BitVec 64)) (t!22343 List!15972)) )
))
(declare-fun arrayNoDuplicates!0 (array!46652 (_ BitVec 32) List!15972) Bool)

(assert (=> b!833834 (= res!566996 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15969))))

(declare-fun b!833835 () Bool)

(assert (=> b!833835 (= e!465207 (= (+!1996 lt!378619 lt!378631) lt!378627))))

(declare-fun lt!378628 () ListLongMap!9005)

(declare-fun b!833836 () Bool)

(assert (=> b!833836 (= e!465202 (= lt!378627 (+!1996 (+!1996 lt!378628 (tuple2!10183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378625)))))

(declare-fun b!833837 () Bool)

(declare-fun e!465204 () Bool)

(declare-fun e!465205 () Bool)

(assert (=> b!833837 (= e!465204 (and e!465205 mapRes!24521))))

(declare-fun condMapEmpty!24521 () Bool)

(declare-fun mapDefault!24521 () ValueCell!7204)

