; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107142 () Bool)

(assert start!107142)

(declare-fun b_free!27647 () Bool)

(declare-fun b_next!27647 () Bool)

(assert (=> start!107142 (= b_free!27647 (not b_next!27647))))

(declare-fun tp!97168 () Bool)

(declare-fun b_and!45679 () Bool)

(assert (=> start!107142 (= tp!97168 b_and!45679)))

(declare-fun b!1270299 () Bool)

(declare-fun e!724065 () Bool)

(declare-fun tp_is_empty!32831 () Bool)

(assert (=> b!1270299 (= e!724065 tp_is_empty!32831)))

(declare-fun b!1270300 () Bool)

(declare-fun res!845342 () Bool)

(declare-fun e!724064 () Bool)

(assert (=> b!1270300 (=> (not res!845342) (not e!724064))))

(declare-datatypes ((array!82924 0))(
  ( (array!82925 (arr!39999 (Array (_ BitVec 32) (_ BitVec 64))) (size!40535 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82924)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82924 (_ BitVec 32)) Bool)

(assert (=> b!1270300 (= res!845342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270301 () Bool)

(declare-fun res!845341 () Bool)

(assert (=> b!1270301 (=> (not res!845341) (not e!724064))))

(declare-datatypes ((List!28480 0))(
  ( (Nil!28477) (Cons!28476 (h!29685 (_ BitVec 64)) (t!42009 List!28480)) )
))
(declare-fun arrayNoDuplicates!0 (array!82924 (_ BitVec 32) List!28480) Bool)

(assert (=> b!1270301 (= res!845341 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28477))))

(declare-fun mapIsEmpty!50827 () Bool)

(declare-fun mapRes!50827 () Bool)

(assert (=> mapIsEmpty!50827 mapRes!50827))

(declare-fun res!845345 () Bool)

(assert (=> start!107142 (=> (not res!845345) (not e!724064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107142 (= res!845345 (validMask!0 mask!1730))))

(assert (=> start!107142 e!724064))

(declare-datatypes ((V!48967 0))(
  ( (V!48968 (val!16490 Int)) )
))
(declare-datatypes ((ValueCell!15562 0))(
  ( (ValueCellFull!15562 (v!19127 V!48967)) (EmptyCell!15562) )
))
(declare-datatypes ((array!82926 0))(
  ( (array!82927 (arr!40000 (Array (_ BitVec 32) ValueCell!15562)) (size!40536 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82926)

(declare-fun e!724067 () Bool)

(declare-fun array_inv!30423 (array!82926) Bool)

(assert (=> start!107142 (and (array_inv!30423 _values!1134) e!724067)))

(assert (=> start!107142 true))

(declare-fun array_inv!30424 (array!82924) Bool)

(assert (=> start!107142 (array_inv!30424 _keys!1364)))

(assert (=> start!107142 tp_is_empty!32831))

(assert (=> start!107142 tp!97168))

(declare-fun b!1270302 () Bool)

(declare-fun res!845343 () Bool)

(assert (=> b!1270302 (=> (not res!845343) (not e!724064))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1270302 (= res!845343 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40535 _keys!1364)) (bvslt from!1698 (size!40535 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270303 () Bool)

(assert (=> b!1270303 (= e!724064 (not true))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48967)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48967)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48967)

(declare-fun zeroValueBefore!52 () V!48967)

(declare-datatypes ((tuple2!21364 0))(
  ( (tuple2!21365 (_1!10693 (_ BitVec 64)) (_2!10693 V!48967)) )
))
(declare-datatypes ((List!28481 0))(
  ( (Nil!28478) (Cons!28477 (h!29686 tuple2!21364) (t!42010 List!28481)) )
))
(declare-datatypes ((ListLongMap!19093 0))(
  ( (ListLongMap!19094 (toList!9562 List!28481)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5894 (array!82924 array!82926 (_ BitVec 32) (_ BitVec 32) V!48967 V!48967 (_ BitVec 32) Int) ListLongMap!19093)

(assert (=> b!1270303 (= (getCurrentListMapNoExtraKeys!5894 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5894 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42310 0))(
  ( (Unit!42311) )
))
(declare-fun lt!574683 () Unit!42310)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1236 (array!82924 array!82926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48967 V!48967 V!48967 V!48967 (_ BitVec 32) Int) Unit!42310)

(assert (=> b!1270303 (= lt!574683 (lemmaNoChangeToArrayThenSameMapNoExtras!1236 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270304 () Bool)

(assert (=> b!1270304 (= e!724067 (and e!724065 mapRes!50827))))

(declare-fun condMapEmpty!50827 () Bool)

(declare-fun mapDefault!50827 () ValueCell!15562)

