; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43104 () Bool)

(assert start!43104)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19121 0))(
  ( (V!19122 (val!6816 Int)) )
))
(declare-datatypes ((ValueCell!6407 0))(
  ( (ValueCellFull!6407 (v!9104 V!19121)) (EmptyCell!6407) )
))
(declare-datatypes ((array!30745 0))(
  ( (array!30746 (arr!14785 (Array (_ BitVec 32) ValueCell!6407)) (size!15143 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30745)

(declare-fun e!281083 () Bool)

(declare-datatypes ((array!30747 0))(
  ( (array!30748 (arr!14786 (Array (_ BitVec 32) (_ BitVec 64))) (size!15144 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30747)

(declare-fun b!478206 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478206 (= e!281083 (and (= (size!15143 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15144 _keys!1874) (size!15143 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011) (not (= (size!15144 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352)))))))

(declare-fun b!478207 () Bool)

(declare-fun e!281081 () Bool)

(declare-fun e!281082 () Bool)

(declare-fun mapRes!21985 () Bool)

(assert (=> b!478207 (= e!281081 (and e!281082 mapRes!21985))))

(declare-fun condMapEmpty!21985 () Bool)

(declare-fun mapDefault!21985 () ValueCell!6407)

