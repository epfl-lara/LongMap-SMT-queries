; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110354 () Bool)

(assert start!110354)

(declare-fun b!1306010 () Bool)

(declare-fun e!744983 () Bool)

(declare-fun tp_is_empty!34963 () Bool)

(assert (=> b!1306010 (= e!744983 tp_is_empty!34963)))

(declare-fun res!867110 () Bool)

(declare-fun e!744982 () Bool)

(assert (=> start!110354 (=> (not res!867110) (not e!744982))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110354 (= res!867110 (validMask!0 mask!2040))))

(assert (=> start!110354 e!744982))

(assert (=> start!110354 true))

(declare-datatypes ((V!51721 0))(
  ( (V!51722 (val!17556 Int)) )
))
(declare-datatypes ((ValueCell!16583 0))(
  ( (ValueCellFull!16583 (v!20181 V!51721)) (EmptyCell!16583) )
))
(declare-datatypes ((array!86851 0))(
  ( (array!86852 (arr!41911 (Array (_ BitVec 32) ValueCell!16583)) (size!42463 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86851)

(declare-fun e!744981 () Bool)

(declare-fun array_inv!31875 (array!86851) Bool)

(assert (=> start!110354 (and (array_inv!31875 _values!1354) e!744981)))

(declare-datatypes ((array!86853 0))(
  ( (array!86854 (arr!41912 (Array (_ BitVec 32) (_ BitVec 64))) (size!42464 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86853)

(declare-fun array_inv!31876 (array!86853) Bool)

(assert (=> start!110354 (array_inv!31876 _keys!1628)))

(declare-fun mapNonEmpty!54058 () Bool)

(declare-fun mapRes!54058 () Bool)

(declare-fun tp!103139 () Bool)

(assert (=> mapNonEmpty!54058 (= mapRes!54058 (and tp!103139 e!744983))))

(declare-fun mapKey!54058 () (_ BitVec 32))

(declare-fun mapRest!54058 () (Array (_ BitVec 32) ValueCell!16583))

(declare-fun mapValue!54058 () ValueCell!16583)

(assert (=> mapNonEmpty!54058 (= (arr!41911 _values!1354) (store mapRest!54058 mapKey!54058 mapValue!54058))))

(declare-fun mapIsEmpty!54058 () Bool)

(assert (=> mapIsEmpty!54058 mapRes!54058))

(declare-fun b!1306011 () Bool)

(declare-fun e!744980 () Bool)

(assert (=> b!1306011 (= e!744981 (and e!744980 mapRes!54058))))

(declare-fun condMapEmpty!54058 () Bool)

(declare-fun mapDefault!54058 () ValueCell!16583)

(assert (=> b!1306011 (= condMapEmpty!54058 (= (arr!41911 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16583)) mapDefault!54058)))))

(declare-fun b!1306012 () Bool)

(assert (=> b!1306012 (= e!744980 tp_is_empty!34963)))

(declare-fun b!1306013 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306013 (= e!744982 (and (= (size!42463 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42464 _keys!1628) (size!42463 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011) (not (= (size!42464 _keys!1628) (bvadd #b00000000000000000000000000000001 mask!2040)))))))

(assert (= (and start!110354 res!867110) b!1306013))

(assert (= (and b!1306011 condMapEmpty!54058) mapIsEmpty!54058))

(assert (= (and b!1306011 (not condMapEmpty!54058)) mapNonEmpty!54058))

(get-info :version)

(assert (= (and mapNonEmpty!54058 ((_ is ValueCellFull!16583) mapValue!54058)) b!1306010))

(assert (= (and b!1306011 ((_ is ValueCellFull!16583) mapDefault!54058)) b!1306012))

(assert (= start!110354 b!1306011))

(declare-fun m!1196741 () Bool)

(assert (=> start!110354 m!1196741))

(declare-fun m!1196743 () Bool)

(assert (=> start!110354 m!1196743))

(declare-fun m!1196745 () Bool)

(assert (=> start!110354 m!1196745))

(declare-fun m!1196747 () Bool)

(assert (=> mapNonEmpty!54058 m!1196747))

(check-sat (not start!110354) (not mapNonEmpty!54058) tp_is_empty!34963)
(check-sat)
