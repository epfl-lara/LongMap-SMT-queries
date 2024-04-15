; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83208 () Bool)

(assert start!83208)

(declare-fun b_free!19219 () Bool)

(declare-fun b_next!19219 () Bool)

(assert (=> start!83208 (= b_free!19219 (not b_next!19219))))

(declare-fun tp!66936 () Bool)

(declare-fun b_and!30681 () Bool)

(assert (=> start!83208 (= tp!66936 b_and!30681)))

(declare-fun b!970850 () Bool)

(declare-fun res!649862 () Bool)

(declare-fun e!547296 () Bool)

(assert (=> b!970850 (=> (not res!649862) (not e!547296))))

(declare-datatypes ((array!60220 0))(
  ( (array!60221 (arr!28974 (Array (_ BitVec 32) (_ BitVec 64))) (size!29455 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60220)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970850 (= res!649862 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29455 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29455 _keys!1717))))))

(declare-fun b!970851 () Bool)

(declare-fun e!547292 () Bool)

(declare-fun tp_is_empty!22117 () Bool)

(assert (=> b!970851 (= e!547292 tp_is_empty!22117)))

(declare-fun b!970852 () Bool)

(declare-fun e!547294 () Bool)

(assert (=> b!970852 (= e!547294 tp_is_empty!22117)))

(declare-fun mapNonEmpty!35185 () Bool)

(declare-fun mapRes!35185 () Bool)

(declare-fun tp!66937 () Bool)

(assert (=> mapNonEmpty!35185 (= mapRes!35185 (and tp!66937 e!547292))))

