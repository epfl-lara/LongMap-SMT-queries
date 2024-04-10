; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82262 () Bool)

(assert start!82262)

(declare-fun b_free!18535 () Bool)

(declare-fun b_next!18535 () Bool)

(assert (=> start!82262 (= b_free!18535 (not b_next!18535))))

(declare-fun tp!64565 () Bool)

(declare-fun b_and!30023 () Bool)

(assert (=> start!82262 (= tp!64565 b_and!30023)))

(declare-fun b!958912 () Bool)

(declare-fun res!641869 () Bool)

(declare-fun e!540583 () Bool)

(assert (=> b!958912 (=> (not res!641869) (not e!540583))))

(declare-datatypes ((array!58581 0))(
  ( (array!58582 (arr!28164 (Array (_ BitVec 32) (_ BitVec 64))) (size!28643 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58581)

(declare-datatypes ((List!19579 0))(
  ( (Nil!19576) (Cons!19575 (h!20737 (_ BitVec 64)) (t!27942 List!19579)) )
))
(declare-fun arrayNoDuplicates!0 (array!58581 (_ BitVec 32) List!19579) Bool)

(assert (=> b!958912 (= res!641869 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19576))))

(declare-fun b!958913 () Bool)

(declare-fun e!540582 () Bool)

(declare-fun tp_is_empty!21241 () Bool)

(assert (=> b!958913 (= e!540582 tp_is_empty!21241)))

(declare-fun b!958914 () Bool)

(declare-fun res!641866 () Bool)

(assert (=> b!958914 (=> (not res!641866) (not e!540583))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58581 (_ BitVec 32)) Bool)

(assert (=> b!958914 (= res!641866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958915 () Bool)

(declare-fun res!641867 () Bool)

(assert (=> b!958915 (=> (not res!641867) (not e!540583))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958915 (= res!641867 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28643 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28643 _keys!1668))))))

(declare-fun res!641868 () Bool)

(assert (=> start!82262 (=> (not res!641868) (not e!540583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82262 (= res!641868 (validMask!0 mask!2088))))

(assert (=> start!82262 e!540583))

(assert (=> start!82262 true))

(assert (=> start!82262 tp_is_empty!21241))

(declare-fun array_inv!21837 (array!58581) Bool)

(assert (=> start!82262 (array_inv!21837 _keys!1668)))

(declare-datatypes ((V!33305 0))(
  ( (V!33306 (val!10671 Int)) )
))
(declare-datatypes ((ValueCell!10139 0))(
  ( (ValueCellFull!10139 (v!13228 V!33305)) (EmptyCell!10139) )
))
(declare-datatypes ((array!58583 0))(
  ( (array!58584 (arr!28165 (Array (_ BitVec 32) ValueCell!10139)) (size!28644 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58583)

(declare-fun e!540584 () Bool)

(declare-fun array_inv!21838 (array!58583) Bool)

(assert (=> start!82262 (and (array_inv!21838 _values!1386) e!540584)))

(assert (=> start!82262 tp!64565))

(declare-fun b!958916 () Bool)

(declare-fun res!641864 () Bool)

(assert (=> b!958916 (=> (not res!641864) (not e!540583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958916 (= res!641864 (validKeyInArray!0 (select (arr!28164 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33841 () Bool)

(declare-fun mapRes!33841 () Bool)

(assert (=> mapIsEmpty!33841 mapRes!33841))

(declare-fun b!958917 () Bool)

(declare-fun res!641870 () Bool)

(assert (=> b!958917 (=> (not res!641870) (not e!540583))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958917 (= res!641870 (and (= (size!28644 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28643 _keys!1668) (size!28644 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33841 () Bool)

(declare-fun tp!64566 () Bool)

(assert (=> mapNonEmpty!33841 (= mapRes!33841 (and tp!64566 e!540582))))

(declare-fun mapKey!33841 () (_ BitVec 32))

(declare-fun mapRest!33841 () (Array (_ BitVec 32) ValueCell!10139))

(declare-fun mapValue!33841 () ValueCell!10139)

(assert (=> mapNonEmpty!33841 (= (arr!28165 _values!1386) (store mapRest!33841 mapKey!33841 mapValue!33841))))

(declare-fun b!958918 () Bool)

(assert (=> b!958918 (= e!540583 (not true))))

(declare-fun minValue!1328 () V!33305)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33305)

(declare-datatypes ((tuple2!13760 0))(
  ( (tuple2!13761 (_1!6891 (_ BitVec 64)) (_2!6891 V!33305)) )
))
(declare-datatypes ((List!19580 0))(
  ( (Nil!19577) (Cons!19576 (h!20738 tuple2!13760) (t!27943 List!19580)) )
))
(declare-datatypes ((ListLongMap!12457 0))(
  ( (ListLongMap!12458 (toList!6244 List!19580)) )
))
(declare-fun contains!5345 (ListLongMap!12457 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3477 (array!58581 array!58583 (_ BitVec 32) (_ BitVec 32) V!33305 V!33305 (_ BitVec 32) Int) ListLongMap!12457)

(assert (=> b!958918 (contains!5345 (getCurrentListMap!3477 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28164 _keys!1668) i!793))))

(declare-datatypes ((Unit!32163 0))(
  ( (Unit!32164) )
))
(declare-fun lt!430494 () Unit!32163)

(declare-fun lemmaInListMapFromThenInFromSmaller!3 (array!58581 array!58583 (_ BitVec 32) (_ BitVec 32) V!33305 V!33305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32163)

(assert (=> b!958918 (= lt!430494 (lemmaInListMapFromThenInFromSmaller!3 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!958919 () Bool)

(declare-fun e!540585 () Bool)

(assert (=> b!958919 (= e!540585 tp_is_empty!21241)))

(declare-fun b!958920 () Bool)

(declare-fun res!641865 () Bool)

(assert (=> b!958920 (=> (not res!641865) (not e!540583))))

(assert (=> b!958920 (= res!641865 (contains!5345 (getCurrentListMap!3477 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28164 _keys!1668) i!793)))))

(declare-fun b!958921 () Bool)

(assert (=> b!958921 (= e!540584 (and e!540585 mapRes!33841))))

(declare-fun condMapEmpty!33841 () Bool)

(declare-fun mapDefault!33841 () ValueCell!10139)

