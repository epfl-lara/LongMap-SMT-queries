; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83562 () Bool)

(assert start!83562)

(declare-fun b_free!19387 () Bool)

(declare-fun b_next!19387 () Bool)

(assert (=> start!83562 (= b_free!19387 (not b_next!19387))))

(declare-fun tp!67441 () Bool)

(declare-fun b_and!30999 () Bool)

(assert (=> start!83562 (= tp!67441 b_and!30999)))

(declare-fun b!974797 () Bool)

(declare-fun res!652254 () Bool)

(declare-fun e!549536 () Bool)

(assert (=> b!974797 (=> (not res!652254) (not e!549536))))

(declare-datatypes ((array!60642 0))(
  ( (array!60643 (arr!29180 (Array (_ BitVec 32) (_ BitVec 64))) (size!29660 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60642)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60642 (_ BitVec 32)) Bool)

(assert (=> b!974797 (= res!652254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974798 () Bool)

(declare-fun e!549537 () Bool)

(declare-fun tp_is_empty!22285 () Bool)

(assert (=> b!974798 (= e!549537 tp_is_empty!22285)))

(declare-fun b!974799 () Bool)

(declare-fun e!549535 () Bool)

(assert (=> b!974799 (= e!549535 tp_is_empty!22285)))

(declare-fun b!974800 () Bool)

(declare-fun res!652256 () Bool)

(assert (=> b!974800 (=> (not res!652256) (not e!549536))))

(declare-datatypes ((V!34697 0))(
  ( (V!34698 (val!11193 Int)) )
))
(declare-datatypes ((ValueCell!10661 0))(
  ( (ValueCellFull!10661 (v!13749 V!34697)) (EmptyCell!10661) )
))
(declare-datatypes ((array!60644 0))(
  ( (array!60645 (arr!29181 (Array (_ BitVec 32) ValueCell!10661)) (size!29661 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60644)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974800 (= res!652256 (and (= (size!29661 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29660 _keys!1717) (size!29661 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974801 () Bool)

(declare-fun res!652251 () Bool)

(assert (=> b!974801 (=> (not res!652251) (not e!549536))))

(declare-datatypes ((List!20231 0))(
  ( (Nil!20228) (Cons!20227 (h!21395 (_ BitVec 64)) (t!28700 List!20231)) )
))
(declare-fun arrayNoDuplicates!0 (array!60642 (_ BitVec 32) List!20231) Bool)

(assert (=> b!974801 (= res!652251 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20228))))

(declare-fun b!974802 () Bool)

(declare-fun res!652255 () Bool)

(assert (=> b!974802 (=> (not res!652255) (not e!549536))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974802 (= res!652255 (validKeyInArray!0 (select (arr!29180 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35437 () Bool)

(declare-fun mapRes!35437 () Bool)

(declare-fun tp!67440 () Bool)

(assert (=> mapNonEmpty!35437 (= mapRes!35437 (and tp!67440 e!549537))))

(declare-fun mapRest!35437 () (Array (_ BitVec 32) ValueCell!10661))

(declare-fun mapKey!35437 () (_ BitVec 32))

(declare-fun mapValue!35437 () ValueCell!10661)

(assert (=> mapNonEmpty!35437 (= (arr!29181 _values!1425) (store mapRest!35437 mapKey!35437 mapValue!35437))))

(declare-fun b!974804 () Bool)

(assert (=> b!974804 (= e!549536 false)))

(declare-fun zeroValue!1367 () V!34697)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34697)

(declare-datatypes ((tuple2!14384 0))(
  ( (tuple2!14385 (_1!7203 (_ BitVec 64)) (_2!7203 V!34697)) )
))
(declare-datatypes ((List!20232 0))(
  ( (Nil!20229) (Cons!20228 (h!21396 tuple2!14384) (t!28701 List!20232)) )
))
(declare-datatypes ((ListLongMap!13083 0))(
  ( (ListLongMap!13084 (toList!6557 List!20232)) )
))
(declare-fun lt!433077 () ListLongMap!13083)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun getCurrentListMap!3790 (array!60642 array!60644 (_ BitVec 32) (_ BitVec 32) V!34697 V!34697 (_ BitVec 32) Int) ListLongMap!13083)

(assert (=> b!974804 (= lt!433077 (getCurrentListMap!3790 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974805 () Bool)

(declare-fun res!652253 () Bool)

(assert (=> b!974805 (=> (not res!652253) (not e!549536))))

(declare-fun contains!5663 (ListLongMap!13083 (_ BitVec 64)) Bool)

(assert (=> b!974805 (= res!652253 (contains!5663 (getCurrentListMap!3790 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29180 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35437 () Bool)

(assert (=> mapIsEmpty!35437 mapRes!35437))

(declare-fun b!974806 () Bool)

(declare-fun res!652252 () Bool)

(assert (=> b!974806 (=> (not res!652252) (not e!549536))))

(assert (=> b!974806 (= res!652252 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29660 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29660 _keys!1717))))))

(declare-fun res!652250 () Bool)

(assert (=> start!83562 (=> (not res!652250) (not e!549536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83562 (= res!652250 (validMask!0 mask!2147))))

(assert (=> start!83562 e!549536))

(assert (=> start!83562 true))

(declare-fun e!549534 () Bool)

(declare-fun array_inv!22625 (array!60644) Bool)

(assert (=> start!83562 (and (array_inv!22625 _values!1425) e!549534)))

(assert (=> start!83562 tp_is_empty!22285))

(assert (=> start!83562 tp!67441))

(declare-fun array_inv!22626 (array!60642) Bool)

(assert (=> start!83562 (array_inv!22626 _keys!1717)))

(declare-fun b!974803 () Bool)

(assert (=> b!974803 (= e!549534 (and e!549535 mapRes!35437))))

(declare-fun condMapEmpty!35437 () Bool)

(declare-fun mapDefault!35437 () ValueCell!10661)

(assert (=> b!974803 (= condMapEmpty!35437 (= (arr!29181 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10661)) mapDefault!35437)))))

(assert (= (and start!83562 res!652250) b!974800))

(assert (= (and b!974800 res!652256) b!974797))

(assert (= (and b!974797 res!652254) b!974801))

(assert (= (and b!974801 res!652251) b!974806))

(assert (= (and b!974806 res!652252) b!974802))

(assert (= (and b!974802 res!652255) b!974805))

(assert (= (and b!974805 res!652253) b!974804))

(assert (= (and b!974803 condMapEmpty!35437) mapIsEmpty!35437))

(assert (= (and b!974803 (not condMapEmpty!35437)) mapNonEmpty!35437))

(get-info :version)

(assert (= (and mapNonEmpty!35437 ((_ is ValueCellFull!10661) mapValue!35437)) b!974798))

(assert (= (and b!974803 ((_ is ValueCellFull!10661) mapDefault!35437)) b!974799))

(assert (= start!83562 b!974803))

(declare-fun m!902855 () Bool)

(assert (=> b!974797 m!902855))

(declare-fun m!902857 () Bool)

(assert (=> mapNonEmpty!35437 m!902857))

(declare-fun m!902859 () Bool)

(assert (=> b!974804 m!902859))

(declare-fun m!902861 () Bool)

(assert (=> b!974802 m!902861))

(assert (=> b!974802 m!902861))

(declare-fun m!902863 () Bool)

(assert (=> b!974802 m!902863))

(declare-fun m!902865 () Bool)

(assert (=> b!974801 m!902865))

(declare-fun m!902867 () Bool)

(assert (=> start!83562 m!902867))

(declare-fun m!902869 () Bool)

(assert (=> start!83562 m!902869))

(declare-fun m!902871 () Bool)

(assert (=> start!83562 m!902871))

(declare-fun m!902873 () Bool)

(assert (=> b!974805 m!902873))

(assert (=> b!974805 m!902861))

(assert (=> b!974805 m!902873))

(assert (=> b!974805 m!902861))

(declare-fun m!902875 () Bool)

(assert (=> b!974805 m!902875))

(check-sat (not mapNonEmpty!35437) (not b!974801) tp_is_empty!22285 (not b!974797) b_and!30999 (not b_next!19387) (not start!83562) (not b!974802) (not b!974804) (not b!974805))
(check-sat b_and!30999 (not b_next!19387))
