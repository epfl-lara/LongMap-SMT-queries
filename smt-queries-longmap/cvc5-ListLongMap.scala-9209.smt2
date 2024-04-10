; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110602 () Bool)

(assert start!110602)

(declare-fun b_free!29437 () Bool)

(declare-fun b_next!29437 () Bool)

(assert (=> start!110602 (= b_free!29437 (not b_next!29437))))

(declare-fun tp!103633 () Bool)

(declare-fun b_and!47645 () Bool)

(assert (=> start!110602 (= tp!103633 b_and!47645)))

(declare-fun b!1308643 () Bool)

(declare-fun e!746641 () Bool)

(declare-fun tp_is_empty!35167 () Bool)

(assert (=> b!1308643 (= e!746641 tp_is_empty!35167)))

(declare-fun b!1308645 () Bool)

(declare-fun res!868723 () Bool)

(declare-fun e!746642 () Bool)

(assert (=> b!1308645 (=> (not res!868723) (not e!746642))))

(declare-datatypes ((array!87332 0))(
  ( (array!87333 (arr!42146 (Array (_ BitVec 32) (_ BitVec 64))) (size!42696 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87332)

(declare-datatypes ((List!29878 0))(
  ( (Nil!29875) (Cons!29874 (h!31083 (_ BitVec 64)) (t!43484 List!29878)) )
))
(declare-fun arrayNoDuplicates!0 (array!87332 (_ BitVec 32) List!29878) Bool)

(assert (=> b!1308645 (= res!868723 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29875))))

(declare-fun b!1308646 () Bool)

(declare-fun e!746640 () Bool)

(declare-fun e!746639 () Bool)

(declare-fun mapRes!54379 () Bool)

(assert (=> b!1308646 (= e!746640 (and e!746639 mapRes!54379))))

(declare-fun condMapEmpty!54379 () Bool)

(declare-datatypes ((V!51993 0))(
  ( (V!51994 (val!17658 Int)) )
))
(declare-datatypes ((ValueCell!16685 0))(
  ( (ValueCellFull!16685 (v!20285 V!51993)) (EmptyCell!16685) )
))
(declare-datatypes ((array!87334 0))(
  ( (array!87335 (arr!42147 (Array (_ BitVec 32) ValueCell!16685)) (size!42697 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87334)

(declare-fun mapDefault!54379 () ValueCell!16685)

