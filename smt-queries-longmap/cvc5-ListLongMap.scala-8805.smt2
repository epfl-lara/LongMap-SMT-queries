; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107054 () Bool)

(assert start!107054)

(declare-fun b_free!27559 () Bool)

(declare-fun b_next!27559 () Bool)

(assert (=> start!107054 (= b_free!27559 (not b_next!27559))))

(declare-fun tp!96903 () Bool)

(declare-fun b_and!45591 () Bool)

(assert (=> start!107054 (= tp!96903 b_and!45591)))

(declare-fun b!1269243 () Bool)

(declare-fun e!723407 () Bool)

(assert (=> b!1269243 (= e!723407 (not true))))

(declare-datatypes ((V!48851 0))(
  ( (V!48852 (val!16446 Int)) )
))
(declare-datatypes ((ValueCell!15518 0))(
  ( (ValueCellFull!15518 (v!19083 V!48851)) (EmptyCell!15518) )
))
(declare-datatypes ((array!82750 0))(
  ( (array!82751 (arr!39912 (Array (_ BitVec 32) ValueCell!15518)) (size!40448 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82750)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82752 0))(
  ( (array!82753 (arr!39913 (Array (_ BitVec 32) (_ BitVec 64))) (size!40449 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82752)

(declare-fun minValueAfter!52 () V!48851)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48851)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48851)

(declare-fun zeroValueBefore!52 () V!48851)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21302 0))(
  ( (tuple2!21303 (_1!10662 (_ BitVec 64)) (_2!10662 V!48851)) )
))
(declare-datatypes ((List!28417 0))(
  ( (Nil!28414) (Cons!28413 (h!29622 tuple2!21302) (t!41946 List!28417)) )
))
(declare-datatypes ((ListLongMap!19031 0))(
  ( (ListLongMap!19032 (toList!9531 List!28417)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5863 (array!82752 array!82750 (_ BitVec 32) (_ BitVec 32) V!48851 V!48851 (_ BitVec 32) Int) ListLongMap!19031)

(assert (=> b!1269243 (= (getCurrentListMapNoExtraKeys!5863 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5863 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42248 0))(
  ( (Unit!42249) )
))
(declare-fun lt!574551 () Unit!42248)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1205 (array!82752 array!82750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48851 V!48851 V!48851 V!48851 (_ BitVec 32) Int) Unit!42248)

(assert (=> b!1269243 (= lt!574551 (lemmaNoChangeToArrayThenSameMapNoExtras!1205 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269244 () Bool)

(declare-fun e!723406 () Bool)

(declare-fun tp_is_empty!32743 () Bool)

(assert (=> b!1269244 (= e!723406 tp_is_empty!32743)))

(declare-fun b!1269245 () Bool)

(declare-fun res!844683 () Bool)

(assert (=> b!1269245 (=> (not res!844683) (not e!723407))))

(assert (=> b!1269245 (= res!844683 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40449 _keys!1364)) (bvslt from!1698 (size!40449 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun res!844684 () Bool)

(assert (=> start!107054 (=> (not res!844684) (not e!723407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107054 (= res!844684 (validMask!0 mask!1730))))

(assert (=> start!107054 e!723407))

(declare-fun e!723408 () Bool)

(declare-fun array_inv!30367 (array!82750) Bool)

(assert (=> start!107054 (and (array_inv!30367 _values!1134) e!723408)))

(assert (=> start!107054 true))

(declare-fun array_inv!30368 (array!82752) Bool)

(assert (=> start!107054 (array_inv!30368 _keys!1364)))

(assert (=> start!107054 tp_is_empty!32743))

(assert (=> start!107054 tp!96903))

(declare-fun b!1269246 () Bool)

(declare-fun mapRes!50695 () Bool)

(assert (=> b!1269246 (= e!723408 (and e!723406 mapRes!50695))))

(declare-fun condMapEmpty!50695 () Bool)

(declare-fun mapDefault!50695 () ValueCell!15518)

