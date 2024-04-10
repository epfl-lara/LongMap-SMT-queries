; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107118 () Bool)

(assert start!107118)

(declare-fun b_free!27623 () Bool)

(declare-fun b_next!27623 () Bool)

(assert (=> start!107118 (= b_free!27623 (not b_next!27623))))

(declare-fun tp!97095 () Bool)

(declare-fun b_and!45655 () Bool)

(assert (=> start!107118 (= tp!97095 b_and!45655)))

(declare-fun b!1270011 () Bool)

(declare-fun e!723885 () Bool)

(assert (=> b!1270011 (= e!723885 (not true))))

(declare-datatypes ((V!48935 0))(
  ( (V!48936 (val!16478 Int)) )
))
(declare-datatypes ((ValueCell!15550 0))(
  ( (ValueCellFull!15550 (v!19115 V!48935)) (EmptyCell!15550) )
))
(declare-datatypes ((array!82876 0))(
  ( (array!82877 (arr!39975 (Array (_ BitVec 32) ValueCell!15550)) (size!40511 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82876)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82878 0))(
  ( (array!82879 (arr!39976 (Array (_ BitVec 32) (_ BitVec 64))) (size!40512 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82878)

(declare-fun minValueAfter!52 () V!48935)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48935)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48935)

(declare-fun zeroValueBefore!52 () V!48935)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21346 0))(
  ( (tuple2!21347 (_1!10684 (_ BitVec 64)) (_2!10684 V!48935)) )
))
(declare-datatypes ((List!28462 0))(
  ( (Nil!28459) (Cons!28458 (h!29667 tuple2!21346) (t!41991 List!28462)) )
))
(declare-datatypes ((ListLongMap!19075 0))(
  ( (ListLongMap!19076 (toList!9553 List!28462)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5885 (array!82878 array!82876 (_ BitVec 32) (_ BitVec 32) V!48935 V!48935 (_ BitVec 32) Int) ListLongMap!19075)

(assert (=> b!1270011 (= (getCurrentListMapNoExtraKeys!5885 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5885 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42292 0))(
  ( (Unit!42293) )
))
(declare-fun lt!574647 () Unit!42292)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1227 (array!82878 array!82876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48935 V!48935 V!48935 V!48935 (_ BitVec 32) Int) Unit!42292)

(assert (=> b!1270011 (= lt!574647 (lemmaNoChangeToArrayThenSameMapNoExtras!1227 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50791 () Bool)

(declare-fun mapRes!50791 () Bool)

(assert (=> mapIsEmpty!50791 mapRes!50791))

(declare-fun b!1270012 () Bool)

(declare-fun res!845162 () Bool)

(assert (=> b!1270012 (=> (not res!845162) (not e!723885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82878 (_ BitVec 32)) Bool)

(assert (=> b!1270012 (= res!845162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!845163 () Bool)

(assert (=> start!107118 (=> (not res!845163) (not e!723885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107118 (= res!845163 (validMask!0 mask!1730))))

(assert (=> start!107118 e!723885))

(declare-fun e!723886 () Bool)

(declare-fun array_inv!30409 (array!82876) Bool)

(assert (=> start!107118 (and (array_inv!30409 _values!1134) e!723886)))

(assert (=> start!107118 true))

(declare-fun array_inv!30410 (array!82878) Bool)

(assert (=> start!107118 (array_inv!30410 _keys!1364)))

(declare-fun tp_is_empty!32807 () Bool)

(assert (=> start!107118 tp_is_empty!32807))

(assert (=> start!107118 tp!97095))

(declare-fun b!1270013 () Bool)

(declare-fun res!845165 () Bool)

(assert (=> b!1270013 (=> (not res!845165) (not e!723885))))

(assert (=> b!1270013 (= res!845165 (and (= (size!40511 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40512 _keys!1364) (size!40511 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270014 () Bool)

(declare-fun e!723884 () Bool)

(assert (=> b!1270014 (= e!723886 (and e!723884 mapRes!50791))))

(declare-fun condMapEmpty!50791 () Bool)

(declare-fun mapDefault!50791 () ValueCell!15550)

