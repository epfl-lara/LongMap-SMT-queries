; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108270 () Bool)

(assert start!108270)

(declare-fun b!1278255 () Bool)

(declare-fun res!849242 () Bool)

(declare-fun e!730145 () Bool)

(assert (=> b!1278255 (=> (not res!849242) (not e!730145))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49753 0))(
  ( (V!49754 (val!16818 Int)) )
))
(declare-datatypes ((ValueCell!15845 0))(
  ( (ValueCellFull!15845 (v!19417 V!49753)) (EmptyCell!15845) )
))
(declare-datatypes ((array!84066 0))(
  ( (array!84067 (arr!40540 (Array (_ BitVec 32) ValueCell!15845)) (size!41090 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84066)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84068 0))(
  ( (array!84069 (arr!40541 (Array (_ BitVec 32) (_ BitVec 64))) (size!41091 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84068)

(assert (=> b!1278255 (= res!849242 (and (= (size!41090 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41091 _keys!1741) (size!41090 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278256 () Bool)

(declare-fun e!730142 () Bool)

(declare-fun e!730146 () Bool)

(declare-fun mapRes!51773 () Bool)

(assert (=> b!1278256 (= e!730142 (and e!730146 mapRes!51773))))

(declare-fun condMapEmpty!51773 () Bool)

(declare-fun mapDefault!51773 () ValueCell!15845)

