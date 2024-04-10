; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78768 () Bool)

(assert start!78768)

(declare-fun b_free!16981 () Bool)

(declare-fun b_next!16981 () Bool)

(assert (=> start!78768 (= b_free!16981 (not b_next!16981))))

(declare-fun tp!59383 () Bool)

(declare-fun b_and!27699 () Bool)

(assert (=> start!78768 (= tp!59383 b_and!27699)))

(declare-fun b!919190 () Bool)

(declare-fun res!619781 () Bool)

(declare-fun e!515959 () Bool)

(assert (=> b!919190 (=> (not res!619781) (not e!515959))))

(declare-datatypes ((array!54962 0))(
  ( (array!54963 (arr!26426 (Array (_ BitVec 32) (_ BitVec 64))) (size!26885 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54962)

(declare-datatypes ((List!18536 0))(
  ( (Nil!18533) (Cons!18532 (h!19678 (_ BitVec 64)) (t!26247 List!18536)) )
))
(declare-fun arrayNoDuplicates!0 (array!54962 (_ BitVec 32) List!18536) Bool)

(assert (=> b!919190 (= res!619781 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18533))))

(declare-fun b!919191 () Bool)

(declare-fun res!619788 () Bool)

(assert (=> b!919191 (=> (not res!619788) (not e!515959))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54962 (_ BitVec 32)) Bool)

(assert (=> b!919191 (= res!619788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919192 () Bool)

(declare-fun res!619787 () Bool)

(assert (=> b!919192 (=> (not res!619787) (not e!515959))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919192 (= res!619787 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26885 _keys!1487))))))

(declare-fun b!919193 () Bool)

(declare-fun e!515964 () Bool)

(declare-fun tp_is_empty!19489 () Bool)

(assert (=> b!919193 (= e!515964 tp_is_empty!19489)))

(declare-fun b!919194 () Bool)

(declare-fun e!515963 () Bool)

(assert (=> b!919194 (= e!515963 tp_is_empty!19489)))

(declare-fun mapNonEmpty!30990 () Bool)

(declare-fun mapRes!30990 () Bool)

(declare-fun tp!59384 () Bool)

(assert (=> mapNonEmpty!30990 (= mapRes!30990 (and tp!59384 e!515963))))

(declare-datatypes ((V!30951 0))(
  ( (V!30952 (val!9795 Int)) )
))
(declare-datatypes ((ValueCell!9263 0))(
  ( (ValueCellFull!9263 (v!12313 V!30951)) (EmptyCell!9263) )
))
(declare-fun mapValue!30990 () ValueCell!9263)

(declare-datatypes ((array!54964 0))(
  ( (array!54965 (arr!26427 (Array (_ BitVec 32) ValueCell!9263)) (size!26886 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54964)

(declare-fun mapKey!30990 () (_ BitVec 32))

(declare-fun mapRest!30990 () (Array (_ BitVec 32) ValueCell!9263))

(assert (=> mapNonEmpty!30990 (= (arr!26427 _values!1231) (store mapRest!30990 mapKey!30990 mapValue!30990))))

(declare-fun b!919195 () Bool)

(declare-fun e!515962 () Bool)

(declare-fun e!515965 () Bool)

(assert (=> b!919195 (= e!515962 e!515965)))

(declare-fun res!619785 () Bool)

(assert (=> b!919195 (=> (not res!619785) (not e!515965))))

(declare-fun lt!412576 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919195 (= res!619785 (validKeyInArray!0 lt!412576))))

(assert (=> b!919195 (= lt!412576 (select (arr!26426 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919196 () Bool)

(assert (=> b!919196 (= e!515959 e!515962)))

(declare-fun res!619783 () Bool)

(assert (=> b!919196 (=> (not res!619783) (not e!515962))))

(declare-datatypes ((tuple2!12732 0))(
  ( (tuple2!12733 (_1!6377 (_ BitVec 64)) (_2!6377 V!30951)) )
))
(declare-datatypes ((List!18537 0))(
  ( (Nil!18534) (Cons!18533 (h!19679 tuple2!12732) (t!26248 List!18537)) )
))
(declare-datatypes ((ListLongMap!11429 0))(
  ( (ListLongMap!11430 (toList!5730 List!18537)) )
))
(declare-fun lt!412578 () ListLongMap!11429)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4776 (ListLongMap!11429 (_ BitVec 64)) Bool)

(assert (=> b!919196 (= res!619783 (contains!4776 lt!412578 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30951)

(declare-fun minValue!1173 () V!30951)

(declare-fun getCurrentListMap!2986 (array!54962 array!54964 (_ BitVec 32) (_ BitVec 32) V!30951 V!30951 (_ BitVec 32) Int) ListLongMap!11429)

(assert (=> b!919196 (= lt!412578 (getCurrentListMap!2986 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!30990 () Bool)

(assert (=> mapIsEmpty!30990 mapRes!30990))

(declare-fun b!919197 () Bool)

(declare-fun res!619784 () Bool)

(assert (=> b!919197 (=> (not res!619784) (not e!515959))))

(assert (=> b!919197 (= res!619784 (and (= (size!26886 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26885 _keys!1487) (size!26886 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919198 () Bool)

(assert (=> b!919198 (= e!515965 (not true))))

(assert (=> b!919198 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18533)))

(declare-datatypes ((Unit!31030 0))(
  ( (Unit!31031) )
))
(declare-fun lt!412577 () Unit!31030)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54962 (_ BitVec 32) (_ BitVec 32)) Unit!31030)

(assert (=> b!919198 (= lt!412577 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412581 () tuple2!12732)

(declare-fun +!2641 (ListLongMap!11429 tuple2!12732) ListLongMap!11429)

(assert (=> b!919198 (contains!4776 (+!2641 lt!412578 lt!412581) k!1099)))

(declare-fun lt!412579 () V!30951)

(declare-fun lt!412580 () Unit!31030)

(declare-fun addStillContains!365 (ListLongMap!11429 (_ BitVec 64) V!30951 (_ BitVec 64)) Unit!31030)

(assert (=> b!919198 (= lt!412580 (addStillContains!365 lt!412578 lt!412576 lt!412579 k!1099))))

(assert (=> b!919198 (= (getCurrentListMap!2986 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2641 (getCurrentListMap!2986 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412581))))

(assert (=> b!919198 (= lt!412581 (tuple2!12733 lt!412576 lt!412579))))

(declare-fun get!13858 (ValueCell!9263 V!30951) V!30951)

(declare-fun dynLambda!1430 (Int (_ BitVec 64)) V!30951)

(assert (=> b!919198 (= lt!412579 (get!13858 (select (arr!26427 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1430 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412582 () Unit!31030)

(declare-fun lemmaListMapRecursiveValidKeyArray!31 (array!54962 array!54964 (_ BitVec 32) (_ BitVec 32) V!30951 V!30951 (_ BitVec 32) Int) Unit!31030)

(assert (=> b!919198 (= lt!412582 (lemmaListMapRecursiveValidKeyArray!31 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!619786 () Bool)

(assert (=> start!78768 (=> (not res!619786) (not e!515959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78768 (= res!619786 (validMask!0 mask!1881))))

(assert (=> start!78768 e!515959))

(assert (=> start!78768 true))

(assert (=> start!78768 tp_is_empty!19489))

(declare-fun e!515960 () Bool)

(declare-fun array_inv!20596 (array!54964) Bool)

(assert (=> start!78768 (and (array_inv!20596 _values!1231) e!515960)))

(assert (=> start!78768 tp!59383))

(declare-fun array_inv!20597 (array!54962) Bool)

(assert (=> start!78768 (array_inv!20597 _keys!1487)))

(declare-fun b!919199 () Bool)

(declare-fun res!619780 () Bool)

(assert (=> b!919199 (=> (not res!619780) (not e!515962))))

(assert (=> b!919199 (= res!619780 (validKeyInArray!0 k!1099))))

(declare-fun b!919200 () Bool)

(declare-fun res!619789 () Bool)

(assert (=> b!919200 (=> (not res!619789) (not e!515962))))

(assert (=> b!919200 (= res!619789 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919201 () Bool)

(assert (=> b!919201 (= e!515960 (and e!515964 mapRes!30990))))

(declare-fun condMapEmpty!30990 () Bool)

(declare-fun mapDefault!30990 () ValueCell!9263)

