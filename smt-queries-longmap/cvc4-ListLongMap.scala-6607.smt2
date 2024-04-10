; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83530 () Bool)

(assert start!83530)

(declare-fun b_free!19517 () Bool)

(declare-fun b_next!19517 () Bool)

(assert (=> start!83530 (= b_free!19517 (not b_next!19517))))

(declare-fun tp!67838 () Bool)

(declare-fun b_and!31129 () Bool)

(assert (=> start!83530 (= tp!67838 b_and!31129)))

(declare-fun b!975943 () Bool)

(declare-fun res!653338 () Bool)

(declare-fun e!550011 () Bool)

(assert (=> b!975943 (=> (not res!653338) (not e!550011))))

(declare-datatypes ((array!60871 0))(
  ( (array!60872 (arr!29299 (Array (_ BitVec 32) (_ BitVec 64))) (size!29778 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60871)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60871 (_ BitVec 32)) Bool)

(assert (=> b!975943 (= res!653338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975944 () Bool)

(declare-fun e!550007 () Bool)

(declare-fun tp_is_empty!22421 () Bool)

(assert (=> b!975944 (= e!550007 tp_is_empty!22421)))

(declare-fun b!975945 () Bool)

(declare-fun res!653336 () Bool)

(assert (=> b!975945 (=> (not res!653336) (not e!550011))))

(declare-datatypes ((V!34877 0))(
  ( (V!34878 (val!11261 Int)) )
))
(declare-datatypes ((ValueCell!10729 0))(
  ( (ValueCellFull!10729 (v!13820 V!34877)) (EmptyCell!10729) )
))
(declare-datatypes ((array!60873 0))(
  ( (array!60874 (arr!29300 (Array (_ BitVec 32) ValueCell!10729)) (size!29779 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60873)

(declare-fun zeroValue!1367 () V!34877)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34877)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14484 0))(
  ( (tuple2!14485 (_1!7253 (_ BitVec 64)) (_2!7253 V!34877)) )
))
(declare-datatypes ((List!20337 0))(
  ( (Nil!20334) (Cons!20333 (h!21495 tuple2!14484) (t!28826 List!20337)) )
))
(declare-datatypes ((ListLongMap!13181 0))(
  ( (ListLongMap!13182 (toList!6606 List!20337)) )
))
(declare-fun contains!5687 (ListLongMap!13181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3839 (array!60871 array!60873 (_ BitVec 32) (_ BitVec 32) V!34877 V!34877 (_ BitVec 32) Int) ListLongMap!13181)

(assert (=> b!975945 (= res!653336 (contains!5687 (getCurrentListMap!3839 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29299 _keys!1717) i!822)))))

(declare-fun b!975946 () Bool)

(declare-fun res!653340 () Bool)

(assert (=> b!975946 (=> (not res!653340) (not e!550011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975946 (= res!653340 (validKeyInArray!0 (select (arr!29299 _keys!1717) i!822)))))

(declare-fun b!975947 () Bool)

(declare-fun e!550010 () Bool)

(assert (=> b!975947 (= e!550011 e!550010)))

(declare-fun res!653337 () Bool)

(assert (=> b!975947 (=> (not res!653337) (not e!550010))))

(declare-fun lt!432947 () (_ BitVec 64))

(assert (=> b!975947 (= res!653337 (validKeyInArray!0 lt!432947))))

(assert (=> b!975947 (= lt!432947 (select (arr!29299 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432945 () ListLongMap!13181)

(assert (=> b!975947 (= lt!432945 (getCurrentListMap!3839 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975948 () Bool)

(assert (=> b!975948 (= e!550010 (not (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29779 _values!1425))))))

(declare-fun +!2917 (ListLongMap!13181 tuple2!14484) ListLongMap!13181)

(declare-fun get!15170 (ValueCell!10729 V!34877) V!34877)

(declare-fun dynLambda!1706 (Int (_ BitVec 64)) V!34877)

(assert (=> b!975948 (= lt!432945 (+!2917 (getCurrentListMap!3839 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14485 lt!432947 (get!15170 (select (arr!29300 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1706 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32455 0))(
  ( (Unit!32456) )
))
(declare-fun lt!432946 () Unit!32455)

(declare-fun lemmaListMapRecursiveValidKeyArray!283 (array!60871 array!60873 (_ BitVec 32) (_ BitVec 32) V!34877 V!34877 (_ BitVec 32) Int) Unit!32455)

(assert (=> b!975948 (= lt!432946 (lemmaListMapRecursiveValidKeyArray!283 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975949 () Bool)

(declare-fun res!653339 () Bool)

(assert (=> b!975949 (=> (not res!653339) (not e!550011))))

(declare-datatypes ((List!20338 0))(
  ( (Nil!20335) (Cons!20334 (h!21496 (_ BitVec 64)) (t!28827 List!20338)) )
))
(declare-fun arrayNoDuplicates!0 (array!60871 (_ BitVec 32) List!20338) Bool)

(assert (=> b!975949 (= res!653339 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20335))))

(declare-fun b!975950 () Bool)

(declare-fun e!550008 () Bool)

(declare-fun mapRes!35641 () Bool)

(assert (=> b!975950 (= e!550008 (and e!550007 mapRes!35641))))

(declare-fun condMapEmpty!35641 () Bool)

(declare-fun mapDefault!35641 () ValueCell!10729)

