; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107124 () Bool)

(assert start!107124)

(declare-fun b_free!27629 () Bool)

(declare-fun b_next!27629 () Bool)

(assert (=> start!107124 (= b_free!27629 (not b_next!27629))))

(declare-fun tp!97113 () Bool)

(declare-fun b_and!45661 () Bool)

(assert (=> start!107124 (= tp!97113 b_and!45661)))

(declare-fun b!1270083 () Bool)

(declare-fun res!845207 () Bool)

(declare-fun e!723933 () Bool)

(assert (=> b!1270083 (=> (not res!845207) (not e!723933))))

(declare-datatypes ((array!82888 0))(
  ( (array!82889 (arr!39981 (Array (_ BitVec 32) (_ BitVec 64))) (size!40517 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82888)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82888 (_ BitVec 32)) Bool)

(assert (=> b!1270083 (= res!845207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270085 () Bool)

(declare-fun res!845210 () Bool)

(assert (=> b!1270085 (=> (not res!845210) (not e!723933))))

(declare-datatypes ((List!28466 0))(
  ( (Nil!28463) (Cons!28462 (h!29671 (_ BitVec 64)) (t!41995 List!28466)) )
))
(declare-fun arrayNoDuplicates!0 (array!82888 (_ BitVec 32) List!28466) Bool)

(assert (=> b!1270085 (= res!845210 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28463))))

(declare-fun b!1270086 () Bool)

(assert (=> b!1270086 (= e!723933 (not true))))

(declare-datatypes ((V!48943 0))(
  ( (V!48944 (val!16481 Int)) )
))
(declare-datatypes ((ValueCell!15553 0))(
  ( (ValueCellFull!15553 (v!19118 V!48943)) (EmptyCell!15553) )
))
(declare-datatypes ((array!82890 0))(
  ( (array!82891 (arr!39982 (Array (_ BitVec 32) ValueCell!15553)) (size!40518 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82890)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48943)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48943)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48943)

(declare-fun zeroValueBefore!52 () V!48943)

(declare-datatypes ((tuple2!21350 0))(
  ( (tuple2!21351 (_1!10686 (_ BitVec 64)) (_2!10686 V!48943)) )
))
(declare-datatypes ((List!28467 0))(
  ( (Nil!28464) (Cons!28463 (h!29672 tuple2!21350) (t!41996 List!28467)) )
))
(declare-datatypes ((ListLongMap!19079 0))(
  ( (ListLongMap!19080 (toList!9555 List!28467)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5887 (array!82888 array!82890 (_ BitVec 32) (_ BitVec 32) V!48943 V!48943 (_ BitVec 32) Int) ListLongMap!19079)

(assert (=> b!1270086 (= (getCurrentListMapNoExtraKeys!5887 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5887 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42296 0))(
  ( (Unit!42297) )
))
(declare-fun lt!574656 () Unit!42296)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1229 (array!82888 array!82890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48943 V!48943 V!48943 V!48943 (_ BitVec 32) Int) Unit!42296)

(assert (=> b!1270086 (= lt!574656 (lemmaNoChangeToArrayThenSameMapNoExtras!1229 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270087 () Bool)

(declare-fun res!845209 () Bool)

(assert (=> b!1270087 (=> (not res!845209) (not e!723933))))

(assert (=> b!1270087 (= res!845209 (and (= (size!40518 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40517 _keys!1364) (size!40518 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50800 () Bool)

(declare-fun mapRes!50800 () Bool)

(declare-fun tp!97114 () Bool)

(declare-fun e!723929 () Bool)

(assert (=> mapNonEmpty!50800 (= mapRes!50800 (and tp!97114 e!723929))))

(declare-fun mapRest!50800 () (Array (_ BitVec 32) ValueCell!15553))

(declare-fun mapKey!50800 () (_ BitVec 32))

(declare-fun mapValue!50800 () ValueCell!15553)

(assert (=> mapNonEmpty!50800 (= (arr!39982 _values!1134) (store mapRest!50800 mapKey!50800 mapValue!50800))))

(declare-fun b!1270088 () Bool)

(declare-fun tp_is_empty!32813 () Bool)

(assert (=> b!1270088 (= e!723929 tp_is_empty!32813)))

(declare-fun b!1270089 () Bool)

(declare-fun e!723931 () Bool)

(declare-fun e!723932 () Bool)

(assert (=> b!1270089 (= e!723931 (and e!723932 mapRes!50800))))

(declare-fun condMapEmpty!50800 () Bool)

(declare-fun mapDefault!50800 () ValueCell!15553)

