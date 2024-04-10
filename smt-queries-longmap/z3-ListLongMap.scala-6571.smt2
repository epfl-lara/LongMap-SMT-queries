; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83312 () Bool)

(assert start!83312)

(declare-fun b_free!19305 () Bool)

(declare-fun b_next!19305 () Bool)

(assert (=> start!83312 (= b_free!19305 (not b_next!19305))))

(declare-fun tp!67194 () Bool)

(declare-fun b_and!30831 () Bool)

(assert (=> start!83312 (= tp!67194 b_and!30831)))

(declare-fun b!972476 () Bool)

(declare-fun res!650940 () Bool)

(declare-fun e!548146 () Bool)

(assert (=> b!972476 (=> (not res!650940) (not e!548146))))

(declare-datatypes ((array!60453 0))(
  ( (array!60454 (arr!29090 (Array (_ BitVec 32) (_ BitVec 64))) (size!29569 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60453)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972476 (= res!650940 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29569 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29569 _keys!1717))))))

(declare-fun mapIsEmpty!35314 () Bool)

(declare-fun mapRes!35314 () Bool)

(assert (=> mapIsEmpty!35314 mapRes!35314))

(declare-fun b!972477 () Bool)

(declare-fun res!650938 () Bool)

(assert (=> b!972477 (=> (not res!650938) (not e!548146))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34587 0))(
  ( (V!34588 (val!11152 Int)) )
))
(declare-datatypes ((ValueCell!10620 0))(
  ( (ValueCellFull!10620 (v!13711 V!34587)) (EmptyCell!10620) )
))
(declare-datatypes ((array!60455 0))(
  ( (array!60456 (arr!29091 (Array (_ BitVec 32) ValueCell!10620)) (size!29570 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60455)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972477 (= res!650938 (and (= (size!29570 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29569 _keys!1717) (size!29570 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972478 () Bool)

(declare-fun e!548144 () Bool)

(declare-fun tp_is_empty!22203 () Bool)

(assert (=> b!972478 (= e!548144 tp_is_empty!22203)))

(declare-fun b!972479 () Bool)

(declare-fun res!650935 () Bool)

(assert (=> b!972479 (=> (not res!650935) (not e!548146))))

(declare-fun zeroValue!1367 () V!34587)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34587)

(declare-datatypes ((tuple2!14304 0))(
  ( (tuple2!14305 (_1!7163 (_ BitVec 64)) (_2!7163 V!34587)) )
))
(declare-datatypes ((List!20169 0))(
  ( (Nil!20166) (Cons!20165 (h!21327 tuple2!14304) (t!28572 List!20169)) )
))
(declare-datatypes ((ListLongMap!13001 0))(
  ( (ListLongMap!13002 (toList!6516 List!20169)) )
))
(declare-fun contains!5611 (ListLongMap!13001 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3749 (array!60453 array!60455 (_ BitVec 32) (_ BitVec 32) V!34587 V!34587 (_ BitVec 32) Int) ListLongMap!13001)

(assert (=> b!972479 (= res!650935 (contains!5611 (getCurrentListMap!3749 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29090 _keys!1717) i!822)))))

(declare-fun b!972481 () Bool)

(declare-fun e!548149 () Bool)

(assert (=> b!972481 (= e!548149 tp_is_empty!22203)))

(declare-fun b!972482 () Bool)

(declare-fun e!548148 () Bool)

(assert (=> b!972482 (= e!548146 e!548148)))

(declare-fun res!650934 () Bool)

(assert (=> b!972482 (=> (not res!650934) (not e!548148))))

(declare-fun lt!432047 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972482 (= res!650934 (validKeyInArray!0 lt!432047))))

(assert (=> b!972482 (= lt!432047 (select (arr!29090 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432046 () ListLongMap!13001)

(assert (=> b!972482 (= lt!432046 (getCurrentListMap!3749 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972483 () Bool)

(declare-fun e!548145 () Bool)

(assert (=> b!972483 (= e!548145 (and e!548149 mapRes!35314))))

(declare-fun condMapEmpty!35314 () Bool)

(declare-fun mapDefault!35314 () ValueCell!10620)

(assert (=> b!972483 (= condMapEmpty!35314 (= (arr!29091 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10620)) mapDefault!35314)))))

(declare-fun b!972484 () Bool)

(assert (=> b!972484 (= e!548148 (not true))))

(declare-fun +!2890 (ListLongMap!13001 tuple2!14304) ListLongMap!13001)

(declare-fun get!15071 (ValueCell!10620 V!34587) V!34587)

(declare-fun dynLambda!1679 (Int (_ BitVec 64)) V!34587)

(assert (=> b!972484 (= lt!432046 (+!2890 (getCurrentListMap!3749 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14305 lt!432047 (get!15071 (select (arr!29091 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1679 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32401 0))(
  ( (Unit!32402) )
))
(declare-fun lt!432045 () Unit!32401)

(declare-fun lemmaListMapRecursiveValidKeyArray!256 (array!60453 array!60455 (_ BitVec 32) (_ BitVec 32) V!34587 V!34587 (_ BitVec 32) Int) Unit!32401)

(assert (=> b!972484 (= lt!432045 (lemmaListMapRecursiveValidKeyArray!256 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972485 () Bool)

(declare-fun res!650933 () Bool)

(assert (=> b!972485 (=> (not res!650933) (not e!548146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60453 (_ BitVec 32)) Bool)

(assert (=> b!972485 (= res!650933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35314 () Bool)

(declare-fun tp!67193 () Bool)

(assert (=> mapNonEmpty!35314 (= mapRes!35314 (and tp!67193 e!548144))))

(declare-fun mapRest!35314 () (Array (_ BitVec 32) ValueCell!10620))

(declare-fun mapKey!35314 () (_ BitVec 32))

(declare-fun mapValue!35314 () ValueCell!10620)

(assert (=> mapNonEmpty!35314 (= (arr!29091 _values!1425) (store mapRest!35314 mapKey!35314 mapValue!35314))))

(declare-fun b!972486 () Bool)

(declare-fun res!650936 () Bool)

(assert (=> b!972486 (=> (not res!650936) (not e!548146))))

(assert (=> b!972486 (= res!650936 (validKeyInArray!0 (select (arr!29090 _keys!1717) i!822)))))

(declare-fun b!972480 () Bool)

(declare-fun res!650939 () Bool)

(assert (=> b!972480 (=> (not res!650939) (not e!548146))))

(declare-datatypes ((List!20170 0))(
  ( (Nil!20167) (Cons!20166 (h!21328 (_ BitVec 64)) (t!28573 List!20170)) )
))
(declare-fun arrayNoDuplicates!0 (array!60453 (_ BitVec 32) List!20170) Bool)

(assert (=> b!972480 (= res!650939 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20167))))

(declare-fun res!650937 () Bool)

(assert (=> start!83312 (=> (not res!650937) (not e!548146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83312 (= res!650937 (validMask!0 mask!2147))))

(assert (=> start!83312 e!548146))

(assert (=> start!83312 true))

(declare-fun array_inv!22503 (array!60455) Bool)

(assert (=> start!83312 (and (array_inv!22503 _values!1425) e!548145)))

(assert (=> start!83312 tp_is_empty!22203))

(assert (=> start!83312 tp!67194))

(declare-fun array_inv!22504 (array!60453) Bool)

(assert (=> start!83312 (array_inv!22504 _keys!1717)))

(assert (= (and start!83312 res!650937) b!972477))

(assert (= (and b!972477 res!650938) b!972485))

(assert (= (and b!972485 res!650933) b!972480))

(assert (= (and b!972480 res!650939) b!972476))

(assert (= (and b!972476 res!650940) b!972486))

(assert (= (and b!972486 res!650936) b!972479))

(assert (= (and b!972479 res!650935) b!972482))

(assert (= (and b!972482 res!650934) b!972484))

(assert (= (and b!972483 condMapEmpty!35314) mapIsEmpty!35314))

(assert (= (and b!972483 (not condMapEmpty!35314)) mapNonEmpty!35314))

(get-info :version)

(assert (= (and mapNonEmpty!35314 ((_ is ValueCellFull!10620) mapValue!35314)) b!972478))

(assert (= (and b!972483 ((_ is ValueCellFull!10620) mapDefault!35314)) b!972481))

(assert (= start!83312 b!972483))

(declare-fun b_lambda!14469 () Bool)

(assert (=> (not b_lambda!14469) (not b!972484)))

(declare-fun t!28571 () Bool)

(declare-fun tb!6253 () Bool)

(assert (=> (and start!83312 (= defaultEntry!1428 defaultEntry!1428) t!28571) tb!6253))

(declare-fun result!12483 () Bool)

(assert (=> tb!6253 (= result!12483 tp_is_empty!22203)))

(assert (=> b!972484 t!28571))

(declare-fun b_and!30833 () Bool)

(assert (= b_and!30831 (and (=> t!28571 result!12483) b_and!30833)))

(declare-fun m!899889 () Bool)

(assert (=> b!972479 m!899889))

(declare-fun m!899891 () Bool)

(assert (=> b!972479 m!899891))

(assert (=> b!972479 m!899889))

(assert (=> b!972479 m!899891))

(declare-fun m!899893 () Bool)

(assert (=> b!972479 m!899893))

(assert (=> b!972486 m!899891))

(assert (=> b!972486 m!899891))

(declare-fun m!899895 () Bool)

(assert (=> b!972486 m!899895))

(declare-fun m!899897 () Bool)

(assert (=> mapNonEmpty!35314 m!899897))

(declare-fun m!899899 () Bool)

(assert (=> start!83312 m!899899))

(declare-fun m!899901 () Bool)

(assert (=> start!83312 m!899901))

(declare-fun m!899903 () Bool)

(assert (=> start!83312 m!899903))

(declare-fun m!899905 () Bool)

(assert (=> b!972484 m!899905))

(declare-fun m!899907 () Bool)

(assert (=> b!972484 m!899907))

(declare-fun m!899909 () Bool)

(assert (=> b!972484 m!899909))

(assert (=> b!972484 m!899907))

(declare-fun m!899911 () Bool)

(assert (=> b!972484 m!899911))

(assert (=> b!972484 m!899905))

(assert (=> b!972484 m!899909))

(declare-fun m!899913 () Bool)

(assert (=> b!972484 m!899913))

(declare-fun m!899915 () Bool)

(assert (=> b!972484 m!899915))

(declare-fun m!899917 () Bool)

(assert (=> b!972485 m!899917))

(declare-fun m!899919 () Bool)

(assert (=> b!972480 m!899919))

(declare-fun m!899921 () Bool)

(assert (=> b!972482 m!899921))

(declare-fun m!899923 () Bool)

(assert (=> b!972482 m!899923))

(declare-fun m!899925 () Bool)

(assert (=> b!972482 m!899925))

(check-sat (not b!972485) (not b!972479) (not mapNonEmpty!35314) (not b!972482) (not b_lambda!14469) (not b_next!19305) (not b!972480) b_and!30833 (not b!972486) (not start!83312) (not b!972484) tp_is_empty!22203)
(check-sat b_and!30833 (not b_next!19305))
