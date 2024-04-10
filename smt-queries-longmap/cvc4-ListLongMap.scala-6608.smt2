; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83536 () Bool)

(assert start!83536)

(declare-fun b_free!19523 () Bool)

(declare-fun b_next!19523 () Bool)

(assert (=> start!83536 (= b_free!19523 (not b_next!19523))))

(declare-fun tp!67856 () Bool)

(declare-fun b_and!31141 () Bool)

(assert (=> start!83536 (= tp!67856 b_and!31141)))

(declare-fun b!976048 () Bool)

(declare-fun res!653406 () Bool)

(declare-fun e!550066 () Bool)

(assert (=> b!976048 (=> (not res!653406) (not e!550066))))

(declare-datatypes ((array!60883 0))(
  ( (array!60884 (arr!29305 (Array (_ BitVec 32) (_ BitVec 64))) (size!29784 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60883)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60883 (_ BitVec 32)) Bool)

(assert (=> b!976048 (= res!653406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976049 () Bool)

(declare-fun res!653411 () Bool)

(assert (=> b!976049 (=> (not res!653411) (not e!550066))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976049 (= res!653411 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29784 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29784 _keys!1717))))))

(declare-fun b!976050 () Bool)

(declare-fun e!550063 () Bool)

(declare-fun tp_is_empty!22427 () Bool)

(assert (=> b!976050 (= e!550063 tp_is_empty!22427)))

(declare-fun b!976051 () Bool)

(declare-fun e!550062 () Bool)

(assert (=> b!976051 (= e!550062 tp_is_empty!22427)))

(declare-fun res!653407 () Bool)

(assert (=> start!83536 (=> (not res!653407) (not e!550066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83536 (= res!653407 (validMask!0 mask!2147))))

(assert (=> start!83536 e!550066))

(assert (=> start!83536 true))

(declare-datatypes ((V!34885 0))(
  ( (V!34886 (val!11264 Int)) )
))
(declare-datatypes ((ValueCell!10732 0))(
  ( (ValueCellFull!10732 (v!13823 V!34885)) (EmptyCell!10732) )
))
(declare-datatypes ((array!60885 0))(
  ( (array!60886 (arr!29306 (Array (_ BitVec 32) ValueCell!10732)) (size!29785 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60885)

(declare-fun e!550064 () Bool)

(declare-fun array_inv!22659 (array!60885) Bool)

(assert (=> start!83536 (and (array_inv!22659 _values!1425) e!550064)))

(assert (=> start!83536 tp_is_empty!22427))

(assert (=> start!83536 tp!67856))

(declare-fun array_inv!22660 (array!60883) Bool)

(assert (=> start!83536 (array_inv!22660 _keys!1717)))

(declare-fun b!976052 () Bool)

(declare-fun res!653412 () Bool)

(assert (=> b!976052 (=> (not res!653412) (not e!550066))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!976052 (= res!653412 (and (= (size!29785 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29784 _keys!1717) (size!29785 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976053 () Bool)

(declare-fun res!653405 () Bool)

(assert (=> b!976053 (=> (not res!653405) (not e!550066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976053 (= res!653405 (validKeyInArray!0 (select (arr!29305 _keys!1717) i!822)))))

(declare-fun b!976054 () Bool)

(declare-fun e!550061 () Bool)

(assert (=> b!976054 (= e!550061 (not (bvsge i!822 #b00000000000000000000000000000000)))))

(declare-fun zeroValue!1367 () V!34885)

(declare-fun lt!432972 () (_ BitVec 64))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34885)

(declare-datatypes ((tuple2!14490 0))(
  ( (tuple2!14491 (_1!7256 (_ BitVec 64)) (_2!7256 V!34885)) )
))
(declare-datatypes ((List!20343 0))(
  ( (Nil!20340) (Cons!20339 (h!21501 tuple2!14490) (t!28838 List!20343)) )
))
(declare-datatypes ((ListLongMap!13187 0))(
  ( (ListLongMap!13188 (toList!6609 List!20343)) )
))
(declare-fun lt!432974 () ListLongMap!13187)

(declare-fun +!2920 (ListLongMap!13187 tuple2!14490) ListLongMap!13187)

(declare-fun getCurrentListMap!3842 (array!60883 array!60885 (_ BitVec 32) (_ BitVec 32) V!34885 V!34885 (_ BitVec 32) Int) ListLongMap!13187)

(declare-fun get!15175 (ValueCell!10732 V!34885) V!34885)

(declare-fun dynLambda!1709 (Int (_ BitVec 64)) V!34885)

(assert (=> b!976054 (= lt!432974 (+!2920 (getCurrentListMap!3842 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14491 lt!432972 (get!15175 (select (arr!29306 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1709 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32461 0))(
  ( (Unit!32462) )
))
(declare-fun lt!432973 () Unit!32461)

(declare-fun lemmaListMapRecursiveValidKeyArray!286 (array!60883 array!60885 (_ BitVec 32) (_ BitVec 32) V!34885 V!34885 (_ BitVec 32) Int) Unit!32461)

(assert (=> b!976054 (= lt!432973 (lemmaListMapRecursiveValidKeyArray!286 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35650 () Bool)

(declare-fun mapRes!35650 () Bool)

(assert (=> mapIsEmpty!35650 mapRes!35650))

(declare-fun b!976055 () Bool)

(declare-fun res!653408 () Bool)

(assert (=> b!976055 (=> (not res!653408) (not e!550066))))

(declare-fun contains!5689 (ListLongMap!13187 (_ BitVec 64)) Bool)

(assert (=> b!976055 (= res!653408 (contains!5689 (getCurrentListMap!3842 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29305 _keys!1717) i!822)))))

(declare-fun b!976056 () Bool)

(declare-fun res!653409 () Bool)

(assert (=> b!976056 (=> (not res!653409) (not e!550066))))

(declare-datatypes ((List!20344 0))(
  ( (Nil!20341) (Cons!20340 (h!21502 (_ BitVec 64)) (t!28839 List!20344)) )
))
(declare-fun arrayNoDuplicates!0 (array!60883 (_ BitVec 32) List!20344) Bool)

(assert (=> b!976056 (= res!653409 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20341))))

(declare-fun b!976057 () Bool)

(assert (=> b!976057 (= e!550064 (and e!550063 mapRes!35650))))

(declare-fun condMapEmpty!35650 () Bool)

(declare-fun mapDefault!35650 () ValueCell!10732)

