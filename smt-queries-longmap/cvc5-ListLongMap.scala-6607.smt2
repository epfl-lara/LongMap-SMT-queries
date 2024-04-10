; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83526 () Bool)

(assert start!83526)

(declare-fun b_free!19513 () Bool)

(declare-fun b_next!19513 () Bool)

(assert (=> start!83526 (= b_free!19513 (not b_next!19513))))

(declare-fun tp!67826 () Bool)

(declare-fun b_and!31121 () Bool)

(assert (=> start!83526 (= tp!67826 b_and!31121)))

(declare-fun b!975873 () Bool)

(declare-fun res!653285 () Bool)

(declare-fun e!549976 () Bool)

(assert (=> b!975873 (=> (not res!653285) (not e!549976))))

(declare-datatypes ((array!60863 0))(
  ( (array!60864 (arr!29295 (Array (_ BitVec 32) (_ BitVec 64))) (size!29774 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60863)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975873 (= res!653285 (validKeyInArray!0 (select (arr!29295 _keys!1717) i!822)))))

(declare-fun b!975874 () Bool)

(declare-fun e!549971 () Bool)

(declare-fun tp_is_empty!22417 () Bool)

(assert (=> b!975874 (= e!549971 tp_is_empty!22417)))

(declare-fun b!975875 () Bool)

(declare-fun res!653286 () Bool)

(assert (=> b!975875 (=> (not res!653286) (not e!549976))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34873 0))(
  ( (V!34874 (val!11259 Int)) )
))
(declare-datatypes ((ValueCell!10727 0))(
  ( (ValueCellFull!10727 (v!13818 V!34873)) (EmptyCell!10727) )
))
(declare-datatypes ((array!60865 0))(
  ( (array!60866 (arr!29296 (Array (_ BitVec 32) ValueCell!10727)) (size!29775 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60865)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!975875 (= res!653286 (and (= (size!29775 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29774 _keys!1717) (size!29775 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975876 () Bool)

(declare-fun e!549974 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!975876 (= e!549974 (not (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29775 _values!1425))))))

(declare-fun zeroValue!1367 () V!34873)

(declare-fun lt!432927 () (_ BitVec 64))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34873)

(declare-datatypes ((tuple2!14480 0))(
  ( (tuple2!14481 (_1!7251 (_ BitVec 64)) (_2!7251 V!34873)) )
))
(declare-datatypes ((List!20333 0))(
  ( (Nil!20330) (Cons!20329 (h!21491 tuple2!14480) (t!28818 List!20333)) )
))
(declare-datatypes ((ListLongMap!13177 0))(
  ( (ListLongMap!13178 (toList!6604 List!20333)) )
))
(declare-fun lt!432929 () ListLongMap!13177)

(declare-fun +!2915 (ListLongMap!13177 tuple2!14480) ListLongMap!13177)

(declare-fun getCurrentListMap!3837 (array!60863 array!60865 (_ BitVec 32) (_ BitVec 32) V!34873 V!34873 (_ BitVec 32) Int) ListLongMap!13177)

(declare-fun get!15168 (ValueCell!10727 V!34873) V!34873)

(declare-fun dynLambda!1704 (Int (_ BitVec 64)) V!34873)

(assert (=> b!975876 (= lt!432929 (+!2915 (getCurrentListMap!3837 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14481 lt!432927 (get!15168 (select (arr!29296 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1704 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32451 0))(
  ( (Unit!32452) )
))
(declare-fun lt!432928 () Unit!32451)

(declare-fun lemmaListMapRecursiveValidKeyArray!281 (array!60863 array!60865 (_ BitVec 32) (_ BitVec 32) V!34873 V!34873 (_ BitVec 32) Int) Unit!32451)

(assert (=> b!975876 (= lt!432928 (lemmaListMapRecursiveValidKeyArray!281 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!653291 () Bool)

(assert (=> start!83526 (=> (not res!653291) (not e!549976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83526 (= res!653291 (validMask!0 mask!2147))))

(assert (=> start!83526 e!549976))

(assert (=> start!83526 true))

(declare-fun e!549972 () Bool)

(declare-fun array_inv!22653 (array!60865) Bool)

(assert (=> start!83526 (and (array_inv!22653 _values!1425) e!549972)))

(assert (=> start!83526 tp_is_empty!22417))

(assert (=> start!83526 tp!67826))

(declare-fun array_inv!22654 (array!60863) Bool)

(assert (=> start!83526 (array_inv!22654 _keys!1717)))

(declare-fun b!975877 () Bool)

(declare-fun res!653289 () Bool)

(assert (=> b!975877 (=> (not res!653289) (not e!549976))))

(declare-fun contains!5685 (ListLongMap!13177 (_ BitVec 64)) Bool)

(assert (=> b!975877 (= res!653289 (contains!5685 (getCurrentListMap!3837 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29295 _keys!1717) i!822)))))

(declare-fun b!975878 () Bool)

(declare-fun res!653287 () Bool)

(assert (=> b!975878 (=> (not res!653287) (not e!549976))))

(declare-datatypes ((List!20334 0))(
  ( (Nil!20331) (Cons!20330 (h!21492 (_ BitVec 64)) (t!28819 List!20334)) )
))
(declare-fun arrayNoDuplicates!0 (array!60863 (_ BitVec 32) List!20334) Bool)

(assert (=> b!975878 (= res!653287 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20331))))

(declare-fun b!975879 () Bool)

(assert (=> b!975879 (= e!549976 e!549974)))

(declare-fun res!653288 () Bool)

(assert (=> b!975879 (=> (not res!653288) (not e!549974))))

(assert (=> b!975879 (= res!653288 (validKeyInArray!0 lt!432927))))

(assert (=> b!975879 (= lt!432927 (select (arr!29295 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!975879 (= lt!432929 (getCurrentListMap!3837 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975880 () Bool)

(declare-fun res!653292 () Bool)

(assert (=> b!975880 (=> (not res!653292) (not e!549976))))

(assert (=> b!975880 (= res!653292 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29774 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29774 _keys!1717))))))

(declare-fun mapIsEmpty!35635 () Bool)

(declare-fun mapRes!35635 () Bool)

(assert (=> mapIsEmpty!35635 mapRes!35635))

(declare-fun b!975881 () Bool)

(declare-fun res!653290 () Bool)

(assert (=> b!975881 (=> (not res!653290) (not e!549976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60863 (_ BitVec 32)) Bool)

(assert (=> b!975881 (= res!653290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975882 () Bool)

(declare-fun e!549975 () Bool)

(assert (=> b!975882 (= e!549972 (and e!549975 mapRes!35635))))

(declare-fun condMapEmpty!35635 () Bool)

(declare-fun mapDefault!35635 () ValueCell!10727)

