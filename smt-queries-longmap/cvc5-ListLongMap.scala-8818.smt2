; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107132 () Bool)

(assert start!107132)

(declare-fun b_free!27637 () Bool)

(declare-fun b_next!27637 () Bool)

(assert (=> start!107132 (= b_free!27637 (not b_next!27637))))

(declare-fun tp!97138 () Bool)

(declare-fun b_and!45669 () Bool)

(assert (=> start!107132 (= tp!97138 b_and!45669)))

(declare-fun b!1270179 () Bool)

(declare-fun e!723993 () Bool)

(assert (=> b!1270179 (= e!723993 (not true))))

(declare-datatypes ((V!48955 0))(
  ( (V!48956 (val!16485 Int)) )
))
(declare-datatypes ((ValueCell!15557 0))(
  ( (ValueCellFull!15557 (v!19122 V!48955)) (EmptyCell!15557) )
))
(declare-datatypes ((array!82904 0))(
  ( (array!82905 (arr!39989 (Array (_ BitVec 32) ValueCell!15557)) (size!40525 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82904)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82906 0))(
  ( (array!82907 (arr!39990 (Array (_ BitVec 32) (_ BitVec 64))) (size!40526 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82906)

(declare-fun minValueAfter!52 () V!48955)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48955)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48955)

(declare-fun zeroValueBefore!52 () V!48955)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21356 0))(
  ( (tuple2!21357 (_1!10689 (_ BitVec 64)) (_2!10689 V!48955)) )
))
(declare-datatypes ((List!28473 0))(
  ( (Nil!28470) (Cons!28469 (h!29678 tuple2!21356) (t!42002 List!28473)) )
))
(declare-datatypes ((ListLongMap!19085 0))(
  ( (ListLongMap!19086 (toList!9558 List!28473)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5890 (array!82906 array!82904 (_ BitVec 32) (_ BitVec 32) V!48955 V!48955 (_ BitVec 32) Int) ListLongMap!19085)

(assert (=> b!1270179 (= (getCurrentListMapNoExtraKeys!5890 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5890 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42302 0))(
  ( (Unit!42303) )
))
(declare-fun lt!574668 () Unit!42302)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1232 (array!82906 array!82904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48955 V!48955 V!48955 V!48955 (_ BitVec 32) Int) Unit!42302)

(assert (=> b!1270179 (= lt!574668 (lemmaNoChangeToArrayThenSameMapNoExtras!1232 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50812 () Bool)

(declare-fun mapRes!50812 () Bool)

(assert (=> mapIsEmpty!50812 mapRes!50812))

(declare-fun b!1270180 () Bool)

(declare-fun res!845267 () Bool)

(assert (=> b!1270180 (=> (not res!845267) (not e!723993))))

(assert (=> b!1270180 (= res!845267 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40526 _keys!1364)) (bvslt from!1698 (size!40526 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270181 () Bool)

(declare-fun res!845269 () Bool)

(assert (=> b!1270181 (=> (not res!845269) (not e!723993))))

(assert (=> b!1270181 (= res!845269 (and (= (size!40525 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40526 _keys!1364) (size!40525 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270182 () Bool)

(declare-fun e!723989 () Bool)

(declare-fun tp_is_empty!32821 () Bool)

(assert (=> b!1270182 (= e!723989 tp_is_empty!32821)))

(declare-fun b!1270183 () Bool)

(declare-fun e!723991 () Bool)

(declare-fun e!723990 () Bool)

(assert (=> b!1270183 (= e!723991 (and e!723990 mapRes!50812))))

(declare-fun condMapEmpty!50812 () Bool)

(declare-fun mapDefault!50812 () ValueCell!15557)

