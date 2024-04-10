; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99818 () Bool)

(assert start!99818)

(declare-fun b_free!25397 () Bool)

(declare-fun b_next!25397 () Bool)

(assert (=> start!99818 (= b_free!25397 (not b_next!25397))))

(declare-fun tp!88904 () Bool)

(declare-fun b_and!41661 () Bool)

(assert (=> start!99818 (= tp!88904 b_and!41661)))

(declare-fun b!1186593 () Bool)

(declare-fun res!788834 () Bool)

(declare-fun e!674686 () Bool)

(assert (=> b!1186593 (=> (not res!788834) (not e!674686))))

(declare-datatypes ((array!76649 0))(
  ( (array!76650 (arr!36974 (Array (_ BitVec 32) (_ BitVec 64))) (size!37510 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76649)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45029 0))(
  ( (V!45030 (val!15020 Int)) )
))
(declare-datatypes ((ValueCell!14254 0))(
  ( (ValueCellFull!14254 (v!17658 V!45029)) (EmptyCell!14254) )
))
(declare-datatypes ((array!76651 0))(
  ( (array!76652 (arr!36975 (Array (_ BitVec 32) ValueCell!14254)) (size!37511 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76651)

(assert (=> b!1186593 (= res!788834 (and (= (size!37511 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37510 _keys!1208) (size!37511 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186594 () Bool)

(declare-fun e!674682 () Bool)

(declare-fun tp_is_empty!29927 () Bool)

(assert (=> b!1186594 (= e!674682 tp_is_empty!29927)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1186595 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!674680 () Bool)

(declare-fun arrayContainsKey!0 (array!76649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186595 (= e!674680 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186596 () Bool)

(declare-fun e!674681 () Bool)

(assert (=> b!1186596 (= e!674681 tp_is_empty!29927)))

(declare-fun b!1186597 () Bool)

(declare-fun e!674683 () Bool)

(declare-fun mapRes!46718 () Bool)

(assert (=> b!1186597 (= e!674683 (and e!674681 mapRes!46718))))

(declare-fun condMapEmpty!46718 () Bool)

(declare-fun mapDefault!46718 () ValueCell!14254)

