; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107040 () Bool)

(assert start!107040)

(declare-fun b_free!27545 () Bool)

(declare-fun b_next!27545 () Bool)

(assert (=> start!107040 (= b_free!27545 (not b_next!27545))))

(declare-fun tp!96861 () Bool)

(declare-fun b_and!45577 () Bool)

(assert (=> start!107040 (= tp!96861 b_and!45577)))

(declare-fun b!1269075 () Bool)

(declare-fun res!844579 () Bool)

(declare-fun e!723302 () Bool)

(assert (=> b!1269075 (=> (not res!844579) (not e!723302))))

(declare-datatypes ((array!82722 0))(
  ( (array!82723 (arr!39898 (Array (_ BitVec 32) (_ BitVec 64))) (size!40434 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82722)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82722 (_ BitVec 32)) Bool)

(assert (=> b!1269075 (= res!844579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269076 () Bool)

(declare-fun e!723299 () Bool)

(declare-fun tp_is_empty!32729 () Bool)

(assert (=> b!1269076 (= e!723299 tp_is_empty!32729)))

(declare-fun b!1269077 () Bool)

(assert (=> b!1269077 (= e!723302 (not true))))

(declare-datatypes ((V!48831 0))(
  ( (V!48832 (val!16439 Int)) )
))
(declare-datatypes ((ValueCell!15511 0))(
  ( (ValueCellFull!15511 (v!19076 V!48831)) (EmptyCell!15511) )
))
(declare-datatypes ((array!82724 0))(
  ( (array!82725 (arr!39899 (Array (_ BitVec 32) ValueCell!15511)) (size!40435 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82724)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48831)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48831)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48831)

(declare-fun zeroValueBefore!52 () V!48831)

(declare-datatypes ((tuple2!21292 0))(
  ( (tuple2!21293 (_1!10657 (_ BitVec 64)) (_2!10657 V!48831)) )
))
(declare-datatypes ((List!28406 0))(
  ( (Nil!28403) (Cons!28402 (h!29611 tuple2!21292) (t!41935 List!28406)) )
))
(declare-datatypes ((ListLongMap!19021 0))(
  ( (ListLongMap!19022 (toList!9526 List!28406)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5858 (array!82722 array!82724 (_ BitVec 32) (_ BitVec 32) V!48831 V!48831 (_ BitVec 32) Int) ListLongMap!19021)

(assert (=> b!1269077 (= (getCurrentListMapNoExtraKeys!5858 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5858 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42238 0))(
  ( (Unit!42239) )
))
(declare-fun lt!574530 () Unit!42238)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1200 (array!82722 array!82724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48831 V!48831 V!48831 V!48831 (_ BitVec 32) Int) Unit!42238)

(assert (=> b!1269077 (= lt!574530 (lemmaNoChangeToArrayThenSameMapNoExtras!1200 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50674 () Bool)

(declare-fun mapRes!50674 () Bool)

(declare-fun tp!96862 () Bool)

(assert (=> mapNonEmpty!50674 (= mapRes!50674 (and tp!96862 e!723299))))

(declare-fun mapRest!50674 () (Array (_ BitVec 32) ValueCell!15511))

(declare-fun mapKey!50674 () (_ BitVec 32))

(declare-fun mapValue!50674 () ValueCell!15511)

(assert (=> mapNonEmpty!50674 (= (arr!39899 _values!1134) (store mapRest!50674 mapKey!50674 mapValue!50674))))

(declare-fun b!1269078 () Bool)

(declare-fun res!844580 () Bool)

(assert (=> b!1269078 (=> (not res!844580) (not e!723302))))

(assert (=> b!1269078 (= res!844580 (and (= (size!40435 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40434 _keys!1364) (size!40435 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844576 () Bool)

(assert (=> start!107040 (=> (not res!844576) (not e!723302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107040 (= res!844576 (validMask!0 mask!1730))))

(assert (=> start!107040 e!723302))

(declare-fun e!723303 () Bool)

(declare-fun array_inv!30355 (array!82724) Bool)

(assert (=> start!107040 (and (array_inv!30355 _values!1134) e!723303)))

(assert (=> start!107040 true))

(declare-fun array_inv!30356 (array!82722) Bool)

(assert (=> start!107040 (array_inv!30356 _keys!1364)))

(assert (=> start!107040 tp_is_empty!32729))

(assert (=> start!107040 tp!96861))

(declare-fun b!1269079 () Bool)

(declare-fun res!844577 () Bool)

(assert (=> b!1269079 (=> (not res!844577) (not e!723302))))

(assert (=> b!1269079 (= res!844577 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40434 _keys!1364)) (bvslt from!1698 (size!40434 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269080 () Bool)

(declare-fun e!723300 () Bool)

(assert (=> b!1269080 (= e!723303 (and e!723300 mapRes!50674))))

(declare-fun condMapEmpty!50674 () Bool)

(declare-fun mapDefault!50674 () ValueCell!15511)

