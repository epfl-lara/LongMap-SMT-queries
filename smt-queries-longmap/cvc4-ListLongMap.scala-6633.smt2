; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83774 () Bool)

(assert start!83774)

(declare-fun b_free!19583 () Bool)

(declare-fun b_next!19583 () Bool)

(assert (=> start!83774 (= b_free!19583 (not b_next!19583))))

(declare-fun tp!68191 () Bool)

(declare-fun b_and!31255 () Bool)

(assert (=> start!83774 (= tp!68191 b_and!31255)))

(declare-fun b!978301 () Bool)

(declare-fun res!654707 () Bool)

(declare-fun e!551553 () Bool)

(assert (=> b!978301 (=> (not res!654707) (not e!551553))))

(declare-datatypes ((array!61181 0))(
  ( (array!61182 (arr!29448 (Array (_ BitVec 32) (_ BitVec 64))) (size!29927 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61181)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61181 (_ BitVec 32)) Bool)

(assert (=> b!978301 (= res!654707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978302 () Bool)

(declare-fun res!654705 () Bool)

(assert (=> b!978302 (=> (not res!654705) (not e!551553))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978302 (= res!654705 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!35894 () Bool)

(declare-fun mapRes!35894 () Bool)

(declare-fun tp!68190 () Bool)

(declare-fun e!551552 () Bool)

(assert (=> mapNonEmpty!35894 (= mapRes!35894 (and tp!68190 e!551552))))

(declare-datatypes ((V!35085 0))(
  ( (V!35086 (val!11339 Int)) )
))
(declare-datatypes ((ValueCell!10807 0))(
  ( (ValueCellFull!10807 (v!13901 V!35085)) (EmptyCell!10807) )
))
(declare-datatypes ((array!61183 0))(
  ( (array!61184 (arr!29449 (Array (_ BitVec 32) ValueCell!10807)) (size!29928 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61183)

(declare-fun mapRest!35894 () (Array (_ BitVec 32) ValueCell!10807))

(declare-fun mapKey!35894 () (_ BitVec 32))

(declare-fun mapValue!35894 () ValueCell!10807)

(assert (=> mapNonEmpty!35894 (= (arr!29449 _values!1278) (store mapRest!35894 mapKey!35894 mapValue!35894))))

(declare-fun b!978303 () Bool)

(declare-fun tp_is_empty!22577 () Bool)

(assert (=> b!978303 (= e!551552 tp_is_empty!22577)))

(declare-fun res!654706 () Bool)

(assert (=> start!83774 (=> (not res!654706) (not e!551553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83774 (= res!654706 (validMask!0 mask!1948))))

(assert (=> start!83774 e!551553))

(assert (=> start!83774 true))

(assert (=> start!83774 tp_is_empty!22577))

(declare-fun e!551556 () Bool)

(declare-fun array_inv!22765 (array!61183) Bool)

(assert (=> start!83774 (and (array_inv!22765 _values!1278) e!551556)))

(assert (=> start!83774 tp!68191))

(declare-fun array_inv!22766 (array!61181) Bool)

(assert (=> start!83774 (array_inv!22766 _keys!1544)))

(declare-fun b!978304 () Bool)

(assert (=> b!978304 (= e!551553 (not true))))

(declare-datatypes ((tuple2!14538 0))(
  ( (tuple2!14539 (_1!7280 (_ BitVec 64)) (_2!7280 V!35085)) )
))
(declare-datatypes ((List!20410 0))(
  ( (Nil!20407) (Cons!20406 (h!21568 tuple2!14538) (t!28949 List!20410)) )
))
(declare-datatypes ((ListLongMap!13235 0))(
  ( (ListLongMap!13236 (toList!6633 List!20410)) )
))
(declare-fun lt!433708 () ListLongMap!13235)

(declare-fun lt!433707 () tuple2!14538)

(declare-fun lt!433709 () tuple2!14538)

(declare-fun +!2938 (ListLongMap!13235 tuple2!14538) ListLongMap!13235)

(assert (=> b!978304 (= (+!2938 (+!2938 lt!433708 lt!433707) lt!433709) (+!2938 (+!2938 lt!433708 lt!433709) lt!433707))))

(declare-fun lt!433705 () V!35085)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!978304 (= lt!433709 (tuple2!14539 (select (arr!29448 _keys!1544) from!1932) lt!433705))))

(declare-fun minValue!1220 () V!35085)

(assert (=> b!978304 (= lt!433707 (tuple2!14539 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32515 0))(
  ( (Unit!32516) )
))
(declare-fun lt!433706 () Unit!32515)

(declare-fun addCommutativeForDiffKeys!566 (ListLongMap!13235 (_ BitVec 64) V!35085 (_ BitVec 64) V!35085) Unit!32515)

(assert (=> b!978304 (= lt!433706 (addCommutativeForDiffKeys!566 lt!433708 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29448 _keys!1544) from!1932) lt!433705))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15245 (ValueCell!10807 V!35085) V!35085)

(declare-fun dynLambda!1726 (Int (_ BitVec 64)) V!35085)

(assert (=> b!978304 (= lt!433705 (get!15245 (select (arr!29449 _values!1278) from!1932) (dynLambda!1726 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35085)

(declare-fun getCurrentListMapNoExtraKeys!3340 (array!61181 array!61183 (_ BitVec 32) (_ BitVec 32) V!35085 V!35085 (_ BitVec 32) Int) ListLongMap!13235)

(assert (=> b!978304 (= lt!433708 (+!2938 (getCurrentListMapNoExtraKeys!3340 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978305 () Bool)

(declare-fun res!654703 () Bool)

(assert (=> b!978305 (=> (not res!654703) (not e!551553))))

(declare-datatypes ((List!20411 0))(
  ( (Nil!20408) (Cons!20407 (h!21569 (_ BitVec 64)) (t!28950 List!20411)) )
))
(declare-fun arrayNoDuplicates!0 (array!61181 (_ BitVec 32) List!20411) Bool)

(assert (=> b!978305 (= res!654703 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20408))))

(declare-fun mapIsEmpty!35894 () Bool)

(assert (=> mapIsEmpty!35894 mapRes!35894))

(declare-fun b!978306 () Bool)

(declare-fun res!654702 () Bool)

(assert (=> b!978306 (=> (not res!654702) (not e!551553))))

(assert (=> b!978306 (= res!654702 (and (= (size!29928 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29927 _keys!1544) (size!29928 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978307 () Bool)

(declare-fun e!551555 () Bool)

(assert (=> b!978307 (= e!551556 (and e!551555 mapRes!35894))))

(declare-fun condMapEmpty!35894 () Bool)

(declare-fun mapDefault!35894 () ValueCell!10807)

