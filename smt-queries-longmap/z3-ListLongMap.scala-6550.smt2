; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83166 () Bool)

(assert start!83166)

(declare-fun b_free!19177 () Bool)

(declare-fun b_next!19177 () Bool)

(assert (=> start!83166 (= b_free!19177 (not b_next!19177))))

(declare-fun tp!66811 () Bool)

(declare-fun b_and!30639 () Bool)

(assert (=> start!83166 (= tp!66811 b_and!30639)))

(declare-fun b!970254 () Bool)

(declare-fun res!649457 () Bool)

(declare-fun e!546980 () Bool)

(assert (=> b!970254 (=> (not res!649457) (not e!546980))))

(declare-datatypes ((array!60140 0))(
  ( (array!60141 (arr!28934 (Array (_ BitVec 32) (_ BitVec 64))) (size!29415 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60140)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60140 (_ BitVec 32)) Bool)

(assert (=> b!970254 (= res!649457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970255 () Bool)

(assert (=> b!970255 (= e!546980 false)))

(declare-datatypes ((V!34417 0))(
  ( (V!34418 (val!11088 Int)) )
))
(declare-datatypes ((ValueCell!10556 0))(
  ( (ValueCellFull!10556 (v!13646 V!34417)) (EmptyCell!10556) )
))
(declare-datatypes ((array!60142 0))(
  ( (array!60143 (arr!28935 (Array (_ BitVec 32) ValueCell!10556)) (size!29416 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60142)

(declare-fun lt!431508 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34417)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34417)

(declare-datatypes ((tuple2!14286 0))(
  ( (tuple2!14287 (_1!7154 (_ BitVec 64)) (_2!7154 V!34417)) )
))
(declare-datatypes ((List!20109 0))(
  ( (Nil!20106) (Cons!20105 (h!21267 tuple2!14286) (t!28463 List!20109)) )
))
(declare-datatypes ((ListLongMap!12973 0))(
  ( (ListLongMap!12974 (toList!6502 List!20109)) )
))
(declare-fun contains!5550 (ListLongMap!12973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3664 (array!60140 array!60142 (_ BitVec 32) (_ BitVec 32) V!34417 V!34417 (_ BitVec 32) Int) ListLongMap!12973)

(assert (=> b!970255 (= lt!431508 (contains!5550 (getCurrentListMap!3664 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28934 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35122 () Bool)

(declare-fun mapRes!35122 () Bool)

(assert (=> mapIsEmpty!35122 mapRes!35122))

(declare-fun res!649454 () Bool)

(assert (=> start!83166 (=> (not res!649454) (not e!546980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83166 (= res!649454 (validMask!0 mask!2147))))

(assert (=> start!83166 e!546980))

(assert (=> start!83166 true))

(declare-fun e!546978 () Bool)

(declare-fun array_inv!22457 (array!60142) Bool)

(assert (=> start!83166 (and (array_inv!22457 _values!1425) e!546978)))

(declare-fun tp_is_empty!22075 () Bool)

(assert (=> start!83166 tp_is_empty!22075))

(assert (=> start!83166 tp!66811))

(declare-fun array_inv!22458 (array!60140) Bool)

(assert (=> start!83166 (array_inv!22458 _keys!1717)))

(declare-fun b!970256 () Bool)

(declare-fun res!649458 () Bool)

(assert (=> b!970256 (=> (not res!649458) (not e!546980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970256 (= res!649458 (validKeyInArray!0 (select (arr!28934 _keys!1717) i!822)))))

(declare-fun b!970257 () Bool)

(declare-fun e!546979 () Bool)

(assert (=> b!970257 (= e!546979 tp_is_empty!22075)))

(declare-fun b!970258 () Bool)

(declare-fun res!649459 () Bool)

(assert (=> b!970258 (=> (not res!649459) (not e!546980))))

(declare-datatypes ((List!20110 0))(
  ( (Nil!20107) (Cons!20106 (h!21268 (_ BitVec 64)) (t!28464 List!20110)) )
))
(declare-fun arrayNoDuplicates!0 (array!60140 (_ BitVec 32) List!20110) Bool)

(assert (=> b!970258 (= res!649459 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20107))))

(declare-fun b!970259 () Bool)

(declare-fun res!649456 () Bool)

(assert (=> b!970259 (=> (not res!649456) (not e!546980))))

(assert (=> b!970259 (= res!649456 (and (= (size!29416 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29415 _keys!1717) (size!29416 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970260 () Bool)

(declare-fun e!546977 () Bool)

(assert (=> b!970260 (= e!546977 tp_is_empty!22075)))

(declare-fun b!970261 () Bool)

(declare-fun res!649455 () Bool)

(assert (=> b!970261 (=> (not res!649455) (not e!546980))))

(assert (=> b!970261 (= res!649455 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29415 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29415 _keys!1717))))))

(declare-fun b!970262 () Bool)

(assert (=> b!970262 (= e!546978 (and e!546977 mapRes!35122))))

(declare-fun condMapEmpty!35122 () Bool)

(declare-fun mapDefault!35122 () ValueCell!10556)

(assert (=> b!970262 (= condMapEmpty!35122 (= (arr!28935 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10556)) mapDefault!35122)))))

(declare-fun mapNonEmpty!35122 () Bool)

(declare-fun tp!66810 () Bool)

(assert (=> mapNonEmpty!35122 (= mapRes!35122 (and tp!66810 e!546979))))

(declare-fun mapRest!35122 () (Array (_ BitVec 32) ValueCell!10556))

(declare-fun mapValue!35122 () ValueCell!10556)

(declare-fun mapKey!35122 () (_ BitVec 32))

(assert (=> mapNonEmpty!35122 (= (arr!28935 _values!1425) (store mapRest!35122 mapKey!35122 mapValue!35122))))

(assert (= (and start!83166 res!649454) b!970259))

(assert (= (and b!970259 res!649456) b!970254))

(assert (= (and b!970254 res!649457) b!970258))

(assert (= (and b!970258 res!649459) b!970261))

(assert (= (and b!970261 res!649455) b!970256))

(assert (= (and b!970256 res!649458) b!970255))

(assert (= (and b!970262 condMapEmpty!35122) mapIsEmpty!35122))

(assert (= (and b!970262 (not condMapEmpty!35122)) mapNonEmpty!35122))

(get-info :version)

(assert (= (and mapNonEmpty!35122 ((_ is ValueCellFull!10556) mapValue!35122)) b!970257))

(assert (= (and b!970262 ((_ is ValueCellFull!10556) mapDefault!35122)) b!970260))

(assert (= start!83166 b!970262))

(declare-fun m!897449 () Bool)

(assert (=> b!970256 m!897449))

(assert (=> b!970256 m!897449))

(declare-fun m!897451 () Bool)

(assert (=> b!970256 m!897451))

(declare-fun m!897453 () Bool)

(assert (=> b!970258 m!897453))

(declare-fun m!897455 () Bool)

(assert (=> b!970255 m!897455))

(assert (=> b!970255 m!897449))

(assert (=> b!970255 m!897455))

(assert (=> b!970255 m!897449))

(declare-fun m!897457 () Bool)

(assert (=> b!970255 m!897457))

(declare-fun m!897459 () Bool)

(assert (=> start!83166 m!897459))

(declare-fun m!897461 () Bool)

(assert (=> start!83166 m!897461))

(declare-fun m!897463 () Bool)

(assert (=> start!83166 m!897463))

(declare-fun m!897465 () Bool)

(assert (=> b!970254 m!897465))

(declare-fun m!897467 () Bool)

(assert (=> mapNonEmpty!35122 m!897467))

(check-sat (not b!970256) tp_is_empty!22075 (not b!970255) (not start!83166) (not b!970254) (not b_next!19177) b_and!30639 (not mapNonEmpty!35122) (not b!970258))
(check-sat b_and!30639 (not b_next!19177))
