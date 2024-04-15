; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82280 () Bool)

(assert start!82280)

(declare-fun b_free!18571 () Bool)

(declare-fun b_next!18571 () Bool)

(assert (=> start!82280 (= b_free!18571 (not b_next!18571))))

(declare-fun tp!64674 () Bool)

(declare-fun b_and!30033 () Bool)

(assert (=> start!82280 (= tp!64674 b_and!30033)))

(declare-fun b!959213 () Bool)

(declare-fun e!540705 () Bool)

(declare-fun tp_is_empty!21277 () Bool)

(assert (=> b!959213 (= e!540705 tp_is_empty!21277)))

(declare-fun res!642133 () Bool)

(declare-fun e!540704 () Bool)

(assert (=> start!82280 (=> (not res!642133) (not e!540704))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82280 (= res!642133 (validMask!0 mask!2088))))

(assert (=> start!82280 e!540704))

(assert (=> start!82280 true))

(assert (=> start!82280 tp_is_empty!21277))

(declare-datatypes ((array!58582 0))(
  ( (array!58583 (arr!28165 (Array (_ BitVec 32) (_ BitVec 64))) (size!28646 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58582)

(declare-fun array_inv!21893 (array!58582) Bool)

(assert (=> start!82280 (array_inv!21893 _keys!1668)))

(declare-datatypes ((V!33353 0))(
  ( (V!33354 (val!10689 Int)) )
))
(declare-datatypes ((ValueCell!10157 0))(
  ( (ValueCellFull!10157 (v!13245 V!33353)) (EmptyCell!10157) )
))
(declare-datatypes ((array!58584 0))(
  ( (array!58585 (arr!28166 (Array (_ BitVec 32) ValueCell!10157)) (size!28647 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58584)

(declare-fun e!540707 () Bool)

(declare-fun array_inv!21894 (array!58584) Bool)

(assert (=> start!82280 (and (array_inv!21894 _values!1386) e!540707)))

(assert (=> start!82280 tp!64674))

(declare-fun b!959214 () Bool)

(declare-fun e!540706 () Bool)

(assert (=> b!959214 (= e!540706 tp_is_empty!21277)))

(declare-fun b!959215 () Bool)

(declare-fun mapRes!33895 () Bool)

(assert (=> b!959215 (= e!540707 (and e!540705 mapRes!33895))))

(declare-fun condMapEmpty!33895 () Bool)

(declare-fun mapDefault!33895 () ValueCell!10157)

(assert (=> b!959215 (= condMapEmpty!33895 (= (arr!28166 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10157)) mapDefault!33895)))))

(declare-fun mapIsEmpty!33895 () Bool)

(assert (=> mapIsEmpty!33895 mapRes!33895))

(declare-fun b!959216 () Bool)

(assert (=> b!959216 (= e!540704 (not true))))

(declare-fun minValue!1328 () V!33353)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33353)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((tuple2!13832 0))(
  ( (tuple2!13833 (_1!6927 (_ BitVec 64)) (_2!6927 V!33353)) )
))
(declare-datatypes ((List!19615 0))(
  ( (Nil!19612) (Cons!19611 (h!20773 tuple2!13832) (t!27969 List!19615)) )
))
(declare-datatypes ((ListLongMap!12519 0))(
  ( (ListLongMap!12520 (toList!6275 List!19615)) )
))
(declare-fun contains!5321 (ListLongMap!12519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3437 (array!58582 array!58584 (_ BitVec 32) (_ BitVec 32) V!33353 V!33353 (_ BitVec 32) Int) ListLongMap!12519)

(assert (=> b!959216 (contains!5321 (getCurrentListMap!3437 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28165 _keys!1668) i!793))))

(declare-datatypes ((Unit!32046 0))(
  ( (Unit!32047) )
))
(declare-fun lt!430312 () Unit!32046)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!14 (array!58582 array!58584 (_ BitVec 32) (_ BitVec 32) V!33353 V!33353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32046)

(assert (=> b!959216 (= lt!430312 (lemmaInListMapFromThenInFromSmaller!14 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun mapNonEmpty!33895 () Bool)

(declare-fun tp!64675 () Bool)

(assert (=> mapNonEmpty!33895 (= mapRes!33895 (and tp!64675 e!540706))))

(declare-fun mapValue!33895 () ValueCell!10157)

(declare-fun mapRest!33895 () (Array (_ BitVec 32) ValueCell!10157))

(declare-fun mapKey!33895 () (_ BitVec 32))

(assert (=> mapNonEmpty!33895 (= (arr!28166 _values!1386) (store mapRest!33895 mapKey!33895 mapValue!33895))))

(declare-fun b!959217 () Bool)

(declare-fun res!642132 () Bool)

(assert (=> b!959217 (=> (not res!642132) (not e!540704))))

(assert (=> b!959217 (= res!642132 (and (= (size!28647 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28646 _keys!1668) (size!28647 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959218 () Bool)

(declare-fun res!642135 () Bool)

(assert (=> b!959218 (=> (not res!642135) (not e!540704))))

(assert (=> b!959218 (= res!642135 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28646 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28646 _keys!1668))))))

(declare-fun b!959219 () Bool)

(declare-fun res!642134 () Bool)

(assert (=> b!959219 (=> (not res!642134) (not e!540704))))

(assert (=> b!959219 (= res!642134 (contains!5321 (getCurrentListMap!3437 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28165 _keys!1668) i!793)))))

(declare-fun b!959220 () Bool)

(declare-fun res!642136 () Bool)

(assert (=> b!959220 (=> (not res!642136) (not e!540704))))

(declare-datatypes ((List!19616 0))(
  ( (Nil!19613) (Cons!19612 (h!20774 (_ BitVec 64)) (t!27970 List!19616)) )
))
(declare-fun arrayNoDuplicates!0 (array!58582 (_ BitVec 32) List!19616) Bool)

(assert (=> b!959220 (= res!642136 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19613))))

(declare-fun b!959221 () Bool)

(declare-fun res!642138 () Bool)

(assert (=> b!959221 (=> (not res!642138) (not e!540704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959221 (= res!642138 (validKeyInArray!0 (select (arr!28165 _keys!1668) i!793)))))

(declare-fun b!959222 () Bool)

(declare-fun res!642137 () Bool)

(assert (=> b!959222 (=> (not res!642137) (not e!540704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58582 (_ BitVec 32)) Bool)

(assert (=> b!959222 (= res!642137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82280 res!642133) b!959217))

(assert (= (and b!959217 res!642132) b!959222))

(assert (= (and b!959222 res!642137) b!959220))

(assert (= (and b!959220 res!642136) b!959218))

(assert (= (and b!959218 res!642135) b!959221))

(assert (= (and b!959221 res!642138) b!959219))

(assert (= (and b!959219 res!642134) b!959216))

(assert (= (and b!959215 condMapEmpty!33895) mapIsEmpty!33895))

(assert (= (and b!959215 (not condMapEmpty!33895)) mapNonEmpty!33895))

(get-info :version)

(assert (= (and mapNonEmpty!33895 ((_ is ValueCellFull!10157) mapValue!33895)) b!959214))

(assert (= (and b!959215 ((_ is ValueCellFull!10157) mapDefault!33895)) b!959213))

(assert (= start!82280 b!959215))

(declare-fun m!889185 () Bool)

(assert (=> b!959220 m!889185))

(declare-fun m!889187 () Bool)

(assert (=> b!959222 m!889187))

(declare-fun m!889189 () Bool)

(assert (=> b!959219 m!889189))

(declare-fun m!889191 () Bool)

(assert (=> b!959219 m!889191))

(assert (=> b!959219 m!889189))

(assert (=> b!959219 m!889191))

(declare-fun m!889193 () Bool)

(assert (=> b!959219 m!889193))

(assert (=> b!959221 m!889191))

(assert (=> b!959221 m!889191))

(declare-fun m!889195 () Bool)

(assert (=> b!959221 m!889195))

(declare-fun m!889197 () Bool)

(assert (=> b!959216 m!889197))

(assert (=> b!959216 m!889191))

(assert (=> b!959216 m!889197))

(assert (=> b!959216 m!889191))

(declare-fun m!889199 () Bool)

(assert (=> b!959216 m!889199))

(declare-fun m!889201 () Bool)

(assert (=> b!959216 m!889201))

(declare-fun m!889203 () Bool)

(assert (=> start!82280 m!889203))

(declare-fun m!889205 () Bool)

(assert (=> start!82280 m!889205))

(declare-fun m!889207 () Bool)

(assert (=> start!82280 m!889207))

(declare-fun m!889209 () Bool)

(assert (=> mapNonEmpty!33895 m!889209))

(check-sat (not start!82280) (not b!959216) (not b!959222) b_and!30033 (not mapNonEmpty!33895) (not b!959220) (not b!959221) tp_is_empty!21277 (not b_next!18571) (not b!959219))
(check-sat b_and!30033 (not b_next!18571))
