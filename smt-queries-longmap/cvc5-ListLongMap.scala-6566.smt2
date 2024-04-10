; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83280 () Bool)

(assert start!83280)

(declare-fun b_free!19273 () Bool)

(declare-fun b_next!19273 () Bool)

(assert (=> start!83280 (= b_free!19273 (not b_next!19273))))

(declare-fun tp!67098 () Bool)

(declare-fun b_and!30767 () Bool)

(assert (=> start!83280 (= tp!67098 b_and!30767)))

(declare-fun res!650556 () Bool)

(declare-fun e!547859 () Bool)

(assert (=> start!83280 (=> (not res!650556) (not e!547859))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83280 (= res!650556 (validMask!0 mask!2147))))

(assert (=> start!83280 e!547859))

(assert (=> start!83280 true))

(declare-datatypes ((V!34545 0))(
  ( (V!34546 (val!11136 Int)) )
))
(declare-datatypes ((ValueCell!10604 0))(
  ( (ValueCellFull!10604 (v!13695 V!34545)) (EmptyCell!10604) )
))
(declare-datatypes ((array!60389 0))(
  ( (array!60390 (arr!29058 (Array (_ BitVec 32) ValueCell!10604)) (size!29537 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60389)

(declare-fun e!547860 () Bool)

(declare-fun array_inv!22481 (array!60389) Bool)

(assert (=> start!83280 (and (array_inv!22481 _values!1425) e!547860)))

(declare-fun tp_is_empty!22171 () Bool)

(assert (=> start!83280 tp_is_empty!22171))

(assert (=> start!83280 tp!67098))

(declare-datatypes ((array!60391 0))(
  ( (array!60392 (arr!29059 (Array (_ BitVec 32) (_ BitVec 64))) (size!29538 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60391)

(declare-fun array_inv!22482 (array!60391) Bool)

(assert (=> start!83280 (array_inv!22482 _keys!1717)))

(declare-fun b!971916 () Bool)

(declare-fun res!650550 () Bool)

(assert (=> b!971916 (=> (not res!650550) (not e!547859))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971916 (= res!650550 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29538 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29538 _keys!1717))))))

(declare-fun b!971917 () Bool)

(declare-fun e!547858 () Bool)

(assert (=> b!971917 (= e!547858 (not true))))

(declare-fun lt!431903 () (_ BitVec 64))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34545)

(declare-datatypes ((tuple2!14278 0))(
  ( (tuple2!14279 (_1!7150 (_ BitVec 64)) (_2!7150 V!34545)) )
))
(declare-datatypes ((List!20142 0))(
  ( (Nil!20139) (Cons!20138 (h!21300 tuple2!14278) (t!28513 List!20142)) )
))
(declare-datatypes ((ListLongMap!12975 0))(
  ( (ListLongMap!12976 (toList!6503 List!20142)) )
))
(declare-fun lt!431901 () ListLongMap!12975)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34545)

(declare-fun +!2877 (ListLongMap!12975 tuple2!14278) ListLongMap!12975)

(declare-fun getCurrentListMap!3736 (array!60391 array!60389 (_ BitVec 32) (_ BitVec 32) V!34545 V!34545 (_ BitVec 32) Int) ListLongMap!12975)

(declare-fun get!15048 (ValueCell!10604 V!34545) V!34545)

(declare-fun dynLambda!1666 (Int (_ BitVec 64)) V!34545)

(assert (=> b!971917 (= lt!431901 (+!2877 (getCurrentListMap!3736 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14279 lt!431903 (get!15048 (select (arr!29058 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1666 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32375 0))(
  ( (Unit!32376) )
))
(declare-fun lt!431902 () Unit!32375)

(declare-fun lemmaListMapRecursiveValidKeyArray!243 (array!60391 array!60389 (_ BitVec 32) (_ BitVec 32) V!34545 V!34545 (_ BitVec 32) Int) Unit!32375)

(assert (=> b!971917 (= lt!431902 (lemmaListMapRecursiveValidKeyArray!243 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971918 () Bool)

(assert (=> b!971918 (= e!547859 e!547858)))

(declare-fun res!650549 () Bool)

(assert (=> b!971918 (=> (not res!650549) (not e!547858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971918 (= res!650549 (validKeyInArray!0 lt!431903))))

(assert (=> b!971918 (= lt!431903 (select (arr!29059 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!971918 (= lt!431901 (getCurrentListMap!3736 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35266 () Bool)

(declare-fun mapRes!35266 () Bool)

(declare-fun tp!67097 () Bool)

(declare-fun e!547856 () Bool)

(assert (=> mapNonEmpty!35266 (= mapRes!35266 (and tp!67097 e!547856))))

(declare-fun mapKey!35266 () (_ BitVec 32))

(declare-fun mapValue!35266 () ValueCell!10604)

(declare-fun mapRest!35266 () (Array (_ BitVec 32) ValueCell!10604))

(assert (=> mapNonEmpty!35266 (= (arr!29058 _values!1425) (store mapRest!35266 mapKey!35266 mapValue!35266))))

(declare-fun mapIsEmpty!35266 () Bool)

(assert (=> mapIsEmpty!35266 mapRes!35266))

(declare-fun b!971919 () Bool)

(declare-fun e!547861 () Bool)

(assert (=> b!971919 (= e!547861 tp_is_empty!22171)))

(declare-fun b!971920 () Bool)

(declare-fun res!650551 () Bool)

(assert (=> b!971920 (=> (not res!650551) (not e!547859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60391 (_ BitVec 32)) Bool)

(assert (=> b!971920 (= res!650551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971921 () Bool)

(declare-fun res!650555 () Bool)

(assert (=> b!971921 (=> (not res!650555) (not e!547859))))

(declare-datatypes ((List!20143 0))(
  ( (Nil!20140) (Cons!20139 (h!21301 (_ BitVec 64)) (t!28514 List!20143)) )
))
(declare-fun arrayNoDuplicates!0 (array!60391 (_ BitVec 32) List!20143) Bool)

(assert (=> b!971921 (= res!650555 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20140))))

(declare-fun b!971922 () Bool)

(declare-fun res!650553 () Bool)

(assert (=> b!971922 (=> (not res!650553) (not e!547859))))

(declare-fun contains!5601 (ListLongMap!12975 (_ BitVec 64)) Bool)

(assert (=> b!971922 (= res!650553 (contains!5601 (getCurrentListMap!3736 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29059 _keys!1717) i!822)))))

(declare-fun b!971923 () Bool)

(declare-fun res!650554 () Bool)

(assert (=> b!971923 (=> (not res!650554) (not e!547859))))

(assert (=> b!971923 (= res!650554 (and (= (size!29537 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29538 _keys!1717) (size!29537 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971924 () Bool)

(assert (=> b!971924 (= e!547860 (and e!547861 mapRes!35266))))

(declare-fun condMapEmpty!35266 () Bool)

(declare-fun mapDefault!35266 () ValueCell!10604)

