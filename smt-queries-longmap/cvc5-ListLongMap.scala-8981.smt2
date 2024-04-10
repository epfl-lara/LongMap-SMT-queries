; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108646 () Bool)

(assert start!108646)

(declare-fun b_free!28159 () Bool)

(declare-fun b_next!28159 () Bool)

(assert (=> start!108646 (= b_free!28159 (not b_next!28159))))

(declare-fun tp!99593 () Bool)

(declare-fun b_and!46225 () Bool)

(assert (=> start!108646 (= tp!99593 b_and!46225)))

(declare-fun b!1282445 () Bool)

(declare-fun res!851837 () Bool)

(declare-fun e!732753 () Bool)

(assert (=> b!1282445 (=> (not res!851837) (not e!732753))))

(declare-datatypes ((array!84668 0))(
  ( (array!84669 (arr!40836 (Array (_ BitVec 32) (_ BitVec 64))) (size!41386 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84668)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84668 (_ BitVec 32)) Bool)

(assert (=> b!1282445 (= res!851837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282446 () Bool)

(declare-fun res!851839 () Bool)

(assert (=> b!1282446 (=> (not res!851839) (not e!732753))))

(declare-datatypes ((V!50169 0))(
  ( (V!50170 (val!16974 Int)) )
))
(declare-datatypes ((ValueCell!16001 0))(
  ( (ValueCellFull!16001 (v!19576 V!50169)) (EmptyCell!16001) )
))
(declare-datatypes ((array!84670 0))(
  ( (array!84671 (arr!40837 (Array (_ BitVec 32) ValueCell!16001)) (size!41387 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84670)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282446 (= res!851839 (and (= (size!41387 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41386 _keys!1741) (size!41387 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282447 () Bool)

(declare-fun e!732754 () Bool)

(declare-fun e!732751 () Bool)

(declare-fun mapRes!52256 () Bool)

(assert (=> b!1282447 (= e!732754 (and e!732751 mapRes!52256))))

(declare-fun condMapEmpty!52256 () Bool)

(declare-fun mapDefault!52256 () ValueCell!16001)

