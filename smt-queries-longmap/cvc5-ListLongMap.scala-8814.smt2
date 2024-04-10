; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107108 () Bool)

(assert start!107108)

(declare-fun b_free!27613 () Bool)

(declare-fun b_next!27613 () Bool)

(assert (=> start!107108 (= b_free!27613 (not b_next!27613))))

(declare-fun tp!97066 () Bool)

(declare-fun b_and!45645 () Bool)

(assert (=> start!107108 (= tp!97066 b_and!45645)))

(declare-fun b!1269891 () Bool)

(declare-fun e!723812 () Bool)

(assert (=> b!1269891 (= e!723812 (not true))))

(declare-datatypes ((V!48923 0))(
  ( (V!48924 (val!16473 Int)) )
))
(declare-datatypes ((ValueCell!15545 0))(
  ( (ValueCellFull!15545 (v!19110 V!48923)) (EmptyCell!15545) )
))
(declare-datatypes ((array!82856 0))(
  ( (array!82857 (arr!39965 (Array (_ BitVec 32) ValueCell!15545)) (size!40501 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82856)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82858 0))(
  ( (array!82859 (arr!39966 (Array (_ BitVec 32) (_ BitVec 64))) (size!40502 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82858)

(declare-fun minValueAfter!52 () V!48923)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48923)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48923)

(declare-fun zeroValueBefore!52 () V!48923)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21340 0))(
  ( (tuple2!21341 (_1!10681 (_ BitVec 64)) (_2!10681 V!48923)) )
))
(declare-datatypes ((List!28454 0))(
  ( (Nil!28451) (Cons!28450 (h!29659 tuple2!21340) (t!41983 List!28454)) )
))
(declare-datatypes ((ListLongMap!19069 0))(
  ( (ListLongMap!19070 (toList!9550 List!28454)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5882 (array!82858 array!82856 (_ BitVec 32) (_ BitVec 32) V!48923 V!48923 (_ BitVec 32) Int) ListLongMap!19069)

(assert (=> b!1269891 (= (getCurrentListMapNoExtraKeys!5882 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5882 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42286 0))(
  ( (Unit!42287) )
))
(declare-fun lt!574632 () Unit!42286)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1224 (array!82858 array!82856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48923 V!48923 V!48923 V!48923 (_ BitVec 32) Int) Unit!42286)

(assert (=> b!1269891 (= lt!574632 (lemmaNoChangeToArrayThenSameMapNoExtras!1224 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50776 () Bool)

(declare-fun mapRes!50776 () Bool)

(declare-fun tp!97065 () Bool)

(declare-fun e!723809 () Bool)

(assert (=> mapNonEmpty!50776 (= mapRes!50776 (and tp!97065 e!723809))))

(declare-fun mapValue!50776 () ValueCell!15545)

(declare-fun mapKey!50776 () (_ BitVec 32))

(declare-fun mapRest!50776 () (Array (_ BitVec 32) ValueCell!15545))

(assert (=> mapNonEmpty!50776 (= (arr!39965 _values!1134) (store mapRest!50776 mapKey!50776 mapValue!50776))))

(declare-fun b!1269892 () Bool)

(declare-fun e!723810 () Bool)

(declare-fun tp_is_empty!32797 () Bool)

(assert (=> b!1269892 (= e!723810 tp_is_empty!32797)))

(declare-fun b!1269893 () Bool)

(declare-fun res!845087 () Bool)

(assert (=> b!1269893 (=> (not res!845087) (not e!723812))))

(assert (=> b!1269893 (= res!845087 (and (= (size!40501 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40502 _keys!1364) (size!40501 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269894 () Bool)

(declare-fun res!845090 () Bool)

(assert (=> b!1269894 (=> (not res!845090) (not e!723812))))

(declare-datatypes ((List!28455 0))(
  ( (Nil!28452) (Cons!28451 (h!29660 (_ BitVec 64)) (t!41984 List!28455)) )
))
(declare-fun arrayNoDuplicates!0 (array!82858 (_ BitVec 32) List!28455) Bool)

(assert (=> b!1269894 (= res!845090 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28452))))

(declare-fun res!845086 () Bool)

(assert (=> start!107108 (=> (not res!845086) (not e!723812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107108 (= res!845086 (validMask!0 mask!1730))))

(assert (=> start!107108 e!723812))

(declare-fun e!723811 () Bool)

(declare-fun array_inv!30401 (array!82856) Bool)

(assert (=> start!107108 (and (array_inv!30401 _values!1134) e!723811)))

(assert (=> start!107108 true))

(declare-fun array_inv!30402 (array!82858) Bool)

(assert (=> start!107108 (array_inv!30402 _keys!1364)))

(assert (=> start!107108 tp_is_empty!32797))

(assert (=> start!107108 tp!97066))

(declare-fun b!1269895 () Bool)

(assert (=> b!1269895 (= e!723809 tp_is_empty!32797)))

(declare-fun b!1269896 () Bool)

(declare-fun res!845088 () Bool)

(assert (=> b!1269896 (=> (not res!845088) (not e!723812))))

(assert (=> b!1269896 (= res!845088 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40502 _keys!1364)) (bvslt from!1698 (size!40502 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269897 () Bool)

(declare-fun res!845089 () Bool)

(assert (=> b!1269897 (=> (not res!845089) (not e!723812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82858 (_ BitVec 32)) Bool)

(assert (=> b!1269897 (= res!845089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269898 () Bool)

(assert (=> b!1269898 (= e!723811 (and e!723810 mapRes!50776))))

(declare-fun condMapEmpty!50776 () Bool)

(declare-fun mapDefault!50776 () ValueCell!15545)

