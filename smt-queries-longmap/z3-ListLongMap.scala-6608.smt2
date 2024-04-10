; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83534 () Bool)

(assert start!83534)

(declare-fun b_free!19521 () Bool)

(declare-fun b_next!19521 () Bool)

(assert (=> start!83534 (= b_free!19521 (not b_next!19521))))

(declare-fun tp!67850 () Bool)

(declare-fun b_and!31137 () Bool)

(assert (=> start!83534 (= tp!67850 b_and!31137)))

(declare-fun b!976013 () Bool)

(declare-fun e!550048 () Bool)

(declare-fun e!550044 () Bool)

(declare-fun mapRes!35647 () Bool)

(assert (=> b!976013 (= e!550048 (and e!550044 mapRes!35647))))

(declare-fun condMapEmpty!35647 () Bool)

(declare-datatypes ((V!34883 0))(
  ( (V!34884 (val!11263 Int)) )
))
(declare-datatypes ((ValueCell!10731 0))(
  ( (ValueCellFull!10731 (v!13822 V!34883)) (EmptyCell!10731) )
))
(declare-datatypes ((array!60879 0))(
  ( (array!60880 (arr!29303 (Array (_ BitVec 32) ValueCell!10731)) (size!29782 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60879)

(declare-fun mapDefault!35647 () ValueCell!10731)

(assert (=> b!976013 (= condMapEmpty!35647 (= (arr!29303 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10731)) mapDefault!35647)))))

(declare-fun res!653385 () Bool)

(declare-fun e!550047 () Bool)

(assert (=> start!83534 (=> (not res!653385) (not e!550047))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83534 (= res!653385 (validMask!0 mask!2147))))

(assert (=> start!83534 e!550047))

(assert (=> start!83534 true))

(declare-fun array_inv!22657 (array!60879) Bool)

(assert (=> start!83534 (and (array_inv!22657 _values!1425) e!550048)))

(declare-fun tp_is_empty!22425 () Bool)

(assert (=> start!83534 tp_is_empty!22425))

(assert (=> start!83534 tp!67850))

(declare-datatypes ((array!60881 0))(
  ( (array!60882 (arr!29304 (Array (_ BitVec 32) (_ BitVec 64))) (size!29783 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60881)

(declare-fun array_inv!22658 (array!60881) Bool)

(assert (=> start!83534 (array_inv!22658 _keys!1717)))

(declare-fun b!976014 () Bool)

(declare-fun res!653384 () Bool)

(assert (=> b!976014 (=> (not res!653384) (not e!550047))))

(declare-fun zeroValue!1367 () V!34883)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34883)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14488 0))(
  ( (tuple2!14489 (_1!7255 (_ BitVec 64)) (_2!7255 V!34883)) )
))
(declare-datatypes ((List!20341 0))(
  ( (Nil!20338) (Cons!20337 (h!21499 tuple2!14488) (t!28834 List!20341)) )
))
(declare-datatypes ((ListLongMap!13185 0))(
  ( (ListLongMap!13186 (toList!6608 List!20341)) )
))
(declare-fun contains!5688 (ListLongMap!13185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3841 (array!60881 array!60879 (_ BitVec 32) (_ BitVec 32) V!34883 V!34883 (_ BitVec 32) Int) ListLongMap!13185)

(assert (=> b!976014 (= res!653384 (contains!5688 (getCurrentListMap!3841 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29304 _keys!1717) i!822)))))

(declare-fun b!976015 () Bool)

(declare-fun res!653383 () Bool)

(assert (=> b!976015 (=> (not res!653383) (not e!550047))))

(declare-datatypes ((List!20342 0))(
  ( (Nil!20339) (Cons!20338 (h!21500 (_ BitVec 64)) (t!28835 List!20342)) )
))
(declare-fun arrayNoDuplicates!0 (array!60881 (_ BitVec 32) List!20342) Bool)

(assert (=> b!976015 (= res!653383 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20339))))

(declare-fun b!976016 () Bool)

(declare-fun res!653381 () Bool)

(assert (=> b!976016 (=> (not res!653381) (not e!550047))))

(assert (=> b!976016 (= res!653381 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29783 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29783 _keys!1717))))))

(declare-fun b!976017 () Bool)

(declare-fun res!653387 () Bool)

