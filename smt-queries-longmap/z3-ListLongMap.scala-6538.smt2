; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83114 () Bool)

(assert start!83114)

(declare-fun b_free!19107 () Bool)

(declare-fun b_next!19107 () Bool)

(assert (=> start!83114 (= b_free!19107 (not b_next!19107))))

(declare-fun tp!66600 () Bool)

(declare-fun b_and!30595 () Bool)

(assert (=> start!83114 (= tp!66600 b_and!30595)))

(declare-fun b!969539 () Bool)

(declare-fun res!648926 () Bool)

(declare-fun e!546602 () Bool)

(assert (=> b!969539 (=> (not res!648926) (not e!546602))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34323 0))(
  ( (V!34324 (val!11053 Int)) )
))
(declare-datatypes ((ValueCell!10521 0))(
  ( (ValueCellFull!10521 (v!13612 V!34323)) (EmptyCell!10521) )
))
(declare-datatypes ((array!60075 0))(
  ( (array!60076 (arr!28901 (Array (_ BitVec 32) ValueCell!10521)) (size!29380 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60075)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60077 0))(
  ( (array!60078 (arr!28902 (Array (_ BitVec 32) (_ BitVec 64))) (size!29381 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60077)

(assert (=> b!969539 (= res!648926 (and (= (size!29380 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29381 _keys!1717) (size!29380 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969540 () Bool)

(declare-fun res!648928 () Bool)

(assert (=> b!969540 (=> (not res!648928) (not e!546602))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969540 (= res!648928 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29381 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29381 _keys!1717))))))

(declare-fun b!969541 () Bool)

(declare-fun res!648929 () Bool)

(assert (=> b!969541 (=> (not res!648929) (not e!546602))))

(declare-datatypes ((List!20030 0))(
  ( (Nil!20027) (Cons!20026 (h!21188 (_ BitVec 64)) (t!28393 List!20030)) )
))
(declare-fun arrayNoDuplicates!0 (array!60077 (_ BitVec 32) List!20030) Bool)

(assert (=> b!969541 (= res!648929 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20027))))

(declare-fun b!969542 () Bool)

(assert (=> b!969542 (= e!546602 false)))

(declare-fun lt!431648 () Bool)

(declare-fun zeroValue!1367 () V!34323)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34323)

(declare-datatypes ((tuple2!14162 0))(
  ( (tuple2!14163 (_1!7092 (_ BitVec 64)) (_2!7092 V!34323)) )
))
(declare-datatypes ((List!20031 0))(
  ( (Nil!20028) (Cons!20027 (h!21189 tuple2!14162) (t!28394 List!20031)) )
))
(declare-datatypes ((ListLongMap!12859 0))(
  ( (ListLongMap!12860 (toList!6445 List!20031)) )
))
(declare-fun contains!5549 (ListLongMap!12859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3678 (array!60077 array!60075 (_ BitVec 32) (_ BitVec 32) V!34323 V!34323 (_ BitVec 32) Int) ListLongMap!12859)

(assert (=> b!969542 (= lt!431648 (contains!5549 (getCurrentListMap!3678 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28902 _keys!1717) i!822)))))

(declare-fun res!648925 () Bool)

(assert (=> start!83114 (=> (not res!648925) (not e!546602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83114 (= res!648925 (validMask!0 mask!2147))))

(assert (=> start!83114 e!546602))

(assert (=> start!83114 true))

(declare-fun e!546603 () Bool)

(declare-fun array_inv!22373 (array!60075) Bool)

(assert (=> start!83114 (and (array_inv!22373 _values!1425) e!546603)))

(declare-fun tp_is_empty!22005 () Bool)

(assert (=> start!83114 tp_is_empty!22005))

(assert (=> start!83114 tp!66600))

(declare-fun array_inv!22374 (array!60077) Bool)

(assert (=> start!83114 (array_inv!22374 _keys!1717)))

(declare-fun b!969543 () Bool)

(declare-fun res!648927 () Bool)

(assert (=> b!969543 (=> (not res!648927) (not e!546602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60077 (_ BitVec 32)) Bool)

(assert (=> b!969543 (= res!648927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969544 () Bool)

(declare-fun res!648930 () Bool)

(assert (=> b!969544 (=> (not res!648930) (not e!546602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969544 (= res!648930 (validKeyInArray!0 (select (arr!28902 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35017 () Bool)

(declare-fun mapRes!35017 () Bool)

(assert (=> mapIsEmpty!35017 mapRes!35017))

(declare-fun b!969545 () Bool)

(declare-fun e!546601 () Bool)

(assert (=> b!969545 (= e!546601 tp_is_empty!22005)))

(declare-fun b!969546 () Bool)

(declare-fun e!546600 () Bool)

(assert (=> b!969546 (= e!546600 tp_is_empty!22005)))

(declare-fun mapNonEmpty!35017 () Bool)

(declare-fun tp!66599 () Bool)

(assert (=> mapNonEmpty!35017 (= mapRes!35017 (and tp!66599 e!546600))))

(declare-fun mapKey!35017 () (_ BitVec 32))

(declare-fun mapValue!35017 () ValueCell!10521)

(declare-fun mapRest!35017 () (Array (_ BitVec 32) ValueCell!10521))

(assert (=> mapNonEmpty!35017 (= (arr!28901 _values!1425) (store mapRest!35017 mapKey!35017 mapValue!35017))))

(declare-fun b!969547 () Bool)

(assert (=> b!969547 (= e!546603 (and e!546601 mapRes!35017))))

(declare-fun condMapEmpty!35017 () Bool)

(declare-fun mapDefault!35017 () ValueCell!10521)

(assert (=> b!969547 (= condMapEmpty!35017 (= (arr!28901 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10521)) mapDefault!35017)))))

(assert (= (and start!83114 res!648925) b!969539))

(assert (= (and b!969539 res!648926) b!969543))

(assert (= (and b!969543 res!648927) b!969541))

(assert (= (and b!969541 res!648929) b!969540))

(assert (= (and b!969540 res!648928) b!969544))

(assert (= (and b!969544 res!648930) b!969542))

(assert (= (and b!969547 condMapEmpty!35017) mapIsEmpty!35017))

(assert (= (and b!969547 (not condMapEmpty!35017)) mapNonEmpty!35017))

(get-info :version)

(assert (= (and mapNonEmpty!35017 ((_ is ValueCellFull!10521) mapValue!35017)) b!969546))

(assert (= (and b!969547 ((_ is ValueCellFull!10521) mapDefault!35017)) b!969545))

(assert (= start!83114 b!969547))

(declare-fun m!897507 () Bool)

(assert (=> mapNonEmpty!35017 m!897507))

(declare-fun m!897509 () Bool)

(assert (=> b!969542 m!897509))

(declare-fun m!897511 () Bool)

(assert (=> b!969542 m!897511))

(assert (=> b!969542 m!897509))

(assert (=> b!969542 m!897511))

(declare-fun m!897513 () Bool)

(assert (=> b!969542 m!897513))

(assert (=> b!969544 m!897511))

(assert (=> b!969544 m!897511))

(declare-fun m!897515 () Bool)

(assert (=> b!969544 m!897515))

(declare-fun m!897517 () Bool)

(assert (=> b!969543 m!897517))

(declare-fun m!897519 () Bool)

(assert (=> b!969541 m!897519))

(declare-fun m!897521 () Bool)

(assert (=> start!83114 m!897521))

(declare-fun m!897523 () Bool)

(assert (=> start!83114 m!897523))

(declare-fun m!897525 () Bool)

(assert (=> start!83114 m!897525))

(check-sat tp_is_empty!22005 (not b_next!19107) b_and!30595 (not start!83114) (not b!969541) (not mapNonEmpty!35017) (not b!969544) (not b!969543) (not b!969542))
(check-sat b_and!30595 (not b_next!19107))
