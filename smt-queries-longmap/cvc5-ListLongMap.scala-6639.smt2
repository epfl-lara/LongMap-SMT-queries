; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83806 () Bool)

(assert start!83806)

(declare-fun b_free!19615 () Bool)

(declare-fun b_next!19615 () Bool)

(assert (=> start!83806 (= b_free!19615 (not b_next!19615))))

(declare-fun tp!68286 () Bool)

(declare-fun b_and!31319 () Bool)

(assert (=> start!83806 (= tp!68286 b_and!31319)))

(declare-fun mapIsEmpty!35942 () Bool)

(declare-fun mapRes!35942 () Bool)

(assert (=> mapIsEmpty!35942 mapRes!35942))

(declare-fun b!978813 () Bool)

(declare-fun e!551796 () Bool)

(declare-fun tp_is_empty!22609 () Bool)

(assert (=> b!978813 (= e!551796 tp_is_empty!22609)))

(declare-fun b!978814 () Bool)

(declare-fun e!551792 () Bool)

(assert (=> b!978814 (= e!551792 tp_is_empty!22609)))

(declare-fun b!978815 () Bool)

(declare-fun e!551794 () Bool)

(assert (=> b!978815 (= e!551794 (not true))))

(declare-datatypes ((V!35129 0))(
  ( (V!35130 (val!11355 Int)) )
))
(declare-datatypes ((tuple2!14566 0))(
  ( (tuple2!14567 (_1!7294 (_ BitVec 64)) (_2!7294 V!35129)) )
))
(declare-datatypes ((List!20435 0))(
  ( (Nil!20432) (Cons!20431 (h!21593 tuple2!14566) (t!29006 List!20435)) )
))
(declare-datatypes ((ListLongMap!13263 0))(
  ( (ListLongMap!13264 (toList!6647 List!20435)) )
))
(declare-fun lt!433947 () ListLongMap!13263)

(declare-fun lt!433946 () tuple2!14566)

(declare-fun lt!433949 () tuple2!14566)

(declare-fun +!2952 (ListLongMap!13263 tuple2!14566) ListLongMap!13263)

(assert (=> b!978815 (= (+!2952 (+!2952 lt!433947 lt!433946) lt!433949) (+!2952 (+!2952 lt!433947 lt!433949) lt!433946))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61243 0))(
  ( (array!61244 (arr!29479 (Array (_ BitVec 32) (_ BitVec 64))) (size!29958 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61243)

(declare-fun lt!433948 () V!35129)

(assert (=> b!978815 (= lt!433949 (tuple2!14567 (select (arr!29479 _keys!1544) from!1932) lt!433948))))

(declare-fun minValue!1220 () V!35129)

(assert (=> b!978815 (= lt!433946 (tuple2!14567 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32543 0))(
  ( (Unit!32544) )
))
(declare-fun lt!433945 () Unit!32543)

(declare-fun addCommutativeForDiffKeys!580 (ListLongMap!13263 (_ BitVec 64) V!35129 (_ BitVec 64) V!35129) Unit!32543)

(assert (=> b!978815 (= lt!433945 (addCommutativeForDiffKeys!580 lt!433947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29479 _keys!1544) from!1932) lt!433948))))

(declare-datatypes ((ValueCell!10823 0))(
  ( (ValueCellFull!10823 (v!13917 V!35129)) (EmptyCell!10823) )
))
(declare-datatypes ((array!61245 0))(
  ( (array!61246 (arr!29480 (Array (_ BitVec 32) ValueCell!10823)) (size!29959 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61245)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15271 (ValueCell!10823 V!35129) V!35129)

(declare-fun dynLambda!1740 (Int (_ BitVec 64)) V!35129)

(assert (=> b!978815 (= lt!433948 (get!15271 (select (arr!29480 _values!1278) from!1932) (dynLambda!1740 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35129)

(declare-fun getCurrentListMapNoExtraKeys!3354 (array!61243 array!61245 (_ BitVec 32) (_ BitVec 32) V!35129 V!35129 (_ BitVec 32) Int) ListLongMap!13263)

(assert (=> b!978815 (= lt!433947 (+!2952 (getCurrentListMapNoExtraKeys!3354 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978816 () Bool)

(declare-fun res!655038 () Bool)

(assert (=> b!978816 (=> (not res!655038) (not e!551794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61243 (_ BitVec 32)) Bool)

(assert (=> b!978816 (= res!655038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978817 () Bool)

(declare-fun res!655043 () Bool)

(assert (=> b!978817 (=> (not res!655043) (not e!551794))))

(declare-datatypes ((List!20436 0))(
  ( (Nil!20433) (Cons!20432 (h!21594 (_ BitVec 64)) (t!29007 List!20436)) )
))
(declare-fun arrayNoDuplicates!0 (array!61243 (_ BitVec 32) List!20436) Bool)

(assert (=> b!978817 (= res!655043 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20433))))

(declare-fun b!978818 () Bool)

(declare-fun res!655040 () Bool)

(assert (=> b!978818 (=> (not res!655040) (not e!551794))))

(assert (=> b!978818 (= res!655040 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!655042 () Bool)

(assert (=> start!83806 (=> (not res!655042) (not e!551794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83806 (= res!655042 (validMask!0 mask!1948))))

(assert (=> start!83806 e!551794))

(assert (=> start!83806 true))

(assert (=> start!83806 tp_is_empty!22609))

(declare-fun e!551793 () Bool)

(declare-fun array_inv!22791 (array!61245) Bool)

(assert (=> start!83806 (and (array_inv!22791 _values!1278) e!551793)))

(assert (=> start!83806 tp!68286))

(declare-fun array_inv!22792 (array!61243) Bool)

(assert (=> start!83806 (array_inv!22792 _keys!1544)))

(declare-fun b!978819 () Bool)

(declare-fun res!655037 () Bool)

(assert (=> b!978819 (=> (not res!655037) (not e!551794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978819 (= res!655037 (validKeyInArray!0 (select (arr!29479 _keys!1544) from!1932)))))

(declare-fun b!978820 () Bool)

(declare-fun res!655039 () Bool)

(assert (=> b!978820 (=> (not res!655039) (not e!551794))))

(assert (=> b!978820 (= res!655039 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29958 _keys!1544))))))

(declare-fun mapNonEmpty!35942 () Bool)

(declare-fun tp!68287 () Bool)

(assert (=> mapNonEmpty!35942 (= mapRes!35942 (and tp!68287 e!551796))))

(declare-fun mapKey!35942 () (_ BitVec 32))

(declare-fun mapValue!35942 () ValueCell!10823)

(declare-fun mapRest!35942 () (Array (_ BitVec 32) ValueCell!10823))

(assert (=> mapNonEmpty!35942 (= (arr!29480 _values!1278) (store mapRest!35942 mapKey!35942 mapValue!35942))))

(declare-fun b!978821 () Bool)

(declare-fun res!655041 () Bool)

(assert (=> b!978821 (=> (not res!655041) (not e!551794))))

(assert (=> b!978821 (= res!655041 (and (= (size!29959 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29958 _keys!1544) (size!29959 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978822 () Bool)

(assert (=> b!978822 (= e!551793 (and e!551792 mapRes!35942))))

(declare-fun condMapEmpty!35942 () Bool)

(declare-fun mapDefault!35942 () ValueCell!10823)

