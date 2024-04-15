; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83508 () Bool)

(assert start!83508)

(declare-fun b_free!19513 () Bool)

(declare-fun b_next!19513 () Bool)

(assert (=> start!83508 (= b_free!19513 (not b_next!19513))))

(declare-fun tp!67827 () Bool)

(declare-fun b_and!31095 () Bool)

(assert (=> start!83508 (= tp!67827 b_and!31095)))

(declare-fun b!975634 () Bool)

(declare-fun res!653182 () Bool)

(declare-fun e!549827 () Bool)

(assert (=> b!975634 (=> (not res!653182) (not e!549827))))

(declare-datatypes ((V!34873 0))(
  ( (V!34874 (val!11259 Int)) )
))
(declare-datatypes ((ValueCell!10727 0))(
  ( (ValueCellFull!10727 (v!13817 V!34873)) (EmptyCell!10727) )
))
(declare-datatypes ((array!60794 0))(
  ( (array!60795 (arr!29261 (Array (_ BitVec 32) ValueCell!10727)) (size!29742 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60794)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60796 0))(
  ( (array!60797 (arr!29262 (Array (_ BitVec 32) (_ BitVec 64))) (size!29743 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60796)

(assert (=> b!975634 (= res!653182 (and (= (size!29742 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29743 _keys!1717) (size!29742 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975635 () Bool)

(declare-fun e!549826 () Bool)

(declare-fun tp_is_empty!22417 () Bool)

(assert (=> b!975635 (= e!549826 tp_is_empty!22417)))

(declare-fun b!975636 () Bool)

(declare-fun res!653175 () Bool)

(assert (=> b!975636 (=> (not res!653175) (not e!549827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60796 (_ BitVec 32)) Bool)

(assert (=> b!975636 (= res!653175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975637 () Bool)

(declare-fun e!549825 () Bool)

(assert (=> b!975637 (= e!549825 tp_is_empty!22417)))

(declare-fun b!975638 () Bool)

(declare-fun res!653177 () Bool)

(assert (=> b!975638 (=> (not res!653177) (not e!549827))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975638 (= res!653177 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29743 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29743 _keys!1717))))))

(declare-fun b!975639 () Bool)

(declare-fun e!549828 () Bool)

(assert (=> b!975639 (= e!549828 (not (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29742 _values!1425))))))

(declare-fun lt!432692 () (_ BitVec 64))

(declare-fun zeroValue!1367 () V!34873)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34873)

(declare-datatypes ((tuple2!14544 0))(
  ( (tuple2!14545 (_1!7283 (_ BitVec 64)) (_2!7283 V!34873)) )
))
(declare-datatypes ((List!20352 0))(
  ( (Nil!20349) (Cons!20348 (h!21510 tuple2!14544) (t!28828 List!20352)) )
))
(declare-datatypes ((ListLongMap!13231 0))(
  ( (ListLongMap!13232 (toList!6631 List!20352)) )
))
(declare-fun lt!432691 () ListLongMap!13231)

(declare-fun +!2935 (ListLongMap!13231 tuple2!14544) ListLongMap!13231)

(declare-fun getCurrentListMap!3793 (array!60796 array!60794 (_ BitVec 32) (_ BitVec 32) V!34873 V!34873 (_ BitVec 32) Int) ListLongMap!13231)

(declare-fun get!15160 (ValueCell!10727 V!34873) V!34873)

(declare-fun dynLambda!1691 (Int (_ BitVec 64)) V!34873)

(assert (=> b!975639 (= lt!432691 (+!2935 (getCurrentListMap!3793 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14545 lt!432692 (get!15160 (select (arr!29261 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1691 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32322 0))(
  ( (Unit!32323) )
))
(declare-fun lt!432693 () Unit!32322)

(declare-fun lemmaListMapRecursiveValidKeyArray!275 (array!60796 array!60794 (_ BitVec 32) (_ BitVec 32) V!34873 V!34873 (_ BitVec 32) Int) Unit!32322)

(assert (=> b!975639 (= lt!432693 (lemmaListMapRecursiveValidKeyArray!275 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975640 () Bool)

(declare-fun res!653178 () Bool)

(assert (=> b!975640 (=> (not res!653178) (not e!549827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975640 (= res!653178 (validKeyInArray!0 (select (arr!29262 _keys!1717) i!822)))))

(declare-fun b!975641 () Bool)

(declare-fun res!653179 () Bool)

(assert (=> b!975641 (=> (not res!653179) (not e!549827))))

(declare-fun contains!5661 (ListLongMap!13231 (_ BitVec 64)) Bool)

(assert (=> b!975641 (= res!653179 (contains!5661 (getCurrentListMap!3793 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29262 _keys!1717) i!822)))))

(declare-fun b!975642 () Bool)

(declare-fun e!549823 () Bool)

(declare-fun mapRes!35635 () Bool)

(assert (=> b!975642 (= e!549823 (and e!549825 mapRes!35635))))

(declare-fun condMapEmpty!35635 () Bool)

(declare-fun mapDefault!35635 () ValueCell!10727)

(assert (=> b!975642 (= condMapEmpty!35635 (= (arr!29261 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10727)) mapDefault!35635)))))

(declare-fun mapNonEmpty!35635 () Bool)

(declare-fun tp!67828 () Bool)

(assert (=> mapNonEmpty!35635 (= mapRes!35635 (and tp!67828 e!549826))))

(declare-fun mapKey!35635 () (_ BitVec 32))

(declare-fun mapRest!35635 () (Array (_ BitVec 32) ValueCell!10727))

(declare-fun mapValue!35635 () ValueCell!10727)

(assert (=> mapNonEmpty!35635 (= (arr!29261 _values!1425) (store mapRest!35635 mapKey!35635 mapValue!35635))))

(declare-fun res!653176 () Bool)

(assert (=> start!83508 (=> (not res!653176) (not e!549827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83508 (= res!653176 (validMask!0 mask!2147))))

(assert (=> start!83508 e!549827))

(assert (=> start!83508 true))

(declare-fun array_inv!22675 (array!60794) Bool)

(assert (=> start!83508 (and (array_inv!22675 _values!1425) e!549823)))

(assert (=> start!83508 tp_is_empty!22417))

(assert (=> start!83508 tp!67827))

(declare-fun array_inv!22676 (array!60796) Bool)

(assert (=> start!83508 (array_inv!22676 _keys!1717)))

(declare-fun b!975643 () Bool)

(declare-fun res!653181 () Bool)

(assert (=> b!975643 (=> (not res!653181) (not e!549827))))

(declare-datatypes ((List!20353 0))(
  ( (Nil!20350) (Cons!20349 (h!21511 (_ BitVec 64)) (t!28829 List!20353)) )
))
(declare-fun arrayNoDuplicates!0 (array!60796 (_ BitVec 32) List!20353) Bool)

(assert (=> b!975643 (= res!653181 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20350))))

(declare-fun b!975644 () Bool)

(assert (=> b!975644 (= e!549827 e!549828)))

(declare-fun res!653180 () Bool)

(assert (=> b!975644 (=> (not res!653180) (not e!549828))))

(assert (=> b!975644 (= res!653180 (validKeyInArray!0 lt!432692))))

(assert (=> b!975644 (= lt!432692 (select (arr!29262 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!975644 (= lt!432691 (getCurrentListMap!3793 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35635 () Bool)

(assert (=> mapIsEmpty!35635 mapRes!35635))

(assert (= (and start!83508 res!653176) b!975634))

(assert (= (and b!975634 res!653182) b!975636))

(assert (= (and b!975636 res!653175) b!975643))

(assert (= (and b!975643 res!653181) b!975638))

(assert (= (and b!975638 res!653177) b!975640))

(assert (= (and b!975640 res!653178) b!975641))

(assert (= (and b!975641 res!653179) b!975644))

(assert (= (and b!975644 res!653180) b!975639))

(assert (= (and b!975642 condMapEmpty!35635) mapIsEmpty!35635))

(assert (= (and b!975642 (not condMapEmpty!35635)) mapNonEmpty!35635))

(get-info :version)

(assert (= (and mapNonEmpty!35635 ((_ is ValueCellFull!10727) mapValue!35635)) b!975635))

(assert (= (and b!975642 ((_ is ValueCellFull!10727) mapDefault!35635)) b!975637))

(assert (= start!83508 b!975642))

(declare-fun b_lambda!14533 () Bool)

(assert (=> (not b_lambda!14533) (not b!975639)))

(declare-fun t!28827 () Bool)

(declare-fun tb!6327 () Bool)

(assert (=> (and start!83508 (= defaultEntry!1428 defaultEntry!1428) t!28827) tb!6327))

(declare-fun result!12639 () Bool)

(assert (=> tb!6327 (= result!12639 tp_is_empty!22417)))

(assert (=> b!975639 t!28827))

(declare-fun b_and!31097 () Bool)

(assert (= b_and!31095 (and (=> t!28827 result!12639) b_and!31097)))

(declare-fun m!902285 () Bool)

(assert (=> b!975643 m!902285))

(declare-fun m!902287 () Bool)

(assert (=> b!975636 m!902287))

(declare-fun m!902289 () Bool)

(assert (=> mapNonEmpty!35635 m!902289))

(declare-fun m!902291 () Bool)

(assert (=> start!83508 m!902291))

(declare-fun m!902293 () Bool)

(assert (=> start!83508 m!902293))

(declare-fun m!902295 () Bool)

(assert (=> start!83508 m!902295))

(declare-fun m!902297 () Bool)

(assert (=> b!975639 m!902297))

(declare-fun m!902299 () Bool)

(assert (=> b!975639 m!902299))

(declare-fun m!902301 () Bool)

(assert (=> b!975639 m!902301))

(assert (=> b!975639 m!902299))

(declare-fun m!902303 () Bool)

(assert (=> b!975639 m!902303))

(assert (=> b!975639 m!902297))

(assert (=> b!975639 m!902301))

(declare-fun m!902305 () Bool)

(assert (=> b!975639 m!902305))

(declare-fun m!902307 () Bool)

(assert (=> b!975639 m!902307))

(declare-fun m!902309 () Bool)

(assert (=> b!975641 m!902309))

(declare-fun m!902311 () Bool)

(assert (=> b!975641 m!902311))

(assert (=> b!975641 m!902309))

(assert (=> b!975641 m!902311))

(declare-fun m!902313 () Bool)

(assert (=> b!975641 m!902313))

(declare-fun m!902315 () Bool)

(assert (=> b!975644 m!902315))

(declare-fun m!902317 () Bool)

(assert (=> b!975644 m!902317))

(declare-fun m!902319 () Bool)

(assert (=> b!975644 m!902319))

(assert (=> b!975640 m!902311))

(assert (=> b!975640 m!902311))

(declare-fun m!902321 () Bool)

(assert (=> b!975640 m!902321))

(check-sat (not b!975641) (not start!83508) (not b!975636) (not b_next!19513) (not b!975639) (not b!975644) (not mapNonEmpty!35635) (not b_lambda!14533) tp_is_empty!22417 (not b!975643) (not b!975640) b_and!31097)
(check-sat b_and!31097 (not b_next!19513))