(assert (=> b!976017 (=> (not res!653387) (not e!550047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976017 (= res!653387 (validKeyInArray!0 (select (arr!29304 _keys!1717) i!822)))))

(declare-fun b!976018 () Bool)

(declare-fun res!653382 () Bool)

(assert (=> b!976018 (=> (not res!653382) (not e!550047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60881 (_ BitVec 32)) Bool)

(assert (=> b!976018 (= res!653382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35647 () Bool)

(declare-fun tp!67851 () Bool)

(declare-fun e!550046 () Bool)

(assert (=> mapNonEmpty!35647 (= mapRes!35647 (and tp!67851 e!550046))))

(declare-fun mapValue!35647 () ValueCell!10731)

(declare-fun mapKey!35647 () (_ BitVec 32))

(declare-fun mapRest!35647 () (Array (_ BitVec 32) ValueCell!10731))

(assert (=> mapNonEmpty!35647 (= (arr!29303 _values!1425) (store mapRest!35647 mapKey!35647 mapValue!35647))))

(declare-fun b!976019 () Bool)

(declare-fun e!550045 () Bool)

(assert (=> b!976019 (= e!550047 e!550045)))

(declare-fun res!653386 () Bool)

(assert (=> b!976019 (=> (not res!653386) (not e!550045))))

(declare-fun lt!432965 () (_ BitVec 64))

(assert (=> b!976019 (= res!653386 (validKeyInArray!0 lt!432965))))

(assert (=> b!976019 (= lt!432965 (select (arr!29304 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432964 () ListLongMap!13185)

(assert (=> b!976019 (= lt!432964 (getCurrentListMap!3841 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976020 () Bool)

(assert (=> b!976020 (= e!550044 tp_is_empty!22425)))

(declare-fun b!976021 () Bool)

(assert (=> b!976021 (= e!550045 (not (bvsge i!822 #b00000000000000000000000000000000)))))

(declare-fun +!2919 (ListLongMap!13185 tuple2!14488) ListLongMap!13185)

(declare-fun get!15174 (ValueCell!10731 V!34883) V!34883)

(declare-fun dynLambda!1708 (Int (_ BitVec 64)) V!34883)

(assert (=> b!976021 (= lt!432964 (+!2919 (getCurrentListMap!3841 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14489 lt!432965 (get!15174 (select (arr!29303 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1708 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32459 0))(
  ( (Unit!32460) )
))
(declare-fun lt!432963 () Unit!32459)

(declare-fun lemmaListMapRecursiveValidKeyArray!285 (array!60881 array!60879 (_ BitVec 32) (_ BitVec 32) V!34883 V!34883 (_ BitVec 32) Int) Unit!32459)

(assert (=> b!976021 (= lt!432963 (lemmaListMapRecursiveValidKeyArray!285 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976022 () Bool)

(assert (=> b!976022 (= e!550046 tp_is_empty!22425)))

(declare-fun mapIsEmpty!35647 () Bool)

(assert (=> mapIsEmpty!35647 mapRes!35647))

(declare-fun b!976023 () Bool)

(declare-fun res!653388 () Bool)

(assert (=> b!976023 (=> (not res!653388) (not e!550047))))

(assert (=> b!976023 (= res!653388 (and (= (size!29782 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29783 _keys!1717) (size!29782 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83534 res!653385) b!976023))

(assert (= (and b!976023 res!653388) b!976018))

(assert (= (and b!976018 res!653382) b!976015))

(assert (= (and b!976015 res!653383) b!976016))

(assert (= (and b!976016 res!653381) b!976017))

(assert (= (and b!976017 res!653387) b!976014))

(assert (= (and b!976014 res!653384) b!976019))

(assert (= (and b!976019 res!653386) b!976021))

(assert (= (and b!976013 condMapEmpty!35647) mapIsEmpty!35647))

(assert (= (and b!976013 (not condMapEmpty!35647)) mapNonEmpty!35647))

(get-info :version)

(assert (= (and mapNonEmpty!35647 ((_ is ValueCellFull!10731) mapValue!35647)) b!976022))

(assert (= (and b!976013 ((_ is ValueCellFull!10731) mapDefault!35647)) b!976020))

(assert (= start!83534 b!976013))

(declare-fun b_lambda!14559 () Bool)

(assert (=> (not b_lambda!14559) (not b!976021)))

(declare-fun t!28833 () Bool)

(declare-fun tb!6343 () Bool)

(assert (=> (and start!83534 (= defaultEntry!1428 defaultEntry!1428) t!28833) tb!6343))

(declare-fun result!12663 () Bool)

(assert (=> tb!6343 (= result!12663 tp_is_empty!22425)))

(assert (=> b!976021 t!28833))

(declare-fun b_and!31139 () Bool)

(assert (= b_and!31137 (and (=> t!28833 result!12663) b_and!31139)))

(declare-fun m!903195 () Bool)

(assert (=> b!976014 m!903195))

(declare-fun m!903197 () Bool)

(assert (=> b!976014 m!903197))

(assert (=> b!976014 m!903195))

(assert (=> b!976014 m!903197))

(declare-fun m!903199 () Bool)

(assert (=> b!976014 m!903199))

(assert (=> b!976017 m!903197))

(assert (=> b!976017 m!903197))

(declare-fun m!903201 () Bool)

(assert (=> b!976017 m!903201))

(declare-fun m!903203 () Bool)

(assert (=> b!976019 m!903203))

(declare-fun m!903205 () Bool)

(assert (=> b!976019 m!903205))

(declare-fun m!903207 () Bool)

(assert (=> b!976019 m!903207))

(declare-fun m!903209 () Bool)

(assert (=> b!976015 m!903209))

(declare-fun m!903211 () Bool)

(assert (=> b!976018 m!903211))

(declare-fun m!903213 () Bool)

(assert (=> start!83534 m!903213))

(declare-fun m!903215 () Bool)

(assert (=> start!83534 m!903215))

(declare-fun m!903217 () Bool)

(assert (=> start!83534 m!903217))

(declare-fun m!903219 () Bool)

(assert (=> mapNonEmpty!35647 m!903219))

(declare-fun m!903221 () Bool)

(assert (=> b!976021 m!903221))

(declare-fun m!903223 () Bool)

(assert (=> b!976021 m!903223))

(declare-fun m!903225 () Bool)

(assert (=> b!976021 m!903225))

(assert (=> b!976021 m!903221))

(assert (=> b!976021 m!903225))

(declare-fun m!903227 () Bool)

(assert (=> b!976021 m!903227))

(assert (=> b!976021 m!903223))

(declare-fun m!903229 () Bool)

(assert (=> b!976021 m!903229))

(declare-fun m!903231 () Bool)

(assert (=> b!976021 m!903231))

(check-sat (not b!976021) (not b_lambda!14559) b_and!31139 (not start!83534) (not b!976015) (not b!976019) (not mapNonEmpty!35647) (not b_next!19521) (not b!976018) tp_is_empty!22425 (not b!976017) (not b!976014))
(check-sat b_and!31139 (not b_next!19521))
