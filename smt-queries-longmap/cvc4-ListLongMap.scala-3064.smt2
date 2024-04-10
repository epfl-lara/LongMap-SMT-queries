; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43230 () Bool)

(assert start!43230)

(declare-fun b!479056 () Bool)

(declare-fun res!285776 () Bool)

(declare-fun e!281792 () Bool)

(assert (=> b!479056 (=> (not res!285776) (not e!281792))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30911 0))(
  ( (array!30912 (arr!14863 (Array (_ BitVec 32) (_ BitVec 64))) (size!15221 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30911)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19229 0))(
  ( (V!19230 (val!6857 Int)) )
))
(declare-datatypes ((ValueCell!6448 0))(
  ( (ValueCellFull!6448 (v!9146 V!19229)) (EmptyCell!6448) )
))
(declare-datatypes ((array!30913 0))(
  ( (array!30914 (arr!14864 (Array (_ BitVec 32) ValueCell!6448)) (size!15222 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30913)

(assert (=> b!479056 (= res!285776 (and (= (size!15222 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15221 _keys!1874) (size!15222 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479057 () Bool)

(declare-fun res!285775 () Bool)

(assert (=> b!479057 (=> (not res!285775) (not e!281792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30911 (_ BitVec 32)) Bool)

(assert (=> b!479057 (= res!285775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479058 () Bool)

(declare-fun e!281790 () Bool)

(declare-fun e!281789 () Bool)

(declare-fun mapRes!22123 () Bool)

(assert (=> b!479058 (= e!281790 (and e!281789 mapRes!22123))))

(declare-fun condMapEmpty!22123 () Bool)

(declare-fun mapDefault!22123 () ValueCell!6448)

