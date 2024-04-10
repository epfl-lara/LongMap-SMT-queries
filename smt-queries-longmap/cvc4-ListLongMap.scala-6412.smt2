; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82272 () Bool)

(assert start!82272)

(declare-fun b_free!18545 () Bool)

(declare-fun b_next!18545 () Bool)

(assert (=> start!82272 (= b_free!18545 (not b_next!18545))))

(declare-fun tp!64595 () Bool)

(declare-fun b_and!30033 () Bool)

(assert (=> start!82272 (= tp!64595 b_and!30033)))

(declare-fun mapNonEmpty!33856 () Bool)

(declare-fun mapRes!33856 () Bool)

(declare-fun tp!64596 () Bool)

(declare-fun e!540658 () Bool)

(assert (=> mapNonEmpty!33856 (= mapRes!33856 (and tp!64596 e!540658))))

(declare-fun mapKey!33856 () (_ BitVec 32))

(declare-datatypes ((V!33317 0))(
  ( (V!33318 (val!10676 Int)) )
))
(declare-datatypes ((ValueCell!10144 0))(
  ( (ValueCellFull!10144 (v!13233 V!33317)) (EmptyCell!10144) )
))
(declare-fun mapValue!33856 () ValueCell!10144)

(declare-datatypes ((array!58599 0))(
  ( (array!58600 (arr!28173 (Array (_ BitVec 32) ValueCell!10144)) (size!28652 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58599)

(declare-fun mapRest!33856 () (Array (_ BitVec 32) ValueCell!10144))

(assert (=> mapNonEmpty!33856 (= (arr!28173 _values!1386) (store mapRest!33856 mapKey!33856 mapValue!33856))))

(declare-fun b!959063 () Bool)

(declare-fun res!641974 () Bool)

(declare-fun e!540656 () Bool)

(assert (=> b!959063 (=> (not res!641974) (not e!540656))))

(declare-datatypes ((array!58601 0))(
  ( (array!58602 (arr!28174 (Array (_ BitVec 32) (_ BitVec 64))) (size!28653 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58601)

(declare-datatypes ((List!19587 0))(
  ( (Nil!19584) (Cons!19583 (h!20745 (_ BitVec 64)) (t!27950 List!19587)) )
))
(declare-fun arrayNoDuplicates!0 (array!58601 (_ BitVec 32) List!19587) Bool)

(assert (=> b!959063 (= res!641974 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19584))))

(declare-fun b!959064 () Bool)

(declare-fun res!641970 () Bool)

(assert (=> b!959064 (=> (not res!641970) (not e!540656))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!959064 (= res!641970 (and (= (size!28652 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28653 _keys!1668) (size!28652 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959065 () Bool)

(declare-fun res!641969 () Bool)

(assert (=> b!959065 (=> (not res!641969) (not e!540656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58601 (_ BitVec 32)) Bool)

(assert (=> b!959065 (= res!641969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959066 () Bool)

(declare-fun e!540659 () Bool)

(declare-fun tp_is_empty!21251 () Bool)

(assert (=> b!959066 (= e!540659 tp_is_empty!21251)))

(declare-fun b!959067 () Bool)

(declare-fun res!641973 () Bool)

(assert (=> b!959067 (=> (not res!641973) (not e!540656))))

(declare-fun minValue!1328 () V!33317)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33317)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13768 0))(
  ( (tuple2!13769 (_1!6895 (_ BitVec 64)) (_2!6895 V!33317)) )
))
(declare-datatypes ((List!19588 0))(
  ( (Nil!19585) (Cons!19584 (h!20746 tuple2!13768) (t!27951 List!19588)) )
))
(declare-datatypes ((ListLongMap!12465 0))(
  ( (ListLongMap!12466 (toList!6248 List!19588)) )
))
(declare-fun contains!5349 (ListLongMap!12465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3481 (array!58601 array!58599 (_ BitVec 32) (_ BitVec 32) V!33317 V!33317 (_ BitVec 32) Int) ListLongMap!12465)

(assert (=> b!959067 (= res!641973 (contains!5349 (getCurrentListMap!3481 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28174 _keys!1668) i!793)))))

(declare-fun b!959068 () Bool)

(assert (=> b!959068 (= e!540656 (not true))))

(assert (=> b!959068 (contains!5349 (getCurrentListMap!3481 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28174 _keys!1668) i!793))))

(declare-datatypes ((Unit!32171 0))(
  ( (Unit!32172) )
))
(declare-fun lt!430509 () Unit!32171)

(declare-fun lemmaInListMapFromThenInFromSmaller!7 (array!58601 array!58599 (_ BitVec 32) (_ BitVec 32) V!33317 V!33317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32171)

(assert (=> b!959068 (= lt!430509 (lemmaInListMapFromThenInFromSmaller!7 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959069 () Bool)

(declare-fun res!641971 () Bool)

(assert (=> b!959069 (=> (not res!641971) (not e!540656))))

(assert (=> b!959069 (= res!641971 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28653 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28653 _keys!1668))))))

(declare-fun mapIsEmpty!33856 () Bool)

(assert (=> mapIsEmpty!33856 mapRes!33856))

(declare-fun b!959070 () Bool)

(assert (=> b!959070 (= e!540658 tp_is_empty!21251)))

(declare-fun b!959071 () Bool)

(declare-fun e!540657 () Bool)

(assert (=> b!959071 (= e!540657 (and e!540659 mapRes!33856))))

(declare-fun condMapEmpty!33856 () Bool)

(declare-fun mapDefault!33856 () ValueCell!10144)

