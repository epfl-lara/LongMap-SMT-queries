; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83210 () Bool)

(assert start!83210)

(declare-fun b_free!19203 () Bool)

(declare-fun b_next!19203 () Bool)

(assert (=> start!83210 (= b_free!19203 (not b_next!19203))))

(declare-fun tp!66887 () Bool)

(declare-fun b_and!30691 () Bool)

(assert (=> start!83210 (= tp!66887 b_and!30691)))

(declare-fun b!970849 () Bool)

(declare-fun e!547321 () Bool)

(declare-fun tp_is_empty!22101 () Bool)

(assert (=> b!970849 (= e!547321 tp_is_empty!22101)))

(declare-fun b!970850 () Bool)

(declare-fun e!547323 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((array!60257 0))(
  ( (array!60258 (arr!28992 (Array (_ BitVec 32) (_ BitVec 64))) (size!29471 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60257)

(assert (=> b!970850 (= e!547323 (bvsgt (bvsub from!2118 #b00000000000000000000000000000001) (size!29471 _keys!1717)))))

(declare-fun b!970851 () Bool)

(declare-fun res!649808 () Bool)

(assert (=> b!970851 (=> (not res!649808) (not e!547323))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34451 0))(
  ( (V!34452 (val!11101 Int)) )
))
(declare-datatypes ((ValueCell!10569 0))(
  ( (ValueCellFull!10569 (v!13660 V!34451)) (EmptyCell!10569) )
))
(declare-datatypes ((array!60259 0))(
  ( (array!60260 (arr!28993 (Array (_ BitVec 32) ValueCell!10569)) (size!29472 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60259)

(declare-fun zeroValue!1367 () V!34451)

(declare-fun minValue!1367 () V!34451)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14226 0))(
  ( (tuple2!14227 (_1!7124 (_ BitVec 64)) (_2!7124 V!34451)) )
))
(declare-datatypes ((List!20096 0))(
  ( (Nil!20093) (Cons!20092 (h!21254 tuple2!14226) (t!28459 List!20096)) )
))
(declare-datatypes ((ListLongMap!12923 0))(
  ( (ListLongMap!12924 (toList!6477 List!20096)) )
))
(declare-fun contains!5581 (ListLongMap!12923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3710 (array!60257 array!60259 (_ BitVec 32) (_ BitVec 32) V!34451 V!34451 (_ BitVec 32) Int) ListLongMap!12923)

(assert (=> b!970851 (= res!649808 (contains!5581 (getCurrentListMap!3710 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28992 _keys!1717) i!822)))))

(declare-fun b!970852 () Bool)

(declare-fun res!649809 () Bool)

(assert (=> b!970852 (=> (not res!649809) (not e!547323))))

(declare-datatypes ((List!20097 0))(
  ( (Nil!20094) (Cons!20093 (h!21255 (_ BitVec 64)) (t!28460 List!20097)) )
))
(declare-fun arrayNoDuplicates!0 (array!60257 (_ BitVec 32) List!20097) Bool)

(assert (=> b!970852 (= res!649809 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20094))))

(declare-fun b!970853 () Bool)

(declare-fun res!649805 () Bool)

(assert (=> b!970853 (=> (not res!649805) (not e!547323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970853 (= res!649805 (validKeyInArray!0 (select (arr!28992 _keys!1717) i!822)))))

(declare-fun b!970854 () Bool)

(declare-fun res!649803 () Bool)

(assert (=> b!970854 (=> (not res!649803) (not e!547323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60257 (_ BitVec 32)) Bool)

(assert (=> b!970854 (= res!649803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970855 () Bool)

(declare-fun res!649806 () Bool)

(assert (=> b!970855 (=> (not res!649806) (not e!547323))))

(assert (=> b!970855 (= res!649806 (and (= (size!29472 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29471 _keys!1717) (size!29472 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35161 () Bool)

(declare-fun mapRes!35161 () Bool)

(assert (=> mapIsEmpty!35161 mapRes!35161))

(declare-fun res!649807 () Bool)

(assert (=> start!83210 (=> (not res!649807) (not e!547323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83210 (= res!649807 (validMask!0 mask!2147))))

(assert (=> start!83210 e!547323))

(assert (=> start!83210 true))

(declare-fun e!547320 () Bool)

(declare-fun array_inv!22437 (array!60259) Bool)

(assert (=> start!83210 (and (array_inv!22437 _values!1425) e!547320)))

(assert (=> start!83210 tp_is_empty!22101))

(assert (=> start!83210 tp!66887))

(declare-fun array_inv!22438 (array!60257) Bool)

(assert (=> start!83210 (array_inv!22438 _keys!1717)))

(declare-fun b!970856 () Bool)

(declare-fun res!649804 () Bool)

(assert (=> b!970856 (=> (not res!649804) (not e!547323))))

(assert (=> b!970856 (= res!649804 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29471 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29471 _keys!1717))))))

(declare-fun mapNonEmpty!35161 () Bool)

(declare-fun tp!66888 () Bool)

(assert (=> mapNonEmpty!35161 (= mapRes!35161 (and tp!66888 e!547321))))

(declare-fun mapKey!35161 () (_ BitVec 32))

(declare-fun mapValue!35161 () ValueCell!10569)

(declare-fun mapRest!35161 () (Array (_ BitVec 32) ValueCell!10569))

(assert (=> mapNonEmpty!35161 (= (arr!28993 _values!1425) (store mapRest!35161 mapKey!35161 mapValue!35161))))

(declare-fun b!970857 () Bool)

(declare-fun e!547324 () Bool)

(assert (=> b!970857 (= e!547324 tp_is_empty!22101)))

(declare-fun b!970858 () Bool)

(assert (=> b!970858 (= e!547320 (and e!547324 mapRes!35161))))

(declare-fun condMapEmpty!35161 () Bool)

(declare-fun mapDefault!35161 () ValueCell!10569)

(assert (=> b!970858 (= condMapEmpty!35161 (= (arr!28993 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10569)) mapDefault!35161)))))

(assert (= (and start!83210 res!649807) b!970855))

(assert (= (and b!970855 res!649806) b!970854))

(assert (= (and b!970854 res!649803) b!970852))

(assert (= (and b!970852 res!649809) b!970856))

(assert (= (and b!970856 res!649804) b!970853))

(assert (= (and b!970853 res!649805) b!970851))

(assert (= (and b!970851 res!649808) b!970850))

(assert (= (and b!970858 condMapEmpty!35161) mapIsEmpty!35161))

(assert (= (and b!970858 (not condMapEmpty!35161)) mapNonEmpty!35161))

(get-info :version)

(assert (= (and mapNonEmpty!35161 ((_ is ValueCellFull!10569) mapValue!35161)) b!970849))

(assert (= (and b!970858 ((_ is ValueCellFull!10569) mapDefault!35161)) b!970857))

(assert (= start!83210 b!970858))

(declare-fun m!898467 () Bool)

(assert (=> mapNonEmpty!35161 m!898467))

(declare-fun m!898469 () Bool)

(assert (=> b!970853 m!898469))

(assert (=> b!970853 m!898469))

(declare-fun m!898471 () Bool)

(assert (=> b!970853 m!898471))

(declare-fun m!898473 () Bool)

(assert (=> b!970852 m!898473))

(declare-fun m!898475 () Bool)

(assert (=> start!83210 m!898475))

(declare-fun m!898477 () Bool)

(assert (=> start!83210 m!898477))

(declare-fun m!898479 () Bool)

(assert (=> start!83210 m!898479))

(declare-fun m!898481 () Bool)

(assert (=> b!970851 m!898481))

(assert (=> b!970851 m!898469))

(assert (=> b!970851 m!898481))

(assert (=> b!970851 m!898469))

(declare-fun m!898483 () Bool)

(assert (=> b!970851 m!898483))

(declare-fun m!898485 () Bool)

(assert (=> b!970854 m!898485))

(check-sat tp_is_empty!22101 b_and!30691 (not b!970853) (not b!970854) (not b!970852) (not start!83210) (not mapNonEmpty!35161) (not b_next!19203) (not b!970851))
(check-sat b_and!30691 (not b_next!19203))
