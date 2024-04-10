; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83546 () Bool)

(assert start!83546)

(declare-fun b_free!19533 () Bool)

(declare-fun b_next!19533 () Bool)

(assert (=> start!83546 (= b_free!19533 (not b_next!19533))))

(declare-fun tp!67886 () Bool)

(declare-fun b_and!31161 () Bool)

(assert (=> start!83546 (= tp!67886 b_and!31161)))

(declare-fun b!976224 () Bool)

(declare-fun e!550159 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976224 (= e!550159 (not (bvsge i!822 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!60903 0))(
  ( (array!60904 (arr!29315 (Array (_ BitVec 32) (_ BitVec 64))) (size!29794 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60903)

(declare-datatypes ((V!34899 0))(
  ( (V!34900 (val!11269 Int)) )
))
(declare-datatypes ((tuple2!14500 0))(
  ( (tuple2!14501 (_1!7261 (_ BitVec 64)) (_2!7261 V!34899)) )
))
(declare-datatypes ((List!20351 0))(
  ( (Nil!20348) (Cons!20347 (h!21509 tuple2!14500) (t!28856 List!20351)) )
))
(declare-datatypes ((ListLongMap!13197 0))(
  ( (ListLongMap!13198 (toList!6614 List!20351)) )
))
(declare-fun lt!433039 () ListLongMap!13197)

(declare-fun lt!433040 () tuple2!14500)

(declare-fun contains!5692 (ListLongMap!13197 (_ BitVec 64)) Bool)

(declare-fun +!2924 (ListLongMap!13197 tuple2!14500) ListLongMap!13197)

(assert (=> b!976224 (contains!5692 (+!2924 lt!433039 lt!433040) (select (arr!29315 _keys!1717) i!822))))

(declare-fun lt!433041 () (_ BitVec 64))

(declare-datatypes ((Unit!32469 0))(
  ( (Unit!32470) )
))
(declare-fun lt!433042 () Unit!32469)

(declare-fun lt!433037 () V!34899)

(declare-fun addStillContains!610 (ListLongMap!13197 (_ BitVec 64) V!34899 (_ BitVec 64)) Unit!32469)

(assert (=> b!976224 (= lt!433042 (addStillContains!610 lt!433039 lt!433041 lt!433037 (select (arr!29315 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!433038 () ListLongMap!13197)

(declare-datatypes ((ValueCell!10737 0))(
  ( (ValueCellFull!10737 (v!13828 V!34899)) (EmptyCell!10737) )
))
(declare-datatypes ((array!60905 0))(
  ( (array!60906 (arr!29316 (Array (_ BitVec 32) ValueCell!10737)) (size!29795 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60905)

(declare-fun zeroValue!1367 () V!34899)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34899)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3847 (array!60903 array!60905 (_ BitVec 32) (_ BitVec 32) V!34899 V!34899 (_ BitVec 32) Int) ListLongMap!13197)

(assert (=> b!976224 (= lt!433038 (+!2924 (getCurrentListMap!3847 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!433040))))

(assert (=> b!976224 (= lt!433040 (tuple2!14501 lt!433041 lt!433037))))

(declare-fun get!15183 (ValueCell!10737 V!34899) V!34899)

(declare-fun dynLambda!1713 (Int (_ BitVec 64)) V!34899)

(assert (=> b!976224 (= lt!433037 (get!15183 (select (arr!29316 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1713 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433043 () Unit!32469)

(declare-fun lemmaListMapRecursiveValidKeyArray!290 (array!60903 array!60905 (_ BitVec 32) (_ BitVec 32) V!34899 V!34899 (_ BitVec 32) Int) Unit!32469)

(assert (=> b!976224 (= lt!433043 (lemmaListMapRecursiveValidKeyArray!290 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976225 () Bool)

(declare-fun res!653529 () Bool)

(declare-fun e!550158 () Bool)

(assert (=> b!976225 (=> (not res!653529) (not e!550158))))

(assert (=> b!976225 (= res!653529 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29794 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29794 _keys!1717))))))

(declare-fun b!976226 () Bool)

(declare-fun e!550161 () Bool)

(declare-fun e!550157 () Bool)

(declare-fun mapRes!35665 () Bool)

(assert (=> b!976226 (= e!550161 (and e!550157 mapRes!35665))))

(declare-fun condMapEmpty!35665 () Bool)

(declare-fun mapDefault!35665 () ValueCell!10737)

(assert (=> b!976226 (= condMapEmpty!35665 (= (arr!29316 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10737)) mapDefault!35665)))))

(declare-fun b!976227 () Bool)

(declare-fun res!653525 () Bool)

(assert (=> b!976227 (=> (not res!653525) (not e!550158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60903 (_ BitVec 32)) Bool)

(assert (=> b!976227 (= res!653525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976228 () Bool)

(declare-fun tp_is_empty!22437 () Bool)

(assert (=> b!976228 (= e!550157 tp_is_empty!22437)))

(declare-fun mapNonEmpty!35665 () Bool)

(declare-fun tp!67887 () Bool)

(declare-fun e!550156 () Bool)

(assert (=> mapNonEmpty!35665 (= mapRes!35665 (and tp!67887 e!550156))))

(declare-fun mapRest!35665 () (Array (_ BitVec 32) ValueCell!10737))

(declare-fun mapKey!35665 () (_ BitVec 32))

(declare-fun mapValue!35665 () ValueCell!10737)

(assert (=> mapNonEmpty!35665 (= (arr!29316 _values!1425) (store mapRest!35665 mapKey!35665 mapValue!35665))))

(declare-fun b!976229 () Bool)

(assert (=> b!976229 (= e!550156 tp_is_empty!22437)))

(declare-fun b!976230 () Bool)

(declare-fun res!653531 () Bool)

(assert (=> b!976230 (=> (not res!653531) (not e!550158))))

(assert (=> b!976230 (= res!653531 (and (= (size!29795 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29794 _keys!1717) (size!29795 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976231 () Bool)

(declare-fun e!550162 () Bool)

(assert (=> b!976231 (= e!550162 e!550159)))

(declare-fun res!653530 () Bool)

(assert (=> b!976231 (=> (not res!653530) (not e!550159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976231 (= res!653530 (validKeyInArray!0 lt!433041))))

(assert (=> b!976231 (= lt!433041 (select (arr!29315 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!976231 (= lt!433038 (getCurrentListMap!3847 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976232 () Bool)

(declare-fun res!653526 () Bool)

(assert (=> b!976232 (=> (not res!653526) (not e!550158))))

(declare-datatypes ((List!20352 0))(
  ( (Nil!20349) (Cons!20348 (h!21510 (_ BitVec 64)) (t!28857 List!20352)) )
))
(declare-fun arrayNoDuplicates!0 (array!60903 (_ BitVec 32) List!20352) Bool)

(assert (=> b!976232 (= res!653526 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20349))))

(declare-fun mapIsEmpty!35665 () Bool)

(assert (=> mapIsEmpty!35665 mapRes!35665))

(declare-fun b!976233 () Bool)

(declare-fun res!653528 () Bool)

(assert (=> b!976233 (=> (not res!653528) (not e!550158))))

(assert (=> b!976233 (= res!653528 (validKeyInArray!0 (select (arr!29315 _keys!1717) i!822)))))

(declare-fun b!976223 () Bool)

(assert (=> b!976223 (= e!550158 e!550162)))

(declare-fun res!653527 () Bool)

(assert (=> b!976223 (=> (not res!653527) (not e!550162))))

(assert (=> b!976223 (= res!653527 (contains!5692 lt!433039 (select (arr!29315 _keys!1717) i!822)))))

(assert (=> b!976223 (= lt!433039 (getCurrentListMap!3847 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun res!653532 () Bool)

(assert (=> start!83546 (=> (not res!653532) (not e!550158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83546 (= res!653532 (validMask!0 mask!2147))))

(assert (=> start!83546 e!550158))

(assert (=> start!83546 true))

(declare-fun array_inv!22665 (array!60905) Bool)

(assert (=> start!83546 (and (array_inv!22665 _values!1425) e!550161)))

(assert (=> start!83546 tp_is_empty!22437))

(assert (=> start!83546 tp!67886))

(declare-fun array_inv!22666 (array!60903) Bool)

(assert (=> start!83546 (array_inv!22666 _keys!1717)))

(assert (= (and start!83546 res!653532) b!976230))

(assert (= (and b!976230 res!653531) b!976227))

(assert (= (and b!976227 res!653525) b!976232))

(assert (= (and b!976232 res!653526) b!976225))

(assert (= (and b!976225 res!653529) b!976233))

(assert (= (and b!976233 res!653528) b!976223))

(assert (= (and b!976223 res!653527) b!976231))

(assert (= (and b!976231 res!653530) b!976224))

(assert (= (and b!976226 condMapEmpty!35665) mapIsEmpty!35665))

(assert (= (and b!976226 (not condMapEmpty!35665)) mapNonEmpty!35665))

(get-info :version)

(assert (= (and mapNonEmpty!35665 ((_ is ValueCellFull!10737) mapValue!35665)) b!976229))

(assert (= (and b!976226 ((_ is ValueCellFull!10737) mapDefault!35665)) b!976228))

(assert (= start!83546 b!976226))

(declare-fun b_lambda!14571 () Bool)

(assert (=> (not b_lambda!14571) (not b!976224)))

(declare-fun t!28855 () Bool)

(declare-fun tb!6355 () Bool)

(assert (=> (and start!83546 (= defaultEntry!1428 defaultEntry!1428) t!28855) tb!6355))

(declare-fun result!12687 () Bool)

(assert (=> tb!6355 (= result!12687 tp_is_empty!22437)))

(assert (=> b!976224 t!28855))

(declare-fun b_and!31163 () Bool)

(assert (= b_and!31161 (and (=> t!28855 result!12687) b_and!31163)))

(declare-fun m!903429 () Bool)

(assert (=> b!976233 m!903429))

(assert (=> b!976233 m!903429))

(declare-fun m!903431 () Bool)

(assert (=> b!976233 m!903431))

(declare-fun m!903433 () Bool)

(assert (=> b!976224 m!903433))

(declare-fun m!903435 () Bool)

(assert (=> b!976224 m!903435))

(assert (=> b!976224 m!903429))

(assert (=> b!976224 m!903433))

(assert (=> b!976224 m!903435))

(declare-fun m!903437 () Bool)

(assert (=> b!976224 m!903437))

(declare-fun m!903439 () Bool)

(assert (=> b!976224 m!903439))

(declare-fun m!903441 () Bool)

(assert (=> b!976224 m!903441))

(declare-fun m!903443 () Bool)

(assert (=> b!976224 m!903443))

(assert (=> b!976224 m!903439))

(declare-fun m!903445 () Bool)

(assert (=> b!976224 m!903445))

(assert (=> b!976224 m!903429))

(declare-fun m!903447 () Bool)

(assert (=> b!976224 m!903447))

(assert (=> b!976224 m!903445))

(assert (=> b!976224 m!903429))

(declare-fun m!903449 () Bool)

(assert (=> b!976224 m!903449))

(declare-fun m!903451 () Bool)

(assert (=> start!83546 m!903451))

(declare-fun m!903453 () Bool)

(assert (=> start!83546 m!903453))

(declare-fun m!903455 () Bool)

(assert (=> start!83546 m!903455))

(declare-fun m!903457 () Bool)

(assert (=> b!976232 m!903457))

(declare-fun m!903459 () Bool)

(assert (=> b!976231 m!903459))

(declare-fun m!903461 () Bool)

(assert (=> b!976231 m!903461))

(declare-fun m!903463 () Bool)

(assert (=> b!976231 m!903463))

(declare-fun m!903465 () Bool)

(assert (=> mapNonEmpty!35665 m!903465))

(assert (=> b!976223 m!903429))

(assert (=> b!976223 m!903429))

(declare-fun m!903467 () Bool)

(assert (=> b!976223 m!903467))

(declare-fun m!903469 () Bool)

(assert (=> b!976223 m!903469))

(declare-fun m!903471 () Bool)

(assert (=> b!976227 m!903471))

(check-sat (not b!976231) (not b_lambda!14571) (not b!976227) (not b_next!19533) (not start!83546) (not b!976224) (not b!976233) (not b!976232) tp_is_empty!22437 b_and!31163 (not b!976223) (not mapNonEmpty!35665))
(check-sat b_and!31163 (not b_next!19533))
