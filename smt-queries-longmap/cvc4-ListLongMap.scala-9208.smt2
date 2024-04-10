; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110600 () Bool)

(assert start!110600)

(declare-fun b_free!29435 () Bool)

(declare-fun b_next!29435 () Bool)

(assert (=> start!110600 (= b_free!29435 (not b_next!29435))))

(declare-fun tp!103627 () Bool)

(declare-fun b_and!47643 () Bool)

(assert (=> start!110600 (= tp!103627 b_and!47643)))

(declare-fun b!1308607 () Bool)

(declare-fun res!868693 () Bool)

(declare-fun e!746623 () Bool)

(assert (=> b!1308607 (=> (not res!868693) (not e!746623))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308607 (= res!868693 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308608 () Bool)

(declare-fun res!868696 () Bool)

(assert (=> b!1308608 (=> (not res!868696) (not e!746623))))

(declare-datatypes ((array!87328 0))(
  ( (array!87329 (arr!42144 (Array (_ BitVec 32) (_ BitVec 64))) (size!42694 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87328)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87328 (_ BitVec 32)) Bool)

(assert (=> b!1308608 (= res!868696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308609 () Bool)

(assert (=> b!1308609 (= e!746623 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!51989 0))(
  ( (V!51990 (val!17657 Int)) )
))
(declare-fun minValue!1296 () V!51989)

(declare-datatypes ((ValueCell!16684 0))(
  ( (ValueCellFull!16684 (v!20284 V!51989)) (EmptyCell!16684) )
))
(declare-datatypes ((array!87330 0))(
  ( (array!87331 (arr!42145 (Array (_ BitVec 32) ValueCell!16684)) (size!42695 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87330)

(declare-fun zeroValue!1296 () V!51989)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22736 0))(
  ( (tuple2!22737 (_1!11379 (_ BitVec 64)) (_2!11379 V!51989)) )
))
(declare-datatypes ((List!29877 0))(
  ( (Nil!29874) (Cons!29873 (h!31082 tuple2!22736) (t!43483 List!29877)) )
))
(declare-datatypes ((ListLongMap!20393 0))(
  ( (ListLongMap!20394 (toList!10212 List!29877)) )
))
(declare-fun contains!8362 (ListLongMap!20393 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5225 (array!87328 array!87330 (_ BitVec 32) (_ BitVec 32) V!51989 V!51989 (_ BitVec 32) Int) ListLongMap!20393)

(assert (=> b!1308609 (contains!8362 (getCurrentListMap!5225 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43302 0))(
  ( (Unit!43303) )
))
(declare-fun lt!585171 () Unit!43302)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!15 (array!87328 array!87330 (_ BitVec 32) (_ BitVec 32) V!51989 V!51989 (_ BitVec 64) (_ BitVec 32) Int) Unit!43302)

(assert (=> b!1308609 (= lt!585171 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!15 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308610 () Bool)

(declare-fun res!868694 () Bool)

(assert (=> b!1308610 (=> (not res!868694) (not e!746623))))

(assert (=> b!1308610 (= res!868694 (and (= (size!42695 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42694 _keys!1628) (size!42695 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308611 () Bool)

(declare-fun e!746627 () Bool)

(declare-fun tp_is_empty!35165 () Bool)

(assert (=> b!1308611 (= e!746627 tp_is_empty!35165)))

(declare-fun b!1308612 () Bool)

(declare-fun res!868695 () Bool)

(assert (=> b!1308612 (=> (not res!868695) (not e!746623))))

(assert (=> b!1308612 (= res!868695 (contains!8362 (getCurrentListMap!5225 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!868701 () Bool)

(assert (=> start!110600 (=> (not res!868701) (not e!746623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110600 (= res!868701 (validMask!0 mask!2040))))

(assert (=> start!110600 e!746623))

(assert (=> start!110600 tp!103627))

(declare-fun array_inv!31855 (array!87328) Bool)

(assert (=> start!110600 (array_inv!31855 _keys!1628)))

(assert (=> start!110600 true))

(assert (=> start!110600 tp_is_empty!35165))

(declare-fun e!746626 () Bool)

(declare-fun array_inv!31856 (array!87330) Bool)

(assert (=> start!110600 (and (array_inv!31856 _values!1354) e!746626)))

(declare-fun b!1308613 () Bool)

(declare-fun res!868700 () Bool)

(assert (=> b!1308613 (=> (not res!868700) (not e!746623))))

(assert (=> b!1308613 (= res!868700 (not (= (select (arr!42144 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1308614 () Bool)

(declare-fun e!746625 () Bool)

(declare-fun mapRes!54376 () Bool)

(assert (=> b!1308614 (= e!746626 (and e!746625 mapRes!54376))))

(declare-fun condMapEmpty!54376 () Bool)

(declare-fun mapDefault!54376 () ValueCell!16684)

