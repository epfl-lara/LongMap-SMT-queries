; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108484 () Bool)

(assert start!108484)

(declare-fun b_free!28031 () Bool)

(declare-fun b_next!28031 () Bool)

(assert (=> start!108484 (= b_free!28031 (not b_next!28031))))

(declare-fun tp!99203 () Bool)

(declare-fun b_and!46091 () Bool)

(assert (=> start!108484 (= tp!99203 b_and!46091)))

(declare-fun b!1280385 () Bool)

(declare-fun res!850505 () Bool)

(declare-fun e!731598 () Bool)

(assert (=> b!1280385 (=> (not res!850505) (not e!731598))))

(declare-datatypes ((array!84420 0))(
  ( (array!84421 (arr!40714 (Array (_ BitVec 32) (_ BitVec 64))) (size!41264 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84420)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84420 (_ BitVec 32)) Bool)

(assert (=> b!1280385 (= res!850505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280386 () Bool)

(declare-fun e!731599 () Bool)

(declare-fun e!731596 () Bool)

(declare-fun mapRes!52058 () Bool)

(assert (=> b!1280386 (= e!731599 (and e!731596 mapRes!52058))))

(declare-fun condMapEmpty!52058 () Bool)

(declare-datatypes ((V!49997 0))(
  ( (V!49998 (val!16910 Int)) )
))
(declare-datatypes ((ValueCell!15937 0))(
  ( (ValueCellFull!15937 (v!19510 V!49997)) (EmptyCell!15937) )
))
(declare-datatypes ((array!84422 0))(
  ( (array!84423 (arr!40715 (Array (_ BitVec 32) ValueCell!15937)) (size!41265 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84422)

(declare-fun mapDefault!52058 () ValueCell!15937)

