; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110782 () Bool)

(assert start!110782)

(declare-fun b_free!29617 () Bool)

(declare-fun b_next!29617 () Bool)

(assert (=> start!110782 (= b_free!29617 (not b_next!29617))))

(declare-fun tp!104173 () Bool)

(declare-fun b_and!47825 () Bool)

(assert (=> start!110782 (= tp!104173 b_and!47825)))

(declare-fun mapIsEmpty!54649 () Bool)

(declare-fun mapRes!54649 () Bool)

(assert (=> mapIsEmpty!54649 mapRes!54649))

(declare-fun b!1311191 () Bool)

(declare-fun res!870460 () Bool)

(declare-fun e!747990 () Bool)

(assert (=> b!1311191 (=> (not res!870460) (not e!747990))))

(declare-datatypes ((array!87682 0))(
  ( (array!87683 (arr!42321 (Array (_ BitVec 32) (_ BitVec 64))) (size!42871 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87682)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87682 (_ BitVec 32)) Bool)

(assert (=> b!1311191 (= res!870460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54649 () Bool)

(declare-fun tp!104172 () Bool)

(declare-fun e!747989 () Bool)

(assert (=> mapNonEmpty!54649 (= mapRes!54649 (and tp!104172 e!747989))))

(declare-datatypes ((V!52233 0))(
  ( (V!52234 (val!17748 Int)) )
))
(declare-datatypes ((ValueCell!16775 0))(
  ( (ValueCellFull!16775 (v!20375 V!52233)) (EmptyCell!16775) )
))
(declare-fun mapRest!54649 () (Array (_ BitVec 32) ValueCell!16775))

(declare-fun mapValue!54649 () ValueCell!16775)

(declare-datatypes ((array!87684 0))(
  ( (array!87685 (arr!42322 (Array (_ BitVec 32) ValueCell!16775)) (size!42872 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87684)

(declare-fun mapKey!54649 () (_ BitVec 32))

(assert (=> mapNonEmpty!54649 (= (arr!42322 _values!1354) (store mapRest!54649 mapKey!54649 mapValue!54649))))

(declare-fun res!870461 () Bool)

(assert (=> start!110782 (=> (not res!870461) (not e!747990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110782 (= res!870461 (validMask!0 mask!2040))))

(assert (=> start!110782 e!747990))

(assert (=> start!110782 tp!104173))

(declare-fun array_inv!31979 (array!87682) Bool)

(assert (=> start!110782 (array_inv!31979 _keys!1628)))

(assert (=> start!110782 true))

(declare-fun tp_is_empty!35347 () Bool)

(assert (=> start!110782 tp_is_empty!35347))

(declare-fun e!747992 () Bool)

(declare-fun array_inv!31980 (array!87684) Bool)

(assert (=> start!110782 (and (array_inv!31980 _values!1354) e!747992)))

(declare-fun b!1311192 () Bool)

(declare-fun e!747991 () Bool)

(assert (=> b!1311192 (= e!747991 tp_is_empty!35347)))

(declare-fun b!1311193 () Bool)

(declare-fun res!870462 () Bool)

(assert (=> b!1311193 (=> (not res!870462) (not e!747990))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311193 (= res!870462 (and (= (size!42872 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42871 _keys!1628) (size!42872 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311194 () Bool)

(declare-fun res!870459 () Bool)

(assert (=> b!1311194 (=> (not res!870459) (not e!747990))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311194 (= res!870459 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42871 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311195 () Bool)

(assert (=> b!1311195 (= e!747990 false)))

(declare-fun minValue!1296 () V!52233)

(declare-fun zeroValue!1296 () V!52233)

(declare-fun lt!585444 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22870 0))(
  ( (tuple2!22871 (_1!11446 (_ BitVec 64)) (_2!11446 V!52233)) )
))
(declare-datatypes ((List!30012 0))(
  ( (Nil!30009) (Cons!30008 (h!31217 tuple2!22870) (t!43618 List!30012)) )
))
(declare-datatypes ((ListLongMap!20527 0))(
  ( (ListLongMap!20528 (toList!10279 List!30012)) )
))
(declare-fun contains!8429 (ListLongMap!20527 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5292 (array!87682 array!87684 (_ BitVec 32) (_ BitVec 32) V!52233 V!52233 (_ BitVec 32) Int) ListLongMap!20527)

(assert (=> b!1311195 (= lt!585444 (contains!8429 (getCurrentListMap!5292 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1311196 () Bool)

(assert (=> b!1311196 (= e!747992 (and e!747991 mapRes!54649))))

(declare-fun condMapEmpty!54649 () Bool)

(declare-fun mapDefault!54649 () ValueCell!16775)

