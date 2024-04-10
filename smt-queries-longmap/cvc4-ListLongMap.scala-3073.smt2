; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43294 () Bool)

(assert start!43294)

(declare-fun b_free!12161 () Bool)

(declare-fun b_next!12161 () Bool)

(assert (=> start!43294 (= b_free!12161 (not b_next!12161))))

(declare-fun tp!42753 () Bool)

(declare-fun b_and!20913 () Bool)

(assert (=> start!43294 (= tp!42753 b_and!20913)))

(declare-fun b!479657 () Bool)

(declare-fun res!286115 () Bool)

(declare-fun e!282225 () Bool)

(assert (=> b!479657 (=> (not res!286115) (not e!282225))))

(declare-datatypes ((array!31015 0))(
  ( (array!31016 (arr!14914 (Array (_ BitVec 32) (_ BitVec 64))) (size!15272 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31015)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31015 (_ BitVec 32)) Bool)

(assert (=> b!479657 (= res!286115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479659 () Bool)

(declare-fun res!286113 () Bool)

(assert (=> b!479659 (=> (not res!286113) (not e!282225))))

(declare-datatypes ((List!9114 0))(
  ( (Nil!9111) (Cons!9110 (h!9966 (_ BitVec 64)) (t!15320 List!9114)) )
))
(declare-fun arrayNoDuplicates!0 (array!31015 (_ BitVec 32) List!9114) Bool)

(assert (=> b!479659 (= res!286113 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9111))))

(declare-fun b!479660 () Bool)

(declare-fun e!282224 () Bool)

(declare-fun tp_is_empty!13673 () Bool)

(assert (=> b!479660 (= e!282224 tp_is_empty!13673)))

(declare-fun b!479661 () Bool)

(declare-fun res!286116 () Bool)

(assert (=> b!479661 (=> (not res!286116) (not e!282225))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19301 0))(
  ( (V!19302 (val!6884 Int)) )
))
(declare-datatypes ((ValueCell!6475 0))(
  ( (ValueCellFull!6475 (v!9173 V!19301)) (EmptyCell!6475) )
))
(declare-datatypes ((array!31017 0))(
  ( (array!31018 (arr!14915 (Array (_ BitVec 32) ValueCell!6475)) (size!15273 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31017)

(assert (=> b!479661 (= res!286116 (and (= (size!15273 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15272 _keys!1874) (size!15273 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22207 () Bool)

(declare-fun mapRes!22207 () Bool)

(assert (=> mapIsEmpty!22207 mapRes!22207))

(declare-fun mapNonEmpty!22207 () Bool)

(declare-fun tp!42754 () Bool)

(assert (=> mapNonEmpty!22207 (= mapRes!22207 (and tp!42754 e!282224))))

(declare-fun mapRest!22207 () (Array (_ BitVec 32) ValueCell!6475))

(declare-fun mapKey!22207 () (_ BitVec 32))

(declare-fun mapValue!22207 () ValueCell!6475)

(assert (=> mapNonEmpty!22207 (= (arr!14915 _values!1516) (store mapRest!22207 mapKey!22207 mapValue!22207))))

(declare-fun b!479662 () Bool)

(assert (=> b!479662 (= e!282225 false)))

(declare-fun lt!217894 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19301)

(declare-fun zeroValue!1458 () V!19301)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9036 0))(
  ( (tuple2!9037 (_1!4529 (_ BitVec 64)) (_2!4529 V!19301)) )
))
(declare-datatypes ((List!9115 0))(
  ( (Nil!9112) (Cons!9111 (h!9967 tuple2!9036) (t!15321 List!9115)) )
))
(declare-datatypes ((ListLongMap!7949 0))(
  ( (ListLongMap!7950 (toList!3990 List!9115)) )
))
(declare-fun contains!2600 (ListLongMap!7949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2309 (array!31015 array!31017 (_ BitVec 32) (_ BitVec 32) V!19301 V!19301 (_ BitVec 32) Int) ListLongMap!7949)

(assert (=> b!479662 (= lt!217894 (contains!2600 (getCurrentListMap!2309 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!479663 () Bool)

(declare-fun e!282222 () Bool)

(declare-fun e!282223 () Bool)

(assert (=> b!479663 (= e!282222 (and e!282223 mapRes!22207))))

(declare-fun condMapEmpty!22207 () Bool)

(declare-fun mapDefault!22207 () ValueCell!6475)

