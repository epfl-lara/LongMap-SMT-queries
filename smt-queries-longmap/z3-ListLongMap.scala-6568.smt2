; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83294 () Bool)

(assert start!83294)

(declare-fun b_free!19287 () Bool)

(declare-fun b_next!19287 () Bool)

(assert (=> start!83294 (= b_free!19287 (not b_next!19287))))

(declare-fun tp!67140 () Bool)

(declare-fun b_and!30795 () Bool)

(assert (=> start!83294 (= tp!67140 b_and!30795)))

(declare-fun mapNonEmpty!35287 () Bool)

(declare-fun mapRes!35287 () Bool)

(declare-fun tp!67139 () Bool)

(declare-fun e!547987 () Bool)

(assert (=> mapNonEmpty!35287 (= mapRes!35287 (and tp!67139 e!547987))))

(declare-datatypes ((V!34563 0))(
  ( (V!34564 (val!11143 Int)) )
))
(declare-datatypes ((ValueCell!10611 0))(
  ( (ValueCellFull!10611 (v!13702 V!34563)) (EmptyCell!10611) )
))
(declare-fun mapValue!35287 () ValueCell!10611)

(declare-fun mapRest!35287 () (Array (_ BitVec 32) ValueCell!10611))

(declare-datatypes ((array!60417 0))(
  ( (array!60418 (arr!29072 (Array (_ BitVec 32) ValueCell!10611)) (size!29551 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60417)

(declare-fun mapKey!35287 () (_ BitVec 32))

(assert (=> mapNonEmpty!35287 (= (arr!29072 _values!1425) (store mapRest!35287 mapKey!35287 mapValue!35287))))

(declare-fun b!972161 () Bool)

(declare-fun res!650724 () Bool)

(declare-fun e!547982 () Bool)

(assert (=> b!972161 (=> (not res!650724) (not e!547982))))

(declare-datatypes ((array!60419 0))(
  ( (array!60420 (arr!29073 (Array (_ BitVec 32) (_ BitVec 64))) (size!29552 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60419)

(declare-datatypes ((List!20152 0))(
  ( (Nil!20149) (Cons!20148 (h!21310 (_ BitVec 64)) (t!28537 List!20152)) )
))
(declare-fun arrayNoDuplicates!0 (array!60419 (_ BitVec 32) List!20152) Bool)

(assert (=> b!972161 (= res!650724 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20149))))

(declare-fun b!972162 () Bool)

(declare-fun res!650719 () Bool)

(assert (=> b!972162 (=> (not res!650719) (not e!547982))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972162 (= res!650719 (and (= (size!29551 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29552 _keys!1717) (size!29551 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!650720 () Bool)

(assert (=> start!83294 (=> (not res!650720) (not e!547982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83294 (= res!650720 (validMask!0 mask!2147))))

(assert (=> start!83294 e!547982))

(assert (=> start!83294 true))

(declare-fun e!547983 () Bool)

(declare-fun array_inv!22487 (array!60417) Bool)

(assert (=> start!83294 (and (array_inv!22487 _values!1425) e!547983)))

(declare-fun tp_is_empty!22185 () Bool)

(assert (=> start!83294 tp_is_empty!22185))

(assert (=> start!83294 tp!67140))

(declare-fun array_inv!22488 (array!60419) Bool)

(assert (=> start!83294 (array_inv!22488 _keys!1717)))

(declare-fun b!972163 () Bool)

(declare-fun e!547986 () Bool)

(assert (=> b!972163 (= e!547986 tp_is_empty!22185)))

(declare-fun b!972164 () Bool)

(declare-fun e!547985 () Bool)

(assert (=> b!972164 (= e!547982 e!547985)))

(declare-fun res!650721 () Bool)

(assert (=> b!972164 (=> (not res!650721) (not e!547985))))

(declare-fun lt!431966 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972164 (= res!650721 (validKeyInArray!0 lt!431966))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972164 (= lt!431966 (select (arr!29073 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14288 0))(
  ( (tuple2!14289 (_1!7155 (_ BitVec 64)) (_2!7155 V!34563)) )
))
(declare-datatypes ((List!20153 0))(
  ( (Nil!20150) (Cons!20149 (h!21311 tuple2!14288) (t!28538 List!20153)) )
))
(declare-datatypes ((ListLongMap!12985 0))(
  ( (ListLongMap!12986 (toList!6508 List!20153)) )
))
(declare-fun lt!431965 () ListLongMap!12985)

(declare-fun zeroValue!1367 () V!34563)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34563)

(declare-fun getCurrentListMap!3741 (array!60419 array!60417 (_ BitVec 32) (_ BitVec 32) V!34563 V!34563 (_ BitVec 32) Int) ListLongMap!12985)

(assert (=> b!972164 (= lt!431965 (getCurrentListMap!3741 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972165 () Bool)

(assert (=> b!972165 (= e!547987 tp_is_empty!22185)))

(declare-fun b!972166 () Bool)

(declare-fun res!650718 () Bool)

(assert (=> b!972166 (=> (not res!650718) (not e!547982))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972166 (= res!650718 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29552 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29552 _keys!1717))))))

(declare-fun b!972167 () Bool)

(declare-fun res!650717 () Bool)

(assert (=> b!972167 (=> (not res!650717) (not e!547982))))

(assert (=> b!972167 (= res!650717 (validKeyInArray!0 (select (arr!29073 _keys!1717) i!822)))))

(declare-fun b!972168 () Bool)

(assert (=> b!972168 (= e!547985 (not true))))

(declare-fun +!2882 (ListLongMap!12985 tuple2!14288) ListLongMap!12985)

(declare-fun get!15057 (ValueCell!10611 V!34563) V!34563)

(declare-fun dynLambda!1671 (Int (_ BitVec 64)) V!34563)

(assert (=> b!972168 (= lt!431965 (+!2882 (getCurrentListMap!3741 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14289 lt!431966 (get!15057 (select (arr!29072 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1671 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32385 0))(
  ( (Unit!32386) )
))
(declare-fun lt!431964 () Unit!32385)

(declare-fun lemmaListMapRecursiveValidKeyArray!248 (array!60419 array!60417 (_ BitVec 32) (_ BitVec 32) V!34563 V!34563 (_ BitVec 32) Int) Unit!32385)

(assert (=> b!972168 (= lt!431964 (lemmaListMapRecursiveValidKeyArray!248 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972169 () Bool)

(declare-fun res!650722 () Bool)

(assert (=> b!972169 (=> (not res!650722) (not e!547982))))

(declare-fun contains!5604 (ListLongMap!12985 (_ BitVec 64)) Bool)

(assert (=> b!972169 (= res!650722 (contains!5604 (getCurrentListMap!3741 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29073 _keys!1717) i!822)))))

(declare-fun b!972170 () Bool)

(assert (=> b!972170 (= e!547983 (and e!547986 mapRes!35287))))

(declare-fun condMapEmpty!35287 () Bool)

(declare-fun mapDefault!35287 () ValueCell!10611)

(assert (=> b!972170 (= condMapEmpty!35287 (= (arr!29072 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10611)) mapDefault!35287)))))

(declare-fun mapIsEmpty!35287 () Bool)

(assert (=> mapIsEmpty!35287 mapRes!35287))

(declare-fun b!972171 () Bool)

(declare-fun res!650723 () Bool)

(assert (=> b!972171 (=> (not res!650723) (not e!547982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60419 (_ BitVec 32)) Bool)

(assert (=> b!972171 (= res!650723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83294 res!650720) b!972162))

(assert (= (and b!972162 res!650719) b!972171))

(assert (= (and b!972171 res!650723) b!972161))

(assert (= (and b!972161 res!650724) b!972166))

(assert (= (and b!972166 res!650718) b!972167))

(assert (= (and b!972167 res!650717) b!972169))

(assert (= (and b!972169 res!650722) b!972164))

(assert (= (and b!972164 res!650721) b!972168))

(assert (= (and b!972170 condMapEmpty!35287) mapIsEmpty!35287))

(assert (= (and b!972170 (not condMapEmpty!35287)) mapNonEmpty!35287))

(get-info :version)

(assert (= (and mapNonEmpty!35287 ((_ is ValueCellFull!10611) mapValue!35287)) b!972165))

(assert (= (and b!972170 ((_ is ValueCellFull!10611) mapDefault!35287)) b!972163))

(assert (= start!83294 b!972170))

(declare-fun b_lambda!14451 () Bool)

(assert (=> (not b_lambda!14451) (not b!972168)))

(declare-fun t!28536 () Bool)

(declare-fun tb!6235 () Bool)

(assert (=> (and start!83294 (= defaultEntry!1428 defaultEntry!1428) t!28536) tb!6235))

(declare-fun result!12447 () Bool)

(assert (=> tb!6235 (= result!12447 tp_is_empty!22185)))

(assert (=> b!972168 t!28536))

(declare-fun b_and!30797 () Bool)

(assert (= b_and!30795 (and (=> t!28536 result!12447) b_and!30797)))

(declare-fun m!899547 () Bool)

(assert (=> b!972164 m!899547))

(declare-fun m!899549 () Bool)

(assert (=> b!972164 m!899549))

(declare-fun m!899551 () Bool)

(assert (=> b!972164 m!899551))

(declare-fun m!899553 () Bool)

(assert (=> start!83294 m!899553))

(declare-fun m!899555 () Bool)

(assert (=> start!83294 m!899555))

(declare-fun m!899557 () Bool)

(assert (=> start!83294 m!899557))

(declare-fun m!899559 () Bool)

(assert (=> b!972171 m!899559))

(declare-fun m!899561 () Bool)

(assert (=> b!972168 m!899561))

(declare-fun m!899563 () Bool)

(assert (=> b!972168 m!899563))

(declare-fun m!899565 () Bool)

(assert (=> b!972168 m!899565))

(assert (=> b!972168 m!899561))

(assert (=> b!972168 m!899565))

(declare-fun m!899567 () Bool)

(assert (=> b!972168 m!899567))

(assert (=> b!972168 m!899563))

(declare-fun m!899569 () Bool)

(assert (=> b!972168 m!899569))

(declare-fun m!899571 () Bool)

(assert (=> b!972168 m!899571))

(declare-fun m!899573 () Bool)

(assert (=> mapNonEmpty!35287 m!899573))

(declare-fun m!899575 () Bool)

(assert (=> b!972167 m!899575))

(assert (=> b!972167 m!899575))

(declare-fun m!899577 () Bool)

(assert (=> b!972167 m!899577))

(declare-fun m!899579 () Bool)

(assert (=> b!972161 m!899579))

(declare-fun m!899581 () Bool)

(assert (=> b!972169 m!899581))

(assert (=> b!972169 m!899575))

(assert (=> b!972169 m!899581))

(assert (=> b!972169 m!899575))

(declare-fun m!899583 () Bool)

(assert (=> b!972169 m!899583))

(check-sat b_and!30797 (not start!83294) (not b!972167) (not mapNonEmpty!35287) (not b_lambda!14451) (not b!972168) (not b!972169) (not b!972164) (not b!972171) tp_is_empty!22185 (not b!972161) (not b_next!19287))
(check-sat b_and!30797 (not b_next!19287))
