; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83358 () Bool)

(assert start!83358)

(declare-fun b_free!19183 () Bool)

(declare-fun b_next!19183 () Bool)

(assert (=> start!83358 (= b_free!19183 (not b_next!19183))))

(declare-fun tp!66828 () Bool)

(declare-fun b_and!30681 () Bool)

(assert (=> start!83358 (= tp!66828 b_and!30681)))

(declare-fun b!971477 () Bool)

(declare-fun e!547753 () Bool)

(declare-fun e!547754 () Bool)

(declare-fun mapRes!35131 () Bool)

(assert (=> b!971477 (= e!547753 (and e!547754 mapRes!35131))))

(declare-fun condMapEmpty!35131 () Bool)

(declare-datatypes ((V!34425 0))(
  ( (V!34426 (val!11091 Int)) )
))
(declare-datatypes ((ValueCell!10559 0))(
  ( (ValueCellFull!10559 (v!13647 V!34425)) (EmptyCell!10559) )
))
(declare-datatypes ((array!60240 0))(
  ( (array!60241 (arr!28979 (Array (_ BitVec 32) ValueCell!10559)) (size!29459 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60240)

(declare-fun mapDefault!35131 () ValueCell!10559)

(assert (=> b!971477 (= condMapEmpty!35131 (= (arr!28979 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10559)) mapDefault!35131)))))

(declare-fun res!649962 () Bool)

(declare-fun e!547756 () Bool)

(assert (=> start!83358 (=> (not res!649962) (not e!547756))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83358 (= res!649962 (validMask!0 mask!2147))))

(assert (=> start!83358 e!547756))

(assert (=> start!83358 true))

(declare-fun array_inv!22483 (array!60240) Bool)

(assert (=> start!83358 (and (array_inv!22483 _values!1425) e!547753)))

(declare-fun tp_is_empty!22081 () Bool)

(assert (=> start!83358 tp_is_empty!22081))

(assert (=> start!83358 tp!66828))

(declare-datatypes ((array!60242 0))(
  ( (array!60243 (arr!28980 (Array (_ BitVec 32) (_ BitVec 64))) (size!29460 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60242)

(declare-fun array_inv!22484 (array!60242) Bool)

(assert (=> start!83358 (array_inv!22484 _keys!1717)))

(declare-fun b!971478 () Bool)

(declare-fun res!649967 () Bool)

(assert (=> b!971478 (=> (not res!649967) (not e!547756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60242 (_ BitVec 32)) Bool)

(assert (=> b!971478 (= res!649967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971479 () Bool)

(declare-fun res!649963 () Bool)

(assert (=> b!971479 (=> (not res!649963) (not e!547756))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971479 (= res!649963 (validKeyInArray!0 (select (arr!28980 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35131 () Bool)

(assert (=> mapIsEmpty!35131 mapRes!35131))

(declare-fun mapNonEmpty!35131 () Bool)

(declare-fun tp!66829 () Bool)

(declare-fun e!547755 () Bool)

(assert (=> mapNonEmpty!35131 (= mapRes!35131 (and tp!66829 e!547755))))

(declare-fun mapKey!35131 () (_ BitVec 32))

(declare-fun mapRest!35131 () (Array (_ BitVec 32) ValueCell!10559))

(declare-fun mapValue!35131 () ValueCell!10559)

(assert (=> mapNonEmpty!35131 (= (arr!28979 _values!1425) (store mapRest!35131 mapKey!35131 mapValue!35131))))

(declare-fun b!971480 () Bool)

(declare-fun res!649966 () Bool)

(assert (=> b!971480 (=> (not res!649966) (not e!547756))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971480 (= res!649966 (and (= (size!29459 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29460 _keys!1717) (size!29459 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971481 () Bool)

(assert (=> b!971481 (= e!547754 tp_is_empty!22081)))

(declare-fun b!971482 () Bool)

(assert (=> b!971482 (= e!547756 false)))

(declare-fun zeroValue!1367 () V!34425)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34425)

(declare-fun lt!432114 () Bool)

(declare-datatypes ((tuple2!14212 0))(
  ( (tuple2!14213 (_1!7117 (_ BitVec 64)) (_2!7117 V!34425)) )
))
(declare-datatypes ((List!20069 0))(
  ( (Nil!20066) (Cons!20065 (h!21233 tuple2!14212) (t!28424 List!20069)) )
))
(declare-datatypes ((ListLongMap!12911 0))(
  ( (ListLongMap!12912 (toList!6471 List!20069)) )
))
(declare-fun contains!5586 (ListLongMap!12911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3704 (array!60242 array!60240 (_ BitVec 32) (_ BitVec 32) V!34425 V!34425 (_ BitVec 32) Int) ListLongMap!12911)

(assert (=> b!971482 (= lt!432114 (contains!5586 (getCurrentListMap!3704 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28980 _keys!1717) i!822)))))

(declare-fun b!971483 () Bool)

(declare-fun res!649964 () Bool)

(assert (=> b!971483 (=> (not res!649964) (not e!547756))))

(assert (=> b!971483 (= res!649964 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29460 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29460 _keys!1717))))))

(declare-fun b!971484 () Bool)

(declare-fun res!649965 () Bool)

(assert (=> b!971484 (=> (not res!649965) (not e!547756))))

(declare-datatypes ((List!20070 0))(
  ( (Nil!20067) (Cons!20066 (h!21234 (_ BitVec 64)) (t!28425 List!20070)) )
))
(declare-fun arrayNoDuplicates!0 (array!60242 (_ BitVec 32) List!20070) Bool)

(assert (=> b!971484 (= res!649965 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20067))))

(declare-fun b!971485 () Bool)

(assert (=> b!971485 (= e!547755 tp_is_empty!22081)))

(assert (= (and start!83358 res!649962) b!971480))

(assert (= (and b!971480 res!649966) b!971478))

(assert (= (and b!971478 res!649967) b!971484))

(assert (= (and b!971484 res!649965) b!971483))

(assert (= (and b!971483 res!649964) b!971479))

(assert (= (and b!971479 res!649963) b!971482))

(assert (= (and b!971477 condMapEmpty!35131) mapIsEmpty!35131))

(assert (= (and b!971477 (not condMapEmpty!35131)) mapNonEmpty!35131))

(get-info :version)

(assert (= (and mapNonEmpty!35131 ((_ is ValueCellFull!10559) mapValue!35131)) b!971485))

(assert (= (and b!971477 ((_ is ValueCellFull!10559) mapDefault!35131)) b!971481))

(assert (= start!83358 b!971477))

(declare-fun m!899561 () Bool)

(assert (=> b!971479 m!899561))

(assert (=> b!971479 m!899561))

(declare-fun m!899563 () Bool)

(assert (=> b!971479 m!899563))

(declare-fun m!899565 () Bool)

(assert (=> b!971484 m!899565))

(declare-fun m!899567 () Bool)

(assert (=> start!83358 m!899567))

(declare-fun m!899569 () Bool)

(assert (=> start!83358 m!899569))

(declare-fun m!899571 () Bool)

(assert (=> start!83358 m!899571))

(declare-fun m!899573 () Bool)

(assert (=> b!971482 m!899573))

(assert (=> b!971482 m!899561))

(assert (=> b!971482 m!899573))

(assert (=> b!971482 m!899561))

(declare-fun m!899575 () Bool)

(assert (=> b!971482 m!899575))

(declare-fun m!899577 () Bool)

(assert (=> mapNonEmpty!35131 m!899577))

(declare-fun m!899579 () Bool)

(assert (=> b!971478 m!899579))

(check-sat (not mapNonEmpty!35131) tp_is_empty!22081 (not b!971482) (not b!971478) (not b_next!19183) (not b!971479) (not b!971484) b_and!30681 (not start!83358))
(check-sat b_and!30681 (not b_next!19183))
