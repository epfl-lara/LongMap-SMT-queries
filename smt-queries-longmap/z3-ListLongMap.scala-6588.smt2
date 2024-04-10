; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83414 () Bool)

(assert start!83414)

(declare-fun b_free!19407 () Bool)

(declare-fun b_next!19407 () Bool)

(assert (=> start!83414 (= b_free!19407 (not b_next!19407))))

(declare-fun tp!67499 () Bool)

(declare-fun b_and!31009 () Bool)

(assert (=> start!83414 (= tp!67499 b_and!31009)))

(declare-fun b!974194 () Bool)

(declare-fun e!549102 () Bool)

(declare-fun tp_is_empty!22305 () Bool)

(assert (=> b!974194 (= e!549102 tp_is_empty!22305)))

(declare-fun b!974195 () Bool)

(declare-fun e!549106 () Bool)

(assert (=> b!974195 (= e!549106 tp_is_empty!22305)))

(declare-fun res!652118 () Bool)

(declare-fun e!549103 () Bool)

(assert (=> start!83414 (=> (not res!652118) (not e!549103))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83414 (= res!652118 (validMask!0 mask!2147))))

(assert (=> start!83414 e!549103))

(assert (=> start!83414 true))

(declare-datatypes ((V!34723 0))(
  ( (V!34724 (val!11203 Int)) )
))
(declare-datatypes ((ValueCell!10671 0))(
  ( (ValueCellFull!10671 (v!13762 V!34723)) (EmptyCell!10671) )
))
(declare-datatypes ((array!60651 0))(
  ( (array!60652 (arr!29189 (Array (_ BitVec 32) ValueCell!10671)) (size!29668 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60651)

(declare-fun e!549105 () Bool)

(declare-fun array_inv!22575 (array!60651) Bool)

(assert (=> start!83414 (and (array_inv!22575 _values!1425) e!549105)))

(assert (=> start!83414 tp_is_empty!22305))

(assert (=> start!83414 tp!67499))

(declare-datatypes ((array!60653 0))(
  ( (array!60654 (arr!29190 (Array (_ BitVec 32) (_ BitVec 64))) (size!29669 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60653)

(declare-fun array_inv!22576 (array!60653) Bool)

(assert (=> start!83414 (array_inv!22576 _keys!1717)))

(declare-fun b!974196 () Bool)

(declare-fun res!652122 () Bool)

(assert (=> b!974196 (=> (not res!652122) (not e!549103))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974196 (= res!652122 (and (= (size!29668 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29669 _keys!1717) (size!29668 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974197 () Bool)

(declare-fun res!652120 () Bool)

(assert (=> b!974197 (=> (not res!652120) (not e!549103))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974197 (= res!652120 (validKeyInArray!0 (select (arr!29190 _keys!1717) i!822)))))

(declare-fun b!974198 () Bool)

(declare-fun res!652121 () Bool)

(assert (=> b!974198 (=> (not res!652121) (not e!549103))))

(declare-fun zeroValue!1367 () V!34723)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34723)

(declare-datatypes ((tuple2!14396 0))(
  ( (tuple2!14397 (_1!7209 (_ BitVec 64)) (_2!7209 V!34723)) )
))
(declare-datatypes ((List!20252 0))(
  ( (Nil!20249) (Cons!20248 (h!21410 tuple2!14396) (t!28729 List!20252)) )
))
(declare-datatypes ((ListLongMap!13093 0))(
  ( (ListLongMap!13094 (toList!6562 List!20252)) )
))
(declare-fun contains!5651 (ListLongMap!13093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3795 (array!60653 array!60651 (_ BitVec 32) (_ BitVec 32) V!34723 V!34723 (_ BitVec 32) Int) ListLongMap!13093)

(assert (=> b!974198 (= res!652121 (contains!5651 (getCurrentListMap!3795 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29190 _keys!1717) i!822)))))

(declare-fun b!974199 () Bool)

(assert (=> b!974199 (= e!549103 false)))

(declare-fun lt!432746 () ListLongMap!13093)

(assert (=> b!974199 (= lt!432746 (getCurrentListMap!3795 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35467 () Bool)

(declare-fun mapRes!35467 () Bool)

(assert (=> mapIsEmpty!35467 mapRes!35467))

(declare-fun mapNonEmpty!35467 () Bool)

(declare-fun tp!67500 () Bool)

(assert (=> mapNonEmpty!35467 (= mapRes!35467 (and tp!67500 e!549102))))

(declare-fun mapValue!35467 () ValueCell!10671)

(declare-fun mapKey!35467 () (_ BitVec 32))

(declare-fun mapRest!35467 () (Array (_ BitVec 32) ValueCell!10671))

(assert (=> mapNonEmpty!35467 (= (arr!29189 _values!1425) (store mapRest!35467 mapKey!35467 mapValue!35467))))

(declare-fun b!974200 () Bool)

(declare-fun res!652119 () Bool)

(assert (=> b!974200 (=> (not res!652119) (not e!549103))))

(declare-datatypes ((List!20253 0))(
  ( (Nil!20250) (Cons!20249 (h!21411 (_ BitVec 64)) (t!28730 List!20253)) )
))
(declare-fun arrayNoDuplicates!0 (array!60653 (_ BitVec 32) List!20253) Bool)

(assert (=> b!974200 (= res!652119 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20250))))

(declare-fun b!974201 () Bool)

(declare-fun res!652117 () Bool)

(assert (=> b!974201 (=> (not res!652117) (not e!549103))))

(assert (=> b!974201 (= res!652117 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29669 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29669 _keys!1717))))))

(declare-fun b!974202 () Bool)

(assert (=> b!974202 (= e!549105 (and e!549106 mapRes!35467))))

(declare-fun condMapEmpty!35467 () Bool)

(declare-fun mapDefault!35467 () ValueCell!10671)

(assert (=> b!974202 (= condMapEmpty!35467 (= (arr!29189 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10671)) mapDefault!35467)))))

(declare-fun b!974203 () Bool)

(declare-fun res!652116 () Bool)

(assert (=> b!974203 (=> (not res!652116) (not e!549103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60653 (_ BitVec 32)) Bool)

(assert (=> b!974203 (= res!652116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83414 res!652118) b!974196))

(assert (= (and b!974196 res!652122) b!974203))

(assert (= (and b!974203 res!652116) b!974200))

(assert (= (and b!974200 res!652119) b!974201))

(assert (= (and b!974201 res!652117) b!974197))

(assert (= (and b!974197 res!652120) b!974198))

(assert (= (and b!974198 res!652121) b!974199))

(assert (= (and b!974202 condMapEmpty!35467) mapIsEmpty!35467))

(assert (= (and b!974202 (not condMapEmpty!35467)) mapNonEmpty!35467))

(get-info :version)

(assert (= (and mapNonEmpty!35467 ((_ is ValueCellFull!10671) mapValue!35467)) b!974194))

(assert (= (and b!974202 ((_ is ValueCellFull!10671) mapDefault!35467)) b!974195))

(assert (= start!83414 b!974202))

(declare-fun m!901781 () Bool)

(assert (=> b!974200 m!901781))

(declare-fun m!901783 () Bool)

(assert (=> b!974199 m!901783))

(declare-fun m!901785 () Bool)

(assert (=> b!974203 m!901785))

(declare-fun m!901787 () Bool)

(assert (=> b!974198 m!901787))

(declare-fun m!901789 () Bool)

(assert (=> b!974198 m!901789))

(assert (=> b!974198 m!901787))

(assert (=> b!974198 m!901789))

(declare-fun m!901791 () Bool)

(assert (=> b!974198 m!901791))

(declare-fun m!901793 () Bool)

(assert (=> start!83414 m!901793))

(declare-fun m!901795 () Bool)

(assert (=> start!83414 m!901795))

(declare-fun m!901797 () Bool)

(assert (=> start!83414 m!901797))

(declare-fun m!901799 () Bool)

(assert (=> mapNonEmpty!35467 m!901799))

(assert (=> b!974197 m!901789))

(assert (=> b!974197 m!901789))

(declare-fun m!901801 () Bool)

(assert (=> b!974197 m!901801))

(check-sat tp_is_empty!22305 (not b!974203) (not b!974198) (not mapNonEmpty!35467) (not b_next!19407) (not b!974199) b_and!31009 (not start!83414) (not b!974200) (not b!974197))
(check-sat b_and!31009 (not b_next!19407))
