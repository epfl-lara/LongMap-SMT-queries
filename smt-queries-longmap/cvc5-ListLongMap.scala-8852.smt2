; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107350 () Bool)

(assert start!107350)

(declare-fun b_free!27655 () Bool)

(declare-fun b_next!27655 () Bool)

(assert (=> start!107350 (= b_free!27655 (not b_next!27655))))

(declare-fun tp!97474 () Bool)

(declare-fun b_and!45703 () Bool)

(assert (=> start!107350 (= tp!97474 b_and!45703)))

(declare-fun res!846298 () Bool)

(declare-fun e!725588 () Bool)

(assert (=> start!107350 (=> (not res!846298) (not e!725588))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107350 (= res!846298 (validMask!0 mask!1730))))

(assert (=> start!107350 e!725588))

(declare-datatypes ((V!49227 0))(
  ( (V!49228 (val!16587 Int)) )
))
(declare-datatypes ((ValueCell!15659 0))(
  ( (ValueCellFull!15659 (v!19224 V!49227)) (EmptyCell!15659) )
))
(declare-datatypes ((array!83300 0))(
  ( (array!83301 (arr!40186 (Array (_ BitVec 32) ValueCell!15659)) (size!40722 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83300)

(declare-fun e!725592 () Bool)

(declare-fun array_inv!30569 (array!83300) Bool)

(assert (=> start!107350 (and (array_inv!30569 _values!1134) e!725592)))

(assert (=> start!107350 true))

(declare-datatypes ((array!83302 0))(
  ( (array!83303 (arr!40187 (Array (_ BitVec 32) (_ BitVec 64))) (size!40723 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83302)

(declare-fun array_inv!30570 (array!83302) Bool)

(assert (=> start!107350 (array_inv!30570 _keys!1364)))

(declare-fun tp_is_empty!33025 () Bool)

(assert (=> start!107350 tp_is_empty!33025))

(assert (=> start!107350 tp!97474))

(declare-fun b!1272196 () Bool)

(declare-fun res!846299 () Bool)

(assert (=> b!1272196 (=> (not res!846299) (not e!725588))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272196 (= res!846299 (and (= (size!40722 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40723 _keys!1364) (size!40722 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51121 () Bool)

(declare-fun mapRes!51121 () Bool)

(declare-fun tp!97473 () Bool)

(declare-fun e!725591 () Bool)

(assert (=> mapNonEmpty!51121 (= mapRes!51121 (and tp!97473 e!725591))))

(declare-fun mapValue!51121 () ValueCell!15659)

(declare-fun mapKey!51121 () (_ BitVec 32))

(declare-fun mapRest!51121 () (Array (_ BitVec 32) ValueCell!15659))

(assert (=> mapNonEmpty!51121 (= (arr!40186 _values!1134) (store mapRest!51121 mapKey!51121 mapValue!51121))))

(declare-fun b!1272197 () Bool)

(declare-fun e!725590 () Bool)

(assert (=> b!1272197 (= e!725590 tp_is_empty!33025)))

(declare-fun b!1272198 () Bool)

(assert (=> b!1272198 (= e!725591 tp_is_empty!33025)))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!49227)

(declare-fun b!1272199 () Bool)

(declare-fun minValueBefore!52 () V!49227)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!49227)

(declare-fun zeroValueBefore!52 () V!49227)

(declare-datatypes ((tuple2!21370 0))(
  ( (tuple2!21371 (_1!10696 (_ BitVec 64)) (_2!10696 V!49227)) )
))
(declare-datatypes ((List!28553 0))(
  ( (Nil!28550) (Cons!28549 (h!29758 tuple2!21370) (t!42084 List!28553)) )
))
(declare-datatypes ((ListLongMap!19099 0))(
  ( (ListLongMap!19100 (toList!9565 List!28553)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5897 (array!83302 array!83300 (_ BitVec 32) (_ BitVec 32) V!49227 V!49227 (_ BitVec 32) Int) ListLongMap!19099)

(assert (=> b!1272199 (= e!725588 (not (= (getCurrentListMapNoExtraKeys!5897 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 from!1698 defaultEntry!1142) (getCurrentListMapNoExtraKeys!5897 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 from!1698 defaultEntry!1142))))))

(declare-fun b!1272200 () Bool)

(declare-fun res!846295 () Bool)

(assert (=> b!1272200 (=> (not res!846295) (not e!725588))))

(assert (=> b!1272200 (= res!846295 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40723 _keys!1364)) (bvsge from!1698 (size!40723 _keys!1364))))))

(declare-fun b!1272201 () Bool)

(declare-fun res!846297 () Bool)

(assert (=> b!1272201 (=> (not res!846297) (not e!725588))))

(declare-datatypes ((List!28554 0))(
  ( (Nil!28551) (Cons!28550 (h!29759 (_ BitVec 64)) (t!42085 List!28554)) )
))
(declare-fun arrayNoDuplicates!0 (array!83302 (_ BitVec 32) List!28554) Bool)

(assert (=> b!1272201 (= res!846297 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28551))))

(declare-fun b!1272202 () Bool)

(declare-fun res!846296 () Bool)

(assert (=> b!1272202 (=> (not res!846296) (not e!725588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83302 (_ BitVec 32)) Bool)

(assert (=> b!1272202 (= res!846296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!51121 () Bool)

(assert (=> mapIsEmpty!51121 mapRes!51121))

(declare-fun b!1272203 () Bool)

(assert (=> b!1272203 (= e!725592 (and e!725590 mapRes!51121))))

(declare-fun condMapEmpty!51121 () Bool)

(declare-fun mapDefault!51121 () ValueCell!15659)

