; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108044 () Bool)

(assert start!108044)

(declare-fun b!1276090 () Bool)

(declare-fun res!848090 () Bool)

(declare-fun e!728633 () Bool)

(assert (=> b!1276090 (=> (not res!848090) (not e!728633))))

(declare-datatypes ((array!83728 0))(
  ( (array!83729 (arr!40376 (Array (_ BitVec 32) (_ BitVec 64))) (size!40926 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83728)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83728 (_ BitVec 32)) Bool)

(assert (=> b!1276090 (= res!848090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276091 () Bool)

(assert (=> b!1276091 (= e!728633 false)))

(declare-fun lt!575443 () Bool)

(declare-datatypes ((List!28635 0))(
  ( (Nil!28632) (Cons!28631 (h!29840 (_ BitVec 64)) (t!42171 List!28635)) )
))
(declare-fun arrayNoDuplicates!0 (array!83728 (_ BitVec 32) List!28635) Bool)

(assert (=> b!1276091 (= lt!575443 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28632))))

(declare-fun mapNonEmpty!51503 () Bool)

(declare-fun mapRes!51503 () Bool)

(declare-fun tp!98261 () Bool)

(declare-fun e!728630 () Bool)

(assert (=> mapNonEmpty!51503 (= mapRes!51503 (and tp!98261 e!728630))))

(declare-datatypes ((V!49525 0))(
  ( (V!49526 (val!16733 Int)) )
))
(declare-datatypes ((ValueCell!15760 0))(
  ( (ValueCellFull!15760 (v!19330 V!49525)) (EmptyCell!15760) )
))
(declare-fun mapRest!51503 () (Array (_ BitVec 32) ValueCell!15760))

(declare-datatypes ((array!83730 0))(
  ( (array!83731 (arr!40377 (Array (_ BitVec 32) ValueCell!15760)) (size!40927 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83730)

(declare-fun mapKey!51503 () (_ BitVec 32))

(declare-fun mapValue!51503 () ValueCell!15760)

(assert (=> mapNonEmpty!51503 (= (arr!40377 _values!1187) (store mapRest!51503 mapKey!51503 mapValue!51503))))

(declare-fun b!1276092 () Bool)

(declare-fun tp_is_empty!33317 () Bool)

(assert (=> b!1276092 (= e!728630 tp_is_empty!33317)))

(declare-fun mapIsEmpty!51503 () Bool)

(assert (=> mapIsEmpty!51503 mapRes!51503))

(declare-fun res!848091 () Bool)

(assert (=> start!108044 (=> (not res!848091) (not e!728633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108044 (= res!848091 (validMask!0 mask!1805))))

(assert (=> start!108044 e!728633))

(assert (=> start!108044 true))

(declare-fun e!728634 () Bool)

(declare-fun array_inv!30687 (array!83730) Bool)

(assert (=> start!108044 (and (array_inv!30687 _values!1187) e!728634)))

(declare-fun array_inv!30688 (array!83728) Bool)

(assert (=> start!108044 (array_inv!30688 _keys!1427)))

(declare-fun b!1276093 () Bool)

(declare-fun res!848089 () Bool)

(assert (=> b!1276093 (=> (not res!848089) (not e!728633))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276093 (= res!848089 (and (= (size!40927 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40926 _keys!1427) (size!40927 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276094 () Bool)

(declare-fun e!728631 () Bool)

(assert (=> b!1276094 (= e!728634 (and e!728631 mapRes!51503))))

(declare-fun condMapEmpty!51503 () Bool)

(declare-fun mapDefault!51503 () ValueCell!15760)

