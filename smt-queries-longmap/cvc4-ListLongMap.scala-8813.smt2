; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107106 () Bool)

(assert start!107106)

(declare-fun b_free!27611 () Bool)

(declare-fun b_next!27611 () Bool)

(assert (=> start!107106 (= b_free!27611 (not b_next!27611))))

(declare-fun tp!97059 () Bool)

(declare-fun b_and!45643 () Bool)

(assert (=> start!107106 (= tp!97059 b_and!45643)))

(declare-fun b!1269867 () Bool)

(declare-fun res!845074 () Bool)

(declare-fun e!723798 () Bool)

(assert (=> b!1269867 (=> (not res!845074) (not e!723798))))

(declare-datatypes ((array!82852 0))(
  ( (array!82853 (arr!39963 (Array (_ BitVec 32) (_ BitVec 64))) (size!40499 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82852)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82852 (_ BitVec 32)) Bool)

(assert (=> b!1269867 (= res!845074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!845071 () Bool)

(assert (=> start!107106 (=> (not res!845071) (not e!723798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107106 (= res!845071 (validMask!0 mask!1730))))

(assert (=> start!107106 e!723798))

(declare-datatypes ((V!48919 0))(
  ( (V!48920 (val!16472 Int)) )
))
(declare-datatypes ((ValueCell!15544 0))(
  ( (ValueCellFull!15544 (v!19109 V!48919)) (EmptyCell!15544) )
))
(declare-datatypes ((array!82854 0))(
  ( (array!82855 (arr!39964 (Array (_ BitVec 32) ValueCell!15544)) (size!40500 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82854)

(declare-fun e!723797 () Bool)

(declare-fun array_inv!30399 (array!82854) Bool)

(assert (=> start!107106 (and (array_inv!30399 _values!1134) e!723797)))

(assert (=> start!107106 true))

(declare-fun array_inv!30400 (array!82852) Bool)

(assert (=> start!107106 (array_inv!30400 _keys!1364)))

(declare-fun tp_is_empty!32795 () Bool)

(assert (=> start!107106 tp_is_empty!32795))

(assert (=> start!107106 tp!97059))

(declare-fun b!1269868 () Bool)

(declare-fun e!723796 () Bool)

(assert (=> b!1269868 (= e!723796 tp_is_empty!32795)))

(declare-fun mapIsEmpty!50773 () Bool)

(declare-fun mapRes!50773 () Bool)

(assert (=> mapIsEmpty!50773 mapRes!50773))

(declare-fun b!1269869 () Bool)

(declare-fun res!845072 () Bool)

(assert (=> b!1269869 (=> (not res!845072) (not e!723798))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269869 (= res!845072 (and (= (size!40500 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40499 _keys!1364) (size!40500 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269870 () Bool)

(assert (=> b!1269870 (= e!723798 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48919)

(declare-fun minValueBefore!52 () V!48919)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48919)

(declare-fun zeroValueBefore!52 () V!48919)

(declare-datatypes ((tuple2!21338 0))(
  ( (tuple2!21339 (_1!10680 (_ BitVec 64)) (_2!10680 V!48919)) )
))
(declare-datatypes ((List!28453 0))(
  ( (Nil!28450) (Cons!28449 (h!29658 tuple2!21338) (t!41982 List!28453)) )
))
(declare-datatypes ((ListLongMap!19067 0))(
  ( (ListLongMap!19068 (toList!9549 List!28453)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5881 (array!82852 array!82854 (_ BitVec 32) (_ BitVec 32) V!48919 V!48919 (_ BitVec 32) Int) ListLongMap!19067)

(assert (=> b!1269870 (= (getCurrentListMapNoExtraKeys!5881 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5881 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42284 0))(
  ( (Unit!42285) )
))
(declare-fun lt!574629 () Unit!42284)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1223 (array!82852 array!82854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48919 V!48919 V!48919 V!48919 (_ BitVec 32) Int) Unit!42284)

(assert (=> b!1269870 (= lt!574629 (lemmaNoChangeToArrayThenSameMapNoExtras!1223 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50773 () Bool)

(declare-fun tp!97060 () Bool)

(declare-fun e!723795 () Bool)

(assert (=> mapNonEmpty!50773 (= mapRes!50773 (and tp!97060 e!723795))))

(declare-fun mapValue!50773 () ValueCell!15544)

(declare-fun mapKey!50773 () (_ BitVec 32))

(declare-fun mapRest!50773 () (Array (_ BitVec 32) ValueCell!15544))

(assert (=> mapNonEmpty!50773 (= (arr!39964 _values!1134) (store mapRest!50773 mapKey!50773 mapValue!50773))))

(declare-fun b!1269871 () Bool)

(assert (=> b!1269871 (= e!723797 (and e!723796 mapRes!50773))))

(declare-fun condMapEmpty!50773 () Bool)

(declare-fun mapDefault!50773 () ValueCell!15544)

