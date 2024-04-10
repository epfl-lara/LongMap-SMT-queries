; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107072 () Bool)

(assert start!107072)

(declare-fun b_free!27577 () Bool)

(declare-fun b_next!27577 () Bool)

(assert (=> start!107072 (= b_free!27577 (not b_next!27577))))

(declare-fun tp!96957 () Bool)

(declare-fun b_and!45609 () Bool)

(assert (=> start!107072 (= tp!96957 b_and!45609)))

(declare-fun mapNonEmpty!50722 () Bool)

(declare-fun mapRes!50722 () Bool)

(declare-fun tp!96958 () Bool)

(declare-fun e!723540 () Bool)

(assert (=> mapNonEmpty!50722 (= mapRes!50722 (and tp!96958 e!723540))))

(declare-datatypes ((V!48875 0))(
  ( (V!48876 (val!16455 Int)) )
))
(declare-datatypes ((ValueCell!15527 0))(
  ( (ValueCellFull!15527 (v!19092 V!48875)) (EmptyCell!15527) )
))
(declare-datatypes ((array!82784 0))(
  ( (array!82785 (arr!39929 (Array (_ BitVec 32) ValueCell!15527)) (size!40465 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82784)

(declare-fun mapValue!50722 () ValueCell!15527)

(declare-fun mapRest!50722 () (Array (_ BitVec 32) ValueCell!15527))

(declare-fun mapKey!50722 () (_ BitVec 32))

(assert (=> mapNonEmpty!50722 (= (arr!39929 _values!1134) (store mapRest!50722 mapKey!50722 mapValue!50722))))

(declare-fun b!1269459 () Bool)

(declare-fun res!844817 () Bool)

(declare-fun e!723541 () Bool)

(assert (=> b!1269459 (=> (not res!844817) (not e!723541))))

(declare-datatypes ((array!82786 0))(
  ( (array!82787 (arr!39930 (Array (_ BitVec 32) (_ BitVec 64))) (size!40466 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82786)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82786 (_ BitVec 32)) Bool)

(assert (=> b!1269459 (= res!844817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269460 () Bool)

(declare-fun res!844819 () Bool)

(assert (=> b!1269460 (=> (not res!844819) (not e!723541))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269460 (= res!844819 (and (= (size!40465 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40466 _keys!1364) (size!40465 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269461 () Bool)

(declare-fun tp_is_empty!32761 () Bool)

(assert (=> b!1269461 (= e!723540 tp_is_empty!32761)))

(declare-fun b!1269463 () Bool)

(declare-fun e!723539 () Bool)

(assert (=> b!1269463 (= e!723539 tp_is_empty!32761)))

(declare-fun mapIsEmpty!50722 () Bool)

(assert (=> mapIsEmpty!50722 mapRes!50722))

(declare-fun b!1269464 () Bool)

(assert (=> b!1269464 (= e!723541 (not true))))

(declare-fun minValueAfter!52 () V!48875)

(declare-fun minValueBefore!52 () V!48875)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48875)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun zeroValueBefore!52 () V!48875)

(declare-datatypes ((tuple2!21312 0))(
  ( (tuple2!21313 (_1!10667 (_ BitVec 64)) (_2!10667 V!48875)) )
))
(declare-datatypes ((List!28426 0))(
  ( (Nil!28423) (Cons!28422 (h!29631 tuple2!21312) (t!41955 List!28426)) )
))
(declare-datatypes ((ListLongMap!19041 0))(
  ( (ListLongMap!19042 (toList!9536 List!28426)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5868 (array!82786 array!82784 (_ BitVec 32) (_ BitVec 32) V!48875 V!48875 (_ BitVec 32) Int) ListLongMap!19041)

(assert (=> b!1269464 (= (getCurrentListMapNoExtraKeys!5868 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5868 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42258 0))(
  ( (Unit!42259) )
))
(declare-fun lt!574578 () Unit!42258)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1210 (array!82786 array!82784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48875 V!48875 V!48875 V!48875 (_ BitVec 32) Int) Unit!42258)

(assert (=> b!1269464 (= lt!574578 (lemmaNoChangeToArrayThenSameMapNoExtras!1210 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269465 () Bool)

(declare-fun e!723543 () Bool)

(assert (=> b!1269465 (= e!723543 (and e!723539 mapRes!50722))))

(declare-fun condMapEmpty!50722 () Bool)

(declare-fun mapDefault!50722 () ValueCell!15527)

