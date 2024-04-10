; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83332 () Bool)

(assert start!83332)

(declare-fun b_free!19325 () Bool)

(declare-fun b_next!19325 () Bool)

(assert (=> start!83332 (= b_free!19325 (not b_next!19325))))

(declare-fun tp!67253 () Bool)

(declare-fun b_and!30871 () Bool)

(assert (=> start!83332 (= tp!67253 b_and!30871)))

(declare-fun b!972826 () Bool)

(declare-fun res!651175 () Bool)

(declare-fun e!548329 () Bool)

(assert (=> b!972826 (=> (not res!651175) (not e!548329))))

(declare-datatypes ((array!60489 0))(
  ( (array!60490 (arr!29108 (Array (_ BitVec 32) (_ BitVec 64))) (size!29587 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60489)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972826 (= res!651175 (validKeyInArray!0 (select (arr!29108 _keys!1717) i!822)))))

(declare-fun b!972827 () Bool)

(declare-fun res!651177 () Bool)

(assert (=> b!972827 (=> (not res!651177) (not e!548329))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60489 (_ BitVec 32)) Bool)

(assert (=> b!972827 (= res!651177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972828 () Bool)

(declare-fun res!651173 () Bool)

(assert (=> b!972828 (=> (not res!651173) (not e!548329))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972828 (= res!651173 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29587 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29587 _keys!1717))))))

(declare-fun b!972829 () Bool)

(declare-fun res!651174 () Bool)

(assert (=> b!972829 (=> (not res!651174) (not e!548329))))

(declare-datatypes ((V!34613 0))(
  ( (V!34614 (val!11162 Int)) )
))
(declare-datatypes ((ValueCell!10630 0))(
  ( (ValueCellFull!10630 (v!13721 V!34613)) (EmptyCell!10630) )
))
(declare-datatypes ((array!60491 0))(
  ( (array!60492 (arr!29109 (Array (_ BitVec 32) ValueCell!10630)) (size!29588 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60491)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972829 (= res!651174 (and (= (size!29588 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29587 _keys!1717) (size!29588 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972830 () Bool)

(declare-fun e!548325 () Bool)

(assert (=> b!972830 (= e!548329 e!548325)))

(declare-fun res!651178 () Bool)

(assert (=> b!972830 (=> (not res!651178) (not e!548325))))

(declare-fun lt!432136 () (_ BitVec 64))

(assert (=> b!972830 (= res!651178 (validKeyInArray!0 lt!432136))))

(assert (=> b!972830 (= lt!432136 (select (arr!29108 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun zeroValue!1367 () V!34613)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34613)

(declare-datatypes ((tuple2!14320 0))(
  ( (tuple2!14321 (_1!7171 (_ BitVec 64)) (_2!7171 V!34613)) )
))
(declare-datatypes ((List!20183 0))(
  ( (Nil!20180) (Cons!20179 (h!21341 tuple2!14320) (t!28606 List!20183)) )
))
(declare-datatypes ((ListLongMap!13017 0))(
  ( (ListLongMap!13018 (toList!6524 List!20183)) )
))
(declare-fun lt!432135 () ListLongMap!13017)

(declare-fun getCurrentListMap!3757 (array!60489 array!60491 (_ BitVec 32) (_ BitVec 32) V!34613 V!34613 (_ BitVec 32) Int) ListLongMap!13017)

(assert (=> b!972830 (= lt!432135 (getCurrentListMap!3757 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972831 () Bool)

(assert (=> b!972831 (= e!548325 (not true))))

(declare-fun +!2896 (ListLongMap!13017 tuple2!14320) ListLongMap!13017)

(declare-fun get!15083 (ValueCell!10630 V!34613) V!34613)

(declare-fun dynLambda!1685 (Int (_ BitVec 64)) V!34613)

(assert (=> b!972831 (= lt!432135 (+!2896 (getCurrentListMap!3757 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14321 lt!432136 (get!15083 (select (arr!29109 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1685 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32413 0))(
  ( (Unit!32414) )
))
(declare-fun lt!432137 () Unit!32413)

(declare-fun lemmaListMapRecursiveValidKeyArray!262 (array!60489 array!60491 (_ BitVec 32) (_ BitVec 32) V!34613 V!34613 (_ BitVec 32) Int) Unit!32413)

(assert (=> b!972831 (= lt!432137 (lemmaListMapRecursiveValidKeyArray!262 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972832 () Bool)

(declare-fun res!651176 () Bool)

(assert (=> b!972832 (=> (not res!651176) (not e!548329))))

(declare-fun contains!5617 (ListLongMap!13017 (_ BitVec 64)) Bool)

(assert (=> b!972832 (= res!651176 (contains!5617 (getCurrentListMap!3757 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29108 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35344 () Bool)

(declare-fun mapRes!35344 () Bool)

(assert (=> mapIsEmpty!35344 mapRes!35344))

(declare-fun b!972833 () Bool)

(declare-fun e!548324 () Bool)

(declare-fun tp_is_empty!22223 () Bool)

(assert (=> b!972833 (= e!548324 tp_is_empty!22223)))

(declare-fun b!972834 () Bool)

(declare-fun res!651180 () Bool)

(assert (=> b!972834 (=> (not res!651180) (not e!548329))))

(declare-datatypes ((List!20184 0))(
  ( (Nil!20181) (Cons!20180 (h!21342 (_ BitVec 64)) (t!28607 List!20184)) )
))
(declare-fun arrayNoDuplicates!0 (array!60489 (_ BitVec 32) List!20184) Bool)

(assert (=> b!972834 (= res!651180 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20181))))

(declare-fun mapNonEmpty!35344 () Bool)

(declare-fun tp!67254 () Bool)

(assert (=> mapNonEmpty!35344 (= mapRes!35344 (and tp!67254 e!548324))))

(declare-fun mapRest!35344 () (Array (_ BitVec 32) ValueCell!10630))

(declare-fun mapValue!35344 () ValueCell!10630)

(declare-fun mapKey!35344 () (_ BitVec 32))

(assert (=> mapNonEmpty!35344 (= (arr!29109 _values!1425) (store mapRest!35344 mapKey!35344 mapValue!35344))))

(declare-fun res!651179 () Bool)

(assert (=> start!83332 (=> (not res!651179) (not e!548329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83332 (= res!651179 (validMask!0 mask!2147))))

(assert (=> start!83332 e!548329))

(assert (=> start!83332 true))

(declare-fun e!548326 () Bool)

(declare-fun array_inv!22517 (array!60491) Bool)

(assert (=> start!83332 (and (array_inv!22517 _values!1425) e!548326)))

(assert (=> start!83332 tp_is_empty!22223))

(assert (=> start!83332 tp!67253))

(declare-fun array_inv!22518 (array!60489) Bool)

(assert (=> start!83332 (array_inv!22518 _keys!1717)))

(declare-fun b!972835 () Bool)

(declare-fun e!548327 () Bool)

(assert (=> b!972835 (= e!548327 tp_is_empty!22223)))

(declare-fun b!972836 () Bool)

(assert (=> b!972836 (= e!548326 (and e!548327 mapRes!35344))))

(declare-fun condMapEmpty!35344 () Bool)

(declare-fun mapDefault!35344 () ValueCell!10630)

