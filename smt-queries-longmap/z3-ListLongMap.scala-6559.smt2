; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83406 () Bool)

(assert start!83406)

(declare-fun b_free!19231 () Bool)

(declare-fun b_next!19231 () Bool)

(assert (=> start!83406 (= b_free!19231 (not b_next!19231))))

(declare-fun tp!66973 () Bool)

(declare-fun b_and!30729 () Bool)

(assert (=> start!83406 (= tp!66973 b_and!30729)))

(declare-fun b!972172 () Bool)

(declare-fun res!650441 () Bool)

(declare-fun e!548116 () Bool)

(assert (=> b!972172 (=> (not res!650441) (not e!548116))))

(declare-datatypes ((array!60332 0))(
  ( (array!60333 (arr!29025 (Array (_ BitVec 32) (_ BitVec 64))) (size!29505 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60332)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972172 (= res!650441 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29505 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29505 _keys!1717))))))

(declare-fun b!972173 () Bool)

(declare-fun res!650443 () Bool)

(assert (=> b!972173 (=> (not res!650443) (not e!548116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972173 (= res!650443 (validKeyInArray!0 (select (arr!29025 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35203 () Bool)

(declare-fun mapRes!35203 () Bool)

(assert (=> mapIsEmpty!35203 mapRes!35203))

(declare-fun b!972175 () Bool)

(assert (=> b!972175 (= e!548116 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34489 0))(
  ( (V!34490 (val!11115 Int)) )
))
(declare-datatypes ((ValueCell!10583 0))(
  ( (ValueCellFull!10583 (v!13671 V!34489)) (EmptyCell!10583) )
))
(declare-datatypes ((array!60334 0))(
  ( (array!60335 (arr!29026 (Array (_ BitVec 32) ValueCell!10583)) (size!29506 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60334)

(declare-datatypes ((tuple2!14248 0))(
  ( (tuple2!14249 (_1!7135 (_ BitVec 64)) (_2!7135 V!34489)) )
))
(declare-datatypes ((List!20103 0))(
  ( (Nil!20100) (Cons!20099 (h!21267 tuple2!14248) (t!28458 List!20103)) )
))
(declare-datatypes ((ListLongMap!12947 0))(
  ( (ListLongMap!12948 (toList!6489 List!20103)) )
))
(declare-fun lt!432177 () ListLongMap!12947)

(declare-fun zeroValue!1367 () V!34489)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34489)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3722 (array!60332 array!60334 (_ BitVec 32) (_ BitVec 32) V!34489 V!34489 (_ BitVec 32) Int) ListLongMap!12947)

(assert (=> b!972175 (= lt!432177 (getCurrentListMap!3722 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35203 () Bool)

(declare-fun tp!66972 () Bool)

(declare-fun e!548115 () Bool)

(assert (=> mapNonEmpty!35203 (= mapRes!35203 (and tp!66972 e!548115))))

(declare-fun mapKey!35203 () (_ BitVec 32))

(declare-fun mapRest!35203 () (Array (_ BitVec 32) ValueCell!10583))

(declare-fun mapValue!35203 () ValueCell!10583)

(assert (=> mapNonEmpty!35203 (= (arr!29026 _values!1425) (store mapRest!35203 mapKey!35203 mapValue!35203))))

(declare-fun b!972176 () Bool)

(declare-fun res!650444 () Bool)

(assert (=> b!972176 (=> (not res!650444) (not e!548116))))

(assert (=> b!972176 (= res!650444 (and (= (size!29506 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29505 _keys!1717) (size!29506 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972177 () Bool)

(declare-fun res!650442 () Bool)

(assert (=> b!972177 (=> (not res!650442) (not e!548116))))

(declare-datatypes ((List!20104 0))(
  ( (Nil!20101) (Cons!20100 (h!21268 (_ BitVec 64)) (t!28459 List!20104)) )
))
(declare-fun arrayNoDuplicates!0 (array!60332 (_ BitVec 32) List!20104) Bool)

(assert (=> b!972177 (= res!650442 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20101))))

(declare-fun b!972178 () Bool)

(declare-fun e!548114 () Bool)

(declare-fun e!548113 () Bool)

(assert (=> b!972178 (= e!548114 (and e!548113 mapRes!35203))))

(declare-fun condMapEmpty!35203 () Bool)

(declare-fun mapDefault!35203 () ValueCell!10583)

(assert (=> b!972178 (= condMapEmpty!35203 (= (arr!29026 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10583)) mapDefault!35203)))))

(declare-fun b!972179 () Bool)

(declare-fun tp_is_empty!22129 () Bool)

(assert (=> b!972179 (= e!548115 tp_is_empty!22129)))

(declare-fun b!972180 () Bool)

(declare-fun res!650447 () Bool)

(assert (=> b!972180 (=> (not res!650447) (not e!548116))))

(declare-fun contains!5603 (ListLongMap!12947 (_ BitVec 64)) Bool)

(assert (=> b!972180 (= res!650447 (contains!5603 (getCurrentListMap!3722 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29025 _keys!1717) i!822)))))

(declare-fun b!972181 () Bool)

(declare-fun res!650445 () Bool)

(assert (=> b!972181 (=> (not res!650445) (not e!548116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60332 (_ BitVec 32)) Bool)

(assert (=> b!972181 (= res!650445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972174 () Bool)

(assert (=> b!972174 (= e!548113 tp_is_empty!22129)))

(declare-fun res!650446 () Bool)

(assert (=> start!83406 (=> (not res!650446) (not e!548116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83406 (= res!650446 (validMask!0 mask!2147))))

(assert (=> start!83406 e!548116))

(assert (=> start!83406 true))

(declare-fun array_inv!22509 (array!60334) Bool)

(assert (=> start!83406 (and (array_inv!22509 _values!1425) e!548114)))

(assert (=> start!83406 tp_is_empty!22129))

(assert (=> start!83406 tp!66973))

(declare-fun array_inv!22510 (array!60332) Bool)

(assert (=> start!83406 (array_inv!22510 _keys!1717)))

(assert (= (and start!83406 res!650446) b!972176))

(assert (= (and b!972176 res!650444) b!972181))

(assert (= (and b!972181 res!650445) b!972177))

(assert (= (and b!972177 res!650442) b!972172))

(assert (= (and b!972172 res!650441) b!972173))

(assert (= (and b!972173 res!650443) b!972180))

(assert (= (and b!972180 res!650447) b!972175))

(assert (= (and b!972178 condMapEmpty!35203) mapIsEmpty!35203))

(assert (= (and b!972178 (not condMapEmpty!35203)) mapNonEmpty!35203))

(get-info :version)

(assert (= (and mapNonEmpty!35203 ((_ is ValueCellFull!10583) mapValue!35203)) b!972179))

(assert (= (and b!972178 ((_ is ValueCellFull!10583) mapDefault!35203)) b!972174))

(assert (= start!83406 b!972178))

(declare-fun m!900065 () Bool)

(assert (=> b!972180 m!900065))

(declare-fun m!900067 () Bool)

(assert (=> b!972180 m!900067))

(assert (=> b!972180 m!900065))

(assert (=> b!972180 m!900067))

(declare-fun m!900069 () Bool)

(assert (=> b!972180 m!900069))

(declare-fun m!900071 () Bool)

(assert (=> b!972175 m!900071))

(declare-fun m!900073 () Bool)

(assert (=> b!972181 m!900073))

(declare-fun m!900075 () Bool)

(assert (=> start!83406 m!900075))

(declare-fun m!900077 () Bool)

(assert (=> start!83406 m!900077))

(declare-fun m!900079 () Bool)

(assert (=> start!83406 m!900079))

(declare-fun m!900081 () Bool)

(assert (=> mapNonEmpty!35203 m!900081))

(declare-fun m!900083 () Bool)

(assert (=> b!972177 m!900083))

(assert (=> b!972173 m!900067))

(assert (=> b!972173 m!900067))

(declare-fun m!900085 () Bool)

(assert (=> b!972173 m!900085))

(check-sat (not b!972181) (not b!972180) (not b!972173) (not b!972175) (not b_next!19231) (not mapNonEmpty!35203) (not start!83406) tp_is_empty!22129 (not b!972177) b_and!30729)
(check-sat b_and!30729 (not b_next!19231))
