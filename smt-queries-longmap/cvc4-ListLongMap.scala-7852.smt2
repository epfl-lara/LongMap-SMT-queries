; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97860 () Bool)

(assert start!97860)

(declare-fun b_free!23561 () Bool)

(declare-fun b_next!23561 () Bool)

(assert (=> start!97860 (= b_free!23561 (not b_next!23561))))

(declare-fun tp!83386 () Bool)

(declare-fun b_and!37905 () Bool)

(assert (=> start!97860 (= tp!83386 b_and!37905)))

(declare-fun b!1120266 () Bool)

(declare-fun e!637927 () Bool)

(declare-fun e!637929 () Bool)

(assert (=> b!1120266 (= e!637927 e!637929)))

(declare-fun res!748378 () Bool)

(assert (=> b!1120266 (=> (not res!748378) (not e!637929))))

(declare-datatypes ((array!73063 0))(
  ( (array!73064 (arr!35184 (Array (_ BitVec 32) (_ BitVec 64))) (size!35720 (_ BitVec 32))) )
))
(declare-fun lt!497981 () array!73063)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73063 (_ BitVec 32)) Bool)

(assert (=> b!1120266 (= res!748378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497981 mask!1564))))

(declare-fun _keys!1208 () array!73063)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120266 (= lt!497981 (array!73064 (store (arr!35184 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35720 _keys!1208)))))

(declare-fun b!1120267 () Bool)

(declare-fun e!637926 () Bool)

(declare-fun e!637928 () Bool)

(declare-fun mapRes!43954 () Bool)

(assert (=> b!1120267 (= e!637926 (and e!637928 mapRes!43954))))

(declare-fun condMapEmpty!43954 () Bool)

(declare-datatypes ((V!42581 0))(
  ( (V!42582 (val!14102 Int)) )
))
(declare-datatypes ((ValueCell!13336 0))(
  ( (ValueCellFull!13336 (v!16735 V!42581)) (EmptyCell!13336) )
))
(declare-datatypes ((array!73065 0))(
  ( (array!73066 (arr!35185 (Array (_ BitVec 32) ValueCell!13336)) (size!35721 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73065)

(declare-fun mapDefault!43954 () ValueCell!13336)

