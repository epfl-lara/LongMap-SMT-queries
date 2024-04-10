; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108120 () Bool)

(assert start!108120)

(declare-fun b_free!27833 () Bool)

(declare-fun b_next!27833 () Bool)

(assert (=> start!108120 (= b_free!27833 (not b_next!27833))))

(declare-fun tp!98453 () Bool)

(declare-fun b_and!45889 () Bool)

(assert (=> start!108120 (= tp!98453 b_and!45889)))

(declare-fun b!1276817 () Bool)

(declare-fun e!729153 () Bool)

(declare-fun tp_is_empty!33383 () Bool)

(assert (=> b!1276817 (= e!729153 tp_is_empty!33383)))

(declare-fun b!1276818 () Bool)

(declare-fun res!848501 () Bool)

(declare-fun e!729152 () Bool)

(assert (=> b!1276818 (=> (not res!848501) (not e!729152))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83858 0))(
  ( (array!83859 (arr!40440 (Array (_ BitVec 32) (_ BitVec 64))) (size!40990 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83858)

(declare-datatypes ((V!49613 0))(
  ( (V!49614 (val!16766 Int)) )
))
(declare-datatypes ((ValueCell!15793 0))(
  ( (ValueCellFull!15793 (v!19363 V!49613)) (EmptyCell!15793) )
))
(declare-datatypes ((array!83860 0))(
  ( (array!83861 (arr!40441 (Array (_ BitVec 32) ValueCell!15793)) (size!40991 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83860)

(assert (=> b!1276818 (= res!848501 (and (= (size!40991 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40990 _keys!1427) (size!40991 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276819 () Bool)

(declare-fun res!848502 () Bool)

(assert (=> b!1276819 (=> (not res!848502) (not e!729152))))

(declare-datatypes ((List!28678 0))(
  ( (Nil!28675) (Cons!28674 (h!29883 (_ BitVec 64)) (t!42214 List!28678)) )
))
(declare-fun arrayNoDuplicates!0 (array!83858 (_ BitVec 32) List!28678) Bool)

(assert (=> b!1276819 (= res!848502 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28675))))

(declare-fun b!1276820 () Bool)

(declare-fun res!848500 () Bool)

(assert (=> b!1276820 (=> (not res!848500) (not e!729152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83858 (_ BitVec 32)) Bool)

(assert (=> b!1276820 (= res!848500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51605 () Bool)

(declare-fun mapRes!51605 () Bool)

(assert (=> mapIsEmpty!51605 mapRes!51605))

(declare-fun b!1276822 () Bool)

(declare-fun e!729156 () Bool)

(assert (=> b!1276822 (= e!729156 (and e!729153 mapRes!51605))))

(declare-fun condMapEmpty!51605 () Bool)

(declare-fun mapDefault!51605 () ValueCell!15793)

