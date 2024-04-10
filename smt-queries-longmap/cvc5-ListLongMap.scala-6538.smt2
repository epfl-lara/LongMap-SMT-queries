; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83112 () Bool)

(assert start!83112)

(declare-fun b_free!19105 () Bool)

(declare-fun b_next!19105 () Bool)

(assert (=> start!83112 (= b_free!19105 (not b_next!19105))))

(declare-fun tp!66594 () Bool)

(declare-fun b_and!30593 () Bool)

(assert (=> start!83112 (= tp!66594 b_and!30593)))

(declare-fun b!969512 () Bool)

(declare-fun e!546586 () Bool)

(declare-fun tp_is_empty!22003 () Bool)

(assert (=> b!969512 (= e!546586 tp_is_empty!22003)))

(declare-fun res!648910 () Bool)

(declare-fun e!546585 () Bool)

(assert (=> start!83112 (=> (not res!648910) (not e!546585))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83112 (= res!648910 (validMask!0 mask!2147))))

(assert (=> start!83112 e!546585))

(assert (=> start!83112 true))

(declare-datatypes ((V!34321 0))(
  ( (V!34322 (val!11052 Int)) )
))
(declare-datatypes ((ValueCell!10520 0))(
  ( (ValueCellFull!10520 (v!13611 V!34321)) (EmptyCell!10520) )
))
(declare-datatypes ((array!60071 0))(
  ( (array!60072 (arr!28899 (Array (_ BitVec 32) ValueCell!10520)) (size!29378 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60071)

(declare-fun e!546589 () Bool)

(declare-fun array_inv!22371 (array!60071) Bool)

(assert (=> start!83112 (and (array_inv!22371 _values!1425) e!546589)))

(assert (=> start!83112 tp_is_empty!22003))

(assert (=> start!83112 tp!66594))

(declare-datatypes ((array!60073 0))(
  ( (array!60074 (arr!28900 (Array (_ BitVec 32) (_ BitVec 64))) (size!29379 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60073)

(declare-fun array_inv!22372 (array!60073) Bool)

(assert (=> start!83112 (array_inv!22372 _keys!1717)))

(declare-fun b!969513 () Bool)

(declare-fun res!648909 () Bool)

(assert (=> b!969513 (=> (not res!648909) (not e!546585))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969513 (= res!648909 (and (= (size!29378 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29379 _keys!1717) (size!29378 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969514 () Bool)

(declare-fun res!648907 () Bool)

(assert (=> b!969514 (=> (not res!648907) (not e!546585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60073 (_ BitVec 32)) Bool)

(assert (=> b!969514 (= res!648907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969515 () Bool)

(declare-fun e!546587 () Bool)

(declare-fun mapRes!35014 () Bool)

(assert (=> b!969515 (= e!546589 (and e!546587 mapRes!35014))))

(declare-fun condMapEmpty!35014 () Bool)

(declare-fun mapDefault!35014 () ValueCell!10520)

