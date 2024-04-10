; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83304 () Bool)

(assert start!83304)

(declare-fun b_free!19297 () Bool)

(declare-fun b_next!19297 () Bool)

(assert (=> start!83304 (= b_free!19297 (not b_next!19297))))

(declare-fun tp!67169 () Bool)

(declare-fun b_and!30815 () Bool)

(assert (=> start!83304 (= tp!67169 b_and!30815)))

(declare-fun mapIsEmpty!35302 () Bool)

(declare-fun mapRes!35302 () Bool)

(assert (=> mapIsEmpty!35302 mapRes!35302))

(declare-fun b!972336 () Bool)

(declare-fun res!650837 () Bool)

(declare-fun e!548072 () Bool)

(assert (=> b!972336 (=> (not res!650837) (not e!548072))))

(declare-datatypes ((array!60437 0))(
  ( (array!60438 (arr!29082 (Array (_ BitVec 32) (_ BitVec 64))) (size!29561 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60437)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972336 (= res!650837 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29561 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29561 _keys!1717))))))

(declare-fun mapNonEmpty!35302 () Bool)

(declare-fun tp!67170 () Bool)

(declare-fun e!548073 () Bool)

(assert (=> mapNonEmpty!35302 (= mapRes!35302 (and tp!67170 e!548073))))

(declare-datatypes ((V!34577 0))(
  ( (V!34578 (val!11148 Int)) )
))
(declare-datatypes ((ValueCell!10616 0))(
  ( (ValueCellFull!10616 (v!13707 V!34577)) (EmptyCell!10616) )
))
(declare-datatypes ((array!60439 0))(
  ( (array!60440 (arr!29083 (Array (_ BitVec 32) ValueCell!10616)) (size!29562 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60439)

(declare-fun mapRest!35302 () (Array (_ BitVec 32) ValueCell!10616))

(declare-fun mapKey!35302 () (_ BitVec 32))

(declare-fun mapValue!35302 () ValueCell!10616)

(assert (=> mapNonEmpty!35302 (= (arr!29083 _values!1425) (store mapRest!35302 mapKey!35302 mapValue!35302))))

(declare-fun b!972337 () Bool)

(declare-fun tp_is_empty!22195 () Bool)

(assert (=> b!972337 (= e!548073 tp_is_empty!22195)))

(declare-fun b!972338 () Bool)

(declare-fun res!650844 () Bool)

(assert (=> b!972338 (=> (not res!650844) (not e!548072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972338 (= res!650844 (validKeyInArray!0 (select (arr!29082 _keys!1717) i!822)))))

(declare-fun b!972339 () Bool)

(declare-fun e!548077 () Bool)

(assert (=> b!972339 (= e!548072 e!548077)))

(declare-fun res!650841 () Bool)

(assert (=> b!972339 (=> (not res!650841) (not e!548077))))

(declare-fun lt!432010 () (_ BitVec 64))

(assert (=> b!972339 (= res!650841 (validKeyInArray!0 lt!432010))))

(assert (=> b!972339 (= lt!432010 (select (arr!29082 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((tuple2!14298 0))(
  ( (tuple2!14299 (_1!7160 (_ BitVec 64)) (_2!7160 V!34577)) )
))
(declare-datatypes ((List!20162 0))(
  ( (Nil!20159) (Cons!20158 (h!21320 tuple2!14298) (t!28557 List!20162)) )
))
(declare-datatypes ((ListLongMap!12995 0))(
  ( (ListLongMap!12996 (toList!6513 List!20162)) )
))
(declare-fun lt!432011 () ListLongMap!12995)

(declare-fun zeroValue!1367 () V!34577)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34577)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3746 (array!60437 array!60439 (_ BitVec 32) (_ BitVec 32) V!34577 V!34577 (_ BitVec 32) Int) ListLongMap!12995)

(assert (=> b!972339 (= lt!432011 (getCurrentListMap!3746 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972340 () Bool)

(declare-fun res!650838 () Bool)

(assert (=> b!972340 (=> (not res!650838) (not e!548072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60437 (_ BitVec 32)) Bool)

(assert (=> b!972340 (= res!650838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972341 () Bool)

(assert (=> b!972341 (= e!548077 (not true))))

(declare-fun +!2887 (ListLongMap!12995 tuple2!14298) ListLongMap!12995)

(declare-fun get!15066 (ValueCell!10616 V!34577) V!34577)

(declare-fun dynLambda!1676 (Int (_ BitVec 64)) V!34577)

(assert (=> b!972341 (= lt!432011 (+!2887 (getCurrentListMap!3746 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14299 lt!432010 (get!15066 (select (arr!29083 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1676 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32395 0))(
  ( (Unit!32396) )
))
(declare-fun lt!432009 () Unit!32395)

(declare-fun lemmaListMapRecursiveValidKeyArray!253 (array!60437 array!60439 (_ BitVec 32) (_ BitVec 32) V!34577 V!34577 (_ BitVec 32) Int) Unit!32395)

(assert (=> b!972341 (= lt!432009 (lemmaListMapRecursiveValidKeyArray!253 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972342 () Bool)

(declare-fun res!650843 () Bool)

(assert (=> b!972342 (=> (not res!650843) (not e!548072))))

(declare-datatypes ((List!20163 0))(
  ( (Nil!20160) (Cons!20159 (h!21321 (_ BitVec 64)) (t!28558 List!20163)) )
))
(declare-fun arrayNoDuplicates!0 (array!60437 (_ BitVec 32) List!20163) Bool)

(assert (=> b!972342 (= res!650843 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20160))))

(declare-fun b!972343 () Bool)

(declare-fun e!548076 () Bool)

(assert (=> b!972343 (= e!548076 tp_is_empty!22195)))

(declare-fun b!972344 () Bool)

(declare-fun res!650842 () Bool)

(assert (=> b!972344 (=> (not res!650842) (not e!548072))))

(declare-fun contains!5608 (ListLongMap!12995 (_ BitVec 64)) Bool)

(assert (=> b!972344 (= res!650842 (contains!5608 (getCurrentListMap!3746 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29082 _keys!1717) i!822)))))

(declare-fun res!650839 () Bool)

(assert (=> start!83304 (=> (not res!650839) (not e!548072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83304 (= res!650839 (validMask!0 mask!2147))))

(assert (=> start!83304 e!548072))

(assert (=> start!83304 true))

(declare-fun e!548074 () Bool)

(declare-fun array_inv!22495 (array!60439) Bool)

(assert (=> start!83304 (and (array_inv!22495 _values!1425) e!548074)))

(assert (=> start!83304 tp_is_empty!22195))

(assert (=> start!83304 tp!67169))

(declare-fun array_inv!22496 (array!60437) Bool)

(assert (=> start!83304 (array_inv!22496 _keys!1717)))

(declare-fun b!972345 () Bool)

(declare-fun res!650840 () Bool)

(assert (=> b!972345 (=> (not res!650840) (not e!548072))))

(assert (=> b!972345 (= res!650840 (and (= (size!29562 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29561 _keys!1717) (size!29562 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972346 () Bool)

(assert (=> b!972346 (= e!548074 (and e!548076 mapRes!35302))))

(declare-fun condMapEmpty!35302 () Bool)

(declare-fun mapDefault!35302 () ValueCell!10616)

