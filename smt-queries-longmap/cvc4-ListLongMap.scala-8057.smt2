; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99186 () Bool)

(assert start!99186)

(declare-fun b_free!24791 () Bool)

(declare-fun b_next!24791 () Bool)

(assert (=> start!99186 (= b_free!24791 (not b_next!24791))))

(declare-fun tp!87083 () Bool)

(declare-fun b_and!40431 () Bool)

(assert (=> start!99186 (= tp!87083 b_and!40431)))

(declare-fun b!1167642 () Bool)

(declare-fun e!663652 () Bool)

(declare-fun tp_is_empty!29321 () Bool)

(assert (=> b!1167642 (= e!663652 tp_is_empty!29321)))

(declare-fun mapIsEmpty!45806 () Bool)

(declare-fun mapRes!45806 () Bool)

(assert (=> mapIsEmpty!45806 mapRes!45806))

(declare-fun b!1167644 () Bool)

(declare-fun e!663657 () Bool)

(declare-fun e!663650 () Bool)

(assert (=> b!1167644 (= e!663657 (and e!663650 mapRes!45806))))

(declare-fun condMapEmpty!45806 () Bool)

(declare-datatypes ((V!44221 0))(
  ( (V!44222 (val!14717 Int)) )
))
(declare-datatypes ((ValueCell!13951 0))(
  ( (ValueCellFull!13951 (v!17354 V!44221)) (EmptyCell!13951) )
))
(declare-datatypes ((array!75467 0))(
  ( (array!75468 (arr!36384 (Array (_ BitVec 32) ValueCell!13951)) (size!36920 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75467)

(declare-fun mapDefault!45806 () ValueCell!13951)

