; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83466 () Bool)

(assert start!83466)

(declare-fun b_free!19291 () Bool)

(declare-fun b_next!19291 () Bool)

(assert (=> start!83466 (= b_free!19291 (not b_next!19291))))

(declare-fun tp!67153 () Bool)

(declare-fun b_and!30813 () Bool)

(assert (=> start!83466 (= tp!67153 b_and!30813)))

(declare-fun b!973134 () Bool)

(declare-fun e!548604 () Bool)

(declare-fun e!548605 () Bool)

(declare-fun mapRes!35293 () Bool)

(assert (=> b!973134 (= e!548604 (and e!548605 mapRes!35293))))

(declare-fun condMapEmpty!35293 () Bool)

(declare-datatypes ((V!34569 0))(
  ( (V!34570 (val!11145 Int)) )
))
(declare-datatypes ((ValueCell!10613 0))(
  ( (ValueCellFull!10613 (v!13701 V!34569)) (EmptyCell!10613) )
))
(declare-datatypes ((array!60450 0))(
  ( (array!60451 (arr!29084 (Array (_ BitVec 32) ValueCell!10613)) (size!29564 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60450)

(declare-fun mapDefault!35293 () ValueCell!10613)

(assert (=> b!973134 (= condMapEmpty!35293 (= (arr!29084 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10613)) mapDefault!35293)))))

(declare-fun b!973135 () Bool)

(declare-fun res!651115 () Bool)

(declare-fun e!548601 () Bool)

(assert (=> b!973135 (=> (not res!651115) (not e!548601))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34569)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34569)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60452 0))(
  ( (array!60453 (arr!29085 (Array (_ BitVec 32) (_ BitVec 64))) (size!29565 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60452)

(declare-datatypes ((tuple2!14300 0))(
  ( (tuple2!14301 (_1!7161 (_ BitVec 64)) (_2!7161 V!34569)) )
))
(declare-datatypes ((List!20150 0))(
  ( (Nil!20147) (Cons!20146 (h!21314 tuple2!14300) (t!28531 List!20150)) )
))
(declare-datatypes ((ListLongMap!12999 0))(
  ( (ListLongMap!13000 (toList!6515 List!20150)) )
))
(declare-fun contains!5627 (ListLongMap!12999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3748 (array!60452 array!60450 (_ BitVec 32) (_ BitVec 32) V!34569 V!34569 (_ BitVec 32) Int) ListLongMap!12999)

(assert (=> b!973135 (= res!651115 (contains!5627 (getCurrentListMap!3748 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29085 _keys!1717) i!822)))))

(declare-fun res!651116 () Bool)

(assert (=> start!83466 (=> (not res!651116) (not e!548601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83466 (= res!651116 (validMask!0 mask!2147))))

(assert (=> start!83466 e!548601))

(assert (=> start!83466 true))

(declare-fun array_inv!22557 (array!60450) Bool)

(assert (=> start!83466 (and (array_inv!22557 _values!1425) e!548604)))

(declare-fun tp_is_empty!22189 () Bool)

(assert (=> start!83466 tp_is_empty!22189))

(assert (=> start!83466 tp!67153))

(declare-fun array_inv!22558 (array!60452) Bool)

(assert (=> start!83466 (array_inv!22558 _keys!1717)))

(declare-fun b!973136 () Bool)

(declare-fun e!548602 () Bool)

(assert (=> b!973136 (= e!548602 (not true))))

(declare-fun lt!432345 () ListLongMap!12999)

(declare-fun lt!432344 () (_ BitVec 64))

(declare-fun +!2894 (ListLongMap!12999 tuple2!14300) ListLongMap!12999)

(declare-fun get!15083 (ValueCell!10613 V!34569) V!34569)

(declare-fun dynLambda!1691 (Int (_ BitVec 64)) V!34569)

(assert (=> b!973136 (= lt!432345 (+!2894 (getCurrentListMap!3748 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14301 lt!432344 (get!15083 (select (arr!29084 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1691 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32352 0))(
  ( (Unit!32353) )
))
(declare-fun lt!432343 () Unit!32352)

(declare-fun lemmaListMapRecursiveValidKeyArray!250 (array!60452 array!60450 (_ BitVec 32) (_ BitVec 32) V!34569 V!34569 (_ BitVec 32) Int) Unit!32352)

(assert (=> b!973136 (= lt!432343 (lemmaListMapRecursiveValidKeyArray!250 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973137 () Bool)

(declare-fun res!651111 () Bool)

(assert (=> b!973137 (=> (not res!651111) (not e!548601))))

(assert (=> b!973137 (= res!651111 (and (= (size!29564 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29565 _keys!1717) (size!29564 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973138 () Bool)

(declare-fun res!651109 () Bool)

(assert (=> b!973138 (=> (not res!651109) (not e!548601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973138 (= res!651109 (validKeyInArray!0 (select (arr!29085 _keys!1717) i!822)))))

(declare-fun b!973139 () Bool)

(assert (=> b!973139 (= e!548601 e!548602)))

(declare-fun res!651112 () Bool)

(assert (=> b!973139 (=> (not res!651112) (not e!548602))))

(assert (=> b!973139 (= res!651112 (validKeyInArray!0 lt!432344))))

(assert (=> b!973139 (= lt!432344 (select (arr!29085 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973139 (= lt!432345 (getCurrentListMap!3748 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973140 () Bool)

(declare-fun res!651113 () Bool)

(assert (=> b!973140 (=> (not res!651113) (not e!548601))))

(assert (=> b!973140 (= res!651113 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29565 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29565 _keys!1717))))))

(declare-fun mapIsEmpty!35293 () Bool)

(assert (=> mapIsEmpty!35293 mapRes!35293))

(declare-fun b!973141 () Bool)

(declare-fun res!651114 () Bool)

(assert (=> b!973141 (=> (not res!651114) (not e!548601))))

(declare-datatypes ((List!20151 0))(
  ( (Nil!20148) (Cons!20147 (h!21315 (_ BitVec 64)) (t!28532 List!20151)) )
))
(declare-fun arrayNoDuplicates!0 (array!60452 (_ BitVec 32) List!20151) Bool)

(assert (=> b!973141 (= res!651114 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20148))))

(declare-fun mapNonEmpty!35293 () Bool)

(declare-fun tp!67152 () Bool)

(declare-fun e!548603 () Bool)

(assert (=> mapNonEmpty!35293 (= mapRes!35293 (and tp!67152 e!548603))))

(declare-fun mapKey!35293 () (_ BitVec 32))

(declare-fun mapRest!35293 () (Array (_ BitVec 32) ValueCell!10613))

(declare-fun mapValue!35293 () ValueCell!10613)

(assert (=> mapNonEmpty!35293 (= (arr!29084 _values!1425) (store mapRest!35293 mapKey!35293 mapValue!35293))))

(declare-fun b!973142 () Bool)

(declare-fun res!651110 () Bool)

(assert (=> b!973142 (=> (not res!651110) (not e!548601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60452 (_ BitVec 32)) Bool)

(assert (=> b!973142 (= res!651110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973143 () Bool)

(assert (=> b!973143 (= e!548603 tp_is_empty!22189)))

(declare-fun b!973144 () Bool)

(assert (=> b!973144 (= e!548605 tp_is_empty!22189)))

(assert (= (and start!83466 res!651116) b!973137))

(assert (= (and b!973137 res!651111) b!973142))

(assert (= (and b!973142 res!651110) b!973141))

(assert (= (and b!973141 res!651114) b!973140))

(assert (= (and b!973140 res!651113) b!973138))

(assert (= (and b!973138 res!651109) b!973135))

(assert (= (and b!973135 res!651115) b!973139))

(assert (= (and b!973139 res!651112) b!973136))

(assert (= (and b!973134 condMapEmpty!35293) mapIsEmpty!35293))

(assert (= (and b!973134 (not condMapEmpty!35293)) mapNonEmpty!35293))

(get-info :version)

(assert (= (and mapNonEmpty!35293 ((_ is ValueCellFull!10613) mapValue!35293)) b!973143))

(assert (= (and b!973134 ((_ is ValueCellFull!10613) mapDefault!35293)) b!973144))

(assert (= start!83466 b!973134))

(declare-fun b_lambda!14469 () Bool)

(assert (=> (not b_lambda!14469) (not b!973136)))

(declare-fun t!28530 () Bool)

(declare-fun tb!6231 () Bool)

(assert (=> (and start!83466 (= defaultEntry!1428 defaultEntry!1428) t!28530) tb!6231))

(declare-fun result!12447 () Bool)

(assert (=> tb!6231 (= result!12447 tp_is_empty!22189)))

(assert (=> b!973136 t!28530))

(declare-fun b_and!30815 () Bool)

(assert (= b_and!30813 (and (=> t!28530 result!12447) b_and!30815)))

(declare-fun m!900917 () Bool)

(assert (=> b!973138 m!900917))

(assert (=> b!973138 m!900917))

(declare-fun m!900919 () Bool)

(assert (=> b!973138 m!900919))

(declare-fun m!900921 () Bool)

(assert (=> start!83466 m!900921))

(declare-fun m!900923 () Bool)

(assert (=> start!83466 m!900923))

(declare-fun m!900925 () Bool)

(assert (=> start!83466 m!900925))

(declare-fun m!900927 () Bool)

(assert (=> b!973139 m!900927))

(declare-fun m!900929 () Bool)

(assert (=> b!973139 m!900929))

(declare-fun m!900931 () Bool)

(assert (=> b!973139 m!900931))

(declare-fun m!900933 () Bool)

(assert (=> b!973136 m!900933))

(declare-fun m!900935 () Bool)

(assert (=> b!973136 m!900935))

(declare-fun m!900937 () Bool)

(assert (=> b!973136 m!900937))

(assert (=> b!973136 m!900933))

(assert (=> b!973136 m!900937))

(declare-fun m!900939 () Bool)

(assert (=> b!973136 m!900939))

(assert (=> b!973136 m!900935))

(declare-fun m!900941 () Bool)

(assert (=> b!973136 m!900941))

(declare-fun m!900943 () Bool)

(assert (=> b!973136 m!900943))

(declare-fun m!900945 () Bool)

(assert (=> b!973135 m!900945))

(assert (=> b!973135 m!900917))

(assert (=> b!973135 m!900945))

(assert (=> b!973135 m!900917))

(declare-fun m!900947 () Bool)

(assert (=> b!973135 m!900947))

(declare-fun m!900949 () Bool)

(assert (=> b!973141 m!900949))

(declare-fun m!900951 () Bool)

(assert (=> b!973142 m!900951))

(declare-fun m!900953 () Bool)

(assert (=> mapNonEmpty!35293 m!900953))

(check-sat (not b!973139) b_and!30815 (not b!973141) (not b_next!19291) (not b!973135) (not mapNonEmpty!35293) (not b!973138) (not b_lambda!14469) (not b!973136) tp_is_empty!22189 (not start!83466) (not b!973142))
(check-sat b_and!30815 (not b_next!19291))
