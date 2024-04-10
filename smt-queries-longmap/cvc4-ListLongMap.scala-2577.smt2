; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39284 () Bool)

(assert start!39284)

(declare-fun b_free!9551 () Bool)

(declare-fun b_next!9551 () Bool)

(assert (=> start!39284 (= b_free!9551 (not b_next!9551))))

(declare-fun tp!34181 () Bool)

(declare-fun b_and!16977 () Bool)

(assert (=> start!39284 (= tp!34181 b_and!16977)))

(declare-fun b!415542 () Bool)

(declare-fun e!248194 () Bool)

(declare-fun e!248189 () Bool)

(assert (=> b!415542 (= e!248194 (not e!248189))))

(declare-fun res!241764 () Bool)

(assert (=> b!415542 (=> res!241764 e!248189)))

(declare-datatypes ((array!25263 0))(
  ( (array!25264 (arr!12081 (Array (_ BitVec 32) (_ BitVec 64))) (size!12433 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25263)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415542 (= res!241764 (validKeyInArray!0 (select (arr!12081 _keys!709) from!863)))))

(declare-fun e!248192 () Bool)

(assert (=> b!415542 e!248192))

(declare-fun c!55040 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415542 (= c!55040 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15375 0))(
  ( (V!15376 (val!5396 Int)) )
))
(declare-fun minValue!515 () V!15375)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5008 0))(
  ( (ValueCellFull!5008 (v!7643 V!15375)) (EmptyCell!5008) )
))
(declare-datatypes ((array!25265 0))(
  ( (array!25266 (arr!12082 (Array (_ BitVec 32) ValueCell!5008)) (size!12434 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25265)

(declare-fun zeroValue!515 () V!15375)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15375)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!12284 0))(
  ( (Unit!12285) )
))
(declare-fun lt!190282 () Unit!12284)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!400 (array!25263 array!25265 (_ BitVec 32) (_ BitVec 32) V!15375 V!15375 (_ BitVec 32) (_ BitVec 64) V!15375 (_ BitVec 32) Int) Unit!12284)

(assert (=> b!415542 (= lt!190282 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!400 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!241763 () Bool)

(declare-fun e!248196 () Bool)

(assert (=> start!39284 (=> (not res!241763) (not e!248196))))

(assert (=> start!39284 (= res!241763 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12433 _keys!709))))))

(assert (=> start!39284 e!248196))

(declare-fun tp_is_empty!10703 () Bool)

(assert (=> start!39284 tp_is_empty!10703))

(assert (=> start!39284 tp!34181))

(assert (=> start!39284 true))

(declare-fun e!248191 () Bool)

(declare-fun array_inv!8810 (array!25265) Bool)

(assert (=> start!39284 (and (array_inv!8810 _values!549) e!248191)))

(declare-fun array_inv!8811 (array!25263) Bool)

(assert (=> start!39284 (array_inv!8811 _keys!709)))

(declare-fun b!415543 () Bool)

(declare-fun res!241761 () Bool)

(assert (=> b!415543 (=> (not res!241761) (not e!248196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415543 (= res!241761 (validMask!0 mask!1025))))

(declare-fun b!415544 () Bool)

(declare-fun res!241766 () Bool)

(assert (=> b!415544 (=> (not res!241766) (not e!248196))))

(assert (=> b!415544 (= res!241766 (and (= (size!12434 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12433 _keys!709) (size!12434 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415545 () Bool)

(declare-fun e!248188 () Bool)

(declare-fun mapRes!17676 () Bool)

(assert (=> b!415545 (= e!248191 (and e!248188 mapRes!17676))))

(declare-fun condMapEmpty!17676 () Bool)

(declare-fun mapDefault!17676 () ValueCell!5008)

