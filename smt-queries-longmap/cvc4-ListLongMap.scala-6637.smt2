; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83798 () Bool)

(assert start!83798)

(declare-fun b_free!19607 () Bool)

(declare-fun b_next!19607 () Bool)

(assert (=> start!83798 (= b_free!19607 (not b_next!19607))))

(declare-fun tp!68262 () Bool)

(declare-fun b_and!31303 () Bool)

(assert (=> start!83798 (= tp!68262 b_and!31303)))

(declare-fun mapIsEmpty!35930 () Bool)

(declare-fun mapRes!35930 () Bool)

(assert (=> mapIsEmpty!35930 mapRes!35930))

(declare-fun b!978685 () Bool)

(declare-fun res!654954 () Bool)

(declare-fun e!551732 () Bool)

(assert (=> b!978685 (=> (not res!654954) (not e!551732))))

(declare-datatypes ((array!61227 0))(
  ( (array!61228 (arr!29471 (Array (_ BitVec 32) (_ BitVec 64))) (size!29950 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61227)

(declare-datatypes ((List!20429 0))(
  ( (Nil!20426) (Cons!20425 (h!21587 (_ BitVec 64)) (t!28992 List!20429)) )
))
(declare-fun arrayNoDuplicates!0 (array!61227 (_ BitVec 32) List!20429) Bool)

(assert (=> b!978685 (= res!654954 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20426))))

(declare-fun res!654959 () Bool)

(assert (=> start!83798 (=> (not res!654959) (not e!551732))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83798 (= res!654959 (validMask!0 mask!1948))))

(assert (=> start!83798 e!551732))

(assert (=> start!83798 true))

(declare-fun tp_is_empty!22601 () Bool)

(assert (=> start!83798 tp_is_empty!22601))

(declare-datatypes ((V!35117 0))(
  ( (V!35118 (val!11351 Int)) )
))
(declare-datatypes ((ValueCell!10819 0))(
  ( (ValueCellFull!10819 (v!13913 V!35117)) (EmptyCell!10819) )
))
(declare-datatypes ((array!61229 0))(
  ( (array!61230 (arr!29472 (Array (_ BitVec 32) ValueCell!10819)) (size!29951 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61229)

(declare-fun e!551734 () Bool)

(declare-fun array_inv!22783 (array!61229) Bool)

(assert (=> start!83798 (and (array_inv!22783 _values!1278) e!551734)))

(assert (=> start!83798 tp!68262))

(declare-fun array_inv!22784 (array!61227) Bool)

(assert (=> start!83798 (array_inv!22784 _keys!1544)))

(declare-fun b!978686 () Bool)

(declare-fun res!654957 () Bool)

(assert (=> b!978686 (=> (not res!654957) (not e!551732))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978686 (= res!654957 (and (= (size!29951 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29950 _keys!1544) (size!29951 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978687 () Bool)

(assert (=> b!978687 (= e!551732 (not true))))

(declare-datatypes ((tuple2!14558 0))(
  ( (tuple2!14559 (_1!7290 (_ BitVec 64)) (_2!7290 V!35117)) )
))
(declare-datatypes ((List!20430 0))(
  ( (Nil!20427) (Cons!20426 (h!21588 tuple2!14558) (t!28993 List!20430)) )
))
(declare-datatypes ((ListLongMap!13255 0))(
  ( (ListLongMap!13256 (toList!6643 List!20430)) )
))
(declare-fun lt!433888 () ListLongMap!13255)

(declare-fun lt!433885 () tuple2!14558)

(declare-fun lt!433887 () tuple2!14558)

(declare-fun +!2948 (ListLongMap!13255 tuple2!14558) ListLongMap!13255)

(assert (=> b!978687 (= (+!2948 (+!2948 lt!433888 lt!433885) lt!433887) (+!2948 (+!2948 lt!433888 lt!433887) lt!433885))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!433886 () V!35117)

(assert (=> b!978687 (= lt!433887 (tuple2!14559 (select (arr!29471 _keys!1544) from!1932) lt!433886))))

(declare-fun minValue!1220 () V!35117)

(assert (=> b!978687 (= lt!433885 (tuple2!14559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32535 0))(
  ( (Unit!32536) )
))
(declare-fun lt!433889 () Unit!32535)

(declare-fun addCommutativeForDiffKeys!576 (ListLongMap!13255 (_ BitVec 64) V!35117 (_ BitVec 64) V!35117) Unit!32535)

(assert (=> b!978687 (= lt!433889 (addCommutativeForDiffKeys!576 lt!433888 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29471 _keys!1544) from!1932) lt!433886))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15263 (ValueCell!10819 V!35117) V!35117)

(declare-fun dynLambda!1736 (Int (_ BitVec 64)) V!35117)

(assert (=> b!978687 (= lt!433886 (get!15263 (select (arr!29472 _values!1278) from!1932) (dynLambda!1736 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35117)

(declare-fun getCurrentListMapNoExtraKeys!3350 (array!61227 array!61229 (_ BitVec 32) (_ BitVec 32) V!35117 V!35117 (_ BitVec 32) Int) ListLongMap!13255)

(assert (=> b!978687 (= lt!433888 (+!2948 (getCurrentListMapNoExtraKeys!3350 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978688 () Bool)

(declare-fun res!654955 () Bool)

(assert (=> b!978688 (=> (not res!654955) (not e!551732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978688 (= res!654955 (validKeyInArray!0 (select (arr!29471 _keys!1544) from!1932)))))

(declare-fun b!978689 () Bool)

(declare-fun res!654956 () Bool)

(assert (=> b!978689 (=> (not res!654956) (not e!551732))))

(assert (=> b!978689 (= res!654956 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978690 () Bool)

(declare-fun res!654953 () Bool)

(assert (=> b!978690 (=> (not res!654953) (not e!551732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61227 (_ BitVec 32)) Bool)

(assert (=> b!978690 (= res!654953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35930 () Bool)

(declare-fun tp!68263 () Bool)

(declare-fun e!551736 () Bool)

(assert (=> mapNonEmpty!35930 (= mapRes!35930 (and tp!68263 e!551736))))

(declare-fun mapValue!35930 () ValueCell!10819)

(declare-fun mapKey!35930 () (_ BitVec 32))

(declare-fun mapRest!35930 () (Array (_ BitVec 32) ValueCell!10819))

(assert (=> mapNonEmpty!35930 (= (arr!29472 _values!1278) (store mapRest!35930 mapKey!35930 mapValue!35930))))

(declare-fun b!978691 () Bool)

(assert (=> b!978691 (= e!551736 tp_is_empty!22601)))

(declare-fun b!978692 () Bool)

(declare-fun e!551735 () Bool)

(assert (=> b!978692 (= e!551734 (and e!551735 mapRes!35930))))

(declare-fun condMapEmpty!35930 () Bool)

(declare-fun mapDefault!35930 () ValueCell!10819)

