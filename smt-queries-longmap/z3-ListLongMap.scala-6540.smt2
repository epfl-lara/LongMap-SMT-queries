; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83292 () Bool)

(assert start!83292)

(declare-fun b_free!19117 () Bool)

(declare-fun b_next!19117 () Bool)

(assert (=> start!83292 (= b_free!19117 (not b_next!19117))))

(declare-fun tp!66631 () Bool)

(declare-fun b_and!30615 () Bool)

(assert (=> start!83292 (= tp!66631 b_and!30615)))

(declare-fun b!970577 () Bool)

(declare-fun res!649362 () Bool)

(declare-fun e!547258 () Bool)

(assert (=> b!970577 (=> (not res!649362) (not e!547258))))

(declare-datatypes ((array!60110 0))(
  ( (array!60111 (arr!28914 (Array (_ BitVec 32) (_ BitVec 64))) (size!29394 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60110)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60110 (_ BitVec 32)) Bool)

(assert (=> b!970577 (= res!649362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970578 () Bool)

(declare-fun res!649364 () Bool)

(assert (=> b!970578 (=> (not res!649364) (not e!547258))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970578 (= res!649364 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29394 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29394 _keys!1717))))))

(declare-fun b!970579 () Bool)

(declare-fun res!649361 () Bool)

(assert (=> b!970579 (=> (not res!649361) (not e!547258))))

(declare-datatypes ((V!34337 0))(
  ( (V!34338 (val!11058 Int)) )
))
(declare-datatypes ((ValueCell!10526 0))(
  ( (ValueCellFull!10526 (v!13614 V!34337)) (EmptyCell!10526) )
))
(declare-datatypes ((array!60112 0))(
  ( (array!60113 (arr!28915 (Array (_ BitVec 32) ValueCell!10526)) (size!29395 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60112)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970579 (= res!649361 (and (= (size!29395 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29394 _keys!1717) (size!29395 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970580 () Bool)

(declare-fun e!547257 () Bool)

(declare-fun tp_is_empty!22015 () Bool)

(assert (=> b!970580 (= e!547257 tp_is_empty!22015)))

(declare-fun mapIsEmpty!35032 () Bool)

(declare-fun mapRes!35032 () Bool)

(assert (=> mapIsEmpty!35032 mapRes!35032))

(declare-fun b!970581 () Bool)

(declare-fun e!547261 () Bool)

(assert (=> b!970581 (= e!547261 (and e!547257 mapRes!35032))))

(declare-fun condMapEmpty!35032 () Bool)

(declare-fun mapDefault!35032 () ValueCell!10526)

(assert (=> b!970581 (= condMapEmpty!35032 (= (arr!28915 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10526)) mapDefault!35032)))))

(declare-fun b!970582 () Bool)

(assert (=> b!970582 (= e!547258 false)))

(declare-fun zeroValue!1367 () V!34337)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34337)

(declare-fun lt!432024 () Bool)

(declare-datatypes ((tuple2!14162 0))(
  ( (tuple2!14163 (_1!7092 (_ BitVec 64)) (_2!7092 V!34337)) )
))
(declare-datatypes ((List!20024 0))(
  ( (Nil!20021) (Cons!20020 (h!21188 tuple2!14162) (t!28379 List!20024)) )
))
(declare-datatypes ((ListLongMap!12861 0))(
  ( (ListLongMap!12862 (toList!6446 List!20024)) )
))
(declare-fun contains!5561 (ListLongMap!12861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3679 (array!60110 array!60112 (_ BitVec 32) (_ BitVec 32) V!34337 V!34337 (_ BitVec 32) Int) ListLongMap!12861)

(assert (=> b!970582 (= lt!432024 (contains!5561 (getCurrentListMap!3679 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28914 _keys!1717) i!822)))))

(declare-fun res!649363 () Bool)

(assert (=> start!83292 (=> (not res!649363) (not e!547258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83292 (= res!649363 (validMask!0 mask!2147))))

(assert (=> start!83292 e!547258))

(assert (=> start!83292 true))

(declare-fun array_inv!22433 (array!60112) Bool)

(assert (=> start!83292 (and (array_inv!22433 _values!1425) e!547261)))

(assert (=> start!83292 tp_is_empty!22015))

(assert (=> start!83292 tp!66631))

(declare-fun array_inv!22434 (array!60110) Bool)

(assert (=> start!83292 (array_inv!22434 _keys!1717)))

(declare-fun mapNonEmpty!35032 () Bool)

(declare-fun tp!66630 () Bool)

(declare-fun e!547260 () Bool)

(assert (=> mapNonEmpty!35032 (= mapRes!35032 (and tp!66630 e!547260))))

(declare-fun mapRest!35032 () (Array (_ BitVec 32) ValueCell!10526))

(declare-fun mapValue!35032 () ValueCell!10526)

(declare-fun mapKey!35032 () (_ BitVec 32))

(assert (=> mapNonEmpty!35032 (= (arr!28915 _values!1425) (store mapRest!35032 mapKey!35032 mapValue!35032))))

(declare-fun b!970583 () Bool)

(assert (=> b!970583 (= e!547260 tp_is_empty!22015)))

(declare-fun b!970584 () Bool)

(declare-fun res!649360 () Bool)

(assert (=> b!970584 (=> (not res!649360) (not e!547258))))

(declare-datatypes ((List!20025 0))(
  ( (Nil!20022) (Cons!20021 (h!21189 (_ BitVec 64)) (t!28380 List!20025)) )
))
(declare-fun arrayNoDuplicates!0 (array!60110 (_ BitVec 32) List!20025) Bool)

(assert (=> b!970584 (= res!649360 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20022))))

(declare-fun b!970585 () Bool)

(declare-fun res!649359 () Bool)

(assert (=> b!970585 (=> (not res!649359) (not e!547258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970585 (= res!649359 (validKeyInArray!0 (select (arr!28914 _keys!1717) i!822)))))

(assert (= (and start!83292 res!649363) b!970579))

(assert (= (and b!970579 res!649361) b!970577))

(assert (= (and b!970577 res!649362) b!970584))

(assert (= (and b!970584 res!649360) b!970578))

(assert (= (and b!970578 res!649364) b!970585))

(assert (= (and b!970585 res!649359) b!970582))

(assert (= (and b!970581 condMapEmpty!35032) mapIsEmpty!35032))

(assert (= (and b!970581 (not condMapEmpty!35032)) mapNonEmpty!35032))

(get-info :version)

(assert (= (and mapNonEmpty!35032 ((_ is ValueCellFull!10526) mapValue!35032)) b!970583))

(assert (= (and b!970581 ((_ is ValueCellFull!10526) mapDefault!35032)) b!970580))

(assert (= start!83292 b!970581))

(declare-fun m!898901 () Bool)

(assert (=> b!970577 m!898901))

(declare-fun m!898903 () Bool)

(assert (=> mapNonEmpty!35032 m!898903))

(declare-fun m!898905 () Bool)

(assert (=> start!83292 m!898905))

(declare-fun m!898907 () Bool)

(assert (=> start!83292 m!898907))

(declare-fun m!898909 () Bool)

(assert (=> start!83292 m!898909))

(declare-fun m!898911 () Bool)

(assert (=> b!970584 m!898911))

(declare-fun m!898913 () Bool)

(assert (=> b!970585 m!898913))

(assert (=> b!970585 m!898913))

(declare-fun m!898915 () Bool)

(assert (=> b!970585 m!898915))

(declare-fun m!898917 () Bool)

(assert (=> b!970582 m!898917))

(assert (=> b!970582 m!898913))

(assert (=> b!970582 m!898917))

(assert (=> b!970582 m!898913))

(declare-fun m!898919 () Bool)

(assert (=> b!970582 m!898919))

(check-sat (not b!970582) (not b_next!19117) (not mapNonEmpty!35032) b_and!30615 (not b!970585) (not start!83292) (not b!970584) (not b!970577) tp_is_empty!22015)
(check-sat b_and!30615 (not b_next!19117))
