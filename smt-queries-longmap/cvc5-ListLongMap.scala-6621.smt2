; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83698 () Bool)

(assert start!83698)

(declare-fun b!977392 () Bool)

(declare-fun res!654156 () Bool)

(declare-fun e!550982 () Bool)

(assert (=> b!977392 (=> (not res!654156) (not e!550982))))

(declare-datatypes ((array!61037 0))(
  ( (array!61038 (arr!29376 (Array (_ BitVec 32) (_ BitVec 64))) (size!29855 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61037)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61037 (_ BitVec 32)) Bool)

(assert (=> b!977392 (= res!654156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977393 () Bool)

(declare-fun e!550985 () Bool)

(declare-fun tp_is_empty!22501 () Bool)

(assert (=> b!977393 (= e!550985 tp_is_empty!22501)))

(declare-fun b!977394 () Bool)

(declare-fun res!654157 () Bool)

(assert (=> b!977394 (=> (not res!654157) (not e!550982))))

(declare-datatypes ((V!34985 0))(
  ( (V!34986 (val!11301 Int)) )
))
(declare-datatypes ((ValueCell!10769 0))(
  ( (ValueCellFull!10769 (v!13863 V!34985)) (EmptyCell!10769) )
))
(declare-datatypes ((array!61039 0))(
  ( (array!61040 (arr!29377 (Array (_ BitVec 32) ValueCell!10769)) (size!29856 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61039)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977394 (= res!654157 (and (= (size!29856 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29855 _keys!1544) (size!29856 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35780 () Bool)

(declare-fun mapRes!35780 () Bool)

(assert (=> mapIsEmpty!35780 mapRes!35780))

(declare-fun b!977395 () Bool)

(assert (=> b!977395 (= e!550982 false)))

(declare-fun lt!433460 () Bool)

(declare-datatypes ((List!20374 0))(
  ( (Nil!20371) (Cons!20370 (h!21532 (_ BitVec 64)) (t!28889 List!20374)) )
))
(declare-fun arrayNoDuplicates!0 (array!61037 (_ BitVec 32) List!20374) Bool)

(assert (=> b!977395 (= lt!433460 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20371))))

(declare-fun b!977396 () Bool)

(declare-fun e!550984 () Bool)

(assert (=> b!977396 (= e!550984 tp_is_empty!22501)))

(declare-fun mapNonEmpty!35780 () Bool)

(declare-fun tp!68032 () Bool)

(assert (=> mapNonEmpty!35780 (= mapRes!35780 (and tp!68032 e!550985))))

(declare-fun mapKey!35780 () (_ BitVec 32))

(declare-fun mapRest!35780 () (Array (_ BitVec 32) ValueCell!10769))

(declare-fun mapValue!35780 () ValueCell!10769)

(assert (=> mapNonEmpty!35780 (= (arr!29377 _values!1278) (store mapRest!35780 mapKey!35780 mapValue!35780))))

(declare-fun res!654158 () Bool)

(assert (=> start!83698 (=> (not res!654158) (not e!550982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83698 (= res!654158 (validMask!0 mask!1948))))

(assert (=> start!83698 e!550982))

(assert (=> start!83698 true))

(declare-fun e!550986 () Bool)

(declare-fun array_inv!22711 (array!61039) Bool)

(assert (=> start!83698 (and (array_inv!22711 _values!1278) e!550986)))

(declare-fun array_inv!22712 (array!61037) Bool)

(assert (=> start!83698 (array_inv!22712 _keys!1544)))

(declare-fun b!977397 () Bool)

(assert (=> b!977397 (= e!550986 (and e!550984 mapRes!35780))))

(declare-fun condMapEmpty!35780 () Bool)

(declare-fun mapDefault!35780 () ValueCell!10769)

