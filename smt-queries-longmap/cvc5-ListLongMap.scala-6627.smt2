; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83734 () Bool)

(assert start!83734)

(declare-fun res!654319 () Bool)

(declare-fun e!551252 () Bool)

(assert (=> start!83734 (=> (not res!654319) (not e!551252))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83734 (= res!654319 (validMask!0 mask!1948))))

(assert (=> start!83734 e!551252))

(assert (=> start!83734 true))

(declare-datatypes ((V!35033 0))(
  ( (V!35034 (val!11319 Int)) )
))
(declare-datatypes ((ValueCell!10787 0))(
  ( (ValueCellFull!10787 (v!13881 V!35033)) (EmptyCell!10787) )
))
(declare-datatypes ((array!61101 0))(
  ( (array!61102 (arr!29408 (Array (_ BitVec 32) ValueCell!10787)) (size!29887 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61101)

(declare-fun e!551254 () Bool)

(declare-fun array_inv!22735 (array!61101) Bool)

(assert (=> start!83734 (and (array_inv!22735 _values!1278) e!551254)))

(declare-datatypes ((array!61103 0))(
  ( (array!61104 (arr!29409 (Array (_ BitVec 32) (_ BitVec 64))) (size!29888 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61103)

(declare-fun array_inv!22736 (array!61103) Bool)

(assert (=> start!83734 (array_inv!22736 _keys!1544)))

(declare-fun mapIsEmpty!35834 () Bool)

(declare-fun mapRes!35834 () Bool)

(assert (=> mapIsEmpty!35834 mapRes!35834))

(declare-fun b!977716 () Bool)

(declare-fun e!551255 () Bool)

(declare-fun tp_is_empty!22537 () Bool)

(assert (=> b!977716 (= e!551255 tp_is_empty!22537)))

(declare-fun b!977717 () Bool)

(assert (=> b!977717 (= e!551252 false)))

(declare-fun lt!433514 () Bool)

(declare-datatypes ((List!20385 0))(
  ( (Nil!20382) (Cons!20381 (h!21543 (_ BitVec 64)) (t!28900 List!20385)) )
))
(declare-fun arrayNoDuplicates!0 (array!61103 (_ BitVec 32) List!20385) Bool)

(assert (=> b!977717 (= lt!433514 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20382))))

(declare-fun b!977718 () Bool)

(declare-fun res!654320 () Bool)

(assert (=> b!977718 (=> (not res!654320) (not e!551252))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977718 (= res!654320 (and (= (size!29887 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29888 _keys!1544) (size!29887 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977719 () Bool)

(declare-fun e!551253 () Bool)

(assert (=> b!977719 (= e!551253 tp_is_empty!22537)))

(declare-fun mapNonEmpty!35834 () Bool)

(declare-fun tp!68086 () Bool)

(assert (=> mapNonEmpty!35834 (= mapRes!35834 (and tp!68086 e!551253))))

(declare-fun mapValue!35834 () ValueCell!10787)

(declare-fun mapKey!35834 () (_ BitVec 32))

(declare-fun mapRest!35834 () (Array (_ BitVec 32) ValueCell!10787))

(assert (=> mapNonEmpty!35834 (= (arr!29408 _values!1278) (store mapRest!35834 mapKey!35834 mapValue!35834))))

(declare-fun b!977720 () Bool)

(declare-fun res!654318 () Bool)

(assert (=> b!977720 (=> (not res!654318) (not e!551252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61103 (_ BitVec 32)) Bool)

(assert (=> b!977720 (= res!654318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977721 () Bool)

(assert (=> b!977721 (= e!551254 (and e!551255 mapRes!35834))))

(declare-fun condMapEmpty!35834 () Bool)

(declare-fun mapDefault!35834 () ValueCell!10787)

