; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98604 () Bool)

(assert start!98604)

(declare-fun b_free!24209 () Bool)

(declare-fun b_next!24209 () Bool)

(assert (=> start!98604 (= b_free!24209 (not b_next!24209))))

(declare-fun tp!85338 () Bool)

(declare-fun b_and!39267 () Bool)

(assert (=> start!98604 (= tp!85338 b_and!39267)))

(declare-fun b!1144626 () Bool)

(declare-fun res!762381 () Bool)

(declare-fun e!651113 () Bool)

(assert (=> b!1144626 (=> (not res!762381) (not e!651113))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144626 (= res!762381 (validKeyInArray!0 k!934))))

(declare-fun b!1144627 () Bool)

(declare-fun res!762370 () Bool)

(assert (=> b!1144627 (=> (not res!762370) (not e!651113))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144627 (= res!762370 (validMask!0 mask!1564))))

(declare-fun b!1144628 () Bool)

(declare-fun call!52052 () Bool)

(assert (=> b!1144628 call!52052))

(declare-datatypes ((Unit!37572 0))(
  ( (Unit!37573) )
))
(declare-fun lt!510783 () Unit!37572)

(declare-fun call!52051 () Unit!37572)

(assert (=> b!1144628 (= lt!510783 call!52051)))

(declare-fun e!651124 () Unit!37572)

(assert (=> b!1144628 (= e!651124 lt!510783)))

(declare-fun b!1144629 () Bool)

(declare-fun e!651114 () Bool)

(declare-fun e!651122 () Bool)

(declare-fun mapRes!44933 () Bool)

(assert (=> b!1144629 (= e!651114 (and e!651122 mapRes!44933))))

(declare-fun condMapEmpty!44933 () Bool)

(declare-datatypes ((V!43445 0))(
  ( (V!43446 (val!14426 Int)) )
))
(declare-datatypes ((ValueCell!13660 0))(
  ( (ValueCellFull!13660 (v!17063 V!43445)) (EmptyCell!13660) )
))
(declare-datatypes ((array!74331 0))(
  ( (array!74332 (arr!35816 (Array (_ BitVec 32) ValueCell!13660)) (size!36352 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74331)

(declare-fun mapDefault!44933 () ValueCell!13660)

