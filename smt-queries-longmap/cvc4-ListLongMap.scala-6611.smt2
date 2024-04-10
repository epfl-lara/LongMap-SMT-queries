; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83554 () Bool)

(assert start!83554)

(declare-fun b_free!19541 () Bool)

(declare-fun b_next!19541 () Bool)

(assert (=> start!83554 (= b_free!19541 (not b_next!19541))))

(declare-fun tp!67911 () Bool)

(declare-fun b_and!31177 () Bool)

(assert (=> start!83554 (= tp!67911 b_and!31177)))

(declare-fun mapNonEmpty!35677 () Bool)

(declare-fun mapRes!35677 () Bool)

(declare-fun tp!67910 () Bool)

(declare-fun e!550244 () Bool)

(assert (=> mapNonEmpty!35677 (= mapRes!35677 (and tp!67910 e!550244))))

(declare-datatypes ((V!34909 0))(
  ( (V!34910 (val!11273 Int)) )
))
(declare-datatypes ((ValueCell!10741 0))(
  ( (ValueCellFull!10741 (v!13832 V!34909)) (EmptyCell!10741) )
))
(declare-datatypes ((array!60917 0))(
  ( (array!60918 (arr!29322 (Array (_ BitVec 32) ValueCell!10741)) (size!29801 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60917)

(declare-fun mapValue!35677 () ValueCell!10741)

(declare-fun mapRest!35677 () (Array (_ BitVec 32) ValueCell!10741))

(declare-fun mapKey!35677 () (_ BitVec 32))

(assert (=> mapNonEmpty!35677 (= (arr!29322 _values!1425) (store mapRest!35677 mapKey!35677 mapValue!35677))))

(declare-fun b!976363 () Bool)

(declare-fun tp_is_empty!22445 () Bool)

(assert (=> b!976363 (= e!550244 tp_is_empty!22445)))

(declare-fun b!976364 () Bool)

(declare-fun res!653625 () Bool)

(declare-fun e!550243 () Bool)

(assert (=> b!976364 (=> (not res!653625) (not e!550243))))

(declare-datatypes ((array!60919 0))(
  ( (array!60920 (arr!29323 (Array (_ BitVec 32) (_ BitVec 64))) (size!29802 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60919)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!976364 (= res!653625 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29802 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29802 _keys!1717))))))

(declare-fun b!976365 () Bool)

(declare-fun res!653627 () Bool)

(assert (=> b!976365 (=> (not res!653627) (not e!550243))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!976365 (= res!653627 (and (= (size!29801 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29802 _keys!1717) (size!29801 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976366 () Bool)

(declare-fun res!653626 () Bool)

(assert (=> b!976366 (=> (not res!653626) (not e!550243))))

(declare-datatypes ((List!20356 0))(
  ( (Nil!20353) (Cons!20352 (h!21514 (_ BitVec 64)) (t!28869 List!20356)) )
))
(declare-fun arrayNoDuplicates!0 (array!60919 (_ BitVec 32) List!20356) Bool)

(assert (=> b!976366 (= res!653626 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20353))))

(declare-fun b!976367 () Bool)

(declare-fun e!550246 () Bool)

(declare-fun e!550240 () Bool)

(assert (=> b!976367 (= e!550246 e!550240)))

(declare-fun res!653623 () Bool)

(assert (=> b!976367 (=> (not res!653623) (not e!550240))))

(declare-fun lt!433127 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976367 (= res!653623 (validKeyInArray!0 lt!433127))))

(assert (=> b!976367 (= lt!433127 (select (arr!29323 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun zeroValue!1367 () V!34909)

(declare-datatypes ((tuple2!14506 0))(
  ( (tuple2!14507 (_1!7264 (_ BitVec 64)) (_2!7264 V!34909)) )
))
(declare-datatypes ((List!20357 0))(
  ( (Nil!20354) (Cons!20353 (h!21515 tuple2!14506) (t!28870 List!20357)) )
))
(declare-datatypes ((ListLongMap!13203 0))(
  ( (ListLongMap!13204 (toList!6617 List!20357)) )
))
(declare-fun lt!433124 () ListLongMap!13203)

(declare-fun minValue!1367 () V!34909)

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3850 (array!60919 array!60917 (_ BitVec 32) (_ BitVec 32) V!34909 V!34909 (_ BitVec 32) Int) ListLongMap!13203)

(assert (=> b!976367 (= lt!433124 (getCurrentListMap!3850 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!653628 () Bool)

(assert (=> start!83554 (=> (not res!653628) (not e!550243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83554 (= res!653628 (validMask!0 mask!2147))))

(assert (=> start!83554 e!550243))

(assert (=> start!83554 true))

(declare-fun e!550241 () Bool)

(declare-fun array_inv!22671 (array!60917) Bool)

(assert (=> start!83554 (and (array_inv!22671 _values!1425) e!550241)))

(assert (=> start!83554 tp_is_empty!22445))

(assert (=> start!83554 tp!67911))

(declare-fun array_inv!22672 (array!60919) Bool)

(assert (=> start!83554 (array_inv!22672 _keys!1717)))

(declare-fun mapIsEmpty!35677 () Bool)

(assert (=> mapIsEmpty!35677 mapRes!35677))

(declare-fun b!976368 () Bool)

(declare-fun res!653622 () Bool)

(assert (=> b!976368 (=> (not res!653622) (not e!550243))))

(assert (=> b!976368 (= res!653622 (validKeyInArray!0 (select (arr!29323 _keys!1717) i!822)))))

(declare-fun b!976369 () Bool)

(declare-fun contains!5695 (ListLongMap!13203 (_ BitVec 64)) Bool)

(assert (=> b!976369 (= e!550240 (not (contains!5695 lt!433124 (select (arr!29323 _keys!1717) i!822))))))

(declare-fun lt!433123 () tuple2!14506)

(declare-fun lt!433126 () ListLongMap!13203)

(declare-fun +!2926 (ListLongMap!13203 tuple2!14506) ListLongMap!13203)

(assert (=> b!976369 (contains!5695 (+!2926 lt!433126 lt!433123) (select (arr!29323 _keys!1717) i!822))))

(declare-datatypes ((Unit!32473 0))(
  ( (Unit!32474) )
))
(declare-fun lt!433125 () Unit!32473)

(declare-fun lt!433122 () V!34909)

(declare-fun addStillContains!612 (ListLongMap!13203 (_ BitVec 64) V!34909 (_ BitVec 64)) Unit!32473)

(assert (=> b!976369 (= lt!433125 (addStillContains!612 lt!433126 lt!433127 lt!433122 (select (arr!29323 _keys!1717) i!822)))))

(assert (=> b!976369 (= lt!433124 (+!2926 (getCurrentListMap!3850 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!433123))))

(assert (=> b!976369 (= lt!433123 (tuple2!14507 lt!433127 lt!433122))))

(declare-fun get!15187 (ValueCell!10741 V!34909) V!34909)

(declare-fun dynLambda!1715 (Int (_ BitVec 64)) V!34909)

(assert (=> b!976369 (= lt!433122 (get!15187 (select (arr!29322 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1715 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433121 () Unit!32473)

(declare-fun lemmaListMapRecursiveValidKeyArray!292 (array!60919 array!60917 (_ BitVec 32) (_ BitVec 32) V!34909 V!34909 (_ BitVec 32) Int) Unit!32473)

(assert (=> b!976369 (= lt!433121 (lemmaListMapRecursiveValidKeyArray!292 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976370 () Bool)

(declare-fun e!550242 () Bool)

(assert (=> b!976370 (= e!550242 tp_is_empty!22445)))

(declare-fun b!976371 () Bool)

(assert (=> b!976371 (= e!550243 e!550246)))

(declare-fun res!653621 () Bool)

(assert (=> b!976371 (=> (not res!653621) (not e!550246))))

(assert (=> b!976371 (= res!653621 (contains!5695 lt!433126 (select (arr!29323 _keys!1717) i!822)))))

(assert (=> b!976371 (= lt!433126 (getCurrentListMap!3850 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!976372 () Bool)

(declare-fun res!653624 () Bool)

(assert (=> b!976372 (=> (not res!653624) (not e!550243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60919 (_ BitVec 32)) Bool)

(assert (=> b!976372 (= res!653624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976373 () Bool)

(assert (=> b!976373 (= e!550241 (and e!550242 mapRes!35677))))

(declare-fun condMapEmpty!35677 () Bool)

(declare-fun mapDefault!35677 () ValueCell!10741)

