; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99734 () Bool)

(assert start!99734)

(declare-fun b_free!25313 () Bool)

(declare-fun b_next!25313 () Bool)

(assert (=> start!99734 (= b_free!25313 (not b_next!25313))))

(declare-fun tp!88652 () Bool)

(declare-fun b_and!41493 () Bool)

(assert (=> start!99734 (= tp!88652 b_and!41493)))

(declare-fun b!1183989 () Bool)

(declare-fun e!673172 () Bool)

(declare-fun e!673169 () Bool)

(assert (=> b!1183989 (= e!673172 e!673169)))

(declare-fun res!786949 () Bool)

(assert (=> b!1183989 (=> (not res!786949) (not e!673169))))

(declare-datatypes ((array!76487 0))(
  ( (array!76488 (arr!36893 (Array (_ BitVec 32) (_ BitVec 64))) (size!37429 (_ BitVec 32))) )
))
(declare-fun lt!536681 () array!76487)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76487 (_ BitVec 32)) Bool)

(assert (=> b!1183989 (= res!786949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536681 mask!1564))))

(declare-fun _keys!1208 () array!76487)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183989 (= lt!536681 (array!76488 (store (arr!36893 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37429 _keys!1208)))))

(declare-fun b!1183990 () Bool)

(declare-fun res!786955 () Bool)

(assert (=> b!1183990 (=> (not res!786955) (not e!673172))))

(assert (=> b!1183990 (= res!786955 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37429 _keys!1208))))))

(declare-fun b!1183991 () Bool)

(declare-fun e!673167 () Bool)

(declare-fun e!673170 () Bool)

(declare-fun mapRes!46592 () Bool)

(assert (=> b!1183991 (= e!673167 (and e!673170 mapRes!46592))))

(declare-fun condMapEmpty!46592 () Bool)

(declare-datatypes ((V!44917 0))(
  ( (V!44918 (val!14978 Int)) )
))
(declare-datatypes ((ValueCell!14212 0))(
  ( (ValueCellFull!14212 (v!17616 V!44917)) (EmptyCell!14212) )
))
(declare-datatypes ((array!76489 0))(
  ( (array!76490 (arr!36894 (Array (_ BitVec 32) ValueCell!14212)) (size!37430 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76489)

(declare-fun mapDefault!46592 () ValueCell!14212)

