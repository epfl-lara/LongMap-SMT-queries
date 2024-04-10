; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83426 () Bool)

(assert start!83426)

(declare-fun b_free!19419 () Bool)

(declare-fun b_next!19419 () Bool)

(assert (=> start!83426 (= b_free!19419 (not b_next!19419))))

(declare-fun tp!67535 () Bool)

(declare-fun b_and!31021 () Bool)

(assert (=> start!83426 (= tp!67535 b_and!31021)))

(declare-fun b!974374 () Bool)

(declare-fun e!549195 () Bool)

(declare-fun tp_is_empty!22317 () Bool)

(assert (=> b!974374 (= e!549195 tp_is_empty!22317)))

(declare-fun res!652242 () Bool)

(declare-fun e!549192 () Bool)

(assert (=> start!83426 (=> (not res!652242) (not e!549192))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83426 (= res!652242 (validMask!0 mask!2147))))

(assert (=> start!83426 e!549192))

(assert (=> start!83426 true))

(declare-datatypes ((V!34739 0))(
  ( (V!34740 (val!11209 Int)) )
))
(declare-datatypes ((ValueCell!10677 0))(
  ( (ValueCellFull!10677 (v!13768 V!34739)) (EmptyCell!10677) )
))
(declare-datatypes ((array!60675 0))(
  ( (array!60676 (arr!29201 (Array (_ BitVec 32) ValueCell!10677)) (size!29680 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60675)

(declare-fun e!549193 () Bool)

(declare-fun array_inv!22583 (array!60675) Bool)

(assert (=> start!83426 (and (array_inv!22583 _values!1425) e!549193)))

(assert (=> start!83426 tp_is_empty!22317))

(assert (=> start!83426 tp!67535))

(declare-datatypes ((array!60677 0))(
  ( (array!60678 (arr!29202 (Array (_ BitVec 32) (_ BitVec 64))) (size!29681 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60677)

(declare-fun array_inv!22584 (array!60677) Bool)

(assert (=> start!83426 (array_inv!22584 _keys!1717)))

(declare-fun b!974375 () Bool)

(declare-fun res!652248 () Bool)

(assert (=> b!974375 (=> (not res!652248) (not e!549192))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974375 (= res!652248 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29681 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29681 _keys!1717))))))

(declare-fun b!974376 () Bool)

(declare-fun res!652245 () Bool)

(assert (=> b!974376 (=> (not res!652245) (not e!549192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974376 (= res!652245 (validKeyInArray!0 (select (arr!29202 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35485 () Bool)

(declare-fun mapRes!35485 () Bool)

(declare-fun tp!67536 () Bool)

(declare-fun e!549194 () Bool)

(assert (=> mapNonEmpty!35485 (= mapRes!35485 (and tp!67536 e!549194))))

(declare-fun mapKey!35485 () (_ BitVec 32))

(declare-fun mapValue!35485 () ValueCell!10677)

(declare-fun mapRest!35485 () (Array (_ BitVec 32) ValueCell!10677))

(assert (=> mapNonEmpty!35485 (= (arr!29201 _values!1425) (store mapRest!35485 mapKey!35485 mapValue!35485))))

(declare-fun b!974377 () Bool)

(assert (=> b!974377 (= e!549194 tp_is_empty!22317)))

(declare-fun b!974378 () Bool)

(declare-fun res!652246 () Bool)

(assert (=> b!974378 (=> (not res!652246) (not e!549192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60677 (_ BitVec 32)) Bool)

(assert (=> b!974378 (= res!652246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35485 () Bool)

(assert (=> mapIsEmpty!35485 mapRes!35485))

(declare-fun b!974379 () Bool)

(assert (=> b!974379 (= e!549193 (and e!549195 mapRes!35485))))

(declare-fun condMapEmpty!35485 () Bool)

(declare-fun mapDefault!35485 () ValueCell!10677)

(assert (=> b!974379 (= condMapEmpty!35485 (= (arr!29201 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10677)) mapDefault!35485)))))

(declare-fun b!974380 () Bool)

(assert (=> b!974380 (= e!549192 false)))

(declare-fun zeroValue!1367 () V!34739)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34739)

(declare-datatypes ((tuple2!14408 0))(
  ( (tuple2!14409 (_1!7215 (_ BitVec 64)) (_2!7215 V!34739)) )
))
(declare-datatypes ((List!20262 0))(
  ( (Nil!20259) (Cons!20258 (h!21420 tuple2!14408) (t!28739 List!20262)) )
))
(declare-datatypes ((ListLongMap!13105 0))(
  ( (ListLongMap!13106 (toList!6568 List!20262)) )
))
(declare-fun lt!432764 () ListLongMap!13105)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3801 (array!60677 array!60675 (_ BitVec 32) (_ BitVec 32) V!34739 V!34739 (_ BitVec 32) Int) ListLongMap!13105)

(assert (=> b!974380 (= lt!432764 (getCurrentListMap!3801 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974381 () Bool)

(declare-fun res!652243 () Bool)

(assert (=> b!974381 (=> (not res!652243) (not e!549192))))

(declare-fun contains!5655 (ListLongMap!13105 (_ BitVec 64)) Bool)

(assert (=> b!974381 (= res!652243 (contains!5655 (getCurrentListMap!3801 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29202 _keys!1717) i!822)))))

(declare-fun b!974382 () Bool)

(declare-fun res!652244 () Bool)

(assert (=> b!974382 (=> (not res!652244) (not e!549192))))

(declare-datatypes ((List!20263 0))(
  ( (Nil!20260) (Cons!20259 (h!21421 (_ BitVec 64)) (t!28740 List!20263)) )
))
(declare-fun arrayNoDuplicates!0 (array!60677 (_ BitVec 32) List!20263) Bool)

(assert (=> b!974382 (= res!652244 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20260))))

(declare-fun b!974383 () Bool)

(declare-fun res!652247 () Bool)

(assert (=> b!974383 (=> (not res!652247) (not e!549192))))

(assert (=> b!974383 (= res!652247 (and (= (size!29680 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29681 _keys!1717) (size!29680 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83426 res!652242) b!974383))

(assert (= (and b!974383 res!652247) b!974378))

(assert (= (and b!974378 res!652246) b!974382))

(assert (= (and b!974382 res!652244) b!974375))

(assert (= (and b!974375 res!652248) b!974376))

(assert (= (and b!974376 res!652245) b!974381))

(assert (= (and b!974381 res!652243) b!974380))

(assert (= (and b!974379 condMapEmpty!35485) mapIsEmpty!35485))

(assert (= (and b!974379 (not condMapEmpty!35485)) mapNonEmpty!35485))

(get-info :version)

(assert (= (and mapNonEmpty!35485 ((_ is ValueCellFull!10677) mapValue!35485)) b!974377))

(assert (= (and b!974379 ((_ is ValueCellFull!10677) mapDefault!35485)) b!974374))

(assert (= start!83426 b!974379))

(declare-fun m!901913 () Bool)

(assert (=> b!974382 m!901913))

(declare-fun m!901915 () Bool)

(assert (=> b!974376 m!901915))

(assert (=> b!974376 m!901915))

(declare-fun m!901917 () Bool)

(assert (=> b!974376 m!901917))

(declare-fun m!901919 () Bool)

(assert (=> start!83426 m!901919))

(declare-fun m!901921 () Bool)

(assert (=> start!83426 m!901921))

(declare-fun m!901923 () Bool)

(assert (=> start!83426 m!901923))

(declare-fun m!901925 () Bool)

(assert (=> b!974381 m!901925))

(assert (=> b!974381 m!901915))

(assert (=> b!974381 m!901925))

(assert (=> b!974381 m!901915))

(declare-fun m!901927 () Bool)

(assert (=> b!974381 m!901927))

(declare-fun m!901929 () Bool)

(assert (=> b!974380 m!901929))

(declare-fun m!901931 () Bool)

(assert (=> b!974378 m!901931))

(declare-fun m!901933 () Bool)

(assert (=> mapNonEmpty!35485 m!901933))

(check-sat (not b_next!19419) (not mapNonEmpty!35485) b_and!31021 (not b!974378) (not b!974380) (not start!83426) (not b!974376) tp_is_empty!22317 (not b!974382) (not b!974381))
(check-sat b_and!31021 (not b_next!19419))
