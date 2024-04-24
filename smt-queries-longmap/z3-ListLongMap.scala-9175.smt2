; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110578 () Bool)

(assert start!110578)

(declare-fun mapIsEmpty!54058 () Bool)

(declare-fun mapRes!54058 () Bool)

(assert (=> mapIsEmpty!54058 mapRes!54058))

(declare-fun res!867657 () Bool)

(declare-fun e!745860 () Bool)

(assert (=> start!110578 (=> (not res!867657) (not e!745860))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110578 (= res!867657 (validMask!0 mask!2040))))

(assert (=> start!110578 e!745860))

(assert (=> start!110578 true))

(declare-datatypes ((V!51721 0))(
  ( (V!51722 (val!17556 Int)) )
))
(declare-datatypes ((ValueCell!16583 0))(
  ( (ValueCellFull!16583 (v!20177 V!51721)) (EmptyCell!16583) )
))
(declare-datatypes ((array!86991 0))(
  ( (array!86992 (arr!41976 (Array (_ BitVec 32) ValueCell!16583)) (size!42527 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86991)

(declare-fun e!745859 () Bool)

(declare-fun array_inv!31991 (array!86991) Bool)

(assert (=> start!110578 (and (array_inv!31991 _values!1354) e!745859)))

(declare-datatypes ((array!86993 0))(
  ( (array!86994 (arr!41977 (Array (_ BitVec 32) (_ BitVec 64))) (size!42528 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86993)

(declare-fun array_inv!31992 (array!86993) Bool)

(assert (=> start!110578 (array_inv!31992 _keys!1628)))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun b!1307379 () Bool)

(assert (=> b!1307379 (= e!745860 (and (= (size!42527 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42528 _keys!1628) (size!42527 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011) (not (= (size!42528 _keys!1628) (bvadd #b00000000000000000000000000000001 mask!2040)))))))

(declare-fun b!1307380 () Bool)

(declare-fun e!745858 () Bool)

(declare-fun tp_is_empty!34963 () Bool)

(assert (=> b!1307380 (= e!745858 tp_is_empty!34963)))

(declare-fun mapNonEmpty!54058 () Bool)

(declare-fun tp!103138 () Bool)

(assert (=> mapNonEmpty!54058 (= mapRes!54058 (and tp!103138 e!745858))))

(declare-fun mapKey!54058 () (_ BitVec 32))

(declare-fun mapRest!54058 () (Array (_ BitVec 32) ValueCell!16583))

(declare-fun mapValue!54058 () ValueCell!16583)

(assert (=> mapNonEmpty!54058 (= (arr!41976 _values!1354) (store mapRest!54058 mapKey!54058 mapValue!54058))))

(declare-fun b!1307381 () Bool)

(declare-fun e!745856 () Bool)

(assert (=> b!1307381 (= e!745856 tp_is_empty!34963)))

(declare-fun b!1307382 () Bool)

(assert (=> b!1307382 (= e!745859 (and e!745856 mapRes!54058))))

(declare-fun condMapEmpty!54058 () Bool)

(declare-fun mapDefault!54058 () ValueCell!16583)

(assert (=> b!1307382 (= condMapEmpty!54058 (= (arr!41976 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16583)) mapDefault!54058)))))

(assert (= (and start!110578 res!867657) b!1307379))

(assert (= (and b!1307382 condMapEmpty!54058) mapIsEmpty!54058))

(assert (= (and b!1307382 (not condMapEmpty!54058)) mapNonEmpty!54058))

(get-info :version)

(assert (= (and mapNonEmpty!54058 ((_ is ValueCellFull!16583) mapValue!54058)) b!1307380))

(assert (= (and b!1307382 ((_ is ValueCellFull!16583) mapDefault!54058)) b!1307381))

(assert (= start!110578 b!1307382))

(declare-fun m!1198855 () Bool)

(assert (=> start!110578 m!1198855))

(declare-fun m!1198857 () Bool)

(assert (=> start!110578 m!1198857))

(declare-fun m!1198859 () Bool)

(assert (=> start!110578 m!1198859))

(declare-fun m!1198861 () Bool)

(assert (=> mapNonEmpty!54058 m!1198861))

(check-sat (not start!110578) (not mapNonEmpty!54058) tp_is_empty!34963)
(check-sat)
