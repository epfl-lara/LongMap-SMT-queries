; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83374 () Bool)

(assert start!83374)

(declare-fun b_free!19367 () Bool)

(declare-fun b_next!19367 () Bool)

(assert (=> start!83374 (= b_free!19367 (not b_next!19367))))

(declare-fun tp!67380 () Bool)

(declare-fun b_and!30955 () Bool)

(assert (=> start!83374 (= tp!67380 b_and!30955)))

(declare-fun mapIsEmpty!35407 () Bool)

(declare-fun mapRes!35407 () Bool)

(assert (=> mapIsEmpty!35407 mapRes!35407))

(declare-fun b!973562 () Bool)

(declare-fun res!651682 () Bool)

(declare-fun e!548765 () Bool)

(assert (=> b!973562 (=> (not res!651682) (not e!548765))))

(declare-datatypes ((array!60571 0))(
  ( (array!60572 (arr!29149 (Array (_ BitVec 32) (_ BitVec 64))) (size!29628 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60571)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60571 (_ BitVec 32)) Bool)

(assert (=> b!973562 (= res!651682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35407 () Bool)

(declare-fun tp!67379 () Bool)

(declare-fun e!548766 () Bool)

(assert (=> mapNonEmpty!35407 (= mapRes!35407 (and tp!67379 e!548766))))

(declare-datatypes ((V!34669 0))(
  ( (V!34670 (val!11183 Int)) )
))
(declare-datatypes ((ValueCell!10651 0))(
  ( (ValueCellFull!10651 (v!13742 V!34669)) (EmptyCell!10651) )
))
(declare-fun mapValue!35407 () ValueCell!10651)

(declare-fun mapRest!35407 () (Array (_ BitVec 32) ValueCell!10651))

(declare-datatypes ((array!60573 0))(
  ( (array!60574 (arr!29150 (Array (_ BitVec 32) ValueCell!10651)) (size!29629 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60573)

(declare-fun mapKey!35407 () (_ BitVec 32))

(assert (=> mapNonEmpty!35407 (= (arr!29150 _values!1425) (store mapRest!35407 mapKey!35407 mapValue!35407))))

(declare-fun b!973563 () Bool)

(declare-fun e!548769 () Bool)

(declare-fun tp_is_empty!22265 () Bool)

(assert (=> b!973563 (= e!548769 tp_is_empty!22265)))

(declare-fun b!973561 () Bool)

(declare-fun e!548768 () Bool)

(declare-fun e!548764 () Bool)

(assert (=> b!973561 (= e!548768 e!548764)))

(declare-fun res!651681 () Bool)

(assert (=> b!973561 (=> (not res!651681) (not e!548764))))

(declare-fun lt!432573 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973561 (= res!651681 (validKeyInArray!0 lt!432573))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973561 (= lt!432573 (select (arr!29149 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun zeroValue!1367 () V!34669)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14360 0))(
  ( (tuple2!14361 (_1!7191 (_ BitVec 64)) (_2!7191 V!34669)) )
))
(declare-datatypes ((List!20219 0))(
  ( (Nil!20216) (Cons!20215 (h!21377 tuple2!14360) (t!28684 List!20219)) )
))
(declare-datatypes ((ListLongMap!13057 0))(
  ( (ListLongMap!13058 (toList!6544 List!20219)) )
))
(declare-fun lt!432576 () ListLongMap!13057)

(declare-fun minValue!1367 () V!34669)

(declare-fun getCurrentListMap!3777 (array!60571 array!60573 (_ BitVec 32) (_ BitVec 32) V!34669 V!34669 (_ BitVec 32) Int) ListLongMap!13057)

(assert (=> b!973561 (= lt!432576 (getCurrentListMap!3777 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!651683 () Bool)

(assert (=> start!83374 (=> (not res!651683) (not e!548765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83374 (= res!651683 (validMask!0 mask!2147))))

(assert (=> start!83374 e!548765))

(assert (=> start!83374 true))

(declare-fun e!548767 () Bool)

(declare-fun array_inv!22549 (array!60573) Bool)

(assert (=> start!83374 (and (array_inv!22549 _values!1425) e!548767)))

(assert (=> start!83374 tp_is_empty!22265))

(assert (=> start!83374 tp!67380))

(declare-fun array_inv!22550 (array!60571) Bool)

(assert (=> start!83374 (array_inv!22550 _keys!1717)))

(declare-fun b!973564 () Bool)

(assert (=> b!973564 (= e!548764 (not true))))

(declare-fun lt!432575 () ListLongMap!13057)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun lt!432574 () tuple2!14360)

(declare-fun contains!5636 (ListLongMap!13057 (_ BitVec 64)) Bool)

(declare-fun +!2910 (ListLongMap!13057 tuple2!14360) ListLongMap!13057)

(assert (=> b!973564 (contains!5636 (+!2910 lt!432575 lt!432574) (select (arr!29149 _keys!1717) i!822))))

(declare-fun lt!432572 () V!34669)

(declare-datatypes ((Unit!32441 0))(
  ( (Unit!32442) )
))
(declare-fun lt!432578 () Unit!32441)

(declare-fun addStillContains!606 (ListLongMap!13057 (_ BitVec 64) V!34669 (_ BitVec 64)) Unit!32441)

(assert (=> b!973564 (= lt!432578 (addStillContains!606 lt!432575 lt!432573 lt!432572 (select (arr!29149 _keys!1717) i!822)))))

(assert (=> b!973564 (= lt!432576 (+!2910 (getCurrentListMap!3777 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432574))))

(assert (=> b!973564 (= lt!432574 (tuple2!14361 lt!432573 lt!432572))))

(declare-fun get!15111 (ValueCell!10651 V!34669) V!34669)

(declare-fun dynLambda!1699 (Int (_ BitVec 64)) V!34669)

(assert (=> b!973564 (= lt!432572 (get!15111 (select (arr!29150 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1699 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432577 () Unit!32441)

(declare-fun lemmaListMapRecursiveValidKeyArray!276 (array!60571 array!60573 (_ BitVec 32) (_ BitVec 32) V!34669 V!34669 (_ BitVec 32) Int) Unit!32441)

(assert (=> b!973564 (= lt!432577 (lemmaListMapRecursiveValidKeyArray!276 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973565 () Bool)

(declare-fun res!651684 () Bool)

(assert (=> b!973565 (=> (not res!651684) (not e!548765))))

(assert (=> b!973565 (= res!651684 (validKeyInArray!0 (select (arr!29149 _keys!1717) i!822)))))

(declare-fun b!973566 () Bool)

(assert (=> b!973566 (= e!548765 e!548768)))

(declare-fun res!651677 () Bool)

(assert (=> b!973566 (=> (not res!651677) (not e!548768))))

(assert (=> b!973566 (= res!651677 (contains!5636 lt!432575 (select (arr!29149 _keys!1717) i!822)))))

(assert (=> b!973566 (= lt!432575 (getCurrentListMap!3777 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973567 () Bool)

(declare-fun res!651678 () Bool)

(assert (=> b!973567 (=> (not res!651678) (not e!548765))))

(assert (=> b!973567 (= res!651678 (and (= (size!29629 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29628 _keys!1717) (size!29629 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973568 () Bool)

(assert (=> b!973568 (= e!548766 tp_is_empty!22265)))

(declare-fun b!973569 () Bool)

(declare-fun res!651680 () Bool)

(assert (=> b!973569 (=> (not res!651680) (not e!548765))))

(assert (=> b!973569 (= res!651680 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29628 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29628 _keys!1717))))))

(declare-fun b!973570 () Bool)

(declare-fun res!651679 () Bool)

(assert (=> b!973570 (=> (not res!651679) (not e!548765))))

(declare-datatypes ((List!20220 0))(
  ( (Nil!20217) (Cons!20216 (h!21378 (_ BitVec 64)) (t!28685 List!20220)) )
))
(declare-fun arrayNoDuplicates!0 (array!60571 (_ BitVec 32) List!20220) Bool)

(assert (=> b!973570 (= res!651679 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20217))))

(declare-fun b!973571 () Bool)

(assert (=> b!973571 (= e!548767 (and e!548769 mapRes!35407))))

(declare-fun condMapEmpty!35407 () Bool)

(declare-fun mapDefault!35407 () ValueCell!10651)

