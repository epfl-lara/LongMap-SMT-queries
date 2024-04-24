; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83310 () Bool)

(assert start!83310)

(declare-fun b_free!19135 () Bool)

(declare-fun b_next!19135 () Bool)

(assert (=> start!83310 (= b_free!19135 (not b_next!19135))))

(declare-fun tp!66685 () Bool)

(declare-fun b_and!30633 () Bool)

(assert (=> start!83310 (= tp!66685 b_and!30633)))

(declare-fun b!970820 () Bool)

(declare-fun res!649526 () Bool)

(declare-fun e!547395 () Bool)

(assert (=> b!970820 (=> (not res!649526) (not e!547395))))

(declare-datatypes ((array!60146 0))(
  ( (array!60147 (arr!28932 (Array (_ BitVec 32) (_ BitVec 64))) (size!29412 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60146)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970820 (= res!649526 (validKeyInArray!0 (select (arr!28932 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35059 () Bool)

(declare-fun mapRes!35059 () Bool)

(declare-fun tp!66684 () Bool)

(declare-fun e!547393 () Bool)

(assert (=> mapNonEmpty!35059 (= mapRes!35059 (and tp!66684 e!547393))))

(declare-datatypes ((V!34361 0))(
  ( (V!34362 (val!11067 Int)) )
))
(declare-datatypes ((ValueCell!10535 0))(
  ( (ValueCellFull!10535 (v!13623 V!34361)) (EmptyCell!10535) )
))
(declare-datatypes ((array!60148 0))(
  ( (array!60149 (arr!28933 (Array (_ BitVec 32) ValueCell!10535)) (size!29413 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60148)

(declare-fun mapKey!35059 () (_ BitVec 32))

(declare-fun mapValue!35059 () ValueCell!10535)

(declare-fun mapRest!35059 () (Array (_ BitVec 32) ValueCell!10535))

(assert (=> mapNonEmpty!35059 (= (arr!28933 _values!1425) (store mapRest!35059 mapKey!35059 mapValue!35059))))

(declare-fun b!970821 () Bool)

(declare-fun tp_is_empty!22033 () Bool)

(assert (=> b!970821 (= e!547393 tp_is_empty!22033)))

(declare-fun b!970822 () Bool)

(declare-fun res!649521 () Bool)

(assert (=> b!970822 (=> (not res!649521) (not e!547395))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!970822 (= res!649521 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29412 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29412 _keys!1717))))))

(declare-fun b!970823 () Bool)

(declare-fun e!547392 () Bool)

(declare-fun e!547396 () Bool)

(assert (=> b!970823 (= e!547392 (and e!547396 mapRes!35059))))

(declare-fun condMapEmpty!35059 () Bool)

(declare-fun mapDefault!35059 () ValueCell!10535)

(assert (=> b!970823 (= condMapEmpty!35059 (= (arr!28933 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10535)) mapDefault!35059)))))

(declare-fun res!649523 () Bool)

(assert (=> start!83310 (=> (not res!649523) (not e!547395))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83310 (= res!649523 (validMask!0 mask!2147))))

(assert (=> start!83310 e!547395))

(assert (=> start!83310 true))

(declare-fun array_inv!22445 (array!60148) Bool)

(assert (=> start!83310 (and (array_inv!22445 _values!1425) e!547392)))

(assert (=> start!83310 tp_is_empty!22033))

(assert (=> start!83310 tp!66685))

(declare-fun array_inv!22446 (array!60146) Bool)

(assert (=> start!83310 (array_inv!22446 _keys!1717)))

(declare-fun b!970824 () Bool)

(declare-fun res!649525 () Bool)

(assert (=> b!970824 (=> (not res!649525) (not e!547395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60146 (_ BitVec 32)) Bool)

(assert (=> b!970824 (= res!649525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970825 () Bool)

(declare-fun res!649524 () Bool)

(assert (=> b!970825 (=> (not res!649524) (not e!547395))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970825 (= res!649524 (and (= (size!29413 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29412 _keys!1717) (size!29413 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970826 () Bool)

(declare-fun res!649522 () Bool)

(assert (=> b!970826 (=> (not res!649522) (not e!547395))))

(declare-datatypes ((List!20033 0))(
  ( (Nil!20030) (Cons!20029 (h!21197 (_ BitVec 64)) (t!28388 List!20033)) )
))
(declare-fun arrayNoDuplicates!0 (array!60146 (_ BitVec 32) List!20033) Bool)

(assert (=> b!970826 (= res!649522 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20030))))

(declare-fun b!970827 () Bool)

(assert (=> b!970827 (= e!547396 tp_is_empty!22033)))

(declare-fun b!970828 () Bool)

(assert (=> b!970828 (= e!547395 false)))

(declare-fun lt!432051 () Bool)

(declare-fun zeroValue!1367 () V!34361)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34361)

(declare-datatypes ((tuple2!14174 0))(
  ( (tuple2!14175 (_1!7098 (_ BitVec 64)) (_2!7098 V!34361)) )
))
(declare-datatypes ((List!20034 0))(
  ( (Nil!20031) (Cons!20030 (h!21198 tuple2!14174) (t!28389 List!20034)) )
))
(declare-datatypes ((ListLongMap!12873 0))(
  ( (ListLongMap!12874 (toList!6452 List!20034)) )
))
(declare-fun contains!5567 (ListLongMap!12873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3685 (array!60146 array!60148 (_ BitVec 32) (_ BitVec 32) V!34361 V!34361 (_ BitVec 32) Int) ListLongMap!12873)

(assert (=> b!970828 (= lt!432051 (contains!5567 (getCurrentListMap!3685 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28932 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35059 () Bool)

(assert (=> mapIsEmpty!35059 mapRes!35059))

(assert (= (and start!83310 res!649523) b!970825))

(assert (= (and b!970825 res!649524) b!970824))

(assert (= (and b!970824 res!649525) b!970826))

(assert (= (and b!970826 res!649522) b!970822))

(assert (= (and b!970822 res!649521) b!970820))

(assert (= (and b!970820 res!649526) b!970828))

(assert (= (and b!970823 condMapEmpty!35059) mapIsEmpty!35059))

(assert (= (and b!970823 (not condMapEmpty!35059)) mapNonEmpty!35059))

(get-info :version)

(assert (= (and mapNonEmpty!35059 ((_ is ValueCellFull!10535) mapValue!35059)) b!970821))

(assert (= (and b!970823 ((_ is ValueCellFull!10535) mapDefault!35059)) b!970827))

(assert (= start!83310 b!970823))

(declare-fun m!899081 () Bool)

(assert (=> b!970820 m!899081))

(assert (=> b!970820 m!899081))

(declare-fun m!899083 () Bool)

(assert (=> b!970820 m!899083))

(declare-fun m!899085 () Bool)

(assert (=> b!970826 m!899085))

(declare-fun m!899087 () Bool)

(assert (=> b!970824 m!899087))

(declare-fun m!899089 () Bool)

(assert (=> mapNonEmpty!35059 m!899089))

(declare-fun m!899091 () Bool)

(assert (=> b!970828 m!899091))

(assert (=> b!970828 m!899081))

(assert (=> b!970828 m!899091))

(assert (=> b!970828 m!899081))

(declare-fun m!899093 () Bool)

(assert (=> b!970828 m!899093))

(declare-fun m!899095 () Bool)

(assert (=> start!83310 m!899095))

(declare-fun m!899097 () Bool)

(assert (=> start!83310 m!899097))

(declare-fun m!899099 () Bool)

(assert (=> start!83310 m!899099))

(check-sat (not b!970826) (not b!970828) (not mapNonEmpty!35059) (not start!83310) b_and!30633 (not b!970824) (not b!970820) tp_is_empty!22033 (not b_next!19135))
(check-sat b_and!30633 (not b_next!19135))
