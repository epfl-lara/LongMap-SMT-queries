; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113112 () Bool)

(assert start!113112)

(declare-fun b_free!31163 () Bool)

(declare-fun b_next!31163 () Bool)

(assert (=> start!113112 (= b_free!31163 (not b_next!31163))))

(declare-fun tp!109294 () Bool)

(declare-fun b_and!50233 () Bool)

(assert (=> start!113112 (= tp!109294 b_and!50233)))

(declare-fun b!1340991 () Bool)

(declare-fun res!889600 () Bool)

(declare-fun e!763702 () Bool)

(assert (=> b!1340991 (=> (not res!889600) (not e!763702))))

(declare-datatypes ((array!91178 0))(
  ( (array!91179 (arr!44045 (Array (_ BitVec 32) (_ BitVec 64))) (size!44595 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91178)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340991 (= res!889600 (validKeyInArray!0 (select (arr!44045 _keys!1571) from!1960)))))

(declare-fun b!1340992 () Bool)

(declare-fun res!889604 () Bool)

(assert (=> b!1340992 (=> (not res!889604) (not e!763702))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91178 (_ BitVec 32)) Bool)

(assert (=> b!1340992 (= res!889604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340993 () Bool)

(declare-fun e!763699 () Bool)

(declare-fun e!763700 () Bool)

(declare-fun mapRes!57451 () Bool)

(assert (=> b!1340993 (= e!763699 (and e!763700 mapRes!57451))))

(declare-fun condMapEmpty!57451 () Bool)

(declare-datatypes ((V!54653 0))(
  ( (V!54654 (val!18656 Int)) )
))
(declare-datatypes ((ValueCell!17683 0))(
  ( (ValueCellFull!17683 (v!21304 V!54653)) (EmptyCell!17683) )
))
(declare-datatypes ((array!91180 0))(
  ( (array!91181 (arr!44046 (Array (_ BitVec 32) ValueCell!17683)) (size!44596 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91180)

(declare-fun mapDefault!57451 () ValueCell!17683)

