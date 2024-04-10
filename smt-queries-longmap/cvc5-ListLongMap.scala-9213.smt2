; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110626 () Bool)

(assert start!110626)

(declare-fun b_free!29461 () Bool)

(declare-fun b_next!29461 () Bool)

(assert (=> start!110626 (= b_free!29461 (not b_next!29461))))

(declare-fun tp!103705 () Bool)

(declare-fun b_and!47669 () Bool)

(assert (=> start!110626 (= tp!103705 b_and!47669)))

(declare-fun b!1308995 () Bool)

(declare-fun e!746821 () Bool)

(assert (=> b!1308995 (= e!746821 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87376 0))(
  ( (array!87377 (arr!42168 (Array (_ BitVec 32) (_ BitVec 64))) (size!42718 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87376)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52025 0))(
  ( (V!52026 (val!17670 Int)) )
))
(declare-fun minValue!1296 () V!52025)

(declare-datatypes ((ValueCell!16697 0))(
  ( (ValueCellFull!16697 (v!20297 V!52025)) (EmptyCell!16697) )
))
(declare-datatypes ((array!87378 0))(
  ( (array!87379 (arr!42169 (Array (_ BitVec 32) ValueCell!16697)) (size!42719 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87378)

(declare-fun zeroValue!1296 () V!52025)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585210 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22754 0))(
  ( (tuple2!22755 (_1!11388 (_ BitVec 64)) (_2!11388 V!52025)) )
))
(declare-datatypes ((List!29896 0))(
  ( (Nil!29893) (Cons!29892 (h!31101 tuple2!22754) (t!43502 List!29896)) )
))
(declare-datatypes ((ListLongMap!20411 0))(
  ( (ListLongMap!20412 (toList!10221 List!29896)) )
))
(declare-fun contains!8371 (ListLongMap!20411 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5234 (array!87376 array!87378 (_ BitVec 32) (_ BitVec 32) V!52025 V!52025 (_ BitVec 32) Int) ListLongMap!20411)

(assert (=> b!1308995 (= lt!585210 (contains!8371 (getCurrentListMap!5234 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54415 () Bool)

(declare-fun mapRes!54415 () Bool)

(declare-fun tp!103704 () Bool)

(declare-fun e!746819 () Bool)

(assert (=> mapNonEmpty!54415 (= mapRes!54415 (and tp!103704 e!746819))))

(declare-fun mapValue!54415 () ValueCell!16697)

(declare-fun mapRest!54415 () (Array (_ BitVec 32) ValueCell!16697))

(declare-fun mapKey!54415 () (_ BitVec 32))

(assert (=> mapNonEmpty!54415 (= (arr!42169 _values!1354) (store mapRest!54415 mapKey!54415 mapValue!54415))))

(declare-fun b!1308996 () Bool)

(declare-fun tp_is_empty!35191 () Bool)

(assert (=> b!1308996 (= e!746819 tp_is_empty!35191)))

(declare-fun b!1308997 () Bool)

(declare-fun e!746822 () Bool)

(assert (=> b!1308997 (= e!746822 tp_is_empty!35191)))

(declare-fun b!1308998 () Bool)

(declare-fun e!746818 () Bool)

(assert (=> b!1308998 (= e!746818 (and e!746822 mapRes!54415))))

(declare-fun condMapEmpty!54415 () Bool)

(declare-fun mapDefault!54415 () ValueCell!16697)

