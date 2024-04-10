; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83274 () Bool)

(assert start!83274)

(declare-fun b_free!19267 () Bool)

(declare-fun b_next!19267 () Bool)

(assert (=> start!83274 (= b_free!19267 (not b_next!19267))))

(declare-fun tp!67079 () Bool)

(declare-fun b_and!30755 () Bool)

(assert (=> start!83274 (= tp!67079 b_and!30755)))

(declare-fun b!971811 () Bool)

(declare-fun res!650478 () Bool)

(declare-fun e!547802 () Bool)

(assert (=> b!971811 (=> (not res!650478) (not e!547802))))

(declare-datatypes ((array!60377 0))(
  ( (array!60378 (arr!29052 (Array (_ BitVec 32) (_ BitVec 64))) (size!29531 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60377)

(declare-datatypes ((List!20137 0))(
  ( (Nil!20134) (Cons!20133 (h!21295 (_ BitVec 64)) (t!28502 List!20137)) )
))
(declare-fun arrayNoDuplicates!0 (array!60377 (_ BitVec 32) List!20137) Bool)

(assert (=> b!971811 (= res!650478 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20134))))

(declare-fun b!971812 () Bool)

(declare-fun e!547807 () Bool)

(assert (=> b!971812 (= e!547807 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34537 0))(
  ( (V!34538 (val!11133 Int)) )
))
(declare-datatypes ((ValueCell!10601 0))(
  ( (ValueCellFull!10601 (v!13692 V!34537)) (EmptyCell!10601) )
))
(declare-datatypes ((array!60379 0))(
  ( (array!60380 (arr!29053 (Array (_ BitVec 32) ValueCell!10601)) (size!29532 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60379)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14272 0))(
  ( (tuple2!14273 (_1!7147 (_ BitVec 64)) (_2!7147 V!34537)) )
))
(declare-datatypes ((List!20138 0))(
  ( (Nil!20135) (Cons!20134 (h!21296 tuple2!14272) (t!28503 List!20138)) )
))
(declare-datatypes ((ListLongMap!12969 0))(
  ( (ListLongMap!12970 (toList!6500 List!20138)) )
))
(declare-fun lt!431874 () ListLongMap!12969)

(declare-fun minValue!1367 () V!34537)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34537)

(declare-fun lt!431876 () (_ BitVec 64))

(declare-fun +!2874 (ListLongMap!12969 tuple2!14272) ListLongMap!12969)

(declare-fun getCurrentListMap!3733 (array!60377 array!60379 (_ BitVec 32) (_ BitVec 32) V!34537 V!34537 (_ BitVec 32) Int) ListLongMap!12969)

(declare-fun get!15043 (ValueCell!10601 V!34537) V!34537)

(declare-fun dynLambda!1663 (Int (_ BitVec 64)) V!34537)

(assert (=> b!971812 (= lt!431874 (+!2874 (getCurrentListMap!3733 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14273 lt!431876 (get!15043 (select (arr!29053 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1663 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32369 0))(
  ( (Unit!32370) )
))
(declare-fun lt!431875 () Unit!32369)

(declare-fun lemmaListMapRecursiveValidKeyArray!240 (array!60377 array!60379 (_ BitVec 32) (_ BitVec 32) V!34537 V!34537 (_ BitVec 32) Int) Unit!32369)

(assert (=> b!971812 (= lt!431875 (lemmaListMapRecursiveValidKeyArray!240 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971813 () Bool)

(declare-fun e!547806 () Bool)

(declare-fun tp_is_empty!22165 () Bool)

(assert (=> b!971813 (= e!547806 tp_is_empty!22165)))

(declare-fun b!971814 () Bool)

(declare-fun res!650480 () Bool)

(assert (=> b!971814 (=> (not res!650480) (not e!547802))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971814 (= res!650480 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29531 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29531 _keys!1717))))))

(declare-fun mapNonEmpty!35257 () Bool)

(declare-fun mapRes!35257 () Bool)

(declare-fun tp!67080 () Bool)

(assert (=> mapNonEmpty!35257 (= mapRes!35257 (and tp!67080 e!547806))))

(declare-fun mapRest!35257 () (Array (_ BitVec 32) ValueCell!10601))

(declare-fun mapValue!35257 () ValueCell!10601)

(declare-fun mapKey!35257 () (_ BitVec 32))

(assert (=> mapNonEmpty!35257 (= (arr!29053 _values!1425) (store mapRest!35257 mapKey!35257 mapValue!35257))))

(declare-fun b!971815 () Bool)

(declare-fun res!650477 () Bool)

(assert (=> b!971815 (=> (not res!650477) (not e!547802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60377 (_ BitVec 32)) Bool)

(assert (=> b!971815 (= res!650477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!650483 () Bool)

(assert (=> start!83274 (=> (not res!650483) (not e!547802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83274 (= res!650483 (validMask!0 mask!2147))))

(assert (=> start!83274 e!547802))

(assert (=> start!83274 true))

(declare-fun e!547805 () Bool)

(declare-fun array_inv!22477 (array!60379) Bool)

(assert (=> start!83274 (and (array_inv!22477 _values!1425) e!547805)))

(assert (=> start!83274 tp_is_empty!22165))

(assert (=> start!83274 tp!67079))

(declare-fun array_inv!22478 (array!60377) Bool)

(assert (=> start!83274 (array_inv!22478 _keys!1717)))

(declare-fun b!971816 () Bool)

(declare-fun e!547803 () Bool)

(assert (=> b!971816 (= e!547803 tp_is_empty!22165)))

(declare-fun b!971817 () Bool)

(declare-fun res!650482 () Bool)

(assert (=> b!971817 (=> (not res!650482) (not e!547802))))

(declare-fun contains!5599 (ListLongMap!12969 (_ BitVec 64)) Bool)

(assert (=> b!971817 (= res!650482 (contains!5599 (getCurrentListMap!3733 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29052 _keys!1717) i!822)))))

(declare-fun b!971818 () Bool)

(declare-fun res!650484 () Bool)

(assert (=> b!971818 (=> (not res!650484) (not e!547802))))

(assert (=> b!971818 (= res!650484 (and (= (size!29532 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29531 _keys!1717) (size!29532 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35257 () Bool)

(assert (=> mapIsEmpty!35257 mapRes!35257))

(declare-fun b!971819 () Bool)

(assert (=> b!971819 (= e!547805 (and e!547803 mapRes!35257))))

(declare-fun condMapEmpty!35257 () Bool)

(declare-fun mapDefault!35257 () ValueCell!10601)

