; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43378 () Bool)

(assert start!43378)

(declare-fun b_free!12205 () Bool)

(declare-fun b_next!12205 () Bool)

(assert (=> start!43378 (= b_free!12205 (not b_next!12205))))

(declare-fun tp!42892 () Bool)

(declare-fun b_and!20961 () Bool)

(assert (=> start!43378 (= tp!42892 b_and!20961)))

(declare-fun b!480594 () Bool)

(declare-fun e!282782 () Bool)

(declare-fun tp_is_empty!13717 () Bool)

(assert (=> b!480594 (= e!282782 tp_is_empty!13717)))

(declare-fun mapIsEmpty!22279 () Bool)

(declare-fun mapRes!22279 () Bool)

(assert (=> mapIsEmpty!22279 mapRes!22279))

(declare-fun res!286602 () Bool)

(declare-fun e!282778 () Bool)

(assert (=> start!43378 (=> (not res!286602) (not e!282778))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43378 (= res!286602 (validMask!0 mask!2352))))

(assert (=> start!43378 e!282778))

(assert (=> start!43378 true))

(assert (=> start!43378 tp_is_empty!13717))

(declare-datatypes ((V!19361 0))(
  ( (V!19362 (val!6906 Int)) )
))
(declare-datatypes ((ValueCell!6497 0))(
  ( (ValueCellFull!6497 (v!9197 V!19361)) (EmptyCell!6497) )
))
(declare-datatypes ((array!31099 0))(
  ( (array!31100 (arr!14954 (Array (_ BitVec 32) ValueCell!6497)) (size!15312 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31099)

(declare-fun e!282783 () Bool)

(declare-fun array_inv!10784 (array!31099) Bool)

(assert (=> start!43378 (and (array_inv!10784 _values!1516) e!282783)))

(assert (=> start!43378 tp!42892))

(declare-datatypes ((array!31101 0))(
  ( (array!31102 (arr!14955 (Array (_ BitVec 32) (_ BitVec 64))) (size!15313 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31101)

(declare-fun array_inv!10785 (array!31101) Bool)

(assert (=> start!43378 (array_inv!10785 _keys!1874)))

(declare-fun mapNonEmpty!22279 () Bool)

(declare-fun tp!42891 () Bool)

(declare-fun e!282781 () Bool)

(assert (=> mapNonEmpty!22279 (= mapRes!22279 (and tp!42891 e!282781))))

(declare-fun mapRest!22279 () (Array (_ BitVec 32) ValueCell!6497))

(declare-fun mapKey!22279 () (_ BitVec 32))

(declare-fun mapValue!22279 () ValueCell!6497)

(assert (=> mapNonEmpty!22279 (= (arr!14954 _values!1516) (store mapRest!22279 mapKey!22279 mapValue!22279))))

(declare-fun b!480595 () Bool)

(declare-fun res!286603 () Bool)

(assert (=> b!480595 (=> (not res!286603) (not e!282778))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480595 (= res!286603 (validKeyInArray!0 k!1332))))

(declare-fun b!480596 () Bool)

(declare-fun res!286605 () Bool)

(assert (=> b!480596 (=> (not res!286605) (not e!282778))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!480596 (= res!286605 (and (= (size!15312 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15313 _keys!1874) (size!15312 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480597 () Bool)

(assert (=> b!480597 (= e!282781 tp_is_empty!13717)))

(declare-fun b!480598 () Bool)

(declare-fun res!286601 () Bool)

(assert (=> b!480598 (=> (not res!286601) (not e!282778))))

(declare-datatypes ((List!9139 0))(
  ( (Nil!9136) (Cons!9135 (h!9991 (_ BitVec 64)) (t!15349 List!9139)) )
))
(declare-fun arrayNoDuplicates!0 (array!31101 (_ BitVec 32) List!9139) Bool)

(assert (=> b!480598 (= res!286601 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9136))))

(declare-fun b!480599 () Bool)

(assert (=> b!480599 (= e!282778 (not true))))

(declare-fun lt!218178 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31101 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480599 (= lt!218178 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!282780 () Bool)

(assert (=> b!480599 e!282780))

(declare-fun c!57793 () Bool)

(assert (=> b!480599 (= c!57793 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19361)

(declare-datatypes ((Unit!14092 0))(
  ( (Unit!14093) )
))
(declare-fun lt!218179 () Unit!14092)

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19361)

(declare-fun lemmaKeyInListMapIsInArray!119 (array!31101 array!31099 (_ BitVec 32) (_ BitVec 32) V!19361 V!19361 (_ BitVec 64) Int) Unit!14092)

(assert (=> b!480599 (= lt!218179 (lemmaKeyInListMapIsInArray!119 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!480600 () Bool)

(declare-fun arrayContainsKey!0 (array!31101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480600 (= e!282780 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!480601 () Bool)

(declare-fun res!286600 () Bool)

(assert (=> b!480601 (=> (not res!286600) (not e!282778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31101 (_ BitVec 32)) Bool)

(assert (=> b!480601 (= res!286600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480602 () Bool)

(declare-fun res!286604 () Bool)

(assert (=> b!480602 (=> (not res!286604) (not e!282778))))

(declare-datatypes ((tuple2!9062 0))(
  ( (tuple2!9063 (_1!4542 (_ BitVec 64)) (_2!4542 V!19361)) )
))
(declare-datatypes ((List!9140 0))(
  ( (Nil!9137) (Cons!9136 (h!9992 tuple2!9062) (t!15350 List!9140)) )
))
(declare-datatypes ((ListLongMap!7975 0))(
  ( (ListLongMap!7976 (toList!4003 List!9140)) )
))
(declare-fun contains!2615 (ListLongMap!7975 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2322 (array!31101 array!31099 (_ BitVec 32) (_ BitVec 32) V!19361 V!19361 (_ BitVec 32) Int) ListLongMap!7975)

(assert (=> b!480602 (= res!286604 (contains!2615 (getCurrentListMap!2322 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!480603 () Bool)

(assert (=> b!480603 (= e!282783 (and e!282782 mapRes!22279))))

(declare-fun condMapEmpty!22279 () Bool)

(declare-fun mapDefault!22279 () ValueCell!6497)

