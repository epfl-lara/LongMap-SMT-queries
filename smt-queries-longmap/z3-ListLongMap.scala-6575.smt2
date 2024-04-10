; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83336 () Bool)

(assert start!83336)

(declare-fun b_free!19329 () Bool)

(declare-fun b_next!19329 () Bool)

(assert (=> start!83336 (= b_free!19329 (not b_next!19329))))

(declare-fun tp!67266 () Bool)

(declare-fun b_and!30879 () Bool)

(assert (=> start!83336 (= tp!67266 b_and!30879)))

(declare-fun b!972896 () Bool)

(declare-fun res!651221 () Bool)

(declare-fun e!548367 () Bool)

(assert (=> b!972896 (=> (not res!651221) (not e!548367))))

(declare-datatypes ((array!60497 0))(
  ( (array!60498 (arr!29112 (Array (_ BitVec 32) (_ BitVec 64))) (size!29591 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60497)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972896 (= res!651221 (validKeyInArray!0 (select (arr!29112 _keys!1717) i!822)))))

(declare-fun b!972897 () Bool)

(declare-fun res!651223 () Bool)

(assert (=> b!972897 (=> (not res!651223) (not e!548367))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972897 (= res!651223 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29591 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29591 _keys!1717))))))

(declare-fun b!972898 () Bool)

(declare-fun res!651228 () Bool)

(assert (=> b!972898 (=> (not res!651228) (not e!548367))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60497 (_ BitVec 32)) Bool)

