; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77616 () Bool)

(assert start!77616)

(declare-fun b_free!16201 () Bool)

(declare-fun b_next!16201 () Bool)

(assert (=> start!77616 (= b_free!16201 (not b_next!16201))))

(declare-fun tp!56864 () Bool)

(declare-fun b_and!26567 () Bool)

(assert (=> start!77616 (= tp!56864 b_and!26567)))

(declare-fun b!904659 () Bool)

(declare-fun res!610418 () Bool)

(declare-fun e!506927 () Bool)

(assert (=> b!904659 (=> (not res!610418) (not e!506927))))

(declare-datatypes ((array!53282 0))(
  ( (array!53283 (arr!25600 (Array (_ BitVec 32) (_ BitVec 64))) (size!26059 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53282)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53282 (_ BitVec 32)) Bool)

(assert (=> b!904659 (= res!610418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!610417 () Bool)

(assert (=> start!77616 (=> (not res!610417) (not e!506927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77616 (= res!610417 (validMask!0 mask!1756))))

(assert (=> start!77616 e!506927))

(declare-datatypes ((V!29791 0))(
  ( (V!29792 (val!9360 Int)) )
))
(declare-datatypes ((ValueCell!8828 0))(
  ( (ValueCellFull!8828 (v!11865 V!29791)) (EmptyCell!8828) )
))
(declare-datatypes ((array!53284 0))(
  ( (array!53285 (arr!25601 (Array (_ BitVec 32) ValueCell!8828)) (size!26060 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53284)

(declare-fun e!506928 () Bool)

(declare-fun array_inv!20056 (array!53284) Bool)

(assert (=> start!77616 (and (array_inv!20056 _values!1152) e!506928)))

(assert (=> start!77616 tp!56864))

(assert (=> start!77616 true))

(declare-fun tp_is_empty!18619 () Bool)

(assert (=> start!77616 tp_is_empty!18619))

(declare-fun array_inv!20057 (array!53282) Bool)

(assert (=> start!77616 (array_inv!20057 _keys!1386)))

(declare-fun mapNonEmpty!29641 () Bool)

(declare-fun mapRes!29641 () Bool)

(declare-fun tp!56865 () Bool)

(declare-fun e!506926 () Bool)

(assert (=> mapNonEmpty!29641 (= mapRes!29641 (and tp!56865 e!506926))))

(declare-fun mapValue!29641 () ValueCell!8828)

(declare-fun mapKey!29641 () (_ BitVec 32))

(declare-fun mapRest!29641 () (Array (_ BitVec 32) ValueCell!8828))

(assert (=> mapNonEmpty!29641 (= (arr!25601 _values!1152) (store mapRest!29641 mapKey!29641 mapValue!29641))))

(declare-fun b!904660 () Bool)

(assert (=> b!904660 (= e!506926 tp_is_empty!18619)))

(declare-fun b!904661 () Bool)

(declare-fun e!506924 () Bool)

(assert (=> b!904661 (= e!506928 (and e!506924 mapRes!29641))))

(declare-fun condMapEmpty!29641 () Bool)

(declare-fun mapDefault!29641 () ValueCell!8828)

