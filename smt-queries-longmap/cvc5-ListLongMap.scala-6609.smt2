; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83538 () Bool)

(assert start!83538)

(declare-fun b_free!19525 () Bool)

(declare-fun b_next!19525 () Bool)

(assert (=> start!83538 (= b_free!19525 (not b_next!19525))))

(declare-fun tp!67863 () Bool)

(declare-fun b_and!31145 () Bool)

(assert (=> start!83538 (= tp!67863 b_and!31145)))

(declare-fun b!976083 () Bool)

(declare-fun res!653430 () Bool)

(declare-fun e!550079 () Bool)

(assert (=> b!976083 (=> (not res!653430) (not e!550079))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34889 0))(
  ( (V!34890 (val!11265 Int)) )
))
(declare-datatypes ((ValueCell!10733 0))(
  ( (ValueCellFull!10733 (v!13824 V!34889)) (EmptyCell!10733) )
))
(declare-datatypes ((array!60887 0))(
  ( (array!60888 (arr!29307 (Array (_ BitVec 32) ValueCell!10733)) (size!29786 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60887)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60889 0))(
  ( (array!60890 (arr!29308 (Array (_ BitVec 32) (_ BitVec 64))) (size!29787 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60889)

(assert (=> b!976083 (= res!653430 (and (= (size!29786 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29787 _keys!1717) (size!29786 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35653 () Bool)

(declare-fun mapRes!35653 () Bool)

(declare-fun tp!67862 () Bool)

(declare-fun e!550082 () Bool)

(assert (=> mapNonEmpty!35653 (= mapRes!35653 (and tp!67862 e!550082))))

(declare-fun mapKey!35653 () (_ BitVec 32))

(declare-fun mapRest!35653 () (Array (_ BitVec 32) ValueCell!10733))

(declare-fun mapValue!35653 () ValueCell!10733)

(assert (=> mapNonEmpty!35653 (= (arr!29307 _values!1425) (store mapRest!35653 mapKey!35653 mapValue!35653))))

(declare-fun b!976084 () Bool)

(declare-fun e!550080 () Bool)

(assert (=> b!976084 (= e!550080 (not true))))

(declare-fun zeroValue!1367 () V!34889)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34889)

(declare-datatypes ((tuple2!14492 0))(
  ( (tuple2!14493 (_1!7257 (_ BitVec 64)) (_2!7257 V!34889)) )
))
(declare-datatypes ((List!20345 0))(
  ( (Nil!20342) (Cons!20341 (h!21503 tuple2!14492) (t!28842 List!20345)) )
))
(declare-datatypes ((ListLongMap!13189 0))(
  ( (ListLongMap!13190 (toList!6610 List!20345)) )
))
(declare-fun lt!432981 () ListLongMap!13189)

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!432982 () (_ BitVec 64))

(declare-fun +!2921 (ListLongMap!13189 tuple2!14492) ListLongMap!13189)

(declare-fun getCurrentListMap!3843 (array!60889 array!60887 (_ BitVec 32) (_ BitVec 32) V!34889 V!34889 (_ BitVec 32) Int) ListLongMap!13189)

(declare-fun get!15178 (ValueCell!10733 V!34889) V!34889)

(declare-fun dynLambda!1710 (Int (_ BitVec 64)) V!34889)

(assert (=> b!976084 (= lt!432981 (+!2921 (getCurrentListMap!3843 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14493 lt!432982 (get!15178 (select (arr!29307 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1710 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32463 0))(
  ( (Unit!32464) )
))
(declare-fun lt!432983 () Unit!32463)

(declare-fun lemmaListMapRecursiveValidKeyArray!287 (array!60889 array!60887 (_ BitVec 32) (_ BitVec 32) V!34889 V!34889 (_ BitVec 32) Int) Unit!32463)

(assert (=> b!976084 (= lt!432983 (lemmaListMapRecursiveValidKeyArray!287 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976085 () Bool)

(declare-fun e!550084 () Bool)

(declare-fun e!550081 () Bool)

(assert (=> b!976085 (= e!550084 (and e!550081 mapRes!35653))))

(declare-fun condMapEmpty!35653 () Bool)

(declare-fun mapDefault!35653 () ValueCell!10733)

