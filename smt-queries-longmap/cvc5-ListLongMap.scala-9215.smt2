; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110638 () Bool)

(assert start!110638)

(declare-fun b_free!29473 () Bool)

(declare-fun b_next!29473 () Bool)

(assert (=> start!110638 (= b_free!29473 (not b_next!29473))))

(declare-fun tp!103740 () Bool)

(declare-fun b_and!47681 () Bool)

(assert (=> start!110638 (= tp!103740 b_and!47681)))

(declare-fun res!869054 () Bool)

(declare-fun e!746908 () Bool)

(assert (=> start!110638 (=> (not res!869054) (not e!746908))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110638 (= res!869054 (validMask!0 mask!2040))))

(assert (=> start!110638 e!746908))

(assert (=> start!110638 tp!103740))

(declare-datatypes ((array!87400 0))(
  ( (array!87401 (arr!42180 (Array (_ BitVec 32) (_ BitVec 64))) (size!42730 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87400)

(declare-fun array_inv!31879 (array!87400) Bool)

(assert (=> start!110638 (array_inv!31879 _keys!1628)))

(assert (=> start!110638 true))

(declare-fun tp_is_empty!35203 () Bool)

(assert (=> start!110638 tp_is_empty!35203))

(declare-datatypes ((V!52041 0))(
  ( (V!52042 (val!17676 Int)) )
))
(declare-datatypes ((ValueCell!16703 0))(
  ( (ValueCellFull!16703 (v!20303 V!52041)) (EmptyCell!16703) )
))
(declare-datatypes ((array!87402 0))(
  ( (array!87403 (arr!42181 (Array (_ BitVec 32) ValueCell!16703)) (size!42731 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87402)

(declare-fun e!746909 () Bool)

(declare-fun array_inv!31880 (array!87402) Bool)

(assert (=> start!110638 (and (array_inv!31880 _values!1354) e!746909)))

(declare-fun b!1309139 () Bool)

(declare-fun res!869057 () Bool)

(assert (=> b!1309139 (=> (not res!869057) (not e!746908))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309139 (= res!869057 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42730 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309140 () Bool)

(declare-fun e!746911 () Bool)

(assert (=> b!1309140 (= e!746911 tp_is_empty!35203)))

(declare-fun b!1309141 () Bool)

(declare-fun res!869058 () Bool)

(assert (=> b!1309141 (=> (not res!869058) (not e!746908))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309141 (= res!869058 (and (= (size!42731 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42730 _keys!1628) (size!42731 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309142 () Bool)

(declare-fun e!746912 () Bool)

(assert (=> b!1309142 (= e!746912 tp_is_empty!35203)))

(declare-fun mapNonEmpty!54433 () Bool)

(declare-fun mapRes!54433 () Bool)

(declare-fun tp!103741 () Bool)

(assert (=> mapNonEmpty!54433 (= mapRes!54433 (and tp!103741 e!746911))))

(declare-fun mapValue!54433 () ValueCell!16703)

(declare-fun mapRest!54433 () (Array (_ BitVec 32) ValueCell!16703))

(declare-fun mapKey!54433 () (_ BitVec 32))

(assert (=> mapNonEmpty!54433 (= (arr!42181 _values!1354) (store mapRest!54433 mapKey!54433 mapValue!54433))))

(declare-fun b!1309143 () Bool)

(declare-fun res!869055 () Bool)

(assert (=> b!1309143 (=> (not res!869055) (not e!746908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87400 (_ BitVec 32)) Bool)

(assert (=> b!1309143 (= res!869055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309144 () Bool)

(assert (=> b!1309144 (= e!746909 (and e!746912 mapRes!54433))))

(declare-fun condMapEmpty!54433 () Bool)

(declare-fun mapDefault!54433 () ValueCell!16703)

