; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83284 () Bool)

(assert start!83284)

(declare-fun b_free!19277 () Bool)

(declare-fun b_next!19277 () Bool)

(assert (=> start!83284 (= b_free!19277 (not b_next!19277))))

(declare-fun tp!67110 () Bool)

(declare-fun b_and!30775 () Bool)

(assert (=> start!83284 (= tp!67110 b_and!30775)))

(declare-fun b!971986 () Bool)

(declare-fun res!650604 () Bool)

(declare-fun e!547893 () Bool)

(assert (=> b!971986 (=> (not res!650604) (not e!547893))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((array!60397 0))(
  ( (array!60398 (arr!29062 (Array (_ BitVec 32) (_ BitVec 64))) (size!29541 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60397)

(assert (=> b!971986 (= res!650604 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29541 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29541 _keys!1717))))))

(declare-fun b!971987 () Bool)

(declare-fun res!650601 () Bool)

(assert (=> b!971987 (=> (not res!650601) (not e!547893))))

(declare-datatypes ((List!20146 0))(
  ( (Nil!20143) (Cons!20142 (h!21304 (_ BitVec 64)) (t!28521 List!20146)) )
))
(declare-fun arrayNoDuplicates!0 (array!60397 (_ BitVec 32) List!20146) Bool)

(assert (=> b!971987 (= res!650601 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20143))))

(declare-fun b!971988 () Bool)

(declare-fun e!547896 () Bool)

(assert (=> b!971988 (= e!547896 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34549 0))(
  ( (V!34550 (val!11138 Int)) )
))
(declare-datatypes ((ValueCell!10606 0))(
  ( (ValueCellFull!10606 (v!13697 V!34549)) (EmptyCell!10606) )
))
(declare-datatypes ((array!60399 0))(
  ( (array!60400 (arr!29063 (Array (_ BitVec 32) ValueCell!10606)) (size!29542 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60399)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34549)

(declare-fun lt!431921 () (_ BitVec 64))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14282 0))(
  ( (tuple2!14283 (_1!7152 (_ BitVec 64)) (_2!7152 V!34549)) )
))
(declare-datatypes ((List!20147 0))(
  ( (Nil!20144) (Cons!20143 (h!21305 tuple2!14282) (t!28522 List!20147)) )
))
(declare-datatypes ((ListLongMap!12979 0))(
  ( (ListLongMap!12980 (toList!6505 List!20147)) )
))
(declare-fun lt!431919 () ListLongMap!12979)

(declare-fun zeroValue!1367 () V!34549)

(declare-fun +!2879 (ListLongMap!12979 tuple2!14282) ListLongMap!12979)

(declare-fun getCurrentListMap!3738 (array!60397 array!60399 (_ BitVec 32) (_ BitVec 32) V!34549 V!34549 (_ BitVec 32) Int) ListLongMap!12979)

(declare-fun get!15050 (ValueCell!10606 V!34549) V!34549)

(declare-fun dynLambda!1668 (Int (_ BitVec 64)) V!34549)

(assert (=> b!971988 (= lt!431919 (+!2879 (getCurrentListMap!3738 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14283 lt!431921 (get!15050 (select (arr!29063 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1668 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32379 0))(
  ( (Unit!32380) )
))
(declare-fun lt!431920 () Unit!32379)

(declare-fun lemmaListMapRecursiveValidKeyArray!245 (array!60397 array!60399 (_ BitVec 32) (_ BitVec 32) V!34549 V!34549 (_ BitVec 32) Int) Unit!32379)

(assert (=> b!971988 (= lt!431920 (lemmaListMapRecursiveValidKeyArray!245 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971990 () Bool)

(declare-fun res!650602 () Bool)

(assert (=> b!971990 (=> (not res!650602) (not e!547893))))

(assert (=> b!971990 (= res!650602 (and (= (size!29542 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29541 _keys!1717) (size!29542 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971991 () Bool)

(declare-fun res!650599 () Bool)

(assert (=> b!971991 (=> (not res!650599) (not e!547893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60397 (_ BitVec 32)) Bool)

(assert (=> b!971991 (= res!650599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35272 () Bool)

(declare-fun mapRes!35272 () Bool)

(declare-fun tp!67109 () Bool)

(declare-fun e!547895 () Bool)

(assert (=> mapNonEmpty!35272 (= mapRes!35272 (and tp!67109 e!547895))))

(declare-fun mapRest!35272 () (Array (_ BitVec 32) ValueCell!10606))

(declare-fun mapKey!35272 () (_ BitVec 32))

(declare-fun mapValue!35272 () ValueCell!10606)

(assert (=> mapNonEmpty!35272 (= (arr!29063 _values!1425) (store mapRest!35272 mapKey!35272 mapValue!35272))))

(declare-fun b!971992 () Bool)

(declare-fun tp_is_empty!22175 () Bool)

(assert (=> b!971992 (= e!547895 tp_is_empty!22175)))

(declare-fun mapIsEmpty!35272 () Bool)

(assert (=> mapIsEmpty!35272 mapRes!35272))

(declare-fun b!971993 () Bool)

(declare-fun e!547894 () Bool)

(declare-fun e!547892 () Bool)

(assert (=> b!971993 (= e!547894 (and e!547892 mapRes!35272))))

(declare-fun condMapEmpty!35272 () Bool)

(declare-fun mapDefault!35272 () ValueCell!10606)

