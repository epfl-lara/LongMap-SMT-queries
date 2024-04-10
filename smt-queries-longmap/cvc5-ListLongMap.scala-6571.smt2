; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83310 () Bool)

(assert start!83310)

(declare-fun b_free!19303 () Bool)

(declare-fun b_next!19303 () Bool)

(assert (=> start!83310 (= b_free!19303 (not b_next!19303))))

(declare-fun tp!67187 () Bool)

(declare-fun b_and!30827 () Bool)

(assert (=> start!83310 (= tp!67187 b_and!30827)))

(declare-fun b!972441 () Bool)

(declare-fun res!650915 () Bool)

(declare-fun e!548130 () Bool)

(assert (=> b!972441 (=> (not res!650915) (not e!548130))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34585 0))(
  ( (V!34586 (val!11151 Int)) )
))
(declare-datatypes ((ValueCell!10619 0))(
  ( (ValueCellFull!10619 (v!13710 V!34585)) (EmptyCell!10619) )
))
(declare-datatypes ((array!60449 0))(
  ( (array!60450 (arr!29088 (Array (_ BitVec 32) ValueCell!10619)) (size!29567 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60449)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60451 0))(
  ( (array!60452 (arr!29089 (Array (_ BitVec 32) (_ BitVec 64))) (size!29568 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60451)

(assert (=> b!972441 (= res!650915 (and (= (size!29567 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29568 _keys!1717) (size!29567 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972442 () Bool)

(declare-fun e!548126 () Bool)

(declare-fun tp_is_empty!22201 () Bool)

(assert (=> b!972442 (= e!548126 tp_is_empty!22201)))

(declare-fun mapIsEmpty!35311 () Bool)

(declare-fun mapRes!35311 () Bool)

(assert (=> mapIsEmpty!35311 mapRes!35311))

(declare-fun b!972443 () Bool)

(declare-fun res!650911 () Bool)

(assert (=> b!972443 (=> (not res!650911) (not e!548130))))

(declare-fun zeroValue!1367 () V!34585)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34585)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14302 0))(
  ( (tuple2!14303 (_1!7162 (_ BitVec 64)) (_2!7162 V!34585)) )
))
(declare-datatypes ((List!20167 0))(
  ( (Nil!20164) (Cons!20163 (h!21325 tuple2!14302) (t!28568 List!20167)) )
))
(declare-datatypes ((ListLongMap!12999 0))(
  ( (ListLongMap!13000 (toList!6515 List!20167)) )
))
(declare-fun contains!5610 (ListLongMap!12999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3748 (array!60451 array!60449 (_ BitVec 32) (_ BitVec 32) V!34585 V!34585 (_ BitVec 32) Int) ListLongMap!12999)

(assert (=> b!972443 (= res!650911 (contains!5610 (getCurrentListMap!3748 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29089 _keys!1717) i!822)))))

(declare-fun b!972444 () Bool)

(declare-fun e!548131 () Bool)

(assert (=> b!972444 (= e!548131 (not true))))

(declare-fun lt!432036 () ListLongMap!12999)

(declare-fun lt!432038 () (_ BitVec 64))

(declare-fun +!2889 (ListLongMap!12999 tuple2!14302) ListLongMap!12999)

(declare-fun get!15070 (ValueCell!10619 V!34585) V!34585)

(declare-fun dynLambda!1678 (Int (_ BitVec 64)) V!34585)

(assert (=> b!972444 (= lt!432036 (+!2889 (getCurrentListMap!3748 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14303 lt!432038 (get!15070 (select (arr!29088 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1678 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32399 0))(
  ( (Unit!32400) )
))
(declare-fun lt!432037 () Unit!32399)

(declare-fun lemmaListMapRecursiveValidKeyArray!255 (array!60451 array!60449 (_ BitVec 32) (_ BitVec 32) V!34585 V!34585 (_ BitVec 32) Int) Unit!32399)

(assert (=> b!972444 (= lt!432037 (lemmaListMapRecursiveValidKeyArray!255 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972445 () Bool)

(declare-fun res!650916 () Bool)

(assert (=> b!972445 (=> (not res!650916) (not e!548130))))

(declare-datatypes ((List!20168 0))(
  ( (Nil!20165) (Cons!20164 (h!21326 (_ BitVec 64)) (t!28569 List!20168)) )
))
(declare-fun arrayNoDuplicates!0 (array!60451 (_ BitVec 32) List!20168) Bool)

(assert (=> b!972445 (= res!650916 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20165))))

(declare-fun b!972446 () Bool)

(assert (=> b!972446 (= e!548130 e!548131)))

(declare-fun res!650909 () Bool)

(assert (=> b!972446 (=> (not res!650909) (not e!548131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972446 (= res!650909 (validKeyInArray!0 lt!432038))))

(assert (=> b!972446 (= lt!432038 (select (arr!29089 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972446 (= lt!432036 (getCurrentListMap!3748 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!650910 () Bool)

(assert (=> start!83310 (=> (not res!650910) (not e!548130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83310 (= res!650910 (validMask!0 mask!2147))))

(assert (=> start!83310 e!548130))

(assert (=> start!83310 true))

(declare-fun e!548129 () Bool)

(declare-fun array_inv!22501 (array!60449) Bool)

(assert (=> start!83310 (and (array_inv!22501 _values!1425) e!548129)))

(assert (=> start!83310 tp_is_empty!22201))

(assert (=> start!83310 tp!67187))

(declare-fun array_inv!22502 (array!60451) Bool)

(assert (=> start!83310 (array_inv!22502 _keys!1717)))

(declare-fun mapNonEmpty!35311 () Bool)

(declare-fun tp!67188 () Bool)

(assert (=> mapNonEmpty!35311 (= mapRes!35311 (and tp!67188 e!548126))))

(declare-fun mapRest!35311 () (Array (_ BitVec 32) ValueCell!10619))

(declare-fun mapValue!35311 () ValueCell!10619)

(declare-fun mapKey!35311 () (_ BitVec 32))

(assert (=> mapNonEmpty!35311 (= (arr!29088 _values!1425) (store mapRest!35311 mapKey!35311 mapValue!35311))))

(declare-fun b!972447 () Bool)

(declare-fun e!548128 () Bool)

(assert (=> b!972447 (= e!548128 tp_is_empty!22201)))

(declare-fun b!972448 () Bool)

(assert (=> b!972448 (= e!548129 (and e!548128 mapRes!35311))))

(declare-fun condMapEmpty!35311 () Bool)

(declare-fun mapDefault!35311 () ValueCell!10619)

