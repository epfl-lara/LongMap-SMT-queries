; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83394 () Bool)

(assert start!83394)

(declare-fun b_free!19219 () Bool)

(declare-fun b_next!19219 () Bool)

(assert (=> start!83394 (= b_free!19219 (not b_next!19219))))

(declare-fun tp!66936 () Bool)

(declare-fun b_and!30717 () Bool)

(assert (=> start!83394 (= tp!66936 b_and!30717)))

(declare-fun mapNonEmpty!35185 () Bool)

(declare-fun mapRes!35185 () Bool)

(declare-fun tp!66937 () Bool)

(declare-fun e!548024 () Bool)

(assert (=> mapNonEmpty!35185 (= mapRes!35185 (and tp!66937 e!548024))))

(declare-datatypes ((V!34473 0))(
  ( (V!34474 (val!11109 Int)) )
))
(declare-datatypes ((ValueCell!10577 0))(
  ( (ValueCellFull!10577 (v!13665 V!34473)) (EmptyCell!10577) )
))
(declare-fun mapValue!35185 () ValueCell!10577)

(declare-datatypes ((array!60308 0))(
  ( (array!60309 (arr!29013 (Array (_ BitVec 32) ValueCell!10577)) (size!29493 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60308)

(declare-fun mapKey!35185 () (_ BitVec 32))

(declare-fun mapRest!35185 () (Array (_ BitVec 32) ValueCell!10577))

(assert (=> mapNonEmpty!35185 (= (arr!29013 _values!1425) (store mapRest!35185 mapKey!35185 mapValue!35185))))

(declare-fun b!971992 () Bool)

(declare-fun res!650318 () Bool)

(declare-fun e!548022 () Bool)

(assert (=> b!971992 (=> (not res!650318) (not e!548022))))

(declare-datatypes ((array!60310 0))(
  ( (array!60311 (arr!29014 (Array (_ BitVec 32) (_ BitVec 64))) (size!29494 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60310)

(declare-datatypes ((List!20093 0))(
  ( (Nil!20090) (Cons!20089 (h!21257 (_ BitVec 64)) (t!28448 List!20093)) )
))
(declare-fun arrayNoDuplicates!0 (array!60310 (_ BitVec 32) List!20093) Bool)

(assert (=> b!971992 (= res!650318 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20090))))

(declare-fun b!971993 () Bool)

(declare-fun tp_is_empty!22117 () Bool)

(assert (=> b!971993 (= e!548024 tp_is_empty!22117)))

(declare-fun b!971994 () Bool)

(declare-fun e!548026 () Bool)

(assert (=> b!971994 (= e!548026 tp_is_empty!22117)))

(declare-fun b!971995 () Bool)

(declare-fun e!548023 () Bool)

(assert (=> b!971995 (= e!548023 (and e!548026 mapRes!35185))))

(declare-fun condMapEmpty!35185 () Bool)

(declare-fun mapDefault!35185 () ValueCell!10577)

(assert (=> b!971995 (= condMapEmpty!35185 (= (arr!29013 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10577)) mapDefault!35185)))))

(declare-fun b!971996 () Bool)

(declare-fun res!650315 () Bool)

(assert (=> b!971996 (=> (not res!650315) (not e!548022))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34473)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34473)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14238 0))(
  ( (tuple2!14239 (_1!7130 (_ BitVec 64)) (_2!7130 V!34473)) )
))
(declare-datatypes ((List!20094 0))(
  ( (Nil!20091) (Cons!20090 (h!21258 tuple2!14238) (t!28449 List!20094)) )
))
(declare-datatypes ((ListLongMap!12937 0))(
  ( (ListLongMap!12938 (toList!6484 List!20094)) )
))
(declare-fun contains!5598 (ListLongMap!12937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3717 (array!60310 array!60308 (_ BitVec 32) (_ BitVec 32) V!34473 V!34473 (_ BitVec 32) Int) ListLongMap!12937)

(assert (=> b!971996 (= res!650315 (contains!5598 (getCurrentListMap!3717 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29014 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35185 () Bool)

(assert (=> mapIsEmpty!35185 mapRes!35185))

(declare-fun res!650321 () Bool)

(assert (=> start!83394 (=> (not res!650321) (not e!548022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83394 (= res!650321 (validMask!0 mask!2147))))

(assert (=> start!83394 e!548022))

(assert (=> start!83394 true))

(declare-fun array_inv!22501 (array!60308) Bool)

(assert (=> start!83394 (and (array_inv!22501 _values!1425) e!548023)))

(assert (=> start!83394 tp_is_empty!22117))

(assert (=> start!83394 tp!66936))

(declare-fun array_inv!22502 (array!60310) Bool)

(assert (=> start!83394 (array_inv!22502 _keys!1717)))

(declare-fun b!971997 () Bool)

(declare-fun res!650317 () Bool)

(assert (=> b!971997 (=> (not res!650317) (not e!548022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971997 (= res!650317 (validKeyInArray!0 (select (arr!29014 _keys!1717) i!822)))))

(declare-fun b!971998 () Bool)

(declare-fun res!650316 () Bool)

(assert (=> b!971998 (=> (not res!650316) (not e!548022))))

(assert (=> b!971998 (= res!650316 (and (= (size!29493 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29494 _keys!1717) (size!29493 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971999 () Bool)

(declare-fun res!650319 () Bool)

(assert (=> b!971999 (=> (not res!650319) (not e!548022))))

(assert (=> b!971999 (= res!650319 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29494 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29494 _keys!1717))))))

(declare-fun b!972000 () Bool)

(assert (=> b!972000 (= e!548022 false)))

(declare-fun lt!432159 () ListLongMap!12937)

(assert (=> b!972000 (= lt!432159 (getCurrentListMap!3717 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972001 () Bool)

(declare-fun res!650320 () Bool)

(assert (=> b!972001 (=> (not res!650320) (not e!548022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60310 (_ BitVec 32)) Bool)

(assert (=> b!972001 (= res!650320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83394 res!650321) b!971998))

(assert (= (and b!971998 res!650316) b!972001))

(assert (= (and b!972001 res!650320) b!971992))

(assert (= (and b!971992 res!650318) b!971999))

(assert (= (and b!971999 res!650319) b!971997))

(assert (= (and b!971997 res!650317) b!971996))

(assert (= (and b!971996 res!650315) b!972000))

(assert (= (and b!971995 condMapEmpty!35185) mapIsEmpty!35185))

(assert (= (and b!971995 (not condMapEmpty!35185)) mapNonEmpty!35185))

(get-info :version)

(assert (= (and mapNonEmpty!35185 ((_ is ValueCellFull!10577) mapValue!35185)) b!971993))

(assert (= (and b!971995 ((_ is ValueCellFull!10577) mapDefault!35185)) b!971994))

(assert (= start!83394 b!971995))

(declare-fun m!899933 () Bool)

(assert (=> b!971992 m!899933))

(declare-fun m!899935 () Bool)

(assert (=> b!971996 m!899935))

(declare-fun m!899937 () Bool)

(assert (=> b!971996 m!899937))

(assert (=> b!971996 m!899935))

(assert (=> b!971996 m!899937))

(declare-fun m!899939 () Bool)

(assert (=> b!971996 m!899939))

(declare-fun m!899941 () Bool)

(assert (=> b!972000 m!899941))

(declare-fun m!899943 () Bool)

(assert (=> mapNonEmpty!35185 m!899943))

(declare-fun m!899945 () Bool)

(assert (=> b!972001 m!899945))

(declare-fun m!899947 () Bool)

(assert (=> start!83394 m!899947))

(declare-fun m!899949 () Bool)

(assert (=> start!83394 m!899949))

(declare-fun m!899951 () Bool)

(assert (=> start!83394 m!899951))

(assert (=> b!971997 m!899937))

(assert (=> b!971997 m!899937))

(declare-fun m!899953 () Bool)

(assert (=> b!971997 m!899953))

(check-sat (not b!971996) (not mapNonEmpty!35185) (not b!971992) (not b!972000) tp_is_empty!22117 (not b!972001) (not b_next!19219) (not b!971997) b_and!30717 (not start!83394))
(check-sat b_and!30717 (not b_next!19219))