(assert (=> b!972898 (= res!651228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972900 () Bool)

(declare-fun res!651227 () Bool)

(assert (=> b!972900 (=> (not res!651227) (not e!548367))))

(declare-datatypes ((V!34619 0))(
  ( (V!34620 (val!11164 Int)) )
))
(declare-datatypes ((ValueCell!10632 0))(
  ( (ValueCellFull!10632 (v!13723 V!34619)) (EmptyCell!10632) )
))
(declare-datatypes ((array!60499 0))(
  ( (array!60500 (arr!29113 (Array (_ BitVec 32) ValueCell!10632)) (size!29592 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60499)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972900 (= res!651227 (and (= (size!29592 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29591 _keys!1717) (size!29592 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972901 () Bool)

(declare-fun e!548366 () Bool)

(assert (=> b!972901 (= e!548366 (not true))))

(declare-datatypes ((tuple2!14324 0))(
  ( (tuple2!14325 (_1!7173 (_ BitVec 64)) (_2!7173 V!34619)) )
))
(declare-datatypes ((List!20187 0))(
  ( (Nil!20184) (Cons!20183 (h!21345 tuple2!14324) (t!28614 List!20187)) )
))
(declare-datatypes ((ListLongMap!13021 0))(
  ( (ListLongMap!13022 (toList!6526 List!20187)) )
))
(declare-fun lt!432176 () ListLongMap!13021)

(declare-fun lt!432175 () tuple2!14324)

(declare-fun contains!5619 (ListLongMap!13021 (_ BitVec 64)) Bool)

(declare-fun +!2897 (ListLongMap!13021 tuple2!14324) ListLongMap!13021)

(assert (=> b!972901 (contains!5619 (+!2897 lt!432176 lt!432175) (select (arr!29112 _keys!1717) i!822))))

(declare-datatypes ((Unit!32415 0))(
  ( (Unit!32416) )
))
(declare-fun lt!432173 () Unit!32415)

(declare-fun lt!432174 () (_ BitVec 64))

(declare-fun lt!432178 () V!34619)

(declare-fun addStillContains!593 (ListLongMap!13021 (_ BitVec 64) V!34619 (_ BitVec 64)) Unit!32415)

(assert (=> b!972901 (= lt!432173 (addStillContains!593 lt!432176 lt!432174 lt!432178 (select (arr!29112 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34619)

(declare-fun lt!432177 () ListLongMap!13021)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34619)

(declare-fun getCurrentListMap!3759 (array!60497 array!60499 (_ BitVec 32) (_ BitVec 32) V!34619 V!34619 (_ BitVec 32) Int) ListLongMap!13021)

(assert (=> b!972901 (= lt!432177 (+!2897 (getCurrentListMap!3759 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432175))))

(assert (=> b!972901 (= lt!432175 (tuple2!14325 lt!432174 lt!432178))))

(declare-fun get!15086 (ValueCell!10632 V!34619) V!34619)

(declare-fun dynLambda!1686 (Int (_ BitVec 64)) V!34619)

(assert (=> b!972901 (= lt!432178 (get!15086 (select (arr!29113 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1686 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432179 () Unit!32415)

(declare-fun lemmaListMapRecursiveValidKeyArray!263 (array!60497 array!60499 (_ BitVec 32) (_ BitVec 32) V!34619 V!34619 (_ BitVec 32) Int) Unit!32415)

(assert (=> b!972901 (= lt!432179 (lemmaListMapRecursiveValidKeyArray!263 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972902 () Bool)

(declare-fun res!651226 () Bool)

(assert (=> b!972902 (=> (not res!651226) (not e!548367))))

(declare-datatypes ((List!20188 0))(
  ( (Nil!20185) (Cons!20184 (h!21346 (_ BitVec 64)) (t!28615 List!20188)) )
))
(declare-fun arrayNoDuplicates!0 (array!60497 (_ BitVec 32) List!20188) Bool)

(assert (=> b!972902 (= res!651226 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20185))))

(declare-fun b!972903 () Bool)

(declare-fun e!548365 () Bool)

(assert (=> b!972903 (= e!548365 e!548366)))

(declare-fun res!651222 () Bool)

(assert (=> b!972903 (=> (not res!651222) (not e!548366))))

(assert (=> b!972903 (= res!651222 (validKeyInArray!0 lt!432174))))

(assert (=> b!972903 (= lt!432174 (select (arr!29112 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972903 (= lt!432177 (getCurrentListMap!3759 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35350 () Bool)

(declare-fun mapRes!35350 () Bool)

(assert (=> mapIsEmpty!35350 mapRes!35350))

(declare-fun b!972904 () Bool)

(declare-fun e!548369 () Bool)

(declare-fun tp_is_empty!22227 () Bool)

(assert (=> b!972904 (= e!548369 tp_is_empty!22227)))

(declare-fun b!972905 () Bool)

(assert (=> b!972905 (= e!548367 e!548365)))

(declare-fun res!651224 () Bool)

(assert (=> b!972905 (=> (not res!651224) (not e!548365))))

(assert (=> b!972905 (= res!651224 (contains!5619 lt!432176 (select (arr!29112 _keys!1717) i!822)))))

(assert (=> b!972905 (= lt!432176 (getCurrentListMap!3759 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun res!651225 () Bool)

(assert (=> start!83336 (=> (not res!651225) (not e!548367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83336 (= res!651225 (validMask!0 mask!2147))))

(assert (=> start!83336 e!548367))

(assert (=> start!83336 true))

(declare-fun e!548371 () Bool)

(declare-fun array_inv!22521 (array!60499) Bool)

(assert (=> start!83336 (and (array_inv!22521 _values!1425) e!548371)))

(assert (=> start!83336 tp_is_empty!22227))

(assert (=> start!83336 tp!67266))

(declare-fun array_inv!22522 (array!60497) Bool)

(assert (=> start!83336 (array_inv!22522 _keys!1717)))

(declare-fun b!972899 () Bool)

(declare-fun e!548368 () Bool)

(assert (=> b!972899 (= e!548368 tp_is_empty!22227)))

(declare-fun b!972906 () Bool)

(assert (=> b!972906 (= e!548371 (and e!548368 mapRes!35350))))

(declare-fun condMapEmpty!35350 () Bool)

(declare-fun mapDefault!35350 () ValueCell!10632)

(assert (=> b!972906 (= condMapEmpty!35350 (= (arr!29113 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10632)) mapDefault!35350)))))

(declare-fun mapNonEmpty!35350 () Bool)

(declare-fun tp!67265 () Bool)

(assert (=> mapNonEmpty!35350 (= mapRes!35350 (and tp!67265 e!548369))))

(declare-fun mapKey!35350 () (_ BitVec 32))

(declare-fun mapValue!35350 () ValueCell!10632)

(declare-fun mapRest!35350 () (Array (_ BitVec 32) ValueCell!10632))

(assert (=> mapNonEmpty!35350 (= (arr!29113 _values!1425) (store mapRest!35350 mapKey!35350 mapValue!35350))))

(assert (= (and start!83336 res!651225) b!972900))

(assert (= (and b!972900 res!651227) b!972898))

(assert (= (and b!972898 res!651228) b!972902))

(assert (= (and b!972902 res!651226) b!972897))

(assert (= (and b!972897 res!651223) b!972896))

(assert (= (and b!972896 res!651221) b!972905))

(assert (= (and b!972905 res!651224) b!972903))

(assert (= (and b!972903 res!651222) b!972901))

(assert (= (and b!972906 condMapEmpty!35350) mapIsEmpty!35350))

(assert (= (and b!972906 (not condMapEmpty!35350)) mapNonEmpty!35350))

(get-info :version)

(assert (= (and mapNonEmpty!35350 ((_ is ValueCellFull!10632) mapValue!35350)) b!972904))

(assert (= (and b!972906 ((_ is ValueCellFull!10632) mapDefault!35350)) b!972899))

(assert (= start!83336 b!972906))

(declare-fun b_lambda!14493 () Bool)

(assert (=> (not b_lambda!14493) (not b!972901)))

(declare-fun t!28613 () Bool)

(declare-fun tb!6277 () Bool)

(assert (=> (and start!83336 (= defaultEntry!1428 defaultEntry!1428) t!28613) tb!6277))

(declare-fun result!12531 () Bool)

(assert (=> tb!6277 (= result!12531 tp_is_empty!22227)))

(assert (=> b!972901 t!28613))

(declare-fun b_and!30881 () Bool)

(assert (= b_and!30879 (and (=> t!28613 result!12531) b_and!30881)))

(declare-fun m!900351 () Bool)

(assert (=> b!972896 m!900351))

(assert (=> b!972896 m!900351))

(declare-fun m!900353 () Bool)

(assert (=> b!972896 m!900353))

(declare-fun m!900355 () Bool)

(assert (=> b!972903 m!900355))

(declare-fun m!900357 () Bool)

(assert (=> b!972903 m!900357))

(declare-fun m!900359 () Bool)

(assert (=> b!972903 m!900359))

(declare-fun m!900361 () Bool)

(assert (=> b!972902 m!900361))

(declare-fun m!900363 () Bool)

(assert (=> b!972898 m!900363))

(declare-fun m!900365 () Bool)

(assert (=> mapNonEmpty!35350 m!900365))

(declare-fun m!900367 () Bool)

(assert (=> b!972901 m!900367))

(declare-fun m!900369 () Bool)

(assert (=> b!972901 m!900369))

(declare-fun m!900371 () Bool)

(assert (=> b!972901 m!900371))

(declare-fun m!900373 () Bool)

(assert (=> b!972901 m!900373))

(declare-fun m!900375 () Bool)

(assert (=> b!972901 m!900375))

(assert (=> b!972901 m!900351))

(declare-fun m!900377 () Bool)

(assert (=> b!972901 m!900377))

(assert (=> b!972901 m!900351))

(assert (=> b!972901 m!900375))

(assert (=> b!972901 m!900371))

(assert (=> b!972901 m!900373))

(declare-fun m!900379 () Bool)

(assert (=> b!972901 m!900379))

(declare-fun m!900381 () Bool)

(assert (=> b!972901 m!900381))

(assert (=> b!972901 m!900367))

(assert (=> b!972901 m!900351))

(declare-fun m!900383 () Bool)

(assert (=> b!972901 m!900383))

(assert (=> b!972905 m!900351))

(assert (=> b!972905 m!900351))

(declare-fun m!900385 () Bool)

(assert (=> b!972905 m!900385))

(declare-fun m!900387 () Bool)

(assert (=> b!972905 m!900387))

(declare-fun m!900389 () Bool)

(assert (=> start!83336 m!900389))

(declare-fun m!900391 () Bool)

(assert (=> start!83336 m!900391))

(declare-fun m!900393 () Bool)

(assert (=> start!83336 m!900393))

(check-sat b_and!30881 (not start!83336) (not mapNonEmpty!35350) (not b!972905) (not b_lambda!14493) (not b!972896) (not b!972898) (not b!972902) tp_is_empty!22227 (not b!972901) (not b_next!19329) (not b!972903))
(check-sat b_and!30881 (not b_next!19329))
