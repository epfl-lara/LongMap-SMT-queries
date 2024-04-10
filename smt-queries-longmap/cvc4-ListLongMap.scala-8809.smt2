; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107082 () Bool)

(assert start!107082)

(declare-fun b_free!27587 () Bool)

(declare-fun b_next!27587 () Bool)

(assert (=> start!107082 (= b_free!27587 (not b_next!27587))))

(declare-fun tp!96987 () Bool)

(declare-fun b_and!45619 () Bool)

(assert (=> start!107082 (= tp!96987 b_and!45619)))

(declare-fun b!1269579 () Bool)

(declare-fun res!844895 () Bool)

(declare-fun e!723618 () Bool)

(assert (=> b!1269579 (=> (not res!844895) (not e!723618))))

(declare-datatypes ((array!82804 0))(
  ( (array!82805 (arr!39939 (Array (_ BitVec 32) (_ BitVec 64))) (size!40475 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82804)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82804 (_ BitVec 32)) Bool)

(assert (=> b!1269579 (= res!844895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269580 () Bool)

(assert (=> b!1269580 (= e!723618 (not true))))

(declare-datatypes ((V!48887 0))(
  ( (V!48888 (val!16460 Int)) )
))
(declare-datatypes ((ValueCell!15532 0))(
  ( (ValueCellFull!15532 (v!19097 V!48887)) (EmptyCell!15532) )
))
(declare-datatypes ((array!82806 0))(
  ( (array!82807 (arr!39940 (Array (_ BitVec 32) ValueCell!15532)) (size!40476 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82806)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48887)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48887)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48887)

(declare-fun zeroValueBefore!52 () V!48887)

(declare-datatypes ((tuple2!21322 0))(
  ( (tuple2!21323 (_1!10672 (_ BitVec 64)) (_2!10672 V!48887)) )
))
(declare-datatypes ((List!28434 0))(
  ( (Nil!28431) (Cons!28430 (h!29639 tuple2!21322) (t!41963 List!28434)) )
))
(declare-datatypes ((ListLongMap!19051 0))(
  ( (ListLongMap!19052 (toList!9541 List!28434)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5873 (array!82804 array!82806 (_ BitVec 32) (_ BitVec 32) V!48887 V!48887 (_ BitVec 32) Int) ListLongMap!19051)

(assert (=> b!1269580 (= (getCurrentListMapNoExtraKeys!5873 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5873 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42268 0))(
  ( (Unit!42269) )
))
(declare-fun lt!574593 () Unit!42268)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1215 (array!82804 array!82806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48887 V!48887 V!48887 V!48887 (_ BitVec 32) Int) Unit!42268)

(assert (=> b!1269580 (= lt!574593 (lemmaNoChangeToArrayThenSameMapNoExtras!1215 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269581 () Bool)

(declare-fun res!844894 () Bool)

(assert (=> b!1269581 (=> (not res!844894) (not e!723618))))

(assert (=> b!1269581 (= res!844894 (and (= (size!40476 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40475 _keys!1364) (size!40476 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269583 () Bool)

(declare-fun e!723617 () Bool)

(declare-fun tp_is_empty!32771 () Bool)

(assert (=> b!1269583 (= e!723617 tp_is_empty!32771)))

(declare-fun b!1269584 () Bool)

(declare-fun res!844893 () Bool)

(assert (=> b!1269584 (=> (not res!844893) (not e!723618))))

(declare-datatypes ((List!28435 0))(
  ( (Nil!28432) (Cons!28431 (h!29640 (_ BitVec 64)) (t!41964 List!28435)) )
))
(declare-fun arrayNoDuplicates!0 (array!82804 (_ BitVec 32) List!28435) Bool)

(assert (=> b!1269584 (= res!844893 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28432))))

(declare-fun b!1269585 () Bool)

(declare-fun e!723616 () Bool)

(declare-fun mapRes!50737 () Bool)

(assert (=> b!1269585 (= e!723616 (and e!723617 mapRes!50737))))

(declare-fun condMapEmpty!50737 () Bool)

(declare-fun mapDefault!50737 () ValueCell!15532)

