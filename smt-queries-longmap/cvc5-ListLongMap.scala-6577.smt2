; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83346 () Bool)

(assert start!83346)

(declare-fun b_free!19339 () Bool)

(declare-fun b_next!19339 () Bool)

(assert (=> start!83346 (= b_free!19339 (not b_next!19339))))

(declare-fun tp!67296 () Bool)

(declare-fun b_and!30899 () Bool)

(assert (=> start!83346 (= tp!67296 b_and!30899)))

(declare-fun b!973071 () Bool)

(declare-fun res!651341 () Bool)

(declare-fun e!548472 () Bool)

(assert (=> b!973071 (=> (not res!651341) (not e!548472))))

(declare-datatypes ((array!60515 0))(
  ( (array!60516 (arr!29121 (Array (_ BitVec 32) (_ BitVec 64))) (size!29600 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60515)

(declare-datatypes ((List!20193 0))(
  ( (Nil!20190) (Cons!20189 (h!21351 (_ BitVec 64)) (t!28630 List!20193)) )
))
(declare-fun arrayNoDuplicates!0 (array!60515 (_ BitVec 32) List!20193) Bool)

(assert (=> b!973071 (= res!651341 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20190))))

(declare-fun b!973072 () Bool)

(declare-fun e!548474 () Bool)

(declare-fun e!548473 () Bool)

(assert (=> b!973072 (= e!548474 e!548473)))

(declare-fun res!651347 () Bool)

(assert (=> b!973072 (=> (not res!651347) (not e!548473))))

(declare-fun lt!432282 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973072 (= res!651347 (validKeyInArray!0 lt!432282))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973072 (= lt!432282 (select (arr!29121 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34633 0))(
  ( (V!34634 (val!11169 Int)) )
))
(declare-datatypes ((tuple2!14332 0))(
  ( (tuple2!14333 (_1!7177 (_ BitVec 64)) (_2!7177 V!34633)) )
))
(declare-datatypes ((List!20194 0))(
  ( (Nil!20191) (Cons!20190 (h!21352 tuple2!14332) (t!28631 List!20194)) )
))
(declare-datatypes ((ListLongMap!13029 0))(
  ( (ListLongMap!13030 (toList!6530 List!20194)) )
))
(declare-fun lt!432279 () ListLongMap!13029)

(declare-datatypes ((ValueCell!10637 0))(
  ( (ValueCellFull!10637 (v!13728 V!34633)) (EmptyCell!10637) )
))
(declare-datatypes ((array!60517 0))(
  ( (array!60518 (arr!29122 (Array (_ BitVec 32) ValueCell!10637)) (size!29601 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60517)

(declare-fun zeroValue!1367 () V!34633)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34633)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3763 (array!60515 array!60517 (_ BitVec 32) (_ BitVec 32) V!34633 V!34633 (_ BitVec 32) Int) ListLongMap!13029)

(assert (=> b!973072 (= lt!432279 (getCurrentListMap!3763 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973073 () Bool)

(declare-fun res!651342 () Bool)

(assert (=> b!973073 (=> (not res!651342) (not e!548472))))

(assert (=> b!973073 (= res!651342 (and (= (size!29601 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29600 _keys!1717) (size!29601 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973074 () Bool)

(declare-fun res!651344 () Bool)

(assert (=> b!973074 (=> (not res!651344) (not e!548472))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973074 (= res!651344 (validKeyInArray!0 (select (arr!29121 _keys!1717) i!822)))))

(declare-fun b!973076 () Bool)

(declare-fun e!548470 () Bool)

(declare-fun tp_is_empty!22237 () Bool)

(assert (=> b!973076 (= e!548470 tp_is_empty!22237)))

(declare-fun b!973077 () Bool)

(declare-fun res!651346 () Bool)

(assert (=> b!973077 (=> (not res!651346) (not e!548472))))

(assert (=> b!973077 (= res!651346 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29600 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29600 _keys!1717))))))

(declare-fun res!651345 () Bool)

(assert (=> start!83346 (=> (not res!651345) (not e!548472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83346 (= res!651345 (validMask!0 mask!2147))))

(assert (=> start!83346 e!548472))

(assert (=> start!83346 true))

(declare-fun e!548476 () Bool)

(declare-fun array_inv!22529 (array!60517) Bool)

(assert (=> start!83346 (and (array_inv!22529 _values!1425) e!548476)))

(assert (=> start!83346 tp_is_empty!22237))

(assert (=> start!83346 tp!67296))

(declare-fun array_inv!22530 (array!60515) Bool)

(assert (=> start!83346 (array_inv!22530 _keys!1717)))

(declare-fun b!973075 () Bool)

(assert (=> b!973075 (= e!548472 e!548474)))

(declare-fun res!651343 () Bool)

(assert (=> b!973075 (=> (not res!651343) (not e!548474))))

(declare-fun lt!432280 () ListLongMap!13029)

(declare-fun contains!5623 (ListLongMap!13029 (_ BitVec 64)) Bool)

(assert (=> b!973075 (= res!651343 (contains!5623 lt!432280 (select (arr!29121 _keys!1717) i!822)))))

(assert (=> b!973075 (= lt!432280 (getCurrentListMap!3763 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973078 () Bool)

(declare-fun e!548471 () Bool)

(assert (=> b!973078 (= e!548471 tp_is_empty!22237)))

(declare-fun mapIsEmpty!35365 () Bool)

(declare-fun mapRes!35365 () Bool)

(assert (=> mapIsEmpty!35365 mapRes!35365))

(declare-fun b!973079 () Bool)

(assert (=> b!973079 (= e!548476 (and e!548470 mapRes!35365))))

(declare-fun condMapEmpty!35365 () Bool)

(declare-fun mapDefault!35365 () ValueCell!10637)

