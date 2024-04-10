; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82298 () Bool)

(assert start!82298)

(declare-fun b_free!18571 () Bool)

(declare-fun b_next!18571 () Bool)

(assert (=> start!82298 (= b_free!18571 (not b_next!18571))))

(declare-fun tp!64674 () Bool)

(declare-fun b_and!30059 () Bool)

(assert (=> start!82298 (= tp!64674 b_and!30059)))

(declare-fun b!959452 () Bool)

(declare-fun res!642246 () Bool)

(declare-fun e!540853 () Bool)

(assert (=> b!959452 (=> (not res!642246) (not e!540853))))

(declare-datatypes ((array!58647 0))(
  ( (array!58648 (arr!28197 (Array (_ BitVec 32) (_ BitVec 64))) (size!28676 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58647)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959452 (= res!642246 (validKeyInArray!0 (select (arr!28197 _keys!1668) i!793)))))

(declare-fun b!959454 () Bool)

(assert (=> b!959454 (= e!540853 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33353 0))(
  ( (V!33354 (val!10689 Int)) )
))
(declare-fun minValue!1328 () V!33353)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10157 0))(
  ( (ValueCellFull!10157 (v!13246 V!33353)) (EmptyCell!10157) )
))
(declare-datatypes ((array!58649 0))(
  ( (array!58650 (arr!28198 (Array (_ BitVec 32) ValueCell!10157)) (size!28677 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58649)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33353)

(declare-datatypes ((tuple2!13790 0))(
  ( (tuple2!13791 (_1!6906 (_ BitVec 64)) (_2!6906 V!33353)) )
))
(declare-datatypes ((List!19608 0))(
  ( (Nil!19605) (Cons!19604 (h!20766 tuple2!13790) (t!27971 List!19608)) )
))
(declare-datatypes ((ListLongMap!12487 0))(
  ( (ListLongMap!12488 (toList!6259 List!19608)) )
))
(declare-fun contains!5360 (ListLongMap!12487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3492 (array!58647 array!58649 (_ BitVec 32) (_ BitVec 32) V!33353 V!33353 (_ BitVec 32) Int) ListLongMap!12487)

(assert (=> b!959454 (contains!5360 (getCurrentListMap!3492 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28197 _keys!1668) i!793))))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((Unit!32193 0))(
  ( (Unit!32194) )
))
(declare-fun lt!430548 () Unit!32193)

(declare-fun lemmaInListMapFromThenInFromSmaller!18 (array!58647 array!58649 (_ BitVec 32) (_ BitVec 32) V!33353 V!33353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32193)

(assert (=> b!959454 (= lt!430548 (lemmaInListMapFromThenInFromSmaller!18 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959455 () Bool)

(declare-fun res!642247 () Bool)

(assert (=> b!959455 (=> (not res!642247) (not e!540853))))

(declare-datatypes ((List!19609 0))(
  ( (Nil!19606) (Cons!19605 (h!20767 (_ BitVec 64)) (t!27972 List!19609)) )
))
(declare-fun arrayNoDuplicates!0 (array!58647 (_ BitVec 32) List!19609) Bool)

(assert (=> b!959455 (= res!642247 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19606))))

(declare-fun b!959456 () Bool)

(declare-fun e!540855 () Bool)

(declare-fun tp_is_empty!21277 () Bool)

(assert (=> b!959456 (= e!540855 tp_is_empty!21277)))

(declare-fun b!959457 () Bool)

(declare-fun res!642244 () Bool)

(assert (=> b!959457 (=> (not res!642244) (not e!540853))))

(assert (=> b!959457 (= res!642244 (contains!5360 (getCurrentListMap!3492 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28197 _keys!1668) i!793)))))

(declare-fun b!959458 () Bool)

(declare-fun res!642248 () Bool)

(assert (=> b!959458 (=> (not res!642248) (not e!540853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58647 (_ BitVec 32)) Bool)

(assert (=> b!959458 (= res!642248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33895 () Bool)

(declare-fun mapRes!33895 () Bool)

(assert (=> mapIsEmpty!33895 mapRes!33895))

(declare-fun b!959459 () Bool)

(declare-fun res!642242 () Bool)

(assert (=> b!959459 (=> (not res!642242) (not e!540853))))

(assert (=> b!959459 (= res!642242 (and (= (size!28677 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28676 _keys!1668) (size!28677 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959460 () Bool)

(declare-fun e!540852 () Bool)

(assert (=> b!959460 (= e!540852 tp_is_empty!21277)))

(declare-fun res!642243 () Bool)

(assert (=> start!82298 (=> (not res!642243) (not e!540853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82298 (= res!642243 (validMask!0 mask!2088))))

(assert (=> start!82298 e!540853))

(assert (=> start!82298 true))

(assert (=> start!82298 tp_is_empty!21277))

(declare-fun array_inv!21859 (array!58647) Bool)

(assert (=> start!82298 (array_inv!21859 _keys!1668)))

(declare-fun e!540854 () Bool)

(declare-fun array_inv!21860 (array!58649) Bool)

(assert (=> start!82298 (and (array_inv!21860 _values!1386) e!540854)))

(assert (=> start!82298 tp!64674))

(declare-fun b!959453 () Bool)

(declare-fun res!642245 () Bool)

(assert (=> b!959453 (=> (not res!642245) (not e!540853))))

(assert (=> b!959453 (= res!642245 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28676 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28676 _keys!1668))))))

(declare-fun mapNonEmpty!33895 () Bool)

(declare-fun tp!64673 () Bool)

(assert (=> mapNonEmpty!33895 (= mapRes!33895 (and tp!64673 e!540855))))

(declare-fun mapRest!33895 () (Array (_ BitVec 32) ValueCell!10157))

(declare-fun mapValue!33895 () ValueCell!10157)

(declare-fun mapKey!33895 () (_ BitVec 32))

(assert (=> mapNonEmpty!33895 (= (arr!28198 _values!1386) (store mapRest!33895 mapKey!33895 mapValue!33895))))

(declare-fun b!959461 () Bool)

(assert (=> b!959461 (= e!540854 (and e!540852 mapRes!33895))))

(declare-fun condMapEmpty!33895 () Bool)

(declare-fun mapDefault!33895 () ValueCell!10157)

