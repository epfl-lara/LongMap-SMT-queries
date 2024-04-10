; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110756 () Bool)

(assert start!110756)

(declare-fun b_free!29591 () Bool)

(declare-fun b_next!29591 () Bool)

(assert (=> start!110756 (= b_free!29591 (not b_next!29591))))

(declare-fun tp!104094 () Bool)

(declare-fun b_and!47799 () Bool)

(assert (=> start!110756 (= tp!104094 b_and!47799)))

(declare-fun b!1310879 () Bool)

(declare-fun res!870264 () Bool)

(declare-fun e!747794 () Bool)

(assert (=> b!1310879 (=> (not res!870264) (not e!747794))))

(declare-datatypes ((array!87630 0))(
  ( (array!87631 (arr!42295 (Array (_ BitVec 32) (_ BitVec 64))) (size!42845 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87630)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87630 (_ BitVec 32)) Bool)

(assert (=> b!1310879 (= res!870264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54610 () Bool)

(declare-fun mapRes!54610 () Bool)

(declare-fun tp!104095 () Bool)

(declare-fun e!747795 () Bool)

(assert (=> mapNonEmpty!54610 (= mapRes!54610 (and tp!104095 e!747795))))

(declare-fun mapKey!54610 () (_ BitVec 32))

(declare-datatypes ((V!52197 0))(
  ( (V!52198 (val!17735 Int)) )
))
(declare-datatypes ((ValueCell!16762 0))(
  ( (ValueCellFull!16762 (v!20362 V!52197)) (EmptyCell!16762) )
))
(declare-fun mapValue!54610 () ValueCell!16762)

(declare-datatypes ((array!87632 0))(
  ( (array!87633 (arr!42296 (Array (_ BitVec 32) ValueCell!16762)) (size!42846 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87632)

(declare-fun mapRest!54610 () (Array (_ BitVec 32) ValueCell!16762))

(assert (=> mapNonEmpty!54610 (= (arr!42296 _values!1354) (store mapRest!54610 mapKey!54610 mapValue!54610))))

(declare-fun mapIsEmpty!54610 () Bool)

(assert (=> mapIsEmpty!54610 mapRes!54610))

(declare-fun b!1310881 () Bool)

(assert (=> b!1310881 (= e!747794 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun lt!585405 () Bool)

(declare-fun minValue!1296 () V!52197)

(declare-fun zeroValue!1296 () V!52197)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22856 0))(
  ( (tuple2!22857 (_1!11439 (_ BitVec 64)) (_2!11439 V!52197)) )
))
(declare-datatypes ((List!29996 0))(
  ( (Nil!29993) (Cons!29992 (h!31201 tuple2!22856) (t!43602 List!29996)) )
))
(declare-datatypes ((ListLongMap!20513 0))(
  ( (ListLongMap!20514 (toList!10272 List!29996)) )
))
(declare-fun contains!8422 (ListLongMap!20513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5285 (array!87630 array!87632 (_ BitVec 32) (_ BitVec 32) V!52197 V!52197 (_ BitVec 32) Int) ListLongMap!20513)

(assert (=> b!1310881 (= lt!585405 (contains!8422 (getCurrentListMap!5285 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310882 () Bool)

(declare-fun e!747797 () Bool)

(declare-fun tp_is_empty!35321 () Bool)

(assert (=> b!1310882 (= e!747797 tp_is_empty!35321)))

(declare-fun b!1310883 () Bool)

(declare-fun e!747793 () Bool)

(assert (=> b!1310883 (= e!747793 (and e!747797 mapRes!54610))))

(declare-fun condMapEmpty!54610 () Bool)

(declare-fun mapDefault!54610 () ValueCell!16762)

