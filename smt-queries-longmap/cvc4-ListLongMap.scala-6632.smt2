; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83768 () Bool)

(assert start!83768)

(declare-fun b_free!19577 () Bool)

(declare-fun b_next!19577 () Bool)

(assert (=> start!83768 (= b_free!19577 (not b_next!19577))))

(declare-fun tp!68173 () Bool)

(declare-fun b_and!31243 () Bool)

(assert (=> start!83768 (= tp!68173 b_and!31243)))

(declare-fun mapNonEmpty!35885 () Bool)

(declare-fun mapRes!35885 () Bool)

(declare-fun tp!68172 () Bool)

(declare-fun e!551510 () Bool)

(assert (=> mapNonEmpty!35885 (= mapRes!35885 (and tp!68172 e!551510))))

(declare-datatypes ((V!35077 0))(
  ( (V!35078 (val!11336 Int)) )
))
(declare-datatypes ((ValueCell!10804 0))(
  ( (ValueCellFull!10804 (v!13898 V!35077)) (EmptyCell!10804) )
))
(declare-datatypes ((array!61169 0))(
  ( (array!61170 (arr!29442 (Array (_ BitVec 32) ValueCell!10804)) (size!29921 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61169)

(declare-fun mapValue!35885 () ValueCell!10804)

(declare-fun mapKey!35885 () (_ BitVec 32))

(declare-fun mapRest!35885 () (Array (_ BitVec 32) ValueCell!10804))

(assert (=> mapNonEmpty!35885 (= (arr!29442 _values!1278) (store mapRest!35885 mapKey!35885 mapValue!35885))))

(declare-fun b!978205 () Bool)

(declare-fun e!551509 () Bool)

(assert (=> b!978205 (= e!551509 (not true))))

(declare-datatypes ((tuple2!14532 0))(
  ( (tuple2!14533 (_1!7277 (_ BitVec 64)) (_2!7277 V!35077)) )
))
(declare-datatypes ((List!20404 0))(
  ( (Nil!20401) (Cons!20400 (h!21562 tuple2!14532) (t!28937 List!20404)) )
))
(declare-datatypes ((ListLongMap!13229 0))(
  ( (ListLongMap!13230 (toList!6630 List!20404)) )
))
(declare-fun lt!433662 () ListLongMap!13229)

(declare-fun lt!433664 () tuple2!14532)

(declare-fun lt!433661 () tuple2!14532)

(declare-fun +!2935 (ListLongMap!13229 tuple2!14532) ListLongMap!13229)

(assert (=> b!978205 (= (+!2935 (+!2935 lt!433662 lt!433664) lt!433661) (+!2935 (+!2935 lt!433662 lt!433661) lt!433664))))

(declare-fun lt!433660 () V!35077)

(declare-datatypes ((array!61171 0))(
  ( (array!61172 (arr!29443 (Array (_ BitVec 32) (_ BitVec 64))) (size!29922 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61171)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!978205 (= lt!433661 (tuple2!14533 (select (arr!29443 _keys!1544) from!1932) lt!433660))))

(declare-fun minValue!1220 () V!35077)

(assert (=> b!978205 (= lt!433664 (tuple2!14533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32509 0))(
  ( (Unit!32510) )
))
(declare-fun lt!433663 () Unit!32509)

(declare-fun addCommutativeForDiffKeys!563 (ListLongMap!13229 (_ BitVec 64) V!35077 (_ BitVec 64) V!35077) Unit!32509)

(assert (=> b!978205 (= lt!433663 (addCommutativeForDiffKeys!563 lt!433662 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29443 _keys!1544) from!1932) lt!433660))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15240 (ValueCell!10804 V!35077) V!35077)

(declare-fun dynLambda!1723 (Int (_ BitVec 64)) V!35077)

(assert (=> b!978205 (= lt!433660 (get!15240 (select (arr!29442 _values!1278) from!1932) (dynLambda!1723 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35077)

(declare-fun getCurrentListMapNoExtraKeys!3337 (array!61171 array!61169 (_ BitVec 32) (_ BitVec 32) V!35077 V!35077 (_ BitVec 32) Int) ListLongMap!13229)

(assert (=> b!978205 (= lt!433662 (+!2935 (getCurrentListMapNoExtraKeys!3337 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978206 () Bool)

(declare-fun res!654638 () Bool)

(assert (=> b!978206 (=> (not res!654638) (not e!551509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978206 (= res!654638 (validKeyInArray!0 (select (arr!29443 _keys!1544) from!1932)))))

(declare-fun b!978207 () Bool)

(declare-fun e!551507 () Bool)

(declare-fun tp_is_empty!22571 () Bool)

(assert (=> b!978207 (= e!551507 tp_is_empty!22571)))

(declare-fun b!978208 () Bool)

(declare-fun res!654642 () Bool)

(assert (=> b!978208 (=> (not res!654642) (not e!551509))))

(declare-datatypes ((List!20405 0))(
  ( (Nil!20402) (Cons!20401 (h!21563 (_ BitVec 64)) (t!28938 List!20405)) )
))
(declare-fun arrayNoDuplicates!0 (array!61171 (_ BitVec 32) List!20405) Bool)

(assert (=> b!978208 (= res!654642 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20402))))

(declare-fun b!978209 () Bool)

(declare-fun res!654644 () Bool)

(assert (=> b!978209 (=> (not res!654644) (not e!551509))))

(assert (=> b!978209 (= res!654644 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978210 () Bool)

(assert (=> b!978210 (= e!551510 tp_is_empty!22571)))

(declare-fun b!978211 () Bool)

(declare-fun res!654639 () Bool)

(assert (=> b!978211 (=> (not res!654639) (not e!551509))))

(assert (=> b!978211 (= res!654639 (and (= (size!29921 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29922 _keys!1544) (size!29921 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978212 () Bool)

(declare-fun res!654641 () Bool)

(assert (=> b!978212 (=> (not res!654641) (not e!551509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61171 (_ BitVec 32)) Bool)

(assert (=> b!978212 (= res!654641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!654643 () Bool)

(assert (=> start!83768 (=> (not res!654643) (not e!551509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83768 (= res!654643 (validMask!0 mask!1948))))

(assert (=> start!83768 e!551509))

(assert (=> start!83768 true))

(assert (=> start!83768 tp_is_empty!22571))

(declare-fun e!551511 () Bool)

(declare-fun array_inv!22759 (array!61169) Bool)

(assert (=> start!83768 (and (array_inv!22759 _values!1278) e!551511)))

(assert (=> start!83768 tp!68173))

(declare-fun array_inv!22760 (array!61171) Bool)

(assert (=> start!83768 (array_inv!22760 _keys!1544)))

(declare-fun mapIsEmpty!35885 () Bool)

(assert (=> mapIsEmpty!35885 mapRes!35885))

(declare-fun b!978213 () Bool)

(assert (=> b!978213 (= e!551511 (and e!551507 mapRes!35885))))

(declare-fun condMapEmpty!35885 () Bool)

(declare-fun mapDefault!35885 () ValueCell!10804)

