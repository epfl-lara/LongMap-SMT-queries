; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83296 () Bool)

(assert start!83296)

(declare-fun b_free!19289 () Bool)

(declare-fun b_next!19289 () Bool)

(assert (=> start!83296 (= b_free!19289 (not b_next!19289))))

(declare-fun tp!67145 () Bool)

(declare-fun b_and!30799 () Bool)

(assert (=> start!83296 (= tp!67145 b_and!30799)))

(declare-fun b!972196 () Bool)

(declare-fun res!650743 () Bool)

(declare-fun e!548004 () Bool)

(assert (=> b!972196 (=> (not res!650743) (not e!548004))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34565 0))(
  ( (V!34566 (val!11144 Int)) )
))
(declare-datatypes ((ValueCell!10612 0))(
  ( (ValueCellFull!10612 (v!13703 V!34565)) (EmptyCell!10612) )
))
(declare-datatypes ((array!60421 0))(
  ( (array!60422 (arr!29074 (Array (_ BitVec 32) ValueCell!10612)) (size!29553 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60421)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60423 0))(
  ( (array!60424 (arr!29075 (Array (_ BitVec 32) (_ BitVec 64))) (size!29554 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60423)

(assert (=> b!972196 (= res!650743 (and (= (size!29553 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29554 _keys!1717) (size!29553 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972197 () Bool)

(declare-fun e!548000 () Bool)

(assert (=> b!972197 (= e!548004 e!548000)))

(declare-fun res!650745 () Bool)

(assert (=> b!972197 (=> (not res!650745) (not e!548000))))

(declare-fun lt!431975 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972197 (= res!650745 (validKeyInArray!0 lt!431975))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972197 (= lt!431975 (select (arr!29075 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34565)

(declare-fun zeroValue!1367 () V!34565)

(declare-datatypes ((tuple2!14290 0))(
  ( (tuple2!14291 (_1!7156 (_ BitVec 64)) (_2!7156 V!34565)) )
))
(declare-datatypes ((List!20154 0))(
  ( (Nil!20151) (Cons!20150 (h!21312 tuple2!14290) (t!28541 List!20154)) )
))
(declare-datatypes ((ListLongMap!12987 0))(
  ( (ListLongMap!12988 (toList!6509 List!20154)) )
))
(declare-fun lt!431974 () ListLongMap!12987)

(declare-fun getCurrentListMap!3742 (array!60423 array!60421 (_ BitVec 32) (_ BitVec 32) V!34565 V!34565 (_ BitVec 32) Int) ListLongMap!12987)

(assert (=> b!972197 (= lt!431974 (getCurrentListMap!3742 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972198 () Bool)

(assert (=> b!972198 (= e!548000 (not true))))

(declare-fun +!2883 (ListLongMap!12987 tuple2!14290) ListLongMap!12987)

(declare-fun get!15058 (ValueCell!10612 V!34565) V!34565)

(declare-fun dynLambda!1672 (Int (_ BitVec 64)) V!34565)

(assert (=> b!972198 (= lt!431974 (+!2883 (getCurrentListMap!3742 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14291 lt!431975 (get!15058 (select (arr!29074 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1672 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32387 0))(
  ( (Unit!32388) )
))
(declare-fun lt!431973 () Unit!32387)

(declare-fun lemmaListMapRecursiveValidKeyArray!249 (array!60423 array!60421 (_ BitVec 32) (_ BitVec 32) V!34565 V!34565 (_ BitVec 32) Int) Unit!32387)

(assert (=> b!972198 (= lt!431973 (lemmaListMapRecursiveValidKeyArray!249 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972199 () Bool)

(declare-fun e!548003 () Bool)

(declare-fun tp_is_empty!22187 () Bool)

(assert (=> b!972199 (= e!548003 tp_is_empty!22187)))

(declare-fun res!650748 () Bool)

(assert (=> start!83296 (=> (not res!650748) (not e!548004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83296 (= res!650748 (validMask!0 mask!2147))))

(assert (=> start!83296 e!548004))

(assert (=> start!83296 true))

(declare-fun e!548001 () Bool)

(declare-fun array_inv!22489 (array!60421) Bool)

(assert (=> start!83296 (and (array_inv!22489 _values!1425) e!548001)))

(assert (=> start!83296 tp_is_empty!22187))

(assert (=> start!83296 tp!67145))

(declare-fun array_inv!22490 (array!60423) Bool)

(assert (=> start!83296 (array_inv!22490 _keys!1717)))

(declare-fun mapNonEmpty!35290 () Bool)

(declare-fun mapRes!35290 () Bool)

(declare-fun tp!67146 () Bool)

(assert (=> mapNonEmpty!35290 (= mapRes!35290 (and tp!67146 e!548003))))

(declare-fun mapKey!35290 () (_ BitVec 32))

(declare-fun mapValue!35290 () ValueCell!10612)

(declare-fun mapRest!35290 () (Array (_ BitVec 32) ValueCell!10612))

(assert (=> mapNonEmpty!35290 (= (arr!29074 _values!1425) (store mapRest!35290 mapKey!35290 mapValue!35290))))

(declare-fun b!972200 () Bool)

(declare-fun res!650746 () Bool)

(assert (=> b!972200 (=> (not res!650746) (not e!548004))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972200 (= res!650746 (validKeyInArray!0 (select (arr!29075 _keys!1717) i!822)))))

(declare-fun b!972201 () Bool)

(declare-fun res!650747 () Bool)

(assert (=> b!972201 (=> (not res!650747) (not e!548004))))

(declare-fun contains!5605 (ListLongMap!12987 (_ BitVec 64)) Bool)

(assert (=> b!972201 (= res!650747 (contains!5605 (getCurrentListMap!3742 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29075 _keys!1717) i!822)))))

(declare-fun b!972202 () Bool)

(declare-fun res!650741 () Bool)

(assert (=> b!972202 (=> (not res!650741) (not e!548004))))

(declare-datatypes ((List!20155 0))(
  ( (Nil!20152) (Cons!20151 (h!21313 (_ BitVec 64)) (t!28542 List!20155)) )
))
(declare-fun arrayNoDuplicates!0 (array!60423 (_ BitVec 32) List!20155) Bool)

(assert (=> b!972202 (= res!650741 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20152))))

(declare-fun b!972203 () Bool)

(declare-fun e!548002 () Bool)

(assert (=> b!972203 (= e!548002 tp_is_empty!22187)))

(declare-fun b!972204 () Bool)

(declare-fun res!650744 () Bool)

(assert (=> b!972204 (=> (not res!650744) (not e!548004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60423 (_ BitVec 32)) Bool)

(assert (=> b!972204 (= res!650744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972205 () Bool)

(assert (=> b!972205 (= e!548001 (and e!548002 mapRes!35290))))

(declare-fun condMapEmpty!35290 () Bool)

(declare-fun mapDefault!35290 () ValueCell!10612)

