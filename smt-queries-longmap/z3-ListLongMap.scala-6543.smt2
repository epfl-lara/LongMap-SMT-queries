; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83124 () Bool)

(assert start!83124)

(declare-fun b_free!19135 () Bool)

(declare-fun b_next!19135 () Bool)

(assert (=> start!83124 (= b_free!19135 (not b_next!19135))))

(declare-fun tp!66685 () Bool)

(declare-fun b_and!30597 () Bool)

(assert (=> start!83124 (= tp!66685 b_and!30597)))

(declare-fun b!969678 () Bool)

(declare-fun res!649071 () Bool)

(declare-fun e!546665 () Bool)

(assert (=> b!969678 (=> (not res!649071) (not e!546665))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34361 0))(
  ( (V!34362 (val!11067 Int)) )
))
(declare-datatypes ((ValueCell!10535 0))(
  ( (ValueCellFull!10535 (v!13625 V!34361)) (EmptyCell!10535) )
))
(declare-datatypes ((array!60062 0))(
  ( (array!60063 (arr!28895 (Array (_ BitVec 32) ValueCell!10535)) (size!29376 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60062)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60064 0))(
  ( (array!60065 (arr!28896 (Array (_ BitVec 32) (_ BitVec 64))) (size!29377 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60064)

(assert (=> b!969678 (= res!649071 (and (= (size!29376 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29377 _keys!1717) (size!29376 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969679 () Bool)

(declare-fun res!649067 () Bool)

(assert (=> b!969679 (=> (not res!649067) (not e!546665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60064 (_ BitVec 32)) Bool)

(assert (=> b!969679 (= res!649067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969680 () Bool)

(declare-fun e!546664 () Bool)

(declare-fun tp_is_empty!22033 () Bool)

(assert (=> b!969680 (= e!546664 tp_is_empty!22033)))

(declare-fun b!969681 () Bool)

(declare-fun res!649072 () Bool)

(assert (=> b!969681 (=> (not res!649072) (not e!546665))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969681 (= res!649072 (validKeyInArray!0 (select (arr!28896 _keys!1717) i!822)))))

(declare-fun res!649068 () Bool)

(assert (=> start!83124 (=> (not res!649068) (not e!546665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83124 (= res!649068 (validMask!0 mask!2147))))

(assert (=> start!83124 e!546665))

(assert (=> start!83124 true))

(declare-fun e!546666 () Bool)

(declare-fun array_inv!22429 (array!60062) Bool)

(assert (=> start!83124 (and (array_inv!22429 _values!1425) e!546666)))

(assert (=> start!83124 tp_is_empty!22033))

(assert (=> start!83124 tp!66685))

(declare-fun array_inv!22430 (array!60064) Bool)

(assert (=> start!83124 (array_inv!22430 _keys!1717)))

(declare-fun b!969682 () Bool)

(declare-fun e!546662 () Bool)

(assert (=> b!969682 (= e!546662 tp_is_empty!22033)))

(declare-fun b!969683 () Bool)

(declare-fun res!649069 () Bool)

(assert (=> b!969683 (=> (not res!649069) (not e!546665))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!969683 (= res!649069 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29377 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29377 _keys!1717))))))

(declare-fun mapIsEmpty!35059 () Bool)

(declare-fun mapRes!35059 () Bool)

(assert (=> mapIsEmpty!35059 mapRes!35059))

(declare-fun mapNonEmpty!35059 () Bool)

(declare-fun tp!66684 () Bool)

(assert (=> mapNonEmpty!35059 (= mapRes!35059 (and tp!66684 e!546664))))

(declare-fun mapKey!35059 () (_ BitVec 32))

(declare-fun mapValue!35059 () ValueCell!10535)

(declare-fun mapRest!35059 () (Array (_ BitVec 32) ValueCell!10535))

(assert (=> mapNonEmpty!35059 (= (arr!28895 _values!1425) (store mapRest!35059 mapKey!35059 mapValue!35059))))

(declare-fun b!969684 () Bool)

(assert (=> b!969684 (= e!546666 (and e!546662 mapRes!35059))))

(declare-fun condMapEmpty!35059 () Bool)

(declare-fun mapDefault!35059 () ValueCell!10535)

(assert (=> b!969684 (= condMapEmpty!35059 (= (arr!28895 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10535)) mapDefault!35059)))))

(declare-fun b!969685 () Bool)

(declare-fun res!649070 () Bool)

(assert (=> b!969685 (=> (not res!649070) (not e!546665))))

(declare-datatypes ((List!20085 0))(
  ( (Nil!20082) (Cons!20081 (h!21243 (_ BitVec 64)) (t!28439 List!20085)) )
))
(declare-fun arrayNoDuplicates!0 (array!60064 (_ BitVec 32) List!20085) Bool)

(assert (=> b!969685 (= res!649070 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20082))))

(declare-fun b!969686 () Bool)

(assert (=> b!969686 (= e!546665 false)))

(declare-fun zeroValue!1367 () V!34361)

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!431454 () Bool)

(declare-fun minValue!1367 () V!34361)

(declare-datatypes ((tuple2!14264 0))(
  ( (tuple2!14265 (_1!7143 (_ BitVec 64)) (_2!7143 V!34361)) )
))
(declare-datatypes ((List!20086 0))(
  ( (Nil!20083) (Cons!20082 (h!21244 tuple2!14264) (t!28440 List!20086)) )
))
(declare-datatypes ((ListLongMap!12951 0))(
  ( (ListLongMap!12952 (toList!6491 List!20086)) )
))
(declare-fun contains!5539 (ListLongMap!12951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3653 (array!60064 array!60062 (_ BitVec 32) (_ BitVec 32) V!34361 V!34361 (_ BitVec 32) Int) ListLongMap!12951)

(assert (=> b!969686 (= lt!431454 (contains!5539 (getCurrentListMap!3653 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28896 _keys!1717) i!822)))))

(assert (= (and start!83124 res!649068) b!969678))

(assert (= (and b!969678 res!649071) b!969679))

(assert (= (and b!969679 res!649067) b!969685))

(assert (= (and b!969685 res!649070) b!969683))

(assert (= (and b!969683 res!649069) b!969681))

(assert (= (and b!969681 res!649072) b!969686))

(assert (= (and b!969684 condMapEmpty!35059) mapIsEmpty!35059))

(assert (= (and b!969684 (not condMapEmpty!35059)) mapNonEmpty!35059))

(get-info :version)

(assert (= (and mapNonEmpty!35059 ((_ is ValueCellFull!10535) mapValue!35059)) b!969680))

(assert (= (and b!969684 ((_ is ValueCellFull!10535) mapDefault!35059)) b!969682))

(assert (= start!83124 b!969684))

(declare-fun m!897029 () Bool)

(assert (=> b!969681 m!897029))

(assert (=> b!969681 m!897029))

(declare-fun m!897031 () Bool)

(assert (=> b!969681 m!897031))

(declare-fun m!897033 () Bool)

(assert (=> b!969686 m!897033))

(assert (=> b!969686 m!897029))

(assert (=> b!969686 m!897033))

(assert (=> b!969686 m!897029))

(declare-fun m!897035 () Bool)

(assert (=> b!969686 m!897035))

(declare-fun m!897037 () Bool)

(assert (=> mapNonEmpty!35059 m!897037))

(declare-fun m!897039 () Bool)

(assert (=> b!969685 m!897039))

(declare-fun m!897041 () Bool)

(assert (=> b!969679 m!897041))

(declare-fun m!897043 () Bool)

(assert (=> start!83124 m!897043))

(declare-fun m!897045 () Bool)

(assert (=> start!83124 m!897045))

(declare-fun m!897047 () Bool)

(assert (=> start!83124 m!897047))

(check-sat (not b_next!19135) (not mapNonEmpty!35059) (not start!83124) (not b!969679) (not b!969686) b_and!30597 (not b!969685) (not b!969681) tp_is_empty!22033)
(check-sat b_and!30597 (not b_next!19135))
