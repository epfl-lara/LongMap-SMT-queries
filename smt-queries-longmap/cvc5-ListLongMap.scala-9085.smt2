; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109294 () Bool)

(assert start!109294)

(declare-fun b_free!28783 () Bool)

(declare-fun b_next!28783 () Bool)

(assert (=> start!109294 (= b_free!28783 (not b_next!28783))))

(declare-fun tp!101468 () Bool)

(declare-fun b_and!46873 () Bool)

(assert (=> start!109294 (= tp!101468 b_and!46873)))

(declare-fun b!1293296 () Bool)

(declare-fun e!738105 () Bool)

(declare-fun e!738103 () Bool)

(declare-fun mapRes!53195 () Bool)

(assert (=> b!1293296 (= e!738105 (and e!738103 mapRes!53195))))

(declare-fun condMapEmpty!53195 () Bool)

(declare-datatypes ((V!51001 0))(
  ( (V!51002 (val!17286 Int)) )
))
(declare-datatypes ((ValueCell!16313 0))(
  ( (ValueCellFull!16313 (v!19889 V!51001)) (EmptyCell!16313) )
))
(declare-datatypes ((array!85876 0))(
  ( (array!85877 (arr!41439 (Array (_ BitVec 32) ValueCell!16313)) (size!41989 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85876)

(declare-fun mapDefault!53195 () ValueCell!16313)