(declare-datatypes ((V!34473 0))(
  ( (V!34474 (val!11109 Int)) )
))
(declare-datatypes ((ValueCell!10577 0))(
  ( (ValueCellFull!10577 (v!13667 V!34473)) (EmptyCell!10577) )
))
(declare-datatypes ((array!60222 0))(
  ( (array!60223 (arr!28975 (Array (_ BitVec 32) ValueCell!10577)) (size!29456 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60222)

(declare-fun mapKey!35185 () (_ BitVec 32))

(declare-fun mapValue!35185 () ValueCell!10577)

(declare-fun mapRest!35185 () (Array (_ BitVec 32) ValueCell!10577))

(assert (=> mapNonEmpty!35185 (= (arr!28975 _values!1425) (store mapRest!35185 mapKey!35185 mapValue!35185))))

(declare-fun b!970853 () Bool)

(declare-fun res!649861 () Bool)

(assert (=> b!970853 (=> (not res!649861) (not e!547296))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970853 (= res!649861 (and (= (size!29456 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29455 _keys!1717) (size!29456 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!649864 () Bool)

(assert (=> start!83208 (=> (not res!649864) (not e!547296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83208 (= res!649864 (validMask!0 mask!2147))))

(assert (=> start!83208 e!547296))

(assert (=> start!83208 true))

(declare-fun e!547295 () Bool)

(declare-fun array_inv!22489 (array!60222) Bool)

(assert (=> start!83208 (and (array_inv!22489 _values!1425) e!547295)))

(assert (=> start!83208 tp_is_empty!22117))

(assert (=> start!83208 tp!66936))

(declare-fun array_inv!22490 (array!60220) Bool)

(assert (=> start!83208 (array_inv!22490 _keys!1717)))

(declare-fun mapIsEmpty!35185 () Bool)

(assert (=> mapIsEmpty!35185 mapRes!35185))

(declare-fun b!970854 () Bool)

(declare-fun res!649863 () Bool)

(assert (=> b!970854 (=> (not res!649863) (not e!547296))))

(declare-fun zeroValue!1367 () V!34473)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34473)

(declare-datatypes ((tuple2!14322 0))(
  ( (tuple2!14323 (_1!7172 (_ BitVec 64)) (_2!7172 V!34473)) )
))
(declare-datatypes ((List!20140 0))(
  ( (Nil!20137) (Cons!20136 (h!21298 tuple2!14322) (t!28494 List!20140)) )
))
(declare-datatypes ((ListLongMap!13009 0))(
  ( (ListLongMap!13010 (toList!6520 List!20140)) )
))
(declare-fun contains!5567 (ListLongMap!13009 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3682 (array!60220 array!60222 (_ BitVec 32) (_ BitVec 32) V!34473 V!34473 (_ BitVec 32) Int) ListLongMap!13009)

(assert (=> b!970854 (= res!649863 (contains!5567 (getCurrentListMap!3682 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28974 _keys!1717) i!822)))))

(declare-fun b!970855 () Bool)

(assert (=> b!970855 (= e!547296 false)))

(declare-fun lt!431562 () ListLongMap!13009)

(assert (=> b!970855 (= lt!431562 (getCurrentListMap!3682 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!970856 () Bool)

(declare-fun res!649867 () Bool)

(assert (=> b!970856 (=> (not res!649867) (not e!547296))))

(declare-datatypes ((List!20141 0))(
  ( (Nil!20138) (Cons!20137 (h!21299 (_ BitVec 64)) (t!28495 List!20141)) )
))
(declare-fun arrayNoDuplicates!0 (array!60220 (_ BitVec 32) List!20141) Bool)

(assert (=> b!970856 (= res!649867 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20138))))

(declare-fun b!970857 () Bool)

(declare-fun res!649865 () Bool)

(assert (=> b!970857 (=> (not res!649865) (not e!547296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60220 (_ BitVec 32)) Bool)

(assert (=> b!970857 (= res!649865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970858 () Bool)

(assert (=> b!970858 (= e!547295 (and e!547294 mapRes!35185))))

(declare-fun condMapEmpty!35185 () Bool)

(declare-fun mapDefault!35185 () ValueCell!10577)

(assert (=> b!970858 (= condMapEmpty!35185 (= (arr!28975 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10577)) mapDefault!35185)))))

(declare-fun b!970859 () Bool)

(declare-fun res!649866 () Bool)

(assert (=> b!970859 (=> (not res!649866) (not e!547296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970859 (= res!649866 (validKeyInArray!0 (select (arr!28974 _keys!1717) i!822)))))

(assert (= (and start!83208 res!649864) b!970853))

(assert (= (and b!970853 res!649861) b!970857))

(assert (= (and b!970857 res!649865) b!970856))

(assert (= (and b!970856 res!649867) b!970850))

(assert (= (and b!970850 res!649862) b!970859))

(assert (= (and b!970859 res!649866) b!970854))

(assert (= (and b!970854 res!649863) b!970855))

(assert (= (and b!970858 condMapEmpty!35185) mapIsEmpty!35185))

(assert (= (and b!970858 (not condMapEmpty!35185)) mapNonEmpty!35185))

(get-info :version)

(assert (= (and mapNonEmpty!35185 ((_ is ValueCellFull!10577) mapValue!35185)) b!970851))

(assert (= (and b!970858 ((_ is ValueCellFull!10577) mapDefault!35185)) b!970852))

(assert (= start!83208 b!970858))

(declare-fun m!897881 () Bool)

(assert (=> b!970859 m!897881))

(assert (=> b!970859 m!897881))

(declare-fun m!897883 () Bool)

(assert (=> b!970859 m!897883))

(declare-fun m!897885 () Bool)

(assert (=> start!83208 m!897885))

(declare-fun m!897887 () Bool)

(assert (=> start!83208 m!897887))

(declare-fun m!897889 () Bool)

(assert (=> start!83208 m!897889))

(declare-fun m!897891 () Bool)

(assert (=> b!970856 m!897891))

(declare-fun m!897893 () Bool)

(assert (=> b!970854 m!897893))

(assert (=> b!970854 m!897881))

(assert (=> b!970854 m!897893))

(assert (=> b!970854 m!897881))

(declare-fun m!897895 () Bool)

(assert (=> b!970854 m!897895))

(declare-fun m!897897 () Bool)

(assert (=> b!970855 m!897897))

(declare-fun m!897899 () Bool)

(assert (=> mapNonEmpty!35185 m!897899))

(declare-fun m!897901 () Bool)

(assert (=> b!970857 m!897901))

(check-sat b_and!30681 (not b!970856) (not b_next!19219) (not start!83208) (not b!970855) (not b!970854) (not b!970857) tp_is_empty!22117 (not b!970859) (not mapNonEmpty!35185))
(check-sat b_and!30681 (not b_next!19219))
