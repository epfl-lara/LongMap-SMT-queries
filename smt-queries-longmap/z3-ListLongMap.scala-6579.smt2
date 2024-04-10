; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83360 () Bool)

(assert start!83360)

(declare-fun b_free!19353 () Bool)

(declare-fun b_next!19353 () Bool)

(assert (=> start!83360 (= b_free!19353 (not b_next!19353))))

(declare-fun tp!67338 () Bool)

(declare-fun b_and!30927 () Bool)

(assert (=> start!83360 (= tp!67338 b_and!30927)))

(declare-fun res!651513 () Bool)

(declare-fun e!548620 () Bool)

(assert (=> start!83360 (=> (not res!651513) (not e!548620))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83360 (= res!651513 (validMask!0 mask!2147))))

(assert (=> start!83360 e!548620))

(assert (=> start!83360 true))

(declare-datatypes ((V!34651 0))(
  ( (V!34652 (val!11176 Int)) )
))
(declare-datatypes ((ValueCell!10644 0))(
  ( (ValueCellFull!10644 (v!13735 V!34651)) (EmptyCell!10644) )
))
(declare-datatypes ((array!60543 0))(
  ( (array!60544 (arr!29135 (Array (_ BitVec 32) ValueCell!10644)) (size!29614 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60543)

(declare-fun e!548618 () Bool)

(declare-fun array_inv!22541 (array!60543) Bool)

(assert (=> start!83360 (and (array_inv!22541 _values!1425) e!548618)))

(declare-fun tp_is_empty!22251 () Bool)

(assert (=> start!83360 tp_is_empty!22251))

(assert (=> start!83360 tp!67338))

(declare-datatypes ((array!60545 0))(
  ( (array!60546 (arr!29136 (Array (_ BitVec 32) (_ BitVec 64))) (size!29615 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60545)

(declare-fun array_inv!22542 (array!60545) Bool)

(assert (=> start!83360 (array_inv!22542 _keys!1717)))

(declare-fun b!973316 () Bool)

(declare-fun res!651509 () Bool)

(assert (=> b!973316 (=> (not res!651509) (not e!548620))))

(declare-datatypes ((List!20207 0))(
  ( (Nil!20204) (Cons!20203 (h!21365 (_ BitVec 64)) (t!28658 List!20207)) )
))
(declare-fun arrayNoDuplicates!0 (array!60545 (_ BitVec 32) List!20207) Bool)

(assert (=> b!973316 (= res!651509 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20204))))

(declare-fun b!973317 () Bool)

(declare-fun e!548619 () Bool)

(assert (=> b!973317 (= e!548619 tp_is_empty!22251)))

(declare-fun b!973318 () Bool)

(declare-fun e!548622 () Bool)

(assert (=> b!973318 (= e!548622 tp_is_empty!22251)))

(declare-fun mapIsEmpty!35386 () Bool)

(declare-fun mapRes!35386 () Bool)

(assert (=> mapIsEmpty!35386 mapRes!35386))

(declare-fun b!973319 () Bool)

(declare-fun e!548617 () Bool)

(assert (=> b!973319 (= e!548620 e!548617)))

(declare-fun res!651510 () Bool)

(assert (=> b!973319 (=> (not res!651510) (not e!548617))))

(declare-datatypes ((tuple2!14346 0))(
  ( (tuple2!14347 (_1!7184 (_ BitVec 64)) (_2!7184 V!34651)) )
))
(declare-datatypes ((List!20208 0))(
  ( (Nil!20205) (Cons!20204 (h!21366 tuple2!14346) (t!28659 List!20208)) )
))
(declare-datatypes ((ListLongMap!13043 0))(
  ( (ListLongMap!13044 (toList!6537 List!20208)) )
))
(declare-fun lt!432430 () ListLongMap!13043)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5630 (ListLongMap!13043 (_ BitVec 64)) Bool)

(assert (=> b!973319 (= res!651510 (contains!5630 lt!432430 (select (arr!29136 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34651)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34651)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3770 (array!60545 array!60543 (_ BitVec 32) (_ BitVec 32) V!34651 V!34651 (_ BitVec 32) Int) ListLongMap!13043)

(assert (=> b!973319 (= lt!432430 (getCurrentListMap!3770 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973320 () Bool)

(declare-fun res!651514 () Bool)

(assert (=> b!973320 (=> (not res!651514) (not e!548620))))

(assert (=> b!973320 (= res!651514 (and (= (size!29614 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29615 _keys!1717) (size!29614 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973321 () Bool)

(declare-fun res!651511 () Bool)

(assert (=> b!973321 (=> (not res!651511) (not e!548620))))

(assert (=> b!973321 (= res!651511 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29615 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29615 _keys!1717))))))

(declare-fun b!973322 () Bool)

(assert (=> b!973322 (= e!548618 (and e!548622 mapRes!35386))))

(declare-fun condMapEmpty!35386 () Bool)

(declare-fun mapDefault!35386 () ValueCell!10644)

(assert (=> b!973322 (= condMapEmpty!35386 (= (arr!29135 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10644)) mapDefault!35386)))))

(declare-fun b!973323 () Bool)

(declare-fun res!651516 () Bool)

(assert (=> b!973323 (=> (not res!651516) (not e!548620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60545 (_ BitVec 32)) Bool)

(assert (=> b!973323 (= res!651516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35386 () Bool)

(declare-fun tp!67337 () Bool)

(assert (=> mapNonEmpty!35386 (= mapRes!35386 (and tp!67337 e!548619))))

(declare-fun mapRest!35386 () (Array (_ BitVec 32) ValueCell!10644))

(declare-fun mapKey!35386 () (_ BitVec 32))

(declare-fun mapValue!35386 () ValueCell!10644)

(assert (=> mapNonEmpty!35386 (= (arr!29135 _values!1425) (store mapRest!35386 mapKey!35386 mapValue!35386))))

(declare-fun b!973324 () Bool)

(declare-fun res!651512 () Bool)

(assert (=> b!973324 (=> (not res!651512) (not e!548620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973324 (= res!651512 (validKeyInArray!0 (select (arr!29136 _keys!1717) i!822)))))

(declare-fun b!973325 () Bool)

(declare-fun e!548621 () Bool)

(assert (=> b!973325 (= e!548617 e!548621)))

(declare-fun res!651515 () Bool)

(assert (=> b!973325 (=> (not res!651515) (not e!548621))))

(declare-fun lt!432431 () (_ BitVec 64))

(assert (=> b!973325 (= res!651515 (validKeyInArray!0 lt!432431))))

(assert (=> b!973325 (= lt!432431 (select (arr!29136 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432426 () ListLongMap!13043)

(assert (=> b!973325 (= lt!432426 (getCurrentListMap!3770 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973326 () Bool)

(assert (=> b!973326 (= e!548621 (not true))))

(declare-fun lt!432425 () tuple2!14346)

(declare-fun +!2905 (ListLongMap!13043 tuple2!14346) ListLongMap!13043)

(assert (=> b!973326 (contains!5630 (+!2905 lt!432430 lt!432425) (select (arr!29136 _keys!1717) i!822))))

(declare-fun lt!432428 () V!34651)

(declare-datatypes ((Unit!32431 0))(
  ( (Unit!32432) )
))
(declare-fun lt!432427 () Unit!32431)

(declare-fun addStillContains!601 (ListLongMap!13043 (_ BitVec 64) V!34651 (_ BitVec 64)) Unit!32431)

(assert (=> b!973326 (= lt!432427 (addStillContains!601 lt!432430 lt!432431 lt!432428 (select (arr!29136 _keys!1717) i!822)))))

(assert (=> b!973326 (= lt!432426 (+!2905 (getCurrentListMap!3770 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432425))))

(assert (=> b!973326 (= lt!432425 (tuple2!14347 lt!432431 lt!432428))))

(declare-fun get!15102 (ValueCell!10644 V!34651) V!34651)

(declare-fun dynLambda!1694 (Int (_ BitVec 64)) V!34651)

(assert (=> b!973326 (= lt!432428 (get!15102 (select (arr!29135 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1694 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432429 () Unit!32431)

(declare-fun lemmaListMapRecursiveValidKeyArray!271 (array!60545 array!60543 (_ BitVec 32) (_ BitVec 32) V!34651 V!34651 (_ BitVec 32) Int) Unit!32431)

(assert (=> b!973326 (= lt!432429 (lemmaListMapRecursiveValidKeyArray!271 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83360 res!651513) b!973320))

(assert (= (and b!973320 res!651514) b!973323))

(assert (= (and b!973323 res!651516) b!973316))

(assert (= (and b!973316 res!651509) b!973321))

(assert (= (and b!973321 res!651511) b!973324))

(assert (= (and b!973324 res!651512) b!973319))

(assert (= (and b!973319 res!651510) b!973325))

(assert (= (and b!973325 res!651515) b!973326))

(assert (= (and b!973322 condMapEmpty!35386) mapIsEmpty!35386))

(assert (= (and b!973322 (not condMapEmpty!35386)) mapNonEmpty!35386))

(get-info :version)

(assert (= (and mapNonEmpty!35386 ((_ is ValueCellFull!10644) mapValue!35386)) b!973317))

(assert (= (and b!973322 ((_ is ValueCellFull!10644) mapDefault!35386)) b!973318))

(assert (= start!83360 b!973322))

(declare-fun b_lambda!14517 () Bool)

(assert (=> (not b_lambda!14517) (not b!973326)))

(declare-fun t!28657 () Bool)

(declare-fun tb!6301 () Bool)

(assert (=> (and start!83360 (= defaultEntry!1428 defaultEntry!1428) t!28657) tb!6301))

(declare-fun result!12579 () Bool)

(assert (=> tb!6301 (= result!12579 tp_is_empty!22251)))

(assert (=> b!973326 t!28657))

(declare-fun b_and!30929 () Bool)

(assert (= b_and!30927 (and (=> t!28657 result!12579) b_and!30929)))

(declare-fun m!900879 () Bool)

(assert (=> b!973316 m!900879))

(declare-fun m!900881 () Bool)

(assert (=> b!973324 m!900881))

(assert (=> b!973324 m!900881))

(declare-fun m!900883 () Bool)

(assert (=> b!973324 m!900883))

(declare-fun m!900885 () Bool)

(assert (=> b!973323 m!900885))

(declare-fun m!900887 () Bool)

(assert (=> b!973325 m!900887))

(declare-fun m!900889 () Bool)

(assert (=> b!973325 m!900889))

(declare-fun m!900891 () Bool)

(assert (=> b!973325 m!900891))

(declare-fun m!900893 () Bool)

(assert (=> mapNonEmpty!35386 m!900893))

(declare-fun m!900895 () Bool)

(assert (=> start!83360 m!900895))

(declare-fun m!900897 () Bool)

(assert (=> start!83360 m!900897))

(declare-fun m!900899 () Bool)

(assert (=> start!83360 m!900899))

(declare-fun m!900901 () Bool)

(assert (=> b!973326 m!900901))

(declare-fun m!900903 () Bool)

(assert (=> b!973326 m!900903))

(declare-fun m!900905 () Bool)

(assert (=> b!973326 m!900905))

(assert (=> b!973326 m!900881))

(declare-fun m!900907 () Bool)

(assert (=> b!973326 m!900907))

(assert (=> b!973326 m!900881))

(declare-fun m!900909 () Bool)

(assert (=> b!973326 m!900909))

(assert (=> b!973326 m!900901))

(assert (=> b!973326 m!900905))

(declare-fun m!900911 () Bool)

(assert (=> b!973326 m!900911))

(assert (=> b!973326 m!900903))

(declare-fun m!900913 () Bool)

(assert (=> b!973326 m!900913))

(declare-fun m!900915 () Bool)

(assert (=> b!973326 m!900915))

(assert (=> b!973326 m!900909))

(assert (=> b!973326 m!900881))

(declare-fun m!900917 () Bool)

(assert (=> b!973326 m!900917))

(assert (=> b!973319 m!900881))

(assert (=> b!973319 m!900881))

(declare-fun m!900919 () Bool)

(assert (=> b!973319 m!900919))

(declare-fun m!900921 () Bool)

(assert (=> b!973319 m!900921))

(check-sat (not b!973325) (not b!973316) (not b!973324) (not b_lambda!14517) (not mapNonEmpty!35386) (not b!973323) (not b!973319) (not b!973326) b_and!30929 (not b_next!19353) tp_is_empty!22251 (not start!83360))
(check-sat b_and!30929 (not b_next!19353))
