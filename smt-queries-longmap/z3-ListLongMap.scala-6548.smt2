; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83174 () Bool)

(assert start!83174)

(declare-fun b_free!19167 () Bool)

(declare-fun b_next!19167 () Bool)

(assert (=> start!83174 (= b_free!19167 (not b_next!19167))))

(declare-fun tp!66780 () Bool)

(declare-fun b_and!30655 () Bool)

(assert (=> start!83174 (= tp!66780 b_and!30655)))

(declare-fun b!970358 () Bool)

(declare-fun e!547052 () Bool)

(assert (=> b!970358 (= e!547052 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34403 0))(
  ( (V!34404 (val!11083 Int)) )
))
(declare-datatypes ((ValueCell!10551 0))(
  ( (ValueCellFull!10551 (v!13642 V!34403)) (EmptyCell!10551) )
))
(declare-datatypes ((array!60189 0))(
  ( (array!60190 (arr!28958 (Array (_ BitVec 32) ValueCell!10551)) (size!29437 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60189)

(declare-fun zeroValue!1367 () V!34403)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34403)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun lt!431729 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60191 0))(
  ( (array!60192 (arr!28959 (Array (_ BitVec 32) (_ BitVec 64))) (size!29438 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60191)

(declare-datatypes ((tuple2!14202 0))(
  ( (tuple2!14203 (_1!7112 (_ BitVec 64)) (_2!7112 V!34403)) )
))
(declare-datatypes ((List!20071 0))(
  ( (Nil!20068) (Cons!20067 (h!21229 tuple2!14202) (t!28434 List!20071)) )
))
(declare-datatypes ((ListLongMap!12899 0))(
  ( (ListLongMap!12900 (toList!6465 List!20071)) )
))
(declare-fun contains!5569 (ListLongMap!12899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3698 (array!60191 array!60189 (_ BitVec 32) (_ BitVec 32) V!34403 V!34403 (_ BitVec 32) Int) ListLongMap!12899)

(assert (=> b!970358 (= lt!431729 (contains!5569 (getCurrentListMap!3698 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28959 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35107 () Bool)

(declare-fun mapRes!35107 () Bool)

(declare-fun tp!66779 () Bool)

(declare-fun e!547054 () Bool)

(assert (=> mapNonEmpty!35107 (= mapRes!35107 (and tp!66779 e!547054))))

(declare-fun mapKey!35107 () (_ BitVec 32))

(declare-fun mapValue!35107 () ValueCell!10551)

(declare-fun mapRest!35107 () (Array (_ BitVec 32) ValueCell!10551))

(assert (=> mapNonEmpty!35107 (= (arr!28958 _values!1425) (store mapRest!35107 mapKey!35107 mapValue!35107))))

(declare-fun b!970359 () Bool)

(declare-fun res!649474 () Bool)

(assert (=> b!970359 (=> (not res!649474) (not e!547052))))

(declare-datatypes ((List!20072 0))(
  ( (Nil!20069) (Cons!20068 (h!21230 (_ BitVec 64)) (t!28435 List!20072)) )
))
(declare-fun arrayNoDuplicates!0 (array!60191 (_ BitVec 32) List!20072) Bool)

(assert (=> b!970359 (= res!649474 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20069))))

(declare-fun b!970360 () Bool)

(declare-fun e!547053 () Bool)

(declare-fun e!547051 () Bool)

(assert (=> b!970360 (= e!547053 (and e!547051 mapRes!35107))))

(declare-fun condMapEmpty!35107 () Bool)

(declare-fun mapDefault!35107 () ValueCell!10551)

(assert (=> b!970360 (= condMapEmpty!35107 (= (arr!28958 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10551)) mapDefault!35107)))))

(declare-fun b!970361 () Bool)

(declare-fun res!649479 () Bool)

(assert (=> b!970361 (=> (not res!649479) (not e!547052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970361 (= res!649479 (validKeyInArray!0 (select (arr!28959 _keys!1717) i!822)))))

(declare-fun b!970362 () Bool)

(declare-fun res!649478 () Bool)

(assert (=> b!970362 (=> (not res!649478) (not e!547052))))

(assert (=> b!970362 (= res!649478 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29438 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29438 _keys!1717))))))

(declare-fun b!970363 () Bool)

(declare-fun tp_is_empty!22065 () Bool)

(assert (=> b!970363 (= e!547051 tp_is_empty!22065)))

(declare-fun b!970364 () Bool)

(declare-fun res!649476 () Bool)

(assert (=> b!970364 (=> (not res!649476) (not e!547052))))

(assert (=> b!970364 (= res!649476 (and (= (size!29437 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29438 _keys!1717) (size!29437 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35107 () Bool)

(assert (=> mapIsEmpty!35107 mapRes!35107))

(declare-fun res!649475 () Bool)

(assert (=> start!83174 (=> (not res!649475) (not e!547052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83174 (= res!649475 (validMask!0 mask!2147))))

(assert (=> start!83174 e!547052))

(assert (=> start!83174 true))

(declare-fun array_inv!22417 (array!60189) Bool)

(assert (=> start!83174 (and (array_inv!22417 _values!1425) e!547053)))

(assert (=> start!83174 tp_is_empty!22065))

(assert (=> start!83174 tp!66780))

(declare-fun array_inv!22418 (array!60191) Bool)

(assert (=> start!83174 (array_inv!22418 _keys!1717)))

(declare-fun b!970365 () Bool)

(declare-fun res!649477 () Bool)

(assert (=> b!970365 (=> (not res!649477) (not e!547052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60191 (_ BitVec 32)) Bool)

(assert (=> b!970365 (= res!649477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970366 () Bool)

(assert (=> b!970366 (= e!547054 tp_is_empty!22065)))

(assert (= (and start!83174 res!649475) b!970364))

(assert (= (and b!970364 res!649476) b!970365))

(assert (= (and b!970365 res!649477) b!970359))

(assert (= (and b!970359 res!649474) b!970362))

(assert (= (and b!970362 res!649478) b!970361))

(assert (= (and b!970361 res!649479) b!970358))

(assert (= (and b!970360 condMapEmpty!35107) mapIsEmpty!35107))

(assert (= (and b!970360 (not condMapEmpty!35107)) mapNonEmpty!35107))

(get-info :version)

(assert (= (and mapNonEmpty!35107 ((_ is ValueCellFull!10551) mapValue!35107)) b!970366))

(assert (= (and b!970360 ((_ is ValueCellFull!10551) mapDefault!35107)) b!970363))

(assert (= start!83174 b!970360))

(declare-fun m!898107 () Bool)

(assert (=> b!970361 m!898107))

(assert (=> b!970361 m!898107))

(declare-fun m!898109 () Bool)

(assert (=> b!970361 m!898109))

(declare-fun m!898111 () Bool)

(assert (=> b!970358 m!898111))

(assert (=> b!970358 m!898107))

(assert (=> b!970358 m!898111))

(assert (=> b!970358 m!898107))

(declare-fun m!898113 () Bool)

(assert (=> b!970358 m!898113))

(declare-fun m!898115 () Bool)

(assert (=> start!83174 m!898115))

(declare-fun m!898117 () Bool)

(assert (=> start!83174 m!898117))

(declare-fun m!898119 () Bool)

(assert (=> start!83174 m!898119))

(declare-fun m!898121 () Bool)

(assert (=> mapNonEmpty!35107 m!898121))

(declare-fun m!898123 () Bool)

(assert (=> b!970365 m!898123))

(declare-fun m!898125 () Bool)

(assert (=> b!970359 m!898125))

(check-sat (not b!970365) b_and!30655 (not b_next!19167) (not b!970361) (not mapNonEmpty!35107) (not b!970358) (not b!970359) (not start!83174) tp_is_empty!22065)
(check-sat b_and!30655 (not b_next!19167))
