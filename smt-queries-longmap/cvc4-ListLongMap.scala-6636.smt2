; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83792 () Bool)

(assert start!83792)

(declare-fun b_free!19601 () Bool)

(declare-fun b_next!19601 () Bool)

(assert (=> start!83792 (= b_free!19601 (not b_next!19601))))

(declare-fun tp!68245 () Bool)

(declare-fun b_and!31291 () Bool)

(assert (=> start!83792 (= tp!68245 b_and!31291)))

(declare-fun b!978589 () Bool)

(declare-fun res!654890 () Bool)

(declare-fun e!551688 () Bool)

(assert (=> b!978589 (=> (not res!654890) (not e!551688))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978589 (= res!654890 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978590 () Bool)

(declare-fun res!654896 () Bool)

(assert (=> b!978590 (=> (not res!654896) (not e!551688))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35109 0))(
  ( (V!35110 (val!11348 Int)) )
))
(declare-datatypes ((ValueCell!10816 0))(
  ( (ValueCellFull!10816 (v!13910 V!35109)) (EmptyCell!10816) )
))
(declare-datatypes ((array!61215 0))(
  ( (array!61216 (arr!29465 (Array (_ BitVec 32) ValueCell!10816)) (size!29944 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61215)

(declare-datatypes ((array!61217 0))(
  ( (array!61218 (arr!29466 (Array (_ BitVec 32) (_ BitVec 64))) (size!29945 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61217)

(assert (=> b!978590 (= res!654896 (and (= (size!29944 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29945 _keys!1544) (size!29944 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978591 () Bool)

(assert (=> b!978591 (= e!551688 (not true))))

(declare-datatypes ((tuple2!14552 0))(
  ( (tuple2!14553 (_1!7287 (_ BitVec 64)) (_2!7287 V!35109)) )
))
(declare-datatypes ((List!20424 0))(
  ( (Nil!20421) (Cons!20420 (h!21582 tuple2!14552) (t!28981 List!20424)) )
))
(declare-datatypes ((ListLongMap!13249 0))(
  ( (ListLongMap!13250 (toList!6640 List!20424)) )
))
(declare-fun lt!433842 () ListLongMap!13249)

(declare-fun lt!433844 () tuple2!14552)

(declare-fun lt!433843 () tuple2!14552)

(declare-fun +!2945 (ListLongMap!13249 tuple2!14552) ListLongMap!13249)

(assert (=> b!978591 (= (+!2945 (+!2945 lt!433842 lt!433844) lt!433843) (+!2945 (+!2945 lt!433842 lt!433843) lt!433844))))

(declare-fun lt!433840 () V!35109)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!978591 (= lt!433843 (tuple2!14553 (select (arr!29466 _keys!1544) from!1932) lt!433840))))

(declare-fun minValue!1220 () V!35109)

(assert (=> b!978591 (= lt!433844 (tuple2!14553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32529 0))(
  ( (Unit!32530) )
))
(declare-fun lt!433841 () Unit!32529)

(declare-fun addCommutativeForDiffKeys!573 (ListLongMap!13249 (_ BitVec 64) V!35109 (_ BitVec 64) V!35109) Unit!32529)

(assert (=> b!978591 (= lt!433841 (addCommutativeForDiffKeys!573 lt!433842 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29466 _keys!1544) from!1932) lt!433840))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15258 (ValueCell!10816 V!35109) V!35109)

(declare-fun dynLambda!1733 (Int (_ BitVec 64)) V!35109)

(assert (=> b!978591 (= lt!433840 (get!15258 (select (arr!29465 _values!1278) from!1932) (dynLambda!1733 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35109)

(declare-fun getCurrentListMapNoExtraKeys!3347 (array!61217 array!61215 (_ BitVec 32) (_ BitVec 32) V!35109 V!35109 (_ BitVec 32) Int) ListLongMap!13249)

(assert (=> b!978591 (= lt!433842 (+!2945 (getCurrentListMapNoExtraKeys!3347 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun res!654891 () Bool)

(assert (=> start!83792 (=> (not res!654891) (not e!551688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83792 (= res!654891 (validMask!0 mask!1948))))

(assert (=> start!83792 e!551688))

(assert (=> start!83792 true))

(declare-fun tp_is_empty!22595 () Bool)

(assert (=> start!83792 tp_is_empty!22595))

(declare-fun e!551687 () Bool)

(declare-fun array_inv!22779 (array!61215) Bool)

(assert (=> start!83792 (and (array_inv!22779 _values!1278) e!551687)))

(assert (=> start!83792 tp!68245))

(declare-fun array_inv!22780 (array!61217) Bool)

(assert (=> start!83792 (array_inv!22780 _keys!1544)))

(declare-fun mapNonEmpty!35921 () Bool)

(declare-fun mapRes!35921 () Bool)

(declare-fun tp!68244 () Bool)

(declare-fun e!551690 () Bool)

(assert (=> mapNonEmpty!35921 (= mapRes!35921 (and tp!68244 e!551690))))

(declare-fun mapKey!35921 () (_ BitVec 32))

(declare-fun mapRest!35921 () (Array (_ BitVec 32) ValueCell!10816))

(declare-fun mapValue!35921 () ValueCell!10816)

(assert (=> mapNonEmpty!35921 (= (arr!29465 _values!1278) (store mapRest!35921 mapKey!35921 mapValue!35921))))

(declare-fun b!978592 () Bool)

(declare-fun res!654892 () Bool)

(assert (=> b!978592 (=> (not res!654892) (not e!551688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978592 (= res!654892 (validKeyInArray!0 (select (arr!29466 _keys!1544) from!1932)))))

(declare-fun b!978593 () Bool)

(declare-fun e!551691 () Bool)

(assert (=> b!978593 (= e!551687 (and e!551691 mapRes!35921))))

(declare-fun condMapEmpty!35921 () Bool)

(declare-fun mapDefault!35921 () ValueCell!10816)

