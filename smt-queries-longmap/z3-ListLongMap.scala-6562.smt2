; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83258 () Bool)

(assert start!83258)

(declare-fun b_free!19251 () Bool)

(declare-fun b_next!19251 () Bool)

(assert (=> start!83258 (= b_free!19251 (not b_next!19251))))

(declare-fun tp!67032 () Bool)

(declare-fun b_and!30739 () Bool)

(assert (=> start!83258 (= tp!67032 b_and!30739)))

(declare-fun b!971569 () Bool)

(declare-fun e!547680 () Bool)

(declare-fun e!547682 () Bool)

(declare-fun mapRes!35233 () Bool)

(assert (=> b!971569 (= e!547680 (and e!547682 mapRes!35233))))

(declare-fun condMapEmpty!35233 () Bool)

(declare-datatypes ((V!34515 0))(
  ( (V!34516 (val!11125 Int)) )
))
(declare-datatypes ((ValueCell!10593 0))(
  ( (ValueCellFull!10593 (v!13684 V!34515)) (EmptyCell!10593) )
))
(declare-datatypes ((array!60345 0))(
  ( (array!60346 (arr!29036 (Array (_ BitVec 32) ValueCell!10593)) (size!29515 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60345)

(declare-fun mapDefault!35233 () ValueCell!10593)

(assert (=> b!971569 (= condMapEmpty!35233 (= (arr!29036 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10593)) mapDefault!35233)))))

(declare-fun b!971570 () Bool)

(declare-fun res!650312 () Bool)

(declare-fun e!547681 () Bool)

(assert (=> b!971570 (=> (not res!650312) (not e!547681))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60347 0))(
  ( (array!60348 (arr!29037 (Array (_ BitVec 32) (_ BitVec 64))) (size!29516 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60347)

(assert (=> b!971570 (= res!650312 (and (= (size!29515 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29516 _keys!1717) (size!29515 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971571 () Bool)

(declare-fun res!650308 () Bool)

(assert (=> b!971571 (=> (not res!650308) (not e!547681))))

(declare-datatypes ((List!20125 0))(
  ( (Nil!20122) (Cons!20121 (h!21283 (_ BitVec 64)) (t!28488 List!20125)) )
))
(declare-fun arrayNoDuplicates!0 (array!60347 (_ BitVec 32) List!20125) Bool)

(assert (=> b!971571 (= res!650308 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20122))))

(declare-fun b!971572 () Bool)

(assert (=> b!971572 (= e!547681 false)))

(declare-datatypes ((tuple2!14258 0))(
  ( (tuple2!14259 (_1!7140 (_ BitVec 64)) (_2!7140 V!34515)) )
))
(declare-datatypes ((List!20126 0))(
  ( (Nil!20123) (Cons!20122 (h!21284 tuple2!14258) (t!28489 List!20126)) )
))
(declare-datatypes ((ListLongMap!12955 0))(
  ( (ListLongMap!12956 (toList!6493 List!20126)) )
))
(declare-fun lt!431846 () ListLongMap!12955)

(declare-fun zeroValue!1367 () V!34515)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34515)

(declare-fun getCurrentListMap!3726 (array!60347 array!60345 (_ BitVec 32) (_ BitVec 32) V!34515 V!34515 (_ BitVec 32) Int) ListLongMap!12955)

(assert (=> b!971572 (= lt!431846 (getCurrentListMap!3726 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35233 () Bool)

(declare-fun tp!67031 () Bool)

(declare-fun e!547684 () Bool)

(assert (=> mapNonEmpty!35233 (= mapRes!35233 (and tp!67031 e!547684))))

(declare-fun mapRest!35233 () (Array (_ BitVec 32) ValueCell!10593))

(declare-fun mapKey!35233 () (_ BitVec 32))

(declare-fun mapValue!35233 () ValueCell!10593)

(assert (=> mapNonEmpty!35233 (= (arr!29036 _values!1425) (store mapRest!35233 mapKey!35233 mapValue!35233))))

(declare-fun b!971573 () Bool)

(declare-fun res!650309 () Bool)

(assert (=> b!971573 (=> (not res!650309) (not e!547681))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971573 (= res!650309 (validKeyInArray!0 (select (arr!29037 _keys!1717) i!822)))))

(declare-fun b!971574 () Bool)

(declare-fun res!650307 () Bool)

(assert (=> b!971574 (=> (not res!650307) (not e!547681))))

(declare-fun contains!5593 (ListLongMap!12955 (_ BitVec 64)) Bool)

(assert (=> b!971574 (= res!650307 (contains!5593 (getCurrentListMap!3726 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29037 _keys!1717) i!822)))))

(declare-fun b!971575 () Bool)

(declare-fun res!650310 () Bool)

(assert (=> b!971575 (=> (not res!650310) (not e!547681))))

(assert (=> b!971575 (= res!650310 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29516 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29516 _keys!1717))))))

(declare-fun b!971576 () Bool)

(declare-fun tp_is_empty!22149 () Bool)

(assert (=> b!971576 (= e!547682 tp_is_empty!22149)))

(declare-fun b!971578 () Bool)

(declare-fun res!650311 () Bool)

(assert (=> b!971578 (=> (not res!650311) (not e!547681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60347 (_ BitVec 32)) Bool)

(assert (=> b!971578 (= res!650311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35233 () Bool)

(assert (=> mapIsEmpty!35233 mapRes!35233))

(declare-fun res!650313 () Bool)

(assert (=> start!83258 (=> (not res!650313) (not e!547681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83258 (= res!650313 (validMask!0 mask!2147))))

(assert (=> start!83258 e!547681))

(assert (=> start!83258 true))

(declare-fun array_inv!22467 (array!60345) Bool)

(assert (=> start!83258 (and (array_inv!22467 _values!1425) e!547680)))

(assert (=> start!83258 tp_is_empty!22149))

(assert (=> start!83258 tp!67032))

(declare-fun array_inv!22468 (array!60347) Bool)

(assert (=> start!83258 (array_inv!22468 _keys!1717)))

(declare-fun b!971577 () Bool)

(assert (=> b!971577 (= e!547684 tp_is_empty!22149)))

(assert (= (and start!83258 res!650313) b!971570))

(assert (= (and b!971570 res!650312) b!971578))

(assert (= (and b!971578 res!650311) b!971571))

(assert (= (and b!971571 res!650308) b!971575))

(assert (= (and b!971575 res!650310) b!971573))

(assert (= (and b!971573 res!650309) b!971574))

(assert (= (and b!971574 res!650307) b!971572))

(assert (= (and b!971569 condMapEmpty!35233) mapIsEmpty!35233))

(assert (= (and b!971569 (not condMapEmpty!35233)) mapNonEmpty!35233))

(get-info :version)

(assert (= (and mapNonEmpty!35233 ((_ is ValueCellFull!10593) mapValue!35233)) b!971577))

(assert (= (and b!971569 ((_ is ValueCellFull!10593) mapDefault!35233)) b!971576))

(assert (= start!83258 b!971569))

(declare-fun m!898991 () Bool)

(assert (=> b!971574 m!898991))

(declare-fun m!898993 () Bool)

(assert (=> b!971574 m!898993))

(assert (=> b!971574 m!898991))

(assert (=> b!971574 m!898993))

(declare-fun m!898995 () Bool)

(assert (=> b!971574 m!898995))

(declare-fun m!898997 () Bool)

(assert (=> b!971572 m!898997))

(assert (=> b!971573 m!898993))

(assert (=> b!971573 m!898993))

(declare-fun m!898999 () Bool)

(assert (=> b!971573 m!898999))

(declare-fun m!899001 () Bool)

(assert (=> b!971571 m!899001))

(declare-fun m!899003 () Bool)

(assert (=> start!83258 m!899003))

(declare-fun m!899005 () Bool)

(assert (=> start!83258 m!899005))

(declare-fun m!899007 () Bool)

(assert (=> start!83258 m!899007))

(declare-fun m!899009 () Bool)

(assert (=> mapNonEmpty!35233 m!899009))

(declare-fun m!899011 () Bool)

(assert (=> b!971578 m!899011))

(check-sat (not start!83258) (not b!971574) b_and!30739 (not b!971572) tp_is_empty!22149 (not mapNonEmpty!35233) (not b_next!19251) (not b!971571) (not b!971578) (not b!971573))
(check-sat b_and!30739 (not b_next!19251))
