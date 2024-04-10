; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83552 () Bool)

(assert start!83552)

(declare-fun b_free!19539 () Bool)

(declare-fun b_next!19539 () Bool)

(assert (=> start!83552 (= b_free!19539 (not b_next!19539))))

(declare-fun tp!67905 () Bool)

(declare-fun b_and!31173 () Bool)

(assert (=> start!83552 (= tp!67905 b_and!31173)))

(declare-fun b!976328 () Bool)

(declare-fun e!550223 () Bool)

(declare-fun tp_is_empty!22443 () Bool)

(assert (=> b!976328 (= e!550223 tp_is_empty!22443)))

(declare-fun mapNonEmpty!35674 () Bool)

(declare-fun mapRes!35674 () Bool)

(declare-fun tp!67904 () Bool)

(assert (=> mapNonEmpty!35674 (= mapRes!35674 (and tp!67904 e!550223))))

(declare-datatypes ((V!34907 0))(
  ( (V!34908 (val!11272 Int)) )
))
(declare-datatypes ((ValueCell!10740 0))(
  ( (ValueCellFull!10740 (v!13831 V!34907)) (EmptyCell!10740) )
))
(declare-fun mapRest!35674 () (Array (_ BitVec 32) ValueCell!10740))

(declare-datatypes ((array!60913 0))(
  ( (array!60914 (arr!29320 (Array (_ BitVec 32) ValueCell!10740)) (size!29799 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60913)

(declare-fun mapValue!35674 () ValueCell!10740)

(declare-fun mapKey!35674 () (_ BitVec 32))

(assert (=> mapNonEmpty!35674 (= (arr!29320 _values!1425) (store mapRest!35674 mapKey!35674 mapValue!35674))))

(declare-fun b!976329 () Bool)

(declare-fun res!653597 () Bool)

(declare-fun e!550225 () Bool)

(assert (=> b!976329 (=> (not res!653597) (not e!550225))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60915 0))(
  ( (array!60916 (arr!29321 (Array (_ BitVec 32) (_ BitVec 64))) (size!29800 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60915)

(assert (=> b!976329 (= res!653597 (and (= (size!29799 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29800 _keys!1717) (size!29799 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35674 () Bool)

(assert (=> mapIsEmpty!35674 mapRes!35674))

(declare-fun b!976330 () Bool)

(declare-fun e!550220 () Bool)

(declare-fun e!550224 () Bool)

(assert (=> b!976330 (= e!550220 e!550224)))

(declare-fun res!653602 () Bool)

(assert (=> b!976330 (=> (not res!653602) (not e!550224))))

(declare-fun lt!433105 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976330 (= res!653602 (validKeyInArray!0 lt!433105))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!976330 (= lt!433105 (select (arr!29321 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun zeroValue!1367 () V!34907)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34907)

(declare-datatypes ((tuple2!14504 0))(
  ( (tuple2!14505 (_1!7263 (_ BitVec 64)) (_2!7263 V!34907)) )
))
(declare-datatypes ((List!20354 0))(
  ( (Nil!20351) (Cons!20350 (h!21512 tuple2!14504) (t!28865 List!20354)) )
))
(declare-datatypes ((ListLongMap!13201 0))(
  ( (ListLongMap!13202 (toList!6616 List!20354)) )
))
(declare-fun lt!433100 () ListLongMap!13201)

(declare-fun getCurrentListMap!3849 (array!60915 array!60913 (_ BitVec 32) (_ BitVec 32) V!34907 V!34907 (_ BitVec 32) Int) ListLongMap!13201)

(assert (=> b!976330 (= lt!433100 (getCurrentListMap!3849 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976331 () Bool)

(assert (=> b!976331 (= e!550225 e!550220)))

(declare-fun res!653599 () Bool)

(assert (=> b!976331 (=> (not res!653599) (not e!550220))))

(declare-fun lt!433102 () ListLongMap!13201)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5694 (ListLongMap!13201 (_ BitVec 64)) Bool)

(assert (=> b!976331 (= res!653599 (contains!5694 lt!433102 (select (arr!29321 _keys!1717) i!822)))))

(assert (=> b!976331 (= lt!433102 (getCurrentListMap!3849 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!976332 () Bool)

(declare-fun res!653603 () Bool)

(assert (=> b!976332 (=> (not res!653603) (not e!550225))))

(assert (=> b!976332 (= res!653603 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29800 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29800 _keys!1717))))))

(declare-fun b!976333 () Bool)

(assert (=> b!976333 (= e!550224 (not (contains!5694 lt!433100 (select (arr!29321 _keys!1717) i!822))))))

(declare-fun lt!433101 () tuple2!14504)

(declare-fun +!2925 (ListLongMap!13201 tuple2!14504) ListLongMap!13201)

(assert (=> b!976333 (contains!5694 (+!2925 lt!433102 lt!433101) (select (arr!29321 _keys!1717) i!822))))

(declare-datatypes ((Unit!32471 0))(
  ( (Unit!32472) )
))
(declare-fun lt!433103 () Unit!32471)

(declare-fun lt!433106 () V!34907)

(declare-fun addStillContains!611 (ListLongMap!13201 (_ BitVec 64) V!34907 (_ BitVec 64)) Unit!32471)

(assert (=> b!976333 (= lt!433103 (addStillContains!611 lt!433102 lt!433105 lt!433106 (select (arr!29321 _keys!1717) i!822)))))

(assert (=> b!976333 (= lt!433100 (+!2925 (getCurrentListMap!3849 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!433101))))

(assert (=> b!976333 (= lt!433101 (tuple2!14505 lt!433105 lt!433106))))

(declare-fun get!15186 (ValueCell!10740 V!34907) V!34907)

(declare-fun dynLambda!1714 (Int (_ BitVec 64)) V!34907)

(assert (=> b!976333 (= lt!433106 (get!15186 (select (arr!29320 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1714 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433104 () Unit!32471)

(declare-fun lemmaListMapRecursiveValidKeyArray!291 (array!60915 array!60913 (_ BitVec 32) (_ BitVec 32) V!34907 V!34907 (_ BitVec 32) Int) Unit!32471)

(assert (=> b!976333 (= lt!433104 (lemmaListMapRecursiveValidKeyArray!291 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976334 () Bool)

(declare-fun e!550221 () Bool)

(declare-fun e!550219 () Bool)

(assert (=> b!976334 (= e!550221 (and e!550219 mapRes!35674))))

(declare-fun condMapEmpty!35674 () Bool)

(declare-fun mapDefault!35674 () ValueCell!10740)

(assert (=> b!976334 (= condMapEmpty!35674 (= (arr!29320 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10740)) mapDefault!35674)))))

(declare-fun res!653604 () Bool)

(assert (=> start!83552 (=> (not res!653604) (not e!550225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83552 (= res!653604 (validMask!0 mask!2147))))

(assert (=> start!83552 e!550225))

(assert (=> start!83552 true))

(declare-fun array_inv!22669 (array!60913) Bool)

(assert (=> start!83552 (and (array_inv!22669 _values!1425) e!550221)))

(assert (=> start!83552 tp_is_empty!22443))

(assert (=> start!83552 tp!67905))

(declare-fun array_inv!22670 (array!60915) Bool)

(assert (=> start!83552 (array_inv!22670 _keys!1717)))

(declare-fun b!976335 () Bool)

(declare-fun res!653598 () Bool)

(assert (=> b!976335 (=> (not res!653598) (not e!550225))))

(assert (=> b!976335 (= res!653598 (validKeyInArray!0 (select (arr!29321 _keys!1717) i!822)))))

(declare-fun b!976336 () Bool)

(declare-fun res!653600 () Bool)

(assert (=> b!976336 (=> (not res!653600) (not e!550225))))

(declare-datatypes ((List!20355 0))(
  ( (Nil!20352) (Cons!20351 (h!21513 (_ BitVec 64)) (t!28866 List!20355)) )
))
(declare-fun arrayNoDuplicates!0 (array!60915 (_ BitVec 32) List!20355) Bool)

(assert (=> b!976336 (= res!653600 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20352))))

(declare-fun b!976337 () Bool)

(declare-fun res!653601 () Bool)

(assert (=> b!976337 (=> (not res!653601) (not e!550225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60915 (_ BitVec 32)) Bool)

(assert (=> b!976337 (= res!653601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976338 () Bool)

(assert (=> b!976338 (= e!550219 tp_is_empty!22443)))

(assert (= (and start!83552 res!653604) b!976329))

(assert (= (and b!976329 res!653597) b!976337))

(assert (= (and b!976337 res!653601) b!976336))

(assert (= (and b!976336 res!653600) b!976332))

(assert (= (and b!976332 res!653603) b!976335))

(assert (= (and b!976335 res!653598) b!976331))

(assert (= (and b!976331 res!653599) b!976330))

(assert (= (and b!976330 res!653602) b!976333))

(assert (= (and b!976334 condMapEmpty!35674) mapIsEmpty!35674))

(assert (= (and b!976334 (not condMapEmpty!35674)) mapNonEmpty!35674))

(get-info :version)

(assert (= (and mapNonEmpty!35674 ((_ is ValueCellFull!10740) mapValue!35674)) b!976328))

(assert (= (and b!976334 ((_ is ValueCellFull!10740) mapDefault!35674)) b!976338))

(assert (= start!83552 b!976334))

(declare-fun b_lambda!14577 () Bool)

(assert (=> (not b_lambda!14577) (not b!976333)))

(declare-fun t!28864 () Bool)

(declare-fun tb!6361 () Bool)

(assert (=> (and start!83552 (= defaultEntry!1428 defaultEntry!1428) t!28864) tb!6361))

(declare-fun result!12699 () Bool)

(assert (=> tb!6361 (= result!12699 tp_is_empty!22443)))

(assert (=> b!976333 t!28864))

(declare-fun b_and!31175 () Bool)

(assert (= b_and!31173 (and (=> t!28864 result!12699) b_and!31175)))

(declare-fun m!903563 () Bool)

(assert (=> b!976335 m!903563))

(assert (=> b!976335 m!903563))

(declare-fun m!903565 () Bool)

(assert (=> b!976335 m!903565))

(declare-fun m!903567 () Bool)

(assert (=> b!976333 m!903567))

(declare-fun m!903569 () Bool)

(assert (=> b!976333 m!903569))

(assert (=> b!976333 m!903563))

(declare-fun m!903571 () Bool)

(assert (=> b!976333 m!903571))

(declare-fun m!903573 () Bool)

(assert (=> b!976333 m!903573))

(declare-fun m!903575 () Bool)

(assert (=> b!976333 m!903575))

(assert (=> b!976333 m!903573))

(declare-fun m!903577 () Bool)

(assert (=> b!976333 m!903577))

(assert (=> b!976333 m!903563))

(declare-fun m!903579 () Bool)

(assert (=> b!976333 m!903579))

(assert (=> b!976333 m!903563))

(declare-fun m!903581 () Bool)

(assert (=> b!976333 m!903581))

(assert (=> b!976333 m!903563))

(assert (=> b!976333 m!903569))

(assert (=> b!976333 m!903567))

(assert (=> b!976333 m!903575))

(declare-fun m!903583 () Bool)

(assert (=> b!976333 m!903583))

(declare-fun m!903585 () Bool)

(assert (=> b!976333 m!903585))

(declare-fun m!903587 () Bool)

(assert (=> b!976330 m!903587))

(declare-fun m!903589 () Bool)

(assert (=> b!976330 m!903589))

(declare-fun m!903591 () Bool)

(assert (=> b!976330 m!903591))

(declare-fun m!903593 () Bool)

(assert (=> mapNonEmpty!35674 m!903593))

(declare-fun m!903595 () Bool)

(assert (=> start!83552 m!903595))

(declare-fun m!903597 () Bool)

(assert (=> start!83552 m!903597))

(declare-fun m!903599 () Bool)

(assert (=> start!83552 m!903599))

(assert (=> b!976331 m!903563))

(assert (=> b!976331 m!903563))

(declare-fun m!903601 () Bool)

(assert (=> b!976331 m!903601))

(declare-fun m!903603 () Bool)

(assert (=> b!976331 m!903603))

(declare-fun m!903605 () Bool)

(assert (=> b!976336 m!903605))

(declare-fun m!903607 () Bool)

(assert (=> b!976337 m!903607))

(check-sat (not b!976330) (not b_lambda!14577) (not b!976337) tp_is_empty!22443 (not b!976335) (not mapNonEmpty!35674) (not b!976336) (not b!976333) (not start!83552) b_and!31175 (not b!976331) (not b_next!19539))
(check-sat b_and!31175 (not b_next!19539))
