; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43284 () Bool)

(assert start!43284)

(declare-fun b_free!12151 () Bool)

(declare-fun b_next!12151 () Bool)

(assert (=> start!43284 (= b_free!12151 (not b_next!12151))))

(declare-fun tp!42724 () Bool)

(declare-fun b_and!20903 () Bool)

(assert (=> start!43284 (= tp!42724 b_and!20903)))

(declare-fun b!479552 () Bool)

(declare-fun res!286053 () Bool)

(declare-fun e!282147 () Bool)

(assert (=> b!479552 (=> (not res!286053) (not e!282147))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30997 0))(
  ( (array!30998 (arr!14905 (Array (_ BitVec 32) (_ BitVec 64))) (size!15263 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30997)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19289 0))(
  ( (V!19290 (val!6879 Int)) )
))
(declare-datatypes ((ValueCell!6470 0))(
  ( (ValueCellFull!6470 (v!9168 V!19289)) (EmptyCell!6470) )
))
(declare-datatypes ((array!30999 0))(
  ( (array!31000 (arr!14906 (Array (_ BitVec 32) ValueCell!6470)) (size!15264 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30999)

(assert (=> b!479552 (= res!286053 (and (= (size!15264 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15263 _keys!1874) (size!15264 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22192 () Bool)

(declare-fun mapRes!22192 () Bool)

(assert (=> mapIsEmpty!22192 mapRes!22192))

(declare-fun b!479553 () Bool)

(assert (=> b!479553 (= e!282147 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19289)

(declare-fun lt!217879 () Bool)

(declare-fun zeroValue!1458 () V!19289)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9028 0))(
  ( (tuple2!9029 (_1!4525 (_ BitVec 64)) (_2!4525 V!19289)) )
))
(declare-datatypes ((List!9106 0))(
  ( (Nil!9103) (Cons!9102 (h!9958 tuple2!9028) (t!15312 List!9106)) )
))
(declare-datatypes ((ListLongMap!7941 0))(
  ( (ListLongMap!7942 (toList!3986 List!9106)) )
))
(declare-fun contains!2596 (ListLongMap!7941 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2305 (array!30997 array!30999 (_ BitVec 32) (_ BitVec 32) V!19289 V!19289 (_ BitVec 32) Int) ListLongMap!7941)

(assert (=> b!479553 (= lt!217879 (contains!2596 (getCurrentListMap!2305 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun res!286056 () Bool)

(assert (=> start!43284 (=> (not res!286056) (not e!282147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43284 (= res!286056 (validMask!0 mask!2352))))

(assert (=> start!43284 e!282147))

(assert (=> start!43284 true))

(declare-fun tp_is_empty!13663 () Bool)

(assert (=> start!43284 tp_is_empty!13663))

(declare-fun e!282149 () Bool)

(declare-fun array_inv!10752 (array!30999) Bool)

(assert (=> start!43284 (and (array_inv!10752 _values!1516) e!282149)))

(assert (=> start!43284 tp!42724))

(declare-fun array_inv!10753 (array!30997) Bool)

(assert (=> start!43284 (array_inv!10753 _keys!1874)))

(declare-fun b!479554 () Bool)

(declare-fun e!282146 () Bool)

(assert (=> b!479554 (= e!282146 tp_is_empty!13663)))

(declare-fun mapNonEmpty!22192 () Bool)

(declare-fun tp!42723 () Bool)

(assert (=> mapNonEmpty!22192 (= mapRes!22192 (and tp!42723 e!282146))))

(declare-fun mapRest!22192 () (Array (_ BitVec 32) ValueCell!6470))

(declare-fun mapValue!22192 () ValueCell!6470)

(declare-fun mapKey!22192 () (_ BitVec 32))

(assert (=> mapNonEmpty!22192 (= (arr!14906 _values!1516) (store mapRest!22192 mapKey!22192 mapValue!22192))))

(declare-fun b!479555 () Bool)

(declare-fun res!286054 () Bool)

(assert (=> b!479555 (=> (not res!286054) (not e!282147))))

(declare-datatypes ((List!9107 0))(
  ( (Nil!9104) (Cons!9103 (h!9959 (_ BitVec 64)) (t!15313 List!9107)) )
))
(declare-fun arrayNoDuplicates!0 (array!30997 (_ BitVec 32) List!9107) Bool)

(assert (=> b!479555 (= res!286054 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9104))))

(declare-fun b!479556 () Bool)

(declare-fun e!282148 () Bool)

(assert (=> b!479556 (= e!282149 (and e!282148 mapRes!22192))))

(declare-fun condMapEmpty!22192 () Bool)

(declare-fun mapDefault!22192 () ValueCell!6470)

