; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107264 () Bool)

(assert start!107264)

(declare-fun mapNonEmpty!51010 () Bool)

(declare-fun mapRes!51010 () Bool)

(declare-fun tp!97351 () Bool)

(declare-fun e!724980 () Bool)

(assert (=> mapNonEmpty!51010 (= mapRes!51010 (and tp!97351 e!724980))))

(declare-datatypes ((V!49131 0))(
  ( (V!49132 (val!16551 Int)) )
))
(declare-datatypes ((ValueCell!15623 0))(
  ( (ValueCellFull!15623 (v!19188 V!49131)) (EmptyCell!15623) )
))
(declare-fun mapValue!51010 () ValueCell!15623)

(declare-fun mapRest!51010 () (Array (_ BitVec 32) ValueCell!15623))

(declare-fun mapKey!51010 () (_ BitVec 32))

(declare-datatypes ((array!83156 0))(
  ( (array!83157 (arr!40115 (Array (_ BitVec 32) ValueCell!15623)) (size!40651 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83156)

(assert (=> mapNonEmpty!51010 (= (arr!40115 _values!1134) (store mapRest!51010 mapKey!51010 mapValue!51010))))

(declare-fun b!1271399 () Bool)

(declare-fun e!724982 () Bool)

(assert (=> b!1271399 (= e!724982 false)))

(declare-fun lt!574866 () Bool)

(declare-datatypes ((array!83158 0))(
  ( (array!83159 (arr!40116 (Array (_ BitVec 32) (_ BitVec 64))) (size!40652 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83158)

(declare-datatypes ((List!28523 0))(
  ( (Nil!28520) (Cons!28519 (h!29728 (_ BitVec 64)) (t!42052 List!28523)) )
))
(declare-fun arrayNoDuplicates!0 (array!83158 (_ BitVec 32) List!28523) Bool)

(assert (=> b!1271399 (= lt!574866 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28520))))

(declare-fun b!1271400 () Bool)

(declare-fun res!845893 () Bool)

(assert (=> b!1271400 (=> (not res!845893) (not e!724982))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83158 (_ BitVec 32)) Bool)

(assert (=> b!1271400 (= res!845893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271401 () Bool)

(declare-fun tp_is_empty!32953 () Bool)

(assert (=> b!1271401 (= e!724980 tp_is_empty!32953)))

(declare-fun b!1271402 () Bool)

(declare-fun e!724979 () Bool)

(assert (=> b!1271402 (= e!724979 tp_is_empty!32953)))

(declare-fun b!1271403 () Bool)

(declare-fun e!724983 () Bool)

(assert (=> b!1271403 (= e!724983 (and e!724979 mapRes!51010))))

(declare-fun condMapEmpty!51010 () Bool)

(declare-fun mapDefault!51010 () ValueCell!15623)

