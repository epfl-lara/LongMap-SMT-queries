; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109246 () Bool)

(assert start!109246)

(declare-fun b_free!28735 () Bool)

(declare-fun b_next!28735 () Bool)

(assert (=> start!109246 (= b_free!28735 (not b_next!28735))))

(declare-fun tp!101324 () Bool)

(declare-fun b_and!46825 () Bool)

(assert (=> start!109246 (= tp!101324 b_and!46825)))

(declare-fun b!1292448 () Bool)

(declare-fun res!858765 () Bool)

(declare-fun e!737688 () Bool)

(assert (=> b!1292448 (=> (not res!858765) (not e!737688))))

(declare-datatypes ((array!85782 0))(
  ( (array!85783 (arr!41392 (Array (_ BitVec 32) (_ BitVec 64))) (size!41942 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85782)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85782 (_ BitVec 32)) Bool)

(assert (=> b!1292448 (= res!858765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292449 () Bool)

(declare-fun res!858759 () Bool)

(assert (=> b!1292449 (=> (not res!858759) (not e!737688))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292449 (= res!858759 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41942 _keys!1741))))))

(declare-fun b!1292450 () Bool)

(declare-fun res!858758 () Bool)

(assert (=> b!1292450 (=> (not res!858758) (not e!737688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292450 (= res!858758 (not (validKeyInArray!0 (select (arr!41392 _keys!1741) from!2144))))))

(declare-fun b!1292451 () Bool)

(declare-fun e!737689 () Bool)

(declare-fun e!737686 () Bool)

(declare-fun mapRes!53123 () Bool)

(assert (=> b!1292451 (= e!737689 (and e!737686 mapRes!53123))))

(declare-fun condMapEmpty!53123 () Bool)

(declare-datatypes ((V!50937 0))(
  ( (V!50938 (val!17262 Int)) )
))
(declare-datatypes ((ValueCell!16289 0))(
  ( (ValueCellFull!16289 (v!19865 V!50937)) (EmptyCell!16289) )
))
(declare-datatypes ((array!85784 0))(
  ( (array!85785 (arr!41393 (Array (_ BitVec 32) ValueCell!16289)) (size!41943 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85784)

(declare-fun mapDefault!53123 () ValueCell!16289)

