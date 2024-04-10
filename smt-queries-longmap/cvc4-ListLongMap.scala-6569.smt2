; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83302 () Bool)

(assert start!83302)

(declare-fun b_free!19295 () Bool)

(declare-fun b_next!19295 () Bool)

(assert (=> start!83302 (= b_free!19295 (not b_next!19295))))

(declare-fun tp!67164 () Bool)

(declare-fun b_and!30811 () Bool)

(assert (=> start!83302 (= tp!67164 b_and!30811)))

(declare-fun mapNonEmpty!35299 () Bool)

(declare-fun mapRes!35299 () Bool)

(declare-fun tp!67163 () Bool)

(declare-fun e!548055 () Bool)

(assert (=> mapNonEmpty!35299 (= mapRes!35299 (and tp!67163 e!548055))))

(declare-datatypes ((V!34573 0))(
  ( (V!34574 (val!11147 Int)) )
))
(declare-datatypes ((ValueCell!10615 0))(
  ( (ValueCellFull!10615 (v!13706 V!34573)) (EmptyCell!10615) )
))
(declare-fun mapValue!35299 () ValueCell!10615)

(declare-fun mapRest!35299 () (Array (_ BitVec 32) ValueCell!10615))

(declare-fun mapKey!35299 () (_ BitVec 32))

(declare-datatypes ((array!60433 0))(
  ( (array!60434 (arr!29080 (Array (_ BitVec 32) ValueCell!10615)) (size!29559 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60433)

(assert (=> mapNonEmpty!35299 (= (arr!29080 _values!1425) (store mapRest!35299 mapKey!35299 mapValue!35299))))

(declare-fun b!972301 () Bool)

(declare-fun res!650815 () Bool)

(declare-fun e!548056 () Bool)

(assert (=> b!972301 (=> (not res!650815) (not e!548056))))

(declare-datatypes ((array!60435 0))(
  ( (array!60436 (arr!29081 (Array (_ BitVec 32) (_ BitVec 64))) (size!29560 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60435)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972301 (= res!650815 (validKeyInArray!0 (select (arr!29081 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35299 () Bool)

(assert (=> mapIsEmpty!35299 mapRes!35299))

(declare-fun b!972302 () Bool)

(declare-fun tp_is_empty!22193 () Bool)

(assert (=> b!972302 (= e!548055 tp_is_empty!22193)))

(declare-fun res!650819 () Bool)

(assert (=> start!83302 (=> (not res!650819) (not e!548056))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83302 (= res!650819 (validMask!0 mask!2147))))

(assert (=> start!83302 e!548056))

(assert (=> start!83302 true))

(declare-fun e!548057 () Bool)

(declare-fun array_inv!22493 (array!60433) Bool)

(assert (=> start!83302 (and (array_inv!22493 _values!1425) e!548057)))

(assert (=> start!83302 tp_is_empty!22193))

(assert (=> start!83302 tp!67164))

(declare-fun array_inv!22494 (array!60435) Bool)

(assert (=> start!83302 (array_inv!22494 _keys!1717)))

(declare-fun b!972303 () Bool)

(declare-fun e!548059 () Bool)

(assert (=> b!972303 (= e!548056 e!548059)))

(declare-fun res!650813 () Bool)

(assert (=> b!972303 (=> (not res!650813) (not e!548059))))

(declare-fun lt!432000 () (_ BitVec 64))

(assert (=> b!972303 (= res!650813 (validKeyInArray!0 lt!432000))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972303 (= lt!432000 (select (arr!29081 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun zeroValue!1367 () V!34573)

(declare-datatypes ((tuple2!14296 0))(
  ( (tuple2!14297 (_1!7159 (_ BitVec 64)) (_2!7159 V!34573)) )
))
(declare-datatypes ((List!20160 0))(
  ( (Nil!20157) (Cons!20156 (h!21318 tuple2!14296) (t!28553 List!20160)) )
))
(declare-datatypes ((ListLongMap!12993 0))(
  ( (ListLongMap!12994 (toList!6512 List!20160)) )
))
(declare-fun lt!432001 () ListLongMap!12993)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34573)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3745 (array!60435 array!60433 (_ BitVec 32) (_ BitVec 32) V!34573 V!34573 (_ BitVec 32) Int) ListLongMap!12993)

(assert (=> b!972303 (= lt!432001 (getCurrentListMap!3745 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972304 () Bool)

(declare-fun res!650814 () Bool)

(assert (=> b!972304 (=> (not res!650814) (not e!548056))))

(assert (=> b!972304 (= res!650814 (and (= (size!29559 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29560 _keys!1717) (size!29559 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972305 () Bool)

(assert (=> b!972305 (= e!548059 (not true))))

(declare-fun +!2886 (ListLongMap!12993 tuple2!14296) ListLongMap!12993)

(declare-fun get!15063 (ValueCell!10615 V!34573) V!34573)

(declare-fun dynLambda!1675 (Int (_ BitVec 64)) V!34573)

(assert (=> b!972305 (= lt!432001 (+!2886 (getCurrentListMap!3745 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14297 lt!432000 (get!15063 (select (arr!29080 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1675 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32393 0))(
  ( (Unit!32394) )
))
(declare-fun lt!432002 () Unit!32393)

(declare-fun lemmaListMapRecursiveValidKeyArray!252 (array!60435 array!60433 (_ BitVec 32) (_ BitVec 32) V!34573 V!34573 (_ BitVec 32) Int) Unit!32393)

(assert (=> b!972305 (= lt!432002 (lemmaListMapRecursiveValidKeyArray!252 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972306 () Bool)

(declare-fun res!650816 () Bool)

(assert (=> b!972306 (=> (not res!650816) (not e!548056))))

(assert (=> b!972306 (= res!650816 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29560 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29560 _keys!1717))))))

(declare-fun b!972307 () Bool)

(declare-fun res!650817 () Bool)

(assert (=> b!972307 (=> (not res!650817) (not e!548056))))

(declare-datatypes ((List!20161 0))(
  ( (Nil!20158) (Cons!20157 (h!21319 (_ BitVec 64)) (t!28554 List!20161)) )
))
(declare-fun arrayNoDuplicates!0 (array!60435 (_ BitVec 32) List!20161) Bool)

(assert (=> b!972307 (= res!650817 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20158))))

(declare-fun b!972308 () Bool)

(declare-fun e!548058 () Bool)

(assert (=> b!972308 (= e!548058 tp_is_empty!22193)))

(declare-fun b!972309 () Bool)

(declare-fun res!650818 () Bool)

(assert (=> b!972309 (=> (not res!650818) (not e!548056))))

(declare-fun contains!5607 (ListLongMap!12993 (_ BitVec 64)) Bool)

(assert (=> b!972309 (= res!650818 (contains!5607 (getCurrentListMap!3745 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29081 _keys!1717) i!822)))))

(declare-fun b!972310 () Bool)

(declare-fun res!650820 () Bool)

(assert (=> b!972310 (=> (not res!650820) (not e!548056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60435 (_ BitVec 32)) Bool)

(assert (=> b!972310 (= res!650820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972311 () Bool)

(assert (=> b!972311 (= e!548057 (and e!548058 mapRes!35299))))

(declare-fun condMapEmpty!35299 () Bool)

(declare-fun mapDefault!35299 () ValueCell!10615)

